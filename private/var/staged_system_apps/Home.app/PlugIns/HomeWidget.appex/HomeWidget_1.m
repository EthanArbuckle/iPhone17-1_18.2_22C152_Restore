uint64_t sub_1000A22F4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (**v16)(char *, unint64_t, uint64_t);
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  void *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  void *v41;
  void (**v42)(char *, unint64_t, uint64_t);
  uint64_t i;
  uint64_t v44;
  int v45;

  v3 = v2;
  v5 = sub_1000B2F60();
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_100004210(&qword_1000D5290);
  v45 = a2;
  v10 = sub_1000B46C0();
  v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  v12 = 1 << *(unsigned char *)(v9 + 32);
  v13 = *(void *)(v9 + 64);
  v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    v14 = ~(-1 << v12);
  }
  else {
    v14 = -1;
  }
  v15 = v14 & v13;
  v39 = v2;
  v40 = (unint64_t)(v12 + 63) >> 6;
  v42 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  v44 = v6;
  v16 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  v17 = v10 + 64;
  result = swift_retain();
  v19 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    v24 = v41;
    v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      v25 = v41[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        v19 = v26;
      }
    }
LABEL_21:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    v27 = *(void *)(v44 + 72);
    v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v45)
    {
      (*v16)(v8, v28, v5);
      v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
    }
    else
    {
      (*v42)(v8, v28, v5);
      v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
      swift_bridgeObjectRetain();
    }
    sub_1000A3940();
    result = sub_1000B3F50();
    v30 = -1 << *(unsigned char *)(v11 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34) {
          v32 = 0;
        }
        v33 |= v35;
        v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 48) + v27 * v20, v8, v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v20) = v29;
    ++*(void *)(v11 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *v24 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1000A26E8(uint64_t a1, char a2)
{
  v3 = v2;
  uint64_t v5 = *v2;
  sub_100004210(&qword_1000D7658);
  char v38 = a2;
  uint64_t v6 = sub_1000B46C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1000B48C0();
    sub_1000B4070();
    uint64_t result = sub_1000B48F0();
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
    v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000A29F8(uint64_t a1, char a2)
{
  v3 = v2;
  uint64_t v5 = *v2;
  sub_100004210(&qword_1000D52A0);
  char v37 = a2;
  uint64_t v6 = sub_1000B46C0();
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
    v22 = (void *)(v5 + 64);
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
          v3 = v34;
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1000B48C0();
    sub_1000B4070();
    uint64_t result = sub_1000B48F0();
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
    v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000A2D04(uint64_t a1, uint64_t a2, char a3)
{
  v4 = (void **)v3;
  uint64_t v8 = sub_1000B2F60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)*v3;
  unint64_t v14 = sub_100041560(a2);
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
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1000A328C();
    goto LABEL_7;
  }
  sub_1000A22F4(v17, a3 & 1);
  unint64_t v23 = sub_100041560(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_1000B4870();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_1000A301C(v14, (uint64_t)v11, a1, v20);
}

void sub_1000A2EAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000414A4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000A3524();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000A26E8(v15, a4 & 1);
  unint64_t v20 = sub_1000414A4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1000B4870();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_1000A301C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1000B2F60();
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

void *sub_1000A30D4()
{
  v1 = v0;
  sub_100004210(&qword_1000D7660);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000B46B0();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000A328C()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004210(&qword_1000D5290);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1000B46B0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
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
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_1000A3524()
{
  uint64_t v1 = v0;
  sub_100004210(&qword_1000D7658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000B46B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000A36D8()
{
  uint64_t v1 = v0;
  sub_100004210(&qword_1000D52A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000B46B0();
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
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

Swift::Int sub_1000A3888()
{
  return sub_1000B48F0();
}

uint64_t sub_1000A38D0()
{
  return sub_1000B4070();
}

uint64_t sub_1000A38E0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000CEDE8;
  v6._object = a2;
  unint64_t v4 = sub_1000B46F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000A392C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1000A3940()
{
  unint64_t result = qword_1000D4FB0;
  if (!qword_1000D4FB0)
  {
    sub_1000B2F60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D4FB0);
  }
  return result;
}

uint64_t sub_1000A3998()
{
  uint64_t v1 = sub_100004210(&qword_1000D5040);
  __chkstk_darwin(v1 - 8);
  Swift::OpaquePointer v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = (int *)type metadata accessor for WidgetTileInfo();
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = (uint64_t *)(v0 + *(int *)(v8 + 80));
  if (v11[1])
  {
    uint64_t v12 = *v11;
    goto LABEL_13;
  }
  char v13 = *(unsigned char *)(v0 + v4[13]);
  sub_100007FDC(v0, (uint64_t)&v33 - v9);
  if ((v13 & 1) == 0)
  {
    uint64_t v21 = (uint64_t)v10;
LABEL_11:
    sub_100008040(v21);
    goto LABEL_12;
  }
  unint64_t v14 = &v10[v4[14]];
  uint64_t v15 = *(void *)v14;
  int v16 = v14[8];
  sub_100008040((uint64_t)v10);
  if (v16 == 4 && v15 == 0)
  {
LABEL_12:
    uint64_t v12 = sub_1000B4050();
    goto LABEL_13;
  }
  sub_100007FDC(v0, (uint64_t)v7);
  uint64_t v18 = v0 + v4[14];
  uint64_t v19 = *(void **)v18;
  switch(*(unsigned char *)(v18 + 8))
  {
    case 1:
      id v23 = v19;
      id v24 = [v23 services];
      sub_100008148(0, &qword_1000D5020);
      unint64_t v25 = sub_1000B4100();

      if (!(v25 >> 62))
      {
        uint64_t v12 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v12) {
          goto LABEL_16;
        }
LABEL_31:

        swift_bridgeObjectRelease();
        sub_100008040((uint64_t)v7);
        goto LABEL_13;
      }
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_31;
      }
LABEL_16:
      if ((v25 & 0xC000000000000001) != 0)
      {
        id v26 = (id)sub_1000B45E0();
      }
      else
      {
        if (!*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          JUMPOUT(0x1000A3DB4);
        }
        id v26 = *(id *)(v25 + 32);
      }
      uint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v12 = (uint64_t)sub_1000A5180();

LABEL_20:
      sub_100008040((uint64_t)v7);
LABEL_13:
      swift_bridgeObjectRetain();
      return v12;
    case 2:
      sub_100008040((uint64_t)v7);
      if (*(unsigned char *)(v0 + v4[16])) {
        goto LABEL_12;
      }
      uint64_t v12 = 0;
      goto LABEL_13;
    case 3:
      id v28 = v19;
      sub_100008040((uint64_t)v7);
      sub_1000B4260();
      uint64_t v29 = sub_1000B33B0();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v3, 1, v29) == 1)
      {
        sub_1000A5468((uint64_t)v3);
      }
      else
      {
        uint64_t v12 = sub_1000B3380();
        uint64_t v32 = v31;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v29);
        if (v32)
        {

          goto LABEL_13;
        }
      }
      uint64_t v12 = sub_1000B4050();
      swift_bridgeObjectRelease();

      goto LABEL_13;
    case 4:
      uint64_t v21 = (uint64_t)v7;
      goto LABEL_11;
    default:
      id v20 = v19;
      uint64_t v12 = (uint64_t)sub_1000A5180();

      goto LABEL_20;
  }
}

void sub_1000A3DC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000B3320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000B31A0();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v40 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v40 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v40 - v16;
  uint64_t v18 = type metadata accessor for WidgetTileInfo();
  if ((*(unsigned char *)(v1 + *(int *)(v18 + 76) + 8) & 1) == 0)
  {
    sub_1000A4C24();
    return;
  }
  uint64_t v19 = v18;
  uint64_t v20 = v1 + *(int *)(v18 + 56);
  int v21 = *(unsigned __int8 *)(v20 + 8);
  if ((v21 - 2) < 3) {
    return;
  }
  uint64_t v42 = v3;
  uint64_t v43 = v2;
  int64_t v22 = *(void **)v20;
  v41 = v5;
  if (v21)
  {
    id v24 = v22;
    id v25 = [v24 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v26 = sub_1000B4100();

    if (v26 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v38)
      {
LABEL_9:
        if ((v26 & 0xC000000000000001) != 0)
        {
          v39 = v24;
          id v23 = (id)sub_1000B45E0();
          swift_bridgeObjectRelease();
        }
        else
        {
          id v44 = v24;
          if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v23 = *(id *)(v26 + 32);
          swift_bridgeObjectRelease();
        }
        goto LABEL_12;
      }
    }
    else if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();

    return;
  }
  id v23 = v22;
LABEL_12:
  id v44 = v23;
  sub_1000B43B0();
  v40[0] = *(void *)(v45 + 104);
  v40[1] = v45 + 104;
  ((void (*)(char *, void, uint64_t))v40[0])(v15, enum case for ServiceKind.thermostat(_:), v6);
  unint64_t v27 = sub_1000AB15C();
  sub_1000B40C0();
  v40[2] = v27;
  sub_1000B40C0();
  if (v48 == v46 && v49 == v47) {
    char v28 = 1;
  }
  else {
    char v28 = sub_1000B4830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v45 + 8);
  v29(v15, v6);
  v29(v17, v6);
  if ((v28 & 1) == 0)
  {
    sub_1000B43B0();
    ((void (*)(char *, void, uint64_t))v40[0])(v9, enum case for ServiceKind.heaterCooler(_:), v6);
    sub_1000B40C0();
    sub_1000B40C0();
    if (v48 == v46 && v49 == v47)
    {
      swift_bridgeObjectRelease_n();
      v29(v9, v6);
      v29(v12, v6);
    }
    else
    {
      char v30 = sub_1000B4830();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v29(v9, v6);
      v29(v12, v6);
      if ((v30 & 1) == 0)
      {

        return;
      }
    }
  }
  if (*(unsigned char *)(v1 + *(int *)(v19 + 52)))
  {
    uint64_t v32 = (uint64_t)v41;
    uint64_t v31 = v42;
    uint64_t v33 = v43;
    (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for CharacteristicKind.currentTemperature(_:), v43);
    uint64_t v34 = *(void *)(v1 + *(int *)(v19 + 60));
    id v35 = v44;
    sub_10000852C(v32, v34);
    char v37 = v36;
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
    if ((v37 & 1) == 0) {
      sub_1000A4C24();
    }
  }
  else
  {
    sub_1000B4050();
  }
}

uint64_t sub_1000A4390()
{
  uint64_t v1 = sub_100004210(&qword_1000D5040);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000B31A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v56 - v9;
  uint64_t v11 = (int *)type metadata accessor for WidgetTileInfo();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)v56 - v16;
  uint64_t v18 = (uint64_t *)(v0 + *(int *)(v15 + 80));
  if (v18[1])
  {
    uint64_t v19 = *v18;
    goto LABEL_15;
  }
  v56[1] = 0;
  char v20 = *(unsigned char *)(v0 + v11[13]);
  sub_100007FDC(v0, (uint64_t)v56 - v16);
  if ((v20 & 1) == 0)
  {
    uint64_t v35 = (uint64_t)v17;
LABEL_13:
    sub_100008040(v35);
    goto LABEL_14;
  }
  v56[0] = v5;
  uint64_t v21 = v4;
  uint64_t v22 = (uint64_t)v14;
  id v23 = &v17[v11[14]];
  uint64_t v24 = *(void *)v23;
  int v25 = v23[8];
  sub_100008040((uint64_t)v17);
  if (v25 == 4 && v24 == 0)
  {
LABEL_14:
    uint64_t v19 = sub_1000B4050();
    goto LABEL_15;
  }
  uint64_t v27 = v22;
  sub_100007FDC(v0, v22);
  uint64_t v28 = v0 + v11[14];
  uint64_t v29 = *(void **)v28;
  uint64_t v30 = v21;
  switch(*(unsigned char *)(v28 + 8))
  {
    case 1:
      id v37 = v29;
      id v38 = [v37 services];
      sub_100008148(0, &qword_1000D5020);
      unint64_t v39 = sub_1000B4100();

      if (v39 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v55 = sub_1000B46A0();
        swift_bridgeObjectRelease();
        if (v55) {
          goto LABEL_18;
        }
      }
      else if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_18:
        if ((v39 & 0xC000000000000001) != 0)
        {
          id v41 = (id)sub_1000B45E0();
          uint64_t v40 = v56[0];
        }
        else
        {
          uint64_t v40 = v56[0];
          if (!*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            JUMPOUT(0x1000A4C10);
          }
          id v41 = *(id *)(v39 + 32);
        }
        swift_bridgeObjectRelease();
        sub_1000B43B0();
        int v42 = (*(uint64_t (**)(char *, uint64_t))(v40 + 88))(v8, v30);
        if (v42 != enum case for ServiceKind.airPurifier(_:))
        {
          if (v42 == enum case for ServiceKind.door(_:))
          {
LABEL_23:
            uint64_t v43 = sub_1000A3998();
LABEL_40:
            uint64_t v19 = v43;
LABEL_41:

            goto LABEL_42;
          }
          if (v42 != enum case for ServiceKind.fan(_:))
          {
            if (v42 == enum case for ServiceKind.faucet(_:)
              || v42 == enum case for ServiceKind.garageDoorOpener(_:)
              || v42 == enum case for ServiceKind.heaterCooler(_:))
            {
              goto LABEL_23;
            }
            if (v42 == enum case for ServiceKind.humidifierDehumidifier(_:))
            {
              uint64_t v43 = sub_1000A98B8();
              goto LABEL_40;
            }
            if (v42 == enum case for ServiceKind.irrigationSystem(_:)) {
              goto LABEL_23;
            }
            if (v42 == enum case for ServiceKind.lightbulb(_:))
            {
              v51 = (unsigned int *)&enum case for CharacteristicKind.brightness(_:);
              v52 = "lightbulb: %s brightnessValue: %ld";
              goto LABEL_39;
            }
            if (v42 == enum case for ServiceKind.lockMechanism(_:)
              || v42 == enum case for ServiceKind.securitySystem(_:)
              || v42 == enum case for ServiceKind.thermostat(_:)
              || v42 == enum case for ServiceKind.valve(_:))
            {
              goto LABEL_23;
            }
            if (v42 != enum case for ServiceKind.ventilationFan(_:))
            {
              if (v42 != enum case for ServiceKind.window(_:) && v42 != enum case for ServiceKind.windowCovering(_:))
              {
                sub_1000AA624();
                uint64_t v19 = v54;
                (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v30);
                goto LABEL_41;
              }
              goto LABEL_23;
            }
          }
        }
        v51 = (unsigned int *)&enum case for CharacteristicKind.rotationSpeed(_:);
        v52 = "fanActivated: %s rotationSpeedValue: %ld";
LABEL_39:
        sub_1000AAB6C(v51, v52);
        goto LABEL_40;
      }

      swift_bridgeObjectRelease();
      sub_100008040(v27);
LABEL_77:
      uint64_t v19 = 0;
      goto LABEL_15;
    case 2:
      sub_100008040(v27);
      if (*(unsigned char *)(v0 + v11[16])) {
        goto LABEL_14;
      }
      goto LABEL_77;
    case 3:
      id v44 = v29;
      sub_100008040(v27);
      sub_1000B4260();
      uint64_t v45 = sub_1000B33B0();
      uint64_t v46 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v3, 1, v45) == 1)
      {
        sub_1000A5468((uint64_t)v3);
      }
      else
      {
        uint64_t v19 = sub_1000B3380();
        uint64_t v48 = v47;
        (*(void (**)(char *, uint64_t))(v46 + 8))(v3, v45);
        if (v48) {
          goto LABEL_31;
        }
      }
      uint64_t v19 = sub_1000B4050();
      swift_bridgeObjectRelease();
LABEL_31:

      goto LABEL_15;
    case 4:
      uint64_t v35 = v27;
      goto LABEL_13;
    default:
      id v31 = v29;
      sub_1000B43B0();
      uint64_t v32 = v56[0];
      int v33 = (*(uint64_t (**)(char *, uint64_t))(v56[0] + 88))(v10, v30);
      if (v33 == enum case for ServiceKind.airPurifier(_:)) {
        goto LABEL_33;
      }
      if (v33 == enum case for ServiceKind.door(_:)) {
        goto LABEL_11;
      }
      if (v33 == enum case for ServiceKind.fan(_:)) {
        goto LABEL_33;
      }
      if (v33 == enum case for ServiceKind.faucet(_:)
        || v33 == enum case for ServiceKind.garageDoorOpener(_:)
        || v33 == enum case for ServiceKind.heaterCooler(_:))
      {
        goto LABEL_11;
      }
      if (v33 == enum case for ServiceKind.humidifierDehumidifier(_:))
      {
        uint64_t v34 = sub_1000A98B8();
        goto LABEL_35;
      }
      if (v33 == enum case for ServiceKind.irrigationSystem(_:)) {
        goto LABEL_11;
      }
      if (v33 == enum case for ServiceKind.lightbulb(_:))
      {
        uint64_t v49 = (unsigned int *)&enum case for CharacteristicKind.brightness(_:);
        v50 = "lightbulb: %s brightnessValue: %ld";
        goto LABEL_34;
      }
      if (v33 == enum case for ServiceKind.lockMechanism(_:)
        || v33 == enum case for ServiceKind.securitySystem(_:)
        || v33 == enum case for ServiceKind.thermostat(_:)
        || v33 == enum case for ServiceKind.valve(_:))
      {
        goto LABEL_11;
      }
      if (v33 == enum case for ServiceKind.ventilationFan(_:))
      {
LABEL_33:
        uint64_t v49 = (unsigned int *)&enum case for CharacteristicKind.rotationSpeed(_:);
        v50 = "fanActivated: %s rotationSpeedValue: %ld";
LABEL_34:
        sub_1000AAB6C(v49, v50);
        goto LABEL_35;
      }
      if (v33 == enum case for ServiceKind.window(_:) || v33 == enum case for ServiceKind.windowCovering(_:))
      {
LABEL_11:
        uint64_t v34 = sub_1000A3998();
LABEL_35:
        uint64_t v19 = v34;
        goto LABEL_36;
      }
      sub_1000AA624();
      uint64_t v19 = v53;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v30);
LABEL_36:

LABEL_42:
      sub_100008040(v27);
LABEL_15:
      swift_bridgeObjectRetain();
      return v19;
  }
}

uint64_t sub_1000A4C24()
{
  uint64_t v0 = sub_1000B2E20();
  uint64_t v36 = *(void *)(v0 - 8);
  uint64_t v37 = v0;
  __chkstk_darwin(v0);
  uint64_t v34 = (char *)v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100004210(&qword_1000D7678);
  uint64_t v35 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004210(&qword_1000D7680);
  __chkstk_darwin(v4 - 8);
  uint64_t v28 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004210(&qword_1000D7688);
  __chkstk_darwin(v6 - 8);
  v27[1] = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004210(&qword_1000D7690);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004210(&qword_1000D7698);
  uint64_t v29 = *(void *)(v12 - 8);
  uint64_t v30 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004210(&qword_1000D76A0);
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_1000B2FA0();
  __chkstk_darwin(v16 - 8);
  sub_100008148(0, &qword_1000D76A8);
  sub_1000B2F80();
  sub_1000B2E00();
  v27[0] = (id)sub_1000B42E0();
  uint64_t v17 = self;
  id v18 = [v17 celsius];
  sub_1000B4390();

  id v19 = [v17 celsius];
  sub_1000B2D20();
  sub_1000B2D40();
  sub_1000B2E00();
  sub_1000B2F80();
  sub_1000AB108();
  sub_1000B2DE0();
  char v20 = v34;
  sub_1000B2E10();
  uint64_t v21 = v28;
  uint64_t v22 = v33;
  sub_1000B2DF0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v20, v37);
  uint64_t v23 = v35;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v3, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v21, 0, 1, v22);
  sub_1000B2F80();
  sub_1000B2D50();
  uint64_t v24 = v31;
  uint64_t v25 = sub_1000B2D30();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v24);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
  return v25;
}

