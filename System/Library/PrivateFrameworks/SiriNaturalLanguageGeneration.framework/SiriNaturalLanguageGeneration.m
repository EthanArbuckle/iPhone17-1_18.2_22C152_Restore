uint64_t sub_25D699CA4(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[3];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v3 = v2;
  v54 = a2;
  v5 = sub_25D6C2DB0();
  v6 = *(void *)(v5 - 8);
  v57 = v5;
  v58 = v6;
  MEMORY[0x270FA5388](v5, v7);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  v10 = sub_25D6C2DE0();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26A691DB8);
  swift_bridgeObjectRetain();
  swift_retain();
  v55 = v11;
  v12 = sub_25D6C2DC0();
  v13 = sub_25D6C3040();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v60[0] = v15;
    *(_DWORD *)v14 = 134218242;
    v59 = *(void *)(a1 + 16);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v53 = a1;
    v16 = v3[2];
    v17 = v3[3];
    swift_bridgeObjectRetain();
    v59 = sub_25D6C05EC(v16, v17, v60);
    sub_25D6C30B0();
    swift_release();
    a1 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D698000, v12, v13, "%ld documents, query is '%s'", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611B1630](v15, -1, -1);
    MEMORY[0x2611B1630](v14, -1, -1);
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease();
  }
  v63 = MEMORY[0x263F8EE80];
  v62 = MEMORY[0x263F8EE78];
  v18 = qword_26A68F478;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  v19 = (id)qword_26A691DD0;
  v53 = sub_25D6A3AC4((uint64_t)"QueryTokenization", 17, 2, v19, (uint64_t)v3);

  v20 = (void *)qword_26A691DD0;
  swift_bridgeObjectRetain();
  swift_retain();
  v21 = v20;
  v22 = sub_25D6A3BD8((uint64_t)"DocumentTokenization", 20, 2, v21, a1, v3);
  v56 = v3;
  v23 = v22;
  v52 = v22;

  v24 = (id)qword_26A691DD0;
  sub_25D6C2DA0();
  sub_25D6C3070();
  OUTLINED_FUNCTION_0();
  sub_25D69A744(v23, (uint64_t)v3, &v62, &v63);
  sub_25D6C3060();
  OUTLINED_FUNCTION_0();
  v25 = v58;
  v26 = *(void (**)(uint64_t))(v58 + 8);
  v27 = OUTLINED_FUNCTION_1();
  v26(v27);
  v58 = v25 + 8;
  v51 = (void (*)(char *, uint64_t))v26;

  v28 = (id)qword_26A691DD0;
  swift_bridgeObjectRetain();
  v29 = v28;
  sub_25D6C2DA0();
  sub_25D6C3070();
  v30 = a1;
  OUTLINED_FUNCTION_0();
  swift_bridgeObjectRetain();
  v31 = swift_bridgeObjectRetain();
  sub_25D69B754(v31, a1);
  v33 = v32;
  swift_bridgeObjectRelease();
  sub_25D6C3060();
  OUTLINED_FUNCTION_0();
  v34 = OUTLINED_FUNCTION_1();
  v26(v34);

  swift_bridgeObjectRelease();
  v35 = (void *)qword_26A691DD0;
  v36 = (uint64_t)v56;
  swift_retain();
  v37 = v53;
  swift_bridgeObjectRetain();
  swift_retain();
  v38 = v35;
  v39 = sub_25D6A3CF0((uint64_t)"QueryTFIDF", 10, 2, v38, v36, v37, v33);

  v40 = v54 & 1;
  v41 = (void *)sub_25D69ADB8(v37, v52, v54 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = sub_25D69AB04(v41);
  if (v43) {
    v44 = 0;
  }
  else {
    v44 = v42;
  }
  v61 = MEMORY[0x263F8EE78];
  v45 = (id)qword_26A691DD0;
  sub_25D6C2DA0();
  sub_25D6C3070();
  OUTLINED_FUNCTION_0();
  sub_25D69AB48((uint64_t)&v62, v40, v44, (uint64_t)v41, &v61, v30, (uint64_t)v56, v33, v39);
  sub_25D6C3060();
  OUTLINED_FUNCTION_0();
  v51(v9, v57);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  v46 = sub_25D6C2DC0();
  v47 = sub_25D6C3040();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v48 = 134217984;
    swift_beginAccess();
    v60[0] = *(void *)(v61 + 16);
    sub_25D6C30B0();
    _os_log_impl(&dword_25D698000, v46, v47, "%ld documents scored", v48, 0xCu);
    MEMORY[0x2611B1630](v48, -1, -1);
  }

  swift_beginAccess();
  v49 = v61;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v49;
}

uint64_t sub_25D69A358(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  sub_25D6B8310(0, v1, 0);
  uint64_t v2 = v14;
  uint64_t result = sub_25D69CD68(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v6 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      int v7 = v5;
      uint64_t v8 = a1 + 64;
      while ((*(void *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v7 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_18;
        }
        float v9 = *(float *)(*(void *)(a1 + 56) + 4 * v6);
        unint64_t v11 = *(void *)(v14 + 16);
        unint64_t v10 = *(void *)(v14 + 24);
        if (v11 >= v10 >> 1)
        {
          uint64_t v13 = v8;
          uint64_t result = (uint64_t)sub_25D6B8310((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v8 = v13;
        }
        *(void *)(v14 + 16) = v11 + 1;
        *(float *)(v14 + 4 * v11 + 32) = v9 * v9;
        if ((uint64_t)v6 >= -(-1 << *(unsigned char *)(a1 + 32))) {
          goto LABEL_19;
        }
        if ((*(void *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) == 0) {
          goto LABEL_20;
        }
        if (v7 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_21;
        }
        uint64_t v12 = v8;
        uint64_t result = sub_25D6C30D0();
        if (!--v1) {
          return v2;
        }
        unint64_t v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          uint64_t v8 = v12;
          int v7 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_25D69A508(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_25D6B8310(0, v2, 0);
    uint64_t v4 = a2;
    uint64_t v5 = v22;
    uint64_t result = sub_25D69CD68(a1);
    if ((result & 0x8000000000000000) == 0)
    {
      unint64_t v8 = result;
      if (result < 1 << *(unsigned char *)(a1 + 32))
      {
        int v9 = v7;
        uint64_t v10 = a1 + 64;
        while ((*(void *)(v10 + 8 * (v8 >> 6)) & (1 << v8)) != 0)
        {
          if (v9 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_24;
          }
          float v11 = *(float *)(*(void *)(a1 + 56) + 4 * v8);
          if (*(void *)(v4 + 16))
          {
            uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
            uint64_t v14 = *v12;
            uint64_t v13 = v12[1];
            swift_bridgeObjectRetain();
            unint64_t v15 = sub_25D6B89CC(v14, v13);
            uint64_t v4 = a2;
            float v16 = 0.0;
            if (v17) {
              float v16 = *(float *)(*(void *)(a2 + 56) + 4 * v15);
            }
            uint64_t result = swift_bridgeObjectRelease();
          }
          else
          {
            float v16 = 0.0;
          }
          uint64_t v18 = v5;
          uint64_t v23 = v5;
          unint64_t v19 = *(void *)(v5 + 16);
          unint64_t v20 = *(void *)(v18 + 24);
          if (v19 >= v20 >> 1)
          {
            uint64_t result = (uint64_t)sub_25D6B8310((char *)(v20 > 1), v19 + 1, 1);
            uint64_t v4 = a2;
            uint64_t v18 = v23;
          }
          *(void *)(v18 + 16) = v19 + 1;
          *(float *)(v18 + 4 * v19 + 32) = v11 * v16;
          if ((uint64_t)v8 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_25;
          }
          uint64_t v10 = a1 + 64;
          if ((*(void *)(a1 + 64 + 8 * (v8 >> 6)) & (1 << v8)) == 0) {
            goto LABEL_26;
          }
          if (v9 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_27;
          }
          uint64_t v5 = v18;
          uint64_t result = sub_25D6C30D0();
          if (!--v2)
          {
            swift_bridgeObjectRelease();
            return v5;
          }
          unint64_t v8 = result;
          if ((result & 0x8000000000000000) == 0)
          {
            int v9 = *(_DWORD *)(a1 + 36);
            if (result < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_28;
        }
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
      }
    }
LABEL_28:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25D69A744(uint64_t result, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v40 = *(void *)(result + 16);
  if (!v40) {
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (2)
  {
    uint64_t v42 = v6 + 1;
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = sub_25D69B02C(v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25D6BA434();
    uint64_t v9 = *(void *)(*a3 + 16);
    sub_25D6BA4D8(v9);
    int64_t v10 = 0;
    uint64_t v11 = *a3;
    *(void *)(v11 + 16) = v9 + 1;
    *(void *)(v11 + 8 * v9 + 32) = v8;
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v43 = v8 + 64;
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v44 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v45 = v8;
    if ((v14 & v12) != 0)
    {
LABEL_7:
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v10 << 6);
      goto LABEL_22;
    }
    while (1)
    {
      int64_t v18 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_43;
      }
      if (v18 >= v44) {
        break;
      }
      unint64_t v19 = *(void *)(v43 + 8 * v18);
      ++v10;
      if (v19) {
        goto LABEL_21;
      }
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v44) {
        break;
      }
      unint64_t v19 = *(void *)(v43 + 8 * v10);
      if (v19) {
        goto LABEL_21;
      }
      int64_t v10 = v18 + 2;
      if (v18 + 2 >= v44) {
        break;
      }
      unint64_t v19 = *(void *)(v43 + 8 * v10);
      if (v19) {
        goto LABEL_21;
      }
      int64_t v20 = v18 + 3;
      if (v20 >= v44) {
        break;
      }
      unint64_t v19 = *(void *)(v43 + 8 * v20);
      if (!v19)
      {
        while (1)
        {
          int64_t v10 = v20 + 1;
          if (__OFADD__(v20, 1)) {
            goto LABEL_44;
          }
          if (v10 >= v44) {
            goto LABEL_35;
          }
          unint64_t v19 = *(void *)(v43 + 8 * v10);
          ++v20;
          if (v19) {
            goto LABEL_21;
          }
        }
      }
      int64_t v10 = v20;
LABEL_21:
      unint64_t v15 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_22:
      v21 = (uint64_t *)(*(void *)(v45 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      swift_bridgeObjectRetain();
      sub_25D69CE2C((uint64_t)v5);
      swift_isUniquelyReferenced_nonNull_native();
      v24 = (void *)*a4;
      v46 = (void *)*a4;
      *a4 = 0x8000000000000000;
      unint64_t v25 = sub_25D6B89CC(v23, v22);
      if (__OFADD__(v24[2], (v26 & 1) == 0))
      {
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        uint64_t result = sub_25D6C3270();
        __break(1u);
        return result;
      }
      unint64_t v27 = v25;
      char v28 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F570);
      if (sub_25D6C3150())
      {
        unint64_t v29 = sub_25D6B89CC(v23, v22);
        if ((v28 & 1) != (v30 & 1)) {
          goto LABEL_45;
        }
        unint64_t v27 = v29;
      }
      *a4 = v46;
      swift_bridgeObjectRelease();
      v31 = (void *)*a4;
      if ((v28 & 1) == 0)
      {
        v31[(v27 >> 6) + 8] |= 1 << v27;
        v32 = (uint64_t *)(v31[6] + 16 * v27);
        uint64_t *v32 = v23;
        v32[1] = v22;
        *(void *)(v31[7] + 8 * v27) = 0;
        uint64_t v33 = v31[2];
        uint64_t v34 = v33 + 1;
        BOOL v35 = __OFADD__(v33, 1);
        swift_bridgeObjectRetain();
        if (v35) {
          goto LABEL_42;
        }
        v31[2] = v34;
      }
      swift_bridgeObjectRetain();
      uint64_t v36 = v31[7];
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void *)(v36 + 8 * v27);
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_41;
      }
      *(void *)(v36 + 8 * v27) = v39;
      swift_bridgeObjectRelease();
      uint64_t v5 = sub_25D69AAFC;
      if (v15) {
        goto LABEL_7;
      }
    }
LABEL_35:
    swift_release();
    uint64_t v6 = v42;
    if (v42 != v40) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  return sub_25D69CE2C((uint64_t)v5);
}

void sub_25D69AAFC(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25D69AB04(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return 0;
  }
  uint64_t result = a1[4];
  uint64_t v4 = v1 - 1;
  if (v1 != 1)
  {
    uint64_t v5 = a1 + 5;
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if (result <= v7) {
        uint64_t result = v6;
      }
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_25D69AB48(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v39 = *(void *)(*(void *)a1 + 16);
  if (v39)
  {
    uint64_t v36 = (void *)(a7 + 80);
    char v38 = a2 & (a3 > 0);
    uint64_t v33 = a4 + 32;
    swift_bridgeObjectRetain();
    unint64_t v12 = 0;
    uint64_t v13 = (uint64_t *)(a6 + 40);
    uint64_t v32 = a8;
    uint64_t v14 = a6;
    do
    {
      if ((v38 & 1) == 0) {
        goto LABEL_12;
      }
      if (v12 >= *(void *)(a4 + 16)) {
        goto LABEL_20;
      }
      if (*(void *)(v33 + 8 * v12) == a3)
      {
        if (v12 >= *(void *)(a6 + 16)) {
          goto LABEL_21;
        }
        uint64_t v15 = *(v13 - 1);
        uint64_t v16 = *v13;
        uint64_t v17 = *a5;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a5 = v17;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_25D6B3DB8();
          uint64_t v17 = v30;
          *a5 = v30;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        if (v19 >= *(void *)(v17 + 24) >> 1)
        {
          sub_25D6B3DB8();
          uint64_t v17 = v31;
          *a5 = v31;
        }
        *(void *)(v17 + 16) = v19 + 1;
        uint64_t v20 = v17 + 24 * v19;
        *(void *)(v20 + 32) = v15;
        uint64_t v21 = v20 + 32;
        float v22 = 1.0;
        a8 = v32;
      }
      else
      {
LABEL_12:
        uint64_t v23 = swift_bridgeObjectRetain();
        uint64_t v24 = sub_25D69B23C(v23, a8);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v36, *(void *)(a7 + 104));
        sub_25D69B588(v24, a9);
        float v22 = v25;
        swift_bridgeObjectRelease();
        if (v12 >= *(void *)(a6 + 16))
        {
          __break(1u);
LABEL_20:
          __break(1u);
LABEL_21:
          __break(1u);
          return;
        }
        uint64_t v26 = *(v13 - 1);
        uint64_t v16 = *v13;
        swift_bridgeObjectRetain();
        sub_25D6BA44C();
        uint64_t v27 = *(void *)(*a5 + 16);
        sub_25D6BA4F0(v27);
        uint64_t v28 = *a5;
        *(void *)(v28 + 16) = v27 + 1;
        uint64_t v29 = v28 + 24 * v27;
        *(void *)(v29 + 32) = v26;
        uint64_t v21 = v29 + 32;
      }
      ++v12;
      *(void *)(v21 + 8) = v16;
      *(float *)(v21 + 16) = v22;
      v13 += 2;
      a6 = v14;
    }
    while (v39 != v12);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25D69ADB8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = sub_25D6C2FE0();
    *(void *)(v6 + 16) = v5;
    uint64_t v21 = v6;
    bzero((void *)(v6 + 32), 8 * v5);
    if ((a3 & 1) == 0) {
      return v21;
    }
  }
  else
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    if ((a3 & 1) == 0) {
      return v21;
    }
  }
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_25D69AF78(v7);
  if (!v5)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v21;
  }
  uint64_t v20 = a2 + 32;
  swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = *(void *)(v20 + 8 * v9);
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25D6C3030();
    uint64_t v23 = v11;
    uint64_t v12 = *(void *)(v10 + 16);
    if (v12)
    {
      uint64_t v13 = (uint64_t *)(v10 + 40);
      do
      {
        uint64_t v14 = *(v13 - 1);
        uint64_t v15 = *v13;
        swift_bridgeObjectRetain();
        sub_25D69B97C(&v22, v14, v15);
        swift_bridgeObjectRelease();
        v13 += 2;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      uint64_t v16 = v23;
    }
    else
    {
      uint64_t v16 = v11;
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25D69BE08(v16, v8);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t result = swift_release();
    if (v9 >= *(void *)(v21 + 16)) {
      break;
    }
    *(void *)(v21 + 32 + 8 * v9++) = v18;
    if (v9 == v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25D69AF78(uint64_t a1)
{
  uint64_t v2 = sub_25D6C3030();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25D69B97C(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_25D69B02C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    float v2 = 1.0 / (float)v1;
    uint64_t v3 = 0;
    uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25D69CE2C((uint64_t)v3);
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v8 = sub_25D6B89CC(v7, v6);
      if (__OFADD__(v5[2], (v9 & 1) == 0)) {
        break;
      }
      unint64_t v10 = v8;
      char v11 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F558);
      if (sub_25D6C3150())
      {
        unint64_t v12 = sub_25D6B89CC(v7, v6);
        if ((v11 & 1) != (v13 & 1)) {
          goto LABEL_19;
        }
        unint64_t v10 = v12;
      }
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        v5[(v10 >> 6) + 8] |= 1 << v10;
        uint64_t v14 = (uint64_t *)(v5[6] + 16 * v10);
        *uint64_t v14 = v7;
        v14[1] = v6;
        *(_DWORD *)(v5[7] + 4 * v10) = 0;
        uint64_t v15 = v5[2];
        uint64_t v16 = v15 + 1;
        BOOL v17 = __OFADD__(v15, 1);
        swift_bridgeObjectRetain();
        if (v17) {
          goto LABEL_18;
        }
        v5[2] = v16;
      }
      v4 += 2;
      swift_bridgeObjectRetain();
      uint64_t v18 = v5[7];
      swift_bridgeObjectRelease();
      *(float *)(v18 + 4 * v10) = v2 + *(float *)(v18 + 4 * v10);
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_25D69B234;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        unint64_t v19 = sub_25D69B234;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    uint64_t result = sub_25D6C3270();
    __break(1u);
  }
  else
  {
    unint64_t v19 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
LABEL_16:
    sub_25D69CE2C((uint64_t)v19);
    return (uint64_t)v5;
  }
  return result;
}

void sub_25D69B234(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25D69B23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  unint64_t v10 = (void *)MEMORY[0x263F8EE80];
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v9 << 6);
LABEL_20:
    if (*(void *)(a2 + 16))
    {
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
      float v17 = *(float *)(*(void *)(a1 + 56) + 4 * v12);
      uint64_t v19 = *v16;
      uint64_t v18 = v16[1];
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25D6B89CC(v19, v18);
      if (v21)
      {
        float v22 = *(float *)(*(void *)(a2 + 56) + 4 * v20);
        swift_isUniquelyReferenced_nonNull_native();
        unint64_t v23 = sub_25D6B89CC(v19, v18);
        char v36 = v24;
        if (__OFADD__(v10[2], (v24 & 1) == 0)) {
          goto LABEL_35;
        }
        unint64_t v35 = v23;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F558);
        char v25 = sub_25D6C3150();
        unint64_t v26 = v35;
        if (v25)
        {
          unint64_t v27 = sub_25D6B89CC(v19, v18);
          if ((v36 & 1) != (v28 & 1)) {
            goto LABEL_37;
          }
          unint64_t v26 = v27;
        }
        float v29 = v17 * v22;
        if (v36)
        {
          *(float *)(v10[7] + 4 * v26) = v29;
        }
        else
        {
          v10[(v26 >> 6) + 8] |= 1 << v26;
          uint64_t v30 = (uint64_t *)(v10[6] + 16 * v26);
          *uint64_t v30 = v19;
          v30[1] = v18;
          *(float *)(v10[7] + 4 * v26) = v29;
          uint64_t v31 = v10[2];
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_36;
          }
          v10[2] = v33;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  int64_t v13 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v13 >= v8) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v9;
  if (v14) {
    goto LABEL_19;
  }
  int64_t v9 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v9);
  if (v14) {
    goto LABEL_19;
  }
  int64_t v9 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v9);
  if (v14)
  {
LABEL_19:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v9 << 6);
    goto LABEL_20;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_32:
    swift_release();
    return (uint64_t)v10;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v9 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v9);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = sub_25D6C3270();
  __break(1u);
  return result;
}

uint64_t sub_25D69B4F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return v0;
}

uint64_t sub_25D69B530()
{
  sub_25D69B4F8();
  return MEMORY[0x270FA0228](v0, 120, 7);
}

uint64_t type metadata accessor for TFIDFScorer()
{
  return self;
}

void sub_25D69B588(uint64_t a1, uint64_t a2)
{
  float v4 = sub_25D69B66C(a1);
  if ((float)(v4 * sub_25D69B66C(a2)) != 0.0) {
    sub_25D69B5E4(a1, a2);
  }
}

float sub_25D69B5E4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25D69A508(a1, a2);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = (float *)(v4 + 32);
    float v7 = 0.0;
    do
    {
      float v8 = *v6++;
      float v7 = v7 + v8;
      --v5;
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

float sub_25D69B66C(uint64_t a1)
{
  uint64_t v1 = sub_25D69A358(a1);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (float *)(v1 + 32);
    float v4 = 0.0;
    do
    {
      float v5 = *v3++;
      float v4 = v4 + v5;
      --v2;
    }
    while (v2);
  }
  else
  {
    float v4 = 0.0;
  }
  swift_bridgeObjectRelease();
  return sqrtf(v4);
}

uint64_t sub_25D69B6D4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for CosineSimilarity()
{
  return self;
}

void type metadata accessor for SISchemaComponentName()
{
  if (!qword_26A68F550)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A68F550);
    }
  }
}

void sub_25D69B754(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F568);
  uint64_t v4 = sub_25D6C3190();
  float v5 = (void *)v4;
  int64_t v6 = 0;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v25 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v4 + 64;
  if ((v9 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v12 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v6 << 6))
  {
    float v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    float v20 = log2f((float)((float)*(uint64_t *)(a2 + 16) + 1.0)/ (float)((float)*(uint64_t *)(*(void *)(a1 + 56) + 8 * i) + 1.0));
    *(void *)(v11 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    char v21 = (void *)(v5[6] + 16 * i);
    void *v21 = v19;
    v21[1] = v18;
    *(float *)(v5[7] + 4 * i) = v20 + 1.0;
    uint64_t v22 = v5[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v5[2] = v24;
    swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_24;
    }
    if (v14 >= v26) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v26) {
        goto LABEL_22;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v26) {
          goto LABEL_22;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v15 = *(void *)(v25 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v26) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_25D69B97C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25D6C32C0();
  swift_bridgeObjectRetain();
  sub_25D6C2F00();
  uint64_t v8 = sub_25D6C32E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25D6C3230() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25D6C3230() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25D69C76C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25D69BB2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F560);
  uint64_t v3 = sub_25D6C3100();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25D6C32C0();
      sub_25D6C2F00();
      uint64_t result = sub_25D6C32E0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *char v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25D69FABC(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25D69BE08(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe, a2);
    uint64_t v6 = (void *)((char *)v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_25D69FABC(0, v5, v6);
    uint64_t v7 = sub_25D69BF9C((uint64_t)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    sub_25D69FABC(0, v5, v8);
    uint64_t v7 = sub_25D69BF9C((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x2611B1630](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_25D69BF9C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) >= *(void *)(a3 + 16))
  {
    int64_t v34 = 0;
    uint64_t v60 = a3 + 56;
    uint64_t v61 = 0;
    uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v37 = v36 & *(void *)(a3 + 56);
    int64_t v63 = (unint64_t)(v35 + 63) >> 6;
    uint64_t v38 = a4 + 56;
    while (1)
    {
      while (1)
      {
        if (v37)
        {
          unint64_t v39 = __clz(__rbit64(v37));
          v37 &= v37 - 1;
          unint64_t v40 = v39 | (v34 << 6);
        }
        else
        {
          int64_t v41 = v34 + 1;
          if (__OFADD__(v34, 1))
          {
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v41 >= v63) {
            goto LABEL_79;
          }
          unint64_t v42 = *(void *)(v60 + 8 * v41);
          ++v34;
          if (!v42)
          {
            int64_t v34 = v41 + 1;
            if (v41 + 1 >= v63) {
              goto LABEL_79;
            }
            unint64_t v42 = *(void *)(v60 + 8 * v34);
            if (!v42)
            {
              int64_t v34 = v41 + 2;
              if (v41 + 2 >= v63) {
                goto LABEL_79;
              }
              unint64_t v42 = *(void *)(v60 + 8 * v34);
              if (!v42)
              {
                int64_t v43 = v41 + 3;
                if (v43 >= v63) {
                  goto LABEL_79;
                }
                unint64_t v42 = *(void *)(v60 + 8 * v43);
                if (!v42)
                {
                  while (1)
                  {
                    int64_t v34 = v43 + 1;
                    if (__OFADD__(v43, 1)) {
                      goto LABEL_85;
                    }
                    if (v34 >= v63) {
                      break;
                    }
                    unint64_t v42 = *(void *)(v60 + 8 * v34);
                    ++v43;
                    if (v42) {
                      goto LABEL_61;
                    }
                  }
LABEL_79:
                  swift_retain();
                  return sub_25D69C4DC(v57, a2, v61, v5);
                }
                int64_t v34 = v43;
              }
            }
          }
LABEL_61:
          unint64_t v37 = (v42 - 1) & v42;
          unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
        }
        int64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
        uint64_t v46 = *v44;
        uint64_t v45 = v44[1];
        sub_25D6C32C0();
        swift_bridgeObjectRetain();
        sub_25D6C2F00();
        uint64_t v47 = sub_25D6C32E0();
        uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
        unint64_t v49 = v47 & ~v48;
        if ((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49)) {
          break;
        }
LABEL_78:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v50 = *(void *)(a4 + 48);
      v51 = (void *)(v50 + 16 * v49);
      BOOL v52 = *v51 == v46 && v51[1] == v45;
      if (!v52 && (sub_25D6C3230() & 1) == 0)
      {
        uint64_t v53 = ~v48;
        do
        {
          unint64_t v49 = (v49 + 1) & v53;
          if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
            goto LABEL_78;
          }
          v54 = (void *)(v50 + 16 * v49);
          BOOL v55 = *v54 == v46 && v54[1] == v45;
        }
        while (!v55 && (sub_25D6C3230() & 1) == 0);
      }
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_83;
      }
    }
  }
  int64_t v6 = 0;
  uint64_t v58 = a4 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  int64_t v59 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v61 = 0;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      int64_t v62 = v6;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v13 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    if (v13 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v13);
    int64_t v15 = v6 + 1;
    if (!v14)
    {
      int64_t v15 = v6 + 2;
      if (v6 + 2 >= v59) {
        goto LABEL_79;
      }
      unint64_t v14 = *(void *)(v58 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v6 + 3;
        if (v6 + 3 >= v59) {
          goto LABEL_79;
        }
        unint64_t v14 = *(void *)(v58 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v9 = (v14 - 1) & v14;
    int64_t v62 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_25D6C32C0();
    swift_bridgeObjectRetain();
    sub_25D6C2F00();
    uint64_t v20 = sub_25D6C32E0();
    uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    uint64_t v24 = 1 << v22;
    if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) == 0) {
      goto LABEL_36;
    }
    uint64_t v25 = *(void *)(a3 + 48);
    BOOL v26 = (void *)(v25 + 16 * v22);
    BOOL v27 = *v26 == v19 && v26[1] == v18;
    if (v27 || (sub_25D6C3230() & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v28 = ~v21;
      for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
      {
        unint64_t v30 = i & v28;
        if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
          break;
        }
        uint64_t v31 = (void *)(v25 + 16 * v30);
        BOOL v32 = *v31 == v19 && v31[1] == v18;
        if (v32 || (sub_25D6C3230() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v23 = v30 >> 6;
          uint64_t v24 = 1 << v30;
          goto LABEL_38;
        }
      }
LABEL_36:
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v6 = v62;
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  uint64_t v16 = v6 + 4;
  if (v6 + 4 >= v59) {
    goto LABEL_79;
  }
  unint64_t v14 = *(void *)(v58 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v6 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_25D69C4DC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F560);
  uint64_t result = sub_25D6C3110();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25D6C32C0();
    swift_bridgeObjectRetain();
    sub_25D6C2F00();
    uint64_t result = sub_25D6C32E0();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_25D69C76C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25D69BB2C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25D69C908();
      goto LABEL_22;
    }
    sub_25D69CABC();
  }
  uint64_t v11 = *v4;
  sub_25D6C32C0();
  sub_25D6C2F00();
  uint64_t result = sub_25D6C32E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25D6C3230(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25D6C3260();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25D6C3230();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_25D69C908()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F560);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25D6C30F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25D69CABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F560);
  uint64_t v3 = sub_25D6C3100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25D6C32C0();
    swift_bridgeObjectRetain();
    sub_25D6C2F00();
    uint64_t result = sub_25D6C32E0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25D69CD68(uint64_t a1)
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

uint64_t sub_25D69CE2C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
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

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_25D6C2D90();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t sub_25D69CF34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_25D6A2350(a1 + 32, (uint64_t)&v28);
    swift_bridgeObjectRetain();
    uint64_t v7 = v4 - 1;
    if (v4 != 1)
    {
      uint64_t v8 = a1 + 72;
      do
      {
        sub_25D6A2350(v8, (uint64_t)&v26);
        __swift_project_boxed_opaque_existential_1(&v28, v29);
        uint64_t v9 = OUTLINED_FUNCTION_0_0();
        float v11 = v10(v9);
        __swift_project_boxed_opaque_existential_1(&v26, v27);
        uint64_t v12 = OUTLINED_FUNCTION_0_0();
        if (v11 >= v13(v12))
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
          sub_25D69F75C(&v26, (uint64_t)&v28);
        }
        v8 += 40;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
    sub_25D69F75C(&v28, (uint64_t)&v30);
    sub_25D69F75C(&v30, (uint64_t)v33);
    sub_25D6A226C(v3 + 16, (uint64_t)&v28);
    if (v29)
    {
      uint64_t v14 = sub_25D69F75C(&v28, (uint64_t)&v30);
      MEMORY[0x270FA5388](v14, v15);
      v25[2] = v33;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_25D69D2D0((uint64_t)sub_25D6A2330, (uint64_t)v25, a1);
      if (*(void *)(v16 + 16) < 2uLL)
      {
        swift_bridgeObjectRelease();
        sub_25D69F75C(v33, a2);
      }
      else
      {
        uint64_t v17 = v31;
        uint64_t v18 = v32;
        __swift_project_boxed_opaque_existential_1(&v30, v31);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 8))(v16, v17, v18);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
    }
    else
    {
      sub_25D6A22D4((uint64_t)&v28, &qword_26A68F5B8);
      return sub_25D69F75C(v33, a2);
    }
  }
  else
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25D6C2DE0();
    os_log_type_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_26A691DB8);
    unint64_t v21 = sub_25D6C2DC0();
    os_log_type_t v22 = sub_25D6C3050();
    if (OUTLINED_FUNCTION_4(v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_25D698000, v21, v20, "No dialogs", v23, 2u);
      OUTLINED_FUNCTION_2();
    }

    sub_25D69F774();
    OUTLINED_FUNCTION_5();
    return OUTLINED_FUNCTION_8();
  }
}

BOOL sub_25D69D228(void *a1, void *a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  float v5 = (*(float (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v6);
  return v5 == (*(float (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
}

uint64_t sub_25D69D2D0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v8 = (uint64_t (*)(long long *))result;
    unint64_t v9 = 0;
    uint64_t v10 = a3 + 32;
    unint64_t v23 = (uint64_t (*)(long long *))result;
    uint64_t v24 = a3;
    uint64_t v22 = v6;
    while (v9 < *(void *)(v4 + 16))
    {
      sub_25D6A2350(v10, (uint64_t)v28);
      uint64_t v5 = a2;
      char v11 = v8(v28);
      if (v3)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
        swift_bridgeObjectRelease();
        swift_release();
        return v5;
      }
      if (v11)
      {
        sub_25D69F75C(v28, (uint64_t)v25);
        uint64_t v12 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D6B8380(0, *(void *)(v12 + 16) + 1, 1);
          uint64_t v12 = v29;
        }
        unint64_t v14 = *(void *)(v12 + 16);
        unint64_t v13 = *(void *)(v12 + 24);
        if (v14 >= v13 >> 1) {
          sub_25D6B8380((char *)(v13 > 1), v14 + 1, 1);
        }
        uint64_t v15 = v26;
        uint64_t v16 = v27;
        uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
        MEMORY[0x270FA5388](v17, v17);
        uint64_t v19 = (char *)&v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v20 + 16))(v19);
        sub_25D6A211C(v14, (uint64_t)v19, &v29, v15, v16);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        uint64_t v8 = v23;
        uint64_t v4 = v24;
        uint64_t v6 = v22;
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
      ++v9;
      v10 += 40;
      if (v6 == v9)
      {
        uint64_t v5 = v29;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v5;
  }
  return result;
}

uint64_t sub_25D69D504(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(result + 16);
  if (!v5)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v4;
  }
  unint64_t v6 = 0;
  uint64_t v7 = result + 32;
  while (v6 < *(void *)(v3 + 16))
  {
    sub_25D6A2350(v7, (uint64_t)&v18);
    uint64_t v8 = v19;
    uint64_t v9 = v20;
    __swift_project_boxed_opaque_existential_1(&v18, v19);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    if (!*(void *)(a2 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_8:
      sub_25D69F75C(&v18, (uint64_t)v17);
      uint64_t v14 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D6B83B0(0, *(void *)(v14 + 16) + 1, 1);
        uint64_t v14 = v21;
      }
      unint64_t v16 = *(void *)(v14 + 16);
      unint64_t v15 = *(void *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_25D6B83B0((char *)(v15 > 1), v16 + 1, 1);
        uint64_t v14 = v21;
      }
      *(void *)(v14 + 16) = v16 + 1;
      uint64_t result = sub_25D69F75C(v17, v14 + 40 * v16 + 32);
      goto LABEL_13;
    }
    sub_25D6B89CC(v10, v11);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
LABEL_13:
    ++v6;
    v7 += 40;
    if (v5 == v6)
    {
      uint64_t v4 = v21;
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25D69D6B0()
{
  sub_25D6A22D4(v0 + 16, &qword_26A68F5B8);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for HighestScoringDialogSelector()
{
  return self;
}

uint64_t sub_25D69D714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D69CF34(a1, a2);
}

uint64_t sub_25D69D738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_25D6A2350(a1, v2 + 16);
  sub_25D6A2350(a2, v2 + 56);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 36;
  type metadata accessor for SELFLogger();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v6;
  uint64_t v9 = v7;
  sub_25D6BA934((uint64_t)&unk_26A68FA18, 0, (uint64_t)sub_25D6BA800, 0, 36, (uint64_t)sub_25D6A23C4, v8);
  uint64_t v10 = OUTLINED_FUNCTION_6();
  __swift_destroy_boxed_opaque_existential_1(v10);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v3 + 96) = v9;
  return v3;
}

uint64_t sub_25D69D820@<X0>(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t result = sub_25D69D8B4(a1, a2);
  if (!v3)
  {
    uint64_t v7 = v2[10];
    uint64_t v8 = v2[11];
    __swift_project_boxed_opaque_existential_1(v2 + 7, v7);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16))(a2, v7, v8);
    return sub_25D6BADEC(a1);
  }
  return result;
}

uint64_t sub_25D69D8B4@<X0>(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  if (qword_26A68F470 != -1) {
LABEL_24:
  }
    swift_once();
  uint64_t v6 = sub_25D6C2DE0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A691DB8);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_25D6C2DC0();
  os_log_type_t v8 = sub_25D6C3040();
  if (OUTLINED_FUNCTION_4(v8))
  {
    uint64_t v9 = (float *)swift_slowAlloc();
    OUTLINED_FUNCTION_9(v9, 3.852e-34);
    *(void *)&v37[0] = v10;
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7(&dword_25D698000, v11, v12, "Selecting from %ld dialogs");
    OUTLINED_FUNCTION_2();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 16))
  {
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 56), *(void *)(v3 + 80));
    uint64_t v13 = OUTLINED_FUNCTION_1_0();
    uint64_t v15 = v14(v13);
    uint64_t v33 = *(void *)(v15 + 16);
    if (v33)
    {
      uint64_t v30 = a2;
      uint64_t v31 = a1;
      OUTLINED_FUNCTION_3(MEMORY[0x263F8EE78]);
      swift_bridgeObjectRetain();
      a2 = 0;
      uint64_t v3 = v15 + 32;
      uint64_t v32 = v15;
      do
      {
        if (a2 >= *(void *)(v15 + 16))
        {
          __break(1u);
          goto LABEL_24;
        }
        sub_25D6A2350(v3, (uint64_t)v34);
        *(void *)&v35[0] = a2;
        sub_25D69F75C(v34, (uint64_t)v35 + 8);
        v37[1] = v35[1];
        v37[2] = v36;
        v37[0] = v35[0];
        long long v16 = v36;
        __swift_project_boxed_opaque_existential_1((void *)v37 + 1, v36);
        uint64_t v17 = (*(uint64_t (**)(void, void))(*((void *)&v16 + 1) + 16))(v16, *((void *)&v16 + 1));
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)&v37[0];
        *(void *)&v35[0] = *(void *)&v37[0];
        sub_25D6A2350((uint64_t)v37 + 8, (uint64_t)v35 + 8);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35 + 8);
        sub_25D6A22D4((uint64_t)v37, &qword_26A68F590);
        uint64_t v21 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_10(*(void *)(v21 + 16));
          uint64_t v21 = v38;
        }
        a1 = *(void *)(v21 + 16);
        unint64_t v22 = *(void *)(v21 + 24);
        if (a1 >= v22 >> 1)
        {
          sub_25D6B8360((char *)(v22 > 1), a1 + 1, 1);
          uint64_t v21 = v38;
        }
        ++a2;
        *(void *)(v21 + 16) = a1 + 1;
        unint64_t v23 = (void *)(v21 + 24 * a1);
        v23[4] = v17;
        v23[5] = v19;
        v23[6] = v20;
        v3 += 40;
        uint64_t v15 = v32;
      }
      while (v33 != a2);
      swift_bridgeObjectRelease_n();
      uint64_t v24 = sub_25D69E0F4(v21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_25D69D504(v31, v24);
      a2 = v30;
      if (*(void *)(v25 + 16))
      {
        swift_bridgeObjectRelease();
        a1 = v25;
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
      uint64_t v27 = sub_25D6C2DC0();
      os_log_type_t v28 = sub_25D6C3040();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_25D698000, v27, v28, "No acceptable dialogs, selecting least recent", v29, 2u);
        MEMORY[0x2611B1630](v29, -1, -1);
      }

      sub_25D69E184(v31, v24, v30);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
LABEL_18:
      sub_25D69E3E8(a1, a2);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D69F774();
    OUTLINED_FUNCTION_5();
    return swift_willThrow();
  }
}

uint64_t sub_25D69DCB8(void *a1)
{
  uint64_t v1 = a1[4] >> 1;
  uint64_t v37 = a1[3];
  if (__OFSUB__(v1, v37))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v36 = a1[4] >> 1;
  uint64_t v2 = *a1;
  uint64_t v3 = a1[2];
  if (v1 - v37 >= *(void *)(*a1 + 16)) {
    uint64_t v4 = *(void *)(*a1 + 16);
  }
  else {
    uint64_t v4 = v1 - v37;
  }
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_25D6B8310(0, v4 & ~(v4 >> 63), 0);
  char v41 = 0;
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v35 = v2;
    if (v4)
    {
      uint64_t v5 = v2 + 32;
      swift_bridgeObjectRetain();
      uint64_t result = swift_unknownObjectRetain();
      unint64_t v7 = 0;
      uint64_t v8 = v36;
      uint64_t v9 = v3 + 40 * v37;
      do
      {
        if (v4 == v7)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        unint64_t v10 = *(void *)(v2 + 16);
        if (v7 == v10) {
          goto LABEL_46;
        }
        if (v7 >= v10) {
          goto LABEL_39;
        }
        sub_25D6A2350(v5, (uint64_t)__src);
        if (!(v37 - v36 + v7)) {
          goto LABEL_45;
        }
        if ((uint64_t)(v37 + v7) >= v8) {
          goto LABEL_40;
        }
        sub_25D69F75C(__src, (uint64_t)__dst);
        sub_25D6A2350(v9, (uint64_t)&__dst[5]);
        uint64_t v11 = __dst[3];
        uint64_t v12 = __dst[4];
        __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
        float v13 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12);
        uint64_t v14 = __dst[8];
        uint64_t v15 = __dst[9];
        __swift_project_boxed_opaque_existential_1(&__dst[5], __dst[8]);
        float v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        sub_25D6A22D4((uint64_t)__dst, &qword_26A68F598);
        uint64_t v17 = v42;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_25D6B8310(0, *(void *)(v17 + 16) + 1, 1);
          uint64_t v17 = v42;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        unint64_t v18 = *(void *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          uint64_t result = (uint64_t)sub_25D6B8310((char *)(v18 > 1), v19 + 1, 1);
          uint64_t v17 = v42;
        }
        ++v7;
        *(void *)(v17 + 16) = v19 + 1;
        *(float *)(v17 + 4 * v19 + 32) = v13 - v16;
        v5 += 40;
        v9 += 40;
        uint64_t v2 = v35;
        uint64_t v8 = v36;
      }
      while (v4 != v7);
      if (v41) {
        goto LABEL_37;
      }
      uint64_t v20 = v37 + v7;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      uint64_t v8 = v36;
      uint64_t v20 = v37;
    }
    unint64_t v21 = *(void *)(v2 + 16);
    if (v4 == v21)
    {
LABEL_37:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return v42;
    }
    uint64_t v22 = v2 + 40 * v4 + 32;
    uint64_t v23 = v3 + 40 * v20;
    uint64_t v24 = v20;
    while (v4 < v21)
    {
      sub_25D6A2350(v22, (uint64_t)v38);
      if (v8 == v24)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
        goto LABEL_37;
      }
      if (v20 < v37 || v24 >= v8) {
        goto LABEL_42;
      }
      sub_25D69F75C(v38, (uint64_t)__src);
      sub_25D6A2350(v23, (uint64_t)&__src[2] + 8);
      memcpy(__dst, __src, sizeof(__dst));
      uint64_t v26 = __dst[3];
      uint64_t v27 = __dst[4];
      __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
      float v28 = (*(float (**)(uint64_t, uint64_t))(v27 + 16))(v26, v27);
      uint64_t v29 = __dst[8];
      uint64_t v30 = __dst[9];
      __swift_project_boxed_opaque_existential_1(&__dst[5], __dst[8]);
      float v31 = (*(float (**)(uint64_t, uint64_t))(v30 + 16))(v29, v30);
      sub_25D6A22D4((uint64_t)__dst, &qword_26A68F598);
      uint64_t v32 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D6B8310(0, *(void *)(v32 + 16) + 1, 1);
        uint64_t v32 = v42;
      }
      unint64_t v34 = *(void *)(v32 + 16);
      unint64_t v33 = *(void *)(v32 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_25D6B8310((char *)(v33 > 1), v34 + 1, 1);
        uint64_t v32 = v42;
      }
      ++v4;
      *(void *)(v32 + 16) = v34 + 1;
      *(float *)(v32 + 4 * v34 + 32) = v28 - v31;
      uint64_t v8 = v36;
      unint64_t v21 = *(void *)(v35 + 16);
      v22 += 40;
      v23 += 40;
      ++v24;
      if (v4 == v21) {
        goto LABEL_37;
      }
    }
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)__src);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_25D69E0F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5A8);
    uint64_t v3 = sub_25D6C31B0();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t v6 = v3;
  sub_25D69FAD8(a1, 1, &v6);
  uint64_t v4 = v6;
  if (v1) {
    swift_release();
  }
  return v4;
}

uint64_t sub_25D69E184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain();
  sub_25D69E21C(a1, a2, (uint64_t)&v7);
  if (v8) {
    return sub_25D69F75C(&v7, a3);
  }
  sub_25D6A22D4((uint64_t)&v7, &qword_26A68F5B0);
  sub_25D69F774();
  OUTLINED_FUNCTION_5();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_25D69E21C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    sub_25D6A2350(a1 + 32, (uint64_t)&v27);
    swift_bridgeObjectRetain();
    uint64_t v7 = v5 - 1;
    if (v5 != 1)
    {
      uint64_t v8 = a1 + 72;
      do
      {
        sub_25D6A2350(v8, (uint64_t)&v24);
        uint64_t v9 = v25;
        uint64_t v10 = v26;
        __swift_project_boxed_opaque_existential_1(&v24, v25);
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
        if (*(void *)(a2 + 16) && (unint64_t v13 = sub_25D6B89CC(v11, v12), (v14 & 1) != 0)) {
          uint64_t v15 = *(void *)(*(void *)(a2 + 56) + 8 * v13);
        }
        else {
          uint64_t v15 = -1;
        }
        swift_bridgeObjectRelease();
        uint64_t v16 = v28;
        uint64_t v17 = v29;
        __swift_project_boxed_opaque_existential_1(&v27, v28);
        uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
        if (*(void *)(a2 + 16) && (unint64_t v20 = sub_25D6B89CC(v18, v19), (v21 & 1) != 0))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + 56) + 8 * v20);
          swift_bridgeObjectRelease();
          if (v15 < v22) {
            goto LABEL_13;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          if (v15 < -1)
          {
LABEL_13:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
            sub_25D69F75C(&v24, (uint64_t)&v27);
            goto LABEL_14;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
LABEL_14:
        v8 += 40;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
    sub_25D69F75C(&v27, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25D69E3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = v2 + 16;
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1(v2 + 16, *(void *)(v2 + 40));
  unint64_t v6 = sub_25D6C2E30();
  swift_endAccess();
  unint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    unint64_t v5 = v6 / v7;
    if (qword_26A68F470 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  unint64_t v8 = v6 - v5 * v7;
  uint64_t v9 = sub_25D6C2DE0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A691DB8);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25D6C2DC0();
  os_log_type_t v11 = sub_25D6C3040();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218240;
    sub_25D6C30B0();
    *(_WORD *)(v12 + 12) = 2048;
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D698000, v10, v11, "Selected index %ld out of %ld", (uint8_t *)v12, 0x16u);
    MEMORY[0x2611B1630](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return sub_25D6A2350(a1 + 40 * v8 + 32, a2);
}

uint64_t sub_25D69E5B4()
{
  sub_25D69F2A4();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for RandomOriginalDialogSelector()
{
  return self;
}

uint64_t sub_25D69E60C@<X0>(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  return sub_25D69D820(a1, a2);
}

BOOL sub_25D69E630(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25D69E640()
{
  return sub_25D6C32D0();
}

uint64_t sub_25D69E668()
{
  return sub_25D6C32E0();
}

BOOL sub_25D69E6B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25D69E630(*a1, *a2);
}

uint64_t sub_25D69E6BC()
{
  return sub_25D69E668();
}

uint64_t sub_25D69E6C4()
{
  return sub_25D69E640();
}

uint64_t sub_25D69E6CC()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D69E710@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25D69E7D4(a1, (uint64_t)a2);
  if (!v3)
  {
    uint64_t v6 = v2[5];
    uint64_t v7 = v2[6];
    __swift_project_boxed_opaque_existential_1(v2 + 2, v6);
    uint64_t v8 = a2[3];
    uint64_t v9 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v8);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v9 + 8))(v10, v8, v9);
    (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v10, v6, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  return result;
}

uint64_t sub_25D69E7D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  unint64_t v5 = v2;
  if (qword_26A68F470 != -1) {
    goto LABEL_36;
  }
  while (1)
  {
    uint64_t v7 = sub_25D6C2DE0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A691DB8);
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25D6C2DC0();
    os_log_type_t v9 = sub_25D6C3040();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134217984;
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D698000, v8, v9, "Selecting from %ld dialogs", v10, 0xCu);
      MEMORY[0x2611B1630](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    *(void *)&long long v55 = a1;
    swift_bridgeObjectRetain();
    sub_25D69FC88((char **)&v55);
    if (v4) {
      goto LABEL_39;
    }
    uint64_t v11 = v55;
    if ((*(unsigned char *)(v5 + 56) & 1) == 0) {
      break;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    long long v27 = (void *)sub_25D6C2DC0();
    os_log_type_t v28 = sub_25D6C3040();
    uint64_t v50 = v11;
    if (OUTLINED_FUNCTION_4(v28))
    {
      uint64_t v29 = (float *)swift_slowAlloc();
      OUTLINED_FUNCTION_9(v29, 3.852e-34);
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7(&dword_25D698000, v30, v31, "%ld acceptable dialogs");
      OUTLINED_FUNCTION_2();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    a1 = *(void *)(v5 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v5 + 16), *(void *)(v5 + 40));
    uint64_t v32 = OUTLINED_FUNCTION_1_0();
    uint64_t v4 = v33(v32);
    OUTLINED_FUNCTION_3(MEMORY[0x263F8EE78]);
    uint64_t v34 = v59;
    uint64_t v35 = *(void *)(v4 + 16);
    swift_bridgeObjectRetain();
    if (!v35)
    {
LABEL_31:
      swift_bridgeObjectRelease_n();
      uint64_t v47 = sub_25D69E0F4(v34);
      *(void *)&long long v55 = v50;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25D69FCF4((char **)&v55, v47);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25D69F090(v55, (uint64_t)&v55);
      swift_release();
      if (*((void *)&v56 + 1)) {
        return sub_25D69F75C(&v55, a2);
      }
      sub_25D6A22D4((uint64_t)&v55, &qword_26A68F588);
      goto LABEL_34;
    }
    unint64_t v36 = 0;
    uint64_t v37 = v4 + 32;
    uint64_t v51 = v4;
    while (v36 < *(void *)(v4 + 16))
    {
      sub_25D6A2350(v37, (uint64_t)v52);
      *(void *)&v53[0] = v36;
      sub_25D69F75C(v52, (uint64_t)v53 + 8);
      long long v56 = v53[1];
      long long v57 = v54;
      long long v55 = v53[0];
      uint64_t v38 = *((void *)&v54 + 1);
      __swift_project_boxed_opaque_existential_1((void *)&v55 + 1, v54);
      uint64_t v39 = OUTLINED_FUNCTION_6();
      a1 = v40(v39, v38);
      uint64_t v42 = v41;
      uint64_t v43 = v55;
      *(void *)&v53[0] = v55;
      sub_25D6A2350((uint64_t)&v55 + 8, (uint64_t)v53 + 8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v53 + 8);
      sub_25D6A22D4((uint64_t)&v55, &qword_26A68F590);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_10(*(void *)(v34 + 16));
        uint64_t v34 = v59;
      }
      unint64_t v45 = *(void *)(v34 + 16);
      unint64_t v44 = *(void *)(v34 + 24);
      unint64_t v5 = v45 + 1;
      if (v45 >= v44 >> 1)
      {
        sub_25D6B8360((char *)(v44 > 1), v45 + 1, 1);
        uint64_t v34 = v59;
      }
      ++v36;
      *(void *)(v34 + 16) = v5;
      uint64_t v46 = (void *)(v34 + 24 * v45);
      v46[4] = a1;
      v46[5] = v42;
      v46[6] = v43;
      v37 += 40;
      uint64_t v4 = v51;
      if (v35 == v36) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_36:
    swift_once();
  }
  uint64_t v12 = sub_25D6B8FA4(1, v55);
  v58[0] = v11;
  v58[1] = v12;
  v58[2] = v13;
  v58[3] = v14;
  v58[4] = v15;
  swift_retain_n();
  uint64_t v16 = sub_25D69DCB8(v58);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    swift_release();
    swift_bridgeObjectRelease();
LABEL_34:
    sub_25D69F774();
    OUTLINED_FUNCTION_5();
    return OUTLINED_FUNCTION_8();
  }
  uint64_t v18 = v17 - 1;
  if (v18)
  {
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    float v21 = *(float *)(v16 + 32);
    do
    {
      float v22 = *(float *)(v16 + 36 + 4 * v20);
      if (v21 < v22) {
        uint64_t v19 = v20 + 1;
      }
      uint64_t v23 = v20 + 1;
      if (v21 < v22) {
        float v21 = *(float *)(v16 + 36 + 4 * v20);
      }
      ++v20;
    }
    while (v18 != v23);
  }
  else
  {
    uint64_t v19 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(v11 + 16);
  BOOL v25 = __OFSUB__(v24, v19);
  uint64_t v26 = v24 - v19;
  if (!v25)
  {
    if (__OFSUB__(v26, 1)) {
      goto LABEL_38;
    }
    uint64_t v11 = sub_25D69ECDC(v26 - 1, v11);
    goto LABEL_20;
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25D69ECDC(uint64_t result, uint64_t a2)
{
  if (result < 0) {
    goto LABEL_32;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if (!result) {
    return v2;
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  uint64_t v39 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a2 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
LABEL_28:
    swift_release();
    return v39;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = a2 + 32;
  uint64_t v31 = v4 - 1;
  uint64_t v8 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t result = sub_25D6A2350(v7, (uint64_t)&v35);
    uint64_t v9 = *(void *)(v8 + 16);
    if (v9 < v3)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25D6B8380(0, v9 + 1, 1);
        uint64_t v8 = v38;
      }
      unint64_t v12 = *(void *)(v8 + 16);
      unint64_t v11 = *(void *)(v8 + 24);
      if (v12 >= v11 >> 1) {
        sub_25D6B8380((char *)(v11 > 1), v12 + 1, 1);
      }
      uint64_t v13 = v36;
      uint64_t v14 = v37;
      uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v35, v36);
      MEMORY[0x270FA5388](v15, v15);
      uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v18 + 16))(v17);
      sub_25D6A211C(v12, (uint64_t)v17, &v38, v13, v14);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
      uint64_t v8 = v38;
LABEL_20:
      if (v31 == v5) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    if (v6 >= v9) {
      goto LABEL_30;
    }
    sub_25D6A2350(v8 + 40 * v6 + 32, (uint64_t)v32);
    uint64_t v19 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25D6B8380(0, *(void *)(v19 + 16) + 1, 1);
      uint64_t v19 = v39;
    }
    unint64_t v21 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (v21 >= v20 >> 1) {
      sub_25D6B8380((char *)(v20 > 1), v21 + 1, 1);
    }
    uint64_t v22 = v33;
    uint64_t v23 = v34;
    uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
    MEMORY[0x270FA5388](v24, v24);
    uint64_t v26 = (char *)&v30 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v27 + 16))(v26);
    sub_25D6A211C(v21, (uint64_t)v26, &v39, v22, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    uint64_t v28 = v38;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25D69FD90(v28);
      uint64_t v28 = result;
      uint64_t v38 = result;
    }
    if (v6 >= *(void *)(v28 + 16)) {
      goto LABEL_31;
    }
    uint64_t v29 = v28 + 40 * v6 + 32;
    __swift_destroy_boxed_opaque_existential_1(v29);
    uint64_t result = sub_25D69F75C(&v35, v29);
    uint64_t v8 = v38;
    if ((uint64_t)++v6 < v3) {
      goto LABEL_20;
    }
    if (v31 == v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    unint64_t v6 = 0;
LABEL_24:
    ++v5;
    v7 += 40;
  }
  while (v5 < *(void *)(v2 + 16));
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

double sub_25D69F090@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_25D6A2350(a1 + 32, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_25D69F0CC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 57, 7);
}

uint64_t type metadata accessor for HighestScoringOriginalDialogSelector()
{
  return self;
}

uint64_t sub_25D69F128@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25D69E710(a1, a2);
}

uint64_t sub_25D69F14C(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(v3 + 40);
  uint64_t v6 = *(void *)(v3 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, v5, v6);
  uint64_t v8 = *(void *)(v3 + 80);
  uint64_t v9 = *(void *)(v3 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 56), v8);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t, uint64_t))(v9 + 8))(v14, v7, v8, v9);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  char v17 = *(unsigned char *)(v3 + 104);
  sub_25D6A2350((uint64_t)v14, (uint64_t)v13);
  sub_25D6BA94C(&v17, v7, (uint64_t)v13);
  swift_bridgeObjectRelease();
  sub_25D6A22D4((uint64_t)v13, &qword_26A68F588);
  uint64_t v11 = v15;
  uint64_t v12 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_25D69F2A4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t sub_25D69F2D4()
{
  sub_25D69F2A4();
  return MEMORY[0x270FA0228](v0, 105, 7);
}

uint64_t type metadata accessor for DialogScorerSelector()
{
  return self;
}

uint64_t sub_25D69F32C(uint64_t a1)
{
  return sub_25D69F14C(a1);
}

uint64_t sub_25D69F350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v22 = a2;
    uint64_t v4 = a1 + 32;
    uint64_t v6 = *(void *)(v2 + 16);
    uint64_t v5 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    uint64_t v16 = v4;
    while (1)
    {
      sub_25D6A2350(v4, (uint64_t)&v18);
      uint64_t v8 = v19;
      uint64_t v7 = v20;
      __swift_project_boxed_opaque_existential_1(&v18, v19);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v7 + 8))(v17, v8, v7);
      uint64_t v9 = v17[4];
      __swift_project_boxed_opaque_existential_1(v17, v17[3]);
      uint64_t v10 = OUTLINED_FUNCTION_6();
      if (v11(v10, v9) == v6 && v12 == v5) {
        break;
      }
      char v14 = sub_25D6C3230();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      if (v14) {
        goto LABEL_12;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        sub_25D6A2350(v16, (uint64_t)v21);
        return sub_25D69F75C(v21, v22);
      }
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
LABEL_12:
    swift_bridgeObjectRelease();
    sub_25D69F75C(&v18, (uint64_t)v21);
    return sub_25D69F75C(v21, v22);
  }
  else
  {
    sub_25D69F774();
    OUTLINED_FUNCTION_5();
    return OUTLINED_FUNCTION_8();
  }
}

uint64_t sub_25D69F4D8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for IdentifiedDialogOrFirstSelector()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HighestScoringOriginalDialogSelector.ThresholdMethod(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HighestScoringOriginalDialogSelector.ThresholdMethod(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x25D69F698);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25D69F6C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25D69F6CC(unsigned char *result, char a2)
{
  *double result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HighestScoringOriginalDialogSelector.ThresholdMethod()
{
  return &type metadata for HighestScoringOriginalDialogSelector.ThresholdMethod;
}

unint64_t sub_25D69F6EC()
{
  unint64_t result = qword_26A68F578;
  if (!qword_26A68F578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F578);
  }
  return result;
}

uint64_t sub_25D69F738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D69F350(a1, a2);
}

uint64_t sub_25D69F75C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25D69F774()
{
  unint64_t result = qword_26A68F580;
  if (!qword_26A68F580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F580);
  }
  return result;
}

uint64_t sub_25D69F7C0(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5A8);
  char v37 = a2;
  uint64_t v6 = sub_25D6C31A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
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
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25D6C32C0();
    sub_25D6C2F00();
    uint64_t result = sub_25D6C32E0();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    void *v32 = v22;
    v32[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v35)
    {
      swift_release();
      long long v3 = v34;
      char v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v35) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v36 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v35)
  {
    unint64_t v18 = *(void *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v35) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v36 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  long long v3 = v34;
LABEL_34:
  if (v37)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_25D69FABC(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *char v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *long long v3 = v7;
  return result;
}

uint64_t sub_25D69FABC(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_25D69FAD8(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  for (unint64_t i = (uint64_t *)(a1 + 48); ; i += 3)
  {
    uint64_t v8 = *(i - 2);
    uint64_t v7 = *(i - 1);
    uint64_t v9 = *i;
    unint64_t v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_25D6B89CC(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F570);
        sub_25D6C3160();
      }
    }
    else
    {
      sub_25D69F7C0(v15, a2 & 1);
      unint64_t v17 = sub_25D6B89CC(v8, v7);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_18;
      }
      unint64_t v12 = v17;
    }
    int64_t v19 = (void *)*a3;
    if (v16)
    {
      swift_bridgeObjectRelease();
      *(void *)(v19[7] + 8 * v12) = v9;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      uint64_t v20 = (uint64_t *)(v19[6] + 16 * v12);
      *uint64_t v20 = v8;
      v20[1] = v7;
      *(void *)(v19[7] + 8 * v12) = v9;
      uint64_t v21 = v19[2];
      BOOL v22 = __OFADD__(v21, 1);
      uint64_t v23 = v21 + 1;
      if (v22) {
        goto LABEL_17;
      }
      v19[2] = v23;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_25D6C3270();
  __break(1u);
  return result;
}

uint64_t sub_25D69FC88(char **a1)
{
  long long v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v2 = sub_25D69FD90((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_25D6A0ACC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25D69FCF4(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_25D69FD90((uint64_t)v4);
  }
  uint64_t v5 = *((void *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_25D69FDA4(v7, a2);
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

char *sub_25D69FD90(uint64_t a1)
{
  return sub_25D6B87F0(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25D69FDA4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_25D6C3210();
  if (v6 >= v5)
  {
    if ((v5 & 0x8000000000000000) == 0)
    {
      if (v5) {
        sub_25D6A1318(0, v5, 1, v4, a2);
      }
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_164;
  }
  uint64_t v7 = v6;
  uint64_t v183 = v2;
  uint64_t v168 = sub_25D6BD074(v5 / 2);
  uint64_t v169 = v5;
  uint64_t v175 = a2;
  v176 = v8;
  if (v5 <= 0)
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
    unint64_t v103 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_126:
    v156 = v10;
    if (v103 < 2)
    {
LABEL_139:
      swift_bridgeObjectRelease();
      if (v169 >= -1) {
        goto LABEL_140;
      }
      goto LABEL_169;
    }
    uint64_t v157 = *v4;
    uint64_t v182 = *v4;
    while (1)
    {
      unint64_t v158 = v103 - 2;
      if (v103 < 2) {
        break;
      }
      if (!v157) {
        goto LABEL_173;
      }
      uint64_t v159 = *(void *)&v156[16 * v158 + 32];
      uint64_t v160 = *(void *)&v156[16 * v103 + 24];
      v161 = (char *)(v157 + 40 * v159);
      v162 = (char *)(v157 + 40 * *(void *)&v156[16 * v103 + 16]);
      unint64_t v163 = v157 + 40 * v160;
      swift_bridgeObjectRetain();
      sub_25D6A1784(v161, v162, v163, v176, a2);
      if (v183) {
        goto LABEL_123;
      }
      if (v160 < v159) {
        goto LABEL_159;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v156 = sub_25D6A2108((uint64_t)v156);
      }
      if (v158 >= *((void *)v156 + 2)) {
        goto LABEL_160;
      }
      v164 = &v156[16 * v158 + 32];
      *(void *)v164 = v159;
      *((void *)v164 + 1) = v160;
      unint64_t v165 = *((void *)v156 + 2);
      if (v103 > v165) {
        goto LABEL_161;
      }
      memmove(&v156[16 * v103 + 16], &v156[16 * v103 + 32], 16 * (v165 - v103));
      *((void *)v156 + 2) = v165 - 1;
      unint64_t v103 = v165 - 1;
      a2 = v175;
      uint64_t v157 = v182;
      if (v165 <= 2) {
        goto LABEL_139;
      }
    }
LABEL_158:
    __break(1u);
LABEL_159:
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
LABEL_162:
    __break(1u);
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
LABEL_166:
    __break(1u);
LABEL_167:
    __break(1u);
LABEL_168:
    __break(1u);
LABEL_169:
    __break(1u);
LABEL_170:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_171:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_172:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_173:
    uint64_t result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  uint64_t v167 = v7;
  uint64_t v9 = 0;
  unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  v173 = v4;
  while (1)
  {
    uint64_t v11 = v9++;
    v177 = v10;
    uint64_t v174 = v11;
    if (v9 < v5)
    {
      uint64_t v12 = *v4;
      sub_25D6A2350(*v4 + 40 * v9, (uint64_t)&v190);
      uint64_t v170 = v12;
      sub_25D6A2350(v12 + 40 * v11, (uint64_t)v187);
      uint64_t v13 = v191;
      uint64_t v14 = v192;
      __swift_project_boxed_opaque_existential_1(&v190, v191);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v14 + 8))(v184, v13, v14);
      uint64_t v15 = v185;
      uint64_t v16 = v186;
      __swift_project_boxed_opaque_existential_1(v184, v185);
      uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
      uint64_t v179 = v5;
      if (*(void *)(a2 + 16) && (unint64_t v19 = sub_25D6B89CC(v17, v18), (v20 & 1) != 0)) {
        uint64_t v21 = *(void *)(*(void *)(a2 + 56) + 8 * v19);
      }
      else {
        uint64_t v21 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
      uint64_t v22 = v188;
      uint64_t v23 = v189;
      __swift_project_boxed_opaque_existential_1(v187, v188);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v23 + 8))(v184, v22, v23);
      uint64_t v24 = v185;
      uint64_t v25 = v186;
      __swift_project_boxed_opaque_existential_1(v184, v185);
      uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v25);
      if (*(void *)(a2 + 16) && (unint64_t v28 = sub_25D6B89CC(v26, v27), (v29 & 1) != 0)) {
        uint64_t v30 = *(void *)(*(void *)(a2 + 56) + 8 * v28);
      }
      else {
        uint64_t v30 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
      if (v21 == v30)
      {
        uint64_t v31 = v191;
        uint64_t v32 = v192;
        __swift_project_boxed_opaque_existential_1(&v190, v191);
        float v33 = (*(float (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
        uint64_t v34 = v188;
        uint64_t v35 = v189;
        __swift_project_boxed_opaque_existential_1(v187, v188);
        BOOL v36 = (*(float (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35) < v33;
      }
      else
      {
        BOOL v36 = v21 < v30;
      }
      int v171 = v36;
      uint64_t v5 = v179;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
      uint64_t v9 = v11 + 2;
      if (v11 + 2 < v179)
      {
        uint64_t v37 = v170 + 40 * v11 + 40;
        while (1)
        {
          sub_25D6A2350(v37 + 40, (uint64_t)&v190);
          sub_25D6A2350(v37, (uint64_t)v187);
          uint64_t v39 = v191;
          uint64_t v38 = v192;
          __swift_project_boxed_opaque_existential_1(&v190, v191);
          (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v38 + 8))(v184, v39, v38);
          uint64_t v40 = v185;
          uint64_t v41 = v186;
          __swift_project_boxed_opaque_existential_1(v184, v185);
          uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
          if (!*(void *)(a2 + 16)) {
            goto LABEL_21;
          }
          unint64_t v44 = sub_25D6B89CC(v42, v43);
          if (v45) {
            uint64_t v46 = *(void *)(*(void *)(a2 + 56) + 8 * v44);
          }
          else {
LABEL_21:
          }
            uint64_t v46 = -1;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
          uint64_t v47 = v188;
          uint64_t v48 = v189;
          __swift_project_boxed_opaque_existential_1(v187, v188);
          (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v48 + 8))(v184, v47, v48);
          uint64_t v49 = v185;
          uint64_t v50 = v186;
          __swift_project_boxed_opaque_existential_1(v184, v185);
          uint64_t v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8))(v49, v50);
          if (!*(void *)(a2 + 16)) {
            goto LABEL_25;
          }
          unint64_t v53 = sub_25D6B89CC(v51, v52);
          if (v54) {
            uint64_t v55 = *(void *)(*(void *)(a2 + 56) + 8 * v53);
          }
          else {
LABEL_25:
          }
            uint64_t v55 = -1;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
          if (v46 == v55)
          {
            uint64_t v56 = v191;
            uint64_t v57 = v192;
            __swift_project_boxed_opaque_existential_1(&v190, v191);
            float v58 = (*(float (**)(uint64_t, uint64_t))(v57 + 16))(v56, v57);
            uint64_t v59 = v188;
            uint64_t v60 = v189;
            __swift_project_boxed_opaque_existential_1(v187, v188);
            int v61 = (*(float (**)(uint64_t, uint64_t))(v60 + 16))(v59, v60) < v58;
          }
          else
          {
            int v61 = v46 < v55;
          }
          unint64_t v10 = v177;
          uint64_t v5 = v179;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
          if (v171 != v61) {
            break;
          }
          ++v9;
          v37 += 40;
          if (v9 >= v179)
          {
            uint64_t v9 = v179;
            break;
          }
        }
      }
      if (v171)
      {
        if (v9 < v11) {
          goto LABEL_166;
        }
        if (v11 < v9)
        {
          uint64_t v62 = 40 * v9 - 40;
          uint64_t v63 = 40 * v11;
          uint64_t v64 = v11;
          uint64_t v65 = v9;
          do
          {
            if (v64 != --v9)
            {
              if (!v170) {
                goto LABEL_172;
              }
              uint64_t v66 = v170 + v63;
              sub_25D69F75C((long long *)(v170 + v63), (uint64_t)&v190);
              uint64_t v67 = *(void *)(v170 + v62 + 32);
              long long v68 = *(_OWORD *)(v170 + v62 + 16);
              *(_OWORD *)uint64_t v66 = *(_OWORD *)(v170 + v62);
              *(_OWORD *)(v66 + 16) = v68;
              *(void *)(v66 + 32) = v67;
              sub_25D69F75C(&v190, v170 + v62);
              unint64_t v10 = v177;
            }
            ++v64;
            v62 -= 40;
            v63 += 40;
          }
          while (v64 < v9);
          uint64_t v9 = v65;
          uint64_t v11 = v174;
          uint64_t v5 = v179;
        }
      }
    }
    if (v9 < v5)
    {
      if (__OFSUB__(v9, v11)) {
        goto LABEL_163;
      }
      if (v9 - v11 < v167)
      {
        if (__OFADD__(v11, v167)) {
          goto LABEL_167;
        }
        if (v11 + v167 >= v5) {
          uint64_t v69 = v5;
        }
        else {
          uint64_t v69 = v11 + v167;
        }
        if (v69 < v11) {
          goto LABEL_168;
        }
        if (v9 != v69)
        {
          uint64_t v70 = 40 * v9 - 40;
          uint64_t v172 = v69;
          do
          {
            uint64_t v71 = v11;
            uint64_t v180 = v70;
            uint64_t v72 = v9;
            do
            {
              uint64_t v73 = *v4 + v70;
              sub_25D6A2350(v73 + 40, (uint64_t)&v190);
              sub_25D6A2350(v73, (uint64_t)v187);
              uint64_t v74 = v191;
              uint64_t v75 = v192;
              __swift_project_boxed_opaque_existential_1(&v190, v191);
              (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v75 + 8))(v184, v74, v75);
              uint64_t v76 = v185;
              uint64_t v77 = v186;
              __swift_project_boxed_opaque_existential_1(v184, v185);
              uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v77);
              if (*(void *)(a2 + 16) && (unint64_t v80 = sub_25D6B89CC(v78, v79), (v81 & 1) != 0)) {
                uint64_t v82 = *(void *)(*(void *)(a2 + 56) + 8 * v80);
              }
              else {
                uint64_t v82 = -1;
              }
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
              uint64_t v83 = v188;
              uint64_t v84 = v189;
              __swift_project_boxed_opaque_existential_1(v187, v188);
              (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v84 + 8))(v184, v83, v84);
              uint64_t v85 = v185;
              uint64_t v86 = v186;
              __swift_project_boxed_opaque_existential_1(v184, v185);
              uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v86 + 8))(v85, v86);
              if (*(void *)(a2 + 16) && (unint64_t v89 = sub_25D6B89CC(v87, v88), (v90 & 1) != 0)) {
                uint64_t v91 = *(void *)(*(void *)(a2 + 56) + 8 * v89);
              }
              else {
                uint64_t v91 = -1;
              }
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
              if (v82 == v91)
              {
                uint64_t v92 = v191;
                uint64_t v93 = v192;
                __swift_project_boxed_opaque_existential_1(&v190, v191);
                float v94 = (*(float (**)(uint64_t, uint64_t))(v93 + 16))(v92, v93);
                uint64_t v95 = v188;
                uint64_t v96 = v189;
                __swift_project_boxed_opaque_existential_1(v187, v188);
                BOOL v97 = (*(float (**)(uint64_t, uint64_t))(v96 + 16))(v95, v96) < v94;
              }
              else
              {
                BOOL v97 = v82 < v91;
              }
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
              if (!v97) {
                break;
              }
              uint64_t v98 = *v4;
              if (!*v4) {
                goto LABEL_170;
              }
              uint64_t v99 = v98 + v70;
              sub_25D69F75C((long long *)(v98 + v70 + 40), (uint64_t)&v190);
              long long v100 = *(_OWORD *)(v99 + 16);
              *(_OWORD *)(v99 + 40) = *(_OWORD *)v99;
              *(_OWORD *)(v99 + 56) = v100;
              *(void *)(v99 + 72) = *(void *)(v99 + 32);
              sub_25D69F75C(&v190, v99);
              v70 -= 40;
              ++v71;
            }
            while (v72 != v71);
            uint64_t v9 = v72 + 1;
            uint64_t v70 = v180 + 40;
            uint64_t v11 = v174;
          }
          while (v9 != v172);
          uint64_t v9 = v172;
          unint64_t v10 = v177;
        }
      }
    }
    if (v9 < v11) {
      goto LABEL_162;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v10 = sub_25D6A2010(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v102 = *((void *)v10 + 2);
    unint64_t v101 = *((void *)v10 + 3);
    unint64_t v103 = v102 + 1;
    if (v102 >= v101 >> 1) {
      unint64_t v10 = sub_25D6A2010((char *)(v101 > 1), v102 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v103;
    v104 = &v10[16 * v102 + 32];
    *(void *)v104 = v11;
    *((void *)v104 + 1) = v9;
    if (v102) {
      break;
    }
    unint64_t v103 = 1;
LABEL_117:
    uint64_t v5 = v4[1];
    if (v9 >= v5) {
      goto LABEL_126;
    }
  }
  v105 = v10 + 32;
  while (1)
  {
    unint64_t v106 = v103 - 1;
    if (v103 >= 4)
    {
      v111 = &v105[16 * v103];
      uint64_t v112 = *((void *)v111 - 8);
      uint64_t v113 = *((void *)v111 - 7);
      BOOL v117 = __OFSUB__(v113, v112);
      uint64_t v114 = v113 - v112;
      if (v117) {
        goto LABEL_147;
      }
      uint64_t v116 = *((void *)v111 - 6);
      uint64_t v115 = *((void *)v111 - 5);
      BOOL v117 = __OFSUB__(v115, v116);
      uint64_t v109 = v115 - v116;
      char v110 = v117;
      if (v117) {
        goto LABEL_148;
      }
      unint64_t v118 = v103 - 2;
      v119 = &v105[16 * v103 - 32];
      uint64_t v121 = *(void *)v119;
      uint64_t v120 = *((void *)v119 + 1);
      BOOL v117 = __OFSUB__(v120, v121);
      uint64_t v122 = v120 - v121;
      if (v117) {
        goto LABEL_149;
      }
      BOOL v117 = __OFADD__(v109, v122);
      uint64_t v123 = v109 + v122;
      if (v117) {
        goto LABEL_151;
      }
      if (v123 >= v114)
      {
        v141 = &v105[16 * v106];
        uint64_t v143 = *(void *)v141;
        uint64_t v142 = *((void *)v141 + 1);
        BOOL v117 = __OFSUB__(v142, v143);
        uint64_t v144 = v142 - v143;
        if (v117) {
          goto LABEL_157;
        }
        BOOL v134 = v109 < v144;
        goto LABEL_106;
      }
    }
    else
    {
      if (v103 != 3)
      {
        uint64_t v135 = *((void *)v10 + 4);
        uint64_t v136 = *((void *)v10 + 5);
        BOOL v117 = __OFSUB__(v136, v135);
        uint64_t v128 = v136 - v135;
        char v129 = v117;
        goto LABEL_100;
      }
      uint64_t v108 = *((void *)v10 + 4);
      uint64_t v107 = *((void *)v10 + 5);
      BOOL v117 = __OFSUB__(v107, v108);
      uint64_t v109 = v107 - v108;
      char v110 = v117;
    }
    if (v110) {
      goto LABEL_150;
    }
    unint64_t v118 = v103 - 2;
    v124 = &v105[16 * v103 - 32];
    uint64_t v126 = *(void *)v124;
    uint64_t v125 = *((void *)v124 + 1);
    BOOL v127 = __OFSUB__(v125, v126);
    uint64_t v128 = v125 - v126;
    char v129 = v127;
    if (v127) {
      goto LABEL_152;
    }
    v130 = &v105[16 * v106];
    uint64_t v132 = *(void *)v130;
    uint64_t v131 = *((void *)v130 + 1);
    BOOL v117 = __OFSUB__(v131, v132);
    uint64_t v133 = v131 - v132;
    if (v117) {
      goto LABEL_154;
    }
    if (__OFADD__(v128, v133)) {
      goto LABEL_156;
    }
    if (v128 + v133 >= v109)
    {
      BOOL v134 = v109 < v133;
LABEL_106:
      if (v134) {
        unint64_t v106 = v118;
      }
      goto LABEL_108;
    }
LABEL_100:
    if (v129) {
      goto LABEL_153;
    }
    v137 = &v105[16 * v106];
    uint64_t v139 = *(void *)v137;
    uint64_t v138 = *((void *)v137 + 1);
    BOOL v117 = __OFSUB__(v138, v139);
    uint64_t v140 = v138 - v139;
    if (v117) {
      goto LABEL_155;
    }
    if (v140 < v128) {
      goto LABEL_117;
    }
LABEL_108:
    unint64_t v145 = v106 - 1;
    if (v106 - 1 >= v103)
    {
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
      goto LABEL_158;
    }
    uint64_t v146 = *v4;
    if (!*v4) {
      goto LABEL_171;
    }
    v147 = &v105[16 * v145];
    v148 = v105;
    uint64_t v149 = *(void *)v147;
    unint64_t v150 = v106;
    v151 = &v148[16 * v106];
    uint64_t v152 = *((void *)v151 + 1);
    v153 = (char *)(v146 + 40 * *(void *)v147);
    unint64_t v178 = v146 + 40 * v152;
    v181 = (char *)(v146 + 40 * *(void *)v151);
    a2 = v175;
    swift_bridgeObjectRetain();
    sub_25D6A1784(v153, v181, v178, v176, v175);
    if (v183) {
      break;
    }
    if (v152 < v149) {
      goto LABEL_144;
    }
    if (v150 > *((void *)v10 + 2)) {
      goto LABEL_145;
    }
    unint64_t v154 = v150;
    *(void *)v147 = v149;
    v105 = v10 + 32;
    *(void *)&v10[16 * v145 + 40] = v152;
    unint64_t v155 = *((void *)v10 + 2);
    if (v150 >= v155) {
      goto LABEL_146;
    }
    uint64_t v183 = 0;
    unint64_t v103 = v155 - 1;
    memmove(v151, v151 + 16, 16 * (v155 - 1 - v154));
    *((void *)v10 + 2) = v155 - 1;
    uint64_t v4 = v173;
    if (v155 <= 2) {
      goto LABEL_117;
    }
  }
LABEL_123:
  swift_bridgeObjectRelease();
  if (v169 < -1) {
    goto LABEL_165;
  }
LABEL_140:
  *(void *)(v168 + 16) = 0;
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D6A0ACC(uint64_t *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25D6C3210();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_25D6A1608(0, v3, 1, v2);
      }
      return result;
    }
    goto LABEL_127;
  }
  uint64_t v5 = result;
  uint64_t result = sub_25D6BD074(v3 / 2);
  uint64_t v113 = result;
  uint64_t v114 = v3;
  v119 = v6;
  if (v3 <= 0)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    unint64_t v49 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_92:
    uint64_t result = v8;
    if (v49 < 2)
    {
LABEL_103:
      uint64_t result = swift_bridgeObjectRelease();
      if (v114 >= -1)
      {
        *(void *)(v113 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_132;
    }
    uint64_t v102 = *v2;
    while (1)
    {
      unint64_t v103 = v49 - 2;
      if (v49 < 2) {
        break;
      }
      if (!v102) {
        goto LABEL_136;
      }
      uint64_t v104 = result;
      uint64_t v105 = *(void *)(result + 32 + 16 * v103);
      uint64_t v106 = *(void *)(result + 32 + 16 * (v49 - 1) + 8);
      uint64_t result = sub_25D6A1D24((char *)(v102 + 40 * v105), (char *)(v102 + 40 * *(void *)(result + 32 + 16 * (v49 - 1))), v102 + 40 * v106, v119);
      if (v1) {
        goto LABEL_89;
      }
      if (v106 < v105) {
        goto LABEL_122;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25D6A2108(v104);
        uint64_t v104 = result;
      }
      if (v103 >= *(void *)(v104 + 16)) {
        goto LABEL_123;
      }
      uint64_t v107 = v104 + 32;
      uint64_t v108 = (void *)(v104 + 32 + 16 * v103);
      *uint64_t v108 = v105;
      v108[1] = v106;
      uint64_t v109 = v104;
      unint64_t v110 = *(void *)(v104 + 16);
      if (v49 > v110) {
        goto LABEL_124;
      }
      memmove((void *)(v107 + 16 * (v49 - 1)), (const void *)(v107 + 16 * v49), 16 * (v110 - v49));
      uint64_t result = v109;
      *(void *)(v109 + 16) = v110 - 1;
      unint64_t v49 = v110 - 1;
      if (v110 <= 2) {
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
  uint64_t v112 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = v3;
  while (1)
  {
    uint64_t v10 = v7++;
    uint64_t v117 = v10;
    if (v7 < v9)
    {
      uint64_t v11 = *v2;
      sub_25D6A2350(*v2 + 40 * v7, (uint64_t)&v123);
      sub_25D6A2350(v11 + 40 * v10, (uint64_t)v120);
      uint64_t v13 = v124;
      uint64_t v12 = v125;
      __swift_project_boxed_opaque_existential_1(&v123, v124);
      float v14 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v13, v12);
      uint64_t v15 = v121;
      uint64_t v16 = v122;
      __swift_project_boxed_opaque_existential_1(v120, v121);
      float v17 = (*(float (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
      uint64_t v7 = v10 + 2;
      uint64_t v115 = v11;
      if (v10 + 2 < v9)
      {
        uint64_t v18 = v11 + 40 * v10 + 40;
        while (1)
        {
          uint64_t v19 = v18 + 40;
          sub_25D6A2350(v18 + 40, (uint64_t)&v123);
          sub_25D6A2350(v18, (uint64_t)v120);
          uint64_t v20 = v124;
          uint64_t v21 = v125;
          __swift_project_boxed_opaque_existential_1(&v123, v124);
          float v22 = (*(float (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
          uint64_t v23 = v121;
          uint64_t v24 = v122;
          __swift_project_boxed_opaque_existential_1(v120, v121);
          BOOL v25 = (*(float (**)(uint64_t, uint64_t))(v24 + 16))(v23, v24) >= v22;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
          uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
          if (v17 < v14 == v25) {
            break;
          }
          ++v7;
          uint64_t v18 = v19;
          if (v7 >= v9)
          {
            uint64_t v7 = v9;
            break;
          }
        }
        uint64_t v10 = v117;
      }
      if (v17 < v14)
      {
        if (v7 < v10) {
          goto LABEL_129;
        }
        if (v10 < v7)
        {
          uint64_t v111 = v9;
          uint64_t v26 = 40 * v7 - 40;
          uint64_t v27 = v10;
          uint64_t v28 = 40 * v10;
          uint64_t v29 = v7;
          do
          {
            if (v27 != --v29)
            {
              if (!v115) {
                goto LABEL_135;
              }
              uint64_t v30 = v115 + v28;
              sub_25D69F75C((long long *)(v115 + v28), (uint64_t)&v123);
              uint64_t v31 = *(void *)(v115 + v26 + 32);
              long long v32 = *(_OWORD *)(v115 + v26 + 16);
              *(_OWORD *)uint64_t v30 = *(_OWORD *)(v115 + v26);
              *(_OWORD *)(v30 + 16) = v32;
              *(void *)(v30 + 32) = v31;
              uint64_t result = sub_25D69F75C(&v123, v115 + v26);
            }
            ++v27;
            v26 -= 40;
            v28 += 40;
          }
          while (v27 < v29);
          uint64_t v10 = v117;
          uint64_t v9 = v111;
        }
      }
    }
    if (v7 < v9)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_126;
      }
      if (v7 - v10 < v112)
      {
        uint64_t v33 = v10 + v112;
        if (__OFADD__(v10, v112)) {
          goto LABEL_130;
        }
        if (v33 >= v9) {
          uint64_t v33 = v9;
        }
        if (v33 < v10) {
          goto LABEL_131;
        }
        if (v7 != v33)
        {
          uint64_t v34 = 40 * v7 - 40;
          uint64_t v116 = v33;
          do
          {
            uint64_t v35 = v10;
            uint64_t v36 = v34;
            do
            {
              uint64_t v37 = *v2 + v36;
              sub_25D6A2350(v37 + 40, (uint64_t)&v123);
              sub_25D6A2350(v37, (uint64_t)v120);
              uint64_t v38 = v124;
              uint64_t v39 = v125;
              __swift_project_boxed_opaque_existential_1(&v123, v124);
              float v40 = (*(float (**)(uint64_t, uint64_t))(v39 + 16))(v38, v39);
              uint64_t v41 = v121;
              uint64_t v42 = v122;
              __swift_project_boxed_opaque_existential_1(v120, v121);
              float v43 = (*(float (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
              uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
              if (v43 >= v40) {
                break;
              }
              uint64_t v44 = *v2;
              if (!*v2) {
                goto LABEL_133;
              }
              uint64_t v45 = v44 + v36;
              sub_25D69F75C((long long *)(v44 + v36 + 40), (uint64_t)&v123);
              long long v46 = *(_OWORD *)(v45 + 16);
              *(_OWORD *)(v45 + 40) = *(_OWORD *)v45;
              *(_OWORD *)(v45 + 56) = v46;
              *(void *)(v45 + 72) = *(void *)(v45 + 32);
              uint64_t result = sub_25D69F75C(&v123, v45);
              v36 -= 40;
              ++v35;
            }
            while (v7 != v35);
            ++v7;
            v34 += 40;
            uint64_t v10 = v117;
          }
          while (v7 != v116);
          uint64_t v7 = v116;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_125;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25D6A2010(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    unint64_t v48 = *(void *)(v8 + 16);
    unint64_t v47 = *(void *)(v8 + 24);
    unint64_t v49 = v48 + 1;
    if (v48 >= v47 >> 1)
    {
      uint64_t result = (uint64_t)sub_25D6A2010((char *)(v47 > 1), v48 + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    *(void *)(v8 + 16) = v49;
    uint64_t v118 = v8 + 32;
    uint64_t v50 = (uint64_t *)(v8 + 32 + 16 * v48);
    *uint64_t v50 = v10;
    v50[1] = v7;
    if (v48) {
      break;
    }
    unint64_t v49 = 1;
LABEL_84:
    uint64_t v9 = v2[1];
    if (v7 >= v9) {
      goto LABEL_92;
    }
  }
  uint64_t v51 = v8 + 32;
  while (1)
  {
    unint64_t v52 = v49 - 1;
    if (v49 >= 4)
    {
      unint64_t v57 = v51 + 16 * v49;
      uint64_t v58 = *(void *)(v57 - 64);
      uint64_t v59 = *(void *)(v57 - 56);
      BOOL v63 = __OFSUB__(v59, v58);
      uint64_t v60 = v59 - v58;
      if (v63) {
        goto LABEL_110;
      }
      uint64_t v62 = *(void *)(v57 - 48);
      uint64_t v61 = *(void *)(v57 - 40);
      BOOL v63 = __OFSUB__(v61, v62);
      uint64_t v55 = v61 - v62;
      char v56 = v63;
      if (v63) {
        goto LABEL_111;
      }
      unint64_t v64 = v49 - 2;
      uint64_t v65 = (uint64_t *)(v51 + 16 * (v49 - 2));
      uint64_t v67 = *v65;
      uint64_t v66 = v65[1];
      BOOL v63 = __OFSUB__(v66, v67);
      uint64_t v68 = v66 - v67;
      if (v63) {
        goto LABEL_112;
      }
      BOOL v63 = __OFADD__(v55, v68);
      uint64_t v69 = v55 + v68;
      if (v63) {
        goto LABEL_114;
      }
      if (v69 >= v60)
      {
        uint64_t v87 = (uint64_t *)(v51 + 16 * v52);
        uint64_t v89 = *v87;
        uint64_t v88 = v87[1];
        BOOL v63 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v63) {
          goto LABEL_120;
        }
        BOOL v80 = v55 < v90;
        goto LABEL_73;
      }
    }
    else
    {
      if (v49 != 3)
      {
        uint64_t v81 = *(void *)(v8 + 32);
        uint64_t v82 = *(void *)(v8 + 40);
        BOOL v63 = __OFSUB__(v82, v81);
        uint64_t v74 = v82 - v81;
        char v75 = v63;
        goto LABEL_67;
      }
      uint64_t v54 = *(void *)(v8 + 32);
      uint64_t v53 = *(void *)(v8 + 40);
      BOOL v63 = __OFSUB__(v53, v54);
      uint64_t v55 = v53 - v54;
      char v56 = v63;
    }
    if (v56) {
      goto LABEL_113;
    }
    unint64_t v64 = v49 - 2;
    uint64_t v70 = (uint64_t *)(v51 + 16 * (v49 - 2));
    uint64_t v72 = *v70;
    uint64_t v71 = v70[1];
    BOOL v73 = __OFSUB__(v71, v72);
    uint64_t v74 = v71 - v72;
    char v75 = v73;
    if (v73) {
      goto LABEL_115;
    }
    uint64_t v76 = (uint64_t *)(v51 + 16 * v52);
    uint64_t v78 = *v76;
    uint64_t v77 = v76[1];
    BOOL v63 = __OFSUB__(v77, v78);
    uint64_t v79 = v77 - v78;
    if (v63) {
      goto LABEL_117;
    }
    if (__OFADD__(v74, v79)) {
      goto LABEL_119;
    }
    if (v74 + v79 >= v55)
    {
      BOOL v80 = v55 < v79;
LABEL_73:
      if (v80) {
        unint64_t v52 = v64;
      }
      goto LABEL_75;
    }
LABEL_67:
    if (v75) {
      goto LABEL_116;
    }
    uint64_t v83 = (uint64_t *)(v51 + 16 * v52);
    uint64_t v85 = *v83;
    uint64_t v84 = v83[1];
    BOOL v63 = __OFSUB__(v84, v85);
    uint64_t v86 = v84 - v85;
    if (v63) {
      goto LABEL_118;
    }
    if (v86 < v74) {
      goto LABEL_84;
    }
LABEL_75:
    unint64_t v91 = v52 - 1;
    if (v52 - 1 >= v49)
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
    uint64_t v92 = v7;
    uint64_t v93 = v2;
    uint64_t v94 = *v2;
    if (!*v2) {
      goto LABEL_134;
    }
    uint64_t v95 = v8;
    uint64_t v96 = (uint64_t *)(v51 + 16 * v91);
    uint64_t v97 = v51;
    uint64_t v98 = *v96;
    uint64_t v99 = (void *)(v97 + 16 * v52);
    uint64_t v100 = v99[1];
    uint64_t result = sub_25D6A1D24((char *)(v94 + 40 * *v96), (char *)(v94 + 40 * *v99), v94 + 40 * v100, v119);
    if (v1) {
      break;
    }
    if (v100 < v98) {
      goto LABEL_107;
    }
    if (v52 > *(void *)(v95 + 16)) {
      goto LABEL_108;
    }
    *uint64_t v96 = v98;
    uint64_t v51 = v118;
    *(void *)(v118 + 16 * v91 + 8) = v100;
    unint64_t v101 = *(void *)(v95 + 16);
    if (v52 >= v101) {
      goto LABEL_109;
    }
    uint64_t v8 = v95;
    unint64_t v49 = v101 - 1;
    uint64_t result = (uint64_t)memmove(v99, v99 + 2, 16 * (v101 - 1 - v52));
    *(void *)(v95 + 16) = v101 - 1;
    uint64_t v2 = v93;
    uint64_t v7 = v92;
    if (v101 <= 2) {
      goto LABEL_84;
    }
  }
LABEL_89:
  uint64_t result = swift_bridgeObjectRelease();
  if (v114 < -1) {
    goto LABEL_128;
  }
  *(void *)(v113 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D6A1318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (a3 == a2) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = a3;
  uint64_t v9 = 40 * a3 - 40;
  while (2)
  {
    uint64_t v10 = a1;
    uint64_t v41 = v9;
    do
    {
      uint64_t v11 = *a4 + v9;
      sub_25D6A2350(v11 + 40, (uint64_t)&v48);
      sub_25D6A2350(v11, (uint64_t)v45);
      uint64_t v12 = v49;
      uint64_t v13 = v50;
      __swift_project_boxed_opaque_existential_1(&v48, v49);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v42, v12, v13);
      uint64_t v14 = v43;
      uint64_t v15 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
      if (*(void *)(a5 + 16) && (unint64_t v18 = sub_25D6B89CC(v16, v17), (v19 & 1) != 0)) {
        uint64_t v20 = *(void *)(*(void *)(a5 + 56) + 8 * v18);
      }
      else {
        uint64_t v20 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      uint64_t v21 = v46;
      uint64_t v22 = v47;
      __swift_project_boxed_opaque_existential_1(v45, v46);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v22 + 8))(v42, v21, v22);
      uint64_t v23 = v43;
      uint64_t v24 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
      if (*(void *)(a5 + 16) && (unint64_t v27 = sub_25D6B89CC(v25, v26), (v28 & 1) != 0)) {
        uint64_t v29 = *(void *)(*(void *)(a5 + 56) + 8 * v27);
      }
      else {
        uint64_t v29 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      if (v20 == v29)
      {
        uint64_t v30 = v49;
        uint64_t v31 = v50;
        __swift_project_boxed_opaque_existential_1(&v48, v49);
        float v32 = (*(float (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
        uint64_t v33 = v46;
        uint64_t v34 = v47;
        __swift_project_boxed_opaque_existential_1(v45, v46);
        BOOL v35 = (*(float (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34) < v32;
      }
      else
      {
        BOOL v35 = v20 < v29;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
      if (!v35) {
        break;
      }
      uint64_t v36 = *a4;
      if (!*a4)
      {
        __break(1u);
        return result;
      }
      uint64_t v37 = v36 + v9;
      sub_25D69F75C((long long *)(v36 + v9 + 40), (uint64_t)&v48);
      long long v38 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)(v37 + 40) = *(_OWORD *)v37;
      *(_OWORD *)(v37 + 56) = v38;
      *(void *)(v37 + 72) = *(void *)(v37 + 32);
      sub_25D69F75C(&v48, v37);
      v9 -= 40;
      ++v10;
    }
    while (v8 != v10);
    ++v8;
    uint64_t v9 = v41 + 40;
    if (v8 != a2) {
      continue;
    }
    break;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D6A1608(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = result;
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v7 = 40 * a3 - 40;
    while (2)
    {
      uint64_t v8 = v26;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = *a4 + v9;
        sub_25D6A2350(v10 + 40, (uint64_t)&v23);
        sub_25D6A2350(v10, (uint64_t)v20);
        uint64_t v11 = v24;
        uint64_t v12 = v25;
        __swift_project_boxed_opaque_existential_1(&v23, v24);
        float v13 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12);
        uint64_t v14 = v21;
        uint64_t v15 = v22;
        __swift_project_boxed_opaque_existential_1(v20, v21);
        float v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
        if (v16 >= v13) {
          break;
        }
        uint64_t v17 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        uint64_t v18 = v17 + v9;
        sub_25D69F75C((long long *)(v17 + v9 + 40), (uint64_t)&v23);
        long long v19 = *(_OWORD *)(v18 + 16);
        *(_OWORD *)(v18 + 40) = *(_OWORD *)v18;
        *(_OWORD *)(v18 + 56) = v19;
        *(void *)(v18 + 72) = *(void *)(v18 + 32);
        uint64_t result = sub_25D69F75C(&v23, v18);
        v9 -= 40;
        ++v8;
      }
      while (v5 != v8);
      ++v5;
      v7 += 40;
      if (v5 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_25D6A1784(char *a1, char *a2, unint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v8 = a2;
  uint64_t v9 = a1;
  uint64_t v10 = a2 - a1;
  uint64_t v11 = (a2 - a1) / 40;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = (uint64_t)(a3 - (void)a2) / 40;
  if (v11 >= v13)
  {
    sub_25D6B7A40(a2, (uint64_t)(a3 - (void)a2) / 40, a4);
    uint64_t v81 = a4;
    uint64_t v14 = &a4[40 * v13];
    if (v9 >= v8 || v12 <= 39)
    {
LABEL_64:
      uint64_t v15 = v81;
      goto LABEL_65;
    }
    unint64_t v48 = a3 - 40;
    while (1)
    {
      uint64_t v82 = v14 - 40;
      sub_25D6A2350((uint64_t)(v14 - 40), (uint64_t)v91);
      uint64_t v49 = v8 - 40;
      sub_25D6A2350((uint64_t)(v8 - 40), (uint64_t)v88);
      uint64_t v51 = v92;
      uint64_t v50 = v93;
      __swift_project_boxed_opaque_existential_1(v91, v92);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v50 + 8))(v85, v51, v50);
      uint64_t v52 = v86;
      uint64_t v53 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53);
      uint64_t v84 = v14;
      if (*(void *)(a5 + 16) && (unint64_t v56 = sub_25D6B89CC(v54, v55), (v57 & 1) != 0)) {
        uint64_t v58 = *(void *)(*(void *)(a5 + 56) + 8 * v56);
      }
      else {
        uint64_t v58 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      uint64_t v59 = v89;
      uint64_t v60 = v90;
      __swift_project_boxed_opaque_existential_1(v88, v89);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v60 + 8))(v85, v59, v60);
      uint64_t v61 = v86;
      uint64_t v62 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v61, v62);
      if (*(void *)(a5 + 16) && (unint64_t v65 = sub_25D6B89CC(v63, v64), (v66 & 1) != 0)) {
        uint64_t v67 = *(void *)(*(void *)(a5 + 56) + 8 * v65);
      }
      else {
        uint64_t v67 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      if (v58 == v67)
      {
        uint64_t v68 = v92;
        uint64_t v69 = v93;
        __swift_project_boxed_opaque_existential_1(v91, v92);
        float v70 = (*(float (**)(uint64_t, uint64_t))(v69 + 16))(v68, v69);
        uint64_t v71 = v89;
        uint64_t v72 = v90;
        __swift_project_boxed_opaque_existential_1(v88, v89);
        BOOL v73 = (*(float (**)(uint64_t, uint64_t))(v72 + 16))(v71, v72) < v70;
      }
      else
      {
        BOOL v73 = v58 < v67;
      }
      uint64_t v14 = v84;
      uint64_t v74 = (char *)(v48 + 40);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      if (v73)
      {
        BOOL v75 = v74 != v8 || v48 >= (unint64_t)v8;
        v8 -= 40;
        if (!v75) {
          goto LABEL_60;
        }
      }
      else
      {
        BOOL v76 = v74 != v84 || v48 >= (unint64_t)v84;
        uint64_t v14 = v82;
        uint64_t v49 = v82;
        if (!v76) {
          goto LABEL_60;
        }
      }
      long long v77 = *(_OWORD *)v49;
      long long v78 = *((_OWORD *)v49 + 1);
      *(void *)(v48 + 32) = *((void *)v49 + 4);
      *(_OWORD *)unint64_t v48 = v77;
      *(_OWORD *)(v48 + 16) = v78;
LABEL_60:
      v48 -= 40;
      if (v14 <= v81 || v8 <= v9) {
        goto LABEL_64;
      }
    }
  }
  sub_25D6B7A40(a1, (a2 - a1) / 40, a4);
  uint64_t v14 = &a4[40 * v11];
  uint64_t v15 = a4;
  if ((unint64_t)v8 < a3 && v10 > 39)
  {
    unint64_t v83 = a3;
    do
    {
      unint64_t v16 = (unint64_t)v14;
      sub_25D6A2350((uint64_t)v8, (uint64_t)v91);
      sub_25D6A2350((uint64_t)v15, (uint64_t)v88);
      uint64_t v17 = v92;
      uint64_t v18 = v93;
      __swift_project_boxed_opaque_existential_1(v91, v92);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v18 + 8))(v85, v17, v18);
      uint64_t v19 = v86;
      uint64_t v20 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
      if (*(void *)(a5 + 16) && (unint64_t v23 = sub_25D6B89CC(v21, v22), (v24 & 1) != 0)) {
        uint64_t v25 = *(void *)(*(void *)(a5 + 56) + 8 * v23);
      }
      else {
        uint64_t v25 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      uint64_t v26 = v89;
      uint64_t v27 = v90;
      __swift_project_boxed_opaque_existential_1(v88, v89);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v27 + 8))(v85, v26, v27);
      uint64_t v28 = v86;
      uint64_t v29 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v29);
      if (*(void *)(a5 + 16) && (unint64_t v32 = sub_25D6B89CC(v30, v31), (v33 & 1) != 0)) {
        uint64_t v34 = *(void *)(*(void *)(a5 + 56) + 8 * v32);
      }
      else {
        uint64_t v34 = -1;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      if (v25 == v34)
      {
        uint64_t v35 = v92;
        uint64_t v36 = v93;
        __swift_project_boxed_opaque_existential_1(v91, v92);
        float v37 = (*(float (**)(uint64_t, uint64_t))(v36 + 16))(v35, v36);
        uint64_t v38 = v89;
        uint64_t v39 = v90;
        __swift_project_boxed_opaque_existential_1(v88, v89);
        BOOL v40 = (*(float (**)(uint64_t, uint64_t))(v39 + 16))(v38, v39) < v37;
      }
      else
      {
        BOOL v40 = v25 < v34;
      }
      uint64_t v14 = (char *)v16;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      if (v40)
      {
        BOOL v41 = v9 == v8;
        uint64_t v42 = v8;
        v8 += 40;
        if (v41 && v9 < v8) {
          goto LABEL_28;
        }
      }
      else
      {
        BOOL v41 = v9 == v15;
        uint64_t v42 = v15;
        v15 += 40;
        if (v41 && v9 < v15) {
          goto LABEL_28;
        }
      }
      long long v45 = *(_OWORD *)v42;
      long long v46 = *((_OWORD *)v42 + 1);
      *((void *)v9 + 4) = *((void *)v42 + 4);
      *(_OWORD *)uint64_t v9 = v45;
      *((_OWORD *)v9 + 1) = v46;
LABEL_28:
      v9 += 40;
    }
    while ((unint64_t)v15 < v16 && (unint64_t)v8 < v83);
  }
  uint64_t v8 = v9;
LABEL_65:
  sub_25D6B7A40(v15, (v14 - v15) / 40, v8);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_25D6A1D24(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 40;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 40;
  if (v9 >= v11)
  {
    sub_25D6B7A40(a2, (uint64_t)(a3 - (void)a2) / 40, a4);
    uint64_t v12 = &v4[40 * v11];
    if (v7 < v6 && v10 >= 40)
    {
      unint64_t v26 = a3 - 40;
      uint64_t v39 = v4;
      do
      {
        long long v46 = (char *)(v26 + 40);
        sub_25D6A2350((uint64_t)(v12 - 40), (uint64_t)v43);
        uint64_t v27 = v6 - 40;
        sub_25D6A2350((uint64_t)(v6 - 40), (uint64_t)v40);
        uint64_t v28 = v44;
        uint64_t v29 = v45;
        __swift_project_boxed_opaque_existential_1(v43, v44);
        float v30 = (*(float (**)(uint64_t, uint64_t))(v29 + 16))(v28, v29);
        uint64_t v31 = v41;
        uint64_t v32 = v42;
        __swift_project_boxed_opaque_existential_1(v40, v41);
        float v33 = (*(float (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
        if (v33 >= v30)
        {
          BOOL v34 = v46 != v12 || v26 >= (unint64_t)v12;
          uint64_t v27 = v12 - 40;
          v12 -= 40;
        }
        else
        {
          BOOL v34 = v46 != v6 || v26 >= (unint64_t)v6;
          v6 -= 40;
        }
        uint64_t v4 = v39;
        if (v34)
        {
          long long v35 = *(_OWORD *)v27;
          long long v36 = *((_OWORD *)v27 + 1);
          *(void *)(v26 + 32) = *((void *)v27 + 4);
          *(_OWORD *)unint64_t v26 = v35;
          *(_OWORD *)(v26 + 16) = v36;
        }
        v26 -= 40;
      }
      while (v12 > v39 && v6 > v7);
    }
  }
  else
  {
    sub_25D6B7A40(a1, (a2 - a1) / 40, a4);
    uint64_t v12 = &v4[40 * v9];
    if ((unint64_t)v6 >= a3 || v8 < 40)
    {
      uint64_t v6 = v7;
    }
    else
    {
      do
      {
        unint64_t v13 = (unint64_t)v12;
        sub_25D6A2350((uint64_t)v6, (uint64_t)v43);
        sub_25D6A2350((uint64_t)v4, (uint64_t)v40);
        uint64_t v14 = v44;
        uint64_t v15 = v45;
        __swift_project_boxed_opaque_existential_1(v43, v44);
        float v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        uint64_t v17 = v41;
        uint64_t v18 = v42;
        __swift_project_boxed_opaque_existential_1(v40, v41);
        float v19 = (*(float (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
        if (v19 >= v16)
        {
          BOOL v20 = v7 == v4;
          uint64_t v21 = v4;
          v4 += 40;
          BOOL v22 = !v20 || v7 >= v4;
        }
        else
        {
          BOOL v20 = v7 == v6;
          uint64_t v21 = v6;
          v6 += 40;
          BOOL v22 = !v20 || v7 >= v6;
        }
        uint64_t v12 = (char *)v13;
        if (v22)
        {
          long long v23 = *(_OWORD *)v21;
          long long v24 = *((_OWORD *)v21 + 1);
          *((void *)v7 + 4) = *((void *)v21 + 4);
          *(_OWORD *)uint64_t v7 = v23;
          *((_OWORD *)v7 + 1) = v24;
        }
        v7 += 40;
      }
      while ((unint64_t)v4 < v13 && (unint64_t)v6 < a3);
      uint64_t v6 = v7;
    }
  }
  sub_25D6B7A40(v4, (v12 - v4) / 40, v6);
  return 1;
}

char *sub_25D6A2010(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5A0);
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
  unint64_t v13 = a4 + 32;
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

char *sub_25D6A2108(uint64_t a1)
{
  return sub_25D6A2010(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25D6A211C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_25D69F75C(&v12, v10 + 40 * a1 + 32);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
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

uint64_t sub_25D6A226C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6A22D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL sub_25D6A2330(void *a1)
{
  return sub_25D69D228(a1, *(void **)(v1 + 16));
}

uint64_t sub_25D6A2350(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25D6A23B4()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_25D6A23C4@<X0>(uint64_t a1@<X8>)
{
  return sub_25D6BA874(*(unsigned int *)(v1 + 16), a1);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x2611B1630);
}

char *OUTLINED_FUNCTION_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 72) = a1;
  return sub_25D6B8360(0, 0, 0);
}

BOOL OUTLINED_FUNCTION_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_willThrow();
}

float *OUTLINED_FUNCTION_9(float *result, float a2)
{
  *uint64_t result = a2;
  return result;
}

char *OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>)
{
  return sub_25D6B8360(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_25D6C30B0();
}

uint64_t sub_25D6A2518(uint64_t a1)
{
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = sub_25D6C2BC0();
  MEMORY[0x270FA5388](v7 - 8, v8);
  OUTLINED_FUNCTION_1_1();
  type metadata accessor for Siri_Nlg_Model(0);
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_1_1();
  uint64_t v28 = v11;
  uint64_t v12 = sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_7_0();
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_25D6C2DE0();
  __swift_project_value_buffer(v17, (uint64_t)qword_26A691DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v4, a1, v12);
  uint64_t v18 = sub_25D6C2DC0();
  os_log_type_t v19 = sub_25D6C3040();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v3 = (void (*)(void))(v20 + 12);
    sub_25D6A380C((unint64_t *)&qword_26A68F5D8, MEMORY[0x263F06EA8]);
    uint64_t v21 = sub_25D6C3220();
    sub_25D6C05EC(v21, v22, &v30);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    uint64_t v23 = OUTLINED_FUNCTION_9_0();
    ((void (*)(uint64_t))(v20 + 12))(v23);
    OUTLINED_FUNCTION_8_0(&dword_25D698000, v24, v25, "Loading JSON file from %s");
    swift_arrayDestroy();
    uint64_t v5 = v2;
    OUTLINED_FUNCTION_10_0();
    uint64_t v6 = v1;
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    uint64_t v26 = OUTLINED_FUNCTION_9_0();
    ((void (*)(uint64_t))v3)(v26);
  }

  sub_25D6C2930();
  if (v5)
  {
    OUTLINED_FUNCTION_3_0();
    v3();
    type metadata accessor for SerializedDialogSelectionModel();
    OUTLINED_FUNCTION_2_0();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D6C2BB0();
    sub_25D6A380C(&qword_26A68F5D0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
    sub_25D6C2CA0();
    OUTLINED_FUNCTION_3_0();
    v3();
    sub_25D6A37A8(v28, v6 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  }
  return v6;
}

uint64_t sub_25D6A28AC(uint64_t a1)
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  uint64_t v39 = a1;
  uint64_t v6 = sub_25D6C2BE0();
  MEMORY[0x270FA5388](v6 - 8, v7);
  OUTLINED_FUNCTION_1_1();
  uint64_t v36 = v8;
  uint64_t v35 = type metadata accessor for Siri_Nlg_Model(0);
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16, v17);
  OUTLINED_FUNCTION_7_0();
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25D6C2DE0();
  __swift_project_value_buffer(v18, (uint64_t)qword_26A691DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v3, v39, v13);
  os_log_type_t v19 = sub_25D6C2DC0();
  os_log_type_t v20 = sub_25D6C3040();
  BOOL v21 = os_log_type_enabled(v19, v20);
  float v37 = v12;
  uint64_t v38 = v15;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v34 = v1;
    uint64_t v23 = v22;
    *(void *)&v40[0] = swift_slowAlloc();
    uint64_t v33 = v2;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v15 = v23 + 12;
    uint64_t v32 = v23 + 4;
    sub_25D6A380C((unint64_t *)&qword_26A68F5D8, MEMORY[0x263F06EA8]);
    uint64_t v24 = sub_25D6C3220();
    uint64_t v42 = sub_25D6C05EC(v24, v25, (uint64_t *)v40);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    uint64_t v4 = v33;
    uint64_t v26 = OUTLINED_FUNCTION_12();
    ((void (*)(uint64_t))(v23 + 12))(v26);
    OUTLINED_FUNCTION_8_0(&dword_25D698000, v27, v28, "Loading binary file from %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    uint64_t v5 = v34;
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    uint64_t v29 = OUTLINED_FUNCTION_12();
    ((void (*)(uint64_t))v15)(v29);
  }

  sub_25D6C2930();
  if (v4)
  {
    OUTLINED_FUNCTION_3_0();
    ((void (*)(void))v15)();
    type metadata accessor for SerializedDialogSelectionModel();
    OUTLINED_FUNCTION_2_0();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v41 = 0;
    memset(v40, 0, sizeof(v40));
    sub_25D6C2BD0();
    sub_25D6A380C(&qword_26A68F5D0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
    uint64_t v30 = (uint64_t)v37;
    sub_25D6C2CC0();
    OUTLINED_FUNCTION_3_0();
    ((void (*)(void))v15)();
    sub_25D6A37A8(v30, v5 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  }
  return v5;
}

uint64_t sub_25D6A2C6C()
{
  uint64_t v109 = type metadata accessor for Siri_Nlg_Content(0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v113 = v1;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = type metadata accessor for Siri_Nlg_Dialog(0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v102 = v6;
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v105 = (uint64_t *)v9;
  uint64_t v88 = type metadata accessor for Siri_Nlg_DialogSwitch(0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v90 = v10;
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_1_1();
  uint64_t v95 = (uint64_t *)v13;
  uint64_t v81 = type metadata accessor for Siri_Nlg_CATFile(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v14, v15);
  OUTLINED_FUNCTION_1_1();
  uint64_t v89 = v17;
  uint64_t v18 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model;
  uint64_t v107 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model;
  uint64_t v19 = *(void *)(v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t v78 = *(void *)(*(void *)v18 + 16);
  if (!v78) {
    return v20;
  }
  uint64_t v83 = v16;
  uint64_t v82 = v19 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  swift_bridgeObjectRetain();
  unint64_t v21 = 0;
  uint64_t v104 = v20;
  uint64_t v22 = v89;
  uint64_t v106 = v5;
  uint64_t v76 = v19;
  while (1)
  {
    if (v21 >= *(void *)(v19 + 16)) {
      goto LABEL_59;
    }
    OUTLINED_FUNCTION_11_0();
    uint64_t v79 = v23;
    sub_25D6A3854(v82 + v24 * v23, v22, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
    uint64_t v25 = *(void *)v22;
    uint64_t v80 = *(void *)(*(void *)v22 + 16);
    if (v80) {
      break;
    }
LABEL_52:
    unint64_t v73 = v79 + 1;
    sub_25D6A3950(v22, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
    unint64_t v21 = v73;
    if (v73 == v78)
    {
      swift_bridgeObjectRelease();
      return v104;
    }
  }
  uint64_t v26 = *(int *)(v81 + 28);
  uint64_t v87 = (uint64_t *)(v22 + *(int *)(v81 + 24));
  uint64_t v86 = (uint64_t *)(v22 + v26);
  uint64_t v85 = v25 + ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80));
  uint64_t v27 = swift_bridgeObjectRetain();
  unint64_t v28 = 0;
  uint64_t v77 = v27;
  while (1)
  {
    if (v28 >= *(void *)(v27 + 16)) {
      goto LABEL_58;
    }
    OUTLINED_FUNCTION_11_0();
    uint64_t v84 = v29;
    sub_25D6A3854(v85 + v30 * v29, (uint64_t)v95, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
    unint64_t v31 = v87[1];
    if (v31)
    {
      uint64_t v98 = *v87;
      unint64_t v101 = v31;
    }
    else
    {
      uint64_t v98 = 0;
      unint64_t v101 = 0xE000000000000000;
    }
    unint64_t v32 = v86[1];
    if (v32)
    {
      uint64_t v97 = *v86;
      unint64_t v100 = v32;
    }
    else
    {
      uint64_t v97 = 0;
      unint64_t v100 = 0xE000000000000000;
    }
    uint64_t v33 = (uint64_t *)((char *)v95 + *(int *)(v88 + 24));
    unint64_t v34 = v33[1];
    if (v34)
    {
      uint64_t v96 = *v33;
      unint64_t v99 = v34;
    }
    else
    {
      uint64_t v96 = 0;
      unint64_t v99 = 0xE000000000000000;
    }
    uint64_t v35 = *v95;
    uint64_t v92 = *(void *)(*v95 + 16);
    if (v92) {
      break;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_49:
    unint64_t v71 = v84 + 1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25D6A3950((uint64_t)v95, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
    unint64_t v28 = v71;
    BOOL v72 = v71 == v80;
    uint64_t v22 = v89;
    uint64_t v19 = v76;
    uint64_t v27 = v77;
    if (v72)
    {
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
  }
  OUTLINED_FUNCTION_6_0();
  uint64_t v93 = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v37 = 0;
  uint64_t v91 = v35;
  while (1)
  {
    if (v37 >= *(void *)(v35 + 16)) {
      goto LABEL_57;
    }
    OUTLINED_FUNCTION_11_0();
    uint64_t v103 = v38;
    uint64_t v40 = (uint64_t)v105;
    sub_25D6A3854(v93 + v39 * v38, (uint64_t)v105, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
    type metadata accessor for NLGDialogBuilder();
    swift_initStackObject();
    NLGDialogBuilder.init()();
    uint64_t v41 = (uint64_t *)(v40 + *(int *)(v94 + 24));
    if (v41[1])
    {
      uint64_t v42 = *v41;
      uint64_t v43 = v41[1];
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v43 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D6B2970(v42, v43);
    swift_bridgeObjectRelease();
    *(void *)&long long v116 = v98;
    *((void *)&v116 + 1) = v101;
    uint64_t v117 = v97;
    unint64_t v118 = v100;
    uint64_t v119 = v96;
    unint64_t v120 = v99;
    uint64_t v108 = sub_25D6B2E90(&v116);
    swift_release();
    uint64_t v44 = *v105;
    uint64_t v112 = *(void *)(*v105 + 16);
    if (v112) {
      break;
    }
LABEL_41:
    sub_25D6B2F08((uint64_t *)&v116);
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v65 = v104;
    }
    else
    {
      sub_25D6B3F20(0, *(void *)(v104 + 16) + 1, 1, v104);
      uint64_t v65 = v69;
    }
    unint64_t v67 = *(void *)(v65 + 16);
    unint64_t v66 = *(void *)(v65 + 24);
    if (v67 >= v66 >> 1)
    {
      sub_25D6B3F20(v66 > 1, v67 + 1, 1, v65);
      uint64_t v65 = v70;
    }
    unint64_t v68 = v103 + 1;
    *(void *)(v65 + 16) = v67 + 1;
    uint64_t v104 = v65;
    sub_25D69F75C(&v116, v65 + 40 * v67 + 32);
    swift_release();
    sub_25D6A3950((uint64_t)v105, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
    unint64_t v37 = v68;
    uint64_t v35 = v91;
    if (v68 == v92) {
      goto LABEL_49;
    }
  }
  OUTLINED_FUNCTION_6_0();
  uint64_t v111 = v45;
  swift_bridgeObjectRetain();
  unint64_t v46 = 0;
  uint64_t v110 = v44;
  while (1)
  {
    if (v46 >= *(void *)(v44 + 16))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
      JUMPOUT(0x25D6A363CLL);
    }
    OUTLINED_FUNCTION_11_0();
    sub_25D6A3854(v111 + v47 * v46, (uint64_t)v5, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
    uint64_t v48 = *(void *)v5;
    int64_t v49 = *(void *)(*(void *)v5 + 16);
    if (v49) {
      break;
    }
    uint64_t v51 = v20;
LABEL_33:
    ++v46;
    *(void *)&long long v116 = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5E0);
    sub_25D6A38B4();
    sub_25D6C2E50();
    swift_bridgeObjectRelease();
    switch(v5[*(int *)(v109 + 24)])
    {
      case 1:
        swift_bridgeObjectRetain();
        uint64_t v59 = OUTLINED_FUNCTION_4_0();
        sub_25D6B297C(v59, v60);
        goto LABEL_38;
      case 2:
        swift_bridgeObjectRetain();
        uint64_t v61 = OUTLINED_FUNCTION_4_0();
        sub_25D6B2988(v61, v62);
        goto LABEL_38;
      case 3:
        swift_bridgeObjectRetain();
        uint64_t v63 = OUTLINED_FUNCTION_4_0();
        sub_25D6B2994(v63, v64);
LABEL_38:
        uint64_t v44 = v110;
        swift_bridgeObjectRelease();
        sub_25D6A3950((uint64_t)v5, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
        break;
      default:
        sub_25D6A3950((uint64_t)v5, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
        swift_bridgeObjectRelease();
        uint64_t v44 = v110;
        break;
    }
    if (v46 == v112)
    {
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
  }
  unint64_t v114 = v46;
  *(void *)&long long v116 = v20;
  swift_bridgeObjectRetain();
  sub_25D6B82D0(0, v49, 0);
  uint64_t v50 = 0;
  uint64_t v51 = v116;
  uint64_t v115 = *(void *)(v107 + 8);
  uint64_t v20 = v115 + 32;
  while (1)
  {
    unint64_t v52 = *(unsigned int *)(v48 + 4 * v50 + 32);
    if (*(void *)(v115 + 16) <= v52) {
      break;
    }
    uint64_t v53 = (uint64_t *)(v20 + 16 * v52);
    uint64_t v55 = *v53;
    uint64_t v54 = v53[1];
    *(void *)&long long v116 = v51;
    unint64_t v57 = *(void *)(v51 + 16);
    unint64_t v56 = *(void *)(v51 + 24);
    swift_bridgeObjectRetain();
    if (v57 >= v56 >> 1)
    {
      sub_25D6B82D0((char *)(v56 > 1), v57 + 1, 1);
      uint64_t v51 = v116;
    }
    ++v50;
    *(void *)(v51 + 16) = v57 + 1;
    unint64_t v58 = v51 + 16 * v57;
    *(void *)(v58 + 32) = v55;
    *(void *)(v58 + 40) = v54;
    if (v49 == v50)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = v106;
      uint64_t v20 = MEMORY[0x263F8EE78];
      unint64_t v46 = v114;
      goto LABEL_33;
    }
  }
  __break(1u);
  return v20;
}

uint64_t sub_25D6A3650()
{
  sub_25D6A3950(v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model, (void (*)(void))type metadata accessor for Siri_Nlg_Model);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25D6A36C8()
{
  return type metadata accessor for SerializedDialogSelectionModel();
}

uint64_t type metadata accessor for SerializedDialogSelectionModel()
{
  uint64_t result = qword_26A68F5C0;
  if (!qword_26A68F5C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D6A3718()
{
  uint64_t result = type metadata accessor for Siri_Nlg_Model(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25D6A37A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6A380C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D6A3854(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_25D6A38B4()
{
  unint64_t result = qword_26A68F5E8;
  if (!qword_26A68F5E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A68F5E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F5E8);
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

uint64_t sub_25D6A3950(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

void OUTLINED_FUNCTION_10_0()
{
  JUMPOUT(0x2611B1630);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t sub_25D6A3AC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7 = sub_25D6C2DB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = a4;
  sub_25D6C2DA0();
  sub_25D6C3070();
  OUTLINED_FUNCTION_2_1();
  __swift_project_boxed_opaque_existential_1((void *)(a5 + 40), *(void *)(a5 + 64));
  uint64_t v15 = sub_25D6BDEEC(*(void *)(a5 + 16), *(void *)(a5 + 24), *(void **)(a5 + 32));
  sub_25D6C3060();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v7);
  swift_release();
  return v15;
}

uint64_t sub_25D6A3BD8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v10 = sub_25D6C2DB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13, v14);
  OUTLINED_FUNCTION_3_1();
  id v15 = a4;
  sub_25D6C2DA0();
  sub_25D6C3070();
  OUTLINED_FUNCTION_4_1();
  swift_retain();
  uint64_t v16 = sub_25D6A3E1C(a5, a6);
  sub_25D6C3060();
  OUTLINED_FUNCTION_4_1();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v6, v10);
  swift_release();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_25D6A3CF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = sub_25D6C2DB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13, v14);
  OUTLINED_FUNCTION_3_1();
  id v15 = a4;
  sub_25D6C2DA0();
  sub_25D6C3070();
  OUTLINED_FUNCTION_5_1();
  uint64_t v16 = sub_25D69B02C(a6);
  uint64_t v17 = sub_25D69B23C(v16, a7);
  swift_bridgeObjectRelease();
  sub_25D6C3060();
  OUTLINED_FUNCTION_5_1();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v7, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v17;
}

uint64_t sub_25D6A3E1C(uint64_t a1, void *a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25D6B82F0(0, v3, 0);
    uint64_t v5 = v14;
    uint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      __swift_project_boxed_opaque_existential_1(a2 + 5, a2[8]);
      uint64_t v9 = (void *)a2[4];
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_25D6BDEEC(v7, v8, v9);
      swift_bridgeObjectRelease();
      unint64_t v12 = *(void *)(v14 + 16);
      unint64_t v11 = *(void *)(v14 + 24);
      if (v12 >= v11 >> 1) {
        sub_25D6B82F0((char *)(v11 > 1), v12 + 1, 1);
      }
      v6 += 2;
      *(void *)(v14 + 16) = v12 + 1;
      *(void *)(v14 + 8 * v12 + 32) = v10;
      --v3;
    }
    while (v3);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return v5;
}

uint64_t sub_25D6A3F58()
{
  uint64_t v0 = sub_25D6C2DE0();
  __swift_allocate_value_buffer(v0, qword_26A691DB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691DB8);
  OUTLINED_FUNCTION_1_2();
  return sub_25D6C2DD0();
}

uint64_t sub_25D6A3FB8()
{
  sub_25D6A4000();
  OUTLINED_FUNCTION_1_2();
  uint64_t result = sub_25D6C3080();
  qword_26A691DD0 = result;
  return result;
}

unint64_t sub_25D6A4000()
{
  unint64_t result = qword_26A68F5F0[0];
  if (!qword_26A68F5F0[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26A68F5F0);
  }
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

unint64_t OUTLINED_FUNCTION_1_2()
{
  return 0xD000000000000012;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_25D6C2D90();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_25D6C2D90();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_25D6C2D90();
}

uint64_t sub_25D6A4154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6A0);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25D6C2A60();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  uint64_t v11 = MEMORY[0x270FA5388](v9, v10);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v11, v14);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  unint64_t v21 = (char *)&v50 - v20;
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v24 = (char *)&v50 - v23;
  sub_25D6C2B30();
  if (sub_25D6C2B20())
  {
    sub_25D6C2B10();
    swift_release();
    sub_25D6C2B40();
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
    if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1)
    {
      uint64_t v25 = *(uint8_t **)(v8 + 32);
      ((void (*)(char *, char *, uint64_t))v25)(v24, v5, v6);
      if (qword_26A68F470 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_25D6C2DE0();
      __swift_project_value_buffer(v26, (uint64_t)qword_26A691DB8);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v21, v24, v6);
      uint64_t v27 = sub_25D6C2DC0();
      os_log_type_t v28 = sub_25D6C3040();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v53 = a1;
        uint64_t v30 = (uint8_t *)v29;
        uint64_t v51 = swift_slowAlloc();
        uint64_t v54 = v51;
        unint64_t v52 = v25;
        *(_DWORD *)uint64_t v30 = 136315138;
        uint64_t v50 = v30 + 4;
        sub_25D6A6478();
        uint64_t v31 = sub_25D6C3220();
        uint64_t v33 = sub_25D6C05EC(v31, v32, &v54);
        OUTLINED_FUNCTION_5_2(v33);
        uint64_t v25 = v52;
        sub_25D6C30B0();
        swift_bridgeObjectRelease();
        uint64_t v34 = OUTLINED_FUNCTION_4_2();
        v35(v34);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_10_0();
        a1 = v53;
        OUTLINED_FUNCTION_10_0();
      }
      else
      {
        uint64_t v48 = OUTLINED_FUNCTION_4_2();
        v49(v48);
      }

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(a1, v24, v6);
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  }
  sub_25D6A22D4((uint64_t)v5, &qword_26A68F6A0);
  sub_25D6C2A20();
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_25D6C2DE0();
  __swift_project_value_buffer(v36, (uint64_t)qword_26A691DB8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v17, v6);
  unint64_t v37 = sub_25D6C2DC0();
  os_log_type_t v38 = sub_25D6C3050();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    uint64_t v53 = a1;
    *(_DWORD *)uint64_t v39 = 136315138;
    unint64_t v52 = v39 + 4;
    sub_25D6A6478();
    uint64_t v40 = sub_25D6C3220();
    uint64_t v42 = sub_25D6C05EC(v40, v41, &v54);
    OUTLINED_FUNCTION_5_2(v42);
    a1 = v53;
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    uint64_t v43 = OUTLINED_FUNCTION_2_2();
    v44(v43);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    uint64_t v45 = OUTLINED_FUNCTION_2_2();
    v46(v45);
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v17, v6);
}

uint64_t *sub_25D6A4670(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = *v11;
  uint64_t v14 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v16 = a1[2];
  uint64_t v15 = a1[3];
  v11[2] = *a1;
  v11[3] = v13;
  v11[4] = v16;
  v11[5] = v15;
  v11[6] = a2;
  v11[7] = a3;
  v11[8] = a4;
  v11[9] = a5;
  v11[10] = a6;
  v11[11] = a7;
  v11[12] = a8;
  v11[13] = a9;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v18 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v20 = (void *)swift_allocObject();
  if (a10)
  {
    v20[2] = a10;
    void v20[3] = a11;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v21 = sub_25D6A6324;
  }
  else
  {
    v20[2] = v19;
    void v20[3] = v14;
    v20[4] = v13;
    v20[5] = v16;
    v20[6] = v15;
    v20[7] = v12;
    unint64_t v21 = sub_25D6A62D4;
  }
  uint64_t v22 = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = v20;
  v11[14] = (uint64_t)sub_25D6A631C;
  v11[15] = v23;
  return v11;
}

id sub_25D6A47F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = *a2;
  v13[0] = a4;
  v13[1] = a5;
  v13[2] = a6;
  v13[3] = a7;
  id result = sub_25D6A484C(a3, v13, v10, v11);
  *a8 = result;
  return result;
}

id sub_25D6A484C(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  uint64_t v46 = sub_25D6C28B0();
  uint64_t v6 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46, v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v12, v15);
  uint64_t v18 = (char *)&v46 - v17;
  uint64_t v20 = MEMORY[0x270FA5388](v16, v19);
  uint64_t v22 = (char *)&v46 - v21;
  MEMORY[0x270FA5388](v20, v23);
  uint64_t v25 = (char *)&v46 - v24;
  unint64_t v26 = a2[1];
  uint64_t v47 = *a2;
  uint64_t v27 = a2[2];
  uint64_t v50 = a1;
  uint64_t v51 = v27;
  id v28 = objc_msgSend(a1, sel_resourceURL);
  if (v28)
  {
    uint64_t v29 = v28;
    sub_25D6C28E0();

    uint64_t v30 = sub_25D6C2920();
    uint64_t v31 = (uint64_t)v18;
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v30 = sub_25D6C2920();
    uint64_t v31 = (uint64_t)v18;
    uint64_t v32 = 1;
  }
  __swift_storeEnumTagSinglePayload(v31, v32, 1, v30);
  sub_25D6A635C((uint64_t)v18, (uint64_t)v22);
  sub_25D6C2920();
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v30) == 1)
  {
    sub_25D6A22D4((uint64_t)v22, &qword_26A68F690);
    uint64_t v33 = 1;
  }
  else
  {
    uint64_t v52 = 0x6574616C706D6554;
    unint64_t v53 = 0xE900000000000073;
    uint64_t v34 = v46;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F06E50], v46);
    sub_25D6A642C();
    sub_25D6C2910();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(*(void *)(v30 - 8) + 8))(v22, v30);
    uint64_t v33 = 0;
  }
  uint64_t v35 = v50;
  uint64_t v36 = v48;
  __swift_storeEnumTagSinglePayload((uint64_t)v25, v33, 1, v30);
  sub_25D6A63C4((uint64_t)v25, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v30) == 1)
  {
    unint64_t v37 = 0;
  }
  else
  {
    unint64_t v37 = (void *)sub_25D6C28C0();
    (*(void (**)(char *, uint64_t))(*(void *)(v30 - 8) + 8))(v14, v30);
  }
  uint64_t v38 = v47;
  uint64_t v39 = self;
  uint64_t v52 = v38;
  unint64_t v53 = v26;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v40 = (void *)sub_25D6C2E70();
  swift_bridgeObjectRelease();
  sub_25D6B5A88(v36);
  unint64_t v41 = (void *)sub_25D6C2DF0();
  swift_bridgeObjectRelease();
  uint64_t v42 = (void *)sub_25D6C2DF0();
  LODWORD(v45) = 0;
  id v43 = objc_msgSend(v39, sel_execute_templateDir_catId_parameters_globals_callback_options_, v35, v37, v40, v41, v42, 0, v45);

  sub_25D6A22D4((uint64_t)v25, &qword_26A68F690);
  return v43;
}

uint64_t sub_25D6A4CE8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t *, uint64_t *))
{
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  a3(&v4, &v6, &v5);
  return v4;
}

uint64_t sub_25D6A4D2C@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F678);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25D6C3C70;
  uint64_t v4 = v1[6];
  uint64_t v5 = v1[7];
  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v5;
  uint64_t v6 = v1[9];
  *(void *)(inited + 48) = v1[8];
  *(void *)(inited + 56) = v6;
  uint64_t v7 = v1[10];
  uint64_t v8 = v1[11];
  *(void *)(inited + 64) = v7;
  *(void *)(inited + 72) = v8;
  uint64_t v9 = v1[13];
  *(void *)(inited + 80) = v1[12];
  *(void *)(inited + 88) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25D6C2E20();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25D6B2744(v4, v5, v10);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_25D6B2744(v7, v8, v10);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (!v13)
  {
    if (!v16) {
      goto LABEL_13;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!v16) {
    goto LABEL_10;
  }
  if (v11 != v14 || v13 != v16)
  {
    char v18 = sub_25D6C3230();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_13;
    }
LABEL_11:
    sub_25D6B5E2C(v10);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    sub_25D6A50C8(v20, a1);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_25D6C2DE0();
  __swift_project_value_buffer(v22, (uint64_t)qword_26A691DB8);
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25D6C2DC0();
  os_log_type_t v24 = sub_25D6C3050();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v31 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_25D6C2E10();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    sub_25D6C05EC(v27, v29, &v31);
    sub_25D6C30B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D698000, v23, v24, "Unable to generate unambiguous dialog using %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611B1630](v26, -1, -1);
    MEMORY[0x2611B1630](v25, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_25D6A6240();
  swift_allocError();
  *(void *)uint64_t v30 = 0xD000000000000016;
  *(void *)(v30 + 8) = 0x800000025D6C5A10;
  *(unsigned char *)(v30 + 16) = 0;
  return swift_willThrow();
}

void sub_25D6A50C8(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F678);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25D6C3C80;
  *(void *)(inited + 32) = 0x656C61636F6CLL;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = sub_25D6C29C0();
  *(void *)(inited + 56) = v6;
  uint64_t v7 = sub_25D6C2E20();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 112);
  sub_25D6B5E2C(v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)v8(a1, v10);
  swift_bridgeObjectRelease();
  type metadata accessor for NLGDialogBuilder();
  swift_initStackObject();
  id v12 = objc_msgSend(v11, sel_dialog, NLGDialogBuilder.init()());
  sub_25D6A6200();
  unint64_t v13 = sub_25D6C2FD0();

  if (!(v13 >> 62))
  {
    if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    sub_25D6A6240();
    swift_allocError();
    *(void *)uint64_t v25 = 0xD000000000000019;
    *(void *)(v25 + 8) = 0x800000025D6C59F0;
    *(unsigned char *)(v25 + 16) = 1;
    swift_willThrow();
    swift_release();
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_25D6C3180();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x2611B0F40](0, v13);
    goto LABEL_6;
  }
  if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(v13 + 32);
LABEL_6:
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v15, sel_id);
    uint64_t v17 = sub_25D6C2E80();
    uint64_t v19 = v18;

    swift_bridgeObjectRetain();
    sub_25D6B2970(v17, v19);
    swift_retain();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v15, sel_fullPrint);
    uint64_t v21 = sub_25D6C2E80();
    uint64_t v23 = v22;

    swift_bridgeObjectRetain();
    sub_25D6B297C(v21, v23);
    swift_bridgeObjectRelease();
    sub_25D6B2F08(a2);

    swift_release_n();
LABEL_9:

    return;
  }
  __break(1u);
}

uint64_t sub_25D6A5398()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_25D6A53FC()
{
  sub_25D6A5398();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for AlternativeQuestionGenerator()
{
  return self;
}

void *sub_25D6A5458(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v11 + 16))(v28, v10, v11);
  uint64_t v12 = v29;
  uint64_t v13 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  uint64_t v16 = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  uint64_t v17 = a2[3];
  uint64_t v18 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v17);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v18 + 16))(v28, v17, v18);
  uint64_t v19 = v29;
  uint64_t v20 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
  uint64_t v23 = v22;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  uint64_t v5[2] = a3;
  v5[3] = a4;
  OUTLINED_FUNCTION_1_3();
  v28[0] = v24;
  v28[1] = v25;
  long long v28[2] = 0xD000000000000021;
  uint64_t v29 = 0x800000025D6C5AC0;
  type metadata accessor for AlternativeQuestionGenerator();
  uint64_t v26 = swift_allocObject();
  sub_25D6A4670(v28, 0x7265567473726966, 0xEF65736172685062, v14, v16, 0xD000000000000010, 0x800000025D6C5AA0, v21, v23, 0, 0);
  sub_25D6A64C8((uint64_t)a2);
  sub_25D6A64C8((uint64_t)a1);
  v5[4] = v26;
  return v5;
}

uint64_t sub_25D6A5644@<X0>(uint64_t *a1@<X8>)
{
  return sub_25D6A5830(a1);
}

uint64_t sub_25D6A565C()
{
  sub_25D6A5908();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for VerbPhraseQuestionGenerator()
{
  return self;
}

uint64_t sub_25D6A56B4@<X0>(uint64_t *a1@<X8>)
{
  return sub_25D6A5644(a1);
}

void *sub_25D6A56D8(unsigned char *a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (*a1)
  {
    if (*a1 == 1)
    {
      uint64_t v6 = 0xE400000000000000;
      uint64_t v7 = 1701670760;
    }
    else
    {
      uint64_t v6 = 0xE500000000000000;
      uint64_t v7 = 0x656E6F6870;
    }
  }
  else
  {
    uint64_t v6 = 0xE300000000000000;
    uint64_t v7 = 7496035;
  }
  unint64_t v8 = 0xE400000000000000;
  uint64_t v9 = 1701670760;
  if (*a2 != 1)
  {
    uint64_t v9 = 0x656E6F6870;
    unint64_t v8 = 0xE500000000000000;
  }
  if (*a2) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 7496035;
  }
  if (*a2) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0xE300000000000000;
  }
  uint64_t v5[2] = a3;
  v5[3] = a4;
  OUTLINED_FUNCTION_1_3();
  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 0xD00000000000002BLL;
  v16[3] = 0x800000025D6C5A70;
  type metadata accessor for AlternativeQuestionGenerator();
  uint64_t v14 = swift_allocObject();
  sub_25D6A4670(v16, 0xD000000000000019, 0x800000025D6C5A30, v7, v6, 0xD00000000000001ALL, 0x800000025D6C5A50, v10, v11, 0, 0);
  v5[4] = v14;
  return v5;
}

uint64_t sub_25D6A5830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_25D6C2A60();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v1 + 16))(v8);
  sub_25D6A4D2C(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v3);
}

uint64_t sub_25D6A5908()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for ExecutionDestinationQuestionGenerator()
{
  return self;
}

uint64_t sub_25D6A5954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_25D6A595C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25D6A59F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_25D6A5B00(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_25D6A5B74(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_25D6A5C04(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_25D6A5C9C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_25D6A5D0C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_25D6A5D94(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 16) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_25D6A5F4C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x25D6A6198);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v20 = (unint64_t)&a1[v10 + 16] & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for CATParameter()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_25D6A6200()
{
  unint64_t result = qword_26A68F680;
  if (!qword_26A68F680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A68F680);
  }
  return result;
}

unint64_t sub_25D6A6240()
{
  unint64_t result = qword_26A68F688;
  if (!qword_26A68F688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F688);
  }
  return result;
}

uint64_t sub_25D6A628C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

id sub_25D6A62D4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return sub_25D6A47F8(a1, a2, *(void **)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), a3);
}

uint64_t sub_25D6A62E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25D6A631C(uint64_t a1, uint64_t a2)
{
  return sub_25D6A4CE8(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_25D6A6324@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v3 + 16))(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D6A635C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6A63C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D6A642C()
{
  unint64_t result = qword_26A68F698;
  if (!qword_26A68F698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F698);
  }
  return result;
}

unint64_t sub_25D6A6478()
{
  unint64_t result = qword_26A68F6A8;
  if (!qword_26A68F6A8)
  {
    sub_25D6C2A60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F6A8);
  }
  return result;
}

uint64_t sub_25D6A64C8(uint64_t a1)
{
  return a1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25D6A6554@<X0>(uint64_t *a1@<X8>)
{
  return sub_25D6A56B4(a1);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

unint64_t sub_25D6A65D0(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = (unint64_t)v2;
  v48[0] = 46;
  uint64_t v47 = v48;
  swift_bridgeObjectRetain_n();
  uint64_t v6 = (void *)sub_25D6B0E04(0x7FFFFFFFFFFFFFFFLL, 1u, sub_25D6A79FC, (uint64_t)v46, a1, a2);
  swift_bridgeObjectRelease();
  if (v6[2] != 3 || !((v6[5] ^ v6[4]) >> 14)) {
    goto LABEL_22;
  }
  unint64_t v7 = OUTLINED_FUNCTION_3_2();
  uint64_t v12 = sub_25D6A74DC(v7, v8, v9, v10, v11);
  if ((v13 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = OUTLINED_FUNCTION_3_2();
    unint64_t v3 = (unint64_t)sub_25D6A6C70(v14, v15, v16, v17, v18);
    char v20 = v19;
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v13) {
      goto LABEL_22;
    }
    unint64_t v3 = v12;
  }
  if (v6[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (!((v6[9] ^ v6[8]) >> 14))
  {
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    sub_25D6A7A1C();
    swift_allocError();
    *uint64_t v44 = a1;
    v44[1] = a2;
    swift_willThrow();
    return v3;
  }
  unint64_t v21 = OUTLINED_FUNCTION_2_3();
  uint64_t v26 = sub_25D6A74DC(v21, v22, v23, v24, v25);
  v48[3] = v2;
  if ((v27 & 0x100) == 0)
  {
    if ((v27 & 1) == 0)
    {
      unint64_t v28 = v26;
      goto LABEL_13;
    }
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = OUTLINED_FUNCTION_2_3();
  unint64_t v28 = (unint64_t)sub_25D6A6C70(v29, v30, v31, v32, v33);
  char v35 = v34;
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_22;
  }
LABEL_13:
  if (v6[2] < 3uLL)
  {
LABEL_26:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v36 = v6[12];
  unint64_t v37 = v6[13];
  unint64_t v39 = v6[14];
  unint64_t v38 = v6[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v37 ^ v36) >> 14)) {
    goto LABEL_22;
  }
  uint64_t v40 = sub_25D6A74DC(v36, v37, v39, v38, 10);
  if ((v41 & 0x100) != 0) {
    uint64_t v40 = (uint64_t)sub_25D6A6C70(v36, v37, v39, v38, 10);
  }
  uint64_t v42 = v40;
  char v43 = v41;
  swift_bridgeObjectRelease();
  if ((v43 & 1) != 0 || (v3 & 0x8000000000000000) != 0 || (v28 & 0x8000000000000000) != 0 || v42 < 0) {
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25D6A6834()
{
  uint64_t v1 = OUTLINED_FUNCTION_0_2();
  sub_25D6C2F20();
  OUTLINED_FUNCTION_0_2();
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  sub_25D6C2F20();
  OUTLINED_FUNCTION_0_2();
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25D6A68E8()
{
  return sub_25D6A6834();
}

uint64_t sub_25D6A68F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 < a4) {
    return OUTLINED_FUNCTION_4_3();
  }
  if (a1 == a4 && (a2 < a5 || (a2 == a5 ? (v7 = __OFSUB__(a3, a6), BOOL v6 = a3 - a6 < 0) : (v7 = 0, BOOL v6 = 0), v6 ^ v7))) {
    return OUTLINED_FUNCTION_4_3();
  }
  else {
    return OUTLINED_FUNCTION_5_3();
  }
}

BOOL sub_25D6A6918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

uint64_t sub_25D6A692C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25D6A6A18(a1, a2, a3, a4, sub_25D6A68F4);
}

uint64_t sub_25D6A6944(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25D6A6A18(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_25D6A695C);
}

BOOL sub_25D6A695C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL result = 0;
  if (a4 >= a1)
  {
    if (a4 != a1) {
      return 1;
    }
    if (a5 >= a2 && (a5 != a2 || a6 >= a3)) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_25D6A6988(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25D6A6A18(a1, a2, a3, a4, sub_25D6A69A0);
}

uint64_t sub_25D6A69A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 < a4) {
    return OUTLINED_FUNCTION_5_3();
  }
  if (a1 == a4 && (a2 < a5 || (a2 == a5 ? (v7 = __OFSUB__(a3, a6), BOOL v6 = a3 - a6 < 0) : (v7 = 0, BOOL v6 = 0), v6 ^ v7))) {
    return OUTLINED_FUNCTION_5_3();
  }
  else {
    return OUTLINED_FUNCTION_4_3();
  }
}

uint64_t sub_25D6A69C4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25D6A6A18(a1, a2, a3, a4, sub_25D6A69DC);
}

uint64_t sub_25D6A69DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 < a1) {
    return OUTLINED_FUNCTION_4_3();
  }
  if (a4 == a1 && (a5 < a2 || (a5 == a2 ? (v7 = __OFSUB__(a6, a3), BOOL v6 = a6 - a3 < 0) : (v7 = 0, BOOL v6 = 0), v6 ^ v7))) {
    return OUTLINED_FUNCTION_4_3();
  }
  else {
    return OUTLINED_FUNCTION_5_3();
  }
}

uint64_t sub_25D6A6A00(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25D6A6A18(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_25D6A6918);
}

uint64_t sub_25D6A6A18(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

unint64_t sub_25D6A6A3C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_6_1();
  sub_25D6C32F0();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    OUTLINED_FUNCTION_6_1();
    uint64_t v4 = sub_25D6C3240();
    unint64_t v6 = v5;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    unint64_t v1 = sub_25D6A65D0(v4, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

unint64_t sub_25D6A6B1C@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_25D6A6A3C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

unint64_t sub_25D6A6B50()
{
  unint64_t result = qword_26A68F6B0;
  if (!qword_26A68F6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F6B0);
  }
  return result;
}

void *sub_25D6A6BAC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6C8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25D6A6C14(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_25D6C2F80();
    OUTLINED_FUNCTION_1_4(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x2611B0D60](15, a1 >> 16);
    OUTLINED_FUNCTION_1_4(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_25D6A6C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_25D6A7A68();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25D6C2FA0();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_25D6A6FE0();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = (unsigned __int8 *)sub_25D6C3140();
  }
LABEL_7:
  __int16 v13 = sub_25D6A6D64(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_25D6A6D64(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          char v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (unint64_t i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25D6A6FE0()
{
  unint64_t v0 = sub_25D6A704C();
  uint64_t v4 = sub_25D6A7080(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25D6A704C()
{
  return sub_25D6C2FB0();
}

uint64_t sub_25D6A7080(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_25D6A71D8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25D6A6BAC(v9, 0);
      unint64_t v12 = sub_25D6A72D8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25D6C3140();
LABEL_4:
        JUMPOUT(0x2611B0D00);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611B0D00](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2611B0D00]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_25D6A71D8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    unint64_t result = sub_25D6A6C14(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    unint64_t result = sub_25D6A6C14(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_25D6C2F60();
}

unint64_t sub_25D6A72D8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_25D6A6C14(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_25D6C2F70();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_25D6C3140();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_25D6A6C14(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_25D6C2F40();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_25D6A74DC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    uint64_t v12 = HIBYTE(a4) & 0xF;
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = v15;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = (void *)sub_25D6C3140();
  }
  uint64_t result = sub_25D6A75B8((uint64_t)v11, v12, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v16 = v14 & 1;
LABEL_8:
    LOBYTE(v15[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_25D6A75B8(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11 = a3;
  uint64_t v12 = result;
  uint64_t v13 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v13) = 1;
  }
  uint64_t v14 = 4 << v13;
  unint64_t v15 = a3 & 0xC;
  unint64_t v16 = a3;
  if (v15 == 4 << v13)
  {
    uint64_t result = sub_25D6A6C14(a3, a5, a6);
    unint64_t v16 = result;
  }
  uint64_t v17 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x1000000000000000) != 0)
  {
    unint64_t v19 = a5 & 0xFFFFFFFFFFFFLL;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v19 = HIBYTE(a6) & 0xF;
    }
    if (v19 < v16 >> 16) {
      goto LABEL_96;
    }
    uint64_t result = sub_25D6C2F60();
    uint64_t v18 = result;
    uint64_t v17 = HIBYTE(a6) & 0xF;
  }
  else
  {
    uint64_t v18 = v16 >> 16;
  }
  if (v15 == v14)
  {
    uint64_t v20 = v17;
    uint64_t result = sub_25D6A6C14(v11, a5, a6);
    uint64_t v17 = v20;
    unint64_t v11 = result;
  }
  if ((a4 & 0xC) == v14)
  {
    unint64_t v21 = a4;
    uint64_t v22 = v17;
    uint64_t result = sub_25D6A6C14(v21, a5, a6);
    uint64_t v17 = v22;
    a4 = result;
    if ((a6 & 0x1000000000000000) == 0) {
      goto LABEL_11;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
LABEL_11:
    uint64_t result = (a4 >> 16) - (v11 >> 16);
    goto LABEL_22;
  }
  unint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0) {
    unint64_t v23 = v17;
  }
  if (v23 < v11 >> 16) {
    goto LABEL_92;
  }
  if (v23 < a4 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  uint64_t result = sub_25D6C2F60();
LABEL_22:
  uint64_t v24 = v18 + result;
  if (__OFADD__(v18, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v24 < v18)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  unsigned __int8 v25 = (unsigned __int8 *)(v12 + v18);
  if (!v12) {
    unsigned __int8 v25 = 0;
  }
  int v26 = *v25;
  if (v26 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v37 = a7 + 48;
        unsigned __int8 v38 = a7 + 55;
        unsigned __int8 v39 = a7 + 87;
        if (a7 > 10)
        {
          unsigned __int8 v37 = 58;
        }
        else
        {
          unsigned __int8 v39 = 97;
          unsigned __int8 v38 = 65;
        }
        if (v25)
        {
          uint64_t v30 = 0;
          uint64_t v40 = v25 + 1;
          uint64_t v41 = result - 1;
          do
          {
            unsigned int v42 = *v40;
            if (v42 < 0x30 || v42 >= v37)
            {
              if (v42 < 0x41 || v42 >= v38)
              {
                uint64_t v35 = 0;
                if (v42 < 0x61 || v42 >= v39) {
                  return v35;
                }
                char v43 = -87;
              }
              else
              {
                char v43 = -55;
              }
            }
            else
            {
              char v43 = -48;
            }
            uint64_t v44 = v30 * a7;
            if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
              return 0;
            }
            uint64_t v30 = v44 + (v42 + v43);
            if (__OFADD__(v44, (v42 + v43))) {
              return 0;
            }
            ++v40;
            --v41;
          }
          while (v41);
          return v30;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v26 != 45)
  {
    if (v24 != v18)
    {
      unsigned __int8 v45 = a7 + 48;
      unsigned __int8 v46 = a7 + 55;
      unsigned __int8 v47 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v45 = 58;
      }
      else
      {
        unsigned __int8 v47 = 97;
        unsigned __int8 v46 = 65;
      }
      if (v25)
      {
        uint64_t v48 = 0;
        do
        {
          unsigned int v49 = *v25;
          if (v49 < 0x30 || v49 >= v45)
          {
            if (v49 < 0x41 || v49 >= v46)
            {
              uint64_t v35 = 0;
              if (v49 < 0x61 || v49 >= v47) {
                return v35;
              }
              char v50 = -87;
            }
            else
            {
              char v50 = -55;
            }
          }
          else
          {
            char v50 = -48;
          }
          uint64_t v51 = v48 * a7;
          if ((unsigned __int128)(v48 * (__int128)a7) >> 64 != (v48 * a7) >> 63) {
            return 0;
          }
          uint64_t v48 = v51 + (v49 + v50);
          if (__OFADD__(v51, (v49 + v50))) {
            return 0;
          }
          ++v25;
          --result;
        }
        while (result);
        return v51 + (v49 + v50);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v27 = a7 + 48;
      unsigned __int8 v28 = a7 + 55;
      unsigned __int8 v29 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v27 = 58;
      }
      else
      {
        unsigned __int8 v29 = 97;
        unsigned __int8 v28 = 65;
      }
      if (v25)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v25 + 1;
        uint64_t v32 = result - 1;
        while (1)
        {
          unsigned int v33 = *v31;
          if (v33 < 0x30 || v33 >= v27)
          {
            if (v33 < 0x41 || v33 >= v28)
            {
              uint64_t v35 = 0;
              if (v33 < 0x61 || v33 >= v29) {
                return v35;
              }
              char v34 = -87;
            }
            else
            {
              char v34 = -55;
            }
          }
          else
          {
            char v34 = -48;
          }
          uint64_t v36 = v30 * a7;
          if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
            return 0;
          }
          uint64_t v30 = v36 - (v33 + v34);
          if (__OFSUB__(v36, (v33 + v34))) {
            return 0;
          }
          ++v31;
          if (!--v32) {
            return v30;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_25D6A79FC(uint64_t *a1)
{
  return sub_25D6B1344(a1, *(uint64_t **)(v1 + 16)) & 1;
}

unint64_t sub_25D6A7A1C()
{
  unint64_t result = qword_26A68F6B8;
  if (!qword_26A68F6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F6B8);
  }
  return result;
}

unint64_t sub_25D6A7A68()
{
  unint64_t result = qword_26A68F6C0;
  if (!qword_26A68F6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F6C0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SemanticVersionError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SemanticVersionError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SemanticVersionError(void *a1, void *a2)
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

void *assignWithTake for SemanticVersionError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SemanticVersionError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SemanticVersionError(uint64_t result, int a2, int a3)
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

uint64_t OUTLINED_FUNCTION_5_3()
{
  return 0;
}

ValueMetadata *type metadata accessor for SemanticVersionError()
{
  return &type metadata for SemanticVersionError;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SemanticVersion(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SemanticVersion(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SemanticVersion()
{
  return &type metadata for SemanticVersion;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_25D6C3220();
}

unint64_t OUTLINED_FUNCTION_1_4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t static NLGUtteranceProvider.currentUtterance.getter()
{
  sub_25D6C2B30();
  if (!sub_25D6C2B20())
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25D6C2DE0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A691DB8);
    uint64_t v8 = sub_25D6C2DC0();
    os_log_type_t v9 = sub_25D6C3050();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_1_5();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl(&dword_25D698000, v8, v9, "No current request", v10, 2u);
      OUTLINED_FUNCTION_10_0();
    }

    return 0;
  }
  sub_25D6C2B00();
  swift_release();
  uint64_t v0 = sub_25D6C2B70();
  if (!v1)
  {
    unint64_t v11 = (void *)sub_25D6C2B60();
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = objc_msgSend(v11, sel_recognition);
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = sub_25D6A80F8(v13);
        if (v16)
        {
          uint64_t v2 = v15;
          if (qword_26A68F470 != -1) {
            swift_once();
          }
          uint64_t v17 = sub_25D6C2DE0();
          __swift_project_value_buffer(v17, (uint64_t)qword_26A691DB8);
          uint64_t v18 = sub_25D6C2DC0();
          os_log_type_t v19 = sub_25D6C3040();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_1_5();
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl(&dword_25D698000, v18, v19, "Returning speech transcript from current request", v20, 2u);
            OUTLINED_FUNCTION_10_0();
          }

          goto LABEL_8;
        }
      }
      if (qword_26A68F470 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_25D6C2DE0();
      __swift_project_value_buffer(v26, (uint64_t)qword_26A691DB8);
      unsigned __int8 v27 = sub_25D6C2DC0();
      os_log_type_t v28 = sub_25D6C3050();
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_5() = 0;
        OUTLINED_FUNCTION_2_4(&dword_25D698000, v29, v30, "No speech recognition transcript");
        OUTLINED_FUNCTION_10_0();
      }
    }
    else
    {
      if (qword_26A68F470 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_25D6C2DE0();
      __swift_project_value_buffer(v21, (uint64_t)qword_26A691DB8);
      uint64_t v22 = sub_25D6C2DC0();
      os_log_type_t v23 = sub_25D6C3050();
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_5() = 0;
        OUTLINED_FUNCTION_2_4(&dword_25D698000, v24, v25, "No speech package");
        OUTLINED_FUNCTION_10_0();
      }
    }
    swift_release();
    return 0;
  }
  uint64_t v2 = v0;
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25D6C2DE0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A691DB8);
  uint64_t v4 = sub_25D6C2DC0();
  os_log_type_t v5 = sub_25D6C3040();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned __int8 v6 = (uint8_t *)OUTLINED_FUNCTION_1_5();
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl(&dword_25D698000, v4, v5, "Returning utterance from current request", v6, 2u);
    OUTLINED_FUNCTION_10_0();
  }

LABEL_8:
  swift_release();
  return v2;
}

uint64_t sub_25D6A80F8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_oneBestTranscript);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25D6C2E80();

  return v3;
}

ValueMetadata *type metadata accessor for NLGUtteranceProvider()
{
  return &type metadata for NLGUtteranceProvider;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t *sub_25D6A81A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 24);
    os_log_type_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D6C2BA0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for Siri_Nlg_Capabilities(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v11);
      v14[*(int *)(v16 + 20)] = v15[*(int *)(v16 + 20)];
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
  }
  return v7;
}

uint64_t type metadata accessor for Siri_Nlg_Capabilities(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F6F0);
}

uint64_t sub_25D6A835C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D6C2BA0();
  os_log_type_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v9(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for Siri_Nlg_Capabilities(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    return v9(v6, v5);
  }
  return result;
}

void *sub_25D6A8444(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  os_log_type_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25D6C2BA0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v10);
    v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

void *sub_25D6A8588(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!v8)
  {
    if (!EnumTagSinglePayload)
    {
      v11(v13, v14, v9);
      v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
      return a1;
    }
    sub_25D6AE448((uint64_t)v13, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
  v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_25D6A8760(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    v12[*(int *)(v14 + 20)] = v13[*(int *)(v14 + 20)];
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

void *sub_25D6A888C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!v8)
  {
    if (!EnumTagSinglePayload)
    {
      v11(v13, v14, v9);
      v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
      return a1;
    }
    sub_25D6AE448((uint64_t)v13, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v14, v9);
  v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t sub_25D6A8A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D6A8A68);
}

uint64_t sub_25D6A8A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_25();
  }
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(a3 + 24);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
    uint64_t v10 = *(int *)(a3 + 28);
  }
  return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
}

uint64_t sub_25D6A8B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D6A8B20);
}

void sub_25D6A8B20()
{
  OUTLINED_FUNCTION_34();
  if (v4)
  {
    *id v1 = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    sub_25D6C2BA0();
    OUTLINED_FUNCTION_1_6();
    if (*(_DWORD *)(v8 + 84) == v6)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(int *)(v5 + 24);
    }
    else
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
      uint64_t v10 = *(int *)(v5 + 28);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v1 + v10, v0, v0, v9);
  }
}

uint64_t type metadata accessor for Siri_Nlg_Model(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F6D8);
}

void sub_25D6A8BE4()
{
  sub_25D6C2BA0();
  if (v0 <= 0x3F)
  {
    sub_25D6A8CBC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25D6A8CBC()
{
  if (!qword_26A68F6E8)
  {
    type metadata accessor for Siri_Nlg_Capabilities(255);
    unint64_t v0 = sub_25D6C3090();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A68F6E8);
    }
  }
}

void *sub_25D6A8D14(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25D6C2BA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25D6A8DE0(uint64_t a1)
{
  uint64_t v2 = sub_25D6C2BA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25D6A8E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D6C2BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25D6A8EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D6C2BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25D6A8F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D6C2BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25D6A8FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D6C2BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25D6A9034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D6A9048);
}

uint64_t sub_25D6A9048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      int v10 = ((v9 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v10 = -2;
    }
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25D6A90F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D6A9108);
}

void sub_25D6A9108(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_1_6();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
}

uint64_t sub_25D6A9194()
{
  uint64_t result = sub_25D6C2BA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25D6A9228(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x726F74636146;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0xD000000000000023;
    }
    else {
      unint64_t v4 = 0x6E6F6973726556;
    }
    if (v3 == 1) {
      unint64_t v5 = 0x800000025D6C5500;
    }
    else {
      unint64_t v5 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0xE600000000000000;
    unint64_t v4 = 0x726F74636146;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v2 = 0xD000000000000023;
    }
    else {
      unint64_t v2 = 0x6E6F6973726556;
    }
    if (a2 == 1) {
      unint64_t v6 = 0x800000025D6C5500;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v4 == v2 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25D6C3230();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25D6A932C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 7496035;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1701670760;
    }
    else {
      uint64_t v4 = 0x656E6F6870;
    }
    if (v3 == 1) {
      unint64_t v5 = 0xE400000000000000;
    }
    else {
      unint64_t v5 = 0xE500000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0xE300000000000000;
    uint64_t v4 = 7496035;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v2 = 1701670760;
    }
    else {
      uint64_t v2 = 0x656E6F6870;
    }
    if (a2 == 1) {
      unint64_t v6 = 0xE400000000000000;
    }
    else {
      unint64_t v6 = 0xE500000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v4 == v2 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25D6C3230();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_25D6A9410(char a1, char a2)
{
  return a1 == a2;
}

unint64_t sub_25D6A9420(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_25D6A9430(uint64_t result)
{
  return result;
}

BOOL sub_25D6A9438(char *a1, char *a2)
{
  return sub_25D6A9410(*a1, *a2);
}

uint64_t sub_25D6A9444()
{
  return sub_25D6AFABC();
}

uint64_t sub_25D6A944C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25D6AE4FC();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25D6A9498()
{
  return sub_25D6AFBFC();
}

void sub_25D6A94A0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_25D6A94A8@<X0>(unint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25D6A9420(a1);
  *a2 = result;
  return result;
}

uint64_t sub_25D6A94D0()
{
  return sub_25D6A9430(*v0);
}

unint64_t sub_25D6A94D8@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25D6A9420(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25D6A9504@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25D6A9430(*v1);
  *a1 = result;
  return result;
}

void sub_25D6A9530(void *a1@<X8>)
{
  *a1 = &unk_270A64140;
}

uint64_t sub_25D6A9540@<X0>(uint64_t a1@<X8>)
{
  sub_25D6C2B90();
  uint64_t result = type metadata accessor for Siri_Nlg_Capabilities(0);
  *(unsigned char *)(a1 + *(int *)(result + 20)) = 2;
  return result;
}

uint64_t sub_25D6A9578@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v2;
  uint64_t v3 = type metadata accessor for Siri_Nlg_Model(0);
  sub_25D6C2B90();
  uint64_t v4 = (uint64_t)a1 + *(int *)(v3 + 28);
  uint64_t v5 = type metadata accessor for Siri_Nlg_Capabilities(0);
  return __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
}

uint64_t sub_25D6A95EC@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  type metadata accessor for Siri_Nlg_CATFile(0);
  uint64_t result = OUTLINED_FUNCTION_26();
  uint64_t v4 = (void *)((char *)a1 + *(int *)(v1 + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (void *)((char *)a1 + *(int *)(v1 + 28));
  *uint64_t v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t sub_25D6A963C@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  uint64_t result = OUTLINED_FUNCTION_26();
  uint64_t v5 = (void *)((char *)a2 + *(int *)(v2 + 24));
  *uint64_t v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t sub_25D6A9688@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  type metadata accessor for Siri_Nlg_Content(0);
  uint64_t result = OUTLINED_FUNCTION_26();
  *((unsigned char *)a1 + *(int *)(v1 + 24)) = 4;
  return result;
}

uint64_t sub_25D6A96CC()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691DD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691DD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3EE0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "CONTENTTYPE_UNKNOWN";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "CONTENTTYPE_TEXT";
  *(void *)(v10 + 8) = 16;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 2;
  *(void *)uint64_t v12 = "CONTENTTYPE_KEYWORDS";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 3;
  *(void *)uint64_t v14 = "CONTENTTYPE_SOURCE_KEYWORDS";
  *((void *)v14 + 1) = 27;
  v14[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6A98FC(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F480, (uint64_t)qword_26A691DD8);
}

uint64_t sub_25D6A9920()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691DF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691DF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3EF0;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "capabilities";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "cat_file";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "vocabulary";
  *((void *)v12 + 1) = 10;
  v12[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6A9B20()
{
  uint64_t result = OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_25D6C2C50();
          break;
        case 2:
          uint64_t v3 = OUTLINED_FUNCTION_6_2();
          sub_25D6AC050(v3, v4, v5, v6, v7, &qword_26A68F768, v8);
          break;
        case 1:
          OUTLINED_FUNCTION_6_2();
          sub_25D6A9BFC();
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_36();
    }
  }
  return result;
}

uint64_t sub_25D6A9BFC()
{
  return sub_25D6C2C90();
}

uint64_t sub_25D6A9CAC()
{
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_29();
  uint64_t result = sub_25D6A9D94(v2);
  if (!v0)
  {
    OUTLINED_FUNCTION_32();
    if (v4)
    {
      type metadata accessor for Siri_Nlg_CATFile(0);
      sub_25D6ACFF4(&qword_26A68F768, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
      OUTLINED_FUNCTION_5_4();
    }
    if (*(void *)(*(void *)(v1 + 8) + 16))
    {
      OUTLINED_FUNCTION_29();
      sub_25D6C2D10();
    }
    type metadata accessor for Siri_Nlg_Model(0);
    return OUTLINED_FUNCTION_7_1();
  }
  return result;
}

uint64_t sub_25D6A9D94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Siri_Nlg_Capabilities(0);
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Siri_Nlg_Model(0);
  sub_25D6AD758(a1 + *(int *)(v10 + 28), (uint64_t)v5);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1) {
    return sub_25D6AD824((uint64_t)v5, &qword_26A68F6D0);
  }
  sub_25D6AD7C0((uint64_t)v5, (uint64_t)v9);
  sub_25D6ACFF4(&qword_26A68F788, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
  sub_25D6C2D50();
  return sub_25D6AE448((uint64_t)v9, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
}

void sub_25D6A9F3C()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1();
  uint64_t v52 = v3;
  uint64_t v53 = v2;
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  uint64_t v51 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v7);
  char v50 = (char *)&v50 - v8;
  type metadata accessor for Siri_Nlg_Capabilities(0);
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7E0);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
  uint64_t v20 = MEMORY[0x270FA5388](v18 - 8, v19);
  uint64_t v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v20, v23);
  uint64_t v26 = (char *)&v50 - v25;
  MEMORY[0x270FA5388](v24, v27);
  uint64_t v29 = (char *)&v50 - v28;
  uint64_t v30 = type metadata accessor for Siri_Nlg_Model(0);
  sub_25D6AD758(v1 + *(int *)(v30 + 28), (uint64_t)v29);
  sub_25D6AD758(v0 + *(int *)(v30 + 28), (uint64_t)v26);
  uint64_t v31 = (uint64_t)&v17[*(int *)(v14 + 56)];
  sub_25D6AD758((uint64_t)v29, (uint64_t)v17);
  uint64_t v32 = OUTLINED_FUNCTION_19();
  sub_25D6AD758(v32, v33);
  OUTLINED_FUNCTION_33((uint64_t)v17);
  if (!v34)
  {
    sub_25D6AD758((uint64_t)v17, (uint64_t)v22);
    OUTLINED_FUNCTION_33(v31);
    if (!v34)
    {
      sub_25D6AD7C0(v31, (uint64_t)v12);
      char v39 = sub_25D6AA9F8();
      sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
      sub_25D6AD824((uint64_t)v26, &qword_26A68F6D0);
      sub_25D6AD824((uint64_t)v29, &qword_26A68F6D0);
      sub_25D6AE448((uint64_t)v22, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
      sub_25D6AD824((uint64_t)v17, &qword_26A68F6D0);
      if ((v39 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
    uint64_t v35 = OUTLINED_FUNCTION_19();
    sub_25D6AD824(v35, v36);
    uint64_t v37 = OUTLINED_FUNCTION_14();
    sub_25D6AD824(v37, v38);
    sub_25D6AE448((uint64_t)v22, (void (*)(void))type metadata accessor for Siri_Nlg_Capabilities);
LABEL_9:
    sub_25D6AD824((uint64_t)v17, &qword_26A68F7E0);
    goto LABEL_14;
  }
  sub_25D6AD824((uint64_t)v26, &qword_26A68F6D0);
  sub_25D6AD824((uint64_t)v29, &qword_26A68F6D0);
  OUTLINED_FUNCTION_33(v31);
  if (!v34) {
    goto LABEL_9;
  }
  sub_25D6AD824((uint64_t)v17, &qword_26A68F6D0);
LABEL_11:
  uint64_t v40 = OUTLINED_FUNCTION_30();
  if (sub_25D6AE0A8(v40, v41) & 1) != 0 && (sub_25D6AE378(*(void **)(v1 + 8), *(void **)(v0 + 8)))
  {
    uint64_t v42 = v1 + *(int *)(v30 + 24);
    uint64_t v44 = v52;
    uint64_t v43 = v53;
    unsigned __int8 v45 = *(void (**)(char *, uint64_t, uint64_t))(v52 + 16);
    unsigned __int8 v46 = v50;
    v45(v50, v42, v53);
    uint64_t v47 = v0 + *(int *)(v30 + 24);
    uint64_t v48 = v51;
    v45(v51, v47, v43);
    sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
    sub_25D6C2E60();
    unsigned int v49 = *(void (**)(char *, uint64_t))(v44 + 8);
    v49(v48, v43);
    v49(v46, v43);
  }
LABEL_14:
  OUTLINED_FUNCTION_23();
}

uint64_t sub_25D6AA358()
{
  return 0x676C6E2E69726973;
}

uint64_t sub_25D6AA380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_25D6C2BA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25D6AA3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D6C2BA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_25D6AA460())()
{
  return nullsub_1;
}

uint64_t sub_25D6AA484()
{
  return sub_25D6A9B20();
}

uint64_t sub_25D6AA49C()
{
  return sub_25D6A9CAC();
}

uint64_t sub_25D6AA4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F7D8, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6AA538(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F488, (uint64_t)qword_26A691DF0);
}

uint64_t sub_25D6AA55C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_25D6AC784(a3, a4);
  sub_25D6C2D80();
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = OUTLINED_FUNCTION_14();
  return v5(v4);
}

uint64_t sub_25D6AA5CC(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F5D0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6AA638()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_Model, &qword_26A68F7A8, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
}

uint64_t sub_25D6AA694()
{
  sub_25D6ACFF4(&qword_26A68F5D0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6AA718()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691E08);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691E08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25D6C3C80;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "dialog_selection";
  *(void *)(v4 + 8) = 16;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50728];
  uint64_t v6 = sub_25D6C2D60();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_25D6C2D70();
}

uint64_t sub_25D6AA874(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_20(a1, a2);
  while (1)
  {
    uint64_t result = sub_25D6C2C20();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 1)
    {
      OUTLINED_FUNCTION_6_2();
      sub_25D6AA8C8();
    }
  }
  return result;
}

uint64_t sub_25D6AA8C8()
{
  return sub_25D6C2C30();
}

uint64_t sub_25D6AA92C()
{
  OUTLINED_FUNCTION_29();
  uint64_t result = sub_25D6AA980(v1);
  if (!v0) {
    return sub_25D6C2B80();
  }
  return result;
}

uint64_t sub_25D6AA980(uint64_t a1)
{
  uint64_t result = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 20)) != 2) {
    return sub_25D6C2CF0();
  }
  return result;
}

uint64_t sub_25D6AA9F8()
{
  uint64_t v4 = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_4_4();
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v11 = OUTLINED_FUNCTION_11_1();
  uint64_t v12 = *(int *)(type metadata accessor for Siri_Nlg_Capabilities(v11) + 20);
  int v13 = *(unsigned __int8 *)(v3 + v12);
  int v14 = *(unsigned __int8 *)(v2 + v12);
  if (v13 == 2)
  {
    if (v14 != 2)
    {
LABEL_7:
      char v16 = 0;
      return v16 & 1;
    }
  }
  else if (v14 == 2 || ((((v14 & 1) == 0) ^ v13) & 1) == 0)
  {
    goto LABEL_7;
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v15(v1, v3, v4);
  v15(v0, v2, v4);
  sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
  char v16 = OUTLINED_FUNCTION_9_1();
  uint64_t v17 = *(void (**)(uint64_t))(v6 + 8);
  uint64_t v18 = OUTLINED_FUNCTION_14();
  v17(v18);
  uint64_t v19 = OUTLINED_FUNCTION_19();
  v17(v19);
  return v16 & 1;
}

unint64_t sub_25D6AAB64()
{
  return 0xD000000000000015;
}

uint64_t sub_25D6AAB80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25D6C2BA0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25D6AABE8(uint64_t a1)
{
  uint64_t v3 = sub_25D6C2BA0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*sub_25D6AAC50())()
{
  return nullsub_1;
}

uint64_t sub_25D6AAC70(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA874(a1, a2);
}

uint64_t sub_25D6AAC88()
{
  return sub_25D6AA92C();
}

uint64_t sub_25D6AACA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F7F0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6AAD1C(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F490, (uint64_t)qword_26A691E08);
}

uint64_t sub_25D6AAD40(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F788, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6AADAC()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_Capabilities, &qword_26A68F790, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
}

uint64_t sub_25D6AAE08()
{
  sub_25D6ACFF4(&qword_26A68F788, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6AAE88()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691E20);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691E20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3EF0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "cat_family";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "cat_identifier";
  *((void *)v10 + 1) = 14;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "dialog_switch";
  *((void *)v12 + 1) = 13;
  v12[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6AB080()
{
  uint64_t result = OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          OUTLINED_FUNCTION_12_0(3, v2, v3, v4, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch, v5, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
          break;
        case 2:
          OUTLINED_FUNCTION_6_2();
          sub_25D6AB158();
          break;
        case 1:
          OUTLINED_FUNCTION_16();
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_36();
    }
  }
  return result;
}

uint64_t sub_25D6AB158()
{
  return sub_25D6C2C70();
}

uint64_t sub_25D6AB1BC()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t result = OUTLINED_FUNCTION_15();
  if (!v0)
  {
    OUTLINED_FUNCTION_29();
    sub_25D6AB2BC(v2);
    OUTLINED_FUNCTION_32();
    if (v3)
    {
      type metadata accessor for Siri_Nlg_DialogSwitch(0);
      sub_25D6ACFF4(&qword_26A68F748, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
      sub_25D6C2D40();
    }
    type metadata accessor for Siri_Nlg_CATFile(0);
    return OUTLINED_FUNCTION_7_1();
  }
  return result;
}

uint64_t sub_25D6AB2BC(uint64_t a1)
{
  uint64_t result = type metadata accessor for Siri_Nlg_CATFile(0);
  if (*(void *)(a1 + *(int *)(result + 28) + 8)) {
    return sub_25D6C2D30();
  }
  return result;
}

uint64_t sub_25D6AB334()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2, v3);
  OUTLINED_FUNCTION_4_4();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v6 = OUTLINED_FUNCTION_11_1();
  type metadata accessor for Siri_Nlg_CATFile(v6);
  OUTLINED_FUNCTION_18();
  if (!v9)
  {
    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_22(v8);
  BOOL v12 = v12 && v10 == v11;
  if (v12 || (char v13 = 0, (sub_25D6C3230() & 1) != 0))
  {
LABEL_10:
    OUTLINED_FUNCTION_18();
    if (v16)
    {
      if (!v14) {
        goto LABEL_21;
      }
      OUTLINED_FUNCTION_22(v15);
      if (!v12 || v17 != v18)
      {
        char v13 = 0;
        if ((sub_25D6C3230() & 1) == 0) {
          return v13 & 1;
        }
      }
    }
    else if (v14)
    {
      goto LABEL_21;
    }
    uint64_t v20 = OUTLINED_FUNCTION_30();
    if (sub_25D6ADE1C(v20, v21))
    {
      uint64_t v22 = *(void (**)(void))(v1 + 16);
      OUTLINED_FUNCTION_8_1();
      v22();
      OUTLINED_FUNCTION_8_1();
      v22();
      sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
      char v13 = OUTLINED_FUNCTION_9_1();
      uint64_t v23 = *(void (**)(uint64_t))(v1 + 8);
      uint64_t v24 = OUTLINED_FUNCTION_14();
      v23(v24);
      uint64_t v25 = OUTLINED_FUNCTION_19();
      v23(v25);
      return v13 & 1;
    }
LABEL_21:
    char v13 = 0;
  }
  return v13 & 1;
}

unint64_t sub_25D6AB4D8()
{
  return 0xD000000000000010;
}

uint64_t (*sub_25D6AB4FC())()
{
  return nullsub_1;
}

uint64_t sub_25D6AB520()
{
  return sub_25D6AB080();
}

uint64_t sub_25D6AB538()
{
  return sub_25D6AB1BC();
}

uint64_t sub_25D6AB550(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F7F8, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6AB5CC(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F498, (uint64_t)qword_26A691E20);
}

uint64_t sub_25D6AB5F0(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F768, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6AB65C()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_CATFile, &qword_26A68F770, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
}

uint64_t sub_25D6AB6B8()
{
  sub_25D6ACFF4(&qword_26A68F768, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6AB738()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691E38);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691E38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3C70;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "switch_variable";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "dialog";
  *((void *)v10 + 1) = 6;
  v10[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6AB8F8()
{
  uint64_t result = OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        OUTLINED_FUNCTION_12_0(2, v2, v3, v4, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog, v5, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
      }
      else if (result == 1)
      {
        OUTLINED_FUNCTION_16();
      }
      uint64_t result = OUTLINED_FUNCTION_36();
    }
  }
  return result;
}

uint64_t sub_25D6AB9B8()
{
  uint64_t v0 = OUTLINED_FUNCTION_17();
  v1(v0);
  return sub_25D6C2C70();
}

uint64_t sub_25D6ABA08()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t result = OUTLINED_FUNCTION_15();
  if (!v0)
  {
    OUTLINED_FUNCTION_32();
    if (v2)
    {
      type metadata accessor for Siri_Nlg_Dialog(0);
      sub_25D6ACFF4(&qword_26A68F728, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
      OUTLINED_FUNCTION_5_4();
    }
    type metadata accessor for Siri_Nlg_DialogSwitch(0);
    return OUTLINED_FUNCTION_7_1();
  }
  return result;
}

uint64_t sub_25D6ABACC()
{
  uint64_t v1 = OUTLINED_FUNCTION_17();
  uint64_t result = v2(v1);
  if (*(void *)(v0 + *(int *)(result + 24) + 8)) {
    return sub_25D6C2D30();
  }
  return result;
}

uint64_t sub_25D6ABB30@<X0>(void *a1@<X8>)
{
  return sub_25D6A963C((void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch, a1);
}

unint64_t sub_25D6ABB5C()
{
  return 0xD000000000000015;
}

uint64_t sub_25D6ABB78()
{
  return sub_25D6AB8F8();
}

uint64_t sub_25D6ABB90()
{
  return sub_25D6ABA08();
}

uint64_t sub_25D6ABBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F800, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6ABC24(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F4A0, (uint64_t)qword_26A691E38);
}

uint64_t sub_25D6ABC48(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F748, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6ABCB4()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch, &qword_26A68F750, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
}

uint64_t sub_25D6ABD10()
{
  sub_25D6ACFF4(&qword_26A68F748, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6ABD8C()
{
  sub_25D6AC1B0();
  return v0 & 1;
}

uint64_t sub_25D6ABDD0()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691E50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691E50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3C70;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "switch_case";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "content";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6ABF90()
{
  uint64_t result = OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        OUTLINED_FUNCTION_12_0(2, v2, v3, v4, (void (*)(void))type metadata accessor for Siri_Nlg_Content, v5, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
      }
      else if (result == 1)
      {
        OUTLINED_FUNCTION_16();
      }
      uint64_t result = OUTLINED_FUNCTION_36();
    }
  }
  return result;
}

uint64_t sub_25D6AC050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  return sub_25D6C2C80();
}

uint64_t sub_25D6AC0EC()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t result = OUTLINED_FUNCTION_15();
  if (!v0)
  {
    OUTLINED_FUNCTION_32();
    if (v2)
    {
      type metadata accessor for Siri_Nlg_Content(0);
      sub_25D6ACFF4(&qword_26A68F708, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
      OUTLINED_FUNCTION_5_4();
    }
    type metadata accessor for Siri_Nlg_Dialog(0);
    return OUTLINED_FUNCTION_7_1();
  }
  return result;
}

void sub_25D6AC1B0()
{
  OUTLINED_FUNCTION_21();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_4_4();
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v10 = OUTLINED_FUNCTION_11_1();
  v3(v10);
  OUTLINED_FUNCTION_18();
  if (!v13)
  {
    if (v11) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v11)
  {
    OUTLINED_FUNCTION_22(v12);
    BOOL v16 = v16 && v14 == v15;
    if (v16 || (sub_25D6C3230() & 1) != 0)
    {
LABEL_10:
      uint64_t v17 = OUTLINED_FUNCTION_30();
      if (v1(v17))
      {
        uint64_t v18 = *(void (**)(void))(v5 + 16);
        OUTLINED_FUNCTION_8_1();
        v18();
        OUTLINED_FUNCTION_8_1();
        v18();
        sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
        OUTLINED_FUNCTION_9_1();
        uint64_t v19 = *(void (**)(uint64_t))(v5 + 8);
        uint64_t v20 = OUTLINED_FUNCTION_14();
        v19(v20);
        uint64_t v21 = OUTLINED_FUNCTION_19();
        v19(v21);
      }
    }
  }
LABEL_12:
  OUTLINED_FUNCTION_23();
}

uint64_t sub_25D6AC324@<X0>(void *a1@<X8>)
{
  return sub_25D6A963C((void (*)(void))type metadata accessor for Siri_Nlg_Dialog, a1);
}

uint64_t sub_25D6AC350()
{
  return 0x676C6E2E69726973;
}

uint64_t sub_25D6AC374()
{
  return sub_25D6ABF90();
}

uint64_t sub_25D6AC38C()
{
  return sub_25D6AC0EC();
}

uint64_t sub_25D6AC3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F808, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6AC420(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F4A8, (uint64_t)qword_26A691E50);
}

uint64_t sub_25D6AC444(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F728, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6AC4B0()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_Dialog, &qword_26A68F730, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
}

uint64_t sub_25D6AC50C()
{
  sub_25D6ACFF4(&qword_26A68F728, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6AC588()
{
  sub_25D6AC1B0();
  return v0 & 1;
}

uint64_t sub_25D6AC5CC()
{
  uint64_t v0 = sub_25D6C2D80();
  __swift_allocate_value_buffer(v0, qword_26A691E68);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A691E68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A68F7D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25D6C3C70;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25D6C2D60();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "token";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return sub_25D6C2D70();
}

uint64_t sub_25D6AC784(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25D6C2D80();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_25D6AC7D8(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_20(a1, a2);
  while (1)
  {
    uint64_t result = sub_25D6C2C20();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_25D6C2C60();
    }
    else if (result == 1)
    {
      OUTLINED_FUNCTION_6_2();
      sub_25D6AC84C();
    }
  }
  return result;
}

uint64_t sub_25D6AC84C()
{
  return sub_25D6C2C40();
}

uint64_t sub_25D6AC8C4()
{
  uint64_t result = sub_25D6AC974(v0);
  if (!v1)
  {
    if (*(void *)(*(void *)v0 + 16)) {
      sub_25D6C2D20();
    }
    type metadata accessor for Siri_Nlg_Content(0);
    return sub_25D6C2B80();
  }
  return result;
}

uint64_t sub_25D6AC974(uint64_t a1)
{
  uint64_t result = type metadata accessor for Siri_Nlg_Content(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 24)) != 4)
  {
    sub_25D6AE4FC();
    return sub_25D6C2D00();
  }
  return result;
}

uint64_t sub_25D6ACA00()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4, v5);
  OUTLINED_FUNCTION_4_4();
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v8 = OUTLINED_FUNCTION_11_1();
  uint64_t v9 = *(int *)(type metadata accessor for Siri_Nlg_Content(v8) + 24);
  int v10 = *(unsigned __int8 *)(v1 + v9);
  int v11 = *(unsigned __int8 *)(v0 + v9);
  if (v10 == 4)
  {
    if (v11 != 4) {
      goto LABEL_11;
    }
  }
  else if (v11 == 4 || v10 != v11)
  {
    goto LABEL_11;
  }
  uint64_t v13 = OUTLINED_FUNCTION_30();
  if (!sub_25D6ADDB0(v13, v14))
  {
LABEL_11:
    char v16 = 0;
    return v16 & 1;
  }
  uint64_t v15 = *(void (**)(void))(v3 + 16);
  OUTLINED_FUNCTION_8_1();
  v15();
  OUTLINED_FUNCTION_8_1();
  v15();
  sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
  char v16 = OUTLINED_FUNCTION_9_1();
  uint64_t v17 = *(void (**)(uint64_t))(v3 + 8);
  uint64_t v18 = OUTLINED_FUNCTION_14();
  v17(v18);
  uint64_t v19 = OUTLINED_FUNCTION_19();
  v17(v19);
  return v16 & 1;
}

uint64_t sub_25D6ACB64(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_25D6C32E0();
}

unint64_t sub_25D6ACBF0()
{
  return 0xD000000000000010;
}

uint64_t sub_25D6ACC0C()
{
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_5_0();
  uint64_t v0 = OUTLINED_FUNCTION_14();
  return v1(v0);
}

uint64_t sub_25D6ACC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_5_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  return v7(v4, a1, v5);
}

uint64_t sub_25D6ACCD8(uint64_t a1, uint64_t a2)
{
  return sub_25D6AC7D8(a1, a2);
}

uint64_t sub_25D6ACCF0()
{
  return sub_25D6AC8C4();
}

uint64_t sub_25D6ACD08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25D6ACFF4(&qword_26A68F810, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25D6ACD84(uint64_t a1, uint64_t a2)
{
  return sub_25D6AA55C(a1, a2, &qword_26A68F4B0, (uint64_t)qword_26A691E68);
}

uint64_t sub_25D6ACDA8(uint64_t a1)
{
  uint64_t v2 = sub_25D6ACFF4(&qword_26A68F708, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25D6ACE14()
{
  return sub_25D6ACB64((void (*)(void))type metadata accessor for Siri_Nlg_Content, &qword_26A68F710, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
}

uint64_t sub_25D6ACE70()
{
  sub_25D6ACFF4(&qword_26A68F708, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
  return sub_25D6C2CE0();
}

uint64_t sub_25D6ACEEC()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6ACF44()
{
  return sub_25D6ACFF4(&qword_26A68F700, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
}

uint64_t type metadata accessor for Siri_Nlg_Content(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F840);
}

uint64_t sub_25D6ACFAC()
{
  return sub_25D6ACFF4(&qword_26A68F708, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
}

uint64_t sub_25D6ACFF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D6AD03C()
{
  return sub_25D6ACFF4(&qword_26A68F710, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
}

uint64_t sub_25D6AD084()
{
  return sub_25D6ACFF4(&qword_26A68F718, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Content);
}

uint64_t sub_25D6AD0CC()
{
  return sub_25D6ACFF4(&qword_26A68F720, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
}

uint64_t type metadata accessor for Siri_Nlg_Dialog(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F830);
}

uint64_t sub_25D6AD134()
{
  return sub_25D6ACFF4(&qword_26A68F728, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
}

uint64_t sub_25D6AD17C()
{
  return sub_25D6ACFF4(&qword_26A68F730, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
}

uint64_t sub_25D6AD1C4()
{
  return sub_25D6ACFF4(&qword_26A68F738, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Dialog);
}

uint64_t sub_25D6AD20C()
{
  return sub_25D6ACFF4(&qword_26A68F740, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
}

uint64_t type metadata accessor for Siri_Nlg_DialogSwitch(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F820);
}

uint64_t sub_25D6AD274()
{
  return sub_25D6ACFF4(&qword_26A68F748, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
}

uint64_t sub_25D6AD2BC()
{
  return sub_25D6ACFF4(&qword_26A68F750, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
}

uint64_t sub_25D6AD304()
{
  return sub_25D6ACFF4(&qword_26A68F758, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_DialogSwitch);
}

uint64_t sub_25D6AD34C()
{
  return sub_25D6ACFF4(&qword_26A68F760, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
}

uint64_t type metadata accessor for Siri_Nlg_CATFile(uint64_t a1)
{
  return sub_25D6AD3B4(a1, (uint64_t *)&unk_26A68F850);
}

uint64_t sub_25D6AD3B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D6AD3E8()
{
  return sub_25D6ACFF4(&qword_26A68F768, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
}

uint64_t sub_25D6AD430()
{
  return sub_25D6ACFF4(&qword_26A68F770, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
}

uint64_t sub_25D6AD478()
{
  return sub_25D6ACFF4(&qword_26A68F778, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_CATFile);
}

uint64_t sub_25D6AD4C0()
{
  return sub_25D6ACFF4(&qword_26A68F780, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
}

uint64_t sub_25D6AD508()
{
  return sub_25D6ACFF4(&qword_26A68F788, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
}

uint64_t sub_25D6AD550()
{
  return sub_25D6ACFF4(&qword_26A68F790, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
}

uint64_t sub_25D6AD598()
{
  return sub_25D6ACFF4(&qword_26A68F798, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Capabilities);
}

uint64_t sub_25D6AD5E0()
{
  return sub_25D6ACFF4(&qword_26A68F7A0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
}

uint64_t sub_25D6AD628()
{
  return sub_25D6ACFF4(&qword_26A68F5D0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
}

uint64_t sub_25D6AD670()
{
  return sub_25D6ACFF4(&qword_26A68F7A8, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
}

uint64_t sub_25D6AD6B8()
{
  return sub_25D6ACFF4(&qword_26A68F7B0, (void (*)(uint64_t))type metadata accessor for Siri_Nlg_Model);
}

unint64_t sub_25D6AD704()
{
  unint64_t result = qword_26A68F7B8;
  if (!qword_26A68F7B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A68F7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F7B8);
  }
  return result;
}

uint64_t sub_25D6AD758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6AD7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_Capabilities(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6AD824(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25D6AD878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_Dialog(0);
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  uint64_t v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = (uint64_t *)((char *)&v22 - v11);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v13 && a1 != a2)
  {
    unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v23 = *(void *)(v10 + 72);
    do
    {
      sub_25D6AE4A0(a1 + v14, (uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
      sub_25D6AE4A0(a2 + v14, (uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
      uint64_t v15 = *(int *)(v4 + 24);
      char v16 = (uint64_t *)((char *)v12 + v15);
      uint64_t v17 = *(uint64_t *)((char *)v12 + v15 + 8);
      uint64_t v18 = (uint64_t *)((char *)v8 + v15);
      uint64_t v19 = v18[1];
      if (v17)
      {
        if (!v19 || (*v16 == *v18 ? (BOOL v20 = v17 == v19) : (BOOL v20 = 0), !v20 && (sub_25D6C3230() & 1) == 0))
        {
LABEL_18:
          sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
          sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
          return 0;
        }
      }
      else if (v19)
      {
        goto LABEL_18;
      }
      if ((sub_25D6ADAF0(*v12, *v8) & 1) == 0) {
        goto LABEL_18;
      }
      sub_25D6C2BA0();
      sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
      if ((sub_25D6C2E60() & 1) == 0) {
        goto LABEL_18;
      }
      sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
      sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Dialog);
      v14 += v23;
      --v13;
    }
    while (v13);
  }
  return 1;
}

uint64_t sub_25D6ADAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_Content(0);
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v13 && a1 != a2)
  {
    uint64_t v14 = 0;
    unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v34 = a1 + v15;
    uint64_t v16 = a2 + v15;
    uint64_t v17 = *(void *)(v10 + 72);
    while (1)
    {
      sub_25D6AE4A0(v34 + v17 * v14, (uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
      sub_25D6AE4A0(v16 + v17 * v14, (uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
      uint64_t v18 = *(int *)(v4 + 24);
      int v19 = v12[v18];
      int v20 = v8[v18];
      if (v19 == 4)
      {
        if (v20 != 4) {
          goto LABEL_26;
        }
      }
      else if (v20 == 4 || v19 != v20)
      {
LABEL_26:
        sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
        sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
        return 0;
      }
      uint64_t v22 = *(void *)v12;
      uint64_t v23 = *(void *)v8;
      uint64_t v24 = *(void *)(*(void *)v12 + 16);
      if (v24 != *(void *)(*(void *)v8 + 16)) {
        goto LABEL_26;
      }
      if (v24) {
        BOOL v25 = v22 == v23;
      }
      else {
        BOOL v25 = 1;
      }
      if (!v25)
      {
        if (*(_DWORD *)(v22 + 32) != *(_DWORD *)(v23 + 32)) {
          goto LABEL_26;
        }
        uint64_t v27 = (int *)(v22 + 36);
        uint64_t v28 = (int *)(v23 + 36);
        uint64_t v29 = v24 - 1;
        while (v29)
        {
          int v31 = *v27++;
          int v30 = v31;
          int v32 = *v28++;
          --v29;
          if (v30 != v32) {
            goto LABEL_26;
          }
        }
      }
      sub_25D6C2BA0();
      sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
      if ((sub_25D6C2E60() & 1) == 0) {
        goto LABEL_26;
      }
      ++v14;
      sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
      sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_Content);
      uint64_t result = 1;
      if (v14 == v13) {
        return result;
      }
    }
  }
  return 1;
}

BOOL sub_25D6ADDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  uint64_t v3 = (int *)(a1 + 36);
  uint64_t v4 = (int *)(a2 + 36);
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    int v8 = *v3++;
    int v7 = v8;
    int v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_25D6ADE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_DialogSwitch(0);
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  int v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = (uint64_t *)((char *)&v26 - v11);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == *(void *)(a2 + 16))
  {
    if (v13 && a1 != a2)
    {
      unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v27 = *(void *)(v10 + 72);
      uint64_t v15 = v13 - 1;
      while (1)
      {
        sub_25D6AE4A0(a1 + v14, (uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
        sub_25D6AE4A0(a2 + v14, (uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
        uint64_t v16 = *(int *)(v4 + 24);
        uint64_t v17 = (uint64_t *)((char *)v12 + v16);
        uint64_t v18 = *(uint64_t *)((char *)v12 + v16 + 8);
        int v19 = (uint64_t *)((char *)v8 + v16);
        uint64_t v20 = v19[1];
        if (v18)
        {
          if (!v20 || (*v17 == *v19 ? (BOOL v21 = v18 == v20) : (BOOL v21 = 0), !v21 && (sub_25D6C3230() & 1) == 0))
          {
LABEL_22:
            sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
            sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
            goto LABEL_23;
          }
        }
        else if (v20)
        {
          goto LABEL_22;
        }
        if ((sub_25D6AD878(*v12, *v8) & 1) == 0) {
          goto LABEL_22;
        }
        sub_25D6C2BA0();
        sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
        char v22 = sub_25D6C2E60();
        sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
        sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_DialogSwitch);
        BOOL v24 = v15-- != 0;
        if (v22)
        {
          v14 += v27;
          if (v24) {
            continue;
          }
        }
        return v22 & 1;
      }
    }
    char v22 = 1;
  }
  else
  {
LABEL_23:
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t sub_25D6AE0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlg_CATFile(0);
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  int v8 = (uint64_t *)((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = (uint64_t *)((char *)&v32 - v11);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == *(void *)(a2 + 16))
  {
    if (v13 && a1 != a2)
    {
      unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v33 = *(void *)(v10 + 72);
      uint64_t v15 = v13 - 1;
      while (1)
      {
        sub_25D6AE4A0(a1 + v14, (uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
        sub_25D6AE4A0(a2 + v14, (uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
        uint64_t v16 = *(int *)(v4 + 24);
        uint64_t v17 = (uint64_t *)((char *)v12 + v16);
        uint64_t v18 = *(uint64_t *)((char *)v12 + v16 + 8);
        int v19 = (uint64_t *)((char *)v8 + v16);
        uint64_t v20 = v19[1];
        if (v18)
        {
          if (!v20 || (*v17 == *v19 ? (BOOL v21 = v18 == v20) : (BOOL v21 = 0), !v21 && (sub_25D6C3230() & 1) == 0))
          {
LABEL_31:
            sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
            sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
            goto LABEL_32;
          }
        }
        else if (v20)
        {
          goto LABEL_31;
        }
        uint64_t v22 = *(int *)(v4 + 28);
        uint64_t v23 = (uint64_t *)((char *)v12 + v22);
        uint64_t v24 = *(uint64_t *)((char *)v12 + v22 + 8);
        BOOL v25 = (uint64_t *)((char *)v8 + v22);
        uint64_t v26 = v25[1];
        if (v24)
        {
          if (!v26) {
            goto LABEL_31;
          }
          BOOL v27 = *v23 == *v25 && v24 == v26;
          if (!v27 && (sub_25D6C3230() & 1) == 0) {
            goto LABEL_31;
          }
        }
        else if (v26)
        {
          goto LABEL_31;
        }
        if ((sub_25D6ADE1C(*v12, *v8) & 1) == 0) {
          goto LABEL_31;
        }
        sub_25D6C2BA0();
        sub_25D6ACFF4(&qword_26A68F7E8, MEMORY[0x263F50560]);
        char v28 = sub_25D6C2E60();
        sub_25D6AE448((uint64_t)v8, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
        sub_25D6AE448((uint64_t)v12, (void (*)(void))type metadata accessor for Siri_Nlg_CATFile);
        BOOL v30 = v15-- != 0;
        if (v28)
        {
          v14 += v33;
          if (v30) {
            continue;
          }
        }
        return v28 & 1;
      }
    }
    char v28 = 1;
  }
  else
  {
LABEL_32:
    char v28 = 0;
  }
  return v28 & 1;
}

uint64_t sub_25D6AE378(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_25D6C3230();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  int v8 = a1 + 7;
  uint64_t v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = sub_25D6C3230();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25D6AE448(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25D6AE4A0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = OUTLINED_FUNCTION_14();
  v5(v4);
  return a2;
}

unint64_t sub_25D6AE4FC()
{
  unint64_t result = qword_26A68F818;
  if (!qword_26A68F818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F818);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Siri_Nlg_ContentType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Siri_Nlg_ContentType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D6AE69CLL);
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

unsigned char *sub_25D6AE6C4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Siri_Nlg_ContentType()
{
  return &type metadata for Siri_Nlg_ContentType;
}

uint64_t sub_25D6AE6F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_9Tm);
}

uint64_t sub_25D6AE70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_10Tm);
}

uint64_t sub_25D6AE724()
{
  return sub_25D6AEEFC();
}

void sub_25D6AE730()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_1_6();
  int v4 = *(_DWORD *)(v3 + 80);
  *uint64_t v0 = *v1;
  if ((v4 & 0x20000) != 0)
  {
    swift_retain();
  }
  else
  {
    uint64_t v5 = v2;
    unsigned int v6 = v1;
    BOOL v7 = v0;
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_5_0();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    swift_bridgeObjectRetain();
    uint64_t v10 = OUTLINED_FUNCTION_28();
    v9(v10);
    uint64_t v11 = *(int *)(v5 + 24);
    uint64_t v12 = (void *)((char *)v7 + v11);
    uint64_t v13 = (void *)((char *)v6 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_23();
}

uint64_t sub_25D6AE7E4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t))(v5 + 8))(v4);
  return swift_bridgeObjectRelease();
}

void sub_25D6AE86C()
{
  OUTLINED_FUNCTION_21();
  *uint64_t v1 = *v0;
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v4 = OUTLINED_FUNCTION_28();
  v3(v4);
  OUTLINED_FUNCTION_27();
  uint64_t v6 = v5[1];
  *BOOL v7 = *v5;
  v7[1] = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void *sub_25D6AE8EC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = OUTLINED_FUNCTION_24();
  v4(v3);
  OUTLINED_FUNCTION_27();
  *uint64_t v6 = *v5;
  v6[1] = v5[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25D6AE98C()
{
  OUTLINED_FUNCTION_35();
  *uint64_t v3 = v4;
  sub_25D6C2BA0();
  OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_24();
  v6(v5);
  *(_OWORD *)(v2 + *(int *)(v0 + 24)) = *(_OWORD *)(v1 + *(int *)(v0 + 24));
  return v2;
}

void *sub_25D6AEA08()
{
  OUTLINED_FUNCTION_35();
  *uint64_t v0 = v1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = OUTLINED_FUNCTION_24();
  v3(v2);
  OUTLINED_FUNCTION_27();
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  *BOOL v7 = v5;
  v7[1] = v6;
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25D6AEA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_9Tm_0);
}

uint64_t sub_25D6AEA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_10Tm_0);
}

void *sub_25D6AEAB4(void *a1, void *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D6C2BA0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *((unsigned char *)v7 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v7;
}

uint64_t sub_25D6AEBB4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25D6C2BA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25D6AEC2C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_25D6AECE0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_25D6AED88(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_25D6AEE20(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25D6AEEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_9Tm_1);
}

uint64_t sub_25D6AEED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_10Tm_1);
}

uint64_t sub_25D6AEEF0()
{
  return sub_25D6AEEFC();
}

uint64_t sub_25D6AEEFC()
{
  uint64_t result = sub_25D6C2BA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25D6AEF9C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D6C2BA0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v7 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)v7 + v14);
    int v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_25D6AF0C0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25D6C2BA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_25D6AF160(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)((char *)a1 + v11);
  uint64_t v14 = (void *)((char *)a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = (void *)((char *)a1 + v12);
  uint64_t v17 = (void *)((char *)a2 + v12);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25D6AF238(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_25D6AF32C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void *sub_25D6AF3CC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  BOOL v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25D6C2BA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25D6AF498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D6AF4AC);
}

uint64_t __swift_get_extra_inhabitant_index_9Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_25();
  }
  uint64_t v7 = sub_25D6C2BA0();
  uint64_t v8 = a1 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_25D6AF528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D6AF53C);
}

void __swift_store_extra_inhabitant_index_10Tm()
{
  OUTLINED_FUNCTION_34();
  if (v3)
  {
    *unint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_25D6C2BA0();
    uint64_t v6 = (uint64_t)v1 + *(int *)(v4 + 20);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t sub_25D6AF5B4()
{
  uint64_t result = sub_25D6C2BA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25D6AF660()
{
  unint64_t result = qword_26A68F860;
  if (!qword_26A68F860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F860);
  }
  return result;
}

unint64_t sub_25D6AF6B0()
{
  unint64_t result = qword_26A68F868;
  if (!qword_26A68F868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F868);
  }
  return result;
}

unint64_t sub_25D6AF700()
{
  unint64_t result = qword_26A68F870;
  if (!qword_26A68F870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F870);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_25D6C2C20();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_25D6C2D40();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_25D6C2B80();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_25D6C2E60();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(uint64_t))
{
  return sub_25D6AC050(v8, v7, v10, v9, a5, v11, a7);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_25D6C2BA0();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_25D6ABACC();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_25D6AB9B8();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_22@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v1 = *v0;
  if ((unint64_t)*v0 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_25D6C2B90();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return *(void *)v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_25D6C2BA0();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_25D6C2C20();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_25D6C2BA0();
}

uint64_t sub_25D6AFABC()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6AFB14()
{
  return sub_25D6AFC50();
}

uint64_t sub_25D6AFB20(char a1)
{
  return sub_25D6AFCDC(0, a1);
}

uint64_t sub_25D6AFB2C(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_0_3();
  }
  else {
    OUTLINED_FUNCTION_2_5();
  }
  sub_25D6C2F00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D6AFB84()
{
  sub_25D6C2F00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D6AFBFC()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6AFC50()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6AFCDC(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_0_3();
  }
  else {
    OUTLINED_FUNCTION_2_5();
  }
  sub_25D6C2F00();
  swift_bridgeObjectRelease();
  return sub_25D6C32E0();
}

uint64_t NLGEntityType.rawValue.getter()
{
  uint64_t v1 = 1701670760;
  if (*v0 != 1) {
    uint64_t v1 = 0x656E6F6870;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7496035;
  }
}

void *static NLGDialogGenerators.alternativeQuestion(between:and:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_25D6AFE28(a1, (uint64_t)v8);
  sub_25D6AFE28(a2, (uint64_t)v7);
  uint64_t v5 = type metadata accessor for VerbPhraseQuestionGenerator();
  swift_allocObject();
  unint64_t result = sub_25D6A5458(v8, v7, (uint64_t)sub_25D6A5454, 0);
  a3[3] = v5;
  a3[4] = &off_270A64420;
  *a3 = result;
  return result;
}

uint64_t sub_25D6AFE28(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *static NLGDialogGenerators.alternativeQuestion(between:and:)@<X0>(char *a1@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  char v4 = *a2;
  char v8 = *a1;
  char v7 = v4;
  uint64_t v5 = type metadata accessor for ExecutionDestinationQuestionGenerator();
  swift_allocObject();
  unint64_t result = sub_25D6A56D8(&v8, &v7, (uint64_t)sub_25D6A5454, 0);
  a3[3] = v5;
  a3[4] = &off_270A64410;
  *a3 = result;
  return result;
}

uint64_t NLGVerbPhrase.dialog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25D6A2350(v1, a1);
}

uint64_t NLGVerbPhrase.init(dialog:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D69F75C(a1, a2);
}

void NLGExecutionDestination.entityType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

SiriNaturalLanguageGeneration::NLGExecutionDestination __swiftcall NLGExecutionDestination.init(entityType:)(SiriNaturalLanguageGeneration::NLGExecutionDestination entityType)
{
  *uint64_t v1 = *(unsigned char *)entityType.entityType;
  return entityType;
}

SiriNaturalLanguageGeneration::NLGEntityType_optional __swiftcall NLGEntityType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25D6C31D0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_25D6AFF78(unsigned __int8 *a1, char *a2)
{
  return sub_25D6A932C(*a1, *a2);
}

uint64_t sub_25D6AFF84()
{
  return sub_25D6AFB14();
}

uint64_t sub_25D6AFF8C()
{
  return sub_25D6AFB84();
}

uint64_t sub_25D6AFF94()
{
  return sub_25D6AFC50();
}

SiriNaturalLanguageGeneration::NLGEntityType_optional sub_25D6AFF9C(Swift::String *a1)
{
  return NLGEntityType.init(rawValue:)(*a1);
}

uint64_t sub_25D6AFFA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NLGEntityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static NLGDialogGeneratorError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1u:
      if (v7 != 1) {
        goto LABEL_30;
      }
      if (v2 != v5 || v3 != v6) {
        goto LABEL_29;
      }
      LOBYTE(v7) = 1;
      unsigned __int8 v4 = 1;
      goto LABEL_16;
    case 2u:
      if (v7 != 2) {
        goto LABEL_30;
      }
      if (v2 != v5 || v3 != v6) {
        goto LABEL_29;
      }
      char v10 = 1;
      LOBYTE(v7) = 2;
      unsigned __int8 v4 = 2;
      break;
    case 3u:
      if (v7 != 3) {
        goto LABEL_30;
      }
      if (v2 != v5 || v3 != v6) {
        goto LABEL_29;
      }
      char v10 = 1;
      LOBYTE(v7) = 3;
      unsigned __int8 v4 = 3;
      break;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_30:
        char v10 = 0;
      }
      else if (v2 == v5 && v3 == v6)
      {
        LOBYTE(v7) = 0;
        unsigned __int8 v4 = 0;
LABEL_16:
        char v10 = 1;
      }
      else
      {
LABEL_29:
        char v10 = sub_25D6C3230();
        LOBYTE(v7) = v4;
      }
      break;
  }
  sub_25D6B013C(v5, v6, v7);
  sub_25D6B013C(v2, v3, v4);
  sub_25D6B0154(v2, v3, v4);
  sub_25D6B0154(v5, v6, v7);
  return v10 & 1;
}

uint64_t sub_25D6B013C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25D6B0154(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25D6B0170()
{
  unint64_t result = qword_26A68F878;
  if (!qword_26A68F878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F878);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogGenerator.generate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void type metadata accessor for NLGDialogGenerators()
{
}

uint64_t initializeBufferWithCopyOfBuffer for NLGCATIdentifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for NLGVerbPhrase(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for NLGVerbPhrase(uint64_t *a1, uint64_t *a2)
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

uint64_t assignWithTake for NLGVerbPhrase(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGVerbPhrase(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for NLGVerbPhrase(uint64_t result, int a2, int a3)
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

void type metadata accessor for NLGVerbPhrase()
{
}

void type metadata accessor for NLGExecutionDestination()
{
}

uint64_t getEnumTagSinglePayload for NLGDialogScorerType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s29SiriNaturalLanguageGeneration13NLGEntityTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25D6B0728);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for NLGEntityType()
{
}

uint64_t destroy for NLGDialogGeneratorError(uint64_t a1)
{
  return sub_25D6B0154(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s29SiriNaturalLanguageGeneration23NLGDialogGeneratorErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25D6B013C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NLGDialogGeneratorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25D6B013C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25D6B0154(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NLGDialogGeneratorError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25D6B0154(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogGeneratorError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
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

uint64_t storeEnumTagSinglePayload for NLGDialogGeneratorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
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

uint64_t sub_25D6B08F4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25D6B08FC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for NLGDialogGeneratorError()
{
}

uint64_t NLGCATIdentifier.identifier.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  return v2;
}

SiriNaturalLanguageGeneration::NLGCATIdentifier __swiftcall NLGCATIdentifier.init(_:_:)(Swift::String a1, Swift::String a2)
{
  *uint64_t v2 = a1;
  v2[1] = a2;
  result.useCase = a2;
  result.family = a1;
  return result;
}

uint64_t NLGCATIdentifier.family.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NLGCATIdentifier.useCase.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

SiriNaturalLanguageGeneration::NLGCATIdentifier_optional __swiftcall NLGCATIdentifier.init(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = v1;
  v25[0] = 35;
  v25[1] = 0xE100000000000000;
  v24[2] = v25;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_25D6B0E04(0x7FFFFFFFFFFFFFFFLL, 1u, sub_25D6A79FC, (uint64_t)v24, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRelease();
  if (v5[2] == 2)
  {
    uint64_t v6 = v5[4];
    uint64_t v7 = v5[5];
    uint64_t v8 = v5[6];
    uint64_t v9 = v5[7];
    swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x2611B0CF0](v6, v7, v8, v9);
    uint64_t v12 = v11;
    uint64_t v13 = swift_bridgeObjectRelease();
    if (v5[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      uint64_t v17 = v5[8];
      uint64_t v18 = v5[9];
      uint64_t v19 = v5[10];
      uint64_t v20 = v5[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v21 = MEMORY[0x2611B0CF0](v17, v18, v19, v20);
      uint64_t v23 = v22;
      uint64_t v13 = swift_bridgeObjectRelease();
      *uint64_t v4 = v10;
      v4[1] = v12;
      v4[2] = v21;
      v4[3] = v23;
    }
  }
  else
  {
    uint64_t v13 = swift_bridgeObjectRelease();
    *(_OWORD *)uint64_t v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
  }
  result.value.useCase._object = v16;
  result.value.useCase._uint64_t countAndFlagsBits = v15;
  result.value.family._object = v14;
  result.value.family._uint64_t countAndFlagsBits = v13;
  return result;
}

uint64_t NLGCATIdentifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25D6C2F00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25D6C2F00();
  return swift_bridgeObjectRelease();
}

uint64_t static NLGCATIdentifier.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_25D6C3230(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_25D6C3230();
    }
  }
  return result;
}

uint64_t NLGCATIdentifier.hashValue.getter()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6B0D38()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6B0DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_25D6C3230() & 1;
  }
}

uint64_t sub_25D6B0E04(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    goto LABEL_40;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v42 = v10 + 16;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_25D6B123C(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  uint64_t v41 = a1;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_25D6C2F90();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      unint64_t v14 = sub_25D6C2F10();
      goto LABEL_21;
    }
    int v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14) {
        goto LABEL_38;
      }
      uint64_t v21 = sub_25D6C2FB0();
      uint64_t v43 = v23;
      uint64_t v44 = v22;
      uint64_t v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D6B3F48();
        uint64_t v13 = v28;
      }
      unint64_t v25 = *(void *)(v13 + 16);
      if (v25 >= *(void *)(v13 + 24) >> 1)
      {
        sub_25D6B3F48();
        uint64_t v13 = v29;
      }
      *(void *)(v13 + 16) = v25 + 1;
      uint64_t v26 = (void *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(void *)uint64_t v42 = v13;
    }
    uint64_t v27 = sub_25D6C2F10();
    unint64_t v14 = v27;
    *(void *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(void *)(v13 + 16) == v41) {
      break;
    }
    unint64_t v15 = v27;
    unint64_t v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14) {
      goto LABEL_30;
    }
  }
  unint64_t v16 = v27;
  unint64_t v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_25D6C2FB0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    sub_25D6BA464();
    uint64_t v38 = *(void *)(*(void *)v42 + 16);
    sub_25D6BA508(v38);
    uint64_t v13 = *(void *)v42;
    *(void *)(v13 + 16) = v38 + 1;
    char v39 = (void *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(void *)uint64_t v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_0_4();
LABEL_40:
  uint64_t result = sub_25D6C3170();
  __break(1u);
  return result;
}

uint64_t sub_25D6B123C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_25D6C2FB0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    sub_25D6BA464();
    uint64_t v14 = *(void *)(*(void *)(a4 + 16) + 16);
    sub_25D6BA508(v14);
    uint64_t v15 = *(void *)(a4 + 16);
    *(void *)(v15 + 16) = v14 + 1;
    unint64_t v16 = (void *)(v15 + 32 * v14);
    uint64_t v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_25D6C3170();
  __break(1u);
  return result;
}

uint64_t sub_25D6B1344(uint64_t *a1, uint64_t *a2)
{
  return sub_25D6B0DC0(*a1, a1[1], *a2, a2[1]) & 1;
}

unint64_t sub_25D6B1374()
{
  unint64_t result = qword_26A68F880;
  if (!qword_26A68F880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F880);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplate:locale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplates:locale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplate:locale:parameters:catGlobals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

unint64_t destroy for NLGDialogProviderError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s29SiriNaturalLanguageGeneration22NLGDialogProviderErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for NLGDialogProviderError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NLGDialogProviderError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogProviderError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NLGDialogProviderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25D6B1658(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25D6B1670(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogProviderError()
{
  return &type metadata for NLGDialogProviderError;
}

uint64_t destroy for NLGCATIdentifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NLGCATIdentifier(void *a1, void *a2)
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

void *assignWithCopy for NLGCATIdentifier(void *a1, void *a2)
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

void *assignWithTake for NLGCATIdentifier(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGCATIdentifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for NLGCATIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NLGCATIdentifier()
{
  return &type metadata for NLGCATIdentifier;
}

uint64_t sub_25D6B1870()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25D6B18A8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t NLGDialogSelector.select(from:defaultDialog:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 8))(&v6, a1, a2, a3);
  return sub_25D69F75C(&v6, a4);
}

void *sub_25D6B1A28()
{
  type metadata accessor for UserDefaultsDialogRecorder();
  swift_allocObject();
  __n128 result = sub_25D6B906C(50, 0x6948676F6C616944, 0xED000079726F7473);
  qword_26A68F888 = (uint64_t)result;
  return result;
}

uint64_t static NLGDialogSelectors.randomOriginal()()
{
  uint64_t v4 = MEMORY[0x263F8E298];
  uint64_t v5 = MEMORY[0x263F8E2A0];
  OUTLINED_FUNCTION_1_8();
  static NLGDialogSelectors.randomOriginal(randomNumberGenerator:dialogRecorder:)((uint64_t)v3, (uint64_t)v2, v0);
  sub_25D6A22D4((uint64_t)v2, &qword_26A68F890);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

uint64_t static NLGDialogSelectors.randomOriginal(randomNumberGenerator:dialogRecorder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_25D6A2350(a1, (uint64_t)v11);
  sub_25D6B1F94(a2, (uint64_t)&v8);
  if (v9)
  {
    sub_25D69F75C(&v8, (uint64_t)v10);
  }
  else
  {
    if (qword_26A68F4B8 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_26A68F888;
    v10[3] = type metadata accessor for UserDefaultsDialogRecorder();
    v10[4] = &off_270A64D10;
    v10[0] = v5;
    swift_retain();
    sub_25D6A22D4((uint64_t)&v8, &qword_26A68F890);
  }
  uint64_t v6 = type metadata accessor for RandomOriginalDialogSelector();
  swift_allocObject();
  uint64_t result = sub_25D69D738((uint64_t)v11, (uint64_t)v10);
  a3[3] = v6;
  a3[4] = (uint64_t)&off_270A64378;
  *a3 = result;
  return result;
}

uint64_t static NLGDialogSelectors.highestScoring(using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v9[3] = type metadata accessor for IdentifiedDialogOrFirstSelector();
  v9[4] = &off_270A64368;
  v9[0] = swift_initStaticObject();
  type metadata accessor for HighestScoringDialogSelector();
  uint64_t v4 = swift_allocObject();
  sub_25D6B1FFC((uint64_t)v9, v4 + 16);
  sub_25D6A2350(a1, (uint64_t)v9);
  uint64_t v5 = type metadata accessor for DialogScorerSelector();
  uint64_t v6 = swift_allocObject();
  swift_retain();
  uint64_t v7 = sub_25D6B2064((uint64_t)v9, v4, v6, (uint64_t (*)(void))type metadata accessor for HighestScoringDialogSelector, (uint64_t)&off_270A64340, (uint64_t)&unk_270A64AF8, (uint64_t)sub_25D6B23F8);
  a2[3] = v5;
  a2[4] = (uint64_t)&off_270A64350;
  uint64_t result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t static NLGDialogSelectors.highestScoringOriginal(using:)()
{
  OUTLINED_FUNCTION_1_8();
  static NLGDialogSelectors.highestScoringOriginal(using:dialogRecorder:)(v0, (uint64_t)v3, v1);
  return sub_25D6A22D4((uint64_t)v3, &qword_26A68F890);
}

uint64_t static NLGDialogSelectors.highestScoringOriginal(using:dialogRecorder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_25D6B1F94(a2, (uint64_t)&v11);
  if (v12)
  {
    sub_25D69F75C(&v11, (uint64_t)&v13);
  }
  else
  {
    if (qword_26A68F4B8 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_26A68F888;
    uint64_t v14 = type metadata accessor for UserDefaultsDialogRecorder();
    uint64_t v15 = &off_270A64D10;
    *(void *)&long long v13 = v5;
    swift_retain();
    sub_25D6A22D4((uint64_t)&v11, &qword_26A68F890);
  }
  type metadata accessor for HighestScoringOriginalDialogSelector();
  uint64_t v6 = swift_allocObject();
  sub_25D69F75C(&v13, v6 + 16);
  *(unsigned char *)(v6 + 56) = 0;
  sub_25D6A2350(a1, (uint64_t)&v13);
  uint64_t v7 = type metadata accessor for DialogScorerSelector();
  uint64_t v8 = swift_allocObject();
  swift_retain();
  uint64_t v9 = sub_25D6B2064((uint64_t)&v13, v6, v8, (uint64_t (*)(void))type metadata accessor for HighestScoringOriginalDialogSelector, (uint64_t)&off_270A64330, (uint64_t)&unk_270A64AD0, (uint64_t)sub_25D6A23C4);
  a3[3] = v7;
  a3[4] = (uint64_t)&off_270A64350;
  uint64_t result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t static NLGDialogSelectorError.== infix(_:_:)()
{
  return 1;
}

uint64_t NLGDialogSelectorError.hash(into:)()
{
  return sub_25D6C32D0();
}

uint64_t NLGDialogSelectorError.hashValue.getter()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6B1F24()
{
  return NLGDialogSelectorError.hashValue.getter();
}

uint64_t sub_25D6B1F3C()
{
  return NLGDialogSelectorError.hash(into:)();
}

uint64_t sub_25D6B1F54()
{
  return sub_25D6C32E0();
}

uint64_t sub_25D6B1F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6B1FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6B2064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  v22[3] = a4(0);
  v22[4] = a5;
  v22[0] = a2;
  sub_25D6A2350(a1, a3 + 16);
  sub_25D6A2350((uint64_t)v22, a3 + 56);
  sub_25D6A2350(a1, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8A8);
  if (swift_dynamicCast())
  {
    sub_25D69F75C(v17, (uint64_t)v19);
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    __swift_project_boxed_opaque_existential_1(v19, v20);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v18, v12, v13);
    *(unsigned char *)(a3 + 104) = v18[0];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    OUTLINED_FUNCTION_1_8();
    sub_25D6A22D4((uint64_t)v17, &qword_26A68F8B0);
    *(unsigned char *)(a3 + 104) = 2;
  }
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 36;
  type metadata accessor for SELFLogger();
  swift_allocObject();
  uint64_t v15 = sub_25D6BA934((uint64_t)&unk_26A68FA18, 0, (uint64_t)sub_25D6BA800, 0, 36, a7, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(a3 + 96) = v15;
  return a3;
}

unint64_t sub_25D6B2230()
{
  unint64_t result = qword_26A68F898;
  if (!qword_26A68F898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F898);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogSelector.select(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NLGDialogSelector.select(from:defaultDialog:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

ValueMetadata *type metadata accessor for NLGDialogSelectors()
{
  return &type metadata for NLGDialogSelectors;
}

uint64_t getEnumTagSinglePayload for NLGDialogSelectorError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NLGDialogSelectorError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D6B23B8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogSelectorError()
{
  return &type metadata for NLGDialogSelectorError;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

double OUTLINED_FUNCTION_1_8()
{
  return 0.0;
}

uint64_t sub_25D6B241C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8C0);
  MEMORY[0x270FA5388](v0 - 8, v1);
  OUTLINED_FUNCTION_0_6();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_25D6B259C();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v5;
  sub_25D6C2A10();
  uint64_t v8 = sub_25D6C2A00();
  if (__swift_getEnumTagSinglePayload(v4, 1, v8) == 1)
  {
    swift_bridgeObjectRelease();
    sub_25D6A22D4(v4, &qword_26A68F8C0);
    return 0;
  }
  else
  {
    sub_25D6C29D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v4, v8);
    swift_bridgeObjectRetain();
    sub_25D6C2F20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25D6C2F20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v7;
  }
}

uint64_t sub_25D6B259C()
{
  uint64_t v0 = sub_25D6C2A40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  OUTLINED_FUNCTION_0_6();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8B8);
  MEMORY[0x270FA5388](v6 - 8, v7);
  OUTLINED_FUNCTION_0_6();
  uint64_t v10 = v9 - v8;
  sub_25D6C2A50();
  sub_25D6C2A30();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v5, v0);
  uint64_t v11 = sub_25D6C29E0();
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    sub_25D6A22D4(v10, &qword_26A68F8B8);
    return 0;
  }
  else
  {
    uint64_t v12 = sub_25D6C29D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  return v12;
}

uint64_t sub_25D6B2744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_25D6B89CC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_25D6B279C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_25D6B89CC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_25D6B4780(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double NLGDialogBuilder.__allocating_init()()
{
  uint64_t v0 = (_OWORD *)swift_allocObject();
  double result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[6] = 0u;
  v0[7] = 0u;
  return result;
}

double sub_25D6B2838@<D0>(_OWORD *a1@<X8>)
{
  return NLGDialog.source.getter(a1);
}

double NLGDialog.source.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_25D6B2860()
{
  return 0;
}

uint64_t NLGDialogContent.sourceKeywords.getter()
{
  return 0;
}

uint64_t static NLGDialogSource.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  BOOL v10 = *a1 == *a2 && a1[1] == a2[1];
  if (v10 || (v11 = sub_25D6C3230(), uint64_t result = 0, (v11 & 1) != 0))
  {
    BOOL v13 = v2 == v6 && v4 == v7;
    if (v13 || (v14 = sub_25D6C3230(), uint64_t result = 0, (v14 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
      {
        return 1;
      }
      else
      {
        return sub_25D6C3230();
      }
    }
  }
  return result;
}

uint64_t sub_25D6B2970(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_25D6B297C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_25D6B2988(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_25D6B2994(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_25D6B29A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[10];
  uint64_t v3 = v1[11];
  uint64_t v4 = v1[12];
  uint64_t v5 = v1[13];
  uint64_t v6 = v1[14];
  uint64_t v7 = v1[15];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_25D6B4730(v2, v3);
}

uint64_t sub_25D6B29BC(_OWORD *a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v2 = *(void *)(v1 + 88);
  long long v4 = a1[1];
  *(_OWORD *)(v1 + 80) = *a1;
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 112) = a1[2];
  return sub_25D6B36A8(v3, v2);
}

double NLGDialogBuilder.init()()
{
  double result = 0.0;
  v0[6] = 0u;
  v0[7] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_25D6B29FC(uint64_t a1)
{
  sub_25D6B279C(25705, 0xE200000000000000, a1, &v67);
  if (v68)
  {
    if (OUTLINED_FUNCTION_0_7())
    {
      uint64_t v2 = v59;
      uint64_t v3 = v63;
      goto LABEL_6;
    }
  }
  else
  {
    sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0xE000000000000000;
LABEL_6:
  swift_bridgeObjectRetain();
  sub_25D6B2970(v2, v3);
  swift_bridgeObjectRelease();
  sub_25D6B279C(0x746E65746E6F63, 0xE700000000000000, a1, &v67);
  if (!v68)
  {
    sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8D0);
  uint64_t v4 = OUTLINED_FUNCTION_0_7();
  if ((v4 & 1) == 0)
  {
LABEL_12:
    uint64_t v14 = MEMORY[0x263F8EE78];
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_6_3(v4, v5, v6, v7, v8, v9, v10, v11, v59, v63, v67);
  if (v68)
  {
    if (OUTLINED_FUNCTION_0_7())
    {
      uint64_t v12 = v60;
      unint64_t v13 = v64;
      goto LABEL_15;
    }
  }
  else
  {
    sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
LABEL_15:
  sub_25D6B3558();
  uint64_t v14 = v15;
  unint64_t v23 = *(void *)(v15 + 16);
  if (v23 >= *(void *)(v15 + 24) >> 1)
  {
    OUTLINED_FUNCTION_13_0();
    uint64_t v14 = v15;
  }
  *(void *)(v14 + 16) = v23 + 1;
  uint64_t v24 = v14 + 16 * v23;
  *(void *)(v24 + 32) = v12;
  *(void *)(v24 + 40) = v13;
  OUTLINED_FUNCTION_9_2(v15, v16, v17, v18, v19, v20, v21, v22, v60, v64, v67);
  swift_bridgeObjectRelease();
  if (!v68)
  {
    sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
    goto LABEL_21;
  }
  if (!OUTLINED_FUNCTION_0_7())
  {
LABEL_21:
    uint64_t v25 = 0;
    unint64_t v26 = 0xE000000000000000;
    goto LABEL_22;
  }
  uint64_t v25 = v59;
  unint64_t v26 = v63;
LABEL_22:
  unint64_t v27 = *(void *)(v14 + 16);
  if (v27 >= *(void *)(v14 + 24) >> 1)
  {
    OUTLINED_FUNCTION_13_0();
    uint64_t v14 = v57;
  }
  *(void *)(v14 + 16) = v27 + 1;
  uint64_t v28 = v14 + 16 * v27;
  *(void *)(v28 + 32) = v25;
  *(void *)(v28 + 40) = v26;
LABEL_25:
  sub_25D6B279C(0x6E6F6974706163, 0xE700000000000000, a1, &v67);
  if (!v68)
  {
    sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
    goto LABEL_45;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8D0);
  uint64_t v29 = OUTLINED_FUNCTION_0_7();
  if (v29)
  {
    OUTLINED_FUNCTION_6_3(v29, v30, v31, v32, v33, v34, v35, v36, v59, v63, v67);
    if (v68)
    {
      if (OUTLINED_FUNCTION_0_7())
      {
        uint64_t v37 = v61;
        unint64_t v38 = v65;
        goto LABEL_33;
      }
    }
    else
    {
      sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
    }
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
LABEL_33:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      OUTLINED_FUNCTION_13_0();
      uint64_t v14 = isUniquelyReferenced_nonNull_native;
    }
    unint64_t v47 = *(void *)(v14 + 16);
    if (v47 >= *(void *)(v14 + 24) >> 1)
    {
      OUTLINED_FUNCTION_13_0();
      uint64_t v14 = isUniquelyReferenced_nonNull_native;
    }
    *(void *)(v14 + 16) = v47 + 1;
    uint64_t v48 = v14 + 16 * v47;
    *(void *)(v48 + 32) = v37;
    *(void *)(v48 + 40) = v38;
    OUTLINED_FUNCTION_9_2(isUniquelyReferenced_nonNull_native, v40, v41, v42, v43, v44, v45, v46, v61, v65, v67);
    swift_bridgeObjectRelease();
    if (v68)
    {
      if (OUTLINED_FUNCTION_0_7())
      {
        uint64_t v49 = v62;
        unint64_t v50 = v66;
LABEL_42:
        unint64_t v51 = *(void *)(v14 + 16);
        if (v51 >= *(void *)(v14 + 24) >> 1)
        {
          OUTLINED_FUNCTION_13_0();
          uint64_t v14 = v58;
        }
        *(void *)(v14 + 16) = v51 + 1;
        uint64_t v52 = v14 + 16 * v51;
        *(void *)(v52 + 32) = v49;
        *(void *)(v52 + 40) = v50;
        goto LABEL_45;
      }
    }
    else
    {
      sub_25D6A22D4((uint64_t)&v67, &qword_26A68F8C8);
    }
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    goto LABEL_42;
  }
LABEL_45:
  *(void *)&long long v67 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5E0);
  sub_25D6A38B4();
  uint64_t v53 = sub_25D6C2E50();
  uint64_t v55 = v54;
  swift_bridgeObjectRelease();
  sub_25D6B297C(v53, v55);
  return swift_retain();
}

uint64_t sub_25D6B2DD4(uint64_t a1, uint64_t a2)
{
  return sub_25D6B2E34(a1, a2, (void (*)(uint64_t, uint64_t))sub_25D6B2970);
}

uint64_t sub_25D6B2DEC(uint64_t a1, uint64_t a2)
{
  return sub_25D6B2E34(a1, a2, (void (*)(uint64_t, uint64_t))sub_25D6B297C);
}

uint64_t sub_25D6B2E04(uint64_t a1, uint64_t a2)
{
  return sub_25D6B2E34(a1, a2, (void (*)(uint64_t, uint64_t))sub_25D6B2988);
}

uint64_t sub_25D6B2E1C(uint64_t a1, uint64_t a2)
{
  return sub_25D6B2E34(a1, a2, (void (*)(uint64_t, uint64_t))sub_25D6B2994);
}

uint64_t sub_25D6B2E34(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  a3(a1, a2);
  return swift_retain();
}

uint64_t sub_25D6B2E90(void *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  *(void *)&long long v7 = *a1;
  *((void *)&v7 + 1) = v1;
  uint64_t v8 = v2;
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  uint64_t v11 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D6B29BC(&v7);
  return swift_retain();
}

uint64_t sub_25D6B2F08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  if (!v1[5] && !v1[7])
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25D6C2DE0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A691DB8);
    uint64_t v4 = sub_25D6C2DC0();
    os_log_type_t v5 = sub_25D6C3050();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (_WORD *)swift_slowAlloc();
      *uint64_t v6 = 0;
      OUTLINED_FUNCTION_16_0(&dword_25D698000, v7, v8, "Text and keywords are both empty");
      MEMORY[0x2611B1630](v6, -1, -1);
    }
  }
  if (v2[3])
  {
    unint64_t v22 = v2[3];
    uint64_t v23 = v2[2];
  }
  else
  {
    unint64_t v22 = 0xE000000000000000;
    uint64_t v23 = 0;
  }
  if (v2[5])
  {
    uint64_t v9 = v2[4];
    unint64_t v10 = v2[5];
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  if (v2[7])
  {
    uint64_t v11 = v2[6];
    unint64_t v12 = v2[7];
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  if (v2[9])
  {
    uint64_t v13 = v2[8];
    unint64_t v14 = v2[9];
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  uint64_t v29 = &unk_270A651C0;
  uint64_t v30 = &off_270A65218;
  uint64_t v15 = (void *)swift_allocObject();
  *(void *)&long long v28 = v15;
  void v15[2] = v9;
  v15[3] = v10;
  v15[4] = v11;
  v15[5] = v12;
  v15[6] = v13;
  v15[7] = v14;
  sub_25D6B29A0((uint64_t *)v25);
  long long v20 = v25[1];
  long long v21 = v25[0];
  uint64_t v16 = v26;
  uint64_t v17 = v27;
  a1[3] = (uint64_t)&unk_270A65138;
  a1[4] = (uint64_t)&off_270A651F8;
  uint64_t v18 = swift_allocObject();
  *a1 = v18;
  *(void *)(v18 + 16) = v23;
  *(void *)(v18 + 24) = v22;
  sub_25D69F75C(&v28, v18 + 32);
  *(_OWORD *)(v18 + 72) = v21;
  *(_OWORD *)(v18 + 88) = v20;
  *(void *)(v18 + 104) = v16;
  *(void *)(v18 + 112) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t NLGDialogBuilder.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D6B36A8(*(void *)(v0 + 80), *(void *)(v0 + 88));
  return v0;
}

uint64_t NLGDialogBuilder.__deallocating_deinit()
{
  NLGDialogBuilder.deinit();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

double NLGScoredDialogBuilder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 44) = 0u;
  *(unsigned char *)(v0 + 60) = 1;
  return result;
}

double NLGScoredDialogBuilder.init()()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 44) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(unsigned char *)(v0 + 60) = 1;
  return result;
}

uint64_t sub_25D6B3220(uint64_t a1)
{
  sub_25D6A2350(a1, (uint64_t)v3);
  swift_beginAccess();
  sub_25D6B36F8((uint64_t)v3, v1 + 16);
  swift_endAccess();
  return swift_retain();
}

uint64_t sub_25D6B3280(float a1)
{
  *(float *)(v1 + 56) = a1;
  *(unsigned char *)(v1 + 60) = 0;
  return swift_retain();
}

void sub_25D6B3290(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  sub_25D6B3760(v1 + 16, (uint64_t)&v16);
  if (v17)
  {
    sub_25D69F75C(&v16, (uint64_t)v18);
    if (*(unsigned char *)(v1 + 60) == 1)
    {
      if (qword_26A68F470 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25D6C2DE0();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A691DB8);
      os_log_type_t v5 = sub_25D6C2DC0();
      os_log_type_t v6 = sub_25D6C3050();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (_WORD *)swift_slowAlloc();
        *uint64_t v7 = 0;
        OUTLINED_FUNCTION_16_0(&dword_25D698000, v8, v9, "Score is empty, defaulting to 0");
        MEMORY[0x2611B1630](v7, -1, -1);
      }
    }
    sub_25D69F75C(v18, (uint64_t)&v16);
    if (*(unsigned char *)(v2 + 60)) {
      float v10 = 0.0;
    }
    else {
      float v10 = *(float *)(v2 + 56);
    }
    *(void *)(a1 + 24) = &unk_270A650B8;
    *(void *)(a1 + 32) = &off_270A651E0;
    uint64_t v11 = swift_allocObject();
    *(void *)a1 = v11;
    sub_25D69F75C(&v16, v11 + 16);
    *(float *)(v11 + 56) = v10;
  }
  else
  {
    sub_25D6A22D4((uint64_t)&v16, &qword_26A68F5B0);
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25D6C2DE0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A691DB8);
    uint64_t v13 = sub_25D6C2DC0();
    os_log_type_t v14 = sub_25D6C3050();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_25D698000, v13, v14, "Dialog is empty", v15, 2u);
      MEMORY[0x2611B1630](v15, -1, -1);
    }

    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

uint64_t NLGScoredDialogBuilder.deinit()
{
  sub_25D6A22D4(v0 + 16, &qword_26A68F5B0);
  return v0;
}

uint64_t NLGScoredDialogBuilder.__deallocating_deinit()
{
  sub_25D6A22D4(v0 + 16, &qword_26A68F5B0);
  return MEMORY[0x270FA0228](v0, 61, 7);
}

void sub_25D6B3558()
{
  OUTLINED_FUNCTION_12_1();
  if (v2)
  {
    OUTLINED_FUNCTION_2_6();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_2();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  OUTLINED_FUNCTION_5_5();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F920);
    os_log_type_t v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_10_2(v5);
    OUTLINED_FUNCTION_7_2(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_14_0();
    sub_25D6B77F4(v7, v8, v9);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    sub_25D6B410C(v10, v11, v12, v13);
  }
}

uint64_t sub_25D6B3604()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25D6B364C()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  if (*(void *)(v0 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_25D6B36A8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25D6B36F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6B3760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6B37C8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 60, 7);
}

uint64_t dispatch thunk of NLGDialog.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialog.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLGDialog.source.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NLGDialogContent.text.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogContent.keywords.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLGDialogContent.sourceKeywords.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t destroy for NLGDialogSource()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NLGDialogSource(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NLGDialogSource(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

void *assignWithTake for NLGDialogSource(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogSource(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for NLGDialogSource(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogSource()
{
  return &type metadata for NLGDialogSource;
}

uint64_t type metadata accessor for NLGDialogBuilder()
{
  return self;
}

uint64_t method lookup function for NLGDialogBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NLGDialogBuilder);
}

uint64_t dispatch thunk of NLGDialogBuilder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of NLGDialogBuilder.fromDictionary(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of NLGDialogBuilder.identifier(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of NLGDialogBuilder.text(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of NLGDialogBuilder.keywords(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of NLGDialogBuilder.sourceKeywords(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of NLGDialogBuilder.source(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of NLGDialogBuilder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of NLGScoredDialog.dialog.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGScoredDialog.score.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for NLGScoredDialogBuilder()
{
  return self;
}

uint64_t method lookup function for NLGScoredDialogBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NLGScoredDialogBuilder);
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.dialog(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.score(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

void sub_25D6B3D0C()
{
  OUTLINED_FUNCTION_12_1();
  if (v2)
  {
    OUTLINED_FUNCTION_2_6();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_2();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  OUTLINED_FUNCTION_5_5();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F910);
    uint64_t v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_10_2(v5);
    OUTLINED_FUNCTION_7_2(v6);
  }
  if (v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_14_0();
    sub_25D6B7850(v7);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    uint64_t v8 = OUTLINED_FUNCTION_4_5();
    sub_25D6B4204(v8, v9, v10, v11);
  }
}

void sub_25D6B3DB8()
{
  OUTLINED_FUNCTION_12_1();
  if (v3)
  {
    OUTLINED_FUNCTION_2_6();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_11_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  OUTLINED_FUNCTION_5_5();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F900);
    uint64_t v6 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_10_2(v6);
    *(void *)(v2 + 16) = v1;
    *(void *)(v2 + 24) = 2 * (v7 / 24);
  }
  if (v0)
  {
    uint64_t v8 = (char *)OUTLINED_FUNCTION_14_0();
    sub_25D6B7944(v8, v9, v10);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_4_5();
    sub_25D6B431C(v11, v12, v13, v14);
  }
}

void sub_25D6B3E74()
{
  OUTLINED_FUNCTION_12_1();
  if (v2)
  {
    OUTLINED_FUNCTION_2_6();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_2();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  OUTLINED_FUNCTION_5_5();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8E8);
    char v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_10_2(v5);
    OUTLINED_FUNCTION_7_2(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_14_0();
    sub_25D6B7A44(v7, v8, v9);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    sub_25D6B443C(v10, v11, v12, v13);
  }
}

void sub_25D6B3F20(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25D6B3F48()
{
  OUTLINED_FUNCTION_12_1();
  if (v2)
  {
    OUTLINED_FUNCTION_2_6();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_2();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  OUTLINED_FUNCTION_5_5();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F928);
    char v5 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_10_2(v5);
    OUTLINED_FUNCTION_7_2(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_14_0();
    sub_25D6B7B04(v7, v8, v9);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    sub_25D6B4534(v10, v11, v12, v13);
  }
}

void sub_25D6B3FF4(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25D6B401C(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, unint64_t))
{
  if (a3)
  {
    OUTLINED_FUNCTION_2_6();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_11_2();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_4();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    long long v16 = (void *)swift_allocObject();
    size_t v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 40);
  }
  else
  {
    long long v16 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v18 = (unint64_t)(v16 + 4);
  if (a1)
  {
    a7(a4 + 32, v14, v18);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    sub_25D6B462C(0, v14, v18, a4, a6);
  }
}

uint64_t sub_25D6B410C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B4204(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F918);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B431C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F908);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B443C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B4534(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B462C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  OUTLINED_FUNCTION_0_4();
  uint64_t result = sub_25D6C31C0();
  __break(1u);
  return result;
}

uint64_t sub_25D6B4730(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25D6B4780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return 0;
}

double OUTLINED_FUNCTION_6_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  return sub_25D6B279C(0x746E697270, 0xE500000000000000, a9, &a11);
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_9_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  return sub_25D6B279C(0x6B61657073, 0xE500000000000000, v11, &a11);
}

size_t OUTLINED_FUNCTION_10_2(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

void OUTLINED_FUNCTION_13_0()
{
  sub_25D6B3558();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0 + 32;
}

void OUTLINED_FUNCTION_16_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_25D6B4940(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25D6B82D0(0, v2, 0);
    uint64_t v3 = v14;
    uint64_t v6 = a1 + 32;
    do
    {
      uint64_t v7 = a2(v6);
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_25D6B82D0((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v6 += 40;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_25D6B4A30(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a2 + 16);
  if (v5 >= v4) {
    unint64_t v6 = *(void *)(a1 + 16);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 16);
  }
  uint64_t v39 = MEMORY[0x263F8EE78];
  sub_25D6B83E0(0, v6, 0);
  unint64_t v33 = v4;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  if (v6)
  {
    uint64_t v7 = a1 + 32;
    uint64_t v8 = (int *)(a2 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v10 = v6;
    unint64_t v11 = v4;
    unint64_t v12 = v5;
    while (v11)
    {
      uint64_t result = sub_25D6A2350(v7, (uint64_t)&v37);
      if (!v12) {
        goto LABEL_29;
      }
      int v13 = *v8;
      sub_25D69F75C(&v37, (uint64_t)&v35);
      *(_DWORD *)&v36[24] = v13;
      sub_25D6A2350((uint64_t)&v35, (uint64_t)v34);
      sub_25D69F75C(v34, (uint64_t)&v37);
      *(_DWORD *)&v38[24] = v13;
      sub_25D6A22D4((uint64_t)&v35, &qword_26A68F940);
      uint64_t v14 = v39;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0(0, *(void *)(v14 + 16) + 1, 1);
        uint64_t v14 = v39;
      }
      unint64_t v16 = *(void *)(v14 + 16);
      unint64_t v15 = *(void *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0((char *)(v15 > 1), v16 + 1, 1);
        uint64_t v14 = v39;
      }
      *(void *)(v14 + 16) = v16 + 1;
      size_t v17 = (_OWORD *)(v14 + 48 * v16);
      long long v18 = v37;
      long long v19 = *(_OWORD *)v38;
      *(_OWORD *)((char *)v17 + 60) = *(_OWORD *)&v38[12];
      --v12;
      long long v17[2] = v18;
      v17[3] = v19;
      --v11;
      ++v8;
      v7 += 40;
      if (!--v10) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
LABEL_15:
    unint64_t v21 = v5;
    unint64_t v20 = v33;
    if (v33 <= v5)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v39;
    }
    uint64_t v22 = v31 + 40 * v6 + 32;
    while (v6 < v20)
    {
      uint64_t result = sub_25D6A2350(v22, (uint64_t)v34);
      if (v21 == v6)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        goto LABEL_27;
      }
      if (v6 >= v21) {
        goto LABEL_31;
      }
      int v23 = *(_DWORD *)(v32 + 32 + 4 * v6);
      sub_25D69F75C(v34, (uint64_t)&v35);
      *(_DWORD *)&v36[24] = v23;
      long long v37 = v35;
      *(_OWORD *)unint64_t v38 = *(_OWORD *)v36;
      *(_OWORD *)&v38[12] = *(_OWORD *)&v36[12];
      sub_25D6A2350((uint64_t)&v37, (uint64_t)v34);
      int v24 = *(_DWORD *)&v38[24];
      sub_25D69F75C(v34, (uint64_t)&v35);
      *(_DWORD *)&v36[24] = v24;
      sub_25D6A22D4((uint64_t)&v37, &qword_26A68F940);
      uint64_t v25 = v39;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0(0, *(void *)(v25 + 16) + 1, 1);
        uint64_t v25 = v39;
      }
      unint64_t v27 = *(void *)(v25 + 16);
      unint64_t v26 = *(void *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0((char *)(v26 > 1), v27 + 1, 1);
        uint64_t v25 = v39;
      }
      ++v6;
      *(void *)(v25 + 16) = v27 + 1;
      long long v28 = (_OWORD *)(v25 + 48 * v27);
      long long v29 = v35;
      long long v30 = *(_OWORD *)v36;
      *(_OWORD *)((char *)v28 + 60) = *(_OWORD *)&v36[12];
      void v28[2] = v29;
      uint64_t v28[3] = v30;
      v22 += 40;
      unint64_t v21 = v5;
      unint64_t v20 = v33;
      if (v33 == v6) {
        goto LABEL_27;
      }
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25D6B4D44(void (*a1)(_OWORD *__return_ptr, _OWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = *(void *)(a3 + 16);
  unint64_t v7 = *(void *)(a4 + 16);
  if (v7 >= v6) {
    int64_t v8 = *(void *)(a3 + 16);
  }
  else {
    int64_t v8 = *(void *)(a4 + 16);
  }
  uint64_t v40 = MEMORY[0x263F8EE78];
  sub_25D6B83E0(0, v8, 0);
  unint64_t v33 = v7;
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  int64_t v30 = v8;
  if (v8)
  {
    uint64_t v9 = v40;
    uint64_t v10 = a3 + 32;
    uint64_t v11 = a4 + 32;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v13 = v6;
    while (v13)
    {
      uint64_t result = sub_25D6B5824(v10, (uint64_t)&v37);
      if (!v7) {
        goto LABEL_34;
      }
      __dst[0] = v37;
      __dst[1] = v38[0];
      *(_OWORD *)((char *)&__dst[1] + 12) = *(_OWORD *)((char *)v38 + 12);
      sub_25D6A2350(v11, (uint64_t)&__dst[3]);
      a1(__src, __dst);
      if (v35)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_25D6A22D4((uint64_t)__dst, &qword_26A68F938);
      }
      sub_25D6A22D4((uint64_t)__dst, &qword_26A68F938);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v40;
      }
      unint64_t v15 = *(void *)(v9 + 16);
      unint64_t v14 = *(void *)(v9 + 24);
      if (v15 >= v14 >> 1)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v9 = v40;
      }
      *(void *)(v9 + 16) = v15 + 1;
      unint64_t v16 = (_OWORD *)(v9 + 48 * v15);
      long long v17 = __src[0];
      long long v18 = __src[1];
      *(_OWORD *)((char *)v16 + 60) = *(_OWORD *)((char *)&__src[1] + 12);
      --v7;
      v16[2] = v17;
      v16[3] = v18;
      --v13;
      v11 += 40;
      v10 += 48;
      if (!--v8) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
LABEL_16:
    unint64_t v20 = v33;
    unint64_t v19 = v6;
    if (v6 <= v33)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v40;
    }
    unint64_t v21 = v30;
    uint64_t v22 = v32 + 48 * v30 + 32;
    uint64_t v23 = v31 + 40 * v30 + 32;
    while (v21 < v19)
    {
      uint64_t result = sub_25D6B5824(v22, (uint64_t)&v37);
      if (v20 == v21)
      {
        sub_25D6B5880((uint64_t)&v37);
        goto LABEL_31;
      }
      if (v21 >= v20) {
        goto LABEL_36;
      }
      __src[0] = v37;
      __src[1] = v38[0];
      *(_OWORD *)((char *)&__src[1] + 12) = *(_OWORD *)((char *)v38 + 12);
      sub_25D6A2350(v23, (uint64_t)&__src[3]);
      memcpy(__dst, __src, 0x58uLL);
      a1(__src, __dst);
      sub_25D6A22D4((uint64_t)__dst, &qword_26A68F938);
      if (v35)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      uint64_t v24 = v40;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0(0, *(void *)(v24 + 16) + 1, 1);
        uint64_t v24 = v40;
      }
      unint64_t v26 = *(void *)(v24 + 16);
      unint64_t v25 = *(void *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        uint64_t result = (uint64_t)sub_25D6B83E0((char *)(v25 > 1), v26 + 1, 1);
        uint64_t v24 = v40;
      }
      ++v21;
      *(void *)(v24 + 16) = v26 + 1;
      unint64_t v27 = (_OWORD *)(v24 + 48 * v26);
      long long v28 = __src[0];
      long long v29 = __src[1];
      *(_OWORD *)((char *)v27 + 60) = *(_OWORD *)((char *)&__src[1] + 12);
      v27[2] = v28;
      v27[3] = v29;
      v22 += 48;
      v23 += 40;
      unint64_t v20 = v33;
      unint64_t v19 = v6;
      if (v6 == v21) {
        goto LABEL_31;
      }
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_25D6B50D0@<X0>(char *a1@<X8>)
{
  sub_25D6A2350(v1 + 16, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F948);
  type metadata accessor for TFIDFScorer();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t result = swift_release();
    char v4 = 0;
  }
  else
  {
    char v4 = 2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25D6B5150(uint64_t a1)
{
  uint64_t v2 = sub_25D6B4940(a1, *(uint64_t (**)(uint64_t))(v1 + 56));
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v3 = sub_25D699CA4(v2, *(unsigned __int8 *)(v1 + 72));
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25D6B8310(0, v4, 0);
    uint64_t v5 = v14;
    unint64_t v6 = *(void *)(v14 + 16);
    uint64_t v7 = 48;
    do
    {
      int v8 = *(_DWORD *)(v3 + v7);
      unint64_t v9 = *(void *)(v14 + 24);
      if (v6 >= v9 >> 1) {
        sub_25D6B8310((char *)(v9 > 1), v6 + 1, 1);
      }
      *(void *)(v14 + 16) = v6 + 1;
      *(_DWORD *)(v14 + 4 * v6 + 32) = v8;
      v7 += 24;
      ++v6;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_25D6B4A30(v10, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_25D6C1668(v11);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_25D6B52BC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0228](v0, 73, 7);
}

uint64_t type metadata accessor for DialogScorer()
{
  return self;
}

uint64_t sub_25D6B5320(uint64_t a1)
{
  return sub_25D6B5150(a1);
}

uint64_t sub_25D6B5344@<X0>(char *a1@<X8>)
{
  return sub_25D6B50D0(a1);
}

void sub_25D6B5368(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25D6B5374(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    v24[0] = MEMORY[0x263F8EE78];
    sub_25D6B83E0(0, v4, 0);
    uint64_t v6 = a1 + 32;
    uint64_t v5 = v24[0];
    do
    {
      sub_25D6A2350(v6, (uint64_t)v26);
      sub_25D6A2350((uint64_t)v26, (uint64_t)&v30);
      *(_DWORD *)&v31[24] = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D6B83E0(0, *(void *)(v5 + 16) + 1, 1);
        uint64_t v5 = v24[0];
      }
      unint64_t v8 = *(void *)(v5 + 16);
      unint64_t v7 = *(void *)(v5 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_25D6B83E0((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v5 = v24[0];
      }
      *(void *)(v5 + 16) = v8 + 1;
      unint64_t v9 = (_OWORD *)(v5 + 48 * v8);
      long long v10 = v30;
      long long v11 = *(_OWORD *)v31;
      *(_OWORD *)((char *)v9 + 60) = *(_OWORD *)&v31[12];
      v9[2] = v10;
      v9[3] = v11;
      v6 += 40;
      --v4;
    }
    while (v4);
  }
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v14 = v12 + 32;
    v23[4] = *(void *)(v2 + 16);
    swift_bridgeObjectRetain();
    do
    {
      sub_25D6B579C(v14, (uint64_t)&v30);
      int v15 = *(_DWORD *)&v31[24];
      sub_25D69F75C(&v30, (uint64_t)v26);
      int v29 = v15;
      uint64_t v16 = v27;
      uint64_t v17 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 8))(a1, v16, v17);
      uint64_t v19 = sub_25D6A2350((uint64_t)v26, (uint64_t)v24);
      int v25 = v15;
      MEMORY[0x270FA5388](v19, v20);
      v23[2] = v24;
      uint64_t v5 = sub_25D6B4D44((void (*)(_OWORD *__return_ptr, _OWORD *))sub_25D6B5804, (uint64_t)v23, v5, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25D6A22D4((uint64_t)v24, &qword_26A68F930);
      sub_25D6A22D4((uint64_t)v26, &qword_26A68F930);
      v14 += 48;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = sub_25D6C1668(v5);
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_25D6B55E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (void *)(a1 + 48);
  sub_25D6B5824(a1, (uint64_t)v17);
  sub_25D6A2350((uint64_t)v6, (uint64_t)v18);
  sub_25D6A2350((uint64_t)v17, (uint64_t)v16);
  sub_25D6B5880((uint64_t)v17);
  sub_25D6B5824(a1, (uint64_t)v13);
  sub_25D6A2350((uint64_t)v6, (uint64_t)v15);
  float v7 = v14;
  sub_25D6B5880((uint64_t)v13);
  float v8 = *(float *)(a2 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 80);
  __swift_project_boxed_opaque_existential_1(v6, v10);
  float v11 = v7 + (float)(v8 * (*(float (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  sub_25D69F75C(v16, a3);
  *(float *)(a3 + 40) = v11;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t sub_25D6B5704()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for WeightedDialogScorer()
{
  return self;
}

uint64_t sub_25D6B5760(uint64_t a1)
{
  return sub_25D6B5374(a1);
}

void sub_25D6B5784(unsigned char *a1@<X8>)
{
}

uint64_t sub_25D6B579C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6B5804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D6B55E8(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_25D6B5824(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25D6B5880(uint64_t a1)
{
  return a1;
}

void (*sub_25D6B58D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void *__return_ptr, uint64_t)))(void *__return_ptr, uint64_t)
{
  void (*v17)(void *__return_ptr, uint64_t);

  uint64_t v7 = sub_25D6C2DB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  float v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a4;
  sub_25D6C2DA0();
  sub_25D6C3070();
  uint64_t v13 = sub_25D6C2D90();
  uint64_t v14 = v16[1];
  a5(&v17, v13);
  if (v14)
  {
    sub_25D6C3060();
    sub_25D6C2D90();
    swift_willThrow();
  }
  else
  {
    a5 = v17;
    sub_25D6C3060();
    sub_25D6C2D90();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return a5;
}

void sub_25D6B5A88(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F958);
    uint64_t v2 = sub_25D6C31B0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_25D6B4780(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25D6B8E0C(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_25D6B8E0C(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_25D6B8E0C(v40, v41);
    sub_25D6B8E0C(v41, &v37);
    uint64_t v21 = sub_25D6C30E0();
    uint64_t v22 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v6 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)(v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = *(void *)(v2 + 48) + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_25D6B8E0C(&v37, (_OWORD *)(*(void *)(v2 + 56) + 32 * v25));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_17_0();
      if (v13 == v14) {
        goto LABEL_40;
      }
      OUTLINED_FUNCTION_16_1();
      if (!v11)
      {
        OUTLINED_FUNCTION_17_0();
        if (v13 == v14) {
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_16_1();
        if (!v11)
        {
          OUTLINED_FUNCTION_17_0();
          if (v13 == v14) {
            goto LABEL_40;
          }
          OUTLINED_FUNCTION_16_1();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_25D6B8E1C();
    return;
  }
  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    OUTLINED_FUNCTION_17_0();
    if (v13 == v14) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_16_1();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_25D6B5E2C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F988);
    uint64_t v2 = (void *)sub_25D6C31B0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v40;
  int64_t v7 = &v42;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = MEMORY[0x263F8EE58] + 8;
  uint64_t v10 = MEMORY[0x263F8D310];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v37 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v8 << 6);
      }
      else
      {
        int64_t v12 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_38;
        }
        if (v12 >= v34)
        {
LABEL_35:
          sub_25D6B8E1C();
          return;
        }
        unint64_t v13 = *(void *)(v35 + 8 * v12);
        int64_t v14 = v8 + 1;
        if (!v13)
        {
          OUTLINED_FUNCTION_13_1();
          if (v15 == v16) {
            goto LABEL_35;
          }
          OUTLINED_FUNCTION_12_2();
          if (!v13)
          {
            OUTLINED_FUNCTION_13_1();
            if (v15 == v16) {
              goto LABEL_35;
            }
            OUTLINED_FUNCTION_12_2();
            if (!v13)
            {
              OUTLINED_FUNCTION_13_1();
              if (v15 == v16) {
                goto LABEL_35;
              }
              OUTLINED_FUNCTION_12_2();
              if (!v13)
              {
                int64_t v18 = v17 + 4;
                if (v18 >= v34) {
                  goto LABEL_35;
                }
                unint64_t v13 = *(void *)(v35 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    OUTLINED_FUNCTION_13_1();
                    if (v15 == v16) {
                      goto LABEL_35;
                    }
                    OUTLINED_FUNCTION_12_2();
                    int64_t v18 = v19 + 1;
                    if (v13) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v14 = v18;
              }
            }
          }
        }
LABEL_29:
        uint64_t v37 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v8 = v14;
      }
      uint64_t v20 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v38 = *v20;
      uint64_t v39 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_25D6B8E0C(v6, v7);
      sub_25D6B8E0C(v7, v43);
      sub_25D6B8E0C(v43, &v41);
      unint64_t v21 = sub_25D6B89CC(v38, v39);
      unint64_t v22 = v21;
      if ((v23 & 1) == 0) {
        break;
      }
      uint64_t v36 = v8;
      unint64_t v24 = v7;
      unint64_t v25 = v6;
      uint64_t v26 = v1;
      uint64_t v27 = v10;
      uint64_t v28 = v9;
      uint64_t v29 = (uint64_t *)(v2[6] + 16 * v21);
      swift_bridgeObjectRelease();
      *uint64_t v29 = v38;
      v29[1] = v39;
      uint64_t v9 = v28;
      uint64_t v10 = v27;
      uint64_t v1 = v26;
      uint64_t v6 = v25;
      int64_t v7 = v24;
      int64_t v8 = v36;
      uint64_t v30 = (_OWORD *)(v2[7] + 32 * v22);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      sub_25D6B8E0C(&v41, v30);
      unint64_t v5 = v37;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v21;
    int64_t v31 = (uint64_t *)(v2[6] + 16 * v21);
    uint64_t *v31 = v38;
    v31[1] = v39;
    sub_25D6B8E0C(&v41, (_OWORD *)(v2[7] + 32 * v21));
    uint64_t v32 = v2[2];
    BOOL v16 = __OFADD__(v32, 1);
    uint64_t v33 = v32 + 1;
    if (v16) {
      goto LABEL_37;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_25D6B616C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A68F4C0 != -1) {
    swift_once();
  }
  return sub_25D6BF27C(a1);
}

uint64_t sub_25D6B61DC(char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8, v8);
  unint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  int64_t v14 = (char *)&v73 - v13;
  uint64_t v15 = sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18, v19);
  OUTLINED_FUNCTION_14_1();
  uint64_t v90 = v20;
  OUTLINED_FUNCTION_6_4();
  MEMORY[0x270FA5388](v21, v22);
  uint64_t v92 = (char *)&v73 - v23;
  OUTLINED_FUNCTION_6_4();
  MEMORY[0x270FA5388](v24, v25);
  uint64_t v27 = (char *)&v73 - v26;
  uint64_t v28 = *a2;
  uint64_t v88 = a2[1];
  uint64_t v89 = v28;
  uint64_t v29 = a2[2];
  uint64_t v86 = a2[3];
  uint64_t v87 = v29;
  uint64_t v30 = *(void (**)(void))(v3 + 16);
  swift_retain();
  v30((char *)a1);
  swift_release();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  uint64_t v77 = v11;
  uint64_t v96 = v15;
  if (EnumTagSinglePayload == 1)
  {
    sub_25D6A22D4((uint64_t)v14, &qword_26A68F690);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F970);
    uint64_t v32 = (char *)a1;
    uint64_t v33 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v76 = *(void *)(v17 + 72);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_25D6C3C80;
    uint64_t v95 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 16);
    v95(v34 + ((v33 + 32) & ~v33), v32, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v27, v14, v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F970);
    uint64_t v35 = *(void *)(v17 + 72);
    uint64_t v95 = (void (*)(uint64_t, char *, uint64_t))a1;
    uint64_t v33 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_25D6C3C70;
    uint64_t v37 = v36 + ((v33 + 32) & ~v33);
    uint64_t v97 = a3;
    uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 16);
    v38(v37, v27, v15);
    uint64_t v76 = v35;
    uint64_t v39 = (char *)v95;
    uint64_t v95 = v38;
    v38(v37 + v35, v39, v15);
    unint64_t v11 = v77;
    uint64_t v40 = v27;
    uint64_t v34 = v36;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v40, v15);
  }
  uint64_t v41 = (uint64_t)v92;
  uint64_t result = sub_25D6B241C();
  if (!v43)
  {
    uint64_t result = sub_25D6B259C();
    if (!v43)
    {
      swift_bridgeObjectRelease();
      sub_25D6B8DC0();
      swift_allocError();
      *BOOL v72 = 0;
      v72[1] = 0;
LABEL_36:
      swift_willThrow();
      return v15;
    }
  }
  uint64_t v45 = result;
  uint64_t v15 = v43;
  uint64_t v73 = *(void *)(v34 + 16);
  if (!v73)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_34:
    sub_25D6B8DC0();
    swift_allocError();
    *unint64_t v71 = xmmword_25D6C4FA0;
    goto LABEL_36;
  }
  uint64_t v46 = 0;
  unint64_t v47 = 0;
  uint64_t v78 = v34;
  unint64_t v75 = v34 + ((v33 + 32) & ~(unint64_t)v33);
  uint64_t v94 = v17 + 16;
  uint64_t v74 = (uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32);
  uint64_t v93 = (void (**)(void))(v17 + 8);
  uint64_t v82 = &v99;
  *(void *)&long long v44 = 136315650;
  long long v81 = v44;
  uint64_t v80 = MEMORY[0x263F8EE58] + 8;
  uint64_t v48 = v91;
  uint64_t v49 = v96;
  uint64_t v83 = v43;
  uint64_t v79 = result;
  do
  {
    if (v47 >= *(void *)(v78 + 16)) {
      goto LABEL_41;
    }
    unint64_t v84 = v47;
    OUTLINED_FUNCTION_11_3();
    v50();
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v49);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v49) == 1) {
      goto LABEL_38;
    }
    uint64_t result = (*v74)(v41, v11, v49);
    if (!v46)
    {
      char v53 = 0;
      unint64_t v54 = 0;
      unint64_t v55 = qword_270A641E0;
      while (v54 < v55)
      {
        char v56 = v53;
        if (!v46)
        {
          LODWORD(v97) = *((unsigned __int8 *)&unk_270A641D0 + v54 + 32);
          if (qword_26A68F470 != -1) {
            swift_once();
          }
          uint64_t v57 = sub_25D6C2DE0();
          __swift_project_value_buffer(v57, (uint64_t)qword_26A691DB8);
          OUTLINED_FUNCTION_11_3();
          v58();
          swift_bridgeObjectRetain_n();
          uint64_t v59 = sub_25D6C2DC0();
          os_log_type_t v60 = sub_25D6C3040();
          if (os_log_type_enabled(v59, v60))
          {
            uint64_t v61 = swift_slowAlloc();
            uint64_t v91 = v48;
            uint64_t v62 = v61;
            uint64_t v85 = swift_slowAlloc();
            v98[0] = v85;
            *(_DWORD *)uint64_t v62 = v81;
            swift_bridgeObjectRetain();
            v98[6] = sub_25D6C05EC(v45, v15, v98);
            sub_25D6C30B0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v62 + 12) = 2080;
            if (v97) {
              uint64_t v63 = 1852797802;
            }
            else {
              uint64_t v63 = 7235938;
            }
            if (v97) {
              unint64_t v64 = 0xE400000000000000;
            }
            else {
              unint64_t v64 = 0xE300000000000000;
            }
            uint64_t v65 = sub_25D6C05EC(v63, v64, v98);
            OUTLINED_FUNCTION_15_0(v65);
            swift_bridgeObjectRelease();
            *(_WORD *)(v62 + 22) = 2080;
            sub_25D6B8E24();
            uint64_t v66 = sub_25D6C3220();
            uint64_t v68 = sub_25D6C05EC(v66, v67, v98);
            OUTLINED_FUNCTION_15_0(v68);
            swift_bridgeObjectRelease();
            uint64_t v69 = *v93;
            uint64_t v15 = v83;
            OUTLINED_FUNCTION_9_3();
            v69();
            _os_log_impl(&dword_25D698000, v59, v60, "Trying to load %s %s model from %s", (uint8_t *)v62, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_10_0();
            uint64_t v49 = v96;
            uint64_t v48 = v91;
            OUTLINED_FUNCTION_10_0();

            int v70 = v97;
            uint64_t v45 = v79;
            uint64_t v41 = (uint64_t)v92;
          }
          else
          {
            swift_bridgeObjectRelease_n();
            uint64_t v69 = *v93;
            OUTLINED_FUNCTION_9_3();
            v69();

            uint64_t v41 = (uint64_t)v92;
            int v70 = v97;
          }
          v98[0] = v89;
          v98[1] = v88;
          v98[2] = v87;
          v98[3] = v86;
          uint64_t result = sub_25D6B6B5C(v41, v98, v45, v15, v70);
          if (v48)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_9_3();
            v69();
            swift_bridgeObjectRelease();
            return v15;
          }
          uint64_t v46 = result;
          unint64_t v55 = qword_270A641E0;
        }
        char v53 = 1;
        unint64_t v54 = 1u;
        if (v56) {
          goto LABEL_11;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
LABEL_11:
    unint64_t v51 = v84 + 1;
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*v93)(v41, v49);
    unint64_t v47 = v51;
    BOOL v52 = v51 == v73;
    unint64_t v11 = v77;
  }
  while (!v52);
  __swift_storeEnumTagSinglePayload((uint64_t)v77, 1, 1, v49);
LABEL_38:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v46) {
    goto LABEL_34;
  }
  swift_retain();
  uint64_t v15 = sub_25D6A2C6C();
  swift_release_n();
  return v15;
}

uint64_t sub_25D6B6A3C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t *)(a2 + 56);
    while (1)
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      uint64_t v13 = *(v10 - 2);
      v16[0] = *(v10 - 3);
      v16[1] = v13;
      void v16[2] = v11;
      v16[3] = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_25D6B61DC(a1, v16, a3);
      if (v4) {
        break;
      }
      uint64_t v15 = v14;
      v10 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25D6B8B28(v15);
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        return v17;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25D6B6B5C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5)
{
  int v67 = a5;
  sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  uint64_t v70 = v6;
  unint64_t v71 = v7;
  MEMORY[0x270FA5388](v6, v8);
  OUTLINED_FUNCTION_14_1();
  uint64_t v63 = v9;
  OUTLINED_FUNCTION_6_4();
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v62 = (char *)&v62 - v12;
  OUTLINED_FUNCTION_6_4();
  uint64_t v15 = MEMORY[0x270FA5388](v13, v14);
  uint64_t v17 = (char *)&v62 - v16;
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  uint64_t v21 = (char *)&v62 - v20;
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v66 = (char *)&v62 - v23;
  OUTLINED_FUNCTION_6_4();
  MEMORY[0x270FA5388](v24, v25);
  uint64_t v68 = (char *)&v62 - v26;
  uint64_t v28 = *a2;
  unint64_t v27 = a2[1];
  uint64_t v29 = a2[3];
  uint64_t v64 = a2[2];
  unint64_t v65 = v29;
  uint64_t v30 = sub_25D6C2ED0();
  BOOL v32 = v30 == 0x73752D6E65 && v31 == 0xE500000000000000;
  if (v32 || (uint64_t v33 = v30, v34 = v31, (sub_25D6C3230() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    unint64_t v34 = 0xE200000000000000;
    uint64_t v33 = 28261;
  }
  sub_25D6C28D0();
  uint64_t v72 = v28;
  unint64_t v73 = v27;
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  sub_25D6C28D0();
  swift_bridgeObjectRelease();
  uint64_t v35 = v70;
  uint64_t v36 = (char *)v71 + 8;
  uint64_t v37 = (void (*)(char *, uint64_t))*((void *)v71 + 1);
  v37(v17, v70);
  uint64_t v72 = v64;
  unint64_t v73 = v65;
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  uint64_t v38 = v66;
  sub_25D6C28D0();
  swift_bridgeObjectRelease();
  v37(v21, v35);
  uint64_t v72 = v33;
  unint64_t v73 = v34;
  uint64_t v39 = v36;
  uint64_t v40 = v35;
  sub_25D6C2F20();
  char v41 = v67;
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  sub_25D6C28D0();
  swift_bridgeObjectRelease();
  uint64_t v66 = v39;
  v37(v38, v40);
  uint64_t v42 = sub_25D6C28F0();
  unint64_t v44 = v43;
  id v45 = objc_msgSend(self, sel_defaultManager);
  uint64_t v46 = (void *)sub_25D6C2E70();
  LODWORD(v38) = objc_msgSend(v45, sel_fileExistsAtPath_, v46);

  if (v38)
  {
    swift_bridgeObjectRelease();
    if (v41)
    {
      uint64_t v47 = v63;
      uint64_t v57 = OUTLINED_FUNCTION_5_6();
      v58(v57);
      type metadata accessor for SerializedDialogSelectionModel();
      swift_allocObject();
      uint64_t v50 = v69;
      uint64_t v51 = sub_25D6A2518(v47);
    }
    else
    {
      uint64_t v47 = (uint64_t)v62;
      uint64_t v48 = OUTLINED_FUNCTION_5_6();
      v49(v48);
      type metadata accessor for SerializedDialogSelectionModel();
      swift_allocObject();
      uint64_t v50 = v69;
      uint64_t v51 = sub_25D6A28AC(v47);
    }
    if (!v50) {
      uint64_t v47 = v51;
    }
    uint64_t v59 = OUTLINED_FUNCTION_4_6();
    ((void (*)(uint64_t))v37)(v59);
  }
  else
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_25D6C2DE0();
    __swift_project_value_buffer(v52, (uint64_t)qword_26A691DB8);
    swift_bridgeObjectRetain();
    char v53 = sub_25D6C2DC0();
    os_log_type_t v54 = sub_25D6C3040();
    if (os_log_type_enabled(v53, v54))
    {
      unint64_t v71 = v37;
      unint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      *(_DWORD *)unint64_t v55 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_25D6C05EC(v42, v44, &v72);
      sub_25D6C30B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25D698000, v53, v54, "No file found at %s", v55, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();

      OUTLINED_FUNCTION_9_3();
      v56();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v60 = OUTLINED_FUNCTION_4_6();
      ((void (*)(uint64_t))v37)(v60);
    }
    return 0;
  }
  return v47;
}

uint64_t sub_25D6B7104()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DefaultDialogProvider()
{
  return self;
}

uint64_t sub_25D6B7160(char *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25D6B61DC(a1, a2, a3);
}

uint64_t sub_25D6B7184(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_25D6B6A3C(a1, a2, a3);
}

uint64_t sub_25D6B71A8()
{
  return sub_25D6B71C0();
}

uint64_t sub_25D6B71C0()
{
  void (*v2)(void *__return_ptr, uint64_t);
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  long long v10[2];
  void *v11;

  if (qword_26A68F478 != -1) {
    swift_once();
  }
  uint64_t v1 = (id)qword_26A691DD0;
  uint64_t v2 = sub_25D6B58D4((uint64_t)"DialogEngineExecution", 21, 2, v1, (void (*)(void *__return_ptr, uint64_t))sub_25D6B7584);

  if (v0) {
    return (uint64_t)v1;
  }
  uint64_t result = sub_25D6B8C10(v2);
  if (result)
  {
    uint64_t v4 = result;
    unint64_t v5 = *(void *)(result + 16);
    if (v5)
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
      sub_25D6B83B0(0, v5, 0);
      uint64_t v6 = 0;
      uint64_t v1 = v11;
      do
      {
        uint64_t v9 = *(void *)(v4 + 8 * v6 + 32);
        sub_25D6B75BC(&v9, (uint64_t *)v10);
        uint64_t v11 = v1;
        uint64_t v8 = v1[2];
        uint64_t v7 = v1[3];
        if (v8 >= v7 >> 1)
        {
          sub_25D6B83B0((char *)(v7 > 1), v8 + 1, 1);
          uint64_t v1 = v11;
        }
        ++v6;
        v1[2] = v8 + 1;
        sub_25D69F75C(v10, (uint64_t)&v1[5 * v8 + 4]);
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();

      return MEMORY[0x263F8EE78];
    }
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void sub_25D6B7398(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X7>, void *a6@<X8>, uint64_t a7)
{
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3A1C8]), sel_init);
  uint64_t v13 = sub_25D6C2900();
  sub_25D6B8CCC(v13, v14, v12, (SEL *)&selRef_setTemplateDir_);
  sub_25D6B8C74(a1, a2, v12);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRetain();
  sub_25D6C2F20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_25D6B8CCC(a3, a4, v12, (SEL *)&selRef_setCatId_);
  sub_25D6B5A88(a5);
  sub_25D6B8D38(v15, v12, (SEL *)&selRef_setParameters_);
  sub_25D6B5A88(a7);
  sub_25D6B8D38(v16, v12, (SEL *)&selRef_setGlobalParameters_);
  objc_msgSend(v12, sel_setSwitchFallthrough_, 1);
  objc_msgSend(v12, sel_setIncludeKeywords_, 1);
  id v17 = objc_msgSend(v12, sel_execute);
  if (v17)
  {
    id v18 = v17;

    *a6 = v18;
  }
  else
  {
    sub_25D6B8DC0();
    swift_allocError();
    *uint64_t v19 = 0xD000000000000016;
    v19[1] = 0x800000025D6C6000;
    swift_willThrow();
  }
}

void sub_25D6B7584(void *a1@<X8>)
{
  sub_25D6B7398(v1[3], v1[4], v1[5], v1[6], v1[9], a1, v1[10]);
}

uint64_t sub_25D6B75BC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  type metadata accessor for NLGDialogBuilder();
  swift_initStackObject();
  NLGDialogBuilder.init()();
  sub_25D6B279C(25705, 0xE200000000000000, v3, &v7);
  if (v8)
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain();
      sub_25D6B2970(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_25D6A22D4((uint64_t)&v7, &qword_26A68F8C8);
  }
  sub_25D6B279C(0x746E65746E6F63, 0xE700000000000000, v3, &v7);
  if (!v8) {
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8D0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  sub_25D6B279C(0x746E697270, 0xE500000000000000, v5, &v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain();
      sub_25D6B297C(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_10:
    sub_25D6A22D4((uint64_t)&v7, &qword_26A68F8C8);
  }
LABEL_11:
  sub_25D6B279C(0x7364726F7779656BLL, 0xE800000000000000, v3, &v7);
  if (v8)
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain();
      sub_25D6B2988(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_25D6A22D4((uint64_t)&v7, &qword_26A68F8C8);
  }
  sub_25D6B2F08(a2);
  return swift_release();
}

char *sub_25D6B77F4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B7854(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B78B0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25D6C31C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

char *sub_25D6B7944(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B79A4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25D6C31C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_25D6B7A44(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[64 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B7AA0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B7B04(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

char *sub_25D6B7B60(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_7();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_10(a3, result);
  }
  return result;
}

uint64_t sub_25D6B7BC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_8_3();
LABEL_11:
    uint64_t result = sub_25D6C31C0();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_7_3();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25D6B7C78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5E0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_25D6B7D78(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[4 * a2] > __src ? (BOOL v3 = &__src[4 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 4 * a2);
  }
  return result;
}

uint64_t sub_25D6B7E54(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F998);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25D6B7F58(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_8_3();
LABEL_11:
    uint64_t result = sub_25D6C31C0();
    __break(1u);
    return result;
  }
  if (a3 + (a2 << 6) > a1 && a1 + (a2 << 6) > a3)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_7_3();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25D6B8010(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_8_3();
LABEL_11:
    uint64_t result = sub_25D6C31C0();
    __break(1u);
    return result;
  }
  if (a3 + 40 * a2 > a1 && a1 + 40 * a2 > a3)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_7_3();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return swift_arrayInitWithCopy();
}

uint64_t sub_25D6B80E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25D6B81CC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F930);
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_25D6B82D0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8458(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B82F0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B853C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B8310(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8620(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B8330(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8804(a1, a2, a3, *v3, &qword_26A68F960, &qword_26A68F968);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B8360(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8704(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B8380(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8804(a1, a2, a3, *v3, &qword_26A68F8D8, &qword_26A68F8E0);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B83B0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B8804(a1, a2, a3, *v3, &qword_26A68F8F0, &qword_26A68F8F8);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B83E0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B88E8(a1, a2, a3, *v3, &qword_26A68F978, (void (*)(char *, uint64_t, char *))sub_25D6B80E8);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B841C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25D6B88E8(a1, a2, a3, *v3, &qword_26A68F9A8, (void (*)(char *, uint64_t, char *))sub_25D6B81CC);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_25D6B8458(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F920);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25D6B77F4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6B7BC0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_25D6B853C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25D6B7854(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6B7C78((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_25D6B8620(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F980);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25D6B78B0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6B7D78(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_25D6B8704(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F990);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25D6B79A4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6B7E54((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_25D6B87F0(char *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_25D6B8804(a1, a2, a3, a4, &qword_26A68F8D8, &qword_26A68F8E0);
}

char *sub_25D6B8804(char *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (char *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    OUTLINED_FUNCTION_10_3(v14);
  }
  else
  {
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v13 + 32;
  uint64_t v16 = (char *)(a4 + 32);
  if (v8)
  {
    sub_25D6B7AA0(v16, v11, v15);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6B8010((unint64_t)v16, v11, (unint64_t)v15, a6);
  }
  swift_release();
  return v13;
}

char *sub_25D6B88E8(char *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(char *, uint64_t, char *))
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (char *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    OUTLINED_FUNCTION_10_3(v14);
  }
  else
  {
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v13 + 32;
  uint64_t v16 = (char *)(a4 + 32);
  if (v8)
  {
    sub_25D6B7B60(v16, v11, v15);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    a6(v16, v11, v15);
  }
  swift_release();
  return v13;
}

unint64_t sub_25D6B89CC(uint64_t a1, uint64_t a2)
{
  sub_25D6C32C0();
  sub_25D6C2F00();
  uint64_t v4 = sub_25D6C32E0();
  return sub_25D6B8A44(a1, a2, v4);
}

unint64_t sub_25D6B8A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25D6C3230() & 1) == 0)
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
      while (!v14 && (sub_25D6C3230() & 1) == 0);
    }
  }
  return v6;
}

void sub_25D6B8B28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_25D6B3F20(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_25D6B8010(a1 + 32, v2, v3 + 40 * v10 + 32, &qword_26A68F8F8);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *(void *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_25D6B8C10(void *a1)
{
  id v1 = objc_msgSend(a1, sel_response);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8D0);
  uint64_t v3 = sub_25D6C2FD0();

  return v3;
}

void sub_25D6B8C74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D6C2E70();
  objc_msgSend(a3, sel_setLocale_, v4);
}

void sub_25D6B8CCC(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_25D6C2E70();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_25D6B8D38(uint64_t a1, void *a2, SEL *a3)
{
  id v5 = (id)sub_25D6C2DF0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a3, v5);
}

unint64_t sub_25D6B8DC0()
{
  unint64_t result = qword_26A68F950;
  if (!qword_26A68F950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F950);
  }
  return result;
}

_OWORD *sub_25D6B8E0C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25D6B8E1C()
{
  return swift_release();
}

unint64_t sub_25D6B8E24()
{
  unint64_t result = qword_26A68F5D8;
  if (!qword_26A68F5D8)
  {
    sub_25D6C2920();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F5D8);
  }
  return result;
}

void *OUTLINED_FUNCTION_1_10@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_25D6C31C0();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / v3);
  return result;
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return sub_25D6C30B0();
}

uint64_t sub_25D6B8FA8(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  unint64_t result = sub_25D6BA688(0, result, v3);
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result;
  }
  if (v3 < v5) {
    goto LABEL_9;
  }
  if ((v5 & 0x8000000000000000) == 0) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_25D6B9014()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25D6C1508(v0);
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_25D6B906C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = MEMORY[0x263F8EE78];
  v3[3] = a2;
  v3[4] = a3;
  v3[5] = a1;
  sub_25D6B95EC();
  return v3;
}

void sub_25D6B9098(void *a1)
{
  uint64_t v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v4 = OUTLINED_FUNCTION_4_7();
  v5(v4);
  if (!v35)
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_25D6C2DE0();
    __swift_project_value_buffer(v28, (uint64_t)qword_26A691DB8);
    oslog = sub_25D6C2DC0();
    os_log_type_t v29 = sub_25D6C3050();
    if (os_log_type_enabled(oslog, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_25D698000, oslog, v29, "Only catSwitch type dialogs supported", v30, 2u);
      OUTLINED_FUNCTION_10_0();
    }
    OUTLINED_FUNCTION_2_8();

    return;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = OUTLINED_FUNCTION_4_7();
  uint64_t v8 = v7(v6);
  uint64_t v10 = v9;
  uint64_t v11 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  sub_25D6BA47C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D6B3E74);
  uint64_t v12 = *(void *)(*(void *)(v1 + 16) + 16);
  sub_25D6BA520(v12, (uint64_t (*)(BOOL))sub_25D6B3E74);
  uint64_t v13 = *(void *)(v1 + 16);
  *(void *)(v13 + 16) = v12 + 1;
  uint64_t v14 = v13 + (v12 << 6);
  *(void *)(v14 + 32) = v34;
  *(void *)(v14 + 40) = v35;
  *(_OWORD *)(v14 + 48) = v36;
  *(void *)(v14 + 64) = v37;
  *(void *)(v14 + 72) = v38;
  *(void *)(v14 + 80) = v8;
  *(void *)(v14 + 88) = v10;
  swift_endAccess();
  uint64_t v15 = *(void *)(sub_25D6B9014() + 16);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v2 + 40);
  if (v16 >= v15)
  {
LABEL_9:
    sub_25D6B9CC0();
    OUTLINED_FUNCTION_2_8();
    return;
  }
  if (__OFSUB__(*(void *)(*v11 + 16), v16))
  {
    __break(1u);
    goto LABEL_18;
  }
  if (qword_26A68F470 != -1) {
LABEL_18:
  }
    swift_once();
  uint64_t v17 = sub_25D6C2DE0();
  __swift_project_value_buffer(v17, (uint64_t)qword_26A691DB8);
  id v18 = sub_25D6C2DC0();
  os_log_type_t v19 = sub_25D6C3040();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_3_5();
    *(_DWORD *)uint64_t v20 = 134217984;
    sub_25D6C30B0();
    _os_log_impl(&dword_25D698000, v18, v19, "Dropping %ld oldest entries", v20, 0xCu);
    OUTLINED_FUNCTION_10_0();
  }

  uint64_t v21 = *(void *)(*v11 + 16);
  if (!__OFSUB__(v21, v16))
  {
    sub_25D6B8FA8(v21 - v16, *v11);
    uint64_t v23 = v22;
    unint64_t v25 = v24;
    swift_bridgeObjectRetain();
    uint64_t v26 = OUTLINED_FUNCTION_4_7();
    *uint64_t v11 = sub_25D6B93F8(v26, v27, v23, v25);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_25D6B93F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_25D6C3250();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
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
    sub_25D6BA5C8(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

void sub_25D6B94E0()
{
  uint64_t v1 = v0;
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25D6C2DE0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A691DB8);
  uint64_t v3 = sub_25D6C2DC0();
  os_log_type_t v4 = sub_25D6C3040();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25D698000, v3, v4, "Clearing history", v5, 2u);
    OUTLINED_FUNCTION_10_0();
  }

  swift_beginAccess();
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  sub_25D6B9CC0();
}

void sub_25D6B95EC()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA40]), sel_init);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_5_7();
  id v4 = objc_msgSend(v2, sel_persistentDomainForName_, v3);

  if (v4)
  {
    uint64_t v5 = sub_25D6C2E00();

    uint64_t v6 = v1[3];
    uint64_t v7 = v1[4];
    swift_bridgeObjectRetain();
    sub_25D6B279C(v6, v7, v5, &v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v33)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5E0);
      if (swift_dynamicCast())
      {
        uint64_t v8 = v38;
        uint64_t v9 = *(void *)(v38 + 16);
        if (v9)
        {
          swift_bridgeObjectRetain();
          uint64_t v10 = v8 + 40;
          uint64_t v11 = MEMORY[0x263F8EE78];
          do
          {
            swift_bridgeObjectRetain_n();
            uint64_t v12 = OUTLINED_FUNCTION_4_7();
            sub_25D6B9984(v12, v13, v14);
            long long v15 = v31;
            uint64_t v17 = v32;
            uint64_t v16 = v33;
            uint64_t v18 = v34;
            uint64_t v19 = v35;
            uint64_t v29 = v37;
            uint64_t v30 = v36;
            swift_bridgeObjectRelease();
            if (*((void *)&v15 + 1))
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_25D6B3E74();
                uint64_t v11 = v22;
              }
              unint64_t v20 = *(void *)(v11 + 16);
              if (v20 >= *(void *)(v11 + 24) >> 1)
              {
                sub_25D6B3E74();
                uint64_t v11 = v23;
              }
              *(void *)(v11 + 16) = v20 + 1;
              uint64_t v21 = v11 + (v20 << 6);
              *(_OWORD *)(v21 + 32) = v15;
              *(void *)(v21 + 48) = v17;
              *(void *)(v21 + 56) = v16;
              *(void *)(v21 + 64) = v18;
              *(void *)(v21 + 72) = v19;
              *(void *)(v21 + 80) = v30;
              *(void *)(v21 + 88) = v29;
            }
            v10 += 16;
            --v9;
          }
          while (v9);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v11 = MEMORY[0x263F8EE78];
        }
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v1[2] = v11;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_25D6BA568((uint64_t)&v31);
    }
  }
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25D6C2DE0();
  __swift_project_value_buffer(v24, (uint64_t)qword_26A691DB8);
  swift_retain_n();
  unint64_t v25 = sub_25D6C2DC0();
  os_log_type_t v26 = sub_25D6C3040();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)OUTLINED_FUNCTION_3_5();
    *(_DWORD *)uint64_t v27 = 134217984;
    uint64_t v28 = *(void *)(sub_25D6B9014() + 16);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v38 = v28;
    sub_25D6C30B0();
    swift_release();
    _os_log_impl(&dword_25D698000, v25, v26, "Loaded %ld dialogs from history", v27, 0xCu);
    OUTLINED_FUNCTION_10_0();
  }
  else
  {

    swift_release_n();
  }
}

void sub_25D6B9984(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v40[0] = 35;
  v40[1] = 0xE100000000000000;
  uint64_t v38 = v40;
  swift_bridgeObjectRetain_n();
  uint64_t v6 = (void *)sub_25D6B0E04(0x7FFFFFFFFFFFFFFFLL, 1u, sub_25D6A79FC, (uint64_t)v37, a1, a2);
  swift_bridgeObjectRelease();
  if (v6[2] == 4)
  {
    swift_bridgeObjectRelease();
    if (v6[2])
    {
      uint64_t v7 = v6[4];
      a2 = v6[5];
      a1 = v6[6];
      uint64_t v8 = v6[7];
      swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x2611B0CF0](v7, a2, a1, v8);
      uint64_t v35 = v10;
      uint64_t v36 = v9;
      swift_bridgeObjectRelease();
      if (v6[2] >= 2uLL)
      {
        uint64_t v11 = v6[8];
        uint64_t v12 = v6[9];
        uint64_t v13 = v6[10];
        uint64_t v14 = v6[11];
        swift_bridgeObjectRetain();
        a1 = MEMORY[0x2611B0CF0](v11, v12, v13, v14);
        uint64_t v16 = v15;
        swift_bridgeObjectRelease();
        if (v6[2] >= 3uLL)
        {
          uint64_t v17 = v6[12];
          uint64_t v18 = v6[13];
          uint64_t v19 = v6[14];
          uint64_t v20 = v6[15];
          swift_bridgeObjectRetain();
          uint64_t v21 = MEMORY[0x2611B0CF0](v17, v18, v19, v20);
          uint64_t v23 = v22;
          swift_bridgeObjectRelease();
          if (v6[2] >= 4uLL)
          {
            uint64_t v24 = v6[16];
            uint64_t v25 = v6[17];
            uint64_t v26 = v6[18];
            uint64_t v27 = v6[19];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v28 = MEMORY[0x2611B0CF0](v24, v25, v26, v27);
            uint64_t v30 = v29;
            swift_bridgeObjectRelease();
            *a3 = v36;
            a3[1] = v35;
            a3[2] = a1;
            a3[3] = v16;
            a3[4] = v21;
            a3[5] = v23;
            a3[6] = v28;
            a3[7] = v30;
            goto LABEL_12;
          }
          goto LABEL_16;
        }
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  if (qword_26A68F470 != -1) {
LABEL_17:
  }
    swift_once();
  uint64_t v31 = sub_25D6C2DE0();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A691DB8);
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_25D6C2DC0();
  os_log_type_t v33 = sub_25D6C3050();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)OUTLINED_FUNCTION_3_5();
    v40[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_25D6C05EC(a1, a2, v40);
    sub_25D6C30B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D698000, v32, v33, "Unparsable entry: %s", v34, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
LABEL_12:
  OUTLINED_FUNCTION_2_8();
}

void sub_25D6B9CC0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA40]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25D6C3C80;
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v5;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 16);
  int64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25D6B82D0(0, v7, 0);
    uint64_t v8 = v21;
    uint64_t v9 = v6 + 48;
    do
    {
      uint64_t v19 = *(void *)(v9 - 16);
      uint64_t v20 = *(void *)(v9 - 8);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_1_11();
      sub_25D6C2F20();
      OUTLINED_FUNCTION_1_11();
      sub_25D6C2F20();
      OUTLINED_FUNCTION_1_11();
      swift_bridgeObjectRetain();
      sub_25D6C2F20();
      swift_bridgeObjectRelease();
      unint64_t v11 = *(void *)(v21 + 16);
      unint64_t v10 = *(void *)(v21 + 24);
      if (v11 >= v10 >> 1) {
        sub_25D6B82D0((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v21 + 16) = v11 + 1;
      uint64_t v12 = v21 + 16 * v11;
      *(void *)(v12 + 32) = v19;
      *(void *)(v12 + 40) = v20;
      v9 += 64;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F5E0);
  *(void *)(inited + 48) = v8;
  sub_25D6C2E20();
  uint64_t v13 = (void *)sub_25D6C2DF0();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_5_7();
  objc_msgSend(v2, sel_setPersistentDomain_forName_, v13, v14);

  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_25D6C2DE0();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A691DB8);
  swift_retain_n();
  uint64_t v16 = sub_25D6C2DC0();
  os_log_type_t v17 = sub_25D6C3040();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_3_5();
    *(_DWORD *)uint64_t v18 = 134217984;
    sub_25D6B9014();
    swift_release();
    swift_bridgeObjectRelease();
    sub_25D6C30B0();
    swift_release();
    _os_log_impl(&dword_25D698000, v16, v17, "Saved %ld dialogs to history", v18, 0xCu);
    OUTLINED_FUNCTION_10_0();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_25D6BA044()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25D6BA06C()
{
  sub_25D6BA044();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for UserDefaultsDialogRecorder()
{
  return self;
}

uint64_t destroy for UserDefaultsDialogHistoryEntry()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UserDefaultsDialogHistoryEntry(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UserDefaultsDialogHistoryEntry(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for UserDefaultsDialogHistoryEntry(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDefaultsDialogHistoryEntry(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for UserDefaultsDialogHistoryEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDefaultsDialogHistoryEntry()
{
  return &type metadata for UserDefaultsDialogHistoryEntry;
}

uint64_t sub_25D6BA344()
{
  return sub_25D6B9014();
}

void sub_25D6BA368(void *a1)
{
}

void sub_25D6BA38C()
{
}

uint64_t sub_25D6BA3B0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25D6BA404()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25D6BA434()
{
  return sub_25D6BA47C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D6B3D0C);
}

uint64_t sub_25D6BA44C()
{
  return sub_25D6BA47C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D6B3DB8);
}

uint64_t sub_25D6BA464()
{
  return sub_25D6BA47C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D6B3F48);
}

uint64_t sub_25D6BA47C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_25D6BA4D8(uint64_t a1)
{
  return sub_25D6BA520(a1, (uint64_t (*)(BOOL))sub_25D6B3D0C);
}

uint64_t sub_25D6BA4F0(uint64_t a1)
{
  return sub_25D6BA520(a1, (uint64_t (*)(BOOL))sub_25D6B3DB8);
}

uint64_t sub_25D6BA508(uint64_t a1)
{
  return sub_25D6BA520(a1, (uint64_t (*)(BOOL))sub_25D6B3F48);
}

uint64_t sub_25D6BA520(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_25D6BA568(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25D6BA5C8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8E8);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 64);
    }
    if (v4 != a3)
    {
      sub_25D6B7F58(a2 + (a3 << 6), v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_25D6BA688(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return sub_25D6C2F20();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_25D6C2E70();
}

uint64_t sub_25D6BA750(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25D6BA770, 0, 0);
}

uint64_t sub_25D6BA770()
{
  OUTLINED_FUNCTION_6_5();
  objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, *(void *)(v0 + 16));
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_8();
  return v1();
}

uint64_t sub_25D6BA800()
{
  sub_25D6C2B30();
  if (!sub_25D6C2B20()) {
    return 0;
  }
  sub_25D6C2B00();
  swift_release();
  uint64_t v0 = sub_25D6C2B50();
  swift_release();
  return v0;
}

uint64_t sub_25D6BA874@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  unint64_t v4 = self;
  BOOL v5 = (void *)sub_25D6C2970();
  id v6 = objc_msgSend(v4, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, a1, v5);

  if (v6)
  {
    sub_25D6C2980();

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = sub_25D6C29A0();
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v8);
}

uint64_t sub_25D6BA934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a4;
  *(_DWORD *)(v7 + 48) = a5;
  *(void *)(v7 + 56) = a6;
  *(void *)(v7 + 64) = a7;
  return v7;
}

uint64_t sub_25D6BA94C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9E0);
  uint64_t v10 = OUTLINED_FUNCTION_9_4(v9);
  MEMORY[0x270FA5388](v10, v11);
  OUTLINED_FUNCTION_14_2();
  char v12 = *a1;
  if (!*(void *)(a2 + 16))
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25D6C2DE0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A691DB8);
    uint64_t v14 = sub_25D6C2DC0();
    os_log_type_t v15 = sub_25D6C3040();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_5() = 0;
      OUTLINED_FUNCTION_18_0(&dword_25D698000, v16, v17, "SELF logging called with no candidates generated");
      OUTLINED_FUNCTION_10_0();
    }
  }
  sub_25D6C3000();
  uint64_t v18 = sub_25D6C3020();
  OUTLINED_FUNCTION_22_0(v18);
  sub_25D6BD018(a3, (uint64_t)v21, &qword_26A68F588);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  *(void *)(v19 + 32) = v5;
  *(unsigned char *)(v19 + 40) = v12;
  *(void *)(v19 + 48) = a2;
  sub_25D6BD538((uint64_t)v21, v19 + 56, &qword_26A68F588);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_25D6BAC7C(v4, (uint64_t)&unk_26A68FA10, v19);
  return swift_release();
}

uint64_t sub_25D6BAB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 24) = a5;
  id v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v6;
  *id v6 = v5;
  v6[1] = sub_25D6BABBC;
  return sub_25D6BB38C();
}

uint64_t sub_25D6BABBC()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_9();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5_8();
  return v3();
}

uint64_t sub_25D6BAC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D6C3020();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25D6AD824(a1, &qword_26A68F9E0);
  }
  else
  {
    sub_25D6C3010();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25D6C2FF0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25D6BADEC(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9E0);
  uint64_t v6 = OUTLINED_FUNCTION_9_4(v5);
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_14_2();
  if (!*(void *)(a1 + 16))
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25D6C2DE0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A691DB8);
    uint64_t v9 = sub_25D6C2DC0();
    os_log_type_t v10 = sub_25D6C3040();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_5() = 0;
      OUTLINED_FUNCTION_18_0(&dword_25D698000, v11, v12, "SELF logging called with no dialogs");
      OUTLINED_FUNCTION_10_0();
    }
  }
  type metadata accessor for NLGScoredDialogBuilder();
  uint64_t inited = swift_initStackObject();
  OUTLINED_FUNCTION_7_4(inited);
  swift_release();
  sub_25D6B3290((uint64_t)v22);
  swift_release();
  if (!v23)
  {
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25D6C2DE0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A691DB8);
    os_log_type_t v15 = sub_25D6C2DC0();
    os_log_type_t v16 = sub_25D6C3050();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_1_5();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_25D698000, v15, v16, "Failed to produce NLGScoredDialog", v17, 2u);
      OUTLINED_FUNCTION_10_0();
    }
  }
  sub_25D6C3000();
  uint64_t v18 = sub_25D6C3020();
  OUTLINED_FUNCTION_22_0(v18);
  sub_25D6BD018((uint64_t)v22, (uint64_t)v21, &qword_26A68F588);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  void v19[3] = 0;
  v19[4] = a1;
  v19[5] = v3;
  sub_25D6BD538((uint64_t)v21, (uint64_t)(v19 + 6), &qword_26A68F588);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25D6BAC7C(v2, (uint64_t)&unk_26A68F9F0, (uint64_t)v19);
  swift_release();
  return sub_25D6AD824((uint64_t)v22, &qword_26A68F588);
}

uint64_t sub_25D6BB07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[31] = a5;
  v6[32] = a6;
  v6[30] = a4;
  return MEMORY[0x270FA2498](sub_25D6BB0A0, 0, 0);
}

uint64_t sub_25D6BB0A0()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = MEMORY[0x263F8EE78];
    do
    {
      sub_25D6A2350(v3, v0 + 80);
      type metadata accessor for NLGScoredDialogBuilder();
      uint64_t inited = swift_initStackObject();
      OUTLINED_FUNCTION_7_4(inited);
      swift_release();
      sub_25D6B3290(v0 + 160);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 80);
      if (*(void *)(v0 + 184))
      {
        sub_25D69F75C((long long *)(v0 + 160), v0 + 120);
        sub_25D69F75C((long long *)(v0 + 120), v0 + 200);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D6B3FF4(0, *(void *)(v4 + 16) + 1, 1, v4);
          uint64_t v4 = v8;
        }
        unint64_t v7 = *(void *)(v4 + 16);
        unint64_t v6 = *(void *)(v4 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_25D6B3FF4(v6 > 1, v7 + 1, 1, v4);
          uint64_t v4 = v9;
        }
        *(void *)(v4 + 16) = v7 + 1;
        sub_25D69F75C((long long *)(v0 + 200), v4 + 40 * v7 + 32);
      }
      else
      {
        sub_25D6AD824(v0 + 160, &qword_26A68F588);
      }
      v3 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  *(void *)(v0 + 264) = v4;
  *(unsigned char *)(v0 + 77) = 3;
  os_log_type_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v10;
  *os_log_type_t v10 = v0;
  v10[1] = sub_25D6BB2B0;
  return sub_25D6BB38C();
}

uint64_t sub_25D6BB2B0()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_9();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_8();
  return v3();
}

uint64_t sub_25D6BB38C()
{
  OUTLINED_FUNCTION_6_5();
  uint64_t v3 = v2;
  *(void *)(v1 + 64) = v4;
  *(void *)(v1 + 72) = v0;
  *(void *)(v1 + 56) = v5;
  uint64_t v6 = sub_25D6C2EB0();
  OUTLINED_FUNCTION_9_4(v6);
  *(void *)(v1 + 80) = swift_task_alloc();
  uint64_t v7 = sub_25D6C29A0();
  *(void *)(v1 + 88) = v7;
  *(void *)(v1 + 96) = *(void *)(v7 - 8);
  *(void *)(v1 + 104) = swift_task_alloc();
  *(void *)(v1 + 112) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9C0);
  OUTLINED_FUNCTION_9_4(v8);
  *(void *)(v1 + 120) = swift_task_alloc();
  *(void *)(v1 + 128) = swift_task_alloc();
  *(void *)(v1 + 136) = swift_task_alloc();
  *(void *)(v1 + 144) = swift_task_alloc();
  *(unsigned char *)(v1 + 184) = *v3;
  return MEMORY[0x270FA2498](sub_25D6BB4E4, 0, 0);
}

uint64_t sub_25D6BB4E4()
{
  uint64_t v69 = v0;
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(v0 + 72) + 32))();
  uint64_t v6 = v5;
  __swift_storeEnumTagSinglePayload((uint64_t)v1, 1, 1, v3);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  unint64_t v7 = 0x26A68F000uLL;
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v8 = *(void *)(v0 + 128);
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 88);
  swift_bridgeObjectRetain();
  sub_25D6C2950();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v8, 1, (uint64_t)v1) == 1)
  {
    sub_25D6AD824(*(void *)(v0 + 128), &qword_26A68F9C0);
LABEL_4:
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25D6C2DE0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A691DB8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25D6C2DC0();
    os_log_type_t v11 = sub_25D6C3050();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v0 + 16) = v4;
      *(void *)(v0 + 24) = v6;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9D0);
      uint64_t v13 = sub_25D6C2EC0();
      uint64_t v1 = (void (*)(uint64_t, uint64_t))v14;
      *(void *)(v0 + 40) = sub_25D6C05EC(v13, v14, &v68);
      sub_25D6C30B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25D698000, v10, v11, "UUID could not be calculated from: %s", v12, 0xCu);
      swift_arrayDestroy();
      unint64_t v7 = 0x26A68F000;
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_15;
  }
  uint64_t v16 = *(void *)(v0 + 136);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 120);
  uint64_t v18 = *(void *)(v0 + 112);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v19 = *(void *)(v0 + 96);
  uint64_t v21 = *(void *)(v0 + 72);
  sub_25D6AD824(v15, &qword_26A68F9C0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_0();
  v22();
  unint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v65(v15, v18, v20);
  uint64_t v23 = v20;
  unint64_t v7 = 0x26A68F000uLL;
  __swift_storeEnumTagSinglePayload(v15, 0, 1, v23);
  (*(void (**)(uint64_t))(v21 + 56))(v18);
  sub_25D6AD824(v16, &qword_26A68F9C0);
  sub_25D6BD538(v17, v16, &qword_26A68F9C0);
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 104);
  uint64_t v24 = *(void *)(v0 + 112);
  uint64_t v25 = *(void *)(v0 + 88);
  uint64_t v26 = sub_25D6C2DE0();
  __swift_project_value_buffer(v26, (uint64_t)qword_26A691DB8);
  v65((uint64_t)v1, v24, v25);
  uint64_t v27 = sub_25D6C2DC0();
  os_log_type_t v28 = sub_25D6C3040();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = *(void *)(v0 + 112);
  uint64_t v31 = *(void *)(v0 + 88);
  if (v29)
  {
    uint64_t v66 = *(void *)(v0 + 112);
    uint64_t v32 = swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v1 = (void (*)(uint64_t, uint64_t))(v32 + 12);
    sub_25D6BD490();
    uint64_t v33 = sub_25D6C3220();
    *(void *)(v0 + 48) = sub_25D6C05EC(v33, v34, &v68);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    uint64_t v35 = OUTLINED_FUNCTION_15_1();
    ((void (*)(uint64_t))(v32 + 12))(v35);
    _os_log_impl(&dword_25D698000, v27, v28, "Request ID %s", (uint8_t *)v32, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    unint64_t v7 = 0x26A68F000;
    OUTLINED_FUNCTION_10_0();

    v1(v66, v31);
  }
  else
  {

    uint64_t v36 = OUTLINED_FUNCTION_15_1();
    ((void (*)(uint64_t))v1)(v36);
    v1(v30, v31);
  }
LABEL_15:
  uint64_t v37 = *(void *)(v0 + 136);
  uint64_t v38 = *(void **)(v0 + 56);
  uint64_t v39 = *(void *)(v0 + 64);
  LOBYTE(v68) = *(unsigned char *)(v0 + 184);
  uint64_t v40 = sub_25D6BC8B0((unsigned __int8 *)&v68, v38, v39, v37);
  *(void *)(v0 + 152) = v40;
  if (v40)
  {
    char v41 = v40;
    if (*(void *)(v7 + 1136) != -1) {
      swift_once();
    }
    uint64_t v42 = sub_25D6C2DE0();
    __swift_project_value_buffer(v42, (uint64_t)qword_26A691DB8);
    id v43 = v41;
    unint64_t v44 = sub_25D6C2DC0();
    os_log_type_t v45 = sub_25D6C3040();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315138;
      uint64_t v47 = sub_25D6BD3C0(v43);
      if (v48 >> 60 == 15)
      {
        unint64_t v49 = 0x800000025D6C6160;
        uint64_t v50 = 0xD000000000000016;
      }
      else
      {
        uint64_t v57 = v47;
        unint64_t v58 = v48;
        sub_25D6C2EA0();
        uint64_t v59 = sub_25D6C2E90();
        if (v60)
        {
          uint64_t v50 = v59;
          unint64_t v49 = v60;
          sub_25D6BD424(v57, v58);
        }
        else
        {
          sub_25D6BD424(v57, v58);
          unint64_t v49 = 0xEF3E676E69646F63;
          uint64_t v50 = 0x6544726F7272653CLL;
        }
      }
      *(void *)(v0 + 32) = sub_25D6C05EC(v50, v49, &v68);
      sub_25D6C30B0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25D698000, v44, v45, "    Sending SELF generation event:     %s", v46, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();
    }
    else
    {
    }
    OUTLINED_FUNCTION_1_12();
    int v67 = (uint64_t (*)(id))((char *)v63 + *v63);
    uint64_t v64 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v64;
    *uint64_t v64 = v0;
    v64[1] = sub_25D6BBD3C;
    id v56 = v43;
    goto LABEL_32;
  }
  uint64_t v51 = *(void *)(v0 + 72);
  uint64_t v52 = sub_25D6BC128(*(void *)(v0 + 144), *(void *)(v0 + 136));
  *(void *)(v0 + 168) = v52;
  if (v52)
  {
    char v53 = v52;
    OUTLINED_FUNCTION_1_12();
    int v67 = (uint64_t (*)(id))((char *)v54 + *v54);
    unint64_t v55 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v55;
    *unint64_t v55 = v0;
    v55[1] = sub_25D6BBF8C;
    id v56 = v53;
LABEL_32:
    return v67(v56);
  }
  OUTLINED_FUNCTION_8_4();
  sub_25D6AD824((uint64_t)v1, &qword_26A68F9C0);
  sub_25D6AD824(v51, &qword_26A68F9C0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5_8();
  return v61();
}

uint64_t sub_25D6BBD3C()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_9();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25D6BBE08, 0, 0);
}

uint64_t sub_25D6BBE08()
{
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = sub_25D6BC128(*(void *)(v1 + 144), *(void *)(v1 + 136));
  *(void *)(v1 + 168) = v3;
  if (v3)
  {
    uint64_t v4 = v3;
    OUTLINED_FUNCTION_1_12();
    uint64_t v9 = (uint64_t (*)(void *))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v1 + 176) = v6;
    *uint64_t v6 = v1;
    v6[1] = sub_25D6BBF8C;
    return v9(v4);
  }
  else
  {
    OUTLINED_FUNCTION_8_4();
    sub_25D6AD824(v0, &qword_26A68F9C0);
    sub_25D6AD824(v2, &qword_26A68F9C0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_5_8();
    return v8();
  }
}

uint64_t sub_25D6BBF8C()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_9();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25D6BC058, 0, 0);
}

uint64_t sub_25D6BC058()
{
  OUTLINED_FUNCTION_8_4();
  sub_25D6AD824(v0, &qword_26A68F9C0);
  sub_25D6AD824(v1, &qword_26A68F9C0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5_8();
  return v3();
}

void *sub_25D6BC128(uint64_t a1, uint64_t a2)
{
  uint64_t v82 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9C0);
  uint64_t v5 = OUTLINED_FUNCTION_9_4(v4);
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_13_2();
  uint64_t v79 = v7 - v8;
  uint64_t v11 = MEMORY[0x270FA5388](v9, v10);
  uint64_t v13 = (char *)&v75 - v12;
  uint64_t v15 = MEMORY[0x270FA5388](v11, v14);
  uint64_t v17 = (char *)&v75 - v16;
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  uint64_t v21 = (char *)&v75 - v20;
  uint64_t v23 = MEMORY[0x270FA5388](v19, v22);
  uint64_t v78 = (uint64_t)&v75 - v24;
  MEMORY[0x270FA5388](v23, v25);
  uint64_t v27 = (char *)&v75 - v26;
  sub_25D6C29A0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v80 = v28;
  uint64_t v81 = v29;
  MEMORY[0x270FA5388](v28, v30);
  OUTLINED_FUNCTION_13_2();
  uint64_t v33 = v31 - v32;
  uint64_t v36 = MEMORY[0x270FA5388](v34, v35);
  uint64_t v77 = (char *)&v75 - v37;
  MEMORY[0x270FA5388](v36, v38);
  uint64_t v40 = (char *)&v75 - v39;
  id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v75 = v33;
    uint64_t v76 = v2;
    id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
    if (v43)
    {
      unint64_t v44 = v43;
      id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
      if (v45)
      {
        uint64_t v46 = v45;
        sub_25D6BD018(v82, (uint64_t)v27, &qword_26A68F9C0);
        uint64_t v47 = v80;
        if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v80) == 1)
        {
          sub_25D6AD824((uint64_t)v27, &qword_26A68F9C0);
        }
        else
        {
          uint64_t v62 = v81;
          OUTLINED_FUNCTION_23_0();
          v63();
          sub_25D6BCFD8();
          uint64_t v64 = v44;
          uint64_t v65 = (uint64_t)v77;
          (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v77, v40, v47);
          id v66 = sub_25D6BC814(v65);
          objc_msgSend(v64, sel_setUuid_, v66);

          unint64_t v44 = v64;
          (*(void (**)(char *, uint64_t))(v62 + 8))(v40, v47);
        }
        uint64_t v67 = v75;
        objc_msgSend(v44, sel_setComponent_, *(unsigned int *)(v76 + 48));
        uint64_t v68 = v78;
        sub_25D6BD018(a1, v78, &qword_26A68F9C0);
        if (__swift_getEnumTagSinglePayload(v68, 1, v47) == 1)
        {
          sub_25D6AD824(v68, &qword_26A68F9C0);
          uint64_t v69 = v46;
        }
        else
        {
          uint64_t v70 = v81;
          OUTLINED_FUNCTION_23_0();
          v71();
          sub_25D6BCFD8();
          uint64_t v72 = (uint64_t)v77;
          (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v77, v67, v47);
          id v73 = sub_25D6BC814(v72);
          uint64_t v69 = v46;
          objc_msgSend(v46, sel_setUuid_, v73);

          (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v67, v47);
        }
        objc_msgSend(v69, sel_setComponent_, 1);
        objc_msgSend(v42, sel_setSource_, v44);
        objc_msgSend(v42, sel_setTarget_, v69);

        return v42;
      }
    }
    else
    {
      unint64_t v44 = v42;
    }
  }
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v48 = sub_25D6C2DE0();
  __swift_project_value_buffer(v48, (uint64_t)qword_26A691DB8);
  sub_25D6BD018(a1, (uint64_t)v21, &qword_26A68F9C0);
  sub_25D6BD018(v82, (uint64_t)v17, &qword_26A68F9C0);
  unint64_t v49 = sub_25D6C2DC0();
  os_log_type_t v50 = sub_25D6C3050();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 136315394;
    sub_25D6BD018((uint64_t)v21, (uint64_t)v13, &qword_26A68F9C0);
    uint64_t v52 = v80;
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v80) == 1)
    {
      sub_25D6AD824((uint64_t)v13, &qword_26A68F9C0);
      unint64_t v53 = 0xE300000000000000;
      uint64_t v54 = 6369134;
    }
    else
    {
      uint64_t v54 = sub_25D6C2960();
      unint64_t v53 = v55;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v13, v52);
    }
    uint64_t v56 = sub_25D6C05EC(v54, v53, &v83);
    OUTLINED_FUNCTION_5_2(v56);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    sub_25D6AD824((uint64_t)v21, &qword_26A68F9C0);
    *(_WORD *)(v51 + 12) = 2080;
    uint64_t v57 = v79;
    sub_25D6BD018((uint64_t)v17, v79, &qword_26A68F9C0);
    if (__swift_getEnumTagSinglePayload(v57, 1, v52) == 1)
    {
      sub_25D6AD824(v57, &qword_26A68F9C0);
      unint64_t v58 = 0xE300000000000000;
      uint64_t v59 = 6369134;
    }
    else
    {
      uint64_t v59 = sub_25D6C2960();
      unint64_t v58 = v60;
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v57, v52);
    }
    uint64_t v61 = sub_25D6C05EC(v59, v58, &v83);
    OUTLINED_FUNCTION_5_2(v61);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    sub_25D6AD824((uint64_t)v17, &qword_26A68F9C0);
    _os_log_impl(&dword_25D698000, v49, v50, "    Unable to create RequestLink schemas for SELF for requestId: %s,     and loggingGenerationId: %s", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    sub_25D6AD824((uint64_t)v21, &qword_26A68F9C0);
    sub_25D6AD824((uint64_t)v17, &qword_26A68F9C0);
  }

  return 0;
}

id sub_25D6BC814(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_25D6C2970();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_25D6C29A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void *sub_25D6BC8B0(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void (*v59)(long long *__return_ptr, uint64_t, uint64_t);
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  id v74;
  void *v75;
  long long v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void v81[4];
  void v82[3];
  uint64_t v83;
  uint64_t v84;

  uint64_t v75 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F9C0);
  uint64_t v8 = OUTLINED_FUNCTION_9_4(v7);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25D6C29A0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_13_2();
  uint64_t v19 = v17 - v18;
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v23 = (char *)&v73 - v22;
  uint64_t v24 = *a1;
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E500]), sel_init);
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E508]), sel_init);
    if (v27)
    {
      id v73 = a3;
      uint64_t v74 = v27;
      sub_25D6BD018(a4, (uint64_t)v11, &qword_26A68F9C0);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
      {
        sub_25D6AD824((uint64_t)v11, &qword_26A68F9C0);
        sub_25D6BCFD8();
        sub_25D6C2990();
        id v28 = sub_25D6BC814(v19);
        id v29 = v74;
        objc_msgSend(v74, sel_setNlgId_, v28);
      }
      else
      {
        OUTLINED_FUNCTION_23_0();
        v34();
        sub_25D6BCFD8();
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v19, v23, v12);
        id v35 = sub_25D6BC814(v19);
        id v29 = v74;
        objc_msgSend(v74, sel_setNlgId_, v35);

        (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v12);
      }
      objc_msgSend(v26, sel_setEventMetadata_, v29);
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E528]), sel_init);
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E518]), sel_init);
      uint64_t v38 = v37;
      uint64_t v39 = v73;
      switch(v24)
      {
        case 1:
          if (v37)
          {
            uint64_t v40 = 2;
            goto LABEL_19;
          }
          break;
        case 2:
          if (v37)
          {
            uint64_t v40 = 0;
            goto LABEL_19;
          }
          break;
        case 3:
          break;
        default:
          if (v37)
          {
            uint64_t v40 = 1;
LABEL_19:
            objc_msgSend(v37, sel_setDialogScorerType_, v40);
          }
          break;
      }
      id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E510]), sel_init);
      uint64_t v42 = v41;
      if (v41)
      {
        if (HIDWORD(v75[2]))
        {
          OUTLINED_FUNCTION_0_4();
          sub_25D6C3170();
          __break(1u);
          JUMPOUT(0x25D6BCF40);
        }
        objc_msgSend(v41, sel_setCount_);
      }
      id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E520]), sel_init);
      sub_25D6BD018(v39, (uint64_t)&v76, &qword_26A68F588);
      if (!v78)
      {
        sub_25D6AD824((uint64_t)&v76, &qword_26A68F588);
LABEL_32:
        objc_msgSend(v36, sel_setDialogScorer_, v38);
        objc_msgSend(v36, sel_setDialogCandidateStatistics_, v42);
        objc_msgSend(v36, sel_setSelectedScoredDialog_, v43);
        objc_msgSend(v26, sel_setScoredDialogSelected_, v36);

        return v26;
      }
      uint64_t v75 = v38;
      sub_25D69F75C(&v76, (uint64_t)v82);
      __swift_project_boxed_opaque_existential_1(v82, v83);
      uint64_t v44 = OUTLINED_FUNCTION_19_0();
      v45(v44);
      __swift_project_boxed_opaque_existential_1(v81, v81[3]);
      uint64_t v46 = OUTLINED_FUNCTION_19_0();
      v47(v46);
      long long v48 = v76;
      uint64_t v50 = v77;
      uint64_t v49 = v78;
      uint64_t v51 = v80;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
      if (*((void *)&v48 + 1))
      {
        if (!v43)
        {
          uint64_t v70 = OUTLINED_FUNCTION_10_4();
          sub_25D6B36A8(v70, v71);
          goto LABEL_31;
        }
        id v52 = v43;
        id v73 = v51;
        id v53 = v52;
        sub_25D6BD368(v48, *((uint64_t *)&v48 + 1), v52);

        id v54 = v53;
        sub_25D6BD310(v50, v49, v54);
        uint64_t v55 = OUTLINED_FUNCTION_10_4();
        sub_25D6B36A8(v55, v56);
      }
      else if (!v43)
      {
LABEL_31:
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
        uint64_t v38 = v75;
        goto LABEL_32;
      }
      uint64_t v57 = v83;
      uint64_t v58 = v84;
      __swift_project_boxed_opaque_existential_1(v82, v83);
      uint64_t v59 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v58 + 8);
      unint64_t v60 = v43;
      v59(&v76, v57, v58);
      uint64_t v61 = v78;
      uint64_t v62 = v79;
      __swift_project_boxed_opaque_existential_1(&v76, v78);
      uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v61, v62);
      uint64_t v65 = v64;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v76);
      sub_25D6BD2AC(v63, v65, v60);

      id v66 = v83;
      uint64_t v67 = v84;
      __swift_project_boxed_opaque_existential_1(v82, v83);
      uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v67 + 16);
      uint64_t v69 = v60;
      v68(v66, v67);
      objc_msgSend(v69, sel_setScore_);

      goto LABEL_31;
    }
  }
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_25D6C2DE0();
  __swift_project_value_buffer(v30, (uint64_t)qword_26A691DB8);
  uint64_t v31 = sub_25D6C2DC0();
  os_log_type_t v32 = sub_25D6C3050();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_1_5();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_25D698000, v31, v32, "Failed to initialize NLGSchema objects", v33, 2u);
    OUTLINED_FUNCTION_10_0();
  }

  return 0;
}

uint64_t sub_25D6BCF50()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25D6BCF80()
{
  sub_25D6BCF50();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for SELFLogger()
{
  return self;
}

unint64_t sub_25D6BCFD8()
{
  unint64_t result = qword_26A68F9C8;
  if (!qword_26A68F9C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A68F9C8);
  }
  return result;
}

uint64_t sub_25D6BD018(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25D6BD074(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_0_4();
    uint64_t result = sub_25D6C3170();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F8E0);
    uint64_t result = sub_25D6C2FE0();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25D6BD10C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_25D6BD1E8;
  return v6(a1);
}

uint64_t sub_25D6BD1E8()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0_8();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_9();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5_8();
  return v3();
}

void sub_25D6BD2AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D6C2E70();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setScoredDialogIdentifier_, v4);
}

void sub_25D6BD310(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D6C2E70();
  objc_msgSend(a3, sel_setCatIdentifier_, v4);
}

void sub_25D6BD368(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D6C2E70();
  objc_msgSend(a3, sel_setCatFamily_, v4);
}

uint64_t sub_25D6BD3C0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_jsonData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25D6C2940();

  return v3;
}

uint64_t sub_25D6BD424(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25D6BD438(a1, a2);
  }
  return a1;
}

uint64_t sub_25D6BD438(uint64_t a1, unint64_t a2)
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

unint64_t sub_25D6BD490()
{
  unint64_t result = qword_26A68F9D8;
  if (!qword_26A68F9D8)
  {
    sub_25D6C29A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68F9D8);
  }
  return result;
}

uint64_t sub_25D6BD4E0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(v0 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  }
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_25D6BD538(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25D6BD594()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_11_4(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_25D6BABBC;
  uint64_t v5 = OUTLINED_FUNCTION_16_2();
  return sub_25D6BB07C(v5, v6, v7, v8, v1, v0 + 48);
}

uint64_t sub_25D6BD644()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25D6BD67C(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_11_4(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25D6BABBC;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A68F9F8 + dword_26A68F9F8);
  return v7(a1, v3);
}

uint64_t sub_25D6BD72C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 80)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  }
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_25D6BD784()
{
  char v1 = *(unsigned char *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_11_4(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_25D6BD848;
  uint64_t v5 = OUTLINED_FUNCTION_16_2();
  return sub_25D6BAB04(v5, v6, v7, v8, v1);
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_7_4(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(unsigned char *)(a1 + 60) = 1;
  return sub_25D6B3220(v1);
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_4(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return v0;
}

void OUTLINED_FUNCTION_18_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t dispatch thunk of NLGDialogHistoryEntry.dialogSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogHistoryEntry.dialogIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLGDialogRecorder.history.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogRecorder.insert(dialog:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NLGDialogRecorder.clear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25D6BDA30(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v22 = *(void *)(result + 16);
  if (v22)
  {
    unint64_t v4 = 0;
    uint64_t v21 = result + 32;
    uint64_t v19 = a2 + 7;
    uint64_t v20 = MEMORY[0x263F8EE78];
    while (1)
    {
      if (v4 >= *(void *)(v3 + 16))
      {
LABEL_29:
        __break(1u);
        return result;
      }
      os_log_type_t v5 = (uint64_t *)(v21 + 16 * v4);
      uint64_t v6 = *v5;
      uint64_t v7 = v5[1];
      ++v4;
      uint64_t v8 = a2[2];
      if (!v8) {
        goto LABEL_19;
      }
      unint64_t result = a2[4];
      if (result != v6 || a2[5] != v7)
      {
        unint64_t result = sub_25D6C3230();
        if ((result & 1) == 0) {
          break;
        }
      }
LABEL_24:
      if (v4 == v22) {
        goto LABEL_27;
      }
    }
    if (v8 != 1)
    {
      uint64_t v10 = v19;
      uint64_t v11 = 1;
      while (1)
      {
        uint64_t v12 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          break;
        }
        unint64_t result = *(v10 - 1);
        if (result == v6 && *v10 == v7) {
          goto LABEL_24;
        }
        unint64_t result = sub_25D6C3230();
        if (result) {
          goto LABEL_24;
        }
        v10 += 2;
        ++v11;
        if (v12 == v8) {
          goto LABEL_19;
        }
      }
      __break(1u);
      goto LABEL_29;
    }
LABEL_19:
    swift_bridgeObjectRetain();
    unint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = v20;
    if ((result & 1) == 0)
    {
      unint64_t result = (uint64_t)sub_25D6B82D0(0, *(void *)(v20 + 16) + 1, 1);
      uint64_t v14 = v20;
    }
    uint64_t v15 = v14;
    unint64_t v17 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      unint64_t result = (uint64_t)sub_25D6B82D0((char *)(v16 > 1), v17 + 1, 1);
      uint64_t v15 = v20;
    }
    *(void *)(v15 + 16) = v17 + 1;
    uint64_t v20 = v15;
    uint64_t v18 = v15 + 16 * v17;
    *(void *)(v18 + 32) = v6;
    *(void *)(v18 + 40) = v7;
    goto LABEL_24;
  }
  uint64_t v20 = MEMORY[0x263F8EE78];
LABEL_27:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_25D6BDBF8(uint64_t a1)
{
  uint64_t v3 = sub_25D6C2AF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68FA48);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a1;
  uint64_t v12 = sub_25D6C2A70();
  sub_25D6BE404(&qword_26A68FA50);
  swift_retain();
  sub_25D6C2FC0();
  uint64_t v13 = sub_25D6BE404(&qword_26A68FA58);
  sub_25D6C30A0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3);
  v27[0] = v1;
  if (EnumTagSinglePayload == 1)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v17 = v4 + 32;
    id v28 = v18;
    uint64_t v19 = (void (**)(char *, uint64_t))(v17 - 24);
    uint64_t v15 = MEMORY[0x263F8EE78];
    v27[1] = v13;
    v27[2] = v12;
    v27[3] = v17;
    do
    {
      v28(v7, v11, v3);
      if (sub_25D6C2AE0())
      {
        uint64_t v20 = sub_25D6C2AD0();
        uint64_t v22 = v21;
        (*v19)(v7, v3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25D6B3558();
          uint64_t v15 = v25;
        }
        unint64_t v23 = *(void *)(v15 + 16);
        if (v23 >= *(void *)(v15 + 24) >> 1)
        {
          sub_25D6B3558();
          uint64_t v15 = v26;
        }
        *(void *)(v15 + 16) = v23 + 1;
        uint64_t v24 = v15 + 16 * v23;
        *(void *)(v24 + 32) = v20;
        *(void *)(v24 + 40) = v22;
      }
      else
      {
        (*v19)(v7, v3);
      }
      sub_25D6C30A0();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3) != 1);
  }
  swift_release();
  return v15;
}

uint64_t sub_25D6BDEEC(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68FA38);
  uint64_t v4 = *(void *)(sub_25D6C2A90() - 8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25D6C5110;
  uint64_t v5 = *(void (**)(void))(v4 + 104);
  OUTLINED_FUNCTION_0_9();
  v5();
  OUTLINED_FUNCTION_0_9();
  v5();
  OUTLINED_FUNCTION_0_9();
  v5();
  OUTLINED_FUNCTION_0_9();
  v5();
  OUTLINED_FUNCTION_0_9();
  v5();
  sub_25D6C2AC0();
  swift_allocObject();
  sub_25D6C2AB0();
  sub_25D6C2AA0();
  uint64_t v6 = sub_25D6C2A80();
  uint64_t v8 = sub_25D6BDBF8(v6);
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25D6BDA30(v8, a3);
  swift_release();
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_25D6BE284()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration16MorphunTokenizer_locale;
  uint64_t v2 = sub_25D6C2A60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25D6BE324()
{
  return type metadata accessor for MorphunTokenizer();
}

uint64_t type metadata accessor for MorphunTokenizer()
{
  uint64_t result = qword_26A68FA28;
  if (!qword_26A68FA28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D6BE374()
{
  uint64_t result = sub_25D6C2A60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25D6BE404(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25D6C2A70();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t NLGDefaultProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NLGDefaultProvider.init()()
{
  return v0;
}

uint64_t sub_25D6BE470@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DefaultDialogProvider();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_25D6B616C;
  *(void *)(result + 24) = 0;
  a1[3] = v2;
  a1[4] = (uint64_t)&off_270A64C58;
  *a1 = result;
  return result;
}

uint64_t NLGDefaultProvider.deinit()
{
  return v0;
}

uint64_t NLGDefaultProvider.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for NLGDefaultProvider()
{
  return self;
}

uint64_t method lookup function for NLGDefaultProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NLGDefaultProvider);
}

uint64_t dispatch thunk of NLGDefaultProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of NLGDefaultProvider.dialogProvider()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_25D6BE558@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A68FA70);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5, v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D6C111C();
  sub_25D6C3300();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v21) = 0;
  uint64_t v7 = sub_25D6C31E0();
  uint64_t v10 = v9;
  uint64_t v20 = v7;
  sub_25D6C1168();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_9((uint64_t)&type metadata for SemanticVersion);
  uint64_t v19 = v21;
  LOBYTE(v21) = 1;
  char v11 = sub_25D6C3200();
  char v24 = v11;
  if (v11)
  {
    OUTLINED_FUNCTION_5_9((uint64_t)&type metadata for SemanticVersion);
    uint64_t v12 = OUTLINED_FUNCTION_2_10();
    v13(v12);
    uint64_t v14 = v21;
    uint64_t v15 = v22;
    uint64_t v16 = v23;
  }
  else
  {
    uint64_t v17 = OUTLINED_FUNCTION_2_10();
    v18(v17);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v20;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v16;
  *(unsigned char *)(a2 + 40) = (v24 & 1) == 0;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v23;
  return result;
}

uint64_t sub_25D6BE79C()
{
  unint64_t v0 = sub_25D6C31D0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25D6BE7EC()
{
  return 3;
}

uint64_t sub_25D6BE7F4()
{
  return 0;
}

uint64_t sub_25D6BE800(char a1)
{
  if (!a1) {
    return 0x726F74636146;
  }
  if (a1 == 1) {
    return 0xD000000000000023;
  }
  return 0x6E6F6973726556;
}

uint64_t sub_25D6BE858(unsigned __int8 *a1, char *a2)
{
  return sub_25D6A9228(*a1, *a2);
}

uint64_t sub_25D6BE864()
{
  return sub_25D6AFB20(*v0);
}

uint64_t sub_25D6BE86C(uint64_t a1)
{
  return sub_25D6AFB2C(a1, *v1);
}

uint64_t sub_25D6BE874(uint64_t a1)
{
  return sub_25D6AFCDC(a1, *v1);
}

uint64_t sub_25D6BE87C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D6BE79C();
  *a1 = result;
  return result;
}

uint64_t sub_25D6BE8AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25D6BE800(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25D6BE8D8()
{
  return sub_25D6BE800(*v0);
}

uint64_t sub_25D6BE8E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D6BE7E8();
  *a1 = result;
  return result;
}

uint64_t sub_25D6BE908()
{
  return sub_25D6BE7F4();
}

uint64_t sub_25D6BE928@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D6BE7EC();
  *a1 = result;
  return result;
}

uint64_t sub_25D6BE950(uint64_t a1)
{
  unint64_t v2 = sub_25D6C111C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D6BE98C(uint64_t a1)
{
  unint64_t v2 = sub_25D6C111C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25D6BE9C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (void *)sub_25D6BE558(a1, (uint64_t)__src);
  if (!v2) {
    return memcpy(a2, __src, 0x48uLL);
  }
  return result;
}

double sub_25D6BEA14()
{
  type metadata accessor for DialogEngineAssetClient();
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = xmmword_25D6C4FA0;
  qword_26A691E80 = v0;
  return result;
}

id sub_25D6BEA4C()
{
  unint64_t v1 = (void *)v0[3];
  id v2 = v1;
  if (v1 == (void *)1)
  {
    id v2 = sub_25D6BEAD4((uint64_t)v0, *v0);
    uint64_t v3 = (void *)v0[3];
    v0[3] = (uint64_t)v2;
    id v4 = v2;
    sub_25D6C0EA4(v3);
  }
  sub_25D6C0EB4(v1);
  return v2;
}

id sub_25D6BEAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_sharedManager);
  uint64_t v7 = (void *)sub_25D6C2E70();
  id v8 = objc_msgSend(v6, sel_retrieveAssetSet_usages_, v7, 0);

  if (v8)
  {
    *(void *)(v4 + 16) = v8;
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25D6C2DE0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A691DB8);
    uint64_t v10 = sub_25D6C2DC0();
    os_log_type_t v11 = sub_25D6C3040();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      uint64_t v13 = aBlock[0];
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v27 = sub_25D6C05EC(0xD000000000000015, 0x800000025D6C6510, aBlock);
      sub_25D6C30B0();
      _os_log_impl(&dword_25D698000, v10, v11, "Initialized asset set for %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611B1630](v13, -1, -1);
      MEMORY[0x2611B1630](v12, -1, -1);
    }

    id v14 = objc_msgSend(v5, sel_sharedManager);
    uint64_t v15 = (void *)sub_25D6C2E70();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v4;
    *(void *)(v16 + 24) = a2;
    aBlock[4] = (uint64_t)sub_25D6C0F34;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25D6BF238;
    aBlock[3] = (uint64_t)&block_descriptor;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v18 = objc_msgSend(v14, sel_observeAssetSet_queue_handler_, v15, 0, v17);
    _Block_release(v17);

    *(void *)(a1 + 16) = v18;
    swift_unknownObjectRelease();
    swift_beginAccess();
    id v19 = *(id *)(v4 + 16);
    swift_release();
  }
  else
  {
    swift_deallocUninitializedObject();
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25D6C2DE0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26A691DB8);
    uint64_t v21 = sub_25D6C2DC0();
    os_log_type_t v22 = sub_25D6C3050();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v27 = sub_25D6C05EC(0xD000000000000015, 0x800000025D6C6510, aBlock);
      sub_25D6C30B0();
      _os_log_impl(&dword_25D698000, v21, v22, "Unable to initialize asset set for %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611B1630](v24, -1, -1);
      MEMORY[0x2611B1630](v23, -1, -1);
    }

    return 0;
  }
  return v19;
}

void sub_25D6BEF84(uint64_t a1)
{
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25D6C2DE0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A691DB8);
  uint64_t v3 = sub_25D6C2DC0();
  os_log_type_t v4 = sub_25D6C3040();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25D698000, v3, v4, "Refreshing asset set", v5, 2u);
    MEMORY[0x2611B1630](v5, -1, -1);
  }

  id v6 = objc_msgSend(self, sel_sharedManager);
  uint64_t v7 = (void *)sub_25D6C2E70();
  id v8 = objc_msgSend(v6, sel_retrieveAssetSet_usages_, v7, 0);

  if (v8)
  {
    uint64_t v9 = (void **)(a1 + 16);
    swift_beginAccess();
    uint64_t v10 = *v9;
    *uint64_t v9 = v8;
  }
  else
  {
    oslog = sub_25D6C2DC0();
    os_log_type_t v11 = sub_25D6C3050();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v15[0] = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      v15[3] = sub_25D6C05EC(0xD000000000000015, 0x800000025D6C6510, v15);
      sub_25D6C30B0();
      _os_log_impl(&dword_25D698000, oslog, v11, "Unable to update asset set for %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611B1630](v13, -1, -1);
      MEMORY[0x2611B1630](v12, -1, -1);
    }
    else
    {
    }
  }
}

void sub_25D6BF228(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
  sub_25D6C0EA4(v2);
}

uint64_t sub_25D6BF238(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25D6BF27C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8, v3);
  id v6 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v7);
  uint64_t v9 = (char *)&v111 - v8;
  uint64_t v122 = sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  uint64_t v120 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v11, v12);
  uint64_t v15 = (void (*)(void))((char *)&v111 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  uint64_t v21 = (char *)&v111 - v20;
  uint64_t v23 = MEMORY[0x270FA5388](v19, v22);
  uint64_t v25 = (char *)&v111 - v24;
  MEMORY[0x270FA5388](v23, v26);
  id v28 = (char *)&v111 - v27;
  sub_25D6C03C8((uint64_t)v125);
  uint64_t v121 = a1;
  long long v116 = v25;
  uint64_t v117 = v15;
  uint64_t v115 = v21;
  unint64_t v118 = v28;
  uint64_t v29 = v125[0];
  unint64_t v30 = v125[1];
  sub_25D6C06C0((uint64_t)v125);
  id v31 = sub_25D6BEA4C();
  if (!v31)
  {
    sub_25D6C06EC((uint64_t)v125);
    goto LABEL_6;
  }
  os_log_type_t v32 = v31;
  uint64_t v33 = (void *)sub_25D6C2E70();
  sub_25D6C06EC((uint64_t)v125);
  uint64_t v25 = (char *)objc_msgSend(v32, sel_assetNamed_, v33);

  if (!v25)
  {
LABEL_6:
    OUTLINED_FUNCTION_18_1();
    __swift_storeEnumTagSinglePayload(v35, v36, v37, (uint64_t)v25);
LABEL_8:
    sub_25D6C0718((uint64_t)v9);
    if (qword_26A68F470 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_25D6C2DE0();
    __swift_project_value_buffer(v39, (uint64_t)qword_26A691DB8);
    sub_25D6C06C0((uint64_t)v125);
    uint64_t v40 = sub_25D6C2DC0();
    os_log_type_t v41 = sub_25D6C3040();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_3_5();
      v129[0] = OUTLINED_FUNCTION_8_5();
      *(_DWORD *)uint64_t v42 = 136315138;
      sub_25D6C06C0((uint64_t)v125);
      uint64_t v43 = sub_25D6C05EC(v29, v30, v129);
      OUTLINED_FUNCTION_19_1(v43);
      sub_25D6C30B0();
      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v125);
      _os_log_impl(&dword_25D698000, v40, v41, "No updated directory for '%s'", v42, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = (char *)v122;
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();

      uint64_t v44 = 1;
LABEL_14:
      uint64_t v45 = v121;
      return __swift_storeEnumTagSinglePayload(v45, v44, 1, (uint64_t)v25);
    }
    sub_25D6C06EC((uint64_t)v125);
    sub_25D6C06EC((uint64_t)v125);

LABEL_13:
    uint64_t v44 = 1;
    goto LABEL_14;
  }
  id v34 = objc_msgSend(v25, sel_location);

  if (v34)
  {
    sub_25D6C28E0();
  }
  OUTLINED_FUNCTION_18_1();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v38, 1, (uint64_t)v25);
  sub_25D6C0778((uint64_t)v6, (uint64_t)v9, &qword_26A68F690);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, (uint64_t)v25) == 1) {
    goto LABEL_8;
  }
  uint64_t v47 = v120 + 32;
  long long v48 = *(void (**)(char *, char *, char *))(v120 + 32);
  v48(v118, v9, v25);
  sub_25D6C03C8((uint64_t)v129);
  uint64_t v113 = v47;
  if (qword_26A68F470 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_25D6C2DE0();
  uint64_t v50 = __swift_project_value_buffer(v49, (uint64_t)qword_26A691DB8);
  uint64_t v51 = v120;
  id v52 = *(NSObject **)(v120 + 16);
  id v53 = v116;
  uint64_t v117 = (void (*)(void))(v120 + 16);
  os_log_t v114 = v52;
  OUTLINED_FUNCTION_14_3();
  v54();
  uint64_t v119 = v50;
  uint64_t v55 = sub_25D6C2DC0();
  os_log_type_t v56 = sub_25D6C3040();
  BOOL v57 = os_log_type_enabled(v55, v56);
  uint64_t v112 = (void (*)(uint64_t, char *, char *))v48;
  if (v57)
  {
    uint64_t v58 = (uint8_t *)OUTLINED_FUNCTION_3_5();
    v132[0] = OUTLINED_FUNCTION_8_5();
    *(_DWORD *)uint64_t v58 = 136315138;
    sub_25D6B8E24();
    uint64_t v59 = sub_25D6C3220();
    uint64_t v61 = sub_25D6C05EC(v59, v60, v132);
    OUTLINED_FUNCTION_12_3(v61);
    uint64_t v62 = v120;
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    uint64_t v63 = *(void (**)(void))(v62 + 8);
    OUTLINED_FUNCTION_6_6();
    v63();
    _os_log_impl(&dword_25D698000, v55, v56, "Found asset config in %s", v58, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    uint64_t v63 = *(void (**)(void))(v51 + 8);
    ((void (*)(char *, char *))v63)(v53, v25);
  }

  sub_25D6C0778((uint64_t)v130, (uint64_t)v131, &qword_26A68FA60);
  sub_25D6C0778((uint64_t)v131, (uint64_t)v132, &qword_26A68FA60);
  if (v133)
  {
    sub_25D6C06EC((uint64_t)v129);
    sub_25D6C06EC((uint64_t)v125);
    uint64_t v64 = OUTLINED_FUNCTION_13_3();
    os_log_type_t v65 = sub_25D6C3040();
    if (os_log_type_enabled(v64, v65))
    {
      id v66 = (uint8_t *)OUTLINED_FUNCTION_3_5();
      uint64_t v67 = OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_16_3(v67);
      *(_DWORD *)id v66 = 136315138;
      uint64_t v68 = sub_25D6C05EC(0xD000000000000019, 0x800000025D6C62D0, v124);
      OUTLINED_FUNCTION_4_8(v68);
      sub_25D6C30B0();
      _os_log_impl(&dword_25D698000, v64, v65, "Updated %s missing min diff update version", v66, 0xCu);
      uint64_t v44 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();

      uint64_t v25 = (char *)v122;
      OUTLINED_FUNCTION_6_6();
      v63();
      goto LABEL_14;
    }

    goto LABEL_29;
  }
  uint64_t v69 = v132[0];
  uint64_t v25 = (char *)v132[1];
  uint64_t v70 = v132[2];
  uint64_t v72 = v126;
  uint64_t v71 = v127;
  uint64_t v73 = v128;
  char v74 = sub_25D6A69DC(v130[4], v130[5], v130[6], v126, v127, v128);
  long long v116 = (char *)v71;
  if ((v74 & 1) == 0)
  {
    uint64_t v117 = v63;
    sub_25D6C06C0((uint64_t)v125);
    sub_25D6C06C0((uint64_t)v129);
    uint64_t v92 = OUTLINED_FUNCTION_13_3();
    os_log_type_t v93 = sub_25D6C3040();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      OUTLINED_FUNCTION_16_3(v95);
      *(_DWORD *)uint64_t v94 = 136315394;
      uint64_t v96 = sub_25D6A6834();
      uint64_t v98 = sub_25D6C05EC(v96, v97, v124);
      OUTLINED_FUNCTION_4_8(v98);
      sub_25D6C30B0();
      swift_bridgeObjectRelease();
      sub_25D6C06EC((uint64_t)v129);
      sub_25D6C06EC((uint64_t)v129);
      *(_WORD *)(v94 + 12) = 2080;
      OUTLINED_FUNCTION_9_5();
      uint64_t v99 = sub_25D6A6834();
      uint64_t v123 = sub_25D6C05EC(v99, v100, v124);
      sub_25D6C30B0();
      swift_bridgeObjectRelease();
      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v125);
      _os_log_impl(&dword_25D698000, v92, v93, "Updated asset has older version %s <= %s", (uint8_t *)v94, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();
    }
    else
    {

      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v129);
      sub_25D6C06EC((uint64_t)v129);
    }
    goto LABEL_35;
  }
  if ((sub_25D6A69A0(v72, v71, v73, v69, (uint64_t)v25, v70) & 1) == 0)
  {
    sub_25D6C06EC((uint64_t)v129);
    sub_25D6C06C0((uint64_t)v125);
    unint64_t v101 = OUTLINED_FUNCTION_13_3();
    os_log_type_t v102 = sub_25D6C3040();
    if (!os_log_type_enabled(v101, v102))
    {

      sub_25D6C06EC((uint64_t)v125);
      sub_25D6C06EC((uint64_t)v125);
      OUTLINED_FUNCTION_11_5();
LABEL_29:
      uint64_t v25 = (char *)v122;
      OUTLINED_FUNCTION_6_6();
      v63();
      goto LABEL_13;
    }
    uint64_t v103 = swift_slowAlloc();
    uint64_t v104 = swift_slowAlloc();
    uint64_t v117 = v63;
    OUTLINED_FUNCTION_16_3(v104);
    *(_DWORD *)uint64_t v103 = 136315394;
    uint64_t v105 = sub_25D6A6834();
    uint64_t v107 = sub_25D6C05EC(v105, v106, v124);
    OUTLINED_FUNCTION_4_8(v107);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v103 + 12) = 2080;
    OUTLINED_FUNCTION_9_5();
    uint64_t v108 = sub_25D6A6834();
    uint64_t v123 = sub_25D6C05EC(v108, v109, v124);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    sub_25D6C06EC((uint64_t)v125);
    sub_25D6C06EC((uint64_t)v125);
    _os_log_impl(&dword_25D698000, v101, v102, "Updated asset has newer minimum version %s > %s", (uint8_t *)v103, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();

LABEL_35:
    uint64_t v110 = OUTLINED_FUNCTION_11_5();
    uint64_t v25 = (char *)v122;
    ((void (*)(uint64_t, uint64_t))v117)(v110, v122);
    goto LABEL_13;
  }
  uint64_t v75 = v115;
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_14_3();
  v76();
  sub_25D6C06C0((uint64_t)v125);
  sub_25D6C06C0((uint64_t)v129);
  uint64_t v77 = OUTLINED_FUNCTION_13_3();
  os_log_type_t v78 = sub_25D6C3040();
  int v79 = v78;
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v80 = OUTLINED_FUNCTION_8_5();
    LODWORD(v117) = v79;
    uint64_t v81 = v80;
    uint64_t v119 = swift_slowAlloc();
    OUTLINED_FUNCTION_16_3(v119);
    *(_DWORD *)uint64_t v81 = 136315650;
    sub_25D6B8E24();
    os_log_t v114 = v77;
    uint64_t v82 = sub_25D6C3220();
    uint64_t v111 = v73;
    uint64_t v84 = sub_25D6C05EC(v82, v83, v124);
    OUTLINED_FUNCTION_4_8(v84);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v63)(v75, v122);
    *(_WORD *)(v81 + 12) = 2080;
    uint64_t v25 = (char *)(v81 + 14);
    uint64_t v85 = sub_25D6A6834();
    uint64_t v87 = sub_25D6C05EC(v85, v86, v124);
    OUTLINED_FUNCTION_15_2(v87);
    OUTLINED_FUNCTION_18_1();
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    sub_25D6C06EC((uint64_t)v129);
    sub_25D6C06EC((uint64_t)v129);
    *(_WORD *)(v81 + 22) = 2080;
    OUTLINED_FUNCTION_9_5();
    uint64_t v88 = sub_25D6A6834();
    uint64_t v90 = sub_25D6C05EC(v88, v89, v124);
    OUTLINED_FUNCTION_15_2(v90);
    sub_25D6C30B0();
    swift_bridgeObjectRelease();
    sub_25D6C06EC((uint64_t)v125);
    sub_25D6C06EC((uint64_t)v125);
    os_log_t v91 = v114;
    _os_log_impl(&dword_25D698000, v114, (os_log_type_t)v117, "Returning %s (%s > %s)", (uint8_t *)v81, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    OUTLINED_FUNCTION_6_6();
    v63();
    sub_25D6C06EC((uint64_t)v129);
    sub_25D6C06EC((uint64_t)v129);
    sub_25D6C06EC((uint64_t)v125);
    sub_25D6C06EC((uint64_t)v125);
  }
  uint64_t v45 = v121;
  v112(v121, v118, v25);
  uint64_t v44 = 0;
  return __swift_storeEnumTagSinglePayload(v45, v44, 1, (uint64_t)v25);
}

uint64_t sub_25D6C03C8@<X0>(uint64_t a1@<X8>)
{
  sub_25D6C2920();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3, v4);
  sub_25D6C28D0();
  uint64_t v5 = sub_25D6C2930();
  if (v1)
  {
    uint64_t v7 = OUTLINED_FUNCTION_3_6();
    return v8(v7);
  }
  else
  {
    uint64_t v10 = v5;
    unint64_t v11 = v6;
    sub_25D6C28A0();
    swift_allocObject();
    sub_25D6C2890();
    sub_25D6C0E58();
    sub_25D6C2880();
    uint64_t v12 = OUTLINED_FUNCTION_3_6();
    v13(v12);
    swift_release();
    uint64_t result = sub_25D6BD438(v10, v11);
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v15;
    *(_OWORD *)(a1 + 16) = v16;
    *(void *)(a1 + 32) = v17;
    *(unsigned char *)(a1 + 40) = v18;
    *(_OWORD *)(a1 + 48) = v19;
    *(void *)(a1 + 64) = v20;
  }
  return result;
}

uint64_t sub_25D6C056C()
{
  swift_unknownObjectRelease();
  sub_25D6C0EA4(*(id *)(v0 + 24));
  return v0;
}

uint64_t sub_25D6C0594()
{
  sub_25D6C056C();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DialogEngineAssetClient()
{
  return self;
}

uint64_t sub_25D6C05EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25D6C07DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25D6B4780((uint64_t)v12, *a3);
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
      sub_25D6B4780((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25D6C06C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_25D6C06EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25D6C0718(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F690);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D6C0778(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25D6C07DC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25D6C0934((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25D6C30C0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25D6C0A0C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25D6C3140();
    if (!v8)
    {
      uint64_t result = sub_25D6C3170();
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

void *sub_25D6C0934(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25D6C0A0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25D6C0AA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25D6C0C18(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25D6C0C18((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25D6C0AA4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25D6C2F30();
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
  unint64_t v3 = sub_25D6A6BAC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25D6C3120();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25D6C31C0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25D6C3170();
  __break(1u);
  return result;
}

char *sub_25D6C0C18(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F6C8);
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
    sub_25D6C0DC8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D6C0CF0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25D6C0CF0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25D6C31C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25D6C0DC8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25D6C31C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_25D6C0E58()
{
  unint64_t result = qword_26A68FA68;
  if (!qword_26A68FA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA68);
  }
  return result;
}

void sub_25D6C0EA4(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_25D6C0EB4(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_25D6C0EC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25D6C0EFC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25D6C0F34()
{
  sub_25D6BEF84(*(void *)(v0 + 16));
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

uint64_t initializeWithCopy for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogAssetDelivery(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for DialogAssetDelivery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogAssetDelivery()
{
  return &type metadata for DialogAssetDelivery;
}

unint64_t sub_25D6C111C()
{
  unint64_t result = qword_26A68FA78;
  if (!qword_26A68FA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA78);
  }
  return result;
}

unint64_t sub_25D6C1168()
{
  unint64_t result = qword_26A68FA80;
  if (!qword_26A68FA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA80);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DialogAssetDelivery.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D6C1280);
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

ValueMetadata *type metadata accessor for DialogAssetDelivery.CodingKeys()
{
  return &type metadata for DialogAssetDelivery.CodingKeys;
}

unint64_t sub_25D6C12BC()
{
  unint64_t result = qword_26A68FA88;
  if (!qword_26A68FA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA88);
  }
  return result;
}

unint64_t sub_25D6C130C()
{
  unint64_t result = qword_26A68FA90;
  if (!qword_26A68FA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA90);
  }
  return result;
}

unint64_t sub_25D6C135C()
{
  unint64_t result = qword_26A68FA98;
  if (!qword_26A68FA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FA98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_8(uint64_t result)
{
  *(void *)(v1 - 320) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1)
{
  return MEMORY[0x270F9F318](a1, v3 - 65, v1, a1, v2);
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return *(void *)(v0 - 360);
}

uint64_t OUTLINED_FUNCTION_12_3(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_25D6C2DC0();
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  *(void *)(v1 - 320) = a1;
  return v1 - 320;
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t result)
{
  *(void *)(v1 - 312) = result;
  return result;
}

void OUTLINED_FUNCTION_17_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_19_1(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t sub_25D6C1508(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_25D6B8330(0, v1, 0);
    uint64_t v2 = v20;
    uint64_t v4 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = v4[1];
      uint64_t v15 = *v4;
      uint64_t v16 = *(v4 - 2);
      uint64_t v7 = v4[3];
      uint64_t v8 = v4[5];
      uint64_t v13 = v4[4];
      uint64_t v14 = v4[2];
      unint64_t v9 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v2 + 24);
      uint64_t v20 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_25D6B8330((char *)(v10 > 1), v9 + 1, 1);
        uint64_t v2 = v20;
      }
      v4 += 8;
      char v18 = &type metadata for UserDefaultsDialogHistoryEntry;
      long long v19 = &off_270A64CF8;
      size_t v11 = (void *)swift_allocObject();
      *(void *)&long long v17 = v11;
      v11[2] = v16;
      v11[3] = v5;
      v11[4] = v15;
      v11[5] = v6;
      v11[6] = v14;
      v11[7] = v7;
      v11[8] = v13;
      v11[9] = v8;
      *(void *)(v2 + 16) = v9 + 1;
      sub_25D69F75C(&v17, v2 + 40 * v9 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25D6C1668(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_25D6B8380(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = a1 + 32;
    do
    {
      sub_25D6B5824(v4, (uint64_t)v11);
      uint64_t v12 = v2;
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_25D6B8380((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v12;
      }
      unint64_t v9 = &unk_270A650B8;
      unint64_t v10 = &off_270A651E0;
      *(void *)&long long v8 = swift_allocObject();
      sub_25D6B5824((uint64_t)v11, v8 + 16);
      *(void *)(v2 + 16) = v6 + 1;
      sub_25D69F75C(&v8, v2 + 40 * v6 + 32);
      sub_25D6B5880((uint64_t)v11);
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25D6C1790(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25D6B841C(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v14;
    do
    {
      sub_25D6C2120(v4, (uint64_t)v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68FAA8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A68F930);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25D6B841C(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v14;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_25D6B841C((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v14;
      }
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = (_OWORD *)(v2 + 48 * v6);
      long long v8 = v12;
      long long v9 = v13[0];
      *(_OWORD *)((char *)v7 + 60) = *(_OWORD *)((char *)v13 + 12);
      uint64_t v7[2] = v8;
      v7[3] = v9;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

BOOL static NLGDialogScorerType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NLGDialogScorerType.hash(into:)()
{
  return sub_25D6C32D0();
}

uint64_t NLGDialogScorerType.hashValue.getter()
{
  return sub_25D6C32E0();
}

uint64_t static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  return static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:using:overwriteSimilarityScore:)(a1, a2, a3, (uint64_t)sub_25D6C1988, 0, 0, a4);
}

uint64_t sub_25D6C1988(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v7, v1, v2);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:using:overwriteSimilarityScore:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, int a6@<W7>, uint64_t *a7@<X8>)
{
  int v34 = a6;
  uint64_t v33 = a4;
  uint64_t v12 = sub_25D6C2A60();
  OUTLINED_FUNCTION_0_10();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15, v16);
  char v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25D6C29B0();
  type metadata accessor for MorphunTokenizer();
  uint64_t v19 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v19 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration16MorphunTokenizer_locale, v18, v12);
  type metadata accessor for CosineSimilarity();
  uint64_t v20 = swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v21 = sub_25D6C1D00(a1, a2, a3, v19, v20);
  uint64_t v22 = type metadata accessor for TFIDFScorer();
  v35[3] = v22;
  v35[4] = &off_270A64290;
  v35[0] = v21;
  uint64_t v23 = type metadata accessor for DialogScorer();
  uint64_t v24 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v22);
  OUTLINED_FUNCTION_0_10();
  MEMORY[0x270FA5388](v25, v26);
  id v28 = (uint64_t *)((char *)&v32 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  uint64_t v30 = *v28;
  *(void *)(v24 + 40) = v22;
  *(void *)(v24 + 48) = &off_270A64290;
  *(void *)(v24 + 16) = v30;
  *(void *)(v24 + 56) = v33;
  *(void *)(v24 + 64) = a5;
  *(unsigned char *)(v24 + 72) = v34;
  swift_retain();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  a7[3] = v23;
  a7[4] = (uint64_t)&off_270A64C48;
  swift_release();
  uint64_t result = swift_release();
  *a7 = v24;
  return result;
}

uint64_t static NLGDialogScorers.createWeightedScorer(adding:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for WeightedDialogScorer();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_25D6C1790(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = v5;
  a1[3] = v2;
  a1[4] = (uint64_t)&off_270A64C38;
  *a1 = v3;
  return result;
}

void *sub_25D6C1D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for MorphunTokenizer();
  v27[3] = v10;
  void v27[4] = &off_270A64DA8;
  v27[0] = a4;
  uint64_t v11 = type metadata accessor for CosineSimilarity();
  uint64_t v25 = v11;
  uint64_t v26 = &off_270A64280;
  v24[0] = a5;
  type metadata accessor for TFIDFScorer();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v10);
  MEMORY[0x270FA5388](v13, v13);
  uint64_t v15 = (void *)((char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x270FA5388](v17, v17);
  uint64_t v19 = (void *)((char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = *v15;
  uint64_t v22 = *v19;
  v12[8] = v10;
  v12[9] = &off_270A64DA8;
  v12[10] = v22;
  v12[13] = v11;
  v12[14] = &off_270A64280;
  v12[2] = a1;
  void v12[3] = a2;
  v12[4] = a3;
  v12[5] = v21;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v12;
}

unint64_t sub_25D6C1F10()
{
  unint64_t result = qword_26A68FAA0;
  if (!qword_26A68FAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A68FAA0);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogScorer.score(dialogs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NLGDialogScorerTypeSetting.scorerType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unsigned char *storeEnumTagSinglePayload for NLGDialogScorerType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D6C2050);
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

ValueMetadata *type metadata accessor for NLGDialogScorerType()
{
  return &type metadata for NLGDialogScorerType;
}

ValueMetadata *type metadata accessor for NLGDialogScorers()
{
  return &type metadata for NLGDialogScorers;
}

uint64_t sub_25D6C2098()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_25D6C20E8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 60, 7);
}

uint64_t sub_25D6C2120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A68FAA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D6C21A0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_25D6C2204(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_25D6C224C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_25D6C2290(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 44))
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

uint64_t sub_25D6C22D0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 44) = 1;
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
    *(unsigned char *)(result + 44) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for DefaultScoredDialog()
{
}

uint64_t sub_25D6C2328(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25D6C238C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  uint64_t v9 = *(void *)(a2 + 64);
  if (v9)
  {
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v9;
    uint64_t v10 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v10;
    uint64_t v11 = *(void *)(a2 + 88);
    uint64_t v12 = *(void *)(a2 + 96);
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v13;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  }
  return a1;
}

void *sub_25D6C2470(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  uint64_t v4 = a1 + 7;
  uint64_t v5 = a2 + 7;
  uint64_t v6 = a2[8];
  if (a1[8])
  {
    if (v6)
    {
      a1[7] = a2[7];
      a1[8] = a2[8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[9] = a2[9];
      a1[10] = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[11] = a2[11];
      a1[12] = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25D6C25C4((uint64_t)(a1 + 7));
      long long v8 = *(_OWORD *)(a2 + 9);
      long long v7 = *(_OWORD *)(a2 + 11);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 9) = v8;
      *(_OWORD *)(a1 + 11) = v7;
    }
  }
  else if (v6)
  {
    a1[7] = a2[7];
    a1[8] = a2[8];
    a1[9] = a2[9];
    a1[10] = a2[10];
    a1[11] = a2[11];
    a1[12] = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *v5;
    long long v10 = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 11) = v10;
    *uint64_t v4 = v9;
  }
  return a1;
}

uint64_t sub_25D6C25C4(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t sub_25D6C2620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 64)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 64);
  if (!v6)
  {
    sub_25D6C25C4(a1 + 56);
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    return a1;
  }
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25D6C26D8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t sub_25D6C2718(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for DefaultDialog()
{
}

void type metadata accessor for DefaultDialogContent()
{
}

uint64_t sub_25D6C2788()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25D6C27B8@<X0>(uint64_t a1@<X8>)
{
  return sub_25D6A2350(v1 + 16, a1);
}

uint64_t sub_25D6C27D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[7];
  uint64_t v3 = v1[8];
  uint64_t v4 = v1[9];
  uint64_t v5 = v1[10];
  uint64_t v6 = v1[11];
  uint64_t v7 = v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_25D6B4730(v2, v3);
}

uint64_t sub_25D6C27F4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25D6C2824()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25D6C2854@<X0>(uint64_t a1@<X8>)
{
  return sub_25D6A2350(v1, a1);
}

float sub_25D6C2874()
{
  return *(float *)(v0 + 40);
}

uint64_t sub_25D6C2880()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25D6C2890()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25D6C28A0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25D6C28B0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25D6C28C0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25D6C28D0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25D6C28E0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25D6C28F0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25D6C2900()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25D6C2910()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25D6C2920()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25D6C2930()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25D6C2940()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25D6C2950()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25D6C2960()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25D6C2970()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25D6C2980()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25D6C2990()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25D6C29A0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25D6C29B0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25D6C29C0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25D6C29D0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_25D6C29E0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_25D6C29F0()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_25D6C2A00()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_25D6C2A10()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_25D6C2A20()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25D6C2A30()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_25D6C2A40()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25D6C2A50()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25D6C2A60()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25D6C2A70()
{
  return MEMORY[0x270F4C4B0]();
}

uint64_t sub_25D6C2A80()
{
  return MEMORY[0x270F4C4B8]();
}

uint64_t sub_25D6C2A90()
{
  return MEMORY[0x270F4C4C0]();
}

uint64_t sub_25D6C2AA0()
{
  return MEMORY[0x270F4C4C8]();
}

uint64_t sub_25D6C2AB0()
{
  return MEMORY[0x270F4C4D0]();
}

uint64_t sub_25D6C2AC0()
{
  return MEMORY[0x270F4C4D8]();
}

uint64_t sub_25D6C2AD0()
{
  return MEMORY[0x270F4C4E0]();
}

uint64_t sub_25D6C2AE0()
{
  return MEMORY[0x270F4C4F0]();
}

uint64_t sub_25D6C2AF0()
{
  return MEMORY[0x270F4C508]();
}

uint64_t sub_25D6C2B00()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_25D6C2B10()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_25D6C2B20()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_25D6C2B30()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25D6C2B40()
{
  return MEMORY[0x270F72A80]();
}

uint64_t sub_25D6C2B50()
{
  return MEMORY[0x270F652D8]();
}

uint64_t sub_25D6C2B60()
{
  return MEMORY[0x270F65310]();
}

uint64_t sub_25D6C2B70()
{
  return MEMORY[0x270F65368]();
}

uint64_t sub_25D6C2B80()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_25D6C2B90()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_25D6C2BA0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_25D6C2BB0()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_25D6C2BC0()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_25D6C2BD0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_25D6C2BE0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_25D6C2BF0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_25D6C2C20()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_25D6C2C30()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_25D6C2C40()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_25D6C2C50()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_25D6C2C60()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t sub_25D6C2C70()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_25D6C2C80()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_25D6C2C90()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_25D6C2CA0()
{
  return MEMORY[0x270F44C88]();
}

uint64_t sub_25D6C2CB0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_25D6C2CC0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_25D6C2CE0()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_25D6C2CF0()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_25D6C2D00()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_25D6C2D10()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_25D6C2D20()
{
  return MEMORY[0x270F44DB8]();
}

uint64_t sub_25D6C2D30()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_25D6C2D40()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_25D6C2D50()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_25D6C2D60()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_25D6C2D70()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_25D6C2D80()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_25D6C2D90()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25D6C2DA0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25D6C2DB0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25D6C2DC0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25D6C2DD0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25D6C2DE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25D6C2DF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25D6C2E00()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25D6C2E10()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25D6C2E20()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25D6C2E30()
{
  return MEMORY[0x270F9D300]();
}

uint64_t sub_25D6C2E40()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25D6C2E50()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25D6C2E60()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25D6C2E70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25D6C2E80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25D6C2E90()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25D6C2EA0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25D6C2EB0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25D6C2EC0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25D6C2ED0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25D6C2EE0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25D6C2EF0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25D6C2F00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25D6C2F10()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25D6C2F20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25D6C2F30()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25D6C2F40()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25D6C2F50()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25D6C2F60()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25D6C2F70()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25D6C2F80()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25D6C2F90()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25D6C2FA0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25D6C2FB0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25D6C2FC0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25D6C2FD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25D6C2FE0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25D6C2FF0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25D6C3000()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_25D6C3010()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25D6C3020()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25D6C3030()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25D6C3040()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25D6C3050()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25D6C3060()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25D6C3070()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25D6C3080()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25D6C3090()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25D6C30A0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25D6C30B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25D6C30C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25D6C30D0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25D6C30E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25D6C30F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25D6C3100()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25D6C3110()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25D6C3120()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25D6C3130()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25D6C3140()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25D6C3150()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25D6C3160()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25D6C3170()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25D6C3180()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25D6C3190()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25D6C31A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25D6C31B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25D6C31C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25D6C31D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25D6C31E0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25D6C3200()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_25D6C3210()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25D6C3220()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25D6C3230()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25D6C3240()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_25D6C3250()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25D6C3260()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25D6C3270()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25D6C3280()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25D6C3290()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25D6C32A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25D6C32B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25D6C32C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25D6C32D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25D6C32E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25D6C32F0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25D6C3300()
{
  return MEMORY[0x270F9FD70]();
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

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}