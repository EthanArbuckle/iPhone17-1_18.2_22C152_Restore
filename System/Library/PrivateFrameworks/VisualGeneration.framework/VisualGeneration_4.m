void *sub_260FC4A90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  v1 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36, v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB58);
  v31 = v0;
  v5 = *v0;
  v6 = sub_260FE4E60();
  v7 = *(void *)(v5 + 16);
  v37 = v6;
  if (!v7)
  {
    result = (void *)swift_release();
    v29 = v37;
    v28 = v31;
LABEL_25:
    *v28 = v29;
    return result;
  }
  v8 = v6;
  result = (void *)(v6 + 64);
  v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    v8 = v37;
  }
  v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v5 + 16);
  v12 = 1 << *(unsigned char *)(v5 + 32);
  v13 = -1;
  if (v12 < 64) {
    v13 = ~(-1 << v12);
  }
  v14 = v13 & *(void *)(v5 + 64);
  v32 = v5 + 64;
  v33 = (unint64_t)(v12 + 63) >> 6;
  v34 = v1 + 32;
  v35 = v1 + 16;
  v15 = v36;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v33) {
      goto LABEL_23;
    }
    v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_23;
      }
      v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_9:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v4, *(void *)(v5 + 56) + v22, v15);
    v23 = v37;
    v24 = (void *)(*(void *)(v37 + 48) + v18);
    *v24 = v20;
    v24[1] = v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v4, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_23:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v37;
    goto LABEL_25;
  }
  v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_23;
    }
    v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_260FC4D58()
{
  uint64_t v1 = sub_260FE2F90();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB30);
  v23 = v0;
  uint64_t v6 = *v0;
  uint64_t v7 = sub_260FE4E60();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    uint64_t *v23 = v8;
    return result;
  }
  result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    char v17 = *(unsigned char *)(*(void *)(v6 + 48) + v16);
    unint64_t v18 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, *(void *)(v6 + 56) + v18, v1);
    *(unsigned char *)(*(void *)(v8 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v8 + 56) + v18, v5, v1);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_260FC4FE4()
{
  return sub_260FC5564(&qword_26A8EB310);
}

void *sub_260FC4FF0()
{
  return sub_260FC5564(&qword_26A8EB308);
}

void *sub_260FC4FFC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAAA0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260FE4E60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v22 = __clz(__rbit64(v20));
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = v22 + (v9 << 6);
LABEL_12:
    unint64_t v16 = (char *)(*(void *)(v2 + 56) + 2 * v15);
    char v17 = *v16;
    LOBYTE(v16) = v16[1];
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    unint64_t v18 = (unsigned char *)(*(void *)(v4 + 56) + 2 * v15);
    *unint64_t v18 = v17;
    v18[1] = (_BYTE)v16;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_260FC519C()
{
  return sub_260FC534C(&qword_26A8EAAF0);
}

id sub_260FC51A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAAF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260FE4E60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_260FC534C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_260FE4E60();
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
    int64_t v38 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v38 >= v14) {
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v7 + 8 * v38);
    ++v10;
    if (!v39)
    {
      int64_t v10 = v38 + 1;
      if (v38 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v39 = *(void *)(v7 + 8 * v10);
      if (!v39) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v39 - 1) & v39;
    unint64_t v16 = __clz(__rbit64(v39)) + (v10 << 6);
LABEL_12:
    char v17 = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    unint64_t v18 = (long long *)(*(void *)(v3 + 56) + 192 * v16);
    long long v19 = v18[7];
    long long v21 = v18[4];
    long long v20 = v18[5];
    long long v47 = v18[6];
    long long v48 = v19;
    long long v45 = v21;
    long long v46 = v20;
    long long v22 = v18[11];
    long long v24 = v18[8];
    long long v23 = v18[9];
    long long v51 = v18[10];
    long long v52 = v22;
    long long v49 = v24;
    long long v50 = v23;
    long long v26 = *v18;
    long long v25 = v18[1];
    long long v27 = v18[3];
    long long v43 = v18[2];
    long long v44 = v27;
    long long v41 = v26;
    long long v42 = v25;
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = v17;
    v28 = (_OWORD *)(*(void *)(v5 + 56) + 192 * v16);
    long long v29 = v41;
    long long v30 = v42;
    long long v31 = v44;
    v28[2] = v43;
    v28[3] = v31;
    _OWORD *v28 = v29;
    v28[1] = v30;
    long long v32 = v45;
    long long v33 = v46;
    long long v34 = v48;
    v28[6] = v47;
    v28[7] = v34;
    v28[4] = v32;
    v28[5] = v33;
    long long v35 = v49;
    long long v36 = v50;
    long long v37 = v52;
    v28[10] = v51;
    v28[11] = v37;
    v28[8] = v35;
    v28[9] = v36;
    id result = sub_260F32B24((uint64_t *)&v41);
  }
  int64_t v40 = v38 + 2;
  if (v40 >= v14) {
    goto LABEL_26;
  }
  unint64_t v39 = *(void *)(v7 + 8 * v40);
  if (v39)
  {
    int64_t v10 = v40;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v7 + 8 * v10);
    ++v40;
    if (v39) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_260FC5558()
{
  return sub_260FC5564(&qword_26A8EAB00);
}

void *sub_260FC5564(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_260FE4E60();
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
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    char v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    long long v20 = (void *)(*(void *)(v5 + 56) + 16 * v16);
    *long long v20 = v19;
    v20[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_260FC570C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_260FE4B80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_260FE52F0();
        swift_bridgeObjectRetain();
        sub_260FE41D0();
        uint64_t v9 = sub_260FE5340();
        id result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0) - 8) + 72);
        int64_t v16 = v15 * v3;
        id result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          id result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          id result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    long long v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    long long v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *long long v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_260FC592C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_260FE4B80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_260FE52F0();
        sub_260FE41D0();
        swift_bridgeObjectRelease();
        id result = sub_260FE5340();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (unsigned char *)(v10 + v3);
        uint64_t v12 = (unsigned char *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          *uint64_t v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(sub_260FE2F90() - 8) + 72);
        int64_t v15 = v14 * v3;
        id result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          id result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          id result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
    JUMPOUT(0x260FC5C70);
  }
  *(void *)(a2 + 16) = v24;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

unint64_t sub_260FC5C98(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_260FE4B80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_260FE52F0();
        swift_bridgeObjectRetain();
        sub_260FE41D0();
        uint64_t v9 = sub_260FE5340();
        id result = swift_bridgeObjectRelease();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          int64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *int64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
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

unint64_t sub_260FC5E70(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_260FE4B80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_260FE52F0();
        sub_260FE41D0();
        swift_bridgeObjectRelease();
        id result = sub_260FE5340();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          uint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          id result = v13 + 192 * v3;
          uint64_t v14 = (const void *)(v13 + 192 * v6);
          if (v3 != v6 || (int64_t v3 = v6, result >= (unint64_t)v14 + 192))
          {
            id result = (unint64_t)memmove((void *)result, v14, 0xC0uLL);
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v15 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v16 = *v15;
    uint64_t v17 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v15 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v17 = *v15;
    uint64_t v16 = (-1 << result) - 1;
  }
  *int64_t v15 = v17 & v16;
  uint64_t v18 = *(void *)(a2 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
    JUMPOUT(0x260FC6160);
  }
  *(void *)(a2 + 16) = v20;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

unint64_t sub_260FC6184(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_260FE4B80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_260FE52F0();
        sub_260FE41D0();
        swift_bridgeObjectRelease();
        id result = sub_260FE5340();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          uint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          int64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_260FC63A0(unsigned __int8 a1, char a2, float a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_260DBB574(a1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_260FC43EC();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(float *)(v16[7] + 4 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a1;
    *(float *)(v16[7] + 4 * v10) = a3;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_260FC0544(result, a2 & 1);
  uint64_t result = sub_260DBB574(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_260FE5280();
  __break(1u);
  return result;
}

uint64_t sub_260FC64C8(unsigned __int8 a1, char a2, float a3, float a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_260DBB574(a1);
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
  if (v17 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_260FC457C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      BOOL v19 = (float *)(v18[7] + 8 * v12);
      *BOOL v19 = a3;
      v19[1] = a4;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(unsigned char *)(v18[6] + v12) = a1;
    uint64_t v21 = (float *)(v18[7] + 8 * v12);
    *uint64_t v21 = a3;
    v21[1] = a4;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_260FC0954(result, a2 & 1);
  uint64_t result = sub_260DBB574(a1);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_260FE5280();
  __break(1u);
  return result;
}

void sub_260FC65FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

uint64_t sub_260FC6608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_260F80D6C(a2, a3, a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= result && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= result && (a6 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_260FC4718();
LABEL_7:
    uint64_t v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      *(void *)(v22[7] + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_260FC0D70(result, a6 & 1);
  uint64_t result = sub_260F80D6C(a2, a3, a4, a5);
  if ((v20 & 1) != (v23 & 1))
  {
LABEL_17:
    uint64_t result = sub_260FE5280();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
  uint64_t v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v24 = (uint64_t *)(v22[6] + 32 * v16);
  *uint64_t v24 = a2;
  v24[1] = a3;
  v24[2] = a4;
  v24[3] = a5;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v25 = v22[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v27;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_260FC679C(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_260DBB068(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_260FC4D58();
      goto LABEL_7;
    }
    sub_260FC17B8(v13, a3 & 1);
    unint64_t v24 = sub_260DBB068(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_260FE5280();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_260FE2F90();
    uint64_t v19 = *(void *)(v18 - 8);
    char v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:
  return sub_260FC7184(v10, a2, a1, v16);
}

unint64_t sub_260FC6904()
{
  unint64_t result = qword_26A8EB2D8;
  if (!qword_26A8EB2D8)
  {
    sub_260FE2F90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB2D8);
  }
  return result;
}

void sub_260FC695C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_260FC6968(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_260DBACB4(a2, a3);
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
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_260FC48E4(a5);
LABEL_7:
    char v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_260FC10C0(v17, a4 & 1, a5);
  unint64_t v22 = sub_260DBACB4(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_260FE5280();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  char v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;
  swift_bridgeObjectRetain();
}

uint64_t sub_260FC6AF0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_260FC6CDC(a1, a2, a3, sub_260DBB4C8, &qword_26A8EAAE8, (void (*)(void))sub_260FC2818);
}

uint64_t sub_260FC6B2C(long long *a1, uint64_t a2, char a3)
{
  return sub_260FC6E7C(a1, a2, a3, sub_260DBB4C8, &qword_26A8EAAF0, (void (*)(void))sub_260FC2C44);
}

void sub_260FC6B68(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_260DBB4C8(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_260FC51A8();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_260FC31F4(v13, a3 & 1);
  uint64_t v18 = sub_260DBB4C8(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_260FE5280();
  __break(1u);
}

uint64_t sub_260FC6CA0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_260FC6CDC(a1, a2, a3, (uint64_t (*)(uint64_t))sub_260DBB068, &qword_26A8EAB10, (void (*)(void))sub_260FC3630);
}

uint64_t sub_260FC6CDC(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t *a5, void (*a6)(void))
{
  unint64_t v10 = v6;
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
    uint64_t result = (uint64_t)sub_260DC2100(a5);
LABEL_7:
    uint64_t v22 = (void *)*v10;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(unsigned char *)(v22[6] + v16) = a2;
    *(void *)(v22[7] + 8 * v16) = a1;
    uint64_t v25 = v22[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (!v26)
    {
      v22[2] = v27;
      return result;
    }
    goto LABEL_14;
  }
  a6();
  uint64_t result = a4(a2);
  if ((v20 & 1) == (v24 & 1))
  {
    unint64_t v16 = result;
    uint64_t v22 = (void *)*v10;
    if (v20) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_260FE5280();
  __break(1u);
  return result;
}

uint64_t sub_260FC6E40(long long *a1, uint64_t a2, char a3)
{
  return sub_260FC6E7C(a1, a2, a3, (uint64_t (*)(uint64_t))sub_260DBB068, &qword_26A8EAB08, (void (*)(void))sub_260FC3AA4);
}

uint64_t sub_260FC6E7C(long long *a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t *a5, void (*a6)(void))
{
  unint64_t v10 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = a4(a2);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 < result || (a3 & 1) == 0)
  {
    if (v21 < result || (a3 & 1) != 0)
    {
      a6();
      uint64_t result = a4(a2);
      if ((v20 & 1) != (v24 & 1))
      {
LABEL_17:
        uint64_t result = sub_260FE5280();
        __break(1u);
        return result;
      }
      unint64_t v16 = result;
      uint64_t v22 = (void *)*v10;
      if (v20) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_260FC534C(a5);
  }
  uint64_t v22 = (void *)*v10;
  if ((v20 & 1) == 0)
  {
LABEL_13:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(unsigned char *)(v22[6] + v16) = a2;
    uint64_t v25 = (_OWORD *)(v22[7] + 192 * v16);
    long long v26 = *a1;
    long long v27 = a1[1];
    long long v28 = a1[3];
    v25[2] = a1[2];
    v25[3] = v28;
    *uint64_t v25 = v26;
    v25[1] = v27;
    long long v29 = a1[4];
    long long v30 = a1[5];
    long long v31 = a1[7];
    v25[6] = a1[6];
    v25[7] = v31;
    v25[4] = v29;
    v25[5] = v30;
    long long v32 = a1[8];
    long long v33 = a1[9];
    long long v34 = a1[11];
    v25[10] = a1[10];
    v25[11] = v34;
    v25[8] = v32;
    v25[9] = v33;
    uint64_t v35 = v22[2];
    BOOL v36 = __OFADD__(v35, 1);
    uint64_t v37 = v35 + 1;
    if (!v36)
    {
      v22[2] = v37;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v23 = v22[7] + 192 * v16;
  return sub_260FC7D04((uint64_t)a1, v23);
}

uint64_t sub_260FC703C(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_260DBB3F8(a3);
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
    uint64_t result = (uint64_t)sub_260FC5564(&qword_26A8EAB00);
LABEL_7:
    BOOL v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      char v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      *char v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(unsigned char *)(v18[6] + v12) = a3;
    uint64_t v21 = (void *)(v18[7] + 16 * v12);
    *uint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_260FC4088(result, a4 & 1);
  uint64_t result = sub_260DBB3F8(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    BOOL v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_260FE5280();
  __break(1u);
  return result;
}

uint64_t sub_260FC7184(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_260FE2F90();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
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

uint64_t _s13DiffusionBase05AppleA8PipelineV14ComponentModelO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_260FE4EC0();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t sub_260FC727C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleDiffusionUnet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_260FC72E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_260FC7340(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_260FC73AC()
{
  unint64_t result = qword_26A8EB2E0;
  if (!qword_26A8EB2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB2E0);
  }
  return result;
}

unint64_t sub_260FC7404()
{
  unint64_t result = qword_26A8EB2E8;
  if (!qword_26A8EB2E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8EB2F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB2E8);
  }
  return result;
}

unsigned char *_s14ComponentModelOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    void *result = a2 + 8;
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
        JUMPOUT(0x260FC752CLL);
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
          void *result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleDiffusionPipeline.ComponentModel()
{
  return &type metadata for AppleDiffusionPipeline.ComponentModel;
}

uint64_t *_s12ResourceURLsVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_260FE2F90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    char v15 = (uint64_t *)((char *)v4 + v13);
    char v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *char v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t _s12ResourceURLsVwxx(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_260FE2F90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s12ResourceURLsVwcp(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260FE2F90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  char v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s12ResourceURLsVwca(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_260FE2F90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s12ResourceURLsVwtk(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_260FE2F90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *_s12ResourceURLsVwta(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260FE2F90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12ResourceURLsVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260FC7AB8);
}

uint64_t sub_260FC7AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_260FE2F90();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t _s12ResourceURLsVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260FC7B90);
}

uint64_t sub_260FC7B90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_260FE2F90();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_260FC7C50()
{
  uint64_t result = sub_260FE2F90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_260FC7D04(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DPMSolverMultistepScheduler.__allocating_init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:timeStepSpacing:predictionType:)(int64_t a1, int64_t a2, char a3, char a4, char a5, float a6, float a7)
{
  char v13 = a3 & 1;
  uint64_t v14 = swift_allocObject();
  DPMSolverMultistepScheduler.init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:timeStepSpacing:predictionType:)(a1, a2, v13, a4, a5, a6, a7);
  return v14;
}

BOOL static SchedulerPredictionType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t SchedulerPredictionType.hash(into:)()
{
  return sub_260FE5300();
}

uint64_t _s13DiffusionBase24SchedulerTimeStepSpacingO9hashValueSivg_0()
{
  return sub_260FE5340();
}

uint64_t DPMSolverMultistepScheduler.trainStepCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t DPMSolverMultistepScheduler.inferenceStepCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t DPMSolverMultistepScheduler.betas.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.alphas.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.alphasCumProd.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.timeSteps.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.alpha_t.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.sigma_t.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.lambda_t.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.solverOrder.getter()
{
  return 2;
}

uint64_t DPMSolverMultistepScheduler.useLowerOrderFinal.getter()
{
  return 1;
}

uint64_t DPMSolverMultistepScheduler.modelOutputs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DPMSolverMultistepScheduler.init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:timeStepSpacing:predictionType:)(int64_t a1, int64_t a2, char a3, char a4, char a5, float a6, float a7)
{
  uint64_t v9 = v7;
  LOBYTE(v10) = a4;
  int64_t v11 = a1;
  *(_OWORD *)(v7 + 88) = xmmword_260FE9510;
  *(unsigned char *)(v7 + 104) = 0;
  *(unsigned char *)(v7 + 106) = 1;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(v9 + 112) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v9 + 105) = a5;
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a1;
  if (a3)
  {
    float v14 = fabsf(sqrtf(a6));
    if (a6 == -INFINITY) {
      float v15 = INFINITY;
    }
    else {
      float v15 = v14;
    }
    float v16 = fabsf(sqrtf(a7));
    if (a7 == -INFINITY) {
      float v17 = INFINITY;
    }
    else {
      float v17 = v16;
    }
    int64_t v18 = sub_260F93E98(a2, v15, v17);
    int64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      uint64_t v125 = v12;
      sub_260F63828(0, v19, 0);
      uint64_t v20 = 0;
      int64_t v13 = v12;
      unint64_t v21 = *(void *)(v12 + 16);
      do
      {
        float v8 = *(float *)(v18 + 4 * v20 + 32);
        uint64_t v125 = v13;
        unint64_t v22 = *(void *)(v13 + 24);
        if (v21 >= v22 >> 1)
        {
          sub_260F63828(v22 > 1, v21 + 1, 1);
          int64_t v13 = v125;
        }
        ++v20;
        *(void *)(v13 + 16) = v21 + 1;
        *(float *)(v13 + 4 * v21++ + 32) = v8 * v8;
      }
      while (v19 != v20);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      int64_t v13 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    int64_t v13 = sub_260F93E98(a2, a6, a7);
  }
  *(void *)(v9 + 32) = v13;
  int64_t v23 = *(void *)(v13 + 16);
  unint64_t v24 = MEMORY[0x263F8EE78];
  if (v23)
  {
    uint64_t v125 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_260F63828(0, v23, 0);
    uint64_t v25 = 0;
    long long v26 = (char *)v125;
    unint64_t v27 = *(void *)(v125 + 16);
    float v8 = 1.0;
    do
    {
      float v28 = *(float *)(v13 + 4 * v25 + 32);
      uint64_t v125 = (uint64_t)v26;
      unint64_t v29 = *((void *)v26 + 3);
      if (v27 >= v29 >> 1)
      {
        sub_260F63828(v29 > 1, v27 + 1, 1);
        long long v26 = (char *)v125;
      }
      ++v25;
      *((void *)v26 + 2) = v27 + 1;
      *(float *)&v26[4 * v27++ + 32] = 1.0 - v28;
    }
    while (v23 != v25);
    swift_bridgeObjectRelease();
    unint64_t v24 = MEMORY[0x263F8EE78];
  }
  else
  {
    long long v26 = (char *)MEMORY[0x263F8EE78];
  }
  *(void *)(v9 + 40) = v26;
  uint64_t v30 = *((void *)v26 + 2);
  long long v31 = (uint64_t *)(v30 - 1);
  if (v30 != 1)
  {
    if (!v30) {
      goto LABEL_97;
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_98;
    }
    while (1)
    {
      unint64_t v32 = 0;
      while (v32 < *((void *)v26 + 2))
      {
        *(float *)&v26[4 * v32 + 36] = *(float *)&v26[4 * v32 + 32] * *(float *)&v26[4 * v32 + 36];
        if (v31 == (uint64_t *)++v32) {
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      long long v26 = sub_260F7B4A4((uint64_t)v26);
    }
  }
  swift_bridgeObjectRetain();
LABEL_31:
  *(void *)(v9 + 48) = v26;
  if (!(_BYTE)v10)
  {
    uint64_t v43 = *(void *)(v9 + 16);
    BOOL v42 = __OFSUB__(v43, 1);
    uint64_t v44 = v43 - 1;
    if (!v42)
    {
      if (__OFADD__(v11, 1)) {
        goto LABEL_103;
      }
      float v45 = (float)v44;
      swift_bridgeObjectRetain();
      int64_t v10 = sub_260F93E98(v11 + 1, 0.0, v45);
      uint64_t v46 = *(void *)(v10 + 16);
      uint64_t v47 = v46 != 0;
      int64_t v11 = v46 - v47;
      if (v46 != v47)
      {
        uint64_t v125 = v24;
        sub_260DB4728(0, v11 & ~(v11 >> 63), 0);
        if ((v11 & 0x8000000000000000) == 0)
        {
          long long v31 = (uint64_t *)v125;
          float v8 = 9.2234e18;
          while (v46 > v47)
          {
            float v89 = roundf(*(float *)(v10 + 4 * v46 + 28));
            if ((~LODWORD(v89) & 0x7F800000) == 0) {
              goto LABEL_94;
            }
            if (v89 <= -9.2234e18) {
              goto LABEL_95;
            }
            if (v89 >= 9.2234e18) {
              goto LABEL_96;
            }
            uint64_t v125 = (uint64_t)v31;
            unint64_t v24 = v31[2];
            unint64_t v90 = v31[3];
            int64_t v11 = v24 + 1;
            if (v24 >= v90 >> 1)
            {
              sub_260DB4728(v90 > 1, v24 + 1, 1);
              long long v31 = (uint64_t *)v125;
            }
            --v46;
            v31[2] = v11;
            v31[v24 + 4] = (uint64_t)v89;
            if (v47 == v46)
            {
              uint64_t v48 = swift_bridgeObjectRelease();
              goto LABEL_80;
            }
          }
          goto LABEL_93;
        }
        goto LABEL_107;
      }
      uint64_t v48 = swift_bridgeObjectRelease();
      long long v31 = (uint64_t *)MEMORY[0x263F8EE78];
LABEL_80:
      *(void *)(v9 + 56) = v31;
      uint64_t v125 = *(void *)(v9 + 48);
      uint64_t v91 = *(void *)(v125 + 16);
      MEMORY[0x270FA5388](v48, v49);
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_260F95AB8(v91, (uint64_t (*)(void *, uint64_t *))sub_260FCAFD8);
      swift_bridgeObjectRelease();
      *(void *)(v9 + 64) = v92;
      v93.i32[0] = 1.0;
      uint64_t v125 = sub_260FB6784(*(void *)(*(void *)(v9 + 48) + 16), v93);
      uint64_t v94 = *(void *)(v125 + 16);
      MEMORY[0x270FA5388](v125, v95);
      swift_bridgeObjectRetain();
      uint64_t v96 = sub_260F95AB8(v94, (uint64_t (*)(void *, uint64_t *))sub_260FCAFC0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v125 = v96;
      uint64_t v88 = MEMORY[0x270FA5388](*(void *)(v96 + 16), v97);
LABEL_81:
      uint64_t v98 = sub_260F95AB8(v88, (uint64_t (*)(void *, uint64_t *))sub_260FCAFD8);
      swift_bridgeObjectRelease();
      *(void *)(v9 + 72) = v98;
LABEL_87:
      uint64_t v120 = *(void *)(v9 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_260F92368(v120, v98);
      uint64_t v122 = v121;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v9 + 80) = v122;
      swift_bridgeObjectRelease();
      return v9;
    }
    goto LABEL_100;
  }
  if (v10 == 1)
  {
    if (!__OFSUB__(a2, 1))
    {
      uint64_t v33 = v11 + 1;
      if (!__OFADD__(v11, 1))
      {
        if (v11 != -1)
        {
          if (a2 == 0x8000000000000001 && v11 == -2)
          {
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
            goto LABEL_110;
          }
          if ((v11 & 0x8000000000000000) == 0)
          {
            uint64_t v125 = v24;
            int64_t v10 = v33 & ~(v33 >> 63);
            swift_bridgeObjectRetain();
            long long v31 = &v125;
            sub_260DB4728(0, v10, 0);
            if ((v33 & 0x8000000000000000) == 0)
            {
              uint64_t v34 = 0;
              BOOL v35 = 0;
              uint64_t v36 = -1;
              unint64_t v37 = v125;
              uint64_t v38 = (a2 - 1) / v33;
              while (v11 != v36)
              {
                if (v35) {
                  goto LABEL_109;
                }
                uint64_t v39 = v34 * v38;
                if ((unsigned __int128)(v34 * (__int128)v38) >> 64 != (v34 * v38) >> 63) {
                  goto LABEL_90;
                }
                uint64_t v40 = v39 + 1;
                if (__OFADD__(v39, 1)) {
                  goto LABEL_91;
                }
                uint64_t v125 = v37;
                unint64_t v24 = *(void *)(v37 + 16);
                unint64_t v41 = *(void *)(v37 + 24);
                int64_t v10 = v24 + 1;
                if (v24 >= v41 >> 1)
                {
                  long long v31 = &v125;
                  sub_260DB4728(v41 > 1, v24 + 1, 1);
                  unint64_t v37 = v125;
                }
                *(void *)(v37 + 16) = v10;
                *(void *)(v37 + 32 + 8 * v24) = v40;
                BOOL v35 = v34 == v11;
                if (v34 == v11)
                {
                  uint64_t v34 = 0;
                }
                else
                {
                  BOOL v42 = __OFADD__(v34++, 1);
                  if (v42) {
                    goto LABEL_92;
                  }
                }
                if (v11 == ++v36)
                {
                  unint64_t v79 = sub_260FC8CE8(v37, v37 + 32, 1, (2 * v10) | 1);
                  *(void *)(v9 + 56) = v79;
                  uint64_t v125 = (uint64_t)v26;
                  uint64_t v80 = *((void *)v26 + 2);
                  MEMORY[0x270FA5388](v79, v81);
                  swift_bridgeObjectRetain();
                  uint64_t v82 = sub_260F95AB8(v80, (uint64_t (*)(void *, uint64_t *))sub_260FCAFD8);
                  swift_bridgeObjectRelease();
                  *(void *)(v9 + 64) = v82;
                  v83.i32[0] = 1.0;
                  uint64_t v125 = sub_260FB6784(*(void *)(*(void *)(v9 + 48) + 16), v83);
                  uint64_t v84 = *(void *)(v125 + 16);
                  MEMORY[0x270FA5388](v125, v85);
                  swift_bridgeObjectRetain();
                  uint64_t v86 = sub_260F95AB8(v84, (uint64_t (*)(void *, uint64_t *))sub_260FCAA50);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v125 = v86;
                  uint64_t v88 = MEMORY[0x270FA5388](*(void *)(v86 + 16), v87);
                  goto LABEL_81;
                }
              }
              goto LABEL_89;
            }
            goto LABEL_106;
          }
LABEL_105:
          __break(1u);
LABEL_106:
          __break(1u);
LABEL_107:
          __break(1u);
          goto LABEL_108;
        }
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
      __break(1u);
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_260FCD890(0, v31[2] + 1, 1, (char *)v31);
    long long v31 = (uint64_t *)isUniquelyReferenced_nonNull_native;
LABEL_84:
    unint64_t v105 = v31[2];
    unint64_t v104 = v31[3];
    uint64_t v106 = v105 + 1;
    if (v105 >= v104 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_260FCD890((char *)(v104 > 1), v105 + 1, 1, (char *)v31);
      long long v31 = (uint64_t *)isUniquelyReferenced_nonNull_native;
    }
    v31[2] = v106;
    *((float *)v31 + v105 + 8) = v8;
    uint64_t v125 = (uint64_t)v31;
    MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v103);
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_260F95AB8(v106, (uint64_t (*)(void *, uint64_t *))sub_260FCA960);
    swift_bridgeObjectRelease();
    uint64_t v125 = v107;
    uint64_t v109 = MEMORY[0x270FA5388](*(void *)(v107 + 16), v108);
    uint64_t v110 = sub_260F95AB8(v109, (uint64_t (*)(void *, uint64_t *))sub_260FCA980);
    swift_bridgeObjectRelease();
    uint64_t v125 = v110;
    uint64_t v112 = MEMORY[0x270FA5388](*(void *)(v110 + 16), v111);
    uint64_t v113 = sub_260F95AB8(v112, (uint64_t (*)(void *, uint64_t *))sub_260FCAFD8);
    swift_bridgeObjectRelease();
    uint64_t v125 = v113;
    uint64_t v115 = MEMORY[0x270FA5388](*(void *)(v113 + 16), v114);
    uint64_t v116 = sub_260F95AB8(v115, (uint64_t (*)(void *, uint64_t *))sub_260FCA838);
    uint64_t v117 = swift_bridgeObjectRelease();
    *(void *)(v9 + 64) = v116;
    uint64_t v125 = (uint64_t)v31;
    uint64_t v118 = v31[2];
    MEMORY[0x270FA5388](v117, v119);
    swift_bridgeObjectRetain();
    uint64_t v98 = sub_260F95AB8(v118, (uint64_t (*)(void *, uint64_t *))sub_260FCAA00);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v9 + 72) = v98;
    *(unsigned char *)(v9 + 104) = 1;
    goto LABEL_87;
  }
  unint64_t v50 = *((void *)v26 + 2);
  swift_bridgeObjectRetain();
  v51.i32[0] = 1.0;
  uint64_t v52 = sub_260FB6784(v50, v51);
  uint64_t v125 = (uint64_t)v26;
  uint64_t v53 = *((void *)v26 + 2);
  MEMORY[0x270FA5388](v52, v54);
  swift_bridgeObjectRetain();
  sub_260F95AB8(v53, (uint64_t (*)(void *, uint64_t *))sub_260FCA838);
  sub_260FB6784(*(void *)(*(void *)(v9 + 48) + 16), 0);
  uint64_t v55 = sub_260FC8F14(v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v125 = v55;
  uint64_t v57 = MEMORY[0x270FA5388](*(void *)(v55 + 16), v56);
  uint64_t v58 = sub_260F95AB8(v57, (uint64_t (*)(void *, uint64_t *))sub_260FCA864);
  swift_bridgeObjectRelease();
  int64_t v59 = *(void *)(v58 + 16);
  if (v59)
  {
    uint64_t v125 = v24;
    sub_260F63828(0, v59, 0);
    uint64_t v60 = 0;
    uint64_t v61 = v125;
    unint64_t v62 = *(void *)(v125 + 16);
    do
    {
      float v63 = logf(*(float *)(v58 + 4 * v60 + 32));
      uint64_t v125 = v61;
      unint64_t v64 = *(void *)(v61 + 24);
      if (v62 >= v64 >> 1)
      {
        sub_260F63828(v64 > 1, v62 + 1, 1);
        uint64_t v61 = v125;
      }
      ++v60;
      *(void *)(v61 + 16) = v62 + 1;
      *(float *)(v61 + 4 * v62++ + 32) = v63;
    }
    while (v59 != v60);
    uint64_t v65 = *(void *)(v58 + 16);
    long long v31 = (uint64_t *)MEMORY[0x263F8EE78];
    if (v65)
    {
      float v66 = *(float *)(v58 + 32);
      float v67 = *(float *)(v58 + 32 + 4 * v65 - 4);
      swift_bridgeObjectRelease();
      int64_t v68 = sub_260F93E98(v11, 0.0, 1.0);
      float v69 = powf(v67, 0.14286);
      int64_t v70 = *(void *)(v68 + 16);
      if (v70)
      {
        float v71 = v69;
        float v72 = powf(v66, 0.14286);
        uint64_t v125 = (uint64_t)v31;
        sub_260F63828(0, v70, 0);
        uint64_t v73 = 0;
        float v74 = v72 - v71;
        long long v31 = (uint64_t *)v125;
        unint64_t v75 = *(void *)(v125 + 16);
        do
        {
          float v76 = *(float *)(v68 + 4 * v73 + 32);
          uint64_t v125 = (uint64_t)v31;
          unint64_t v77 = v31[3];
          if (v75 >= v77 >> 1)
          {
            sub_260F63828(v77 > 1, v75 + 1, 1);
            long long v31 = (uint64_t *)v125;
          }
          ++v73;
          float v78 = powf(v71 + (float)(v74 * v76), 7.0);
          v31[2] = v75 + 1;
          *((float *)v31 + v75++ + 8) = v78;
        }
        while (v70 != v73);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v99 = swift_bridgeObjectRetain();
      uint64_t v100 = sub_260FCA880(v99, v61);
      swift_bridgeObjectRelease_n();
      *(void *)(v9 + 56) = v100;
      uint64_t v101 = v31[2];
      if (!v101) {
        goto LABEL_111;
      }
      float v8 = *((float *)v31 + v101 + 7);
      swift_bridgeObjectRelease();
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_84;
      }
      goto LABEL_101;
    }
  }
LABEL_110:
  __break(1u);
LABEL_111:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

unint64_t sub_260FC8CE8(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_260FE5230();
  swift_unknownObjectRetain_n();
  uint64_t v8 = swift_dynamicCastClass();
  if (!v8)
  {
    swift_unknownObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  uint64_t v9 = *(void *)(v8 + 16);
  swift_release();
  if (__OFSUB__(v4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (v9 != (v4 >> 1) - a3)
  {
LABEL_22:
    swift_unknownObjectRelease();
LABEL_2:
    unint64_t v4 = sub_260F95480(a1, a2, a3, v4);
    goto LABEL_9;
  }
  unint64_t v4 = swift_dynamicCastClass();
  if (!v4)
  {
    swift_unknownObjectRelease();
    unint64_t v4 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  unint64_t v10 = *(void *)(v4 + 16);
  swift_unknownObjectRelease();
  if (v10 >= 2)
  {
    a1 = 0;
    a3 = v10 >> 1;
    a2 = v10 + 3;
    do
    {
      if (a1 != a2 - 4)
      {
        unint64_t v12 = *(void *)(v4 + 16);
        if (a1 >= v12)
        {
          __break(1u);
LABEL_20:
          __break(1u);
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
        if (a2 - 4 >= v12) {
          goto LABEL_20;
        }
        uint64_t v13 = *(void *)(v4 + 8 * a1 + 32);
        uint64_t v14 = *(void *)(v4 + 8 * a2);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v4 = (unint64_t)sub_260F7B454((void *)v4);
        }
        *(void *)(v4 + 8 * a1 + 32) = v14;
        *(void *)(v4 + 8 * a2) = v13;
      }
      ++a1;
      --a2;
    }
    while (a3 != a1);
  }
  return v4;
}

uint64_t sub_260FC8E58(uint64_t result)
{
  unint64_t v1 = (void *)result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return (uint64_t)v1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  for (unint64_t i = v2 + 3; ; --i)
  {
    if (v3 == i - 4) {
      goto LABEL_5;
    }
    unint64_t v6 = v1[2];
    if (v3 >= v6) {
      break;
    }
    if (i - 4 >= v6) {
      goto LABEL_12;
    }
    uint64_t v7 = v1[v3 + 4];
    uint64_t v8 = v1[i];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_260F7B454(v1);
      unint64_t v1 = (void *)result;
    }
    v1[v3 + 4] = v8;
    v1[i] = v7;
LABEL_5:
    if (v4 == ++v3) {
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_260FC8F14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_260F95AB8(v1, (uint64_t (*)(void *, uint64_t *))sub_260FCAF9C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_260FC8FCC(uint64_t a1, float a2)
{
  float v3 = logf(a2);
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_260F63828(0, v4, 0);
    uint64_t v5 = v22;
    unint64_t v6 = (float *)(a1 + 32);
    unint64_t v7 = *(void *)(v22 + 16);
    unint64_t v8 = v4;
    do
    {
      float v9 = *v6;
      uint64_t v23 = v5;
      unint64_t v10 = *(void *)(v5 + 24);
      unint64_t v11 = v7 + 1;
      if (v7 >= v10 >> 1)
      {
        sub_260F63828(v10 > 1, v7 + 1, 1);
        uint64_t v5 = v23;
      }
      *(void *)(v5 + 16) = v11;
      *(float *)(v5 + 4 * v7 + 32) = v3 - v9;
      ++v6;
      ++v7;
      --v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v11)
    {
LABEL_33:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
  uint64_t v12 = 0;
  uint64_t v13 = -1;
  do
  {
    BOOL v14 = *(float *)(v5 + 4 * v12 + 32) >= 0.0 && v13 < (uint64_t)(v11 - 2);
    if (v14) {
      ++v13;
    }
    ++v12;
  }
  while (v11 != v12);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v16 = v13 & ~(v13 >> 63);
  uint64_t v17 = v16 + 1;
  if (__OFADD__(v16, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v16 < v4)
  {
    if (v17 < v4)
    {
      float v18 = (float)(*(float *)(a1 + 32 + 4 * v16) - v3)
          / (float)(*(float *)(a1 + 32 + 4 * v16) - *(float *)(a1 + 32 + 4 * v17));
      if (v18 <= 1.0) {
        float v19 = (float)(*(float *)(a1 + 32 + 4 * v16) - v3)
      }
            / (float)(*(float *)(a1 + 32 + 4 * v16) - *(float *)(a1 + 32 + 4 * v17));
      else {
        float v19 = 1.0;
      }
      BOOL v14 = v18 > 0.0;
      float v20 = 0.0;
      if (v14) {
        float v20 = v19;
      }
      float v21 = roundf((float)(v20 * (float)v17) + (float)((float)(1.0 - v20) * (float)v16));
      if ((~LODWORD(v21) & 0x7F800000) != 0)
      {
        if (v21 > -9.2234e18)
        {
          if (v21 < 9.2234e18) {
            return (uint64_t)v21;
          }
          goto LABEL_32;
        }
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_260FC91A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == a1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v5 = v2 - 1;
  while (v5 != result)
  {
    uint64_t v6 = *(void *)(a2 + 40 + 8 * result++);
    if (v6 == a1) {
      return result;
    }
  }
  return 0;
}

float *sub_260FC920C(float *result, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float *a9, uint64_t a10, float **a11)
{
  if (a7 < 0)
  {
    __break(1u);
  }
  else if (a7)
  {
    unint64_t v11 = *a11;
    int v12 = *(unsigned __int8 *)(a8 + 105);
    do
    {
      if (v12)
      {
        if (v12 == 1) {
          float v13 = *a9;
        }
        else {
          float v13 = (float)(*result * a3) - (float)(*a9 * a2);
        }
      }
      else
      {
        float v13 = (float)(*result - (float)(*a9 * a2)) / a3;
      }
      *v11++ = v13;
      ++a9;
      ++result;
      --a7;
    }
    while (a7);
  }
  return result;
}

uint64_t sub_260FC9280@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (*(unsigned char *)(v5 + 104) != 1)
  {
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_17;
    }
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(v5 + 56);
  uint64_t v7 = *(void *)(v6 + 16);
  if (!v7)
  {
LABEL_7:
    a3 = 0;
    a2 = 0;
    goto LABEL_17;
  }
  if (*(void *)(v6 + 32) != a3)
  {
    uint64_t v8 = 0;
    while (v7 - 1 != v8)
    {
      uint64_t v9 = *(void *)(v6 + 40 + 8 * v8++);
      if (v9 == a3) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_11:
  if (*(void *)(v6 + 32) != a2)
  {
    unint64_t v10 = 0;
    uint64_t v11 = v6 + 40;
    uint64_t v12 = v7 - 1;
    while (v12 != v10)
    {
      uint64_t v13 = *(void *)(v11 + 8 * v10++);
      if (v13 == a2)
      {
        a3 = v8;
        a2 = v10;
        goto LABEL_17;
      }
    }
  }
  a2 = 0;
  a3 = v8;
LABEL_17:
  uint64_t v14 = *(void *)(v5 + 80);
  unint64_t v15 = *(void *)(v14 + 16);
  if (a3 >= (uint64_t)v15)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (a2 >= v15)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v16 = *(void *)(v5 + 64);
  if (a3 >= *(void *)(v16 + 16))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v17 = *(void *)(v5 + 72);
  unint64_t v18 = *(void *)(v17 + 16);
  if (a3 >= (uint64_t)v18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 < v18)
  {
    double v19 = *(float *)(v17 + 32 + 4 * a3);
    double v20 = *(float *)(v16 + 4 * a3 + 32);
    double v21 = *(float *)(v17 + 32 + 4 * a2);
    double v22 = *(float *)(v14 + 32 + 4 * a3) - *(float *)(v14 + 32 + 4 * a2);
    uint64_t v23 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB38);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_260FE7060;
    *(double *)(inited + 32) = v19 / v21;
    *(long double *)(inited + 40) = -(v20 * (exp(-v22) + -1.0));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E84C0);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = *(void *)(v27 + 72);
    unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_260FE7060;
    unint64_t v31 = v30 + v29;
    unint64_t v32 = *(void (**)(unint64_t, uint64_t, uint64_t))(v27 + 16);
    v32(v31, a4, v26);
    v32(v31 + v28, v23, v26);
    sub_260F92798(inited, v30, a5);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    return swift_setDeallocating();
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_260FC9560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  uint64_t v99 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101, v11);
  uint64_t v98 = (uint64_t)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v100 = (char *)&v90 - v15;
  double v19 = MEMORY[0x270FA5388](v16, v17);
  uint64_t result = (char *)&v90 - v18;
  uint64_t v21 = *(void *)(a2 + 16);
  if (!v21)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (v21 == 1)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v22 = *(void *)(a1 + 16);
  if (!v22)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  uint64_t v95 = a4;
  uint64_t v96 = a5;
  uint64_t v23 = a2 + 32 + 8 * v21;
  unint64_t v25 = *(void *)(v23 - 16);
  unint64_t v24 = *(void *)(v23 - 8);
  uint64_t v26 = *(uint64_t (**)(double))(v99 + 16);
  uint64_t v27 = *(unsigned __int8 *)(v99 + 80);
  uint64_t v94 = (v27 + 32) & ~v27;
  uint64_t v28 = a1 + v94;
  uint64_t v29 = *(void *)(v99 + 72);
  uint64_t v97 = (char *)&v90 - v18;
  uint64_t result = (char *)v26(v19);
  if (v22 == 1)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  *(void *)&long long v93 = v29;
  uint64_t result = (char *)((uint64_t (*)(char *, uint64_t, uint64_t))v26)(v100, v28 + v29 * (v22 - 2), v101);
  uint64_t v31 = *(void *)(v5 + 80);
  if (*(unsigned char *)(v5 + 104) == 1)
  {
    uint64_t v32 = *(void *)(v5 + 56);
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      if (*(void *)(v32 + 32) == a3)
      {
        unint64_t v34 = *(void *)(v31 + 16);
        if (v34)
        {
          BOOL v35 = (_DWORD *)(v31 + 32);
          uint64_t v36 = (float *)(v31 + 32);
LABEL_23:
          if (*(void *)(v32 + 32) != v24)
          {
            unint64_t v42 = 0;
            uint64_t v43 = v32 + 40;
            uint64_t v44 = v33 - 1;
            while (v44 != v42)
            {
              uint64_t v45 = *(void *)(v43 + 8 * v42++);
              if (v45 == v24) {
                goto LABEL_28;
              }
            }
          }
          unint64_t v42 = 0;
LABEL_28:
          if (v42 >= v34) {
            goto LABEL_86;
          }
          LODWORD(v30) = *v35;
          float v39 = *(float *)(v31 + 4 * v42 + 32);
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v40 = 0;
        while (v33 - 1 != v40)
        {
          uint64_t v41 = *(void *)(v32 + 40 + 8 * v40++);
          if (v41 == a3) {
            goto LABEL_21;
          }
        }
        uint64_t v40 = 0;
LABEL_21:
        unint64_t v34 = *(void *)(v31 + 16);
        if (v40 < (uint64_t)v34)
        {
          uint64_t v36 = (float *)(v31 + 32);
          BOOL v35 = (_DWORD *)(v31 + 32 + 4 * v40);
          goto LABEL_23;
        }
      }
    }
    else
    {
      unint64_t v34 = *(void *)(v31 + 16);
      if (v34)
      {
        float v39 = *(float *)(v31 + 32);
        *(float *)&long long v30 = v39;
        uint64_t v36 = (float *)(v31 + 32);
LABEL_30:
        uint64_t v46 = *(void *)(v5 + 56);
        uint64_t v47 = *(void *)(v46 + 16);
        if (v47)
        {
          if (*(void *)(v46 + 32) != v25)
          {
            unint64_t v48 = 0;
            while (v47 - 1 != v48)
            {
              uint64_t v49 = *(void *)(v46 + 40 + 8 * v48++);
              if (v49 == v25) {
                goto LABEL_44;
              }
            }
            unint64_t v48 = 0;
LABEL_44:
            if (v48 >= v34) {
              goto LABEL_87;
            }
            v36 += v48;
          }
          float v53 = *v36;
          uint64_t v61 = *(void *)(v5 + 64);
          if (*(void *)(v46 + 32) == a3)
          {
            if (*(void *)(v61 + 16))
            {
              float v54 = *(float *)(v61 + 32);
              uint64_t v62 = *(void *)(v5 + 72);
              goto LABEL_56;
            }
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          uint64_t v60 = 0;
          while (v47 - 1 != v60)
          {
            uint64_t v63 = *(void *)(v46 + 40 + 8 * v60++);
            if (v63 == a3) {
              goto LABEL_54;
            }
          }
          uint64_t v60 = 0;
        }
        else
        {
          uint64_t v60 = 0;
          float v53 = *v36;
          uint64_t v61 = *(void *)(v5 + 64);
        }
LABEL_54:
        if (v60 >= *(void *)(v61 + 16)) {
          goto LABEL_83;
        }
        float v54 = *(float *)(v61 + 4 * v60 + 32);
        uint64_t v62 = *(void *)(v5 + 72);
        if (v47)
        {
LABEL_56:
          if (*(void *)(v46 + 32) == a3)
          {
            unint64_t v52 = *(void *)(v62 + 16);
            if (v52)
            {
              float v64 = *(float *)(v62 + 32);
              uint64_t v55 = v62 + 32;
              float v58 = v64;
              uint64_t v57 = v93;
LABEL_68:
              if (*(void *)(v46 + 32) != v24)
              {
                unint64_t v59 = 0;
                uint64_t v87 = v46 + 40;
                uint64_t v88 = v47 - 1;
                while (v88 != v59)
                {
                  uint64_t v89 = *(void *)(v87 + 8 * v59++);
                  if (v89 == v24) {
                    goto LABEL_70;
                  }
                }
              }
              unint64_t v59 = 0;
LABEL_70:
              if (v59 < v52)
              {
                double v67 = v58;
                double v68 = v54;
                double v69 = v39;
                double v70 = *(float *)(v55 + 4 * v59);
                double v71 = *(float *)&v30 - v69;
                *(double *)&long long v30 = (v69 - v53) / v71;
                long long v93 = v30;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB38);
                uint64_t v72 = v101;
                uint64_t v73 = v26;
                uint64_t inited = swift_initStackObject();
                long long v90 = xmmword_260FE7060;
                float64x2_t v75 = vdivq_f64((float64x2_t)xmmword_260FFAC60, (float64x2_t)vdupq_lane_s64(v93, 0));
                *(_OWORD *)(inited + 16) = xmmword_260FE7060;
                *(float64x2_t *)(inited + 32) = v75;
                *(void *)&long long v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E84C0);
                uint64_t v91 = 2 * v57;
                uint64_t v76 = v94;
                uint64_t v92 = v27 | 7;
                uint64_t v77 = swift_allocObject();
                *(_OWORD *)(v77 + 16) = v90;
                ((void (*)(uint64_t, char *, uint64_t))v73)(v77 + v76, v97, v72);
                ((void (*)(uint64_t, char *, uint64_t))v73)(v77 + v76 + v57, v100, v72);
                sub_260F92798(inited, v77, v98);
                swift_setDeallocating();
                swift_arrayDestroy();
                swift_deallocClassInstance();
                swift_setDeallocating();
                uint64_t v78 = swift_initStackObject();
                long long v90 = xmmword_260FE8090;
                *(_OWORD *)(v78 + 16) = xmmword_260FE8090;
                *(double *)(v78 + 32) = v67 / v70;
                long double v79 = exp(-v71) + -1.0;
                *(long double *)(v78 + 40) = -(v68 * v79);
                *(long double *)(v78 + 48) = v79 * (v68 * -0.5);
                uint64_t v80 = v91;
                uint64_t v81 = swift_allocObject();
                *(_OWORD *)(v81 + 16) = v90;
                ((void (*)(uint64_t, uint64_t, uint64_t))v73)(v81 + v76, v95, v72);
                uint64_t v82 = v81 + v76 + v57;
                int32x2_t v83 = v97;
                ((void (*)(uint64_t, char *, uint64_t))v73)(v82, v97, v72);
                uint64_t v84 = v81 + v76 + v80;
                uint64_t v85 = v98;
                ((void (*)(uint64_t, uint64_t, uint64_t))v73)(v84, v98, v72);
                sub_260F92798(v78, v81, v96);
                swift_setDeallocating();
                swift_arrayDestroy();
                swift_deallocClassInstance();
                swift_setDeallocating();
                uint64_t v86 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
                v86(v85, v72);
                v86((uint64_t)v100, v72);
                return (char *)((uint64_t (*)(char *, uint64_t))v86)(v83, v72);
              }
              goto LABEL_85;
            }
          }
          else
          {
            uint64_t v65 = 0;
            while (v47 - 1 != v65)
            {
              uint64_t v66 = *(void *)(v46 + 40 + 8 * v65++);
              if (v66 == a3) {
                goto LABEL_66;
              }
            }
            uint64_t v65 = 0;
LABEL_66:
            unint64_t v52 = *(void *)(v62 + 16);
            if (v65 < (uint64_t)v52)
            {
              uint64_t v55 = v62 + 32;
              float v58 = *(float *)(v55 + 4 * v65);
              uint64_t v57 = v93;
              goto LABEL_68;
            }
          }
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
          goto LABEL_86;
        }
        unint64_t v52 = *(void *)(v62 + 16);
        if (!v52) {
          goto LABEL_84;
        }
        unint64_t v24 = 0;
        uint64_t v56 = (float *)(v62 + 32);
        uint64_t v55 = v62 + 32;
LABEL_41:
        uint64_t v57 = v93;
        float v58 = *v56;
        unint64_t v59 = v24;
        goto LABEL_70;
      }
    }
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  unint64_t v37 = *(void *)(v31 + 16);
  if (v37 <= a3) {
    goto LABEL_82;
  }
  if (v24 < v37)
  {
    uint64_t v38 = v31 + 32;
    LODWORD(v30) = *(_DWORD *)(v31 + 32 + 4 * a3);
    float v39 = *(float *)(v31 + 32 + 4 * v24);
    if (v25 >= v37) {
      goto LABEL_87;
    }
    if ((a3 & 0x8000000000000000) == 0)
    {
      uint64_t v50 = *(void *)(v5 + 64);
      if (*(void *)(v50 + 16) <= a3) {
        goto LABEL_83;
      }
      uint64_t v51 = *(void *)(v5 + 72);
      unint64_t v52 = *(void *)(v51 + 16);
      if (v52 <= a3) {
        goto LABEL_84;
      }
      float v53 = *(float *)(v38 + 4 * v25);
      float v54 = *(float *)(v50 + 4 * a3 + 32);
      uint64_t v55 = v51 + 32;
      uint64_t v56 = (float *)(v51 + 32 + 4 * a3);
      goto LABEL_41;
    }
    __break(1u);
    goto LABEL_77;
  }
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
  return result;
}

void DPMSolverMultistepScheduler.step(output:timeStep:sample:)(unint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v54 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v55 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v16 = (char *)&v50 - v15;
  MEMORY[0x270FA5388](v17, v18);
  double v20 = (char *)&v50 - v19;
  uint64_t v21 = *(void *)(v5 + 56);
  unint64_t v22 = *(void *)(v21 + 16);
  uint64_t v53 = v21;
  if (!v22)
  {
LABEL_9:
    unint64_t v51 = 0;
    unint64_t v24 = v22 - 1;
    int v26 = 1;
    goto LABEL_13;
  }
  uint64_t v23 = v21 + 32;
  if (*(void *)(v21 + 32) != a2)
  {
    unint64_t v24 = 0;
    while (v22 - 1 != v24)
    {
      uint64_t v25 = *(void *)(v21 + 40 + 8 * v24++);
      if (v25 == a2) {
        goto LABEL_7;
      }
    }
    goto LABEL_9;
  }
  unint64_t v24 = 0;
LABEL_7:
  if (v24 == v22 - 1)
  {
    unint64_t v51 = 0;
    int v26 = 1;
  }
  else
  {
    unint64_t v27 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v27 >= v22)
    {
LABEL_53:
      __break(1u);
      return;
    }
    int v26 = 0;
    unint64_t v51 = *(void *)(v23 + 8 * v27);
  }
LABEL_13:
  if (v24 == v22 - 2) {
    int v26 = 1;
  }
  if (v22 < 0xF) {
    int v28 = v26;
  }
  else {
    int v28 = 0;
  }
  if (*(uint64_t *)(v5 + 96) < 1) {
    int v28 = 1;
  }
  int v52 = v28;
  sub_260F93E1C();
  unint64_t v29 = sub_260FE3BD0();
  if (*(unsigned char *)(v5 + 104) == 1)
  {
    uint64_t v30 = *(void *)(v53 + 16);
    if (v30 && *(void *)(v53 + 32) != a2)
    {
      int64_t v31 = 0;
      uint64_t v48 = v30 - 1;
      while (v48 != v31)
      {
        uint64_t v49 = *(void *)(v53 + 40 + 8 * v31++);
        if (v49 == a2) {
          goto LABEL_25;
        }
      }
    }
    int64_t v31 = 0;
  }
  else
  {
    int64_t v31 = a2;
    if ((a2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_46;
    }
  }
LABEL_25:
  uint64_t v32 = *(void *)(v5 + 64);
  if (v31 >= *(void *)(v32 + 16))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v33 = *(void *)(v5 + 72);
  if (v31 >= *(void *)(v33 + 16))
  {
LABEL_47:
    __break(1u);
LABEL_48:
    unint64_t v29 = sub_260FCD3E0(0, *(void *)(v29 + 16) + 1, 1, v29);
    *a1 = v29;
    goto LABEL_30;
  }
  uint64_t v50 = a4;
  uint64_t v34 = 4 * v31;
  int v35 = *(_DWORD *)(v32 + v34 + 32);
  int v36 = *(_DWORD *)(v33 + v34 + 32);
  uint64_t v37 = sub_260FE3B20();
  MEMORY[0x270FA5388](v37, v38);
  *(&v50 - 6) = v29;
  *(&v50 - 5) = (uint64_t)a1;
  *(&v50 - 4) = v54;
  *(&v50 - 3) = v5;
  *((_DWORD *)&v50 - 4) = v36;
  *((_DWORD *)&v50 - 3) = v35;
  sub_260FE3AE0();
  a1 = (unint64_t *)(v5 + 112);
  swift_beginAccess();
  if (*(void *)(*(void *)(v5 + 112) + 16) == 2)
  {
    swift_beginAccess();
    sub_260FCA234((uint64_t)v16);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v55, v20, v9);
  swift_beginAccess();
  unint64_t v29 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v29;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_48;
  }
LABEL_30:
  unint64_t v41 = *(void *)(v29 + 16);
  unint64_t v40 = *(void *)(v29 + 24);
  if (v41 >= v40 >> 1)
  {
    unint64_t v29 = sub_260FCD3E0(v40 > 1, v41 + 1, 1, v29);
    *a1 = v29;
  }
  *(void *)(v29 + 16) = v41 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v29+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v41, v55, v9);
  swift_endAccess();
  if (v52)
  {
    sub_260FC9280((uint64_t)v20, a2, v51, v54, v50);
    goto LABEL_38;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6C80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260FE7060;
  unint64_t v43 = v24 - 1;
  uint64_t v44 = v50;
  if (__OFSUB__(v24, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if ((v43 & 0x8000000000000000) != 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  if (v43 >= *(void *)(v53 + 16))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v45 = inited;
  *(void *)(inited + 32) = *(void *)(v53 + 8 * v43 + 32);
  *(void *)(inited + 40) = a2;
  uint64_t v46 = swift_bridgeObjectRetain();
  sub_260FC9560(v46, v45, v51, v54, v44);
  swift_setDeallocating();
  swift_bridgeObjectRelease();
LABEL_38:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v20, v9);
  uint64_t v47 = *(void *)(v5 + 96);
  if (v47 <= 1) {
    *(void *)(v5 + 96) = v47 + 1;
  }
}

void sub_260FCA234(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB90);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  if (!*(void *)(*v1 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v6, v7 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v6, v8);
    if (*(void *)(v7 + 16))
    {
      sub_260FCACE4(0, 1);
      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
}

uint64_t DPMSolverMultistepScheduler.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DPMSolverMultistepScheduler.__deallocating_deinit()
{
  DPMSolverMultistepScheduler.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_260FCA44C()
{
  return swift_bridgeObjectRetain();
}

void sub_260FCA490(unint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

void sub_260FCA4B4(uint64_t a1, vDSP_Length *a2, uint64_t a3)
{
  vDSP_Length v3 = *(void *)(a3 + 16);
  if (v3 == *(void *)(a1 + 8))
  {
    if (*(void *)a1)
    {
      vDSP_vsq((const float *)(a3 + 32), 1, *(float **)a1, 1, v3);
      *a2 = v3;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_260FCA520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  vDSP_Length v3 = *(void *)(a3 + 8);
  if (*(void *)(a1 + 16) != v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (*(void *)(a2 + 16) != v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)a3)
  {
    vDSP_vmul((const float *)(a1 + 32), 1, (const float *)(a2 + 32), 1, *(float **)a3, 1, v3);
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_260FCA568(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  vDSP_Length v3 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 16) != v3)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  float __B = a3;
  if (!*(void *)a2) {
    goto LABEL_5;
  }
  vDSP_vsadd((const float *)(a1 + 32), 1, &__B, *(float **)a2, 1, v3);
}

uint64_t sub_260FCA5E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  vDSP_Length v5 = *(void *)(a5 + 8);
  if (*(void *)(result + 16) != v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(a2 + 16) != v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)(a3 + 16) != v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)(a4 + 16) != v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __E = *(float **)a5;
  if (!*(void *)a5)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v10 = (const float *)(result + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  vDSP_vsbsbm(v10, 1, (const float *)(a2 + 32), 1, (const float *)(a3 + 32), 1, (const float *)(a4 + 32), 1, __E, 1, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_260FCA714(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  vDSP_Length v3 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 16) != v3)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  float __A = a3;
  if (!*(void *)a2) {
    goto LABEL_5;
  }
  vDSP_svdiv(&__A, (const float *)(a1 + 32), 1, *(float **)a2, 1, v3);
}

uint64_t sub_260FCA794(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  uint64_t v8 = *a4;
  uint64_t v9 = a4[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_260FCA5E8(v6, v7, v8, v9, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = *(void *)(v6 + 16);
  return result;
}

uint64_t sub_260FCA838(uint64_t a1, void *a2)
{
  return sub_260FCA9AC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, float))sub_260FCA714);
}

void sub_260FCA864(uint64_t a1, void *a2)
{
  sub_260F96310(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_260FCA880(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_260DB4728(0, v2, 0);
    uint64_t v3 = v11;
    uint64_t v6 = (float *)(a1 + 32);
    do
    {
      uint64_t v7 = sub_260FC8FCC(a2, *v6);
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_260DB4728(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(void *)(v11 + 8 * v9 + 32) = v7;
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v3;
}

void sub_260FCA960(uint64_t a1, vDSP_Length *a2)
{
  sub_260FCA4B4(a1, a2, **(void **)(v2 + 16));
}

uint64_t sub_260FCA980(uint64_t a1, void *a2)
{
  return sub_260FCA9AC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, float))sub_260FCA568);
}

uint64_t sub_260FCA9AC(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t, uint64_t, float))
{
  float v5 = *(float *)(v3 + 16);
  uint64_t v6 = **(void **)(v3 + 24);
  uint64_t result = a3(v6, a1, v5);
  *a2 = *(void *)(v6 + 16);
  return result;
}

void sub_260FCAA00(uint64_t a1, void *a2)
{
  uint64_t v4 = *(uint64_t **)(v2 + 24);
  uint64_t v5 = **(void **)(v2 + 16);
  sub_260FCA520(v5, *v4, a1);
  *a2 = *(void *)(v5 + 16);
}

void sub_260FCAA50(uint64_t a1, void *a2)
{
  sub_260F962C0(a1, a2, *(uint64_t **)(v2 + 16), *(uint64_t **)(v2 + 24));
}

uint64_t sub_260FCAA6C()
{
  return sub_260FE3AF0();
}

unint64_t sub_260FCAAFC()
{
  unint64_t result = qword_26A8EB328;
  if (!qword_26A8EB328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB328);
  }
  return result;
}

unint64_t sub_260FCAB54()
{
  unint64_t result = qword_26A8EB330;
  if (!qword_26A8EB330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB330);
  }
  return result;
}

ValueMetadata *type metadata accessor for SchedulerTimeStepSpacing()
{
  return &type metadata for SchedulerTimeStepSpacing;
}

unsigned char *_s13DiffusionBase23SchedulerPredictionTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 2;
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
        JUMPOUT(0x260FCAC88);
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
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SchedulerPredictionType()
{
  return &type metadata for SchedulerPredictionType;
}

uint64_t type metadata accessor for DPMSolverMultistepScheduler()
{
  return self;
}

uint64_t sub_260FCACE4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_260FCD3E0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0) - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FCAED0()
{
  return sub_260FE3AF0();
}

float *sub_260FCAF68(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_260FC920C(a1, *(float *)(v4 + 48), *(float *)(v4 + 52), a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(float **)(v4 + 32), *(void *)(v4 + 40), *(float ***)(v4 + 56));
}

uint64_t sub_260FCAF9C(uint64_t a1, void *a2)
{
  return sub_260FCA794(a1, a2, *(uint64_t **)(v2 + 16), *(uint64_t **)(v2 + 24));
}

void sub_260FCAFC0(uint64_t a1, void *a2)
{
}

void sub_260FCAFD8(uint64_t a1, void *a2)
{
}

__n128 BPETokenizer.init(mergesAt:vocabularyAt:padToken:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_260FCFFD0(a1, a2, a3, a4, (uint64_t)v9);
  if (!v5)
  {
    long long v8 = v9[3];
    *(_OWORD *)(a5 + 32) = v9[2];
    *(_OWORD *)(a5 + 48) = v8;
    *(_OWORD *)(a5 + 64) = v9[4];
    __n128 result = (__n128)v9[1];
    *(_OWORD *)a5 = v9[0];
    *(__n128 *)(a5 + 16) = result;
  }
  return result;
}

uint64_t BPETokenizer.tokenize(input:minCount:)(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v9 = v4[4];
  uint64_t v8 = v4[5];
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_260DB118C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v12 = v10[2];
  unint64_t v11 = v10[3];
  if (v12 >= v11 >> 1) {
    uint64_t v10 = sub_260DB118C((void *)(v11 > 1), v12 + 1, 1, v10);
  }
  v10[2] = v12 + 1;
  unint64_t v13 = &v10[2 * v12];
  v13[4] = v9;
  v13[5] = v8;
  unint64_t v29 = v10;
  uint64_t v14 = sub_260FCBA88(a1);
  sub_260FCB3B0(v14);
  uint64_t v16 = v4[6];
  uint64_t v15 = v4[7];
  uint64_t v17 = v29;
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_260DB118C(0, v29[2] + 1, 1, v29);
    uint64_t v17 = (void *)result;
  }
  unint64_t v20 = v17[2];
  unint64_t v19 = v17[3];
  int64_t v21 = v20 + 1;
  if (v20 >= v19 >> 1)
  {
    uint64_t result = (uint64_t)sub_260DB118C((void *)(v19 > 1), v20 + 1, 1, v17);
    uint64_t v17 = (void *)result;
  }
  v17[2] = v21;
  BOOL v22 = &v17[2 * v20];
  v22[4] = v16;
  v22[5] = v15;
  if (a3) {
    goto LABEL_11;
  }
  BOOL v23 = a2 - v21 < 0;
  BOOL v24 = a2 <= v21;
  uint64_t v25 = a2 - v21;
  if (v24) {
    goto LABEL_11;
  }
  if (!v23)
  {
    uint64_t v27 = v4[2];
    uint64_t v26 = v4[3];
    swift_bridgeObjectRetain();
    sub_260FCB504(v25, v27, v26);
LABEL_11:
    sub_260FD027C((uint64_t)v4);
    uint64_t v28 = swift_bridgeObjectRetain();
    sub_260FCFA50(v28, v4);
    sub_260FD02F4((uint64_t)v4);
    swift_bridgeObjectRelease();
    return (uint64_t)v17;
  }
  __break(1u);
  return result;
}

Swift::String __swiftcall BPETokenizer.decode(tokens:)(Swift::OpaquePointer tokens)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E66D8);
  sub_260E423DC();
  sub_260FE3F90();
  sub_260FE42F0();
  sub_260D86D20();
  sub_260FE4B30();
  swift_bridgeObjectRelease();
  sub_260FE4B30();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_260FE4B30();
  int v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = v1;
  uint64_t v5 = v3;
  result._object = v5;
  result._countAndFlagsBits = v4;
  return result;
}

DiffusionBase::MockedTokenizer __swiftcall MockedTokenizer.init()()
{
  Swift::Int v0 = 0;
  uint64_t v1 = 0;
  uint64_t v2 = (void *)0xE000000000000000;
  result.padToken._object = v2;
  result.padToken._countAndFlagsBits = v1;
  result.padId = v0;
  return result;
}

uint64_t sub_260FCB3B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
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
  int v3 = sub_260DB118C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
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
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FCB504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = *(void **)v3;
  int64_t v5 = *(void *)(*(void *)v3 + 16);
  int64_t v6 = v5 + a1;
  if (__OFADD__(v5, a1))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = a1;
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v11 = v4[3] >> 1, v11 < v6))
  {
    if (v5 <= v6) {
      int64_t v12 = v6;
    }
    else {
      int64_t v12 = v5;
    }
    int64_t v4 = sub_260DB118C(isUniquelyReferenced_nonNull_native, v12, 1, v4);
    int64_t v11 = v4[3] >> 1;
  }
  uint64_t v13 = v4[2];
  int64_t v14 = (uint64_t *)(v11 - v13);
  uint64_t v15 = sub_260F95E70(&v45, &v4[2 * v13 + 4], v11 - v13, v9, a2, a3);
  if ((uint64_t)v15 < v9) {
    goto LABEL_15;
  }
  if ((uint64_t)v15 >= 1)
  {
    uint64_t v16 = v4[2];
    BOOL v17 = __OFADD__(v16, v15);
    uint64_t v18 = (char *)v15 + v16;
    if (v17)
    {
      __break(1u);
LABEL_34:
      uint64_t v32 = v38 + v9 + 1;
      goto LABEL_35;
    }
    v4[2] = v18;
  }
  if (v15 != v14)
  {
LABEL_13:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v3 = v4;
    return result;
  }
LABEL_16:
  uint64_t v20 = v48;
  uint64_t v21 = v45;
  if (v48 == v45) {
    goto LABEL_13;
  }
  int64_t v22 = v4[2];
  uint64_t v41 = v46;
  uint64_t v42 = v47;
  uint64_t v43 = v45;
  BOOL v23 = sub_260FCF8D0((uint64_t (*)())v44, v48, v45, v46, v47);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  swift_bridgeObjectRetain();
  uint64_t result = ((uint64_t (*)(unsigned char *, void))v23)(v44, 0);
  uint64_t v27 = v21;
  if (v20 < 0 || v20 >= v21) {
    goto LABEL_37;
  }
  uint64_t v28 = v20 + 1;
  uint64_t v29 = -v21;
LABEL_21:
  while (1)
  {
    unint64_t v30 = v4[3];
    int64_t v31 = v30 >> 1;
    uint64_t v32 = v22 + 1;
    if ((uint64_t)(v30 >> 1) < v22 + 1) {
      break;
    }
    if (v22 < v31) {
      goto LABEL_23;
    }
LABEL_20:
    v4[2] = v22;
  }
  int64_t v4 = sub_260DB118C((void *)(v30 > 1), v22 + 1, 1, v4);
  int64_t v31 = v4[3] >> 1;
  if (v22 >= v31) {
    goto LABEL_20;
  }
LABEL_23:
  int64_t v39 = v31;
  uint64_t v33 = &v4[2 * v22];
  v33[4] = v26;
  v33[5] = v25;
  if (v28 == v27)
  {
LABEL_35:
    v4[2] = v32;
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  uint64_t v40 = v29 + v28;
  int64_t v38 = v22;
  int64_t v34 = ~v22 + v31;
  int v35 = v33 + 7;
  while (1)
  {
    int v36 = sub_260FCF8D0((uint64_t (*)())v44, v28 + v9, v27, v41, v42);
    uint64_t v26 = *v37;
    uint64_t v25 = v37[1];
    swift_bridgeObjectRetain();
    uint64_t result = ((uint64_t (*)(unsigned char *, void))v36)(v44, 0);
    uint64_t v27 = v43;
    if (v28 < 0 || v28 + v9 >= v43) {
      break;
    }
    if (v34 == v9)
    {
      v28 += v9 + 1;
      int64_t v22 = v39;
      uint64_t v29 = -v43;
      v4[2] = v39;
      goto LABEL_21;
    }
    *(v35 - 1) = v26;
    *int v35 = v25;
    ++v9;
    v35 += 2;
    if (!(v40 + v9)) {
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_260FCB7B8(uint64_t result, unint64_t a2)
{
  int64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  int64_t v6 = v5 + result;
  if (__OFADD__(v5, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v8 = result;
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v10 = v4[3] >> 1, v10 < v6))
  {
    if (v5 <= v6) {
      int64_t v11 = v6;
    }
    else {
      int64_t v11 = v5;
    }
    int64_t v4 = sub_260DB17FC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    int64_t v10 = v4[3] >> 1;
  }
  uint64_t v12 = v4[2];
  uint64_t v13 = v10 - v12;
  uint64_t result = (uint64_t)sub_260F95F80(&v38, &v4[v12 + 4], v10 - v12, v8, a2);
  if (result < v8) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
LABEL_34:
      uint64_t v27 = v34 + v3 + 1;
      goto LABEL_35;
    }
    v4[2] = v16;
  }
  if (result != v13)
  {
LABEL_13:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_16:
  uint64_t v17 = v40;
  uint64_t v18 = v38;
  if (v40 == v38) {
    goto LABEL_13;
  }
  int64_t v19 = v4[2];
  uint64_t v36 = v39;
  uint64_t v20 = sub_260FCF92C((uint64_t (*)())v37, v40, v38, v39);
  uint64_t v22 = *v21;
  uint64_t result = ((uint64_t (*)(unsigned char *, void))v20)(v37, 0);
  if (v17 < 0 || v17 >= v18) {
    goto LABEL_37;
  }
  uint64_t v23 = v17 + 1;
  uint64_t v24 = -v18;
LABEL_21:
  while (1)
  {
    unint64_t v25 = v4[3];
    int64_t v26 = v25 >> 1;
    uint64_t v27 = v19 + 1;
    if ((uint64_t)(v25 >> 1) < v19 + 1) {
      break;
    }
    if (v19 < v26) {
      goto LABEL_23;
    }
LABEL_20:
    v4[2] = v19;
  }
  uint64_t result = (uint64_t)sub_260DB17FC((void *)(v25 > 1), v19 + 1, 1, v4);
  int64_t v4 = (void *)result;
  int64_t v26 = *(void *)(result + 24) >> 1;
  if (v19 >= v26) {
    goto LABEL_20;
  }
LABEL_23:
  int64_t v35 = v26;
  uint64_t v28 = &v4[v19];
  v28[4] = v22;
  if (v23 == v18)
  {
LABEL_35:
    v4[2] = v27;
    goto LABEL_13;
  }
  uint64_t v3 = 0;
  uint64_t v29 = v24 + v23;
  int64_t v34 = v19;
  int64_t v30 = ~v19 + v26;
  int64_t v31 = v28 + 5;
  while (1)
  {
    uint64_t v32 = sub_260FCF92C((uint64_t (*)())v37, v23 + v3, v18, v36);
    uint64_t v22 = *v33;
    uint64_t result = ((uint64_t (*)(unsigned char *, void))v32)(v37, 0);
    if (v23 < 0 || v23 + v3 >= v18) {
      break;
    }
    if (v30 == v3)
    {
      v23 += v3 + 1;
      int64_t v19 = v35;
      uint64_t v24 = -v18;
      v4[2] = v35;
      goto LABEL_21;
    }
    v31[v3++] = v22;
    if (!(v29 + v3)) {
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

void __swiftcall BPETokenizer.init(merges:vocabulary:padToken:)(DiffusionBase::BPETokenizer *__return_ptr retstr, Swift::OpaquePointer merges, Swift::OpaquePointer vocabulary, Swift::String padToken)
{
  retstr->merges = merges;
  retstr->vocabulary = vocabulary;
  retstr->padToken = padToken;
  retstr->startToken._countAndFlagsBits = 0x6F74726174737C3CLL;
  retstr->startToken._object = (void *)0xEF3E7C7478657466;
  strcpy((char *)&retstr->endToken, "<|endoftext|>");
  HIWORD(retstr->endToken._object) = -4864;
  strcpy((char *)&retstr->unknownToken, "<|endoftext|>");
  HIWORD(retstr->unknownToken._object) = -4864;
}

uint64_t sub_260FCBA88(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_260FE2A90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v85 = sub_260E5C064();
  unint64_t v86 = v9;
  sub_260FE2A70();
  sub_260D86D20();
  sub_260FE4B10();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_260FE4160();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v85 = 32;
  unint64_t v86 = 0xE100000000000000;
  uint64_t v89 = &v85;
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  uint64_t v14 = sub_260FCCCBC(0x7FFFFFFFFFFFFFFFLL, 1, sub_260FD1538, (uint64_t)v88, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v87 = MEMORY[0x263F8EE78];
  uint64_t v75 = *(void *)(v14 + 16);
  if (!v75)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v74 = v14 + 32;
  v73[1] = v14;
  swift_bridgeObjectRetain();
  uint64_t v15 = 0;
  uint64_t v78 = v1;
LABEL_3:
  uint64_t v76 = v15;
  uint64_t v77 = *(void *)(v74 + 32 * v15 + 24);
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_260FE4AB0();
  if (!v16)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    unint64_t v25 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v25) {
      goto LABEL_18;
    }
LABEL_12:
    int64_t v26 = &v18[2 * v25 - 2];
    unint64_t v27 = v26[5];
    uint64_t v85 = v26[4];
    unint64_t v86 = v27;
    swift_bridgeObjectRetain_n();
    sub_260FE4250();
    swift_bridgeObjectRelease();
    uint64_t v28 = v85;
    unint64_t v29 = v86;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v18 = sub_260F7B4CC(v18);
    }
    if (v25 <= v18[2])
    {
      int64_t v30 = &v18[2 * v25 - 2];
      v30[4] = v28;
      v30[5] = v29;
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
  }
  uint64_t v17 = v16;
  uint64_t v85 = MEMORY[0x263F8EE78];
  sub_260DB45C4(0, v16 & ~(v16 >> 63), 0);
  if (v17 < 0)
  {
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v80 = 0;
  uint64_t v18 = (void *)v85;
  do
  {
    uint64_t v20 = sub_260FE4AC0();
    uint64_t v85 = (uint64_t)v18;
    unint64_t v22 = v18[2];
    unint64_t v21 = v18[3];
    if (v22 >= v21 >> 1)
    {
      uint64_t v24 = v19;
      sub_260DB45C4(v21 > 1, v22 + 1, 1);
      uint64_t v19 = v24;
      uint64_t v18 = (void *)v85;
    }
    v18[2] = v22 + 1;
    uint64_t v23 = &v18[2 * v22];
    v23[4] = v20;
    v23[5] = v19;
    sub_260FE4A90();
    --v17;
  }
  while (v17);
  uint64_t v13 = v80;
  uint64_t v2 = v78;
  unint64_t v25 = v18[2];
  if (v25) {
    goto LABEL_12;
  }
  while (1)
  {
LABEL_18:
    unint64_t v40 = v18[2];
    if (v40 < 2)
    {
      uint64_t v41 = MEMORY[0x263F8EE88];
    }
    else
    {
      uint64_t v80 = v13;
      sub_260FD1590();
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_260FE46F0();
      uint64_t v42 = v18[4];
      uint64_t v81 = v18 + 4;
      uint64_t v43 = v18[5];
      long double v79 = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v44 = 1;
      unint64_t v82 = v40;
      do
      {
        uint64_t v47 = v41 + 56;
        uint64_t v48 = v42;
        uint64_t v49 = v43;
        uint64_t v83 = v41;
        while (1)
        {
          uint64_t v50 = &v81[2 * v44];
          uint64_t v42 = *v50;
          uint64_t v43 = v50[1];
          uint64_t v84 = v44 + 1;
          sub_260FE52F0();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_260FE41D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_260FE41D0();
          swift_bridgeObjectRelease();
          uint64_t v51 = sub_260FE5340();
          uint64_t v52 = -1 << *(unsigned char *)(v41 + 32);
          unint64_t v53 = v51 & ~v52;
          if (((*(void *)(v47 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
            break;
          }
          uint64_t v54 = ~v52;
          uint64_t v55 = *(void *)(v41 + 48);
          while (1)
          {
            uint64_t v56 = (void *)(v55 + 32 * v53);
            uint64_t v58 = v56[2];
            uint64_t v57 = v56[3];
            BOOL v59 = *v56 == v48 && v56[1] == v49;
            if (v59 || (sub_260FE5150() & 1) != 0)
            {
              BOOL v60 = v58 == v42 && v57 == v43;
              if (v60 || (sub_260FE5150() & 1) != 0) {
                break;
              }
            }
            unint64_t v53 = (v53 + 1) & v54;
            if (((*(void *)(v47 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
              goto LABEL_20;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v41 = v83;
          swift_bridgeObjectRelease();
          uint64_t v48 = v42;
          uint64_t v49 = v43;
          uint64_t v44 = v84;
          if (v84 == v82) {
            goto LABEL_36;
          }
        }
LABEL_20:
        uint64_t v45 = v83;
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v85 = v45;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_260FCE9A0(v48, v49, v42, v43, v53, isUniquelyReferenced_nonNull_native);
        uint64_t v41 = v85;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v44 = v84;
      }
      while (v84 != v82);
LABEL_36:
      swift_bridgeObjectRelease();
      uint64_t v18 = v79;
      swift_bridgeObjectRelease_n();
      uint64_t v2 = v78;
      uint64_t v13 = v80;
    }
    uint64_t v61 = v41;
    char v62 = *(unsigned char *)(v41 + 32);
    unsigned int v63 = v62 & 0x3F;
    unint64_t v64 = (unint64_t)((1 << v62) + 63) >> 6;
    size_t v65 = 8 * v64;
    sub_260FD027C((uint64_t)v2);
    sub_260FD027C((uint64_t)v2);
    uint64_t isStackAllocationSafe = sub_260FD027C((uint64_t)v2);
    if (v63 > 0xD)
    {
      uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
      if ((isStackAllocationSafe & 1) == 0) {
        break;
      }
    }
    MEMORY[0x270FA5388](isStackAllocationSafe, v67);
    bzero((char *)v73 - ((v65 + 15) & 0x3FFFFFFFFFFFFFF0), v65);
    sub_260FD027C((uint64_t)v2);
    uint64_t v68 = sub_260FD0844((uint64_t)v73 - ((v65 + 15) & 0x3FFFFFFFFFFFFFF0), v64, v61, (uint64_t)v2);
    if (v13)
    {
      sub_260FD02F4((uint64_t)v2);
      swift_bridgeObjectRelease();
      swift_willThrow();
      goto LABEL_53;
    }
    uint64_t v69 = v68;
    sub_260FD02F4((uint64_t)v2);
    swift_bridgeObjectRelease();
LABEL_44:
    sub_260FD02F4((uint64_t)v2);
    sub_260FD02F4((uint64_t)v2);
    sub_260FD02F4((uint64_t)v2);
    if (!*(void *)(v69 + 16))
    {
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v15 = v76 + 1;
      sub_260FCB3B0((uint64_t)v18);
      if (v15 == v75)
      {
        swift_bridgeObjectRelease_n();
        return v87;
      }
      goto LABEL_3;
    }
    sub_260FD027C((uint64_t)v2);
    uint64_t v31 = sub_260FD0A48(v69, v2);
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    sub_260FD02F4((uint64_t)v2);
    swift_release();
    if (!v33) {
      goto LABEL_50;
    }
    uint64_t v38 = swift_bridgeObjectRetain();
    uint64_t v39 = sub_260FD0FD4(v38, v31, v33, v35, v37);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)v39;
  }
  double v70 = (void *)swift_slowAlloc();
  bzero(v70, v65);
  sub_260FD027C((uint64_t)v2);
  uint64_t v71 = sub_260FD0844((uint64_t)v70, v64, v61, (uint64_t)v2);
  if (!v13)
  {
    uint64_t v69 = v71;
    sub_260FD02F4((uint64_t)v2);
    swift_bridgeObjectRelease();
    MEMORY[0x26122CA00](v70, -1, -1);
    goto LABEL_44;
  }
  sub_260FD02F4((uint64_t)v2);
  swift_bridgeObjectRelease();
  MEMORY[0x26122CA00](v70, -1, -1);
LABEL_53:
  uint64_t result = sub_260FD02F4((uint64_t)v2);
  __break(1u);
  return result;
}

Swift::Int_optional __swiftcall BPETokenizer.tokenID(for:)(Swift::String a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  if (*(void *)(v2 + 16))
  {
    object = a1._object;
    uint64_t countAndFlagsBits = a1._countAndFlagsBits;
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_260DBACB4(countAndFlagsBits, (uint64_t)object);
    if (v6) {
      Swift::Int v7 = *(void *)(*(void *)(v2 + 56) + 8 * v5);
    }
    else {
      Swift::Int v7 = 0;
    }
    char v8 = v6 ^ 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v7 = 0;
    char v8 = 1;
  }
  Swift::Bool v9 = v8 & 1;
  Swift::Int v10 = v7;
  result.value = v10;
  result.is_nil = v9;
  return result;
}

Swift::String_optional __swiftcall BPETokenizer.token(id:)(Swift::Int id)
{
  int64_t v2 = 0;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v3 + 64;
  unint64_t v7 = v5 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      break;
    }
    if (v11 >= v8) {
      goto LABEL_26;
    }
    unint64_t v12 = *(void *)(v6 + 8 * v11);
    ++v2;
    if (!v12)
    {
      int64_t v2 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_26;
      }
      unint64_t v12 = *(void *)(v6 + 8 * v2);
      if (!v12)
      {
        int64_t v2 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_26;
        }
        unint64_t v12 = *(void *)(v6 + 8 * v2);
        if (!v12)
        {
          int64_t v2 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_26;
          }
          unint64_t v12 = *(void *)(v6 + 8 * v2);
          if (!v12)
          {
            int64_t v2 = v11 + 4;
            if (v11 + 4 >= v8) {
              goto LABEL_26;
            }
            unint64_t v12 = *(void *)(v6 + 8 * v2);
            if (!v12)
            {
              int64_t v13 = v11 + 5;
              if (v13 >= v8)
              {
LABEL_26:
                Swift::Int v15 = 0;
                uint64_t v16 = 0;
                goto LABEL_27;
              }
              unint64_t v12 = *(void *)(v6 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v2 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_29;
                  }
                  if (v2 >= v8) {
                    goto LABEL_26;
                  }
                  unint64_t v12 = *(void *)(v6 + 8 * v2);
                  ++v13;
                  if (v12) {
                    goto LABEL_24;
                  }
                }
              }
              int64_t v2 = v13;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v2 << 6);
LABEL_5:
    if (*(void *)(*(void *)(v3 + 56) + 8 * v10) == id)
    {
      uint64_t v14 = (Swift::Int *)(*(void *)(v3 + 48) + 16 * v10);
      Swift::Int v15 = *v14;
      uint64_t v16 = (void *)v14[1];
      swift_bridgeObjectRetain();
LABEL_27:
      id = v15;
      uint64_t v17 = v16;
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  result.value._object = v17;
  result.value._uint64_t countAndFlagsBits = id;
  return result;
}

uint64_t sub_260FCC53C(void *a1, uint64_t a2, char a3)
{
  return BPETokenizer.tokenize(input:minCount:)(a1, a2, a3 & 1);
}

uint64_t BPETokenizer.TokenPair.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  return swift_bridgeObjectRelease();
}

uint64_t static BPETokenizer.TokenPair.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6 || (char v12 = sub_260FE5150(), result = 0, (v12 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_260FE5150();
    }
  }
  return result;
}

uint64_t BPETokenizer.TokenPair.hashValue.getter()
{
  return sub_260FE5340();
}

uint64_t sub_260FCC754()
{
  return sub_260FE5340();
}

uint64_t sub_260FCC7DC()
{
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260FCC860()
{
  return sub_260FE5340();
}

uint64_t sub_260FCC8E4(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_260FE5150(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_260FE5150();
    }
  }
  return result;
}

uint64_t MockedTokenizer.tokenize(input:minCount:)(void *a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB338);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260FFAE30;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0xE000000000000000;
  *(void *)(inited + 48) = &unk_270D22F98;
  *(void *)(inited + 56) = 0xD000000000000014;
  *(void *)(inited + 64) = 0x8000000261002020;
  *(void *)(inited + 72) = &unk_270D22FC8;
  *(void *)(inited + 80) = 0xD000000000000015;
  *(void *)(inited + 88) = 0x8000000261002040;
  *(void *)(inited + 96) = &unk_270D23038;
  *(void *)(inited + 104) = 0xD00000000000001DLL;
  *(void *)(inited + 112) = 0x8000000261002060;
  *(void *)(inited + 120) = &unk_270D230A0;
  *(void *)(inited + 128) = 0xD00000000000002FLL;
  *(void *)(inited + 136) = 0x8000000261002080;
  *(void *)(inited + 144) = &unk_270D23110;
  *(void *)(inited + 152) = 0xD000000000000018;
  *(void *)(inited + 160) = 0x80000002610020B0;
  *(void *)(inited + 168) = &unk_270D23198;
  *(void *)(inited + 176) = 0xD000000000000020;
  *(void *)(inited + 184) = 0x80000002610020D0;
  *(void *)(inited + 192) = &unk_270D23200;
  *(void *)(inited + 200) = 0xD000000000000030;
  *(void *)(inited + 208) = 0x8000000261002100;
  *(void *)(inited + 216) = &unk_270D232C8;
  *(void *)(inited + 224) = 0xD000000000000034;
  *(void *)(inited + 232) = 0x8000000261002140;
  *(void *)(inited + 240) = &unk_270D23368;
  *(void *)(inited + 248) = 0xD000000000000023;
  *(void *)(inited + 256) = 0x8000000261002180;
  *(void *)(inited + 264) = &unk_270D23408;
  unint64_t v11 = sub_260F5BFA4(inited);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260E5C064();
  uint64_t v12 = sub_260FE4160();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  if (*(void *)(v11 + 16) && (unint64_t v15 = sub_260DBACB4(v12, v14), (v16 & 1) != 0))
  {
    uint64_t v17 = *(void *)(*(void *)(v11 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_260EE03A0(v17);
    uint64_t v18 = v26;
    if (a3) {
      goto LABEL_7;
    }
    uint64_t v19 = *(void *)(v26 + 16);
    uint64_t result = a2 - v19;
    if (a2 <= v19) {
      goto LABEL_7;
    }
    if (a2 - v19 >= 0)
    {
      sub_260FCB7B8(result, a4);
      uint64_t v18 = v26;
LABEL_7:
      uint64_t v21 = *(void *)(v18 + 16);
      swift_bridgeObjectRetain();
      sub_260FCB504(v21, a5, a6);
      return v25;
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_260FD0368();
    swift_allocError();
    *unint64_t v22 = 0xD000000000000047;
    v22[1] = 0x80000002610021B0;
    return swift_willThrow();
  }
  return result;
}

Swift::String __swiftcall MockedTokenizer.decode(tokens:)(Swift::OpaquePointer tokens)
{
  uint64_t v1 = 0;
  uint64_t v2 = (void *)0xE000000000000000;
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t sub_260FCCC98(void *a1, uint64_t a2, char a3)
{
  return MockedTokenizer.tokenize(input:minCount:)(a1, a2, a3 & 1, *(void *)v3, *(void *)(v3 + 8), *(void *)(v3 + 16));
}

uint64_t sub_260FCCCBC(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
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
    sub_260FCD160(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_260FE42D0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_260FE4200();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_260FE4200();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_260FE4300();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_260FCDBAC(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_260FCDBAC((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  uint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_260FE4200();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_260FE4300();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_260FCDBAC(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_260FCDBAC((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    unint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_260FE4E10();
  __break(1u);
LABEL_42:
  uint64_t result = sub_260FE4E10();
  __break(1u);
  return result;
}

uint64_t sub_260FCD160(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_260FE4300();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_260FCDBAC(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_260FCDBAC((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_260FE4E10();
  __break(1u);
  return result;
}

char *sub_260FCD2BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAE68);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_260FCF964(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_260FCD3CC(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_260FCD664(a1, a2, a3, a4, &qword_26A8EAB98, &qword_26A8EABA0);
}

uint64_t sub_260FCD3E0(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E84C0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_260FE4E10();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0) - 8);
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
    sub_260FCFBD0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_260FCD650(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_260FCD664(a1, a2, a3, a4, &qword_26A8EAD58, &qword_26A8EB388);
}

void *sub_260FCD664(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = _swift_stdlib_malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      uint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_260FD1320(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void *sub_260FCD780(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB38);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_260DC62E0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_260FCD890(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB40);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_260FCF964(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_260FCD9A0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB370);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_260FCFEC4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_260FCDAB0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E7010);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_260DC61F8(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_260FCDBAC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB368);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_260FD0750(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_260FCDCBC(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_260FCD664(a1, a2, a3, a4, &qword_26A8EB350, &qword_26A8EB290);
}

void *sub_260FCDCD0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB18);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_260FD1428(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_260FCDDF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB380);
  uint64_t v3 = sub_260FE4BE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  unint64_t v6 = (void *)(v2 + 56);
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_38;
    }
    if (v15 >= v9) {
      break;
    }
    unint64_t v16 = v6[v15];
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v9) {
        break;
      }
      unint64_t v16 = v6[v11];
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v9) {
          break;
        }
        unint64_t v16 = v6[v11];
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v9) {
            break;
          }
          unint64_t v16 = v6[v17];
          if (!v16)
          {
            while (1)
            {
              int64_t v11 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_39;
              }
              if (v11 >= v9) {
                goto LABEL_33;
              }
              unint64_t v16 = v6[v11];
              ++v17;
              if (v16) {
                goto LABEL_23;
              }
            }
          }
          int64_t v11 = v17;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_260FE52F0();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_260FE5340();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v20) >> 6;
    do
    {
      if (++v22 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x260FCE20CLL);
      }
      BOOL v25 = v22 == v24;
      if (v22 == v24) {
        unint64_t v22 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v10 + 8 * v22);
    }
    while (v26 == -1);
    unint64_t v12 = __clz(__rbit64(~v26)) + (v22 << 6);
LABEL_7:
    *(void *)(v10 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  swift_release();
  uint64_t v1 = v0;
  uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
  if (v27 > 63) {
    bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v6 = -1 << v27;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_260FCE234()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB360);
  uint64_t v3 = sub_260FE4BE0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      uint64_t v22 = v19[2];
      uint64_t v23 = v19[3];
      sub_260FE52F0();
      swift_bridgeObjectRetain();
      sub_260FE41D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_260FE41D0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_260FE5340();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
      *unint64_t v12 = v20;
      v12[1] = v21;
      v12[2] = v22;
      v12[3] = v23;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_260FCE570(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  unsigned __int8 v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  char v24 = result;
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_260FCDDF4();
    }
    else
    {
      if (v8 > v7)
      {
        uint64_t result = (uint64_t)sub_260FCEB88();
        goto LABEL_37;
      }
      sub_260FCEEE0();
    }
    uint64_t v9 = *v3;
    sub_260FE52F0();
    AppleDiffusionAdapter.rawValue.getter(v6);
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260FE5340();
    uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
    a2 = result & ~v10;
    if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v11 = ~v10;
      uint64_t v12 = v6;
      while (1)
      {
        unint64_t v13 = 0xE90000000000006ELL;
        unint64_t v14 = 0x6F6974616D696E61;
        switch(*(unsigned char *)(*(void *)(v9 + 48) + a2))
        {
          case 1:
            unint64_t v14 = 0xD000000000000016;
            int64_t v15 = "personalized_emoji";
            goto LABEL_18;
          case 2:
            unint64_t v13 = 0xE500000000000000;
            unint64_t v14 = 0x696A6F6D65;
            break;
          case 3:
            unint64_t v13 = 0x8000000260FFC230;
            unint64_t v14 = 0xD000000000000012;
            break;
          case 4:
            unint64_t v14 = 0x61727473756C6C69;
            unint64_t v13 = 0xEC0000006E6F6974;
            break;
          case 5:
            unint64_t v14 = 0xD000000000000019;
            int64_t v15 = "personalized_sketch";
            goto LABEL_18;
          case 6:
            unint64_t v13 = 0xE600000000000000;
            unint64_t v14 = 0x686374656B73;
            break;
          case 7:
            unint64_t v14 = 0xD000000000000013;
            int64_t v15 = "personalized_style_scribble";
            goto LABEL_18;
          case 8:
            unint64_t v14 = 0x63735F656C797473;
            unint64_t v13 = 0xEE00656C62626972;
            break;
          case 9:
            unint64_t v14 = 0xD00000000000001BLL;
            int64_t v15 = "with negative count";
LABEL_18:
            unint64_t v13 = (unint64_t)v15 | 0x8000000000000000;
            break;
          default:
            break;
        }
        unint64_t v16 = 0x6F6974616D696E61;
        unint64_t v17 = 0xE90000000000006ELL;
        switch(v12)
        {
          case 1:
            unint64_t v16 = 0xD000000000000016;
            uint64_t v18 = "personalized_emoji";
            goto LABEL_28;
          case 2:
            unint64_t v17 = 0xE500000000000000;
            unint64_t v16 = 0x696A6F6D65;
            break;
          case 3:
            unint64_t v17 = 0x8000000260FFC230;
            unint64_t v16 = 0xD000000000000012;
            break;
          case 4:
            unint64_t v16 = 0x61727473756C6C69;
            unint64_t v17 = 0xEC0000006E6F6974;
            break;
          case 5:
            unint64_t v16 = 0xD000000000000019;
            uint64_t v18 = "personalized_sketch";
            goto LABEL_28;
          case 6:
            unint64_t v17 = 0xE600000000000000;
            unint64_t v16 = 0x686374656B73;
            break;
          case 7:
            unint64_t v16 = 0xD000000000000013;
            uint64_t v18 = "personalized_style_scribble";
            goto LABEL_28;
          case 8:
            unint64_t v16 = 0x63735F656C797473;
            unint64_t v17 = 0xEE00656C62626972;
            break;
          case 9:
            unint64_t v16 = 0xD00000000000001BLL;
            uint64_t v18 = "with negative count";
LABEL_28:
            unint64_t v17 = (unint64_t)v18 | 0x8000000000000000;
            break;
          default:
            break;
        }
        if (v14 == v16 && v13 == v17) {
          break;
        }
        char v19 = sub_260FE5150();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v19) {
          goto LABEL_41;
        }
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_37;
        }
      }
LABEL_40:
      swift_bridgeObjectRelease_n();
LABEL_41:
      sub_260FE5270();
      __break(1u);
      JUMPOUT(0x260FCE950);
    }
  }
LABEL_37:
  uint64_t v20 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v20 + 48) + a2) = v24;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
    goto LABEL_40;
  }
  *(void *)(v20 + 16) = v23;
  return result;
}

uint64_t sub_260FCE9A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v11 = result;
  unint64_t v12 = *(void *)(*v6 + 16);
  unint64_t v13 = *(void *)(*v6 + 24);
  if (v13 > v12 && (a6 & 1) != 0) {
    goto LABEL_22;
  }
  if (a6)
  {
    sub_260FCE234();
  }
  else
  {
    if (v13 > v12)
    {
      uint64_t result = (uint64_t)sub_260FCED1C();
      goto LABEL_22;
    }
    sub_260FCF2EC();
  }
  uint64_t v14 = *v6;
  sub_260FE52F0();
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_260FE5340();
  uint64_t v15 = -1 << *(unsigned char *)(v14 + 32);
  a5 = result & ~v15;
  uint64_t v16 = v14 + 56;
  if ((*(void *)(v14 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
  {
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v14 + 48);
    while (1)
    {
      char v19 = (void *)(v18 + 32 * a5);
      uint64_t v20 = v19[2];
      uint64_t v21 = v19[3];
      BOOL v22 = *v19 == v11 && v19[1] == a2;
      if (v22 || (uint64_t result = sub_260FE5150(), (result & 1) != 0))
      {
        if (v20 == a3 && v21 == a4) {
          break;
        }
        uint64_t result = sub_260FE5150();
        if (result) {
          break;
        }
      }
      a5 = (a5 + 1) & v17;
      if (((*(void *)(v16 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) == 0) {
        goto LABEL_22;
      }
    }
    uint64_t result = sub_260FE5270();
    __break(1u);
  }
LABEL_22:
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  unint64_t v25 = (uint64_t *)(*(void *)(v24 + 48) + 32 * a5);
  *unint64_t v25 = v11;
  v25[1] = a2;
  v25[2] = a3;
  v25[3] = a4;
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
  return result;
}

void *sub_260FCEB88()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB380);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260FE4BD0();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_260FCED1C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB360);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260FE4BD0();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_260FCEEE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB380);
  uint64_t v3 = sub_260FE4BE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_35;
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      break;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v9) {
        break;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v9) {
          break;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v9) {
            break;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v17);
          if (!v16)
          {
            while (1)
            {
              int64_t v11 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_37;
              }
              if (v11 >= v9) {
                goto LABEL_33;
              }
              unint64_t v16 = *(void *)(v6 + 8 * v11);
              ++v17;
              if (v16) {
                goto LABEL_23;
              }
            }
          }
          int64_t v11 = v17;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_260FE52F0();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_260FE5340();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v20) >> 6;
    do
    {
      if (++v22 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        JUMPOUT(0x260FCF2C4);
      }
      BOOL v25 = v22 == v24;
      if (v22 == v24) {
        unint64_t v22 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v10 + 8 * v22);
    }
    while (v26 == -1);
    unint64_t v12 = __clz(__rbit64(~v26)) + (v22 << 6);
LABEL_7:
    *(void *)(v10 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  uint64_t result = swift_release_n();
  uint64_t v1 = v0;
LABEL_35:
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_260FCF2EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB360);
  uint64_t v3 = sub_260FE4BE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v30 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    char v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    sub_260FE52F0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260FE5340();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    v12[2] = v21;
    v12[3] = v22;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v30 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_260FCF5F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB360);
  uint64_t result = sub_260FE4BF0();
  uint64_t v8 = result;
  uint64_t v32 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  uint64_t v34 = v4;
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
    if (v14 >= v32) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v32) {
          goto LABEL_36;
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
    int64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 32 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = v17[2];
    uint64_t v21 = v17[3];
    sub_260FE52F0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_260FE41D0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260FE5340();
    uint64_t v22 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = (void *)(*(void *)(v8 + 48) + 32 * v25);
    *uint64_t v30 = v18;
    v30[1] = v19;
    v30[2] = v20;
    v30[3] = v21;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    uint64_t v4 = v34;
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v32) {
    goto LABEL_36;
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
    if (v10 >= v32) {
      goto LABEL_36;
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

uint64_t (*sub_260FCF8D0(uint64_t (*result)(), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))()
{
  if (a2 < 0 || a2 >= a3)
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t result = a4;
    *((void *)result + 1) = a5;
    swift_bridgeObjectRetain();
    return destroy for ClientIdentity;
  }
  return result;
}

uint64_t (*sub_260FCF92C(uint64_t (*result)(), uint64_t a2, uint64_t a3, uint64_t a4))()
{
  if (a2 < 0 || a2 >= a3)
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t result = a4;
    return nullsub_1;
  }
  return result;
}

char *sub_260FCF964(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FCFA50(uint64_t a1, void *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_260DB4728(0, v2, 0);
    uint64_t v3 = v20;
    uint64_t v6 = a2[1];
    for (unint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v8 = *i;
      if (!*(void *)(v6 + 16)) {
        break;
      }
      uint64_t v9 = *(i - 1);
      swift_bridgeObjectRetain();
      unint64_t v10 = sub_260DBACB4(v9, v8);
      if ((v11 & 1) == 0)
      {
        if (*(void *)(v6 + 16))
        {
          uint64_t v13 = a2[8];
          uint64_t v14 = a2[9];
          swift_bridgeObjectRetain();
          unint64_t v15 = sub_260DBACB4(v13, v14);
          if (v16)
          {
            uint64_t v12 = *(void *)(*(void *)(v6 + 56) + 8 * v15);
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v12 = 0;
          }
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      uint64_t v12 = *(void *)(*(void *)(v6 + 56) + 8 * v10);
LABEL_11:
      swift_bridgeObjectRelease();
      unint64_t v18 = *(void *)(v20 + 16);
      unint64_t v17 = *(void *)(v20 + 24);
      if (v18 >= v17 >> 1) {
        sub_260DB4728(v17 > 1, v18 + 1, 1);
      }
      *(void *)(v20 + 16) = v18 + 1;
      *(void *)(v20 + 8 * v18 + 32) = v12;
      if (!--v2) {
        return v3;
      }
    }
    swift_bridgeObjectRetain();
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  return v3;
}

uint64_t sub_260FCFBD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0) - 8);
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
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

void *sub_260FCFD2C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v7 = *(void **)v4;
  int64_t v8 = *(void *)(*(void *)v4 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v9 > v7[3] >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      uint64_t result = sub_260DB17FC(result, v13, 1, v7);
      unint64_t v7 = result;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6) {
    goto LABEL_25;
  }
  if (v6 < 0) {
    goto LABEL_27;
  }
  unint64_t v15 = (char *)&v7[v14 + 4];
  char v16 = (char *)(a2 + 8 * a3);
  if (v16 < &v15[8 * v6] && v15 < &v16[8 * v6]) {
    goto LABEL_27;
  }
  uint64_t result = memcpy(v15, v16, 8 * v6);
  if (!v6)
  {
LABEL_22:
    *(void *)uint64_t v4 = v7;
    return result;
  }
  uint64_t v18 = v7[2];
  BOOL v19 = __OFADD__(v18, v6);
  uint64_t v20 = v18 + v6;
  if (!v19)
  {
    v7[2] = v20;
    goto LABEL_22;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  uint64_t result = (void *)sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FCFEC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB378);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FCFFD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = sub_260FB5640();
  if (v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_260FE2F90();
    int64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    v13(a2, v12);
    v13(a1, v12);
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = v11;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_260FE2FB0();
    unint64_t v21 = v17;
    uint64_t v18 = v16;
    sub_260FE29B0();
    swift_allocObject();
    sub_260FE29A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAC60);
    sub_260F6AD60();
    sub_260FE2980();
    sub_260DCC110(v18, v21);
    swift_release();
    uint64_t v19 = sub_260FE2F90();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
    v20(a2, v19);
    v20(a1, v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a5 = v15;
    *(void *)(a5 + 8) = v22;
    *(void *)(a5 + 16) = a3;
    *(void *)(a5 + 24) = a4;
    *(void *)(a5 + 32) = 0x6F74726174737C3CLL;
    *(void *)(a5 + 40) = 0xEF3E7C7478657466;
    strcpy((char *)(a5 + 48), "<|endoftext|>");
    *(_WORD *)(a5 + 62) = -4864;
    strcpy((char *)(a5 + 64), "<|endoftext|>");
    *(_WORD *)(a5 + 78) = -4864;
  }
  return result;
}

uint64_t sub_260FD027C(uint64_t a1)
{
  return a1;
}

uint64_t sub_260FD02F4(uint64_t a1)
{
  return a1;
}

unint64_t sub_260FD0368()
{
  unint64_t result = qword_26A8EB340;
  if (!qword_26A8EB340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB340);
  }
  return result;
}

unint64_t sub_260FD03C0()
{
  unint64_t result = qword_26A8EB348;
  if (!qword_26A8EB348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB348);
  }
  return result;
}

uint64_t destroy for BPETokenizer()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BPETokenizer(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BPETokenizer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for BPETokenizer(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BPETokenizer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BPETokenizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BPETokenizer()
{
  return &type metadata for BPETokenizer;
}

ValueMetadata *type metadata accessor for BPETokenizer.TokenPair()
{
  return &type metadata for BPETokenizer.TokenPair;
}

ValueMetadata *type metadata accessor for MockedTokenizer()
{
  return &type metadata for MockedTokenizer;
}

ValueMetadata *type metadata accessor for TokenizerError()
{
  return &type metadata for TokenizerError;
}

uint64_t sub_260FD0750(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FD0844(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v23 = (unint64_t *)result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
LABEL_4:
  uint64_t v24 = v5;
  while (1)
  {
    if (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_18;
    }
    if (__OFADD__(v6++, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v6 >= v26) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v7 + 8 * v6);
    if (!v14) {
      break;
    }
LABEL_17:
    unint64_t v10 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v6 << 6);
LABEL_18:
    if (*(void *)(*(void *)a4 + 16))
    {
      uint64_t v16 = (uint64_t *)(*(void *)(a3 + 48) + 32 * v12);
      uint64_t v17 = v16[2];
      uint64_t v18 = v16[3];
      uint64_t v19 = *v16;
      uint64_t v20 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_260F80D6C(v19, v20, v17, v18);
      LOBYTE(v19) = v21;
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v19)
      {
        *(unint64_t *)((char *)v23 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        uint64_t v5 = v24 + 1;
        if (!__OFADD__(v24, 1)) {
          goto LABEL_4;
        }
        __break(1u);
LABEL_28:
        swift_retain();
        return sub_260FCF5F4(v23, a2, v24, a3);
      }
    }
  }
  int64_t v15 = v6 + 1;
  if (v6 + 1 >= v26) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v7 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v6 + 2;
  if (v6 + 2 >= v26) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v7 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v6 + 3;
  if (v6 + 3 >= v26) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v7 + 8 * v15);
  if (v14)
  {
LABEL_16:
    int64_t v6 = v15;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v6 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v6 >= v26) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v7 + 8 * v6);
    ++v15;
    if (v14) {
      goto LABEL_17;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_260FD0A48(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (void *)a1;
  uint64_t v35 = a1 + 56;
  char v3 = *(unsigned char *)(a1 + 32);
  uint64_t v4 = 1 << v3;
  uint64_t v5 = -1;
  if (1 << v3 < 64) {
    uint64_t v5 = ~(-1 << (1 << v3));
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v6));
    unint64_t v9 = (v6 - 1) & v6;
    int64_t v36 = (unint64_t)(v4 + 63) >> 6;
  }
  else
  {
    unsigned int v13 = v3 & 0x3F;
    if (v13 <= 6) {
      return 0;
    }
    int64_t v36 = (unint64_t)(v4 + 63) >> 6;
    unint64_t v30 = *(void *)(a1 + 64);
    if (v30)
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (v13 < 8) {
        return 0;
      }
      unint64_t v30 = *(void *)(a1 + 72);
      if (v30)
      {
        uint64_t v7 = 2;
      }
      else
      {
LABEL_41:
        unint64_t v30 = v2[10];
        if (v30)
        {
          uint64_t v7 = 3;
        }
        else
        {
LABEL_44:
          if (v13 < 9) {
            return 0;
          }
          unint64_t v30 = v2[11];
          if (v30)
          {
            uint64_t v7 = 4;
          }
          else
          {
            unint64_t v30 = v2[12];
            if (!v30) {
              goto LABEL_50;
            }
            uint64_t v7 = 5;
          }
        }
      }
    }
LABEL_35:
    unint64_t v9 = (v30 - 1) & v30;
    unint64_t v8 = __clz(__rbit64(v30)) + (v7 << 6);
  }
  unint64_t v10 = (uint64_t *)(v2[6] + 32 * v8);
  uint64_t v11 = v10[1];
  uint64_t v12 = v10[3];
  uint64_t v39 = v10[2];
  uint64_t v40 = *v10;
  swift_bridgeObjectRetain();
  uint64_t v42 = v11;
  swift_bridgeObjectRetain();
  uint64_t v41 = v12;
  swift_bridgeObjectRetain();
  for (i = v2; ; uint64_t v2 = i)
  {
    if (v9)
    {
      unint64_t v14 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v15 = v14 | (v7 << 6);
      goto LABEL_25;
    }
    int64_t v16 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v16 >= v36) {
      goto LABEL_31;
    }
    unint64_t v17 = *(void *)(v35 + 8 * v16);
    ++v7;
    if (!v17)
    {
      uint64_t v7 = v16 + 1;
      if (v16 + 1 >= v36) {
        goto LABEL_31;
      }
      unint64_t v17 = *(void *)(v35 + 8 * v7);
      if (!v17)
      {
        uint64_t v7 = v16 + 2;
        if (v16 + 2 >= v36) {
          goto LABEL_31;
        }
        unint64_t v17 = *(void *)(v35 + 8 * v7);
        if (!v17)
        {
          uint64_t v7 = v16 + 3;
          if (v16 + 3 >= v36) {
            goto LABEL_31;
          }
          unint64_t v17 = *(void *)(v35 + 8 * v7);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_24:
    unsigned int v13 = v17 - 1;
    unint64_t v9 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v7 << 6);
LABEL_25:
    uint64_t v19 = *a2;
    if (!*(void *)(*a2 + 16))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    uint64_t v20 = (uint64_t *)(v2[6] + 32 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v24 = v20[2];
    uint64_t v23 = v20[3];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v25 = sub_260F80D6C(v21, v22, v24, v23);
    if ((v26 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_59:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    uint64_t v2 = *(void **)(*(void *)(v19 + 56) + 8 * v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(v19 + 16)) {
      goto LABEL_40;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v27 = sub_260F80D6C(v40, v42, v39, v41);
    if ((v28 & 1) == 0) {
      goto LABEL_59;
    }
    uint64_t v29 = *(void *)(*(void *)(v19 + 56) + 8 * v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((uint64_t)v2 < v29)
    {
      uint64_t v41 = v23;
      uint64_t v42 = v22;
      uint64_t v39 = v24;
      uint64_t v40 = v21;
    }
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v36)
  {
LABEL_31:
    swift_release();
    return v40;
  }
  unint64_t v17 = *(void *)(v35 + 8 * v18);
  if (v17)
  {
    uint64_t v7 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v7 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v7 >= v36) {
      goto LABEL_31;
    }
    unint64_t v17 = *(void *)(v35 + 8 * v7);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_50:
  uint64_t v31 = 0;
  uint64_t v32 = 6;
  if (v36 > 6) {
    uint64_t v32 = v36;
  }
  uint64_t v33 = v32 - 6;
  while (v33 != v31)
  {
    unint64_t v30 = v2[v31++ + 13];
    if (v30)
    {
      uint64_t v7 = v31 + 5;
      goto LABEL_35;
    }
  }
  return 0;
}

void *sub_260FD0E30(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = *(void **)v4;
  int64_t v8 = *(void *)(*(void *)v4 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v9 > v7[3] >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      uint64_t result = sub_260DB118C(result, v13, 1, v7);
      uint64_t v7 = result;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6) {
    goto LABEL_25;
  }
  if (v6 < 0) {
    goto LABEL_27;
  }
  unint64_t v15 = (unint64_t)&v7[2 * v14 + 4];
  unint64_t v16 = a2 + 16 * a3;
  if (v16 < v15 + 16 * v6 && v15 < v16 + 16 * v6) {
    goto LABEL_27;
  }
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v6)
  {
LABEL_22:
    *(void *)uint64_t v4 = v7;
    return result;
  }
  uint64_t v18 = v7[2];
  BOOL v19 = __OFADD__(v18, v6);
  uint64_t v20 = v18 + v6;
  if (!v19)
  {
    v7[2] = v20;
    goto LABEL_22;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  uint64_t result = (void *)sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FD0FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int64_t v5 = *(void *)(a1 + 16);
  if ((unint64_t)v5 < 2)
  {
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v35 = sub_260DB118C(0, v5 - 1, 0, MEMORY[0x263F8EE78]);
    uint64_t v11 = a1 + 32;
    uint64_t v33 = a5;
    while (1)
    {
      uint64_t v14 = (uint64_t *)(v11 + 16 * v10);
      uint64_t result = *v14;
      BOOL v16 = *v14 == a2 && v14[1] == a3;
      int64_t v17 = v10;
      if (!v16)
      {
        uint64_t result = sub_260FE5150();
        int64_t v17 = v10;
        if ((result & 1) == 0)
        {
          int64_t v17 = v10 + 1;
          if (v10 + 1 == v5)
          {
LABEL_45:
            uint64_t v32 = swift_bridgeObjectRetain();
            sub_260FD0E30(v32, v11, v10, (2 * v5) | 1);
            swift_unknownObjectRelease();
            return (uint64_t)v35;
          }
          if (v10 + 1 >= v5) {
            goto LABEL_53;
          }
          uint64_t v18 = (uint64_t *)(v11 + 16 * v17);
          uint64_t result = *v18;
          if (*v18 != a2 || v18[1] != a3)
          {
            uint64_t result = sub_260FE5150();
            if ((result & 1) == 0) {
              break;
            }
          }
        }
      }
LABEL_26:
      if (v5 < v17)
      {
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
      if (v17 < 0) {
        goto LABEL_49;
      }
      uint64_t v23 = swift_bridgeObjectRetain();
      uint64_t result = (uint64_t)sub_260FD0E30(v23, v11, v10, (2 * v17) | 1);
      if (v10 >= v5 - 1) {
        goto LABEL_40;
      }
      if (v17 + 1 >= v5) {
        goto LABEL_52;
      }
      uint64_t v24 = (void *)(v11 + 16 * (v17 + 1));
      BOOL v25 = *v24 == a4 && v24[1] == a5;
      if (v25 || (sub_260FE5150() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        sub_260FE4250();
        char v26 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v26 = sub_260DB118C(0, v35[2] + 1, 1, v35);
        }
        unint64_t v28 = v26[2];
        unint64_t v27 = v26[3];
        if (v28 >= v27 >> 1) {
          char v26 = sub_260DB118C((void *)(v27 > 1), v28 + 1, 1, v26);
        }
        v26[2] = v28 + 1;
        uint64_t v29 = &v26[2 * v28];
        v29[4] = a2;
        v29[5] = a3;
        swift_bridgeObjectRelease();
        uint64_t v13 = 2;
      }
      else
      {
LABEL_40:
        char v26 = v35;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v26 = sub_260DB118C(0, v35[2] + 1, 1, v35);
        }
        unint64_t v31 = v26[2];
        unint64_t v30 = v26[3];
        if (v31 >= v30 >> 1) {
          char v26 = sub_260DB118C((void *)(v30 > 1), v31 + 1, 1, v26);
        }
        v26[2] = v31 + 1;
        uint64_t v12 = &v26[2 * v31];
        v12[4] = a2;
        v12[5] = a3;
        swift_bridgeObjectRelease();
        uint64_t v13 = 1;
      }
      uint64_t v35 = v26;
      uint64_t v10 = v17 + v13;
      a5 = v33;
      if (v17 + v13 >= v5) {
        return (uint64_t)v26;
      }
    }
    while (1)
    {
      int64_t v20 = v17 + 1;
      if (__OFADD__(v17, 1)) {
        break;
      }
      if (v20 == v5) {
        goto LABEL_45;
      }
      if (v20 >= v5) {
        goto LABEL_51;
      }
      uint64_t v21 = (uint64_t *)(v11 + 16 * v20);
      uint64_t result = *v21;
      if (*v21 != a2 || v21[1] != a3)
      {
        uint64_t result = sub_260FE5150();
        ++v17;
        if ((result & 1) == 0) {
          continue;
        }
      }
      int64_t v17 = v20;
      if (v20 >= v10) {
        goto LABEL_26;
      }
      __break(1u);
      goto LABEL_48;
    }
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
  }
  return result;
}

uint64_t sub_260FD1320(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FD1428(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAB20);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_260FE4E90();
  __break(1u);
  return result;
}

uint64_t sub_260FD1538(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_260FE5150() & 1;
  }
}

unint64_t sub_260FD1590()
{
  unint64_t result = qword_26A8EB358;
  if (!qword_26A8EB358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB358);
  }
  return result;
}

uint64_t sub_260FD15E4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260FD161C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t AppleDiffusionAdapter.rawValue.getter(char a1)
{
  unint64_t result = 0x6F6974616D696E61;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x696A6F6D65;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0x61727473756C6C69;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0x686374656B73;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0x63735F656C797473;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

void *static AppleDiffusionAdapter.allCases.getter()
{
  return &unk_270D22AA8;
}

uint64_t sub_260FD1794(char a1)
{
  AppleDiffusionAdapter.rawValue.getter(a1);
  swift_bridgeObjectRetain();
  sub_260FE42F0();
  sub_260FE4240();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_260FE42F0();
  sub_260FE4240();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_260FD189C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = AppleDiffusionAdapter.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == AppleDiffusionAdapter.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260FD1928()
{
  char v1 = *v0;
  sub_260FE52F0();
  AppleDiffusionAdapter.rawValue.getter(v1);
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  return sub_260FE5340();
}

uint64_t sub_260FD198C()
{
  AppleDiffusionAdapter.rawValue.getter(*v0);
  sub_260FE41D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260FD19E0()
{
  char v1 = *v0;
  sub_260FE52F0();
  AppleDiffusionAdapter.rawValue.getter(v1);
  sub_260FE41D0();
  swift_bridgeObjectRelease();
  return sub_260FE5340();
}

uint64_t sub_260FD1A40@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s13DiffusionBase05AppleA7AdapterO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_260FD1A70@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AppleDiffusionAdapter.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_260FD1A9C(void *a1@<X8>)
{
  *a1 = &unk_270D22AA8;
}

DiffusionBase::AppleDiffusionAdapter_optional __swiftcall AppleDiffusionAdapter.init(modelCatalogInferenceAssetIdentifier:)(Swift::String modelCatalogInferenceAssetIdentifier)
{
  object = modelCatalogInferenceAssetIdentifier._object;
  uint64_t countAndFlagsBits = modelCatalogInferenceAssetIdentifier._countAndFlagsBits;
  sub_260FE3320();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v3 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    goto LABEL_20;
  }
  char v5 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v5)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_260FE32D0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v6 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    goto LABEL_23;
  }
  char v8 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v8)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)1;
  }
  sub_260FE32F0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v9 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    goto LABEL_25;
  }
  char v11 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v11)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)2;
  }
  sub_260FE32A0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v12 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_27:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)3;
  }
  char v15 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v15) {
    goto LABEL_27;
  }
  sub_260FE3290();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v16 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_32:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)4;
  }
  char v17 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v17) {
    goto LABEL_32;
  }
  sub_260FE32E0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v18 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_37:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)5;
  }
  char v19 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v19) {
    goto LABEL_37;
  }
  sub_260FE3300();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v20 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_42:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)6;
  }
  char v21 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v21) {
    goto LABEL_42;
  }
  sub_260FE32B0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v22 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_47:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)7;
  }
  char v23 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v23) {
    goto LABEL_47;
  }
  sub_260FE3310();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v24 == object)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_52:
    swift_bridgeObjectRelease();
    return (DiffusionBase::AppleDiffusionAdapter_optional)8;
  }
  char v25 = sub_260FE5150();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  if (v25) {
    goto LABEL_52;
  }
  sub_260FE32C0();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  if (sub_260FE3380() == countAndFlagsBits && v26 == object)
  {
    swift_bridgeObjectRelease_n();
    v13.value = DiffusionBase_AppleDiffusionAdapter_personalized_style_scribble;
  }
  else
  {
    char v27 = sub_260FE5150();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      v13.value = DiffusionBase_AppleDiffusionAdapter_personalized_style_scribble;
    }
    else {
      v13.value = DiffusionBase_AppleDiffusionAdapter_unknownDefault;
    }
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v13;
}

uint64_t AppleDiffusionAdapter.modelCatalogResourceBundleIdentifier.getter(char a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB390);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FD2150(a1);
  uint64_t v7 = sub_260FE33E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v7;
}

uint64_t sub_260FD2150(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = sub_260FE3220();
      break;
    case 2:
      uint64_t result = sub_260FE3240();
      break;
    case 3:
      uint64_t result = sub_260FE31F0();
      break;
    case 4:
      uint64_t result = sub_260FE31E0();
      break;
    case 5:
      uint64_t result = sub_260FE3230();
      break;
    case 6:
      uint64_t result = sub_260FE3250();
      break;
    case 7:
      uint64_t result = sub_260FE3200();
      break;
    case 8:
      uint64_t result = sub_260FE31C0();
      break;
    case 9:
      uint64_t result = sub_260FE3210();
      break;
    default:
      uint64_t result = sub_260FE31D0();
      break;
  }
  return result;
}

uint64_t AppleDiffusionAdapter.modelCatalogInferenceAssetIdentifier.getter(char a1)
{
  sub_260FD222C(a1);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  uint64_t v1 = sub_260FE3380();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
  return v1;
}

uint64_t sub_260FD222C(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = sub_260FE32D0();
      break;
    case 2:
      uint64_t result = sub_260FE32F0();
      break;
    case 3:
      uint64_t result = sub_260FE32A0();
      break;
    case 4:
      uint64_t result = sub_260FE3290();
      break;
    case 5:
      uint64_t result = sub_260FE32E0();
      break;
    case 6:
      uint64_t result = sub_260FE3300();
      break;
    case 7:
      uint64_t result = sub_260FE32B0();
      break;
    case 8:
      uint64_t result = sub_260FE3310();
      break;
    case 9:
      uint64_t result = sub_260FE32C0();
      break;
    default:
      uint64_t result = sub_260FE3320();
      break;
  }
  return result;
}

uint64_t sub_260FD22A0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB390);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  char v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_260FD2150(a1);
  sub_260FE3370();
  swift_allocObject();
  sub_260FE3360();
  sub_260FE33E0();
  sub_260FE3350();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_260FD3C0C((uint64_t)&v15, (uint64_t)v13);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3D0);
    uint64_t v9 = sub_260FE3400();
    int v10 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, v10 ^ 1u, 1, v9);
  }
  else
  {
    sub_260D90820((uint64_t)v13, &qword_26A8EB3C8);
    uint64_t v12 = sub_260FE3400();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 1, 1, v12);
  }
}

uint64_t sub_260FD24E0@<X0>(void (*a1)(char *, uint64_t)@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v5 = sub_260FE2F90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v43 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_260FE3420();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v42 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3D8);
  MEMORY[0x270FA5388](v12 - 8, v13);
  long long v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B0);
  uint64_t v48 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46, v16);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B8);
  MEMORY[0x270FA5388](v19 - 8, v20);
  uint64_t v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_260FE3400();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23, v25);
  char v27 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FD22A0(a2, (uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_260D90820((uint64_t)v22, &qword_26A8EB3B8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a3, 1, 1, v5);
  }
  uint64_t v40 = v6;
  uint64_t v41 = a3;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v27, v22, v23);
  sub_260FE33F0();
  if (v50)
  {
    uint64_t v39 = v5;
    sub_260DD7B40(&v49, (uint64_t)v51);
    __swift_project_boxed_opaque_existential_1(v51, v51[3]);
    sub_260FE33B0();
    uint64_t v30 = v48;
    uint64_t v31 = v46;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v15, 0, 1, v46);
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v18, v15, v31);
    uint64_t v32 = v42;
    uint64_t v33 = sub_260FE3340();
    uint64_t v34 = v43;
    MEMORY[0x261229C60](v33);
    uint64_t v47 = *(void (**)(char *, uint64_t))(v44 + 8);
    v47(v32, v45);
    char v35 = sub_260FE2EC0();
    uint64_t v36 = v40;
    uint64_t v37 = v34;
    uint64_t v5 = v39;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    if (v35)
    {
      uint64_t v38 = sub_260FE3340();
      MEMORY[0x261229C60](v38);
      v47(v32, v45);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v31);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v41, 0, 1, v5);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v31);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
    uint64_t v29 = v41;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    sub_260D90820((uint64_t)&v49, &qword_26A8EB3C0);
    uint64_t v36 = v40;
    uint64_t v29 = v41;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 56))(v29, 1, 1, v5);
}

uint64_t sub_260FD2AD0@<X0>(void (*a1)(char *, uint64_t)@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_260FE2ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E7588);
  MEMORY[0x270FA5388](v11 - 8, v12);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FD24E0(a1, a2, (uint64_t)v14);
  uint64_t v15 = sub_260FE2F90();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_260D90820((uint64_t)v14, &qword_26A8E7588);
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v18 = sub_260FD1794(a2);
    uint64_t v23 = a3;
    uint64_t v26 = v18;
    unint64_t v27 = v19;
    uint64_t v24 = 0xD00000000000001BLL;
    unint64_t v25 = 0x8000000261001E00;
    uint64_t v24 = sub_260FE42F0();
    unint64_t v25 = v20;
    sub_260FE4240();
    a3 = v23;
    swift_bridgeObjectRelease();
    uint64_t v26 = v24;
    unint64_t v27 = v25;
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F06E38], v6);
    sub_260D86D20();
    sub_260FE2F70();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    uint64_t v17 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a3, v17, 1, v15);
}

uint64_t sub_260FD2D90(uint64_t a1, char a2)
{
  uint64_t v27 = a1;
  uint64_t v3 = sub_260FE33A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B0);
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B8);
  MEMORY[0x270FA5388](v12 - 8, v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_260FE3400();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  unint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FD22A0(a2, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    uint64_t v21 = &qword_26A8EB3B8;
    uint64_t v22 = (long long *)v15;
LABEL_6:
    sub_260D90820((uint64_t)v22, v21);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v15, v16);
  sub_260FE33F0();
  if (!v29)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    uint64_t v21 = &qword_26A8EB3C0;
    uint64_t v22 = &v28;
    goto LABEL_6;
  }
  uint64_t v25 = v4;
  sub_260DD7B40(&v28, (uint64_t)v30);
  __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  sub_260FE33B0();
  sub_260FE3330();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v8);
  uint64_t v23 = sub_260FE3390();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  return v23;
}

uint64_t sub_260FD3128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = _s13DiffusionBase05AppleA7AdapterO36modelCatalogResourceBundleIdentifierACSgSS_tcfC_0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_260FD3150()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB390);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FD2150(*v0);
  uint64_t v6 = sub_260FE33E0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return v6;
}

uint64_t _s13DiffusionBase05AppleA7AdapterO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_260FE4EC0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t _s13DiffusionBase05AppleA7AdapterO36modelCatalogResourceBundleIdentifierACSgSS_tcfC_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB390);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v90 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v91 = (char *)&v89 - v10;
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v92 = (char *)&v89 - v13;
  MEMORY[0x270FA5388](v14, v15);
  long long v93 = (char *)&v89 - v16;
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v94 = (char *)&v89 - v19;
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v95 = (char *)&v89 - v22;
  MEMORY[0x270FA5388](v23, v24);
  uint64_t v26 = (char *)&v89 - v25;
  MEMORY[0x270FA5388](v27, v28);
  uint64_t v30 = (char *)&v89 - v29;
  MEMORY[0x270FA5388](v31, v32);
  uint64_t v34 = (char *)&v89 - v33;
  MEMORY[0x270FA5388](v35, v36);
  uint64_t v38 = (char *)&v89 - v37;
  sub_260FE31D0();
  uint64_t v39 = sub_260FE33E0();
  uint64_t v41 = v40;
  uint64_t v96 = *(void (**)(char *, uint64_t))(v5 + 8);
  v96(v38, v4);
  if (v39 == a1 && v41 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v43 = sub_260FE5150();
  swift_bridgeObjectRelease();
  if (v43)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_260FE3220();
  uint64_t v46 = sub_260FE33E0();
  uint64_t v48 = v47;
  v96(v34, v4);
  if (v46 == a1 && v48 == a2)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    char v50 = sub_260FE5150();
    swift_bridgeObjectRelease();
    if (v50)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      sub_260FE3240();
      uint64_t v51 = sub_260FE33E0();
      uint64_t v53 = v52;
      v96(v30, v4);
      if (v51 == a1 && v53 == a2)
      {
        uint64_t v44 = 2;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v54 = sub_260FE5150();
        swift_bridgeObjectRelease();
        if (v54)
        {
          swift_bridgeObjectRelease();
          return 2;
        }
        else
        {
          sub_260FE31F0();
          uint64_t v55 = sub_260FE33E0();
          uint64_t v57 = v56;
          v96(v26, v4);
          if (v55 == a1 && v57 == a2)
          {
            swift_bridgeObjectRelease_n();
            return 3;
          }
          else
          {
            char v58 = sub_260FE5150();
            swift_bridgeObjectRelease();
            if (v58)
            {
              swift_bridgeObjectRelease();
              return 3;
            }
            else
            {
              BOOL v59 = v95;
              sub_260FE31E0();
              uint64_t v60 = sub_260FE33E0();
              uint64_t v62 = v61;
              v96(v59, v4);
              if (v60 == a1 && v62 == a2)
              {
                swift_bridgeObjectRelease_n();
                return 4;
              }
              else
              {
                char v63 = sub_260FE5150();
                swift_bridgeObjectRelease();
                if (v63)
                {
                  swift_bridgeObjectRelease();
                  return 4;
                }
                else
                {
                  unint64_t v64 = v94;
                  sub_260FE3230();
                  uint64_t v65 = sub_260FE33E0();
                  uint64_t v67 = v66;
                  v96(v64, v4);
                  if (v65 == a1 && v67 == a2)
                  {
                    swift_bridgeObjectRelease_n();
                    return 5;
                  }
                  else
                  {
                    char v68 = sub_260FE5150();
                    swift_bridgeObjectRelease();
                    if (v68)
                    {
                      swift_bridgeObjectRelease();
                      return 5;
                    }
                    else
                    {
                      uint64_t v69 = v93;
                      sub_260FE3250();
                      uint64_t v70 = sub_260FE33E0();
                      uint64_t v72 = v71;
                      v96(v69, v4);
                      if (v70 == a1 && v72 == a2)
                      {
                        swift_bridgeObjectRelease_n();
                        return 6;
                      }
                      else
                      {
                        char v73 = sub_260FE5150();
                        swift_bridgeObjectRelease();
                        if (v73)
                        {
                          swift_bridgeObjectRelease();
                          return 6;
                        }
                        else
                        {
                          uint64_t v74 = v92;
                          sub_260FE3200();
                          uint64_t v75 = sub_260FE33E0();
                          uint64_t v77 = v76;
                          v96(v74, v4);
                          if (v75 == a1 && v77 == a2)
                          {
                            swift_bridgeObjectRelease_n();
                            return 7;
                          }
                          else
                          {
                            char v78 = sub_260FE5150();
                            swift_bridgeObjectRelease();
                            if (v78)
                            {
                              swift_bridgeObjectRelease();
                              return 7;
                            }
                            else
                            {
                              long double v79 = v91;
                              sub_260FE31C0();
                              uint64_t v80 = sub_260FE33E0();
                              uint64_t v82 = v81;
                              v96(v79, v4);
                              if (v80 == a1 && v82 == a2)
                              {
                                swift_bridgeObjectRelease_n();
                                return 8;
                              }
                              else
                              {
                                char v83 = sub_260FE5150();
                                swift_bridgeObjectRelease();
                                if (v83)
                                {
                                  swift_bridgeObjectRelease();
                                  return 8;
                                }
                                else
                                {
                                  uint64_t v84 = v90;
                                  sub_260FE3210();
                                  uint64_t v85 = sub_260FE33E0();
                                  uint64_t v87 = v86;
                                  v96(v84, v4);
                                  if (v85 == a1 && v87 == a2)
                                  {
                                    swift_bridgeObjectRelease_n();
                                    return 9;
                                  }
                                  else
                                  {
                                    char v88 = sub_260FE5150();
                                    swift_bridgeObjectRelease();
                                    swift_bridgeObjectRelease();
                                    if (v88) {
                                      return 9;
                                    }
                                    else {
                                      return 10;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v44;
}

unint64_t sub_260FD3A54()
{
  unint64_t result = qword_26A8EB398;
  if (!qword_26A8EB398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB398);
  }
  return result;
}

unint64_t sub_260FD3AAC()
{
  unint64_t result = qword_26A8EB3A0;
  if (!qword_26A8EB3A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8EB3A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB3A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppleDiffusionAdapter(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    void *result = a2 + 9;
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
        JUMPOUT(0x260FD3BD4);
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
          void *result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleDiffusionAdapter()
{
  return &type metadata for AppleDiffusionAdapter;
}

uint64_t sub_260FD3C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *PowerLog.appleDiffusionLogger.unsafeMutableAddressor()
{
  if (qword_26A8EA928 != -1) {
    swift_once();
  }
  return &static PowerLog.appleDiffusionLogger;
}

Swift::Void __swiftcall PowerLog.CategoryReporter.report(payload:)(Swift::OpaquePointer payload)
{
  sub_260FB9898((uint64_t)payload._rawValue);
  id v1 = (id)sub_260FE3E90();
  swift_bridgeObjectRelease();
  PPSSendTelemetry();
}

uint64_t sub_260FD3D3C()
{
  uint64_t result = _s13DiffusionBase8PowerLogV16CategoryReporterV8categoryAESgSS_tcfC_0(0x666944656C707061, 0xEE006E6F69737566);
  static PowerLog.appleDiffusionLogger = result;
  qword_26A90FC48 = v1;
  qword_26A90FC50 = v2;
  return result;
}

uint64_t static PowerLog.appleDiffusionLogger.getter()
{
  if (qword_26A8EA928 != -1) {
    swift_once();
  }
  uint64_t v0 = static PowerLog.appleDiffusionLogger;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_260FD3E00()
{
  uint64_t result = _s13DiffusionBase8PowerLogV16CategoryReporterV8categoryAESgSS_tcfC_0(0xD000000000000010, 0x8000000261002240);
  static PowerLog.fileResidentInfoLogger = result;
  unk_26A90FC60 = v1;
  qword_26A90FC68 = v2;
  return result;
}

uint64_t *PowerLog.fileResidentInfoLogger.unsafeMutableAddressor()
{
  if (qword_26A8EA930 != -1) {
    swift_once();
  }
  return &static PowerLog.fileResidentInfoLogger;
}

uint64_t static PowerLog.fileResidentInfoLogger.getter()
{
  if (qword_26A8EA930 != -1) {
    swift_once();
  }
  uint64_t v0 = static PowerLog.fileResidentInfoLogger;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_260FD3F04(uint64_t a1)
{
  sub_260FB9898(a1);
  id v1 = (id)sub_260FE3E90();
  swift_bridgeObjectRelease();
  PPSSendTelemetry();
}

uint64_t _s13DiffusionBase8PowerLogV16CategoryReporterV8categoryAESgSS_tcfC_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (void *)sub_260FE4070();
  uint64_t v5 = (void *)sub_260FE4070();
  uint64_t v6 = PPSCreateTelemetryIdentifier();

  if (!v6)
  {
    if (qword_26A8EA918 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_260FE3A10();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A90FC00);
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_260FE39F0();
    os_log_type_t v9 = sub_260FE4890();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      sub_260DB2844(0xD000000000000019, 0x8000000261002260, &v13);
      sub_260FE4AE0();
      *(_WORD *)(v10 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_260DB2844(a1, a2, &v13);
      sub_260FE4AE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_260D82000, v8, v9, "Unable to create a telemetry identifier for (%s, %s)", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x26122CA00](v11, -1, -1);
      MEMORY[0x26122CA00](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return a1;
}

ValueMetadata *type metadata accessor for PowerLog()
{
  return &type metadata for PowerLog;
}

void *sub_260FD41D0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PowerLog.CategoryReporter(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for PowerLog.CategoryReporter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for PowerLog.CategoryReporter()
{
  return &type metadata for PowerLog.CategoryReporter;
}

uint64_t sub_260FD42B0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x436567616D496763;
  }
  else {
    uint64_t v3 = 0x616E616C506E6F6ELL;
  }
  if (v2) {
    unint64_t v4 = 0xEF72656666754272;
  }
  else {
    unint64_t v4 = 0xEF6E6F6974616572;
  }
  if (a2) {
    uint64_t v5 = 0x436567616D496763;
  }
  else {
    uint64_t v5 = 0x616E616C506E6F6ELL;
  }
  if (a2) {
    unint64_t v6 = 0xEF6E6F6974616572;
  }
  else {
    unint64_t v6 = 0xEF72656666754272;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260FD4370(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x8000000261001140;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000027;
    }
    else {
      unint64_t v5 = 0xD00000000000001DLL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000261001160;
    }
    else {
      unint64_t v6 = 0x8000000261001190;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000015;
  unint64_t v6 = 0x8000000261001140;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD000000000000027;
    }
    else {
      unint64_t v2 = 0xD00000000000001DLL;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x8000000261001160;
    }
    else {
      unint64_t v3 = 0x8000000261001190;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260FD4470(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000016;
  }
  else {
    unint64_t v3 = 0xD00000000000001ALL;
  }
  if (v2) {
    unint64_t v4 = 0x8000000261001010;
  }
  else {
    unint64_t v4 = 0x8000000261001030;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000016;
  }
  else {
    unint64_t v5 = 0xD00000000000001ALL;
  }
  if (a2) {
    unint64_t v6 = 0x8000000261001030;
  }
  else {
    unint64_t v6 = 0x8000000261001010;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260FD451C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x63696C6C69727963;
    }
    else {
      uint64_t v3 = 7039587;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xE300000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x63696C6C69727963;
      }
      else {
        uint64_t v6 = 7039587;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xE300000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    uint64_t v3 = 0x6E6974616CLL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x6E6974616CLL)
  {
LABEL_21:
    char v8 = sub_260FE5150();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260FD4620(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x8000000261000ED0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000023;
      uint64_t v6 = "startingImageProvidedWithoutEncoder";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000022;
      uint64_t v6 = "startingText2ImgWithoutTextEncoder";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v6 = "unsupportedOSVersion";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000261000ED0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000023;
      char v8 = "startingImageProvidedWithoutEncoder";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000022;
      char v8 = "startingText2ImgWithoutTextEncoder";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000014;
      char v8 = "unsupportedOSVersion";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_260FD477C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1952804469;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1952804469;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x6E75684374656E75;
      unint64_t v3 = 0xEA0000000000316BLL;
      break;
    case 2:
      unint64_t v5 = 0x6E75684374656E75;
      unint64_t v3 = 0xEA0000000000326BLL;
      break;
    case 3:
      unint64_t v5 = 0x6F636E4570696C63;
      unint64_t v3 = 0xEB00000000726564;
      break;
    case 4:
      unint64_t v5 = 0x7265646F636E65;
      unint64_t v3 = 0xE700000000000000;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x7265646F636564;
      break;
    case 6:
      unint64_t v5 = 0x6365446168706C61;
      unint64_t v3 = 0xEC0000007265646FLL;
      break;
    case 7:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v3 = 0x8000000260FFC290;
      break;
    case 8:
      unint64_t v3 = 0x8000000260FFC270;
      unint64_t v5 = 0xD000000000000010;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA0000000000316BLL;
      if (v5 == 0x6E75684374656E75) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xEA0000000000326BLL;
      if (v5 != 0x6E75684374656E75) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v6 = 0xEB00000000726564;
      if (v5 != 0x6F636E4570696C63) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x7265646F636E65) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x7265646F636564) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v6 = 0xEC0000007265646FLL;
      if (v5 != 0x6365446168706C61) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v2 = 0xD000000000000011;
      unint64_t v6 = 0x8000000260FFC290;
      goto LABEL_24;
    case 8:
      unint64_t v6 = 0x8000000260FFC270;
      if (v5 != 0xD000000000000010) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v5 != v2) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_260FE5150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260FD4A90(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000032;
  }
  else {
    unint64_t v3 = 0xD000000000000019;
  }
  if (v2) {
    unint64_t v4 = 0x8000000261001050;
  }
  else {
    unint64_t v4 = 0x8000000261001070;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000032;
  }
  else {
    unint64_t v5 = 0xD000000000000019;
  }
  if (a2) {
    unint64_t v6 = 0x8000000261001070;
  }
  else {
    unint64_t v6 = 0x8000000261001050;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260FE5150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260FD4B3C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x676E696E69617274;
    }
    else {
      uint64_t v3 = 0x6365705361726F6CLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEB00000000676154;
    }
    else {
      unint64_t v4 = 0xE800000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x676E696E69617274;
      }
      else {
        uint64_t v6 = 0x6365705361726F6CLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEB00000000676154;
      }
      else {
        unint64_t v7 = 0xE800000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x676F6C61746163;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x676F6C61746163)
  {
LABEL_21:
    char v8 = sub_260FE5150();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260FD4C68(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE90000000000006ELL;
  uint64_t v3 = 0x6F6974616D696E61;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6F6974616D696E61;
  unint64_t v6 = 0xE90000000000006ELL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v5 = 0x696A6F6D65;
      break;
    case 2:
      uint64_t v5 = 0x61727473756C6C69;
      unint64_t v6 = 0xEC0000006E6F6974;
      break;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x686374656B73;
      break;
    case 4:
      uint64_t v5 = 0x6C75616665645F5FLL;
      unint64_t v6 = 0xEB000000005F5F74;
      break;
    case 5:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      if (v5 == 0x696A6F6D65) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xEC0000006E6F6974;
      if (v5 != 0x61727473756C6C69) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0xE600000000000000;
      if (v5 != 0x686374656B73) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v3 = 0x6C75616665645F5FLL;
      unint64_t v2 = 0xEB000000005F5F74;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_260FE5150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260FD4E8C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1936876912;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1936876912;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6F6974616D696E61;
      unint64_t v3 = 0xE90000000000006ELL;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7472615F656E696CLL;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x696A6F6D65;
      break;
    case 4:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7168876;
      break;
    case 5:
      uint64_t v5 = 0x61727473756C6C69;
      unint64_t v3 = 0xEC0000006E6F6974;
      break;
    case 6:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x686374656B73;
      break;
    case 7:
      uint64_t v5 = 0x63735F656C797473;
      unint64_t v3 = 0xEE00656C62626972;
      break;
    case 8:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x737265705F6D636CLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE90000000000006ELL;
      if (v5 == 0x6F6974616D696E61) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7472615F656E696CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x696A6F6D65) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 7168876) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xEC0000006E6F6974;
      if (v5 != 0x61727473756C6C69) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x686374656B73) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      uint64_t v2 = 0x63735F656C797473;
      unint64_t v6 = 0xEE00656C62626972;
      goto LABEL_24;
    case 8:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x737265705F6D636CLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v5 != v2) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_260FE5150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260FD5158(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E616D6F77;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E616D6F77;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7233901;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6E6F73726570;
      break;
    case 3:
      uint64_t v5 = 0x616D6F7720646C6FLL;
      unint64_t v3 = 0xE90000000000006ELL;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6E616D20646C6FLL;
      break;
    case 5:
      uint64_t v5 = 0x7372657020646C6FLL;
      unint64_t v3 = 0xEA00000000006E6FLL;
      break;
    case 6:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x79656C696D73;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 7233901) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6E6F73726570) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE90000000000006ELL;
      if (v5 != 0x616D6F7720646C6FLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6E616D20646C6FLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      uint64_t v2 = 0x7372657020646C6FLL;
      unint64_t v6 = 0xEA00000000006E6FLL;
      goto LABEL_18;
    case 6:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x79656C696D73) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_260FE5150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260FD538C(unsigned __int8 a1, unsigned __int8 a2)
{
  if ((unint64_t)a1 << 16 == (unint64_t)a2 << 16) {
    char v2 = 1;
  }
  else {
    char v2 = sub_260FE5150();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_260FD53FC(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 3425357;
  }
  else {
    uint64_t v2 = 3228749;
  }
  if (a2) {
    uint64_t v3 = 3425357;
  }
  else {
    uint64_t v3 = 3228749;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_260FE5150();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_260FD5468(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000001ELL;
  unint64_t v3 = 0x8000000260FFC3F0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000001ELL;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000021;
      unint64_t v6 = "conditioning_scale_without_prompt";
      goto LABEL_7;
    case 2:
      char v7 = "conditioning_scale_draw_over_image";
      goto LABEL_10;
    case 3:
      char v7 = "conditioning_scale_sketch_to_image";
      goto LABEL_10;
    case 4:
      unint64_t v3 = 0x8000000260FFC340;
      unint64_t v5 = 0xD00000000000001ELL;
      break;
    case 5:
      unint64_t v5 = 0xD000000000000021;
      unint64_t v6 = "conditioning_range_without_prompt";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 6:
      char v7 = "conditioning_range_draw_over_image";
      goto LABEL_10;
    case 7:
      char v7 = "conditioning_range_sketch_to_image";
LABEL_10:
      unint64_t v3 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000022;
      break;
    default:
      break;
  }
  unint64_t v8 = 0x8000000260FFC3F0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000021;
      char v9 = "conditioning_scale_without_prompt";
      goto LABEL_17;
    case 2:
      uint64_t v10 = "conditioning_scale_draw_over_image";
      goto LABEL_22;
    case 3:
      uint64_t v10 = "conditioning_scale_sketch_to_image";
      goto LABEL_22;
    case 4:
      char v9 = "conditioning_range_with_prompt";
      goto LABEL_17;
    case 5:
      unint64_t v2 = 0xD000000000000021;
      char v9 = "conditioning_range_without_prompt";
LABEL_17:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      goto LABEL_18;
    case 6:
      uint64_t v10 = "conditioning_range_draw_over_image";
      goto LABEL_22;
    case 7:
      uint64_t v10 = "conditioning_range_sketch_to_image";
LABEL_22:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      if (v5 == 0xD000000000000022) {
        goto LABEL_23;
      }
      goto LABEL_25;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_23:
      if (v3 == v8) {
        char v11 = 1;
      }
      else {
LABEL_25:
      }
        char v11 = sub_260FE5150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

id sub_260FD5674(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v2 = (void *)sub_260FE2EF0();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelAssetWithURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_260FE2F90();
    unint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_260FE2E30();

    swift_willThrow();
    uint64_t v9 = sub_260FE2F90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_260FD57CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6828);
  MEMORY[0x270FA5388](v4 - 8, v5);
  id v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB440);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(unsigned char *)(v8 + 24) = -1;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = sub_260FE4520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  char v11 = (void *)swift_allocObject();
  id v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = v8;
  v11[7] = v9;
  swift_retain();
  swift_retain();
  uint64_t v12 = v9;
  sub_260D9F7E4((uint64_t)v7, (uint64_t)&unk_26A8EB460, (uint64_t)v11);
  swift_release();
  uint64_t result = sub_260FE4990();
  int v14 = *(unsigned __int8 *)(v8 + 24);
  if (v14 == 255)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = *(void **)(v8 + 16);
    if (v14)
    {
      v18[1] = *(void *)(v8 + 16);
      id v17 = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6FA8);
      swift_willThrowTypedImpl();
    }
    else
    {
      id v16 = v15;
    }
    swift_release();

    return (uint64_t)v15;
  }
  return result;
}

uint64_t sub_260FD59A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6828);
  MEMORY[0x270FA5388](v4 - 8, v5);
  id v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB470);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(unsigned char *)(v8 + 24) = -1;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = sub_260FE4520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  char v11 = (void *)swift_allocObject();
  id v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = v8;
  v11[7] = v9;
  swift_retain();
  swift_retain();
  uint64_t v12 = v9;
  sub_260D9F7E4((uint64_t)v7, (uint64_t)&unk_26A8EB480, (uint64_t)v11);
  swift_release();
  uint64_t result = sub_260FE4990();
  int v14 = *(unsigned __int8 *)(v8 + 24);
  if (v14 == 255)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = *(void **)(v8 + 16);
    if (v14)
    {
      v18[1] = *(void *)(v8 + 16);
      id v17 = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6FA8);
      swift_willThrowTypedImpl();
    }
    else
    {
      id v16 = v15;
    }
    swift_release();

    return (uint64_t)v15;
  }
  return result;
}

uint64_t static AppleDiffusionResourceFactory.shared(reset:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A8EA938 != -1) {
    a1 = swift_once();
  }
  uint64_t v4 = (os_unfair_lock_s *)qword_26A8EB3E0;
  MEMORY[0x270FA5388](a1, a2);
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_260F7EF6C(&v6);
  os_unfair_lock_unlock(v4 + 6);
  if (!v2) {
    uint64_t v3 = v6;
  }
  swift_release();
  return v3;
}

uint64_t sub_260FD5C5C()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_260FD5C94()
{
  type metadata accessor for AppleDiffusionResourceFactory.WeakContainer();
  uint64_t v0 = swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB468);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  qword_26A8EB3E0 = result;
  return result;
}

uint64_t sub_260FD5CFC@<X0>(char a1@<W1>, uint64_t *a2@<X8>)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    if ((a1 & 1) == 0) {
      goto LABEL_6;
    }
    swift_release();
  }
  type metadata accessor for AppleDiffusionResourceFactory(0);
  swift_allocObject();
  uint64_t result = (uint64_t)sub_260FD7170();
  if (v2) {
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_weakAssign();
LABEL_6:
  *a2 = v6;
  return result;
}

uint64_t sub_260FD5D9C(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  uint64_t v30 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    while (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      if (*(void *)(a2 + 16)) {
        goto LABEL_23;
      }
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v12 >= v7) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_30;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_30;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v9);
        if (!v13) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    if (*(void *)(a2 + 16))
    {
LABEL_23:
      uint64_t v15 = 16 * v11;
      id v16 = (uint64_t *)(*(void *)(a1 + 48) + v15);
      id v17 = (uint64_t *)(*(void *)(a1 + 56) + v15);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      uint64_t v21 = *v16;
      uint64_t v20 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v22 = sub_260DBACB4(v21, v20);
      if ((v23 & 1) == 0
        || ((uint64_t v24 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v22),
             uint64_t v26 = *v24,
             uint64_t v25 = v24[1],
             swift_bridgeObjectRetain(),
             swift_bridgeObjectRelease(),
             v26 == v19)
          ? (BOOL v27 = v25 == v18)
          : (BOOL v27 = 0),
            v27))
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        char v28 = sub_260FE5150();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v28 & 1) == 0)
        {
          uint64_t v29 = 0;
LABEL_31:
          swift_release();
          return v29;
        }
      }
    }
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_30:
    uint64_t v29 = 1;
    goto LABEL_31;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t AppleDiffusionResourceFactory.areModelResourcesCurrent(_:)(uint64_t a1)
{
  unint64_t v120 = sub_260DAB2BC(MEMORY[0x263F8EE78]);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentVersions);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v108 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v3;
  int64_t v110 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v112 = *(void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentVersions);
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (v6)
  {
    uint64_t v116 = (v6 - 1) & v6;
    int64_t v118 = v7;
    unint64_t v11 = __clz(__rbit64(v6)) | (v7 << 6);
LABEL_23:
    uint64_t v114 = *(unsigned __int8 *)(*(void *)(v112 + 48) + v11);
    uint64_t v16 = *(void *)(*(void *)(v112 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v17 = (void *)sub_260DAAA14(MEMORY[0x263F8EE78]);
    int64_t v18 = 0;
    uint64_t v121 = v16 + 64;
    uint64_t v19 = 1 << *(unsigned char *)(v16 + 32);
    if (v19 < 64) {
      uint64_t v20 = ~(-1 << v19);
    }
    else {
      uint64_t v20 = -1;
    }
    unint64_t v21 = v20 & *(void *)(v16 + 64);
    int64_t v123 = (unint64_t)(v19 + 63) >> 6;
    uint64_t v125 = v16;
    while (1)
    {
      if (v21)
      {
        unint64_t v23 = __clz(__rbit64(v21));
        v21 &= v21 - 1;
        unint64_t v24 = v23 | (v18 << 6);
        goto LABEL_45;
      }
      int64_t v25 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_140;
      }
      if (v25 >= v123) {
        goto LABEL_66;
      }
      unint64_t v26 = *(void *)(v121 + 8 * v25);
      ++v18;
      if (!v26)
      {
        int64_t v18 = v25 + 1;
        if (v25 + 1 >= v123) {
          goto LABEL_66;
        }
        unint64_t v26 = *(void *)(v121 + 8 * v18);
        if (!v26)
        {
          int64_t v18 = v25 + 2;
          if (v25 + 2 >= v123) {
            goto LABEL_66;
          }
          unint64_t v26 = *(void *)(v121 + 8 * v18);
          if (!v26) {
            break;
          }
        }
      }
LABEL_44:
      unint64_t v21 = (v26 - 1) & v26;
      unint64_t v24 = __clz(__rbit64(v26)) + (v18 << 6);
LABEL_45:
      int64_t v127 = v18;
      int v28 = *(unsigned __int8 *)(*(void *)(v125 + 48) + v24);
      uint64_t v29 = (uint64_t *)(*(void *)(v125 + 56) + 16 * v24);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = 0x676E696E69617274;
      if (v28 != 1) {
        uint64_t v32 = 0x6365705361726F6CLL;
      }
      unint64_t v33 = 0xEB00000000676154;
      if (v28 != 1) {
        unint64_t v33 = 0xE800000000000000;
      }
      if (v28) {
        uint64_t v34 = v32;
      }
      else {
        uint64_t v34 = 0x676F6C61746163;
      }
      if (v28) {
        uint64_t v35 = v33;
      }
      else {
        uint64_t v35 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v38 = sub_260DBACB4(v34, v35);
      uint64_t v39 = v17[2];
      BOOL v40 = (v37 & 1) == 0;
      uint64_t v41 = v39 + v40;
      if (__OFADD__(v39, v40))
      {
        __break(1u);
        goto LABEL_75;
      }
      char v42 = v37;
      if (v17[3] >= v41)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v37) {
            goto LABEL_27;
          }
        }
        else
        {
          sub_260DC229C();
          if (v42) {
            goto LABEL_27;
          }
        }
      }
      else
      {
        sub_260DBE818(v41, isUniquelyReferenced_nonNull_native);
        unint64_t v43 = sub_260DBACB4(v34, v35);
        if ((v42 & 1) != (v44 & 1)) {
          goto LABEL_159;
        }
        unint64_t v38 = v43;
        if (v42)
        {
LABEL_27:
          unint64_t v22 = (void *)(v17[7] + 16 * v38);
          swift_bridgeObjectRelease();
          *unint64_t v22 = v31;
          v22[1] = v30;
          goto LABEL_28;
        }
      }
      v17[(v38 >> 6) + 8] |= 1 << v38;
      uint64_t v45 = (uint64_t *)(v17[6] + 16 * v38);
      *uint64_t v45 = v34;
      v45[1] = v35;
      uint64_t v46 = (void *)(v17[7] + 16 * v38);
      *uint64_t v46 = v31;
      v46[1] = v30;
      uint64_t v47 = v17[2];
      BOOL v48 = __OFADD__(v47, 1);
      uint64_t v49 = v47 + 1;
      if (v48)
      {
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
        goto LABEL_142;
      }
      v17[2] = v49;
      swift_bridgeObjectRetain();
LABEL_28:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v18 = v127;
    }
    int64_t v27 = v25 + 3;
    if (v27 >= v123) {
      goto LABEL_66;
    }
    unint64_t v26 = *(void *)(v121 + 8 * v27);
    if (v26)
    {
      int64_t v18 = v27;
      goto LABEL_44;
    }
    while (1)
    {
      int64_t v18 = v27 + 1;
      if (__OFADD__(v27, 1))
      {
LABEL_153:
        __break(1u);
        goto LABEL_154;
      }
      if (v18 >= v123) {
        break;
      }
      unint64_t v26 = *(void *)(v121 + 8 * v18);
      ++v27;
      if (v26) {
        goto LABEL_44;
      }
    }
LABEL_66:
    swift_release();
    uint64_t v8 = 0xE400000000000000;
    uint64_t v9 = 1952804469;
    switch(v114)
    {
      case 1:
        uint64_t v9 = 0x6E75684374656E75;
        uint64_t v8 = 0xEA0000000000316BLL;
        break;
      case 2:
        uint64_t v8 = 0xEA0000000000326BLL;
        uint64_t v9 = 0x6E75684374656E75;
        break;
      case 3:
        uint64_t v8 = 0xEB00000000726564;
        uint64_t v9 = 0x6F636E4570696C63;
        break;
      case 4:
        uint64_t v9 = 0x7265646F636E65;
        uint64_t v8 = 0xE700000000000000;
        break;
      case 5:
        uint64_t v8 = 0xE700000000000000;
        uint64_t v9 = 0x7265646F636564;
        break;
      case 6:
        uint64_t v8 = 0xEC0000007265646FLL;
        uint64_t v9 = 0x6365446168706C61;
        break;
      case 7:
        uint64_t v9 = 0xD000000000000011;
        uint64_t v8 = 0x8000000260FFC290;
        break;
      case 8:
        uint64_t v8 = 0x8000000260FFC270;
        uint64_t v9 = 0xD000000000000010;
        break;
      default:
        break;
    }
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_260DE0EE8((uint64_t)v17, v9, v8, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v6 = v116;
    int64_t v7 = v118;
  }
  int64_t v12 = v7 + 1;
  if (__OFADD__(v7, 1)) {
    goto LABEL_155;
  }
  if (v12 >= v110) {
    goto LABEL_75;
  }
  unint64_t v13 = *(void *)(v108 + 8 * v12);
  int64_t v14 = v7 + 1;
  if (v13) {
    goto LABEL_22;
  }
  int64_t v14 = v7 + 2;
  if (v7 + 2 >= v110) {
    goto LABEL_75;
  }
  unint64_t v13 = *(void *)(v108 + 8 * v14);
  if (v13) {
    goto LABEL_22;
  }
  int64_t v14 = v7 + 3;
  if (v7 + 3 >= v110) {
    goto LABEL_75;
  }
  unint64_t v13 = *(void *)(v108 + 8 * v14);
  if (v13)
  {
LABEL_22:
    uint64_t v116 = (v13 - 1) & v13;
    int64_t v118 = v14;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    goto LABEL_23;
  }
  uint64_t v15 = v7 + 4;
  if (v7 + 4 >= v110) {
    goto LABEL_75;
  }
  unint64_t v13 = *(void *)(v108 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v7 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      goto LABEL_157;
    }
    if (v14 >= v110) {
      break;
    }
    unint64_t v13 = *(void *)(v108 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_75:
  swift_release();
  uint64_t v50 = *(void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_adapterVersions);
  uint64_t v51 = *(void *)(v50 + 64);
  uint64_t v109 = v50 + 64;
  uint64_t v52 = 1 << *(unsigned char *)(v50 + 32);
  if (v52 < 64) {
    uint64_t v53 = ~(-1 << v52);
  }
  else {
    uint64_t v53 = -1;
  }
  unint64_t v54 = v53 & v51;
  int64_t v111 = (unint64_t)(v52 + 63) >> 6;
  uint64_t v113 = *(void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_adapterVersions);
  swift_bridgeObjectRetain();
  int64_t v55 = 0;
LABEL_80:
  if (v54)
  {
    uint64_t v117 = (v54 - 1) & v54;
    int64_t v119 = v55;
    unint64_t v60 = __clz(__rbit64(v54)) | (v55 << 6);
    goto LABEL_96;
  }
  int64_t v61 = v55 + 1;
  if (__OFADD__(v55, 1)) {
    goto LABEL_156;
  }
  if (v61 >= v111) {
    goto LABEL_142;
  }
  unint64_t v62 = *(void *)(v109 + 8 * v61);
  int64_t v63 = v55 + 1;
  if (v62) {
    goto LABEL_95;
  }
  int64_t v63 = v55 + 2;
  if (v55 + 2 >= v111) {
    goto LABEL_142;
  }
  unint64_t v62 = *(void *)(v109 + 8 * v63);
  if (v62) {
    goto LABEL_95;
  }
  int64_t v63 = v55 + 3;
  if (v55 + 3 >= v111) {
    goto LABEL_142;
  }
  unint64_t v62 = *(void *)(v109 + 8 * v63);
  if (v62)
  {
LABEL_95:
    uint64_t v117 = (v62 - 1) & v62;
    int64_t v119 = v63;
    unint64_t v60 = __clz(__rbit64(v62)) + (v63 << 6);
LABEL_96:
    char v115 = *(unsigned char *)(*(void *)(v113 + 48) + v60);
    uint64_t v65 = *(void *)(*(void *)(v113 + 56) + 8 * v60);
    swift_bridgeObjectRetain();
    uint64_t v66 = (void *)sub_260DAAA14(MEMORY[0x263F8EE78]);
    int64_t v67 = 0;
    uint64_t v122 = v65 + 64;
    uint64_t v68 = 1 << *(unsigned char *)(v65 + 32);
    if (v68 < 64) {
      uint64_t v69 = ~(-1 << v68);
    }
    else {
      uint64_t v69 = -1;
    }
    unint64_t v70 = v69 & *(void *)(v65 + 64);
    int64_t v124 = (unint64_t)(v68 + 63) >> 6;
    uint64_t v126 = v65;
    while (1)
    {
      if (v70)
      {
        unint64_t v72 = __clz(__rbit64(v70));
        v70 &= v70 - 1;
        unint64_t v73 = v72 | (v67 << 6);
      }
      else
      {
        int64_t v74 = v67 + 1;
        if (__OFADD__(v67, 1)) {
          goto LABEL_152;
        }
        if (v74 >= v124)
        {
LABEL_79:
          swift_release();
          unint64_t v56 = AppleDiffusionAdapter.rawValue.getter(v115);
          uint64_t v58 = v57;
          char v59 = swift_isUniquelyReferenced_nonNull_native();
          sub_260DE0EE8((uint64_t)v66, v56, v58, v59);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v54 = v117;
          int64_t v55 = v119;
          goto LABEL_80;
        }
        unint64_t v75 = *(void *)(v122 + 8 * v74);
        ++v67;
        if (!v75)
        {
          int64_t v67 = v74 + 1;
          if (v74 + 1 >= v124) {
            goto LABEL_79;
          }
          unint64_t v75 = *(void *)(v122 + 8 * v67);
          if (!v75)
          {
            int64_t v67 = v74 + 2;
            if (v74 + 2 >= v124) {
              goto LABEL_79;
            }
            unint64_t v75 = *(void *)(v122 + 8 * v67);
            if (!v75)
            {
              int64_t v76 = v74 + 3;
              if (v76 >= v124) {
                goto LABEL_79;
              }
              unint64_t v75 = *(void *)(v122 + 8 * v76);
              if (!v75)
              {
                while (1)
                {
                  int64_t v67 = v76 + 1;
                  if (__OFADD__(v76, 1)) {
                    break;
                  }
                  if (v67 >= v124) {
                    goto LABEL_79;
                  }
                  unint64_t v75 = *(void *)(v122 + 8 * v67);
                  ++v76;
                  if (v75) {
                    goto LABEL_117;
                  }
                }
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                sub_260FE5280();
                __break(1u);
                JUMPOUT(0x260FD6B2CLL);
              }
              int64_t v67 = v76;
            }
          }
        }
LABEL_117:
        unint64_t v70 = (v75 - 1) & v75;
        unint64_t v73 = __clz(__rbit64(v75)) + (v67 << 6);
      }
      int64_t v128 = v67;
      int v77 = *(unsigned __int8 *)(*(void *)(v126 + 48) + v73);
      char v78 = (uint64_t *)(*(void *)(v126 + 56) + 16 * v73);
      uint64_t v80 = *v78;
      uint64_t v79 = v78[1];
      uint64_t v81 = 0x676E696E69617274;
      if (v77 != 1) {
        uint64_t v81 = 0x6365705361726F6CLL;
      }
      unint64_t v82 = 0xEB00000000676154;
      if (v77 != 1) {
        unint64_t v82 = 0xE800000000000000;
      }
      if (v77) {
        uint64_t v83 = v81;
      }
      else {
        uint64_t v83 = 0x676F6C61746163;
      }
      if (v77) {
        uint64_t v84 = v82;
      }
      else {
        uint64_t v84 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      char v85 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v87 = sub_260DBACB4(v83, v84);
      uint64_t v88 = v66[2];
      BOOL v89 = (v86 & 1) == 0;
      uint64_t v90 = v88 + v89;
      if (__OFADD__(v88, v89)) {
        goto LABEL_141;
      }
      char v91 = v86;
      if (v66[3] >= v90)
      {
        if (v85)
        {
          if (v86) {
            goto LABEL_100;
          }
        }
        else
        {
          sub_260DC229C();
          if (v91) {
            goto LABEL_100;
          }
        }
      }
      else
      {
        sub_260DBE818(v90, v85);
        unint64_t v92 = sub_260DBACB4(v83, v84);
        if ((v91 & 1) != (v93 & 1)) {
          goto LABEL_159;
        }
        unint64_t v87 = v92;
        if (v91)
        {
LABEL_100:
          uint64_t v71 = (void *)(v66[7] + 16 * v87);
          swift_bridgeObjectRelease();
          *uint64_t v71 = v80;
          v71[1] = v79;
          goto LABEL_101;
        }
      }
      v66[(v87 >> 6) + 8] |= 1 << v87;
      uint64_t v94 = (uint64_t *)(v66[6] + 16 * v87);
      *uint64_t v94 = v83;
      v94[1] = v84;
      uint64_t v95 = (void *)(v66[7] + 16 * v87);
      *uint64_t v95 = v80;
      v95[1] = v79;
      uint64_t v96 = v66[2];
      BOOL v48 = __OFADD__(v96, 1);
      uint64_t v97 = v96 + 1;
      if (v48)
      {
        __break(1u);
LABEL_152:
        __break(1u);
        goto LABEL_153;
      }
      v66[2] = v97;
      swift_bridgeObjectRetain();
LABEL_101:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v67 = v128;
    }
  }
  uint64_t v64 = v55 + 4;
  if (v55 + 4 < v111)
  {
    unint64_t v62 = *(void *)(v109 + 8 * v64);
    if (v62)
    {
      int64_t v63 = v55 + 4;
      goto LABEL_95;
    }
    while (1)
    {
      int64_t v63 = v64 + 1;
      if (__OFADD__(v64, 1)) {
        goto LABEL_158;
      }
      if (v63 >= v111) {
        break;
      }
      unint64_t v62 = *(void *)(v109 + 8 * v63);
      ++v64;
      if (v62) {
        goto LABEL_95;
      }
    }
  }
LABEL_142:
  swift_release();
  int64_t v98 = *(void *)(a1 + 16);
  uint64_t v99 = MEMORY[0x263F8EE78];
  if (v98)
  {
    uint64_t v129 = MEMORY[0x263F8EE78];
    sub_260DB486C(0, v98, 0);
    uint64_t v99 = v129;
    uint64_t v100 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v102 = *v100++;
      uint64_t v101 = v102;
      if (v102)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v103 = _s13DiffusionBase05AppleA15ResourceFactoryC27areModelResourcesEquivalentySbSDySSSDyS2SGG_AFtFZ_0(v101, v120);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v103 = 1;
      }
      unint64_t v105 = *(void *)(v129 + 16);
      unint64_t v104 = *(void *)(v129 + 24);
      if (v105 >= v104 >> 1) {
        sub_260DB486C(v104 > 1, v105 + 1, 1);
      }
      *(void *)(v129 + 16) = v105 + 1;
      *(unsigned char *)(v129 + v105 + 32) = v103 & 1;
      --v98;
    }
    while (v98);
  }
  swift_bridgeObjectRelease();
  return v99;
}

uint64_t AppleDiffusionResourceFactory.Versioner.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x676F6C61746163;
  }
  if (a1 == 1) {
    return 0x676E696E69617274;
  }
  return 0x6365705361726F6CLL;
}

uint64_t AppleDiffusionResourceFactory.resourceURLs.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_260F7EF88(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_resourceURLs, a1);
}

uint64_t AppleDiffusionResourceFactory.modelDescription.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppleDiffusionResourceFactory.adapterMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppleDiffusionResourceFactory.baseModelComponentMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_260FD6BF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_260FD4B3C(*a1, *a2);
}

uint64_t sub_260FD6C04()
{
  return sub_260FE5340();
}

uint64_t sub_260FD6CB0()
{
  sub_260FE41D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260FD6D48()
{
  return sub_260FE5340();
}

uint64_t sub_260FD6DF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s13DiffusionBase05AppleA15ResourceFactoryC9VersionerO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_260FD6E20(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xEB00000000676154;
  uint64_t v5 = 0x676E696E69617274;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6365705361726F6CLL;
    unint64_t v4 = 0xE800000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x676F6C61746163;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t AppleDiffusionResourceFactory.adapterVersions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppleDiffusionResourceFactory.baseModelComponentVersions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppleDiffusionResourceFactory.catalogAssetLock()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_260FE3440();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t result = sub_260FE3430();
  if (!v1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v7, v3);
  }
  return result;
}

uint64_t AppleDiffusionResourceFactory.hedEdgeDetectorModelURL(with:)@<X0>(uint64_t a1@<X8>)
{
  v13[1] = a1;
  uint64_t v14 = sub_260FE33D0();
  v13[0] = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v3);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3F0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  char v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_hedModel), *(void *)(v1 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_hedModel + 24));
  uint64_t result = sub_260FE33B0();
  if (!v2)
  {
    uint64_t v12 = sub_260FE3340();
    MEMORY[0x261229C10](v12);
    (*(void (**)(char *, uint64_t))(v13[0] + 8))(v5, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

void (***sub_260FD7170())(char *, uint64_t)
{
  uint64_t v426 = *MEMORY[0x263EF8340];
  v380 = *v0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6828);
  MEMORY[0x270FA5388](v1 - 8, v2);
  v346 = (char *)v335 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v362 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB428);
  MEMORY[0x270FA5388](v362, v4);
  uint64_t v378 = (uint64_t)v335 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v348 = sub_260FE3440();
  uint64_t v347 = *(void *)(v348 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v348 - 8, v6);
  v379 = (char *)v335 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v9);
  v363 = (void (*)(char *, uint64_t))((char *)v335 - v10);
  uint64_t v11 = sub_260FE2ED0();
  uint64_t v352 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = (char *)v335 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E7588);
  uint64_t v17 = MEMORY[0x270FA5388](v15 - 8, v16);
  v365 = (char *)v335 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  v349 = (char *)v335 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  v356 = (char *)v335 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23, v25);
  uint64_t v354 = (uint64_t)v335 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26, v28);
  uint64_t v371 = (uint64_t)v335 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29, v31);
  uint64_t v377 = (uint64_t)v335 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32, v34);
  uint64_t v376 = (uint64_t)v335 - v36;
  MEMORY[0x270FA5388](v35, v37);
  uint64_t v39 = (char *)v335 - v38;
  uint64_t v40 = sub_260FE2F90();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v40, v42);
  v340 = (char *)v335 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = MEMORY[0x270FA5388](v43, v45);
  v370 = (char *)v335 - v47;
  uint64_t v49 = MEMORY[0x270FA5388](v46, v48);
  v381 = (char *)v335 - v50;
  uint64_t v52 = MEMORY[0x270FA5388](v49, v51);
  v357 = (char *)v335 - v53;
  uint64_t v55 = MEMORY[0x270FA5388](v52, v54);
  v345 = (char *)v335 - v56;
  MEMORY[0x270FA5388](v55, v57);
  char v59 = (char *)v335 - v58;
  uint64_t v341 = type metadata accessor for AppleDiffusionPipeline.ResourceURLs();
  uint64_t v61 = MEMORY[0x270FA5388](v341, v60);
  dispatch_semaphore_t v373 = (dispatch_semaphore_t)((char *)v335 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v64 = MEMORY[0x270FA5388](v61, v63);
  v375 = (void *)((char *)v335 - v65);
  MEMORY[0x270FA5388](v64, v66);
  uint64_t v68 = (char *)v335 - v67;
  sub_260FE3260();
  v353 = v0;
  v385 = (void (***)(char *, uint64_t))((char *)v0
                                                + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_hedModel);
  sub_260DD7B40(&v409, (uint64_t)v0 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_hedModel);
  *(void *)&long long v359 = v41;
  uint64_t v69 = *(void (***)(char *, uint64_t *))(v41 + 56);
  v374 = (void *)(v41 + 56);
  v382 = (uint64_t *)v40;
  v384 = v69;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v69)(v39, 1, 1, v40);
  unint64_t v70 = *(void (**)(void))(v352 + 104);
  unsigned int v344 = *MEMORY[0x263F06E50];
  uint64_t v369 = v11;
  v366 = (void (*)(char *, void, uint64_t))v70;
  uint64_t v367 = v352 + 104;
  v70(v14);
  v368 = v14;
  sub_260FE2F50();
  v372 = v68;
  v350 = v59;
  AppleDiffusionPipeline.ResourceURLs.init(resourcesAt:)((uint64_t)v59, v68);
  uint64_t v71 = qword_270D22AB8;
  unint64_t v72 = (void *)MEMORY[0x263F8EE78];
  if (qword_270D22AB8)
  {
    *(void *)&v396[0] = MEMORY[0x263F8EE78];
    sub_260F638F8(0, qword_270D22AB8, 0);
    unint64_t v73 = &byte_270D22AC8;
    do
    {
      int v74 = *v73++;
      switch(v74)
      {
        case 1:
          sub_260FE32D0();
          break;
        case 2:
          sub_260FE32F0();
          break;
        case 3:
          sub_260FE32A0();
          break;
        case 4:
          sub_260FE3290();
          break;
        case 5:
          sub_260FE32E0();
          break;
        case 6:
          sub_260FE3300();
          break;
        case 7:
          sub_260FE32B0();
          break;
        case 8:
          sub_260FE3310();
          break;
        case 9:
          sub_260FE32C0();
          break;
        default:
          sub_260FE3320();
          break;
      }
      uint64_t v75 = *((void *)&v398 + 1);
      uint64_t v76 = v399;
      int v77 = __swift_project_boxed_opaque_existential_1(&v397, *((uint64_t *)&v398 + 1));
      *((void *)&v410 + 1) = v75;
      *(void *)&long long v411 = *(void *)(v76 + 8);
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v409);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v75 - 8) + 16))(boxed_opaque_existential_1Tm, v77, v75);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v397);
      uint64_t v79 = *(void *)&v396[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_260F638F8(0, *(void *)(v79 + 16) + 1, 1);
        uint64_t v79 = *(void *)&v396[0];
      }
      unint64_t v81 = *(void *)(v79 + 16);
      unint64_t v80 = *(void *)(v79 + 24);
      if (v81 >= v80 >> 1) {
        sub_260F638F8(v80 > 1, v81 + 1, 1);
      }
      uint64_t v82 = *((void *)&v410 + 1);
      uint64_t v83 = v411;
      uint64_t v84 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v409, *((uint64_t *)&v410 + 1));
      MEMORY[0x270FA5388](v84, v84);
      char v86 = (char *)v335 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v87 + 16))(v86);
      sub_260FDA5C4(v81, (uint64_t)v86, (uint64_t *)v396, v82, v83);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v409);
      --v71;
    }
    while (v71);
    unint64_t v72 = *(void **)&v396[0];
  }
  sub_260FE3280();
  uint64_t v88 = (void *)*((void *)&v410 + 1);
  uint64_t v89 = v411;
  uint64_t v90 = __swift_project_boxed_opaque_existential_1(&v409, *((uint64_t *)&v410 + 1));
  *((void *)&v398 + 1) = v88;
  v383 = *(void (***)(uint64_t))(v89 + 8);
  *(void *)&long long v399 = v383;
  char v91 = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v397);
  uint64_t v92 = *(void *)(*(v88 - 1) + 16);
  ((void (*)(uint64_t *, void *, void *))v92)(v91, v90, v88);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v394 = v72;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_186:
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_260FCDCD0(0, v72[2] + 1, 1, v72);
    unint64_t v72 = (void *)isUniquelyReferenced_nonNull_native;
    v394 = (void *)isUniquelyReferenced_nonNull_native;
  }
  unint64_t v96 = v72[2];
  unint64_t v95 = v72[3];
  if (v96 >= v95 >> 1)
  {
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_260FCDCD0((void *)(v95 > 1), v96 + 1, 1, v72);
    v394 = (void *)isUniquelyReferenced_nonNull_native;
  }
  MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v94);
  int64_t v98 = (char *)v335 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(char *, uint64_t *, void *))v92)(v98, v91, v88);
  sub_260FDA52C(v96, (uint64_t)v98, (uint64_t *)&v394, (uint64_t)v88, (uint64_t)v383);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v397);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v409);
  uint64_t v99 = v385[3];
  uint64_t v100 = v385[4];
  uint64_t v101 = __swift_project_boxed_opaque_existential_1(v385, v99);
  *((void *)&v410 + 1) = v99;
  uint64_t v102 = *(void *)(v100 + 8);
  *(void *)&long long v411 = v102;
  char v103 = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v409);
  unint64_t v104 = *(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v99 - 8) + 16);
  v104(v103, v101, v99);
  unint64_t v105 = v394;
  uint64_t v106 = swift_isUniquelyReferenced_nonNull_native();
  if ((v106 & 1) == 0)
  {
    uint64_t v106 = (uint64_t)sub_260FCDCD0(0, v105[2] + 1, 1, v105);
    unint64_t v105 = (void *)v106;
    v394 = (void *)v106;
  }
  unint64_t v109 = v105[2];
  unint64_t v108 = v105[3];
  if (v109 >= v108 >> 1)
  {
    uint64_t v106 = (uint64_t)sub_260FCDCD0((void *)(v108 > 1), v109 + 1, 1, v105);
    v394 = (void *)v106;
  }
  MEMORY[0x270FA5388](v106, v107);
  int64_t v111 = (char *)v335 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104((uint64_t *)v111, v103, v99);
  sub_260FDA52C(v109, (uint64_t)v111, (uint64_t *)&v394, v99, v102);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v409);
  uint64_t v112 = v353;
  *(void (***)(char *, uint64_t))((char *)v353
                                          + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_lockableAssetResources) = (void (**)(char *, uint64_t))v394;
  swift_bridgeObjectRetain_n();
  uint64_t v113 = v363;
  uint64_t v114 = v386;
  sub_260FE3430();
  if (!v114)
  {
    uint64_t v115 = (uint64_t)v379;
    (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v347 + 16))(v379, v113, v348);
    uint64_t v92 = (uint64_t)v373;
    sub_260F7EF88((uint64_t)v372, (uint64_t)v373);
    uint64_t v116 = v375;
    sub_260FDF5D0(v115, v92, v375);
    v386 = 0;
    v364 = (uint64_t *)((char *)v112 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_resourceURLs);
    sub_260FDAEE4((uint64_t)v116, (uint64_t)v112 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_resourceURLs);
    uint64_t v118 = MEMORY[0x263F8EE78];
    unint64_t v361 = sub_260F5C0C0(MEMORY[0x263F8EE78]);
    uint64_t v88 = (void *)sub_260F5C0E0(v118);
    uint64_t v358 = qword_270D22AB8;
    if (qword_270D22AB8)
    {
      int64_t v119 = 0;
      unint64_t v355 = v359 + 16;
      v380 = (void (**)(char *, uint64_t))*(int *)(v341 + 28);
      v379 = (char *)(v359 + 48);
      v351 = (void (**)(void))(v359 + 32);
      v360 = (void (**)(uint64_t, uint64_t *))(v359 + 8);
      v337 = (void (**)(char *, uint64_t))(v352 + 8);
      *((void *)&v120 + 1) = 2;
      long long v336 = xmmword_260FE7080;
      *(void *)&long long v120 = 136315394;
      long long v343 = v120;
      uint64_t v342 = MEMORY[0x263F8EE58] + 8;
      char v91 = v382;
      uint64_t v122 = v377;
      uint64_t v121 = v378;
      unint64_t v72 = v374;
      while (1)
      {
        if ((unint64_t)v119 >= qword_270D22AB8)
        {
          __break(1u);
          goto LABEL_186;
        }
        v375 = v88;
        dispatch_semaphore_t v373 = v119;
        uint64_t v125 = *((unsigned __int8 *)&unk_270D22AA8 + (void)v119 + 32);
        v385 = (void *)sub_260F5C538(MEMORY[0x263F8EE78]);
        uint64_t v126 = *(uint64_t *)((char *)v380 + (void)v372);
        if (*(void *)(v126 + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v92 = v125;
          unint64_t v127 = sub_260DBB068(v125);
          if (v128)
          {
            (*(void (**)(uint64_t, unint64_t, uint64_t *))(v359 + 16))(v122, *(void *)(v126 + 56) + *(void *)(v359 + 72) * v127, v91);
            uint64_t v129 = v122;
            uint64_t v130 = 0;
          }
          else
          {
            uint64_t v129 = v122;
            uint64_t v130 = 1;
          }
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v384)(v129, v130, 1, v91);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v92 = v125;
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v384)(v122, 1, 1, v91);
        }
        uint64_t v131 = *(uint64_t *)((char *)v380 + (void)v364);
        if (*(void *)(v131 + 16) && (unint64_t v132 = sub_260DBB068(v92), (v133 & 1) != 0))
        {
          uint64_t v134 = v371;
          (*(void (**)(uint64_t, unint64_t, uint64_t *))(v359 + 16))(v371, *(void *)(v131 + 56) + *(void *)(v359 + 72) * v132, v91);
          uint64_t v135 = 0;
        }
        else
        {
          uint64_t v135 = 1;
          uint64_t v134 = v371;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v384)(v134, v135, 1, v91);
        uint64_t v136 = v121 + v362[12];
        sub_260F8E90C(v122, v121);
        sub_260F8E90C(v134, v136);
        uint64_t v137 = v134;
        v138 = v91;
        v139 = *(unsigned int (**)(void, void, void))v379;
        int v140 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))v379)(v121, 1, v138);
        LODWORD(v383) = v92;
        if (v140 == 1) {
          break;
        }
        uint64_t v144 = v354;
        sub_260F8E90C(v121, v354);
        v143 = (unsigned int (*)(uint64_t, uint64_t, uint64_t *))v139;
        if (v139(v136, 1, v138) == 1)
        {
          sub_260D90820(v371, &qword_26A8E7588);
          sub_260D90820(v377, &qword_26A8E7588);
          (*v360)(v144, v138);
          uint64_t v142 = v376;
LABEL_51:
          sub_260D90820(v378, &qword_26A8EB428);
          goto LABEL_52;
        }
        uint64_t v152 = v144;
        v153 = v350;
        ((void (*)(char *, uint64_t, uint64_t *))*v351)(v350, v136, v138);
        sub_260FDB1A0((unint64_t *)&qword_26A8EB458, MEMORY[0x263F06EA8]);
        char v154 = sub_260FE3FD0();
        v155 = *v360;
        (*v360)((uint64_t)v153, v138);
        sub_260D90820(v371, &qword_26A8E7588);
        sub_260D90820(v377, &qword_26A8E7588);
        uint64_t v156 = v152;
        uint64_t v92 = v383;
        v155(v156, v138);
        v143 = (unsigned int (*)(uint64_t, uint64_t, uint64_t *))v139;
        sub_260D90820(v378, &qword_26A8E7588);
        uint64_t v142 = v376;
        if (v154) {
          goto LABEL_55;
        }
LABEL_52:
        v145 = v363;
        sub_260FD2AD0(v363, v92, v142);
        uint64_t v146 = sub_260FD2D90((uint64_t)v145, v92);
        if (v147)
        {
          uint64_t v148 = v146;
          uint64_t v149 = v147;
          v150 = v385;
          char v151 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v409 = v150;
          sub_260FC703C(v148, v149, 0, v151);
          v385 = (void *)v409;
          swift_bridgeObjectRelease();
LABEL_62:
          uint64_t v167 = (uint64_t)v365;
          v168 = v382;
          unint64_t v72 = v374;
          goto LABEL_69;
        }
        v162 = v385;
        swift_bridgeObjectRetain();
        unint64_t v163 = sub_260DBB3F8(0);
        char v165 = v164;
        swift_bridgeObjectRelease();
        if ((v165 & 1) == 0) {
          goto LABEL_62;
        }
        int v166 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v409 = v162;
        unint64_t v72 = v374;
        if (!v166)
        {
          sub_260FC5558();
          v162 = (void *)v409;
        }
        v385 = v162;
        sub_260FC6184(v163, (uint64_t)v162);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v167 = (uint64_t)v365;
        v168 = v382;
LABEL_69:
        sub_260F8E90C(v142, v167);
        if (v143(v167, 1, v168) == 1)
        {
          sub_260D90820(v167, &qword_26A8E7588);
          uint64_t v122 = v377;
          v182 = v385;
        }
        else
        {
          v183 = v357;
          (*v351)();
          v184 = v386;
          uint64_t v185 = sub_260FE2FB0();
          uint64_t v122 = v377;
          char v91 = v168;
          v182 = v385;
          if (!v184)
          {
            uint64_t v92 = v186;
            uint64_t v204 = v185;
            sub_260FE29B0();
            swift_allocObject();
            sub_260FE29A0();
            sub_260FB2640();
            sub_260FE2980();
            v339 = (unsigned int (*)(void, void, void))v204;
            v386 = 0;
            swift_release();
            v425[8] = v417;
            v425[9] = v418;
            v425[10] = v419;
            v425[11] = v420;
            v425[4] = v413;
            v425[5] = v414;
            v425[6] = v415;
            v425[7] = v416;
            v425[0] = v409;
            v425[1] = v410;
            v425[2] = v411;
            v425[3] = v412;
            v205 = v375;
            char v206 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v397 = v205;
            char v207 = (char)v383;
            sub_260FC6E40(v425, v383, v206);
            v208 = (void *)v397;
            swift_bridgeObjectRelease();
            if (v208[2])
            {
              unint64_t v209 = sub_260DBB068(v207);
              v203 = v370;
              if (v210)
              {
                v211 = (long long *)(v208[7] + 192 * v209);
                long long v213 = v211[2];
                long long v212 = v211[3];
                long long v214 = v211[1];
                long long v397 = *v211;
                long long v398 = v214;
                long long v399 = v213;
                long long v400 = v212;
                long long v215 = v211[4];
                long long v216 = v211[5];
                long long v217 = v211[7];
                long long v403 = v211[6];
                long long v404 = v217;
                long long v401 = v215;
                long long v402 = v216;
                long long v218 = v211[8];
                long long v219 = v211[9];
                long long v220 = v211[10];
                long long v408 = v211[11];
                long long v407 = v220;
                long long v406 = v219;
                long long v405 = v218;
                memmove(&v409, v211, 0xC0uLL);
                nullsub_1(&v409);
                sub_260F32B24((uint64_t *)&v397);
              }
              else
              {
                sub_260F32AFC((uint64_t)&v397);
                sub_260DD7C14((uint64_t)&v397, (uint64_t)&v409, &qword_26A8EA0B8);
              }
            }
            else
            {
              sub_260F32AFC((uint64_t)&v397);
              sub_260DD7C14((uint64_t)&v397, (uint64_t)&v409, &qword_26A8EA0B8);
              v203 = v370;
            }
            sub_260DD7C14((uint64_t)&v409, (uint64_t)v396, &qword_26A8EA0B8);
            sub_260DD7C14((uint64_t)v396, (uint64_t)&v397, &qword_26A8EA0B8);
            int v221 = sub_260F32AD8((uint64_t)&v397);
            v375 = v208;
            if (v221 == 1
              || (uint64_t v222 = v415,
                  sub_260DD7C14((uint64_t)&v409, (uint64_t)v395, &qword_26A8EA0B8),
                  swift_bridgeObjectRetain(),
                  sub_260F891F8(v395),
                  !v222))
            {
              swift_bridgeObjectRetain();
              unint64_t v236 = sub_260DBB3F8(2u);
              char v238 = v237;
              swift_bridgeObjectRelease();
              if (v238)
              {
                char v239 = swift_isUniquelyReferenced_nonNull_native();
                v395[0] = (uint64_t)v182;
                if ((v239 & 1) == 0)
                {
                  sub_260FC5558();
                  v182 = (void *)v395[0];
                }
                sub_260FC6184(v236, (uint64_t)v182);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              sub_260DCC110((uint64_t)v339, v92);
            }
            else
            {
              v338 = (void (*)(uint64_t, uint64_t *))v92;
              uint64_t v92 = (uint64_t)v91;
              v223 = v72;
              int64_t v224 = *(void *)(v222 + 16);
              if (v224)
              {
                uint64_t v225 = v222;
                unint64_t v389 = MEMORY[0x263F8EE78];
                sub_260DB45C4(0, v224, 0);
                unint64_t v226 = v389;
                v335[1] = v225;
                uint64_t v227 = v225 + 48;
                do
                {
                  uint64_t v228 = *(unsigned __int8 *)(v227 - 16);
                  v227 += 32;
                  unint64_t v229 = 0xE400000000000000;
                  uint64_t v230 = 1936876912;
                  switch(v228)
                  {
                    case 1:
                      unint64_t v229 = 0xE90000000000006ELL;
                      uint64_t v230 = 0x6F6974616D696E61;
                      break;
                    case 2:
                      unint64_t v229 = 0xE800000000000000;
                      uint64_t v230 = 0x7472615F656E696CLL;
                      break;
                    case 3:
                      unint64_t v229 = 0xE500000000000000;
                      uint64_t v230 = 0x696A6F6D65;
                      break;
                    case 4:
                      unint64_t v229 = 0xE300000000000000;
                      uint64_t v230 = 7168876;
                      break;
                    case 5:
                      unint64_t v229 = 0xEC0000006E6F6974;
                      uint64_t v230 = 0x61727473756C6C69;
                      break;
                    case 6:
                      unint64_t v229 = 0xE600000000000000;
                      uint64_t v230 = 0x686374656B73;
                      break;
                    case 7:
                      unint64_t v229 = 0xEE00656C62626972;
                      uint64_t v230 = 0x63735F656C797473;
                      break;
                    case 8:
                      unint64_t v229 = 0xE800000000000000;
                      uint64_t v230 = 0x737265705F6D636CLL;
                      break;
                    case 9:
                      uint64_t v230 = 0x6E776F6E6B6E753CLL;
                      unint64_t v229 = 0xE90000000000003ELL;
                      break;
                    default:
                      break;
                  }
                  unint64_t v387 = v230;
                  unint64_t v388 = v229;
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_260FE4250();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRetain();
                  sub_260FE4250();
                  unint64_t v231 = v387;
                  unint64_t v232 = v388;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  unint64_t v389 = v226;
                  unint64_t v234 = *(void *)(v226 + 16);
                  unint64_t v233 = *(void *)(v226 + 24);
                  if (v234 >= v233 >> 1)
                  {
                    sub_260DB45C4(v233 > 1, v234 + 1, 1);
                    unint64_t v226 = v389;
                  }
                  *(void *)(v226 + 16) = v234 + 1;
                  unint64_t v235 = v226 + 16 * v234;
                  *(void *)(v235 + 32) = v231;
                  *(void *)(v235 + 40) = v232;
                  --v224;
                }
                while (v224);
                swift_bridgeObjectRelease();
                uint64_t v92 = (uint64_t)v382;
                v203 = v370;
                v223 = v374;
                v182 = v385;
              }
              else
              {
                swift_bridgeObjectRelease();
                unint64_t v226 = MEMORY[0x263F8EE78];
              }
              unint64_t v387 = v226;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E66D8);
              sub_260E423DC();
              uint64_t v240 = sub_260FE3F90();
              uint64_t v242 = v241;
              swift_bridgeObjectRelease();
              char v243 = swift_isUniquelyReferenced_nonNull_native();
              unint64_t v387 = (unint64_t)v182;
              sub_260FC703C(v240, v242, 2u, v243);
              v182 = (void *)v387;
              swift_bridgeObjectRelease();
              sub_260DCC110((uint64_t)v339, (unint64_t)v338);
              uint64_t v122 = v377;
              unint64_t v72 = v223;
              char v91 = (uint64_t *)v92;
            }
            (*v360)((uint64_t)v357, v91);
            sub_260D90820(v376, &qword_26A8E7588);
            goto LABEL_79;
          }

          (*v360)((uint64_t)v183, v168);
        }
        type metadata accessor for AppleDiffusionMetadataError();
        sub_260FDB1A0((unint64_t *)&qword_26A8EB060, (void (*)(uint64_t))type metadata accessor for AppleDiffusionMetadataError);
        v187 = (void *)swift_allocError();
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        sub_260D90820(v376, &qword_26A8E7588);
        v386 = 0;
        char v91 = v168;
        if (qword_26A8EA918 != -1) {
          swift_once();
        }
        uint64_t v188 = sub_260FE3A10();
        __swift_project_value_buffer(v188, (uint64_t)qword_26A90FC00);
        id v189 = v187;
        id v190 = v187;
        v191 = sub_260FE39F0();
        os_log_type_t v192 = sub_260FE4890();
        if (os_log_type_enabled(v191, v192))
        {
          uint64_t v193 = swift_slowAlloc();
          v194 = (void *)swift_slowAlloc();
          uint64_t v195 = swift_slowAlloc();
          *(void *)&long long v409 = v195;
          *(_DWORD *)uint64_t v193 = v343;
          unint64_t v196 = AppleDiffusionAdapter.rawValue.getter((char)v383);
          *(void *)(v193 + 4) = sub_260DB2844(v196, v197, (uint64_t *)&v409);
          v182 = v385;
          uint64_t v92 = (uint64_t)v374;
          swift_bridgeObjectRelease();
          *(_WORD *)(v193 + 12) = 2112;
          id v198 = v187;
          uint64_t v199 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v193 + 14) = v199;
          void *v194 = v199;

          _os_log_impl(&dword_260D82000, v191, v192, "Error decoding adapter metadata for %s: %@", (uint8_t *)v193, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6FB0);
          swift_arrayDestroy();
          v200 = v194;
          uint64_t v122 = v377;
          MEMORY[0x26122CA00](v200, -1, -1);
          swift_arrayDestroy();
          uint64_t v201 = v195;
          char v91 = v382;
          MEMORY[0x26122CA00](v201, -1, -1);
          uint64_t v202 = v193;
          unint64_t v72 = (void *)v92;
          MEMORY[0x26122CA00](v202, -1, -1);
        }
        else
        {
        }
        v203 = v370;
LABEL_79:
        uint64_t v121 = v378;
        if (v182[2])
        {
          unint64_t v123 = v361;
          char v124 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v409 = v123;
          sub_260FC6CA0((uint64_t)v182, v383, v124);
          unint64_t v361 = v409;
        }
        swift_bridgeObjectRelease();
        uint64_t v88 = v375;
        int64_t v119 = ((char *)&v373->isa + 1);
        if ((Class *)((char *)&v373->isa + 1) == (Class *)v358) {
          goto LABEL_113;
        }
      }
      sub_260D90820(v137, &qword_26A8E7588);
      uint64_t v92 = v383;
      sub_260D90820(v122, &qword_26A8E7588);
      unsigned int v141 = v139(v136, 1, v138);
      uint64_t v142 = v376;
      v143 = (unsigned int (*)(uint64_t, uint64_t, uint64_t *))v139;
      if (v141 == 1)
      {
        sub_260D90820(v378, &qword_26A8E7588);
LABEL_55:
        uint64_t v157 = *(uint64_t *)((char *)v380 + (void)v364);
        unint64_t v72 = v374;
        if (*(void *)(v157 + 16))
        {
          unint64_t v158 = sub_260DBB068(v92);
          uint64_t v159 = (uint64_t)v349;
          if (v160)
          {
            (*(void (**)(char *, unint64_t, uint64_t *))(v359 + 16))(v349, *(void *)(v157 + 56) + *(void *)(v359 + 72) * v158, v382);
            uint64_t v161 = 0;
          }
          else
          {
            uint64_t v161 = 1;
          }
        }
        else
        {
          uint64_t v161 = 1;
          uint64_t v159 = (uint64_t)v349;
        }
        uint64_t v169 = (uint64_t)v356;
        v168 = v382;
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v384)(v159, v161, 1, v382);
        unsigned int v170 = v143(v159, 1, v168);
        uint64_t v167 = (uint64_t)v365;
        if (v170)
        {
          uint64_t v92 = (uint64_t)&qword_26A8E7588;
          sub_260D90820(v159, &qword_26A8E7588);
          uint64_t v171 = 1;
        }
        else
        {
          v172 = v350;
          (*(void (**)(char *, uint64_t, uint64_t *))v355)(v350, v159, v168);
          uint64_t v92 = (uint64_t)&qword_26A8E7588;
          sub_260D90820(v159, &qword_26A8E7588);
          v173 = v345;
          sub_260FE2F00();
          v338 = *v360;
          v339 = (unsigned int (*)(void, void, void))v143;
          v338((uint64_t)v172, v382);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6C88);
          uint64_t v174 = swift_allocObject();
          *(_OWORD *)(v174 + 16) = v336;
          unint64_t v175 = AppleDiffusionAdapter.rawValue.getter((char)v383);
          *(void *)&long long v409 = 0x736A2E6174656D2ELL;
          *((void *)&v409 + 1) = 0xEA00000000006E6FLL;
          *(void *)&long long v397 = v175;
          *((void *)&v397 + 1) = v176;
          swift_bridgeObjectRetain();
          *(void *)&long long v397 = sub_260FE42F0();
          *((void *)&v397 + 1) = v177;
          sub_260FE4240();
          swift_bridgeObjectRelease();
          uint64_t v178 = *((void *)&v397 + 1);
          *(void *)(v174 + 32) = v397;
          *(void *)(v174 + 40) = v178;
          v180 = v368;
          uint64_t v179 = v369;
          v366(v368, v344, v369);
          sub_260D86D20();
          v181 = v173;
          sub_260FE2F60();
          uint64_t v167 = (uint64_t)v365;
          swift_bridgeObjectRelease();
          uint64_t v169 = (uint64_t)v356;
          (*v337)(v180, v179);
          unint64_t v72 = v374;
          v338((uint64_t)v181, v382);
          v143 = (unsigned int (*)(uint64_t, uint64_t, uint64_t *))v339;
          v168 = v382;
          uint64_t v171 = 0;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v384)(v169, v171, 1, v168);
        sub_260DD7C14(v169, v142, &qword_26A8E7588);
        goto LABEL_69;
      }
      goto LABEL_51;
    }
    char v91 = v382;
    v203 = v370;
LABEL_113:
    swift_bridgeObjectRelease();
    v244 = v353;
    *(void (***)(char *, uint64_t))((char *)v353
                                            + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_adapterMetadata) = (void (**)(char *, uint64_t))v88;
    *(void (***)(char *, uint64_t))((char *)v244
                                            + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_adapterVersions) = (void (**)(char *, uint64_t))v361;
    v375 = v88;
    swift_bridgeObjectRetain();
    uint64_t v245 = MEMORY[0x263F8EE78];
    unint64_t v361 = sub_260F5C100(MEMORY[0x263F8EE78]);
    unint64_t v387 = sub_260F5C204(v245);
    v357 = (char *)sub_260F5C408(v245);
    uint64_t v247 = qword_270D22B38;
    if (!qword_270D22B38)
    {
LABEL_184:
      (*(void (**)(void, uint64_t))(v347 + 8))(v363, v348);
      sub_260F7EF10((uint64_t)v372);
      uint64_t v112 = v353;
      *(void (***)(char *, uint64_t))((char *)v353
                                              + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_modelDescription) = (void (**)(char *, uint64_t))v361;
      *(void (***)(char *, uint64_t))((char *)v112
                                              + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentVersions) = (void (**)(char *, uint64_t))v357;
      *(void (***)(char *, uint64_t))((char *)v112
                                              + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentMetadata) = (void (**)(char *, uint64_t))v387;
      swift_bridgeObjectRelease();
      return v112;
    }
    v383 = (void (**)(uint64_t))((char *)v364 + *(int *)(v341 + 24));
    v380 = (void (**)(char *, uint64_t))(v352 + 8);
    v248 = &byte_270D22B48;
    LODWORD(v379) = *MEMORY[0x263F06E38];
    v384 = (void (**)(char *, uint64_t *))(v359 + 8);
    uint64_t v378 = (v359 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v356 = (char *)*MEMORY[0x263F00CF0];
    *(void *)&long long v246 = 136315394;
    long long v359 = v246;
    uint64_t v358 = MEMORY[0x263F8EE58] + 8;
    uint64_t v354 = (uint64_t)"personalized_animation";
    unint64_t v355 = (unint64_t)"imageConditioner";
    v360 = (void (**)(uint64_t, uint64_t *))(MEMORY[0x263F8EE60] + 8);
    while (1)
    {
      uint64_t v250 = *v248;
      v385 = v248 + 1;
      v251 = *v383;
      swift_retain();
      v251(v250);
      swift_release();
      *(void *)&long long v409 = 0x646C6D65726F632FLL;
      *((void *)&v409 + 1) = 0xEF6E69622E617461;
      v253 = v368;
      uint64_t v252 = v369;
      v366(v368, v379, v369);
      sub_260D86D20();
      sub_260FE2F70();
      (*v380)(v253, v252);
      swift_bridgeObjectRelease();
      v254 = v386;
      unint64_t v255 = sub_260FE2FB0();
      if (v254)
      {

        v249 = (char *)*v384;
        (*v384)(v203, v91);
        v386 = 0;
LABEL_116:
        ((void (*)(char *, uint64_t *))v249)(v381, v91);
        goto LABEL_117;
      }
      unsigned __int8 v257 = BYTE6(v256);
      uint64_t v377 = v250;
      int v258 = v255;
      v386 = 0;
      switch(v256 >> 62)
      {
        case 1uLL:
          unint64_t v260 = HIDWORD(v255);
          sub_260DCC110(v255, v256);
          if (__OFSUB__(v260, v258))
          {
            __break(1u);
LABEL_188:
            __break(1u);
          }
          uint64_t v259 = (int)v260 - v258;
LABEL_127:
          v249 = (char *)*v384;
          (*v384)(v203, v91);
          if (v259 < 1) {
            goto LABEL_116;
          }
          v263 = v381;
          v264 = (void *)sub_260FE2EF0();
          v265 = self;
          *(void *)&long long v409 = 0;
          id v266 = objc_msgSend(v265, sel_modelAssetWithURL_error_, v264, &v409);

          v267 = (void *)v409;
          if (!v266)
          {
            id v277 = (id)v409;
            v278 = (void *)sub_260FE2E30();

            swift_willThrow();
            ((void (*)(char *, uint64_t *))v249)(v263, v382);
            goto LABEL_150;
          }
          v365 = v249;
          uint64_t v376 = v247;
          uint64_t v268 = swift_allocObject();
          *(void *)(v268 + 16) = v266;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB440);
          uint64_t v269 = swift_allocObject();
          *(void *)(v269 + 16) = 0;
          *(unsigned char *)(v269 + 24) = -1;
          id v270 = v267;
          v362 = (int *)v266;
          dispatch_semaphore_t v271 = dispatch_semaphore_create(0);
          uint64_t v272 = sub_260FE4520();
          uint64_t v273 = *(void *)(v272 - 8);
          uint64_t v274 = (uint64_t)v346;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v273 + 56))(v346, 1, 1, v272);
          v275 = (void *)swift_allocObject();
          v275[2] = 0;
          v374 = v275 + 2;
          v275[3] = 0;
          v275[4] = &unk_26A8EB438;
          v275[5] = v268;
          v275[6] = v269;
          v275[7] = v271;
          int v276 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v273 + 48))(v274, 1, v272);
          uint64_t v371 = v268;
          swift_retain();
          swift_retain();
          dispatch_semaphore_t v373 = v271;
          if (v276 == 1)
          {
            sub_260D90820(v274, &qword_26A8E6828);
          }
          else
          {
            sub_260FE4510();
            (*(void (**)(uint64_t, uint64_t))(v273 + 8))(v274, v272);
          }
          uint64_t v247 = v376;
          if (*v374)
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            uint64_t v279 = sub_260FE44A0();
            uint64_t v281 = v280;
            swift_unknownObjectRelease();
          }
          else
          {
            uint64_t v279 = 0;
            uint64_t v281 = 0;
          }
          v203 = v370;
          dispatch_semaphore_t v282 = v373;
          uint64_t v283 = swift_allocObject();
          *(void *)(v283 + 16) = &unk_26A8EB450;
          *(void *)(v283 + 24) = v275;
          if (v281 | v279)
          {
            uint64_t v390 = 0;
            uint64_t v391 = 0;
            uint64_t v392 = v279;
            uint64_t v393 = v281;
          }
          swift_task_create();
          swift_release();
          sub_260FE4990();
          int v284 = *(unsigned __int8 *)(v269 + 24);
          if (v284 == 255)
          {
            __break(1u);
            JUMPOUT(0x260FD9DA4);
          }
          v278 = *(void **)(v269 + 16);
          if (v284)
          {
            *(void *)&long long v409 = *(void *)(v269 + 16);
            id v300 = v278;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6FA8);
            swift_willThrowTypedImpl();
            swift_release();

            ((void (*)(char *, uint64_t *))v365)(v381, v382);
            swift_release();

            goto LABEL_151;
          }
          id v285 = v278;
          swift_release();
          swift_release();

          unint64_t v286 = v361;
          char v287 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v409 = v286;
          uint64_t v288 = v377;
          sub_260FC6B68((uint64_t)v285, v377, v287);
          unint64_t v289 = v409;
          swift_bridgeObjectRelease();
          uint64_t v290 = *(void *)(v289 + 16);
          unint64_t v361 = v289;
          if (v290 && (uint64_t v291 = sub_260DBB4C8(v288), (v292 & 1) != 0))
          {
            id v293 = objc_msgSend(*(id *)(*(void *)(v289 + 56) + 8 * v291), sel_metadata);
            type metadata accessor for MLModelMetadataKey(0);
            sub_260FDB1A0((unint64_t *)&qword_26A8EAC50, type metadata accessor for MLModelMetadataKey);
            uint64_t v294 = sub_260FE3EB0();

            v295 = v382;
            v296 = (void (*)(char *, uint64_t *))v365;
            if (*(void *)(v294 + 16))
            {
              v297 = v356;
              unint64_t v298 = sub_260F80CD8((uint64_t)v297);
              if (v299)
              {
                sub_260D90650(*(void *)(v294 + 56) + 32 * v298, (uint64_t)&v409);
              }
              else
              {
                long long v410 = 0u;
                long long v409 = 0u;
              }
            }
            else
            {
              long long v410 = 0u;
              long long v409 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v410 + 1))
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E8B48);
              if (swift_dynamicCast()) {
                uint64_t v301 = v397;
              }
              else {
                uint64_t v301 = 0;
              }
              goto LABEL_148;
            }
          }
          else
          {
            long long v410 = 0u;
            long long v409 = 0u;
            v295 = v382;
            v296 = (void (*)(char *, uint64_t *))v365;
          }
          sub_260D90820((uint64_t)&v409, (uint64_t *)&unk_26A8EA270);
          uint64_t v301 = 0;
LABEL_148:
          v302 = v386;
          sub_260FA5674(v301, v421);
          v278 = v302;
          if (v302)
          {
            v296(v381, v295);

            swift_bridgeObjectRelease();
LABEL_150:
            v386 = 0;
LABEL_151:
            if (qword_26A8EA918 != -1) {
              swift_once();
            }
            uint64_t v303 = sub_260FE3A10();
            __swift_project_value_buffer(v303, (uint64_t)qword_26A90FC00);
            id v304 = v278;
            id v305 = v278;
            v306 = sub_260FE39F0();
            os_log_type_t v307 = sub_260FE4890();
            if (os_log_type_enabled(v306, v307))
            {
              uint64_t v308 = swift_slowAlloc();
              v309 = (void *)swift_slowAlloc();
              uint64_t v310 = swift_slowAlloc();
              *(void *)&long long v409 = v310;
              *(_DWORD *)uint64_t v308 = v359;
              unint64_t v311 = 0xE400000000000000;
              uint64_t v312 = 1952804469;
              switch(v377)
              {
                case 1:
                  uint64_t v312 = 0x6E75684374656E75;
                  unint64_t v311 = 0xEA0000000000316BLL;
                  break;
                case 2:
                  uint64_t v312 = 0x6E75684374656E75;
                  unint64_t v311 = 0xEA0000000000326BLL;
                  break;
                case 3:
                  unint64_t v311 = 0xEB00000000726564;
                  uint64_t v312 = 0x6F636E4570696C63;
                  break;
                case 4:
                  uint64_t v312 = 0x7265646F636E65;
                  unint64_t v311 = 0xE700000000000000;
                  break;
                case 5:
                  unint64_t v311 = 0xE700000000000000;
                  uint64_t v312 = 0x7265646F636564;
                  break;
                case 6:
                  unint64_t v311 = 0xEC0000007265646FLL;
                  uint64_t v312 = 0x6365446168706C61;
                  break;
                case 7:
                  uint64_t v312 = 0xD000000000000011;
                  unint64_t v311 = v355 | 0x8000000000000000;
                  break;
                case 8:
                  unint64_t v311 = v354 | 0x8000000000000000;
                  uint64_t v312 = 0xD000000000000010;
                  break;
                default:
                  break;
              }
              *(void *)(v308 + 4) = sub_260DB2844(v312, v311, (uint64_t *)&v409);
              swift_bridgeObjectRelease();
              *(_WORD *)(v308 + 12) = 2112;
              id v332 = v278;
              uint64_t v333 = _swift_stdlib_bridgeErrorToNSError();
              *(void *)(v308 + 14) = v333;
              void *v309 = v333;

              _os_log_impl(&dword_260D82000, v306, v307, "Error decoding base model metadata for %s: %@", (uint8_t *)v308, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6FB0);
              swift_arrayDestroy();
              MEMORY[0x26122CA00](v309, -1, -1);
              swift_arrayDestroy();
              MEMORY[0x26122CA00](v310, -1, -1);
              MEMORY[0x26122CA00](v308, -1, -1);

              char v91 = v382;
              v203 = v370;
            }
            else
            {

              char v91 = v382;
            }
            goto LABEL_117;
          }
          v386 = 0;
          swift_bridgeObjectRelease();
          unint64_t v313 = sub_260F5C538(MEMORY[0x263F8EE78]);
          uint64_t v314 = v423;
          if (v423)
          {
            uint64_t v315 = v422;
            swift_bridgeObjectRetain();
            char v316 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v409 = v313;
            sub_260FC703C(v315, v314, 1u, v316);
            unint64_t v313 = v409;
            swift_bridgeObjectRelease();
          }
          uint64_t v317 = v377;
          sub_260DD7C14((uint64_t)v421, (uint64_t)&v397, &qword_26A8EA0B8);
          sub_260DD7C14((uint64_t)&v397, (uint64_t)&v409, &qword_26A8EA0B8);
          if (sub_260F32AD8((uint64_t)&v409) == 1)
          {
            sub_260F88698(v317, v395);
            sub_260DD7C14((uint64_t)v395, (uint64_t)v396, &qword_26A8EA0B8);
            sub_260F891F8((uint64_t *)v396);
          }
          else
          {
            sub_260DD7C14((uint64_t)&v397, (uint64_t)v396, &qword_26A8EA0B8);
            v424[8] = v396[8];
            v424[9] = v396[9];
            v424[10] = v396[10];
            v424[11] = v396[11];
            v424[4] = v396[4];
            v424[5] = v396[5];
            v424[6] = v396[6];
            v424[7] = v396[7];
            v424[0] = v396[0];
            v424[1] = v396[1];
            v424[2] = v396[2];
            v424[3] = v396[3];
            sub_260F32B24((uint64_t *)v396);
            uint64_t v318 = v387;
            char v319 = swift_isUniquelyReferenced_nonNull_native();
            v395[0] = v318;
            sub_260FC6B2C(v424, v317, v319);
            unint64_t v387 = v395[0];
            swift_bridgeObjectRelease();
          }
          sub_260F89180((uint64_t *)v421);
          v320 = *v383;
          swift_retain();
          v320(v317);
          swift_release();
          v321 = *(void (**)(uint64_t))&v372[*(int *)(v341 + 24)];
          swift_retain();
          uint64_t v322 = v317;
          v323 = v350;
          v321(v322);
          swift_release();
          sub_260FDB1A0((unint64_t *)&qword_26A8EB458, MEMORY[0x263F06EA8]);
          v324 = v382;
          char v325 = sub_260FE3FD0();
          v296(v323, v324);
          if ((v325 & 1) == 0)
          {
            uint64_t v326 = v364[1];
            if (v326)
            {
              uint64_t v327 = *v364;
              swift_bridgeObjectRetain();
              char v328 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v396[0] = v313;
              sub_260FC703C(v327, v326, 0, v328);
              unint64_t v313 = *(void *)&v396[0];
              swift_bridgeObjectRelease();
            }
          }
          uint64_t v329 = v377;
          if (*(void *)(v313 + 16))
          {
            v330 = v357;
            char v331 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&v396[0] = v330;
            sub_260FC6AF0(v313, v329, v331);
            v357 = *(char **)&v396[0];

            swift_bridgeObjectRelease();
            char v91 = v382;
            v296(v340, v382);
          }
          else
          {

            v334 = v382;
            v296(v340, v382);
            char v91 = v334;
            swift_bridgeObjectRelease();
          }
          v296(v381, v91);
LABEL_117:
          v248 = (char *)v385;
          if (!--v247) {
            goto LABEL_184;
          }
          break;
        case 2uLL:
          uint64_t v262 = *(void *)(v255 + 16);
          uint64_t v261 = *(void *)(v255 + 24);
          sub_260DCC110(v255, v256);
          uint64_t v259 = v261 - v262;
          if (!__OFSUB__(v261, v262)) {
            goto LABEL_127;
          }
          goto LABEL_188;
        case 3uLL:
          sub_260DCC110(v255, v256);
          uint64_t v259 = 0;
          goto LABEL_127;
        default:
          sub_260DCC110(v255, v256);
          uint64_t v259 = v257;
          goto LABEL_127;
      }
    }
  }
  v386 = v114;
  swift_bridgeObjectRelease();
  sub_260F7EF10((uint64_t)v372);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v385);
  swift_deallocPartialClassInstance();
  return v112;
}

uint64_t sub_260FD9E28(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x270FA2498](sub_260FD9E48, 0, 0);
}

uint64_t sub_260FD9E48()
{
  uint64_t v1 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_260F8BA40;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_260EC2C5C;
  v0[13] = &block_descriptor_4;
  v0[14] = v2;
  objc_msgSend(v1, sel_modelDescriptionWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t AppleDiffusionResourceFactory.imageClipEncoderVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentMetadata);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  uint64_t v2 = sub_260DBB4C8(0);
  if ((v3 & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(v1 + 56) + 192 * v2;
  uint64_t v5 = *(void *)(v4 + 40);
  uint64_t result = *(unsigned __int8 *)(v4 + 32);
  int v7 = *(unsigned __int8 *)(v4 + 32);
  if (!v5 || v7 == 3) {
    return 0;
  }
  return result;
}

uint64_t AppleDiffusionResourceFactory.textClipEncoderVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_baseModelComponentMetadata);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  uint64_t v2 = sub_260DBB4C8(0);
  uint64_t result = 0;
  if ((v4 & 1) == 0) {
    return result;
  }
  uint64_t v5 = *(void *)(v1 + 56) + 192 * v2;
  if (*(void *)(v5 + 112) != 1) {
    return *(unsigned char *)(v5 + 120) & 1;
  }
  else {
    return 0;
  }
}

uint64_t AppleDiffusionResourceFactory.madPersonalizedEmbeddingRevision.getter()
{
  if (AppleDiffusionResourceFactory.imageClipEncoderVersion.getter() >= 2u)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    if (AppleDiffusionResourceFactory.textClipEncoderVersion.getter()) {
      return 8;
    }
    BOOL v2 = (sub_260FE5150() & 1) == 0;
    uint64_t v3 = 7;
    goto LABEL_13;
  }
  char v0 = sub_260FE5150();
  swift_bridgeObjectRelease();
  if (v0) {
    goto LABEL_4;
  }
  if (AppleDiffusionResourceFactory.imageClipEncoderVersion.getter() != 1
    && (sub_260FE5150() & 1) == 0)
  {
    return 3;
  }
  if (AppleDiffusionResourceFactory.textClipEncoderVersion.getter()) {
    return 6;
  }
  BOOL v2 = (sub_260FE5150() & 1) == 0;
  uint64_t v3 = 5;
LABEL_13:
  if (v2) {
    return v3;
  }
  else {
    return v3 + 1;
  }
}

uint64_t AppleDiffusionResourceFactory.deinit()
{
  sub_260F7EF10(v0 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_resourceURLs);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC13DiffusionBase29AppleDiffusionResourceFactory_hedModel);
  return v0;
}

uint64_t AppleDiffusionResourceFactory.__deallocating_deinit()
{
  AppleDiffusionResourceFactory.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_260FDA240(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a6;
  v7[4] = a7;
  uint64_t v10 = (uint64_t (*)(void *))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[5] = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_260FDA320;
  return v10(v7 + 2);
}

uint64_t sub_260FDA320()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    BOOL v2 = sub_260FDA4AC;
  }
  else {
    BOOL v2 = sub_260FDA434;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260FDA434()
{
  uint64_t v1 = v0[3];
  BOOL v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[2];
  unsigned __int8 v3 = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = 0;
  sub_260FDB374(v2, v3);
  sub_260FE49A0();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_260FDA4AC()
{
  uint64_t v1 = v0[3];
  BOOL v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[6];
  unsigned __int8 v3 = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = 1;
  sub_260FDB374(v2, v3);
  sub_260FE49A0();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_260FDA52C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1Tm, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_260DD7B40(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_260FDA5C4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1Tm, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_260DD7B40(&v12, v10 + 40 * a1 + 32);
}

uint64_t _s13DiffusionBase05AppleA15ResourceFactoryC27areModelResourcesEquivalentySbSDySSSDyS2SGG_AFtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 64;
  char v5 = 1;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (1)
    {
      char v13 = v5;
      if (!v8) {
        break;
      }
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      char v5 = 0;
      if (v13)
      {
LABEL_23:
        uint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v15);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8 * v15);
        uint64_t v23 = *(void *)(a2 + 16);
        swift_bridgeObjectRetain();
        if (v23)
        {
          swift_bridgeObjectRetain();
          unint64_t v24 = sub_260DBACB4(v21, v20);
          if (v25)
          {
            uint64_t v12 = *(void *)(*(void *)(a2 + 56) + 8 * v24);
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v12 = 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v12 = 0;
        }
        char v5 = sub_260FD5D9C(v12, v22);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v9) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v4 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v4 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v4 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
    char v5 = 0;
    if (v13) {
      goto LABEL_23;
    }
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_28:
    swift_release();
    return v5 & 1;
  }
  unint64_t v17 = *(void *)(v4 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v4 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t _s13DiffusionBase05AppleA15ResourceFactoryC9VersionerO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_260FE4EC0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_260FDA880()
{
  unint64_t result = qword_26A8EB400;
  if (!qword_26A8EB400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB400);
  }
  return result;
}

uint64_t sub_260FDA8D4()
{
  return type metadata accessor for AppleDiffusionResourceFactory(0);
}

uint64_t type metadata accessor for AppleDiffusionResourceFactory(uint64_t a1)
{
  return sub_260DD5A3C(a1, (uint64_t *)&unk_26A8EB408);
}

uint64_t sub_260FDA8FC()
{
  uint64_t result = type metadata accessor for AppleDiffusionPipeline.ResourceURLs();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  char v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1)
{
  uint64_t v2 = sub_260FE3440();
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260FDAC20);
}

uint64_t sub_260FDAC20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260FDACA0);
}

uint64_t sub_260FDACA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260FE3440();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AppleDiffusionResourceFactory.AppleDiffusionAssetLock(uint64_t a1)
{
  return sub_260DD5A3C(a1, (uint64_t *)&unk_26A8EB418);
}

uint64_t sub_260FDAD30()
{
  uint64_t result = sub_260FE3440();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AppleDiffusionResourceFactory.WeakContainer()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for AppleDiffusionResourceFactory.Versioner(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x260FDAEACLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleDiffusionResourceFactory.Versioner()
{
  return &type metadata for AppleDiffusionResourceFactory.Versioner;
}

uint64_t sub_260FDAEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleDiffusionPipeline.ResourceURLs();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_260FDAF48()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260FDAF80(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_260DACD28;
  v5[16] = a1;
  v5[17] = v4;
  return MEMORY[0x270FA2498](sub_260FD9E48, 0, 0);
}

uint64_t sub_260FDB034()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_260DD8D28;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v5;
  void *v5 = v3;
  v5[1] = sub_260FDA320;
  return v7(v3 + 16);
}

uint64_t sub_260FDB168()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260FDB1A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_260FDB240()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_260DACD28;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v5;
  void *v5 = v3;
  v5[1] = sub_260FDA320;
  return v7(v3 + 16);
}

void sub_260FDB374(id a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_260FDB38C(a1);
  }
}

void sub_260FDB38C(id a1)
{
}

uint64_t sub_260FDB398()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8E6FA8);
  sub_260FE5380();
  uint64_t result = sub_260FE4A80();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_260FDB454()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8E6FA8);
  sub_260FE5380();
  uint64_t v2 = sub_260FE4A80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_260FDB50C()
{
  sub_260FDB454();
  return swift_deallocClassInstance();
}

uint64_t DiffusionImageResult.emojiHasBackground.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for DiffusionImageResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for DiffusionImageResult(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for DiffusionImageResult(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiffusionImageResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DiffusionImageResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiffusionImageResult()
{
  return &type metadata for DiffusionImageResult;
}

uint64_t sub_260FDB6E8(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  }
  return result;
}

uint64_t sub_260FDB750(uint64_t a1, char a2, uint64_t a3, char a4)
{
  id v6 = v4;
  PixelFormatType = (void *)CVPixelBufferGetPixelFormatType(v4);
  id v10 = PixelFormatType;
  if (PixelFormatType != 1278226488 && PixelFormatType != 1111970369)
  {
    sub_260FDBBF8();
    swift_allocError();
    *(void *)uint64_t v14 = 0xD000000000000059;
    *(void *)(v14 + 8) = 0x8000000261002420;
    *(unsigned char *)(v14 + 16) = 2;
    goto LABEL_6;
  }
  unsigned int v11 = CVPixelBufferLockBaseAddress(v6, 1uLL);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_260FDBBF8();
    swift_allocError();
    *(void *)uint64_t v13 = v12;
    *(void *)(v13 + 8) = 0;
    *(unsigned char *)(v13 + 16) = 1;
LABEL_6:
    swift_willThrow();
    return (uint64_t)v10;
  }
  if (a2) {
    CVPixelBufferGetHeight(v6);
  }
  if (a4) {
    CVPixelBufferGetWidth(v6);
  }
  if (v10 != 1278226488)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6730);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_260FEDF60;
    *(void *)(v21 + 32) = sub_260FE4700();
    *(void *)(v21 + 40) = sub_260FE4700();
    *(void *)(v21 + 48) = sub_260FE4700();
    *(void *)(v21 + 56) = sub_260FE4700();
    sub_260FE4420();
    id v22 = objc_allocWithZone(MEMORY[0x263F00DA8]);
    uint64_t v23 = v21;
    id v10 = v22;
    id v24 = sub_260E5BE64(v23, 65568);
    if (!v5)
    {
      id v10 = v24;
      CVPixelBufferGetBaseAddress(v6);
      if ((CVPixelBufferGetHeight(v6) & 0x8000000000000000) != 0
        || (CVPixelBufferGetWidth(v6) & 0x8000000000000000) != 0)
      {
        goto LABEL_25;
      }
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v6);
      MEMORY[0x270FA5388](BytesPerRow, v25);
      sub_260FE4820();
    }
LABEL_23:
    CVPixelBufferUnlockBaseAddress(v6, 1uLL);
    return (uint64_t)v10;
  }
  if (CVPixelBufferGetBaseAddress(v6))
  {
    if ((CVPixelBufferGetHeight(v6) & 0x8000000000000000) == 0
      && (CVPixelBufferGetWidth(v6) & 0x8000000000000000) == 0)
    {
      CVPixelBufferGetBytesPerRow(v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6730);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_260FEDF60;
      *(void *)(v16 + 32) = sub_260FE4700();
      *(void *)(v16 + 40) = sub_260FE4700();
      *(void *)(v16 + 48) = sub_260FE4700();
      *(void *)(v16 + 56) = sub_260FE4700();
      sub_260FE4420();
      id v17 = objc_allocWithZone(MEMORY[0x263F00DA8]);
      uint64_t v18 = v16;
      id v10 = v17;
      id v19 = sub_260E5BE64(v18, 65568);
      if (!v5)
      {
        id v10 = (id)MEMORY[0x270FA5388](v19, v20);
        sub_260FE4820();
      }
      goto LABEL_23;
    }
  }
  else
  {
    __break(1u);
  }
LABEL_25:
  uint64_t result = sub_260FE4E10();
  __break(1u);
  return result;
}

unint64_t sub_260FDBBF8()
{
  unint64_t result = qword_26A8EB508;
  if (!qword_26A8EB508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB508);
  }
  return result;
}

uint64_t sub_260FDBC4C(void *a1, Pixel_F a2, Pixel_F a3, uint64_t a4, uint64_t a5, vImagePixelCount a6, vImagePixelCount a7, const vImage_Buffer *a8)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB510);
  MEMORY[0x270FA5388](v15 - 8, v16);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_260FE2920();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v21);
  uint64_t v23 = (char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
LABEL_13:
  }
    __break(1u);
  if ((a6 & 0x8000000000000000) != 0 || (a7 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_260FE4E10();
    __break(1u);
    return result;
  }
  if (*(void *)(a5 + 16) < 3uLL)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v24 = *(void *)(a5 + 48);
  if ((unint64_t)(v24 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  dest.data = a1;
  dest.height = a6;
  dest.width = a7;
  dest.rowBytes = 4 * v24;
  uint64_t result = vImageConvert_Planar8toPlanarF(a8, &dest, a3, a2, 0);
  if (result)
  {
    uint64_t v26 = result;
    sub_260FE2910();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
    {
      sub_260FDC17C((uint64_t)v18);
      sub_260FDBBF8();
      swift_allocError();
      *(void *)uint64_t v27 = v26;
      *(void *)(v27 + 8) = 0;
      *(unsigned char *)(v27 + 16) = 0;
      return swift_willThrow();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v18, v19);
      sub_260FDC1DC();
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28, v23, v19);
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    }
  }
  return result;
}

uint64_t sub_260FDBF50(char *a1, int32x2_t a2, int32x2_t a3, uint64_t a4, void *a5, vImagePixelCount a6, vImagePixelCount a7, const vImage_Buffer *a8)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v8 = a5[2];
  if (v8 < 2)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v8 == 2)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v9 = a5[6];
  if ((unint64_t)(v9 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!a1) {
    goto LABEL_15;
  }
  uint64_t v10 = a5[5];
  if (v10 + 0x4000000000000000 < 0) {
    goto LABEL_13;
  }
  if ((unsigned __int128)(v10 * (__int128)3) >> 64 != (3 * v10) >> 63)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  if ((a6 & 0x8000000000000000) != 0 || (a7 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_260FE4E10();
    __break(1u);
  }
  else
  {
    green.data = a1;
    green.height = a6;
    green.width = a7;
    green.rowBytes = 4 * v9;
    red.data = &a1[4 * v10];
    red.height = a6;
    red.width = a7;
    red.rowBytes = 4 * v9;
    alpha.data = &a1[8 * v10];
    alpha.height = a6;
    alpha.width = a7;
    alpha.rowBytes = 4 * v9;
    blue.data = &a1[12 * v10];
    blue.height = a6;
    blue.width = a7;
    blue.rowBytes = 4 * v9;
    uint64_t v12 = (int32x4_t *)sub_260FE4460();
    v12[1].i64[0] = 4;
    v12[2] = vdupq_lane_s32(a3, 0);
    i32 = (const float *)v12[2].i32;
    uint64_t v14 = sub_260FE4460();
    *(void *)(v14 + 16) = 4;
    *(int32x4_t *)(v14 + 32) = vdupq_lane_s32(a2, 0);
    vImageConvert_ARGB8888toPlanarF(a8, &alpha, &red, &green, &blue, i32, (const float *)(v14 + 32), 0);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_260FDC134(char *a1, uint64_t a2, void *a3, int32x2_t a4, int32x2_t a5)
{
  a4.i32[0] = *(_DWORD *)(v5 + 32);
  a5.i32[0] = *(_DWORD *)(v5 + 36);
  return sub_260FDBF50(a1, a4, a5, a2, a3, *(void *)(v5 + 16), *(void *)(v5 + 24), *(const vImage_Buffer **)(v5 + 40));
}

uint64_t sub_260FDC158(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_260FDBC4C(a1, *(Pixel_F *)(v3 + 40), *(Pixel_F *)(v3 + 44), a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(const vImage_Buffer **)(v3 + 32));
}

uint64_t sub_260FDC17C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_260FDC1DC()
{
  unint64_t result = qword_26A8EB518;
  if (!qword_26A8EB518)
  {
    sub_260FE2920();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB518);
  }
  return result;
}

uint64_t sub_260FDC238(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s5ErrorOwxx(uint64_t a1)
{
  return sub_260FDC260(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_260FDC260(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_260FDC238(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s5ErrorOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_260FDC238(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_260FDC260(v6, v7, v8);
  return a1;
}

uint64_t _s5ErrorOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_260FDC260(v4, v5, v6);
  return a1;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

uint64_t LCMScheduler.__allocating_init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:predictionType:generator:)(uint64_t a1, int64_t a2, char a3, char a4, uint64_t a5, float a6, float a7)
{
  char v13 = a3 & 1;
  uint64_t v14 = swift_allocObject();
  LCMScheduler.init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:predictionType:generator:)(a1, a2, v13, a4, a5, a6, a7);
  return v14;
}

uint64_t LCMScheduler.trainStepCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t LCMScheduler.inferenceStepCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t LCMScheduler.betas.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LCMScheduler.alphas.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LCMScheduler.alphasCumProd.getter()
{
  return swift_bridgeObjectRetain();
}

float LCMScheduler.finalAlphasCumProd.getter()
{
  return 1.0;
}

uint64_t LCMScheduler.timeSteps.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LCMScheduler.generator.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_260D90158(v1 + 72, a1);
}

uint64_t LCMScheduler.predictionType.getter()
{
  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t LCMScheduler.modelOutputs.getter()
{
  return swift_bridgeObjectRetain();
}

float LCMScheduler.timeStepScaling.getter()
{
  return 10.0;
}

uint64_t LCMScheduler.init(stepCount:trainStepCount:betaSchedule:betaStart:betaEnd:predictionType:generator:)(uint64_t a1, int64_t a2, char a3, char a4, uint64_t a5, float a6, float a7)
{
  int64_t v11 = a2;
  uint64_t v12 = a1;
  int64_t v13 = MEMORY[0x263F8EE78];
  *(void *)(v7 + 120) = MEMORY[0x263F8EE78];
  *(_DWORD *)(v7 + 128) = 1092616192;
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a1;
  *(unsigned char *)(v7 + 112) = a4;
  sub_260D90158(a5, v7 + 72);
  if (a3)
  {
    float v15 = fabsf(sqrtf(a6));
    if (a6 == -INFINITY) {
      float v15 = INFINITY;
    }
    float v16 = fabsf(sqrtf(a7));
    if (a7 == -INFINITY) {
      float v17 = INFINITY;
    }
    else {
      float v17 = v16;
    }
    int64_t v18 = sub_260F93E98(v11, v15, v17);
    int64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      int64_t v60 = v13;
      sub_260F63828(0, v19, 0);
      uint64_t v20 = 0;
      int64_t v14 = v60;
      unint64_t v21 = *(void *)(v60 + 16);
      do
      {
        float v22 = *(float *)(v18 + 4 * v20 + 32);
        unint64_t v23 = *(void *)(v60 + 24);
        if (v21 >= v23 >> 1) {
          sub_260F63828(v23 > 1, v21 + 1, 1);
        }
        ++v20;
        *(void *)(v60 + 16) = v21 + 1;
        *(float *)(v60 + 4 * v21++ + 32) = v22 * v22;
      }
      while (v19 != v20);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      int64_t v14 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    int64_t v14 = sub_260F93E98(v11, a6, a7);
  }
  *(void *)(v59 + 32) = v14;
  int64_t v24 = *(void *)(v14 + 16);
  uint64_t v25 = (char *)MEMORY[0x263F8EE78];
  if (v24)
  {
    uint64_t v61 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_260F63828(0, v24, 0);
    uint64_t v26 = 0;
    uint64_t v25 = (char *)v61;
    unint64_t v27 = *(void *)(v61 + 16);
    do
    {
      float v28 = *(float *)(v14 + 4 * v26 + 32);
      unint64_t v29 = *(void *)(v61 + 24);
      if (v27 >= v29 >> 1) {
        sub_260F63828(v29 > 1, v27 + 1, 1);
      }
      ++v26;
      *(void *)(v61 + 16) = v27 + 1;
      *(float *)(v61 + 4 * v27++ + 32) = 1.0 - v28;
    }
    while (v24 != v26);
    swift_bridgeObjectRelease();
  }
  *(void *)(v59 + 40) = v25;
  uint64_t v30 = *((void *)v25 + 2);
  uint64_t v31 = v30 - 1;
  if (v30 != 1)
  {
    if (!v30) {
      goto LABEL_68;
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_70;
    }
    while (1)
    {
      unint64_t v32 = 0;
      while (v32 < *((void *)v25 + 2))
      {
        *(float *)&v25[4 * v32 + 36] = *(float *)&v25[4 * v32 + 32] * *(float *)&v25[4 * v32 + 36];
        if (v31 == ++v32) {
          goto LABEL_29;
        }
      }
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      uint64_t v25 = sub_260F7B4A4((uint64_t)v25);
    }
  }
  swift_bridgeObjectRetain();
LABEL_29:
  *(void *)(v59 + 48) = v25;
  *(_DWORD *)(v59 + 56) = 1065353216;
  uint64_t v33 = sub_260F959E4(1, 50);
  int64_t v34 = *(void *)(v33 + 16);
  if (v34)
  {
    uint64_t v35 = v11 / 50;
    uint64_t v62 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_260DB4728(0, v34, 0);
    uint64_t v31 = 0;
    uint64_t v36 = v62;
    while (1)
    {
      uint64_t v37 = *(void *)(v33 + 8 * v31 + 32);
      uint64_t v38 = v37 * v35;
      if ((unsigned __int128)(v37 * (__int128)v35) >> 64 != (v37 * v35) >> 63) {
        break;
      }
      uint64_t v39 = v38 - 1;
      if (__OFSUB__(v38, 1)) {
        goto LABEL_61;
      }
      unint64_t v41 = *(void *)(v62 + 16);
      unint64_t v40 = *(void *)(v62 + 24);
      int64_t v11 = v41 + 1;
      if (v41 >= v40 >> 1) {
        sub_260DB4728(v40 > 1, v41 + 1, 1);
      }
      ++v31;
      *(void *)(v62 + 16) = v11;
      *(void *)(v62 + 8 * v41 + 32) = v39;
      if (v34 == v31)
      {
        swift_release();
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v36 = MEMORY[0x263F8EE78];
LABEL_38:
  int64_t v11 = sub_260FC8E58(v36);
  if (__OFADD__(v12, 1)) {
    goto LABEL_69;
  }
  int64_t v42 = sub_260F93E98(v12 + 1, 0.0, (float)*(uint64_t *)(v11 + 16));
  unint64_t v43 = *(void *)(v42 + 16);
  int64_t v44 = (v43 - 1) & 0x7FFFFFFFFFFFFFFFLL;
  if (v43 >= 2 && v44 != 0)
  {
    uint64_t v63 = MEMORY[0x263F8EE78];
    sub_260DB4728(0, v44, 0);
    uint64_t v46 = 0;
    uint64_t v12 = v63;
    uint64_t v31 = 3741319169;
    while (1)
    {
      float v47 = floorf(*(float *)(v42 + 4 * v46 + 32));
      if ((~LODWORD(v47) & 0x7F800000) == 0) {
        goto LABEL_65;
      }
      if (v47 <= -9.2234e18) {
        goto LABEL_66;
      }
      if (v47 >= 9.2234e18) {
        goto LABEL_67;
      }
      unint64_t v49 = *(void *)(v63 + 16);
      unint64_t v48 = *(void *)(v63 + 24);
      if (v49 >= v48 >> 1) {
        sub_260DB4728(v48 > 1, v49 + 1, 1);
      }
      *(void *)(v63 + 16) = v49 + 1;
      *(void *)(v63 + 8 * v49 + 32) = (uint64_t)v47;
      if (v44 == ++v46)
      {
        swift_unknownObjectRelease();
        goto LABEL_52;
      }
    }
  }
  swift_unknownObjectRelease();
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_52:
  int64_t v50 = *(void *)(v12 + 16);
  uint64_t v51 = MEMORY[0x263F8EE78];
  if (v50)
  {
    uint64_t v64 = MEMORY[0x263F8EE78];
    sub_260DB4728(0, v50, 0);
    uint64_t v51 = v64;
    uint64_t v31 = v12 + 32;
    while (1)
    {
      unint64_t v53 = *(void *)v31;
      v31 += 8;
      unint64_t v52 = v53;
      if ((v53 & 0x8000000000000000) != 0) {
        break;
      }
      if (v52 >= *(void *)(v11 + 16)) {
        goto LABEL_63;
      }
      uint64_t v54 = *(void *)(v11 + 32 + 8 * v52);
      unint64_t v56 = *(void *)(v64 + 16);
      unint64_t v55 = *(void *)(v64 + 24);
      if (v56 >= v55 >> 1) {
        sub_260DB4728(v55 > 1, v56 + 1, 1);
      }
      *(void *)(v64 + 16) = v56 + 1;
      *(void *)(v64 + 8 * v56 + 32) = v54;
      if (!--v50) {
        goto LABEL_59;
      }
    }
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
LABEL_59:
  __swift_destroy_boxed_opaque_existential_1Tm(a5);
  swift_bridgeObjectRelease();
  *(void *)(v59 + 64) = v51;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v59;
}

uint64_t LCMScheduler.step(output:timeStep:sample:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  unint64_t v73 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EABA8);
  uint64_t v70 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v68 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v13);
  float v15 = (char *)&v65 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  uint64_t v72 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v69 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v20);
  float v22 = (char *)&v65 - v21;
  uint64_t v23 = *(void *)(v5 + 64);
  uint64_t result = sub_260FC91A8(a2, v23);
  if (v25) {
    uint64_t v26 = *(void *)(v23 + 16) - 1;
  }
  else {
    uint64_t v26 = result;
  }
  uint64_t v27 = v26 + 1;
  if (__OFADD__(v26, 1))
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v28 = a2;
  if (v27 < *(void *)(v23 + 16))
  {
    if (v27 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    unint64_t v28 = *(void *)(v23 + 8 * v27 + 32);
  }
  if (a2 < 0) {
    goto LABEL_24;
  }
  uint64_t v29 = *(void *)(v5 + 48);
  unint64_t v30 = *(void *)(v29 + 16);
  if (v30 <= a2)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v31 = v29 + 32;
  float v32 = *(float *)(v31 + 4 * a2);
  float v33 = 1.0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28 >= v30)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    float v33 = *(float *)(v31 + 4 * v28);
  }
  float v34 = sqrtf(v32);
  float v35 = sqrtf(1.0 - v32);
  float v36 = (float)a2 * 10.0;
  float v37 = (float)(v36 * v36) + 0.25;
  float v38 = 0.25 / v37;
  int v39 = *(unsigned __int8 *)(v5 + 112);
  uint64_t v40 = (uint64_t)sub_260FDD070;
  float v41 = v36 / fabsf(sqrtf(v37));
  uint64_t v67 = v9;
  uint64_t v71 = a4;
  if (v39)
  {
    if (v39 == 1)
    {
      uint64_t v42 = 0;
      unint64_t v43 = (char *)sub_260FDD070;
      goto LABEL_19;
    }
    unint64_t v43 = (char *)sub_260FDD3B4;
    float v44 = v34;
    float v34 = v35;
  }
  else
  {
    unint64_t v43 = (char *)sub_260FDD3D8;
    float v44 = v35;
  }
  uint64_t v40 = swift_allocObject();
  uint64_t v42 = v40;
  *(float *)(v40 + 16) = v44;
  *(float *)(v40 + 20) = v34;
LABEL_19:
  MEMORY[0x270FA5388](v40, v25);
  *(&v65 - 4) = v43;
  *(&v65 - 3) = (char *)v42;
  *((float *)&v65 - 4) = v41;
  *((float *)&v65 - 3) = v38;
  uint64_t v45 = sub_260FE3B20();
  MEMORY[0x270FA5388](v45, v46);
  float v47 = v73;
  *(&v65 - 4) = a3;
  *(&v65 - 3) = v47;
  *(&v65 - 2) = (char *)sub_260FDD288;
  *(&v65 - 1) = (char *)(&v65 - 6);
  uint64_t result = sub_260FE3AE0();
  uint64_t v48 = *(void *)(v5 + 24);
  BOOL v49 = __OFSUB__(v48, 1);
  uint64_t v50 = v48 - 1;
  if (v49)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v26 == v50)
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v72 + 32))(v71, v22, v16);
  }
  else
  {
    uint64_t v66 = v22;
    uint64_t v51 = sub_260FE3B20();
    uint64_t v52 = v5 + 72;
    swift_beginAccess();
    uint64_t v53 = *(void *)(v5 + 96);
    uint64_t v54 = *(void *)(v5 + 104);
    __swift_mutable_project_boxed_opaque_existential_1(v52, v53);
    unint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t, double, double))(v54 + 16);
    uint64_t v65 = v15;
    v55(v51, v53, v54, 0.0, 1.0);
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v56 = v70;
    uint64_t v57 = v67;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v15, v67);
    sub_260FBDDD8((unint64_t *)&qword_26A8E84B8, &qword_26A8E6BF0);
    sub_260FBDDD8(&qword_26A8EABB0, &qword_26A8EABA8);
    uint64_t v58 = v69;
    uint64_t v59 = sub_260FE3BC0();
    MEMORY[0x270FA5388](v59, v60);
    *((float *)&v65 - 4) = sqrtf(v33);
    *((float *)&v65 - 3) = sqrtf(1.0 - v33);
    uint64_t v61 = v66;
    uint64_t v62 = sub_260FE3B20();
    MEMORY[0x270FA5388](v62, v63);
    *(&v65 - 4) = v61;
    *(&v65 - 3) = v58;
    *(&v65 - 2) = (char *)sub_260FDD300;
    *(&v65 - 1) = (char *)(&v65 - 4);
    sub_260FE3AE0();
    swift_release();
    uint64_t v64 = *(void (**)(char *, uint64_t))(v72 + 8);
    v64(v58, v16);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v65, v57);
    return ((uint64_t (*)(char *, uint64_t))v64)(v61, v16);
  }
}

float sub_260FDD070(double a1, float a2)
{
  return a2;
}

uint64_t sub_260FDD078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, void *(*a7)(uint64_t *__return_ptr, int *, int *), uint64_t a8, uint64_t a9)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E6BF0);
  sub_260FBDDD8((unint64_t *)&qword_26A8E84B8, &qword_26A8E6BF0);
  uint64_t result = sub_260FE3BD0();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = result;
    if (result)
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = v14 + 1;
        uint64_t v16 = *a6;
        uint64_t v17 = 4 * v14;
        int v19 = *(_DWORD *)(a9 + 4 * v14);
        int v18 = *(_DWORD *)(a1 + 4 * v14);
        uint64_t result = (uint64_t)a7(&v20, &v19, &v18);
        *(_DWORD *)(v16 + v17) = v20;
        uint64_t v14 = v15;
      }
      while (v13 != v15);
    }
  }
  return result;
}

uint64_t LCMScheduler.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LCMScheduler.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_260FDD214()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_260FDD220()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_260FDD264@<X0>(char *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  return LCMScheduler.step(output:timeStep:sample:)(a1, a2, a3, a4);
}

float sub_260FDD288@<S0>(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  float v5 = *(float *)(v3 + 32);
  float v6 = *(float *)(v3 + 36);
  float v7 = *a1;
  float result = (float)(v6 * v7) + (float)(v5 * (*(float (**)(float, float))(v3 + 16))(*a1, *a2));
  *a3 = result;
  return result;
}

uint64_t sub_260FDD2E8()
{
  return sub_260FDD320();
}

float sub_260FDD300@<S0>(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  float result = (float)(*(float *)(v3 + 16) * *a1) + (float)(*(float *)(v3 + 20) * *a2);
  *a3 = result;
  return result;
}

uint64_t sub_260FDD320()
{
  return sub_260FE3AF0();
}

uint64_t sub_260FDD3A4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float sub_260FDD3B4(float a1, float a2)
{
  return (float)(*(float *)(v2 + 16) * a1) - (float)(*(float *)(v2 + 20) * a2);
}

uint64_t sub_260FDD3C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

float sub_260FDD3D8(float a1, float a2)
{
  return (float)(a1 - (float)(*(float *)(v2 + 16) * a2)) / *(float *)(v2 + 20);
}

uint64_t type metadata accessor for LCMScheduler()
{
  return self;
}

uint64_t sub_260FDD410()
{
  return sub_260FE3AF0();
}

uint64_t sub_260FDD49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_260FDD078(a1, a2, a3, a4, *(void *)(v4 + 16), *(uint64_t **)(v4 + 24), *(void *(**)(uint64_t *__return_ptr, int *, int *))(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48));
}

uint64_t ManagedMLModel.__allocating_init(modelAt:configuration:name:)(char *a1, void *a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v10 = swift_allocObject();
  ManagedMLModel.init(modelAt:configuration:name:)(a1, a2, a3, a4, a5 & 0x1FF);
  return v10;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ManagedMLModel.loadResources()()
{
  uint64_t v1 = v0;
  if (qword_26A8EA918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_260FE3A10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A90FC00);
  swift_retain_n();
  uint64_t v3 = sub_260FE39F0();
  os_log_type_t v4 = sub_260FE4880();
  if (os_log_type_enabled(v3, v4))
  {
    float v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)float v5 = 136446210;
    uint64_t v7 = sub_260FE4C50();
    sub_260DB2844(v7, v8, &v10);
    sub_260FE4AE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_260D82000, v3, v4, "Loading resources for %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26122CA00](v6, -1, -1);
    MEMORY[0x26122CA00](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v9 = *(id *)(v1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_queue);
  sub_260FE4900();
}

Swift::Void __swiftcall ManagedMLModel.unloadResources()()
{
  uint64_t v1 = v0;
  if (qword_26A8EA918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_260FE3A10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A90FC00);
  swift_retain_n();
  uint64_t v3 = sub_260FE39F0();
  os_log_type_t v4 = sub_260FE4880();
  if (os_log_type_enabled(v3, v4))
  {
    float v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)float v5 = 136446210;
    uint64_t v7 = sub_260FE4C50();
    uint64_t v24 = sub_260DB2844(v7, v8, aBlock);
    sub_260FE4AE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_260D82000, v3, v4, "Unloading resources for %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26122CA00](v6, -1, -1);
    MEMORY[0x26122CA00](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v9 = *(void **)(v1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_queue);
  aBlock[4] = (uint64_t)sub_260FDF394;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_260FDEBE8;
  aBlock[3] = (uint64_t)&block_descriptor_16;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v22 = sub_260FE3E70();
  uint64_t v23 = &v21;
  uint64_t v11 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v15 = v9;
  sub_260FE3E60();
  uint64_t v16 = sub_260FE3E50();
  uint64_t v21 = (uint64_t)&v21;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  uint64_t v20 = (char *)&v21 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_260FDF3D4(&qword_26A8EB520, MEMORY[0x270FCDA80]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB528);
  sub_260FDF41C(&qword_26A8EB530, &qword_26A8EB528);
  sub_260FE4B70();
  MEMORY[0x26122B160](0, v14, v20, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v22);
  swift_release();
}

void ManagedMLModel.perform<A>(_:)()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_queue);
  sub_260FE4900();
}

uint64_t ManagedMLModel.init(modelAt:configuration:name:)(char *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6 = v5;
  int v64 = a5;
  uint64_t v58 = a3;
  uint64_t v59 = a4;
  uint64_t v9 = sub_260FE2ED0();
  uint64_t v66 = *(void *)(v9 - 8);
  uint64_t v67 = v9;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v65 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_260FE2F90();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  uint64_t v62 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v71 = (char *)&v57 - v18;
  uint64_t v19 = OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel;
  *(void *)(v6 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel) = 0;
  uint64_t v20 = v6 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelName;
  *(void *)uint64_t v20 = "ManagedMLModel";
  *(void *)(v20 + 8) = 14;
  *(unsigned char *)(v20 + 16) = 2;
  sub_260FE3980();
  uint64_t v69 = v13;
  uint64_t v70 = v12;
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  uint64_t v61 = v13 + 16;
  v60(v6 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelURL, (uint64_t)a1, v12);
  id v68 = a2;
  objc_msgSend(a2, sel_copy);
  sub_260FE4B50();
  swift_unknownObjectRelease();
  sub_260D905B0(0, &qword_26A8EACA8);
  swift_dynamicCast();
  uint64_t v57 = OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_configuration;
  *(void *)(v6 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_configuration) = v73;
  uint64_t v21 = *(void **)(v6 + v19);
  *(void *)(v6 + v19) = 0;

  uint64_t v63 = sub_260D905B0(0, &qword_26A8EAA30);
  uint64_t v74 = 0x2E646567616E616DLL;
  unint64_t v75 = 0xE800000000000000;
  uint64_t v72 = a1;
  sub_260FE2EE0();
  sub_260FE4250();
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_260FE3E70();
  MEMORY[0x270FA5388](v22 - 8, v23);
  sub_260FE3E60();
  uint64_t v24 = sub_260FE48E0();
  MEMORY[0x270FA5388](v24, v25);
  uint64_t v74 = MEMORY[0x263F8EE78];
  sub_260FDF3D4((unint64_t *)&qword_26A8EAA38, MEMORY[0x270FCDBE0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAA40);
  sub_260FDF41C(&qword_26A8EAA48, &qword_26A8EAA40);
  sub_260FE4B70();
  uint64_t v26 = sub_260FE48F0();
  MEMORY[0x270FA5388](v26, v27);
  (*(void (**)(char *, void))(v29 + 104))((char *)&v57 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  uint64_t v30 = sub_260FE4920();
  __int16 v31 = v64;
  *(void *)(v6 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_queue) = v30;
  if ((v31 & 0x100) == 0)
  {
    char v32 = v31;
    uint64_t v33 = v59;
    *(void *)uint64_t v20 = v58;
    *(void *)(v20 + 8) = v33;
    *(unsigned char *)(v20 + 16) = v32;
  }
  uint64_t v74 = 0xD00000000000001BLL;
  unint64_t v75 = 0x8000000261002510;
  float v35 = v65;
  uint64_t v34 = v66;
  uint64_t v36 = v67;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, *MEMORY[0x263F06E50], v67);
  sub_260D86D20();
  float v37 = v71;
  float v38 = v72;
  sub_260FE2F70();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  swift_bridgeObjectRelease();
  id v39 = objc_msgSend(self, sel_defaultManager);
  sub_260FE2F40();
  uint64_t v40 = (void *)sub_260FE4070();
  swift_bridgeObjectRelease();
  unsigned int v41 = objc_msgSend(v39, sel_fileExistsAtPath_, v40);

  if (v41)
  {
    objc_msgSend(*(id *)(v6 + v57), sel_setUsePrecompiledE5Bundle_, 1);
    uint64_t v42 = v70;
    if (qword_26A8EA918 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_260FE3A10();
    __swift_project_value_buffer(v43, (uint64_t)qword_26A90FC00);
    float v44 = v62;
    v60((uint64_t)v62, (uint64_t)v37, v42);
    uint64_t v45 = sub_260FE39F0();
    os_log_type_t v46 = sub_260FE4870();
    if (!os_log_type_enabled(v45, v46))
    {

      unint64_t v55 = *(void (**)(char *, uint64_t))(v69 + 8);
      v55(v44, v42);
      v55(v38, v42);
      v55(v37, v42);
      return v6;
    }
    float v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v74 = v48;
    *(_DWORD *)float v47 = 136315138;
    uint64_t v49 = sub_260FE2F40();
    uint64_t v73 = sub_260DB2844(v49, v50, &v74);
    sub_260FE4AE0();
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void (**)(char *, uint64_t))(v69 + 8);
    v51(v44, v42);
    _os_log_impl(&dword_260D82000, v45, v46, "Will use specialized/pre-compiled: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26122CA00](v48, -1, -1);
    MEMORY[0x26122CA00](v47, -1, -1);

    v51(v72, v42);
    uint64_t v52 = v71;
    uint64_t v53 = v42;
  }
  else
  {

    uint64_t v54 = v70;
    uint64_t v51 = *(void (**)(char *, uint64_t))(v69 + 8);
    v51(v38, v70);
    uint64_t v52 = v37;
    uint64_t v53 = v54;
  }
  v51(v52, v53);
  return v6;
}

void sub_260FDE40C()
{
  sub_260FDE5E0();
  if (!v0)
  {
    if (qword_26A8EA918 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_260FE3A10();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A90FC00);
    swift_retain_n();
    uint64_t v2 = sub_260FE39F0();
    os_log_type_t v3 = sub_260FE4880();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v8 = v5;
      *(_DWORD *)os_log_type_t v4 = 136446210;
      uint64_t v6 = sub_260FE4C50();
      sub_260DB2844(v6, v7, &v8);
      sub_260FE4AE0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_260D82000, v2, v3, "Loaded resources for %{public}s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26122CA00](v5, -1, -1);
      MEMORY[0x26122CA00](v4, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_260FDE5E0()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_260FE2F90();
  MEMORY[0x270FA5388](v3, v4);
  unint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel))
  {
    uint64_t v37 = v5;
    uint64_t v29 = OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel;
    uint64_t v8 = sub_260FE3990();
    uint64_t v36 = &v28;
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v8, v10);
    uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(void))(v9 + 16))();
    uint64_t v13 = *(char **)(v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelName);
    char v14 = *(unsigned char *)(v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelName + 16);
    uint64_t v32 = sub_260FE3940();
    uint64_t v33 = &v28;
    uint64_t v31 = *(void *)(v32 - 8);
    MEMORY[0x270FA5388](v32, v15);
    float v38 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_260FE3950();
    uint64_t v34 = v9;
    uint64_t v35 = v8;
    if ((v14 & 1) == 0)
    {
      if (v13) {
        goto LABEL_9;
      }
      __break(1u);
    }
    if ((unint64_t)v13 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v13 >> 11 == 27)
      {
LABEL_15:
        __break(1u);
        return;
      }
      if (v13 >> 16 <= 0x10)
      {
        uint64_t v13 = sub_260E5BF60();
LABEL_9:
        uint64_t v30 = v12;
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        uint64_t v18 = sub_260FE3970();
        os_signpost_type_t v19 = sub_260FE4940();
        os_signpost_id_t v20 = sub_260FE3920();
        _os_signpost_emit_with_name_impl(&dword_260D82000, v18, v19, v20, v13, "", v17, 2u);
        sub_260D905B0(0, &qword_26A8EA8E0);
        (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v7, v2 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelURL, v3);
        id v21 = *(id *)(v2 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_configuration);
        id v22 = sub_260F589A0((uint64_t)v7, (uint64_t)v21);
        if (v1)
        {

          (*(void (**)(char *, uint64_t))(v31 + 8))(v38, v32);
          (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v35);
        }
        else
        {
          id v23 = v22;

          os_signpost_type_t v24 = sub_260FE4930();
          uint64_t v25 = v38;
          os_signpost_id_t v26 = sub_260FE3920();
          _os_signpost_emit_with_name_impl(&dword_260D82000, v18, v24, v26, v13, "", v17, 2u);

          MEMORY[0x26122CA00](v17, -1, -1);
          (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v32);
          (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v35);
          uint64_t v27 = *(void **)(v2 + v29);
          *(void *)(v2 + v29) = v23;
        }
        return;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_260FDEA1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel);
  *(void *)(a1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel) = 0;

  if (qword_26A8EA918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_260FE3A10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A90FC00);
  swift_retain_n();
  uint64_t v3 = sub_260FE39F0();
  os_log_type_t v4 = sub_260FE4880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_260FE4C50();
    sub_260DB2844(v7, v8, &v9);
    sub_260FE4AE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_260D82000, v3, v4, "Unloaded resources for %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26122CA00](v6, -1, -1);
    MEMORY[0x26122CA00](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_260FDEBE8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_260FDEC2C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (void *)MEMORY[0x26122C180]();
  sub_260FDECAC(a1, a2, a3, a4, a5);
}

void sub_260FDECAC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FDE5E0();
  if (!v5)
  {
    uint64_t v31 = v11;
    uint64_t v32 = a5;
    uint64_t v14 = sub_260FE3990();
    float v38 = &v31;
    double v16 = MEMORY[0x270FA5388](v14, v15);
    uint64_t v36 = v19;
    uint64_t v37 = v18;
    os_signpost_id_t v20 = *(void (**)(double))(v19 + 16);
    id v39 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20(v16);
    id v21 = *(char **)(a1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelName);
    char v22 = *(unsigned char *)(a1 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelName + 16);
    uint64_t v34 = sub_260FE3940();
    uint64_t v35 = &v31;
    uint64_t v33 = *(void *)(v34 - 8);
    MEMORY[0x270FA5388](v34, v23);
    uint64_t v25 = (char *)&v31 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_260FE3950();
    MEMORY[0x270FA5388](&v31, v26);
    *(&v31 - 4) = a4;
    *(&v31 - 3) = a2;
    uint64_t v29 = a3;
    uint64_t v30 = a1;
    if (v22)
    {
      if (!((unint64_t)v21 >> 32))
      {
        uint64_t v27 = (uint64_t)v39;
        if (v21 >> 11 == 27)
        {
LABEL_14:
          __break(1u);
          return;
        }
        if (v21 >> 16 <= 0x10)
        {
          id v21 = sub_260E5BF60();
          goto LABEL_9;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      if (v21)
      {
        uint64_t v27 = (uint64_t)v39;
LABEL_9:
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        uint64_t v29 = a4;
        sub_260FDF290(v28, 2u, v27, (uint64_t)v25, v21, "", sub_260FDF5B0);
        MEMORY[0x26122CA00](v28, -1, -1);
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v32, v13, a4);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v34);
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v27, v37);
        return;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
}

void sub_260FDF030(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a3 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_loadedModel);
  if (v3)
  {
    id v5 = v3;
    a1();
  }
  else
  {
    __break(1u);
  }
}

uint64_t ManagedMLModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelURL;
  uint64_t v2 = sub_260FE2F90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_signposter;
  uint64_t v4 = sub_260FE3990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ManagedMLModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_modelURL;
  uint64_t v2 = sub_260FE2F90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC13DiffusionBase14ManagedMLModel_signposter;
  uint64_t v4 = sub_260FE3990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

void sub_260FDF290(uint8_t *a1, uint32_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, void (*a7)(void))
{
  uint64_t v11 = sub_260FE3970();
  os_signpost_type_t v12 = sub_260FE4940();
  os_signpost_id_t v13 = sub_260FE3920();
  double v16 = a5;
  _os_signpost_emit_with_name_impl(&dword_260D82000, v11, v12, v13, a5, a6, a1, a2);
  a7();
  if (!v18)
  {
    os_signpost_type_t v14 = sub_260FE4930();
    os_signpost_id_t v15 = sub_260FE3920();
    _os_signpost_emit_with_name_impl(&dword_260D82000, v11, v14, v15, v16, a6, a1, a2);
  }
}

void sub_260FDF394()
{
  sub_260FDEA1C(v0);
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

void sub_260FDF3B4(uint64_t a1@<X8>)
{
  sub_260FDEC2C(v1[3], v1[4], v1[5], v1[2], a1);
}

uint64_t sub_260FDF3D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260FDF41C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_260FDF46C()
{
  return type metadata accessor for ManagedMLModel();
}

uint64_t type metadata accessor for ManagedMLModel()
{
  uint64_t result = qword_26A8EB538;
  if (!qword_26A8EB538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260FDF4C0()
{
  uint64_t result = sub_260FE2F90();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_260FE3990();
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

void sub_260FDF5B0()
{
  sub_260FDF030(*(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_260FDF5D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v187 = a2;
  uint64_t v186 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E7588);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v188 = (char *)v176 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v8);
  id v190 = (char *)v176 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB548);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8, v11);
  v191 = (char *)v176 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v14);
  os_log_type_t v192 = (unsigned __int8 *)v176 - v15;
  uint64_t v200 = sub_260FE2F90();
  uint64_t v204 = *(void *)(v200 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v200, v16);
  id v189 = (char *)v176 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  char v207 = (char *)v176 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v199 = (char *)v176 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23, v25);
  char v206 = (void (*)(uint64_t))((char *)v176 - v27);
  uint64_t v29 = MEMORY[0x270FA5388](v26, v28);
  uint64_t v201 = (char *)v176 - v30;
  MEMORY[0x270FA5388](v29, v31);
  id v198 = (unsigned int (**)(uint64_t, uint64_t, char *))((char *)v176 - v32);
  uint64_t v33 = sub_260FE3440();
  uint64_t v34 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33, v35);
  uint64_t v37 = (char *)v176 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for AppleDiffusionPipeline.ResourceURLs();
  int64_t v197 = *(void *)(v38 - 8);
  uint64_t v39 = *(void *)(v197 + 64);
  uint64_t v41 = MEMORY[0x270FA5388](v38, v40);
  uint64_t v202 = (void *)((char *)v176 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = MEMORY[0x270FA5388](v41, v42);
  v203 = (void (**)(char *, char *))((char *)v176 - v44);
  uint64_t v46 = MEMORY[0x270FA5388](v43, v45);
  uint64_t v205 = (uint64_t)v176 - v47;
  uint64_t v49 = MEMORY[0x270FA5388](v46, v48);
  unint64_t v196 = (void (**)(uint64_t))((char *)v176 - v50);
  uint64_t v52 = MEMORY[0x270FA5388](v49, v51);
  uint64_t v54 = (char *)v176 - v53;
  *a3 = 0;
  a3[1] = 0;
  uint64_t v55 = *(int *)(v52 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EAA50);
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_260FE7060;
  *(void *)(v56 + 32) = &unk_270D22B58;
  *(void *)(v56 + 40) = &unk_270D22B80;
  uint64_t v57 = a3;
  *(void *)((char *)a3 + v55) = v56;
  uint64_t v58 = v186;
  (*(void (**)(char *))(v34 + 16))(v37);
  uint64_t v59 = v209;
  sub_260FE0CD0((uint64_t)v37, v54);
  if (v59)
  {
    sub_260F7EF10(v187);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v58, v33);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v178 = v33;
    v176[2] = 0;
    uint64_t v61 = *(int *)(v38 + 20);
    uint64_t v185 = v57;
    v208 = *(void (**)(char *, char *, uint64_t))(v204 + 16);
    uint64_t v209 = v204 + 16;
    v208((char *)v57 + v61, &v54[v61], v200);
    uint64_t v62 = v196;
    sub_260F7EF88(v187, (uint64_t)v196);
    uint64_t v63 = v205;
    sub_260F7EF88((uint64_t)v54, v205);
    sub_260F7EF88((uint64_t)v62, (uint64_t)v203);
    sub_260F7EF88(v63, (uint64_t)v202);
    uint64_t v64 = *(unsigned __int8 *)(v197 + 80);
    uint64_t v65 = (v64 + 16) & ~v64;
    uint64_t v66 = (v39 + v64 + v65) & ~v64;
    uint64_t v67 = swift_allocObject();
    sub_260FDAEE4((uint64_t)v62, v67 + v65);
    sub_260FDAEE4(v63, v67 + v66);
    id v68 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)v185 + *(int *)(v38 + 24));
    *id v68 = sub_260FE26EC;
    v68[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v67;
    long long v216 = (void *)MEMORY[0x263F8EE78];
    uint64_t v177 = v34;
    uint64_t v69 = (char *)v200;
    uint64_t v183 = v38;
    v184 = (uint64_t *)v54;
    if (qword_270D22B38)
    {
      LODWORD(v180) = 0;
      unint64_t v70 = 0;
      uint64_t v71 = *(int *)(v38 + 24);
      int64_t v197 = (int64_t)v203 + v71;
      unint64_t v196 = (void (**)(uint64_t))((char *)v202 + v71);
      uint64_t v195 = &v54[v71];
      uint64_t v194 = v204 + 8;
      uint64_t v193 = (const char *)qword_270D22B38;
      uint64_t v179 = (char *)(qword_270D22B38 - 1);
      v182 = "imageConditioner";
      v181 = "personalized_animation";
      uint64_t v72 = v199;
      uint64_t v73 = (void (**)(char *, uint64_t))(v204 + 8);
LABEL_5:
      uint64_t v69 = v201;
      do
      {
        if (v70 >= qword_270D22B38)
        {
          __break(1u);
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
LABEL_102:
          __break(1u);
          goto LABEL_103;
        }
        uint64_t v74 = *((unsigned __int8 *)&unk_270D22B28 + v70 + 32);
        uint64_t v205 = v70 + 1;
        (*(void (**)(uint64_t))v197)(v74);
        (*v196)(v74);
        id v75 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
        sub_260FE2F30();
        uint64_t v76 = (void *)sub_260FE4070();
        swift_bridgeObjectRelease();
        unsigned int v77 = objc_msgSend(v75, sel_fileExistsAtPath_isDirectory_, v76, 0);

        char v78 = (char *)v206;
        if (v77) {
          uint64_t v79 = v69;
        }
        else {
          uint64_t v79 = (char *)v206;
        }
        unint64_t v80 = (char *)v70;
        unint64_t v81 = v198;
        uint64_t v82 = v200;
        v208((char *)v198, v79, v200);
        uint64_t v83 = *v73;
        (*v73)(v78, v82);
        uint64_t v84 = v69;
        uint64_t v69 = (char *)v82;
        v83(v84, v82);
        uint64_t v85 = *(void (**)(uint64_t))v195;
        swift_retain();
        v85(v74);
        swift_release();
        sub_260FE2798();
        LOBYTE(v82) = sub_260FE3FD0();
        v83(v72, (uint64_t)v69);
        v83((char *)v81, (uint64_t)v69);
        if (v82)
        {
          LODWORD(v180) = 1;
          unint64_t v70 = v205;
          uint64_t v94 = v203;
          if (v179 != v80) {
            goto LABEL_5;
          }
          sub_260F7EF10((uint64_t)v202);
          sub_260F7EF10((uint64_t)v94);
          unint64_t v95 = v185;
          goto LABEL_29;
        }
        uint64_t v86 = v205;
        unint64_t v87 = 0xE400000000000000;
        unint64_t v88 = 1952804469;
        unint64_t v70 = v205;
        switch(v74)
        {
          case 1:
            unint64_t v88 = 0x6E75684374656E75;
            unint64_t v87 = 0xEA0000000000316BLL;
            break;
          case 2:
            unint64_t v87 = 0xEA0000000000326BLL;
            unint64_t v88 = 0x6E75684374656E75;
            break;
          case 3:
            unint64_t v87 = 0xEB00000000726564;
            unint64_t v88 = 0x6F636E4570696C63;
            break;
          case 4:
            unint64_t v88 = 0x7265646F636E65;
            unint64_t v87 = 0xE700000000000000;
            break;
          case 5:
            unint64_t v87 = 0xE700000000000000;
            unint64_t v88 = 0x7265646F636564;
            break;
          case 6:
            unint64_t v87 = 0xEC0000007265646FLL;
            unint64_t v88 = 0x6365446168706C61;
            break;
          case 7:
            unint64_t v88 = 0xD000000000000011;
            unint64_t v87 = (unint64_t)v182 | 0x8000000000000000;
            break;
          case 8:
            unint64_t v87 = (unint64_t)v181 | 0x8000000000000000;
            unint64_t v88 = 0xD000000000000010;
            break;
          default:
            break;
        }
        uint64_t v89 = v216;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v89 = sub_260DB118C(0, v89[2] + 1, 1, v89);
        }
        unint64_t v91 = v89[2];
        unint64_t v90 = v89[3];
        uint64_t v69 = v201;
        if (v91 >= v90 >> 1)
        {
          uint64_t v89 = sub_260DB118C((void *)(v90 > 1), v91 + 1, 1, v89);
          uint64_t v69 = v201;
        }
        v89[2] = v91 + 1;
        uint64_t v92 = &v89[2 * v91];
        v92[4] = v88;
        v92[5] = v87;
        long long v216 = v89;
        uint64_t v72 = v199;
        char v93 = v203;
      }
      while (v193 != (const char *)v86);
      sub_260F7EF10((uint64_t)v202);
      sub_260F7EF10((uint64_t)v93);
      unint64_t v95 = v185;
      uint64_t v69 = (char *)v200;
      if (v180)
      {
LABEL_29:
        uint64_t v97 = *v184;
        uint64_t v96 = v184[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *unint64_t v95 = v97;
        v95[1] = v96;
      }
    }
    else
    {
      sub_260F7EF10((uint64_t)v202);
      sub_260F7EF10((uint64_t)v203);
    }
    if (qword_26A8EA918 != -1) {
LABEL_103:
    }
      swift_once();
    uint64_t v98 = sub_260FE3A10();
    v176[1] = __swift_project_value_buffer(v98, (uint64_t)qword_26A90FC00);
    uint64_t v99 = sub_260FE39F0();
    os_log_type_t v100 = sub_260FE4890();
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = (uint8_t *)swift_slowAlloc();
      uint64_t v102 = swift_slowAlloc();
      long long v213 = (void *)v102;
      *(_DWORD *)uint64_t v101 = 136315138;
      char v206 = (void (*)(uint64_t))(v101 + 4);
      swift_beginAccess();
      uint64_t v103 = swift_bridgeObjectRetain();
      uint64_t v104 = MEMORY[0x26122AC60](v103, MEMORY[0x263F8D310]);
      unint64_t v106 = v105;
      uint64_t v107 = v187;
      swift_bridgeObjectRelease();
      uint64_t v215 = sub_260DB2844(v104, v106, (uint64_t *)&v213);
      sub_260FE4AE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_260D82000, v99, v100, "Overriding base model components: %s with side-loaded models", v101, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26122CA00](v102, -1, -1);
      MEMORY[0x26122CA00](v101, -1, -1);

      unint64_t v108 = v191;
      unint64_t v109 = v192;
      uint64_t v110 = v207;
      uint64_t v111 = MEMORY[0x263F8EE78];
    }
    else
    {

      unint64_t v108 = v191;
      unint64_t v109 = v192;
      uint64_t v110 = v207;
      uint64_t v111 = MEMORY[0x263F8EE78];
      uint64_t v107 = v187;
    }
    uint64_t v112 = *(int *)(v183 + 28);
    uint64_t v113 = *(uint64_t *)((char *)v184 + v112);
    uint64_t v114 = *(char **)(v107 + v112);
    uint64_t v115 = *((void *)v114 + 8);
    uint64_t v195 = v114 + 64;
    uint64_t v116 = 1 << v114[32];
    uint64_t v117 = -1;
    uint64_t v215 = v111;
    if (v116 < 64) {
      uint64_t v117 = ~(-1 << v116);
    }
    unint64_t v118 = v117 & v115;
    uint64_t v119 = v204;
    long long v120 = (void (**)(uint64_t))(v204 + 32);
    v203 = (void (**)(char *, char *))(v204 + 8);
    id v198 = (unsigned int (**)(uint64_t, uint64_t, char *))(v204 + 48);
    uint64_t v199 = (char *)(v204 + 56);
    uint64_t v194 = v204 + 40;
    int64_t v197 = (unint64_t)(v116 + 63) >> 6;
    v176[0] = v197 - 1;
    uint64_t v202 = (void *)v113;
    swift_bridgeObjectRetain();
    uint64_t v201 = v114;
    swift_bridgeObjectRetain();
    uint64_t v205 = 0;
    uint64_t v193 = "personalized_emoji";
    v182 = "personalized_illustration";
    v181 = "personalized_sketch";
    v180 = "personalized_style_scribble";
    uint64_t v179 = "with negative count";
    unint64_t v196 = v120;
    while (1)
    {
      if (v118)
      {
        unint64_t v121 = __clz(__rbit64(v118));
        v118 &= v118 - 1;
        uint64_t v122 = v121 | (v205 << 6);
        goto LABEL_42;
      }
      uint64_t v126 = v205 + 1;
      if (__OFADD__(v205, 1)) {
        goto LABEL_100;
      }
      if (v126 >= v197) {
        goto LABEL_60;
      }
      unint64_t v127 = *(void *)&v195[8 * v126];
      if (v127) {
        goto LABEL_46;
      }
      uint64_t v128 = v205 + 2;
      ++v205;
      if (v126 + 1 >= v197) {
        goto LABEL_60;
      }
      unint64_t v127 = *(void *)&v195[8 * v128];
      if (v127) {
        goto LABEL_49;
      }
      uint64_t v205 = v126 + 1;
      if (v126 + 2 >= v197) {
        goto LABEL_60;
      }
      unint64_t v127 = *(void *)&v195[8 * v126 + 16];
      if (v127)
      {
        v126 += 2;
LABEL_46:
        unint64_t v118 = (v127 - 1) & v127;
        uint64_t v122 = __clz(__rbit64(v127)) + (v126 << 6);
        uint64_t v205 = v126;
LABEL_42:
        uint64_t v123 = *((void *)v201 + 7);
        *unint64_t v108 = *(unsigned char *)(*((void *)v201 + 6) + v122);
        char v124 = (char *)(v123 + *(void *)(v119 + 72) * v122);
        uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB550);
        v208(&v108[*(int *)(v125 + 48)], v124, (uint64_t)v69);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(v108, 0, 1, v125);
        goto LABEL_61;
      }
      uint64_t v128 = v126 + 3;
      uint64_t v205 = v126 + 2;
      if (v126 + 3 >= v197) {
        goto LABEL_60;
      }
      unint64_t v127 = *(void *)&v195[8 * v128];
      if (v127)
      {
LABEL_49:
        uint64_t v126 = v128;
        goto LABEL_46;
      }
      while (1)
      {
        uint64_t v126 = v128 + 1;
        if (__OFADD__(v128, 1))
        {
          __break(1u);
          goto LABEL_105;
        }
        if (v126 >= v197) {
          break;
        }
        unint64_t v127 = *(void *)&v195[8 * v126];
        ++v128;
        if (v127) {
          goto LABEL_46;
        }
      }
      uint64_t v205 = v176[0];
LABEL_60:
      uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB550);
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v129 - 8) + 56))(v108, 1, 1, v129);
      unint64_t v118 = 0;
LABEL_61:
      sub_260DD7C14((uint64_t)v108, (uint64_t)v109, &qword_26A8EB548);
      uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB550);
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v130 - 8) + 48))(v109, 1, v130) == 1)break; {
      uint64_t v131 = *v109;
      }
      unint64_t v132 = &v109[*(int *)(v130 + 48)];
      char v206 = *v120;
      ((void (*)(char *, unsigned __int8 *, char *))v206)(v110, v132, v69);
      id v133 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
      sub_260FE2F30();
      uint64_t v134 = (void *)sub_260FE4070();
      swift_bridgeObjectRelease();
      unsigned int v135 = objc_msgSend(v133, sel_fileExistsAtPath_isDirectory_, v134, 0);

      if (!v135)
      {
        uint64_t v119 = v204;
        uint64_t v110 = v207;
        goto LABEL_39;
      }
      unint64_t v136 = 0xE90000000000006ELL;
      unint64_t v137 = 0x6F6974616D696E61;
      switch(v131)
      {
        case 1:
          unint64_t v137 = 0xD000000000000016;
          v138 = &v217;
          goto LABEL_71;
        case 2:
          unint64_t v136 = 0xE500000000000000;
          unint64_t v137 = 0x696A6F6D65;
          break;
        case 3:
          unint64_t v137 = 0xD000000000000012;
          v138 = (uint64_t *)&v213;
          goto LABEL_71;
        case 4:
          unint64_t v136 = 0xEC0000006E6F6974;
          unint64_t v137 = 0x61727473756C6C69;
          break;
        case 5:
          unint64_t v137 = 0xD000000000000019;
          v138 = &v212;
          goto LABEL_71;
        case 6:
          unint64_t v136 = 0xE600000000000000;
          unint64_t v137 = 0x686374656B73;
          break;
        case 7:
          unint64_t v137 = 0xD000000000000013;
          v138 = (uint64_t *)&v211;
          goto LABEL_71;
        case 8:
          unint64_t v136 = 0xEE00656C62626972;
          unint64_t v137 = 0x63735F656C797473;
          break;
        case 9:
          unint64_t v137 = 0xD00000000000001BLL;
          v138 = (uint64_t *)&v210;
LABEL_71:
          unint64_t v136 = *(v138 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      v139 = (void *)v215;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v139 = sub_260DB118C(0, v139[2] + 1, 1, v139);
      }
      unint64_t v141 = v139[2];
      unint64_t v140 = v139[3];
      if (v141 >= v140 >> 1) {
        v139 = sub_260DB118C((void *)(v140 > 1), v141 + 1, 1, v139);
      }
      v139[2] = v141 + 1;
      uint64_t v142 = &v139[2 * v141];
      v142[4] = v137;
      v142[5] = v136;
      uint64_t v215 = (uint64_t)v139;
      uint64_t v143 = (uint64_t)v190;
      v208(v190, v207, (uint64_t)v69);
      uint64_t v144 = *(void (**)(uint64_t, uint64_t, uint64_t, char *))v199;
      (*(void (**)(uint64_t, void, uint64_t, char *))v199)(v143, 0, 1, v69);
      if ((*v198)(v143, 1, v69) != 1)
      {
        ((void (*)(char *, uint64_t, char *))v206)(v189, v143, v69);
        uint64_t v152 = (uint64_t)v202;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        long long v213 = (void *)v152;
        unint64_t v155 = sub_260DBB068(v131);
        uint64_t v156 = *(void *)(v152 + 16);
        BOOL v157 = (v154 & 1) == 0;
        uint64_t v158 = v156 + v157;
        if (__OFADD__(v156, v157)) {
          goto LABEL_101;
        }
        char v159 = v154;
        if (*(void *)(v152 + 24) < v158)
        {
          sub_260FC17B8(v158, isUniquelyReferenced_nonNull_native);
          unint64_t v160 = sub_260DBB068(v131);
          uint64_t v110 = v207;
          if ((v159 & 1) == (v161 & 1))
          {
            unint64_t v155 = v160;
            goto LABEL_89;
          }
LABEL_105:
          sub_260FE5280();
          __break(1u);
          JUMPOUT(0x260FE0C84);
        }
        uint64_t v110 = v207;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_260FC4D58();
        }
LABEL_89:
        unint64_t v109 = v192;
        v162 = v213;
        if (v159)
        {
          uint64_t v119 = v204;
          (*(void (**)(unint64_t, char *, char *))(v204 + 40))(v213[7] + *(void *)(v204 + 72) * v155, v189, v69);
LABEL_93:
          uint64_t v202 = v213;
          swift_bridgeObjectRelease();
          unint64_t v108 = v191;
          goto LABEL_39;
        }
        v213[(v155 >> 6) + 8] |= 1 << v155;
        *(unsigned char *)(v162[6] + v155) = v131;
        uint64_t v119 = v204;
        ((void (*)(unint64_t, char *, char *))v206)(v162[7] + *(void *)(v204 + 72) * v155, v189, v69);
        uint64_t v163 = v162[2];
        BOOL v164 = __OFADD__(v163, 1);
        uint64_t v165 = v163 + 1;
        if (!v164)
        {
          v162[2] = v165;
          goto LABEL_93;
        }
        goto LABEL_102;
      }
      sub_260D90820(v143, &qword_26A8E7588);
      uint64_t v145 = (uint64_t)v202;
      swift_bridgeObjectRetain();
      unint64_t v146 = sub_260DBB068(v131);
      char v148 = v147;
      swift_bridgeObjectRelease();
      if (v148)
      {
        int v149 = swift_isUniquelyReferenced_nonNull_native();
        long long v213 = (void *)v145;
        unint64_t v108 = v191;
        unint64_t v109 = v192;
        uint64_t v119 = v204;
        if (!v149)
        {
          sub_260FC4D58();
          uint64_t v145 = (uint64_t)v213;
        }
        uint64_t v150 = (uint64_t)v188;
        ((void (*)(char *, unint64_t, char *))v206)(v188, *(void *)(v145 + 56) + *(void *)(v119 + 72) * v146, v69);
        uint64_t v202 = (void *)v145;
        sub_260FC592C(v146, v145);
        swift_bridgeObjectRelease();
        uint64_t v151 = 0;
      }
      else
      {
        uint64_t v151 = 1;
        uint64_t v150 = (uint64_t)v188;
        unint64_t v108 = v191;
        unint64_t v109 = v192;
        uint64_t v119 = v204;
      }
      v144(v150, v151, 1, v69);
      sub_260D90820(v150, &qword_26A8E7588);
      uint64_t v110 = v207;
      long long v120 = v196;
LABEL_39:
      (*v203)(v110, v69);
    }
    swift_release();
    int v166 = sub_260FE39F0();
    os_log_type_t v167 = sub_260FE4890();
    if (os_log_type_enabled(v166, v167))
    {
      v168 = (uint8_t *)swift_slowAlloc();
      uint64_t v169 = swift_slowAlloc();
      uint64_t v214 = v169;
      *(_DWORD *)v168 = 136315138;
      swift_beginAccess();
      uint64_t v170 = swift_bridgeObjectRetain();
      uint64_t v171 = MEMORY[0x26122AC60](v170, MEMORY[0x263F8D310]);
      unint64_t v173 = v172;
      swift_bridgeObjectRelease();
      uint64_t v212 = sub_260DB2844(v171, v173, &v214);
      sub_260FE4AE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_260D82000, v166, v167, "Overriding adapters: %s with side-loaded weights", v168, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26122CA00](v169, -1, -1);
      MEMORY[0x26122CA00](v168, -1, -1);
    }

    sub_260F7EF10(v187);
    (*(void (**)(uint64_t, uint64_t))(v177 + 8))(v186, v178);
    sub_260F7EF10((uint64_t)v184);
    uint64_t v174 = v185;
    uint64_t v175 = v183;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)((char *)v174 + *(int *)(v175 + 28)) = v202;
  }
  return result;
}

uint64_t sub_260FE0CD0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  unint64_t v137 = a2;
  uint64_t v152 = sub_260FE2ED0();
  BOOL v157 = *(char **)(v152 - 8);
  MEMORY[0x270FA5388](v152, v3);
  uint64_t v151 = (char *)&v125 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_260FE3420();
  v162 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v140 - 8);
  MEMORY[0x270FA5388](v140, v5);
  uint64_t v175 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3D8);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v156 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B0);
  uint64_t v145 = *(void *)(v155 - 8);
  MEMORY[0x270FA5388](v155, v10);
  v139 = (char *)&v125 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB390);
  uint64_t v179 = *(void *)(v170 - 8);
  MEMORY[0x270FA5388](v170, v12);
  char v161 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3B8);
  uint64_t v16 = MEMORY[0x270FA5388](v14 - 8, v15);
  uint64_t v174 = (char *)&v125 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v18);
  unint64_t v173 = (char *)&v125 - v19;
  uint64_t v178 = sub_260FE3400();
  char v159 = *(void (***)(char *, uint64_t))(v178 - 8);
  MEMORY[0x270FA5388](v178, v20);
  uint64_t v163 = (char *)&v125 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E7588);
  uint64_t v24 = MEMORY[0x270FA5388](v22 - 8, v23);
  unint64_t v136 = (char *)&v125 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24, v26);
  unint64_t v141 = (char *)&v125 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27, v29);
  unint64_t v172 = (char *)&v125 - v31;
  MEMORY[0x270FA5388](v30, v32);
  uint64_t v171 = (char *)&v125 - v33;
  uint64_t v34 = sub_260FE33A0();
  uint64_t v176 = *(void *)(v34 - 8);
  uint64_t v177 = v34;
  MEMORY[0x270FA5388](v34, v35);
  int v166 = (void (**)(char *, uint64_t))((char *)&v125 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v154 = sub_260FE2F90();
  uint64_t v146 = *(void *)(v154 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v154, v37);
  uint64_t v40 = (char *)&v125 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38, v41);
  uint64_t v150 = (char *)&v125 - v42;
  uint64_t v168 = sub_260FE31B0();
  uint64_t v165 = *(void (***)(uint64_t, uint64_t, uint64_t, uint64_t))(v168 - 8);
  MEMORY[0x270FA5388](v168, v43);
  uint64_t v45 = (char *)&v125 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB558);
  uint64_t v47 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46, v48);
  uint64_t v50 = (char *)&v125 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260FE3280();
  __swift_project_boxed_opaque_existential_1(v185, v185[3]);
  uint64_t v51 = a1;
  uint64_t v52 = v186;
  sub_260FE33B0();
  uint64_t v53 = v52;
  if (v52)
  {
    uint64_t v54 = sub_260FE3440();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v54 - 8) + 8))(v51, v54);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v185);
  }
  uint64_t v55 = v179;
  uint64_t v169 = v47;
  char v147 = v40;
  uint64_t v153 = v51;
  uint64_t v56 = sub_260FE3340();
  uint64_t v57 = (uint64_t)v150;
  MEMORY[0x2612299F0](v56);
  ((void (*)(char *, uint64_t))v165[1])(v45, v168);
  uint64_t v58 = v137;
  AppleDiffusionPipeline.ResourceURLs.init(resourcesAt:)(v57, v137);
  uint64_t v59 = (char *)v166;
  uint64_t v168 = (uint64_t)v50;
  sub_260FE3330();
  uint64_t v60 = sub_260FE3390();
  uint64_t v62 = v61;
  (*(void (**)(char *, uint64_t))(v176 + 8))(v59, v177);
  swift_bridgeObjectRelease();
  *(void *)uint64_t v58 = v60;
  *((void *)v58 + 1) = v62;
  unint64_t v148 = sub_260F5BCA0(MEMORY[0x263F8EE78]);
  uint64_t v63 = qword_270D22AB8;
  if (qword_270D22AB8)
  {
    int v166 = (void (**)(char *, uint64_t))(v55 + 8);
    uint64_t v165 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v159 + 7);
    BOOL v164 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 6);
    unint64_t v160 = (void (**)(char *, uint64_t, uint64_t))(v159 + 4);
    int v149 = (void (**)(char *, void, uint64_t, uint64_t))(v145 + 56);
    ++v159;
    id v133 = (void (**)(char *, char *, uint64_t))(v145 + 32);
    unint64_t v132 = (char **)(v162 + 1);
    uint64_t v158 = (void (**)(uint64_t, uint64_t))(v146 + 8);
    uint64_t v131 = (void (**)(char *, uint64_t))(v145 + 8);
    uint64_t v176 = v146 + 56;
    v162 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v146 + 48);
    LODWORD(v145) = *MEMORY[0x263F06E38];
    uint64_t v144 = (void (**)(char *, void, uint64_t))(v157 + 104);
    uint64_t v143 = (void (**)(char *, uint64_t))(v157 + 8);
    unsigned int v135 = (void (**)(char *, uint64_t, uint64_t))(v146 + 32);
    uint64_t v134 = (void (**)(char *, char *, uint64_t))(v146 + 16);
    uint64_t v64 = &byte_270D22AC8;
    unint64_t v142 = 0x8000000261001E00;
    uint64_t v130 = "personalized_emoji";
    uint64_t v129 = "personalized_illustration";
    uint64_t v128 = "personalized_sketch";
    unint64_t v127 = "personalized_style_scribble";
    unint64_t v126 = (unint64_t)"with negative count";
    uint64_t v65 = v161;
    uint64_t v66 = v154;
    uint64_t v167 = v46;
    while (1)
    {
      uint64_t v72 = *v64;
      uint64_t v179 = v63;
      uint64_t v73 = v66;
      uint64_t v186 = v64 + 1;
      uint64_t v177 = v72;
      switch(v72)
      {
        case 1:
          sub_260FE3220();
          break;
        case 2:
          sub_260FE3240();
          break;
        case 3:
          sub_260FE31F0();
          break;
        case 4:
          sub_260FE31E0();
          break;
        case 5:
          sub_260FE3230();
          break;
        case 6:
          sub_260FE3250();
          break;
        case 7:
          sub_260FE3200();
          break;
        case 8:
          sub_260FE31C0();
          break;
        case 9:
          sub_260FE3210();
          break;
        default:
          sub_260FE31D0();
          break;
      }
      uint64_t v74 = v170;
      sub_260FE3370();
      swift_allocObject();
      sub_260FE3360();
      sub_260FE33E0();
      sub_260FE3350();
      if (v53)
      {
        swift_release();
        swift_bridgeObjectRelease();

        (*v166)(v65, v74);
        uint64_t v53 = 0;
        uint64_t v184 = 0;
        long long v182 = 0u;
        long long v183 = 0u;
      }
      else
      {
        (*v166)(v65, v74);
        swift_release();
        swift_bridgeObjectRelease();
      }
      sub_260DD7C14((uint64_t)&v182, (uint64_t)&v180, &qword_26A8EB3C8);
      id v75 = v175;
      uint64_t v76 = (uint64_t)v174;
      uint64_t v77 = (uint64_t)v173;
      uint64_t v66 = v73;
      if (v181)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8EB3D0);
        uint64_t v78 = v178;
        int v79 = swift_dynamicCast();
        (*v165)(v76, v79 ^ 1u, 1, v78);
      }
      else
      {
        sub_260D90820((uint64_t)&v180, &qword_26A8EB3C8);
        uint64_t v78 = v178;
        (*v165)(v76, 1, 1, v178);
      }
      sub_260DD7C14(v76, v77, &qword_26A8EB3B8);
      if ((*v164)(v77, 1, v78) == 1)
      {
        sub_260D90820(v77, &qword_26A8EB3B8);
        uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v176;
        uint64_t v68 = (uint64_t)v172;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v176)(v172, 1, 1, v73);
LABEL_6:
        sub_260D90820(v68, &qword_26A8E7588);
        uint64_t v69 = (uint64_t)v171;
        v67(v171, 1, 1, v66);
        goto LABEL_7;
      }
      unint64_t v80 = v163;
      (*v160)(v163, v77, v78);
      sub_260FE33F0();
      if (v181)
      {
        sub_260DD7B40(&v180, (uint64_t)&v182);
        __swift_project_boxed_opaque_existential_1(&v182, *((uint64_t *)&v183 + 1));
        unint64_t v81 = v156;
        sub_260FE33B0();
        uint64_t v82 = v155;
        (*v149)(v81, 0, 1, v155);
        uint64_t v83 = v139;
        (*v133)(v139, v81, v82);
        uint64_t v84 = sub_260FE3340();
        uint64_t v85 = v150;
        MEMORY[0x261229C60](v84);
        uint64_t v86 = v140;
        BOOL v157 = *v132;
        ((void (*)(char *, uint64_t))v157)(v75, v140);
        char v87 = sub_260FE2EC0();
        (*v158)((uint64_t)v85, v66);
        if (v87)
        {
          uint64_t v88 = sub_260FE3340();
          uint64_t v89 = v172;
          MEMORY[0x261229C60](v88);
          ((void (*)(char *, uint64_t))v157)(v75, v86);
          unint64_t v90 = v83;
          uint64_t v68 = (uint64_t)v89;
          (*v131)(v90, v82);
          (*v159)(v163, v178);
          uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v176;
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))v176)(v68, 0, 1, v66);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v182);
          goto LABEL_34;
        }
        (*v131)(v83, v82);
        (*v159)(v163, v178);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v182);
      }
      else
      {
        (*v159)(v80, v78);
        sub_260D90820((uint64_t)&v180, &qword_26A8EB3C0);
      }
      uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v176;
      uint64_t v68 = (uint64_t)v172;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v176)(v172, 1, 1, v66);
LABEL_34:
      unint64_t v91 = *v162;
      if ((*v162)(v68, 1, v66) == 1)
      {
        uint64_t v65 = v161;
        goto LABEL_6;
      }
      unint64_t v92 = 0xE500000000000000;
      unint64_t v93 = 0x696A6F6D65;
      BOOL v157 = 0;
      switch((int)v177)
      {
        case 1:
          unint64_t v93 = 0xD000000000000016;
          uint64_t v94 = (void (***)(char *, uint64_t))&v162;
          goto LABEL_44;
        case 2:
          break;
        case 3:
          unint64_t v93 = 0xD000000000000012;
          uint64_t v94 = (void (***)(char *, uint64_t))&v161;
          goto LABEL_44;
        case 4:
          unint64_t v92 = 0xEC0000006E6F6974;
          unint64_t v93 = 0x61727473756C6C69;
          break;
        case 5:
          unint64_t v93 = 0xD000000000000019;
          uint64_t v94 = (void (***)(char *, uint64_t))&v160;
          goto LABEL_44;
        case 6:
          unint64_t v92 = 0xE600000000000000;
          unint64_t v93 = 0x686374656B73;
          break;
        case 7:
          unint64_t v93 = 0xD000000000000013;
          uint64_t v94 = &v159;
LABEL_44:
          unint64_t v92 = (unint64_t)*(v94 - 32) | 0x8000000000000000;
          break;
        case 8:
          unint64_t v92 = 0xEE00656C62626972;
          unint64_t v93 = 0x63735F656C797473;
          break;
        case 9:
          unint64_t v92 = v126 | 0x8000000000000000;
          unint64_t v93 = 0xD00000000000001BLL;
          break;
        default:
          unint64_t v92 = 0xE90000000000006ELL;
          unint64_t v93 = 0x6F6974616D696E61;
          break;
      }
      *(void *)&long long v182 = 1852400174;
      *((void *)&v182 + 1) = 0xE400000000000000;
      *(void *)&long long v180 = v93;
      *((void *)&v180 + 1) = v92;
      swift_bridgeObjectRetain();
      *(void *)&long long v180 = sub_260FE42F0();
      *((void *)&v180 + 1) = v95;
      sub_260FE4240();
      swift_bridgeObjectRelease();
      long long v182 = v180;
      *(void *)&long long v180 = 0x2F61726F6CLL;
      *((void *)&v180 + 1) = 0xE500000000000000;
      *(void *)&long long v180 = sub_260FE42F0();
      *((void *)&v180 + 1) = v96;
      sub_260FE4240();
      swift_bridgeObjectRelease();
      long long v182 = v180;
      *(void *)&long long v180 = 0xD00000000000001BLL;
      *((void *)&v180 + 1) = v142;
      *(void *)&long long v180 = sub_260FE42F0();
      *((void *)&v180 + 1) = v97;
      sub_260FE4240();
      swift_bridgeObjectRelease();
      long long v182 = v180;
      uint64_t v98 = v151;
      uint64_t v99 = v152;
      (*v144)(v151, v145, v152);
      sub_260D86D20();
      os_log_type_t v100 = v171;
      sub_260FE2F70();
      (*v143)(v98, v99);
      swift_bridgeObjectRelease();
      uint64_t v101 = *v158;
      uint64_t v69 = (uint64_t)v100;
      uint64_t v66 = v154;
      (*v158)(v68, v154);
      v67((char *)v69, 0, 1, v66);
      if (v91(v69, 1, v66) != 1)
      {
        v138 = v101;
        uint64_t v102 = v91;
        uint64_t v103 = *v135;
        uint64_t v104 = v147;
        (*v135)(v147, v69, v66);
        uint64_t v105 = (uint64_t)v141;
        (*v134)(v141, v104, v66);
        v67((char *)v105, 0, 1, v66);
        unsigned int v106 = v102(v105, 1, v66);
        uint64_t v107 = v146;
        uint64_t v53 = v157;
        if (v106 == 1)
        {
          unint64_t v108 = v103;
          sub_260D90820(v105, &qword_26A8E7588);
          unint64_t v109 = v148;
          swift_bridgeObjectRetain();
          unint64_t v110 = sub_260DBB068(v177);
          char v112 = v111;
          swift_bridgeObjectRelease();
          if (v112)
          {
            int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v182 = v109;
            uint64_t v114 = v109;
            if (!isUniquelyReferenced_nonNull_native)
            {
              sub_260FC4D58();
              uint64_t v114 = v182;
            }
            uint64_t v115 = v136;
            v108(v136, *(void *)(v114 + 56) + *(void *)(v107 + 72) * v110, v66);
            unint64_t v148 = v114;
            sub_260FC592C(v110, v114);
            swift_bridgeObjectRelease();
            uint64_t v116 = (uint64_t)v115;
            uint64_t v117 = 0;
          }
          else
          {
            uint64_t v117 = 1;
            uint64_t v116 = (uint64_t)v136;
          }
          v67((char *)v116, v117, 1, v66);
          sub_260D90820(v116, &qword_26A8E7588);
        }
        else
        {
          uint64_t v118 = (uint64_t)v150;
          v103(v150, v105, v66);
          unint64_t v119 = v148;
          char v120 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v182 = v119;
          sub_260FC679C(v118, v177, v120);
          unint64_t v148 = v182;
          swift_bridgeObjectRelease();
        }
        uint64_t v65 = v161;
        uint64_t v46 = v167;
        uint64_t v70 = v169;
        v138((uint64_t)v147, v66);
        goto LABEL_8;
      }
      uint64_t v65 = v161;
      uint64_t v53 = v157;
LABEL_7:
      sub_260D90820(v69, &qword_26A8E7588);
      uint64_t v46 = v167;
      uint64_t v70 = v169;
LABEL_8:
      uint64_t v71 = v168;
      uint64_t v63 = v179 - 1;
      uint64_t v64 = v186;
      if (v179 == 1) {
        goto LABEL_59;
      }
    }
  }
  uint64_t v70 = v169;
  uint64_t v71 = v168;
LABEL_59:
  uint64_t v121 = sub_260FE3440();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v121 - 8) + 8))(v153, v121);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v46);
  uint64_t v122 = *(int *)(type metadata accessor for AppleDiffusionPipeline.ResourceURLs() + 28);
  uint64_t v123 = v137;
  swift_bridgeObjectRelease();
  *(void *)&v123[v122] = v148;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v185);
}

uint64_t sub_260FE2388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_260FE2F90();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  uint64_t v16 = (char *)&v23 - v15;
  uint64_t v17 = type metadata accessor for AppleDiffusionPipeline.ResourceURLs();
  (*(void (**)(uint64_t))(a2 + *(int *)(v17 + 24)))(a1);
  (*(void (**)(uint64_t))(a3 + *(int *)(v17 + 24)))(a1);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  sub_260FE2F30();
  uint64_t v19 = (void *)sub_260FE4070();
  swift_bridgeObjectRelease();
  LODWORD(a2) = objc_msgSend(v18, sel_fileExistsAtPath_isDirectory_, v19, 0);

  if (a2) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = v13;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a4, v20, v8);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v13, v8);
  return ((uint64_t (*)(char *, uint64_t))v21)(v16, v8);
}

uint64_t sub_260FE2564()
{
  unint64_t v1 = (int *)(type metadata accessor for AppleDiffusionPipeline.ResourceURLs() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = (v4 + v2 + v3) & ~v2;
  uint64_t v7 = v6 + v4;
  uint64_t v8 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v9 = v8 + v1[7];
  uint64_t v10 = sub_260FE2F90();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11(v0 + v6 + v1[7], v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v7, v5);
}

uint64_t sub_260FE26EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AppleDiffusionPipeline.ResourceURLs() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v2 + ((*(void *)(v5 + 64) + v6 + v7) & ~v6);
  return sub_260FE2388(a1, v2 + v7, v8, a2);
}

unint64_t sub_260FE2798()
{
  unint64_t result = qword_26A8EB458;
  if (!qword_26A8EB458)
  {
    sub_260FE2F90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8EB458);
  }
  return result;
}

uint64_t sub_260FE27F0()
{
  return MEMORY[0x270F9CC78]();
}

uint64_t sub_260FE2800()
{
  return MEMORY[0x270F9CC80]();
}

uint64_t sub_260FE2810()
{
  return MEMORY[0x270F9CC88]();
}

uint64_t sub_260FE2820()
{
  return MEMORY[0x270F9CC90]();
}

uint64_t sub_260FE2830()
{
  return MEMORY[0x270F9CC98]();
}

uint64_t sub_260FE2840()
{
  return MEMORY[0x270F9CCA0]();
}

uint64_t sub_260FE2850()
{
  return MEMORY[0x270F9CCB0]();
}

uint64_t sub_260FE2860()
{
  return MEMORY[0x270F9CCB8]();
}

uint64_t sub_260FE2870()
{
  return MEMORY[0x270F9CCD0]();
}

uint64_t sub_260FE2880()
{
  return MEMORY[0x270F9CCD8]();
}

uint64_t sub_260FE2890()
{
  return MEMORY[0x270F9CCE8]();
}

uint64_t sub_260FE28A0()
{
  return MEMORY[0x270F9CCF0]();
}

uint64_t sub_260FE28B0()
{
  return MEMORY[0x270F9CCF8]();
}

uint64_t sub_260FE28C0()
{
  return MEMORY[0x270F9CD08]();
}

uint64_t sub_260FE28D0()
{
  return MEMORY[0x270F9CD18]();
}

uint64_t sub_260FE28E0()
{
  return MEMORY[0x270F9CD20]();
}

uint64_t sub_260FE28F0()
{
  return MEMORY[0x270F9CD28]();
}

uint64_t sub_260FE2900()
{
  return MEMORY[0x270F9CD30]();
}

uint64_t sub_260FE2910()
{
  return MEMORY[0x270F9CD40]();
}

uint64_t sub_260FE2920()
{
  return MEMORY[0x270F9CD48]();
}

uint64_t sub_260FE2930()
{
  return MEMORY[0x270F9CD50]();
}

uint64_t sub_260FE2940()
{
  return MEMORY[0x270F9CD58]();
}

uint64_t sub_260FE2950()
{
  return MEMORY[0x270F9CD60]();
}

uint64_t sub_260FE2960()
{
  return MEMORY[0x270F9CD68]();
}

uint64_t sub_260FE2970()
{
  return MEMORY[0x270F9CD70]();
}

uint64_t sub_260FE2980()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_260FE2990()
{
  return MEMORY[0x270EEDDE0]();
}

uint64_t sub_260FE29A0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_260FE29B0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_260FE29C0()
{
  return MEMORY[0x270EEDE30]();
}

uint64_t sub_260FE29D0()
{
  return MEMORY[0x270EEDE40]();
}

uint64_t sub_260FE29E0()
{
  return MEMORY[0x270EEDE50]();
}

uint64_t sub_260FE29F0()
{
  return MEMORY[0x270EEDE68]();
}

uint64_t sub_260FE2A00()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_260FE2A10()
{
  return MEMORY[0x270EEDEF8]();
}

uint64_t sub_260FE2A20()
{
  return MEMORY[0x270EEDF00]();
}

uint64_t sub_260FE2A30()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_260FE2A40()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_260FE2A50()
{
  return MEMORY[0x270EEE0A0]();
}

uint64_t sub_260FE2A60()
{
  return MEMORY[0x270EEE128]();
}

uint64_t sub_260FE2A70()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_260FE2A80()
{
  return MEMORY[0x270EEE220]();
}

uint64_t sub_260FE2A90()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_260FE2AA0()
{
  return MEMORY[0x270EEE620]();
}

uint64_t sub_260FE2AB0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_260FE2AC0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_260FE2AD0()
{
  return MEMORY[0x270EEE650]();
}

uint64_t sub_260FE2AE0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_260FE2AF0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_260FE2B00()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_260FE2B10()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_260FE2B20()
{
  return MEMORY[0x270EEE698]();
}

uint64_t sub_260FE2B30()
{
  return MEMORY[0x270EEE6A8]();
}

uint64_t sub_260FE2B40()
{
  return MEMORY[0x270EEE900]();
}

uint64_t sub_260FE2B50()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_260FE2B60()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_260FE2B70()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_260FE2B80()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_260FE2B90()
{
  return MEMORY[0x270EEEA58]();
}

uint64_t sub_260FE2BA0()
{
  return MEMORY[0x270EEEA98]();
}

uint64_t sub_260FE2BB0()
{
  return MEMORY[0x270EEEAA0]();
}

uint64_t sub_260FE2BC0()
{
  return MEMORY[0x270EEEAE0]();
}

uint64_t sub_260FE2BD0()
{
  return MEMORY[0x270EEEB08]();
}

uint64_t sub_260FE2BE0()
{
  return MEMORY[0x270EEEB20]();
}

uint64_t sub_260FE2BF0()
{
  return MEMORY[0x270EEEB48]();
}

uint64_t sub_260FE2C00()
{
  return MEMORY[0x270EEEB58]();
}

uint64_t sub_260FE2C10()
{
  return MEMORY[0x270EEEB80]();
}

uint64_t sub_260FE2C20()
{
  return MEMORY[0x270EEEBE8]();
}

uint64_t sub_260FE2C30()
{
  return MEMORY[0x270EEEC30]();
}

uint64_t sub_260FE2C40()
{
  return MEMORY[0x270EEEC78]();
}

uint64_t sub_260FE2C50()
{
  return MEMORY[0x270EEEC98]();
}

uint64_t sub_260FE2C60()
{
  return MEMORY[0x270EEECA0]();
}

uint64_t sub_260FE2C70()
{
  return MEMORY[0x270EEECB8]();
}

uint64_t sub_260FE2C80()
{
  return MEMORY[0x270EEECC8]();
}

uint64_t sub_260FE2C90()
{
  return MEMORY[0x270EEED00]();
}

uint64_t sub_260FE2CA0()
{
  return MEMORY[0x270EEED10]();
}

uint64_t sub_260FE2CB0()
{
  return MEMORY[0x270EEED20]();
}

uint64_t sub_260FE2CC0()
{
  return MEMORY[0x270EEED28]();
}

uint64_t sub_260FE2CD0()
{
  return MEMORY[0x270EEED38]();
}

uint64_t sub_260FE2CE0()
{
  return MEMORY[0x270EEED48]();
}

uint64_t sub_260FE2CF0()
{
  return MEMORY[0x270EEED58]();
}

uint64_t sub_260FE2D00()
{
  return MEMORY[0x270EEEDE0]();
}

uint64_t sub_260FE2D10()
{
  return MEMORY[0x270EEEDE8]();
}

uint64_t sub_260FE2D20()
{
  return MEMORY[0x270EEEE00]();
}

uint64_t sub_260FE2D30()
{
  return MEMORY[0x270EEEE20]();
}

uint64_t sub_260FE2D40()
{
  return MEMORY[0x270EEEE30]();
}

uint64_t sub_260FE2D50()
{
  return MEMORY[0x270EEEE48]();
}

uint64_t sub_260FE2D60()
{
  return MEMORY[0x270EEEEB8]();
}

uint64_t sub_260FE2D70()
{
  return MEMORY[0x270EEF018]();
}

uint64_t sub_260FE2D80()
{
  return MEMORY[0x270EEF068]();
}

uint64_t sub_260FE2D90()
{
  return MEMORY[0x270EEF078]();
}

uint64_t sub_260FE2DA0()
{
  return MEMORY[0x270EEF130]();
}

uint64_t sub_260FE2DB0()
{
  return MEMORY[0x270EEF148]();
}

uint64_t sub_260FE2DC0()
{
  return MEMORY[0x270EEF158]();
}

uint64_t sub_260FE2DD0()
{
  return MEMORY[0x270EEF168]();
}

uint64_t sub_260FE2DE0()
{
  return MEMORY[0x270EEF170]();
}

uint64_t sub_260FE2DF0()
{
  return MEMORY[0x270EEF188]();
}

uint64_t sub_260FE2E00()
{
  return MEMORY[0x270EEF1A8]();
}

uint64_t sub_260FE2E10()
{
  return MEMORY[0x270EEF1C0]();
}

uint64_t sub_260FE2E20()
{
  return MEMORY[0x270EEF820]();
}

uint64_t sub_260FE2E30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_260FE2E40()
{
  return MEMORY[0x270EEF860]();
}

uint64_t sub_260FE2E50()
{
  return MEMORY[0x270EEF880]();
}

uint64_t sub_260FE2E60()
{
  return MEMORY[0x270EEF8B8]();
}

uint64_t sub_260FE2E70()
{
  return MEMORY[0x270EEF8F0]();
}

uint64_t sub_260FE2E80()
{
  return MEMORY[0x270EEF900]();
}

uint64_t sub_260FE2E90()
{
  return MEMORY[0x270EEF928]();
}

uint64_t sub_260FE2EA0()
{
  return MEMORY[0x270EEFA88]();
}

uint64_t sub_260FE2EB0()
{
  return MEMORY[0x270EEFAA0]();
}

uint64_t sub_260FE2EC0()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_260FE2ED0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_260FE2EE0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_260FE2EF0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_260FE2F00()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_260FE2F10()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_260FE2F20()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_260FE2F30()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_260FE2F40()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_260FE2F50()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_260FE2F60()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_260FE2F70()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_260FE2F80()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_260FE2F90()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_260FE2FA0()
{
  return MEMORY[0x270EEFFA8]();
}

uint64_t sub_260FE2FB0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_260FE2FC0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_260FE2FD0()
{
  return MEMORY[0x270EF0088]();
}

uint64_t sub_260FE2FE0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_260FE2FF0()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_260FE3000()
{
  return MEMORY[0x270EF0138]();
}

uint64_t sub_260FE3010()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_260FE3020()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_260FE3030()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_260FE3040()
{
  return MEMORY[0x270EF0220]();
}

uint64_t sub_260FE3050()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_260FE3060()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_260FE3070()
{
  return MEMORY[0x270EF0B00]();
}

uint64_t sub_260FE3080()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_260FE3090()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_260FE30A0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_260FE30B0()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_260FE30C0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_260FE30D0()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_260FE30E0()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_260FE30F0()
{
  return MEMORY[0x270EF0CD8]();
}

uint64_t sub_260FE3100()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_260FE3110()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_260FE3120()
{
  return MEMORY[0x270EF0DC0]();
}

uint64_t sub_260FE3130()
{
  return MEMORY[0x270EF0DD0]();
}

uint64_t sub_260FE3140()
{
  return MEMORY[0x270EF0DE8]();
}

uint64_t sub_260FE3150()
{
  return MEMORY[0x270EF0F68]();
}

uint64_t sub_260FE3160()
{
  return MEMORY[0x270EF0F80]();
}

uint64_t sub_260FE3170()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_260FE3180()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_260FE3190()
{
  return MEMORY[0x270EF17A8]();
}

uint64_t sub_260FE31A0()
{
  return MEMORY[0x270F4B878]();
}

uint64_t sub_260FE31B0()
{
  return MEMORY[0x270F4B888]();
}

uint64_t sub_260FE31C0()
{
  return MEMORY[0x270F4B910]();
}

uint64_t sub_260FE31D0()
{
  return MEMORY[0x270F4B918]();
}

uint64_t sub_260FE31E0()
{
  return MEMORY[0x270F4B920]();
}

uint64_t sub_260FE31F0()
{
  return MEMORY[0x270F4B928]();
}

uint64_t sub_260FE3200()
{
  return MEMORY[0x270F4B930]();
}

uint64_t sub_260FE3210()
{
  return MEMORY[0x270F4B938]();
}

uint64_t sub_260FE3220()
{
  return MEMORY[0x270F4B940]();
}

uint64_t sub_260FE3230()
{
  return MEMORY[0x270F4B948]();
}

uint64_t sub_260FE3240()
{
  return MEMORY[0x270F4B950]();
}

uint64_t sub_260FE3250()
{
  return MEMORY[0x270F4B958]();
}

uint64_t sub_260FE3260()
{
  return MEMORY[0x270F4B9A0]();
}

uint64_t sub_260FE3270()
{
  return MEMORY[0x270F4B9C8]();
}

uint64_t sub_260FE3280()
{
  return MEMORY[0x270F4BB40]();
}

uint64_t sub_260FE3290()
{
  return MEMORY[0x270F4BB50]();
}

uint64_t sub_260FE32A0()
{
  return MEMORY[0x270F4BB58]();
}

uint64_t sub_260FE32B0()
{
  return MEMORY[0x270F4BB60]();
}

uint64_t sub_260FE32C0()
{
  return MEMORY[0x270F4BB68]();
}

uint64_t sub_260FE32D0()
{
  return MEMORY[0x270F4BB70]();
}

uint64_t sub_260FE32E0()
{
  return MEMORY[0x270F4BB78]();
}

uint64_t sub_260FE32F0()
{
  return MEMORY[0x270F4BB80]();
}

uint64_t sub_260FE3300()
{
  return MEMORY[0x270F4BB88]();
}

uint64_t sub_260FE3310()
{
  return MEMORY[0x270F4BB90]();
}

uint64_t sub_260FE3320()
{
  return MEMORY[0x270F4BB98]();
}

uint64_t sub_260FE3330()
{
  return MEMORY[0x270F4BBF0]();
}

uint64_t sub_260FE3340()
{
  return MEMORY[0x270F4BC00]();
}

uint64_t sub_260FE3350()
{
  return MEMORY[0x270F4BC68]();
}

uint64_t sub_260FE3360()
{
  return MEMORY[0x270F4BC98]();
}

uint64_t sub_260FE3370()
{
  return MEMORY[0x270F4BCA0]();
}

uint64_t sub_260FE3380()
{
  return MEMORY[0x270F4BCD8]();
}

uint64_t sub_260FE3390()
{
  return MEMORY[0x270F4BD30]();
}

uint64_t sub_260FE33A0()
{
  return MEMORY[0x270F4BD48]();
}

uint64_t sub_260FE33B0()
{
  return MEMORY[0x270F4BE60]();
}

uint64_t sub_260FE33C0()
{
  return MEMORY[0x270F4BFB0]();
}

uint64_t sub_260FE33D0()
{
  return MEMORY[0x270F4BFB8]();
}

uint64_t sub_260FE33E0()
{
  return MEMORY[0x270F4BFD0]();
}

uint64_t sub_260FE33F0()
{
  return MEMORY[0x270F4BFE8]();
}

uint64_t sub_260FE3400()
{
  return MEMORY[0x270F4BFF0]();
}

uint64_t sub_260FE3410()
{
  return MEMORY[0x270F4C068]();
}

uint64_t sub_260FE3420()
{
  return MEMORY[0x270F4C070]();
}

uint64_t sub_260FE3430()
{
  return MEMORY[0x270F4C120]();
}

uint64_t sub_260FE3440()
{
  return MEMORY[0x270F4C130]();
}

uint64_t sub_260FE3450()
{
  return MEMORY[0x270FA06B0]();
}

uint64_t sub_260FE3460()
{
  return MEMORY[0x270FA06C0]();
}

uint64_t sub_260FE3470()
{
  return MEMORY[0x270FA06D0]();
}

uint64_t sub_260FE3480()
{
  return MEMORY[0x270F2F858]();
}

uint64_t sub_260FE3490()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_260FE34A0()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_260FE34B0()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_260FE34C0()
{
  return MEMORY[0x270F2F8B8]();
}

uint64_t sub_260FE34D0()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_260FE34E0()
{
  return MEMORY[0x270F2F900]();
}

uint64_t sub_260FE34F0()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_260FE3500()
{
  return MEMORY[0x270F2F928]();
}

uint64_t sub_260FE3510()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_260FE3520()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_260FE3530()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_260FE3540()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_260FE3550()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_260FE3560()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_260FE3570()
{
  return MEMORY[0x270F2FCB0]();
}

uint64_t sub_260FE3580()
{
  return MEMORY[0x270F2FB40]();
}

uint64_t sub_260FE3590()
{
  return MEMORY[0x270F2FCB8]();
}

uint64_t sub_260FE35A0()
{
  return MEMORY[0x270F2FCE0]();
}

uint64_t sub_260FE35B0()
{
  return MEMORY[0x270F2FB50]();
}

uint64_t sub_260FE35C0()
{
  return MEMORY[0x270F2FCE8]();
}

uint64_t sub_260FE35D0()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_260FE35E0()
{
  return MEMORY[0x270F84408]();
}

uint64_t sub_260FE35F0()
{
  return MEMORY[0x270F84418]();
}

uint64_t sub_260FE3600()
{
  return MEMORY[0x270F84420]();
}

uint64_t sub_260FE3610()
{
  return MEMORY[0x270F84428]();
}

uint64_t sub_260FE3620()
{
  return MEMORY[0x270F84458]();
}

uint64_t sub_260FE3630()
{
  return MEMORY[0x270F4C188]();
}

uint64_t sub_260FE3640()
{
  return MEMORY[0x270F4C1A8]();
}

uint64_t sub_260FE3650()
{
  return MEMORY[0x270F4C1B0]();
}

uint64_t sub_260FE3660()
{
  return MEMORY[0x270F4C1B8]();
}

uint64_t sub_260FE3670()
{
  return MEMORY[0x270F4C1C0]();
}

uint64_t sub_260FE3680()
{
  return MEMORY[0x270F4C1C8]();
}

uint64_t sub_260FE3690()
{
  return MEMORY[0x270F4C1D0]();
}

uint64_t sub_260FE36A0()
{
  return MEMORY[0x270F4C1E8]();
}

uint64_t sub_260FE36B0()
{
  return MEMORY[0x270F4C1F0]();
}

uint64_t sub_260FE36C0()
{
  return MEMORY[0x270F4C1F8]();
}

uint64_t sub_260FE36D0()
{
  return MEMORY[0x270F4C210]();
}

uint64_t sub_260FE36E0()
{
  return MEMORY[0x270F4C218]();
}

uint64_t sub_260FE36F0()
{
  return MEMORY[0x270F4C228]();
}

uint64_t sub_260FE3700()
{
  return MEMORY[0x270F4C230]();
}

uint64_t sub_260FE3720()
{
  return MEMORY[0x270F4C248]();
}

uint64_t sub_260FE3730()
{
  return MEMORY[0x270F4C250]();
}

uint64_t sub_260FE3740()
{
  return MEMORY[0x270F4C258]();
}

uint64_t sub_260FE3750()
{
  return MEMORY[0x270F4C260]();
}

uint64_t sub_260FE3760()
{
  return MEMORY[0x270F4C268]();
}

uint64_t sub_260FE3770()
{
  return MEMORY[0x270F4C278]();
}

uint64_t sub_260FE3780()
{
  return MEMORY[0x270F4C280]();
}

uint64_t sub_260FE3790()
{
  return MEMORY[0x270F4C2D8]();
}

uint64_t sub_260FE37A0()
{
  return MEMORY[0x270F4C2F8]();
}

uint64_t sub_260FE37B0()
{
  return MEMORY[0x270F4C350]();
}

uint64_t sub_260FE37C0()
{
  return MEMORY[0x270F4C380]();
}

uint64_t sub_260FE37D0()
{
  return MEMORY[0x270F4C3D8]();
}

uint64_t sub_260FE37E0()
{
  return MEMORY[0x270F4C3E8]();
}

uint64_t sub_260FE37F0()
{
  return MEMORY[0x270F4C3F0]();
}

uint64_t sub_260FE3800()
{
  return MEMORY[0x270F4C400]();
}

uint64_t sub_260FE3810()
{
  return MEMORY[0x270F4C408]();
}

uint64_t sub_260FE3830()
{
  return MEMORY[0x270F4C420]();
}

uint64_t sub_260FE3840()
{
  return MEMORY[0x270F4C440]();
}

uint64_t sub_260FE3850()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_260FE3860()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_260FE3870()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_260FE3880()
{
  return MEMORY[0x270F2FF00]();
}

uint64_t sub_260FE3890()
{
  return MEMORY[0x270F43620]();
}

uint64_t sub_260FE38A0()
{
  return MEMORY[0x270F2F038]();
}

uint64_t sub_260FE38B0()
{
  return MEMORY[0x270F2F078]();
}

uint64_t sub_260FE38C0()
{
  return MEMORY[0x270F2F080]();
}

uint64_t sub_260FE38D0()
{
  return MEMORY[0x270F2F088]();
}

uint64_t sub_260FE38E0()
{
  return MEMORY[0x270F2F130]();
}

uint64_t sub_260FE38F0()
{
  return MEMORY[0x270F2F140]();
}

uint64_t sub_260FE3900()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_260FE3910()
{
  return MEMORY[0x270FA2CC8]();
}

uint64_t sub_260FE3920()
{
  return MEMORY[0x270FA2CE0]();
}

uint64_t sub_260FE3930()
{
  return MEMORY[0x270FA2CF0]();
}

uint64_t sub_260FE3940()
{
  return MEMORY[0x270FA2D08]();
}

uint64_t sub_260FE3950()
{
  return MEMORY[0x270FA2D18]();
}

uint64_t sub_260FE3960()
{
  return MEMORY[0x270FA2D28]();
}

uint64_t sub_260FE3970()
{
  return MEMORY[0x270FA2D50]();
}

uint64_t sub_260FE3980()
{
  return MEMORY[0x270FA2D60]();
}

uint64_t sub_260FE3990()
{
  return MEMORY[0x270FA2D80]();
}

uint64_t sub_260FE39A0()
{
  return MEMORY[0x270FA2D98]();
}

uint64_t sub_260FE39B0()
{
  return MEMORY[0x270FA2DB8]();
}

uint64_t sub_260FE39C0()
{
  return MEMORY[0x270FA2DC8]();
}

uint64_t sub_260FE39D0()
{
  return MEMORY[0x270FA2DD8]();
}

uint64_t sub_260FE39E0()
{
  return MEMORY[0x270FA2DE8]();
}

uint64_t sub_260FE39F0()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_260FE3A00()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_260FE3A10()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_260FE3A20()
{
  return MEMORY[0x270F2F6D0]();
}

uint64_t sub_260FE3A30()
{
  return MEMORY[0x270F2F6D8]();
}

uint64_t sub_260FE3A40()
{
  return MEMORY[0x270F2F6E0]();
}

uint64_t sub_260FE3A50()
{
  return MEMORY[0x270FA1A40]();
}

uint64_t sub_260FE3A60()
{
  return MEMORY[0x270FA1C90]();
}

uint64_t sub_260FE3A70()
{
  return MEMORY[0x270FA1CA8]();
}

uint64_t sub_260FE3A80()
{
  return MEMORY[0x270FA1CB8]();
}

uint64_t sub_260FE3A90()
{
  return MEMORY[0x270FA1CD8]();
}

uint64_t sub_260FE3AA0()
{
  return MEMORY[0x270FA1D08]();
}

uint64_t sub_260FE3AB0()
{
  return MEMORY[0x270FA1D18]();
}

uint64_t sub_260FE3AC0()
{
  return MEMORY[0x270FA1D20]();
}

uint64_t sub_260FE3AD0()
{
  return MEMORY[0x270EE74F8]();
}

uint64_t sub_260FE3AE0()
{
  return MEMORY[0x270EE7508]();
}

uint64_t sub_260FE3AF0()
{
  return MEMORY[0x270EE7510]();
}

uint64_t sub_260FE3B00()
{
  return MEMORY[0x270EE7518]();
}

uint64_t sub_260FE3B10()
{
  return MEMORY[0x270EE7528]();
}

uint64_t sub_260FE3B20()
{
  return MEMORY[0x270EE7530]();
}

uint64_t sub_260FE3B30()
{
  return MEMORY[0x270EE7540]();
}

uint64_t sub_260FE3B40()
{
  return MEMORY[0x270EE7578]();
}

uint64_t sub_260FE3B50()
{
  return MEMORY[0x270EE7580]();
}

uint64_t sub_260FE3B60()
{
  return MEMORY[0x270EE7588]();
}

uint64_t sub_260FE3B70()
{
  return MEMORY[0x270EE75A0]();
}

uint64_t sub_260FE3B80()
{
  return MEMORY[0x270EE75D8]();
}

uint64_t sub_260FE3B90()
{
  return MEMORY[0x270EE75E0]();
}

uint64_t sub_260FE3BA0()
{
  return MEMORY[0x270EE75E8]();
}

uint64_t sub_260FE3BB0()
{
  return MEMORY[0x270EE7620]();
}

uint64_t sub_260FE3BC0()
{
  return MEMORY[0x270EE7628]();
}

uint64_t sub_260FE3BD0()
{
  return MEMORY[0x270EE7630]();
}

uint64_t sub_260FE3BE0()
{
  return MEMORY[0x270EE7638]();
}

uint64_t sub_260FE3BF0()
{
  return MEMORY[0x270EE7650]();
}

uint64_t sub_260FE3C00()
{
  return MEMORY[0x270EE7660]();
}

uint64_t sub_260FE3C10()
{
  return MEMORY[0x270EE7668]();
}

uint64_t sub_260FE3C20()
{
  return MEMORY[0x270EE7670]();
}

uint64_t sub_260FE3C30()
{
  return MEMORY[0x270EE7678]();
}

uint64_t sub_260FE3C40()
{
  return MEMORY[0x270EE7690]();
}

uint64_t sub_260FE3C50()
{
  return MEMORY[0x270EE7698]();
}

uint64_t sub_260FE3C60()
{
  return MEMORY[0x270EE76B0]();
}

uint64_t sub_260FE3C70()
{
  return MEMORY[0x270FA1548]();
}

uint64_t sub_260FE3C80()
{
  return MEMORY[0x270FA1550]();
}

uint64_t sub_260FE3C90()
{
  return MEMORY[0x270FA1558]();
}

uint64_t sub_260FE3CA0()
{
  return MEMORY[0x270F06890]();
}

uint64_t sub_260FE3CB0()
{
  return MEMORY[0x270F06898]();
}

uint64_t sub_260FE3CC0()
{
  return MEMORY[0x270F068A0]();
}

uint64_t sub_260FE3CD0()
{
  return MEMORY[0x270F068A8]();
}

uint64_t sub_260FE3CE0()
{
  return MEMORY[0x270F068B0]();
}

uint64_t sub_260FE3CF0()
{
  return MEMORY[0x270F068B8]();
}

uint64_t sub_260FE3D00()
{
  return MEMORY[0x270F068C0]();
}

uint64_t sub_260FE3D10()
{
  return MEMORY[0x270F068C8]();
}

uint64_t sub_260FE3D20()
{
  return MEMORY[0x270F068D0]();
}

uint64_t sub_260FE3D50()
{
  return MEMORY[0x270F068E8]();
}

uint64_t sub_260FE3D60()
{
  return MEMORY[0x270F068F0]();
}

uint64_t sub_260FE3D70()
{
  return MEMORY[0x270F068F8]();
}

uint64_t sub_260FE3D80()
{
  return MEMORY[0x270F06900]();
}

uint64_t sub_260FE3D90()
{
  return MEMORY[0x270F06908]();
}

uint64_t sub_260FE3DA0()
{
  return MEMORY[0x270F06910]();
}

uint64_t sub_260FE3DB0()
{
  return MEMORY[0x270F06918]();
}

uint64_t sub_260FE3DC0()
{
  return MEMORY[0x270F06920]();
}

uint64_t sub_260FE3DD0()
{
  return MEMORY[0x270F06928]();
}

uint64_t sub_260FE3DE0()
{
  return MEMORY[0x270F06930]();
}

uint64_t sub_260FE3DF0()
{
  return MEMORY[0x270F06938]();
}

uint64_t sub_260FE3E00()
{
  return MEMORY[0x270F06940]();
}

uint64_t sub_260FE3E10()
{
  return MEMORY[0x270F06948]();
}

uint64_t sub_260FE3E20()
{
  return MEMORY[0x270F06950]();
}

uint64_t sub_260FE3E30()
{
  return MEMORY[0x270F06958]();
}

uint64_t sub_260FE3E40()
{
  return MEMORY[0x270F06960]();
}

uint64_t sub_260FE3E50()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_260FE3E60()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_260FE3E70()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_260FE3E80()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_260FE3E90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_260FE3EA0()
{
  return MEMORY[0x270EF1838]();
}

uint64_t sub_260FE3EB0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_260FE3EC0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_260FE3ED0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_260FE3EE0()
{
  return MEMORY[0x270F9D308]();
}

uint64_t sub_260FE3EF0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_260FE3F00()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_260FE3F10()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_260FE3F20()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_260FE3F30()
{
  return MEMORY[0x270F9D3A0]();
}

uint64_t sub_260FE3F40()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_260FE3F50()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_260FE3F60()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_260FE3F70()
{
  return MEMORY[0x270FA2B68]();
}

uint64_t sub_260FE3F80()
{
  return MEMORY[0x270F9D410]();
}

uint64_t sub_260FE3F90()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_260FE3FA0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_260FE3FB0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_260FE3FC0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_260FE3FD0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_260FE3FE0()
{
  return MEMORY[0x270EF18A0]();
}

uint64_t sub_260FE3FF0()
{
  return MEMORY[0x270EF18C8]();
}

uint64_t sub_260FE4000()
{
  return MEMORY[0x270EF18F8]();
}

uint64_t sub_260FE4010()
{
  return MEMORY[0x270EF1900]();
}

uint64_t sub_260FE4020()
{
  return MEMORY[0x270EF1920]();
}

uint64_t sub_260FE4030()
{
  return MEMORY[0x270EF1930]();
}

uint64_t sub_260FE4040()
{
  return MEMORY[0x270EF1940]();
}

uint64_t sub_260FE4050()
{
  return MEMORY[0x270EF1948]();
}

uint64_t sub_260FE4060()
{
  return MEMORY[0x270EF1960]();
}

uint64_t sub_260FE4070()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_260FE4080()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_260FE4090()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_260FE40A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_260FE40B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_260FE40C0()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_260FE40D0()
{
  return MEMORY[0x270EF1A20]();
}

uint64_t sub_260FE40E0()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_260FE40F0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_260FE4100()
{
  return MEMORY[0x270EF1AB0]();
}

uint64_t sub_260FE4110()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_260FE4120()
{
  return MEMORY[0x270EF1B00]();
}

uint64_t sub_260FE4130()
{
  return MEMORY[0x270EF1B08]();
}

uint64_t sub_260FE4140()
{
  return MEMORY[0x270EF1B28]();
}

uint64_t sub_260FE4150()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_260FE4160()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_260FE4170()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_260FE4180()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_260FE4190()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_260FE41A0()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_260FE41B0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_260FE41C0()
{
  return MEMORY[0x270F9D6E0]();
}

uint64_t sub_260FE41D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260FE41E0()
{
  return MEMORY[0x270F9D718]();
}

uint64_t sub_260FE41F0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_260FE4200()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_260FE4210()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_260FE4220()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_260FE4230()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_260FE4240()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_260FE4250()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260FE4260()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_260FE4270()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_260FE4280()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_260FE4290()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_260FE42A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_260FE42B0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_260FE42C0()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_260FE42D0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_260FE42E0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_260FE42F0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_260FE4300()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_260FE4310()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_260FE4320()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_260FE4330()
{
  return MEMORY[0x270F9D9E8]();
}

uint64_t sub_260FE4340()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_260FE4350()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_260FE4360()
{
  return MEMORY[0x270F9DAD8]();
}

uint64_t sub_260FE4370()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_260FE4380()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_260FE4390()
{
  return MEMORY[0x270F9DB58]();
}

uint64_t sub_260FE43E0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_260FE43F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_260FE4400()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_260FE4410()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_260FE4420()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_260FE4430()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_260FE4440()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_260FE4450()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_260FE4460()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_260FE4470()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_260FE4480()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_260FE4490()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_260FE44A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_260FE44B0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_260FE44C0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_260FE44D0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_260FE44E0()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_260FE4500()
{
  return MEMORY[0x270FA1EB8]();
}

uint64_t sub_260FE4510()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_260FE4520()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_260FE4530()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_260FE4540()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_260FE4550()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_260FE4560()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_260FE4580()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_260FE4590()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_260FE45A0()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_260FE45B0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_260FE45C0()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_260FE45E0()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_260FE4600()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_260FE4610()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_260FE4620()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_260FE4630()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_260FE4660()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_260FE4670()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_260FE4680()
{
  return MEMORY[0x270FA2128]();
}

uint64_t sub_260FE4690()
{
  return MEMORY[0x270FA2130]();
}

uint64_t sub_260FE46A0()
{
  return MEMORY[0x270FA2138]();
}

uint64_t sub_260FE46B0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_260FE46C0()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_260FE46D0()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_260FE46E0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_260FE46F0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_260FE4700()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_260FE4710()
{
  return MEMORY[0x270EF1D00]();
}

uint64_t sub_260FE4720()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_260FE4730()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_260FE4740()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_260FE4750()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_260FE4760()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_260FE4770()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_260FE4780()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t sub_260FE4790()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_260FE47A0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_260FE47B0()
{
  return MEMORY[0x270EF1D28]();
}

uint64_t sub_260FE47C0()
{
  return MEMORY[0x270EF1D38]();
}

uint64_t sub_260FE47D0()
{
  return MEMORY[0x270EF1D58]();
}

uint64_t sub_260FE47E0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_260FE47F0()
{
  return MEMORY[0x270FA10D8]();
}

uint64_t sub_260FE4800()
{
  return MEMORY[0x270FA10E0]();
}

uint64_t sub_260FE4810()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_260FE4820()
{
  return MEMORY[0x270EE78F0]();
}

uint64_t sub_260FE4830()
{
  return MEMORY[0x270EE78F8]();
}

uint64_t sub_260FE4840()
{
  return MEMORY[0x270EE7900]();
}

uint64_t sub_260FE4850()
{
  return MEMORY[0x270EE7908]();
}

uint64_t sub_260FE4860()
{
  return MEMORY[0x270EE7918]();
}

uint64_t sub_260FE4870()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_260FE4880()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_260FE4890()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_260FE48A0()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_260FE48B0()
{
  return MEMORY[0x270F9CDC8]();
}

uint64_t sub_260FE48C0()
{
  return MEMORY[0x270F9CDE0]();
}

uint64_t sub_260FE48D0()
{
  return MEMORY[0x270EE58E0]();
}

uint64_t sub_260FE48E0()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_260FE48F0()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_260FE4900()
{
  return MEMORY[0x270FA0D80]();
}

uint64_t sub_260FE4910()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_260FE4920()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_260FE4930()
{
  return MEMORY[0x270FA2E98]();
}

uint64_t sub_260FE4940()
{
  return MEMORY[0x270FA2EA0]();
}

uint64_t sub_260FE4950()
{
  return MEMORY[0x270FA2EB0]();
}

uint64_t sub_260FE4960()
{
  return MEMORY[0x270F9CDF8]();
}

uint64_t sub_260FE4970()
{
  return MEMORY[0x270F9CE18]();
}

uint64_t sub_260FE4980()
{
  return MEMORY[0x270F9CE20]();
}

uint64_t sub_260FE4990()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_260FE49A0()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_260FE49B0()
{
  return MEMORY[0x270F9CE48]();
}

uint64_t sub_260FE49C0()
{
  return MEMORY[0x270F9CE50]();
}

uint64_t sub_260FE49D0()
{
  return MEMORY[0x270F9CE58]();
}

uint64_t sub_260FE49E0()
{
  return MEMORY[0x270FA10F0]();
}

uint64_t sub_260FE49F0()
{
  return MEMORY[0x270EF2088]();
}

uint64_t sub_260FE4A00()
{
  return MEMORY[0x270EF2098]();
}

uint64_t sub_260FE4A10()
{
  return MEMORY[0x270EF20B0]();
}

uint64_t sub_260FE4A20()
{
  return MEMORY[0x270FA1108]();
}

uint64_t sub_260FE4A30()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_260FE4A40()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_260FE4A50()
{
  return MEMORY[0x270EF2208]();
}

uint64_t sub_260FE4A60()
{
  return MEMORY[0x270FA2EC0]();
}

uint64_t sub_260FE4A70()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_260FE4A80()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_260FE4A90()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_260FE4AA0()
{
  return MEMORY[0x270F9E4B8]();
}

uint64_t sub_260FE4AB0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_260FE4AC0()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_260FE4AD0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_260FE4AE0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_260FE4AF0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_260FE4B00()
{
  return MEMORY[0x270EF23D0]();
}

uint64_t sub_260FE4B10()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_260FE4B20()
{
  return MEMORY[0x270EF2488]();
}

uint64_t sub_260FE4B30()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_260FE4B40()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_260FE4B50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_260FE4B70()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_260FE4B80()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_260FE4B90()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_260FE4BA0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_260FE4BB0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_260FE4BC0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_260FE4BD0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_260FE4BE0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_260FE4BF0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_260FE4C10()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_260FE4C20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260FE4C30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_260FE4C40()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_260FE4C50()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_260FE4C60()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_260FE4C70()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_260FE4C80()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_260FE4C90()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_260FE4CA0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_260FE4CB0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_260FE4CC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_260FE4CD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_260FE4CE0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_260FE4D00()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_260FE4D10()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_260FE4D20()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_260FE4D30()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_260FE4D40()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_260FE4D50()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_260FE4D60()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_260FE4D70()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_260FE4D80()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_260FE4D90()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_260FE4DA0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_260FE4DB0()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t sub_260FE4DC0()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_260FE4DD0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_260FE4DE0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_260FE4DF0()
{
  return MEMORY[0x270F9EF28]();
}

uint64_t sub_260FE4E00()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_260FE4E10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_260FE4E20()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_260FE4E30()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_260FE4E40()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_260FE4E50()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_260FE4E60()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_260FE4E70()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_260FE4E80()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_260FE4E90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_260FE4EA0()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_260FE4EC0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_260FE4EE0()
{
  return MEMORY[0x270FA22C0]();
}

uint64_t sub_260FE4EF0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_260FE4F00()
{
  return MEMORY[0x270EF2628]();
}

uint64_t sub_260FE4F10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_260FE4F20()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_260FE4F30()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_260FE4F40()
{
  return MEMORY[0x270F9F288]();
}

uint64_t sub_260FE4F50()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_260FE4F60()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_260FE4F70()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_260FE4F80()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_260FE4F90()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_260FE4FA0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_260FE4FB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_260FE4FC0()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_260FE4FD0()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_260FE4FE0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_260FE4FF0()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_260FE5000()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_260FE5010()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_260FE5020()
{
  return MEMORY[0x270EF2640]();
}

uint64_t sub_260FE5030()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_260FE5040()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_260FE5050()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_260FE5060()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_260FE5070()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_260FE5080()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_260FE5090()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_260FE50A0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_260FE50B0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_260FE50C0()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_260FE50D0()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_260FE50E0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_260FE50F0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_260FE5100()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_260FE5110()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_260FE5130()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_260FE5140()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_260FE5150()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260FE5170()
{
  return MEMORY[0x270F9F7E0]();
}

uint64_t sub_260FE5180()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_260FE5190()
{
  return MEMORY[0x270F9F7F0]();
}

uint64_t sub_260FE51A0()
{
  return MEMORY[0x270F9F7F8]();
}

uint64_t sub_260FE51B0()
{
  return MEMORY[0x270F9F808]();
}

uint64_t sub_260FE51C0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_260FE51D0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_260FE51E0()
{
  return MEMORY[0x270F9F880]();
}

uint64_t sub_260FE51F0()
{
  return MEMORY[0x270F9F888]();
}

uint64_t sub_260FE5200()
{
  return MEMORY[0x270F9F898]();
}

uint64_t sub_260FE5210()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_260FE5220()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_260FE5230()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_260FE5240()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_260FE5260()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_260FE5270()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_260FE5280()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_260FE5290()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_260FE52A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260FE52B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260FE52C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260FE52D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260FE52E0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_260FE52F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260FE5300()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_260FE5310()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_260FE5320()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_260FE5330()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_260FE5340()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_260FE5350()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_260FE5360()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_260FE5370()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_260FE5380()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_260FE5390()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_260FE53A0()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_260FE53B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_260FE53C0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_260FE53D0()
{
  return MEMORY[0x270F9FD90]();
}

uint64_t sub_260FE53E0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_260FE53F0()
{
  return MEMORY[0x270F9FFF8]();
}

uint64_t sub_260FE5400()
{
  return MEMORY[0x270FA0030]();
}

uint64_t sub_260FE5430()
{
  return MEMORY[0x270FA0128]();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47D8](allocator, capacity);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D0](theString);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

BOOL CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadataRef metadata, CFStringRef dictionaryName, CFStringRef propertyName, CFTypeRef value)
{
  return MEMORY[0x270EF4FB8](metadata, dictionaryName, propertyName, value);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CTFontRef CTFontCreateForString(CTFontRef currentFont, CFStringRef string, CFRange range)
{
  return (CTFontRef)MEMORY[0x270EE9AC8](currentFont, string, range.location, range.length);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x270EF4E60]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x270F55168]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x270F55170]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF8]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C0](*(void *)&task, *(void *)&name);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD08](a1, a2);
  return result;
}

uint64_t sendAneSessionSignal()
{
  return MEMORY[0x270F08AB0]();
}

uint64_t sendAneSignal()
{
  return MEMORY[0x270F08AB8]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocError()
{
  return MEMORY[0x270FA0230]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x270EDB838](*(void *)&task, token);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB990](a1);
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsbsbm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_ARGB8888toPlanarF(const vImage_Buffer *src, const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDEFA8](src, alpha, red, green, blue, maxFloat, minFloat, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDEFE8](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF020](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF090](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_PlanarFToARGB8888(const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0A8](alpha, red, green, blue, dest, maxFloat, minFloat, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFToBGRX8888(const vImage_Buffer *blue, const vImage_Buffer *green, const vImage_Buffer *red, Pixel_8 alpha, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0B0](blue, green, red, alpha, dest, maxFloat, minFloat, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x270EDF158](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x270EDF1A0](src, dest, pixelSize, *(void *)&flags);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF258](newSrc, origSrc, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF288](src, dest, *(void *)&flags);
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF88](bytes, length);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x270EDBFF8]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC068](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C8](xdict, key);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC130]();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}