id sub_1000A5180()
{
  uint64_t v0 = sub_1000B31A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B43B0();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == enum case for ServiceKind.airPurifier(_:)) {
    return (id)sub_1000B4050();
  }
  if (v4 != enum case for ServiceKind.door(_:))
  {
    if (v4 != enum case for ServiceKind.fan(_:))
    {
      if (v4 == enum case for ServiceKind.faucet(_:))
      {
        sub_1000A8244();
        return (id)v5;
      }
      if (v4 == enum case for ServiceKind.garageDoorOpener(_:)) {
        return (id)sub_1000A65D0();
      }
      if (v4 == enum case for ServiceKind.heaterCooler(_:)) {
        return (id)sub_1000A54C8();
      }
      if (v4 != enum case for ServiceKind.humidifierDehumidifier(_:))
      {
        if (v4 == enum case for ServiceKind.irrigationSystem(_:))
        {
          sub_1000A7C18();
          return (id)v5;
        }
        if (v4 != enum case for ServiceKind.lightbulb(_:))
        {
          if (v4 == enum case for ServiceKind.lockMechanism(_:)) {
            return sub_1000A6DE8();
          }
          if (v4 == enum case for ServiceKind.securitySystem(_:)) {
            return (id)sub_1000A73EC();
          }
          if (v4 == enum case for ServiceKind.thermostat(_:)) {
            return sub_1000A5D4C();
          }
          if (v4 == enum case for ServiceKind.valve(_:)) {
            return (id)sub_1000A8748();
          }
          if (v4 != enum case for ServiceKind.ventilationFan(_:))
          {
            if (v4 != enum case for ServiceKind.window(_:) && v4 != enum case for ServiceKind.windowCovering(_:))
            {
              uint64_t v6 = sub_1000B4050();
              (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
              return (id)v6;
            }
            return (id)sub_1000A8CEC();
          }
        }
      }
    }
    return (id)sub_1000B4050();
  }
  return (id)sub_1000A8CEC();
}

uint64_t sub_1000A5468(uint64_t a1)
{
  uint64_t v2 = sub_100004210(&qword_1000D5040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000A54C8()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  int v4 = (char *)v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = 0;
  uint64_t v11 = &v0[*(int *)(v9 + 56)];
  int v12 = v11[8];
  if ((v12 - 2) < 3) {
    return v10;
  }
  uint64_t v13 = v9;
  uint64_t v14 = *(void **)v11;
  v64 = v4;
  if (!v12)
  {
    uint64_t v61 = v2;
    uint64_t v62 = v1;
    uint64_t v15 = v0;
    uint64_t v0 = v14;
LABEL_10:
    char v20 = *(void (**)(char *, void, uint64_t))(v6 + 104);
    v20(v8, enum case for CharacteristicKind.targetHeaterCoolerState(_:), v5);
    uint64_t v21 = *(int *)(v13 + 60);
    uint64_t v63 = sub_100008520((uint64_t)v8, *(void *)&v15[v21]);
    char v23 = v22;
    uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v8, v5);
    if (v23) {
      goto LABEL_13;
    }
    v20(v8, enum case for CharacteristicKind.currentHeaterCoolerState(_:), v5);
    unint64_t v60 = sub_100008520((uint64_t)v8, *(void *)&v15[v21]);
    char v26 = v25;
    v24(v8, v5);
    if ((v26 & 1) != 0
      || (v20(v8, enum case for CharacteristicKind.active(_:), v5),
          v59 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)&v15[v21]), int v27 = v59, v24(v8, v5), v27 == 2))
    {
LABEL_13:

      return 0;
    }
    v20(v8, enum case for CharacteristicKind.heatingThreshold(_:), v5);
    sub_10000852C((uint64_t)v8, *(void *)&v15[v21]);
    int v58 = v28;
    v24(v8, v5);
    v20(v8, enum case for CharacteristicKind.coolingThreshold(_:), v5);
    unint64_t v18 = sub_10000852C((uint64_t)v8, *(void *)&v15[v21]);
    LOBYTE(v2) = v29;
    v24(v8, v5);
    v57[3] = v15;
    if (qword_1000D4EA8 == -1) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
  id v16 = v14;
  id v17 = [v16 services];
  sub_100008148(0, &qword_1000D5020);
  unint64_t v18 = sub_1000B4100();

  if (!(v18 >> 62))
  {
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
LABEL_41:
    swift_bridgeObjectRelease();

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v55 = sub_1000B46A0();
  swift_bridgeObjectRelease();
  if (!v55) {
    goto LABEL_41;
  }
LABEL_6:
  uint64_t v61 = v2;
  uint64_t v62 = v1;
  if ((v18 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = v0;
    id v19 = (char *)sub_1000B45E0();
    goto LABEL_9;
  }
  if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v15 = v0;
    id v19 = (char *)*(id *)(v18 + 32);
LABEL_9:
    uint64_t v0 = v19;
    swift_bridgeObjectRelease();

    goto LABEL_10;
  }
  __break(1u);
LABEL_46:
  swift_once();
LABEL_15:
  uint64_t v30 = sub_1000B3570();
  sub_100017618(v30, (uint64_t)qword_1000DCC18);
  uint64_t v31 = v0;
  uint64_t v32 = sub_1000B3550();
  os_log_type_t v33 = sub_1000B42C0();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v35 = v64;
  if (v34)
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    v57[2] = v18;
    *(_DWORD *)uint64_t v36 = 136315650;
    v57[1] = v36 + 4;
    id v37 = [v31 uniqueIdentifier];
    sub_1000B2F50();

    uint64_t v38 = sub_1000B2F30();
    unint64_t v40 = v39;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v35, v62);
    uint64_t v65 = sub_10002A68C(v38, v40, &v66);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2048;
    uint64_t v65 = v60;
    sub_1000B4400();
    *(_WORD *)(v36 + 22) = 2048;
    uint64_t v41 = v63;
    uint64_t v65 = v63;
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "heaterCooler: %s currentHeaterCoolerState: %ld targetHeaterCoolerState: %ld", (uint8_t *)v36, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (v59) {
      goto LABEL_17;
    }
  }
  else
  {

    uint64_t v41 = v63;
    if (v59)
    {
LABEL_17:
      if (v41 == 2)
      {
        if (v60 < 2)
        {
          if (v2) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }
        if (v60 == 2)
        {
LABEL_32:
          if (v58) {
            goto LABEL_39;
          }
LABEL_37:
          sub_1000B4050();
          sub_100004210(&qword_1000D7668);
          v50 = v31;
          uint64_t v51 = swift_allocObject();
          *(_OWORD *)(v51 + 16) = xmmword_1000B5180;
          uint64_t v52 = sub_1000A4C24();
          uint64_t v54 = v53;
          *(void *)(v51 + 56) = &type metadata for String;
          *(void *)(v51 + 64) = sub_1000AB0B4();
          *(void *)(v51 + 32) = v52;
          *(void *)(v51 + 40) = v54;
          uint64_t v10 = sub_1000B4020();

          goto LABEL_38;
        }
      }
      else
      {
        if (v41 != 1)
        {
          if (!v41 && (v58 & 1) == 0 && (v2 & 1) == 0)
          {
            sub_1000B4050();
            sub_100004210(&qword_1000D7668);
            int v42 = v31;
            uint64_t v43 = swift_allocObject();
            *(_OWORD *)(v43 + 16) = xmmword_1000B51A0;
            uint64_t v44 = sub_1000A4C24();
            uint64_t v46 = v45;
            *(void *)(v43 + 56) = &type metadata for String;
            unint64_t v47 = sub_1000AB0B4();
            *(void *)(v43 + 64) = v47;
            *(void *)(v43 + 32) = v44;
            *(void *)(v43 + 40) = v46;
            uint64_t v48 = sub_1000B3300();
            *(void *)(v43 + 96) = &type metadata for String;
            *(void *)(v43 + 104) = v47;
            *(void *)(v43 + 72) = v48;
            *(void *)(v43 + 80) = v49;
            uint64_t v10 = sub_1000B4020();

LABEL_38:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v10;
          }
LABEL_39:

          return 0;
        }
        if (v60 < 2)
        {
          if (v58) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }
        if (v60 == 2) {
          goto LABEL_32;
        }
      }
      if (v60 != 3 || (v2 & 1) != 0) {
        goto LABEL_39;
      }
      goto LABEL_37;
    }
  }
  uint64_t v10 = sub_1000B4050();

  return v10;
}

id sub_1000A5D4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000B2F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000B3320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetTileInfo();
  id v11 = 0;
  int v12 = &v1[*(int *)(v10 + 56)];
  int v13 = v12[8];
  if ((v13 - 2) >= 3)
  {
    uint64_t v14 = v10;
    uint64_t v65 = v5;
    uint64_t v15 = *(void **)v12;
    if (!v13)
    {
      uint64_t v63 = v3;
      uint64_t v64 = v2;
      id v11 = v15;
      goto LABEL_10;
    }
    id v16 = v1;
    id v17 = v15;
    id v18 = [v17 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v19 = sub_1000B4100();

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      id v11 = (id)sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
      id v11 = *(id *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_6:
        uint64_t v63 = v3;
        uint64_t v64 = v2;
        if ((v19 & 0xC000000000000001) != 0)
        {
          id v20 = (id)sub_1000B45E0();
        }
        else
        {
          if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_46;
          }
          id v20 = *(id *)(v19 + 32);
        }
        id v11 = v20;
        swift_bridgeObjectRelease();

        uint64_t v1 = v16;
LABEL_10:
        id v16 = *(char **)(v7 + 104);
        ((void (*)(char *, void, uint64_t))v16)(v9, enum case for CharacteristicKind.targetHeatingCoolingMode(_:), v6);
        uint64_t v21 = *(int *)(v14 + 60);
        uint64_t v66 = sub_100008520((uint64_t)v9, *(void *)&v1[v21]);
        char v23 = v22;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
        v24(v9, v6);
        if ((v23 & 1) != 0
          || (((void (*)(char *, void, uint64_t))v16)(v9, enum case for CharacteristicKind.currentHeatingCooling(_:), v6), v62 = sub_100008520((uint64_t)v9, *(void *)&v1[v21]), char v25 = v1, v27 = v26, v24(v9, v6), (v27 & 1) != 0))
        {

          return 0;
        }
        ((void (*)(char *, void, uint64_t))v16)(v9, enum case for CharacteristicKind.targetTemperature(_:), v6);
        v57[3] = sub_10000852C((uint64_t)v9, *(void *)&v25[v21]);
        int v58 = v28;
        v24(v9, v6);
        ((void (*)(char *, void, uint64_t))v16)(v9, enum case for CharacteristicKind.heatingThreshold(_:), v6);
        v57[2] = sub_10000852C((uint64_t)v9, *(void *)&v25[v21]);
        int v59 = v29;
        v24(v9, v6);
        ((void (*)(char *, void, uint64_t))v16)(v9, enum case for CharacteristicKind.coolingThreshold(_:), v6);
        unint64_t v60 = v25;
        sub_10000852C((uint64_t)v9, *(void *)&v25[v21]);
        LOBYTE(v16) = v30;
        v24(v9, v6);
        if (qword_1000D4EA8 == -1)
        {
LABEL_13:
          uint64_t v31 = sub_1000B3570();
          sub_100017618(v31, (uint64_t)qword_1000DCC18);
          id v61 = v11;
          uint64_t v32 = sub_1000B3550();
          os_log_type_t v33 = sub_1000B42C0();
          BOOL v34 = os_log_type_enabled(v32, v33);
          uint64_t v35 = v66;
          if (v34)
          {
            uint64_t v36 = swift_slowAlloc();
            uint64_t v68 = swift_slowAlloc();
            *(_DWORD *)uint64_t v36 = 136315650;
            v57[1] = v36 + 4;
            id v37 = v61;
            id v38 = [v61 uniqueIdentifier];
            unint64_t v39 = v65;
            sub_1000B2F50();

            uint64_t v40 = sub_1000B2F30();
            unint64_t v42 = v41;
            (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v64);
            uint64_t v67 = sub_10002A68C(v40, v42, &v68);
            sub_1000B4400();

            uint64_t v35 = v66;
            swift_bridgeObjectRelease();
            *(_WORD *)(v36 + 12) = 2048;
            uint64_t v67 = v35;
            sub_1000B4400();
            *(_WORD *)(v36 + 22) = 2048;
            uint64_t v43 = v62;
            uint64_t v67 = v62;
            sub_1000B4400();
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "thermostat: %s targetHeatingCoolingMode: %ld currentHeatingCooling: %ld", (uint8_t *)v36, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            id v44 = v61;
            uint64_t v43 = v62;
          }
          if (v35 == 3)
          {
            if ((v59 & 1) == 0 && (v16 & 1) == 0)
            {
              sub_1000B4050();
              sub_100004210(&qword_1000D7668);
              uint64_t v45 = swift_allocObject();
              *(_OWORD *)(v45 + 16) = xmmword_1000B51A0;
              uint64_t v46 = sub_1000A4C24();
              uint64_t v48 = v47;
              *(void *)(v45 + 56) = &type metadata for String;
              unint64_t v49 = sub_1000AB0B4();
              *(void *)(v45 + 64) = v49;
              *(void *)(v45 + 32) = v46;
              *(void *)(v45 + 40) = v48;
              uint64_t v50 = sub_1000B3300();
              *(void *)(v45 + 96) = &type metadata for String;
              *(void *)(v45 + 104) = v49;
              *(void *)(v45 + 72) = v50;
              *(void *)(v45 + 80) = v51;
              id v11 = (id)sub_1000B4020();

LABEL_36:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v11;
            }
            goto LABEL_39;
          }
          if (v43 == 2)
          {
            if ((v58 & 1) == 0) {
              goto LABEL_35;
            }
          }
          else if (v43 == 1)
          {
            if ((v58 & 1) == 0) {
              goto LABEL_35;
            }
          }
          else if (v35 != 2 || v43)
          {
            if (v35 != 1 || v43)
            {
              if (!v35 && !v43)
              {
                id v11 = (id)sub_1000B4050();

                return v11;
              }
            }
            else if ((v58 & 1) == 0)
            {
LABEL_35:
              sub_1000B4050();
              sub_100004210(&qword_1000D7668);
              uint64_t v52 = swift_allocObject();
              *(_OWORD *)(v52 + 16) = xmmword_1000B5180;
              uint64_t v53 = sub_1000A4C24();
              uint64_t v55 = v54;
              *(void *)(v52 + 56) = &type metadata for String;
              *(void *)(v52 + 64) = sub_1000AB0B4();
              *(void *)(v52 + 32) = v53;
              *(void *)(v52 + 40) = v55;
              id v11 = (id)sub_1000B4020();

              goto LABEL_36;
            }
          }
          else if ((v58 & 1) == 0)
          {
            goto LABEL_35;
          }
LABEL_39:

          return 0;
        }
LABEL_46:
        swift_once();
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t sub_1000A65D0()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v64[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void **)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v64[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = 0;
  id v11 = &v0[*(int *)(v9 + 56)];
  int v12 = v11[8];
  if ((v12 - 2) < 3) {
    return v10;
  }
  uint64_t v13 = v9;
  uint64_t v76 = v2;
  uint64_t v77 = v1;
  uint64_t v14 = *(void **)v11;
  if (!v12)
  {
    uint64_t v15 = v5;
    id v16 = v6;
    v78 = v0;
    v75 = v4;
    id v17 = v14;
LABEL_10:
    char v22 = (char *)(v16 + 13);
    char v23 = (void (*)(uint64_t, void, unint64_t))v16[13];
    unint64_t v24 = v15;
    v23((uint64_t)v8, enum case for CharacteristicKind.currentDoorState(_:), v15);
    uint64_t v25 = *(int *)(v13 + 60);
    char v26 = v78;
    uint64_t v74 = sub_100008520((uint64_t)v8, *(void *)&v78[v25]);
    char v28 = v27;
    uint64_t v31 = (void (*)(uint64_t, unint64_t))v16[1];
    char v30 = (char *)(v16 + 1);
    int v29 = v31;
    v31((uint64_t)v8, v24);
    if (v28) {
      goto LABEL_15;
    }
    v73 = v23;
    v23((uint64_t)v8, enum case for CharacteristicKind.targetDoorState(_:), v24);
    uint64_t v32 = sub_100008520((uint64_t)v8, *(void *)&v26[v25]);
    os_log_type_t v33 = v8;
    unint64_t v34 = v32;
    char v36 = v35;
    uint64_t v1 = (uint64_t)v33;
    unint64_t v20 = v24;
    v72 = v30;
    v29((uint64_t)v33, v24);
    if (v36)
    {
LABEL_15:

      return 0;
    }
    uint64_t v6 = v17;
    unint64_t v70 = v34;
    v71 = v29;
    uint64_t v68 = v22;
    uint64_t v69 = v25;
    if (qword_1000D4EA8 == -1) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
  id v18 = v14;
  id v19 = [v18 services];
  sub_100008148(0, &qword_1000D5020);
  unint64_t v20 = sub_1000B4100();

  if (!(v20 >> 62))
  {
    uint64_t v10 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_6;
    }
LABEL_31:
    swift_bridgeObjectRelease();

    return v10;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1000B46A0();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_31;
  }
LABEL_6:
  uint64_t v74 = (uint64_t)v18;
  v75 = v4;
  v78 = v0;
  if ((v20 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = v5;
    id v16 = v6;
    id v21 = (id)sub_1000B45E0();
    goto LABEL_9;
  }
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = v6;
    uint64_t v15 = v5;
    id v21 = *(id *)(v20 + 32);
LABEL_9:
    id v17 = v21;
    swift_bridgeObjectRelease();

    goto LABEL_10;
  }
  __break(1u);
LABEL_35:
  swift_once();
LABEL_13:
  uint64_t v37 = sub_1000B3570();
  uint64_t v38 = sub_100017618(v37, (uint64_t)qword_1000DCC18);
  unint64_t v39 = v6;
  uint64_t v67 = v38;
  uint64_t v40 = sub_1000B3550();
  os_log_type_t v41 = sub_1000B42C0();
  int v42 = v41;
  BOOL v43 = os_log_type_enabled(v40, v41);
  uint64_t v44 = v77;
  uint64_t v45 = v75;
  unint64_t v46 = v20;
  if (v43)
  {
    uint64_t v47 = swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315650;
    uint64_t v66 = v47 + 4;
    id v48 = [v39 uniqueIdentifier];
    int v65 = v42;
    id v49 = v48;
    sub_1000B2F50();

    uint64_t v50 = sub_1000B2F30();
    unint64_t v52 = v51;
    (*(void (**)(unsigned char *, uint64_t))(v76 + 8))(v45, v44);
    uint64_t v79 = sub_10002A68C(v50, v52, &v80);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2048;
    uint64_t v79 = v74;
    sub_1000B4400();
    *(_WORD *)(v47 + 22) = 2048;
    uint64_t v79 = v70;
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v65, "garageDoorOpener: %s currentValue: %ld targetValue: %ld", (uint8_t *)v47, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v73(v1, enum case for CharacteristicKind.obstructionDetected(_:), v46);
  char v53 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0(v1, *(void *)&v78[v69]);
  v71(v1, v46);
  if ((v53 & 1) == 0)
  {
    if (!(v74 | v70) || v74 == 1 && v70 == 1 || v70 <= 1)
    {
      uint64_t v10 = sub_1000B4050();

      return v10;
    }

    return 0;
  }
  uint64_t v54 = v77;
  uint64_t v55 = v39;
  v56 = sub_1000B3550();
  os_log_type_t v57 = sub_1000B42C0();
  if (os_log_type_enabled(v56, v57))
  {
    int v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    *(_DWORD *)int v58 = 136315138;
    v78 = v58 + 4;
    id v59 = [v55 uniqueIdentifier];
    sub_1000B2F50();

    uint64_t v60 = sub_1000B2F30();
    unint64_t v62 = v61;
    (*(void (**)(unsigned char *, uint64_t))(v76 + 8))(v45, v54);
    uint64_t v79 = sub_10002A68C(v60, v62, &v80);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "garageDoorOpener: %s obstructionDetected", v58, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = sub_1000B4050();

  return v10;
}

id sub_1000A6DE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000B2F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000B3320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetTileInfo();
  id v11 = 0;
  uint64_t v12 = v1 + *(int *)(v10 + 56);
  int v13 = *(unsigned __int8 *)(v12 + 8);
  if ((v13 - 2) >= 3)
  {
    uint64_t v14 = v10;
    id v48 = v5;
    uint64_t v15 = *(void **)v12;
    if (!v13)
    {
      uint64_t v46 = v3;
      uint64_t v47 = v2;
      id v11 = v15;
      goto LABEL_10;
    }
    uint64_t v16 = v15;
    id v17 = [(id)v16 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v18 = sub_1000B4100();

    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      id v11 = (id)sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
      id v11 = *(id *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_6:
        uint64_t v46 = v3;
        uint64_t v47 = v2;
        if ((v18 & 0xC000000000000001) != 0)
        {
          id v19 = (id)sub_1000B45E0();
        }
        else
        {
          if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_35;
          }
          id v19 = *(id *)(v18 + 32);
        }
        id v11 = v19;
        swift_bridgeObjectRelease();

LABEL_10:
        unint64_t v20 = *(void (**)(char *, void, uint64_t))(v7 + 104);
        v20(v9, enum case for CharacteristicKind.currentLockMechanismState(_:), v6);
        uint64_t v21 = *(int *)(v14 + 60);
        uint64_t v45 = sub_100008520((uint64_t)v9, *(void *)(v1 + v21));
        char v23 = v22;
        unint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
        v24(v9, v6);
        if ((v23 & 1) != 0
          || (v20(v9, enum case for CharacteristicKind.targetLockMechanismState(_:), v6),
              uint64_t v16 = sub_100008520((uint64_t)v9, *(void *)(v1 + v21)),
              char v26 = v25,
              v24(v9, v6),
              (v26 & 1) != 0))
        {

          return 0;
        }
        if (qword_1000D4EA8 == -1)
        {
LABEL_13:
          uint64_t v27 = sub_1000B3570();
          sub_100017618(v27, (uint64_t)qword_1000DCC18);
          id v28 = v11;
          int v29 = sub_1000B3550();
          os_log_type_t v30 = sub_1000B42C0();
          BOOL v31 = os_log_type_enabled(v29, v30);
          uint64_t v33 = v46;
          uint64_t v32 = v47;
          if (v31)
          {
            uint64_t v34 = swift_slowAlloc();
            uint64_t v44 = swift_slowAlloc();
            uint64_t v50 = v44;
            *(_DWORD *)uint64_t v34 = 136315650;
            id v35 = [v28 uniqueIdentifier:v34 + 4 v44];
            char v36 = v48;
            sub_1000B2F50();

            uint64_t v37 = sub_1000B2F30();
            uint64_t v38 = v16;
            unint64_t v40 = v39;
            (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
            uint64_t v49 = sub_10002A68C(v37, v40, &v50);
            sub_1000B4400();

            uint64_t v16 = v38;
            swift_bridgeObjectRelease();
            *(_WORD *)(v34 + 12) = 2048;
            uint64_t v41 = v45;
            uint64_t v49 = v45;
            sub_1000B4400();
            *(_WORD *)(v34 + 22) = 2048;
            uint64_t v49 = v38;
            sub_1000B4400();
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "lockMechanism: %s currentValue: %ld targetValue: %ld", (uint8_t *)v34, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            if (v41 == 3) {
              goto LABEL_24;
            }
          }
          else
          {

            uint64_t v41 = v45;
            if (v45 == 3) {
              goto LABEL_24;
            }
          }
          if (v41 != 2 && v41 | v16 && (v41 != 1 || v16) && (v41 || v16 != 1) && (v41 != 1 || v16 != 1))
          {

            return 0;
          }
LABEL_24:
          id v11 = (id)sub_1000B4050();

          return v11;
        }
LABEL_35:
        swift_once();
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t sub_1000A73EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000B2F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000B3320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetTileInfo();
  uint64_t v11 = 0;
  uint64_t v12 = v0 + *(int *)(v10 + 56);
  int v13 = *(unsigned __int8 *)(v12 + 8);
  if ((v13 - 2) < 3) {
    return v11;
  }
  uint64_t v14 = v10;
  uint64_t v65 = v3;
  uint64_t v15 = *(void **)v12;
  if (!v13)
  {
    id v16 = v15;
    goto LABEL_10;
  }
  id v17 = v15;
  id v18 = [v17 services];
  sub_100008148(0, &qword_1000D5020);
  unint64_t v19 = sub_1000B4100();

  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_1000B46A0();
    swift_bridgeObjectRelease();
    if (v52) {
      goto LABEL_6;
    }
LABEL_28:
    swift_bridgeObjectRelease();

    return 0;
  }
  if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_28;
  }
LABEL_6:
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v20 = (id)sub_1000B45E0();
  }
  else
  {
    if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      JUMPOUT(0x1000A7C08);
    }
    id v20 = *(id *)(v19 + 32);
  }
  id v16 = v20;
  swift_bridgeObjectRelease();

LABEL_10:
  uint64_t v64 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v64(v9, enum case for CharacteristicKind.currentSecuritySystemState(_:), v6);
  uint64_t v62 = *(int *)(v14 + 60);
  uint64_t v21 = sub_100008520((uint64_t)v9, *(void *)(v1 + v62));
  char v23 = v22;
  uint64_t v63 = *(void (**)(char *, uint64_t))(v7 + 8);
  v63(v9, v6);
  if (v23)
  {

    return 0;
  }
  if (qword_1000D4EA8 != -1) {
    swift_once();
  }
  uint64_t v59 = v2;
  uint64_t v24 = sub_1000B3570();
  uint64_t v25 = sub_100017618(v24, (uint64_t)qword_1000DCC18);
  id v26 = v16;
  uint64_t v58 = v25;
  uint64_t v27 = sub_1000B3550();
  os_log_type_t v28 = sub_1000B42C0();
  int v29 = v28;
  BOOL v30 = os_log_type_enabled(v27, v28);
  id v61 = v26;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v60 = v21;
    uint64_t v32 = v31;
    uint64_t v57 = swift_slowAlloc();
    uint64_t v67 = v57;
    *(_DWORD *)uint64_t v32 = 136315394;
    id v33 = [v26 uniqueIdentifier:v32 + 4];
    int v56 = v29;
    id v34 = v33;
    sub_1000B2F50();

    uint64_t v35 = sub_1000B2F30();
    os_log_t v55 = v27;
    unint64_t v37 = v36;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v5, v59);
    uint64_t v66 = sub_10002A68C(v35, v37, &v67);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2048;
    uint64_t v66 = v60;
    sub_1000B4400();
    os_log_t v38 = v55;
    _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v56, "securitySystem: %s currentValue: %ld", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v21 = v60;
    swift_slowDealloc();

    if (v21 != 4) {
      goto LABEL_15;
    }
LABEL_20:
    uint64_t v11 = sub_1000B4050();

    return v11;
  }

  if (v21 == 4) {
    goto LABEL_20;
  }
LABEL_15:
  v64(v9, enum case for CharacteristicKind.targetSecuritySystemState(_:), v6);
  id v39 = v61;
  uint64_t v40 = sub_100008520((uint64_t)v9, *(void *)(v1 + v62));
  char v42 = v41;
  v63(v9, v6);
  if (v42)
  {

    return 0;
  }
  id v43 = v39;
  uint64_t v44 = sub_1000B3550();
  os_log_type_t v45 = sub_1000B42C0();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = swift_slowAlloc();
    uint64_t v60 = v21;
    uint64_t v47 = v46;
    uint64_t v67 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315394;
    uint64_t v64 = (void (*)(char *, void, uint64_t))(v47 + 4);
    id v48 = [v43 uniqueIdentifier];
    sub_1000B2F50();

    uint64_t v49 = sub_1000B2F30();
    unint64_t v51 = v50;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v5, v59);
    uint64_t v66 = sub_10002A68C(v49, v51, &v67);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2048;
    uint64_t v66 = v40;
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "securitySystem: %s targetValue: %ld", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  switch(v40)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t v11 = sub_1000B4050();

      swift_bridgeObjectRelease();
      break;
    default:

      return 0;
  }
  return v11;
}

void sub_1000A7C18()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v42[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v42[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = v0 + *(int *)(v9 + 56);
  int v11 = *(unsigned __int8 *)(v10 + 8);
  if ((v11 - 2) < 3) {
    return;
  }
  uint64_t v12 = v9;
  uint64_t v48 = v0;
  int v13 = *(void **)v10;
  if (v11)
  {
    id v15 = v13;
    id v16 = [v15 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v17 = sub_1000B4100();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v41) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      uint64_t v45 = v2;
      uint64_t v46 = v1;
      uint64_t v44 = v4;
      if ((v17 & 0xC000000000000001) != 0)
      {
        id v18 = (id)sub_1000B45E0();
      }
      else
      {
        if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v18 = *(id *)(v17 + 32);
      }
      id v14 = v18;
      swift_bridgeObjectRelease();

      goto LABEL_10;
    }
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v44 = v4;
  uint64_t v45 = v2;
  uint64_t v46 = v1;
  id v14 = v13;
LABEL_10:
  uint64_t v47 = *(void (**)(unsigned char *, void, uint64_t))(v6 + 104);
  v47(v8, enum case for CharacteristicKind.inUse(_:), v5);
  uint64_t v19 = *(int *)(v12 + 60);
  uint64_t v20 = v48;
  char v21 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)(v48 + v19));
  char v22 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v22(v8, v5);
  if (v21 == 2)
  {
  }
  else
  {
    int v23 = v21 & 1;
    uint64_t v24 = v47;
    v47(v8, enum case for CharacteristicKind.active(_:), v5);
    int v43 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)(v20 + v19));
    v22(v8, v5);
    v24(v8, enum case for CharacteristicKind.programMode(_:), v5);
    uint64_t v25 = sub_100008520((uint64_t)v8, *(void *)(v20 + v19));
    int v27 = v26;
    v22(v8, v5);
    if (qword_1000D4EA8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1000B3570();
    sub_100017618(v28, (uint64_t)qword_1000DCC18);
    id v29 = v14;
    BOOL v30 = sub_1000B3550();
    os_log_type_t v31 = sub_1000B42C0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v47 = (void (*)(unsigned char *, void, uint64_t))swift_slowAlloc();
      unint64_t v50 = (void (*)(void, void, void))v47;
      *(_DWORD *)uint64_t v32 = 136315906;
      LODWORD(v48) = v27;
      id v33 = [v29 uniqueIdentifier];
      id v34 = v44;
      sub_1000B2F50();

      uint64_t v35 = sub_1000B2F30();
      uint64_t v36 = v25;
      unint64_t v38 = v37;
      (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v34, v46);
      uint64_t v49 = sub_10002A68C(v35, v38, (uint64_t *)&v50);
      sub_1000B4400();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 1024;
      LODWORD(v49) = v43 & 1;
      sub_1000B4400();
      *(_WORD *)(v32 + 18) = 1024;
      char v39 = v48;
      LODWORD(v49) = v23;
      sub_1000B4400();
      *(_WORD *)(v32 + 24) = 2048;
      if (v39) {
        uint64_t v40 = -1;
      }
      else {
        uint64_t v40 = v36;
      }
      uint64_t v49 = v40;
      sub_1000B4400();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "irrigationSystem: %s active: %{BOOL}d inUse: %{BOOL}d programMode: %ld", (uint8_t *)v32, 0x22u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_1000B4050();
  }
}

void sub_1000A8244()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = v0 + *(int *)(v9 + 56);
  int v11 = *(unsigned __int8 *)(v10 + 8);
  if ((v11 - 2) < 3) {
    return;
  }
  uint64_t v12 = v9;
  int v13 = *(void **)v10;
  if (v11)
  {
    uint64_t v33 = v2;
    id v15 = v13;
    id v16 = [v15 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v17 = sub_1000B4100();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v31) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      if ((v17 & 0xC000000000000001) != 0)
      {
        id v18 = (id)sub_1000B45E0();
      }
      else
      {
        if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v18 = *(id *)(v17 + 32);
      }
      id v14 = v18;
      swift_bridgeObjectRelease();

      uint64_t v2 = v33;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();

    return;
  }
  id v14 = v13;
LABEL_10:
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for CharacteristicKind.active(_:), v5);
  char v19 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)(v0 + *(int *)(v12 + 60)));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v19 == 2)
  {
  }
  else
  {
    if (qword_1000D4EA8 != -1) {
      swift_once();
    }
    int v20 = v19 & 1;
    uint64_t v21 = sub_1000B3570();
    sub_100017618(v21, (uint64_t)qword_1000DCC18);
    id v22 = v14;
    int v23 = sub_1000B3550();
    os_log_type_t v24 = sub_1000B42C0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v35 = v33;
      *(_DWORD *)uint64_t v25 = 136315394;
      id v26 = [v22 uniqueIdentifier:v25 + 4 v33];
      sub_1000B2F50();

      uint64_t v27 = sub_1000B2F30();
      int v28 = v20;
      unint64_t v30 = v29;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      uint64_t v34 = sub_10002A68C(v27, v30, &v35);
      sub_1000B4400();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 1024;
      LODWORD(v34) = v28;
      sub_1000B4400();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "faucet: %s active: %{BOOL}d", (uint8_t *)v25, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_1000B4050();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000A8748()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = 0;
  uint64_t v11 = v0 + *(int *)(v9 + 56);
  int v12 = *(unsigned __int8 *)(v11 + 8);
  if ((v12 - 2) < 3) {
    return v10;
  }
  uint64_t v13 = v9;
  uint64_t v42 = v0;
  id v14 = *(void **)v11;
  if (!v12)
  {
    unint64_t v38 = v4;
    uint64_t v39 = v2;
    uint64_t v40 = v1;
    id v15 = v14;
LABEL_10:
    int v20 = *(void (**)(char *, void, uint64_t))(v6 + 104);
    v20(v8, enum case for CharacteristicKind.inUse(_:), v5);
    uint64_t v21 = *(int *)(v13 + 60);
    uint64_t v22 = v42;
    int v41 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)(v42 + v21));
    int v23 = v41;
    os_log_type_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v8, v5);
    if (v23 == 2
      || (v20(v8, enum case for CharacteristicKind.active(_:), v5),
          char v25 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, *(void *)(v22 + v21)), v24(v8, v5), v25 == 2))
    {

      return 0;
    }
    LODWORD(v2) = v41 & 1;
    LODWORD(v6) = v25 & 1;
    if (qword_1000D4EA8 == -1) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
  id v16 = v14;
  id v17 = [v16 services];
  sub_100008148(0, &qword_1000D5020);
  unint64_t v18 = sub_1000B4100();

  if (!(v18 >> 62))
  {
    id v15 = *(id *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_6;
    }
LABEL_19:
    swift_bridgeObjectRelease();

    return 0;
  }
  swift_bridgeObjectRetain();
  id v15 = (id)sub_1000B46A0();
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_19;
  }
LABEL_6:
  uint64_t v39 = v2;
  uint64_t v40 = v1;
  unint64_t v38 = v4;
  if ((v18 & 0xC000000000000001) != 0)
  {
    id v19 = (id)sub_1000B45E0();
    goto LABEL_9;
  }
  if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v19 = *(id *)(v18 + 32);
LABEL_9:
    id v15 = v19;
    swift_bridgeObjectRelease();

    goto LABEL_10;
  }
  __break(1u);
LABEL_24:
  swift_once();
LABEL_14:
  uint64_t v26 = sub_1000B3570();
  sub_100017618(v26, (uint64_t)qword_1000DCC18);
  id v27 = v15;
  int v28 = sub_1000B3550();
  os_log_type_t v29 = sub_1000B42C0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315650;
    uint64_t v42 = v30 + 4;
    id v31 = [v27 uniqueIdentifier];
    uint64_t v32 = v38;
    sub_1000B2F50();

    uint64_t v33 = sub_1000B2F30();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v40);
    uint64_t v43 = sub_10002A68C(v33, v35, &v44);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 1024;
    LODWORD(v43) = v6;
    sub_1000B4400();
    *(_WORD *)(v30 + 18) = 1024;
    LODWORD(v43) = v2;
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "valve: %s active: %{BOOL}d inUse: %{BOOL}d", (uint8_t *)v30, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = sub_1000B4050();

  return v10;
}

uint64_t sub_1000A8CEC()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v100 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000B31A0();
  uint64_t v101 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v86 - v8;
  uint64_t v10 = sub_1000B3320();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for WidgetTileInfo();
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  uint64_t v17 = v0 + *(int *)(v14 + 56);
  int v18 = *(unsigned __int8 *)(v17 + 8);
  if ((v18 - 2) >= 3)
  {
    uint64_t v98 = v4;
    uint64_t v99 = v14;
    v96 = v7;
    v97 = v9;
    v94 = v3;
    uint64_t v95 = v1;
    id v19 = *(void **)v17;
    if (!v18)
    {
      id v20 = v19;
      goto LABEL_10;
    }
    id v21 = v19;
    id v22 = [v21 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v23 = sub_1000B4100();

    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v84 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v84) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      if ((v23 & 0xC000000000000001) != 0)
      {
        id v24 = (id)sub_1000B45E0();
      }
      else
      {
        if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_50;
        }
        id v24 = *(id *)(v23 + 32);
      }
      id v20 = v24;
      swift_bridgeObjectRelease();

LABEL_10:
      uint64_t v25 = v11 + 104;
      uint64_t v26 = *(void (**)(char *, void, char *))(v11 + 104);
      id v27 = (char *)v10;
      uint64_t v28 = v11;
      v26(v13, enum case for CharacteristicKind.targetPosition(_:), v27);
      uint64_t v29 = *(int *)(v99 + 60);
      uint64_t v30 = v0;
      uint64_t v99 = sub_100008520((uint64_t)v13, *(void *)(v0 + v29));
      char v32 = v31;
      unint64_t v35 = *(void (**)(char *, char *))(v28 + 8);
      uint64_t v34 = v28 + 8;
      uint64_t v33 = v35;
      v35(v13, v27);
      if (v32) {
        goto LABEL_15;
      }
      uint64_t v90 = v25;
      v26(v13, enum case for CharacteristicKind.currentPosition(_:), v27);
      uint64_t v91 = v30;
      uint64_t v92 = v29;
      uint64_t v36 = *(void *)(v30 + v29);
      v93 = v33;
      uint64_t v37 = sub_100008520((uint64_t)v13, v36);
      char v39 = v38;
      v93(v13, v27);
      if (v39)
      {
LABEL_15:

        return 0;
      }
      uint64_t v3 = v27;
      id v21 = v13;
      Swift::Int v88 = v37;
      v89 = (void (*)(id, void, char *))v26;
      uint64_t v40 = v97;
      id v87 = v20;
      sub_1000B43B0();
      uint64_t v41 = v101;
      uint64_t v42 = v96;
      uint64_t v43 = v98;
      (*(void (**)(char *, void, uint64_t))(v101 + 104))(v96, enum case for ServiceKind.door(_:), v98);
      sub_1000AB15C();
      sub_1000B40C0();
      sub_1000B40C0();
      if (v104 == v102 && v105 == v103)
      {
        uint64_t v44 = 1919905604;
        swift_bridgeObjectRelease_n();
        uint64_t v45 = *(void (**)(char *, uint64_t))(v41 + 8);
        v45(v42, v43);
        v45(v40, v43);
        uint64_t v13 = (char *)0xE400000000000000;
      }
      else
      {
        char v46 = sub_1000B4830();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v47 = *(void (**)(char *, uint64_t))(v41 + 8);
        v47(v42, v43);
        v47(v40, v43);
        BOOL v48 = (v46 & 1) == 0;
        if (v46) {
          uint64_t v44 = 1919905604;
        }
        else {
          uint64_t v44 = 0x776F646E6957;
        }
        if (v48) {
          uint64_t v13 = (char *)0xE600000000000000;
        }
        else {
          uint64_t v13 = (char *)0xE400000000000000;
        }
      }
      uint64_t v101 = v34;
      uint64_t v104 = 0xD000000000000015;
      unint64_t v105 = 0x80000001000BA580;
      uint64_t v10 = v44;
      v106._countAndFlagsBits = v44;
      v106._object = v13;
      sub_1000B4090(v106);
      unint64_t v16 = v105;
      uint64_t v98 = v104;
      if (qword_1000D4EA8 == -1)
      {
LABEL_23:
        uint64_t v49 = sub_1000B3570();
        uint64_t v50 = sub_100017618(v49, (uint64_t)qword_1000DCC18);
        id v51 = v87;
        swift_bridgeObjectRetain();
        v97 = (char *)v50;
        uint64_t v52 = sub_1000B3550();
        os_log_type_t v53 = sub_1000B42C0();
        int v54 = v53;
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v55 = swift_slowAlloc();
          v96 = (char *)v16;
          uint64_t v56 = v55;
          uint64_t v90 = swift_slowAlloc();
          uint64_t v104 = v90;
          *(_DWORD *)uint64_t v56 = 136315906;
          swift_bridgeObjectRetain();
          uint64_t v102 = sub_10002A68C(v10, (unint64_t)v13, &v104);
          LODWORD(v87) = v54;
          sub_1000B4400();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v56 + 12) = 2080;
          v86[1] = v56 + 14;
          id v57 = [v51 uniqueIdentifier];
          uint64_t v58 = v94;
          sub_1000B2F50();

          uint64_t v59 = v3;
          uint64_t v60 = sub_1000B2F30();
          unint64_t v62 = v61;
          (*(void (**)(char *, uint64_t))(v100 + 8))(v58, v95);
          uint64_t v63 = v60;
          uint64_t v3 = v59;
          uint64_t v102 = sub_10002A68C(v63, v62, &v104);
          sub_1000B4400();

          swift_bridgeObjectRelease();
          *(_WORD *)(v56 + 22) = 2048;
          Swift::Int v64 = v99;
          uint64_t v102 = v99;
          sub_1000B4400();
          *(_WORD *)(v56 + 32) = 2048;
          uint64_t v102 = v88;
          sub_1000B4400();
          _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v87, "doorWindowAndWindowConvering: serviceKind: %s service UUID: %s targetPosition: %ld currentPosition: %ld", (uint8_t *)v56, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          unint64_t v16 = (unint64_t)v96;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          Swift::Int v64 = v99;
        }
        uint64_t v66 = v91;
        uint64_t v65 = v92;
        uint64_t v67 = v51;
        v89(v21, enum case for CharacteristicKind.obstructionDetected(_:), v3);
        LOBYTE(v65) = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v21, *(void *)(v66 + v65));
        v93((char *)v21, v3);
        if (v65)
        {
          id v69 = v51;
          unint64_t v70 = sub_1000B3550();
          os_log_type_t v71 = sub_1000B42C0();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            uint64_t v73 = swift_slowAlloc();
            v96 = (char *)v16;
            uint64_t v104 = v73;
            *(_DWORD *)v72 = 136315138;
            id v74 = [v69 uniqueIdentifier];
            v75 = v94;
            sub_1000B2F50();

            uint64_t v76 = sub_1000B2F30();
            unint64_t v78 = v77;
            (*(void (**)(char *, uint64_t))(v100 + 8))(v75, v95);
            uint64_t v102 = sub_10002A68C(v76, v78, &v104);
            sub_1000B4400();

            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v70, v71, "doorWindowAndWindowConvering: service UUID: %s  obstructionDetected", v72, 0xCu);
            swift_arrayDestroy();
            unint64_t v16 = (unint64_t)v96;
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          uint64_t v104 = v98;
          unint64_t v105 = v16;
          swift_bridgeObjectRetain();
          v107._countAndFlagsBits = 0xD000000000000018;
          v107._object = (void *)0x80000001000BA5A0;
          sub_1000B4090(v107);
          swift_bridgeObjectRelease();
          uint64_t v79 = sub_1000B4050();

          goto LABEL_41;
        }
        if (v88 == v64)
        {
          if (v64 == 100)
          {
            uint64_t v104 = v98;
            unint64_t v105 = v16;
            swift_bridgeObjectRetain();
            v68._countAndFlagsBits = 0x65704F6574617453;
            v68._object = (void *)0xE90000000000006ELL;
          }
          else
          {
            if (v64)
            {
              swift_bridgeObjectRelease();
              sub_100008148(0, (unint64_t *)&qword_1000D51E0);
              Class isa = sub_1000B4370(v64).super.super.isa;
              Class v81 = sub_1000B4370(0).super.super.isa;
              Class v82 = sub_1000B4370(100).super.super.isa;
              uint64_t v83 = sub_100076D34(isa);

              return v83;
            }
            uint64_t v104 = v98;
            unint64_t v105 = v16;
            swift_bridgeObjectRetain();
            v68._countAndFlagsBits = 0x6F6C436574617453;
            v68._object = (void *)0xEB00000000646573;
          }
          goto LABEL_40;
        }
        if (v64 < v88)
        {
          uint64_t v104 = v98;
          unint64_t v105 = v16;
          swift_bridgeObjectRetain();
          v68._object = (void *)0xEC000000676E6973;
          v68._countAndFlagsBits = 0x6F6C436574617453;
LABEL_40:
          sub_1000B4090(v68);
          swift_bridgeObjectRelease();
          uint64_t v79 = sub_1000B4050();

LABEL_41:
          swift_bridgeObjectRelease();
          return v79;
        }
        if (v88 < v64)
        {
          uint64_t v104 = v98;
          unint64_t v105 = v16;
          swift_bridgeObjectRetain();
          v68._countAndFlagsBits = 0x65704F6574617453;
          v68._object = (void *)0xEC000000676E696ELL;
          goto LABEL_40;
        }

        swift_bridgeObjectRelease();
        return 0;
      }
LABEL_50:
      swift_once();
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();

    return 0;
  }
  return v15;
}

uint64_t sub_1000A98B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)sub_1000B2F60();
  uint64_t v3 = *(v2 - 1);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000B3320();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetTileInfo();
  uint64_t v11 = 0;
  uint64_t v12 = v1 + *(int *)(v10 + 56);
  int v13 = *(unsigned __int8 *)(v12 + 8);
  if ((v13 - 2) >= 3)
  {
    uint64_t v14 = v10;
    uint64_t v112 = v3;
    uint64_t v15 = *(void **)v12;
    if (!v13)
    {
      v109 = v2;
      id v16 = v15;
      goto LABEL_10;
    }
    id v17 = v15;
    id v18 = [v17 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v19 = sub_1000B4100();

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      id v16 = (id)sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_6;
      }
    }
    else
    {
      id v16 = *(id *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v16)
      {
LABEL_6:
        v109 = v2;
        if ((v19 & 0xC000000000000001) != 0)
        {
          id v20 = (id)sub_1000B45E0();
        }
        else
        {
          if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_60;
          }
          id v20 = *(id *)(v19 + 32);
        }
        id v16 = v20;
        swift_bridgeObjectRelease();

LABEL_10:
        uint64_t v2 = *(void **)(v7 + 104);
        ((void (*)(char *, void, uint64_t))v2)(v9, enum case for CharacteristicKind.active(_:), v6);
        uint64_t v111 = *(int *)(v14 + 60);
        char v21 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v9, *(void *)(v1 + v111));
        v110 = *(void (**)(char *, uint64_t))(v7 + 8);
        v110(v9, v6);
        if (v21 == 2)
        {

          return 0;
        }
        if ((v21 & 1) == 0)
        {
          uint64_t v11 = sub_1000B4050();

          return v11;
        }
        if (qword_1000D4EA8 == -1)
        {
LABEL_15:
          uint64_t v22 = sub_1000B3570();
          uint64_t v23 = sub_100017618(v22, (uint64_t)qword_1000DCC18);
          id v24 = v16;
          uint64_t v107 = v23;
          id v108 = v24;
          uint64_t v25 = sub_1000B3550();
          os_log_type_t v26 = sub_1000B42C0();
          int v27 = v26;
          uint64_t v28 = (void (*)(char *, void, uint64_t))v2;
          if (os_log_type_enabled(v25, v26))
          {
            uint64_t v29 = swift_slowAlloc();
            uint64_t v106 = (uint64_t)v2;
            uint64_t v30 = v29;
            uint64_t v105 = swift_slowAlloc();
            uint64_t v113 = v105;
            *(_DWORD *)uint64_t v30 = 136315394;
            uint64_t v103 = v30 + 4;
            id v31 = v108;
            id v32 = [v108 uniqueIdentifier];
            LODWORD(v104) = v27;
            id v33 = v32;
            sub_1000B2F50();

            uint64_t v34 = sub_1000B2F30();
            os_log_t v102 = v25;
            unint64_t v36 = v35;
            (*(void (**)(char *, void *))(v112 + 8))(v5, v109);
            uint64_t v115 = sub_10002A68C(v34, v36, &v113);
            sub_1000B4400();

            swift_bridgeObjectRelease();
            *(_WORD *)(v30 + 12) = 1024;
            LODWORD(v115) = 1;
            sub_1000B4400();
            os_log_t v37 = v102;
            _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v104, "humidifierDehumidifier: %s active: %{BOOL}d", (uint8_t *)v30, 0x12u);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v28 = (void (*)(char *, void, uint64_t))v106;
            swift_slowDealloc();
          }
          else
          {

            id v38 = v108;
          }
          uint64_t v39 = v111;
          v28(v9, enum case for CharacteristicKind.currentHumidifierDehumidifierState(_:), v6);
          uint64_t v111 = sub_100008520((uint64_t)v9, *(void *)(v1 + v39));
          char v41 = v40;
          uint64_t v42 = v28;
          uint64_t v43 = v110;
          v110(v9, v6);
          if ((v41 & 1) != 0
            || (v42(v9, enum case for CharacteristicKind.targetHumidifierDehumidifierState(_:), v6),
                uint64_t v106 = sub_100008520((uint64_t)v9, *(void *)(v1 + v39)),
                char v45 = v44,
                v43(v9, v6),
                (v45 & 1) != 0))
          {
            uint64_t v11 = sub_1000B4050();

            return v11;
          }
          v42(v9, enum case for CharacteristicKind.humidifierThreshold(_:), v6);
          id v46 = v108;
          uint64_t v104 = sub_100008520((uint64_t)v9, *(void *)(v1 + v39));
          LODWORD(v105) = v47;
          v43(v9, v6);
          v42(v9, enum case for CharacteristicKind.dehumidifierThreshold(_:), v6);
          uint64_t v48 = sub_100008520((uint64_t)v9, *(void *)(v1 + v39));
          LODWORD(v103) = v49;
          v43(v9, v6);
          v110 = (void (*)(char *, uint64_t))v46;
          uint64_t v50 = sub_1000B3550();
          os_log_type_t v51 = sub_1000B42C0();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = swift_slowAlloc();
            id v108 = (id)swift_slowAlloc();
            uint64_t v115 = (uint64_t)v108;
            *(_DWORD *)uint64_t v52 = 136315650;
            os_log_type_t v53 = v110;
            id v54 = [v110 uniqueIdentifier];
            sub_1000B2F50();

            uint64_t v55 = sub_1000B2F30();
            unint64_t v57 = v56;
            (*(void (**)(char *, void *))(v112 + 8))(v5, v109);
            uint64_t v113 = sub_10002A68C(v55, v57, &v115);
            sub_1000B4400();

            LOBYTE(v53) = v103;
            swift_bridgeObjectRelease();
            *(_WORD *)(v52 + 12) = 2080;
            uint64_t v113 = v104;
            char v114 = v105 & 1;
            sub_100004210(&qword_1000D76B8);
            uint64_t v58 = sub_1000B4040();
            Swift::Int v59 = v48;
            uint64_t v113 = sub_10002A68C(v58, v60, &v115);
            sub_1000B4400();
            swift_bridgeObjectRelease();
            *(_WORD *)(v52 + 22) = 2080;
            uint64_t v113 = v48;
            char v114 = v53 & 1;
            uint64_t v61 = sub_1000B4040();
            uint64_t v113 = sub_10002A68C(v61, v62, &v115);
            sub_1000B4400();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v50, v51, "humidifierDehumidifier: %s humidifierThreshold: %s dehumidifierThreshold: %s", (uint8_t *)v52, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            uint64_t v63 = v110;
            Swift::Int v59 = v48;
          }
          Swift::Int v64 = v104;
          uint64_t v65 = v106;
          char v66 = v105;
          if (v111 == 3)
          {
            if (v106 == 2 || v106 == 1)
            {
              if ((v103 & 1) == 0)
              {
                sub_100008148(0, (unint64_t *)&qword_1000D51E0);
                Class isa = sub_1000B4370(v59).super.super.isa;
                Class v89 = sub_1000B4370(0).super.super.isa;
                Class v90 = sub_1000B4370(100).super.super.isa;
                uint64_t v70 = sub_100076D34(isa);
                uint64_t v72 = v91;

                goto LABEL_44;
              }
LABEL_49:

              return 0;
            }
LABEL_32:
            if (!v106)
            {
              if (v105 & 1) != 0 || (v103) {
                goto LABEL_49;
              }
LABEL_41:
              uint64_t v112 = sub_1000B4050();
              sub_100004210(&qword_1000D7668);
              uint64_t v73 = swift_allocObject();
              *(_OWORD *)(v73 + 16) = xmmword_1000B51A0;
              sub_100008148(0, (unint64_t *)&qword_1000D51E0);
              Swift::Int v74 = v59;
              Class v75 = sub_1000B4370(v64).super.super.isa;
              Class v76 = sub_1000B4370(0).super.super.isa;
              Class v77 = sub_1000B4370(100).super.super.isa;
              uint64_t v78 = sub_100076D34(v75);
              uint64_t v80 = v79;

              *(void *)(v73 + 56) = &type metadata for String;
              unint64_t v81 = sub_1000AB0B4();
              *(void *)(v73 + 64) = v81;
              *(void *)(v73 + 32) = v78;
              *(void *)(v73 + 40) = v80;
              Class v82 = sub_1000B4370(v74).super.super.isa;
              Class v83 = sub_1000B4370(0).super.super.isa;
              Class v84 = sub_1000B4370(100).super.super.isa;
              uint64_t v85 = sub_100076D34(v82);
              uint64_t v87 = v86;

              *(void *)(v73 + 96) = &type metadata for String;
              *(void *)(v73 + 104) = v81;
              *(void *)(v73 + 72) = v85;
              *(void *)(v73 + 80) = v87;
              uint64_t v11 = sub_1000B4020();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v11;
            }
            goto LABEL_51;
          }
          if (v111 == 2)
          {
            if (v106 == 2 || v106 == 1)
            {
              if ((v105 & 1) == 0)
              {
                sub_100008148(0, (unint64_t *)&qword_1000D51E0);
                Class v67 = sub_1000B4370(v64).super.super.isa;
                Class v68 = sub_1000B4370(0).super.super.isa;
                Class v69 = sub_1000B4370(100).super.super.isa;
                uint64_t v70 = sub_100076D34(v67);
                uint64_t v72 = v71;

LABEL_44:
                sub_1000B4050();
                sub_100004210(&qword_1000D7668);
                uint64_t v92 = swift_allocObject();
                *(_OWORD *)(v92 + 16) = xmmword_1000B5180;
                *(void *)(v92 + 56) = &type metadata for String;
                *(void *)(v92 + 64) = sub_1000AB0B4();
                *(void *)(v92 + 32) = v70;
                *(void *)(v92 + 40) = v72;
                uint64_t v11 = sub_1000B4020();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                return v11;
              }
              goto LABEL_49;
            }
            goto LABEL_32;
          }
          sub_1000B4050();
          switch(v65)
          {
            case 2:
              if (v103) {
                goto LABEL_48;
              }
              sub_100008148(0, (unint64_t *)&qword_1000D51E0);
              Swift::Int v93 = v59;
              break;
            case 1:
              if (v66)
              {
LABEL_48:
                swift_bridgeObjectRelease();
                goto LABEL_49;
              }
              sub_100008148(0, (unint64_t *)&qword_1000D51E0);
              Swift::Int v93 = v64;
              break;
            case 0:
              swift_bridgeObjectRelease();
              if (v66 & 1) != 0 || (v103) {
                goto LABEL_49;
              }
              goto LABEL_41;
            default:
              swift_bridgeObjectRelease();
LABEL_51:
              uint64_t v11 = sub_1000B4050();

              return v11;
          }
          Class v94 = sub_1000B4370(v93).super.super.isa;
          Class v95 = sub_1000B4370(0).super.super.isa;
          Class v96 = sub_1000B4370(100).super.super.isa;
          uint64_t v97 = sub_100076D34(v94);
          uint64_t v99 = v98;

          sub_100004210(&qword_1000D7668);
          uint64_t v100 = swift_allocObject();
          *(_OWORD *)(v100 + 16) = xmmword_1000B5180;
          *(void *)(v100 + 56) = &type metadata for String;
          *(void *)(v100 + 64) = sub_1000AB0B4();
          *(void *)(v100 + 32) = v97;
          *(void *)(v100 + 40) = v99;
          uint64_t v11 = sub_1000B4020();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
LABEL_60:
        swift_once();
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();

    return 0;
  }
  return v11;
}

void sub_1000AA624()
{
  uint64_t v1 = sub_1000B2F60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000B3320();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WidgetTileInfo();
  uint64_t v10 = v0 + *(int *)(v9 + 56);
  int v11 = *(unsigned __int8 *)(v10 + 8);
  if ((v11 - 2) < 3) {
    return;
  }
  uint64_t v12 = v9;
  unint64_t v36 = v4;
  uint64_t v37 = v2;
  uint64_t v38 = v1;
  int v13 = *(void **)v10;
  if (v11)
  {
    id v15 = v13;
    id v16 = [v15 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v17 = sub_1000B4100();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      if ((v17 & 0xC000000000000001) != 0)
      {
        id v18 = (id)sub_1000B45E0();
      }
      else
      {
        if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v18 = *(id *)(v17 + 32);
      }
      id v14 = v18;
      swift_bridgeObjectRelease();

      goto LABEL_10;
    }
    swift_bridgeObjectRelease();

    return;
  }
  id v14 = v13;
LABEL_10:
  uint64_t v19 = *(void *)(v0 + *(int *)(v12 + 60));
  id v20 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  v20(v8, enum case for CharacteristicKind.powerState(_:), v5);
  char v21 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, v19);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22(v8, v5);
  if (v21 == 2
    && (v20(v8, enum case for CharacteristicKind.active(_:), v5),
        char v21 = _sSo9HMServiceC10HomeWidgetE9BOOLValue3for4withSbSg0B9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v8, v19), v22(v8, v5), v21 == 2))
  {
  }
  else
  {
    if (qword_1000D4EA8 != -1) {
      swift_once();
    }
    int v23 = v21 & 1;
    uint64_t v24 = sub_1000B3570();
    sub_100017618(v24, (uint64_t)qword_1000DCC18);
    id v25 = v14;
    os_log_type_t v26 = sub_1000B3550();
    os_log_type_t v27 = sub_1000B42C0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315394;
      id v29 = [v25 uniqueIdentifier];
      uint64_t v30 = v36;
      sub_1000B2F50();

      uint64_t v31 = sub_1000B2F30();
      unint64_t v33 = v32;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v38);
      uint64_t v39 = sub_10002A68C(v31, v33, &v40);
      sub_1000B4400();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 1024;
      LODWORD(v39) = v23;
      sub_1000B4400();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "defaultActivePowerState: %s powerState: %{BOOL}d", (uint8_t *)v28, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_1000B4050();

    swift_bridgeObjectRelease();
  }
}

void sub_1000AAB6C(unsigned int *a1, const char *a2)
{
  uint64_t v50 = a2;
  uint64_t v4 = v2;
  uint64_t v5 = sub_1000B2F60();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000B3320();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for WidgetTileInfo();
  uint64_t v14 = *(int *)(v13 + 56);
  uint64_t v51 = v4;
  id v15 = (void **)(v4 + v14);
  int v16 = *(unsigned __int8 *)(v4 + v14 + 8);
  if ((v16 - 2) < 3) {
    return;
  }
  uint64_t v48 = v13;
  uint64_t v49 = v10;
  unint64_t v17 = v8;
  uint64_t v47 = v6;
  id v18 = *v15;
  if (v16)
  {
    id v25 = v18;
    id v26 = [v25 services];
    sub_100008148(0, &qword_1000D5020);
    unint64_t v27 = sub_1000B4100();

    uint64_t v20 = v5;
    uint64_t v24 = (uint64_t)v12;
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      char v21 = v17;
      if (v45)
      {
LABEL_6:
        uint64_t v22 = v9;
        if ((v27 & 0xC000000000000001) != 0)
        {
          id v19 = (id)sub_1000B45E0();
          swift_bridgeObjectRelease();

          uint64_t v23 = v49;
        }
        else
        {
          uint64_t v23 = v49;
          if (!*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v19 = *(id *)(v27 + 32);
          swift_bridgeObjectRelease();
        }
        goto LABEL_9;
      }
    }
    else
    {
      char v21 = v17;
      if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();

    return;
  }
  id v19 = v18;
  uint64_t v20 = v5;
  char v21 = v17;
  uint64_t v22 = v9;
  uint64_t v23 = v49;
  uint64_t v24 = (uint64_t)v12;
LABEL_9:
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v24, *a1, v22);
  uint64_t v28 = sub_100008520(v24, *(void *)(v51 + *(int *)(v48 + 60)));
  char v30 = v29;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v22);
  if (v30) {
    Swift::Int v31 = 0;
  }
  else {
    Swift::Int v31 = v28;
  }
  if (qword_1000D4EA8 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_1000B3570();
  sub_100017618(v32, (uint64_t)qword_1000DCC18);
  id v33 = v19;
  uint64_t v34 = sub_1000B3550();
  os_log_type_t v35 = sub_1000B42C0();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315394;
    id v37 = [v33 uniqueIdentifier];
    sub_1000B2F50();

    uint64_t v38 = sub_1000B2F30();
    uint64_t v39 = v20;
    unint64_t v41 = v40;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v39);
    uint64_t v52 = sub_10002A68C(v38, v41, &v53);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2048;
    uint64_t v52 = v31;
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, v50, (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100008148(0, (unint64_t *)&qword_1000D51E0);
  Class isa = sub_1000B4370(v31).super.super.isa;
  Class v43 = sub_1000B4370(0).super.super.isa;
  Class v44 = sub_1000B4370(100).super.super.isa;
  sub_100076D34(isa);
}

unint64_t sub_1000AB0B4()
{
  unint64_t result = qword_1000D7670;
  if (!qword_1000D7670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7670);
  }
  return result;
}

unint64_t sub_1000AB108()
{
  unint64_t result = qword_1000D76B0;
  if (!qword_1000D76B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D76B0);
  }
  return result;
}

unint64_t sub_1000AB15C()
{
  unint64_t result = qword_1000D5068;
  if (!qword_1000D5068)
  {
    sub_1000B31A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D5068);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000AB1D8()
{
  uint64_t v0 = sub_1000B3570();
  sub_100022374(v0, qword_1000D7768);
  sub_100017618(v0, (uint64_t)qword_1000D7768);
  return sub_1000B3560();
}

Swift::Int *maxNumberOfPredictions.unsafeMutableAddressor()
{
  return &maxNumberOfPredictions;
}

uint64_t HMHome.fetchPredictions()()
{
  v1[28] = v0;
  sub_100004210(&qword_1000D5008);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  uint64_t v2 = sub_1000B2F60();
  v1[31] = v2;
  v1[32] = *(void *)(v2 - 8);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  return _swift_task_switch(sub_1000AB384, 0, 0);
}

uint64_t sub_1000AB384()
{
  id v1 = [*(id *)(v0 + 224) userActionPredictionController];
  *(void *)(v0 + 288) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 192;
    *(void *)(v0 + 24) = sub_1000AB508;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_1000ABF84;
    *(void *)(v0 + 104) = &unk_1000D0270;
    *(void *)(v0 + 112) = v3;
    [v2 fetchPredictionsWithCompletion:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4(0);
  }
}

uint64_t sub_1000AB508()
{
  return _swift_task_switch(sub_1000AB5E8, 0, 0);
}

uint64_t sub_1000AB5E8()
{
  Swift::Int v88 = v0;
  uint64_t v1 = v0[24];
  if ((unint64_t)v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000B46A0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_22:
    Class v82 = _swiftEmptyArrayStorage;
LABEL_23:
    swift_bridgeObjectRelease_n();
    v0[21] = v82;
    if (qword_1000D7760 != -1) {
      swift_once();
    }
    id v33 = (id *)(v0 + 28);
    uint64_t v32 = (void *)v0[28];
    uint64_t v34 = sub_1000B3570();
    sub_100017618(v34, (uint64_t)qword_1000D7768);
    id v35 = v32;
    uint64_t v36 = sub_1000B3550();
    os_log_type_t v37 = sub_1000B42C0();
    if (os_log_type_enabled(v36, v37))
    {
      loga = v36;
      uint64_t v74 = v0[34];
      uint64_t v38 = v0[31];
      uint64_t v76 = v0[32];
      uint64_t v39 = (void *)v0[28];
      uint64_t v40 = swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 134218498;
      swift_beginAccess();
      v0[25] = *(void *)(v0[21] + 16);
      sub_1000B4400();
      *(_WORD *)(v40 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_1000B4110();
      unint64_t v43 = v42;
      swift_bridgeObjectRelease();
      uint64_t v44 = v41;
      id v33 = (id *)(v0 + 28);
      v0[26] = sub_10002A68C(v44, v43, &v87);
      sub_1000B4400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 22) = 2080;
      id v45 = [v39 uniqueIdentifier];
      sub_1000B2F50();

      sub_1000AD5D8(&qword_1000D77B0);
      uint64_t v46 = sub_1000B4800();
      unint64_t v48 = v47;
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v74, v38);
      v0[27] = sub_10002A68C(v46, v48, &v87);
      sub_1000B4400();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, loga, v37, "HomeKit predictionUUIDs (%ld) = %s homeID = %s", (uint8_t *)v40, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v49 = *v33;
    }
    uint64_t v50 = (void *)v0[28];
    swift_beginAccess();
    uint64_t v51 = swift_bridgeObjectRetain();
    uint64_t v52 = HMHome.backfill(predictionUUIDs:)(v51);
    swift_bridgeObjectRelease();
    v0[21] = v52;
    swift_bridgeObjectRelease();
    id v53 = v50;
    id v54 = sub_1000B3550();
    os_log_type_t v55 = sub_1000B42C0();
    BOOL v56 = os_log_type_enabled(v54, v55);
    unint64_t v57 = (void *)v0[36];
    if (v56)
    {
      os_log_type_t v84 = v55;
      uint64_t v58 = v0[34];
      uint64_t v60 = v0[31];
      uint64_t v59 = v0[32];
      type = (void *)v0[28];
      uint64_t v86 = (void *)v0[36];
      uint64_t v61 = swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      *(_DWORD *)uint64_t v61 = 136315394;
      unint64_t v81 = v54;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1000B4110();
      unint64_t v64 = v63;
      swift_bridgeObjectRelease();
      v0[22] = sub_10002A68C(v62, v64, &v87);
      sub_1000B4400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2080;
      id v65 = [type uniqueIdentifier];
      sub_1000B2F50();

      sub_1000AD5D8(&qword_1000D77B0);
      uint64_t v66 = sub_1000B4800();
      unint64_t v68 = v67;
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
      v0[23] = sub_10002A68C(v66, v68, &v87);
      sub_1000B4400();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v81, v84, "RETURNING predictions = %s homeID = %s", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v69 = *v33;
    }
    uint64_t v70 = v0[21];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v71 = (uint64_t (*)(uint64_t))v0[1];
    return v71(v70);
  }
  uint64_t v2 = *(void *)(((unint64_t)v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_22;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v0[32];
    unint64_t v75 = (unint64_t)v1 & 0xC000000000000001;
    uint64_t v6 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
    uint64_t v72 = v5;
    uint64_t v85 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    Class v82 = _swiftEmptyArrayStorage;
    Class v83 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
    uint64_t v73 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    os_log_t log = (os_log_t)v2;
    os_log_t v80 = v1;
    while (1)
    {
      if (v75) {
        uint64_t v7 = (objc_class *)sub_1000B45E0();
      }
      else {
        uint64_t v7 = v1[v4 + 4].isa;
      }
      uint64_t v8 = v7;
      id v9 = [(objc_class *)v7 targetServiceUUID];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = v0[34];
        uint64_t v12 = v0[31];
        uint64_t v13 = v0[29];
        sub_1000B2F50();

        uint64_t v14 = *v6;
        (*v6)(v13, v11, v12);
        id v15 = *v73;
        (*v73)(v13, 0, 1, v12);
        int v16 = *v85;
        if ((*v85)(v13, 1, v12) != 1)
        {
          uint64_t v18 = v0[30];
          uint64_t v17 = v0[31];
          v14(v18, v0[29], v17);
          v15(v18, 0, 1, v17);

          uint64_t v19 = v18;
          uint64_t v6 = v83;
          if (v16(v19, 1, v17) != 1) {
            goto LABEL_16;
          }
          goto LABEL_5;
        }
      }
      else
      {
        id v15 = *v73;
        (*v73)(v0[29], 1, 1, v0[31]);
      }
      uint64_t v20 = v0[34];
      uint64_t v22 = v0[30];
      uint64_t v21 = v0[31];
      uint64_t v23 = v0[29];
      id v24 = [(objc_class *)v8 predictionTargetUUID];
      sub_1000B2F50();

      uint64_t v6 = v83;
      uint64_t v14 = *v83;
      (*v83)(v22, v20, v21);
      sub_1000094A4(v23);
      v15(v22, 0, 1, v21);

      if ((*v85)(v22, 1, v21) != 1)
      {
LABEL_16:
        uint64_t v25 = v0[35];
        uint64_t v26 = v0[33];
        uint64_t v27 = v0[31];
        v14(v25, v0[30], v27);
        v14(v26, v25, v27);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          Class v82 = (void *)sub_1000753BC(0, v82[2] + 1, 1, (unint64_t)v82);
        }
        uint64_t v6 = v83;
        unint64_t v29 = v82[2];
        unint64_t v28 = v82[3];
        if (v29 >= v28 >> 1) {
          Class v82 = (void *)sub_1000753BC(v28 > 1, v29 + 1, 1, (unint64_t)v82);
        }
        uint64_t v30 = v0[33];
        uint64_t v31 = v0[31];
        v82[2] = v29 + 1;
        v14((uint64_t)v82+ ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))+ *(void *)(v72 + 72) * v29, v30, v31);
        goto LABEL_6;
      }
LABEL_5:
      sub_1000094A4(v0[30]);
LABEL_6:
      uint64_t v1 = v80;
      if (log == (os_log_t)++v4) {
        goto LABEL_23;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000ABF84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_1000AD61C();
  **(void **)(*(void *)(v1 + 64) + 40) = sub_1000B4100();

  return _swift_continuation_resume(v1);
}

void *sub_1000ABFEC(unint64_t a1, uint64_t *a2)
{
  uint64_t v52 = a2;
  uint64_t v3 = sub_100004210(&qword_1000D5008);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v43 - v7;
  uint64_t v9 = sub_1000B2F60();
  uint64_t v53 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v51 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v59 = (char *)&v43 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  unint64_t v68 = (char *)&v43 - v15;
  __chkstk_darwin(v14);
  id v45 = (char *)&v43 - v16;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1000B46A0();
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v17)
    {
LABEL_3:
      uint64_t v18 = 0;
      unint64_t v50 = a1 & 0xC000000000000001;
      unint64_t v44 = a1 + 32;
      uint64_t v60 = v53 + 16;
      uint64_t v66 = (void (**)(char *, uint64_t))(v53 + 8);
      unint64_t v67 = (uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
      unint64_t v63 = v6;
      unint64_t v64 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
      id v54 = _swiftEmptyArrayStorage;
      unint64_t v55 = (v53 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v62 = (void (**)(char *, char *, uint64_t))(v53 + 32);
      unint64_t v48 = a1;
      uint64_t v49 = (v53 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      unint64_t v47 = v8;
      uint64_t v46 = v17;
      uint64_t v19 = v59;
      while (1)
      {
        if (v50)
        {
          uint64_t v20 = (void *)sub_1000B45E0();
          BOOL v21 = __OFADD__(v18, 1);
          uint64_t v22 = v18 + 1;
          if (v21) {
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v20 = *(void **)(v44 + 8 * v18);
          swift_unknownObjectRetain();
          BOOL v21 = __OFADD__(v18, 1);
          uint64_t v22 = v18 + 1;
          if (v21)
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        uint64_t v58 = v22;
        uint64_t v23 = *v52;
        swift_bridgeObjectRetain();
        id v57 = v20;
        id v24 = [v20 uniqueIdentifier];
        sub_1000B2F50();

        uint64_t v25 = *(void *)(v23 + 16);
        uint64_t v56 = v23;
        if (v25)
        {
          uint64_t v26 = v23 + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80));
          uint64_t v61 = *(void *)(v53 + 72);
          id v65 = *(void (**)(char *, uint64_t, uint64_t))(v53 + 16);
          swift_bridgeObjectRetain();
          while (1)
          {
            v65(v6, v26, v9);
            uint64_t v27 = *v64;
            (*v64)(v6, 0, 1, v9);
            unint64_t v28 = *v67;
            if ((*v67)(v6, 1, v9) == 1)
            {
              uint64_t v18 = v58;
              unint64_t v32 = v55;
              goto LABEL_19;
            }
            unint64_t v29 = *v62;
            (*v62)(v19, v6, v9);
            sub_1000AD5D8(&qword_1000D5B30);
            char v30 = sub_1000B3F90();
            uint64_t v31 = *v66;
            (*v66)(v19, v9);
            if (v30) {
              break;
            }
            v26 += v61;
            --v25;
            uint64_t v6 = v63;
            if (!v25) {
              goto LABEL_17;
            }
          }
          swift_bridgeObjectRelease();
          v31(v68, v9);
          swift_bridgeObjectRelease();
          uint64_t v8 = v47;
          v27(v47, 1, 1, v9);
          swift_unknownObjectRelease();
          int v35 = v28(v8, 1, v9);
          a1 = v48;
          uint64_t v6 = v63;
          uint64_t v18 = v58;
          if (v35 != 1) {
            goto LABEL_22;
          }
LABEL_4:
          sub_1000094A4((uint64_t)v8);
          if (v18 == v46) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v27 = *v64;
          swift_bridgeObjectRetain();
LABEL_17:
          unint64_t v32 = v55;
          v27(v6, 1, 1, v9);
          uint64_t v18 = v58;
LABEL_19:
          swift_bridgeObjectRelease();
          (*v66)(v68, v9);
          swift_bridgeObjectRelease();
          id v33 = [v57 uniqueIdentifier];
          uint64_t v8 = v47;
          sub_1000B2F50();

          unint64_t v55 = v32;
          v27(v8, 0, 1, v9);
          swift_unknownObjectRelease();
          int v34 = (*v67)(v8, 1, v9);
          a1 = v48;
          if (v34 == 1) {
            goto LABEL_4;
          }
          unint64_t v29 = *v62;
LABEL_22:
          uint64_t v36 = v46;
          os_log_type_t v37 = v45;
          v29(v45, v8, v9);
          v29(v51, v37, v9);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v38 = (unint64_t)v54;
          }
          else {
            unint64_t v38 = sub_1000753BC(0, v54[2] + 1, 1, (unint64_t)v54);
          }
          unint64_t v40 = *(void *)(v38 + 16);
          unint64_t v39 = *(void *)(v38 + 24);
          if (v40 >= v39 >> 1) {
            unint64_t v38 = sub_1000753BC(v39 > 1, v40 + 1, 1, v38);
          }
          *(void *)(v38 + 16) = v40 + 1;
          unint64_t v41 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
          id v54 = (void *)v38;
          v29((char *)(v38 + v41 + *(void *)(v53 + 72) * v40), v51, v9);
          uint64_t v6 = v63;
          if (v18 == v36)
          {
LABEL_29:
            swift_bridgeObjectRelease();
            return v54;
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t HMHome.backfill(predictionUUIDs:)(uint64_t a1)
{
  uint64_t v3 = sub_100004210(&qword_1000D5008);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v102 - v7;
  uint64_t v9 = sub_1000B2F60();
  uint64_t v114 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v112 = (char *)&v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v106 = (char *)&v102 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v113 = (char *)&v102 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v115 = (char *)&v102 - v17;
  __chkstk_darwin(v16);
  uint64_t v107 = (char *)&v102 - v18;
  uint64_t v118 = a1;
  unint64_t v19 = *(void *)(a1 + 16);
  if (v19 >= 0x10)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  unint64_t v20 = 16 - v19;
  BOOL v21 = self;
  swift_bridgeObjectRetain();
  Class isa = sub_1000B40F0().super.isa;
  id v105 = v21;
  id v23 = [v21 predictionsPaddingFavoriteServicesForHome:v1 withLimit:v20 ignoreUUIDs:isa];

  uint64_t v104 = sub_100004210(&qword_1000D7818);
  unint64_t v24 = sub_1000B4100();

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000B46A0();
    uint64_t v25 = result;
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v111 = v6;
  id v103 = v1;
  if (v25)
  {
    if (v25 < 1)
    {
      __break(1u);
      goto LABEL_52;
    }
    uint64_t v27 = 0;
    unint64_t v108 = v24 & 0xC000000000000001;
    unint64_t v28 = (void (**)(char *, char *, uint64_t))(v114 + 32);
    unint64_t v29 = (void (**)(char *, void, uint64_t, uint64_t))(v114 + 56);
    char v30 = (unsigned int (**)(char *, uint64_t, uint64_t))(v114 + 48);
    uint64_t v31 = (char *)_swiftEmptyArrayStorage;
    unint64_t v109 = v25;
    unint64_t v110 = v24;
    do
    {
      if (v108)
      {
        unint64_t v32 = (void *)sub_1000B45E0();
      }
      else
      {
        unint64_t v32 = *(void **)(v24 + 8 * v27 + 32);
        swift_unknownObjectRetain();
      }
      id v33 = [v32 uniqueIdentifier];
      int v34 = v115;
      sub_1000B2F50();

      int v35 = *v28;
      (*v28)(v8, v34, v9);
      (*v29)(v8, 0, 1, v9);
      swift_unknownObjectRelease();
      if ((*v30)(v8, 1, v9) == 1)
      {
        sub_1000094A4((uint64_t)v8);
      }
      else
      {
        uint64_t v36 = v107;
        v35(v107, v8, v9);
        v35(v113, v36, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v31 = (char *)sub_1000753BC(0, *((void *)v31 + 2) + 1, 1, (unint64_t)v31);
        }
        unint64_t v38 = *((void *)v31 + 2);
        unint64_t v37 = *((void *)v31 + 3);
        if (v38 >= v37 >> 1) {
          uint64_t v31 = (char *)sub_1000753BC(v37 > 1, v38 + 1, 1, (unint64_t)v31);
        }
        *((void *)v31 + 2) = v38 + 1;
        v35(&v31[((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80))+ *(void *)(v114 + 72) * v38], v113, v9);
      }
      unint64_t v24 = v110;
      ++v27;
    }
    while (v109 != v27);
  }
  else
  {
    uint64_t v31 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  if (qword_1000D7760 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_1000B3570();
  uint64_t v40 = sub_100017618(v39, (uint64_t)qword_1000D7768);
  swift_bridgeObjectRetain_n();
  id v41 = v103;
  unint64_t v108 = v40;
  unint64_t v42 = sub_1000B3550();
  os_log_type_t v43 = sub_1000B42C0();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v113 = (char *)swift_slowAlloc();
    v117[0] = (uint64_t)v113;
    *(_DWORD *)uint64_t v44 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_1000B4110();
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v116 = sub_10002A68C(v45, v47, v117);
    sub_1000B4400();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    unint64_t v110 = v44 + 14;
    id v48 = [v41 uniqueIdentifier];
    uint64_t v49 = v115;
    sub_1000B2F50();

    sub_1000AD5D8(&qword_1000D77B0);
    uint64_t v50 = sub_1000B4800();
    unint64_t v52 = v51;
    (*(void (**)(char *, uint64_t))(v114 + 8))(v49, v9);
    uint64_t v116 = sub_10002A68C(v50, v52, v117);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Backfilling with favoriteUUIDs = %s homeID = %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100071330((uint64_t)v31);
  id v53 = [v105 favoriteActionSetsForHome:v41 withLimit:16 - *(void *)(v118 + 16)];
  unint64_t v54 = sub_1000B4100();

  unint64_t v55 = sub_1000ABFEC(v54, &v118);
  swift_bridgeObjectRelease();
  id v56 = v41;
  swift_bridgeObjectRetain_n();
  id v57 = (char *)v56;
  uint64_t v58 = sub_1000B3550();
  os_log_type_t v59 = sub_1000B42C0();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = swift_slowAlloc();
    uint64_t v113 = (char *)swift_slowAlloc();
    v117[0] = (uint64_t)v113;
    *(_DWORD *)uint64_t v60 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_1000B4110();
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    uint64_t v116 = sub_10002A68C(v61, v63, v117);
    sub_1000B4400();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v60 + 12) = 2080;
    unint64_t v110 = v60 + 14;
    id v64 = [v57 uniqueIdentifier];
    id v65 = v57;
    uint64_t v66 = v115;
    sub_1000B2F50();

    sub_1000AD5D8(&qword_1000D77B0);
    uint64_t v67 = sub_1000B4800();
    unint64_t v69 = v68;
    uint64_t v70 = v66;
    id v57 = v65;
    (*(void (**)(char *, uint64_t))(v114 + 8))(v70, v9);
    uint64_t v116 = sub_10002A68C(v67, v69, v117);
    sub_1000B4400();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Backfilling with sceneUUIDs = %s homeID = %s", (uint8_t *)v60, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100071330((uint64_t)v55);
  uint64_t v71 = 16 - *(void *)(v118 + 16);
  swift_bridgeObjectRetain();
  Class v72 = sub_1000B40F0().super.isa;
  swift_bridgeObjectRelease();
  id v73 = [v105 predictionsPaddingNonFavoriteServicesForHome:v57 withLimit:v71 ignoreUUIDs:v72];

  unint64_t v74 = sub_1000B4100();
  if (!(v74 >> 62))
  {
    uint64_t v75 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v107 = v57;
    if (v75) {
      goto LABEL_30;
    }
LABEL_45:
    os_log_t v80 = (char *)_swiftEmptyArrayStorage;
LABEL_46:
    swift_bridgeObjectRelease_n();
    uint64_t v89 = v107;
    swift_bridgeObjectRetain_n();
    Class v90 = v89;
    uint64_t v91 = sub_1000B3550();
    os_log_type_t v92 = sub_1000B42C0();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = swift_slowAlloc();
      uint64_t v113 = (char *)swift_slowAlloc();
      v117[0] = (uint64_t)v113;
      *(_DWORD *)uint64_t v93 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_1000B4110();
      unint64_t v96 = v95;
      swift_bridgeObjectRelease();
      uint64_t v116 = sub_10002A68C(v94, v96, v117);
      sub_1000B4400();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v93 + 12) = 2080;
      uint64_t v112 = (char *)(v93 + 14);
      id v97 = [v90 uniqueIdentifier];
      uint64_t v98 = v115;
      sub_1000B2F50();

      sub_1000AD5D8(&qword_1000D77B0);
      uint64_t v99 = sub_1000B4800();
      unint64_t v101 = v100;
      (*(void (**)(char *, uint64_t))(v114 + 8))(v98, v9);
      uint64_t v116 = sub_10002A68C(v99, v101, v117);
      sub_1000B4400();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "Backfilling with nonFavoriteUUIDs = %s homeID = %s", (uint8_t *)v93, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_100071330((uint64_t)v80);
    return v118;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000B46A0();
  uint64_t v75 = result;
  uint64_t v107 = v57;
  if (!result) {
    goto LABEL_45;
  }
LABEL_30:
  if (v75 >= 1)
  {
    uint64_t v76 = 0;
    unint64_t v110 = v74 & 0xC000000000000001;
    Class v77 = (void (**)(char *, char *, uint64_t))(v114 + 32);
    uint64_t v78 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v114 + 56);
    uint64_t v79 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v114 + 48);
    os_log_t v80 = (char *)_swiftEmptyArrayStorage;
    unint64_t v109 = v74;
    uint64_t v113 = (char *)v75;
    do
    {
      if (v110)
      {
        unint64_t v81 = (void *)sub_1000B45E0();
      }
      else
      {
        unint64_t v81 = *(void **)(v74 + 8 * (void)v76 + 32);
        swift_unknownObjectRetain();
      }
      id v82 = [v81 uniqueIdentifier];
      Class v83 = v115;
      sub_1000B2F50();

      os_log_type_t v84 = *v77;
      uint64_t v85 = (uint64_t)v111;
      (*v77)(v111, v83, v9);
      (*v78)(v85, 0, 1, v9);
      swift_unknownObjectRelease();
      if ((*v79)(v85, 1, v9) == 1)
      {
        sub_1000094A4(v85);
        unint64_t v74 = v109;
      }
      else
      {
        uint64_t v86 = v106;
        v84(v106, (char *)v85, v9);
        v84(v112, v86, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_t v80 = (char *)sub_1000753BC(0, *((void *)v80 + 2) + 1, 1, (unint64_t)v80);
        }
        unint64_t v74 = v109;
        unint64_t v88 = *((void *)v80 + 2);
        unint64_t v87 = *((void *)v80 + 3);
        if (v88 >= v87 >> 1) {
          os_log_t v80 = (char *)sub_1000753BC(v87 > 1, v88 + 1, 1, (unint64_t)v80);
        }
        *((void *)v80 + 2) = v88 + 1;
        v84(&v80[((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80))+ *(void *)(v114 + 72) * v88], v112, v9);
      }
      ++v76;
    }
    while (v113 != v76);
    goto LABEL_46;
  }
LABEL_52:
  __break(1u);
  return result;
}

id variable initialization expression of UserHomeSettings.homeAppGroup()
{
  return sub_1000AD530();
}

id variable initialization expression of UserHomeSettings.nanoHomeGroup()
{
  return sub_1000AD530();
}

id sub_1000AD530()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_1000B4000();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2) {
    return v2;
  }
  id v4 = [self standardUserDefaults];

  return v4;
}

uint64_t sub_1000AD5D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000B2F60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000AD61C()
{
  unint64_t result = qword_1000D7828;
  if (!qword_1000D7828)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000D7828);
  }
  return result;
}

uint64_t sub_1000AD65C()
{
  uint64_t v0 = sub_1000B3570();
  sub_100022374(v0, qword_1000D7830);
  sub_100017618(v0, (uint64_t)qword_1000D7830);
  return sub_1000B3560();
}

Swift::Int *HOMEKIT_REFRESH_TIMEOUT_SEC.unsafeMutableAddressor()
{
  return &HOMEKIT_REFRESH_TIMEOUT_SEC;
}

BOOL static HomeWidget.HomeWidgetError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void HomeWidget.HomeWidgetError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int HomeWidget.HomeWidgetError.hashValue.getter(unsigned __int8 a1)
{
  return sub_1000B48F0();
}

uint64_t sub_1000AD76C()
{
  type metadata accessor for HomeWidget();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  static HomeWidget.shared = v0;
  return result;
}

uint64_t *HomeWidget.shared.unsafeMutableAddressor()
{
  if (qword_1000D7788 != -1) {
    swift_once();
  }
  return &static HomeWidget.shared;
}

uint64_t static HomeWidget.shared.getter()
{
  if (qword_1000D7788 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t HomeWidget.homeManager.getter()
{
  *(void *)(v1 + 56) = v0;
  return _swift_task_switch(sub_1000AD870, v0, 0);
}

uint64_t sub_1000AD870()
{
  v0[8] = sub_1000B31C0();
  v0[9] = sub_1000B31B0();
  v0[10] = sub_1000B1210(&qword_1000D57F0, (void (*)(uint64_t))&type metadata accessor for WidgetActor);
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AD93C, v2, v1);
}

uint64_t sub_1000AD93C()
{
  swift_release();
  v0[11] = sub_1000B3060();
  sub_1000B3010();
  uint64_t v1 = v0[5];
  sub_100017B5C((uint64_t)(v0 + 2), &qword_1000D7850);
  if (!v1)
  {
    sub_1000ADD18();
    sub_1000B3020();
  }
  uint64_t v2 = v0[7];
  return _swift_task_switch(sub_1000AD9FC, v2, 0);
}

uint64_t sub_1000AD9FC()
{
  *(void *)(v0 + 96) = sub_1000B31B0();
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000ADA90, v2, v1);
}

uint64_t sub_1000ADA90()
{
  swift_release();
  *(void *)(v0 + 104) = sub_1000B3050();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  void *v1 = v0;
  v1[1] = sub_1000ADB34;
  return WidgetDataModel.snapshotModerator.getter();
}

uint64_t sub_1000ADB34(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  swift_release();
  sub_1000B3440();
  sub_1000B1210(&qword_1000D7860, (void (*)(uint64_t))&type metadata accessor for WidgetSnapshotModerator);
  uint64_t v3 = sub_1000B4180();
  return _swift_task_switch(sub_1000ADCA8, v3, v2);
}

uint64_t sub_1000ADCA8()
{
  uint64_t v1 = sub_1000B3410();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

unint64_t sub_1000ADD18()
{
  unint64_t result = qword_1000D7858;
  if (!qword_1000D7858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7858);
  }
  return result;
}

uint64_t HomeWidget.synchronizeWithHomeKit<A>(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[6] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000ADE1C;
  v5[7] = v3;
  return _swift_task_switch(sub_1000AD870, v3, 0);
}

uint64_t sub_1000ADE1C(uint64_t a1)
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  uint64_t v9 = (void *)*v1;
  v3[7] = a1;
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  v3[8] = v4;
  void *v4 = v9;
  v4[1] = sub_1000ADFA8;
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[2];
  return sub_1000AEB90(v7, v6, v5);
}

uint64_t sub_1000ADFA8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 40);
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v6 = sub_1000AE158;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v6 = sub_1000AE0F0;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_1000AE0F0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000AE158()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1000AE1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  uint64_t v6 = sub_1000B33F0();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  sub_100004210(&qword_1000D5008);
  v5[15] = swift_task_alloc();
  v5[16] = sub_100004210(&qword_1000D7958);
  v5[17] = swift_task_alloc();
  uint64_t v7 = sub_1000B3240();
  v5[18] = v7;
  v5[19] = *(void *)(v7 - 8);
  v5[20] = swift_task_alloc();
  return _swift_task_switch(sub_1000AE344, v4, 0);
}

uint64_t sub_1000AE344()
{
  v0[21] = sub_1000B3060();
  v0[22] = sub_1000B31C0();
  v0[23] = sub_1000B31B0();
  v0[24] = sub_1000B1210(&qword_1000D57F0, (void (*)(uint64_t))&type metadata accessor for WidgetActor);
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AE41C, v2, v1);
}

uint64_t sub_1000AE41C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  *(void *)(v0 + 200) = sub_1000B3050();
  return _swift_task_switch(sub_1000AE494, v1, 0);
}

uint64_t sub_1000AE494()
{
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = sub_1000B2F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  v0[2] = v4;
  v0[3] = v5;
  v0[4] = v3;
  v0[5] = v2;
  sub_100004210(&qword_1000D7960);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000B5180;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000B33E0();
  v0[6] = v7;
  sub_1000B1210(&qword_1000D7968, (void (*)(uint64_t))&type metadata accessor for WidgetRefreshOptions);
  sub_100004210(&qword_1000D7970);
  sub_1000B1258();
  sub_1000B4470();
  unint64_t v8 = sub_10001FE98();
  sub_1000B3250();
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[26] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_1000AE6CC;
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[17];
  return WidgetDataModel.snapshotOf<A>(updateType:)(v10, v11, &type metadata for RecommendedWidgetIdentity, v8);
}

uint64_t sub_1000AE6CC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[11];
    swift_release();
    uint64_t v4 = sub_1000AEB04;
  }
  else
  {
    uint64_t v3 = v2[11];
    (*(void (**)(void, void))(v2[19] + 8))(v2[20], v2[18]);
    swift_release();
    uint64_t v4 = sub_1000AE82C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000AE82C()
{
  *(void *)(v0 + 224) = sub_1000B31B0();
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AE8C0, v2, v1);
}

uint64_t sub_1000AE8C0()
{
  swift_release();
  *(void *)(v0 + 232) = sub_1000B3050();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v1;
  void *v1 = v0;
  v1[1] = sub_1000AE968;
  return WidgetDataModel.snapshotModerator.getter();
}

uint64_t sub_1000AE968(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000AEB04()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000AEB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1000B33F0();
  v4[6] = swift_task_alloc();
  v4[7] = *(void *)(a2 - 8);
  v4[8] = swift_task_alloc();
  sub_100004210(&qword_1000D5008);
  v4[9] = swift_task_alloc();
  v4[10] = sub_1000B3400();
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_1000B3240();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000AED4C, v3, 0);
}

uint64_t sub_1000AED4C()
{
  v0[15] = sub_1000B3060();
  v0[16] = sub_1000B31C0();
  v0[17] = sub_1000B31B0();
  v0[18] = sub_1000B1210(&qword_1000D57F0, (void (*)(uint64_t))&type metadata accessor for WidgetActor);
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AEE24, v2, v1);
}

uint64_t sub_1000AEE24()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  *(void *)(v0 + 152) = sub_1000B3050();
  return _swift_task_switch(sub_1000AEE9C, v1, 0);
}

uint64_t sub_1000AEE9C()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[2];
  uint64_t v6 = sub_1000B2F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  sub_1000AF8E0();
  sub_1000B3250();
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[20] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000AF00C;
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[3];
  uint64_t v11 = v0[4];
  return WidgetDataModel.snapshotOf<A>(updateType:)(v8, v9, v10, v11);
}

uint64_t sub_1000AF00C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[5];
    swift_release();
    uint64_t v4 = sub_1000AF468;
  }
  else
  {
    uint64_t v3 = v2[5];
    (*(void (**)(void, void))(v2[13] + 8))(v2[14], v2[12]);
    swift_release();
    uint64_t v4 = sub_1000AF16C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000AF16C()
{
  *(void *)(v0 + 176) = sub_1000B31B0();
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AF200, v2, v1);
}

uint64_t sub_1000AF200()
{
  swift_release();
  *(void *)(v0 + 184) = sub_1000B3050();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v1;
  void *v1 = v0;
  v1[1] = sub_1000AF2A8;
  return WidgetDataModel.snapshotModerator.getter();
}

uint64_t sub_1000AF2A8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000AF468()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t HomeWidget.queueForNextUpdate<A>(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *(void *)(a2 - 8);
  v4[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000AF5B8, v3, 0);
}

uint64_t sub_1000AF5B8()
{
  *(void *)(v0 + 64) = sub_1000B3060();
  sub_1000B31C0();
  *(void *)(v0 + 72) = sub_1000B31B0();
  sub_1000B1210(&qword_1000D57F0, (void (*)(uint64_t))&type metadata accessor for WidgetActor);
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000AF688, v2, v1);
}

uint64_t sub_1000AF688()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  *(void *)(v0 + 80) = sub_1000B3050();
  return _swift_task_switch(sub_1000AF6FC, v1, 0);
}

uint64_t sub_1000AF6FC()
{
  (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[2], v0[3]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  void *v1 = v0;
  v1[1] = sub_1000AF7B4;
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  return WidgetDataModel.queueForNextUpdate<A>(configuration:)(v2, v3, v4);
}

uint64_t sub_1000AF7B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000AF8E0()
{
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000B5180;
  sub_1000B33E0();
  sub_1000B1210(&qword_1000D7968, (void (*)(uint64_t))&type metadata accessor for WidgetRefreshOptions);
  sub_100004210(&qword_1000D7970);
  sub_1000B1258();
  return sub_1000B4470();
}

uint64_t sub_1000AFA10()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000AFA9C;
  return sub_1000B0B2C();
}

uint64_t sub_1000AFA9C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t HomeWidget.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t HomeWidget.__deallocating_deinit()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t HomeWidget.recommendedHome(userSettings:)(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = sub_1000B3570();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  sub_100004210(&qword_1000D5008);
  v3[14] = swift_task_alloc();
  if (qword_1000D7790 != -1) {
    swift_once();
  }
  uint64_t v5 = static HomeSettingsActor.shared;
  v3[15] = static HomeSettingsActor.shared;
  return _swift_task_switch(sub_1000AFD18, v5, 0);
}

uint64_t sub_1000AFD18()
{
  id v1 = [objc_allocWithZone((Class)IFObjectHasher) init];
  NSString v2 = sub_1000B4000();
  id v3 = [v1 combineContentsOfPropertyListObject:v2];

  v0[2] = [v1 finalize];
  uint64_t v4 = sub_1000B4800();
  uint64_t v6 = v5;

  v0[16] = v4;
  v0[17] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[18] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000AFE68;
  uint64_t v8 = v0[10];
  v7[7] = v8;
  return _swift_task_switch(sub_1000AD870, v8, 0);
}

uint64_t sub_1000AFE68(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  uint64_t v8 = *v1;
  *(void *)(v3 + 152) = a1;
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 160) = v4;
  void *v4 = v8;
  v4[1] = sub_1000AFFF8;
  uint64_t v5 = *(void *)(v2 + 136);
  uint64_t v6 = *(void *)(v2 + 128);
  return sub_1000AE1BC(v6, v5, 0xD000000000000021, 0x80000001000B93A0);
}

uint64_t sub_1000AFFF8(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[21] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[10];
  if (v1)
  {
    swift_errorRelease();
    uint64_t v6 = sub_1000B0760;
  }
  else
  {
    v4[22] = a1;
    uint64_t v6 = sub_1000B0140;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_1000B0140()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000B01B8, v1, 0);
}

void sub_1000B01B8()
{
  uint64_t v44 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  if (v40(ObjectType, v1)) {
    id v3 = [*(id *)(v0 + 152) currentHome];
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = *(void **)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t))(*(void *)(v0 + 72) + 16))(ObjectType);
  id v6 = v4;
  uint64_t v7 = (void *)sub_1000B0E30(v5, v6);

  sub_100017B5C(v5, &qword_1000D5008);
  if ((unint64_t)v7 <= 1)
  {
    id v8 = [*(id *)(v0 + 152) currentHome];
    sub_1000B1050(v7);
    uint64_t v7 = v8;
  }
  if (!v3)
  {
    if (v7)
    {
      uint64_t v9 = v7;
LABEL_16:
      id v13 = v7;
      id v3 = 0;
      goto LABEL_17;
    }
    id v10 = [*(id *)(v0 + 152) homes];
    sub_100008148(0, (unint64_t *)&qword_1000D5550);
    unint64_t v11 = sub_1000B4100();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_1000B46A0();
      swift_bridgeObjectRelease();
      if (v33)
      {
LABEL_12:
        if ((v11 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v12 = *(id *)(v11 + 32);
          goto LABEL_15;
        }
LABEL_33:
        id v12 = (id)sub_1000B45E0();
LABEL_15:
        uint64_t v9 = v12;
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v9 = v3;
LABEL_17:
  uint64_t v39 = ObjectType;
  uint64_t v14 = qword_1000D7780;
  id v42 = v3;
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 88);
  uint64_t v18 = sub_100017618(v17, (uint64_t)qword_1000D7830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
  swift_unknownObjectRetain_n();
  id v19 = v9;
  unint64_t v20 = sub_1000B3550();
  os_log_type_t v21 = sub_1000B42C0();
  BOOL v22 = os_log_type_enabled(v20, v21);
  id v41 = *(void **)(v0 + 152);
  uint64_t v24 = *(void *)(v0 + 96);
  uint64_t v23 = *(void *)(v0 + 104);
  uint64_t v25 = *(void *)(v0 + 88);
  if (v22)
  {
    uint64_t v38 = *(void *)(v0 + 104);
    uint64_t v34 = *(void *)(v0 + 72);
    uint64_t v37 = *(void *)(v0 + 88);
    uint64_t v26 = swift_slowAlloc();
    int v35 = (void *)swift_slowAlloc();
    v43[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315650;
    uint64_t v36 = v7;
    *(void *)(v0 + 40) = sub_10002A68C(0xD00000000000001ELL, 0x80000001000BADB0, v43);
    sub_1000B4400();
    *(_WORD *)(v26 + 12) = 2080;
    char v27 = v40(v39, v34);
    BOOL v28 = (v27 & 1) == 0;
    if (v27) {
      uint64_t v29 = 0x64656C62616E65;
    }
    else {
      uint64_t v29 = 0x64656C6261736964;
    }
    if (v28) {
      unint64_t v30 = 0xE800000000000000;
    }
    else {
      unint64_t v30 = 0xE700000000000000;
    }
    *(void *)(v0 + 48) = sub_10002A68C(v29, v30, v43);
    sub_1000B4400();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v26 + 22) = 2112;
    *(void *)(v0 + 56) = v19;
    id v31 = v19;
    sub_1000B4400();
    void *v35 = v19;

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s HomeSensing:%s, Home:%@", (uint8_t *)v26, 0x20u);
    sub_100004210(&qword_1000D51D8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v38, v37);
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v32 = *(void (**)(id))(v0 + 8);
  v32(v19);
}

uint64_t sub_1000B0760()
{
  uint64_t v1 = *(void *)(v0 + 120);

  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000B07D8, v1, 0);
}

uint64_t sub_1000B07D8()
{
  id v8 = v0;
  if (qword_1000D7780 != -1) {
    swift_once();
  }
  sub_100017618(v0[11], (uint64_t)qword_1000D7830);
  uint64_t v1 = sub_1000B3550();
  os_log_type_t v2 = sub_1000B42A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    v0[3] = sub_10002A68C(0xD00000000000001ELL, 0x80000001000BADB0, &v7);
    sub_1000B4400();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s HMHomeManager returned 0 homes", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000B0AD8();
  swift_allocError();
  unsigned char *v4 = 1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1000B09CC(id *a1)
{
  uint64_t v2 = sub_1000B2F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*a1 uniqueIdentifier];
  sub_1000B2F50();

  char v7 = sub_1000B2F40();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

unint64_t sub_1000B0AD8()
{
  unint64_t result = qword_1000D7890;
  if (!qword_1000D7890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7890);
  }
  return result;
}

uint64_t sub_1000B0B2C()
{
  *(void *)(v0 + 16) = sub_1000B31C0();
  *(void *)(v0 + 24) = sub_1000B31B0();
  return _swift_task_switch(sub_1000B0BA4, 0, 0);
}

uint64_t sub_1000B0BA4()
{
  sub_1000B41B0();
  *(void *)(v0 + 32) = sub_1000B41A0();
  uint64_t v2 = sub_1000B4180();
  return _swift_task_switch(sub_1000B0C38, v2, v1);
}

uint64_t sub_1000B0C38()
{
  swift_release();
  sub_1000B3110();
  sub_1000B3100();
  uint64_t v1 = self;
  *(void *)(v0 + 40) = v1;
  sub_100008148(0, &qword_1000D7950);
  uint64_t v2 = (void *)sub_1000B4330();
  [v1 setConfiguration:v2];

  id v3 = [v1 sharedDispatcher];
  [v3 warmup];

  sub_1000B1210(&qword_1000D57F0, (void (*)(uint64_t))&type metadata accessor for WidgetActor);
  uint64_t v5 = sub_1000B4180();
  return _swift_task_switch(sub_1000B0D88, v5, v4);
}

void sub_1000B0D88()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  id v2 = [v1 sharedDispatcher];
  id v3 = [v2 homeManager];

  if (v3)
  {
    uint64_t v4 = *(void (**)(id))(v0 + 8);
    v4(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000B0E30(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1000B2F60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004210(&qword_1000D5008);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017A84(a1, (uint64_t)v10);
  uint64_t v11 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    id v12 = [a2 homes];
    sub_100008148(0, (unint64_t *)&qword_1000D5550);
    unint64_t v13 = sub_1000B4100();

    __chkstk_darwin(v14);
    v16[-2] = v7;
    uint64_t v11 = (uint64_t)sub_10000EAA4(sub_1000B11F0, (uint64_t)&v16[-4], v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v11;
}

void sub_1000B1050(id a1)
{
  if (a1 != (id)1) {
}
  }

unint64_t sub_1000B1064()
{
  unint64_t result = qword_1000D7898;
  if (!qword_1000D7898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7898);
  }
  return result;
}

uint64_t type metadata accessor for HomeWidget()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for HomeWidget.HomeWidgetError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000B11A8);
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

ValueMetadata *type metadata accessor for HomeWidget.HomeWidgetError()
{
  return &type metadata for HomeWidget.HomeWidgetError;
}

ValueMetadata *type metadata accessor for HomeWidget.HomeKitDispatcherSetup()
{
  return &type metadata for HomeWidget.HomeKitDispatcherSetup;
}

uint64_t sub_1000B11F0(id *a1)
{
  return sub_1000B09CC(a1) & 1;
}

uint64_t sub_1000B1210(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000B1258()
{
  unint64_t result = qword_1000D7978;
  if (!qword_1000D7978)
  {
    sub_100004B80(&qword_1000D7970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7978);
  }
  return result;
}

uint64_t *UserHomeSettings.shared.unsafeMutableAddressor()
{
  if (qword_1000D7798 != -1) {
    swift_once();
  }
  return &static UserHomeSettings.shared;
}

uint64_t *HomeSettingsActor.shared.unsafeMutableAddressor()
{
  if (qword_1000D7790 != -1) {
    swift_once();
  }
  return &static HomeSettingsActor.shared;
}

uint64_t sub_1000B134C()
{
  type metadata accessor for HomeSettingsActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  static HomeSettingsActor.shared = v0;
  return result;
}

uint64_t static HomeSettingsActor.shared.getter()
{
  return sub_1000B14A0(&qword_1000D7790);
}

uint64_t sub_1000B13AC()
{
  if (qword_1000D7790 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_1000B1408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for HomeSettingsActor();

  return static GlobalActor.sharedUnownedExecutor.getter(v3, a2);
}

uint64_t sub_1000B1440()
{
  type metadata accessor for UserHomeSettings();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_1000B17D8();
  static UserHomeSettings.shared = v0;
  return result;
}

uint64_t static UserHomeSettings.shared.getter()
{
  return sub_1000B14A0(&qword_1000D7798);
}

uint64_t sub_1000B14A0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t UserHomeSettings.isHomeSensingEnabled.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = sub_1000B4000();
  id v3 = [v1 objectForKey:v2];

  if (v3)
  {
    sub_1000B4460();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000943C((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_100008464((uint64_t)v8);
    return 1;
  }
  sub_100033068();
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  id v4 = [v6 BOOLValue];

  return (uint64_t)v4;
}

uint64_t UserHomeSettings.selectedHome.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = *(void **)(v1 + 24);
  NSString v4 = sub_1000B4000();
  id v5 = [v3 stringForKey:v4];

  if (v5)
  {
    sub_1000B4010();

    sub_1000B2F20();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = sub_1000B2F60();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    return v8(a1, 1, 1, v7);
  }
}

uint64_t UserHomeSettings.deinit()
{
  return v0;
}

uint64_t UserHomeSettings.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1000B1760()
{
  unint64_t result = qword_1000D7980;
  if (!qword_1000D7980)
  {
    type metadata accessor for HomeSettingsActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7980);
  }
  return result;
}

uint64_t type metadata accessor for HomeSettingsActor()
{
  return self;
}

uint64_t sub_1000B17D8()
{
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = sub_1000B4000();
  id v3 = [v1 initWithSuiteName:v2];

  if (!v3) {
    id v3 = [self standardUserDefaults];
  }
  *(void *)(v0 + 16) = v3;
  id v4 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v5 = sub_1000B4000();
  id v6 = [v4 initWithSuiteName:v5];

  if (!v6) {
    id v6 = [self standardUserDefaults];
  }
  *(void *)(v0 + 24) = v6;
  return v0;
}

uint64_t type metadata accessor for UserHomeSettings()
{
  return self;
}

HomeWidgetCore::RecommendedWidgetIdentity __swiftcall RecommendedWidgetIdentity.init(ids:)(Swift::OpaquePointer_optional ids)
{
  uint64_t v1 = sub_1000B19A8((uint64_t)ids.value._rawValue);
  id v3 = v2;
  swift_bridgeObjectRelease();
  id v4 = (void *)0x80000001000B93A0;
  uint64_t v5 = v1;
  id v6 = v3;
  uint64_t v7 = 0xD000000000000021;
  result.widgetKind._object = v4;
  result.widgetKind._countAndFlagsBits = v7;
  result.uniqueIdentifier._object = v6;
  result.uniqueIdentifier._countAndFlagsBits = v5;
  return result;
}

uint64_t RecommendedWidgetIdentity.uniqueIdentifier.getter(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000B19A8(uint64_t a1)
{
  uint64_t v2 = sub_1000B2F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004210(&qword_1000D5008);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)IFObjectHasher) init];
  if (a1)
  {
    uint64_t v10 = *(void *)(a1 + 16);
    if (v10)
    {
      id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      uint64_t v11 = v3 + 16;
      uint64_t v25 = v12;
      uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
      uint64_t v22 = *(void *)(v11 + 56);
      uint64_t v23 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
      unint64_t v20 = (void (**)(char *, uint64_t))(v11 - 8);
      os_log_type_t v21 = (void (**)(char *, char *, uint64_t))(v11 + 16);
      v19[2] = a1;
      swift_bridgeObjectRetain();
      uint64_t v24 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 40);
      v19[1] = (v11 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      while (1)
      {
        v25(v8, v13, v2);
        uint64_t v14 = *v24;
        (*v24)(v8, 0, 1, v2);
        if ((*v23)(v8, 1, v2) == 1) {
          break;
        }
        (*v21)(v5, v8, v2);
        sub_1000B2F30();
        NSString v15 = sub_1000B4000();
        swift_bridgeObjectRelease();

        (*v20)(v5, v2);
        v13 += v22;
        if (!--v10) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      swift_bridgeObjectRetain();
LABEL_9:
      v14(v8, 1, 1, v2);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = sub_1000B4000();
  }
  id v26 = [v9 finalize];
  uint64_t v17 = sub_1000B4800();

  return v17;
}

uint64_t RecommendedWidgetIdentity.widgetKind.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t static RecommendedWidgetIdentity.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6 || (v12 = sub_1000B4830(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_1000B4830();
    }
  }
  return result;
}

uint64_t RecommendedWidgetIdentity.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1000B4070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1000B4070();

  return swift_bridgeObjectRelease();
}

Swift::Int RecommendedWidgetIdentity.hashValue.getter()
{
  return sub_1000B48F0();
}

uint64_t sub_1000B1ED8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000B1F08()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000B1F38(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_1000B4830(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_1000B4830();
    }
  }
  return result;
}

Swift::Int sub_1000B1FDC()
{
  return sub_1000B48F0();
}

uint64_t sub_1000B2064()
{
  swift_bridgeObjectRetain();
  sub_1000B4070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1000B4070();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000B20E8()
{
  return sub_1000B48F0();
}

unint64_t sub_1000B2170()
{
  unint64_t result = qword_1000D7AD0;
  if (!qword_1000D7AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D7AD0);
  }
  return result;
}

uint64_t destroy for RecommendedWidgetIdentity()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RecommendedWidgetIdentity(void *a1, void *a2)
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

void *assignWithCopy for RecommendedWidgetIdentity(void *a1, void *a2)
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

__n128 initializeWithTake for RecommendedWidgetIdentity(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for RecommendedWidgetIdentity(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for RecommendedWidgetIdentity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RecommendedWidgetIdentity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RecommendedWidgetIdentity()
{
  return &type metadata for RecommendedWidgetIdentity;
}

uint64_t sub_1000B239C()
{
  return sub_1000B2548(1);
}

uint64_t sub_1000B23A4(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_1000DCAA8 == -1)
  {
    if (qword_1000DCAB0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_1000DCAA8, 0, (dispatch_function_t)sub_1000B2540);
    if (qword_1000DCAB0) {
      return _availability_version_check();
    }
  }
  if (qword_1000DCAA0 == -1)
  {
    BOOL v8 = dword_1000DCA90 < a2;
    if (dword_1000DCA90 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_1000DCAA0, 0, (dispatch_function_t)sub_1000B239C);
    BOOL v8 = dword_1000DCA90 < a2;
    if (dword_1000DCA90 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_1000DCA94 > a3) {
    return 1;
  }
  return dword_1000DCA94 >= a3 && dword_1000DCA98 >= a4;
}

uint64_t sub_1000B2540()
{
  return sub_1000B2548(0);
}

uint64_t sub_1000B2548(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_1000DCAB0;
  if (qword_1000DCAB0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_1000DCAB0 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            char v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                id v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    BOOL v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      __n128 result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        char v12 = (FILE *)result;
                        __n128 result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          char v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            NSString v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            NSString v16 = malloc(v15);
                            if (v16)
                            {
                              id v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  id v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_1000DCA90, &dword_1000DCA94, &dword_1000DCA98);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    id v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  id v19 = v13;
                                }
                                NSString v16 = v26;
                              }
                              else
                              {
                                NSString v16 = v26;
                                id v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          id v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
  return result;
}

uint64_t sub_1000B28A0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000B28B0()
{
  return static AppIntent.lnMetadata.getter();
}

uint64_t sub_1000B28C0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000B28D0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000B28E0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000B28F0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000B2910()
{
  return AppIntent.lnAction.getter();
}

uint64_t sub_1000B2920()
{
  return IntentItem.value.getter();
}

uint64_t sub_1000B2930()
{
  return IntentItem.init(_:title:subtitle:image:)();
}

uint64_t sub_1000B2960()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000B2970()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000B2980()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000B2990()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000B29A0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000B29B0()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_1000B29C0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000B29D0()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)();
}

uint64_t sub_1000B29E0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000B29F0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000B2A00()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000B2A10()
{
  return IntentProjection.subscript.getter();
}

uint64_t sub_1000B2A20()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_1000B2A30()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000B2A40()
{
  return IntentItemSection.description.getter();
}

uint64_t sub_1000B2A50()
{
  return IntentItemSection.items.getter();
}

uint64_t sub_1000B2A70()
{
  return IntentItemSection.init(_:items:)();
}

uint64_t sub_1000B2A80()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sectionsBuilder:)();
}

uint64_t sub_1000B2A90()
{
  return IntentItemCollection.init<>(promptLabel:usesIndexedCollation:items:)();
}

uint64_t sub_1000B2AA0()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
}

uint64_t sub_1000B2AB0()
{
  return URLRepresentableEnum.urlRepresentation.getter();
}

uint64_t sub_1000B2AC0()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_1000B2AD0()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_1000B2AE0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000B2AF0()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_1000B2B00()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000B2B10()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000B2B20()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000B2B30()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000B2B40()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000B2B60()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000B2B70()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)();
}

uint64_t sub_1000B2B80()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)();
}

uint64_t sub_1000B2B90()
{
  return IntentParameterSummary.init(_:)();
}

uint64_t sub_1000B2BB0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000B2BC0()
{
  return static ParameterSummaryBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000B2BD0()
{
  return static ParameterSummaryBuilder.buildExpression<A>(_:)();
}

uint64_t sub_1000B2BF0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000B2C00()
{
  return IntentParameterDependency.wrappedValue.getter();
}

uint64_t sub_1000B2C10()
{
  return IntentParameterDependency.__allocating_init<A, B>(_:)();
}

uint64_t sub_1000B2C20()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000B2C30()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000B2C40()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000B2C60()
{
  return type metadata accessor for HasValueComparisonOperator();
}

uint64_t sub_1000B2C70()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t sub_1000B2C80()
{
  return type metadata accessor for EquatableComparisonOperator();
}

uint64_t sub_1000B2CA0()
{
  return ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)();
}

uint64_t sub_1000B2CB0()
{
  return ParameterSummaryWhenCondition.init<A, B>(_:_:_:_:otherwise:)();
}

uint64_t sub_1000B2CC0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000B2CD0()
{
  return JSONDecoder.init()();
}

uint64_t sub_1000B2CE0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1000B2CF0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_1000B2D00()
{
  return JSONEncoder.init()();
}

uint64_t sub_1000B2D10()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_1000B2D20()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_1000B2D30()
{
  return Measurement<>.FormatStyle.format(_:)();
}

uint64_t sub_1000B2D40()
{
  return static Measurement<>.FormatStyle.UnitWidth.narrow.getter();
}

uint64_t sub_1000B2D50()
{
  return Measurement<>.FormatStyle<>.init(width:locale:usage:hidesScaleName:numberFormatStyle:)();
}

uint64_t sub_1000B2D60()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000B2D70()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000B2D80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000B2D90()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000B2DA0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000B2DB0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_1000B2DC0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000B2DD0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000B2DE0()
{
  return FloatingPointFormatStyle.init(locale:)();
}

uint64_t sub_1000B2DF0()
{
  return FloatingPointFormatStyle.precision(_:)();
}

uint64_t sub_1000B2E00()
{
  return static MeasurementFormatUnitUsage<>.weather.getter();
}

uint64_t sub_1000B2E10()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength(_:)();
}

uint64_t sub_1000B2E20()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

void sub_1000B2E30(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000B2E40()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000B2E50()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B2E60(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_1000B2E70()
{
  return URL.scheme.getter();
}

uint64_t sub_1000B2E80()
{
  return URL.init(string:)();
}

uint64_t sub_1000B2E90()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000B2EA0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_1000B2EB0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000B2EC0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B2ED0()
{
  return Data.write(to:options:)();
}

uint64_t sub_1000B2EE0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_1000B2EF0()
{
  return static Date.now.getter();
}

uint64_t sub_1000B2F00()
{
  return Date.init()();
}

uint64_t sub_1000B2F10()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000B2F20()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_1000B2F30()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000B2F40()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_1000B2F50()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B2F60()
{
  return type metadata accessor for UUID();
}

NSLocale sub_1000B2F70()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_1000B2F80()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_1000B2F90()
{
  return static Locale.current.getter();
}

uint64_t sub_1000B2FA0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000B2FB0()
{
  return StaticHome.id.getter();
}

unint64_t sub_1000B2FC0(HMHomeManager from)
{
  return (unint64_t)StaticHome.get(from:)(from);
}

uint64_t sub_1000B2FE0()
{
  return StaticHome.name.getter();
}

uint64_t sub_1000B2FF0()
{
  return type metadata accessor for StaticHome();
}

uint64_t sub_1000B3010()
{
  return static WidgetDataModel.configuration.getter();
}

uint64_t sub_1000B3020()
{
  return static WidgetDataModel.configuration.setter();
}

uint64_t sub_1000B3050()
{
  return static WidgetDataModel.shared.getter();
}

uint64_t sub_1000B3060()
{
  return type metadata accessor for WidgetDataModel();
}

uint64_t sub_1000B3080()
{
  return static DataModel.signposter.getter();
}

uint64_t sub_1000B3090()
{
  return dispatch thunk of DataModel.homeManager.getter();
}

uint64_t sub_1000B30A0()
{
  return dispatch thunk of DataModel.homeManager.setter();
}

uint64_t sub_1000B30B0()
{
  return static DataModel.modelLogger.getter();
}

uint64_t sub_1000B30D0()
{
  return dispatch thunk of DataModel.homesToStateSnapshots.getter();
}

uint64_t sub_1000B30E0()
{
  return static DataModel.shared.getter();
}

uint64_t sub_1000B30F0()
{
  return static DataModel.context.getter();
}

uint64_t sub_1000B3100()
{
  return static DataModel.context.setter();
}

uint64_t sub_1000B3110()
{
  return type metadata accessor for DataModel();
}

uint64_t sub_1000B3120()
{
  return IconSymbol.onStateSymbolName.getter();
}

uint64_t sub_1000B3130()
{
  return IconSymbol.offStateSymbolName.getter();
}

uint64_t sub_1000B3140()
{
  return IconSymbol.init(rawValue:)();
}

uint64_t sub_1000B3150()
{
  return type metadata accessor for IconSymbol();
}

uint64_t sub_1000B3160()
{
  return ServiceKind.foregroundColor.getter();
}

uint64_t sub_1000B3170()
{
  return ServiceKind.iconSymbolActivated.getter();
}

uint64_t sub_1000B3180()
{
  return ServiceKind.localizedDescription.getter();
}

uint64_t sub_1000B3190()
{
  return ServiceKind.iconSymbolDeactivated.getter();
}

uint64_t sub_1000B31A0()
{
  return type metadata accessor for ServiceKind();
}

uint64_t sub_1000B31B0()
{
  return static WidgetActor.shared.getter();
}

uint64_t sub_1000B31C0()
{
  return type metadata accessor for WidgetActor();
}

uint64_t sub_1000B31D0()
{
  return EndpointPath.init(nodeID:endpointID:)();
}

uint64_t sub_1000B31E0()
{
  return type metadata accessor for EndpointPath();
}

uint64_t sub_1000B31F0()
{
  return BasicIdentity.init(uniqueIdentifier:widgetKind:)();
}

uint64_t sub_1000B3200()
{
  return StateSnapshot.staticHome.getter();
}

uint64_t sub_1000B3210()
{
  return static StateSnapshot.WidgetTileBehavior.== infix(_:_:)();
}

uint64_t sub_1000B3220()
{
  return type metadata accessor for StateSnapshot.Coverage();
}

uint64_t sub_1000B3230()
{
  return StateSnapshot.coverages.getter();
}

uint64_t sub_1000B3240()
{
  return type metadata accessor for StateSnapshot();
}

uint64_t sub_1000B3250()
{
  return WidgetRefresh.init(homeID:configuration:filtered:)();
}

uint64_t sub_1000B3260()
{
  return AnalyticsEvent.payload()();
}

void sub_1000B3270()
{
}

uint64_t sub_1000B3280()
{
  return dispatch thunk of SortableByName.name.getter();
}

uint64_t sub_1000B3290()
{
  return AnyTileInfoBearer.isReachable.getter();
}

uint64_t sub_1000B32A0()
{
  return AnyTileInfoBearer.foregroundColor.getter();
}

uint64_t sub_1000B32B0()
{
  return AnyTileInfoBearer.name.getter();
}

uint64_t sub_1000B32C0()
{
  return AnyTileInfoBearer.roomName.getter();
}

uint64_t sub_1000B32D0()
{
  return AnyTileInfoBearer.tileIcon.getter();
}

uint64_t sub_1000B32E0()
{
  return type metadata accessor for AnyTileInfoBearer();
}

uint64_t sub_1000B32F0()
{
  return AnyTileInfoBearer.init<A>(_:)();
}

uint64_t sub_1000B3300()
{
  return static ClimateSummarizer.temperatureAverageString(_:)();
}

uint64_t sub_1000B3310()
{
  return CharacteristicKind.humanReadableDescription.getter();
}

uint64_t sub_1000B3320()
{
  return type metadata accessor for CharacteristicKind();
}

uint64_t sub_1000B3330()
{
  return DeviceDisplayNames.displayName.getter();
}

uint64_t sub_1000B3340()
{
  return DeviceDisplayNames.init(name:roomName:)();
}

uint64_t sub_1000B3350()
{
  return type metadata accessor for DeviceDisplayNames();
}

uint64_t sub_1000B3360()
{
  return StaticMatterDevice.isActivated.getter();
}

uint64_t sub_1000B3370()
{
  return StaticMatterDevice.canBeToggled.getter();
}

uint64_t sub_1000B3380()
{
  return StaticMatterDevice.statusString.getter();
}

uint64_t sub_1000B3390()
{
  return StaticMatterDevice.nodeId.getter();
}

uint64_t sub_1000B33A0()
{
  return StaticMatterDevice.endpoints.getter();
}

uint64_t sub_1000B33B0()
{
  return type metadata accessor for StaticMatterDevice();
}

uint64_t sub_1000B33C0()
{
  return StaticRenderingMode.symbolRenderingMode.getter();
}

uint64_t sub_1000B33D0()
{
  return type metadata accessor for StaticRenderingMode();
}

uint64_t sub_1000B33E0()
{
  return static WidgetRefreshOptions.all.getter();
}

uint64_t sub_1000B33F0()
{
  return type metadata accessor for WidgetRefreshOptions();
}

uint64_t sub_1000B3400()
{
  return type metadata accessor for WidgetSnapshotModerator.UpdateType();
}

uint64_t sub_1000B3410()
{
  return WidgetSnapshotModerator.homeManager.getter();
}

uint64_t sub_1000B3440()
{
  return type metadata accessor for WidgetSnapshotModerator();
}

uint64_t sub_1000B3450()
{
  return Icon.tileOnStateIconInfo.getter();
}

uint64_t sub_1000B3460()
{
  return Icon.tileOffStateIconInfo.getter();
}

uint64_t sub_1000B3470()
{
  return Icon.Info.renderingMode.getter();
}

uint64_t sub_1000B3480()
{
  return Icon.Info.name.getter();
}

uint64_t sub_1000B3490()
{
  return type metadata accessor for Icon.Info();
}

uint64_t sub_1000B34A0()
{
  return type metadata accessor for Icon();
}

uint64_t sub_1000B34B0()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_1000B34C0()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_1000B34D0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1000B34E0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_1000B34F0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_1000B3500()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_1000B3510()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_1000B3520()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_1000B3530()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_1000B3540()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_1000B3550()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000B3560()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000B3570()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000B3580()
{
  return DISPATCHER_SERVICE_REFRESH_TIMEOUT.getter();
}

uint64_t sub_1000B3590()
{
  return TextWithSmallTrailingPercentIfNeeded.init(string:font:)();
}

uint64_t sub_1000B35A0()
{
  return type metadata accessor for TextWithSmallTrailingPercentIfNeeded();
}

uint64_t sub_1000B35B0()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_1000B35C0()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t sub_1000B35D0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000B35E0()
{
  return ShapeStyle._apply(to:)();
}

uint64_t sub_1000B35F0()
{
  return static ShapeStyle._apply(to:)();
}

uint64_t sub_1000B3610()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_1000B3620()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1000B3630()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000B3640()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_1000B3650()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000B3660()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000B3670()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1000B3680()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_1000B3690()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000B36A0()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t sub_1000B36B0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000B36C0()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000B36D0()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000B36E0()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_1000B36F0()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_1000B3700()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000B3710()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000B3720()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000B3730()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000B3740()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000B3750()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000B3760()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_1000B3770()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000B3780()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000B3790()
{
  return EnvironmentValues.widgetContentMargins.getter();
}

uint64_t sub_1000B37A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000B37B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000B37C0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000B37D0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000B37E0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000B37F0()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_1000B3800()
{
  return static VerticalAlignment.center.getter();
}

void sub_1000B3810(Swift::String a1)
{
}

void sub_1000B3820(Swift::String a1)
{
}

uint64_t sub_1000B3830()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000B3840()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_1000B3850()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000B3860()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000B3870()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_1000B3880()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000B3890()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000B38A0()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_1000B38B0()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_1000B38C0()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_1000B38D0()
{
  return WidgetConfiguration.supportsVibrantContent(_:)();
}

uint64_t sub_1000B38E0()
{
  return WidgetConfiguration._contentMarginsDisabled()();
}

uint64_t sub_1000B38F0()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_1000B3900()
{
  return WidgetConfiguration.preferredBackgroundStyle(_:)();
}

uint64_t sub_1000B3910()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_1000B3920()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000B3930()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_1000B3940()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_1000B3950()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_1000B3960()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_1000B3970()
{
  return ToggleStyleConfiguration.isOn.getter();
}

uint64_t sub_1000B3980()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_1000B3990()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_1000B39A0()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_1000B39B0()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1000B39C0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000B39D0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000B39E0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000B39F0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000B3A00()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_1000B3A10()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_1000B3A20()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_1000B3A30()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_1000B3A40()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000B3A50()
{
  return Font.bold()();
}

uint64_t sub_1000B3A60()
{
  return static Font.title.getter();
}

uint64_t sub_1000B3A70()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000B3A80()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_1000B3A90()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_1000B3AA0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000B3AB0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000B3AC0()
{
  return Font.weight(_:)();
}

uint64_t sub_1000B3AD0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_1000B3AE0()
{
  return Font.leading(_:)();
}

uint64_t sub_1000B3AF0()
{
  return static Font.caption2.getter();
}

uint64_t sub_1000B3B00()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000B3B10()
{
  return Link.init(destination:label:)();
}

uint64_t sub_1000B3B20()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_1000B3B30()
{
  return static Text.Sizing.uniformLineHeight.getter();
}

uint64_t sub_1000B3B40()
{
  return type metadata accessor for Text.Sizing();
}

uint64_t sub_1000B3B50()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000B3B60()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000B3B70()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000B3B80()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000B3B90()
{
  return View.textSizing(_:)();
}

uint64_t sub_1000B3BA0()
{
  return View.toggleStyle<A>(_:)();
}

uint64_t sub_1000B3BB0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000B3BC0()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_1000B3BD0()
{
  return View.monospacedDigit()();
}

uint64_t sub_1000B3BE0()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_1000B3BF0()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000B3C00()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_1000B3C10()
{
  return static Color.homeAccentColor.getter();
}

uint64_t sub_1000B3C20()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_1000B3C30()
{
  return static Color.== infix(_:_:)();
}

uint64_t sub_1000B3C40()
{
  return Color.hash(into:)();
}

uint64_t sub_1000B3C50()
{
  return static Color.black.getter();
}

uint64_t sub_1000B3C60()
{
  return static Color.clear.getter();
}

uint64_t sub_1000B3C70()
{
  return static Color.white.getter();
}

uint64_t sub_1000B3C80()
{
  return static Color.orange.getter();
}

uint64_t sub_1000B3C90()
{
  return static Color.yellow.getter();
}

uint64_t sub_1000B3CA0()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000B3CB0()
{
  return static Color.primary.getter();
}

uint64_t sub_1000B3CC0()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000B3CD0()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000B3CE0()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_1000B3CF0()
{
  return Color.init(_:)();
}

uint64_t sub_1000B3D00()
{
  return Color.init<A>(_:)();
}

uint64_t sub_1000B3D10()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000B3D20()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1000B3D30()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_1000B3D40()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_1000B3D50()
{
  return Toggle.init<A>(isOn:intent:label:)();
}

uint64_t sub_1000B3D60()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000B3D70()
{
  return static Material.ultraThick.getter();
}

uint64_t sub_1000B3D80()
{
  return static Material.thin.getter();
}

uint64_t sub_1000B3D90()
{
  return type metadata accessor for Material();
}

uint64_t sub_1000B3DA0()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000B3DB0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_1000B3DC0()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_1000B3DD0()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_1000B3DE0()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_1000B3DF0()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t sub_1000B3E00()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_1000B3E10()
{
  return static WidgetRenderingMode.fullColor.getter();
}

uint64_t sub_1000B3E20()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1000B3E30()
{
  return type metadata accessor for WidgetBackgroundStyle();
}

uint64_t sub_1000B3E40()
{
  return WidgetFamily.rawValue.getter();
}

uint64_t sub_1000B3E50()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000B3E60()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000B3E70()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_1000B3E80()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_1000B3E90()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_1000B3EA0()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_1000B3EB0()
{
  return AppIntentTimelineProvider.getTimeline(for:in:completion:)();
}

uint64_t sub_1000B3ED0()
{
  return AppIntentTimelineProvider.getSnapshot(for:in:completion:)();
}

uint64_t sub_1000B3EE0()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_1000B3F00()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_1000B3F10()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_1000B3F20()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000B3F30()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B3F40()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000B3F50()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000B3F60()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000B3F70()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000B3F80()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_1000B3F90()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_1000B3FA0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_1000B3FB0(Swift::String a1)
{
}

void sub_1000B3FC0(Swift::String a1)
{
}

uint64_t sub_1000B3FD0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000B3FE0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_1000B3FF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000B4000()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000B4010()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B4020()
{
  return String.init(format:arguments:)();
}

uint64_t sub_1000B4030()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000B4040()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000B4050()
{
  return static String.hfLocalized(_:)();
}

uint64_t sub_1000B4060()
{
  return String.serviceKind.getter();
}

uint64_t sub_1000B4070()
{
  return String.hash(into:)();
}

uint64_t sub_1000B4080()
{
  return String.count.getter();
}

void sub_1000B4090(Swift::String a1)
{
}

Swift::Int sub_1000B40A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000B40B0()
{
  return Sequence<>.sortedFromUUIDs<A>(uuidBlock:fallbackBlock:uuids:)();
}

uint64_t sub_1000B40C0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000B40D0()
{
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t sub_1000B40E0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000B40F0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000B4100()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B4110()
{
  return Array.description.getter();
}

uint64_t sub_1000B4120()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000B4130()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000B4140()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000B4150()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000B4160()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_1000B4170()
{
  return Bool.init(truncating:)();
}

uint64_t sub_1000B4180()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000B4190()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000B41A0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000B41B0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000B41C0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000B41D0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000B41E0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000B41F0()
{
  return Set.description.getter();
}

uint64_t sub_1000B4200()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000B4210()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_1000B4220()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_1000B4230()
{
  return static Collection<>.all.getter();
}

uint64_t sub_1000B4240()
{
  return Collection<>.usableByWidgets.getter();
}

uint64_t sub_1000B4250()
{
  return Collection<>.widgetBehavior.getter();
}

uint64_t sub_1000B4260()
{
  return HMAccessory.staticMatterDevice.getter();
}

uint64_t sub_1000B4270()
{
  return HMAccessory.showAsIndividualTiles.getter();
}

uint64_t sub_1000B4280()
{
  return HMActionSet.iconSymbol.getter();
}

uint64_t sub_1000B4290()
{
  return HMHomeManager.homesSortOrder.getter();
}

uint64_t sub_1000B42A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000B42B0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000B42C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000B42D0()
{
  return HMCharacteristic.characteristicKind.getter();
}

uint64_t sub_1000B42E0()
{
  return NSUnitTemperature.init(forLocale:usage:)();
}

uint64_t sub_1000B42F0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_1000B4300()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_1000B4320()
{
  return HFAccessoryRepresentable.isMatterOnlyAccessory.getter();
}

uint64_t sub_1000B4330()
{
  return static HMHomeManagerConfiguration.widgetConfiguration.getter();
}

uint64_t sub_1000B4340()
{
  return HMHome.id.getter();
}

BOOL sub_1000B4350(HMUser forRestrictedUser)
{
  return HMHome.shouldShowNoAccessOutsideOfSchedule(forRestrictedUser:)(forRestrictedUser);
}

NSNumber sub_1000B4360(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_1000B4370(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_1000B4380(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000B4390()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000B43A0()
{
  return NSObject.hash(into:)();
}

uint64_t sub_1000B43B0()
{
  return HMService.serviceKind.getter();
}

uint64_t sub_1000B43C0()
{
  return HMService.characteristic(for:)();
}

uint64_t sub_1000B43D0()
{
  return HMService.customIconSFSymbol.getter();
}

uint64_t sub_1000B43E0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_1000B43F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000B4400()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000B4410()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000B4420()
{
  return StringProtocol.localizedLowercase.getter();
}

uint64_t sub_1000B4430()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1000B4440()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_1000B4450()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t sub_1000B4460()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000B4470()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000B4480()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000B4490()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000B44A0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1000B44B0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000B44C0()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_1000B44D0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_1000B44E0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1000B44F0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000B4500()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000B4510()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_1000B4520()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_1000B4530()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int sub_1000B4540(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000B4550()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000B4560()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000B4580()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000B4590()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000B45A0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_1000B45B0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000B45C0(Swift::Int a1)
{
}

uint64_t sub_1000B45D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000B45E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000B45F0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000B4600()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1000B4610()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1000B4620()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000B4630()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000B4640()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000B4650()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000B4660()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000B4670()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000B4680()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000B4690()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000B46A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000B46B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000B46C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000B46D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000B46E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000B46F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000B4700()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000B4710()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1000B4720()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000B4730()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000B4740()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000B4750()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000B4760()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000B4770()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1000B4780()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000B4790()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000B47A0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000B47B0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000B47C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000B47D0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000B47E0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_1000B47F0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000B4800()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000B4820()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000B4830()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000B4840()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000B4850()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_1000B4860()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000B4870()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000B4880()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000B4890()
{
  return Error._code.getter();
}

uint64_t sub_1000B48A0()
{
  return Error._domain.getter();
}

uint64_t sub_1000B48B0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000B48C0()
{
  return Hasher.init(_seed:)();
}

void sub_1000B48D0(Swift::UInt a1)
{
}

void sub_1000B48E0(Swift::UInt8 a1)
{
}

Swift::Int sub_1000B48F0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000B4900()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000B4910()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t HMStringFromHomeLocation()
{
  return _HMStringFromHomeLocation();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}