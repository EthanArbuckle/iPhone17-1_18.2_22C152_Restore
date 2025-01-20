void *sub_1000B301C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_100032FA0(&qword_1001580F0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  v10 = 1 << *(unsigned char *)(v2 + 32);
  v11 = -1;
  if (v10 < 64) {
    v11 = ~(-1 << v10);
  }
  v12 = v11 & *(void *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    result = (void *)swift_retain();
  }
  v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000B31C8()
{
  v1 = v0;
  sub_100032FA0(&qword_100155580);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000B337C()
{
  v1 = v0;
  sub_100032FA0(&qword_100155578);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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

uint64_t sub_1000B3510()
{
  uint64_t v1 = *v0;
  sub_100032FA0(&qword_1001580F0);
  uint64_t v2 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v24 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v25 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v12 = v11 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v25) {
      goto LABEL_33;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v9;
    if (!v14)
    {
      int64_t v9 = v13 + 1;
      if (v13 + 1 >= v25) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v9);
      if (!v14)
      {
        int64_t v9 = v13 + 2;
        if (v13 + 2 >= v25) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v9);
        if (!v14) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v9 << 6);
LABEL_24:
    uint64_t v16 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    Hasher.init(_seed:)();
    type metadata accessor for SchemaV1.HistoryRecord();
    sub_100034378(&qword_100154C58, (void (*)(uint64_t))type metadata accessor for SchemaV1.HistoryRecord);
    swift_retain();
    dispatch thunk of Hashable.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v17 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v7 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v18) & ~*(void *)(v7 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v7 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v10 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(void *)(*(void *)(v3 + 48) + 8 * v10) = v16;
    ++*(void *)(v3 + 16);
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v25)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    int64_t v9 = v15;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v25) {
      goto LABEL_33;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v9);
    ++v15;
    if (v14) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000B381C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100032FA0(&qword_100155580);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000B3ACC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100032FA0(&qword_100155578);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v18);
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1000B3D60()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 18) = *(unsigned char *)(v0 + 24);
}

char *sub_1000B3D78(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (char *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    char v8 = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    uint64_t v10 = a3[7];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v9;
    uint64_t v13 = type metadata accessor for EditMode();
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v31(v11, v12, v13);
    uint64_t v14 = sub_100032FA0(&qword_1001580F8);
    *(void *)(v11 + *(int *)(v14 + 28)) = *(void *)(v12 + *(int *)(v14 + 28));
    uint64_t v15 = a3[8];
    uint64_t v16 = a3[9];
    int64_t v17 = &v4[v15];
    Swift::UInt v18 = (char *)a2 + v15;
    char *v17 = *v18;
    *((void *)v17 + 1) = *((void *)v18 + 1);
    uint64_t v19 = &v4[v16];
    unint64_t v20 = (char *)a2 + v16;
    char *v19 = *v20;
    *((void *)v19 + 1) = *((void *)v20 + 1);
    uint64_t v21 = a3[10];
    uint64_t v22 = a3[11];
    unint64_t v23 = &v4[v21];
    BOOL v24 = (char *)a2 + v21;
    *unint64_t v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = &v4[v22];
    uint64_t v26 = (uint64_t)a2 + v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v27 = sub_100032FA0(&qword_100156688);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16);
    v28(v25, v26, v27);
    v28(&v4[a3[12]], (uint64_t)a2 + a3[12], v27);
  }
  return v4;
}

uint64_t sub_1000B3FA0(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for EditMode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = sub_100032FA0(&qword_1001580F8);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_retain();
  swift_release();
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[11];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = sub_100032FA0(&qword_100156688);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 24);
  v26(v23, v24, v25);
  v26(a1 + a3[12], a2 + a3[12], v25);
  return a1;
}

uint64_t sub_1000B41B4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for EditMode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = sub_100032FA0(&qword_1001580F8);
  *(void *)(v7 + *(int *)(v10 + 28)) = *(void *)(v8 + *(int *)(v10 + 28));
  uint64_t v11 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  uint64_t v12 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100032FA0(&qword_100156688);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(a1 + a3[12], a2 + a3[12], v15);
  return a1;
}

uint64_t sub_1000B4308(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for EditMode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = sub_100032FA0(&qword_1001580F8);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_release();
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_release();
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_release();
  uint64_t v22 = a3[11];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = sub_100032FA0(&qword_100156688);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40);
  v26(v23, v24, v25);
  v26(a1 + a3[12], a2 + a3[12], v25);
  return a1;
}

uint64_t sub_1000B44DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B44F0);
}

uint64_t sub_1000B44F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100032FA0(&qword_1001580F8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100032FA0(&qword_100156688);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 44);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000B4624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B4638);
}

uint64_t sub_1000B4638(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100032FA0(&qword_1001580F8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100032FA0(&qword_100156688);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 44);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_1000B476C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000B4788@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v111 = a1;
  uint64_t v3 = type metadata accessor for PPTTestCase.Name();
  uint64_t v109 = *(void *)(v3 - 8);
  uint64_t v110 = v3;
  __chkstk_darwin(v3);
  v108 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for AccessibilityTraits();
  uint64_t v107 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  v106 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v96 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  v95 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CalculatorHistoryView();
  uint64_t v115 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v115 + 64);
  __chkstk_darwin(v7 - 8);
  v99 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v98 = (uint64_t)&v86 - v10;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v86 - v12;
  uint64_t v114 = sub_100032FA0(&qword_1001581B8);
  __chkstk_darwin(v114);
  uint64_t v15 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100032FA0(&qword_1001581C0);
  uint64_t v16 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100032FA0(&qword_1001581C8);
  __chkstk_darwin(v92);
  uint64_t v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100032FA0(&qword_1001581D0);
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  v90 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_100032FA0(&qword_1001581D8);
  __chkstk_darwin(v118);
  v89 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v116 = (void (*)(char *, uint64_t, uint64_t))((char *)&v86 - v24);
  __chkstk_darwin(v25);
  v117 = (char *)&v86 - v26;
  uint64_t v27 = sub_100032FA0(&qword_1001581E0);
  uint64_t v104 = *(void *)(v27 - 8);
  uint64_t v105 = v27;
  __chkstk_darwin(v27);
  v102 = (char *)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_100032FA0(&qword_1001581E8);
  uint64_t v101 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  v100 = (char *)&v86 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v15 = static HorizontalAlignment.center.getter();
  *((void *)v15 + 1) = 0;
  v15[16] = 0;
  uint64_t v30 = sub_100032FA0(&qword_1001581F0);
  sub_1000B5600(v1, (uint64_t)&v15[*(int *)(v30 + 44)]);
  char v31 = *(unsigned char *)(v1 + 8);
  uint64_t v32 = swift_retain();
  uint64_t v33 = sub_10003B8B4(v32, v31);
  swift_release();
  swift_getKeyPath();
  v119 = (void *)v33;
  uint64_t v86 = sub_1000121E8(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v34 = *(unsigned char *)(v33 + 16);
  swift_release();
  LOBYTE(v119) = v34;
  uint64_t v35 = v2;
  sub_10003D9E4(v2, (uint64_t)v13);
  uint64_t v36 = *(unsigned __int8 *)(v115 + 80);
  uint64_t v37 = (v36 + 16) & ~v36;
  uint64_t v38 = v37 + v8;
  uint64_t v39 = v36 | 7;
  uint64_t v40 = swift_allocObject();
  uint64_t v115 = v37;
  v87 = v13;
  sub_1000BD978((uint64_t)v13, v40 + v37);
  sub_100040BE4(&qword_1001581F8, &qword_1001581B8);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_100032F44((uint64_t)v15, &qword_1001581B8);
  if (qword_1001545A0 != -1) {
    swift_once();
  }
  uint64_t v114 = v38;
  uint64_t v41 = qword_1001611A8;
  uint64_t KeyPath = swift_getKeyPath();
  v119 = (void *)v41;
  swift_retain_n();
  uint64_t v43 = AnyShapeStyle.init<A>(_:)();
  uint64_t v44 = v91;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v18, v91);
  swift_release();
  v45 = (void *)v92;
  v46 = (uint64_t *)&v20[*(int *)(v92 + 36)];
  uint64_t *v46 = KeyPath;
  v46[1] = v43;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v44);
  v47 = v95;
  static AccessibilityChildBehavior.contain.getter();
  unint64_t v48 = sub_1000BDA64();
  v49 = v90;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v47, v97);
  sub_100032F44((uint64_t)v20, &qword_1001581C8);
  v119 = v45;
  unint64_t v120 = v48;
  swift_getOpaqueTypeConformance2();
  uint64_t v50 = (uint64_t)v89;
  uint64_t v51 = v94;
  View.accessibilityIdentifier(_:)();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v49, v51);
  LODWORD(v51) = _AXSAutomationEnabled();
  uint64_t v113 = v35;
  uint64_t v52 = v98;
  sub_10003D9E4(v35, v98);
  if (!v51)
  {
    uint64_t v53 = v52;
    char v54 = *(unsigned char *)(v52 + 8);
    uint64_t v55 = swift_retain();
    uint64_t v56 = v50;
    uint64_t v57 = sub_10003B8B4(v55, v54);
    swift_release();
    swift_getKeyPath();
    v119 = (void *)v57;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    uint64_t v52 = v53;
    swift_release();
    uint64_t v50 = v56;
    swift_release();
  }
  uint64_t v58 = v109;
  v59 = v106;
  uint64_t v60 = (uint64_t)v99;
  sub_1000BEDDC(v52, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
  ModifiedContent<>.accessibilityHidden(_:)();
  sub_100032F44(v50, &qword_1001581D8);
  int v61 = _AXSAutomationEnabled();
  sub_10003D9E4(v113, v60);
  uint64_t v112 = v39;
  if (v61)
  {
    sub_1000BEDDC(v60, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
  }
  else
  {
    char v62 = *(unsigned char *)(v60 + 8);
    uint64_t v63 = swift_retain();
    uint64_t v64 = sub_10003B8B4(v63, v62);
    swift_release();
    swift_getKeyPath();
    v119 = (void *)v64;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    int v65 = *(unsigned __int8 *)(v64 + 16);
    swift_release();
    sub_1000BEDDC(v60, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
    if (v65)
    {
      static AccessibilityTraits.isModal.getter();
      uint64_t v66 = (uint64_t)v87;
      uint64_t v67 = v88;
      goto LABEL_10;
    }
  }
  v119 = _swiftEmptyArrayStorage;
  sub_1000121E8(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_100032FA0(&qword_100155748);
  sub_100040BE4(&qword_100155750, &qword_100155748);
  uint64_t v67 = v88;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v66 = (uint64_t)v87;
LABEL_10:
  uint64_t v68 = (uint64_t)v116;
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v59, v67);
  sub_100032F44(v68, &qword_1001581D8);
  uint64_t v69 = v115;
  if (qword_1001544D0 != -1) {
    swift_once();
  }
  uint64_t v70 = v110;
  uint64_t v71 = sub_100021598(v110, (uint64_t)qword_100161088);
  v72 = v108;
  v116 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  v116(v108, v71, v70);
  uint64_t v73 = v113;
  sub_10003D9E4(v113, v66);
  uint64_t v74 = swift_allocObject();
  sub_1000BD978(v66, v74 + v69);
  unint64_t v75 = sub_1000BDB80();
  v76 = v102;
  uint64_t v77 = (uint64_t)v117;
  View.onTest(_:handler:)();
  uint64_t v78 = v70;
  swift_release();
  uint64_t v79 = v73;
  v80 = *(void (**)(char *, uint64_t))(v58 + 8);
  v80(v72, v78);
  sub_100032F44(v77, &qword_1001581D8);
  if (qword_1001544D8 != -1) {
    swift_once();
  }
  uint64_t v81 = sub_100021598(v78, (uint64_t)qword_1001610A0);
  v116(v72, v81, v78);
  sub_10003D9E4(v79, v66);
  uint64_t v82 = swift_allocObject();
  sub_1000BD978(v66, v82 + v115);
  v119 = (void *)v118;
  unint64_t v120 = v75;
  swift_getOpaqueTypeConformance2();
  v83 = v100;
  uint64_t v84 = v105;
  View.onTest(_:handler:)();
  swift_release();
  v80(v72, v78);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v76, v84);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v101 + 32))(v111, v83, v103);
}

uint64_t sub_1000B5600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v202 = a1;
  uint64_t v206 = a2;
  uint64_t v207 = sub_100032FA0(&qword_100158228);
  __chkstk_darwin(v207);
  uint64_t v179 = (uint64_t)&v153 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = type metadata accessor for OpacityTransition();
  uint64_t v161 = *(void *)(v165 - 8);
  __chkstk_darwin(v165);
  v159 = (char *)&v153 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = type metadata accessor for MoveTransition();
  uint64_t v158 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  v155 = (char *)&v153 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100032FA0(&qword_100158230);
  uint64_t v163 = *(void *)(v164 - 8);
  __chkstk_darwin(v164);
  v157 = (char *)&v153 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v160 = (char *)&v153 - v7;
  uint64_t v8 = sub_100032FA0(&qword_100158238);
  __chkstk_darwin(v8 - 8);
  uint64_t v156 = (uint64_t)&v153 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_100032FA0(&qword_100158240);
  uint64_t v176 = *(void *)(v180 - 8);
  __chkstk_darwin(v180);
  uint64_t v154 = (uint64_t)&v153 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = type metadata accessor for EditMode();
  uint64_t v167 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  v166 = (char *)&v153 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100158248);
  __chkstk_darwin(v12 - 8);
  uint64_t v177 = (uint64_t)&v153 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v178 = (char *)&v153 - v15;
  uint64_t v16 = sub_100032FA0(&qword_100158250);
  __chkstk_darwin(v16 - 8);
  uint64_t v175 = (uint64_t)&v153 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_100032FA0(&qword_100158258);
  __chkstk_darwin(v174);
  uint64_t v194 = (uint64_t)&v153 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v195 = (uint64_t)&v153 - v20;
  uint64_t v21 = sub_100032FA0(&qword_100158260);
  __chkstk_darwin(v21 - 8);
  v172 = (uint64_t *)((char *)&v153 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v169 = sub_100032FA0(&qword_100158268);
  __chkstk_darwin(v169);
  uint64_t v170 = (uint64_t)&v153 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100032FA0(&qword_100158270);
  __chkstk_darwin(v24 - 8);
  v173 = (uint64_t *)((char *)&v153 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v171 = sub_100032FA0(&qword_100158278);
  __chkstk_darwin(v171);
  uint64_t v192 = (uint64_t)&v153 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v193 = (uint64_t)&v153 - v28;
  uint64_t v190 = type metadata accessor for ControlSize();
  uint64_t v189 = *(void *)(v190 - 8);
  __chkstk_darwin(v190);
  v187 = (char *)&v153 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_100032FA0(&qword_100158280);
  uint64_t v184 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  v182 = (char *)&v153 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = sub_100032FA0(&qword_100158288);
  __chkstk_darwin(v181);
  v188 = (char *)&v153 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100032FA0(&qword_100158290);
  __chkstk_darwin(v32 - 8);
  uint64_t v185 = (uint64_t)&v153 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = sub_100032FA0(&qword_100158298);
  __chkstk_darwin(v200);
  uint64_t v183 = (uint64_t)&v153 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v191 = (uint64_t)&v153 - v36;
  uint64_t v201 = type metadata accessor for CalculatorHistoryView();
  __chkstk_darwin(v201);
  uint64_t v38 = (char *)&v153 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  uint64_t v41 = (char *)&v153 - v40;
  uint64_t v203 = sub_100032FA0(&qword_1001582A0);
  __chkstk_darwin(v203);
  uint64_t v205 = (uint64_t)&v153 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = sub_100032FA0(&qword_1001582A8);
  __chkstk_darwin(v197);
  uint64_t v198 = (uint64_t)&v153 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = sub_100032FA0(&qword_1001582B0);
  __chkstk_darwin(v204);
  v199 = (char *)&v153 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100032FA0(&qword_1001582B8);
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  unint64_t v48 = (char *)&v153 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_100032FA0(&qword_1001582C0);
  __chkstk_darwin(v196);
  uint64_t v50 = (char *)&v153 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v51);
  uint64_t v53 = (char *)&v153 - v52;
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v54 = qword_1001613A0;
  swift_getKeyPath();
  *(void *)&long long v214 = v54;
  sub_1000121E8((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v54 + 64) == 1)
  {
    uint64_t v55 = v202;
    sub_1000B703C(1, (uint64_t)v48);
    uint64_t v56 = (char *)(v55 + *(int *)(v201 + 40));
    char v57 = *v56;
    uint64_t v58 = *((void *)v56 + 1);
    LOBYTE(v208) = v57;
    uint64_t v209 = v58;
    sub_100032FA0(&qword_100154898);
    State.projectedValue.getter();
    long long v59 = v214;
    char v60 = v215;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v50, v48, v45);
    int v61 = &v50[*(int *)(v196 + 36)];
    *(_OWORD *)int v61 = v59;
    v61[16] = v60;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v45);
    sub_10002D9D0((uint64_t)v50, (uint64_t)v53, &qword_1001582C0);
    sub_100033344((uint64_t)v53, v198, &qword_1001582C0);
    swift_storeEnumTagMultiPayload();
    sub_1000BDFEC();
    sub_1000BE100(&qword_100158338, &qword_100158298, (void (*)(void))sub_1000BE334);
    uint64_t v62 = (uint64_t)v199;
    _ConditionalContent<>.init(storage:)();
    sub_100033344(v62, v205, &qword_1001582B0);
    swift_storeEnumTagMultiPayload();
    sub_1000BE428();
    sub_100040BE4(&qword_100158360, &qword_100158228);
    _ConditionalContent<>.init(storage:)();
    sub_100032F44(v62, &qword_1001582B0);
    uint64_t v63 = (uint64_t)v53;
    uint64_t v64 = &qword_1001582C0;
    return sub_100032F44(v63, v64);
  }
  uint64_t v65 = v202;
  char v66 = *(unsigned char *)(v202 + 8);
  uint64_t v67 = swift_retain();
  uint64_t v68 = sub_10003B8B4(v67, v66);
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v214 = v68;
  sub_1000121E8(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v69 = *(unsigned char *)(v68 + 16);
  swift_release();
  sub_10003D9E4(v65, (uint64_t)v41);
  if (v69)
  {
    sub_1000BEDDC((uint64_t)v41, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
    sub_10003D9E4(v65, (uint64_t)v38);
    uint64_t v70 = v201;
  }
  else
  {
    uint64_t v70 = v201;
    uint64_t v71 = &v41[*(int *)(v201 + 40)];
    char v72 = *v71;
    uint64_t v73 = *((void *)v71 + 1);
    LOBYTE(v214) = v72;
    *((void *)&v214 + 1) = v73;
    sub_100032FA0(&qword_100154898);
    State.wrappedValue.getter();
    sub_1000BEDDC((uint64_t)v41, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
    char v74 = v208;
    sub_10003D9E4(v65, (uint64_t)v38);
    if (v74)
    {
      sub_1000BEDDC((uint64_t)v38, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
LABEL_17:
      v127 = v182;
      ProgressView<>.init<>()();
      uint64_t v128 = v189;
      v129 = v187;
      uint64_t v130 = v190;
      (*(void (**)(char *, void, uint64_t))(v189 + 104))(v187, enum case for ControlSize.small(_:), v190);
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v132 = (uint64_t)v188;
      v133 = (uint64_t *)&v188[*(int *)(v181 + 36)];
      uint64_t v134 = sub_100032FA0(&qword_100157E60);
      (*(void (**)(char *, char *, uint64_t))(v128 + 16))((char *)v133 + *(int *)(v134 + 28), v129, v130);
      uint64_t *v133 = KeyPath;
      uint64_t v135 = v184;
      uint64_t v136 = v186;
      (*(void (**)(uint64_t, char *, uint64_t))(v184 + 16))(v132, v127, v186);
      (*(void (**)(char *, uint64_t))(v128 + 8))(v129, v130);
      (*(void (**)(char *, uint64_t))(v135 + 8))(v127, v136);
      uint64_t v137 = static Alignment.center.getter();
      uint64_t v138 = v185;
      sub_1000C3388(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v185, 0.0, 1, INFINITY, 0, v137, v139);
      sub_100032F44(v132, &qword_100158288);
      uint64_t v140 = v183;
      sub_100033344(v138, v183, &qword_100158290);
      v141 = (uint64_t (**)())(v140 + *(int *)(v200 + 36));
      *v141 = sub_1000B74D4;
      v141[1] = 0;
      sub_100032F44(v138, &qword_100158290);
      uint64_t v142 = v191;
      sub_10002D9D0(v140, v191, &qword_100158298);
      sub_100033344(v142, v198, &qword_100158298);
      swift_storeEnumTagMultiPayload();
      sub_1000BDFEC();
      sub_1000BE100(&qword_100158338, &qword_100158298, (void (*)(void))sub_1000BE334);
      uint64_t v143 = (uint64_t)v199;
      _ConditionalContent<>.init(storage:)();
      sub_100033344(v143, v205, &qword_1001582B0);
      swift_storeEnumTagMultiPayload();
      sub_1000BE428();
      sub_100040BE4(&qword_100158360, &qword_100158228);
      _ConditionalContent<>.init(storage:)();
      sub_100032F44(v143, &qword_1001582B0);
      uint64_t v63 = v142;
      uint64_t v64 = &qword_100158298;
      return sub_100032F44(v63, v64);
    }
  }
  uint64_t v75 = *((void *)v38 + 5);
  *(void *)&long long v214 = *((void *)v38 + 4);
  *((void *)&v214 + 1) = v75;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v76 = sub_10004CF90();
  swift_release();
  uint64_t v77 = *(void *)(v76 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v214 = v77;
  sub_1000121E8(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LOBYTE(v76) = *(unsigned char *)(v77 + 56);
  swift_release();
  sub_1000BEDDC((uint64_t)v38, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryView);
  if ((v76 & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v78 = static VerticalAlignment.center.getter();
  uint64_t v79 = (uint64_t)v173;
  uint64_t *v173 = v78;
  *(void *)(v79 + 8) = 0;
  *(unsigned char *)(v79 + 16) = 1;
  uint64_t v80 = v79 + *(int *)(sub_100032FA0(&qword_100158368) + 44);
  if (qword_100154270 != -1) {
    swift_once();
  }
  uint64_t v81 = qword_100160D58;
  uint64_t v82 = static VerticalAlignment.center.getter();
  uint64_t v83 = (uint64_t)v172;
  uint64_t *v172 = v82;
  *(void *)(v83 + 8) = v81;
  *(unsigned char *)(v83 + 16) = 0;
  uint64_t v84 = sub_100032FA0(&qword_100158370);
  sub_1000B93F8(v65, v83 + *(int *)(v84 + 44));
  char v85 = static Edge.Set.horizontal.getter();
  if (qword_100154278 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v87 = v86;
  uint64_t v89 = v88;
  uint64_t v91 = v90;
  uint64_t v93 = v92;
  uint64_t v94 = v170;
  sub_100033344(v83, v170, &qword_100158260);
  uint64_t v95 = v94 + *(int *)(v169 + 36);
  *(unsigned char *)uint64_t v95 = v85;
  *(void *)(v95 + 8) = v87;
  *(void *)(v95 + 16) = v89;
  *(void *)(v95 + 24) = v91;
  *(void *)(v95 + 32) = v93;
  *(unsigned char *)(v95 + 40) = 0;
  sub_100032F44(v83, &qword_100158260);
  sub_10002D9D0(v94, v80, &qword_100158268);
  static Alignment.center.getter();
  uint64_t v96 = 1;
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v97 = v192;
  sub_100033344(v79, v192, &qword_100158270);
  uint64_t v98 = (_OWORD *)(v97 + *(int *)(v171 + 36));
  long long v99 = v215;
  *uint64_t v98 = v214;
  v98[1] = v99;
  v98[2] = v216;
  sub_100032F44(v79, &qword_100158270);
  sub_10002D9D0(v97, v193, &qword_100158278);
  uint64_t v100 = v175;
  sub_1000B74FC(v175);
  uint64_t v101 = v65 + *(int *)(v70 + 40);
  char v102 = *(unsigned char *)v101;
  uint64_t v103 = *(void *)(v101 + 8);
  char v212 = v102;
  uint64_t v213 = v103;
  sub_100032FA0(&qword_100154898);
  State.projectedValue.getter();
  uint64_t v104 = v208;
  uint64_t v105 = v209;
  char v106 = v210;
  uint64_t v107 = v194;
  sub_100033344(v100, v194, &qword_100158250);
  uint64_t v108 = v107 + *(int *)(v174 + 36);
  *(void *)uint64_t v108 = v104;
  *(void *)(v108 + 8) = v105;
  *(unsigned char *)(v108 + 16) = v106;
  sub_100032F44(v100, &qword_100158250);
  sub_10002D9D0(v107, v195, &qword_100158258);
  LOBYTE(v104) = *(unsigned char *)(v65 + 8);
  uint64_t v109 = swift_retain();
  uint64_t v110 = sub_10003B8B4(v109, v104);
  swift_release();
  swift_getKeyPath();
  uint64_t v208 = v110;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v111 = *(unsigned __int8 *)(v110 + 17);
  swift_release();
  uint64_t v112 = (uint64_t)v178;
  if (v111 == 1)
  {
    sub_100032FA0(&qword_1001580F8);
    uint64_t v113 = v166;
    State.wrappedValue.getter();
    char v114 = EditMode.isEditing.getter();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v113, v168);
    if (v114)
    {
      uint64_t v115 = v156;
      sub_1000B81D4(v156);
      v116 = v155;
      MoveTransition.init(edge:)();
      v117 = v159;
      OpacityTransition.init()();
      uint64_t v118 = sub_1000121E8(&qword_100158380, (void (*)(uint64_t))&type metadata accessor for MoveTransition);
      uint64_t v119 = sub_1000121E8(&qword_100158388, (void (*)(uint64_t))&type metadata accessor for OpacityTransition);
      unint64_t v120 = v160;
      uint64_t v121 = v162;
      uint64_t v122 = v165;
      Transition.combined<A>(with:)();
      (*(void (**)(char *, uint64_t))(v161 + 8))(v117, v122);
      (*(void (**)(char *, uint64_t))(v158 + 8))(v116, v121);
      uint64_t v123 = v163;
      uint64_t v124 = v164;
      (*(void (**)(char *, char *, uint64_t))(v163 + 16))(v157, v120, v164);
      uint64_t v208 = v121;
      uint64_t v209 = v122;
      uint64_t v210 = v118;
      uint64_t v211 = v119;
      swift_getOpaqueTypeConformance2();
      uint64_t v125 = AnyTransition.init<A>(_:)();
      uint64_t v126 = v154;
      sub_100033344(v115, v154, &qword_100158238);
      *(void *)(v126 + *(int *)(v180 + 36)) = v125;
      (*(void (**)(char *, uint64_t))(v123 + 8))(v120, v124);
      sub_100032F44(v115, &qword_100158238);
      sub_10002D9D0(v126, v112, &qword_100158240);
      uint64_t v96 = 0;
    }
    else
    {
      uint64_t v96 = 1;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v112, v96, 1, v180);
  uint64_t v144 = v193;
  uint64_t v145 = v112;
  uint64_t v146 = v192;
  sub_100033344(v193, v192, &qword_100158278);
  uint64_t v147 = v195;
  uint64_t v148 = v194;
  sub_100033344(v195, v194, &qword_100158258);
  uint64_t v149 = v177;
  sub_100033344(v145, v177, &qword_100158248);
  uint64_t v150 = v179;
  sub_100033344(v146, v179, &qword_100158278);
  uint64_t v151 = sub_100032FA0(&qword_100158378);
  sub_100033344(v148, v150 + *(int *)(v151 + 48), &qword_100158258);
  sub_100033344(v149, v150 + *(int *)(v151 + 64), &qword_100158248);
  sub_100032F44(v149, &qword_100158248);
  sub_100032F44(v148, &qword_100158258);
  sub_100032F44(v146, &qword_100158278);
  sub_100033344(v150, v205, &qword_100158228);
  swift_storeEnumTagMultiPayload();
  sub_1000BE428();
  sub_100040BE4(&qword_100158360, &qword_100158228);
  _ConditionalContent<>.init(storage:)();
  sub_100032F44(v150, &qword_100158228);
  sub_100032F44(v145, &qword_100158248);
  sub_100032F44(v147, &qword_100158258);
  uint64_t v63 = v144;
  uint64_t v64 = &qword_100158278;
  return sub_100032F44(v63, v64);
}

uint64_t sub_1000B703C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v36 = a2;
  uint64_t v5 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  uint64_t v35 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_100158318);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032FA0(&qword_100158308);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100032FA0(&qword_1001582F8);
  __chkstk_darwin(v34);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100032FA0(&qword_1001582E8);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100032FA0(&qword_1001582D0);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154358 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100160E40;
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = v21;
  v9[16] = 0;
  uint64_t v22 = sub_100032FA0(&qword_100158390);
  sub_1000BC0EC(a1 & 1, v3, (uint64_t)&v9[*(int *)(v22 + 44)]);
  if (qword_1001545D8 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_1001611E0;
  uint64_t KeyPath = swift_getKeyPath();
  sub_100033344((uint64_t)v9, (uint64_t)v12, &qword_100158318);
  uint64_t v25 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *uint64_t v25 = KeyPath;
  v25[1] = v23;
  swift_retain();
  sub_100032F44((uint64_t)v9, &qword_100158318);
  uint64_t v26 = swift_getKeyPath();
  sub_100033344((uint64_t)v12, (uint64_t)v14, &qword_100158308);
  uint64_t v27 = &v14[*(int *)(v34 + 36)];
  *(void *)uint64_t v27 = v26;
  v27[8] = 1;
  sub_100032F44((uint64_t)v12, &qword_100158308);
  uint64_t v28 = static Alignment.center.getter();
  sub_1000C332C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, INFINITY, 0, v28, v29);
  sub_100032F44((uint64_t)v14, &qword_1001582F8);
  LOBYTE(v26) = static Edge.Set.all.getter();
  sub_100033344((uint64_t)v17, (uint64_t)v20, &qword_1001582E8);
  uint64_t v30 = &v20[*(int *)(v18 + 36)];
  *uint64_t v30 = v26;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  sub_100032F44((uint64_t)v17, &qword_1001582E8);
  uint64_t v31 = v35;
  static AccessibilityChildBehavior.combine.getter();
  sub_1000BE100(&qword_1001582D8, &qword_1001582D0, (void (*)(void))sub_1000BE0D0);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v38);
  return sub_100032F44((uint64_t)v20, &qword_1001582D0);
}

uint64_t sub_1000B74D4()
{
  return Transaction.animation.setter();
}

uint64_t sub_1000B74FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v95 = a1;
  uint64_t v74 = type metadata accessor for CalculatorHistoryView();
  uint64_t v81 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v82 = v2;
  uint64_t v88 = (uint64_t)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for KeyEquivalent();
  uint64_t v85 = *(void *)(v3 - 8);
  uint64_t v86 = v3;
  __chkstk_darwin(v3);
  uint64_t v84 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032FA0(&qword_100156680);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for CalculatorHistoryListView();
  __chkstk_darwin(v71);
  uint64_t v9 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100032FA0(&qword_100158540);
  uint64_t v72 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100032FA0(&qword_100158548);
  __chkstk_darwin(v75);
  uint64_t v76 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100032FA0(&qword_100158550);
  uint64_t v78 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v77 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100032FA0(&qword_100158558);
  __chkstk_darwin(v93);
  uint64_t v83 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100032FA0(&qword_100158560);
  uint64_t v89 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v80 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v87 = (char *)&v69 - v17;
  uint64_t v90 = sub_100032FA0(&qword_100158568);
  __chkstk_darwin(v90);
  uint64_t v91 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100032FA0(&qword_1001582B8);
  uint64_t v19 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v22 = *(void *)(v1 + 40);
  uint64_t v23 = v1;
  uint64_t v96 = *(void *)(v1 + 32);
  unint64_t v97 = v22;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v24 = sub_10004CF90();
  swift_release();
  uint64_t v25 = *(void *)(v24 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v96 = v25;
  sub_1000121E8(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v26 = *(void *)(v25 + 48);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v27 = *(void *)(v26 + 16);
  swift_bridgeObjectRelease();
  if (v27)
  {
    sub_10008BC34((uint64_t)v9);
    unint64_t v28 = *(void *)(v23 + 40);
    uint64_t v96 = *(void *)(v23 + 32);
    unint64_t v97 = v28;
    State.wrappedValue.getter();
    sub_10004CF90();
    swift_release();
    type metadata accessor for CalculatorHistoryViewModel(0);
    sub_1000121E8(&qword_100158570, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryListView);
    sub_1000121E8(&qword_100154E30, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryViewModel);
    View.environment<A>(_:)();
    swift_release();
    sub_1000BEDDC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for CalculatorHistoryListView);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v70 = v23;
    sub_100032FA0(&qword_1001580F8);
    State.projectedValue.getter();
    uint64_t v30 = sub_100032FA0(&qword_100156678);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v7, 0, 1, v30);
    uint64_t v31 = (uint64_t)v76;
    uint64_t v32 = (uint64_t *)&v76[*(int *)(v75 + 36)];
    uint64_t v33 = sub_100032FA0(&qword_100158538);
    sub_100033344((uint64_t)v7, (uint64_t)v32 + *(int *)(v33 + 28), &qword_100156680);
    *uint64_t v32 = KeyPath;
    uint64_t v34 = v72;
    uint64_t v35 = v73;
    (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v31, v11, v73);
    sub_100032F44((uint64_t)v7, &qword_100156680);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
    uint64_t v36 = v84;
    static KeyEquivalent.delete.getter();
    uint64_t v37 = v88;
    sub_10003D9E4(v23, v88);
    unint64_t v38 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    uint64_t v39 = swift_allocObject();
    sub_1000BD978(v37, v39 + v38);
    sub_1000BEEB0();
    uint64_t v40 = v77;
    View.onKeyPress(_:action:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v36, v86);
    sub_100032F44(v31, &qword_100158548);
    uint64_t v41 = v70;
    sub_10003D9E4(v70, v37);
    uint64_t v42 = swift_allocObject();
    sub_1000BD978(v37, v42 + v38);
    uint64_t v43 = v78;
    uint64_t v44 = (uint64_t)v83;
    uint64_t v45 = v79;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v83, v40, v79);
    uint64_t v46 = v93;
    uint64_t v47 = (void *)(v44 + *(int *)(v93 + 36));
    void *v47 = 0;
    v47[1] = 0;
    v47[2] = sub_1000BF004;
    v47[3] = v42;
    uint64_t v48 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v40, v45);
    __chkstk_darwin(v48);
    *(&v69 - 2) = v41;
    uint64_t v49 = sub_100032FA0(&qword_100158588);
    unint64_t v50 = sub_1000BF024();
    uint64_t v51 = sub_1000317D8(&qword_100158598);
    unint64_t v52 = sub_1000BF0D4();
    uint64_t v96 = v51;
    unint64_t v97 = v52;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v54 = v80;
    View.toolbar<A>(content:)();
    sub_100032F44(v44, &qword_100158558);
    uint64_t v55 = v89;
    uint64_t v56 = v87;
    uint64_t v57 = v94;
    (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v87, v54, v94);
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v91, v56, v57);
    swift_storeEnumTagMultiPayload();
    uint64_t v58 = sub_1000317D8(&qword_1001582D0);
    uint64_t v59 = sub_1000BE100(&qword_1001582D8, &qword_1001582D0, (void (*)(void))sub_1000BE0D0);
    uint64_t v96 = v58;
    unint64_t v97 = v59;
    swift_getOpaqueTypeConformance2();
    uint64_t v96 = v46;
    unint64_t v97 = v49;
    unint64_t v98 = v50;
    uint64_t v99 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v56, v57);
  }
  else
  {
    sub_1000B703C(0, (uint64_t)v21);
    uint64_t v61 = v92;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v91, v21, v92);
    swift_storeEnumTagMultiPayload();
    uint64_t v62 = sub_1000317D8(&qword_1001582D0);
    uint64_t v63 = sub_1000BE100(&qword_1001582D8, &qword_1001582D0, (void (*)(void))sub_1000BE0D0);
    uint64_t v96 = v62;
    unint64_t v97 = v63;
    swift_getOpaqueTypeConformance2();
    uint64_t v64 = sub_1000317D8(&qword_100158588);
    unint64_t v65 = sub_1000BF024();
    uint64_t v66 = sub_1000317D8(&qword_100158598);
    unint64_t v67 = sub_1000BF0D4();
    uint64_t v96 = v66;
    unint64_t v97 = v67;
    uint64_t v68 = swift_getOpaqueTypeConformance2();
    uint64_t v96 = v93;
    unint64_t v97 = v64;
    unint64_t v98 = v65;
    uint64_t v99 = v68;
    swift_getOpaqueTypeConformance2();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v61);
  }
}

uint64_t sub_1000B81D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v66 = a1;
  uint64_t v3 = sub_100032FA0(&qword_1001583F8);
  __chkstk_darwin(v3 - 8);
  unint64_t v65 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032FA0(&qword_100158400);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100032FA0(&qword_100158408);
  __chkstk_darwin(v61);
  uint64_t v63 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100032FA0(&qword_100158410);
  __chkstk_darwin(v62);
  uint64_t v67 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100032FA0(&qword_100158418);
  __chkstk_darwin(v68);
  uint64_t v64 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100032FA0(&qword_100158420);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100032FA0(&qword_100158428);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v17 = *(unsigned char *)(v1 + 8);
  uint64_t v18 = swift_retain();
  uint64_t v19 = sub_10003B8B4(v18, v17);
  swift_release();
  swift_getKeyPath();
  uint64_t v69 = v19;
  sub_1000121E8(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v20 = *(unsigned char *)(v19 + 17);
  swift_release();
  uint64_t v21 = static VerticalAlignment.center.getter();
  if (v20)
  {
    uint64_t v60 = v11;
    *(void *)uint64_t v7 = v21;
    *((void *)v7 + 1) = 0;
    v7[16] = 1;
    uint64_t v22 = sub_100032FA0(&qword_100158470);
    sub_1000BBDC0(v2, (uint64_t)&v7[*(int *)(v22 + 44)]);
    char v23 = static Edge.Set.horizontal.getter();
    uint64_t v24 = v2;
    if (qword_100154278 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v33 = v63;
    sub_100033344((uint64_t)v7, v63, &qword_100158400);
    uint64_t v34 = v33 + *(int *)(v61 + 36);
    *(unsigned char *)uint64_t v34 = v23;
    *(void *)(v34 + 8) = v26;
    *(void *)(v34 + 16) = v28;
    *(void *)(v34 + 24) = v30;
    *(void *)(v34 + 32) = v32;
    *(unsigned char *)(v34 + 40) = 0;
    sub_100032F44((uint64_t)v7, &qword_100158400);
    char v35 = static Edge.Set.vertical.getter();
    if (qword_100154280 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v44 = v67;
    sub_100033344(v33, v67, &qword_100158408);
    uint64_t v45 = v44 + *(int *)(v62 + 36);
    *(unsigned char *)uint64_t v45 = v35;
    *(void *)(v45 + 8) = v37;
    *(void *)(v45 + 16) = v39;
    *(void *)(v45 + 24) = v41;
    *(void *)(v45 + 32) = v43;
    *(unsigned char *)(v45 + 40) = 0;
    sub_100032F44(v33, &qword_100158408);
    uint64_t v46 = static Alignment.top.getter();
    uint64_t v48 = v47;
    LOBYTE(v44) = *(unsigned char *)(v24 + 8);
    uint64_t v49 = swift_retain();
    uint64_t v50 = sub_10003B8B4(v49, v44);
    swift_release();
    swift_getKeyPath();
    uint64_t v69 = v50;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    int v51 = *(unsigned __int8 *)(v50 + 17);
    swift_release();
    if (v51 == 1)
    {
      uint64_t v52 = (uint64_t)v65;
      Divider.init()();
      uint64_t v53 = type metadata accessor for Divider();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 0, 1, v53);
    }
    else
    {
      uint64_t v56 = type metadata accessor for Divider();
      uint64_t v52 = (uint64_t)v65;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v65, 1, 1, v56);
    }
    uint64_t v16 = v64;
    uint64_t v57 = (uint64_t)&v64[*(int *)(v68 + 36)];
    sub_10002D9D0(v52, v57, &qword_1001583F8);
    uint64_t v58 = (uint64_t *)(v57 + *(int *)(sub_100032FA0(&qword_100158468) + 36));
    *uint64_t v58 = v46;
    v58[1] = v48;
    sub_10002D9D0(v67, (uint64_t)v16, &qword_100158410);
    uint64_t v55 = &qword_100158418;
    sub_100033344((uint64_t)v16, (uint64_t)v13, &qword_100158418);
    swift_storeEnumTagMultiPayload();
    sub_100040BE4(&qword_100158438, &qword_100158428);
    sub_1000BE680();
  }
  else
  {
    *(void *)uint64_t v16 = v21;
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v54 = sub_100032FA0(&qword_100158430);
    sub_1000BABD0(v2, (uint64_t)&v16[*(int *)(v54 + 44)]);
    uint64_t v55 = &qword_100158428;
    sub_100033344((uint64_t)v16, (uint64_t)v13, &qword_100158428);
    swift_storeEnumTagMultiPayload();
    sub_100040BE4(&qword_100158438, &qword_100158428);
    sub_1000BE680();
  }
  _ConditionalContent<>.init(storage:)();
  return sub_100032F44((uint64_t)v16, v55);
}

uint64_t sub_1000B88DC(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v39 - v10;
  uint64_t v12 = sub_100032FA0(&qword_100154E28);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v17 = (char *)v39 - v16;
  uint64_t v18 = *(void *)(a3 + 40);
  if (*a2 == 1)
  {
    uint64_t v40 = *(void *)(a3 + 32);
    uint64_t v41 = v18;
    sub_100032FA0(&qword_100158220);
    State.wrappedValue.getter();
    uint64_t v19 = sub_10004CF90();
    swift_release();
    Date.init()();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
    uint64_t v20 = v19 + OBJC_IVAR____TtC10Calculator26CalculatorHistoryViewModel_historyViewOpenedAt;
    swift_beginAccess();
    sub_1000BDF54((uint64_t)v17, v20);
    swift_endAccess();
    swift_release();
    sub_100032FA0(&qword_1001569D0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10010DCB0;
    *(void *)(inited + 32) = 0xD000000000000011;
    *(void *)(inited + 40) = 0x8000000100109850;
    *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithBool:1];
    unint64_t v22 = sub_100070DFC(inited);
    char v23 = *(unsigned char *)(a3 + 24);
    uint64_t v24 = swift_retain();
    sub_100033AA8(v24, v23);
    swift_release();
    unint64_t v25 = sub_100056E30(v22);
    swift_bridgeObjectRelease();
    sub_10005FADC(v25);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v40 = *(void *)(a3 + 32);
    uint64_t v41 = v18;
    v39[0] = sub_100032FA0(&qword_100158220);
    State.wrappedValue.getter();
    uint64_t v26 = sub_10004CF90();
    swift_release();
    uint64_t v27 = v26 + OBJC_IVAR____TtC10Calculator26CalculatorHistoryViewModel_historyViewOpenedAt;
    swift_beginAccess();
    sub_100033344(v27, (uint64_t)v14, &qword_100154E28);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 1, v5) == 1) {
      return sub_100032F44((uint64_t)v14, &qword_100154E28);
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v14, v5);
    sub_100032FA0(&qword_1001569D0);
    uint64_t v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_100110A40;
    *(void *)(v29 + 32) = 0xD000000000000011;
    *(void *)(v29 + 40) = 0x8000000100109850;
    *(void *)(v29 + 48) = [objc_allocWithZone((Class)NSNumber) initWithBool:0];
    *(void *)(v29 + 56) = 0x6E6F697461727564;
    *(void *)(v29 + 64) = 0xE800000000000000;
    Date.init()();
    Date.timeIntervalSince(_:)();
    double v31 = v30;
    uint64_t v32 = *(void (**)(char *, uint64_t))(v6 + 8);
    v32(v8, v5);
    *(void *)(v29 + 72) = [objc_allocWithZone((Class)NSNumber) initWithDouble:v31];
    unint64_t v33 = sub_100070DFC(v29);
    LOBYTE(v29) = *(unsigned char *)(a3 + 24);
    uint64_t v34 = swift_retain();
    sub_100033AA8(v34, v29);
    swift_release();
    unint64_t v35 = sub_100056E30(v33);
    swift_bridgeObjectRelease();
    sub_10005FADC(v35);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v36 = *(void *)(a3 + 40);
    v39[8] = *(void *)(a3 + 32);
    v39[9] = v36;
    State.wrappedValue.getter();
    uint64_t v37 = sub_10004CF90();
    swift_release();
    v32(v11, v5);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v17, 1, 1, v5);
    uint64_t v38 = v37 + OBJC_IVAR____TtC10Calculator26CalculatorHistoryViewModel_historyViewOpenedAt;
    swift_beginAccess();
    sub_1000BDF54((uint64_t)v17, v38);
    swift_endAccess();
  }
  return swift_release();
}

uint64_t sub_1000B8E38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PPTTestCase();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = type metadata accessor for AnimationCompletionCriteria();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = PPTTestCase.parameters.getter();
  uint64_t v43 = 0x664F7265626D756ELL;
  unint64_t v44 = 0xEF7364726F636552;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_100074618((uint64_t)v45), (v11 & 1) != 0))
  {
    sub_10000DBCC(*(void *)(v9 + 56) + 32 * v10, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10006DD98((uint64_t)v45);
  if (*((void *)&v47 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t result = v43;
      unint64_t v13 = v44;
      goto LABEL_10;
    }
  }
  else
  {
    sub_100032F44((uint64_t)&v46, &qword_100155208);
  }
  unint64_t v13 = 0xE400000000000000;
  uint64_t result = 808464433;
LABEL_10:
  uint64_t v14 = HIBYTE(v13) & 0xF;
  uint64_t v15 = result & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0) {
    uint64_t v16 = HIBYTE(v13) & 0xF;
  }
  else {
    uint64_t v16 = result & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  uint64_t v40 = a1;
  if (!v16)
  {
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  if ((v13 & 0x1000000000000000) != 0)
  {
    uint64_t v18 = (uint64_t)sub_10006DDEC(result, v13, 10);
    char v20 = v38;
    goto LABEL_53;
  }
  if ((v13 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      char v17 = (unsigned __int8 *)((v13 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      char v17 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v18 = (uint64_t)sub_10006DD80(v17, v15, 10);
    char v20 = v19 & 1;
LABEL_53:
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
LABEL_55:
      uint64_t v30 = static AnimationCompletionCriteria.logicallyComplete.getter();
      double v31 = __chkstk_darwin(v30);
      uint64_t v32 = v40;
      *(&v39 - 2) = v39;
      *(&v39 - 1) = v18;
      (*(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16))((char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v2, v31);
      unint64_t v33 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v34 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v34 + v33, (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
      static Animation.default.getter();
      withAnimation<A>(_:completionCriteria:_:completion:)();
      swift_release();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v8, v42);
    }
LABEL_54:
    uint64_t v18 = 1000;
    goto LABEL_55;
  }
  v45[0] = result;
  v45[1] = v13 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v14) {
      goto LABEL_66;
    }
    if (v14 == 1 || (BYTE1(result) - 48) > 9u) {
      goto LABEL_40;
    }
    uint64_t v18 = (BYTE1(result) - 48);
    if (v14 != 2)
    {
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_40;
      }
      uint64_t v18 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      uint64_t v21 = v14 - 3;
      if (v21)
      {
        unint64_t v22 = (unsigned __int8 *)v45 + 3;
        while (1)
        {
          unsigned int v23 = *v22 - 48;
          if (v23 > 9) {
            goto LABEL_40;
          }
          uint64_t v24 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            goto LABEL_40;
          }
          uint64_t v18 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_40;
          }
          char v20 = 0;
          ++v22;
          if (!--v21) {
            goto LABEL_53;
          }
        }
      }
    }
LABEL_52:
    char v20 = 0;
    goto LABEL_53;
  }
  if (result != 45)
  {
    if (!v14 || (result - 48) > 9u) {
      goto LABEL_40;
    }
    uint64_t v18 = (result - 48);
    if (v14 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_40;
      }
      uint64_t v18 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v25 = v14 - 2;
      if (v25)
      {
        uint64_t v26 = (unsigned __int8 *)v45 + 2;
        while (1)
        {
          unsigned int v27 = *v26 - 48;
          if (v27 > 9) {
            goto LABEL_40;
          }
          uint64_t v28 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            goto LABEL_40;
          }
          uint64_t v18 = v28 + v27;
          if (__OFADD__(v28, v27)) {
            goto LABEL_40;
          }
          char v20 = 0;
          ++v26;
          if (!--v25) {
            goto LABEL_53;
          }
        }
      }
    }
    goto LABEL_52;
  }
  if (v14)
  {
    if (v14 != 1 && (BYTE1(result) - 48) <= 9u)
    {
      if (v14 == 2)
      {
        char v20 = 0;
        uint64_t v18 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_53;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        uint64_t v18 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
        uint64_t v29 = v14 - 3;
        if (!v29) {
          goto LABEL_52;
        }
        unint64_t v35 = (unsigned __int8 *)v45 + 3;
        while (1)
        {
          unsigned int v36 = *v35 - 48;
          if (v36 > 9) {
            break;
          }
          uint64_t v37 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            break;
          }
          uint64_t v18 = v37 - v36;
          if (__OFSUB__(v37, v36)) {
            break;
          }
          char v20 = 0;
          ++v35;
          if (!--v29) {
            goto LABEL_53;
          }
        }
      }
    }
LABEL_40:
    uint64_t v18 = 0;
    char v20 = 1;
    goto LABEL_53;
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_1000B93F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v63 = sub_100032FA0(&qword_1001585C8);
  __chkstk_darwin(v63);
  uint64_t v58 = (uint64_t *)((char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100032FA0(&qword_1001584F8);
  __chkstk_darwin(v4 - 8);
  uint64_t v53 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_1001585D0);
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  __chkstk_darwin(v6);
  uint64_t v52 = (uint64_t)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032FA0(&qword_1001585D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v54 = (uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v57 = (char *)&v52 - v11;
  uint64_t v59 = sub_100032FA0(&qword_1001585E0);
  __chkstk_darwin(v59);
  uint64_t v61 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100032FA0(&qword_1001585E8);
  __chkstk_darwin(v60);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for EditMode();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100032FA0(&qword_1001585F0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v52 - v23;
  char v25 = *(unsigned char *)(a1 + 8);
  uint64_t v26 = swift_retain();
  uint64_t v27 = sub_10003B8B4(v26, v25);
  swift_release();
  swift_getKeyPath();
  uint64_t v64 = v27;
  sub_1000121E8(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v28 = *(unsigned char *)(v27 + 17);
  swift_release();
  if (v28)
  {
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v64 = *(void *)(a1 + 32);
    uint64_t v65 = v29;
    sub_100032FA0(&qword_100158220);
    State.wrappedValue.getter();
    uint64_t v30 = sub_10004CF90();
    swift_release();
    uint64_t v31 = *(void *)(v30 + 16);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    uint64_t v64 = v31;
    sub_1000121E8(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_beginAccess();
    uint64_t v32 = *(void *)(v31 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v33 = *(void *)(v32 + 16);
    swift_bridgeObjectRelease();
    if (v33)
    {
      uint64_t v34 = v53;
      sub_1000BA49C(v53);
      uint64_t v35 = v56;
      uint64_t v36 = (uint64_t)v57;
      if (qword_1001546F0 != -1) {
        swift_once();
      }
      uint64_t v37 = qword_100161308;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v39 = v52;
      sub_100033344(v34, v52, &qword_1001584F8);
      uint64_t v40 = (uint64_t *)(v39 + *(int *)(v35 + 36));
      *uint64_t v40 = KeyPath;
      v40[1] = v37;
      swift_retain();
      sub_100032F44(v34, &qword_1001584F8);
      sub_10002D9D0(v39, v36, &qword_1001585D0);
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v41 = 1;
      uint64_t v35 = v56;
      uint64_t v36 = (uint64_t)v57;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56))(v36, v41, 1, v35);
    uint64_t v48 = v54;
    sub_100033344(v36, v54, &qword_1001585D8);
    uint64_t v49 = (uint64_t)v58;
    *uint64_t v58 = 0;
    *(unsigned char *)(v49 + 8) = 1;
    uint64_t v50 = sub_100032FA0(&qword_100158618);
    sub_100033344(v48, v49 + *(int *)(v50 + 48), &qword_1001585D8);
    sub_100032F44(v48, &qword_1001585D8);
    sub_100033344(v49, v61, &qword_1001585C8);
    swift_storeEnumTagMultiPayload();
    sub_100040BE4(&qword_100158608, &qword_1001585E8);
    sub_100040BE4(&qword_100158610, &qword_1001585C8);
    _ConditionalContent<>.init(storage:)();
    sub_100032F44(v49, &qword_1001585C8);
    uint64_t v46 = v36;
    long long v47 = &qword_1001585D8;
  }
  else
  {
    type metadata accessor for CalculatorHistoryView();
    sub_100032FA0(&qword_1001580F8);
    State.wrappedValue.getter();
    char v42 = EditMode.isEditing.getter();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    if (v42)
    {
      uint64_t v43 = sub_100032FA0(&qword_1001585F8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v24, 1, 1, v43);
    }
    else
    {
      sub_1000B9C78((uint64_t)v24);
      uint64_t v44 = sub_100032FA0(&qword_1001585F8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v24, 0, 1, v44);
    }
    sub_100033344((uint64_t)v24, (uint64_t)v21, &qword_1001585F0);
    *(void *)uint64_t v14 = 0;
    v14[8] = 1;
    uint64_t v45 = sub_100032FA0(&qword_100158600);
    sub_100033344((uint64_t)v21, (uint64_t)&v14[*(int *)(v45 + 48)], &qword_1001585F0);
    sub_100032F44((uint64_t)v21, &qword_1001585F0);
    sub_100033344((uint64_t)v14, v61, &qword_1001585E8);
    swift_storeEnumTagMultiPayload();
    sub_100040BE4(&qword_100158608, &qword_1001585E8);
    sub_100040BE4(&qword_100158610, &qword_1001585C8);
    _ConditionalContent<>.init(storage:)();
    sub_100032F44((uint64_t)v14, &qword_1001585E8);
    uint64_t v46 = (uint64_t)v24;
    long long v47 = &qword_1001585F0;
  }
  return sub_100032F44(v46, v47);
}

uint64_t sub_1000B9C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v69 = a1;
  uint64_t v74 = sub_100032FA0(&qword_100155888);
  __chkstk_darwin(v74);
  uint64_t v68 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v66 = (char *)&v59 - v5;
  uint64_t v70 = type metadata accessor for DynamicTypeSize();
  uint64_t v73 = *(void **)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v72 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v71 = (char *)&v59 - v8;
  uint64_t v67 = sub_100032FA0(&qword_100155858);
  __chkstk_darwin(v67);
  uint64_t v64 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v65 = (uint64_t)&v59 - v11;
  uint64_t v12 = type metadata accessor for CalculatorHistoryView();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12 - 8);
  uint64_t v15 = sub_100032FA0(&qword_1001555F0);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100032FA0(&qword_100158620);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100032FA0(&qword_100158628);
  __chkstk_darwin(v75);
  uint64_t v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100032FA0(&qword_100158630);
  uint64_t v62 = *(void *)(v24 - 8);
  uint64_t v63 = v24;
  __chkstk_darwin(v24);
  uint64_t v61 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003D9E4(v2, (uint64_t)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v26 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v27 = swift_allocObject();
  sub_1000BD978((uint64_t)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  Button.init(action:label:)();
  if (qword_1001546F0 != -1) {
    swift_once();
  }
  uint64_t v28 = qword_100161308;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v21, v18, v15);
  uint64_t v30 = (uint64_t *)&v21[*(int *)(v19 + 36)];
  *uint64_t v30 = KeyPath;
  v30[1] = v28;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v16 + 8);
  swift_retain();
  v31(v18, v15);
  sub_100033344((uint64_t)v21, (uint64_t)v23, &qword_100158620);
  uint64_t v32 = &v23[*(int *)(v75 + 36)];
  *(_OWORD *)uint64_t v32 = xmmword_100112DC0;
  *((_OWORD *)v32 + 1) = xmmword_100112DD0;
  sub_100032F44((uint64_t)v21, &qword_100158620);
  uint64_t v33 = v73;
  uint64_t v34 = (void (*)(char *, void, uint64_t))v73[13];
  uint64_t v35 = v70;
  uint64_t v36 = v71;
  v34(v71, enum case for DynamicTypeSize.large(_:), v70);
  uint64_t v37 = v72;
  v34(v72, enum case for DynamicTypeSize.xxxLarge(_:), v35);
  sub_1000121E8(&qword_100155890, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if (result)
  {
    uint64_t v39 = v37;
    uint64_t v40 = v23;
    uint64_t v41 = v74;
    char v42 = v66;
    uint64_t v43 = &v66[*(int *)(v74 + 48)];
    uint64_t v60 = (uint64_t)v40;
    uint64_t v44 = (void (*)(char *, char *, uint64_t))v33[4];
    v44(v66, v36, v35);
    v44(v43, v39, v35);
    uint64_t v45 = v68;
    uint64_t v46 = &v68[*(int *)(v41 + 48)];
    long long v47 = (void (*)(char *, char *, uint64_t))v33[2];
    v47(v68, v42, v35);
    v47(v46, v43, v35);
    uint64_t v48 = (uint64_t)v64;
    v44(v64, v45, v35);
    uint64_t v49 = (void (*)(char *, uint64_t))v33[1];
    v49(v46, v35);
    uint64_t v50 = &v45[*(int *)(v74 + 48)];
    v44(v45, v42, v35);
    v44(v50, v43, v35);
    uint64_t v51 = v67;
    v44((char *)(v48 + *(int *)(v67 + 36)), v50, v35);
    v49(v45, v35);
    uint64_t v52 = v65;
    sub_10002D9D0(v48, v65, &qword_100155858);
    unint64_t v53 = sub_1000BF2FC();
    uint64_t v54 = sub_100040BE4(&qword_100155860, &qword_100155858);
    uint64_t v55 = v60;
    uint64_t v56 = v61;
    uint64_t v57 = v75;
    View.dynamicTypeSize<A>(_:)();
    sub_100032F44(v52, &qword_100155858);
    sub_100032F44(v55, &qword_100158628);
    uint64_t v76 = v57;
    uint64_t v77 = v51;
    unint64_t v78 = v53;
    uint64_t v79 = v54;
    swift_getOpaqueTypeConformance2();
    uint64_t v58 = v63;
    View.accessibilityIdentifier(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v56, v58);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000BA49C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v1 = sub_100032FA0(&qword_100156680);
  __chkstk_darwin(v1 - 8);
  uint64_t v67 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100032FA0(&qword_100155888);
  __chkstk_darwin(v68);
  uint64_t v62 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v57 = (char *)&v56 - v5;
  uint64_t v6 = type metadata accessor for DynamicTypeSize();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v56 - v11;
  uint64_t v13 = sub_100032FA0(&qword_100155858);
  __chkstk_darwin(v13);
  uint64_t v60 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v61 = (uint64_t)&v56 - v16;
  uint64_t v17 = type metadata accessor for EditButton();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100032FA0(&qword_100158518);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100032FA0(&qword_100158520);
  uint64_t v65 = *(void *)(v24 - 8);
  uint64_t v66 = v24;
  __chkstk_darwin(v24);
  uint64_t v64 = (char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  EditButton.init()();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v20, v17);
  uint64_t v58 = v21;
  uint64_t v59 = v23;
  unint64_t v26 = &v23[*(int *)(v21 + 36)];
  *(_OWORD *)unint64_t v26 = xmmword_100112DC0;
  *((_OWORD *)v26 + 1) = xmmword_100112DD0;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v27 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v27(v12, enum case for DynamicTypeSize.large(_:), v6);
  v27(v9, enum case for DynamicTypeSize.accessibility2(_:), v6);
  sub_1000121E8(&qword_100155890, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t v28 = v6;
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if (result)
  {
    uint64_t v56 = v13;
    uint64_t v30 = v9;
    uint64_t v31 = v68;
    uint64_t v32 = v57;
    uint64_t v33 = &v57[*(int *)(v68 + 48)];
    uint64_t v34 = v7;
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v36 = v12;
    uint64_t v37 = v28;
    v35(v57, v36, v28);
    v35(v33, v30, v28);
    char v38 = v62;
    uint64_t v39 = &v62[*(int *)(v31 + 48)];
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
    v40(v62, v32, v37);
    v40(v39, v33, v37);
    uint64_t v41 = (uint64_t)v60;
    v35(v60, v38, v37);
    char v42 = *(void (**)(char *, uint64_t))(v34 + 8);
    v42(v39, v37);
    uint64_t v43 = &v38[*(int *)(v68 + 48)];
    v35(v38, v32, v37);
    v35(v43, v33, v37);
    v35((char *)(v41 + *(int *)(v56 + 36)), v43, v37);
    v42(v38, v37);
    uint64_t v44 = v61;
    sub_10002D9D0(v41, v61, &qword_100155858);
    sub_1000BED08();
    sub_100040BE4(&qword_100155860, &qword_100155858);
    uint64_t v45 = v64;
    uint64_t v46 = (uint64_t)v59;
    View.dynamicTypeSize<A>(_:)();
    sub_100032F44(v44, &qword_100155858);
    sub_100032F44(v46, &qword_100158518);
    uint64_t KeyPath = swift_getKeyPath();
    type metadata accessor for CalculatorHistoryView();
    sub_100032FA0(&qword_1001580F8);
    uint64_t v48 = (uint64_t)v67;
    State.projectedValue.getter();
    uint64_t v49 = sub_100032FA0(&qword_100156678);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
    uint64_t v50 = sub_100032FA0(&qword_1001584F8);
    uint64_t v51 = v63;
    uint64_t v52 = (uint64_t *)(v63 + *(int *)(v50 + 36));
    uint64_t v53 = sub_100032FA0(&qword_100158538);
    sub_100033344(v48, (uint64_t)v52 + *(int *)(v53 + 28), &qword_100156680);
    *uint64_t v52 = KeyPath;
    uint64_t v55 = v65;
    uint64_t v54 = v66;
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))(v51, v45, v66);
    sub_100032F44(v48, &qword_100156680);
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v45, v54);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000BABD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v41 = sub_100032FA0(&qword_100158478);
  __chkstk_darwin(v41);
  uint64_t v37 = (uint64_t)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100032FA0(&qword_1001584E0);
  __chkstk_darwin(v38);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100032FA0(&qword_100158488);
  __chkstk_darwin(v39);
  uint64_t v36 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for EditMode();
  uint64_t v7 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032FA0(&qword_1001584E8);
  __chkstk_darwin(v10 - 8);
  uint64_t v40 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_100032FA0(&qword_1001584F0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v36 - v19;
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v44 = *(void *)(a1 + 32);
  uint64_t v45 = v21;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v22 = sub_10004CF90();
  swift_release();
  uint64_t v23 = *(void *)(v22 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v44 = v23;
  sub_1000121E8(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v24 = *(void *)(v23 + 48);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v25 = *(void *)(v24 + 16);
  swift_bridgeObjectRelease();
  if (v25)
  {
    sub_1000BA49C((uint64_t)v20);
    uint64_t v26 = sub_100032FA0(&qword_1001584F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v20, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = sub_100032FA0(&qword_1001584F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v20, 1, 1, v27);
  }
  type metadata accessor for CalculatorHistoryView();
  sub_100032FA0(&qword_1001580F8);
  State.wrappedValue.getter();
  char v28 = EditMode.isEditing.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v43);
  if (v28)
  {
    uint64_t v29 = v36;
    sub_1000BB170(v36);
    uint64_t v30 = &qword_100158488;
    sub_100033344(v29, (uint64_t)v5, &qword_100158488);
  }
  else
  {
    uint64_t v29 = v37;
    sub_1000BB8C0(v37);
    uint64_t v30 = &qword_100158478;
    sub_100033344(v29, (uint64_t)v5, &qword_100158478);
  }
  swift_storeEnumTagMultiPayload();
  sub_1000BEBB0();
  sub_1000BEC5C();
  _ConditionalContent<>.init(storage:)();
  sub_100032F44(v29, v30);
  uint64_t v31 = v42;
  uint64_t v32 = (uint64_t)v40;
  sub_100033344((uint64_t)v20, (uint64_t)v17, &qword_1001584F0);
  sub_100033344((uint64_t)v14, v32, &qword_1001584E8);
  sub_100033344((uint64_t)v17, v31, &qword_1001584F0);
  uint64_t v33 = sub_100032FA0(&qword_100158510);
  uint64_t v34 = v31 + *(int *)(v33 + 48);
  *(void *)uint64_t v34 = 0;
  *(unsigned char *)(v34 + 8) = 1;
  sub_100033344(v32, v31 + *(int *)(v33 + 64), &qword_1001584E8);
  sub_100032F44((uint64_t)v14, &qword_1001584E8);
  sub_100032F44((uint64_t)v20, &qword_1001584F0);
  sub_100032F44(v32, &qword_1001584E8);
  return sub_100032F44((uint64_t)v17, &qword_1001584F0);
}

uint64_t sub_1000BB170@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v67 = a1;
  uint64_t v3 = type metadata accessor for CalculatorHistoryView();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v3);
  uint64_t v68 = (uint64_t)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_1001555E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100032FA0(&qword_1001555F0);
  uint64_t v10 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100032FA0(&qword_100158498);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100032FA0(&qword_1001584A0);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v58 = (uint64_t)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_100032FA0(&qword_1001584A8) - 8;
  __chkstk_darwin(v64);
  uint64_t v63 = (uint64_t)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100032FA0(&qword_1001584D0);
  __chkstk_darwin(v66);
  uint64_t v65 = (uint64_t)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ButtonRole.destructive.getter();
  uint64_t v22 = type metadata accessor for ButtonRole();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 0, 1, v22);
  uint64_t v23 = v2;
  uint64_t v24 = v68;
  sub_10003D9E4(v23, v68);
  uint64_t v25 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v61 = v26 + v6;
  uint64_t v62 = v26;
  uint64_t v60 = v25 | 7;
  uint64_t v27 = swift_allocObject();
  sub_1000BD978(v24, v27 + v26);
  Button.init(role:action:label:)();
  uint64_t v28 = static Color.red.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = v59;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v12, v59);
  uint64_t v31 = (uint64_t *)&v16[*(int *)(v14 + 44)];
  *uint64_t v31 = KeyPath;
  v31[1] = v28;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v30);
  uint64_t v32 = v58;
  sub_100033344((uint64_t)v16, v58, &qword_100158498);
  uint64_t v33 = (_OWORD *)(v32 + *(int *)(v18 + 44));
  *uint64_t v33 = xmmword_10010F1F0;
  v33[1] = xmmword_10010F200;
  sub_100032F44((uint64_t)v16, &qword_100158498);
  uint64_t v34 = v57;
  uint64_t v35 = v57 + *(int *)(v4 + 40);
  char v36 = *(unsigned char *)v35;
  uint64_t v37 = *(void *)(v35 + 8);
  LOBYTE(v69) = v36;
  uint64_t v70 = v37;
  sub_100032FA0(&qword_100154898);
  State.projectedValue.getter();
  uint64_t v38 = v71;
  uint64_t v39 = v72;
  LODWORD(v59) = v73;
  uint64_t v40 = *(void *)(v34 + 40);
  uint64_t v71 = *(void *)(v34 + 32);
  uint64_t v72 = v40;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v41 = sub_10004CF90();
  swift_release();
  swift_getKeyPath();
  uint64_t v71 = v41;
  sub_1000121E8(&qword_100154E30, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v42 = *(void *)(v41 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v43 = *(void *)(v42 + 16);
  swift_bridgeObjectRelease();
  uint64_t v44 = v68;
  sub_10003D9E4(v34, v68);
  uint64_t v45 = swift_allocObject();
  sub_1000BD978(v44, v45 + v62);
  uint64_t v46 = v63;
  sub_100033344(v32, v63, &qword_1001584A0);
  uint64_t v47 = v46 + *(int *)(v64 + 44);
  *(void *)uint64_t v47 = v38;
  *(void *)(v47 + 8) = v39;
  *(unsigned char *)(v47 + 16) = v59;
  *(void *)(v47 + 24) = v43;
  *(unsigned char *)(v47 + 32) = 0;
  *(void *)(v47 + 40) = sub_1000BEAD8;
  *(void *)(v47 + 48) = v45;
  sub_100032F44(v32, &qword_1001584A0);
  uint64_t v48 = *(void *)(v34 + 40);
  uint64_t v69 = *(void *)(v34 + 32);
  uint64_t v70 = v48;
  State.wrappedValue.getter();
  uint64_t v49 = sub_10004CF90();
  swift_release();
  swift_getKeyPath();
  uint64_t v69 = v49;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v50 = *(void *)(v49 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v51 = *(void *)(v50 + 16);
  swift_bridgeObjectRelease();
  LOBYTE(v34) = v51 == 0;
  uint64_t v52 = swift_getKeyPath();
  uint64_t v53 = swift_allocObject();
  *(unsigned char *)(v53 + 16) = v34;
  uint64_t v54 = v65;
  sub_100033344(v46, v65, &qword_1001584A8);
  uint64_t v55 = (uint64_t *)(v54 + *(int *)(v66 + 36));
  *uint64_t v55 = v52;
  v55[1] = (uint64_t)sub_100037BB4;
  v55[2] = v53;
  sub_100032F44(v46, &qword_1001584A8);
  sub_1000BEB08();
  View.accessibilityIdentifier(_:)();
  return sub_100032F44(v54, &qword_1001584D0);
}

uint64_t sub_1000BB8C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v49 = a1;
  uint64_t v3 = type metadata accessor for CalculatorHistoryView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v48 = v3 - 8;
  uint64_t v44 = v4;
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = sub_100032FA0(&qword_1001555E8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100032FA0(&qword_1001555F0);
  uint64_t v9 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100158498);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100032FA0(&qword_1001584A0);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100032FA0(&qword_1001584A8);
  __chkstk_darwin(v47);
  uint64_t v46 = (uint64_t)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ButtonRole.destructive.getter();
  uint64_t v21 = type metadata accessor for ButtonRole();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
  uint64_t v42 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003D9E4(v2, v42);
  uint64_t v22 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  uint64_t v43 = v22 | 7;
  uint64_t v44 = v23 + v5;
  uint64_t v24 = swift_allocObject();
  sub_1000BD978((uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  Button.init(role:action:label:)();
  uint64_t v25 = static Color.red.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = v45;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v45);
  uint64_t v28 = (uint64_t *)&v15[*(int *)(v13 + 44)];
  *uint64_t v28 = KeyPath;
  v28[1] = v25;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v27);
  sub_100033344((uint64_t)v15, (uint64_t)v19, &qword_100158498);
  uint64_t v29 = &v19[*(int *)(v17 + 44)];
  *(_OWORD *)uint64_t v29 = xmmword_10010F1F0;
  *((_OWORD *)v29 + 1) = xmmword_10010F200;
  sub_100032F44((uint64_t)v15, &qword_100158498);
  uint64_t v30 = v41;
  uint64_t v31 = v41 + *(int *)(v48 + 44);
  char v32 = *(unsigned char *)v31;
  uint64_t v33 = *(void *)(v31 + 8);
  char v50 = v32;
  uint64_t v51 = v33;
  sub_100032FA0(&qword_100154898);
  State.projectedValue.getter();
  uint64_t v34 = v52;
  uint64_t v35 = v53;
  LOBYTE(KeyPath) = v54;
  uint64_t v36 = v42;
  sub_10003D9E4(v30, v42);
  uint64_t v37 = swift_allocObject();
  sub_1000BD978(v36, v37 + v23);
  uint64_t v38 = v46;
  sub_100033344((uint64_t)v19, v46, &qword_1001584A0);
  uint64_t v39 = v38 + *(int *)(v47 + 36);
  *(void *)uint64_t v39 = v34;
  *(void *)(v39 + 8) = v35;
  *(unsigned char *)(v39 + 16) = KeyPath;
  *(void *)(v39 + 24) = 0;
  *(unsigned char *)(v39 + 32) = 1;
  *(void *)(v39 + 40) = sub_1000BE86C;
  *(void *)(v39 + 48) = v37;
  sub_100032F44((uint64_t)v19, &qword_1001584A0);
  sub_1000BE884();
  View.accessibilityIdentifier(_:)();
  return sub_100032F44(v38, &qword_1001584A8);
}

uint64_t sub_1000BBDC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100032FA0(&qword_100158478);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v25 - v8;
  uint64_t v10 = sub_100032FA0(&qword_100158480);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v25 - v14;
  uint64_t v16 = *(void *)(a1 + 40);
  v25[0] = *(void *)(a1 + 32);
  v25[1] = v16;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v17 = sub_10004CF90();
  swift_release();
  swift_getKeyPath();
  v25[0] = v17;
  sub_1000121E8(&qword_100154E30, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v18 = *(void *)(v17 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v19 = *(void *)(v18 + 16);
  swift_bridgeObjectRelease();
  if (v19)
  {
    sub_1000BB170((uint64_t)v15);
    uint64_t v20 = sub_100032FA0(&qword_100158488);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_100032FA0(&qword_100158488);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v15, 1, 1, v21);
  }
  sub_1000BB8C0((uint64_t)v9);
  sub_100033344((uint64_t)v15, (uint64_t)v12, &qword_100158480);
  sub_100033344((uint64_t)v9, (uint64_t)v6, &qword_100158478);
  sub_100033344((uint64_t)v12, a2, &qword_100158480);
  uint64_t v22 = sub_100032FA0(&qword_100158490);
  uint64_t v23 = a2 + *(int *)(v22 + 48);
  *(void *)uint64_t v23 = 0;
  *(unsigned char *)(v23 + 8) = 1;
  sub_100033344((uint64_t)v6, a2 + *(int *)(v22 + 64), &qword_100158478);
  sub_100032F44((uint64_t)v9, &qword_100158478);
  sub_100032F44((uint64_t)v15, &qword_100158480);
  sub_100032F44((uint64_t)v6, &qword_100158478);
  return sub_100032F44((uint64_t)v12, &qword_100158480);
}

uint64_t sub_1000BC0EC@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v5 = sub_100032FA0(&qword_1001568C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v45 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_100158398);
  __chkstk_darwin(v7 - 8);
  uint64_t v47 = (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v48 = (uint64_t)&v38 - v10;
  int v43 = a1;
  sub_1000BC5A0(a1, (uint64_t)&v49);
  uint64_t v11 = v49;
  uint64_t v12 = v50;
  __int16 v13 = v51;
  int v40 = BYTE2(v51);
  uint64_t v42 = type metadata accessor for CalculatorHistoryView();
  uint64_t v44 = a2;
  uint64_t v14 = sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  uint64_t v41 = v14;
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v15 = v64;
  unsigned __int8 v16 = v65;
  uint64_t v17 = v66;
  int v39 = v67;
  uint64_t v18 = v68;
  uint64_t v19 = v69;
  char v20 = static Edge.Set.bottom.getter();
  if (qword_100154360 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v49 = v11;
  uint64_t v50 = v12;
  LOWORD(v51) = v13;
  BYTE2(v51) = v40;
  uint64_t v52 = v15;
  unsigned __int8 v53 = v16;
  uint64_t v54 = v17;
  char v55 = v39;
  uint64_t v56 = v18;
  uint64_t v57 = v19;
  char v58 = v20;
  uint64_t v59 = v21;
  uint64_t v60 = v22;
  uint64_t v61 = v23;
  uint64_t v62 = v24;
  char v63 = 0;
  sub_100032FA0(&qword_1001583A0);
  sub_1000BE100(&qword_1001583A8, &qword_1001583A0, (void (*)(void))sub_1000BE4E8);
  View.accessibilityHidden(_:)();
  j__swift_release();
  sub_1000BC7F4((uint64_t)&v49);
  uint64_t v25 = v49;
  uint64_t v26 = v50;
  uint64_t v27 = v51;
  uint64_t v28 = v52;
  int v43 = v53;
  ScaledMetric.wrappedValue.getter();
  static Font.Weight.medium.getter();
  uint64_t v29 = type metadata accessor for Font.Design();
  uint64_t v30 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v45, 1, 1, v29);
  uint64_t v31 = static Font.system(size:weight:design:)();
  sub_100032F44(v30, &qword_1001568C0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v48;
  uint64_t v34 = v47;
  sub_100033344(v48, v47, &qword_100158398);
  uint64_t v35 = v46;
  sub_100033344(v34, v46, &qword_100158398);
  uint64_t v36 = v35 + *(int *)(sub_100032FA0(&qword_1001583F0) + 48);
  *(void *)uint64_t v36 = v25;
  *(void *)(v36 + 8) = v26;
  *(void *)(v36 + 16) = v27;
  *(void *)(v36 + 24) = v28;
  *(unsigned char *)(v36 + 32) = v43;
  *(void *)(v36 + 40) = KeyPath;
  *(void *)(v36 + 48) = v31;
  sub_10009D4C0(v25, v26, v27);
  swift_retain();
  swift_retain();
  sub_100032F44(v33, &qword_100158398);
  sub_10007E9AC(v25, v26, v27);
  swift_release();
  swift_release();
  return sub_100032F44(v34, &qword_100158398);
}

double sub_1000BC5A0@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_100154418 != -1) {
      swift_once();
    }
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v8 = Image.resizable(capInsets:resizingMode:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = v8;
    uint64_t v15 = 0;
    __int16 v16 = 1;
    char v17 = 0;
  }
  else
  {
    if (qword_100154410 != -1) {
      swift_once();
    }
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v9 = Image.resizable(capInsets:resizingMode:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = v9;
    uint64_t v15 = 0;
    __int16 v16 = 1;
    char v17 = 1;
  }
  sub_100032FA0(&qword_1001583E8);
  sub_1000BE600();
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v18;
  __int16 v11 = v19;
  char v12 = v20;
  *(_OWORD *)a2 = v18;
  *(_WORD *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 18) = v12;
  return result;
}

double sub_1000BC7F4@<D0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  Text.init(_:tableName:bundle:comment:)();
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_1000BC90C()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t sub_1000BC930(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_100156680);
  __chkstk_darwin(v2 - 8);
  sub_100033344(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100156680);
  return EnvironmentValues.editMode.setter();
}

uint64_t sub_1000BC9C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for EditMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CalculatorHistoryView();
  sub_100032FA0(&qword_1001580F8);
  State.wrappedValue.getter();
  char v6 = EditMode.isEditing.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    sub_1000BCB1C();
    uint64_t v7 = (unsigned int *)&enum case for KeyPress.Result.handled(_:);
  }
  else
  {
    uint64_t v7 = (unsigned int *)&enum case for KeyPress.Result.ignored(_:);
  }
  uint64_t v8 = *v7;
  uint64_t v9 = type metadata accessor for KeyPress.Result();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(a1, v8, v9);
}

uint64_t sub_1000BCB1C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000BCBE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EditMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v15 - v7;
  uint64_t v9 = *(void *)(a1 + 40);
  v15[0] = *(void *)(a1 + 32);
  v15[1] = v9;
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v10 = sub_10004CF90();
  swift_release();
  uint64_t v11 = *(void *)(v10 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v15[0] = v11;
  sub_1000121E8(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v12 = *(void *)(v11 + 48);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v13)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v8, enum case for EditMode.inactive(_:), v2);
    type metadata accessor for CalculatorHistoryView();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_100032FA0(&qword_1001580F8);
    State.wrappedValue.setter();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  return result;
}

uint64_t sub_1000BCE30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v23[1] = a2;
  uint64_t v3 = type metadata accessor for ToolbarItemPlacement();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100032FA0(&qword_1001585A8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[0] = sub_100032FA0(&qword_100158598);
  __chkstk_darwin(v23[0]);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v23 - v11;
  char v13 = *(unsigned char *)(a1 + 8);
  uint64_t v14 = swift_retain();
  uint64_t v15 = sub_10003B8B4(v14, v13);
  swift_release();
  swift_getKeyPath();
  uint64_t v24 = v15;
  sub_1000121E8(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v16 = *(unsigned char *)(v15 + 17);
  swift_release();
  if (v16)
  {
    uint64_t v17 = sub_100032FA0(&qword_1001585C0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
    uint64_t v18 = sub_100040BE4(&qword_1001585B0, &qword_1001585A8);
    uint64_t v24 = v4;
    uint64_t v25 = v18;
    swift_getOpaqueTypeConformance2();
    static ToolbarContentBuilder.buildIf<A>(_:)();
    sub_100032F44((uint64_t)v9, &qword_100158598);
  }
  else
  {
    uint64_t v19 = static ToolbarItemPlacement.bottomBar.getter();
    __chkstk_darwin(v19);
    v23[-2] = a1;
    sub_100032FA0(&qword_100158238);
    sub_1000BF1CC();
    ToolbarItemGroup.init(placement:content:)();
    uint64_t v20 = sub_100040BE4(&qword_1001585B0, &qword_1001585A8);
    static ToolbarContentBuilder.buildBlock<A>(_:)();
    uint64_t v21 = sub_100032FA0(&qword_1001585C0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 0, 1, v21);
    uint64_t v24 = v4;
    uint64_t v25 = v20;
    swift_getOpaqueTypeConformance2();
    static ToolbarContentBuilder.buildIf<A>(_:)();
    sub_100032F44((uint64_t)v9, &qword_100158598);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_1000BF0D4();
  static ToolbarContentBuilder.buildBlock<A>(_:)();
  return sub_100032F44((uint64_t)v12, &qword_100158598);
}

uint64_t sub_1000BD288(uint64_t a1, unint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 24);
  uint64_t v5 = swift_retain();
  sub_100033AA8(v5, v4);
  swift_release();
  sub_1000E73F8(a2, 1, 1);
  swift_release();
  char v6 = *(unsigned char *)(a1 + 8);
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_10003B8B4(v7, v6);
  swift_release();
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1001613A0;
  sub_100006C54();
  swift_getKeyPath();
  sub_1000121E8((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v9 + 64) == 1)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    *(unsigned char *)(v10 + 24) = 1;
    swift_retain();
    sub_1000F8E4C((uint64_t)sub_10006C2D0, v10);
    swift_release();
  }
  else
  {
    sub_1000943FC(1);
  }
  return swift_release();
}

uint64_t sub_1000BD44C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000BD4B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000BD4D8()
{
  return swift_release();
}

uint64_t sub_1000BD540()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000BD5AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000BD5CC()
{
  sub_100032FA0(&qword_100158220);
  State.wrappedValue.getter();
  uint64_t v0 = sub_10004CF90();
  swift_release();
  sub_100047F34();
  swift_getKeyPath();
  sub_1000121E8(&qword_100154E30, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.willSet<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  *(void *)(v0 + 24) = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
  sub_10004D0B4();
  swift_getKeyPath();
  ObservationRegistrar.didSet<A, B>(_:keyPath:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000BD740(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_10003B8B4(v2, v1);
  swift_release();
  if (qword_100154790 != -1) {
    swift_once();
  }
  sub_100006C54();
  sub_1000943FC(0);

  return swift_release();
}

uint64_t sub_1000BD7DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000BD7F8()
{
  sub_100032FA0(&qword_1001555B8);
  uint64_t result = Binding.wrappedValue.getter();
  if (v1 == 1) {
    return Binding.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000BD888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  char v7 = *((unsigned char *)v2 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  *(unsigned char *)(v8 + 32) = v7;
  uint64_t v9 = sub_100032FA0(&qword_100158648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a2, a1, v9);
  uint64_t v10 = (uint64_t (**)())(a2 + *(int *)(sub_100032FA0(&qword_100158650) + 36));
  *uint64_t v10 = sub_1000BF488;
  v10[1] = (uint64_t (*)())v8;
  v10[2] = 0;
  v10[3] = 0;
  swift_retain();

  return swift_retain();
}

uint64_t sub_1000BD978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CalculatorHistoryView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000BD9DC(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for CalculatorHistoryView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000B88DC(a1, a2, v6);
}

unint64_t sub_1000BDA64()
{
  unint64_t result = qword_100158200;
  if (!qword_100158200)
  {
    sub_1000317D8(&qword_1001581C8);
    sub_1000317D8(&qword_1001581B8);
    sub_100040BE4(&qword_1001581F8, &qword_1001581B8);
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100158208, &qword_100158210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158200);
  }
  return result;
}

unint64_t sub_1000BDB80()
{
  unint64_t result = qword_100158218;
  if (!qword_100158218)
  {
    sub_1000317D8(&qword_1001581D8);
    sub_1000317D8(&qword_1001581C8);
    sub_1000BDA64();
    swift_getOpaqueTypeConformance2();
    sub_1000121E8(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158218);
  }
  return result;
}

uint64_t sub_1000BDC64(uint64_t a1)
{
  return sub_1000B8E38(a1);
}

uint64_t sub_1000BDCC8()
{
  return sub_1000BD288(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000BDCE4()
{
  uint64_t v1 = type metadata accessor for PPTTestCase();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

void sub_1000BDD74()
{
}

uint64_t sub_1000BDDD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000BDDFC()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000BDE28()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_1000BDE4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ControlSize();
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_1000BDF1C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000BDF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_100154E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000BDFC4()
{
  return EnvironmentValues.controlSize.getter();
}

unint64_t sub_1000BDFEC()
{
  unint64_t result = qword_1001582C8;
  if (!qword_1001582C8)
  {
    sub_1000317D8(&qword_1001582C0);
    sub_1000317D8(&qword_1001582D0);
    sub_1000BE100(&qword_1001582D8, &qword_1001582D0, (void (*)(void))sub_1000BE0D0);
    swift_getOpaqueTypeConformance2();
    sub_1000BE2E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001582C8);
  }
  return result;
}

uint64_t sub_1000BE0D0()
{
  return sub_1000BE100(&qword_1001582E0, &qword_1001582E8, (void (*)(void))sub_1000BE17C);
}

uint64_t sub_1000BE100(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000BE17C()
{
  unint64_t result = qword_1001582F0;
  if (!qword_1001582F0)
  {
    sub_1000317D8(&qword_1001582F8);
    sub_1000BE21C();
    sub_100040BE4(&qword_100158320, &qword_100158328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001582F0);
  }
  return result;
}

unint64_t sub_1000BE21C()
{
  unint64_t result = qword_100158300;
  if (!qword_100158300)
  {
    sub_1000317D8(&qword_100158308);
    sub_100040BE4(&qword_100158310, &qword_100158318);
    sub_100040BE4(&qword_100155410, &qword_100155418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158300);
  }
  return result;
}

unint64_t sub_1000BE2E0()
{
  unint64_t result = qword_100158330;
  if (!qword_100158330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158330);
  }
  return result;
}

uint64_t sub_1000BE334()
{
  return sub_1000BE100(&qword_100158340, &qword_100158290, (void (*)(void))sub_1000BE364);
}

unint64_t sub_1000BE364()
{
  unint64_t result = qword_100158348;
  if (!qword_100158348)
  {
    sub_1000317D8(&qword_100158288);
    sub_100040BE4(&qword_100158350, &qword_100158280);
    sub_100040BE4(&qword_100157E98, &qword_100157E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158348);
  }
  return result;
}

unint64_t sub_1000BE428()
{
  unint64_t result = qword_100158358;
  if (!qword_100158358)
  {
    sub_1000317D8(&qword_1001582B0);
    sub_1000BDFEC();
    sub_1000BE100(&qword_100158338, &qword_100158298, (void (*)(void))sub_1000BE334);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158358);
  }
  return result;
}

uint64_t sub_1000BE4E8()
{
  return sub_1000BE100(&qword_1001583B0, &qword_1001583B8, (void (*)(void))sub_1000BE518);
}

unint64_t sub_1000BE518()
{
  unint64_t result = qword_1001583C0;
  if (!qword_1001583C0)
  {
    sub_1000317D8(&qword_1001583C8);
    sub_1000BE58C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001583C0);
  }
  return result;
}

unint64_t sub_1000BE58C()
{
  unint64_t result = qword_1001583D0;
  if (!qword_1001583D0)
  {
    sub_1000317D8(&qword_1001583D8);
    sub_1000BE600();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001583D0);
  }
  return result;
}

unint64_t sub_1000BE600()
{
  unint64_t result = qword_1001583E0;
  if (!qword_1001583E0)
  {
    sub_1000317D8(&qword_1001583E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001583E0);
  }
  return result;
}

unint64_t sub_1000BE680()
{
  unint64_t result = qword_100158440;
  if (!qword_100158440)
  {
    sub_1000317D8(&qword_100158418);
    sub_1000BE100(&qword_100158448, &qword_100158410, (void (*)(void))sub_1000BE74C);
    sub_100040BE4(&qword_100158460, &qword_100158468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158440);
  }
  return result;
}

unint64_t sub_1000BE74C()
{
  unint64_t result = qword_100158450;
  if (!qword_100158450)
  {
    sub_1000317D8(&qword_100158408);
    sub_100040BE4(&qword_100158458, &qword_100158400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158450);
  }
  return result;
}

uint64_t sub_1000BE7F8()
{
  return sub_1000BF288((uint64_t (*)(uint64_t))sub_1000BD540);
}

uint64_t sub_1000BE810@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000BE83C()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000BE86C()
{
  return sub_1000BF288((uint64_t (*)(uint64_t))sub_1000BD5CC);
}

unint64_t sub_1000BE884()
{
  unint64_t result = qword_1001584B0;
  if (!qword_1001584B0)
  {
    sub_1000317D8(&qword_1001584A8);
    sub_1000BE900();
    sub_1000BEA64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001584B0);
  }
  return result;
}

unint64_t sub_1000BE900()
{
  unint64_t result = qword_1001584B8;
  if (!qword_1001584B8)
  {
    sub_1000317D8(&qword_1001584A0);
    sub_1000BE99C(&qword_1001584C0, &qword_100158498, &qword_100155410, &qword_100155418);
    sub_10003C0DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001584B8);
  }
  return result;
}

uint64_t sub_1000BE99C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    sub_100040BE4(&qword_100156428, &qword_1001555F0);
    sub_100040BE4(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000BEA64()
{
  unint64_t result = qword_1001584C8;
  if (!qword_1001584C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001584C8);
  }
  return result;
}

uint64_t sub_1000BEABC()
{
  return sub_1000BF288((uint64_t (*)(uint64_t))sub_1000BD44C);
}

uint64_t sub_1000BEAD8()
{
  return sub_1000BF288((uint64_t (*)(uint64_t))sub_1000BD4D8);
}

uint64_t sub_1000BEAF8()
{
  return swift_deallocObject();
}

unint64_t sub_1000BEB08()
{
  unint64_t result = qword_1001584D8;
  if (!qword_1001584D8)
  {
    sub_1000317D8(&qword_1001584D0);
    sub_1000BE884();
    sub_100040BE4(&qword_100157520, &qword_100157528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001584D8);
  }
  return result;
}

unint64_t sub_1000BEBB0()
{
  unint64_t result = qword_100158500;
  if (!qword_100158500)
  {
    sub_1000317D8(&qword_100158488);
    sub_1000BEB08();
    sub_1000121E8(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158500);
  }
  return result;
}

unint64_t sub_1000BEC5C()
{
  unint64_t result = qword_100158508;
  if (!qword_100158508)
  {
    sub_1000317D8(&qword_100158478);
    sub_1000BE884();
    sub_1000121E8(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158508);
  }
  return result;
}

unint64_t sub_1000BED08()
{
  unint64_t result = qword_100158528;
  if (!qword_100158528)
  {
    sub_1000317D8(&qword_100158518);
    sub_1000121E8(&qword_100158530, (void (*)(uint64_t))&type metadata accessor for EditButton);
    sub_10003C0DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158528);
  }
  return result;
}

uint64_t sub_1000BEDB4()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t sub_1000BEDDC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000BEE40@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for CalculatorHistoryView();

  return sub_1000BC9C4(a1);
}

unint64_t sub_1000BEEB0()
{
  unint64_t result = qword_100158578;
  if (!qword_100158578)
  {
    sub_1000317D8(&qword_100158548);
    type metadata accessor for CalculatorHistoryListView();
    type metadata accessor for CalculatorHistoryViewModel(255);
    sub_1000121E8(&qword_100158570, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryListView);
    sub_1000121E8(&qword_100154E30, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryViewModel);
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100158580, &qword_100158538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158578);
  }
  return result;
}

uint64_t sub_1000BF004()
{
  return sub_1000BF288(sub_1000BCBE4);
}

uint64_t sub_1000BF01C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BCE30(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000BF024()
{
  unint64_t result = qword_100158590;
  if (!qword_100158590)
  {
    sub_1000317D8(&qword_100158558);
    sub_1000317D8(&qword_100158548);
    sub_1000BEEB0();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158590);
  }
  return result;
}

unint64_t sub_1000BF0D4()
{
  unint64_t result = qword_1001585A0;
  if (!qword_1001585A0)
  {
    sub_1000317D8(&qword_100158598);
    sub_1000317D8(&qword_1001585A8);
    sub_100040BE4(&qword_1001585B0, &qword_1001585A8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001585A0);
  }
  return result;
}

uint64_t sub_1000BF1A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000B81D4(a1);
}

unint64_t sub_1000BF1CC()
{
  unint64_t result = qword_1001585B8;
  if (!qword_1001585B8)
  {
    sub_1000317D8(&qword_100158238);
    sub_100040BE4(&qword_100158438, &qword_100158428);
    sub_1000BE680();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001585B8);
  }
  return result;
}

uint64_t sub_1000BF270()
{
  return sub_1000BF288(sub_1000BD740);
}

uint64_t sub_1000BF288(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CalculatorHistoryView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_1000BF2FC()
{
  unint64_t result = qword_100158638;
  if (!qword_100158638)
  {
    sub_1000317D8(&qword_100158628);
    sub_1000BE99C(&qword_100158640, &qword_100158620, (unint64_t *)&qword_1001557B8, &qword_1001557C0);
    sub_10003C0DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158638);
  }
  return result;
}

ValueMetadata *type metadata accessor for HistoryViewFirstLaunch()
{
  return &type metadata for HistoryViewFirstLaunch;
}

uint64_t sub_1000BF3A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BF42C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BF448()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000BF488()
{
  return sub_1000BD7F8();
}

unint64_t sub_1000BF498()
{
  unint64_t result = qword_100158658;
  if (!qword_100158658)
  {
    sub_1000317D8(&qword_100158650);
    sub_100040BE4(&qword_100158660, &qword_100158648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158658);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CalculatorButtonStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 1);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CalculatorButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 1) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1000BF5E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000331DC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 80);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000BF6A0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000BF7A0(uint64_t a1)
{
  int v1 = a1;
  uint64_t v2 = a1 & 0x1000000FFLL;
  if ((a1 & 0x1000000000000) != 0 || v2 == 0x100000002)
  {
    if (qword_100154528 != -1) {
      swift_once();
    }
    if (sub_100034AF8(v1, static CalculatorButtonRepresentable.swappableButtons))
    {
      if ((v1 & 0x10000) != 0)
      {
        if (qword_100154520 != -1) {
          swift_once();
        }
        if (sub_100034AF8(v1, static CalculatorButtonRepresentable.alternateRPNButtons))
        {
          if (v1 <= 0x23u)
          {
            if (v1 != 8)
            {
              if (v1 != 30) {
                goto LABEL_37;
              }
              goto LABEL_52;
            }
LABEL_44:
            if (qword_100154600 != -1) {
              swift_once();
            }
            uint64_t v3 = &qword_100161208;
            return *v3;
          }
          if (v1 != 36 && v1 != 55) {
            goto LABEL_37;
          }
LABEL_52:
          if (qword_100154620 != -1) {
            swift_once();
          }
          uint64_t v3 = &qword_100161228;
          return *v3;
        }
      }
      if ((v1 & 0x100) != 0)
      {
        if (qword_100154518 != -1) {
          swift_once();
        }
        if (sub_100034AF8(v1, static CalculatorButtonRepresentable.shiftableButtons))
        {
          LOBYTE(v1) = CalculatorButtonRepresentable.shiftedButton(isRPN:)(v1 & 0x10000);
LABEL_37:
          switch((char)v1)
          {
            case 1:
            case 2:
            case 3:
            case 34:
            case 52:
              goto LABEL_41;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 92:
              goto LABEL_44;
            case 9:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 51:
            case 53:
              goto LABEL_38;
            default:
              goto LABEL_52;
          }
        }
      }
      if ((v1 & 0x10000FF) != 0x1000001 && v2 != 0x100000002) {
        goto LABEL_37;
      }
LABEL_41:
      if (qword_1001545F0 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_1001611F8;
      return *v3;
    }
  }
  if ((v1 & 0x10000) == 0) {
    goto LABEL_25;
  }
  if (qword_100154520 != -1) {
    swift_once();
  }
  if (sub_100034AF8(v1, static CalculatorButtonRepresentable.alternateRPNButtons))
  {
    if (v1 > 0x23u)
    {
      if (v1 == 36 || v1 == 55) {
        goto LABEL_52;
      }
    }
    else
    {
      if (v1 == 8) {
        goto LABEL_44;
      }
      if (v1 == 30) {
        goto LABEL_52;
      }
    }
  }
  else
  {
    if ((v1 & 0x100) == 0) {
      goto LABEL_27;
    }
LABEL_25:
    if (qword_100154518 != -1) {
      swift_once();
    }
    if (sub_100034AF8(v1, static CalculatorButtonRepresentable.shiftableButtons))
    {
      LOBYTE(v1) = CalculatorButtonRepresentable.shiftedButton(isRPN:)(v1 & 0x10000);
    }
    else
    {
LABEL_27:
      if ((v1 & 0x10000FF) == 0x1000001) {
        goto LABEL_41;
      }
      if (v2 == 0x100000002) {
        goto LABEL_52;
      }
    }
  }
  switch((char)v1)
  {
    case 1:
    case 2:
    case 3:
    case 52:
      goto LABEL_41;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 92:
      goto LABEL_44;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 53:
LABEL_38:
      if (qword_100154610 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_100161218;
      break;
    default:
      goto LABEL_52;
  }
  return *v3;
}

uint64_t sub_1000C013C()
{
  return sub_10005A7E8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000C0158()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C01B4()
{
  type metadata accessor for CalculatorNetworkManager();
  uint64_t v0 = swift_allocObject();
  *(unsigned char *)(v0 + 16) = 0;
  type metadata accessor for NWPathMonitor();
  swift_allocObject();
  *(void *)(v0 + 24) = NWPathMonitor.init()();
  ObservationRegistrar.init()();
  uint64_t result = sub_1000C0830();
  qword_100161330 = v0;
  return result;
}

uint64_t sub_1000C022C()
{
  swift_getKeyPath();
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1000C02CC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_1000C02D4()
{
  return swift_retain();
}

uint64_t sub_1000C0378@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  *a2 = *(void *)(v3 + 24);
  return swift_retain();
}

uint64_t sub_1000C0424()
{
  return swift_release();
}

uint64_t CalculatorNetworkManager.deinit()
{
  swift_getKeyPath();
  uint64_t v1 = v0 + OBJC_IVAR____TtC10Calculator24CalculatorNetworkManager___observationRegistrar;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_retain();
  NWPathMonitor.cancel()();
  swift_release();
  swift_release();
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t type metadata accessor for CalculatorNetworkManager()
{
  uint64_t result = qword_1001587A0;
  if (!qword_1001587A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CalculatorNetworkManager.__deallocating_deinit()
{
  swift_getKeyPath();
  uint64_t v1 = v0 + OBJC_IVAR____TtC10Calculator24CalculatorNetworkManager___observationRegistrar;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_retain();
  NWPathMonitor.cancel()();
  swift_release();
  swift_release();
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1000C0780()
{
  return type metadata accessor for CalculatorNetworkManager();
}

uint64_t sub_1000C0788()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000C0830()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100032FA0(&qword_100154B68);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v1;
  swift_retain();
  sub_100013710((uint64_t)v10, (uint64_t)&unk_1001588B8, (uint64_t)v12);
  swift_release();
  swift_getKeyPath();
  char v16 = v1;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  sub_100004A98();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  char v16 = _swiftEmptyArrayStorage;
  sub_1000C0DE0(&qword_1001588C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100032FA0(&qword_1001588C8);
  sub_1000C0E28();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  char v13 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  NWPathMonitor.start(queue:)();

  return swift_release();
}

uint64_t sub_1000C0BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  return _swift_task_switch(sub_1000C0BE4, 0, 0);
}

uint64_t sub_1000C0BE4()
{
  uint64_t v1 = v0[3];
  swift_getKeyPath();
  v0[2] = v1;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_1000C1170((uint64_t)sub_1000C1168);
  NWPathMonitor.pathUpdateHandler.setter();
  swift_release();
  swift_release_n();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1000C0D34()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10004BC10;
  v3[3] = v2;
  return _swift_task_switch(sub_1000C0BE4, 0, 0);
}

uint64_t sub_1000C0DE0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000C0E28()
{
  unint64_t result = qword_1001588D0;
  if (!qword_1001588D0)
  {
    sub_1000317D8(&qword_1001588C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1001588D0);
  }
  return result;
}

uint64_t sub_1000C0E84()
{
  swift_weakDestroy();

  return swift_deallocObject();
}

uint64_t sub_1000C0EBC()
{
  uint64_t v0 = sub_100032FA0(&qword_100154B68);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for NWPath.Status();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - v8;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    NWPath.status.getter();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for NWPath.Status.satisfied(_:), v3);
    char v12 = static NWPath.Status.== infix(_:_:)();
    char v13 = *(void (**)(char *, uint64_t))(v4 + 8);
    v13(v6, v3);
    v13(v9, v3);
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v2, 1, 1, v14);
    type metadata accessor for MainActor();
    swift_retain();
    uint64_t v15 = static MainActor.shared.getter();
    char v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = &protocol witness table for MainActor;
    v16[4] = v11;
    if (v12) {
      uint64_t v17 = &unk_1001588F0;
    }
    else {
      uint64_t v17 = &unk_1001588E0;
    }
    sub_100013710((uint64_t)v2, (uint64_t)v17, (uint64_t)v16);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000C1168()
{
  return sub_1000C0EBC();
}

uint64_t sub_1000C1170(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000C1180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 32) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C1218, v6, v5);
}

uint64_t sub_1000C1218()
{
  uint64_t v1 = v0[3];
  swift_release();
  swift_getKeyPath();
  v0[2] = v1;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if ((*(unsigned char *)(v1 + 16) & 1) == 0)
  {
    uint64_t v2 = v0[3];
    swift_getKeyPath();
    uint64_t v3 = swift_task_alloc();
    *(void *)(v3 + 16) = v2;
    *(unsigned char *)(v3 + 24) = 1;
    v0[2] = v2;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_task_dealloc();
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000C1384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 32) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000C141C, v6, v5);
}

uint64_t sub_1000C141C()
{
  uint64_t v1 = v0[3];
  swift_release();
  swift_getKeyPath();
  v0[2] = v1;
  sub_1000C0DE0((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    uint64_t v2 = v0[3];
    swift_getKeyPath();
    uint64_t v3 = swift_task_alloc();
    *(void *)(v3 + 16) = v2;
    *(unsigned char *)(v3 + 24) = 0;
    v0[2] = v2;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_task_dealloc();
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000C158C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003819C;
  return sub_1000C1384(a1, v4, v5, v6);
}

uint64_t sub_1000C1644(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003819C;
  return sub_1000C1180(a1, v4, v5, v6);
}

uint64_t sub_1000C1700()
{
  *(void *)(*(void *)(v0 + 16) + 24) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

BOOL static HistoryPresentationStyle.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void HistoryPresentationStyle.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int HistoryPresentationStyle.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

unint64_t sub_1000C1D84()
{
  unint64_t result = qword_1001588F8;
  if (!qword_1001588F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001588F8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for HistoryPresentationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1000C1EA4);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

void *sub_1000C1ECC(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    char v8 = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = v8;
    char v9 = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = v9;
    uint64_t v10 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v10;
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    *(unsigned char *)(a1 + 65) = *((unsigned char *)a2 + 65);
    uint64_t v11 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v11;
    uint64_t v12 = a2[12];
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = v12;
    uint64_t v13 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    *(void *)(a1 + 112) = v13;
    *(unsigned char *)(a1 + 120) = *((unsigned char *)a2 + 120);
    *(void *)(a1 + 128) = a2[16];
    *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
    *(void *)(a1 + 144) = a2[18];
    *(unsigned char *)(a1 + 152) = *((unsigned char *)a2 + 152);
    uint64_t v14 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v14;
    uint64_t v15 = a3[14];
    uint64_t v20 = (uint64_t)a2 + v15;
    uint64_t v21 = a1 + v15;
    *(void *)(a1 + 176) = a2[22];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v16 = sub_100032FA0(&qword_100156688);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v21, v20, v16);
    v17((uint64_t)v4 + a3[15], (uint64_t)a2 + a3[15], v16);
    v17((uint64_t)v4 + a3[16], (uint64_t)a2 + a3[16], v16);
    v17((uint64_t)v4 + a3[17], (uint64_t)a2 + a3[17], v16);
    v17((uint64_t)v4 + a3[18], (uint64_t)a2 + a3[18], v16);
    v17((uint64_t)v4 + a3[19], (uint64_t)a2 + a3[19], v16);
  }
  return v4;
}

uint64_t sub_1000C215C(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + a2[14];
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  char v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  v8(a1 + a2[15], v5);
  v8(a1 + a2[16], v5);
  v8(a1 + a2[17], v5);
  v8(a1 + a2[18], v5);
  uint64_t v6 = a1 + a2[19];

  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v5);
}

uint64_t sub_1000C22E0(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  char v8 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  uint64_t v11 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v11;
  uint64_t v12 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v12;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v13 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v13;
  uint64_t v14 = a3[14];
  uint64_t v18 = a2 + v14;
  uint64_t v19 = a1 + v14;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v15 = sub_100032FA0(&qword_100156688);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v19, v18, v15);
  v16(a1 + a3[15], a2 + a3[15], v15);
  v16(a1 + a3[16], a2 + a3[16], v15);
  v16(a1 + a3[17], a2 + a3[17], v15);
  v16(a1 + a3[18], a2 + a3[18], v15);
  v16(a1 + a3[19], a2 + a3[19], v15);
  return a1;
}

uint64_t sub_1000C2520(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  char v8 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v8;
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  uint64_t v9 = a3[14];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100032FA0(&qword_100156688);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(a1 + a3[15], a2 + a3[15], v12);
  v13(a1 + a3[16], a2 + a3[16], v12);
  v13(a1 + a3[17], a2 + a3[17], v12);
  v13(a1 + a3[18], a2 + a3[18], v12);
  v13(a1 + a3[19], a2 + a3[19], v12);
  return a1;
}

uint64_t sub_1000C27D0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  uint64_t v6 = a3[14];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  uint64_t v9 = sub_100032FA0(&qword_100156688);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[15], a2 + a3[15], v9);
  v10(a1 + a3[16], a2 + a3[16], v9);
  v10(a1 + a3[17], a2 + a3[17], v9);
  v10(a1 + a3[18], a2 + a3[18], v9);
  v10(a1 + a3[19], a2 + a3[19], v9);
  return a1;
}

uint64_t sub_1000C2980(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  swift_release();
  char v8 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v8;
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v11 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_release();
  uint64_t v12 = a3[14];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100032FA0(&qword_100156688);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(a1 + a3[15], a2 + a3[15], v15);
  v16(a1 + a3[16], a2 + a3[16], v15);
  v16(a1 + a3[17], a2 + a3[17], v15);
  v16(a1 + a3[18], a2 + a3[18], v15);
  v16(a1 + a3[19], a2 + a3[19], v15);
  return a1;
}

uint64_t sub_1000C2BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C2BC4);
}

uint64_t sub_1000C2BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100032FA0(&qword_100156688);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000C2C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C2C8C);
}

uint64_t sub_1000C2C8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100156688);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 56);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for UnitConversionPopoverView()
{
  uint64_t result = qword_100158980;
  if (!qword_100158980) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000C2D84()
{
  sub_10003B690();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000C2E64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C2E80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100014344((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
  swift_beginAccess();
  uint64_t v5 = type metadata accessor for UserInterfaceSizeClass();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1000C2F7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a1, v4, v6);
  uint64_t v9 = *a2;
  swift_getKeyPath();
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  sub_100014344((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t *sub_1000C3104@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 120) = v30;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 152) = v32;
  *(_OWORD *)(a9 + 168) = v33;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 88) = v28;
  *(void *)(a9 + 64) = *(void *)(v13 + 64);
  *(_OWORD *)(a9 + 104) = v29;

  return sub_1000D60D0((uint64_t *)v13);
}

double sub_1000C32D0@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10002611C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100156910, &qword_100156918).n128_u64[0];
  return result;
}

double sub_1000C332C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10002611C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1001582F8, &qword_1001582E8).n128_u64[0];
  return result;
}

double sub_1000C3388@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10002611C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100158288, &qword_100158290).n128_u64[0];
  return result;
}

__n128 sub_1000C33E4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v24 = sub_100032FA0(&qword_100158A00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  long long v25 = (_OWORD *)(a9 + *(int *)(sub_100032FA0(&qword_100158A08) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *long long v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  void v25[3] = v30;
  return result;
}

uint64_t sub_1000C35D0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[11];
  a9[10] = v13[10];
  a9[11] = v24;
  a9[12] = v13[12];
  *(_OWORD *)((char *)a9 + 201) = *(_OWORD *)((char *)v13 + 201);
  long long v25 = v13[7];
  a9[6] = v13[6];
  a9[7] = v25;
  long long v26 = v13[9];
  a9[8] = v13[8];
  a9[9] = v26;
  long long v27 = v13[3];
  a9[2] = v13[2];
  a9[3] = v27;
  long long v28 = v13[5];
  a9[4] = v13[4];
  a9[5] = v28;
  long long v29 = v13[1];
  *a9 = *v13;
  a9[1] = v29;
  a9[18] = v35;
  a9[19] = v36;
  a9[20] = v37;
  a9[14] = v31;
  a9[15] = v32;
  a9[16] = v33;
  a9[17] = v34;

  return sub_1000D42A8((uint64_t)v13);
}

uint64_t sub_1000C37B8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    long long v24 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v15 = a9;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  memcpy((void *)v15, v14, 0x108uLL);
  *(_OWORD *)(v15 + 328) = v31;
  *(_OWORD *)(v15 + 344) = v32;
  *(_OWORD *)(v15 + 360) = v33;
  *(_OWORD *)(v15 + 264) = v27;
  *(_OWORD *)(v15 + 280) = v28;
  *(_OWORD *)(v15 + 296) = v29;
  *(_OWORD *)(v15 + 312) = v30;

  return sub_1000D6140((uint64_t)v14);
}

double sub_1000C397C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10002611C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1001590C0, &qword_1001590C8).n128_u64[0];
  return result;
}

uint64_t sub_1000C39D8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[7];
  a9[6] = v13[6];
  a9[7] = v24;
  long long v25 = v13[9];
  a9[8] = v13[8];
  a9[9] = v25;
  long long v26 = v13[3];
  a9[2] = v13[2];
  a9[3] = v26;
  long long v27 = v13[5];
  a9[4] = v13[4];
  a9[5] = v27;
  long long v28 = v13[1];
  *a9 = *v13;
  a9[1] = v28;
  a9[14] = v34;
  a9[15] = v35;
  a9[16] = v36;
  a9[10] = v30;
  a9[11] = v31;
  a9[12] = v32;
  a9[13] = v33;

  return sub_100063150((uint64_t)v13);
}

uint64_t sub_1000C3BA8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100014344((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 53);
  return result;
}

uint64_t sub_1000C3C50()
{
  return swift_release();
}

uint64_t sub_1000C3D20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  type metadata accessor for CalculatorViewModel();
  sub_100014344((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  *(void *)a5 = Environment.init<A>(_:)();
  *(unsigned char *)(a5 + 8) = v10 & 1;
  type metadata accessor for CalculatorUnitConversionViewModelWrapper(0);
  sub_100014344(&qword_100156660, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModelWrapper);
  *(void *)(a5 + 16) = Environment.init<A>(_:)();
  *(unsigned char *)(a5 + 24) = v11 & 1;
  type metadata accessor for CalculatorLayout();
  sub_100014344((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  *(void *)(a5 + 32) = Environment.init<A>(_:)();
  *(unsigned char *)(a5 + 40) = v12 & 1;
  *(void *)(a5 + 48) = a1;
  *(void *)(a5 + 56) = a2;
  *(unsigned char *)(a5 + 64) = a3;
  *(unsigned char *)(a5 + 65) = a4;
  sub_100032FA0(&qword_100154B90);
  State.init(wrappedValue:)();
  *(_OWORD *)(a5 + 72) = v16;
  *(void *)(a5 + 88) = v17;
  State.init(wrappedValue:)();
  *(_OWORD *)(a5 + 96) = v16;
  *(void *)(a5 + 112) = v17;
  State.init(wrappedValue:)();
  *(unsigned char *)(a5 + 120) = v16;
  *(void *)(a5 + 128) = *((void *)&v16 + 1);
  *(unsigned char *)(a5 + 136) = FocusState.init<>()() & 1;
  *(void *)(a5 + 144) = v13;
  *(unsigned char *)(a5 + 152) = v14 & 1;
  State.init(wrappedValue:)();
  *(_OWORD *)(a5 + 160) = v16;
  *(void *)(a5 + 176) = v17;
  type metadata accessor for UnitConversionPopoverView();
  if (qword_100154340 != -1) {
    swift_once();
  }
  sub_10003B8D0();
  ScaledMetric.init(wrappedValue:)();
  if (qword_100154348 != -1) {
    swift_once();
  }
  ScaledMetric.init(wrappedValue:)();
  if (qword_100154350 != -1) {
    swift_once();
  }
  ScaledMetric.init(wrappedValue:)();
  if (qword_100154378 != -1) {
    swift_once();
  }
  ScaledMetric.init(wrappedValue:)();
  if (qword_1001542D8 != -1) {
    swift_once();
  }
  ScaledMetric.init(wrappedValue:)();
  if (qword_1001542C8 != -1) {
    swift_once();
  }
  return ScaledMetric.init(wrappedValue:)();
}

id sub_1000C4184@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100014344(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 32);
  *a2 = v4;

  return v4;
}

void sub_1000C423C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100014344(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

void *sub_1000C4318()
{
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  if (!v10) {
    return 0;
  }
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = swift_retain();
  sub_1000333A8(v2, v1, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  sub_100073414();
  swift_release();
  swift_retain();
  swift_release();
  uint64_t v3 = sub_1000A29C0();
  swift_release();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_100074534(v9, v10), (v5 & 1) != 0))
  {
    double v6 = *(void **)(*(void *)(v3 + 56) + 16 * v4);
    id v7 = v6;
    swift_bridgeObjectRetain();
  }
  else
  {
    double v6 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000C4454(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  int v5 = *(unsigned __int8 *)(v2 + 65);
  char v6 = *(unsigned char *)(v2 + 24);
  uint64_t v7 = swift_retain();
  sub_1000333A8(v7, v6, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  sub_100073414();
  uint64_t v8 = swift_release();
  if (v5 == 1) {
    uint64_t v9 = a1(v8);
  }
  else {
    uint64_t v9 = a2(v8);
  }
  uint64_t v10 = v9;
  swift_release();
  return v10;
}

uint64_t sub_1000C4508@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v146 = a1;
  uint64_t v3 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v143 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v144 = v4;
  uint64_t v145 = (uint64_t)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  uint64_t v104 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v103 = (char *)&v102 - v7;
  uint64_t v124 = type metadata accessor for SearchPresentationToolbarBehavior();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v121 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode();
  uint64_t v9 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  char v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = type metadata accessor for SearchFieldPlacement();
  uint64_t v117 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v148 = (char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100032FA0(&qword_1001589F0);
  uint64_t v115 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  int v111 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_100032FA0(&qword_1001589F8);
  uint64_t v118 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v149 = (uint64_t (*)())((char *)&v102 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v122 = sub_100032FA0(&qword_100158A00);
  uint64_t v120 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v112 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100032FA0(&qword_100158A08);
  __chkstk_darwin(v16 - 8);
  uint64_t v147 = (uint64_t)&v102 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100032FA0(&qword_100158A10);
  __chkstk_darwin(v126);
  uint64_t v129 = (uint64_t)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100032FA0(&qword_100158A18);
  __chkstk_darwin(v127);
  v131 = (char *)&v102 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_100032FA0(&qword_100158A20);
  __chkstk_darwin(v130);
  uint64_t v133 = (uint64_t)&v102 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100032FA0(&qword_100158A28);
  __chkstk_darwin(v132);
  uint64_t v134 = (uint64_t)&v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_100032FA0(&qword_100158A30);
  __chkstk_darwin(v140);
  uint64_t v136 = (uint64_t)&v102 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100032FA0(&qword_100158A38);
  uint64_t v141 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v138 = (char *)&v102 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100032FA0(&qword_100158A40);
  uint64_t v137 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v135 = (char *)&v102 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = v1;
  sub_100032FA0(&qword_100158A48);
  uint64_t v25 = sub_1000317D8(&qword_100158A50);
  uint64_t v26 = sub_1000317D8(&qword_100158A58);
  uint64_t v27 = sub_100040BE4(&qword_100158A60, &qword_100158A50);
  uint64_t v28 = sub_1000317D8(&qword_100158A68);
  unint64_t v29 = sub_1000C9098();
  *(void *)&long long v155 = v28;
  *((void *)&v155 + 1) = v29;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v155 = v25;
  *((void *)&v155 + 1) = v26;
  *(void *)&long long v156 = v27;
  *((void *)&v156 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  NavigationStack.init<>(root:)();
  uint64_t v31 = *(void *)(v2 + 176);
  long long v151 = *(_OWORD *)(v2 + 160);
  uint64_t v152 = v31;
  sub_100032FA0(&qword_100158A88);
  State.projectedValue.getter();
  uint64_t v107 = v155;
  uint64_t v110 = v156;
  char v32 = *(unsigned char *)(v2 + 120);
  uint64_t v128 = v2;
  uint64_t v33 = *(void *)(v2 + 128);
  LOBYTE(v151) = v32;
  *((void *)&v151 + 1) = v33;
  uint64_t v125 = sub_100032FA0(&qword_100154898);
  State.projectedValue.getter();
  uint64_t v108 = *((void *)&v155 + 1);
  int v109 = v156;
  static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter();
  static SearchFieldPlacement.navigationBarDrawer(displayMode:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v113);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v34 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v36 = v35;
  LOBYTE(v11) = v37 & 1;
  uint64_t v113 = sub_100040BE4(&qword_100158A90, &qword_1001589F0);
  uint64_t v38 = v114;
  int v39 = v111;
  View.searchable(text:isPresented:placement:prompt:)();
  uint64_t v40 = v36;
  uint64_t v41 = v112;
  sub_1000356E0(v34, v40, (char)v11);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v148, v119);
  uint64_t v42 = v39;
  uint64_t v43 = v38;
  (*(void (**)(char *, uint64_t))(v115 + 8))(v42, v38);
  uint64_t v44 = v121;
  static SearchPresentationToolbarBehavior.avoidHidingContent.getter();
  *(void *)&long long v155 = v43;
  *((void *)&v155 + 1) = v113;
  swift_getOpaqueTypeConformance2();
  uint64_t v45 = v116;
  uint64_t v46 = v149;
  View.searchPresentationToolbarBehavior(_:)();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v44, v124);
  (*(void (**)(uint64_t (*)(), uint64_t))(v118 + 8))(v46, v45);
  if (qword_1001542A0 != -1) {
    swift_once();
  }
  double v47 = *(double *)&qword_100160D88;
  static Alignment.center.getter();
  uint64_t v48 = v147;
  __n128 v49 = sub_1000C33E4(0.0, 1, 0.0, 1, 0.0, 1, v47, 0, v147, INFINITY, 0, INFINITY, 0);
  (*(void (**)(char *, uint64_t, __n128))(v120 + 8))(v41, v122, v49);
  char v50 = static Edge.Set.top.getter();
  uint64_t v51 = v128;
  char v52 = *(unsigned char *)(v128 + 40);
  uint64_t v53 = swift_retain();
  uint64_t v54 = sub_1000333A8(v53, v52, 0xD000000000000010, 0x800000010010ADB0);
  swift_release();
  id v55 = [self currentDevice];
  id v56 = [v55 userInterfaceIdiom];

  if (v56)
  {
    swift_getKeyPath();
    *(void *)&long long v155 = v54;
    sub_100014344((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v57 = v54 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
    swift_beginAccess();
    uint64_t v58 = v105;
    uint64_t v59 = v103;
    char v60 = v50;
    uint64_t v61 = v51;
    uint64_t v62 = v106;
    (*(void (**)(char *, uint64_t, uint64_t))(v105 + 16))(v103, v57, v106);
    char v63 = v104;
    (*(void (**)(char *, void, uint64_t))(v58 + 104))(v104, enum case for UserInterfaceSizeClass.compact(_:), v62);
    LOBYTE(v57) = static UserInterfaceSizeClass.== infix(_:_:)();
    uint64_t v64 = *(void (**)(char *, uint64_t))(v58 + 8);
    v64(v63, v62);
    uint64_t v65 = v62;
    uint64_t v51 = v61;
    char v50 = v60;
    v64(v59, v65);
    uint64_t v48 = v147;
    swift_release();
    uint64_t v66 = (uint64_t)v131;
    if ((v57 & 1) == 0 && qword_1001542A8 != -1) {
      swift_once();
    }
  }
  else
  {
    swift_release();
    uint64_t v66 = (uint64_t)v131;
  }
  EdgeInsets.init(_all:)();
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v75 = v129;
  sub_100033344(v48, v129, &qword_100158A08);
  uint64_t v76 = v75 + *(int *)(v126 + 36);
  *(unsigned char *)uint64_t v76 = v50;
  *(void *)(v76 + 8) = v68;
  *(void *)(v76 + 16) = v70;
  *(void *)(v76 + 24) = v72;
  *(void *)(v76 + 32) = v74;
  *(unsigned char *)(v76 + 40) = 0;
  sub_100032F44(v48, &qword_100158A08);
  char v77 = *(unsigned char *)(v51 + 40);
  uint64_t v78 = swift_retain();
  uint64_t v79 = sub_1000333A8(v78, v77, 0xD000000000000010, 0x800000010010ADB0);
  swift_release();
  sub_1000D662C(v79);
  swift_release();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100033344(v75, v66, &qword_100158A10);
  uint64_t v80 = (_OWORD *)(v66 + *(int *)(v127 + 36));
  long long v81 = v156;
  *uint64_t v80 = v155;
  v80[1] = v81;
  v80[2] = v157;
  sub_100032F44(v75, &qword_100158A10);
  if (qword_100154658 != -1) {
    swift_once();
  }
  uint64_t v82 = qword_100161260;
  swift_retain();
  char v83 = static Edge.Set.all.getter();
  uint64_t v84 = v133;
  sub_100033344(v66, v133, &qword_100158A18);
  uint64_t v85 = v84 + *(int *)(v130 + 36);
  *(void *)uint64_t v85 = v82;
  *(unsigned char *)(v85 + 8) = v83;
  sub_100032F44(v66, &qword_100158A18);
  uint64_t v86 = v145;
  uint64_t v149 = type metadata accessor for UnitConversionPopoverView;
  sub_1000D5F30(v51, v145, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v87 = (*(unsigned __int8 *)(v143 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80);
  uint64_t v88 = swift_allocObject();
  sub_1000D27C4(v86, v88 + v87);
  uint64_t v89 = v134;
  sub_100033344(v84, v134, &qword_100158A20);
  uint64_t v90 = (uint64_t (**)())(v89 + *(int *)(v132 + 36));
  char *v90 = sub_1000D2828;
  v90[1] = (uint64_t (*)())v88;
  v90[2] = 0;
  v90[3] = 0;
  sub_100032F44(v84, &qword_100158A20);
  sub_1000D5F30(v51, v86, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  uint64_t v91 = swift_allocObject();
  sub_1000D27C4(v86, v91 + v87);
  uint64_t v92 = v136;
  sub_100033344(v89, v136, &qword_100158A28);
  uint64_t v93 = v140;
  uint64_t v94 = (void *)(v92 + *(int *)(v140 + 36));
  *uint64_t v94 = 0;
  v94[1] = 0;
  v94[2] = sub_1000D2844;
  v94[3] = v91;
  sub_100032F44(v89, &qword_100158A28);
  uint64_t v95 = *(void *)(v51 + 128);
  LOBYTE(v151) = *(unsigned char *)(v51 + 120);
  *((void *)&v151 + 1) = v95;
  State.wrappedValue.getter();
  LOBYTE(v151) = v154;
  sub_1000D5F30(v51, v86, (uint64_t (*)(void))v149);
  uint64_t v96 = swift_allocObject();
  sub_1000D27C4(v86, v96 + v87);
  uint64_t v97 = sub_1000D28A8(&qword_100158A98, &qword_100158A30, (void (*)(void))sub_1000D2878);
  unint64_t v98 = v138;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_100032F44(v92, &qword_100158A30);
  *(void *)&long long v151 = v93;
  *((void *)&v151 + 1) = &type metadata for Bool;
  uint64_t v152 = v97;
  uint64_t v153 = &protocol witness table for Bool;
  swift_getOpaqueTypeConformance2();
  uint64_t v99 = v135;
  uint64_t v100 = v142;
  View.allowsSecureDrawing()();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v98, v100);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v137 + 32))(v146, v99, v139);
}

uint64_t sub_1000C585C(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_100158A50);
  __chkstk_darwin(v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v4 = static HorizontalAlignment.leading.getter();
  *((void *)v4 + 1) = 0;
  v4[16] = 0;
  uint64_t v5 = sub_100032FA0(&qword_100158AD8);
  sub_1000C59D0(a1, (uint64_t)&v4[*(int *)(v5 + 44)]);
  uint64_t v10 = a1;
  sub_100032FA0(&qword_100158A58);
  sub_100040BE4(&qword_100158A60, &qword_100158A50);
  uint64_t v6 = sub_1000317D8(&qword_100158A68);
  unint64_t v7 = sub_1000C9098();
  uint64_t v11 = v6;
  unint64_t v12 = v7;
  swift_getOpaqueTypeConformance2();
  View.toolbar<A>(content:)();
  return sub_100032F44((uint64_t)v4, &qword_100158A50);
}

uint64_t sub_1000C59D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = type metadata accessor for PlainListStyle();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v29 = v3;
  uint64_t v30 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100032FA0(&qword_100158AE8);
  __chkstk_darwin(v24);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032FA0(&qword_100158AF0);
  uint64_t v25 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100158AF8);
  uint64_t v26 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100032FA0(&qword_100158B00);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a1;
  sub_1000C7930(a1, (uint64_t)v8);
  sub_100032FA0(&qword_100158B08);
  sub_1000D2FB4(&qword_100158B10, &qword_100158B08, (void (*)(void))sub_1000D2B98);
  sub_1000D2FB4(&qword_100158BD8, &qword_100158AE8, (void (*)(void))sub_1000D3020);
  Section<>.init(footer:content:)();
  PlainListStyle.init()();
  unint64_t v19 = sub_1000D325C();
  uint64_t v20 = v29;
  View.listStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v20);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  uint64_t v33 = v9;
  uint64_t v34 = v20;
  unint64_t v35 = v19;
  uint64_t v36 = &protocol witness table for PlainListStyle;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  View.scrollContentBackground(_:)();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  uint64_t v33 = v12;
  uint64_t v34 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v27;
  View.accessibilityIdentifier(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v18, v22);
}

uint64_t sub_1000C5E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v95 = sub_100032FA0(&qword_100158BD0);
  __chkstk_darwin(v95);
  uint64_t v86 = (void (*)(char *, uint64_t))((char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100032FA0(&qword_100158D80);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v85 = (uint64_t)&v78 - v8;
  uint64_t v9 = sub_100032FA0(&qword_100158D88);
  __chkstk_darwin(v9 - 8);
  uint64_t v83 = (uint64_t)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v84 = (uint64_t)&v78 - v12;
  uint64_t v90 = sub_100032FA0(&qword_100158B50);
  __chkstk_darwin(v90);
  uint64_t v82 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100032FA0(&qword_100158D90);
  __chkstk_darwin(v92);
  uint64_t v93 = (uint64_t)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100032FA0(&qword_100158D98);
  __chkstk_darwin(v87);
  uint64_t v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_100032FA0(&qword_100158B40);
  __chkstk_darwin(v88);
  uint64_t v80 = (uint64_t)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100032FA0(&qword_100158B30);
  __chkstk_darwin(v91);
  uint64_t v89 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100032FA0(&qword_100158B08);
  __chkstk_darwin(v19 - 8);
  uint64_t v94 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100032FA0(&qword_100158DA0);
  uint64_t v78 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v22 = (char *)&v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  long long v81 = (char *)&v78 - v24;
  uint64_t v25 = sub_100032FA0(&qword_100158DA8);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v78 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v78 - v29;
  uint64_t v31 = *(void *)(a1 + 128);
  LOBYTE(v99) = *(unsigned char *)(a1 + 120);
  *((void *)&v99 + 1) = v31;
  sub_100032FA0(&qword_100154898);
  State.wrappedValue.getter();
  if (v97 != 1) {
    goto LABEL_5;
  }
  uint64_t v32 = *(void *)(a1 + 176);
  long long v99 = *(_OWORD *)(a1 + 160);
  uint64_t v100 = v32;
  sub_100032FA0(&qword_100158A88);
  State.wrappedValue.getter();
  uint64_t v33 = v6;
  uint64_t v35 = v97;
  unint64_t v34 = v98;
  swift_bridgeObjectRelease();
  uint64_t v36 = HIBYTE(v34) & 0xF;
  uint64_t v37 = v35 & 0xFFFFFFFFFFFFLL;
  uint64_t v6 = v33;
  if ((v34 & 0x2000000000000000) == 0) {
    uint64_t v36 = v37;
  }
  if (v36) {
    goto LABEL_5;
  }
  char v61 = *(unsigned char *)(a1 + 24);
  uint64_t v62 = swift_retain();
  sub_1000333A8(v62, v61, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  uint64_t v63 = sub_100073414();
  swift_release();
  uint64_t v64 = *(void *)(v63 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v99 = v64;
  sub_100014344((unint64_t *)&qword_100155238, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionDataProvider);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  unint64_t v65 = *(void *)(v64 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  if (v65 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v66 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v33;
  if (v66)
  {
    *(void *)uint64_t v30 = static HorizontalAlignment.center.getter();
    *((void *)v30 + 1) = 0;
    v30[16] = 1;
    uint64_t v67 = sub_100032FA0(&qword_100158DB8);
    sub_1000CAC04(a1, (uint64_t)&v30[*(int *)(v67 + 44)]);
    uint64_t v68 = v81;
    sub_1000C6ADC();
    sub_100033344((uint64_t)v30, (uint64_t)v27, &qword_100158DA8);
    uint64_t v69 = v78;
    uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
    uint64_t v71 = v68;
    uint64_t v72 = v79;
    v70(v22, v71, v79);
    uint64_t v73 = v80;
    sub_100033344((uint64_t)v27, v80, &qword_100158DA8);
    uint64_t v74 = sub_100032FA0(&qword_100158DC0);
    v70((char *)(v73 + *(int *)(v74 + 48)), v22, v72);
    uint64_t v86 = *(void (**)(char *, uint64_t))(v69 + 8);
    v86(v22, v72);
    sub_100032F44((uint64_t)v27, &qword_100158DA8);
    sub_100033344(v73, (uint64_t)v16, &qword_100158B40);
    swift_storeEnumTagMultiPayload();
    sub_100040BE4(&qword_100158B38, &qword_100158B40);
    sub_1000D2CD8();
    uint64_t v75 = (uint64_t)v89;
    _ConditionalContent<>.init(storage:)();
    sub_100032F44(v73, &qword_100158B40);
    sub_100033344(v75, v93, &qword_100158B30);
    swift_storeEnumTagMultiPayload();
    sub_1000D2C38();
    sub_100040BE4(&qword_100158BC8, &qword_100158BD0);
    uint64_t v76 = v94;
    _ConditionalContent<>.init(storage:)();
    sub_100032F44(v75, &qword_100158B30);
    v86(v81, v72);
    sub_100032F44((uint64_t)v30, &qword_100158DA8);
    uint64_t v77 = sub_100032FA0(&qword_100158B20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 0, 1, v77);
    uint64_t v47 = (uint64_t)v76;
  }
  else
  {
LABEL_5:
    uint64_t v38 = *(void *)(a1 + 128);
    LOBYTE(v99) = *(unsigned char *)(a1 + 120);
    *((void *)&v99 + 1) = v38;
    State.wrappedValue.getter();
    if (v101 != 1) {
      goto LABEL_10;
    }
    uint64_t v39 = *(void *)(a1 + 176);
    long long v99 = *(_OWORD *)(a1 + 160);
    uint64_t v100 = v39;
    sub_100032FA0(&qword_100158A88);
    State.wrappedValue.getter();
    uint64_t v41 = v101;
    unint64_t v40 = v102;
    swift_bridgeObjectRelease();
    uint64_t v42 = HIBYTE(v40) & 0xF;
    if ((v40 & 0x2000000000000000) == 0) {
      uint64_t v42 = v41 & 0xFFFFFFFFFFFFLL;
    }
    if (v42)
    {
      uint64_t v43 = v82;
      sub_1000C6D7C(v82);
      sub_100033344(v43, (uint64_t)v16, &qword_100158B50);
      swift_storeEnumTagMultiPayload();
      sub_100040BE4(&qword_100158B38, &qword_100158B40);
      sub_1000D2CD8();
      uint64_t v44 = (uint64_t)v89;
      _ConditionalContent<>.init(storage:)();
      sub_100033344(v44, v93, &qword_100158B30);
      swift_storeEnumTagMultiPayload();
      sub_1000D2C38();
      sub_100040BE4(&qword_100158BC8, &qword_100158BD0);
      uint64_t v45 = v94;
      _ConditionalContent<>.init(storage:)();
      sub_100032F44(v44, &qword_100158B30);
      sub_100032F44(v43, &qword_100158B50);
      uint64_t v46 = sub_100032FA0(&qword_100158B20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
      uint64_t v47 = (uint64_t)v45;
    }
    else
    {
LABEL_10:
      uint64_t v48 = sub_1000C4318();
      if (!v48)
      {
        uint64_t v59 = sub_100032FA0(&qword_100158B20);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v96, 1, 1, v59);
      }
      char v50 = v48;
      uint64_t v51 = v49;
      uint64_t v52 = v84;
      sub_1000C726C(v84);
      uint64_t v53 = v85;
      sub_1000C75C4(v50, v51, v85);
      uint64_t v90 = v51;
      uint64_t v54 = v83;
      sub_100033344(v52, v83, &qword_100158D88);
      sub_100033344(v53, (uint64_t)v6, &qword_100158D80);
      id v55 = v86;
      sub_100033344(v54, (uint64_t)v86, &qword_100158D88);
      uint64_t v56 = sub_100032FA0(&qword_100158DB0);
      sub_100033344((uint64_t)v6, (uint64_t)v55 + *(int *)(v56 + 48), &qword_100158D80);
      sub_100032F44((uint64_t)v6, &qword_100158D80);
      sub_100032F44(v54, &qword_100158D88);
      sub_100033344((uint64_t)v55, v93, &qword_100158BD0);
      swift_storeEnumTagMultiPayload();
      sub_1000D2C38();
      sub_100040BE4(&qword_100158BC8, &qword_100158BD0);
      uint64_t v57 = v94;
      _ConditionalContent<>.init(storage:)();
      swift_bridgeObjectRelease();

      sub_100032F44((uint64_t)v55, &qword_100158BD0);
      sub_100032F44(v53, &qword_100158D80);
      sub_100032F44(v52, &qword_100158D88);
      uint64_t v58 = sub_100032FA0(&qword_100158B20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 0, 1, v58);
      uint64_t v47 = (uint64_t)v57;
    }
  }
  return sub_10002D9D0(v47, v96, &qword_100158B08);
}

uint64_t sub_1000C6ADC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  char v5 = *(unsigned char *)(v0 + 24);
  uint64_t v6 = swift_retain();
  sub_1000333A8(v6, v5, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  uint64_t v7 = sub_100073414();
  swift_release();
  uint64_t v8 = *(void *)(v7 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v17[1] = v8;
  sub_100014344((unint64_t *)&qword_100155238, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionDataProvider);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  sub_1000D5F30(v1, (uint64_t)&v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  sub_1000D27C4((uint64_t)&v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v11 + v10);
  v17[0] = v9;
  uint64_t v14 = v17;
  uint64_t v15 = sub_1000D3BB8;
  uint64_t v16 = v11;
  sub_100032FA0(&qword_100158DC8);
  sub_1000D2FB4(&qword_100158DD0, &qword_100158DC8, (void (*)(void))sub_1000D3BCC);
  List<>.init(content:)();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C6D7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v39 = a1;
  uint64_t v3 = sub_100032FA0(&qword_100158BC0);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  char v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_100158BB0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v38 = (uint64_t)v34 - v10;
  uint64_t v11 = sub_100032FA0(&qword_100158EA8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = *(unsigned char *)(v1 + 24);
  uint64_t v15 = swift_retain();
  sub_1000333A8(v15, v14, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  sub_100073414();
  swift_release();
  swift_retain();
  swift_release();
  uint64_t v16 = *(void *)(v1 + 176);
  v40[0] = *(_OWORD *)(v1 + 160);
  *(void *)&v40[1] = v16;
  sub_100032FA0(&qword_100158A88);
  State.wrappedValue.getter();
  sub_1000A4188(v41, v42);
  uint64_t v18 = v17;
  swift_release();
  uint64_t v19 = swift_bridgeObjectRelease();
  if (*(void *)(v18 + 16))
  {
    v34[1] = v11;
    uint64_t v35 = v6;
    __chkstk_darwin(v19);
    v34[-2] = v18;
    v34[-1] = v2;
    static Axis.Set.vertical.getter();
    sub_100032FA0(&qword_100158EB0);
    sub_100040BE4(&qword_100158EB8, &qword_100158EB0);
    ScrollView.init(_:showsIndicators:content:)();
    swift_bridgeObjectRelease();
    char v20 = static Edge.Set.top.getter();
    if (qword_1001542F0 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v36;
    uint64_t v29 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v8, v5, v37);
    uint64_t v31 = &v8[*(int *)(v35 + 36)];
    *uint64_t v31 = v20;
    *((void *)v31 + 1) = v22;
    *((void *)v31 + 2) = v24;
    *((void *)v31 + 3) = v26;
    *((void *)v31 + 4) = v28;
    v31[40] = 0;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v29);
    uint64_t v32 = v38;
    sub_10002D9D0((uint64_t)v8, v38, &qword_100158BB0);
    sub_100033344(v32, (uint64_t)v13, &qword_100158BB0);
    swift_storeEnumTagMultiPayload();
    sub_100032FA0(&qword_100158B60);
    sub_1000D28A8(&qword_100158B58, &qword_100158B60, (void (*)(void))sub_1000D2D80);
    sub_1000D2F14();
    _ConditionalContent<>.init(storage:)();
    return sub_100032F44(v32, &qword_100158BB0);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1000CD17C((uint64_t)v40);
    memcpy(v13, v40, 0x179uLL);
    swift_storeEnumTagMultiPayload();
    sub_100032FA0(&qword_100158B60);
    sub_1000D28A8(&qword_100158B58, &qword_100158B60, (void (*)(void))sub_1000D2D80);
    sub_1000D2F14();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_1000C726C@<X0>(uint64_t a1@<X8>)
{
  v22[0] = a1;
  uint64_t v2 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_100032FA0(&qword_100158FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D5F30(v1, (uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  sub_1000D27C4((uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  uint64_t v23 = sub_1000D5760;
  uint64_t v24 = v14;
  static AccessibilityChildBehavior.contain.getter();
  uint64_t v15 = sub_100032FA0(&qword_100158FF8);
  uint64_t v16 = sub_100040BE4(&qword_100159000, &qword_100158FF8);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v17 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v19 = v18;
  LOBYTE(v3) = v20 & 1;
  uint64_t v23 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v15;
  uint64_t v24 = v16;
  swift_getOpaqueTypeConformance2();
  View.accessibilityLabel(_:)();
  sub_1000356E0(v17, v19, v3);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1000C75C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v29 = a3;
  uint64_t v27 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v7 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  uint64_t v28 = sub_100032FA0(&qword_100158FA0);
  uint64_t v13 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D5F30(v4, (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  sub_1000D27C4((uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  uint64_t v30 = sub_1000D4E64;
  uint64_t v31 = v17;
  id v18 = a1;
  swift_bridgeObjectRetain();
  static AccessibilityChildBehavior.contain.getter();
  uint64_t v19 = sub_100032FA0(&qword_100158FA8);
  uint64_t v20 = sub_100040BE4(&qword_100158FB0, &qword_100158FA8);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  swift_release();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v21 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v23 = v22;
  LOBYTE(v16) = v24 & 1;
  uint64_t v30 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v19;
  uint64_t v31 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v28;
  View.accessibilityLabel(_:)();
  sub_1000356E0(v21, v23, v16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v25);
}

uint64_t sub_1000C7930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UnitConversionPopoverView();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v32 - v8;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = *(void *)(a1 + 128);
  LOBYTE(v35) = *(unsigned char *)(a1 + 120);
  *((void *)&v35 + 1) = v13;
  sub_100032FA0(&qword_100154898);
  State.wrappedValue.getter();
  char v14 = v33;
  sub_1000D5F30(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  if (v14)
  {
    uint64_t v15 = *((void *)v12 + 16);
    LOBYTE(v35) = v12[120];
    *((void *)&v35 + 1) = v15;
    State.wrappedValue.getter();
    int v16 = v33;
    sub_1000D5F30((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
    if (v16 == 1)
    {
      uint64_t v17 = *((void *)v9 + 22);
      long long v35 = *((_OWORD *)v9 + 10);
      uint64_t v36 = v17;
      sub_100032FA0(&qword_100158A88);
      State.wrappedValue.getter();
      uint64_t v19 = v33;
      unint64_t v18 = v34;
      swift_bridgeObjectRelease();
      if ((v18 & 0x2000000000000000) != 0) {
        uint64_t v20 = HIBYTE(v18) & 0xF;
      }
      else {
        uint64_t v20 = v19 & 0xFFFFFFFFFFFFLL;
      }
      sub_1000D5F98((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
      sub_1000D5F30((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
      if (!v20)
      {
        char v21 = v6[24];
        uint64_t v22 = swift_retain();
        sub_1000333A8(v22, v21, 0xD000000000000028, 0x800000010010AD80);
        swift_release();
        uint64_t v23 = sub_100073414();
        swift_release();
        uint64_t v24 = *(void *)(v23 + 16);
        swift_retain();
        swift_release();
        swift_getKeyPath();
        *(void *)&long long v35 = v24;
        sub_100014344((unint64_t *)&qword_100155238, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionDataProvider);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        swift_beginAccess();
        unint64_t v25 = *(void *)(v24 + 32);
        swift_bridgeObjectRetain();
        swift_release();
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        sub_1000D5F98((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
        sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
        if (v26) {
          goto LABEL_18;
        }
        goto LABEL_12;
      }
    }
    else
    {
      sub_1000D5F98((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
      sub_1000D5F30((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
    }
    sub_1000D5F98((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
    sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
    goto LABEL_18;
  }
  sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
LABEL_12:
  uint64_t v27 = sub_1000C4318();
  if (v27)
  {
    uint64_t v28 = v27;
    if ([v27 unitType] == (id)16)
    {
      sub_1000C7DC4(a2);
      swift_bridgeObjectRelease();

      uint64_t v29 = sub_100032FA0(&qword_100158BE8);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(a2, 0, 1, v29);
    }
    swift_bridgeObjectRelease();
  }
LABEL_18:
  uint64_t v31 = sub_100032FA0(&qword_100158BE8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a2, 1, 1, v31);
}

uint64_t sub_1000C7DC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v62 = a1;
  uint64_t v63 = type metadata accessor for ColorScheme();
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  char v60 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Material();
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_100158C38);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032FA0(&qword_100158C28);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100032FA0(&qword_100158C18);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100032FA0(&qword_100158C08);
  __chkstk_darwin(v56);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100032FA0(&qword_100158BF8);
  __chkstk_darwin(v57);
  uint64_t v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = static VerticalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 1;
  uint64_t v20 = sub_100032FA0(&qword_100158C60);
  sub_1000CF988(v2, (uint64_t)&v9[*(int *)(v20 + 44)]);
  char v21 = static Edge.Set.horizontal.getter();
  if (qword_100154330 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_100033344((uint64_t)v9, (uint64_t)v12, &qword_100158C38);
  uint64_t v30 = &v12[*(int *)(v10 + 36)];
  *uint64_t v30 = v21;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_100032F44((uint64_t)v9, &qword_100158C38);
  char v31 = static Edge.Set.vertical.getter();
  if (qword_100154388 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_100033344((uint64_t)v12, (uint64_t)v15, &qword_100158C28);
  unint64_t v40 = &v15[*(int *)(v13 + 36)];
  *unint64_t v40 = v31;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_100032F44((uint64_t)v12, &qword_100158C28);
  if (qword_100154380 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100033344((uint64_t)v15, (uint64_t)v17, &qword_100158C18);
  uint64_t v41 = &v17[*(int *)(v56 + 36)];
  long long v42 = v65;
  *(_OWORD *)uint64_t v41 = v64;
  *((_OWORD *)v41 + 1) = v42;
  *((_OWORD *)v41 + 2) = v66;
  sub_100032F44((uint64_t)v15, &qword_100158C18);
  static Material.ultraThin.getter();
  char v43 = static Edge.Set.all.getter();
  uint64_t v44 = v58;
  uint64_t v45 = &v19[*(int *)(v57 + 36)];
  uint64_t v46 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v45, v6, v59);
  v45[*(int *)(sub_100032FA0(&qword_100156D78) + 36)] = v43;
  sub_100033344((uint64_t)v17, (uint64_t)v19, &qword_100158C08);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v6, v46);
  sub_100032F44((uint64_t)v17, &qword_100158C08);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v49 = v60;
  uint64_t v48 = v61;
  uint64_t v50 = v63;
  (*(void (**)(char *, void, uint64_t))(v61 + 104))(v60, enum case for ColorScheme.dark(_:), v63);
  uint64_t v51 = sub_100032FA0(&qword_100158BE8);
  uint64_t v52 = v62;
  uint64_t v53 = (uint64_t *)(v62 + *(int *)(v51 + 36));
  uint64_t v54 = sub_100032FA0(&qword_100158C50);
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))((char *)v53 + *(int *)(v54 + 28), v49, v50);
  *uint64_t v53 = KeyPath;
  sub_100033344((uint64_t)v19, v52, &qword_100158BF8);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  return sub_100032F44((uint64_t)v19, &qword_100158BF8);
}

uint64_t sub_1000C83D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = type metadata accessor for ToolbarItemPlacement();
  __chkstk_darwin(v3 - 8);
  v33[1] = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100032FA0(&qword_100158A78);
  uint64_t v35 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v34 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v33 - v11;
  uint64_t v36 = sub_100032FA0(&qword_100158A68);
  __chkstk_darwin(v36);
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v33 - v16;
  char v18 = *(unsigned char *)(a1 + 40);
  uint64_t v19 = swift_retain();
  uint64_t v20 = sub_1000333A8(v19, v18, 0xD000000000000010, 0x800000010010ADB0);
  swift_release();
  id v21 = [self currentDevice];
  id v22 = [v21 userInterfaceIdiom];

  if (!v22)
  {
    swift_release();
    goto LABEL_5;
  }
  swift_getKeyPath();
  uint64_t v41 = v20;
  sub_100014344((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v23 = v20 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v23, v6);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for UserInterfaceSizeClass.compact(_:), v6);
  LOBYTE(v23) = static UserInterfaceSizeClass.== infix(_:_:)();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
  v24(v9, v6);
  v24(v12, v6);
  swift_release();
  if (v23)
  {
LABEL_5:
    uint64_t v27 = static ToolbarItemPlacement.confirmationAction.getter();
    __chkstk_darwin(v27);
    v33[-2] = a1;
    sub_100032FA0(&qword_1001555F0);
    sub_100040BE4(&qword_100156428, &qword_1001555F0);
    uint64_t v28 = v34;
    ToolbarItem<>.init(placement:content:)();
    uint64_t v29 = sub_100040BE4(&qword_100158A80, &qword_100158A78);
    uint64_t v30 = v37;
    static ToolbarContentBuilder.buildBlock<A>(_:)();
    uint64_t v31 = sub_100032FA0(&qword_100158AE0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v14, 0, 1, v31);
    uint64_t v39 = v30;
    uint64_t v40 = v29;
    swift_getOpaqueTypeConformance2();
    static ToolbarContentBuilder.buildIf<A>(_:)();
    sub_100032F44((uint64_t)v14, &qword_100158A68);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v30);
    goto LABEL_6;
  }
  uint64_t v25 = sub_100032FA0(&qword_100158AE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v14, 1, 1, v25);
  uint64_t v26 = sub_100040BE4(&qword_100158A80, &qword_100158A78);
  uint64_t v39 = v37;
  uint64_t v40 = v26;
  swift_getOpaqueTypeConformance2();
  static ToolbarContentBuilder.buildIf<A>(_:)();
  sub_100032F44((uint64_t)v14, &qword_100158A68);
LABEL_6:
  sub_1000C9098();
  static ToolbarContentBuilder.buildBlock<A>(_:)();
  return sub_100032F44((uint64_t)v17, &qword_100158A68);
}

uint64_t sub_1000C8A08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  sub_1000D5F30(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_1000D27C4((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  return Button.init(action:label:)();
}

uint64_t sub_1000C8B48(uint64_t a1)
{
  uint64_t v2 = sub_1000C4454((uint64_t (*)(uint64_t))sub_100071234, (uint64_t (*)(uint64_t))sub_100071418);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    CalculateUnit.id.getter();
  }
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.setter();
  char v4 = *(unsigned char *)(a1 + 24);
  uint64_t v5 = swift_retain();
  sub_1000333A8(v5, v4, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  uint64_t v6 = sub_100073414();
  swift_release();
  swift_getKeyPath();
  sub_100014344(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v7 = *(id *)(v6 + 32);
  swift_release();
  CalculateUnitCategory.id.getter();

  return State.wrappedValue.setter();
}

uint64_t sub_1000C8D10(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  char v2 = *(unsigned char *)(a1 + 8);
  uint64_t v3 = swift_retain();
  sub_1000333A8(v3, v2, 0xD000000000000013, 0x800000010010AB80);
  sub_1000333A8(v1, v2, 0xD000000000000013, 0x800000010010AB80);
  swift_release();
  swift_retain();
  swift_release();
  swift_getKeyPath();
  sub_100014344(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_100014344((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000C8ED4(uint64_t a1)
{
  sub_100032FA0(&qword_100154898);
  State.wrappedValue.getter();
  LOBYTE(a1) = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_1000333A8(v2, a1, 0xD000000000000013, 0x800000010010AB80);
  swift_release();
  swift_getKeyPath();
  sub_100014344((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000C9090()
{
  return sub_1000C585C(*(void *)(v0 + 16));
}

unint64_t sub_1000C9098()
{
  unint64_t result = qword_100158A70;
  if (!qword_100158A70)
  {
    sub_1000317D8(&qword_100158A68);
    sub_1000317D8(&qword_100158A78);
    sub_100040BE4(&qword_100158A80, &qword_100158A78);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158A70);
  }
  return result;
}

uint64_t sub_1000C916C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v66 = a3;
  uint64_t v4 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v60 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v62 = v5;
  uint64_t v65 = (uint64_t)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for ScrollViewProxy();
  uint64_t v61 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v57 = v6;
  uint64_t v58 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ContentMarginPlacement();
  uint64_t v55 = *(void *)(v7 - 8);
  *(void *)&long long v56 = v7;
  __chkstk_darwin(v7);
  uint64_t v52 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for ScrollIndicatorVisibility();
  uint64_t v45 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100032FA0(&qword_100159008);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100032FA0(&qword_100159010);
  uint64_t v48 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100032FA0(&qword_100159018);
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  char v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100032FA0(&qword_100159020);
  __chkstk_darwin(v47);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100032FA0(&qword_100159028);
  __chkstk_darwin(v53);
  uint64_t v54 = (uint64_t)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Axis.Set.horizontal.getter();
  uint64_t v63 = a2;
  uint64_t v67 = a2;
  sub_100032FA0(&qword_100159030);
  sub_1000D28A8(&qword_100159038, &qword_100159030, (void (*)(void))sub_1000D57E8);
  ScrollView.init(_:showsIndicators:content:)();
  static ScrollIndicatorVisibility.hidden.getter();
  unsigned __int8 v22 = static Axis.Set.vertical.getter();
  unsigned __int8 v23 = static Axis.Set.horizontal.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v22) {
    Axis.Set.init(rawValue:)();
  }
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v23) {
    Axis.Set.init(rawValue:)();
  }
  uint64_t v24 = sub_100040BE4(&qword_100159060, &qword_100159008);
  View.scrollIndicators(_:axes:)();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v46);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  static Edge.Set.horizontal.getter();
  if (qword_1001542B0 != -1) {
    swift_once();
  }
  uint64_t v25 = v52;
  static ContentMarginPlacement.scrollContent.getter();
  uint64_t v68 = v11;
  uint64_t v69 = v24;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v49;
  View.contentMargins(_:_:for:)();
  (*(void (**)(char *, void))(v55 + 8))(v25, v56);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v26);
  if (qword_100154720 != -1) {
    swift_once();
  }
  uint64_t v27 = xmmword_100158900;
  long long v56 = *(long long *)((char *)&xmmword_100158900 + 8);
  uint64_t v28 = qword_100158918;
  uint64_t v29 = qword_100158920;
  uint64_t v30 = v50;
  uint64_t v31 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v20, v18, v51);
  uint64_t v32 = &v20[*(int *)(v47 + 36)];
  *(void *)uint64_t v32 = v27;
  *(_OWORD *)(v32 + 8) = v56;
  *((void *)v32 + 3) = v28;
  *((void *)v32 + 4) = v29;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v30 + 8);
  swift_bridgeObjectRetain();
  v33(v18, v31);
  uint64_t v34 = v61;
  uint64_t v35 = v58;
  uint64_t v36 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v58, v59, v64);
  uint64_t v37 = v65;
  sub_1000D5F30(v63, v65, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v38 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  unint64_t v39 = (v57 + *(unsigned __int8 *)(v60 + 80) + v38) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v40 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v40 + v38, v35, v36);
  sub_1000D27C4(v37, v40 + v39);
  uint64_t v41 = v54;
  sub_100033344((uint64_t)v20, v54, &qword_100159020);
  long long v42 = (uint64_t (**)())(v41 + *(int *)(v53 + 36));
  *long long v42 = sub_1000D5AE8;
  v42[1] = (uint64_t (*)())v40;
  v42[2] = 0;
  v42[3] = 0;
  sub_100032F44((uint64_t)v20, &qword_100159020);
  return sub_10002D9D0(v41, v66, &qword_100159028);
}

uint64_t sub_1000C9A00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100032FA0(&qword_100159058);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100032FA0(&qword_100159048);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = a1;
  static VerticalAlignment.center.getter();
  LODWORD(v28) = 0;
  sub_100014344(&qword_100158EC0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_100032FA0(&qword_100159070);
  sub_1000D5BBC();
  LazyHStack.init(alignment:spacing:pinnedViews:content:)();
  type metadata accessor for UnitConversionPopoverView();
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v12, v8, v5);
  uint64_t v13 = &v12[*(int *)(v10 + 44)];
  long long v14 = v29;
  *uint64_t v13 = v28;
  v13[1] = v14;
  v13[2] = v30;
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  char v15 = static Edge.Set.bottom.getter();
  if (qword_1001542E0 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  sub_100033344((uint64_t)v12, a2, &qword_100159048);
  uint64_t v24 = a2 + *(int *)(sub_100032FA0(&qword_100159030) + 36);
  *(unsigned char *)uint64_t v24 = v15;
  *(void *)(v24 + 8) = v17;
  *(void *)(v24 + 16) = v19;
  *(void *)(v24 + 24) = v21;
  *(void *)(v24 + 32) = v23;
  *(unsigned char *)(v24 + 40) = 0;
  return sub_100032F44((uint64_t)v12, &qword_100159048);
}

uint64_t sub_1000C9D4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  char v5 = *(unsigned char *)(a1 + 24);
  uint64_t v6 = swift_retain();
  sub_1000333A8(v6, v5, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  uint64_t v7 = sub_100073414();
  swift_release();
  uint64_t v8 = *(void *)(v7 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v16 = v8;
  sub_100014344((unint64_t *)&qword_100155238, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionDataProvider);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v9 = *(id *)(v8 + 16);
  swift_release();
  id v10 = [v9 categories];

  sub_10001CE8C(0, (unint64_t *)&qword_100155240);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v16 = v11;
  sub_1000D5F30(a1, (uint64_t)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  sub_1000D27C4((uint64_t)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_100032FA0(&qword_100159090);
  sub_100032FA0(&qword_100159088);
  sub_100040BE4(&qword_100159098, &qword_100159090);
  sub_100040BE4(&qword_100159080, &qword_100159088);
  sub_1000D3E08(&qword_1001590A0, (unint64_t *)&qword_100155240);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000CA078@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v33 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v34 = type metadata accessor for UnitConversionCategoryButton(0);
  __chkstk_darwin(v34);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100032FA0(&qword_100159088);
  double v9 = __chkstk_darwin(v35);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *a1;
  id v13 = [v12 displayName:v9];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v15;
  uint64_t v32 = v14;

  uint64_t v16 = *(void *)(a2 + 88);
  long long v37 = *(_OWORD *)(a2 + 72);
  uint64_t v38 = v16;
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  uint64_t v17 = v39;
  uint64_t v18 = v40;
  uint64_t v19 = CalculateUnitCategory.id.getter();
  if (v18)
  {
    if (v17 == v19 && v18 == v20) {
      char v21 = 1;
    }
    else {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = 0;
  }
  swift_bridgeObjectRelease();
  sub_1000D5F30(a2, (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v22 = (*(unsigned __int8 *)(v33 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v12;
  sub_1000D27C4((uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  uint64_t v24 = v31;
  *(void *)uint64_t v8 = v32;
  *((void *)v8 + 1) = v24;
  v8[16] = v21 & 1;
  *((void *)v8 + 3) = sub_1000D5ECC;
  *((void *)v8 + 4) = v23;
  *(void *)&long long v37 = 0x4018000000000000;
  sub_10003B8D0();
  id v25 = v12;
  ScaledMetric.init(wrappedValue:)();
  *(void *)&long long v37 = 0x4028000000000000;
  ScaledMetric.init(wrappedValue:)();
  uint64_t v26 = CalculateUnitCategory.id.getter();
  uint64_t v28 = v27;
  sub_1000D5F30((uint64_t)v8, (uint64_t)v11, type metadata accessor for UnitConversionCategoryButton);
  long long v29 = (uint64_t *)&v11[*(int *)(v35 + 52)];
  *long long v29 = v26;
  v29[1] = v28;
  sub_1000D5F98((uint64_t)v8, type metadata accessor for UnitConversionCategoryButton);
  return sub_10002D9D0((uint64_t)v11, v36, &qword_100159088);
}

uint64_t sub_1000CA3CC()
{
  uint64_t v0 = CalculateUnitCategory.id.getter();
  uint64_t v2 = v1;
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v0 == v6 && v7 == v2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
LABEL_9:
    CalculateUnitCategory.id.getter();
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000CA4D4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CA5A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v50 = a2;
  uint64_t v2 = type metadata accessor for PlainButtonStyle();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  uint64_t v49 = v3;
  __chkstk_darwin(v2);
  uint64_t v46 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v42 = *(void *)(v5 - 8);
  v41[1] = *(void *)(v42 + 64);
  __chkstk_darwin(v5 - 8);
  v41[0] = (uint64_t)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100032FA0(&qword_1001555F0);
  uint64_t v47 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032FA0(&qword_100158E98);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v43 = (char *)v41 - v14;
  uint64_t v15 = type metadata accessor for AccessibilityTraits();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100032FA0(&qword_100158C68);
  __chkstk_darwin(v19 - 8);
  char v21 = (char *)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)v41 - v23;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v51 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v52 = v25;
  char v53 = v26 & 1;
  uint64_t v54 = v27;
  static AccessibilityTraits.isHeader.getter();
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_1000356E0(v51, v52, v53);
  swift_bridgeObjectRelease();
  sub_10002D9D0((uint64_t)v21, (uint64_t)v24, &qword_100158C68);
  uint64_t v28 = v41[0];
  sub_1000D5F30(v44, v41[0], (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v29 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v30 = swift_allocObject();
  sub_1000D27C4(v28, v30 + v29);
  Button.init(action:label:)();
  uint64_t v31 = v46;
  PlainButtonStyle.init()();
  sub_100040BE4(&qword_100156428, &qword_1001555F0);
  sub_100014344(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v32 = v45;
  uint64_t v33 = v48;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v31, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v8, v32);
  uint64_t v34 = v43;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v43, v12, v9);
  sub_100033344((uint64_t)v24, (uint64_t)v21, &qword_100158C68);
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v35(v12, v34, v9);
  uint64_t v36 = v50;
  sub_100033344((uint64_t)v21, v50, &qword_100158C68);
  uint64_t v37 = sub_100032FA0(&qword_100158EA0);
  uint64_t v38 = v36 + *(int *)(v37 + 48);
  *(void *)uint64_t v38 = 0;
  *(unsigned char *)(v38 + 8) = 1;
  v35((char *)(v36 + *(int *)(v37 + 64)), v12, v9);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v10 + 8);
  v39(v34, v9);
  sub_100032F44((uint64_t)v24, &qword_100158C68);
  v39(v12, v9);
  return sub_100032F44((uint64_t)v21, &qword_100158C68);
}

uint64_t sub_1000CAC04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = sub_100032FA0(&qword_100158E30);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_100158E38);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032FA0(&qword_100158E40);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100158E48);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100032FA0(&qword_100158E50);
  __chkstk_darwin(v61);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100032FA0(&qword_100158E58);
  __chkstk_darwin(v62);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v5 = static Axis.Set.horizontal.getter();
  uint64_t v19 = sub_100032FA0(&qword_100158E60);
  sub_1000CB1BC(a1, (uint64_t)&v5[*(int *)(v19 + 44)]);
  if (qword_100154378 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100033344((uint64_t)v5, (uint64_t)v8, &qword_100158E30);
  uint64_t v20 = &v8[*(int *)(v6 + 36)];
  long long v21 = v65;
  *(_OWORD *)uint64_t v20 = v64;
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v66;
  sub_100032F44((uint64_t)v5, &qword_100158E30);
  if (qword_100154598 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_1001611A0;
  uint64_t KeyPath = swift_getKeyPath();
  sub_100033344((uint64_t)v8, (uint64_t)v11, &qword_100158E38);
  uint64_t v24 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *uint64_t v24 = KeyPath;
  v24[1] = v22;
  swift_retain();
  sub_100032F44((uint64_t)v8, &qword_100158E38);
  if (qword_1001546E8 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_100161300;
  uint64_t v26 = swift_getKeyPath();
  sub_100033344((uint64_t)v11, (uint64_t)v14, &qword_100158E40);
  uint64_t v27 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  *uint64_t v27 = v26;
  v27[1] = v25;
  swift_retain();
  sub_100032F44((uint64_t)v11, &qword_100158E40);
  char v28 = static Edge.Set.top.getter();
  if (qword_1001542D8 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_100033344((uint64_t)v14, (uint64_t)v16, &qword_100158E48);
  uint64_t v37 = &v16[*(int *)(v61 + 36)];
  *uint64_t v37 = v28;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  sub_100032F44((uint64_t)v14, &qword_100158E48);
  char v38 = static Edge.Set.bottom.getter();
  if (qword_1001542E0 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  sub_100033344((uint64_t)v16, (uint64_t)v18, &qword_100158E50);
  uint64_t v47 = &v18[*(int *)(v62 + 36)];
  char *v47 = v38;
  *((void *)v47 + 1) = v40;
  *((void *)v47 + 2) = v42;
  *((void *)v47 + 3) = v44;
  *((void *)v47 + 4) = v46;
  v47[40] = 0;
  sub_100032F44((uint64_t)v16, &qword_100158E50);
  char v48 = static Edge.Set.horizontal.getter();
  if (qword_1001542C0 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v57 = v63;
  sub_100033344((uint64_t)v18, v63, &qword_100158E58);
  uint64_t v58 = v57 + *(int *)(sub_100032FA0(&qword_100158E68) + 36);
  *(unsigned char *)uint64_t v58 = v48;
  *(void *)(v58 + 8) = v50;
  *(void *)(v58 + 16) = v52;
  *(void *)(v58 + 24) = v54;
  *(void *)(v58 + 32) = v56;
  *(unsigned char *)(v58 + 40) = 0;
  return sub_100032F44((uint64_t)v18, &qword_100158E58);
}

uint64_t sub_1000CB1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = (char *)a1;
  uint64_t v66 = a2;
  uint64_t v69 = sub_100032FA0(&qword_100155888);
  __chkstk_darwin(v69);
  long long v64 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v59 = (char *)&v56 - v4;
  uint64_t v5 = type metadata accessor for DynamicTypeSize();
  uint64_t v6 = *(void **)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v56 - v10;
  uint64_t v65 = sub_100032FA0(&qword_100155858);
  __chkstk_darwin(v65);
  uint64_t v58 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v60 = (uint64_t)&v56 - v14;
  uint64_t v56 = sub_100032FA0(&qword_100158E70);
  uint64_t v62 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v67 = (char *)&v56 - v18;
  uint64_t v57 = sub_100032FA0(&qword_100158E78);
  __chkstk_darwin(v57);
  uint64_t v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v56 - v22;
  *(void *)uint64_t v23 = static VerticalAlignment.center.getter();
  *((void *)v23 + 1) = 0;
  v23[16] = 1;
  uint64_t v24 = sub_100032FA0(&qword_100158E80);
  uint64_t v25 = *(int *)(v24 + 44);
  uint64_t v63 = v23;
  uint64_t v26 = (uint64_t)&v23[v25];
  uint64_t v27 = (uint64_t)v68;
  sub_1000CA5A8((uint64_t)v68, v26);
  *(void *)uint64_t v20 = static VerticalAlignment.center.getter();
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v28 = *(int *)(v24 + 44);
  uint64_t v61 = v20;
  sub_1000CA5A8(v27, (uint64_t)&v20[v28]);
  uint64_t v29 = v6;
  uint64_t v30 = (void (*)(char *, void, uint64_t))v6[13];
  v30(v11, enum case for DynamicTypeSize.xSmall(_:), v5);
  v30(v8, enum case for DynamicTypeSize.accessibility2(_:), v5);
  sub_100014344(&qword_100155890, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t v31 = v5;
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if (result)
  {
    uint64_t v33 = v69;
    uint64_t v34 = v59;
    uint64_t v35 = &v59[*(int *)(v69 + 48)];
    uint64_t v68 = v16;
    uint64_t v36 = (void (*)(char *, char *, uint64_t))v6[4];
    v36(v59, v11, v31);
    v36(v35, v8, v31);
    uint64_t v37 = *(int *)(v33 + 48);
    char v38 = v64;
    uint64_t v39 = &v64[v37];
    uint64_t v40 = (void (*)(char *, char *, uint64_t))v6[2];
    v40(v64, v34, v31);
    v40(v39, v35, v31);
    uint64_t v41 = (uint64_t)v58;
    v36(v58, v38, v31);
    uint64_t v42 = (void (*)(char *, uint64_t))v29[1];
    v42(v39, v31);
    uint64_t v43 = &v38[*(int *)(v69 + 48)];
    v36(v38, v34, v31);
    v36(v43, v35, v31);
    v36((char *)(v41 + *(int *)(v65 + 36)), v43, v31);
    v42(v38, v31);
    uint64_t v44 = v60;
    sub_10002D9D0(v41, v60, &qword_100155858);
    sub_100040BE4(&qword_100158E88, &qword_100158E78);
    sub_100040BE4(&qword_100155860, &qword_100155858);
    uint64_t v45 = (uint64_t)v68;
    uint64_t v46 = (uint64_t)v61;
    View.dynamicTypeSize<A>(_:)();
    sub_100032F44(v44, &qword_100155858);
    sub_100032F44(v46, &qword_100158E78);
    uint64_t v47 = v62;
    char v48 = v67;
    uint64_t v49 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v67, v45, v56);
    uint64_t v50 = (uint64_t)v63;
    sub_100033344((uint64_t)v63, v46, &qword_100158E78);
    uint64_t v51 = v47;
    uint64_t v52 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 16);
    v52(v45, v48, v49);
    uint64_t v53 = v66;
    sub_100033344(v46, v66, &qword_100158E78);
    uint64_t v54 = sub_100032FA0(&qword_100158E90);
    v52(v53 + *(int *)(v54 + 48), (char *)v45, v49);
    uint64_t v55 = *(void (**)(char *, uint64_t))(v51 + 8);
    v55(v48, v49);
    sub_100032F44(v50, &qword_100158E78);
    v55((char *)v45, v49);
    return sub_100032F44(v46, &qword_100158E78);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000CB85C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v77 = a1;
  uint64_t v68 = a5;
  uint64_t v74 = type metadata accessor for ScrollViewProxy();
  uint64_t v66 = *(void *)(v74 - 8);
  uint64_t v75 = *(void *)(v66 + 64);
  __chkstk_darwin(v74);
  uint64_t v73 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = v10;
  uint64_t v59 = v10;
  uint64_t v12 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = (void *)sub_100032FA0(&qword_100158DA0);
  uint64_t v63 = *(v65 - 1);
  __chkstk_darwin(v65);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100032FA0(&qword_100158FB8) - 8;
  __chkstk_darwin(v60);
  uint64_t v70 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100032FA0(&qword_100158FC0);
  __chkstk_darwin(v76);
  uint64_t v72 = (uint64_t)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for UnitConversionPopoverView;
  sub_1000D5F30(a4, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = ((v17 + 16) & ~v17) + v11;
  uint64_t v19 = (v17 + 16) & ~v17;
  uint64_t v61 = v18;
  uint64_t v62 = v17 | 7;
  uint64_t v20 = swift_allocObject();
  uint64_t v64 = v19;
  sub_1000D27C4((uint64_t)v12, v20 + v19);
  uint64_t v71 = a3;
  *(void *)&long long v81 = a3;
  uint64_t v78 = &v81;
  uint64_t v79 = sub_1000D4EEC;
  uint64_t v80 = v20;
  swift_bridgeObjectRetain();
  sub_100032FA0(&qword_100158DC8);
  sub_1000D2FB4(&qword_100158DD0, &qword_100158DC8, (void (*)(void))sub_1000D3BCC);
  List<>.init(content:)();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v21 = static HorizontalAlignment.listRowSeparatorTrailing.getter();
  uint64_t v22 = a4;
  uint64_t v58 = a4;
  uint64_t v23 = a4;
  uint64_t v24 = v69;
  sub_1000D5F30(v23, (uint64_t)v12, (uint64_t (*)(void))v69);
  uint64_t v25 = swift_allocObject();
  sub_1000D27C4((uint64_t)v12, v25 + v19);
  uint64_t v26 = v63;
  uint64_t v27 = v70;
  uint64_t v28 = v65;
  (*(void (**)(char *, char *, void *))(v63 + 16))(v70, v14, v65);
  uint64_t v29 = (uint64_t *)&v27[*(int *)(v60 + 44)];
  *uint64_t v29 = v21;
  v29[1] = (uint64_t)sub_1000D4F78;
  v29[2] = v25;
  (*(void (**)(char *, void *))(v26 + 8))(v14, v28);
  uint64_t v30 = v66;
  uint64_t v65 = *(void **)(v66 + 16);
  uint64_t v31 = v73;
  uint64_t v32 = v74;
  ((void (*)(char *, uint64_t, uint64_t))v65)(v73, v77, v74);
  sub_1000D5F30(v22, (uint64_t)v12, (uint64_t (*)(void))v24);
  uint64_t v33 = *(unsigned __int8 *)(v30 + 80);
  uint64_t v34 = v30;
  uint64_t v35 = (v33 + 16) & ~v33;
  uint64_t v36 = (v75 + v17 + v35) & ~v17;
  unint64_t v37 = (v59 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = swift_allocObject();
  uint64_t v66 = *(void *)(v34 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v66)(v38 + v35, v31, v32);
  sub_1000D27C4((uint64_t)v12, v38 + v36);
  uint64_t v39 = (void *)(v38 + v37);
  uint64_t v40 = v67;
  uint64_t v42 = (uint64_t)v70;
  uint64_t v41 = v71;
  *uint64_t v39 = v67;
  v39[1] = v41;
  uint64_t v43 = v72;
  sub_100033344(v42, v72, &qword_100158FB8);
  uint64_t v44 = (uint64_t (**)())(v43 + *(int *)(v76 + 36));
  *uint64_t v44 = sub_1000D5268;
  v44[1] = (uint64_t (*)())v38;
  v44[2] = 0;
  v44[3] = 0;
  swift_bridgeObjectRetain();
  id v45 = v40;
  sub_100032F44(v42, &qword_100158FB8);
  uint64_t v46 = v58;
  uint64_t v47 = *(void *)(v58 + 88);
  long long v81 = *(_OWORD *)(v58 + 72);
  uint64_t v82 = v47;
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  long long v81 = v83;
  sub_1000D5F30(v46, (uint64_t)v12, (uint64_t (*)(void))v69);
  uint64_t v49 = v73;
  uint64_t v48 = v74;
  ((void (*)(char *, uint64_t, uint64_t))v65)(v73, v77, v74);
  uint64_t v50 = (v61 + v33) & ~v33;
  unint64_t v51 = (v75 + v50 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v52 = swift_allocObject();
  sub_1000D27C4((uint64_t)v12, v52 + v64);
  ((void (*)(uint64_t, char *, uint64_t))v66)(v52 + v50, v49, v48);
  uint64_t v53 = (void *)(v52 + v51);
  uint64_t v54 = v71;
  *uint64_t v53 = v45;
  v53[1] = v54;
  swift_bridgeObjectRetain();
  id v55 = v45;
  sub_100032FA0(&qword_100154B90);
  sub_1000D28A8(&qword_100158FC8, &qword_100158FC0, (void (*)(void))sub_1000D5698);
  sub_10007C1F8(&qword_100158FE0);
  uint64_t v56 = v72;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100032F44(v56, &qword_100158FC0);
}

uint64_t sub_1000CBFD4@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v78 = a3;
  uint64_t v7 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v82 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v82 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v77 - v11;
  uint64_t v83 = type metadata accessor for UnitConversionUnitButton();
  __chkstk_darwin(v83);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100032FA0(&qword_100158E10);
  __chkstk_darwin(v84);
  uint64_t v16 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100032FA0(&qword_100158DF8);
  __chkstk_darwin(v86);
  uint64_t v85 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100032FA0(&qword_100158E28);
  uint64_t v89 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v88 = (char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100032FA0(&qword_100158DF0);
  __chkstk_darwin(v87);
  uint64_t v93 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100032FA0(&qword_100158DE0);
  double v20 = __chkstk_darwin(v90);
  uint64_t v92 = (uint64_t)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = [a1 displayName:v20];
  uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v80 = v23;

  id v24 = [a1 shortName];
  uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

  uint64_t v94 = v4;
  sub_1000D5F30(v4, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  if (a2)
  {
    sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
LABEL_8:
    char v32 = 0;
    goto LABEL_11;
  }
  uint64_t v27 = *((void *)v12 + 14);
  long long v95 = *((_OWORD *)v12 + 6);
  uint64_t v96 = v27;
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  uint64_t v29 = v97;
  uint64_t v28 = v98;
  uint64_t v30 = CalculateUnit.id.getter();
  if (!v28)
  {
    sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (v29 == v30 && v28 == v31) {
    char v32 = 1;
  }
  else {
    char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  sub_1000D5F98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  swift_bridgeObjectRelease();
LABEL_11:
  sub_1000D5F30(v94, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v33 = (*(unsigned __int8 *)(v82 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  uint64_t v34 = swift_allocObject();
  sub_1000D27C4((uint64_t)v9, v34 + v33);
  *(void *)(v34 + ((v8 + v33 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  id v35 = a1;
  uint64_t v36 = static Font.body.getter();
  uint64_t v37 = static Font.footnote.getter();
  uint64_t v38 = v80;
  *(void *)uint64_t v14 = v81;
  *((void *)v14 + 1) = v38;
  *((void *)v14 + 2) = v79;
  *((void *)v14 + 3) = v26;
  v14[32] = v32 & 1;
  v14[33] = 0;
  *((void *)v14 + 5) = sub_1000D4044;
  *((void *)v14 + 6) = v34;
  *((void *)v14 + 7) = v36;
  *((void *)v14 + 8) = v37;
  if (qword_100154580 != -1) {
    swift_once();
  }
  *((void *)v14 + 9) = qword_100161188;
  uint64_t v39 = qword_100154588;
  swift_retain();
  uint64_t v40 = v88;
  if (v39 != -1) {
    swift_once();
  }
  *((void *)v14 + 10) = qword_100161190;
  uint64_t v41 = qword_100154590;
  swift_retain();
  if (v41 != -1) {
    swift_once();
  }
  *((void *)v14 + 11) = qword_100161198;
  uint64_t v42 = qword_1001542B8;
  swift_retain();
  if (v42 != -1) {
    swift_once();
  }
  *(void *)&long long v95 = qword_100160DA0;
  sub_10003B8D0();
  ScaledMetric.init(wrappedValue:)();
  uint64_t v43 = CalculateUnit.id.getter();
  uint64_t v45 = v44;
  sub_1000D5F30((uint64_t)v14, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for UnitConversionUnitButton);
  uint64_t v46 = (uint64_t *)&v16[*(int *)(v84 + 52)];
  uint64_t *v46 = v43;
  v46[1] = v45;
  sub_1000D5F98((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for UnitConversionUnitButton);
  uint64_t v47 = CalculateUnit.id.getter();
  uint64_t v49 = v48;
  uint64_t v50 = sub_1000C4454((uint64_t (*)(uint64_t))sub_100071418, (uint64_t (*)(uint64_t))sub_100071234);
  if (v50)
  {
    unint64_t v51 = (void *)v50;
    uint64_t v52 = CalculateUnit.id.getter();
    uint64_t v54 = v53;

    uint64_t v55 = (uint64_t)v85;
    if (v47 == v52 && v49 == v54) {
      char v56 = 1;
    }
    else {
      char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    uint64_t v57 = v78;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v56 = 0;
    uint64_t v57 = v78;
    uint64_t v55 = (uint64_t)v85;
  }
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v59 = swift_allocObject();
  *(unsigned char *)(v59 + 16) = v56 & 1;
  sub_100033344((uint64_t)v16, v55, &qword_100158E10);
  uint64_t v60 = (uint64_t *)(v55 + *(int *)(v86 + 36));
  *uint64_t v60 = KeyPath;
  v60[1] = (uint64_t)sub_100037BBC;
  v60[2] = v59;
  sub_100032F44((uint64_t)v16, &qword_100158E10);
  if (qword_100154650 != -1) {
    swift_once();
  }
  static VerticalEdge.Set.all.getter();
  sub_1000D3CD0();
  View.listRowSeparatorTint(_:edges:)();
  sub_100032F44(v55, &qword_100158DF8);
  uint64_t v61 = (uint64_t)v93;
  if (qword_100154660 != -1) {
    swift_once();
  }
  *(void *)&long long v95 = qword_100161268;
  swift_retain_n();
  uint64_t v62 = AnyView.init<A>(_:)();
  uint64_t v63 = v89;
  uint64_t v64 = v91;
  (*(void (**)(uint64_t, char *, uint64_t))(v89 + 16))(v61, v40, v91);
  swift_release();
  *(void *)(v61 + *(int *)(v87 + 36)) = v62;
  (*(void (**)(char *, uint64_t))(v63 + 8))(v40, v64);
  char v65 = static Edge.Set.leading.getter();
  if (qword_1001542D0 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v74 = v92;
  sub_100033344(v61, v92, &qword_100158DF0);
  uint64_t v75 = v74 + *(int *)(v90 + 36);
  *(unsigned char *)uint64_t v75 = v65;
  *(void *)(v75 + 8) = v67;
  *(void *)(v75 + 16) = v69;
  *(void *)(v75 + 24) = v71;
  *(void *)(v75 + 32) = v73;
  *(unsigned char *)(v75 + 40) = 0;
  sub_100032F44(v61, &qword_100158DF0);
  return sub_10002D9D0(v74, v57, &qword_100158DE0);
}

double sub_1000CC9A4(uint64_t a1, uint64_t a2)
{
  static HorizontalAlignment.trailing.getter();
  ViewDimensions.subscript.getter();
  double v4 = v3;
  LOBYTE(a2) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = swift_retain();
  uint64_t v6 = sub_1000333A8(v5, a2, 0xD000000000000010, 0x800000010010ADB0);
  swift_release();
  double v7 = sub_1000D6870(v6);
  swift_release();
  return v4 - v7;
}

id sub_1000CCA30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1000C4454((uint64_t (*)(uint64_t))sub_100071234, (uint64_t (*)(uint64_t))sub_100071418);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = CalculateUnit.id.getter();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  static UnitPoint.top.getter();
  sub_100032FA0(&qword_100154B90);
  sub_10007C1F8(&qword_100158FE8);
  ScrollViewProxy.scrollTo<A>(_:anchor:)();
  swift_bridgeObjectRelease();
  id result = [a3 unitType:v7, v9];
  if (result == (id)16)
  {
    char v11 = *(unsigned char *)(a2 + 24);
    uint64_t v12 = swift_retain();
    sub_1000333A8(v12, v11, 0xD000000000000028, 0x800000010010AD80);
    swift_release();
    sub_100073414();
    swift_release();
    swift_retain();
    swift_release();
    sub_100050F5C();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_1000CCBCC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  if (v27)
  {
    if (v26 == 0x79636E6572727543 && v27 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0) {
        goto LABEL_11;
      }
    }
    char v8 = *(unsigned char *)(a1 + 24);
    uint64_t v9 = swift_retain();
    sub_1000333A8(v9, v8, 0xD000000000000028, 0x800000010010AD80);
    swift_release();
    uint64_t v10 = sub_100073414();
    swift_release();
    uint64_t v11 = *(void *)(v10 + 24);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    sub_100014344(&qword_100154F68, (void (*)(uint64_t))type metadata accessor for CalculatorCurrencyCacheProvider);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    char v12 = *(unsigned char *)(v11 + OBJC_IVAR____TtC10Calculator31CalculatorCurrencyCacheProvider__isCurrencyCacheLoaded);
    swift_release();
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = swift_retain();
      sub_1000333A8(v13, v8, 0xD000000000000028, 0x800000010010AD80);
      swift_release();
      sub_100073414();
      swift_release();
      swift_retain();
      swift_release();
      sub_100050D58();
      swift_release();
    }
  }
LABEL_11:
  uint64_t v14 = (void *)sub_1000C4454((uint64_t (*)(uint64_t))sub_100071234, (uint64_t (*)(uint64_t))sub_100071418);
  if (v14
    && (uint64_t v15 = v14, v16 = [v14 category], v15, v16))
  {
    uint64_t v17 = CalculateUnitCategory.id.getter();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v20 = State.wrappedValue.getter();
  if (!v19)
  {
    if (!v27) {
      goto LABEL_29;
    }
    goto LABEL_21;
  }
  if (!v27)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (v17 == v26 && v19 == v27)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_bridgeObjectRelease();
LABEL_29:
    __chkstk_darwin(v20);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    return swift_release();
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t v20 = swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_29;
  }
LABEL_22:
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (result) {
      goto LABEL_24;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  uint64_t v21 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v21) {
    goto LABEL_31;
  }
LABEL_24:
  if ((a4 & 0xC000000000000001) != 0)
  {
    id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v23 = *(id *)(a4 + 32);
  }
  id v24 = v23;
  swift_bridgeObjectRelease();
  CalculateUnit.id.getter();

LABEL_32:
  static UnitPoint.top.getter();
  sub_100032FA0(&qword_100154B90);
  sub_10007C1F8(&qword_100158FE8);
  ScrollViewProxy.scrollTo<A>(_:anchor:)();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CD074()
{
  uint64_t v0 = sub_1000C4454((uint64_t (*)(uint64_t))sub_100071234, (uint64_t (*)(uint64_t))sub_100071418);
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    CalculateUnit.id.getter();
  }
  static UnitPoint.top.getter();
  sub_100032FA0(&qword_100154B90);
  sub_10007C1F8(&qword_100158FE8);
  ScrollViewProxy.scrollTo<A>(_:anchor:)();
  return swift_bridgeObjectRelease();
}

double sub_1000CD17C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  if (qword_100154358 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100160E40;
  uint64_t v5 = static HorizontalAlignment.center.getter();
  sub_1000CE774(v2, (uint64_t)v11);
  *(_OWORD *)((char *)&v13[7] + 7) = v11[7];
  *(_OWORD *)((char *)&v13[8] + 7) = v11[8];
  *(_OWORD *)((char *)&v13[9] + 7) = v11[9];
  *(_OWORD *)((char *)&v13[3] + 7) = v11[3];
  *(_OWORD *)((char *)&v13[4] + 7) = v11[4];
  *(_OWORD *)((char *)&v13[5] + 7) = v11[5];
  *(_OWORD *)((char *)&v13[6] + 7) = v11[6];
  *(_OWORD *)((char *)v13 + 7) = v11[0];
  *(_OWORD *)((char *)&v13[1] + 7) = v11[1];
  char v14 = 0;
  *(void *)((char *)&v13[10] + 7) = v12;
  *(_OWORD *)((char *)&v13[2] + 7) = v11[2];
  if (qword_1001545D8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1001611E0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = swift_getKeyPath();
  long long v24 = v13[7];
  long long v25 = v13[8];
  *(_OWORD *)uint64_t v26 = v13[9];
  *(_OWORD *)&v26[15] = *(_OWORD *)((char *)&v13[9] + 15);
  long long v20 = v13[3];
  long long v21 = v13[4];
  long long v22 = v13[5];
  long long v23 = v13[6];
  long long v17 = v13[0];
  v15[0] = v5;
  v15[1] = v4;
  char v16 = 0;
  long long v18 = v13[1];
  long long v19 = v13[2];
  uint64_t v27 = KeyPath;
  uint64_t v28 = v6;
  uint64_t v29 = v8;
  char v30 = 1;
  swift_retain();
  static Alignment.center.getter();
  sub_1000C35D0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, __src, 0.0, 1, INFINITY, 0);
  sub_1000D41EC((uint64_t)v15);
  char v9 = static Edge.Set.all.getter();
  memcpy((void *)a1, __src, 0x150uLL);
  *(unsigned char *)(a1 + 336) = v9;
  double result = 0.0;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(unsigned char *)(a1 + 376) = 1;
  return result;
}

uint64_t sub_1000CD3E8()
{
  uint64_t v0 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v0);
  static HorizontalAlignment.center.getter();
  sub_100014344(&qword_100158EC0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_100032FA0(&qword_100158EC8);
  sub_1000D4370();
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_1000CD51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = v7 - 1;
  v16[6] = 0;
  v16[7] = v7;
  swift_getKeyPath();
  sub_1000D5F30(a2, (uint64_t)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  sub_1000D27C4((uint64_t)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *(void *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
  swift_bridgeObjectRetain();
  sub_100032FA0(&qword_100158F18);
  sub_100032FA0(&qword_100158F20);
  sub_1000D47B0();
  uint64_t v11 = sub_1000317D8(&qword_100158ED8);
  uint64_t v12 = sub_1000317D8(&qword_100158EE0);
  uint64_t v13 = sub_1000D28A8(&qword_100158EE8, &qword_100158ED8, (void (*)(void))sub_1000D44A8);
  uint64_t v14 = sub_100040BE4(&qword_100158F10, &qword_100158EE0);
  v16[0] = v11;
  v16[1] = v12;
  v16[2] = &type metadata for EmptyView;
  v16[3] = v13;
  v16[4] = v14;
  v16[5] = &protocol witness table for EmptyView;
  swift_getOpaqueTypeConformance2();
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000CD788@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100032FA0(&qword_100158F38);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*a1 < *(void *)(a2 + 16))
  {
    uint64_t v50 = a5;
    uint64_t v49 = v47;
    *(double *)&long long v15 = __chkstk_darwin(v12);
    v47[0] = &v47[-8];
    long long v48 = v15;
    *(_OWORD *)&v47[-6] = v15;
    v47[-4] = a3;
    v47[-3] = v16;
    v47[-2] = a4;
    id v17 = (id)v15;
    v47[1] = *((void *)&v48 + 1);
    swift_bridgeObjectRetain();
    *(void *)&long long v48 = v17;
    id v18 = [v17 displayName];
    a5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v19;

    if (qword_1001546E8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  __break(1u);
LABEL_15:
  swift_once();
LABEL_4:
  uint64_t v20 = qword_100161300;
  uint64_t v21 = qword_100154598;
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_1001611A0;
  swift_retain();
  char v23 = static Edge.Set.top.getter();
  if (qword_100154318 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  char v32 = static Edge.Set.bottom.getter();
  if (qword_100154320 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  char v75 = 0;
  char v74 = 0;
  char v41 = static Edge.Set.leading.getter();
  if (qword_100154328 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  char v76 = 0;
  uint64_t v51 = a5;
  uint64_t v52 = a1;
  uint64_t v53 = v20;
  uint64_t v54 = v22;
  char v55 = 0;
  char v56 = v23;
  uint64_t v57 = v25;
  uint64_t v58 = v27;
  uint64_t v59 = v29;
  uint64_t v60 = v31;
  char v61 = v75;
  char v62 = v32;
  uint64_t v63 = v34;
  uint64_t v64 = v36;
  uint64_t v65 = v38;
  uint64_t v66 = v40;
  char v67 = v74;
  char v68 = v41;
  uint64_t v69 = v42;
  uint64_t v70 = v43;
  uint64_t v71 = v44;
  uint64_t v72 = v45;
  char v73 = 0;
  sub_100032FA0(&qword_100158ED8);
  sub_100032FA0(&qword_100158EE0);
  sub_1000D28A8(&qword_100158EE8, &qword_100158ED8, (void (*)(void))sub_1000D44A8);
  sub_100040BE4(&qword_100158F10, &qword_100158EE0);
  Section<>.init(header:content:)();
  Section<>.collapsible(_:)();
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

uint64_t sub_1000CDC68()
{
  uint64_t v0 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v0);
  static HorizontalAlignment.center.getter();
  sub_100014344(&qword_100158EC0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_100032FA0(&qword_100158F40);
  sub_1000D2FB4(&qword_100158F48, &qword_100158F40, (void (*)(void))sub_1000D48C8);
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_1000CDDF0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12 - 8);
  long long v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a4;
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0) {
      uint64_t v24 = a2;
    }
    else {
      uint64_t v24 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v27 = v24;
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v26 = v16 - 1;
    if (!__OFSUB__(v16, 1))
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if ((v16 & 0x8000000000000000) == 0)
      {
LABEL_11:
        uint64_t v17 = v26;
        goto LABEL_3;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v17 = v16 - 1;
LABEL_3:
  uint64_t v31 = 0;
  uint64_t v32 = v16;
  swift_getKeyPath();
  sub_1000D5F30(a3, (uint64_t)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView);
  unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v19 = (v14 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = a2;
  sub_1000D27C4((uint64_t)v15, v21 + v18);
  *(void *)(v21 + v19) = v28;
  *(void *)(v21 + v20) = v29;
  *(void *)(v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8)) = v17;
  swift_bridgeObjectRetain();
  id v22 = a1;
  sub_100032FA0(&qword_100158F18);
  sub_100032FA0(&qword_100158F58);
  sub_1000D47B0();
  sub_1000D48C8();
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000CE054@<X0>(unint64_t *a1@<X0>, unint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v14 = sub_100032FA0(&qword_100158F78);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100032FA0(&qword_100158F68);
  __chkstk_darwin(v17);
  unint64_t v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v20 = *a1;
  if ((a2 & 0xC000000000000001) == 0)
  {
    if ((v20 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v20 < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v21 = (id *)*(id *)(a2 + 8 * v20 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v21 = (id *)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_5:
  a2 = (unint64_t)v21;
  *(void *)uint64_t v16 = static HorizontalAlignment.leading.getter();
  *((void *)v16 + 1) = 0;
  v16[16] = 0;
  uint64_t v22 = sub_100032FA0(&qword_100158F80);
  sub_1000CE308((void *)a2, a4, a5, v20, a6, (uint64_t)&v16[*(int *)(v22 + 44)]);
  type metadata accessor for UnitConversionPopoverView();
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100033344((uint64_t)v16, (uint64_t)v19, &qword_100158F78);
  char v23 = &v19[*(int *)(v17 + 36)];
  long long v24 = v35[1];
  *(_OWORD *)char v23 = v35[0];
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v35[2];
  sub_100032F44((uint64_t)v16, &qword_100158F78);
  a3 = static Edge.Set.top.getter();
  if (qword_100154300 != -1) {
LABEL_10:
  }
    swift_once();
  EdgeInsets.init(_all:)();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_100033344((uint64_t)v19, a7, &qword_100158F68);

  uint64_t v33 = a7 + *(int *)(sub_100032FA0(&qword_100158F58) + 36);
  *(unsigned char *)uint64_t v33 = a3;
  *(void *)(v33 + 8) = v26;
  *(void *)(v33 + 16) = v28;
  *(void *)(v33 + 24) = v30;
  *(void *)(v33 + 32) = v32;
  *(unsigned char *)(v33 + 40) = 0;
  return sub_100032F44((uint64_t)v19, &qword_100158F68);
}

uint64_t sub_1000CE308@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v63 = a4;
  uint64_t v64 = a5;
  uint64_t v65 = a6;
  uint64_t v9 = sub_100032FA0(&qword_100158DE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100158F88);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100032FA0(&qword_100158F90);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  unint64_t v20 = (char *)&v62 - v19;
  sub_1000CBFD4(a1, 1, (uint64_t)v11);
  char v21 = static Edge.Set.bottom.getter();
  if (qword_100154308 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_100033344((uint64_t)v11, (uint64_t)v14, &qword_100158DE0);
  uint64_t v30 = &v14[*(int *)(v12 + 36)];
  *uint64_t v30 = v21;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_100032F44((uint64_t)v11, &qword_100158DE0);
  char v31 = static Edge.Set.leading.getter();
  if (qword_100154310 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_100033344((uint64_t)v14, (uint64_t)v17, &qword_100158F88);
  uint64_t v40 = &v17[*(int *)(v15 + 36)];
  *uint64_t v40 = v31;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_100032F44((uint64_t)v14, &qword_100158F88);
  sub_10002D9D0((uint64_t)v17, (uint64_t)v20, &qword_100158F90);
  if (a2 == a3 && v63 == v64)
  {
    uint64_t v41 = (uint64_t)v17;
    uint64_t v42 = (uint64_t)v20;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
  }
  else
  {
    if (qword_100154650 != -1) {
      swift_once();
    }
    uint64_t v41 = (uint64_t)v17;
    uint64_t v42 = (uint64_t)v20;
    uint64_t v64 = qword_100161258;
    swift_retain();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v43 = v66;
    uint64_t v44 = v67;
    uint64_t v45 = v68;
    uint64_t v46 = v69;
    uint64_t v47 = v70;
    uint64_t v48 = v71;
    unsigned __int8 v53 = static Edge.Set.leading.getter();
    if (qword_1001542F8 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v49 = v54;
    uint64_t v50 = v55;
    uint64_t v51 = v56;
    uint64_t v52 = v57;
    uint64_t v63 = v53;
  }
  sub_100033344(v42, v41, &qword_100158F90);
  uint64_t v58 = v65;
  sub_100033344(v41, v65, &qword_100158F90);
  uint64_t v59 = v58 + *(int *)(sub_100032FA0(&qword_100158F98) + 48);
  uint64_t v60 = v63;
  *(void *)uint64_t v59 = v64;
  *(void *)(v59 + 8) = v43;
  *(void *)(v59 + 16) = v44;
  *(void *)(v59 + 24) = v45;
  *(void *)(v59 + 32) = v46;
  *(void *)(v59 + 40) = v47;
  *(void *)(v59 + 48) = v48;
  *(void *)(v59 + 56) = v60;
  *(void *)(v59 + 64) = v49;
  *(void *)(v59 + 72) = v50;
  *(void *)(v59 + 80) = v51;
  *(void *)(v59 + 88) = v52;
  *(unsigned char *)(v59 + 96) = 0;
  swift_retain();
  sub_100032F44(v42, &qword_100158F90);
  swift_release();
  return sub_100032F44(v41, &qword_100158F90);
}

uint64_t sub_1000CE774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100032FA0(&qword_1001568C0);
  __chkstk_darwin(v4 - 8);
  char v73 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for Image.ResizingMode();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154448 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
  uint64_t v74 = Image.resizable(capInsets:resizingMode:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v11 = type metadata accessor for UnitConversionPopoverView();
  uint64_t v12 = sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v72 = v79;
  int v71 = v80;
  uint64_t v70 = v81;
  int v69 = v82;
  uint64_t v68 = v83;
  uint64_t v67 = v84;
  int v66 = static Edge.Set.bottom.getter();
  if (qword_100154360 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v21._object = (void *)0x800000010010AE30;
  v21._countAndFlagsBits = 0x1000000000000012;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v21);
  uint64_t v22 = *(void *)(a1 + 176);
  long long v76 = *(_OWORD *)(a1 + 160);
  uint64_t v77 = v22;
  sub_100032FA0(&qword_100158A88);
  State.wrappedValue.getter();
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v78);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 10256610;
  v23._object = (void *)0xA300000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v23);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t v24 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v26 = v25;
  uint64_t v62 = a1;
  char v28 = v27 & 1;
  ScaledMetric.wrappedValue.getter();
  static Font.Weight.medium.getter();
  uint64_t v29 = type metadata accessor for Font.Design();
  v58[2] = v12;
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)(v29 - 8);
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v60 = v31 + 56;
  v58[1] = v11;
  uint64_t v32 = (uint64_t)v73;
  v59(v73, 1, 1, v29);
  static Font.system(size:weight:design:)();
  sub_100032F44(v32, &qword_1001568C0);
  uint64_t v64 = Text.font(_:)();
  uint64_t v63 = v33;
  char v35 = v34;
  uint64_t v65 = v36;
  swift_release();
  int v61 = v35 & 1;
  sub_1000356E0(v24, v26, v28);
  swift_bridgeObjectRelease();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v37 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v39 = v38;
  char v41 = v40 & 1;
  ScaledMetric.wrappedValue.getter();
  static Font.Weight.medium.getter();
  v59((char *)v32, 1, 1, v30);
  static Font.system(size:weight:design:)();
  sub_100032F44(v32, &qword_1001568C0);
  uint64_t v42 = Text.font(_:)();
  uint64_t v44 = v43;
  char v46 = v45;
  uint64_t v48 = v47;
  swift_release();
  sub_1000356E0(v37, v39, v41);
  swift_bridgeObjectRelease();
  char v49 = v61;
  char v75 = v61;
  char v50 = v71;
  char v93 = v71;
  char v51 = v69;
  char v92 = v69;
  char v90 = 0;
  char v88 = v61;
  char v86 = v46 & 1;
  *(_DWORD *)(a2 + 17) = v76;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v76 + 3);
  *(_DWORD *)(a2 + 33) = v78._countAndFlagsBits;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)((char *)&v78._countAndFlagsBits + 3);
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v91;
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v89;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v89[3];
  char v52 = v88;
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v87;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v87[3];
  char v53 = v86;
  *(_DWORD *)(a2 + 153) = *(_DWORD *)v85;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v85[3];
  uint64_t v54 = v72;
  *(void *)a2 = v74;
  *(void *)(a2 + 8) = v54;
  *(unsigned char *)(a2 + 16) = v50;
  *(void *)(a2 + 24) = v70;
  *(unsigned char *)(a2 + 32) = v51;
  *(void *)(a2 + 40) = v68;
  *(void *)(a2 + 48) = v67;
  *(unsigned char *)(a2 + 56) = v66;
  *(void *)(a2 + 64) = v14;
  *(void *)(a2 + 72) = v16;
  *(void *)(a2 + 80) = v18;
  *(void *)(a2 + 88) = v20;
  *(unsigned char *)(a2 + 96) = 0;
  uint64_t v55 = v64;
  uint64_t v56 = v63;
  *(void *)(a2 + 104) = v64;
  *(void *)(a2 + 112) = v56;
  *(unsigned char *)(a2 + 120) = v52;
  *(void *)(a2 + 128) = v65;
  *(void *)(a2 + 136) = v42;
  *(void *)(a2 + 144) = v44;
  *(unsigned char *)(a2 + 152) = v53;
  *(void *)(a2 + 160) = v48;
  swift_retain();
  sub_1000637B4(v55, v56, v49);
  swift_bridgeObjectRetain();
  sub_1000637B4(v42, v44, v46 & 1);
  swift_bridgeObjectRetain();
  sub_1000356E0(v42, v44, v46 & 1);
  swift_bridgeObjectRelease();
  sub_1000356E0(v55, v56, v75);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CEF58(unsigned char *a1, void *a2)
{
  sub_100032FA0(&qword_100158AD0);
  State.wrappedValue.getter();
  uint64_t v4 = CalculateUnit.id.getter();
  if (!v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v21 == v4 && v22 == v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
LABEL_9:
    CalculateUnit.id.getter();
    State.wrappedValue.setter();
    id v8 = [a2 category];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = CalculateUnitCategory.id.getter();
    }
    else
    {
      char v10 = 0;
    }
    LOBYTE(v21) = v10;
    State.wrappedValue.setter();
    int v11 = a1[65];
    char v12 = a1[24];
    uint64_t v13 = swift_retain();
    sub_1000333A8(v13, v12, 0xD000000000000028, 0x800000010010AD80);
    swift_release();
    sub_100073414();
    swift_release();
    if (v11 == 1) {
      sub_1000717F0(a2);
    }
    else {
      sub_100072604(a2);
    }
    swift_release();
    uint64_t v14 = swift_retain();
    sub_1000333A8(v14, v12, 0xD000000000000028, 0x800000010010AD80);
    swift_release();
    sub_100073414();
    swift_release();
    swift_retain();
    swift_release();
    sub_1000A3ACC(a2);
    swift_release();
    char v15 = a1[8];
    uint64_t v16 = swift_retain();
    sub_1000333A8(v16, v15, 0xD000000000000013, 0x800000010010AB80);
    swift_release();
    swift_retain();
    swift_release();
    uint64_t v17 = swift_retain();
    sub_1000333A8(v17, v12, 0xD000000000000028, 0x800000010010AD80);
    swift_release();
    uint64_t v18 = sub_100073414();
    swift_release();
    sub_1000D9AE4(v18);
    swift_release();
    swift_release();
  }
LABEL_17:
  sub_100032FA0(&qword_100154898);
  uint64_t v19 = State.wrappedValue.getter();
  if (v21 == 1)
  {
    __chkstk_darwin(v19);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    swift_release();
  }
  sub_100032FA0(&qword_1001555B8);
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000CF310(uint64_t a1)
{
  sub_100032FA0(&qword_100154898);
  State.wrappedValue.setter();
  char v2 = *(unsigned char *)(a1 + 8);
  uint64_t v3 = swift_retain();
  sub_1000333A8(v3, v2, 0xD000000000000013, 0x800000010010AB80);
  swift_release();
  swift_getKeyPath();
  sub_100014344((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000CF460(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 24);
  uint64_t v2 = swift_retain();
  sub_1000333A8(v2, v1, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  sub_100073414();
  swift_release();
  swift_retain();
  swift_release();
  sub_1000A4020();

  return swift_release();
}

uint64_t sub_1000CF4F4@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000CF564()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000CF5B8@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000CF62C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  v24[0] = a3;
  uint64_t v5 = type metadata accessor for Image.ResizingMode();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032FA0(&qword_100158D20);
  __chkstk_darwin(v9);
  int v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v13 = __chkstk_darwin(v12);
  char v15 = (char *)v24 - v14;
  (*(void (**)(char *, void, uint64_t, double))(v6 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v5, v13);
  uint64_t v16 = Image.resizable(capInsets:resizingMode:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (qword_100154390 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v24[4] = v16;
  v24[5] = 0;
  __int16 v25 = 1;
  uint64_t v26 = v31;
  char v27 = v32;
  uint64_t v28 = v33;
  char v29 = v34;
  long long v30 = v35;
  v24[2] = a1;
  v24[3] = a2;
  sub_100023B24();
  swift_bridgeObjectRetain();
  uint64_t v17 = Text.init<A>(_:)();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_100032FA0(&qword_100158D30);
  sub_1000D28A8(&qword_100158D28, &qword_100158D30, (void (*)(void))sub_1000BE600);
  View.accessibilityLabel(_:)();
  sub_1000356E0(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  ModifiedContent<>.accessibilityIdentifier(_:)();
  sub_100032F44((uint64_t)v11, &qword_100158D20);
  uint64_t v22 = v24[0];
  sub_100033344((uint64_t)v15, v24[0], &qword_100158D20);
  *(void *)(v22 + *(int *)(sub_100032FA0(&qword_100158CE8) + 36)) = 0x4000000000000000;
  return sub_100032F44((uint64_t)v15, &qword_100158D20);
}

uint64_t sub_1000CF988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v207 = a2;
  uint64_t v193 = type metadata accessor for DynamicTypeSize();
  uint64_t v192 = *(void *)(v193 - 8);
  __chkstk_darwin(v193);
  uint64_t v191 = (char *)v150 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v4 - 8);
  uint64_t v170 = (char *)v150 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_100158C68);
  __chkstk_darwin(v6 - 8);
  v172 = (char *)v150 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_100032FA0(&qword_100158C70);
  __chkstk_darwin(v171);
  uint64_t v174 = (uint64_t)v150 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_100032FA0(&qword_100158C78);
  __chkstk_darwin(v173);
  uint64_t v175 = (uint64_t)v150 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_100032FA0(&qword_100158C80);
  __chkstk_darwin(v178);
  uint64_t v180 = (uint64_t)v150 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = sub_100032FA0(&qword_100158C88);
  uint64_t v186 = *(void *)(v187 - 8);
  __chkstk_darwin(v187);
  v182 = (char *)v150 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = sub_100032FA0(&qword_100158C90);
  __chkstk_darwin(v177);
  uint64_t v179 = (char *)v150 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_100032FA0(&qword_100158C98);
  __chkstk_darwin(v176);
  uint64_t v181 = (uint64_t)v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = sub_100032FA0(&qword_100158CA0);
  __chkstk_darwin(v184);
  uint64_t v183 = (uint64_t)v150 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = sub_100032FA0(&qword_100158CA8);
  uint64_t v189 = *(void *)(v190 - 8);
  __chkstk_darwin(v190);
  v188 = (char *)v150 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = sub_100032FA0(&qword_100158CB0);
  uint64_t v197 = *(void *)(v206 - 8);
  __chkstk_darwin(v206);
  uint64_t v185 = (char *)v150 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100032FA0(&qword_100154E28);
  __chkstk_darwin(v17 - 8);
  uint64_t v196 = (char *)v150 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v208 = *(void *)(v19 - 8);
  uint64_t v209 = v19;
  __chkstk_darwin(v19);
  uint64_t v203 = (char *)v150 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100032FA0(&qword_100158CB8);
  __chkstk_darwin(v21 - 8);
  uint64_t v205 = (uint64_t)v150 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v204 = (char *)v150 - v24;
  uint64_t v195 = sub_100032FA0(&qword_100158CC0);
  __chkstk_darwin(v195);
  uint64_t v26 = (char *)v150 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v194 = (uint64_t)v150 - v28;
  uint64_t v200 = sub_100032FA0(&qword_100158CC8);
  __chkstk_darwin(v200);
  uint64_t v201 = (uint64_t)v150 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = type metadata accessor for PlainButtonStyle();
  uint64_t v158 = *(void *)(v165 - 8);
  __chkstk_darwin(v165);
  long long v156 = (char *)v150 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100032FA0(&qword_100158CD0);
  uint64_t v155 = *(void *)(v164 - 8);
  __chkstk_darwin(v164);
  char v154 = (char *)v150 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_100032FA0(&qword_100158CD8);
  uint64_t v159 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v153 = (char *)v150 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  long long v157 = (char *)v150 - v34;
  uint64_t v161 = sub_100032FA0(&qword_100158CE0);
  __chkstk_darwin(v161);
  uint64_t v163 = (uint64_t)v150 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_100032FA0(&qword_100158CE8);
  __chkstk_darwin(v167);
  uint64_t v37 = (char *)v150 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100032FA0(&qword_1001550C0);
  __chkstk_darwin(v38 - 8);
  char v40 = (char *)v150 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = type metadata accessor for URL();
  uint64_t v168 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v152 = (char *)v150 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  v160 = (char *)v150 - v43;
  uint64_t v199 = sub_100032FA0(&qword_100158CF0);
  __chkstk_darwin(v199);
  uint64_t v162 = (char *)v150 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100032FA0(&qword_100154F60);
  __chkstk_darwin(v45 - 8);
  uint64_t v47 = (char *)v150 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for StocksKitCurrencyCache.Provider();
  uint64_t v49 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  char v51 = (char *)v150 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100032FA0(&qword_100158CF8);
  __chkstk_darwin(v52 - 8);
  uint64_t v202 = (uint64_t)v150 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v54);
  uint64_t v210 = (uint64_t)v150 - v55;
  uint64_t v56 = a1;
  LOBYTE(a1) = *(unsigned char *)(a1 + 24);
  uint64_t v57 = swift_retain();
  unint64_t v198 = (unint64_t)"Swift/UnsafeBufferPointer.swift";
  sub_1000333A8(v57, a1, 0xD000000000000028, 0x800000010010AD80);
  swift_release();
  sub_100073414();
  swift_release();
  swift_retain();
  swift_release();
  sub_10004FA74((uint64_t)v47);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48) == 1)
  {
    sub_100032F44((uint64_t)v47, &qword_100154F60);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v51, v47, v48);
    uint64_t v58 = StocksKitCurrencyCache.Provider.logo.getter();
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v151 = v49;
      uint64_t v194 = v48;
      StocksKitCurrencyCache.Provider.destination.getter();
      uint64_t v60 = v168;
      uint64_t v61 = v169;
      int v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v168 + 48))(v40, 1, v169);
      uint64_t v63 = v56;
      v150[2] = v59;
      if (v62 == 1)
      {
        sub_100032F44((uint64_t)v40, &qword_1001550C0);
        uint64_t v64 = StocksKitCurrencyCache.Provider.name.getter();
        sub_1000CF62C(v64, v65, (uint64_t)v37);
        swift_bridgeObjectRelease();
        sub_100033344((uint64_t)v37, v163, &qword_100158CE8);
        swift_storeEnumTagMultiPayload();
        uint64_t v66 = sub_100040BE4(&qword_100158D08, &qword_100158CD0);
        uint64_t v67 = sub_100014344(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
        uint64_t v211 = v164;
        uint64_t v212 = v165;
        uint64_t v213 = (char *)v66;
        uint64_t v214 = v67;
        swift_getOpaqueTypeConformance2();
        sub_1000D34A4();
        uint64_t v68 = (uint64_t)v162;
        _ConditionalContent<>.init(storage:)();
        sub_100032F44((uint64_t)v37, &qword_100158CE8);
      }
      else
      {
        long long v76 = v160;
        (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v160, v40, v61);
        uint64_t v77 = (*(uint64_t (**)(char *, char *, uint64_t))(v60 + 16))(v152, v76, v61);
        __chkstk_darwin(v77);
        v150[-4] = v56;
        v150[-3] = v59;
        uint64_t v148 = v51;
        v150[1] = sub_1000D34A4();
        Swift::String v78 = v154;
        Link.init(destination:label:)();
        uint64_t v79 = v156;
        PlainButtonStyle.init()();
        uint64_t v152 = (char *)sub_100040BE4(&qword_100158D08, &qword_100158CD0);
        uint64_t v80 = sub_100014344(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
        uint64_t v81 = v153;
        uint64_t v82 = v164;
        uint64_t v83 = v165;
        View.buttonStyle<A>(_:)();
        (*(void (**)(char *, uint64_t))(v158 + 8))(v79, v83);
        (*(void (**)(char *, uint64_t))(v155 + 8))(v78, v82);
        uint64_t v84 = v159;
        uint64_t v85 = v157;
        uint64_t v86 = v166;
        (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v157, v81, v166);
        (*(void (**)(uint64_t, char *, uint64_t))(v84 + 16))(v163, v85, v86);
        swift_storeEnumTagMultiPayload();
        uint64_t v211 = v82;
        uint64_t v212 = v83;
        uint64_t v213 = v152;
        uint64_t v214 = v80;
        swift_getOpaqueTypeConformance2();
        uint64_t v68 = (uint64_t)v162;
        _ConditionalContent<>.init(storage:)();
        (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
        (*(void (**)(char *, uint64_t))(v168 + 8))(v160, v169);
      }
      uint64_t v87 = v197;
      uint64_t v70 = v208;
      uint64_t v75 = v209;
      uint64_t v71 = (uint64_t)v196;
      sub_100033344(v68, v201, &qword_100158CF0);
      swift_storeEnumTagMultiPayload();
      sub_1000D3380();
      sub_1000D28A8(&qword_100158D38, &qword_100158CC0, (void (*)(void))sub_1000D34A4);
      _ConditionalContent<>.init(storage:)();
      swift_release();
      sub_100032F44(v68, &qword_100158CF0);
      (*(void (**)(char *, uint64_t))(v151 + 8))(v51, v194);
      uint64_t v69 = (uint64_t)v204;
      uint64_t v74 = v87;
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v48);
  }
  uint64_t v63 = v56;
  uint64_t v69 = (uint64_t)v204;
  uint64_t v70 = v208;
  uint64_t v71 = (uint64_t)v196;
  uint64_t v72 = v195;
  if (qword_100154450 != -1) {
    swift_once();
  }
  sub_1000CF62C(0x6620216F6F686179, 0xEE0065636E616E69, (uint64_t)v37);
  sub_100033344((uint64_t)v37, (uint64_t)v26, &qword_100158CE8);
  *(void *)&v26[*(int *)(v72 + 36)] = 0x3FD3333333333333;
  sub_100032F44((uint64_t)v37, &qword_100158CE8);
  uint64_t v73 = v194;
  sub_10002D9D0((uint64_t)v26, v194, &qword_100158CC0);
  sub_100033344(v73, v201, &qword_100158CC0);
  swift_storeEnumTagMultiPayload();
  sub_1000D3380();
  sub_1000D28A8(&qword_100158D38, &qword_100158CC0, (void (*)(void))sub_1000D34A4);
  _ConditionalContent<>.init(storage:)();
  sub_100032F44(v73, &qword_100158CC0);
  uint64_t v74 = v197;
  uint64_t v75 = v209;
LABEL_12:
  char v88 = *(unsigned char *)(v63 + 24);
  uint64_t v89 = swift_retain();
  sub_1000333A8(v89, v88, 0xD000000000000028, v198 | 0x8000000000000000);
  swift_release();
  uint64_t v90 = sub_100073414();
  swift_release();
  uint64_t v91 = *(void *)(v90 + 24);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v211 = v91;
  sub_100014344(&qword_100154F68, (void (*)(uint64_t))type metadata accessor for CalculatorCurrencyCacheProvider);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v92 = v91 + OBJC_IVAR____TtC10Calculator31CalculatorCurrencyCacheProvider__currencyCacheLastRefreshDate;
  swift_beginAccess();
  sub_100033344(v92, v71, &qword_100154E28);
  swift_release();
  int v93 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v71, 1, v75);
  uint64_t v94 = v206;
  if (v93 == 1)
  {
    sub_100032F44(v71, &qword_100154E28);
    uint64_t v95 = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v203, v71, v75);
    LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v96._countAndFlagsBits = 0x2064657461647055;
    v96._object = (void *)0xE800000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v96);
    v97._countAndFlagsBits = sub_100067AF0();
    LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v97);
    swift_bridgeObjectRelease();
    v98._countAndFlagsBits = 0;
    v98._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v98);
    LocalizedStringKey.init(stringInterpolation:)();
    __int16 v149 = 256;
    uint64_t v148 = 0;
    uint64_t v99 = Text.init(_:tableName:bundle:comment:)();
    uint64_t v101 = v100;
    uint64_t v211 = v99;
    uint64_t v212 = v100;
    char v103 = v102 & 1;
    LOBYTE(v213) = v102 & 1;
    uint64_t v214 = v104;
    uint64_t v105 = (uint64_t)v172;
    View.accessibilityIdentifier(_:)();
    sub_1000356E0(v99, v101, v103);
    swift_bridgeObjectRelease();
    uint64_t v106 = v174;
    sub_100033344(v105, v174, &qword_100158C68);
    *(void *)(v106 + *(int *)(v171 + 36)) = 0;
    sub_100032F44(v105, &qword_100158C68);
    if (qword_1001545E0 != -1) {
      swift_once();
    }
    uint64_t v107 = qword_1001611E8;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v109 = v175;
    sub_100033344(v106, v175, &qword_100158C70);
    uint64_t v110 = (uint64_t *)(v109 + *(int *)(v173 + 36));
    *uint64_t v110 = KeyPath;
    v110[1] = v107;
    swift_retain();
    sub_100032F44(v106, &qword_100158C70);
    if (qword_1001546E0 != -1) {
      swift_once();
    }
    uint64_t v111 = qword_1001612F8;
    uint64_t v112 = swift_getKeyPath();
    uint64_t v113 = v180;
    sub_100033344(v109, v180, &qword_100158C78);
    uint64_t v114 = (uint64_t *)(v113 + *(int *)(v178 + 36));
    *uint64_t v114 = v112;
    v114[1] = v111;
    swift_retain();
    sub_100032F44(v109, &qword_100158C78);
    uint64_t v115 = v192;
    uint64_t v116 = v191;
    uint64_t v117 = v193;
    (*(void (**)(char *, void, uint64_t))(v192 + 104))(v191, enum case for DynamicTypeSize.medium(_:), v193);
    sub_1000D36D4();
    uint64_t v118 = v182;
    View.dynamicTypeSize(_:)();
    (*(void (**)(char *, uint64_t))(v115 + 8))(v116, v117);
    sub_100032F44(v113, &qword_100158C80);
    uint64_t v119 = swift_getKeyPath();
    uint64_t v120 = v186;
    uint64_t v121 = (uint64_t)v179;
    uint64_t v122 = v187;
    (*(void (**)(char *, char *, uint64_t))(v186 + 16))(v179, v118, v187);
    uint64_t v123 = v121 + *(int *)(v177 + 36);
    *(void *)uint64_t v123 = v119;
    *(unsigned char *)(v123 + 8) = 0;
    (*(void (**)(char *, uint64_t))(v120 + 8))(v118, v122);
    uint64_t v124 = v181;
    sub_100033344(v121, v181, &qword_100158C90);
    *(_WORD *)(v124 + *(int *)(v176 + 36)) = 256;
    sub_100032F44(v121, &qword_100158C90);
    uint64_t v125 = swift_getKeyPath();
    uint64_t v126 = v183;
    sub_100033344(v124, v183, &qword_100158C98);
    uint64_t v127 = (uint64_t *)(v126 + *(int *)(v184 + 36));
    uint64_t *v127 = v125;
    v127[1] = 0x3FE999999999999ALL;
    sub_100032F44(v124, &qword_100158C98);
    sub_1000D3A08();
    uint64_t v128 = v188;
    View.lineHeightMultiple(_:)();
    sub_100032F44(v126, &qword_100158CA0);
    LOBYTE(v125) = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v130 = v129;
    uint64_t v132 = v131;
    uint64_t v134 = v133;
    uint64_t v136 = v135;
    uint64_t v137 = v189;
    uint64_t v138 = (uint64_t)v185;
    uint64_t v139 = v190;
    (*(void (**)(char *, char *, uint64_t))(v189 + 16))(v185, v128, v190);
    uint64_t v140 = v138 + *(int *)(v94 + 36);
    *(unsigned char *)uint64_t v140 = v125;
    *(void *)(v140 + 8) = v130;
    *(void *)(v140 + 16) = v132;
    *(void *)(v140 + 24) = v134;
    *(void *)(v140 + 32) = v136;
    *(unsigned char *)(v140 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v137 + 8))(v128, v139);
    (*(void (**)(char *, uint64_t))(v208 + 8))(v203, v209);
    sub_10002D9D0(v138, v69, &qword_100158CB0);
    uint64_t v95 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v74 + 56))(v69, v95, 1, v94);
  uint64_t v141 = v210;
  uint64_t v142 = v202;
  sub_100033344(v210, v202, &qword_100158CF8);
  uint64_t v143 = v205;
  sub_100033344(v69, v205, &qword_100158CB8);
  uint64_t v144 = v207;
  sub_100033344(v142, v207, &qword_100158CF8);
  uint64_t v145 = sub_100032FA0(&qword_100158D40);
  uint64_t v146 = v144 + *(int *)(v145 + 48);
  *(void *)uint64_t v146 = 0;
  *(unsigned char *)(v146 + 8) = 1;
  sub_100033344(v143, v144 + *(int *)(v145 + 64), &qword_100158CB8);
  sub_100032F44(v69, &qword_100158CB8);
  sub_100032F44(v141, &qword_100158CF8);
  sub_100032F44(v143, &qword_100158CB8);
  return sub_100032F44(v142, &qword_100158CF8);
}

uint64_t sub_1000D14F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = StocksKitCurrencyCache.Provider.name.getter();
  sub_1000CF62C(v2, v3, a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D1564(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.colorScheme.setter();
}

double sub_1000D162C()
{
  sub_100032FA0(&qword_100159068);
  double v0 = COERCE_DOUBLE(swift_allocObject());
  *(_OWORD *)(*(void *)&v0 + 16) = xmmword_100113410;
  *(void *)(*(void *)&v0 + 32) = static Color.clear.getter();
  *(void *)(*(void *)&v0 + 40) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 48) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 56) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 64) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 72) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 80) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 88) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 96) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 104) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 112) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 120) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 128) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 136) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 144) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 152) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 160) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 168) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 176) = static Color.black.getter();
  *(void *)(*(void *)&v0 + 184) = static Color.clear.getter();
  *(double *)&long long v2 = v0;
  specialized Array._endMutation()();
  Gradient.init(colors:)();
  static UnitPoint.leading.getter();
  static UnitPoint.trailing.getter();
  LinearGradient.init(gradient:startPoint:endPoint:)();
  double result = v0;
  xmmword_100158900 = v2;
  unk_100158910 = v3;
  qword_100158920 = v4;
  return result;
}

uint64_t sub_1000D1780@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100014344(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 40);
  return result;
}

uint64_t sub_1000D1828()
{
  return swift_release();
}

uint64_t sub_1000D18F8(uint64_t a1, char a2)
{
  return sub_1000333A8(a1, a2, 0xD00000000000001ALL, 0x800000010010B030);
}

uint64_t sub_1000D1914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000D1984(a1, a2, a3, 0x800000010010AF80);
}

uint64_t sub_1000D1928(uint64_t a1, char a2)
{
  return sub_1000333A8(a1, a2, 0xD000000000000028, 0x800000010010AD80);
}

uint64_t sub_1000D1944@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D748(&qword_100156668, &qword_100156680, 0xD00000000000001BLL, 0x800000010010B010, a1);
}

uint64_t sub_1000D1970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000D1984(a1, a2, a3, 0x800000010010AFA0);
}

uint64_t sub_1000D1984(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for EnvironmentValues();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) != 0)
  {
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v12 = static os_log_type_t.fault.getter();
    uint64_t v13 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v18 = v9;
      uint64_t v15 = (uint8_t *)v14;
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = v15 + 4;
      uint64_t v19 = sub_10000DAA8(0xD000000000000015, a4, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v9 = v18;
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_10002F4E8(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v20;
  }
  return a1;
}

uint64_t sub_1000D1BC4(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v8 = type metadata accessor for EnvironmentValues();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1000319D0(a1, a2, a3);
  }
  else
  {
    swift_retain();
    os_log_type_t v12 = static os_log_type_t.fault.getter();
    uint64_t v13 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = v15 + 4;
      uint64_t v19 = sub_10000DAA8(0xD00000000000001CLL, 0x800000010010B050, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_10002F4DC(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v20;
  }
  return a1;
}

id sub_1000D1E04(void *a1, char a2)
{
  id v14 = a1;
  uint64_t v3 = type metadata accessor for EnvironmentValues();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v12 = v14;
    return v12;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = static os_log_type_t.fault.getter();
    uint64_t v8 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v15 = sub_10000DAA8(0xD000000000000020, 0x800000010010AFE0, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_10001A83C(v14, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v16;
  }
}

uint64_t sub_1000D2040@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D748(&qword_1001590B8, &qword_100154A48, 0xD000000000000020, 0x800000010010AF50, a1);
}

uint64_t sub_1000D206C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000D20A4(&qword_1001590A8, (uint64_t (*)(void))&type metadata accessor for OpenWindowAction, 0xD000000000000010, 0x800000010010AF30, a1);
}

uint64_t sub_1000D20A4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100032FA0(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100033344(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    uint64_t v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10000DAA8(v27, v25, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000D2364(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000D23E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100032FA0(&qword_100158AC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D2530@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D255C()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000D2588@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000D25B4()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000D25DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D2608()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000D2630@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D265C()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000D2688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100032FA0(&qword_100157B88);
  sub_100032FA0(&qword_100158DE0);
  sub_100040BE4(&qword_100158E18, &qword_100157B88);
  sub_1000D3BCC();
  sub_1000D3E08(&qword_100158E20, &qword_100157B78);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000D27C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnitConversionPopoverView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D2828()
{
  return sub_1000D4170(sub_1000C8B48);
}

uint64_t sub_1000D2844()
{
  return sub_1000D4170(sub_1000C8D10);
}

uint64_t sub_1000D2860()
{
  return sub_1000D4170(sub_1000C8ED4);
}

uint64_t sub_1000D2878()
{
  return sub_1000D28A8(&qword_100158AA0, &qword_100158A28, (void (*)(void))sub_1000D2924);
}

uint64_t sub_1000D28A8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000D2924()
{
  unint64_t result = qword_100158AA8;
  if (!qword_100158AA8)
  {
    sub_1000317D8(&qword_100158A20);
    sub_1000D28A8(&qword_100158AB0, &qword_100158A18, (void (*)(void))sub_1000D29F0);
    sub_100040BE4(&qword_100155370, &qword_100155378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158AA8);
  }
  return result;
}

uint64_t sub_1000D29F0()
{
  return sub_1000D28A8(&qword_100158AB8, &qword_100158A10, (void (*)(void))sub_1000D2A20);
}

unint64_t sub_1000D2A20()
{
  unint64_t result = qword_100158AC0;
  if (!qword_100158AC0)
  {
    sub_1000317D8(&qword_100158A08);
    sub_1000317D8(&qword_1001589F8);
    sub_1000317D8(&qword_1001589F0);
    sub_100040BE4(&qword_100158A90, &qword_1001589F0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158AC0);
  }
  return result;
}

void sub_1000D2B48()
{
  sub_100073538(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000D2B64@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C83D8(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000D2B6C()
{
  return sub_1000C8A08(*(void *)(v0 + 16));
}

uint64_t sub_1000D2B78()
{
  return sub_1000D4170((uint64_t (*)(uint64_t))sub_1000CF564);
}

uint64_t sub_1000D2B90@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C5E54(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000D2B98()
{
  unint64_t result = qword_100158B18;
  if (!qword_100158B18)
  {
    sub_1000317D8(&qword_100158B20);
    sub_1000D2C38();
    sub_100040BE4(&qword_100158BC8, &qword_100158BD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158B18);
  }
  return result;
}

unint64_t sub_1000D2C38()
{
  unint64_t result = qword_100158B28;
  if (!qword_100158B28)
  {
    sub_1000317D8(&qword_100158B30);
    sub_100040BE4(&qword_100158B38, &qword_100158B40);
    sub_1000D2CD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158B28);
  }
  return result;
}

unint64_t sub_1000D2CD8()
{
  unint64_t result = qword_100158B48;
  if (!qword_100158B48)
  {
    sub_1000317D8(&qword_100158B50);
    sub_1000D28A8(&qword_100158B58, &qword_100158B60, (void (*)(void))sub_1000D2D80);
    sub_1000D2F14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158B48);
  }
  return result;
}

uint64_t sub_1000D2D80()
{
  return sub_1000D28A8(&qword_100158B68, &qword_100158B70, (void (*)(void))sub_1000D2DB0);
}

unint64_t sub_1000D2DB0()
{
  unint64_t result = qword_100158B78;
  if (!qword_100158B78)
  {
    sub_1000317D8(&qword_100158B80);
    sub_1000D2E50();
    sub_100040BE4(&qword_100158320, &qword_100158328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158B78);
  }
  return result;
}

unint64_t sub_1000D2E50()
{
  unint64_t result = qword_100158B88;
  if (!qword_100158B88)
  {
    sub_1000317D8(&qword_100158B90);
    sub_100040BE4(&qword_100158B98, &qword_100158BA0);
    sub_100040BE4(&qword_100155410, &qword_100155418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158B88);
  }
  return result;
}

unint64_t sub_1000D2F14()
{
  unint64_t result = qword_100158BA8;
  if (!qword_100158BA8)
  {
    sub_1000317D8(&qword_100158BB0);
    sub_100040BE4(&qword_100158BB8, &qword_100158BC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158BA8);
  }
  return result;
}

uint64_t sub_1000D2FB4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000D3020()
{
  unint64_t result = qword_100158BE0;
  if (!qword_100158BE0)
  {
    sub_1000317D8(&qword_100158BE8);
    sub_1000D30C0();
    sub_100040BE4(&qword_100158C48, &qword_100158C50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158BE0);
  }
  return result;
}

unint64_t sub_1000D30C0()
{
  unint64_t result = qword_100158BF0;
  if (!qword_100158BF0)
  {
    sub_1000317D8(&qword_100158BF8);
    sub_1000D28A8(&qword_100158C00, &qword_100158C08, (void (*)(void))sub_1000D318C);
    sub_100040BE4(&qword_100158C40, &qword_100156D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158BF0);
  }
  return result;
}

uint64_t sub_1000D318C()
{
  return sub_1000D28A8(&qword_100158C10, &qword_100158C18, (void (*)(void))sub_1000D31BC);
}

unint64_t sub_1000D31BC()
{
  unint64_t result = qword_100158C20;
  if (!qword_100158C20)
  {
    sub_1000317D8(&qword_100158C28);
    sub_100040BE4(&qword_100158C30, &qword_100158C38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158C20);
  }
  return result;
}

unint64_t sub_1000D325C()
{
  unint64_t result = qword_100158C58;
  if (!qword_100158C58)
  {
    sub_1000317D8(&qword_100158AF0);
    sub_1000D2FB4(&qword_100158B10, &qword_100158B08, (void (*)(void))sub_1000D2B98);
    sub_1000D2FB4(&qword_100158BD8, &qword_100158AE8, (void (*)(void))sub_1000D3020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158C58);
  }
  return result;
}

uint64_t sub_1000D3358()
{
  return EnvironmentValues.colorScheme.getter();
}

unint64_t sub_1000D3380()
{
  unint64_t result = qword_100158D00;
  if (!qword_100158D00)
  {
    sub_1000317D8(&qword_100158CF0);
    sub_1000317D8(&qword_100158CD0);
    type metadata accessor for PlainButtonStyle();
    sub_100040BE4(&qword_100158D08, &qword_100158CD0);
    sub_100014344(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_1000D34A4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D00);
  }
  return result;
}

unint64_t sub_1000D34A4()
{
  unint64_t result = qword_100158D10;
  if (!qword_100158D10)
  {
    sub_1000317D8(&qword_100158CE8);
    sub_1000D3544();
    sub_100040BE4(&qword_100156AE0, &qword_100156AE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D10);
  }
  return result;
}

unint64_t sub_1000D3544()
{
  unint64_t result = qword_100158D18;
  if (!qword_100158D18)
  {
    sub_1000317D8(&qword_100158D20);
    sub_1000D28A8(&qword_100158D28, &qword_100158D30, (void (*)(void))sub_1000BE600);
    sub_100014344(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D18);
  }
  return result;
}

uint64_t sub_1000D3624@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D3650()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000D367C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D36A8()
{
  return EnvironmentValues.font.setter();
}

unint64_t sub_1000D36D4()
{
  unint64_t result = qword_100158D48;
  if (!qword_100158D48)
  {
    sub_1000317D8(&qword_100158C80);
    sub_1000D3774();
    sub_100040BE4((unint64_t *)&qword_1001557B8, &qword_1001557C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D48);
  }
  return result;
}

unint64_t sub_1000D3774()
{
  unint64_t result = qword_100158D50;
  if (!qword_100158D50)
  {
    sub_1000317D8(&qword_100158C78);
    sub_1000D3814();
    sub_100040BE4(&qword_100155410, &qword_100155418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D50);
  }
  return result;
}

unint64_t sub_1000D3814()
{
  unint64_t result = qword_100158D58;
  if (!qword_100158D58)
  {
    sub_1000317D8(&qword_100158C70);
    sub_1000D38B4();
    sub_100040BE4(&qword_100156AE0, &qword_100156AE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D58);
  }
  return result;
}

unint64_t sub_1000D38B4()
{
  unint64_t result = qword_100158D60;
  if (!qword_100158D60)
  {
    sub_1000317D8(&qword_100158C68);
    sub_100014344(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D60);
  }
  return result;
}

uint64_t sub_1000D3960@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D398C()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000D39B4@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000D39E0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

unint64_t sub_1000D3A08()
{
  unint64_t result = qword_100158D68;
  if (!qword_100158D68)
  {
    sub_1000317D8(&qword_100158CA0);
    sub_1000D28A8(&qword_100158D70, &qword_100158C98, (void (*)(void))sub_1000D3AD4);
    sub_100040BE4(&qword_100155730, &qword_100155738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D68);
  }
  return result;
}

unint64_t sub_1000D3AD4()
{
  unint64_t result = qword_100158D78;
  if (!qword_100158D78)
  {
    sub_1000317D8(&qword_100158C90);
    sub_1000317D8(&qword_100158C80);
    sub_1000D36D4();
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100158320, &qword_100158328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158D78);
  }
  return result;
}

uint64_t sub_1000D3BA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000D14F0(a1);
}

uint64_t sub_1000D3BB8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000D4EF4(a1, 1, a2);
}

uint64_t sub_1000D3BC0()
{
  return sub_1000D2688(v0[2], v0[3], v0[4]);
}

uint64_t sub_1000D3BCC()
{
  return sub_1000D28A8(&qword_100158DD8, &qword_100158DE0, (void (*)(void))sub_1000D3BFC);
}

unint64_t sub_1000D3BFC()
{
  unint64_t result = qword_100158DE8;
  if (!qword_100158DE8)
  {
    sub_1000317D8(&qword_100158DF0);
    sub_1000317D8(&qword_100158DF8);
    sub_1000D3CD0();
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100156858, &qword_100156860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158DE8);
  }
  return result;
}

unint64_t sub_1000D3CD0()
{
  unint64_t result = qword_100158E00;
  if (!qword_100158E00)
  {
    sub_1000317D8(&qword_100158DF8);
    sub_100040BE4(&qword_100158E08, &qword_100158E10);
    sub_100040BE4(&qword_100157520, &qword_100157528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158E00);
  }
  return result;
}

uint64_t sub_1000D3D94()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000D3DCC(uint64_t *a1)
{
  long long v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_1000D3E08(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001CE8C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000D3E4C()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  unint64_t v3 = (*(void *)(*(void *)v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v4 + v1[16];
  uint64_t v6 = sub_100032FA0(&qword_100156688);
  int64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[17], v6);
  v7(v4 + v1[18], v6);
  v7(v4 + v1[19], v6);
  v7(v4 + v1[20], v6);
  v7(v4 + v1[21], v6);

  return swift_deallocObject();
}

uint64_t sub_1000D4044()
{
  uint64_t v1 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000CEF58((unsigned char *)(v0 + v2), v3);
}

uint64_t sub_1000D40D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000D4100()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_1000D4128()
{
  return swift_deallocObject();
}

uint64_t sub_1000D4138()
{
  return sub_1000CF310(*(void *)(v0 + 16));
}

uint64_t sub_1000D4158()
{
  return sub_1000D4170(sub_1000CF460);
}

uint64_t sub_1000D4170(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_1000D41E4()
{
  return sub_1000CD3E8();
}

uint64_t sub_1000D41EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  char v4 = *(unsigned char *)(a1 + 144);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  char v7 = *(unsigned char *)(a1 + 176);
  swift_release();
  sub_1000356E0(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1000356E0(v5, v6, v7);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_1000D42A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  char v4 = *(unsigned char *)(a1 + 144);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  char v7 = *(unsigned char *)(a1 + 176);
  swift_retain();
  sub_1000637B4(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1000637B4(v5, v6, v7);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1000D4368()
{
  return sub_1000CD51C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_1000D4370()
{
  unint64_t result = qword_100158ED0;
  if (!qword_100158ED0)
  {
    sub_1000317D8(&qword_100158EC8);
    sub_1000317D8(&qword_100158ED8);
    sub_1000317D8(&qword_100158EE0);
    sub_1000D28A8(&qword_100158EE8, &qword_100158ED8, (void (*)(void))sub_1000D44A8);
    sub_100040BE4(&qword_100158F10, &qword_100158EE0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158ED0);
  }
  return result;
}

uint64_t sub_1000D44A8()
{
  return sub_1000D28A8(&qword_100158EF0, &qword_100158EF8, (void (*)(void))sub_1000D44D8);
}

uint64_t sub_1000D44D8()
{
  return sub_1000D28A8(&qword_100158F00, &qword_100158F08, (void (*)(void))sub_10008E81C);
}

uint64_t sub_1000D4508()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v4 = v0 + v2 + v1[16];
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  uint64_t v6 = *(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + v1[17], v5);
  v6(v3 + v1[18], v5);
  v6(v3 + v1[19], v5);
  v6(v3 + v1[20], v5);
  v6(v3 + v1[21], v5);

  return swift_deallocObject();
}

uint64_t sub_1000D4700@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000CD788(a1, v7, v2 + v6, v8, a2);
}

unint64_t sub_1000D47B0()
{
  unint64_t result = qword_100158F28;
  if (!qword_100158F28)
  {
    sub_1000317D8(&qword_100158F18);
    sub_1000D482C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158F28);
  }
  return result;
}

unint64_t sub_1000D482C()
{
  unint64_t result = qword_100158F30;
  if (!qword_100158F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158F30);
  }
  return result;
}

uint64_t sub_1000D4880()
{
  return sub_1000D48B0((uint64_t (*)(void, void, void, void, void))sub_1000CDC68);
}

uint64_t sub_1000D4898()
{
  return sub_1000D48B0((uint64_t (*)(void, void, void, void, void))sub_1000CDDF0);
}

uint64_t sub_1000D48B0(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1000D48C8()
{
  return sub_1000D28A8(&qword_100158F50, &qword_100158F58, (void (*)(void))sub_1000D48F8);
}

unint64_t sub_1000D48F8()
{
  unint64_t result = qword_100158F60;
  if (!qword_100158F60)
  {
    sub_1000317D8(&qword_100158F68);
    sub_100040BE4(&qword_100158F70, &qword_100158F78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158F60);
  }
  return result;
}

uint64_t sub_1000D4998()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);

  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v4 = v0 + v2 + v1[16];
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  unint64_t v6 = *(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + v1[17], v5);
  v6(v3 + v1[18], v5);
  v6(v3 + v1[19], v5);
  v6(v3 + v1[20], v5);
  v6(v3 + v1[21], v5);

  return swift_deallocObject();
}

uint64_t sub_1000D4BA8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = *(void *)(v2 + 24);
  uint64_t v10 = *(void *)(v2 + v7);
  uint64_t v11 = *(void *)(v2 + v8);
  uint64_t v12 = *(void *)(v2 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000CE054(a1, v9, v2 + v6, v10, v11, v12, a2);
}

uint64_t sub_1000D4C70()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);

  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v4 = v0 + v2 + v1[16];
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  unint64_t v6 = *(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + v1[17], v5);
  v6(v3 + v1[18], v5);
  v6(v3 + v1[19], v5);
  v6(v3 + v1[20], v5);
  v6(v3 + v1[21], v5);

  return swift_deallocObject();
}

uint64_t sub_1000D4E64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v6 = *(void **)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000CB85C(a1, v6, v7, v8, a2);
}

uint64_t sub_1000D4EEC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000D4EF4(a1, 0, a2);
}

uint64_t sub_1000D4EF4@<X0>(void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return sub_1000CBFD4(*a1, a2, a3);
}

double sub_1000D4F78(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000CC9A4(a1, v4);
}

uint64_t sub_1000D4FE8()
{
  uint64_t v1 = type metadata accessor for ScrollViewProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(*(void *)v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
  unint64_t v7 = (*(void *)(*(void *)v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  uint64_t v8 = v0 + v6;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v9 = v0 + v6 + v5[16];
  uint64_t v10 = sub_100032FA0(&qword_100156688);
  uint64_t v11 = *(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v8 + v5[17], v10);
  v11(v8 + v5[18], v10);
  v11(v8 + v5[19], v10);
  v11(v8 + v5[20], v10);
  v11(v8 + v5[21], v10);

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1000D5268()
{
  return sub_1000D5578((uint64_t (*)(void))&type metadata accessor for ScrollViewProxy, (uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView, (uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t))sub_1000CCA30);
}

uint64_t sub_1000D52A8()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v12 = type metadata accessor for ScrollViewProxy();
  uint64_t v4 = *(void *)(v12 - 8);
  unint64_t v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v8 = v0 + v2 + v1[16];
  uint64_t v9 = sub_100032FA0(&qword_100156688);
  uint64_t v10 = *(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v7 + v1[17], v9);
  v10(v7 + v1[18], v9);
  v10(v7 + v1[19], v9);
  v10(v7 + v1[20], v9);
  v10(v7 + v1[21], v9);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v12);

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1000D5538()
{
  return sub_1000D5578((uint64_t (*)(void))type metadata accessor for UnitConversionPopoverView, (uint64_t (*)(void))&type metadata accessor for ScrollViewProxy, (uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t))sub_1000CCBCC);
}

uint64_t sub_1000D5578(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t (*a3)(unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(a2(0) - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v3 + v9;
  uint64_t v11 = (uint64_t *)(v3 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];

  return a3(v3 + v6, v10, v12, v13);
}

unint64_t sub_1000D5698()
{
  unint64_t result = qword_100158FD0;
  if (!qword_100158FD0)
  {
    sub_1000317D8(&qword_100158FB8);
    sub_100040BE4(&qword_100158FD8, &qword_100158DA0);
    sub_10008EC90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100158FD0);
  }
  return result;
}

uint64_t sub_1000D5738()
{
  return sub_1000CD074();
}

uint64_t sub_1000D5760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000C916C(a1, v6, a2);
}

uint64_t sub_1000D57E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C9A00(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000D57E8()
{
  unint64_t result = qword_100159040;
  if (!qword_100159040)
  {
    sub_1000317D8(&qword_100159048);
    sub_100040BE4(&qword_100159050, &qword_100159058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159040);
  }
  return result;
}

uint64_t sub_1000D5888()
{
  uint64_t v1 = type metadata accessor for ScrollViewProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(*(void *)v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  uint64_t v7 = v0 + v6;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v8 = v0 + v6 + v5[16];
  uint64_t v9 = sub_100032FA0(&qword_100156688);
  uint64_t v10 = *(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v7 + v5[17], v9);
  v10(v7 + v5[18], v9);
  v10(v7 + v5[19], v9);
  v10(v7 + v5[20], v9);
  v10(v7 + v5[21], v9);

  return swift_deallocObject();
}

uint64_t sub_1000D5AE8()
{
  type metadata accessor for ScrollViewProxy();
  type metadata accessor for UnitConversionPopoverView();

  return sub_1000CA4D4();
}

uint64_t sub_1000D5BB4()
{
  return sub_1000C9D4C(*(void *)(v0 + 16));
}

unint64_t sub_1000D5BBC()
{
  unint64_t result = qword_100159078;
  if (!qword_100159078)
  {
    sub_1000317D8(&qword_100159070);
    sub_100040BE4(&qword_100159080, &qword_100159088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159078);
  }
  return result;
}

uint64_t sub_1000D5C60@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UnitConversionPopoverView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000CA078(a1, v6, a2);
}

uint64_t sub_1000D5CE0()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionPopoverView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);

  uint64_t v3 = v0 + v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v4 = v0 + v2 + v1[16];
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  uint64_t v6 = *(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + v1[17], v5);
  v6(v3 + v1[18], v5);
  v6(v3 + v1[19], v5);
  v6(v3 + v1[20], v5);
  v6(v3 + v1[21], v5);

  return swift_deallocObject();
}

uint64_t sub_1000D5ECC()
{
  type metadata accessor for UnitConversionPopoverView();

  return sub_1000CA3CC();
}

uint64_t sub_1000D5F30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000D5F98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000D5FF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1000D60D0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1000D6140(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 120);
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 128);
  sub_1000637B4(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_1000637B4(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1000D622C(v8, v7, v6);
  return a1;
}

uint64_t sub_1000D622C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t assignWithTake for InputTextView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for InputTextView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InputTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1000D63AC(void *a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  uint64_t v5 = swift_retain();
  sub_100033AA8(v5, v4);
  swift_release();
  sub_10005D3E0(a1, *(NSObject **)(a2 + 24));

  return swift_release();
}

uint64_t sub_1000D6420()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000D6470(void *a1)
{
  return sub_1000D63AC(a1, v1 + 16);
}

double sub_1000D647C()
{
  if (sub_10002AFEC())
  {
    if (qword_1001543C0 != -1) {
      swift_once();
    }
    uint64_t v0 = &qword_100160EB8;
  }
  else
  {
    if (qword_1001541C8 != -1) {
      swift_once();
    }
    uint64_t v0 = &qword_100160CB0;
  }
  double v1 = *(double *)v0;
  if (sub_10002AFEC())
  {
    if (qword_1001543B8 != -1) {
      swift_once();
    }
    unint64_t v2 = &qword_100160EB0;
  }
  else
  {
    if (qword_1001541D0 != -1) {
      swift_once();
    }
    unint64_t v2 = &qword_100160CB8;
  }
  double v3 = *(double *)v2;
  if (sub_10002AFEC())
  {
    if (qword_1001543D0 != -1) {
      swift_once();
    }
    char v4 = &qword_100160EC8;
  }
  else
  {
    if (qword_1001541E0 != -1) {
      swift_once();
    }
    char v4 = &qword_100160CC8;
  }
  return v1 - v3 - *(double *)v4;
}

double sub_1000D662C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v14 - v7;
  id v9 = [self currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (!v10) {
    return INFINITY;
  }
  swift_getKeyPath();
  v14[1] = a1;
  sub_10002B4E8();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v11 = a1 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v11, v2);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UserInterfaceSizeClass.compact(_:), v2);
  LOBYTE(v11) = static UserInterfaceSizeClass.== infix(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v5, v2);
  v12(v8, v2);
  if (v11) {
    return INFINITY;
  }
  if (qword_100154298 != -1) {
    swift_once();
  }
  return *(double *)&qword_100160D80;
}

double sub_1000D6870(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v15 - v7;
  id v9 = [self currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  double v11 = 0.0;
  if (v10)
  {
    swift_getKeyPath();
    v15[1] = a1;
    sub_10002B4E8();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v12 = a1 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v12, v2);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UserInterfaceSizeClass.compact(_:), v2);
    LOBYTE(v12) = static UserInterfaceSizeClass.== infix(_:_:)();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
    v13(v5, v2);
    v13(v8, v2);
    if ((v12 & 1) == 0)
    {
      if (qword_1001542E8 != -1) {
        swift_once();
      }
      return *(double *)&qword_100160DD0;
    }
  }
  return v11;
}

void sub_1000D6AB8()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1)
  {
    sub_10002B248();
    id v2 = [self mainScreen];
    [v2 bounds];
  }
}

void sub_1000D6B84()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1)
  {
    sub_10002B3E4();
    id v2 = [self mainScreen];
    [v2 bounds];
  }
}

uint64_t sub_1000D6C50()
{
  uint64_t v0 = sub_100032FA0(&qword_1001568C0);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = self;
  id v4 = [v3 currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 != (id)1)
  {
    id v6 = [v3 currentDevice];
    [v6 userInterfaceIdiom];
  }
  static Font.Weight.regular.getter();
  uint64_t v7 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  uint64_t v8 = static Font.system(size:weight:design:)();
  sub_1000B0D84((uint64_t)v2);
  return v8;
}

uint64_t sub_1000D6DE4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = v14 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v8 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v8;
    uint64_t v9 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v9;
    uint64_t v10 = *(int *)(a3 + 56);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    *(void *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v13 = sub_100032FA0(&qword_100156688);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_1000D6F38(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000D6FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000D70F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000D7250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v5 = *(int *)(a3 + 56);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_1000D72F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000D7408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D741C);
}

uint64_t sub_1000D741C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100032FA0(&qword_100156688);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000D74D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D74E4);
}

uint64_t sub_1000D74E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100156688);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 56);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for UnitConversionUnitButton()
{
  uint64_t result = qword_100159160;
  if (!qword_100159160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000D75DC()
{
  sub_10003B690();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000D76A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D76C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t sub_1000D771C@<X0>(uint64_t a1@<X8>)
{
  id v2 = v1;
  uint64_t v67 = a1;
  uint64_t v3 = type metadata accessor for AttributeContainer();
  __chkstk_darwin(v3 - 8);
  uint64_t v66 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AttributedString();
  __chkstk_darwin(v5 - 8);
  uint64_t v65 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PlainButtonStyle();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v62 = v7;
  uint64_t v63 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UnitConversionUnitButton();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v57 = sub_100032FA0(&qword_1001591C0);
  uint64_t v61 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100032FA0(&qword_1001591C8);
  uint64_t v58 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100032FA0(&qword_1001591D0);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100032FA0(&qword_1001591D8);
  __chkstk_darwin(v56);
  uint64_t v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100032FA0(&qword_1001591E0);
  __chkstk_darwin(v68);
  uint64_t v55 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v59 = (char *)&v55 - v26;
  __chkstk_darwin(v27);
  uint64_t v64 = (char *)&v55 - v28;
  sub_1000D86F0((uint64_t)v2, (uint64_t)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v29 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v30 = swift_allocObject();
  sub_1000D8884((uint64_t)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29);
  uint64_t v70 = v2;
  sub_100032FA0(&qword_1001591E8);
  sub_1000D8954();
  Button.init(action:label:)();
  uint64_t v31 = v10;
  PlainButtonStyle.init()();
  sub_100040BE4(&qword_100159228, &qword_1001591C0);
  sub_1000D9160(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v32 = v57;
  uint64_t v33 = v62;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v31, v33);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v15, v32);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v58;
  uint64_t v36 = v60;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v21, v17, v60);
  uint64_t v37 = (uint64_t *)&v21[*(int *)(v19 + 44)];
  *uint64_t v37 = KeyPath;
  v37[1] = 0x3FB999999999999ALL;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v36);
  uint64_t v38 = swift_getKeyPath();
  sub_1000D8BE0((uint64_t)v21, (uint64_t)v23);
  uint64_t v39 = &v23[*(int *)(v56 + 36)];
  *(void *)uint64_t v39 = v38;
  *((void *)v39 + 1) = 2;
  v39[16] = 0;
  sub_100032F44((uint64_t)v21, &qword_1001591D0);
  sub_1000D8C48();
  uint64_t v40 = (uint64_t)v55;
  View.accessibilityIdentifier(_:)();
  sub_100032F44((uint64_t)v23, &qword_1001591D8);
  uint64_t v41 = v2[1];
  uint64_t v71 = *v2;
  uint64_t v72 = v41;
  sub_100023B24();
  uint64_t v42 = (uint64_t)v59;
  ModifiedContent<>.accessibilityLabel<A>(_:)();
  sub_100032F44(v40, &qword_1001591E0);
  uint64_t v43 = v2[1];
  uint64_t v71 = *v2;
  uint64_t v72 = v43;
  swift_bridgeObjectRetain();
  v44._countAndFlagsBits = 10272;
  v44._object = (void *)0xE200000000000000;
  String.append(_:)(v44);
  uint64_t v45 = v2[2];
  uint64_t v46 = (void *)v2[3];
  swift_bridgeObjectRetain();
  v47._countAndFlagsBits = v45;
  v47._object = v46;
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
  v48._countAndFlagsBits = 41;
  v48._object = (void *)0xE100000000000000;
  String.append(_:)(v48);
  uint64_t v49 = (uint64_t)v64;
  ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
  swift_bridgeObjectRelease();
  sub_100032F44(v42, &qword_1001591E0);
  LocalizedStringKey.init(stringLiteral:)();
  swift_bridgeObjectRetain();
  AttributeContainer.init()();
  AttributedString.init(_:attributes:)();
  uint64_t v69 = swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v71) = 1;
  sub_1000D8E50();
  AttributedString.subscript.setter();
  uint64_t v50 = Text.init(_:)();
  uint64_t v52 = v51;
  LOBYTE(v19) = v53 & 1;
  ModifiedContent<>.accessibilityCustomContent(_:_:importance:)();
  sub_1000356E0(v50, v52, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_100032F44(v49, &qword_1001591E0);
}

void *sub_1000D7F68@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  static VerticalAlignment.center.getter();
  sub_1000D8158(a1, (uint64_t)v7);
  *(_OWORD *)&v8[167] = v7[8];
  *(_OWORD *)&v8[183] = v7[9];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v8;
  *(_OWORD *)&v9[9] = *(_OWORD *)&v8[9];
  *(_OWORD *)&v8[103] = v7[4];
  *(_OWORD *)&v8[119] = v7[5];
  *(_OWORD *)&v8[135] = v7[6];
  *(_OWORD *)&v8[151] = v7[7];
  *(_OWORD *)&v8[39] = v7[0];
  *(_OWORD *)&v8[55] = v7[1];
  *(_OWORD *)&v8[71] = v7[2];
  char v10 = 1;
  *(_OWORD *)&v8[87] = v7[3];
  type metadata accessor for UnitConversionUnitButton();
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  char v12 = v5;
  char v11 = v6;
  static Alignment.leading.getter();
  sub_1000C37B8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_1000D8F44((uint64_t)v7);
  uint64_t result = memcpy(a2, __src, 0x178uLL);
  a2[376] = 0;
  return result;
}

uint64_t sub_1000D8158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = static HorizontalAlignment.leading.getter();
  sub_1000D8454((uint64_t)v39);
  uint64_t v6 = v39[0];
  uint64_t v5 = v39[1];
  char v7 = v40;
  uint64_t v8 = v43;
  uint64_t v34 = v42;
  char v9 = v44;
  uint64_t v37 = v41;
  uint64_t v38 = v45;
  if (*(unsigned char *)(a1 + 32) == 1)
  {
    uint64_t v30 = v4;
    if (qword_100154420 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_100160F38;
    uint64_t v11 = *(void *)(a1 + 88);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v33 = v10;
    swift_retain();
    uint64_t v36 = v11;
    swift_retain();
    uint64_t v35 = Font.bold()();
    uint64_t v12 = swift_getKeyPath();
    unsigned __int8 v13 = static Edge.Set.leading.getter();
    if (qword_100154398 != -1) {
      swift_once();
    }
    EdgeInsets.init(_all:)();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v22 = v13;
    uint64_t v23 = 1;
    uint64_t v24 = KeyPath;
    uint64_t v25 = v33;
    uint64_t v27 = v35;
    uint64_t v26 = v36;
    uint64_t v4 = v30;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    uint64_t v12 = 0;
    uint64_t v27 = 0;
    uint64_t v22 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  uint64_t v31 = v23;
  LOBYTE(v39[0]) = 0;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v6;
  *(void *)(a2 + 32) = v5;
  *(unsigned char *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v37;
  *(void *)(a2 + 56) = v34;
  *(void *)(a2 + 64) = v8;
  *(unsigned char *)(a2 + 72) = v9;
  *(void *)(a2 + 80) = v38;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = v23;
  *(void *)(a2 + 104) = v25;
  *(void *)(a2 + 112) = v24;
  *(void *)(a2 + 120) = v26;
  *(void *)(a2 + 128) = v12;
  *(void *)(a2 + 136) = v27;
  *(void *)(a2 + 144) = v22;
  *(void *)(a2 + 152) = v15;
  *(void *)(a2 + 160) = v17;
  *(void *)(a2 + 168) = v19;
  *(void *)(a2 + 176) = v21;
  *(unsigned char *)(a2 + 184) = 0;
  uint64_t v28 = v25;
  sub_1000637B4(v6, v5, v7);
  swift_bridgeObjectRetain();
  sub_1000637B4(v34, v8, v9);
  swift_bridgeObjectRetain();
  sub_1000D622C(0, v31, v28);
  sub_1000D9030(0, v31, v28);
  sub_1000356E0(v6, v5, v7);
  swift_bridgeObjectRelease();
  sub_1000356E0(v34, v8, v9);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D8454@<X0>(uint64_t a1@<X8>)
{
  sub_100023B24();
  swift_bridgeObjectRetain();
  uint64_t v1 = Text.init<A>(_:)();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  swift_retain();
  uint64_t v6 = Text.foregroundColor(_:)();
  uint64_t v8 = v7;
  char v10 = v9;
  swift_release();
  sub_1000356E0(v1, v3, v5);
  swift_bridgeObjectRelease();
  uint64_t v11 = Text.font(_:)();
  uint64_t v35 = v12;
  uint64_t v36 = v11;
  uint64_t v34 = v13;
  char v15 = v14;
  sub_1000356E0(v6, v8, v10 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v16 = Text.init<A>(_:)();
  uint64_t v18 = v17;
  char v20 = v19;
  swift_retain();
  char v33 = v15 & 1;
  uint64_t v21 = Text.foregroundColor(_:)();
  uint64_t v23 = v22;
  char v25 = v24;
  swift_release();
  sub_1000356E0(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  uint64_t v26 = Text.font(_:)();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  LOBYTE(v18) = v31 & 1;
  sub_1000356E0(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v36;
  *(void *)(a1 + 8) = v34;
  *(unsigned char *)(a1 + 16) = v33;
  *(void *)(a1 + 24) = v35;
  *(void *)(a1 + 32) = v26;
  *(void *)(a1 + 40) = v28;
  *(unsigned char *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v30;
  sub_1000637B4(v36, v34, v33);
  swift_bridgeObjectRetain();
  sub_1000637B4(v26, v28, v18);
  swift_bridgeObjectRetain();
  sub_1000356E0(v26, v28, v18);
  swift_bridgeObjectRelease();
  sub_1000356E0(v36, v34, v33);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D86F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnitConversionUnitButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D8754()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionUnitButton() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v2 + v1[16];
  uint64_t v4 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocObject();
}

uint64_t sub_1000D8884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnitConversionUnitButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D88E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for UnitConversionUnitButton() - 8);
  return (*(uint64_t (**)(void))(v0
                              + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                              + 40))();
}

void *sub_1000D894C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000D7F68(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000D8954()
{
  unint64_t result = qword_1001591F0;
  if (!qword_1001591F0)
  {
    sub_1000317D8(&qword_1001591E8);
    sub_1000D89F4();
    sub_100040BE4(&qword_100155380, &qword_100155388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001591F0);
  }
  return result;
}

unint64_t sub_1000D89F4()
{
  unint64_t result = qword_1001591F8;
  if (!qword_1001591F8)
  {
    sub_1000317D8(&qword_100159200);
    sub_1000D8A70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001591F8);
  }
  return result;
}

unint64_t sub_1000D8A70()
{
  unint64_t result = qword_100159208;
  if (!qword_100159208)
  {
    sub_1000317D8(&qword_100159210);
    sub_100040BE4(&qword_100159218, &qword_100159220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159208);
  }
  return result;
}

uint64_t sub_1000D8B18@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000D8B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000D8B80()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000D8BB0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000D8BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_1001591D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000D8C48()
{
  unint64_t result = qword_100159230;
  if (!qword_100159230)
  {
    sub_1000317D8(&qword_1001591D8);
    sub_1000D8CE8();
    sub_100040BE4(&qword_100156AF0, &qword_100156AF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159230);
  }
  return result;
}

unint64_t sub_1000D8CE8()
{
  unint64_t result = qword_100159238;
  if (!qword_100159238)
  {
    sub_1000317D8(&qword_1001591D0);
    sub_1000317D8(&qword_1001591C0);
    type metadata accessor for PlainButtonStyle();
    sub_100040BE4(&qword_100159228, &qword_1001591C0);
    sub_1000D9160(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100155730, &qword_100155738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159238);
  }
  return result;
}

void sub_1000D8E30()
{
}

unint64_t sub_1000D8E50()
{
  unint64_t result = qword_100159240;
  if (!qword_100159240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159240);
  }
  return result;
}

void sub_1000D8EA4()
{
}

uint64_t sub_1000D8ECC()
{
  return 8;
}

uint64_t sub_1000D8ED8()
{
  return swift_release();
}

uint64_t sub_1000D8EE0(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1000D8EF0()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

void *sub_1000D8F38(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000D8F44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 104);
  sub_1000356E0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_1000356E0(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1000D9030(v8, v7, v6);
  return a1;
}

uint64_t sub_1000D9030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1000D90B4()
{
  unint64_t result = qword_100159250;
  if (!qword_100159250)
  {
    sub_1000317D8(&qword_1001591E0);
    sub_1000D8C48();
    sub_1000D9160(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159250);
  }
  return result;
}

uint64_t sub_1000D9160(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000D91A8()
{
  sub_1000374C8();
  EnvironmentValues.subscript.getter();
  return v1;
}

ValueMetadata *type metadata accessor for KeypadButtonActionKey()
{
  return &type metadata for KeypadButtonActionKey;
}

uint64_t sub_1000D91F8(uint64_t a1)
{
  return sub_100005D4C(a1, qword_100161358);
}

unint64_t sub_1000D921C()
{
  unint64_t result = qword_100159268;
  if (!qword_100159268)
  {
    type metadata accessor for CGRect(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159268);
  }
  return result;
}

void destroy for HistoryExpressionViewHelp(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s10Calculator25HistoryExpressionViewHelpVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  char v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for HistoryExpressionViewHelp(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for HistoryExpressionViewHelp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for HistoryExpressionViewHelp(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HistoryExpressionViewHelp(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HistoryExpressionViewHelp()
{
  return &type metadata for HistoryExpressionViewHelp;
}

uint64_t sub_1000D9434()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D9450@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100032FA0(&qword_100159270);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v21 = a1;
    uint64_t v22 = a2;
    swift_bridgeObjectRetain();
    v12._countAndFlagsBits = 32;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    uint64_t v14 = v21;
    uint64_t v13 = v22;
    id v15 = [a3 displayName];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    uint64_t v21 = v14;
    uint64_t v22 = v13;
    swift_bridgeObjectRetain();
    v19._countAndFlagsBits = v16;
    v19._object = v18;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v21;
    a2 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  sub_100032FA0(&qword_100159278);
  sub_1000D9624();
  sub_100023B24();
  View.help<A>(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
}

uint64_t sub_1000D9618@<X0>(uint64_t a1@<X8>)
{
  return sub_1000D9450(*(void *)v1, *(void *)(v1 + 8), *(void **)(v1 + 16), a1);
}

unint64_t sub_1000D9624()
{
  unint64_t result = qword_100159280;
  if (!qword_100159280)
  {
    sub_1000317D8(&qword_100159278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159280);
  }
  return result;
}

uint64_t sub_1000D9680()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D96F0()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t sub_1000D9790()
{
  return swift_retain();
}

uint64_t sub_1000D9834()
{
  return swift_retain();
}

uint64_t sub_1000D98D8(char a1)
{
  sub_100034264();
  swift_retain();
  if (CalculateExpression.activeError.getter()
    || (swift_release(), sub_1000DD494(), swift_retain(), CalculateExpression.activeError.getter()))
  {
    swift_errorRelease();
    return swift_release();
  }
  else
  {
    swift_release();
    if ((a1 & 1) == 0)
    {
      sub_1000DD494();
      swift_retain();
      sub_100034264();
      swift_retain();
      CalculateExpression.expression.getter();
      swift_release();
      CalculateExpression.expression.setter();
      swift_release();
    }
    sub_100034264();
    swift_retain();
    CalculateExpression.inlineEvaluate()();
    swift_release();
    swift_getKeyPath();
    sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    uint64_t result = swift_release();
    if ((*(unsigned char *)(v1 + 41) & 1) == 0)
    {
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
      return swift_release();
    }
  }
  return result;
}

void sub_1000D9AE4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CalculateExpression.Base();
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v40 = v1;
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v1 + 40) == 1) {
    id v10 = sub_100071234();
  }
  else {
    id v10 = sub_100071418();
  }
  id v11 = v10;
  swift_getKeyPath();
  uint64_t v40 = v1;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v1 + 40) == 1) {
    id v12 = sub_100071418();
  }
  else {
    id v12 = sub_100071234();
  }
  id v13 = v12;
  swift_getKeyPath();
  uint64_t v40 = v1;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if ((*(unsigned char *)(v1 + 43) & 1) == 0)
  {
    swift_getKeyPath();
    uint64_t v40 = a1;
    sub_1000343C0(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    if ([*(id *)(a1 + 32) unitType] == (id)16)
    {
      type metadata accessor for StocksKitCurrencyCache();
      if (static StocksKitCurrencyCache.isEnabled.getter())
      {
        uint64_t v14 = (void *)static StocksKitCurrencyCache.shared.getter();
        char v15 = dispatch thunk of StocksKitCurrencyCache.needsRefresh.getter();

        uint64_t v16 = &unk_100159388;
        if ((v15 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      id v33 = [self shared];
      unsigned int v34 = [v33 needsRefresh];

      uint64_t v16 = &unk_100159380;
      if (v34) {
LABEL_11:
      }
        sub_1000DC21C((uint64_t)v16, 0, v2);
    }
  }
LABEL_12:
  sub_100034264();
  swift_retain();
  uint64_t v17 = (void *)CalculateExpression.result.getter();
  swift_release();

  if (!v17)
  {
    sub_1000DD494();
    swift_retain();
    sub_100034264();
    swift_retain();
    CalculateExpression.inlineEvaluate(_:)();
    swift_release();
    swift_release();
    swift_getKeyPath();
    uint64_t v40 = v2;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    if ((*(unsigned char *)(v2 + 42) & 1) == 0)
    {
LABEL_25:

      return;
    }
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    v35[-2] = v2;
    LOBYTE(v35[-1]) = 0;
    uint64_t v40 = v2;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

LABEL_20:
    swift_release();
    return;
  }
  v35[1] = v6;
  sub_100034264();
  swift_retain();
  uint64_t v18 = CalculateExpression.expression.getter();
  unint64_t v20 = v19;
  swift_release();
  id v21 = v11;
  id v22 = v13;
  uint64_t v23 = v11;
  id v24 = v22;
  char v25 = (void *)sub_1000DBCE8(v18, v20, 1, v23, v13);
  swift_bridgeObjectRelease();
  id v37 = v21;

  id v36 = v24;
  if (v25)
  {
    id v26 = v25;
    sub_1000DD494();
    type metadata accessor for CalculateExpression();
    v35[0] = v26;
    swift_retain();
    sub_1000DD494();
    swift_retain();
    CalculateExpression.options.getter();
    swift_release();
    (*(void (**)(char *, void, uint64_t))(v38 + 104))(v9, enum case for CalculateExpression.Base.base10(_:), v39);
    UUID.init()();
    CalculateExpression.__allocating_init(result:error:options:base:id:)();
    CalculateExpression.inlineEvaluate(_:)();
    swift_release();
    swift_release();
    sub_100034264();
    swift_retain();
    uint64_t v27 = (void *)CalculateExpression.result.getter();
    swift_release();
    if (v27)
    {
      unsigned int v28 = [v27 isPartialExpression];
    }
    else
    {
      unsigned int v28 = 0;
    }
    id v13 = v36;
    id v11 = v37;
    char v31 = (void *)v35[0];
    swift_getKeyPath();
    uint64_t v40 = v2;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    if (v28 != *(unsigned __int8 *)(v2 + 42))
    {
      uint64_t v32 = swift_getKeyPath();
      __chkstk_darwin(v32);
      v35[-2] = v2;
      LOBYTE(v35[-1]) = v28;
      uint64_t v40 = v2;
      ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

      swift_release();
      return;
    }

    goto LABEL_25;
  }
  sub_1000DD494();
  swift_retain();
  sub_100034264();
  swift_retain();
  CalculateExpression.inlineEvaluate(_:)();
  swift_release();
  swift_release();
  swift_getKeyPath();
  uint64_t v40 = v2;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v2 + 42))
  {
    uint64_t v30 = swift_getKeyPath();
    __chkstk_darwin(v30);
    v35[-2] = v2;
    LOBYTE(v35[-1]) = 0;
    uint64_t v40 = v2;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    goto LABEL_20;
  }
}

uint64_t sub_1000DA2B0()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

void sub_1000DA350(unsigned __int8 a1, char a2)
{
  if (a2)
  {
    if (a1 == 52)
    {
      sub_100034264();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      sub_1000DD494();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      swift_getKeyPath();
      uint64_t v18 = v2;
      sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v2 + 41) == 1)
      {
LABEL_7:
        uint64_t KeyPath = swift_getKeyPath();
        __chkstk_darwin(KeyPath);
        uint64_t v18 = v2;
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
LABEL_8:
        swift_release();
      }
LABEL_9:
      swift_getKeyPath();
      uint64_t v18 = v2;
      sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v2 + 41) == 1)
      {
        if (a1 > 0x2Eu
          || ((1 << a1) & 0x40000B800000) == 0
          && (a1 != 26
           || (swift_getKeyPath(),
               uint64_t v18 = v2,
               ObservationRegistrar.access<A, B>(_:keyPath:)(),
               swift_release(),
               *(void *)(v2 + 48))))
        {
          swift_getKeyPath();
          uint64_t v18 = v2;
          ObservationRegistrar.access<A, B>(_:keyPath:)();
          swift_release();
          if (*(unsigned char *)(v2 + 41) == 1)
          {
            uint64_t v5 = swift_getKeyPath();
            __chkstk_darwin(v5);
            uint64_t v18 = v2;
            ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
            swift_release();
          }
        }
      }
      return;
    }
  }
  else
  {
    if (a1 == 1)
    {
      sub_100034264();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      sub_1000DD494();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      swift_getKeyPath();
      uint64_t v18 = v2;
      sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v2 + 41) == 1) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    if ((a1 - 23) <= 3u)
    {
      switch(a1)
      {
        case 0x17u:
          uint64_t v6 = swift_getKeyPath();
          __chkstk_darwin(v6);
          uint64_t v18 = v2;
          sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
          ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
          goto LABEL_8;
        case 0x18u:
          sub_100034264();
          swift_retain();
          CalculateExpression.inlineEvaluate()();
          swift_release();
          sub_1000DB540();
          break;
        case 0x19u:
          sub_100034264();
          swift_retain();
          CalculateExpression.inlineEvaluate()();
          swift_release();
          sub_1000DB914();
          break;
        case 0x1Au:
          swift_getKeyPath();
          uint64_t v18 = v2;
          sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
          ObservationRegistrar.access<A, B>(_:keyPath:)();
          swift_release();
          char v15 = *(void **)(v2 + 48);
          if (v15)
          {
            id v16 = v15;
            sub_100034264();
            type metadata accessor for CalculateExpression.CustomOperandOperation();
            id v17 = v16;
            swift_retain();
            CalculateExpression.CustomOperandOperation.__allocating_init(_:)();
            CalculateExpression.update(_:)();

            swift_release();
            swift_release();
          }
          break;
        default:
          goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (sub_100033B98(a1))
    {
      sub_100034264();
      swift_retain();
      char v7 = CalculateExpression.update(_:)();
      swift_release();
      swift_release();
      if (v7) {
        goto LABEL_9;
      }
    }
    else
    {
      if (qword_100154750 != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      sub_100021598(v8, (uint64_t)qword_100161340);
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)id v11 = 136315138;
        uint64_t v12 = sub_10007E200(a1);
        sub_10000DAA8(v12, v13, &v18);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error Unrecognized calculator button pressed: %s", v11, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
    }
  }
  id v14 = [self defaultCenter];
  if (qword_100154500 != -1) {
    swift_once();
  }
  [v14 postNotificationName:qword_100161108 object:0];
}

uint64_t sub_1000DABA8(uint64_t result, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = result & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    uint64_t v4 = result;
    swift_getKeyPath();
    sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_retain();
    uint64_t v5 = CalculateExpression.expression.getter();
    uint64_t v7 = v6;
    swift_release();
    if (v5 == v4 && v7 == a2)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {
        swift_getKeyPath();
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        swift_retain();
        swift_bridgeObjectRetain();
        CalculateExpression.expression.setter();
        return swift_release();
      }
    }
  }
  return result;
}

void *sub_1000DAD38()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

uint64_t sub_1000DADE0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  *a2 = *(void *)(v3 + 24);
  return swift_retain();
}

uint64_t sub_1000DAE8C()
{
  return swift_release();
}

uint64_t sub_1000DAF6C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  *a2 = *(void *)(v3 + 32);
  return swift_retain();
}

uint64_t sub_1000DB018()
{
  return swift_release();
}

uint64_t sub_1000DB0F8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

uint64_t sub_1000DB100(uint64_t result, char a2)
{
  *(unsigned char *)(result + 41) = a2;
  return result;
}

uint64_t sub_1000DB108()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t sub_1000DB1A8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 42);
  return result;
}

uint64_t sub_1000DB250()
{
  return swift_release();
}

uint64_t sub_1000DB320(uint64_t result, char a2)
{
  *(unsigned char *)(result + 42) = a2;
  return result;
}

uint64_t sub_1000DB328()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 43);
}

uint64_t sub_1000DB3C8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 43);
  return result;
}

uint64_t sub_1000DB470()
{
  return swift_release();
}

void sub_1000DB540()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (!*(void *)(v0 + 48))
  {
    sub_1000DD044((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v1 = (void *)evaluate(_:options:)();
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
  }
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 48);
  if (v3)
  {
    id v4 = v3;
    sub_100034264();
    swift_retain();
    uint64_t v5 = CalculateExpression.activeError.getter();
    swift_release();
    swift_errorRelease();
    if (!v5)
    {
      sub_100034264();
      swift_retain();
      uint64_t v7 = (void *)CalculateExpression.result.getter();
      swift_release();
      if (v7)
      {
        sub_100032FA0(&qword_1001564E8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10010DCB0;
        uint64_t v9 = (void *)CalculateKeyVariables;
        *(void *)(inited + 32) = CalculateKeyVariables;
        sub_100032FA0(&qword_1001593B8);
        uint64_t v10 = swift_initStackObject();
        *(_OWORD *)(v10 + 16) = xmmword_100110A40;
        *(void *)(v10 + 32) = 120;
        *(void *)(v10 + 40) = 0xE100000000000000;
        *(void *)(v10 + 48) = v4;
        *(void *)(v10 + 56) = 121;
        *(void *)(v10 + 64) = 0xE100000000000000;
        *(void *)(v10 + 72) = v7;
        id v11 = v4;
        id v12 = v9;
        id v13 = v7;
        unint64_t v14 = sub_100070B54(v10);
        *(void *)(inited + 64) = sub_100032FA0(&qword_1001593C0);
        *(void *)(inited + 40) = v14;
        sub_10001D214(inited);
        char v15 = (void *)evaluate(_:options:)();
        swift_bridgeObjectRelease();
        uint64_t v16 = swift_getKeyPath();
        __chkstk_darwin(v16);
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

        swift_release();
        return;
      }
    }
  }
  uint64_t v6 = swift_getKeyPath();
  __chkstk_darwin(v6);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

void sub_1000DB914()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (!*(void *)(v0 + 48))
  {
    sub_1000DD044((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v1 = (void *)evaluate(_:options:)();
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
  }
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 48);
  if (v3)
  {
    id v4 = v3;
    sub_100034264();
    swift_retain();
    uint64_t v5 = CalculateExpression.activeError.getter();
    swift_release();
    swift_errorRelease();
    if (!v5)
    {
      sub_100034264();
      swift_retain();
      uint64_t v7 = (void *)CalculateExpression.result.getter();
      swift_release();
      if (v7)
      {
        sub_100032FA0(&qword_1001564E8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10010DCB0;
        uint64_t v9 = (void *)CalculateKeyVariables;
        *(void *)(inited + 32) = CalculateKeyVariables;
        sub_100032FA0(&qword_1001593B8);
        uint64_t v10 = swift_initStackObject();
        *(_OWORD *)(v10 + 16) = xmmword_100110A40;
        *(void *)(v10 + 32) = 120;
        *(void *)(v10 + 40) = 0xE100000000000000;
        *(void *)(v10 + 48) = v4;
        *(void *)(v10 + 56) = 121;
        *(void *)(v10 + 64) = 0xE100000000000000;
        *(void *)(v10 + 72) = v7;
        id v11 = v4;
        id v12 = v9;
        id v13 = v7;
        unint64_t v14 = sub_100070B54(v10);
        *(void *)(inited + 64) = sub_100032FA0(&qword_1001593C0);
        *(void *)(inited + 40) = v14;
        sub_10001D214(inited);
        char v15 = (void *)evaluate(_:options:)();
        swift_bridgeObjectRelease();
        uint64_t v16 = swift_getKeyPath();
        __chkstk_darwin(v16);
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

        swift_release();
        return;
      }
    }
  }
  uint64_t v6 = swift_getKeyPath();
  __chkstk_darwin(v6);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

uint64_t sub_1000DBCE8(uint64_t a1, unint64_t a2, char a3, void *a4, void *a5)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    swift_getKeyPath();
    sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_retain();
    CalculateExpression.options.getter();
    swift_release();
    if ((a3 & 1) != 0 && a4 && a5)
    {
      id v9 = a4;
      id v10 = a5;
      uint64_t v11 = sub_1000DD7EC();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = evaluate(_:options:)();
      swift_bridgeObjectRelease();
    }
    return v11;
  }
  else
  {
    sub_1000DD044((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v12 = evaluate(_:options:)();
    swift_bridgeObjectRelease();
    return v12;
  }
}

uint64_t sub_1000DBE7C()
{
  swift_release();
  swift_release();
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC10Calculator27CalculatorExpressionManager___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1000DBF3C()
{
  return type metadata accessor for CalculatorExpressionManager();
}

uint64_t sub_1000DBF5C()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    sub_100034264();
    swift_retain();
    CalculateExpression.expression.getter();
    swift_release();
    sub_100034264();
    swift_retain();
    sub_1000DD494();
    swift_retain();
    CalculateExpression.expression.getter();
    swift_release();
    CalculateExpression.expression.setter();
    swift_release();
    sub_1000DD494();
  }
  else
  {
    sub_1000DD494();
    swift_retain();
    CalculateExpression.expression.getter();
    swift_release();
    sub_1000DD494();
    swift_retain();
    sub_100034264();
    swift_retain();
    CalculateExpression.expression.getter();
    swift_release();
    CalculateExpression.expression.setter();
    swift_release();
    sub_100034264();
  }
  swift_retain();
  CalculateExpression.expression.setter();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v1 = *(unsigned __int8 *)(v0 + 40);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  if (v1 == *(unsigned __int8 *)(v0 + 40))
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000DC21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100032FA0(&qword_100154B68);
  __chkstk_darwin(v6 - 8);
  char v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  uint64_t v17 = a3;
  char v18 = 1;
  uint64_t v19 = a3;
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  if (qword_100154750 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100021598(v9, (uint64_t)qword_100161340);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Updating currency", v12, 2u);
    swift_slowDealloc();
  }

  static TaskPriority.background.getter();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 0, 1, v13);
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  void v14[4] = a1;
  v14[5] = a2;
  v14[6] = a3;
  swift_retain();
  swift_retain();
  sub_10004F600((uint64_t)v8, (uint64_t)&unk_100159398, (uint64_t)v14);
  swift_release();
  return sub_1000138BC((uint64_t)v8);
}

uint64_t sub_1000DC4A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a6;
  sub_100032FA0(&qword_100154B68);
  v6[3] = swift_task_alloc();
  id v10 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v8 = (void *)swift_task_alloc();
  v6[4] = v8;
  *char v8 = v6;
  v8[1] = sub_1000DC5B0;
  return v10();
}

uint64_t sub_1000DC5B0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000DC6B0, 0, 0);
}

uint64_t sub_1000DC6B0()
{
  char v1 = *(unsigned char *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v4 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v5 = static MainActor.shared.getter();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = &protocol witness table for MainActor;
  *(unsigned char *)(v6 + 32) = v1;
  *(void *)(v6 + 40) = v3;
  sub_100013710(v2, (uint64_t)&unk_1001593A8, v6);
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000DC7C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a5;
  *(unsigned char *)(v5 + 40) = a4;
  type metadata accessor for MainActor();
  *(void *)(v5 + 32) = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000DC864, v7, v6);
}

uint64_t sub_1000DC864()
{
  int v1 = *(unsigned __int8 *)(v0 + 40);
  swift_release();
  if (v1 == 1)
  {
    if (qword_100154750 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100021598(v2, (uint64_t)qword_100161340);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "Updated currency";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v3, v4, v6, v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100154750 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100021598(v7, (uint64_t)qword_100161340);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "Failed to update currency";
      goto LABEL_10;
    }
  }
  uint64_t v8 = *(void *)(v0 + 24);
  int v9 = *(unsigned __int8 *)(v0 + 40);

  swift_getKeyPath();
  uint64_t v10 = swift_task_alloc();
  *(void *)(v10 + 16) = v8;
  *(unsigned char *)(v10 + 24) = 0;
  *(void *)(v0 + 16) = v8;
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  if (v9 != 1) {
    goto LABEL_21;
  }
  if (qword_1001541A8 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100160C98;
  type metadata accessor for StocksKitCurrencyCache();
  if (static StocksKitCurrencyCache.isEnabled.getter())
  {
    if (dispatch thunk of StocksKitCurrencyCache.needsRefresh.getter()) {
      goto LABEL_21;
    }
  }
  else if ([*(id *)(v11 + 16) needsRefresh])
  {
    goto LABEL_21;
  }
  id v12 = [self defaultCenter];
  if (qword_100154508 != -1) {
    swift_once();
  }
  [v12 postNotificationName:qword_100161110 object:0];

LABEL_21:
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_1000DCBCC()
{
  return _swift_task_switch(sub_1000DCBE8, 0, 0);
}

uint64_t sub_1000DCBE8()
{
  type metadata accessor for StocksKitCurrencyCache();
  *(void *)(v0 + 16) = static StocksKitCurrencyCache.shared.getter();
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of StocksKitCurrencyCache.refresh()
                         + async function pointer to dispatch thunk of StocksKitCurrencyCache.refresh());
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_1000DCCA0;
  return v3();
}

uint64_t sub_1000DCCA0(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(a1);
}

uint64_t sub_1000DCDB4()
{
  return _swift_task_switch(sub_1000DCDD0, 0, 0);
}

uint64_t sub_1000DCDD0()
{
  id v1 = [self shared];
  id v2 = [v1 refreshIfNeeded];

  uint64_t v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

id sub_1000DCE64@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000343C0((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 48);
  *a2 = v4;

  return v4;
}

void sub_1000DCF1C(void **a1)
{
  id v1 = *a1;
  swift_getKeyPath();
  sub_1000343C0((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

uint64_t sub_1000DCFF8(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  *id v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000DD008(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unint64_t sub_1000DD044(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100032FA0(&qword_100156090);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_1000DDA0C(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1000DD160(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10001CFF8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_1000DD160(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_1000DD1F4(a1, v2);
}

unint64_t sub_1000DD1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9) {
      goto LABEL_22;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      return v5;
    }
    uint64_t v12 = ~v4;
    unint64_t v5 = (v5 + 1) & v12;
    if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      return v5;
    }
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;
    if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v21 = v20;
          if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22) {
            break;
          }
          char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_22;
      }
    }
  }
  return v5;
}

uint64_t sub_1000DD3E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000DD40C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000DAA8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

unsigned char **sub_1000DD484(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_1000DD494()
{
  swift_getKeyPath();
  sub_1000343C0(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v1 = v0 + 32;
  }
  else
  {
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v1 = v0 + 24;
  }
  return *(void *)v1;
}

void sub_1000DD5B0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 42) = *(unsigned char *)(v0 + 24);
}

void sub_1000DD5C0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 43) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_1000DD5D0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000DD618(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10004BC10;
  return sub_1000DC4A8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000DD6E0()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000DD720(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10003819C;
  return sub_1000DC7C8(a1, v4, v5, v6, v7);
}

uint64_t sub_1000DD7EC()
{
  uint64_t v0 = (void *)evaluateError(_:options:)();
  [v0 setSynchronous:0];
  uint64_t v1 = CalculateResult.converted(to:from:)();

  return v1;
}

uint64_t sub_1000DDA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_100156098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000DDA7C()
{
  *(void *)(*(void *)(v0 + 16) + 32) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

void sub_1000DDAC0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 41) = *(unsigned char *)(v0 + 24);
}

void sub_1000DDAE0()
{
}

void sub_1000DDAF8()
{
}

void sub_1000DDB10()
{
}

uint64_t *sub_1000DDB28(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100032FA0(&qword_1001590B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_100032FA0(&qword_100154A48);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = sub_100032FA0(&qword_100154A48);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[6];
    char v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    sub_100032FA0(&qword_1001590B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *char v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[7];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_100032FA0(&qword_1001593C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    uint64_t v25 = sub_100032FA0(&qword_1001593D0);
    *(void *)&v22[*(int *)(v25 + 28)] = *(void *)&v23[*(int *)(v25 + 28)];
    uint64_t v26 = a3[8];
    uint64_t v27 = a3[9];
    unsigned int v28 = (char *)a1 + v26;
    uint64_t v29 = (char *)a2 + v26;
    *unsigned int v28 = *v29;
    *((void *)v28 + 1) = *((void *)v29 + 1);
    uint64_t v30 = (char *)a1 + v27;
    char v31 = (char *)a2 + v27;
    swift_retain();
    swift_retain();
    uint64_t v32 = sub_100032FA0(&qword_1001593D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    uint64_t v33 = sub_100032FA0(&qword_1001593E0);
    *(void *)&v30[*(int *)(v33 + 28)] = *(void *)&v31[*(int *)(v33 + 28)];
    uint64_t v34 = a3[10];
    uint64_t v35 = (char *)a1 + v34;
    id v36 = (char *)a2 + v34;
    swift_retain();
    uint64_t v37 = sub_100032FA0(&qword_1001593E8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    uint64_t v38 = sub_100032FA0(&qword_1001593F0);
    *(void *)&v35[*(int *)(v38 + 28)] = *(void *)&v36[*(int *)(v38 + 28)];
  }
  swift_retain();
  return a1;
}

void *sub_1000DE004(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F44((uint64_t)a1, &qword_1001590B8);
    sub_100032FA0(&qword_1001590B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = sub_100032FA0(&qword_100154A48);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_100032F44((uint64_t)a1 + v9, &qword_1001590B8);
    sub_100032FA0(&qword_1001590B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = sub_100032FA0(&qword_100154A48);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    sub_100032F44((uint64_t)a1 + v15, &qword_1001590B0);
    sub_100032FA0(&qword_1001590B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = type metadata accessor for LayoutDirection();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = a3[7];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_100032FA0(&qword_1001593C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = sub_100032FA0(&qword_1001593D0);
  *(void *)&v20[*(int *)(v23 + 28)] = *(void *)&v21[*(int *)(v23 + 28)];
  swift_retain();
  swift_release();
  uint64_t v24 = a3[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_retain();
  swift_release();
  uint64_t v27 = a3[9];
  unsigned int v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = sub_100032FA0(&qword_1001593D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  uint64_t v31 = sub_100032FA0(&qword_1001593E0);
  *(void *)&v28[*(int *)(v31 + 28)] = *(void *)&v29[*(int *)(v31 + 28)];
  swift_retain();
  swift_release();
  uint64_t v32 = a3[10];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = sub_100032FA0(&qword_1001593E8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 24))(v33, v34, v35);
  uint64_t v36 = sub_100032FA0(&qword_1001593F0);
  *(void *)&v33[*(int *)(v36 + 28)] = *(void *)&v34[*(int *)(v36 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000DE50C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100032FA0(&qword_1001590B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100032FA0(&qword_100154A48);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = sub_100032FA0(&qword_100154A48);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_100032FA0(&qword_1001590B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = type metadata accessor for LayoutDirection();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_100032FA0(&qword_1001593C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  uint64_t v25 = sub_100032FA0(&qword_1001593D0);
  *(void *)&v22[*(int *)(v25 + 28)] = *(void *)&v23[*(int *)(v25 + 28)];
  uint64_t v26 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  uint64_t v27 = &a1[v26];
  unsigned int v28 = &a2[v26];
  uint64_t v29 = sub_100032FA0(&qword_1001593D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
  uint64_t v30 = sub_100032FA0(&qword_1001593E0);
  *(void *)&v27[*(int *)(v30 + 28)] = *(void *)&v28[*(int *)(v30 + 28)];
  uint64_t v31 = a3[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v34 = sub_100032FA0(&qword_1001593E8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  uint64_t v35 = sub_100032FA0(&qword_1001593F0);
  *(void *)&v32[*(int *)(v35 + 28)] = *(void *)&v33[*(int *)(v35 + 28)];
  return a1;
}

char *sub_1000DE994(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F44((uint64_t)a1, &qword_1001590B8);
    uint64_t v6 = sub_100032FA0(&qword_1001590B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_100032FA0(&qword_100154A48);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v10 = a3[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    sub_100032F44((uint64_t)&a1[v10], &qword_1001590B8);
    uint64_t v13 = sub_100032FA0(&qword_1001590B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
      {
        uint64_t v16 = sub_100032FA0(&qword_100154A48);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v11, v12, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v17 = a3[6];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    sub_100032F44((uint64_t)&a1[v17], &qword_1001590B0);
    uint64_t v20 = sub_100032FA0(&qword_1001590B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = type metadata accessor for LayoutDirection();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
  }
  uint64_t v22 = a3[7];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = sub_100032FA0(&qword_1001593C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = sub_100032FA0(&qword_1001593D0);
  *(void *)&v23[*(int *)(v26 + 28)] = *(void *)&v24[*(int *)(v26 + 28)];
  swift_release();
  uint64_t v27 = a3[8];
  unsigned int v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *unsigned int v28 = *v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  uint64_t v30 = a3[9];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v33 = sub_100032FA0(&qword_1001593D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 40))(v31, v32, v33);
  uint64_t v34 = sub_100032FA0(&qword_1001593E0);
  *(void *)&v31[*(int *)(v34 + 28)] = *(void *)&v32[*(int *)(v34 + 28)];
  swift_release();
  uint64_t v35 = a3[10];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  uint64_t v38 = sub_100032FA0(&qword_1001593E8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 40))(v36, v37, v38);
  uint64_t v39 = sub_100032FA0(&qword_1001593F0);
  *(void *)&v36[*(int *)(v39 + 28)] = *(void *)&v37[*(int *)(v39 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_1000DEE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DEEA8);
}

uint64_t sub_1000DEEA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032FA0(&qword_1001593F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_16:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100032FA0(&qword_100159400);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_15:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_16;
  }
  uint64_t v14 = sub_100032FA0(&qword_1001593D0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_15;
  }
  if (a2 == 2147483646)
  {
    unint64_t v15 = *(void *)(a1 + a3[8] + 8);
    if (v15 >= 0xFFFFFFFF) {
      LODWORD(v15) = -1;
    }
    int v16 = v15 - 1;
    if (v16 < 0) {
      int v16 = -1;
    }
    return (v16 + 1);
  }
  else
  {
    uint64_t v18 = sub_100032FA0(&qword_1001593E0);
    if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a2)
    {
      uint64_t v8 = v18;
      uint64_t v12 = *(void *)(v18 - 8);
      uint64_t v13 = a3[9];
      goto LABEL_15;
    }
    uint64_t v19 = sub_100032FA0(&qword_1001593F0);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
    uint64_t v21 = v19;
    uint64_t v22 = a1 + a3[10];
    return v20(v22, a2, v21);
  }
}

uint64_t sub_1000DF0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DF0F8);
}

uint64_t sub_1000DF0F8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100032FA0(&qword_1001593F8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_12:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100032FA0(&qword_100159400);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_11:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_12;
  }
  uint64_t result = sub_100032FA0(&qword_1001593D0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[7];
    goto LABEL_11;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[8] + 8) = a2;
    return result;
  }
  uint64_t v17 = sub_100032FA0(&qword_1001593E0);
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[9];
    goto LABEL_11;
  }
  uint64_t v18 = sub_100032FA0(&qword_1001593F0);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[10];

  return v19(v21, a2, a2, v20);
}

uint64_t sub_1000DF328@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100033224((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__layoutDirection;
  swift_beginAccess();
  uint64_t v5 = type metadata accessor for LayoutDirection();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1000DF424(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for LayoutDirection();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a1, v4, v6);
  uint64_t v9 = *a2;
  swift_getKeyPath();
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  sub_100033224((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_1000DF5AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a2;
  uint64_t v4 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = &v36[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v38 = &v36[-v8];
  uint64_t v9 = sub_100032FA0(&qword_100159530);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v36[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_100032FA0(&qword_100154A48);
  __chkstk_darwin(v13 - 8);
  uint64_t v42 = &v36[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v17 = &v36[-v16];
  __chkstk_darwin(v18);
  uint64_t v20 = &v36[-v19];
  uint64_t v21 = a3 + *(int *)(type metadata accessor for CalculatorAppContentView() + 28);
  uint64_t v39 = sub_100032FA0(&qword_1001593D0);
  uint64_t v40 = v21;
  LazyState.wrappedValue.getter();
  uint64_t v22 = v46;
  swift_getKeyPath();
  uint64_t v46 = v22;
  uint64_t v41 = sub_100033224((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t v23 = v44;
  swift_release();
  uint64_t v24 = v22 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__horizontalSizeClass;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v20, v24, v4);
  swift_release();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v20, 0, 1, v4);
  uint64_t v25 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_100033344((uint64_t)v20, (uint64_t)v12, &qword_100154A48);
  sub_100033344(v23, v25, &qword_100154A48);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v26((uint64_t)v12, 1, v4) == 1)
  {
    sub_100032F44((uint64_t)v20, &qword_100154A48);
    if (v26(v25, 1, v4) == 1) {
      return sub_100032F44((uint64_t)v12, &qword_100154A48);
    }
  }
  else
  {
    unsigned int v28 = v17;
    sub_100033344((uint64_t)v12, (uint64_t)v17, &qword_100154A48);
    if (v26(v25, 1, v4) != 1)
    {
      uint64_t v29 = v38;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v38, v25, v4);
      sub_100033224(&qword_100159520, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      int v37 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v30 = v28;
      uint64_t v31 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
      v31(v29, v4);
      sub_100032F44((uint64_t)v20, &qword_100154A48);
      v31(v30, v4);
      uint64_t v23 = v44;
      uint64_t result = sub_100032F44((uint64_t)v12, &qword_100154A48);
      if (v37) {
        return result;
      }
      goto LABEL_8;
    }
    sub_100032F44((uint64_t)v20, &qword_100154A48);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v17, v4);
  }
  sub_100032F44((uint64_t)v12, &qword_100159530);
LABEL_8:
  LazyState.wrappedValue.getter();
  uint64_t v32 = v45;
  uint64_t v33 = v42;
  sub_100033344(v23, (uint64_t)v42, &qword_100154A48);
  if (v26((uint64_t)v33, 1, v4) == 1)
  {
    uint64_t v34 = v43;
    (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v43, enum case for UserInterfaceSizeClass.regular(_:), v4);
    sub_100032F44((uint64_t)v33, &qword_100154A48);
  }
  else
  {
    uint64_t v34 = v43;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v43, v33, v4);
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(void *)&v36[-16] = v32;
  *(void *)&v36[-8] = v34;
  uint64_t v45 = v32;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v34, v4);
  return swift_release();
}

uint64_t sub_1000DFBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a2;
  uint64_t v4 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = &v36[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v38 = &v36[-v8];
  uint64_t v9 = sub_100032FA0(&qword_100159530);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v36[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_100032FA0(&qword_100154A48);
  __chkstk_darwin(v13 - 8);
  uint64_t v42 = &v36[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v17 = &v36[-v16];
  __chkstk_darwin(v18);
  uint64_t v20 = &v36[-v19];
  uint64_t v21 = a3 + *(int *)(type metadata accessor for CalculatorAppContentView() + 28);
  uint64_t v39 = sub_100032FA0(&qword_1001593D0);
  uint64_t v40 = v21;
  LazyState.wrappedValue.getter();
  uint64_t v22 = v46;
  swift_getKeyPath();
  uint64_t v46 = v22;
  uint64_t v41 = sub_100033224((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t v23 = v44;
  swift_release();
  uint64_t v24 = v22 + OBJC_IVAR____TtC10Calculator16CalculatorLayout__verticalSizeClass;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v20, v24, v4);
  swift_release();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v20, 0, 1, v4);
  uint64_t v25 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_100033344((uint64_t)v20, (uint64_t)v12, &qword_100154A48);
  sub_100033344(v23, v25, &qword_100154A48);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v26((uint64_t)v12, 1, v4) == 1)
  {
    sub_100032F44((uint64_t)v20, &qword_100154A48);
    if (v26(v25, 1, v4) == 1) {
      return sub_100032F44((uint64_t)v12, &qword_100154A48);
    }
  }
  else
  {
    unsigned int v28 = v17;
    sub_100033344((uint64_t)v12, (uint64_t)v17, &qword_100154A48);
    if (v26(v25, 1, v4) != 1)
    {
      uint64_t v29 = v38;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v38, v25, v4);
      sub_100033224(&qword_100159520, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      int v37 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v30 = v28;
      uint64_t v31 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
      v31(v29, v4);
      sub_100032F44((uint64_t)v20, &qword_100154A48);
      v31(v30, v4);
      uint64_t v23 = v44;
      uint64_t result = sub_100032F44((uint64_t)v12, &qword_100154A48);
      if (v37) {
        return result;
      }
      goto LABEL_8;
    }
    sub_100032F44((uint64_t)v20, &qword_100154A48);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v17, v4);
  }
  sub_100032F44((uint64_t)v12, &qword_100159530);
LABEL_8:
  LazyState.wrappedValue.getter();
  uint64_t v32 = v45;
  uint64_t v33 = v42;
  sub_100033344(v23, (uint64_t)v42, &qword_100154A48);
  if (v26((uint64_t)v33, 1, v4) == 1)
  {
    uint64_t v34 = v43;
    (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v43, enum case for UserInterfaceSizeClass.regular(_:), v4);
    sub_100032F44((uint64_t)v33, &qword_100154A48);
  }
  else
  {
    uint64_t v34 = v43;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v43, v33, v4);
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(void *)&v36[-16] = v32;
  *(void *)&v36[-8] = v34;
  uint64_t v45 = v32;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v34, v4);
  return swift_release();
}

unsigned char *sub_1000E01C4(unsigned char *result)
{
  if (*result)
  {
    type metadata accessor for CalculatorAppContentView();
    sub_100032FA0(&qword_1001593E0);
    LazyState.wrappedValue.setter();
    LazyState.wrappedValue.getter();
    sub_100032FA0(&qword_1001593F0);
    return (unsigned char *)LazyState.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000E026C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E0298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000E02C4()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_1000E02F0()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_1000E0320(uint64_t a1, uint64_t a2)
{
  return sub_1000E0354(a1, a2, sub_1000DF5AC);
}

uint64_t sub_1000E033C(uint64_t a1, uint64_t a2)
{
  return sub_1000E0354(a1, a2, sub_1000DFBB8);
}

uint64_t sub_1000E0354(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for CalculatorAppContentView() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return a3(a1, a2, v7);
}

unsigned char *sub_1000E03F0(unsigned char *a1)
{
  type metadata accessor for CalculatorAppContentView();

  return sub_1000E01C4(a1);
}

uint64_t sub_1000E0478()
{
  return sub_100040D10(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000E0498()
{
  return sub_1000E0478();
}

uint64_t sub_1000E04B0()
{
  return sub_10003C904();
}

uint64_t sub_1000E04C8()
{
  return sub_10003C898();
}

__n128 initializeWithTake for DelayEffectModifier(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DelayEffectModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayEffectModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayEffectModifier(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1000E060C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_1000E07F0;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 120);
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v5 = sub_1000E0734;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000E0734()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_release();
  *(void *)(swift_task_alloc() + 16) = v1;
  withAnimation<A>(_:_:)();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000E07F0()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_release();
  *(void *)(swift_task_alloc() + 16) = v1;
  withAnimation<A>(_:_:)();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000E08A4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000E08FC()
{
  return State.wrappedValue.setter();
}

void sub_1000E095C(uint64_t a1)
{
}

void sub_1000E0970(uint64_t a1)
{
}

void sub_1000E0984(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  NSString v5 = String._bridgeToObjectiveC()();
  [v4 setDateFormat:v5];

  *a3 = v4;
}

id sub_1000E09F8(uint64_t a1)
{
  return sub_1000E0A38(a1, (Class *)NSDateFormatter_ptr, (SEL *)&selRef_setDateStyle_, 1, &qword_100161388);
}

id sub_1000E0A18(uint64_t a1)
{
  return sub_1000E0A38(a1, (Class *)NSRelativeDateTimeFormatter_ptr, (SEL *)&selRef_setUnitsStyle_, 0, &qword_100161390);
}

id sub_1000E0A38(uint64_t a1, Class *a2, SEL *a3, uint64_t a4, void *a5)
{
  id v8 = [objc_allocWithZone(*a2) init];
  id result = [v8 *a3:a4];
  *a5 = v8;
  return result;
}

id sub_1000E0A90@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v4 = *(void **)(v3 + 64);
  *a2 = v4;

  return v4;
}

void sub_1000E0B48(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

id sub_1000E0C24@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v4 = *(void **)(v3 + 72);
  *a2 = v4;

  return v4;
}

void sub_1000E0CDC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

uint64_t sub_1000E0DB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000E0DFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100032FA0(&qword_100159630);
  __chkstk_darwin(v2 - 8);
  uint64_t v67 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for Locale.Language();
  uint64_t v4 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v77 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_100159638);
  __chkstk_darwin(v6 - 8);
  long long v76 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Locale();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v75 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v70 = (char *)&v64 - v15;
  __chkstk_darwin(v16);
  uint64_t v69 = (char *)&v64 - v17;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v64 - v19;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v64 - v22;
  type metadata accessor for CalculatorViewModel();
  sub_10003326C((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  *(void *)a1 = Environment.init<A>(_:)();
  *(unsigned char *)(a1 + 8) = v24 & 1;
  uint64_t v83 = 808464433;
  unint64_t v84 = 0xE400000000000000;
  State.init(wrappedValue:)();
  uint64_t v25 = v86;
  *(_OWORD *)(a1 + 16) = v85;
  *(void *)(a1 + 32) = v25;
  LOBYTE(v83) = 1;
  State.init(wrappedValue:)();
  uint64_t v26 = *((void *)&v85 + 1);
  *(unsigned char *)(a1 + 40) = v85;
  *(void *)(a1 + 48) = v26;
  LOBYTE(v83) = 1;
  State.init(wrappedValue:)();
  uint64_t v27 = *((void *)&v85 + 1);
  *(unsigned char *)(a1 + 56) = v85;
  *(void *)(a1 + 64) = v27;
  uint64_t v66 = type metadata accessor for DebugMenu();
  Locale.init(identifier:)();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v20, v23, v11);
  State.init(wrappedValue:)();
  uint64_t v71 = v12;
  unsigned int v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v68 = v23;
  uint64_t v80 = v28;
  uint64_t v81 = v12 + 8;
  v28(v23, v11);
  *(void *)&long long v85 = static Locale.availableIdentifiers.getter();
  swift_bridgeObjectRetain();
  sub_1000E6934((uint64_t *)&v85);
  swift_bridgeObjectRelease();
  uint64_t v29 = v85;
  uint64_t v30 = *(void *)(v85 + 16);
  if (!v30)
  {
    uint64_t v32 = _swiftEmptyArrayStorage;
    goto LABEL_22;
  }
  uint64_t v65 = a1;
  uint64_t v79 = (void (**)(char *, char *, uint64_t))(v71 + 32);
  uint64_t v73 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56);
  uint64_t v74 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v72 = (uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
  swift_retain();
  uint64_t v64 = v29;
  uint64_t v31 = v29 + 40;
  uint64_t v32 = _swiftEmptyArrayStorage;
  uint64_t v33 = v70;
  do
  {
    uint64_t v82 = v32;
    swift_bridgeObjectRetain_n();
    Locale.init(identifier:)();
    uint64_t v34 = v77;
    Locale.language.getter();
    uint64_t v35 = v76;
    Locale.Language.languageCode.getter();
    uint64_t v36 = (uint64_t)v35;
    (*v74)(v34, v78);
    uint64_t v37 = type metadata accessor for Locale.LanguageCode();
    uint64_t v38 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37) == 1)
    {
      uint64_t v39 = v36;
      uint64_t v40 = &qword_100159638;
LABEL_10:
      sub_100032F44(v39, v40);
LABEL_11:
      v80(v33, v11);
      uint64_t v51 = 1;
      goto LABEL_12;
    }
    uint64_t v41 = v10;
    uint64_t v42 = Locale.LanguageCode.identifier.getter();
    uint64_t v44 = v43;
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
    uint64_t v45 = v68;
    static Locale.current.getter();
    v46._countAndFlagsBits = v42;
    uint64_t v10 = v41;
    uint64_t v33 = v70;
    v46._object = v44;
    object = Locale.localizedString(forIdentifier:)(v46).value._object;
    swift_bridgeObjectRelease();
    v80(v45, v11);
    swift_bridgeObjectRelease();
    if (!object) {
      goto LABEL_11;
    }
    Swift::String v48 = v67;
    Locale.region.getter();
    uint64_t v49 = type metadata accessor for Locale.Region();
    uint64_t v50 = *(void *)(v49 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49) == 1)
    {
      uint64_t v39 = (uint64_t)v48;
      uint64_t v40 = &qword_100159630;
      goto LABEL_10;
    }
    Locale.Region.icuDisplayName.getter();
    uint64_t v57 = v48;
    uint64_t v59 = v58;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v57, v49);
    swift_bridgeObjectRelease();
    if (!v59) {
      goto LABEL_11;
    }
    (*v79)(v10, v33, v11);
    uint64_t v51 = 0;
LABEL_12:
    (*v73)(v10, v51, 1, v11);
    swift_bridgeObjectRelease();
    int v52 = (*v72)(v10, 1, v11);
    uint64_t v32 = v82;
    if (v52 == 1)
    {
      sub_100032F44((uint64_t)v10, &qword_1001552B0);
    }
    else
    {
      char v53 = *v79;
      uint64_t v54 = v69;
      (*v79)(v69, v10, v11);
      v53(v75, v54, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v32 = (void *)sub_1000A4E28(0, v32[2] + 1, 1, (unint64_t)v32);
      }
      unint64_t v56 = v32[2];
      unint64_t v55 = v32[3];
      if (v56 >= v55 >> 1) {
        uint64_t v32 = (void *)sub_1000A4E28(v55 > 1, v56 + 1, 1, (unint64_t)v32);
      }
      v32[2] = v56 + 1;
      v53((char *)v32+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v56, v75, v11);
    }
    v31 += 16;
    --v30;
  }
  while (v30);
  swift_release();
  a1 = v65;
LABEL_22:
  swift_release();
  uint64_t v60 = v66;
  *(void *)(a1 + *(int *)(v66 + 36)) = v32;
  uint64_t v61 = a1 + *(int *)(v60 + 40);
  LOBYTE(v83) = 0;
  uint64_t result = State.init(wrappedValue:)();
  uint64_t v63 = *((void *)&v85 + 1);
  *(unsigned char *)uint64_t v61 = v85;
  *(void *)(v61 + 8) = v63;
  return result;
}

int *sub_1000E1694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v7 = static Alignment.center.getter();
  uint64_t v9 = v8;
  uint64_t result = (int *)(id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v11 = result;
    int appleInternalInstallCapability = MobileGestalt_get_appleInternalInstallCapability();

    if (appleInternalInstallCapability)
    {
      swift_retain();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v5 = 0;
    }
    uint64_t v13 = sub_100032FA0(&qword_100159850);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(a2, a1, v13);
    uint64_t result = (int *)sub_100032FA0(&qword_100159858);
    uint64_t v14 = (void *)(a2 + result[9]);
    *uint64_t v14 = v6;
    v14[1] = v5;
    v14[2] = v7;
    v14[3] = v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000E1778()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = (objc_class *)type metadata accessor for CalculatorAppDebugMenuGestureProxyView();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  uint64_t v5 = &v4[OBJC_IVAR____TtC10CalculatorP33_975093CEE8F9D0E989FB2156FC3C1A8C38CalculatorAppDebugMenuGestureProxyView_action];
  *(void *)uint64_t v5 = v2;
  *((void *)v5 + 1) = v1;
  v7.receiver = v4;
  v7.super_class = v3;
  swift_retain();
  return [super initWithFrame:0.0, 0.0, 0.0, 0.0];
}

uint64_t sub_1000E1808()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_1000E184C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000E9518();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000E18B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000E9518();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000E1914()
{
}

void sub_1000E1998(void *a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for CalculatorAppDebugMenuGestureProxyView();
  [super willMoveToWindow:a1];
  if (a1)
  {
    id v3 = [a1 windowScene];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [v3 statusBarManager];

      if (v5)
      {
        uint64_t v6 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v8[4] = sub_1000E1CA0;
        v8[5] = v6;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 1107296256;
        v8[2] = sub_1000E0DB8;
        v8[3] = &unk_10014DE58;
        objc_super v7 = _Block_copy(v8);
        swift_release();
        [v5 setDebugMenuHandler:v7];
        _Block_release(v7);
      }
    }
  }
}

uint64_t sub_1000E1ADC()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void (**)(void))(result
                          + OBJC_IVAR____TtC10CalculatorP33_975093CEE8F9D0E989FB2156FC3C1A8C38CalculatorAppDebugMenuGestureProxyView_action);
    swift_retain();

    v2();
    return swift_release();
  }
  return result;
}

id sub_1000E1BF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalculatorAppDebugMenuGestureProxyView();
  return [super dealloc];
}

uint64_t type metadata accessor for CalculatorAppDebugMenuGestureProxyView()
{
  return self;
}

uint64_t sub_1000E1C68()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_1000E1CA0()
{
  return sub_1000E1ADC();
}

uint64_t sub_1000E1CA8()
{
  return swift_release();
}

uint64_t type metadata accessor for DebugMenu()
{
  uint64_t result = qword_1001596A0;
  if (!qword_1001596A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000E1CFC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  long long v85 = a2;
  uint64_t v3 = sub_100032FA0(&qword_1001555E8);
  __chkstk_darwin(v3 - 8);
  uint64_t v82 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032FA0(&qword_100159810);
  __chkstk_darwin(v5 - 8);
  uint64_t v97 = (uint64_t)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v90 = (uint64_t)&v75 - v8;
  uint64_t v9 = type metadata accessor for DebugMenu();
  uint64_t v80 = *(void *)(v9 - 8);
  uint64_t v79 = *(void *)(v80 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v78 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100032FA0(&qword_1001555F0);
  uint64_t v84 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v81 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  Swift::String v96 = (char *)&v75 - v13;
  uint64_t v77 = sub_100032FA0(&qword_100159818) - 8;
  __chkstk_darwin(v77);
  uint64_t v100 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v99 = (uint64_t)&v75 - v16;
  uint64_t v17 = sub_100032FA0(&qword_100157E28);
  uint64_t v92 = *(void *)(v17 - 8);
  uint64_t v93 = v17;
  __chkstk_darwin(v17);
  uint64_t v91 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  Swift::String v98 = (char *)&v75 - v20;
  uint64_t v21 = sub_100032FA0(&qword_100159820);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  char v24 = (char *)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100032FA0(&qword_100159828);
  uint64_t v94 = *(void *)(v25 - 8);
  uint64_t v95 = v25;
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v75 - v29;
  uint64_t v89 = (char *)&v75 - v29;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v76 = a1;
  uint64_t v31 = *(void *)(a1 + 32);
  long long v102 = *(_OWORD *)(a1 + 16);
  uint64_t v103 = v31;
  sub_100032FA0(&qword_100158A88);
  State.projectedValue.getter();
  TextField<>.init(_:text:onEditingChanged:onCommit:)();
  sub_100040BE4(&qword_100159830, &qword_100159820);
  char v88 = v27;
  View.keyboardType(_:)();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  (*(void (**)(char *, char *, uint64_t))(v94 + 32))(v30, v27, v95);
  uint64_t v32 = v76;
  uint64_t v34 = *(void *)(v76 + 48);
  LOBYTE(v102) = *(unsigned char *)(v76 + 40);
  char v33 = v102;
  *((void *)&v102 + 1) = v34;
  sub_100032FA0(&qword_100154898);
  State.projectedValue.getter();
  Toggle.init(isOn:label:)();
  uint64_t v35 = *(void *)(v32 + 64);
  LOBYTE(v102) = *(unsigned char *)(v32 + 56);
  *((void *)&v102 + 1) = v35;
  State.projectedValue.getter();
  uint64_t v36 = v91;
  Toggle.init(isOn:label:)();
  LOBYTE(v104) = v33;
  uint64_t v105 = v34;
  State.wrappedValue.getter();
  char v37 = v102;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = (v37 & 1) == 0;
  uint64_t v40 = v92;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  uint64_t v86 = v92 + 16;
  uint64_t v87 = v41;
  uint64_t v42 = (uint64_t)v100;
  uint64_t v43 = v93;
  v41(v100, v36, v93);
  uint64_t v44 = (uint64_t *)(v42 + *(int *)(v77 + 44));
  *uint64_t v44 = KeyPath;
  v44[1] = (uint64_t)sub_1000E956C;
  v44[2] = v39;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v92 = v40 + 8;
  uint64_t v77 = (uint64_t)v45;
  v45(v36, v43);
  sub_10002D9D0(v42, v99, &qword_100159818);
  uint64_t v46 = v78;
  sub_1000E8B7C(v32, v78);
  unint64_t v47 = (*(unsigned __int8 *)(v80 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
  uint64_t v48 = swift_allocObject();
  sub_1000E8BE4(v46, v48 + v47);
  uint64_t v101 = v32;
  Button.init(action:label:)();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v49 = v82;
  static ButtonRole.destructive.getter();
  uint64_t v50 = type metadata accessor for ButtonRole();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  sub_1000E8B7C(v32, v46);
  uint64_t v51 = swift_allocObject();
  sub_1000E8BE4(v46, v51 + v47);
  int v52 = v81;
  Button<>.init(_:role:action:)();
  sub_100040BE4(&qword_100156428, &qword_1001555F0);
  uint64_t v53 = v97;
  uint64_t v54 = v83;
  View.accessibilityIdentifier(_:)();
  uint64_t v55 = v84;
  unint64_t v56 = *(char **)(v84 + 8);
  uint64_t v80 = v84 + 8;
  uint64_t v82 = v56;
  uint64_t v57 = v54;
  ((void (*)(char *, uint64_t))v56)(v52, v54);
  uint64_t v58 = v90;
  sub_10002D9D0(v53, v90, &qword_100159810);
  uint64_t v59 = v95;
  uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
  uint64_t v61 = v88;
  v60(v88, v89, v95);
  uint64_t v62 = v91;
  v87(v91, v98, v93);
  sub_100033344(v99, (uint64_t)v100, &qword_100159818);
  uint64_t v84 = *(void *)(v55 + 16);
  ((void (*)(char *, char *, uint64_t))v84)(v52, v96, v57);
  uint64_t v63 = v58;
  uint64_t v64 = v97;
  sub_100033344(v63, v97, &qword_100159810);
  uint64_t v65 = v85;
  v60(v85, v61, v59);
  uint64_t v66 = (int *)sub_100032FA0(&qword_100159838);
  uint64_t v67 = v93;
  v87(&v65[v66[12]], v62, v93);
  sub_100033344((uint64_t)v100, (uint64_t)&v65[v66[16]], &qword_100159818);
  ((void (*)(char *, char *, uint64_t))v84)(&v65[v66[20]], v52, v57);
  sub_100033344(v64, (uint64_t)&v65[v66[24]], &qword_100159810);
  sub_100032F44(v90, &qword_100159810);
  uint64_t v68 = v57;
  uint64_t v69 = v57;
  uint64_t v70 = (void (*)(char *, uint64_t))v82;
  ((void (*)(char *, uint64_t))v82)(v96, v68);
  sub_100032F44(v99, &qword_100159818);
  uint64_t v71 = (void (*)(char *, uint64_t))v77;
  ((void (*)(char *, uint64_t))v77)(v98, v67);
  uint64_t v72 = v95;
  uint64_t v73 = *(void (**)(char *, uint64_t))(v94 + 8);
  v73(v89, v95);
  sub_100032F44(v97, &qword_100159810);
  v70(v52, v69);
  sub_100032F44((uint64_t)v100, &qword_100159818);
  v71(v91, v67);
  return ((uint64_t (*)(char *, uint64_t))v73)(v88, v72);
}

uint64_t sub_1000E28E4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E5954(a1);
}

uint64_t sub_1000E2900@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E5954(a1);
}

uint64_t sub_1000E291C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CharacterSet();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 32);
  long long v36 = *(_OWORD *)(a1 + 16);
  uint64_t v37 = v6;
  sub_100032FA0(&qword_100158A88);
  State.wrappedValue.getter();
  long long v36 = v38;
  static CharacterSet.whitespacesAndNewlines.getter();
  sub_100023B24();
  uint64_t v7 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v9) & 0xF;
  uint64_t v12 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v9 & 0x2000000000000000) != 0) {
    uint64_t v13 = HIBYTE(v9) & 0xF;
  }
  else {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  if ((v9 & 0x1000000000000000) != 0)
  {
    int64_t v15 = (int64_t)sub_10006DDEC(v7, v9, 10);
    LOBYTE(v7) = v34;
    goto LABEL_44;
  }
  if ((v9 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0) {
      uint64_t v14 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v14 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    int64_t v15 = (int64_t)sub_10006DD80(v14, v12, 10);
    LOBYTE(v7) = v16 & 1;
LABEL_44:
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
LABEL_46:
      char v26 = *(unsigned char *)(a1 + 8);
      uint64_t v27 = swift_retain();
      sub_100033AA8(v27, v26);
      swift_release();
      uint64_t v28 = *(void *)(a1 + 48);
      LOBYTE(v36) = *(unsigned char *)(a1 + 40);
      *((void *)&v36 + 1) = v28;
      sub_100032FA0(&qword_100154898);
      State.wrappedValue.getter();
      int v29 = v38;
      uint64_t v30 = *(void *)(a1 + 64);
      LOBYTE(v36) = *(unsigned char *)(a1 + 56);
      *((void *)&v36 + 1) = v30;
      State.wrappedValue.getter();
      sub_1000E73F8(v15, v29, v38);
      return swift_release();
    }
LABEL_45:
    int64_t v15 = 1000;
    goto LABEL_46;
  }
  *(void *)&long long v36 = v7;
  *((void *)&v36 + 1) = v9 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (!v11) {
      goto LABEL_57;
    }
    if (v11 == 1 || (BYTE1(v7) - 48) > 9u) {
      goto LABEL_31;
    }
    int64_t v15 = (BYTE1(v7) - 48);
    if (v11 != 2)
    {
      if ((BYTE2(v7) - 48) > 9u) {
        goto LABEL_31;
      }
      int64_t v15 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
      uint64_t v17 = v11 - 3;
      if (v17)
      {
        uint64_t v18 = (unsigned __int8 *)&v36 + 3;
        while (1)
        {
          unsigned int v19 = *v18 - 48;
          if (v19 > 9) {
            goto LABEL_31;
          }
          uint64_t v20 = 10 * v15;
          if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
            goto LABEL_31;
          }
          int64_t v15 = v20 + v19;
          if (__OFADD__(v20, v19)) {
            goto LABEL_31;
          }
          LOBYTE(v7) = 0;
          ++v18;
          if (!--v17) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    LOBYTE(v7) = 0;
    goto LABEL_44;
  }
  if (v7 != 45)
  {
    if (!v11 || (v7 - 48) > 9u) {
      goto LABEL_31;
    }
    int64_t v15 = (v7 - 48);
    if (v11 != 1)
    {
      if ((BYTE1(v7) - 48) > 9u) {
        goto LABEL_31;
      }
      int64_t v15 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
      uint64_t v21 = v11 - 2;
      if (v21)
      {
        uint64_t v22 = (unsigned __int8 *)&v36 + 2;
        while (1)
        {
          unsigned int v23 = *v22 - 48;
          if (v23 > 9) {
            goto LABEL_31;
          }
          uint64_t v24 = 10 * v15;
          if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
            goto LABEL_31;
          }
          int64_t v15 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_31;
          }
          LOBYTE(v7) = 0;
          ++v22;
          if (!--v21) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v11)
  {
    if (v11 != 1 && (BYTE1(v7) - 48) <= 9u)
    {
      if (v11 == 2)
      {
        LOBYTE(v7) = 0;
        int64_t v15 = -(uint64_t)(BYTE1(v7) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v7) - 48) <= 9u)
      {
        int64_t v15 = -10 * (BYTE1(v7) - 48) - (BYTE2(v7) - 48);
        uint64_t v25 = v11 - 3;
        if (!v25) {
          goto LABEL_43;
        }
        uint64_t v31 = (unsigned __int8 *)&v36 + 3;
        while (1)
        {
          unsigned int v32 = *v31 - 48;
          if (v32 > 9) {
            break;
          }
          uint64_t v33 = 10 * v15;
          if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
            break;
          }
          int64_t v15 = v33 - v32;
          if (__OFSUB__(v33, v32)) {
            break;
          }
          LOBYTE(v7) = 0;
          ++v31;
          if (!--v25) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    int64_t v15 = 0;
    LOBYTE(v7) = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_1000E2D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v8 - 8);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v9._countAndFlagsBits = 0x20657461657243;
  v9._object = (void *)0xE700000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v9);
  uint64_t v10 = *(void *)(a1 + 32);
  long long v39 = *(_OWORD *)(a1 + 16);
  uint64_t v40 = v10;
  sub_100032FA0(&qword_100158A88);
  State.wrappedValue.getter();
  long long v39 = v41;
  static CharacterSet.whitespacesAndNewlines.getter();
  sub_100023B24();
  uint64_t v11 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v13) & 0xF;
  uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0) {
    uint64_t v17 = HIBYTE(v13) & 0xF;
  }
  else {
    uint64_t v17 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  if ((v13 & 0x1000000000000000) != 0)
  {
    uint64_t v19 = (uint64_t)sub_10006DDEC(v11, v13, 10);
    LOBYTE(v11) = v37;
    goto LABEL_44;
  }
  if ((v13 & 0x2000000000000000) == 0)
  {
    if ((v11 & 0x1000000000000000) != 0) {
      uint64_t v18 = (unsigned __int8 *)((v13 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v18 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v19 = (uint64_t)sub_10006DD80(v18, v16, 10);
    LOBYTE(v11) = v20 & 1;
LABEL_44:
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
LABEL_46:
      *(void *)&long long v39 = v19;
      LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
      v30._countAndFlagsBits = 0x79726F7473694820;
      v30._object = (void *)0xEE00736D65744920;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v30);
      LocalizedStringKey.init(stringInterpolation:)();
      uint64_t result = Text.init(_:tableName:bundle:comment:)();
      *(void *)a2 = result;
      *(void *)(a2 + 8) = v31;
      *(unsigned char *)(a2 + 16) = v32 & 1;
      *(void *)(a2 + 24) = v33;
      return result;
    }
LABEL_45:
    uint64_t v19 = 1000;
    goto LABEL_46;
  }
  *(void *)&long long v39 = v11;
  *((void *)&v39 + 1) = v13 & 0xFFFFFFFFFFFFFFLL;
  if (v11 == 43)
  {
    if (!v15) {
      goto LABEL_57;
    }
    if (v15 == 1 || (BYTE1(v11) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v19 = (BYTE1(v11) - 48);
    if (v15 != 2)
    {
      if ((BYTE2(v11) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v19 = 10 * (BYTE1(v11) - 48) + (BYTE2(v11) - 48);
      uint64_t v21 = v15 - 3;
      if (v21)
      {
        uint64_t v22 = (unsigned __int8 *)&v39 + 3;
        while (1)
        {
          unsigned int v23 = *v22 - 48;
          if (v23 > 9) {
            goto LABEL_31;
          }
          uint64_t v24 = 10 * v19;
          if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
            goto LABEL_31;
          }
          uint64_t v19 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_31;
          }
          LOBYTE(v11) = 0;
          ++v22;
          if (!--v21) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    LOBYTE(v11) = 0;
    goto LABEL_44;
  }
  if (v11 != 45)
  {
    if (!v15 || (v11 - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v19 = (v11 - 48);
    if (v15 != 1)
    {
      if ((BYTE1(v11) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v19 = 10 * (v11 - 48) + (BYTE1(v11) - 48);
      uint64_t v25 = v15 - 2;
      if (v25)
      {
        char v26 = (unsigned __int8 *)&v39 + 2;
        while (1)
        {
          unsigned int v27 = *v26 - 48;
          if (v27 > 9) {
            goto LABEL_31;
          }
          uint64_t v28 = 10 * v19;
          if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
            goto LABEL_31;
          }
          uint64_t v19 = v28 + v27;
          if (__OFADD__(v28, v27)) {
            goto LABEL_31;
          }
          LOBYTE(v11) = 0;
          ++v26;
          if (!--v25) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v15)
  {
    if (v15 != 1 && (BYTE1(v11) - 48) <= 9u)
    {
      if (v15 == 2)
      {
        LOBYTE(v11) = 0;
        uint64_t v19 = -(uint64_t)(BYTE1(v11) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v11) - 48) <= 9u)
      {
        uint64_t v19 = -10 * (BYTE1(v11) - 48) - (BYTE2(v11) - 48);
        uint64_t v29 = v15 - 3;
        if (!v29) {
          goto LABEL_43;
        }
        char v34 = (unsigned __int8 *)&v39 + 3;
        while (1)
        {
          unsigned int v35 = *v34 - 48;
          if (v35 > 9) {
            break;
          }
          uint64_t v36 = 10 * v19;
          if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
            break;
          }
          uint64_t v19 = v36 - v35;
          if (__OFSUB__(v36, v35)) {
            break;
          }
          LOBYTE(v11) = 0;
          ++v34;
          if (!--v29) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    uint64_t v19 = 0;
    LOBYTE(v11) = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_1000E323C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  if (qword_1001541A0 != -1) {
    swift_once();
  }
  swift_retain();
  swift_release();
  sub_100047F34();

  return swift_release();
}

uint64_t sub_1000E32DC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v80 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v77 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100032FA0(&qword_1001597B0) - 8;
  __chkstk_darwin(v72);
  uint64_t v71 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100032FA0(&qword_1001597B8);
  __chkstk_darwin(v73);
  uint64_t v78 = (uint64_t)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100032FA0(&qword_1001597C0);
  __chkstk_darwin(v76);
  uint64_t v81 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v87 = (uint64_t)&v67 - v8;
  uint64_t v9 = type metadata accessor for DebugMenu();
  uint64_t v10 = v9 - 8;
  uint64_t v83 = *(void *)(v9 - 8);
  uint64_t v70 = *(void *)(v83 + 64);
  __chkstk_darwin(v9);
  uint64_t v68 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100032FA0(&qword_1001555F0);
  uint64_t v90 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v89 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v88 = (char *)&v67 - v14;
  uint64_t v15 = sub_100032FA0(&qword_1001597C8);
  __chkstk_darwin(v15 - 8);
  uint64_t v75 = sub_100032FA0(&qword_1001597D0);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  long long v85 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v67 - v18;
  uint64_t v69 = (void (*)(uint64_t, char *, uint64_t))LocalizedStringKey.init(stringLiteral:)();
  sub_100032FA0(&qword_100159640);
  State.projectedValue.getter();
  uint64_t v92 = a1;
  type metadata accessor for Locale();
  sub_100032FA0(&qword_1001597D8);
  sub_10003326C(&qword_1001597E0, (void (*)(uint64_t))&type metadata accessor for Locale);
  sub_1000E8C78();
  uint64_t v84 = v19;
  uint64_t v20 = (uint64_t)v68;
  uint64_t v21 = v71;
  Picker<>.init(_:selection:content:)();
  sub_1000E8B7C(a1, v20);
  uint64_t v22 = *(unsigned __int8 *)(v83 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  uint64_t v24 = v22 | 7;
  uint64_t v25 = swift_allocObject();
  sub_1000E8BE4(v20, v25 + v23);
  uint64_t v91 = a1;
  Button.init(action:label:)();
  sub_1000E8B7C(a1, v20);
  uint64_t v83 = v24;
  uint64_t v26 = swift_allocObject();
  sub_1000E8BE4(v20, v26 + v23);
  unsigned int v27 = v89;
  Button.init(action:label:)();
  uint64_t v28 = a1 + *(int *)(v10 + 48);
  char v29 = *(unsigned char *)v28;
  uint64_t v30 = *(void *)(v28 + 8);
  char v93 = v29;
  uint64_t v94 = v30;
  sub_100032FA0(&qword_100154898);
  State.wrappedValue.getter();
  char v31 = v95;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = v31;
  uint64_t v34 = v90;
  unsigned int v35 = *(void (**)(uint64_t, char *, uint64_t))(v90 + 16);
  uint64_t v36 = v86;
  uint64_t v70 = v90 + 16;
  uint64_t v69 = v35;
  v35((uint64_t)v21, v27, v86);
  char v37 = (uint64_t *)&v21[*(int *)(v72 + 44)];
  *char v37 = KeyPath;
  v37[1] = (uint64_t)sub_100037BB4;
  v37[2] = v33;
  uint64_t v38 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v90 = v34 + 8;
  uint64_t v72 = (uint64_t)v38;
  v38(v27, v36);
  if (qword_100154510 != -1) {
    swift_once();
  }
  uint64_t v67 = a1;
  sub_1000E8B7C(a1, v20);
  uint64_t v39 = swift_allocObject();
  sub_1000E8BE4(v20, v39 + v23);
  id v40 = [self defaultCenter];
  long long v41 = v77;
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = sub_1000E8DB4;
  *(void *)(v42 + 24) = v39;
  uint64_t v43 = (uint64_t)v21;
  uint64_t v44 = (uint64_t)v21;
  uint64_t v45 = v78;
  sub_100033344(v43, v78, &qword_1001597B0);
  uint64_t v46 = v23;
  uint64_t v47 = v73;
  uint64_t v48 = v79;
  uint64_t v49 = v80;
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 16))(v45 + *(int *)(v73 + 52), v41, v80);
  uint64_t v50 = (uint64_t (**)(uint64_t))(v45 + *(int *)(v47 + 56));
  *uint64_t v50 = sub_10008FE08;
  v50[1] = (uint64_t (*)(uint64_t))v42;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v41, v49);
  sub_100032F44(v44, &qword_1001597B0);
  sub_1000E8B7C(v67, v20);
  uint64_t v51 = swift_allocObject();
  sub_1000E8BE4(v20, v51 + v46);
  uint64_t v52 = v81;
  sub_100033344(v45, v81, &qword_1001597B8);
  uint64_t v53 = (uint64_t (**)())(v52 + *(int *)(v76 + 36));
  *uint64_t v53 = sub_1000E8E08;
  v53[1] = (uint64_t (*)())v51;
  v53[2] = 0;
  v53[3] = 0;
  sub_100032F44(v45, &qword_1001597B8);
  uint64_t v54 = v87;
  sub_10002D9D0(v52, v87, &qword_1001597C0);
  uint64_t v55 = v74;
  unint64_t v56 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  uint64_t v57 = v85;
  uint64_t v58 = v75;
  v56(v85, v84, v75);
  uint64_t v59 = v86;
  uint64_t v60 = v69;
  v69((uint64_t)v89, v88, v86);
  sub_100033344(v54, v52, &qword_1001597C0);
  uint64_t v61 = v82;
  v56(v82, v57, v58);
  uint64_t v62 = sub_100032FA0(&qword_100159800);
  uint64_t v63 = v89;
  v60((uint64_t)&v61[*(int *)(v62 + 48)], v89, v59);
  sub_100033344(v52, (uint64_t)&v61[*(int *)(v62 + 64)], &qword_1001597C0);
  sub_100032F44(v87, &qword_1001597C0);
  uint64_t v64 = (void (*)(char *, uint64_t))v72;
  ((void (*)(char *, uint64_t))v72)(v88, v59);
  uint64_t v65 = *(void (**)(char *, uint64_t))(v55 + 8);
  v65(v84, v58);
  sub_100032F44(v52, &qword_1001597C0);
  v64(v63, v59);
  return ((uint64_t (*)(char *, uint64_t))v65)(v85, v58);
}

uint64_t sub_1000E3D7C()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000E3EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v1 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v1 - 8);
  v41[1] = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100032FA0(&qword_100159630);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Locale.Language();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032FA0(&qword_100159638);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Locale();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale.current.getter();
  Locale.language.getter();
  Locale.Language.languageCode.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v17 = type metadata accessor for Locale.LanguageCode();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17) == 1)
  {
    sub_100032F44((uint64_t)v12, &qword_100159638);
    uint64_t v19 = 0;
    uint64_t v20 = (void *)0xE000000000000000;
  }
  else
  {
    uint64_t v19 = Locale.LanguageCode.identifier.getter();
    uint64_t v20 = v21;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v12, v17);
  }
  v22._countAndFlagsBits = v19;
  v22._object = v20;
  Swift::String_optional v23 = Locale.localizedString(forLanguageCode:)(v22);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  Locale.region.getter();
  uint64_t v24 = type metadata accessor for Locale.Region();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v5, 1, v24) == 1)
  {
    swift_bridgeObjectRelease();
    sub_100032F44((uint64_t)v5, &qword_100159630);
LABEL_10:
    uint64_t result = 0;
    uint64_t v36 = 0;
    uint64_t v39 = 0;
    uint64_t v37 = 0;
    goto LABEL_11;
  }
  uint64_t v26 = Locale.Region.icuDisplayName.getter();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v24);
  if (!v28 || !v23.value._object)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v29);
  v30._countAndFlagsBits = v26;
  v30._object = v28;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v30);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 8250;
  v31._object = (void *)0xE200000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v31);
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v23.value);
  swift_bridgeObjectRelease();
  v32._countAndFlagsBits = 10272;
  v32._object = (void *)0xE200000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v32);
  v33._countAndFlagsBits = Locale.identifier.getter();
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v33);
  swift_bridgeObjectRelease();
  v34._countAndFlagsBits = 41;
  v34._object = (void *)0xE100000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v34);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  uint64_t v39 = v38 & 1;
LABEL_11:
  id v40 = v42;
  *uint64_t v42 = result;
  v40[1] = v36;
  v40[2] = v39;
  v40[3] = v37;
  return result;
}

id sub_1000E437C(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1001613A0;
  swift_getKeyPath();
  uint64_t v19 = v9;
  sub_10003326C((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v10 = *(void **)(v9 + 48);
  type metadata accessor for DebugMenu();
  id v11 = v10;
  sub_100032FA0(&qword_100159640);
  State.wrappedValue.getter();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  [v11 setLocale:isa];

  char v13 = *(unsigned char *)(a1 + 8);
  uint64_t v14 = swift_retain();
  sub_100033AA8(v14, v13);
  swift_release();
  State.wrappedValue.getter();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  sub_1000E8E28((uint64_t)v4);
  swift_release();
  if (qword_1001541A0 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_100160C88;
  swift_getKeyPath();
  uint64_t v19 = v15;
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)(v15 + 64) removeAllObjects];
  swift_getKeyPath();
  uint64_t v19 = v15;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)(v15 + 72) removeAllObjects];
  id v16 = [self defaultCenter];
  if (qword_100154510 != -1) {
    swift_once();
  }
  [v16 postNotificationName:qword_100161118 object:0];

  if (qword_100154760 != -1) {
    swift_once();
  }
  return [(id)qword_100161370 synchronize];
}

uint64_t sub_1000E47B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v6 - 8);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v7._object = (void *)0x800000010010B370;
  v7._countAndFlagsBits = 0xD00000000000001FLL;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v7);
  type metadata accessor for DebugMenu();
  sub_100032FA0(&qword_100159640);
  State.wrappedValue.getter();
  uint64_t v8 = Locale.identifier.getter();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v12);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v16;
  return result;
}

void sub_1000E4994(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1001613A0;
  swift_getKeyPath();
  uint64_t v17 = v9;
  sub_10003326C((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v10 = *(id *)(v9 + 48);
  static Locale.current.getter();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  [v10 setLocale:isa];

  char v12 = *(unsigned char *)(a1 + 8);
  uint64_t v13 = swift_retain();
  sub_100033AA8(v13, v12);
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  sub_1000E8E28((uint64_t)v4);
  swift_release();
  if (qword_1001541A0 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_100160C88;
  swift_getKeyPath();
  uint64_t v17 = v14;
  sub_10003326C(&qword_100154BA8, (void (*)(uint64_t))type metadata accessor for CalculatorHistoryRecordManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)(v14 + 64) removeAllObjects];
  swift_getKeyPath();
  uint64_t v17 = v14;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)(v14 + 72) removeAllObjects];
  id v15 = [self defaultCenter];
  if (qword_100154510 != -1) {
    swift_once();
  }
  [v15 postNotificationName:qword_100161118 object:0];
}

uint64_t sub_1000E4D48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v6 - 8);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v7._object = (void *)0x800000010010B350;
  v7._countAndFlagsBits = 0xD00000000000001FLL;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v7);
  static Locale.current.getter();
  uint64_t v8 = Locale.identifier.getter();
  id v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v12);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_1000E4F0C(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v5 = *(unsigned char *)(a1 + 8);
  uint64_t v6 = swift_retain();
  sub_100033AA8(v6, v5);
  swift_release();
  if (qword_100154760 != -1) {
    swift_once();
  }
  Swift::String v7 = (void *)qword_100161370;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 stringForKey:v8];

  if (v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Locale.init(identifier:)();
    uint64_t v10 = type metadata accessor for Locale();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 0, 1, v10);
  }
  else
  {
    uint64_t v10 = type metadata accessor for Locale();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  swift_release();
  type metadata accessor for Locale();
  BOOL v11 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v4, 1, v10) == 1;
  sub_100032F44((uint64_t)v4, &qword_1001552B0);
  Swift::String v12 = (char *)(a1 + *(int *)(type metadata accessor for DebugMenu() + 40));
  char v13 = *v12;
  uint64_t v14 = *((void *)v12 + 1);
  unsigned char v16[16] = v13;
  uint64_t v17 = v14;
  v16[15] = v11;
  sub_100032FA0(&qword_100154898);
  return State.wrappedValue.setter();
}

uint64_t sub_1000E5164()
{
  if (qword_100154760 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100161370;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 stringForKey:v1];

  if (v2) {
  type metadata accessor for DebugMenu();
  }
  sub_100032FA0(&qword_100154898);
  return State.wrappedValue.setter();
}

uint64_t sub_1000E5260@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v38 = a2;
  uint64_t v3 = sub_100032FA0(&qword_100159778);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  unsigned int v35 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v39 = (char *)&v30 - v6;
  uint64_t v7 = sub_100032FA0(&qword_100159780);
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v8 = v33;
  uint64_t v34 = v7;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  char v13 = (char *)&v30 - v12;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v42 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v43 = v14;
  char v44 = v15 & 1;
  uint64_t v45 = v16;
  uint64_t v41 = a1;
  sub_100032FA0(&qword_100159788);
  sub_100040BE4(&qword_100159790, &qword_100159788);
  Swift::String v32 = v13;
  Section<>.init(header:content:)();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v40 = a1;
  sub_100032FA0(&qword_100159798);
  sub_100040BE4(&qword_1001597A0, &qword_100159798);
  uint64_t v17 = v39;
  Section<>.init(_:content:)();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  Swift::String v31 = v10;
  uint64_t v19 = v34;
  v18(v10, v13, v34);
  uint64_t v21 = v35;
  uint64_t v20 = v36;
  Swift::String v22 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  Swift::String_optional v23 = v17;
  uint64_t v24 = v37;
  v22(v35, v23, v37);
  uint64_t v25 = v38;
  v18(v38, v10, v19);
  uint64_t v26 = sub_100032FA0(&qword_1001597A8);
  v22(&v25[*(int *)(v26 + 48)], v21, v24);
  unsigned int v27 = *(void (**)(char *, uint64_t))(v20 + 8);
  v27(v39, v24);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v33 + 8);
  v28(v32, v19);
  v27(v21, v24);
  return ((uint64_t (*)(char *, uint64_t))v28)(v31, v19);
}

uint64_t sub_1000E5650(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v18 - v10;
  char v12 = *(unsigned char *)(a1 + 8);
  uint64_t v13 = swift_retain();
  sub_100033AA8(v13, v12);
  swift_release();
  if (qword_100154760 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)qword_100161370;
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v14 stringForKey:v15];

  if (v16)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Locale.init(identifier:)();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_100032F44((uint64_t)v4, &qword_1001552B0);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
  type metadata accessor for DebugMenu();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  sub_100032FA0(&qword_100159640);
  State.wrappedValue.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_1000E5938@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E5954(a1);
}

uint64_t sub_1000E5954@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000E59B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Image.init(_internalSystemName:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000E59FC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = type metadata accessor for BorderlessButtonStyle();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  uint64_t v36 = v4;
  __chkstk_darwin(v3);
  uint64_t v33 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DebugMenu();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v30 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v32 = sub_100032FA0(&qword_1001555F0);
  uint64_t v34 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  Swift::String v29 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032FA0(&qword_100159840);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  Swift::String v31 = (char *)&v28 - v14;
  LocalizedStringKey.init(stringLiteral:)();
  sub_1000E8B7C(a1, (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v16 = swift_allocObject();
  sub_1000E8BE4((uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  uint64_t v17 = v29;
  Button<>.init(_:action:)();
  uint64_t v18 = v33;
  BorderlessButtonStyle.init()();
  sub_100040BE4(&qword_100156428, &qword_1001555F0);
  sub_10003326C(&qword_100155880, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v19 = v32;
  uint64_t v20 = v35;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v20);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v19);
  uint64_t v21 = v31;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v31, v12, v9);
  Swift::String v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v22(v12, v21, v9);
  Swift::String_optional v23 = v37;
  *uint64_t v37 = 0;
  *((unsigned char *)v23 + 8) = 1;
  uint64_t v24 = (char *)v23;
  uint64_t v25 = sub_100032FA0(&qword_100159848);
  v22(&v24[*(int *)(v25 + 48)], v12, v9);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v21, v9);
  return ((uint64_t (*)(char *, uint64_t))v26)(v12, v9);
}

uint64_t sub_1000E5E5C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_10003326C((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000E5F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = type metadata accessor for DebugMenu();
  uint64_t v78 = *(void *)(v3 - 8);
  uint64_t v77 = *(void *)(v78 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v76 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GroupedFormStyle();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  uint64_t v74 = v6;
  __chkstk_darwin(v5);
  uint64_t v67 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100032FA0(&qword_100159718);
  uint64_t v70 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v64 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100032FA0(&qword_100159720);
  uint64_t v71 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v66 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100032FA0(&qword_100159728) - 8;
  __chkstk_darwin(v69);
  uint64_t v72 = (uint64_t)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v64 - v12;
  uint64_t v14 = sub_100032FA0(&qword_1001590C0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100032FA0(&qword_1001590C8);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100032FA0(&qword_100159730);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20);
  Swift::String_optional v23 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100032FA0(&qword_100159738);
  uint64_t v25 = v24 - 8;
  __chkstk_darwin(v24);
  uint64_t v65 = (uint64_t)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  Swift::String v29 = (char *)&v64 - v28;
  *(void *)uint64_t v16 = static VerticalAlignment.center.getter();
  *((void *)v16 + 1) = 0;
  unsigned char v16[16] = 1;
  sub_100032FA0(&qword_100159740);
  Label.init(title:icon:)();
  uint64_t v30 = static Alignment.center.getter();
  sub_1000C397C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, 0.0, 1, v30, v31);
  sub_100032F44((uint64_t)v16, &qword_1001590C0);
  uint64_t v32 = static Alignment.trailing.getter();
  uint64_t v34 = v33;
  uint64_t v35 = &v23[*(int *)(v21 + 44)];
  sub_1000E59FC(a1, v35);
  uint64_t v36 = (uint64_t *)&v35[*(int *)(sub_100032FA0(&qword_100159748) + 36)];
  *uint64_t v36 = v32;
  v36[1] = v34;
  sub_10002D9D0((uint64_t)v19, (uint64_t)v23, &qword_1001590C8);
  LOBYTE(v32) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  sub_100033344((uint64_t)v23, (uint64_t)v29, &qword_100159730);
  uint64_t v45 = &v29[*(int *)(v25 + 44)];
  char *v45 = v32;
  *((void *)v45 + 1) = v38;
  *((void *)v45 + 2) = v40;
  *((void *)v45 + 3) = v42;
  *((void *)v45 + 4) = v44;
  v45[40] = 0;
  sub_100032F44((uint64_t)v23, &qword_100159730);
  uint64_t v80 = a1;
  uint64_t v46 = a1;
  sub_100032FA0(&qword_100159750);
  sub_100040BE4(&qword_100159758, &qword_100159750);
  uint64_t v47 = v64;
  Form.init(content:)();
  uint64_t v48 = v67;
  static FormStyle<>.grouped.getter();
  sub_100040BE4(&qword_100159760, &qword_100159718);
  sub_10003326C(&qword_100159768, (void (*)(uint64_t))&type metadata accessor for GroupedFormStyle);
  uint64_t v49 = v66;
  uint64_t v50 = v68;
  uint64_t v51 = v73;
  View.formStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v48, v51);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v47, v50);
  uint64_t v52 = v46;
  uint64_t v53 = v76;
  sub_1000E8B7C(v52, v76);
  unint64_t v54 = (*(unsigned __int8 *)(v78 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
  uint64_t v55 = swift_allocObject();
  sub_1000E8BE4(v53, v55 + v54);
  uint64_t v56 = v71;
  uint64_t v57 = v75;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v13, v49, v75);
  uint64_t v58 = (uint64_t (**)())&v13[*(int *)(v69 + 44)];
  *uint64_t v58 = sub_1000E8C48;
  v58[1] = (uint64_t (*)())v55;
  v58[2] = 0;
  void v58[3] = 0;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v49, v57);
  uint64_t v59 = v65;
  sub_100033344((uint64_t)v29, v65, &qword_100159738);
  uint64_t v60 = v72;
  sub_100033344((uint64_t)v13, v72, &qword_100159728);
  uint64_t v61 = v79;
  sub_100033344(v59, v79, &qword_100159738);
  uint64_t v62 = sub_100032FA0(&qword_100159770);
  sub_100033344(v60, v61 + *(int *)(v62 + 48), &qword_100159728);
  sub_100032F44((uint64_t)v13, &qword_100159728);
  sub_100032F44((uint64_t)v29, &qword_100159738);
  sub_100032F44(v60, &qword_100159728);
  return sub_100032F44(v59, &qword_100159738);
}

uint64_t sub_1000E6764@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100032FA0(&qword_1001596F8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_100159700);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 1;
  uint64_t v10 = sub_100032FA0(&qword_100159708);
  sub_1000E5F50(v2, (uint64_t)&v9[*(int *)(v10 + 44)]);
  uint64_t v11 = enum case for ColorScheme.dark(_:);
  uint64_t v12 = type metadata accessor for ColorScheme();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v6, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v6, 0, 1, v12);
  uint64_t v14 = sub_100032FA0(&qword_100159710);
  sub_100033344((uint64_t)v6, a1 + *(int *)(v14 + 36), &qword_1001596F8);
  sub_100033344((uint64_t)v9, a1, &qword_100159700);
  sub_100032F44((uint64_t)v6, &qword_1001596F8);
  return sub_100032F44((uint64_t)v9, &qword_100159700);
}

Swift::Int sub_1000E6934(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000A7490(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_1000E69A0(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_1000E69A0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_1000E708C(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  long long v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_1000E715C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_1000A6DB8((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      Swift::String_optional v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ _stringCompareWithSmolCheck(_:_:expecting:)()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_1000A6B44(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_1000A6B44((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        long long v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        char v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_1000E715C((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
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
  __break(1u);
LABEL_160:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000E708C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000E715C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_1000A6C40((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_1000E73F8(unint64_t a1, int a2, char a3)
{
  LOBYTE(v3) = a3;
  int v90 = a2;
  uint64_t v95 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  unint64_t v89 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v103 = (char *)&v72 - v8;
  uint64_t v88 = type metadata accessor for UUID();
  int64_t v9 = *(char **)(v88 - 8);
  __chkstk_darwin(v88);
  unint64_t v101 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = type metadata accessor for CalculateExpression.Base();
  uint64_t v11 = *(char **)(v100 - 8);
  __chkstk_darwin(v100);
  uint64_t v99 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001546C8 != -1) {
    goto LABEL_62;
  }
  while (1)
  {
    uint64_t v13 = qword_1001612E0;
    swift_getKeyPath();
    Swift::Int v106 = (void *)v13;
    sub_10003326C((unint64_t *)&qword_100155238, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionDataProvider);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v14 = [*(id *)(v13 + 16) categories];
    sub_10001CE8C(0, (unint64_t *)&qword_100155240);
    unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v91 = a1;
    if (v3) {
      goto LABEL_15;
    }
    Swift::Int v106 = _swiftEmptyArrayStorage;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v16)
      {
LABEL_5:
        if (v16 < 1) {
          goto LABEL_66;
        }
        uint64_t v102 = (uint64_t)v11;
        uint64_t v104 = (uint64_t)v9;
        uint64_t v17 = 0;
        unint64_t v18 = v15 & 0xC000000000000001;
        unint64_t v19 = v15;
        do
        {
          if (v18) {
            id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v20 = *(id *)(v15 + 8 * v17 + 32);
          }
          uint64_t v21 = v20;
          if (objc_msgSend(v20, "unitType", v72) == (id)16)
          {
          }
          else
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
          ++v17;
          unint64_t v15 = v19;
        }
        while (v16 != v17);
        swift_bridgeObjectRelease();
        unint64_t v15 = (unint64_t)v106;
        a1 = v91;
        int64_t v9 = (char *)v104;
        uint64_t v11 = (char *)v102;
LABEL_15:
        uint64_t v108 = (uint64_t)_swiftEmptyArrayStorage;
        if ((a1 & 0x8000000000000000) != 0) {
          goto LABEL_65;
        }
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v16) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v15 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v108 = (uint64_t)_swiftEmptyArrayStorage;
    if ((a1 & 0x8000000000000000) != 0)
    {
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      return;
    }
LABEL_16:
    uint64_t v75 = v15;
    if (!a1) {
      break;
    }
    uint64_t v22 = 0;
    uint64_t v98 = (void (**)(char *, void, uint64_t))(v11 + 104);
    long long v85 = (void (**)(char *, char *, uint64_t))(v5 + 16);
    unsigned int v97 = enum case for CalculateExpression.Base.base10(_:);
    uint64_t v84 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v23 = v75 & 0xFFFFFFFFFFFFFF8;
    uint64_t v87 = v75 & 0xFFFFFFFFFFFFFF8;
    if (v75 < 0) {
      uint64_t v23 = v75;
    }
    uint64_t v72 = v23;
    unint64_t v74 = v75 & 0xC000000000000001;
    uint64_t v73 = v75 + 32;
    Swift::Int v3 = (char *)&unk_100149B90;
    uint64_t v24 = (char *)&unk_100149B98;
    uint64_t v86 = (void (**)(char *, uint64_t))(v5 + 8);
    int64_t v9 = (char *)&protocol witness table for Int;
    while (1)
    {
      uint64_t v5 = v22 / 5uLL;
      Swift::Int v105 = (char *)v22;
      Swift::Int v106 = (void *)dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v107 = v25;
      if (v22 % 5uLL >= 5) {
        break;
      }
      uint64_t v26 = -80 * v5;
      uint64_t v5 = *(void *)&v3[-80 * v5];
      Swift::Int v27 = *(void **)&v24[v26];
      swift_bridgeObjectRetain();
      v28._countAndFlagsBits = v5;
      v28._object = v27;
      String.append(_:)(v28);
      swift_bridgeObjectRelease();
      if (__OFSUB__(a1, v22)) {
        goto LABEL_56;
      }
      uint64_t v104 = v22 + 1;
      Swift::Int v105 = (char *)(a1 - v22);
      v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v29);
      swift_bridgeObjectRelease();
      sub_1000DD044((uint64_t)_swiftEmptyArrayStorage);
      uint64_t v11 = v99;
      unint64_t v96 = *v98;
      v96(v99, v97, v100);
      UUID.init()();
      int64_t v9 = (char *)type metadata accessor for CalculateExpression();
      swift_allocObject();
      uint64_t v5 = CalculateExpression.init(_:options:base:id:)();
      uint64_t v30 = CalculateExpression.result.getter();
      if (v30)
      {
        uint64_t v11 = (char *)v30;
        Date.init(timeIntervalSinceNow:)();
        id v93 = v11;
        uint64_t v94 = v5;
        if (v90 & 1) == 0 || (v22)
        {
          char v48 = CalculateExpression.assumeDegrees.getter();
          uint64_t v102 = CalculateExpression.expression.getter();
          uint64_t v50 = v49;
          id v51 = [v11 formattedResult:v72];
          uint64_t v11 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v53 = v52;

          uint64_t v54 = v89;
          (*v85)(v89, v103, v95);
          BOOL v55 = v101;
          UUID.init()();
          uint64_t v56 = UUID.uuidString.getter();
          unint64_t v58 = v57;
          (*v84)(v55, v88);
          type metadata accessor for SchemaV1.HistoryRecord();
          swift_allocObject();
          sub_10007935C(v56, v58, 0x6669746E65696373, 0xEA00000000006369, 0, v48 & 1, v102, v50, (uint64_t)v11, v53, v54);
        }
        else
        {
          if ((unint64_t)v75 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v31) {
              goto LABEL_60;
            }
          }
          else
          {
            uint64_t v31 = *(void *)(v87 + 16);
            if (!v31) {
              goto LABEL_60;
            }
          }
          unint64_t v32 = v22 % v31;
          if (v74)
          {
            id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (v32 >= *(void *)(v87 + 16)) {
              goto LABEL_57;
            }
            id v33 = *(id *)(v73 + 8 * v32);
          }
          a1 = (unint64_t)v33;
          id v34 = [v33 units:v72];
          sub_10001CE8C(0, &qword_100157B78);
          unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v102 = v35;
          if (v35 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v36) {
              goto LABEL_61;
            }
          }
          else
          {
            uint64_t v36 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (!v36) {
              goto LABEL_61;
            }
          }
          unint64_t v37 = v22 % v36;
          if ((v102 & 0xC000000000000001) != 0)
          {
            unint64_t v44 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
            id v92 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v38 = v11;
            uint64_t v11 = *(char **)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v37 >= (unint64_t)v11) {
              goto LABEL_58;
            }
            uint64_t v5 = (uint64_t)v9;
            int64_t v9 = v3;
            Swift::Int v3 = v24;
            unint64_t v39 = a1;
            unint64_t v40 = (char *)(v102 + 32);
            unint64_t v41 = v104 % v36;
            id v42 = *(id *)(v102 + 32 + 8 * v37);
            if (v41 >= (unint64_t)v11) {
              goto LABEL_59;
            }
            id v43 = v42;
            id v92 = *(id *)&v40[8 * v41];
            swift_bridgeObjectRelease();
            uint64_t v11 = v38;
            unint64_t v44 = v43;
            a1 = v39;
            uint64_t v24 = v3;
            Swift::Int v3 = v9;
          }
          id v45 = [v44 category];
          id v83 = (id)a1;
          if (v45)
          {
            uint64_t v46 = v45;
            id v47 = [v45 unitType];

            BOOL v76 = v47 == (id)16;
          }
          else
          {
            BOOL v76 = 0;
          }
          [v11 setSynchronous:1];
          uint64_t v102 = (uint64_t)(id)CalculateResult.converted(to:from:)();
          CalculateExpression.error.getter();
          sub_1000DD044((uint64_t)_swiftEmptyArrayStorage);
          id v80 = v44;
          v96(v99, v97, v100);
          uint64_t v59 = v101;
          UUID.init()();
          unint64_t v96 = (void (*)(char *, void, uint64_t))CalculateExpression.__allocating_init(result:error:options:base:id:)();
          int v81 = CalculateExpression.assumeDegrees.getter();
          uint64_t v82 = CalculateExpression.expression.getter();
          uint64_t v79 = v60;
          uint64_t v78 = CalculateExpression.expression.getter();
          uint64_t v77 = v61;
          uint64_t v62 = v89;
          (*v85)(v89, v103, v95);
          uint64_t v63 = CalculateUnit.id.getter();
          uint64_t v65 = v64;
          uint64_t v66 = CalculateUnit.id.getter();
          uint64_t v11 = v67;
          UUID.init()();
          uint64_t v68 = UUID.uuidString.getter();
          unint64_t v70 = v69;
          (*v84)(v59, v88);
          type metadata accessor for SchemaV1.HistoryRecord();
          swift_allocObject();
          sub_100078A1C(v68, v70, 0x6669746E65696373, 0xEA00000000006369, 0, v76, v81 & 1, v82, v79, v78, v77, v62, v63, v65, v66, (uint64_t)v11);

          swift_release();
        }
        swift_retain();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        a1 = v91;
        int64_t v9 = (char *)&protocol witness table for Int;
        if (*(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_release();
        swift_release();

        (*v86)(v103, v95);
      }
      else
      {
        swift_release();
        int64_t v9 = (char *)&protocol witness table for Int;
      }
      v3 += 16;
      v24 += 16;
      uint64_t v22 = v104;
      if (a1 == v104) {
        goto LABEL_52;
      }
    }
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    swift_once();
  }
LABEL_52:
  swift_bridgeObjectRelease();
  uint64_t v71 = v108;
  if (qword_1001541A0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10004A108(v71, 1);
  swift_bridgeObjectRelease();
  swift_release();
}

ValueMetadata *type metadata accessor for DebugMenuModifier()
{
  return &type metadata for DebugMenuModifier;
}

uint64_t sub_1000E810C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v9 = a3[8];
    uint64_t v19 = a1 + v9;
    uint64_t v10 = (uint64_t)a2 + v9;
    *(void *)(a1 + 64) = a2[8];
    uint64_t v11 = type metadata accessor for Locale();
    unint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    v18(v19, v10, v11);
    uint64_t v12 = sub_100032FA0(&qword_100159640);
    *(void *)(v19 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
    uint64_t v13 = a3[10];
    *(void *)(v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v14 = v4 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
    *(void *)(v14 + 8) = *(void *)(v15 + 8);
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000E82BC(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_100032FA0(&qword_100159640);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1000E8390(uint64_t a1, uint64_t a2, int *a3)
{
  char v5 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v10 = type metadata accessor for Locale();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v16(v8, v9, v10);
  uint64_t v11 = sub_100032FA0(&qword_100159640);
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1000E84F0(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = sub_100032FA0(&qword_100159640);
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[10];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000E867C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v9 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = sub_100032FA0(&qword_100159640);
  *(void *)(v7 + *(int *)(v10 + 28)) = *(void *)(v8 + *(int *)(v10 + 28));
  uint64_t v11 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_1000E875C(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = sub_100032FA0(&qword_100159640);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  return a1;
}

uint64_t sub_1000E88A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E88B4);
}

uint64_t sub_1000E88B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100032FA0(&qword_100159640);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000E8968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E897C);
}

uint64_t sub_1000E897C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100159640);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000E8A28()
{
  sub_1000E8AE4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000E8AE4()
{
  if (!qword_1001596B0)
  {
    type metadata accessor for Locale();
    unint64_t v0 = type metadata accessor for State();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1001596B0);
    }
  }
}

uint64_t sub_1000E8B3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E8B58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E8B74@<X0>(char *a1@<X8>)
{
  return sub_1000E5260(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000E8B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DebugMenu();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E8BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DebugMenu();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E8C48()
{
  return sub_1000E91F8(sub_1000E5650);
}

uint64_t sub_1000E8C60@<X0>(char *a1@<X8>)
{
  return sub_1000E1CFC(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000E8C68@<X0>(char *a1@<X8>)
{
  return sub_1000E32DC(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000E8C70()
{
  return sub_1000E3D7C();
}

unint64_t sub_1000E8C78()
{
  unint64_t result = qword_1001597E8;
  if (!qword_1001597E8)
  {
    sub_1000317D8(&qword_1001597D8);
    sub_1000E8CEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001597E8);
  }
  return result;
}

unint64_t sub_1000E8CEC()
{
  unint64_t result = qword_1001597F0;
  if (!qword_1001597F0)
  {
    sub_1000317D8(&qword_1001597F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001597F0);
  }
  return result;
}

uint64_t sub_1000E8D5C()
{
  return sub_1000E91F8((uint64_t (*)(uint64_t))sub_1000E437C);
}

uint64_t sub_1000E8D74@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E47B0(a1);
}

uint64_t sub_1000E8D80()
{
  return sub_1000E91F8((uint64_t (*)(uint64_t))sub_1000E4994);
}

uint64_t sub_1000E8DA0()
{
  return swift_deallocObject();
}

uint64_t sub_1000E8DB4()
{
  return sub_1000E91F8(sub_1000E4F0C);
}

uint64_t sub_1000E8DCC()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000E8E08()
{
  return sub_1000E91F8((uint64_t (*)(uint64_t))sub_1000E5164);
}

uint64_t sub_1000E8E28(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_1001552B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154760 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_100161370;
  sub_100033344(a1, (uint64_t)v4, &qword_1001552B0);
  uint64_t v6 = type metadata accessor for Locale();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_100032F44((uint64_t)v4, &qword_1001552B0);
    uint64_t v8 = 0;
  }
  else
  {
    v12[0] = Locale.identifier.getter();
    v12[1] = v9;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
    uint64_t v8 = _bridgeAnythingToObjectiveC<A>(_:)();
    sub_1000910B4((uint64_t)v12);
  }
  NSString v10 = String._bridgeToObjectiveC()();
  [v5 setObject:v8 forKey:v10];
  swift_unknownObjectRelease();

  return sub_100032F44(a1, &qword_1001552B0);
}

void sub_1000E900C()
{
  sub_100042E24(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_1000E9028()
{
  sub_100042D40(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000E9044()
{
  return swift_deallocObject();
}

uint64_t sub_1000E9058()
{
  return sub_1000E91F8(sub_1000E291C);
}

uint64_t sub_1000E9070@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E2D68(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000E907C()
{
  return sub_1000E91F8(sub_1000E323C);
}

uint64_t sub_1000E9098()
{
  uint64_t v1 = (int *)(type metadata accessor for DebugMenu() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v2 + v1[10];
  uint64_t v4 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100032FA0(&qword_100159640);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000E91E0()
{
  return sub_1000E91F8(sub_1000E5E5C);
}

uint64_t sub_1000E91F8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for DebugMenu() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

void *initializeBufferWithCopyOfBuffer for CalculatorAppDebugMenuGesture(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *_s10Calculator17DebugMenuModifierVwca_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for CalculatorAppDebugMenuGesture(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for CalculatorAppDebugMenuGesture()
{
  return &type metadata for CalculatorAppDebugMenuGesture;
}

unint64_t sub_1000E9328()
{
  unint64_t result = qword_100159860;
  if (!qword_100159860)
  {
    sub_1000317D8(&qword_100159710);
    sub_100040BE4(&qword_100159868, &qword_100159700);
    sub_100040BE4((unint64_t *)&qword_100159870, &qword_100159878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159860);
  }
  return result;
}

unint64_t sub_1000E93F0()
{
  unint64_t result = qword_100159880;
  if (!qword_100159880)
  {
    sub_1000317D8(&qword_100159858);
    sub_100040BE4(&qword_100159888, &qword_100159850);
    sub_100040BE4(&qword_100159890, &qword_100159898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159880);
  }
  return result;
}

void *sub_1000E94B4()
{
  return &protocol witness table for Never;
}

unint64_t sub_1000E94C4()
{
  unint64_t result = qword_1001598A0;
  if (!qword_1001598A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001598A0);
  }
  return result;
}

unint64_t sub_1000E9518()
{
  unint64_t result = qword_1001598A8;
  if (!qword_1001598A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001598A8);
  }
  return result;
}

uint64_t type metadata accessor for Helper()
{
  return self;
}

id sub_1000E95A0(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v9 = objc_allocWithZone((Class)NSMutableAttributedString);
  swift_bridgeObjectRetain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithString:v10];

  uint64_t v12 = self;
  id v13 = [v12 systemFontOfSize:a1];
  [v11 addAttribute:NSFontAttributeName value:v13 range:0, [v11 length]];

  id v58 = [v12 systemFontOfSize:a1];
  if (a7)
  {
    sub_100032FA0(&qword_100159948);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10010DCB0;
    *(void *)(inited + 32) = kCTFontFeatureSettingsAttribute;
    sub_100032FA0(&qword_100159950);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10010DCB0;
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_100110A40;
    *(void *)(v16 + 32) = kCTFontFeatureTypeIdentifierKey;
    id v17 = objc_allocWithZone((Class)NSNumber);
    swift_bridgeObjectRetain();
    CFStringRef v18 = (id)kCTFontFeatureSettingsAttribute;
    CFStringRef v19 = (id)kCTFontFeatureTypeIdentifierKey;
    id v20 = [v17 initWithInteger:10];
    unint64_t v21 = sub_100090B24();
    *(void *)(v16 + 40) = v20;
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 72) = kCTFontFeatureSelectorIdentifierKey;
    id v22 = objc_allocWithZone((Class)NSNumber);
    CFStringRef v23 = (id)kCTFontFeatureSelectorIdentifierKey;
    id v24 = [v22 initWithInteger:2];
    *(void *)(v16 + 104) = v21;
    *(void *)(v16 + 80) = v24;
    *(void *)(v15 + 32) = sub_100070CCC(v16);
    *(void *)(inited + 64) = sub_100032FA0(&qword_100159958);
    *(void *)(inited + 40) = v15;
    sub_100070CCC(inited);
    uint64_t v25 = (const __CTFontDescriptor *)[v58 fontDescriptor];
    type metadata accessor for CFString(0);
    sub_1000E9CA4();
    CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v25, isa);

    [v58 pointSize];
    CTFontRef v29 = CTFontCreateWithFontDescriptor(CopyWithAttributes, v28, 0);
    id v30 = objc_allocWithZone((Class)NSMutableAttributedString);
    NSString v31 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v32 = [v30 initWithString:v31];

    id v33 = v29;
    [v32 addAttribute:NSFontAttributeName value:v33 range:0, [v32 length]];

    [v11 appendAttributedString:v32];
    id v34 = [self whiteColor];
    [v11 addAttribute:NSForegroundColorAttributeName value:v34 range:NSMakeRange(0, [v11 length])];
  }
  if (a5)
  {
    sub_100032FA0(&qword_100159948);
    uint64_t v35 = swift_initStackObject();
    *(_OWORD *)(v35 + 16) = xmmword_10010DCB0;
    *(void *)(v35 + 32) = kCTFontFeatureSettingsAttribute;
    sub_100032FA0(&qword_100159950);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_10010DCB0;
    uint64_t v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = xmmword_100110A40;
    *(void *)(v37 + 32) = kCTFontFeatureTypeIdentifierKey;
    id v38 = objc_allocWithZone((Class)NSNumber);
    swift_bridgeObjectRetain();
    CFStringRef v39 = (id)kCTFontFeatureSettingsAttribute;
    CFStringRef v40 = (id)kCTFontFeatureTypeIdentifierKey;
    id v41 = [v38 initWithInteger:10];
    unint64_t v42 = sub_100090B24();
    *(void *)(v37 + 40) = v41;
    *(void *)(v37 + 64) = v42;
    *(void *)(v37 + 72) = kCTFontFeatureSelectorIdentifierKey;
    id v43 = objc_allocWithZone((Class)NSNumber);
    CFStringRef v44 = (id)kCTFontFeatureSelectorIdentifierKey;
    id v45 = [v43 initWithInteger:1];
    *(void *)(v37 + 104) = v42;
    *(void *)(v37 + 80) = v45;
    *(void *)(v36 + 32) = sub_100070CCC(v37);
    *(void *)(v35 + 64) = sub_100032FA0(&qword_100159958);
    *(void *)(v35 + 40) = v36;
    sub_100070CCC(v35);
    uint64_t v46 = (const __CTFontDescriptor *)[v58 fontDescriptor];
    type metadata accessor for CFString(0);
    sub_1000E9CA4();
    CFDictionaryRef v47 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    char v48 = CTFontDescriptorCreateCopyWithAttributes(v46, v47);

    [v58 pointSize];
    CTFontRef v50 = CTFontCreateWithFontDescriptor(v48, v49, 0);
    id v51 = objc_allocWithZone((Class)NSMutableAttributedString);
    NSString v52 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v53 = [v51 initWithString:v52];

    uint64_t v54 = v50;
    [v53 addAttribute:NSFontAttributeName value:v54 range:0, [v53 length]];

    [v11 appendAttributedString:v53];
    id v55 = [self whiteColor];
    [v11 addAttribute:NSForegroundColorAttributeName value:v55 range:NSMakeRange(0, [v11 length])];
  }
  return v11;
}

unint64_t sub_1000E9CA4()
{
  unint64_t result = qword_100154910;
  if (!qword_100154910)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100154910);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for InsettableRoundendRectangle(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InsettableRoundendRectangle(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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

uint64_t sub_1000E9D48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E9DF4()
{
  return sub_100040BE4(&qword_100159998, &qword_1001599A0);
}

double sub_1000E9E30@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v11 = type metadata accessor for RoundedCornerStyle();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGRectInset(v21, -*(double *)(v5 + 8), -*(double *)(v5 + 16));
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for RoundedCornerStyle.circular(_:), v11);
  Path.init(roundedRect:cornerRadius:style:)();
  double result = *(double *)&v18;
  long long v16 = v19;
  *(_OWORD *)a1 = v18;
  *(_OWORD *)(a1 + 16) = v16;
  *(unsigned char *)(a1 + 32) = v20;
  return result;
}

uint64_t sub_1000E9F9C()
{
  return Shape.sizeThatFits(_:)();
}

uint64_t sub_1000E9FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000EA0C8();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000EA018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000EA0C8();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000EA07C(uint64_t a1)
{
  unint64_t v2 = sub_1000EA0C8();

  return Shape.body.getter(a1, v2);
}

unint64_t sub_1000EA0C8()
{
  unint64_t result = qword_1001599B8;
  if (!qword_1001599B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001599B8);
  }
  return result;
}

uint64_t assignWithCopy for CalculatorToolbar(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for CalculatorToolbar(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CalculatorToolbar(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CalculatorToolbar(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

void sub_1000EA2EC()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self iconWithSystemImageName:v0];

  qword_100161398 = (uint64_t)v1;
}

uint64_t sub_1000EA37C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v33 = a4;
  uint64_t v7 = type metadata accessor for TapGesture();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  NSString v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100032FA0(&qword_100159B58);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = *(unsigned char *)(a1 + 24);
  uint64_t v15 = swift_retain();
  uint64_t v16 = sub_100033AA8(v15, v14);
  swift_release();
  uint64_t v17 = *(void *)(v16 + 16);
  swift_getKeyPath();
  uint64_t v34 = v17;
  sub_1000332B4(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v18 = *(void *)(v17 + 32);
  swift_retain();
  swift_release();
  if (qword_100154548 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_100161150;
  type metadata accessor for CalculatorViewModel();
  sub_1000332B4((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  swift_retain();
  uint64_t v34 = Environment.init<A>(_:)();
  char v35 = v20 & 1;
  uint64_t v36 = v18;
  uint64_t v37 = 0;
  uint64_t v38 = v19;
  char v39 = 0;
  double v40 = a5;
  char v41 = 0;
  TapGesture.init(count:)();
  uint64_t v21 = *(void *)(a1 + 32);
  char v44 = *(unsigned char *)(a1 + 40);
  uint64_t v42 = *(void *)(a1 + 48);
  uint64_t v43 = v21;
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v30;
  *(void *)(v22 + 16) = v29;
  *(void *)(v22 + 24) = v23;
  long long v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v22 + 64) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v22 + 80) = v24;
  *(unsigned char *)(v22 + 96) = *(unsigned char *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v22 + 48) = v25;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_1000EAAD8;
  *(void *)(v26 + 24) = v22;
  swift_retain();
  swift_retain();
  sub_100025ED0((uint64_t)&v43);
  sub_100025ED0((uint64_t)&v42);
  swift_retain();
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  static GestureMask.all.getter();
  sub_100032FA0(&qword_100159B60);
  sub_1000EAB44();
  sub_100040BE4(qword_100159B78, &qword_100159B58);
  uint64_t v27 = v32;
  View.simultaneousGesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v27);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1000EA7D8()
{
  return swift_release();
}

uint64_t sub_1000EA854(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  char v2 = *(unsigned char *)(a1 + 24);
  uint64_t v3 = swift_retain();
  sub_100033AA8(v3, v2);
  sub_100033AA8(v1, v2);
  swift_release();
  swift_getKeyPath();
  sub_1000332B4(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_retain();
  swift_release();
  uint64_t v4 = CalculateExpression.expression.getter();
  sub_100056690(v4, v5, 0, 0, 0, 0);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000EA984(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 24);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_1000332B4((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000EAA84()
{
  return sub_10002F0CC();
}

uint64_t sub_1000EAA8C()
{
  return sub_1000EA984(v0 + 32);
}

uint64_t sub_1000EAAA8()
{
  return sub_10002F0CC();
}

uint64_t sub_1000EAAB0()
{
  return sub_10002F0CC();
}

uint64_t sub_1000EAAB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000EA37C(v1 + 32, *(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(double *)(v1 + 104));
}

uint64_t sub_1000EAAD0()
{
  return sub_10002F0CC();
}

uint64_t sub_1000EAAD8()
{
  return sub_1000EA7D8();
}

uint64_t sub_1000EAAE4()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000EAB1C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1000EAB44()
{
  unint64_t result = qword_100159B68;
  if (!qword_100159B68)
  {
    sub_1000317D8(&qword_100159B60);
    sub_10001BD50();
    sub_100040BE4(&qword_100155380, &qword_100155388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159B68);
  }
  return result;
}

uint64_t sub_1000EABE4()
{
  return sub_1000EA854(*(void *)(v0 + 32));
}

uint64_t sub_1000EAC0C()
{
  type metadata accessor for Optional();
  type metadata accessor for ModifiedContent();
  sub_1000317D8(&qword_1001557C0);
  type metadata accessor for ModifiedContent();
  sub_1000317D8(&qword_100159A80);
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for HStack();

  return swift_getWitnessTable();
}

uint64_t sub_1000EACF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    uint64_t v7 = a2[2];
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    char v8 = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 24) = v8;
    char v9 = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = v9;
    char v10 = *((unsigned char *)a2 + 56);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = v10;
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    *(void *)(a1 + 72) = a2[9];
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    uint64_t v11 = a2[12];
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = v11;
    *(void *)(a1 + 104) = a2[13];
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    uint64_t v12 = *(int *)(a3 + 68);
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v15 = sub_100032FA0(&qword_100156688);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_1000EAE80(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 68);
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000EAF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v6;
  char v7 = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v9 = *(int *)(a3 + 68);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000EB070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  char v8 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v8;
  swift_retain();
  swift_release();
  char v9 = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v9;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v10 = *(int *)(a3 + 68);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_1000EB1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v5 = *(int *)(a3 + 68);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v8 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_1000EB2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  char v6 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v6;
  swift_release();
  char v7 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v7;
  swift_release();
  char v8 = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v8;
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  uint64_t v9 = *(int *)(a3 + 68);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000EB3F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000EB40C);
}

uint64_t sub_1000EB40C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100032FA0(&qword_100156688);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 68);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000EB4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000EB4D4);
}

void *sub_1000EB4D4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    int *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100156688);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 68);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000EB580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000EB5C4()
{
  char v1 = *(unsigned char *)(v0 + 40);
  uint64_t v2 = swift_retain();
  sub_1000D1928(v2, v1);
  swift_release();
  uint64_t v3 = sub_100073414();
  swift_release();
  return v3;
}

BOOL sub_1000EB618()
{
  uint64_t v0 = sub_1000EB5C4();
  swift_getKeyPath();
  sub_1000332FC(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v1 = *(id *)(v0 + 32);
  swift_release();
  id v2 = [v1 unitType];

  return v2 == (id)16;
}

uint64_t sub_1000EB6EC()
{
  sub_100032FA0(&qword_100157850);
  FocusState.Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_1000EB73C()
{
  return FocusState.Binding.wrappedValue.setter();
}

uint64_t sub_1000EB790()
{
  sub_100032FA0(&qword_100157850);
  FocusState.Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_1000EB7E4()
{
  if (qword_100154548 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  swift_retain();
  swift_release();
  swift_getKeyPath();
  sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_release();
  return Color.opacity(_:)();
}

double sub_1000EB910()
{
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  return v1;
}

double sub_1000EB954()
{
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  return v1 / 100.0;
}

uint64_t sub_1000EB9A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v51 = a2;
  sub_1000317D8(&qword_100159C00);
  uint64_t v50 = *(void *)(a1 + 16);
  type metadata accessor for Optional();
  type metadata accessor for ModifiedContent();
  sub_1000317D8(&qword_1001557C0);
  type metadata accessor for ModifiedContent();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for VStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for ZStack();
  sub_1000317D8(&qword_100159C08);
  swift_getTupleTypeMetadata2();
  uint64_t v5 = type metadata accessor for TupleView();
  v45[1] = swift_getWitnessTable();
  v45[2] = v5;
  uint64_t v6 = type metadata accessor for HStack();
  uint64_t v48 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v45 - v7;
  uint64_t v9 = type metadata accessor for ModifiedContent();
  uint64_t v49 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v46 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v47 = (uint64_t)v45 - v12;
  char v13 = *(unsigned char *)(v2 + 56);
  uint64_t v14 = swift_retain();
  sub_10002BD88(v14, v13);
  swift_release();
  if (sub_10002AC18())
  {
    swift_release();
    double v15 = -5.0;
  }
  else
  {
    sub_10002AFEC();
    double v16 = sub_10002B3E4();
    id v17 = [self mainScreen];
    [v17 bounds];
    double v19 = v18;
    swift_release();

    if (v16 / v19 == 0.0) {
      double v15 = 2.0;
    }
    else {
      double v15 = v16 / v19 * 4.0;
    }
  }
  uint64_t v20 = swift_retain();
  uint64_t v21 = sub_10002BD88(v20, v13);
  swift_release();
  char v22 = *(unsigned char *)(v2 + 24);
  uint64_t v23 = swift_retain();
  uint64_t v24 = sub_100033AA8(v23, v22);
  swift_release();
  swift_getKeyPath();
  uint64_t v54 = v24;
  sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v25 = *(unsigned __int8 *)(v24 + 48);
  swift_release();
  char v26 = 1;
  switch(v25)
  {
    case 1:
    case 2:
    case 3:
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  double v27 = sub_10002B26C(v21, v26 & 1);
  char v28 = sub_1000298D0();
  double v29 = 60.0;
  if (v27 >= 60.0) {
    double v29 = v27;
  }
  double v30 = 70.0;
  if (v27 >= 70.0) {
    double v30 = v27;
  }
  if (v28) {
    double v29 = v30;
  }
  double v31 = (v29 - v15) * 0.5;
  double v32 = sub_10002B248();
  swift_release();
  if (v32 * 0.25 < v31) {
    double v31 = v32 * 0.25;
  }
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  char v33 = *(unsigned char *)(v3 + 56);
  uint64_t v34 = swift_retain();
  sub_10002BD88(v34, v33);
  swift_release();
  uint64_t v35 = sub_1000D6C50();
  uint64_t v36 = swift_release();
  if (qword_1001541B8 != -1) {
    uint64_t v36 = swift_once();
  }
  double v37 = __chkstk_darwin(v36);
  uint64_t v38 = *(void *)(a1 + 24);
  v45[-8] = v50;
  v45[-7] = v38;
  v45[-6] = v3;
  *(double *)&v45[-5] = v37;
  *(double *)&v45[-4] = v31;
  v45[-3] = v35;
  v45[-2] = v39;
  static VerticalAlignment.center.getter();
  HStack.init(alignment:spacing:content:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v41 = (uint64_t)v46;
  View.fixedSize(horizontal:vertical:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v6);
  uint64_t v52 = WitnessTable;
  id v53 = &protocol witness table for _FixedSizeLayout;
  swift_getWitnessTable();
  uint64_t v42 = v47;
  sub_10001BAFC(v41, v9, v47);
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
  v43(v41, v9);
  sub_10001BAFC(v42, v9, v51);
  return ((uint64_t (*)(uint64_t, uint64_t))v43)(v42, v9);
}

uint64_t sub_1000EC0FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>)
{
  uint64_t v84 = a4;
  uint64_t v71 = (char *)a2;
  uint64_t v83 = a5;
  uint64_t v13 = sub_100032FA0(&qword_100159C10);
  __chkstk_darwin(v13 - 8);
  double v15 = (double *)((char *)v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = sub_100032FA0(&qword_100159C18);
  __chkstk_darwin(v85);
  id v17 = (char *)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100032FA0(&qword_100159C08);
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  id v80 = (char *)v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v78 = (char *)v66 - v20;
  __chkstk_darwin(v21);
  uint64_t v79 = (char *)v66 - v22;
  sub_1000317D8(&qword_100159C00);
  type metadata accessor for Optional();
  type metadata accessor for ModifiedContent();
  sub_1000317D8(&qword_1001557C0);
  type metadata accessor for ModifiedContent();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  type metadata accessor for VStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v23 = type metadata accessor for ZStack();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  char v26 = (char *)v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  double v29 = (char *)v66 - v28;
  static Alignment.leading.getter();
  uint64_t v86 = a3;
  uint64_t v87 = v84;
  uint64_t v88 = a1;
  double v89 = a6;
  ZStack.init(alignment:content:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v75 = v29;
  uint64_t v70 = WitnessTable;
  sub_10001BAFC((uint64_t)v26, v23, (uint64_t)v29);
  uint64_t v72 = v24;
  double v31 = *(uint64_t (**)(char *, uint64_t))(v24 + 8);
  BOOL v76 = v26;
  uint64_t v77 = v23;
  uint64_t v74 = v24 + 8;
  uint64_t v73 = v31;
  v31(v26, v23);
  uint64_t v32 = static HorizontalAlignment.trailing.getter();
  char v33 = *(unsigned char *)(a1 + 56);
  uint64_t v34 = swift_retain();
  sub_10002BD88(v34, v33);
  swift_release();
  if (sub_10002AC18())
  {
    swift_release();
    double v35 = -5.0;
  }
  else
  {
    sub_10002AFEC();
    double v36 = sub_10002B3E4();
    id v37 = [self mainScreen];
    [v37 bounds];
    double v39 = v38;
    swift_release();

    double v35 = 2.0;
    if (v36 / v39 != 0.0) {
      double v35 = v36 / v39 * 4.0;
    }
  }
  *(void *)double v15 = v32;
  v15[1] = v35;
  *((unsigned char *)v15 + 16) = 0;
  uint64_t v40 = sub_100032FA0(&qword_100159C20);
  sub_1000EDCE8(a1, (uint64_t)v71, a3, v84, (uint64_t)v15 + *(int *)(v40 + 44), a7, a8);
  uint64_t v41 = static Alignment.center.getter();
  uint64_t v43 = v42;
  uint64_t v44 = (uint64_t)&v17[*(int *)(v85 + 36)];
  sub_1000F29C0(a1, v44);
  id v45 = (uint64_t *)(v44 + *(int *)(sub_100032FA0(&qword_100159C28) + 36));
  uint64_t *v45 = v41;
  v45[1] = v43;
  sub_10002D9D0((uint64_t)v15, (uint64_t)v17, &qword_100159C10);
  uint64_t v69 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v71 = v17;
  int v68 = v46;
  uint64_t v47 = *(char **)(a1 + 88);
  LOBYTE(v99) = *(unsigned char *)(a1 + 80);
  uint64_t v100 = v47;
  sub_100032FA0(&qword_100154898);
  uint64_t v48 = State.projectedValue.getter();
  char v67 = v66;
  v66[1] = v92;
  __chkstk_darwin(v48);
  uint64_t v49 = sub_100032FA0(&qword_100159C30);
  unint64_t v50 = sub_1000F4A50();
  uint64_t v51 = sub_1000317D8(&qword_1001555F0);
  uint64_t v52 = sub_100040BE4(&qword_100156428, &qword_1001555F0);
  uint64_t v90 = v51;
  uint64_t v91 = v52;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  id v53 = v78;
  uint64_t v54 = (uint64_t)v71;
  View.alert<A, B>(_:isPresented:actions:message:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_100032F44(v54, &qword_100159C18);
  uint64_t v55 = v81;
  uint64_t v56 = v79;
  uint64_t v57 = v82;
  (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v79, v53, v82);
  id v58 = v76;
  uint64_t v59 = v75;
  uint64_t v60 = v77;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v76, v75, v77);
  uint64_t v99 = v58;
  uint64_t v61 = v80;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v80, v56, v57);
  uint64_t v100 = v61;
  v98[0] = v60;
  v98[1] = v57;
  uint64_t v96 = v70;
  uint64_t v90 = v85;
  uint64_t v91 = v49;
  id v92 = &type metadata for Text;
  unint64_t v93 = v50;
  uint64_t v94 = OpaqueTypeConformance2;
  uint64_t v95 = &protocol witness table for Text;
  uint64_t v97 = swift_getOpaqueTypeConformance2();
  sub_100025EFC((uint64_t)&v99, 2uLL, (uint64_t)v98);
  uint64_t v62 = *(void (**)(char *, uint64_t))(v55 + 8);
  v62(v56, v57);
  uint64_t v63 = v73;
  v73(v59, v60);
  v62(v61, v57);
  return v63(v58, v60);
}

uint64_t sub_1000EC9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t WitnessTable = a1;
  uint64_t v37 = a4;
  type metadata accessor for Optional();
  type metadata accessor for ModifiedContent();
  sub_1000317D8(&qword_1001557C0);
  type metadata accessor for ModifiedContent();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v8 = type metadata accessor for VStack();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  double v38 = (char *)&v34 - v13;
  uint64_t v34 = sub_100032FA0(&qword_100159C00);
  uint64_t v14 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  double v39 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = type metadata accessor for CalculatorUnitConversionDisplayView();
  double v35 = v18;
  uint64_t v20 = WitnessTable;
  sub_1000ECE84(v19, (uint64_t)v18);
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v42 = v20;
  double v43 = a5;
  static HorizontalAlignment.center.getter();
  VStack.init(alignment:spacing:content:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v21 = (uint64_t)v38;
  sub_10001BAFC((uint64_t)v11, v8, (uint64_t)v38);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v11, v8);
  uint64_t v23 = v39;
  uint64_t v24 = v18;
  uint64_t v25 = v34;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v39, v24, v34);
  v49[0] = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v21, v8);
  v49[1] = v11;
  v48[0] = v25;
  v48[1] = v8;
  uint64_t v26 = sub_1000317D8(&qword_100159E18);
  uint64_t v27 = type metadata accessor for HighlightHoverEffect();
  uint64_t v28 = sub_1000317D8(&qword_100159E20);
  uint64_t v29 = sub_1000F507C(&qword_100159E28, &qword_100159E20, (void (*)(void))sub_1000F5DB0);
  uint64_t v44 = v28;
  uint64_t v45 = v29;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = sub_1000332FC(&qword_100159990, (void (*)(uint64_t))&type metadata accessor for HighlightHoverEffect);
  uint64_t v44 = v26;
  uint64_t v45 = v27;
  uint64_t v46 = OpaqueTypeConformance2;
  uint64_t v47 = v31;
  uint64_t v44 = swift_getOpaqueTypeConformance2();
  uint64_t v45 = WitnessTable;
  sub_100025EFC((uint64_t)v49, 2uLL, (uint64_t)v48);
  v22(v38, v8);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v14 + 8);
  v32(v35, v25);
  v22(v11, v8);
  return ((uint64_t (*)(char *, uint64_t))v32)(v39, v25);
}

uint64_t sub_1000ECE84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v75 = a2;
  uint64_t v5 = type metadata accessor for HighlightHoverEffect();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v77 = v5;
  __chkstk_darwin(v5);
  uint64_t v74 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for PlainButtonStyle();
  uint64_t v67 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v66 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v10);
  uint64_t v60 = sub_100032FA0(&qword_100155828);
  uint64_t v11 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100032FA0(&qword_100159E40);
  __chkstk_darwin(v61);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100032FA0(&qword_100159E50);
  uint64_t v63 = *(void *)(v16 - 8);
  uint64_t v64 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100032FA0(&qword_100159E38);
  __chkstk_darwin(v62);
  uint64_t v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100032FA0(&qword_100159E20);
  __chkstk_darwin(v70);
  uint64_t v65 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  int v68 = (char *)&v60 - v23;
  uint64_t v24 = sub_100032FA0(&qword_100159E18);
  uint64_t v72 = *(void *)(v24 - 8);
  uint64_t v73 = v24;
  double v25 = __chkstk_darwin(v24);
  uint64_t v71 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 16))((char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1, v25);
  unint64_t v27 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = *(_OWORD *)(a1 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_100032FA0(&qword_100155850);
  uint64_t v29 = sub_1000317D8(&qword_100155858);
  uint64_t v30 = sub_100040BE4(&qword_100155860, &qword_100155858);
  uint64_t v78 = &type metadata for Image;
  uint64_t v79 = v29;
  id v80 = &protocol witness table for Image;
  uint64_t v81 = v30;
  swift_getOpaqueTypeConformance2();
  Button.init(action:label:)();
  if (qword_100154648 != -1) {
    swift_once();
  }
  uint64_t v31 = qword_100161250;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v60;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v60);
  uint64_t v34 = (uint64_t *)&v15[*(int *)(v61 + 36)];
  *uint64_t v34 = KeyPath;
  v34[1] = v31;
  double v35 = *(void (**)(char *, uint64_t))(v11 + 8);
  swift_retain();
  v35(v13, v33);
  double v36 = v66;
  PlainButtonStyle.init()();
  sub_1000F5ED0(&qword_100159E48, &qword_100159E40, &qword_100155870, &qword_100155828);
  sub_1000332FC(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v37 = v69;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v36, v37);
  sub_100032F44((uint64_t)v15, &qword_100159E40);
  uint64_t v39 = v63;
  uint64_t v38 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v20, v18, v64);
  uint64_t v40 = &v20[*(int *)(v62 + 36)];
  __asm { FMOV            V0.2D, #8.0 }
  *(_OWORD *)uint64_t v40 = _Q0;
  *((_OWORD *)v40 + 1) = xmmword_10010F200;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v38);
  sub_1000F5DB0();
  uint64_t v46 = (uint64_t)v65;
  View.accessibilityIdentifier(_:)();
  sub_100032F44((uint64_t)v20, &qword_100159E38);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v47 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v49 = v48;
  char v51 = v50 & 1;
  uint64_t v52 = (uint64_t)v68;
  id v53 = (void *)v70;
  ModifiedContent<>.accessibilityLabel(_:)();
  sub_1000356E0(v47, v49, v51);
  swift_bridgeObjectRelease();
  sub_100032F44(v46, &qword_100159E20);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v54 = sub_1000F507C(&qword_100159E28, &qword_100159E20, (void (*)(void))sub_1000F5DB0);
  uint64_t v55 = v71;
  View.help(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100032F44(v52, &qword_100159E20);
  uint64_t v56 = v74;
  static CustomHoverEffect<>.highlight.getter();
  uint64_t v78 = v53;
  uint64_t v79 = v54;
  swift_getOpaqueTypeConformance2();
  sub_1000332FC(&qword_100159990, (void (*)(uint64_t))&type metadata accessor for HighlightHoverEffect);
  uint64_t v57 = v73;
  uint64_t v58 = v77;
  View.hoverEffect<A>(_:isEnabled:)();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v56, v58);
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v55, v57);
}

uint64_t sub_1000ED7F4@<X0>(void (**a1)(double)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v5 = sub_100032FA0(&qword_1001568C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = type metadata accessor for ModifiedContent();
  uint64_t v35 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v33 - v12;
  sub_1000317D8(&qword_1001557C0);
  uint64_t v14 = type metadata accessor for ModifiedContent();
  uint64_t v36 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v37 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v33 - v17;
  double v20 = __chkstk_darwin(v19);
  uint64_t v33 = (uint64_t)&v33 - v21;
  (*a1)(v20);
  static Edge.Set.bottom.getter();
  v44[6] = a2;
  uint64_t WitnessTable = swift_getWitnessTable();
  View.padding(_:_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v23 = type metadata accessor for Font.Design();
  uint64_t v24 = (uint64_t)v34;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v34, 1, 1, v23);
  static Font.system(size:weight:design:)();
  sub_100032F44(v24, &qword_1001568C0);
  v44[4] = WitnessTable;
  v44[5] = &protocol witness table for _PaddingLayout;
  uint64_t v25 = swift_getWitnessTable();
  View.font(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v11);
  uint64_t v26 = sub_100040BE4((unint64_t *)&qword_1001557B8, &qword_1001557C0);
  v44[2] = v25;
  v44[3] = v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = v33;
  sub_10001BAFC((uint64_t)v18, v14, v33);
  uint64_t v29 = v36;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v36 + 8);
  v30(v18, v14);
  uint64_t v42 = 0;
  char v43 = 1;
  v44[0] = &v42;
  uint64_t v31 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v37, v28, v14);
  v44[1] = v31;
  v41[0] = &type metadata for Spacer;
  v41[1] = v14;
  uint64_t v39 = &protocol witness table for Spacer;
  uint64_t v40 = v27;
  sub_100025EFC((uint64_t)v44, 2uLL, (uint64_t)v41);
  v30((char *)v28, v14);
  return ((uint64_t (*)(char *, uint64_t))v30)(v31, v14);
}

uint64_t sub_1000EDCE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v151 = a2;
  uint64_t v131 = a5;
  uint64_t v132 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v130 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  uint64_t v129 = (char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a4;
  uint64_t v140 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v14 = *(void *)(v140 - 8);
  uint64_t v150 = *(void *)(v14 + 64);
  __chkstk_darwin(v140);
  uint64_t v16 = (char *)&v116 - v15;
  uint64_t v17 = sub_100032FA0(&qword_100159D28);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v116 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_100032FA0(&qword_100159D30) - 8;
  __chkstk_darwin(v117);
  uint64_t v133 = (uint64_t)&v116 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = (int *)sub_100032FA0(&qword_100159D38);
  __chkstk_darwin(v135);
  uint64_t OpaqueTypeConformance2 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100032FA0(&qword_100159D40);
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v136 = (char *)&v116 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_100032FA0(&qword_100159D48);
  uint64_t v120 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  uint64_t v137 = (char *)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_100032FA0(&qword_100159D50);
  uint64_t v122 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v138 = (char *)&v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100032FA0(&qword_100159D58);
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  uint64_t v139 = (char *)&v116 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100032FA0(&qword_100159D60);
  uint64_t v127 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v123 = (char *)&v116 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = static Alignment.bottomTrailing.getter();
  uint64_t v29 = v28;
  char v30 = *(unsigned char *)(a1 + 56);
  uint64_t v31 = swift_retain();
  sub_10002BD88(v31, v30);
  swift_release();
  sub_1000D6AB8();
  uint64_t v33 = v32;
  swift_release();
  *(void *)uint64_t v19 = v27;
  *((void *)v19 + 1) = v29;
  *((void *)v19 + 2) = v33;
  v19[24] = 0;
  *((void *)v19 + 4) = 0;
  v19[40] = 1;
  uint64_t v116 = v19;
  uint64_t v34 = (uint64_t)&v19[*(int *)(sub_100032FA0(&qword_100159D68) + 44)];
  uint64_t v144 = a1;
  uint64_t v35 = a3;
  uint64_t v146 = a3;
  uint64_t v147 = v13;
  uint64_t v36 = v13;
  sub_1000EEED4(a1, v151, a3, v13, v34, a6, a7);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v141 = v16;
  uint64_t v38 = v140;
  v37(v16, a1, v140);
  uint64_t v39 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v40 = (v39 + 32) & ~v39;
  v150 += v40;
  uint64_t v41 = v39 | 7;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v35;
  *(void *)(v42 + 24) = v36;
  char v43 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v43(v42 + v40, v16, v38);
  uint64_t v44 = (uint64_t)v116;
  uint64_t v45 = v133;
  sub_100033344((uint64_t)v116, v133, &qword_100159D28);
  uint64_t v46 = (uint64_t (**)())(v45 + *(int *)(v117 + 44));
  char *v46 = sub_1000F5158;
  v46[1] = (uint64_t (*)())v42;
  v46[2] = 0;
  v46[3] = 0;
  sub_100032F44(v44, &qword_100159D28);
  uint64_t v48 = v140;
  uint64_t v47 = v141;
  __int16 v149 = v37;
  uint64_t v143 = v14 + 16;
  v37(v141, v144, v140);
  uint64_t v49 = v146;
  uint64_t v151 = v41;
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = v147;
  *(void *)(v50 + 16) = v49;
  *(void *)(v50 + 24) = v51;
  uint64_t v142 = v40;
  uint64_t v52 = v47;
  uint64_t v148 = v43;
  uint64_t v145 = v14 + 32;
  v43(v50 + v40, v47, v48);
  uint64_t v53 = v133;
  uint64_t v54 = (uint64_t)OpaqueTypeConformance2;
  sub_100033344(v133, (uint64_t)OpaqueTypeConformance2, &qword_100159D30);
  uint64_t v55 = (void *)(v54 + v135[9]);
  *uint64_t v55 = 0;
  v55[1] = 0;
  v55[2] = sub_1000F5174;
  v55[3] = v50;
  sub_100032F44(v53, &qword_100159D30);
  if (qword_100154718 != -1) {
    swift_once();
  }
  uint64_t v56 = qword_100161330;
  swift_getKeyPath();
  uint64_t v153 = v56;
  sub_1000332FC((unint64_t *)&qword_100154FD8, (void (*)(uint64_t))type metadata accessor for CalculatorNetworkManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LOBYTE(v153) = *(unsigned char *)(v56 + 16);
  uint64_t v57 = v144;
  uint64_t v58 = v149;
  v149(v52, v144, v48);
  uint64_t v59 = v58;
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = v49;
  uint64_t v61 = v147;
  *(void *)(v60 + 24) = v147;
  v148(v60 + v142, v52, v48);
  uint64_t v133 = sub_1000F5934(&qword_100159D70, &qword_100159D38, (void (*)(void))sub_1000F520C);
  uint64_t v62 = v135;
  uint64_t v63 = (uint64_t)OpaqueTypeConformance2;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_100032F44(v63, &qword_100159D38);
  uint64_t v64 = *(void *)(sub_1000EB5C4() + 24);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v153 = v64;
  sub_1000332FC(&qword_100154F68, (void (*)(uint64_t))type metadata accessor for CalculatorCurrencyCacheProvider);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LOBYTE(v63) = *(unsigned char *)(v64 + OBJC_IVAR____TtC10Calculator31CalculatorCurrencyCacheProvider__isCurrencyCacheLoaded);
  swift_release();
  LOBYTE(v152) = v63;
  uint64_t v65 = v52;
  v59(v52, v57, v48);
  uint64_t v66 = swift_allocObject();
  uint64_t v67 = v146;
  *(void *)(v66 + 16) = v146;
  *(void *)(v66 + 24) = v61;
  v148(v66 + v142, v65, v48);
  uint64_t v153 = (uint64_t)v62;
  char v154 = &type metadata for Bool;
  uint64_t v155 = v133;
  long long v156 = &protocol witness table for Bool;
  uint64_t v135 = (int *)&opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>;
  uint64_t OpaqueTypeConformance2 = (char *)swift_getOpaqueTypeConformance2();
  uint64_t v68 = v119;
  uint64_t v69 = v136;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v118 + 8))(v69, v68);
  uint64_t v70 = v48;
  uint64_t v71 = sub_1000EB5C4();
  swift_getKeyPath();
  uint64_t v153 = v71;
  sub_1000332FC(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v72 = *(id *)(v71 + 32);
  swift_release();
  id v152 = v72;
  uint64_t v73 = v141;
  uint64_t v74 = v57;
  v149(v141, v57, v48);
  uint64_t v75 = swift_allocObject();
  uint64_t v76 = v147;
  *(void *)(v75 + 16) = v67;
  *(void *)(v75 + 24) = v76;
  uint64_t v77 = v142;
  uint64_t v78 = v73;
  uint64_t v79 = v70;
  id v80 = v148;
  v148(v75 + v142, v73, v79);
  uint64_t v81 = v77;
  uint64_t v136 = (char *)sub_1000F5338();
  uint64_t v153 = v68;
  char v154 = &type metadata for Bool;
  uint64_t v155 = (uint64_t)OpaqueTypeConformance2;
  long long v156 = &protocol witness table for Bool;
  uint64_t v135 = (int *)swift_getOpaqueTypeConformance2();
  uint64_t v82 = sub_1000332FC(&qword_100159D88, (void (*)(uint64_t))sub_1000F5338);
  uint64_t v83 = v121;
  uint64_t v84 = v137;
  View.onChange<A>(of:initial:_:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v120 + 8))(v84, v83);
  uint64_t v85 = v74;
  LOBYTE(v71) = *(unsigned char *)(v74 + 24);
  uint64_t v86 = swift_retain();
  uint64_t v87 = sub_100033AA8(v86, v71);
  swift_release();
  swift_getKeyPath();
  uint64_t v153 = v87;
  sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LOBYTE(v84) = *(unsigned char *)(v87 + 53);
  swift_release();
  LOBYTE(v152) = (_BYTE)v84;
  uint64_t v88 = v140;
  v149(v78, v85, v140);
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = v146;
  *(void *)(v89 + 24) = v76;
  v80(v89 + v81, v78, v88);
  uint64_t OpaqueTypeConformance2 = (char *)sub_100032FA0(&qword_100156B88);
  uint64_t v153 = v83;
  char v154 = v136;
  uint64_t v155 = (uint64_t)v135;
  long long v156 = (void *)v82;
  uint64_t v137 = (char *)&opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>;
  uint64_t v90 = swift_getOpaqueTypeConformance2();
  uint64_t v91 = sub_100029018(&qword_100156BA8, (void (*)(void))sub_10003C470);
  uint64_t v92 = v81;
  unint64_t v93 = v141;
  uint64_t v94 = v88;
  uint64_t v95 = v144;
  uint64_t v96 = v124;
  uint64_t v97 = v138;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v97, v96);
  LOBYTE(v152) = sub_1000EB6EC();
  v149(v93, v95, v88);
  uint64_t v98 = swift_allocObject();
  uint64_t v99 = v147;
  *(void *)(v98 + 16) = v146;
  *(void *)(v98 + 24) = v99;
  v148(v98 + v92, v93, v88);
  uint64_t v153 = v96;
  char v154 = OpaqueTypeConformance2;
  uint64_t v155 = v90;
  long long v156 = (void *)v91;
  swift_getOpaqueTypeConformance2();
  uint64_t v100 = v123;
  uint64_t v101 = v126;
  uint64_t v102 = v139;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v125 + 8))(v102, v101);
  id v103 = [self defaultCenter];
  if (qword_100154508 != -1) {
    swift_once();
  }
  uint64_t v104 = v129;
  NSNotificationCenter.publisher(for:object:)();

  Swift::Int v105 = v141;
  v149(v141, v144, v94);
  uint64_t v106 = swift_allocObject();
  uint64_t v107 = v147;
  *(void *)(v106 + 16) = v146;
  *(void *)(v106 + 24) = v107;
  v148(v106 + v142, v105, v94);
  uint64_t v108 = v127;
  uint64_t v109 = v131;
  uint64_t v110 = v128;
  (*(void (**)(uint64_t, char *, uint64_t))(v127 + 16))(v131, v100, v128);
  uint64_t v111 = sub_100032FA0(&qword_100159D90);
  uint64_t v112 = v130;
  uint64_t v113 = v132;
  (*(void (**)(uint64_t, char *, uint64_t))(v130 + 16))(v109 + *(int *)(v111 + 52), v104, v132);
  uint64_t v114 = (void (**)())(v109 + *(int *)(v111 + 56));
  *uint64_t v114 = sub_1000F546C;
  v114[1] = (void (*)())v106;
  (*(void (**)(char *, uint64_t))(v112 + 8))(v104, v113);
  return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v100, v110);
}

uint64_t sub_1000EEED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v85 = a2;
  uint64_t v83 = a5;
  uint64_t v12 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  uint64_t v84 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v67 - v16;
  uint64_t v18 = sub_100032FA0(&qword_100159D98);
  __chkstk_darwin(v18 - 8);
  uint64_t v82 = (uint64_t)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v81 = (uint64_t)&v67 - v21;
  __chkstk_darwin(v22);
  id v80 = (char *)&v67 - v23;
  double v25 = __chkstk_darwin(v24);
  uint64_t v90 = (uint64_t)&v67 - v26;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v88 = v13 + 16;
  uint64_t v89 = v27;
  uint64_t v73 = v17;
  uint64_t v68 = a1;
  ((void (*)(char *, uint64_t, uint64_t, double))v27)(v17, a1, v12, v25);
  uint64_t v28 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v29 = (v28 + 32) & ~v28;
  uint64_t v91 = v28 | 7;
  unint64_t v30 = (v14 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v79 = v30 + 8;
  uint64_t v31 = swift_allocObject();
  uint64_t v87 = a3;
  *(void *)(v31 + 16) = a3;
  *(void *)(v31 + 24) = a4;
  uint64_t v69 = a4;
  uint64_t v67 = v31;
  uint64_t v70 = v29;
  uint64_t v32 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v32(v31 + v29, v17, v12);
  uint64_t v72 = v13 + 32;
  uint64_t v71 = v32;
  *(double *)(v31 + v30) = a6;
  uint64_t v33 = v84;
  uint64_t v34 = v12;
  v89(v84, a1, v12);
  unint64_t v86 = v30;
  unint64_t v77 = ((v30 + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v78 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = a3;
  *(void *)(v35 + 24) = a4;
  v32(v35 + v29, v33, v34);
  *(void *)(v35 + v30) = v85;
  *(double *)(v35 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = a7;
  double v76 = a6;
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v94 = sub_1000F552C;
  uint64_t v95 = v67;
  uint64_t v96 = sub_1000F5548;
  uint64_t v97 = v35;
  unint64_t v98 = v103;
  char v99 = v104;
  uint64_t v100 = v105;
  char v101 = v106;
  long long v102 = v107;
  unint64_t v108 = 0;
  unint64_t v109 = 0xE000000000000000;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  unint64_t v108 = 0xD000000000000019;
  unint64_t v109 = 0x800000010010B560;
  uint64_t v36 = v68;
  sub_1000EB5C4();
  id v37 = sub_100071234();
  swift_release();
  id v38 = [v37 name];

  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v41 = v40;

  v42._countAndFlagsBits = v39;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  uint64_t v75 = sub_100032FA0(&qword_100159DA0);
  unint64_t v74 = sub_1000F5560();
  View.accessibilityIdentifier(_:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  char v43 = v73;
  uint64_t v44 = v36;
  uint64_t v45 = v89;
  v89(v73, v36, v34);
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v69;
  *(void *)(v46 + 16) = v87;
  *(void *)(v46 + 24) = v47;
  uint64_t v48 = v70;
  uint64_t v49 = v71;
  v71(v46 + v70, v43, v34);
  *(double *)(v46 + v86) = a6;
  uint64_t v50 = v84;
  v45(v84, v44, v34);
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = v87;
  *(void *)(v51 + 24) = v47;
  v49(v51 + v48, v50, v34);
  *(void *)(v51 + v86) = v85;
  *(double *)(v51 + v78) = a7;
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v94 = sub_1000F5604;
  uint64_t v95 = v46;
  uint64_t v96 = sub_1000F583C;
  uint64_t v97 = v51;
  unint64_t v98 = v108;
  char v99 = v109;
  uint64_t v100 = v110;
  char v101 = v111;
  long long v102 = v112;
  unint64_t v92 = 0;
  unint64_t v93 = 0xE000000000000000;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  unint64_t v92 = 0xD00000000000001ALL;
  unint64_t v93 = 0x800000010010B580;
  sub_1000EB5C4();
  id v52 = sub_100071418();
  swift_release();
  id v53 = [v52 name];

  uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v56 = v55;

  v57._countAndFlagsBits = v54;
  v57._object = v56;
  String.append(_:)(v57);
  swift_bridgeObjectRelease();
  uint64_t v58 = v80;
  View.accessibilityIdentifier(_:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v59 = v90;
  uint64_t v60 = v81;
  sub_100033344(v90, v81, &qword_100159D98);
  uint64_t v61 = (uint64_t)v58;
  uint64_t v62 = (uint64_t)v58;
  uint64_t v63 = v82;
  sub_100033344(v61, v82, &qword_100159D98);
  uint64_t v64 = v83;
  sub_100033344(v60, v83, &qword_100159D98);
  uint64_t v65 = sub_100032FA0(&qword_100159DC0);
  sub_100033344(v63, v64 + *(int *)(v65 + 48), &qword_100159D98);
  sub_100032F44(v62, &qword_100159D98);
  sub_100032F44(v59, &qword_100159D98);
  sub_100032F44(v63, &qword_100159D98);
  return sub_100032F44(v60, &qword_100159D98);
}

uint64_t sub_1000EF754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v106 = a4;
  uint64_t v105 = type metadata accessor for AccessibilityTraits();
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  unint64_t v103 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v89 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v88 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = a2;
  uint64_t v111 = a3;
  uint64_t v11 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v112 = *(void *)(v11 - 8);
  uint64_t v87 = *(void *)(v112 + 64);
  __chkstk_darwin(v11);
  unint64_t v108 = (char *)&v75 - v12;
  uint64_t v81 = sub_100032FA0(&qword_100159DE8);
  uint64_t v79 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  unint64_t v78 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100032FA0(&qword_100159DF0);
  uint64_t v82 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  id v80 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100032FA0(&qword_100159DF8);
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  long long v107 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100032FA0(&qword_100159E00);
  __chkstk_darwin(v96);
  uint64_t v97 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  char v99 = (char *)&v75 - v18;
  uint64_t v98 = sub_100032FA0(&qword_100159E08);
  __chkstk_darwin(v98);
  uint64_t v102 = (uint64_t)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_100032FA0(&qword_100159E10);
  __chkstk_darwin(v100);
  uint64_t v101 = (uint64_t)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a2) = *(unsigned char *)(a1 + 24);
  uint64_t v21 = swift_retain();
  uint64_t v22 = sub_100033AA8(v21, a2);
  swift_release();
  uint64_t v23 = *(ValueMetadata **)(v22 + 16);
  swift_getKeyPath();
  uint64_t v117 = v23;
  sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  Description = v23[1].Description;
  swift_retain();
  swift_release();
  uint64_t v25 = sub_1000EB5C4();
  LOBYTE(v22) = *(unsigned char *)(a1 + 24);
  uint64_t v26 = swift_retain();
  uint64_t v27 = sub_100033AA8(v26, v22);
  swift_release();
  uint64_t v28 = *(void *)(v27 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v117 = (ValueMetadata *)v28;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LODWORD(a2) = *(unsigned __int8 *)(v28 + 40);
  swift_release();
  uint64_t v109 = v11;
  if (a2 == 1)
  {
    if (qword_100154540 != -1) {
      swift_once();
    }
    uint64_t v29 = qword_100161148;
    swift_retain();
  }
  else
  {
    uint64_t v29 = sub_1000EB7E4();
  }
  uint64_t v30 = type metadata accessor for CalculatorViewModel();
  uint64_t v31 = sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  uint64_t v92 = v30;
  uint64_t v91 = v31;
  unint64_t v86 = (ValueMetadata *)Environment.init<A>(_:)();
  uint64_t v117 = v86;
  LOBYTE(v118) = v32 & 1;
  unint64_t v119 = (unint64_t)Description;
  uint64_t v120 = v25;
  uint64_t v121 = v29;
  char v122 = 1;
  double v123 = a5;
  uint64_t v114 = sub_1000EB790();
  uint64_t v115 = v33;
  char v116 = v34;
  char v113 = 1;
  uint64_t v75 = sub_100032FA0(&qword_100156B88);
  unint64_t v35 = sub_10001BD50();
  uint64_t v76 = sub_100029018((unint64_t *)&qword_100157880, (void (*)(void))sub_10003C4C4);
  uint64_t v36 = v78;
  View.focused<A>(_:equals:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v37 = v112;
  uint64_t v39 = v108;
  uint64_t v38 = v109;
  uint64_t v40 = a1;
  unint64_t v86 = *(ValueMetadata **)(v112 + 16);
  uint64_t v77 = v112 + 16;
  ((void (*)(char *, uint64_t, uint64_t))v86)(v108, a1, v109);
  uint64_t v41 = *(unsigned __int8 *)(v37 + 80);
  uint64_t v42 = (v41 + 32) & ~v41;
  uint64_t v83 = v42 + v87;
  uint64_t v85 = v41 | 7;
  uint64_t v43 = swift_allocObject();
  uint64_t v44 = v111;
  *(void *)(v43 + 16) = v110;
  *(void *)(v43 + 24) = v44;
  uint64_t v87 = v42;
  uint64_t v45 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 32);
  uint64_t v112 = v37 + 32;
  uint64_t v84 = v45;
  v45(v43 + v42, v39, v38);
  uint64_t v117 = &type metadata for InputTextView;
  uint64_t v118 = v75;
  unint64_t v119 = v35;
  uint64_t v120 = v76;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v47 = v80;
  uint64_t v48 = (ValueMetadata *)v81;
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, ValueMetadata *))(v79 + 8))(v36, v48);
  if (_AXSAutomationEnabled())
  {
    uint64_t v49 = v88;
    static AccessibilityChildBehavior.contain.getter();
  }
  else
  {
    uint64_t v49 = v88;
    static AccessibilityChildBehavior.ignore.getter();
  }
  uint64_t v50 = v103;
  uint64_t v51 = (ValueMetadata *)v93;
  uint64_t v117 = v48;
  uint64_t v118 = OpaqueTypeConformance2;
  uint64_t v52 = swift_getOpaqueTypeConformance2();
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v49, v90);
  (*(void (**)(char *, ValueMetadata *))(v82 + 8))(v47, v51);
  uint64_t v53 = v40;
  if (sub_1000EB6EC() != 1) {
    sub_1000EB6EC();
  }
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v117 = v51;
  uint64_t v118 = v52;
  swift_getOpaqueTypeConformance2();
  uint64_t v54 = (uint64_t)v97;
  uint64_t v55 = v95;
  uint64_t v56 = v107;
  View.accessibilityLabel(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v56, v55);
  if (sub_1000EB6EC() == 1)
  {
    sub_100032FA0(&qword_100155760);
    uint64_t v57 = v104;
LABEL_16:
    uint64_t v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_10010DCB0;
    static AccessibilityTraits.isSelected.getter();
    uint64_t v117 = (ValueMetadata *)v59;
    goto LABEL_17;
  }
  char v58 = sub_1000EB6EC();
  uint64_t v57 = v104;
  if (v58 != 2)
  {
    sub_100032FA0(&qword_100155760);
    goto LABEL_16;
  }
  uint64_t v117 = (ValueMetadata *)_swiftEmptyArrayStorage;
LABEL_17:
  sub_1000332FC(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_100032FA0(&qword_100155748);
  sub_100040BE4(&qword_100155750, &qword_100155748);
  uint64_t v60 = v105;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v61 = (uint64_t)v99;
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v60);
  sub_100032F44(v54, &qword_100159E00);
  uint64_t v62 = Environment.init<A>(_:)();
  LOBYTE(v60) = v63;
  uint64_t v64 = v102;
  sub_100033344(v61, v102, &qword_100159E00);
  uint64_t v65 = v64 + *(int *)(v98 + 36);
  *(void *)uint64_t v65 = v62;
  *(unsigned char *)(v65 + 8) = v60 & 1;
  *(unsigned char *)(v65 + 9) = 1;
  sub_100032F44(v61, &qword_100159E00);
  uint64_t v66 = static VerticalAlignment.firstTextBaseline.getter();
  uint64_t v68 = v108;
  uint64_t v67 = v109;
  ((void (*)(char *, uint64_t, uint64_t))v86)(v108, v53, v109);
  unint64_t v69 = (v83 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v70 = swift_allocObject();
  uint64_t v71 = v111;
  *(void *)(v70 + 16) = v110;
  *(void *)(v70 + 24) = v71;
  v84(v70 + v87, v68, v67);
  *(double *)(v70 + v69) = a5;
  uint64_t v72 = v101;
  sub_100033344(v64, v101, &qword_100159E08);
  uint64_t v73 = (uint64_t *)(v72 + *(int *)(v100 + 36));
  *uint64_t v73 = v66;
  v73[1] = (uint64_t)sub_1000F5AF8;
  v73[2] = v70;
  sub_100032F44(v64, &qword_100159E08);
  return sub_10002D9D0(v72, v106, &qword_100159E10);
}

void *sub_1000F0514@<X0>(uint64_t a1@<X1>, void *a2@<X8>, double a3@<D0>)
{
  type metadata accessor for CalculatorUnitConversionDisplayView();
  sub_1000EB5C4();
  id v5 = sub_100071234();
  swift_release();
  id v6 = [v5 shortName];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v29 = v8;
  uint64_t v30 = v7;

  if (sub_1000EB6EC() != 1) {
    sub_1000EB6EC();
  }
  uint64_t v9 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v27 = v10;
  uint64_t v28 = v9;
  char v26 = v11;
  uint64_t v13 = v12;
  sub_1000EB5C4();
  id v14 = sub_100071234();
  swift_release();
  id v15 = [v14 displayName];

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  uint64_t v19 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v21 = v20;
  LOBYTE(v15) = v22;
  uint64_t v24 = v23;
  swift_retain();
  State.init(wrappedValue:)();
  static Color.clear.getter();
  State.init(wrappedValue:)();
  LOBYTE(v32[0]) = __src[0];
  *((void *)&v32[0] + 1) = *((void *)&__src[0] + 1);
  v32[1] = __src[0];
  *(void *)&long long v33 = v30;
  *((void *)&v33 + 1) = v29;
  *(void *)&long long v34 = a1;
  BYTE8(v34) = 1;
  *(void *)&long long v35 = 0xD000000000000013;
  *((void *)&v35 + 1) = 0x800000010010B5C0;
  *(void *)&long long v36 = v28;
  *((void *)&v36 + 1) = v27;
  LOBYTE(v37) = v26 & 1;
  *((void *)&v37 + 1) = v13;
  *(void *)&long long v38 = v16;
  *((void *)&v38 + 1) = v18;
  *(void *)&long long v39 = v19;
  *((void *)&v39 + 1) = v21;
  LOBYTE(v40) = v15 & 1;
  *((void *)&v40 + 1) = v24;
  __src[23] = v37;
  __src[24] = v38;
  __src[17] = v32[0];
  __src[18] = __src[0];
  _OWORD __src[21] = v35;
  __src[22] = v36;
  __src[19] = v33;
  __src[20] = v34;
  __src[25] = v39;
  __src[26] = v40;
  static Alignment.center.getter();
  sub_1000C39D8(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, __src, 0.0, 1, a3, 0);
  sub_1000F5A18((uint64_t)v32);
  return memcpy(a2, __src, 0x110uLL);
}

uint64_t sub_1000F07FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v23 = a6;
  type metadata accessor for ModifiedContent();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v10 = type metadata accessor for VStack();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = *(void *)(a3 + 24);
  uint64_t v24 = *(void *)(a3 + 16);
  uint64_t v25 = a4;
  uint64_t v26 = v17;
  uint64_t v27 = v21;
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = v22;
  static HorizontalAlignment.center.getter();
  VStack.init(alignment:spacing:content:)();
  swift_getWitnessTable();
  sub_10001BAFC((uint64_t)v13, v10, (uint64_t)v16);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v13, v10);
  sub_10001BAFC((uint64_t)v16, v10, v23);
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v10);
}

uint64_t sub_1000F0A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v112 = a4;
  uint64_t v111 = type metadata accessor for AccessibilityTraits();
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  uint64_t v109 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  uint64_t v97 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = a2;
  uint64_t v117 = a3;
  uint64_t v11 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v118 = *(void *)(v11 - 8);
  uint64_t v89 = *(void *)(v118 + 64);
  __chkstk_darwin(v11);
  uint64_t v115 = (char *)&v81 - v12;
  uint64_t v95 = sub_100032FA0(&qword_100159DE8);
  uint64_t v91 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v90 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100032FA0(&qword_100159DF0);
  uint64_t v96 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  uint64_t v94 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_100032FA0(&qword_100159DF8);
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  char v113 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100032FA0(&qword_100159E00);
  __chkstk_darwin(v102);
  uint64_t v17 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v105 = (char *)&v81 - v19;
  uint64_t v104 = sub_100032FA0(&qword_100159E08);
  __chkstk_darwin(v104);
  uint64_t v108 = (uint64_t)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_100032FA0(&qword_100159E10);
  __chkstk_darwin(v106);
  uint64_t v107 = (uint64_t)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a2) = *(unsigned char *)(a1 + 24);
  uint64_t v22 = swift_retain();
  uint64_t v23 = sub_100033AA8(v22, a2);
  swift_release();
  uint64_t v24 = *(ValueMetadata **)(v23 + 16);
  swift_getKeyPath();
  double v123 = v24;
  sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  Kind = (void (*)(char *, uint64_t, uint64_t))v24[2].Kind;
  swift_retain();
  swift_release();
  uint64_t v26 = sub_1000EB5C4();
  LOBYTE(v23) = *(unsigned char *)(a1 + 24);
  uint64_t v27 = swift_retain();
  uint64_t v28 = sub_100033AA8(v27, v23);
  swift_release();
  uint64_t v29 = *(void *)(v28 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  double v123 = (ValueMetadata *)v29;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LODWORD(a3) = *(unsigned __int8 *)(v29 + 40);
  swift_release();
  unint64_t v103 = v17;
  uint64_t v83 = v11;
  if (a3 == 1)
  {
    uint64_t v30 = sub_1000EB7E4();
  }
  else
  {
    if (qword_100154540 != -1) {
      swift_once();
    }
    uint64_t v30 = qword_100161148;
    swift_retain();
  }
  uint64_t v31 = type metadata accessor for CalculatorViewModel();
  uint64_t v32 = sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  uint64_t v93 = v31;
  uint64_t v92 = v32;
  uint64_t v88 = Environment.init<A>(_:)();
  double v123 = (ValueMetadata *)v88;
  LOBYTE(v124) = v33 & 1;
  unint64_t v125 = (unint64_t)Kind;
  uint64_t v126 = v26;
  uint64_t v127 = v30;
  char v128 = 1;
  double v129 = a5;
  uint64_t v34 = sub_1000EB790();
  uint64_t v87 = Kind;
  uint64_t v120 = v34;
  uint64_t v121 = v35;
  char v122 = v36;
  char v119 = 2;
  uint64_t v37 = sub_100032FA0(&qword_100156B88);
  unint64_t v82 = sub_10001BD50();
  uint64_t v38 = sub_100029018((unint64_t *)&qword_100157880, (void (*)(void))sub_10003C4C4);
  long long v39 = v90;
  View.focused<A>(_:equals:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v40 = v118;
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 16);
  uint64_t v42 = v115;
  uint64_t v43 = a1;
  uint64_t v44 = a1;
  uint64_t v45 = v83;
  uint64_t v88 = v118 + 16;
  uint64_t v87 = v41;
  v41(v115, v44, v83);
  uint64_t v46 = *(unsigned __int8 *)(v40 + 80);
  uint64_t v47 = (v46 + 32) & ~v46;
  uint64_t v84 = v47 + v89;
  uint64_t v86 = v46 | 7;
  uint64_t v48 = swift_allocObject();
  uint64_t v49 = v117;
  *(void *)(v48 + 16) = v116;
  *(void *)(v48 + 24) = v49;
  uint64_t v89 = v47;
  uint64_t v50 = v48 + v47;
  uint64_t v51 = v45;
  uint64_t v85 = *(void (**)(uint64_t, char *, uint64_t))(v40 + 32);
  uint64_t v118 = v40 + 32;
  v85(v50, v42, v45);
  double v123 = &type metadata for InputTextView;
  uint64_t v124 = v37;
  unint64_t v125 = v82;
  uint64_t v126 = v38;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v53 = v94;
  uint64_t v54 = (ValueMetadata *)v95;
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, ValueMetadata *))(v91 + 8))(v39, v54);
  if (_AXSAutomationEnabled())
  {
    uint64_t v55 = v97;
    static AccessibilityChildBehavior.contain.getter();
  }
  else
  {
    uint64_t v55 = v97;
    static AccessibilityChildBehavior.ignore.getter();
  }
  double v123 = v54;
  uint64_t v124 = OpaqueTypeConformance2;
  uint64_t v56 = swift_getOpaqueTypeConformance2();
  uint64_t v57 = v114;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v55, v99);
  (*(void (**)(char *, uint64_t))(v96 + 8))(v53, v57);
  uint64_t v58 = v43;
  sub_1000EB6EC();
  uint64_t v59 = v51;
  uint64_t v60 = (uint64_t)v103;
  LocalizedStringKey.init(stringLiteral:)();
  double v123 = (ValueMetadata *)v114;
  uint64_t v124 = v56;
  swift_getOpaqueTypeConformance2();
  uint64_t v61 = v101;
  uint64_t v62 = v113;
  View.accessibilityLabel(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v100 + 8))(v62, v61);
  if (sub_1000EB6EC() == 2)
  {
    sub_100032FA0(&qword_100155760);
    uint64_t v63 = v110;
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_10010DCB0;
    static AccessibilityTraits.isSelected.getter();
    double v123 = (ValueMetadata *)v64;
    sub_1000332FC(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100032FA0(&qword_100155748);
    sub_100040BE4(&qword_100155750, &qword_100155748);
    uint64_t v65 = v109;
    uint64_t v66 = v111;
    dispatch thunk of SetAlgebra.init<A>(_:)();
  }
  else
  {
    double v123 = (ValueMetadata *)_swiftEmptyArrayStorage;
    sub_1000332FC(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100032FA0(&qword_100155748);
    sub_100040BE4(&qword_100155750, &qword_100155748);
    uint64_t v65 = v109;
    uint64_t v66 = v111;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v63 = v110;
  }
  uint64_t v67 = (uint64_t)v105;
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v65, v66);
  sub_100032F44(v60, &qword_100159E00);
  uint64_t v68 = Environment.init<A>(_:)();
  char v70 = v69;
  uint64_t v71 = v108;
  sub_100033344(v67, v108, &qword_100159E00);
  uint64_t v72 = v71 + *(int *)(v104 + 36);
  *(void *)uint64_t v72 = v68;
  *(unsigned char *)(v72 + 8) = v70 & 1;
  *(unsigned char *)(v72 + 9) = 0;
  sub_100032F44(v67, &qword_100159E00);
  uint64_t v73 = static VerticalAlignment.firstTextBaseline.getter();
  unint64_t v74 = v115;
  v87(v115, v58, v59);
  unint64_t v75 = (v84 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v76 = swift_allocObject();
  uint64_t v77 = v117;
  *(void *)(v76 + 16) = v116;
  *(void *)(v76 + 24) = v77;
  v85(v76 + v89, v74, v59);
  *(double *)(v76 + v75) = a5;
  uint64_t v78 = v107;
  sub_100033344(v71, v107, &qword_100159E08);
  uint64_t v79 = (uint64_t *)(v78 + *(int *)(v106 + 36));
  *uint64_t v79 = v73;
  v79[1] = (uint64_t)sub_1000F5AF8;
  v79[2] = v76;
  sub_100032F44(v71, &qword_100159E08);
  return sub_10002D9D0(v78, v112, &qword_100159E10);
}

uint64_t sub_1000F1848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a1;
  v13[5] = a2;
  *(double *)&v13[6] = a7;
  uint64_t v9 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v10 = sub_100032FA0(&qword_100159DC8);
  uint64_t v11 = sub_1000F5934(&qword_100159DD0, &qword_100159DC8, (void (*)(void))sub_1000F59B0);
  sub_1000F07FC(a5, (uint64_t)v13, v9, v10, v11, (uint64_t)__src);
  memcpy(__dst, __src, 0x161uLL);
  CalculatorButtonRepresentable.id.getter(__dst);
  return sub_10002D9D0((uint64_t)__dst, a6, &qword_100159DE0);
}

void *sub_1000F193C@<X0>(uint64_t a1@<X1>, void *a2@<X8>, double a3@<D0>)
{
  type metadata accessor for CalculatorUnitConversionDisplayView();
  sub_1000EB5C4();
  id v5 = sub_100071418();
  swift_release();
  id v6 = [v5 shortName];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v8;
  uint64_t v31 = v7;

  sub_1000EB6EC();
  uint64_t v9 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v28 = v10;
  uint64_t v29 = v9;
  char v27 = v11;
  uint64_t v13 = v12;
  sub_1000EB5C4();
  id v14 = sub_100071418();
  swift_release();
  id v15 = [v14 displayName];

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  uint64_t v19 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_retain();
  State.init(wrappedValue:)();
  static Color.clear.getter();
  State.init(wrappedValue:)();
  LOBYTE(v33[0]) = __src[0];
  *((void *)&v33[0] + 1) = *((void *)&__src[0] + 1);
  v33[1] = __src[0];
  *(void *)&long long v34 = v31;
  *((void *)&v34 + 1) = v30;
  *(void *)&long long v35 = a1;
  BYTE8(v35) = 0;
  *(void *)&long long v36 = 0xD000000000000014;
  *((void *)&v36 + 1) = 0x800000010010B5A0;
  *(void *)&long long v37 = v29;
  *((void *)&v37 + 1) = v28;
  LOBYTE(v38) = v27 & 1;
  *((void *)&v38 + 1) = v13;
  *(void *)&long long v39 = v16;
  *((void *)&v39 + 1) = v18;
  *(void *)&long long v40 = v19;
  *((void *)&v40 + 1) = v21;
  LOBYTE(v41) = v23 & 1;
  *((void *)&v41 + 1) = v25;
  __src[23] = v38;
  __src[24] = v39;
  __src[17] = v33[0];
  __src[18] = __src[0];
  _OWORD __src[21] = v36;
  __src[22] = v37;
  __src[19] = v34;
  __src[20] = v35;
  __src[25] = v40;
  __src[26] = v41;
  static Alignment.center.getter();
  sub_1000C39D8(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, __src, 0.0, 1, a3, 0);
  sub_1000F5A18((uint64_t)v33);
  return memcpy(a2, __src, 0x110uLL);
}

uint64_t sub_1000F1C10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v22 - v4;
  uint64_t v6 = sub_1000EB5C4();
  swift_getKeyPath();
  uint64_t v23 = v6;
  sub_1000332FC(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v7 = *(id *)(v6 + 32);
  swift_release();
  id v8 = [v7 unitType];

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if (v8 == (id)16)
  {
    char v9 = v5[24];
    uint64_t v10 = swift_retain();
    sub_100033AA8(v10, v9);
    swift_release();
    swift_retain();
    swift_release();
    sub_100034264();
    swift_retain();
    swift_release();
    uint64_t v11 = CalculateExpression.expression.getter();
    unint64_t v13 = v12;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
    }
    int v15 = v14 != 0;
  }
  else
  {
    int v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v16 = *(unsigned char *)(a1 + 24);
  uint64_t v17 = swift_retain();
  uint64_t v18 = sub_100033AA8(v17, v16);
  swift_release();
  uint64_t v19 = *(void *)(v18 + 16);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v23 = v19;
  sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (v15 != *(unsigned __int8 *)(v19 + 42))
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v22 - 2) = v19;
    *((unsigned char *)&v22 - 8) = v15;
    uint64_t v23 = v19;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
  }
  swift_release();
  sub_1000F1F90();
  return sub_1000F20FC();
}

uint64_t sub_1000F1F90()
{
  sub_100032FA0(&qword_100154898);
  uint64_t result = State.wrappedValue.getter();
  if ((v1 & 1) == 0)
  {
    sub_1000EB5C4();
    swift_retain();
    swift_release();
    sub_100050D58();
    swift_release();
    sub_1000EB5C4();
    swift_retain();
    swift_release();
    swift_getKeyPath();
    sub_1000332FC(&qword_100154F68, (void (*)(uint64_t))type metadata accessor for CalculatorCurrencyCacheProvider);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000F20FC()
{
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  swift_retain();
  swift_release();
  uint64_t v3 = sub_1000EB5C4();
  sub_1000D9AE4(v3);
  swift_release();

  return swift_release();
}

uint64_t sub_1000F218C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 24);
  uint64_t v2 = swift_retain();
  sub_100033AA8(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_release();
  uint64_t v3 = swift_retain();
  sub_100033AA8(v3, v1);
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

void sub_1000F2320(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (*a2 == 1)
  {
    char v3 = *(unsigned char *)(a3 + 24);
    uint64_t v4 = swift_retain();
    sub_100033AA8(v4, v3);
    swift_release();
    swift_retain();
    swift_release();
    sub_100034264();
    swift_retain();
    swift_release();
    CalculateExpression.expression.getter();
    swift_release();
    uint64_t v5 = swift_retain();
    sub_100033AA8(v5, v3);
    swift_release();
    swift_retain();
    swift_release();
    sub_100034264();
    swift_retain();
    swift_release();
    CalculateExpression.expression.setter();
    swift_release();
    type metadata accessor for CalculatorUnitConversionDisplayView();
    sub_1000F20FC();
  }
}

uint64_t sub_1000F2444(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 24);
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_100033AA8(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v4 = *(unsigned __int8 *)(v3 + 53);
  uint64_t result = swift_release();
  if (v4 != 6)
  {
    uint64_t v6 = swift_retain();
    uint64_t v7 = sub_100033AA8(v6, v1);
    swift_release();
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    int v8 = *(unsigned __int8 *)(v7 + 53);
    swift_release();
    uint64_t result = sub_1000EB6EC();
    if (v8 == 6)
    {
      if (result == 6) {
        return result;
      }
LABEL_7:
      uint64_t v9 = swift_retain();
      sub_100033AA8(v9, v1);
      swift_release();
      swift_getKeyPath();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      swift_release();
      return sub_1000EB73C();
    }
    if (result == 6 || v8 != result) {
      goto LABEL_7;
    }
  }
  return result;
}

void sub_1000F2624(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  int v3 = *a2;
  if (v3 != 6 && (v3 - 1) <= 1)
  {
    char v4 = *(unsigned char *)(a3 + 24);
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_100033AA8(v5, v4);
    swift_release();
    uint64_t v7 = *(void *)(v6 + 16);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    if (((v3 == 1) ^ *(unsigned __int8 *)(v7 + 40)))
    {
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
      swift_release();
    }
    swift_release();
    uint64_t v9 = swift_retain();
    sub_100033AA8(v9, v4);
    swift_release();
    uint64_t v10 = swift_getKeyPath();
    __chkstk_darwin(v10);
    sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_release();
  }
}

void sub_1000F28BC()
{
  type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v0 = sub_1000EB5C4();
  swift_getKeyPath();
  sub_1000332FC(&qword_1001552A0, (void (*)(uint64_t))type metadata accessor for CalculatorUnitConversionViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v1 = *(id *)(v0 + 32);
  swift_release();
  id v2 = [v1 unitType];

  if (v2 == (id)16) {
    sub_1000F20FC();
  }
}

uint64_t sub_1000F29C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100032FA0(&qword_100159C50);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154368 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100160E50;
  *(void *)uint64_t v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = v7;
  v6[16] = 0;
  uint64_t v8 = sub_100032FA0(&qword_100159C58);
  sub_1000F2AD4(a1, (uint64_t)&v6[*(int *)(v8 + 44)]);
  sub_100033344((uint64_t)v6, a2, &qword_100159C50);
  return sub_100032F44((uint64_t)v6, &qword_100159C50);
}

uint64_t sub_1000F2AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100032FA0(&qword_100159C60);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v9 = &v22[-v8];
  uint64_t v10 = type metadata accessor for CalculatorUnitConversionDisplayView();
  sub_1000F2D38((uint64_t)&v28);
  uint64_t v11 = v28;
  uint64_t v12 = v29;
  char v13 = v30;
  uint64_t v14 = v31;
  int v26 = v32;
  uint64_t v24 = v34;
  uint64_t v25 = v33;
  uint64_t v15 = v35;
  int v23 = v36;
  if (sub_1000EB618()
    && (uint64_t v16 = *(void *)(a1 + 72),
        LOBYTE(v28) = *(unsigned char *)(a1 + 64),
        uint64_t v29 = v16,
        sub_100032FA0(&qword_100154898),
        State.wrappedValue.getter(),
        (v27 & 1) == 0))
  {
    sub_1000F2DF8(v10, (uint64_t)v9);
    uint64_t v18 = sub_100032FA0(&qword_100159C68);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 0, 1, v18);
  }
  else
  {
    uint64_t v17 = sub_100032FA0(&qword_100159C68);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  sub_100033344((uint64_t)v9, (uint64_t)v6, &qword_100159C60);
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v12;
  *(unsigned char *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v26;
  uint64_t v19 = v24;
  *(void *)(a2 + 40) = v25;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v15;
  *(unsigned char *)(a2 + 64) = v23;
  uint64_t v20 = sub_100032FA0(&qword_100159C70);
  sub_100033344((uint64_t)v6, a2 + *(int *)(v20 + 48), &qword_100159C60);
  swift_retain();
  sub_100032F44((uint64_t)v9, &qword_100159C60);
  sub_100032F44((uint64_t)v6, &qword_100159C60);
  return swift_release();
}

double sub_1000F2D38@<D0>(uint64_t a1@<X8>)
{
  if (qword_100154650 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100161258;
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  double result = *(double *)&v8;
  *(_OWORD *)(a1 + 40) = v8;
  *(void *)(a1 + 56) = 0xBFF0000000000000;
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

uint64_t sub_1000F2DF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v4 = type metadata accessor for HighlightHoverEffect();
  uint64_t v85 = *(void *)(v4 - 8);
  uint64_t v86 = v4;
  __chkstk_darwin(v4);
  uint64_t v83 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PlainButtonStyle();
  uint64_t v77 = *(void *)(v6 - 8);
  uint64_t v78 = v6;
  __chkstk_darwin(v6);
  unint64_t v75 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v10);
  uint64_t v68 = sub_100032FA0(&qword_100159C78);
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v66 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032FA0(&qword_100159C80);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100032FA0(&qword_100159C88);
  __chkstk_darwin(v69);
  uint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100032FA0(&qword_100159C90);
  uint64_t v72 = *(void *)(v18 - 8);
  uint64_t v73 = v18;
  __chkstk_darwin(v18);
  char v70 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100032FA0(&qword_100159C98);
  __chkstk_darwin(v71);
  uint64_t v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100032FA0(&qword_100159CA0);
  __chkstk_darwin(v79);
  unint64_t v74 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v76 = (char *)&v65 - v24;
  uint64_t v25 = sub_100032FA0(&qword_100159CA8);
  uint64_t v81 = *(void *)(v25 - 8);
  uint64_t v82 = v25;
  double v26 = __chkstk_darwin(v25);
  id v80 = (char *)&v65 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 16))((char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1, v26);
  unint64_t v28 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = *(_OWORD *)(a1 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v29 + v28, (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_100032FA0(&qword_100159CB0);
  sub_1000F4BC4();
  char v30 = v66;
  Button.init(action:label:)();
  uint64_t v31 = sub_1000F4D64();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v67;
  uint64_t v34 = v68;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v15, v30, v68);
  uint64_t v35 = (uint64_t *)&v15[*(int *)(v13 + 44)];
  *uint64_t v35 = KeyPath;
  v35[1] = v31;
  unsigned __int8 v36 = *(void (**)(char *, uint64_t))(v33 + 8);
  swift_retain();
  v36(v30, v34);
  if (qword_1001546D0 != -1) {
    swift_once();
  }
  uint64_t v37 = qword_1001612E8;
  uint64_t v38 = swift_getKeyPath();
  sub_100033344((uint64_t)v15, (uint64_t)v17, &qword_100159C80);
  long long v39 = (uint64_t *)&v17[*(int *)(v69 + 36)];
  *long long v39 = v38;
  v39[1] = v37;
  swift_retain();
  sub_100032F44((uint64_t)v15, &qword_100159C80);
  long long v40 = v75;
  PlainButtonStyle.init()();
  sub_1000F4EBC();
  sub_1000332FC(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  long long v41 = v70;
  uint64_t v42 = v78;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v40, v42);
  sub_100032F44((uint64_t)v17, &qword_100159C88);
  uint64_t v44 = v72;
  uint64_t v43 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v21, v41, v73);
  uint64_t v45 = &v21[*(int *)(v71 + 36)];
  __asm { FMOV            V0.2D, #8.0 }
  *(_OWORD *)uint64_t v45 = _Q0;
  *((_OWORD *)v45 + 1) = xmmword_10010F200;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
  sub_1000F4F7C();
  uint64_t v51 = (uint64_t)v74;
  View.accessibilityIdentifier(_:)();
  sub_100032F44((uint64_t)v21, &qword_100159C98);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v52 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v54 = v53;
  char v56 = v55 & 1;
  uint64_t v57 = (uint64_t)v76;
  uint64_t v58 = v79;
  ModifiedContent<>.accessibilityLabel(_:)();
  sub_1000356E0(v52, v54, v56);
  swift_bridgeObjectRelease();
  sub_100032F44(v51, &qword_100159CA0);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v59 = sub_1000F507C(&qword_100159D00, &qword_100159CA0, (void (*)(void))sub_1000F4F7C);
  uint64_t v60 = v80;
  View.help(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100032F44(v57, &qword_100159CA0);
  uint64_t v61 = v83;
  static CustomHoverEffect<>.highlight.getter();
  uint64_t v87 = v58;
  uint64_t v88 = v59;
  swift_getOpaqueTypeConformance2();
  sub_1000332FC(&qword_100159990, (void (*)(uint64_t))&type metadata accessor for HighlightHoverEffect);
  uint64_t v62 = v82;
  uint64_t v63 = v86;
  View.hoverEffect<A>(_:isEnabled:)();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v61, v63);
  return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v60, v62);
}

uint64_t sub_1000F3794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v19[0] = a3;
  v19[1] = a4;
  uint64_t v6 = type metadata accessor for CalculatorUnitConversionDisplayView();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v19 - v8;
  uint64_t v10 = sub_100032FA0(&qword_1001555F0);
  uint64_t v11 = *(void *)(v10 - 8);
  double v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v9, a1, v6, v12);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v19[0];
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, v9, v6);
  Button.init(action:label:)();
  sub_100040BE4(&qword_100156428, &qword_1001555F0);
  View.allowsSecureDrawing()();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

uint64_t sub_1000F39DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E5954(a1);
}

uint64_t sub_1000F39E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E5954(a1);
}

uint64_t sub_1000F3A04@<X0>(void (*a1)(double)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  v24[0] = a4;
  v24[1] = a5;
  uint64_t v8 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ModifiedContent();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)v24 - v17;
  a1(v16);
  static Edge.Set.bottom.getter();
  LOBYTE(a2) = *(unsigned char *)(a2 + 56);
  uint64_t v19 = swift_retain();
  sub_10002BD88(v19, a2);
  swift_release();
  sub_1000D6B84();
  swift_release();
  uint64_t v20 = v24[0];
  View.padding(_:_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);
  v28[2] = v20;
  v28[3] = &protocol witness table for _PaddingLayout;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_10001BAFC((uint64_t)v14, v11, (uint64_t)v18);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v14, v11);
  uint64_t v26 = 0;
  char v27 = 0;
  v28[0] = &v26;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v18, v11);
  v28[1] = v14;
  v25[0] = &type metadata for Spacer;
  v25[1] = v11;
  v24[2] = &protocol witness table for Spacer;
  v24[3] = WitnessTable;
  sub_100025EFC((uint64_t)v28, 2uLL, (uint64_t)v25);
  v22(v18, v11);
  return ((uint64_t (*)(char *, uint64_t))v22)(v14, v11);
}

uint64_t sub_1000F3CE4(uint64_t a1)
{
  if (qword_100154750 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100021598(v2, (uint64_t)qword_100161340);
  int v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Swap button tapped", v5, 2u);
    swift_slowDealloc();
  }

  char v6 = *(unsigned char *)(a1 + 24);
  uint64_t v7 = swift_retain();
  sub_100033AA8(v7, v6);
  swift_release();
  swift_retain();
  swift_release();
  sub_1000DBF5C();
  swift_release();
  type metadata accessor for CalculatorUnitConversionDisplayView();
  sub_1000F20FC();
  uint64_t result = sub_1000EB6EC();
  if (result != 6)
  {
    uint64_t v9 = swift_retain();
    sub_100033AA8(v9, v6);
    swift_release();
    swift_retain();
    swift_release();
    swift_getKeyPath();
    sub_1000332FC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    return sub_1000EB73C();
  }
  return result;
}

uint64_t sub_1000F3F0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = sub_100032FA0(&qword_100155888);
  __chkstk_darwin(v1);
  int v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v6 = (char *)&v28 - v5;
  uint64_t v7 = type metadata accessor for DynamicTypeSize();
  uint64_t v8 = *(void **)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v32 = sub_100032FA0(&qword_100155858);
  __chkstk_darwin(v32);
  uint64_t v29 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v30 = (uint64_t)&v28 - v16;
  if (qword_100154468 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_100160F80;
  uint64_t v17 = (void (*)(char *, void, uint64_t))v8[13];
  v17(v13, enum case for DynamicTypeSize.xLarge(_:), v7);
  v17(v10, enum case for DynamicTypeSize.accessibility5(_:), v7);
  sub_1000332FC(&qword_100155890, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  swift_retain();
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if (result)
  {
    uint64_t v19 = &v6[*(int *)(v1 + 48)];
    uint64_t v20 = (void (*)(char *, char *, uint64_t))v8[4];
    v20(v6, v13, v7);
    v20(v19, v10, v7);
    uint64_t v21 = *(int *)(v1 + 48);
    uint64_t v28 = v1;
    uint64_t v22 = &v3[v21];
    uint64_t v23 = (void (*)(char *, char *, uint64_t))v8[2];
    v23(v3, v6, v7);
    v23(v22, v19, v7);
    uint64_t v24 = (uint64_t)v29;
    v20(v29, v3, v7);
    uint64_t v25 = (void (*)(char *, uint64_t))v8[1];
    v25(v22, v7);
    uint64_t v26 = &v3[*(int *)(v28 + 48)];
    v20(v3, v6, v7);
    v20(v26, v19, v7);
    v20((char *)(v24 + *(int *)(v32 + 36)), v26, v7);
    v25(v3, v7);
    uint64_t v27 = v30;
    sub_10002D9D0(v24, v30, &qword_100155858);
    sub_100040BE4(&qword_100155860, &qword_100155858);
    View.dynamicTypeSize<A>(_:)();
    sub_100032F44(v27, &qword_100155858);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000F4360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = type metadata accessor for DynamicTypeSize();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100032FA0(&qword_100159CD0);
  __chkstk_darwin(v22);
  char v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032FA0(&qword_100159D08);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100032FA0(&qword_100159CC8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v15 = sub_100032FA0(&qword_100159D10);
  sub_1000F469C((uint64_t)&v6[*(int *)(v15 + 44)]);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for DynamicTypeSize.small(_:), v1);
  sub_100040BE4(&qword_100159CD8, &qword_100159CD0);
  View.dynamicTypeSize(_:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100032F44((uint64_t)v6, &qword_100159CD0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
  uint64_t v17 = &v14[*(int *)(v12 + 44)];
  *(void *)uint64_t v17 = KeyPath;
  *((void *)v17 + 1) = 1;
  v17[16] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = swift_getKeyPath();
  uint64_t v19 = v23;
  sub_100033344((uint64_t)v14, v23, &qword_100159CC8);
  uint64_t v20 = (uint64_t *)(v19 + *(int *)(sub_100032FA0(&qword_100159CB0) + 36));
  *uint64_t v20 = v18;
  v20[1] = 0x3FE6666666666666;
  return sub_100032F44((uint64_t)v14, &qword_100159CC8);
}

uint64_t sub_1000F469C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = sub_100032FA0(&qword_100157E60);
  __chkstk_darwin(v29);
  uint64_t v3 = (uint64_t *)((char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for ControlSize();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100032FA0(&qword_100159D18);
  __chkstk_darwin(v25);
  uint64_t v9 = (uint64_t *)((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v25 - v11;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v13 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  char v16 = v15;
  uint64_t v28 = v17;
  if (qword_100154428 != -1) {
    swift_once();
  }
  char v18 = v16 & 1;
  uint64_t v19 = qword_100160F40;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ControlSize.small(_:), v4);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v3 + *(int *)(v29 + 28), v7, v4);
  *uint64_t v3 = KeyPath;
  sub_100033344((uint64_t)v3, (uint64_t)v9 + *(int *)(v25 + 36), &qword_100157E60);
  *uint64_t v9 = v19;
  swift_retain_n();
  sub_100032F44((uint64_t)v3, &qword_100157E60);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  sub_10002D9D0((uint64_t)v9, (uint64_t)v12, &qword_100159D18);
  sub_100033344((uint64_t)v12, (uint64_t)v9, &qword_100159D18);
  uint64_t v22 = v26;
  uint64_t v21 = v27;
  *(void *)a1 = v27;
  *(void *)(a1 + 8) = v22;
  *(unsigned char *)(a1 + 16) = v18;
  *(void *)(a1 + 24) = v28;
  uint64_t v23 = sub_100032FA0(&qword_100159D20);
  sub_100033344((uint64_t)v9, a1 + *(int *)(v23 + 48), &qword_100159D18);
  sub_1000637B4(v21, v22, v18);
  swift_bridgeObjectRetain();
  sub_100032F44((uint64_t)v12, &qword_100159D18);
  sub_100032F44((uint64_t)v9, &qword_100159D18);
  sub_1000356E0(v21, v22, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000F4A1C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000EC0FC(*(void *)(v1 + 32), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(double *)(v1 + 40), *(double *)(v1 + 48), *(double *)(v1 + 64));
}

uint64_t sub_1000F4A34@<X0>(uint64_t a1@<X8>)
{
  return sub_1000EC9FC(*(void *)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(double *)(v1 + 40));
}

uint64_t sub_1000F4A44@<X0>(uint64_t a1@<X8>)
{
  return sub_1000F3794(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_1000F4A50()
{
  unint64_t result = qword_100159C38;
  if (!qword_100159C38)
  {
    sub_1000317D8(&qword_100159C18);
    sub_100040BE4(&qword_100159C40, &qword_100159C10);
    sub_100040BE4(&qword_100159C48, &qword_100159C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159C38);
  }
  return result;
}

uint64_t sub_1000F4B18()
{
  return sub_1000F4B2C();
}

uint64_t sub_1000F4B24()
{
  return sub_1000F4B2C();
}

uint64_t sub_1000F4B2C()
{
  return State.wrappedValue.setter();
}

unint64_t sub_1000F4BC4()
{
  unint64_t result = qword_100159CB8;
  if (!qword_100159CB8)
  {
    sub_1000317D8(&qword_100159CB0);
    sub_1000F4C64();
    sub_100040BE4(&qword_100155730, &qword_100155738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159CB8);
  }
  return result;
}

unint64_t sub_1000F4C64()
{
  unint64_t result = qword_100159CC0;
  if (!qword_100159CC0)
  {
    sub_1000317D8(&qword_100159CC8);
    sub_1000317D8(&qword_100159CD0);
    sub_100040BE4(&qword_100159CD8, &qword_100159CD0);
    swift_getOpaqueTypeConformance2();
    sub_100040BE4(&qword_100156AF0, &qword_100156AF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159CC0);
  }
  return result;
}

uint64_t sub_1000F4D64()
{
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_100033AA8(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_1000332FC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v4 = *(unsigned __int8 *)(v3 + 52);
  swift_release();
  if (v4 == 1)
  {
    if (qword_100154560 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_100161168;
  }
  else
  {
    if (qword_100154558 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_100161160;
  }
  return *v5;
}

unint64_t sub_1000F4EBC()
{
  unint64_t result = qword_100159CE0;
  if (!qword_100159CE0)
  {
    sub_1000317D8(&qword_100159C88);
    sub_1000F5ED0(&qword_100159CE8, &qword_100159C80, &qword_100159CF0, &qword_100159C78);
    sub_100040BE4((unint64_t *)&qword_1001557B8, &qword_1001557C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159CE0);
  }
  return result;
}

unint64_t sub_1000F4F7C()
{
  unint64_t result = qword_100159CF8;
  if (!qword_100159CF8)
  {
    sub_1000317D8(&qword_100159C98);
    sub_1000317D8(&qword_100159C88);
    type metadata accessor for PlainButtonStyle();
    sub_1000F4EBC();
    sub_1000332FC(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_10003C0DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159CF8);
  }
  return result;
}

uint64_t sub_1000F507C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    sub_1000332FC(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000F5158()
{
  return sub_1000F5FAC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000F1C10);
}

uint64_t sub_1000F5174()
{
  return sub_1000F5FAC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000F218C);
}

uint64_t sub_1000F5198(uint64_t a1, unsigned char *a2)
{
  uint64_t result = type metadata accessor for CalculatorUnitConversionDisplayView();
  if (*a2 == 1) {
    return sub_1000F1F90();
  }
  return result;
}

unint64_t sub_1000F520C()
{
  unint64_t result = qword_100159D78;
  if (!qword_100159D78)
  {
    sub_1000317D8(&qword_100159D30);
    sub_100040BE4(&qword_100159D80, &qword_100159D28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159D78);
  }
  return result;
}

uint64_t sub_1000F52B8(uint64_t a1, uint64_t a2)
{
  return sub_1000F53B8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000F2320);
}

uint64_t sub_1000F52D4()
{
  return sub_1000F1F90();
}

unint64_t sub_1000F5338()
{
  unint64_t result = qword_100155240;
  if (!qword_100155240)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100155240);
  }
  return result;
}

uint64_t sub_1000F5384()
{
  return sub_1000F5FAC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000F2444);
}

uint64_t sub_1000F53A0(uint64_t a1, uint64_t a2)
{
  return sub_1000F53B8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000F2624);
}

uint64_t sub_1000F53B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v8 = *(void *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  uint64_t v9 = v3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return a3(a1, a2, v9, v6, v7);
}

void sub_1000F546C()
{
  type metadata accessor for CalculatorUnitConversionDisplayView();

  sub_1000F28BC();
}

uint64_t sub_1000F5500()
{
  return sub_100057878(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000F552C()
{
  return sub_1000F561C((uint64_t (*)(unint64_t, uint64_t, uint64_t, __n128))sub_1000EF754);
}

uint64_t sub_1000F5548@<X0>(uint64_t a1@<X8>)
{
  return sub_1000F5854((uint64_t)sub_1000F5AFC, a1);
}

unint64_t sub_1000F5560()
{
  unint64_t result = qword_100159DA8;
  if (!qword_100159DA8)
  {
    sub_1000317D8(&qword_100159DA0);
    sub_100040BE4(&qword_100159DB0, &qword_100159DB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159DA8);
  }
  return result;
}

uint64_t sub_1000F5604()
{
  return sub_1000F561C((uint64_t (*)(unint64_t, uint64_t, uint64_t, __n128))sub_1000F0A1C);
}

uint64_t sub_1000F561C(uint64_t (*a1)(unint64_t, uint64_t, uint64_t, __n128))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6.n128_u64[0] = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));

  return a1(v1 + v5, v2, v3, v6);
}

uint64_t sub_1000F56EC()
{
  uint64_t v1 = (int *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v2 + v1[19];
  uint64_t v4 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000F583C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000F5854((uint64_t)sub_1000F591C, a1);
}

uint64_t sub_1000F5854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000F1848(v2 + v8, *(void *)(v2 + v9), v5, v6, a1, a2, *(double *)(v2 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000F591C()
{
  return sub_1000F5B14((uint64_t (*)(void, void, void, void, double))sub_1000F193C);
}

uint64_t sub_1000F5934(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000F59B0()
{
  unint64_t result = qword_100159DD8;
  if (!qword_100159DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159DD8);
  }
  return result;
}

uint64_t sub_1000F5A04@<X0>(uint64_t a1@<X8>)
{
  return sub_1000F3A04(*(void (**)(double))(v1 + 48), *(void *)(v1 + 64), *(void *)(v1 + 24), *(void *)(v1 + 40), a1);
}

uint64_t sub_1000F5A18(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000F5AEC()
{
  return sub_1000F5B40();
}

uint64_t sub_1000F5AFC()
{
  return sub_1000F5B14((uint64_t (*)(void, void, void, void, double))sub_1000F0514);
}

uint64_t sub_1000F5B14(uint64_t (*a1)(void, void, void, void, double))
{
  return a1(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24), *(double *)(v1 + 48));
}

uint64_t sub_1000F5B38()
{
  return sub_1000F5B40();
}

uint64_t sub_1000F5B40()
{
  return sub_1000EB73C();
}

uint64_t sub_1000F5BAC()
{
  uint64_t v1 = (int *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v2 + v1[19];
  uint64_t v4 = sub_100032FA0(&qword_100156688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocObject();
}

double sub_1000F5CEC()
{
  uint64_t v1 = *(void *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + v2;
  double v4 = *(double *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  ViewDimensions.height.getter();
  return v5 - v4 * (*(double *)(v3 + 120) / *(double *)(v3 + 128));
}

uint64_t sub_1000F5DA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000ED7F4(*(void (***)(double))(v1 + 32), *(void *)(v1 + 24), a1);
}

unint64_t sub_1000F5DB0()
{
  unint64_t result = qword_100159E30;
  if (!qword_100159E30)
  {
    sub_1000317D8(&qword_100159E38);
    sub_1000317D8(&qword_100159E40);
    type metadata accessor for PlainButtonStyle();
    sub_1000F5ED0(&qword_100159E48, &qword_100159E40, &qword_100155870, &qword_100155828);
    sub_1000332FC(&qword_1001547C8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_10003C0DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159E30);
  }
  return result;
}

uint64_t sub_1000F5ED0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    sub_100040BE4(a3, a4);
    sub_100040BE4(&qword_100155410, &qword_100155418);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000F5F94()
{
  return sub_1000F5FAC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000F3CE4);
}

uint64_t sub_1000F5FAC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for CalculatorUnitConversionDisplayView() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a1(v5, v2, v3);
}

uint64_t sub_1000F6044()
{
  return swift_getWitnessTable();
}

uint64_t initializeBufferWithCopyOfBuffer for CalculatorConfigSnapshot(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CalculatorConfigSnapshot(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = a1[3];
      if (a1[3]) {
        return (*(unsigned __int16 *)a1 | (a1[2] << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)(a1 + 3);
      if (*(_WORD *)(a1 + 3)) {
        return (*(unsigned __int16 *)a1 | (a1[2] << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = a1[1];
  BOOL v5 = v4 >= 2;
  int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for CalculatorConfigSnapshot(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)(result + 1) = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalculatorConfigSnapshot()
{
  return &type metadata for CalculatorConfigSnapshot;
}

uint64_t sub_1000F634C(int a1)
{
  _StringGuts.grow(_:)(47);
  v2._countAndFlagsBits = 0x203A65646F6DLL;
  v2._object = (void *)0xE600000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._object = (void *)0x800000010010B600;
  v3._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v3);
  if ((a1 & 0x100) != 0) {
    uint64_t v4 = 1702195828;
  }
  else {
    uint64_t v4 = 0x65736C6166;
  }
  if ((a1 & 0x100) != 0) {
    unint64_t v5 = 0xE400000000000000;
  }
  else {
    unint64_t v5 = 0xE500000000000000;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x6F4D4E5052736920;
  v7._object = (void *)0xEC000000203A6564;
  String.append(_:)(v7);
  if ((a1 & 0x10000) != 0) {
    uint64_t v8 = 1702195828;
  }
  else {
    uint64_t v8 = 0x65736C6166;
  }
  if ((a1 & 0x10000) != 0) {
    unint64_t v9 = 0xE400000000000000;
  }
  else {
    unint64_t v9 = 0xE500000000000000;
  }
  unint64_t v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000F648C()
{
  if (v0[2]) {
    int v1 = 0x10000;
  }
  else {
    int v1 = 0;
  }
  if (v0[1]) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  return sub_1000F634C(v2 | *v0 | v1);
}

uint64_t sub_1000F64BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = v14 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v12 = sub_100032FA0(&qword_100156688);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    v13(a1 + *(int *)(a3 + 32), (uint64_t)a2 + *(int *)(a3 + 32), v12);
  }
  return a1;
}

uint64_t sub_1000F65E0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_100032FA0(&qword_100156688);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);

  return v8(v6, v5);
}

uint64_t sub_1000F669C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v11 = sub_100032FA0(&qword_100156688);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  v12(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v11);
  return a1;
}

uint64_t sub_1000F6770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100032FA0(&qword_100156688);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v10);
  return a1;
}

uint64_t sub_1000F6860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100032FA0(&qword_100156688);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v9);
  return a1;
}

uint64_t sub_1000F6928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100032FA0(&qword_100156688);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v10);
  return a1;
}

uint64_t sub_1000F6A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F6A14);
}

uint64_t sub_1000F6A14(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100032FA0(&qword_100156688);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000F6AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F6ADC);
}

uint64_t sub_1000F6ADC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100156688);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for UnitConversionCategoryButton(uint64_t a1)
{
  return sub_10001F0E0(a1, qword_100159EB0);
}

void sub_1000F6BA8()
{
  sub_10003B690();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000F6C58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F6C74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v3 = type metadata accessor for AccessibilityTraits();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  __chkstk_darwin(v3);
  uint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UnitConversionCategoryButtonStyle(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UnitConversionCategoryButton(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = sub_100032FA0(&qword_100159EF8);
  uint64_t v37 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100032FA0(&qword_100159F00);
  uint64_t v38 = *(void *)(v14 - 8);
  uint64_t v39 = v14;
  __chkstk_darwin(v14);
  char v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100032FA0(&qword_100159F08);
  __chkstk_darwin(v40);
  char v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  unsigned __int8 v36 = (char *)&v36 - v20;
  __chkstk_darwin(v21);
  long long v41 = (char *)&v36 - v22;
  sub_1000F8634(v2, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UnitConversionCategoryButton);
  unint64_t v23 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v24 = swift_allocObject();
  sub_1000F767C((uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  uint64_t v46 = v2;
  sub_100032FA0(&qword_100159F10);
  sub_1000F774C();
  Button.init(action:label:)();
  *uint64_t v7 = *(unsigned char *)(v2 + 16);
  if (qword_100154370 != -1) {
    swift_once();
  }
  uint64_t v47 = (void *)qword_100160E58;
  sub_10003B8D0();
  ScaledMetric.init(wrappedValue:)();
  uint64_t v25 = sub_100040BE4(&qword_100159F30, &qword_100159EF8);
  uint64_t v26 = sub_1000F783C(&qword_100159F38, (void (*)(uint64_t))type metadata accessor for UnitConversionCategoryButtonStyle);
  View.buttonStyle<A>(_:)();
  sub_1000F869C((uint64_t)v7, type metadata accessor for UnitConversionCategoryButtonStyle);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v11);
  uint64_t v47 = (void *)v11;
  uint64_t v48 = v5;
  uint64_t v49 = v25;
  uint64_t v50 = v26;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v39;
  View.accessibilityIdentifier(_:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v27);
  uint64_t v28 = *(void *)(v2 + 8);
  uint64_t v47 = *(void **)v2;
  uint64_t v48 = v28;
  sub_100023B24();
  uint64_t v29 = (uint64_t)v36;
  ModifiedContent<>.accessibilityLabel<A>(_:)();
  sub_100032F44((uint64_t)v18, &qword_100159F08);
  if (*(unsigned char *)(v2 + 16) == 1)
  {
    sub_100032FA0(&qword_100155760);
    uint64_t v30 = v43;
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_10010DCB0;
    static AccessibilityTraits.isSelected.getter();
    uint64_t v47 = (void *)v31;
    sub_1000F783C(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100032FA0(&qword_100155748);
    sub_100040BE4(&qword_100155750, &qword_100155748);
    uint64_t v32 = v42;
    uint64_t v33 = v44;
    dispatch thunk of SetAlgebra.init<A>(_:)();
  }
  else
  {
    uint64_t v47 = _swiftEmptyArrayStorage;
    sub_1000F783C(&qword_100155740, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100032FA0(&qword_100155748);
    sub_100040BE4(&qword_100155750, &qword_100155748);
    uint64_t v32 = v42;
    uint64_t v33 = v44;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v30 = v43;
  }
  uint64_t v34 = (uint64_t)v41;
  ModifiedContent<>.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  sub_100032F44(v29, &qword_100159F08);
  return sub_10002D9D0(v34, v45, &qword_100159F08);
}

uint64_t sub_1000F73E4@<X0>(uint64_t a1@<X8>)
{
  sub_100023B24();
  swift_bridgeObjectRetain();
  uint64_t v23 = Text.init<A>(_:)();
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v7 = v6;
  char v8 = static Edge.Set.vertical.getter();
  type metadata accessor for UnitConversionCategoryButton(0);
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  EdgeInsets.init(_all:)();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v17 = static Edge.Set.horizontal.getter();
  ScaledMetric.wrappedValue.getter();
  uint64_t result = EdgeInsets.init(_all:)();
  *(void *)a1 = v23;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v12;
  *(void *)(a1 + 56) = v14;
  *(void *)(a1 + 64) = v16;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = v17;
  *(void *)(a1 + 88) = v19;
  *(void *)(a1 + 96) = v20;
  *(void *)(a1 + 104) = v21;
  *(void *)(a1 + 112) = v22;
  *(unsigned char *)(a1 + 120) = 0;
  return result;
}

uint64_t type metadata accessor for UnitConversionCategoryButtonStyle(uint64_t a1)
{
  return sub_10001F0E0(a1, qword_100159F98);
}

uint64_t sub_1000F7550()
{
  uint64_t v1 = (int *)(type metadata accessor for UnitConversionCategoryButton(0) - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = v2 + v1[9];
  uint64_t v4 = sub_100032FA0(&qword_100156688);
  char v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v2 + v1[10], v4);

  return swift_deallocObject();
}

uint64_t sub_1000F767C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnitConversionCategoryButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000F76E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for UnitConversionCategoryButton(0) - 8);
  return (*(uint64_t (**)(void))(v0
                              + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                              + 24))();
}

uint64_t sub_1000F7744@<X0>(uint64_t a1@<X8>)
{
  return sub_1000F73E4(a1);
}

unint64_t sub_1000F774C()
{
  unint64_t result = qword_100159F18;
  if (!qword_100159F18)
  {
    sub_1000317D8(&qword_100159F10);
    sub_1000F77C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159F18);
  }
  return result;
}

unint64_t sub_1000F77C8()
{
  unint64_t result = qword_100159F20;
  if (!qword_100159F20)
  {
    sub_1000317D8(&qword_100159F28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159F20);
  }
  return result;
}

uint64_t sub_1000F783C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_1000F7884(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_100032FA0(&qword_100156688);
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1000F7954(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_100032FA0(&qword_100156688);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *sub_1000F79C0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100032FA0(&qword_100156688);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1000F7A40(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100032FA0(&qword_100156688);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1000F7AC0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100032FA0(&qword_100156688);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1000F7B40(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100032FA0(&qword_100156688);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1000F7BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F7BD4);
}

uint64_t sub_1000F7BD4(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_100032FA0(&qword_100156688);
    uint64_t v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = &a1[*(int *)(a3 + 20)];
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000F7C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F7C9C);
}

unsigned char *sub_1000F7C9C(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    int *result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_100032FA0(&qword_100156688);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000F7D44()
{
  sub_10003B690();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1000F7DE0()
{
  unint64_t result = qword_100159FD0;
  if (!qword_100159FD0)
  {
    sub_1000317D8(&qword_100159F08);
    sub_1000317D8(&qword_100159EF8);
    type metadata accessor for UnitConversionCategoryButtonStyle(255);
    sub_100040BE4(&qword_100159F30, &qword_100159EF8);
    sub_1000F783C(&qword_100159F38, (void (*)(uint64_t))type metadata accessor for UnitConversionCategoryButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_1000F783C(&qword_100155368, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159FD0);
  }
  return result;
}

uint64_t sub_1000F7F34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F7F50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v50 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v50);
  uint64_t v51 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  BOOL v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032FA0(&qword_100158670);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100032FA0(&qword_100158678);
  __chkstk_darwin(v42);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100032FA0(&qword_100158680);
  __chkstk_darwin(v43);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100032FA0(&qword_100159FD8);
  __chkstk_darwin(v44);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100032FA0(&qword_100159FE0);
  __chkstk_darwin(v45);
  uint64_t v49 = (uint64_t)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100032FA0(&qword_100159FE8);
  __chkstk_darwin(v47);
  uint64_t v48 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  if (qword_1001546D8 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_1001612F0;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  uint64_t v19 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  uint64_t *v19 = KeyPath;
  v19[1] = v17;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  swift_retain();
  v20(v5, v2);
  uint64_t v21 = swift_getKeyPath();
  sub_100033344((uint64_t)v8, (uint64_t)v10, &qword_100158670);
  uint64_t v22 = (uint64_t *)&v10[*(int *)(v42 + 36)];
  *uint64_t v22 = v21;
  v22[1] = 0x3FB999999999999ALL;
  sub_100032F44((uint64_t)v8, &qword_100158670);
  uint64_t v23 = swift_getKeyPath();
  sub_100033344((uint64_t)v10, (uint64_t)v12, &qword_100158678);
  uint64_t v24 = &v12[*(int *)(v43 + 36)];
  *(void *)uint64_t v24 = v23;
  *((void *)v24 + 1) = 1;
  v24[16] = 0;
  sub_100032F44((uint64_t)v10, &qword_100158678);
  int v25 = *v46;
  if (v25 == 1)
  {
    if (qword_100154570 != -1) {
      swift_once();
    }
    uint64_t v26 = &qword_100161178;
  }
  else
  {
    if (qword_100154568 != -1) {
      swift_once();
    }
    uint64_t v26 = &qword_100161170;
  }
  uint64_t v27 = *v26;
  swift_retain();
  uint64_t v28 = swift_getKeyPath();
  sub_100033344((uint64_t)v12, (uint64_t)v14, &qword_100158680);
  uint64_t v29 = (uint64_t *)&v14[*(int *)(v44 + 36)];
  *uint64_t v29 = v28;
  v29[1] = v27;
  sub_100032F44((uint64_t)v12, &qword_100158680);
  if (v25)
  {
    if (qword_100154578 != -1) {
      swift_once();
    }
    uint64_t v30 = qword_100161180;
    swift_retain();
  }
  else
  {
    uint64_t v30 = static Color.clear.getter();
  }
  char v31 = static Edge.Set.all.getter();
  uint64_t v32 = v49;
  sub_100033344((uint64_t)v14, v49, &qword_100159FD8);
  uint64_t v33 = v32 + *(int *)(v45 + 36);
  *(void *)uint64_t v33 = v30;
  *(unsigned char *)(v33 + 8) = v31;
  sub_100032F44((uint64_t)v14, &qword_100159FD8);
  type metadata accessor for UnitConversionCategoryButtonStyle(0);
  sub_100032FA0(&qword_100156688);
  ScaledMetric.wrappedValue.getter();
  uint64_t v34 = v53;
  uint64_t v35 = v51;
  unsigned __int8 v36 = &v51[*(int *)(v50 + 20)];
  uint64_t v37 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v38 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 104))(v36, v37, v38);
  *uint64_t v35 = v34;
  v35[1] = v34;
  uint64_t v39 = (uint64_t)v48;
  uint64_t v40 = (uint64_t)&v48[*(int *)(v47 + 36)];
  sub_1000F8634((uint64_t)v35, v40, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v40 + *(int *)(sub_100032FA0(&qword_100156D98) + 36)) = 256;
  sub_100033344(v32, v39, &qword_100159FE0);
  sub_1000F869C((uint64_t)v35, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_100032F44(v32, &qword_100159FE0);
  return sub_10002D9D0(v39, v52, &qword_100159FE8);
}

uint64_t sub_1000F8634(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000F869C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000F8700()
{
  unint64_t result = qword_100159FF0;
  if (!qword_100159FF0)
  {
    sub_1000317D8(&qword_100159FE8);
    sub_1000F87A0();
    sub_100040BE4(&qword_100157D98, &qword_100156D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159FF0);
  }
  return result;
}

unint64_t sub_1000F87A0()
{
  unint64_t result = qword_100159FF8;
  if (!qword_100159FF8)
  {
    sub_1000317D8(&qword_100159FE0);
    sub_1000F8840();
    sub_100040BE4(&qword_100155370, &qword_100155378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159FF8);
  }
  return result;
}

unint64_t sub_1000F8840()
{
  unint64_t result = qword_10015A000;
  if (!qword_10015A000)
  {
    sub_1000317D8(&qword_100159FD8);
    sub_10003A2C8();
    sub_100040BE4(&qword_100155410, &qword_100155418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A000);
  }
  return result;
}

id sub_1000F88E0()
{
  swift_getKeyPath();
  sub_10003C394();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 56);

  return v1;
}

uint64_t sub_1000F8960()
{
  swift_getKeyPath();
  sub_10003C394();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 64);
}

id sub_1000F89D0()
{
  swift_getKeyPath();
  sub_10003C394();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 48);

  return v1;
}

uint64_t sub_1000F8A50(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = a2;
  return result;
}

uint64_t sub_1000F8A58(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if (!a2)
  {
    if (qword_100154750 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100021598(v10, (uint64_t)qword_100161340);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v11, "Prompt to unlock succeeded", v12, 2u);
      swift_slowDealloc();
    }
    goto LABEL_11;
  }
  swift_errorRetain();
  if (qword_100154750 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100021598(v5, (uint64_t)qword_100161340);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v6, v7))
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
LABEL_11:

    return a3(a2);
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  uint64_t v9 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 138412290;
  swift_errorRetain();
  uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *uint64_t v9 = v14;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v6, v7, "Prompt to unlock failed: %@", v8, 0xCu);
  sub_100032FA0(&qword_100154BE0);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
  return a3(a2);
}

void sub_1000F8CF8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1000F8D84()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10Calculator11AppSettings___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1000F8E34()
{
  return type metadata accessor for AppSettings();
}

void sub_1000F8E4C(uint64_t a1, uint64_t a2)
{
  id v4 = [self serviceWithDefaultShellEndpoint];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_100032FA0(&qword_10015A0F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10010DCB0;
    uint64_t aBlock = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v7;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = 1;
    sub_100070B60(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v9 = [self optionsWithDictionary:isa];

    if (qword_100154750 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100021598(v10, (uint64_t)qword_100161340);
    os_log_type_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Will attempt to open Calculator application for prompt to unlock", v13, 2u);
      swift_slowDealloc();
    }

    NSString v14 = String._bridgeToObjectiveC()();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a1;
    *(void *)(v15 + 24) = a2;
    int v25 = sub_1000F9234;
    uint64_t v26 = v15;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    uint64_t v23 = sub_1000F8CF8;
    uint64_t v24 = &unk_10014E890;
    uint64_t v16 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v5 openApplication:v14 withOptions:v9 completion:v16];
    _Block_release(v16);
  }
  else
  {
    if (qword_100154750 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100021598(v17, (uint64_t)qword_100161340);
    oslog = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Unable to create the FrontBoard open application service", v19, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000F91FC()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000F9234(uint64_t a1, uint64_t a2)
{
  return sub_1000F8A58(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1000F923C()
{
  return swift_release();
}

uint64_t sub_1000F924C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1000F92BC(uint64_t a1)
{
  uint64_t v2 = sub_100032FA0(&qword_10015A100);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000F9324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000F938C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000F93F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000F945C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000F94C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F94D8);
}

uint64_t sub_1000F94D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000F9548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F955C);
}

uint64_t sub_1000F955C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032FA0(&qword_10015A100);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1000F95D0()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_1000F95F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LayoutDirection();
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.layoutDirection.setter();
}

void sub_1000F96BC(char *a1)
{
}

uint64_t sub_1000F96E4()
{
  type metadata accessor for CalculatorAppScene(0);
  sub_100032FA0(&qword_10015A1B0);
  LazyState.wrappedValue.getter();
  uint64_t v0 = *(void *)(v6 + 24);
  type metadata accessor for AnalyticsTimeStampInfo();
  uint64_t v1 = swift_allocObject();
  Date.init()();
  Date.init()();
  *(void *)(v0 + 16) = v1;
  swift_release();
  uint64_t v2 = swift_retain();
  sub_10005E97C(v2, v0);
  swift_release_n();
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1001613A0;
  sub_100006C54();
  swift_getKeyPath();
  sub_10001EFCC((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  if (*(unsigned char *)(v3 + 64) == 1)
  {
    uint64_t v5 = Transaction.disablesAnimations.setter();
    __chkstk_darwin(v5);
    swift_retain();
    withTransaction<A>(_:_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000F98E4()
{
  type metadata accessor for CalculatorAppScene(0);
  sub_100032FA0(&qword_10015A1B0);
  LazyState.wrappedValue.getter();
  swift_getKeyPath();
  sub_10001EFCC((unint64_t *)&qword_100154818, (void (*)(uint64_t))type metadata accessor for CalculatorViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v0 = *(unsigned __int8 *)(v9 + 48);
  swift_release();
  switch(v0)
  {
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v1)
      {
LABEL_4:
        LazyState.wrappedValue.getter();
        sub_100055FF0(0);
        swift_release();
      }
      sub_100032FA0(&qword_10015A1C0);
      LazyState.wrappedValue.getter();
      swift_getKeyPath();
      sub_10001EFCC(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      int v2 = *(unsigned __int8 *)(v9 + 16);
      swift_release();
      if (v2 == 1)
      {
        LazyState.wrappedValue.getter();
        if (qword_100154790 != -1) {
          swift_once();
        }
        sub_100006C54();
        sub_1000943FC(0);
        swift_release();
      }
      LazyState.wrappedValue.getter();
      uint64_t v3 = *(void *)(v9 + 16);
      swift_getKeyPath();
      sub_10001EFCC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v3 + 41) == 1)
      {
        swift_release();
      }
      else
      {
        sub_100034264();
        swift_retain();
        CalculateExpression.rich.getter();
        char v4 = dispatch thunk of CalculateExpression.RichExpression.isEmpty.getter();
        swift_release();
        if (v4)
        {
          swift_release();
          return swift_release();
        }
        CalculateExpression.rich.getter();
        char v5 = dispatch thunk of CalculateExpression.RichExpression.isZero.getter();
        swift_release();
        swift_release();
        uint64_t result = swift_release();
        if (v5) {
          return result;
        }
      }
      LazyState.wrappedValue.getter();
      uint64_t v7 = *(void *)(v3 + 16);
      swift_retain();
      swift_release();
      sub_100034264();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      sub_1000DD494();
      swift_retain();
      CalculateExpression.clear()();
      swift_release();
      swift_getKeyPath();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      if (*(unsigned char *)(v7 + 41) == 1)
      {
        uint64_t KeyPath = swift_getKeyPath();
        __chkstk_darwin(KeyPath);
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
        swift_release();
        return swift_release();
      }
      return swift_release();
  }
}

uint64_t sub_1000F9E14()
{
  type metadata accessor for CalculatorAppScene(0);
  sub_100032FA0(&qword_10015A1B0);
  LazyState.wrappedValue.getter();
  uint64_t v0 = *(void *)(v6 + 16);
  swift_getKeyPath();
  sub_10001EFCC(&qword_100155210, (void (*)(uint64_t))type metadata accessor for CalculatorExpressionManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v0 + 41) == 1)
  {
    swift_release();
    goto LABEL_6;
  }
  sub_100034264();
  swift_retain();
  CalculateExpression.rich.getter();
  char v1 = dispatch thunk of CalculateExpression.RichExpression.isEmpty.getter();
  swift_release();
  if (v1)
  {
    swift_release();
LABEL_7:
    swift_release();
    goto LABEL_8;
  }
  CalculateExpression.rich.getter();
  char v2 = dispatch thunk of CalculateExpression.RichExpression.isZero.getter();
  swift_release();
  swift_release();
  swift_release();
  if ((v2 & 1) == 0)
  {
LABEL_6:
    LazyState.wrappedValue.getter();
    sub_10005B41C();
    goto LABEL_7;
  }
LABEL_8:
  LazyState.wrappedValue.getter();
  uint64_t v3 = *(void *)(v0 + 24);
  swift_retain();
  sub_10005ECF0(0, v0, v3);
  swift_release_n();
  LazyState.wrappedValue.getter();
  uint64_t v4 = *(void *)(v0 + 24);
  swift_retain();
  sub_10005F1C4(0, v0, v4);
  return swift_release_n();
}

uint64_t sub_1000FA00C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  char v56 = (int *)sub_100032FA0(&qword_10015A2D0);
  __chkstk_darwin(v56);
  uint64_t v51 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100032FA0(&qword_10015A2D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v61 = (uint64_t)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100032FA0(&qword_10015A2E0);
  uint64_t v60 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v47 - v8;
  uint64_t v10 = sub_100032FA0(&qword_10015A2E8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v47 - v15;
  uint64_t v17 = type metadata accessor for CommandGroupPlacement();
  __chkstk_darwin(v17 - 8);
  __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  uint64_t v59 = sub_100032FA0(&qword_10015A2F0);
  uint64_t v50 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v21 = (char *)v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CommandGroupPlacement.newItem.getter();
  uint64_t v58 = v21;
  CommandGroup.init(replacing:addition:)();
  static CommandGroupPlacement.toolbar.getter();
  uint64_t v63 = a1;
  sub_100032FA0(&qword_10015A2F8);
  sub_100040BE4(&qword_10015A300, &qword_10015A2F8);
  CommandGroup.init(before:addition:)();
  uint64_t v52 = v11;
  uint64_t v53 = v16;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v54 = v10;
  v22(v16, v13, v10);
  static CommandGroupPlacement.sidebar.getter();
  uint64_t v62 = a1;
  sub_100032FA0(&qword_10015A308);
  sub_100008E90();
  uint64_t v23 = (uint64_t)v48;
  CommandGroup.init(replacing:addition:)();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v60 + 32);
  char v55 = v9;
  uint64_t v25 = v49;
  v24(v9, v23);
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_6;
  }
  if (qword_100154760 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)qword_100161370;
  NSString v27 = String._bridgeToObjectiveC()();
  LODWORD(v26) = [v26 BOOLForKey:v27];

  if (v26)
  {
    uint64_t v28 = LocalizedStringKey.init(stringLiteral:)();
    uint64_t v48 = (char *)v29;
    v47[1] = v30;
    __chkstk_darwin(v28);
    v47[-2] = a1;
    sub_100032FA0(&qword_100156420);
    uint64_t v31 = sub_1000317D8(&qword_1001555F0);
    uint64_t v32 = sub_100040BE4(&qword_100156428, &qword_1001555F0);
    uint64_t v64 = v31;
    uint64_t v65 = v32;
    swift_getOpaqueTypeConformance2();
    uint64_t v33 = v61;
    CommandMenu.init(_:content:)();
    uint64_t v34 = sub_100032FA0(&qword_10015A328);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 0, 1, v34);
  }
  else
  {
LABEL_6:
    uint64_t v35 = sub_100032FA0(&qword_10015A328);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v61, 1, 1, v35);
  }
  unsigned __int8 v36 = &v51[v56[12]];
  uint64_t v37 = &v51[v56[16]];
  uint64_t v48 = &v51[v56[20]];
  uint64_t v38 = v50;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v51, v58, v59);
  uint64_t v40 = v52;
  uint64_t v39 = v53;
  uint64_t v41 = v54;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v36, v53, v54);
  uint64_t v42 = v60;
  uint64_t v43 = v37;
  uint64_t v44 = v55;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v43, v55, v25);
  uint64_t v45 = v61;
  sub_100033344(v61, (uint64_t)v48, &qword_10015A2D8);
  TupleCommandContent.init(_:)();
  sub_100032F44(v45, &qword_10015A2D8);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v25);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v58, v59);
}

uint64_t sub_1000FA7BC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v90 = type metadata accessor for KeyEquivalent();
  uint64_t v89 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v84 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100032FA0(&qword_100157E28);
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v83 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100032FA0(&qword_10015A338);
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v91 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_100032FA0(&qword_10015A340);
  __chkstk_darwin(v88);
  uint64_t v100 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v87 = (char *)&v67 - v8;
  __chkstk_darwin(v9);
  uint64_t v98 = (uint64_t)&v67 - v10;
  uint64_t v11 = type metadata accessor for Divider();
  uint64_t v94 = *(void *)(v11 - 8);
  uint64_t v95 = v11;
  __chkstk_darwin(v11);
  uint64_t v99 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v102 = (char *)&v67 - v14;
  uint64_t v81 = type metadata accessor for InlinePickerStyle();
  uint64_t v82 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100032FA0(&qword_10015A348);
  uint64_t v78 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v18 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100032FA0(&qword_10015A350);
  uint64_t v80 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_100032FA0(&qword_10015A358);
  uint64_t v77 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  uint64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v101 = (char *)&v67 - v24;
  uint64_t v72 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v71 = v25;
  int v69 = v26;
  uint64_t v70 = v27;
  uint64_t v75 = a1 + *(int *)(type metadata accessor for CalculatorAppScene(0) + 20);
  uint64_t v74 = sub_100032FA0(&qword_10015A1B0);
  LazyState.projectedValue.getter();
  uint64_t v29 = v104;
  uint64_t v28 = v105;
  uint64_t v30 = v106;
  swift_getKeyPath();
  uint64_t v104 = v29;
  uint64_t v105 = v28;
  uint64_t v106 = v30;
  uint64_t v73 = sub_100032FA0(&qword_10015A360);
  Binding.subscript.getter();
  uint64_t v31 = v83;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v104 = v108;
  uint64_t v105 = v109;
  LOBYTE(v106) = v110;
  uint64_t v103 = a1;
  sub_100032FA0(&qword_10015A368);
  sub_10003C768();
  sub_100040BE4(&qword_10015A378, &qword_10015A368);
  Picker<>.init<A>(_:selection:content:)();
  InlinePickerStyle.init()();
  uint64_t v32 = sub_100040BE4(&qword_10015A380, &qword_10015A348);
  uint64_t v33 = v76;
  uint64_t v34 = v81;
  View.pickerStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v34);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v18, v33);
  uint64_t v104 = v33;
  uint64_t v105 = v34;
  uint64_t v106 = v32;
  uint64_t v107 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v35 = v79;
  View.labelsHidden()();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v20, v35);
  uint64_t v36 = v77;
  uint64_t v37 = v22;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v101, v22, v97);
  Divider.init()();
  LazyState.projectedValue.getter();
  uint64_t v38 = v104;
  uint64_t v39 = v105;
  uint64_t v40 = v106;
  swift_getKeyPath();
  uint64_t v104 = v38;
  uint64_t v105 = v39;
  uint64_t v106 = v40;
  Binding.subscript.getter();
  uint64_t v41 = v84;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  Toggle.init(isOn:label:)();
  KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
  uint64_t v42 = static EventModifiers.command.getter();
  uint64_t v43 = static EventModifiers.option.getter();
  EventModifiers.init(rawValue:)();
  EventModifiers.init(rawValue:)();
  if (EventModifiers.init(rawValue:)() != v42) {
    EventModifiers.init(rawValue:)();
  }
  EventModifiers.init(rawValue:)();
  if (EventModifiers.init(rawValue:)() != v43) {
    EventModifiers.init(rawValue:)();
  }
  sub_100040BE4(&qword_100157E80, &qword_100157E28);
  uint64_t v44 = v91;
  uint64_t v45 = v86;
  View.keyboardShortcut(_:modifiers:)();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v41, v90);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v31, v45);
  LazyState.wrappedValue.getter();
  LOBYTE(v45) = sub_10000C780();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = swift_allocObject();
  *(unsigned char *)(v47 + 16) = (v45 & 1) == 0;
  uint64_t v48 = v92;
  uint64_t v49 = (uint64_t)v87;
  uint64_t v50 = v93;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v87, v44, v93);
  uint64_t v51 = (uint64_t *)(v49 + *(int *)(v88 + 36));
  *uint64_t v51 = KeyPath;
  v51[1] = (uint64_t)sub_1000E956C;
  v51[2] = v47;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v44, v50);
  uint64_t v52 = v98;
  sub_10002D9D0(v49, v98, &qword_10015A340);
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  uint64_t v54 = v37;
  uint64_t v68 = v37;
  uint64_t v55 = v97;
  v53(v37, v101, v97);
  uint64_t v57 = v94;
  uint64_t v56 = v95;
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
  v58(v99, v102, v95);
  sub_100033344(v52, v100, &qword_10015A340);
  uint64_t v59 = v96;
  v53(v96, v54, v55);
  uint64_t v60 = sub_100032FA0(&qword_10015A388);
  uint64_t v61 = v99;
  v58(&v59[*(int *)(v60 + 48)], v99, v56);
  uint64_t v62 = (uint64_t)&v59[*(int *)(v60 + 64)];
  uint64_t v63 = v100;
  sub_100033344(v100, v62, &qword_10015A340);
  sub_100032F44(v98, &qword_10015A340);
  uint64_t v64 = *(void (**)(char *, uint64_t))(v57 + 8);
  v64(v102, v56);
  uint64_t v65 = *(void (**)(char *, uint64_t))(v36 + 8);
  v65(v101, v55);
  sub_100032F44(v63, &qword_10015A340);
  v64(v61, v56);
  return ((uint64_t (*)(char *, uint64_t))v65)(v68, v55);
}

uint64_t sub_1000FB3C0@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a1;
  uint64_t v80 = a2;
  uint64_t v2 = sub_100032FA0(&qword_10015A390);
  __chkstk_darwin(v2 - 8);
  uint64_t v81 = (uint64_t)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v86 = (char *)&v67 - v5;
  uint64_t v82 = sub_100032FA0(&qword_10015A398);
  uint64_t v89 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  int v69 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v68 = (char *)&v67 - v8;
  __chkstk_darwin(v9);
  uint64_t v83 = (char *)&v67 - v10;
  __chkstk_darwin(v11);
  uint64_t v88 = (char *)&v67 - v12;
  uint64_t v91 = type metadata accessor for KeyEquivalent();
  uint64_t v13 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100032FA0(&qword_10015A3A0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100032FA0(&qword_10015A3A8);
  uint64_t v92 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v75 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v67 - v22;
  __chkstk_darwin(v24);
  int v26 = (char *)&v67 - v25;
  LOBYTE(v93) = 0;
  unint64_t v27 = sub_10003C768();
  PickerOption.init(value:content:)();
  KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
  static EventModifiers.command.getter();
  uint64_t v28 = sub_100040BE4(&qword_10015A3B0, &qword_10015A3A0);
  PickerContent.keyboardShortcut(_:modifiers:)();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v84 = v13 + 8;
  v29(v15, v91);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v17 + 8);
  v30(v19, v16);
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v92 + 32);
  uint64_t v87 = v26;
  v31(v26, v23, v90);
  uint64_t v32 = 1;
  LOBYTE(v93) = 1;
  unint64_t v74 = v27;
  PickerOption.init(value:content:)();
  KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
  static EventModifiers.command.getter();
  uint64_t v73 = v28;
  uint64_t v33 = v15;
  uint64_t v34 = v19;
  PickerContent.keyboardShortcut(_:modifiers:)();
  uint64_t v72 = v29;
  v29(v33, v91);
  uint64_t v76 = v16;
  uint64_t v77 = v17 + 8;
  uint64_t v71 = v30;
  v30(v19, v16);
  uint64_t v35 = &v85[*(int *)(type metadata accessor for CalculatorAppScene(0) + 40)];
  uint64_t v36 = *((void *)v35 + 1);
  uint64_t v93 = *(unsigned __int8 **)v35;
  uint64_t v94 = v36;
  sub_100032FA0(&qword_10015A3B8);
  State.wrappedValue.getter();
  uint64_t v37 = v97;
  swift_getKeyPath();
  uint64_t v93 = v37;
  uint64_t v70 = sub_10001EFCC((unint64_t *)&qword_100155218, (void (*)(uint64_t))type metadata accessor for CalculatorMDMRestrictionsManager);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();

  sub_100040BE4(&qword_10015A3C0, &qword_10015A3A8);
  uint64_t v38 = v83;
  uint64_t v39 = v90;
  PickerContent.disabled(_:)();
  uint64_t v40 = *(char **)(v92 + 8);
  uint64_t v41 = v23;
  uint64_t v42 = v82;
  v92 += 8;
  uint64_t v85 = v40;
  ((void (*)(char *, uint64_t))v40)(v41, v39);
  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v89 + 32);
  uint64_t v78 = v89 + 32;
  v79(v88, v38, v42);
  uint64_t v95 = &type metadata for NotesFeatureFlags;
  unint64_t v96 = sub_10003BF2C();
  LOBYTE(v19) = isFeatureEnabled(_:)();
  sub_10000DB7C((uint64_t)&v93);
  if (v19)
  {
    uint64_t v43 = v86;
    LOBYTE(v93) = 2;
    PickerOption.init(value:content:)();
    KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
    static EventModifiers.command.getter();
    uint64_t v44 = v75;
    uint64_t v45 = v76;
    PickerContent.keyboardShortcut(_:modifiers:)();
    v72(v33, v91);
    v71(v34, v45);
    uint64_t v46 = *((void *)v35 + 1);
    uint64_t v93 = *(unsigned __int8 **)v35;
    uint64_t v94 = v46;
    State.wrappedValue.getter();
    uint64_t v47 = v97;
    swift_getKeyPath();
    uint64_t v93 = v47;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    int v48 = v47[OBJC_IVAR____TtC10Calculator32CalculatorMDMRestrictionsManager__isCalculatorModeMathPaperAllowed];

    if (v48 == 1)
    {
      id v49 = objc_allocWithZone((Class)LSApplicationRecord);
      id v50 = sub_100006D80(0xD000000000000015, 0x80000001001094B0, 0);
      uint64_t v51 = v82;
      uint64_t v52 = v69;
      uint64_t v53 = v68;
      uint64_t v66 = v50;
      uint64_t v39 = v90;
      if (v50)
      {
        if (qword_1001541B0 != -1) {
          swift_once();
        }
        [(id)qword_100155018 requiresPreflightForApplicationRecord:v66];
      }
    }
    else
    {
      uint64_t v51 = v82;
      uint64_t v39 = v90;
      uint64_t v52 = v69;
      uint64_t v53 = v68;
    }
    PickerContent.disabled(_:)();
    ((void (*)(char *, uint64_t))v85)(v44, v39);
    uint64_t v54 = v79;
    v79(v53, v52, v51);
    v54(v43, v53, v51);
    uint64_t v32 = 0;
    uint64_t v42 = v51;
  }
  uint64_t v55 = v89;
  uint64_t v56 = (uint64_t)v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56))(v86, v32, 1, v42);
  uint64_t v57 = v80;
  dispatch thunk of PickerContent._identifiedView.getter();
  uint64_t v58 = sub_100032FA0(&qword_10015A3C8);
  sub_100040BE4(&qword_10015A3D0, &qword_10015A398);
  uint64_t v59 = v88;
  dispatch thunk of PickerContent._identifiedView.getter();
  uint64_t v60 = v57 + *(int *)(v58 + 64);
  uint64_t v61 = v81;
  sub_100033344(v56, v81, &qword_10015A390);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v61, 1, v42) == 1)
  {
    uint64_t v62 = sub_100032FA0(&qword_10015A3D8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v60, 1, 1, v62);
  }
  else
  {
    uint64_t v63 = v83;
    v79(v83, (char *)v61, v42);
    dispatch thunk of PickerContent._identifiedView.getter();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v63, v42);
    uint64_t v64 = sub_100032FA0(&qword_10015A3D8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v60, 0, 1, v64);
  }
  sub_100032F44(v56, &qword_10015A390);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v59, v42);
  return ((uint64_t (*)(char *, uint64_t))v85)(v87, v39);
}

uint64_t sub_1000FBF40@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000FBF68@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000FBF98@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000FBFC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000093AC(a1);
}

uint64_t sub_1000FBFE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = type metadata accessor for KeyEquivalent();
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for CalculatorAppScene(0);
  uint64_t v6 = *(void *)(v28 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v28);
  uint64_t v26 = sub_100032FA0(&qword_10015A318);
  uint64_t v8 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100032FA0(&qword_10015A330);
  uint64_t v11 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100032FA0(&qword_10015A308);
  __chkstk_darwin(v27);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F078(a1, (uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CalculatorAppScene);
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  sub_10001F014((uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  uint64_t v32 = a1;
  uint64_t v34 = a1;
  sub_100032FA0(&qword_1001563F8);
  sub_100023B78();
  Button.init(action:label:)();
  KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
  uint64_t v18 = static EventModifiers.command.getter();
  uint64_t v19 = static EventModifiers.control.getter();
  EventModifiers.init(rawValue:)();
  EventModifiers.init(rawValue:)();
  if (EventModifiers.init(rawValue:)() != v18) {
    EventModifiers.init(rawValue:)();
  }
  EventModifiers.init(rawValue:)();
  if (EventModifiers.init(rawValue:)() != v19) {
    EventModifiers.init(rawValue:)();
  }
  sub_100040BE4(&qword_10015A320, &qword_10015A318);
  uint64_t v20 = v26;
  View.keyboardShortcut(_:modifiers:)();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v30);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  sub_100032FA0(&qword_10015A1B0);
  LazyState.wrappedValue.getter();
  LOBYTE(v20) = sub_10000C4D8();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = (v20 & 1) == 0;
  uint64_t v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v31);
  uint64_t v24 = (uint64_t *)&v15[*(int *)(v27 + 36)];
  *uint64_t v24 = KeyPath;
  v24[1] = (uint64_t)sub_100037BB4;
  v24[2] = v22;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
  return sub_10002D9D0((uint64_t)v15, v33, &qword_10015A308);
}

uint64_t sub_1000FC4D4()
{
  return swift_release();
}

uint64_t sub_1000FC540()
{
  type metadata accessor for CalculatorAppScene(0);
  sub_100032FA0(&qword_10015A1C0);
  LazyState.wrappedValue.getter();
  swift_getKeyPath();
  sub_10001EFCC(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v0 = *(unsigned char *)(v5 + 16);
  char v1 = v0 ^ 1;
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1001613A0;
  sub_100006C54();
  if ((v0 & 1) != 0
    || (swift_getKeyPath(),
        sub_10001EFCC((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings), ObservationRegistrar.access<A, B>(_:keyPath:)(), swift_release(), *(unsigned char *)(v2 + 64) != 1))
  {
    sub_1000943FC(v1);
  }
  else
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v5;
    *(unsigned char *)(v3 + 24) = v1;
    swift_retain();
    sub_1000F8E4C((uint64_t)sub_10006C2D0, v3);
    swift_release();
  }
  return swift_release();
}

double sub_1000FC740@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CalculatorAppScene(0);
  sub_100032FA0(&qword_10015A1C0);
  LazyState.wrappedValue.getter();
  swift_getKeyPath();
  sub_10001EFCC(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_release();
  LocalizedStringKey.init(stringLiteral:)();
  Text.init(_:tableName:bundle:comment:)();
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_1000FC910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for KeyEquivalent();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin(v3);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CalculatorAppScene(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_100032FA0(&qword_1001555F0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100032FA0(&qword_100156420);
  uint64_t v13 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F078(a1, (uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CalculatorAppScene);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  sub_10001F014((uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  Button.init(action:label:)();
  KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
  uint64_t v18 = static EventModifiers.command.getter();
  EventModifiers.init(rawValue:)();
  EventModifiers.init(rawValue:)();
  if (EventModifiers.init(rawValue:)() != v18) {
    EventModifiers.init(rawValue:)();
  }
  sub_100040BE4(&qword_100156428, &qword_1001555F0);
  View.keyboardShortcut(_:modifiers:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(v23, v15, v20);
}

uint64_t sub_1000FCCA0()
{
  uint64_t v0 = type metadata accessor for OpenWindowAction();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D206C((uint64_t)v3);
  v4._countAndFlagsBits = 0x656D2D6775626564;
  v4._object = (void *)0xEA0000000000756ELL;
  OpenWindowAction.callAsFunction(id:)(v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000FCD84@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000FCDFC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1000FCE24()
{
  return EnvironmentValues.openWindow.getter();
}

uint64_t sub_1000FCE48()
{
  return swift_deallocObject();
}

uint64_t sub_1000FCE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = sub_100032FA0(&qword_100154A48);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100033344(a1, (uint64_t)v9, &qword_100154A48);
  return a5(v9);
}

uint64_t *sub_1000FCF24(uint64_t *a1, uint64_t *a2, int *a3)
{
  char v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    char v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100032FA0(&qword_1001590A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenWindowAction();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *char v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100032FA0(&qword_10015A1A8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = sub_100032FA0(&qword_10015A1B0);
    *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    unint64_t v16 = (uint64_t *)((char *)v4 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *unint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (uint64_t *)((char *)v4 + v15);
    uint64_t v20 = (uint64_t *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[8];
    uint64_t v23 = (char *)v4 + v22;
    uint64_t v24 = (char *)a2 + v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v25 = sub_100032FA0(&qword_10015A1B8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = sub_100032FA0(&qword_10015A1C0);
    *(void *)&v23[*(int *)(v26 + 28)] = *(void *)&v24[*(int *)(v26 + 28)];
    uint64_t v27 = a3[9];
    uint64_t v28 = a3[10];
    uint64_t v29 = (char *)v4 + v27;
    uint64_t v30 = (char *)a2 + v27;
    *uint64_t v29 = *v30;
    *((void *)v29 + 1) = *((void *)v30 + 1);
    uint64_t v31 = (uint64_t *)((char *)v4 + v28);
    uint64_t v32 = (char *)a2 + v28;
    uint64_t v34 = *(void **)v32;
    uint64_t v33 = *((void *)v32 + 1);
    *uint64_t v31 = *(void *)v32;
    v31[1] = v33;
    swift_retain();
    swift_retain();
    id v35 = v34;
  }
  swift_retain();
  return v4;
}

void *sub_1000FD19C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F44((uint64_t)a1, &qword_1001590A8);
    sub_100032FA0(&qword_1001590A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for OpenWindowAction();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100032FA0(&qword_10015A1A8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = sub_100032FA0(&qword_10015A1B0);
  *(void *)&v8[*(int *)(v11 + 28)] = *(void *)&v9[*(int *)(v11 + 28)];
  swift_retain();
  swift_release();
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_retain();
  swift_release();
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_retain();
  swift_release();
  uint64_t v15 = a3[7];
  unint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_retain();
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_100032FA0(&qword_10015A1B8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = sub_100032FA0(&qword_10015A1C0);
  *(void *)&v19[*(int *)(v22 + 28)] = *(void *)&v20[*(int *)(v22 + 28)];
  swift_retain();
  swift_release();
  uint64_t v23 = a3[9];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  *uint64_t v24 = *v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[10];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = *(void **)((char *)a2 + v26);
  uint64_t v30 = *(void **)v27;
  *(void *)uint64_t v27 = v29;
  id v31 = v29;

  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000FD440(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100032FA0(&qword_1001590A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for OpenWindowAction();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100032FA0(&qword_10015A1A8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = sub_100032FA0(&qword_10015A1B0);
  *(void *)&v9[*(int *)(v12 + 28)] = *(void *)&v10[*(int *)(v12 + 28)];
  uint64_t v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  unint64_t v16 = &a2[v14];
  uint64_t v17 = sub_100032FA0(&qword_10015A1B8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = sub_100032FA0(&qword_10015A1C0);
  *(void *)&v15[*(int *)(v18 + 28)] = *(void *)&v16[*(int *)(v18 + 28)];
  uint64_t v19 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v19] = *(_OWORD *)&a2[v19];
  return a1;
}

char *sub_1000FD600(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F44((uint64_t)a1, &qword_1001590A8);
    uint64_t v6 = sub_100032FA0(&qword_1001590A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenWindowAction();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100032FA0(&qword_10015A1A8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = sub_100032FA0(&qword_10015A1B0);
  *(void *)&v9[*(int *)(v12 + 28)] = *(void *)&v10[*(int *)(v12 + 28)];
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_100032FA0(&qword_10015A1B8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = sub_100032FA0(&qword_10015A1C0);
  *(void *)&v20[*(int *)(v23 + 28)] = *(void *)&v21[*(int *)(v23 + 28)];
  swift_release();
  uint64_t v24 = a3[9];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  uint64_t v27 = a3[10];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = *(void **)&a1[v27];
  *(void *)&a1[v27] = *(void *)v29;

  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1000FD868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FD87C);
}

uint64_t sub_1000FD87C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032FA0(&qword_10015A1C8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100032FA0(&qword_10015A1B0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_100032FA0(&qword_10015A1C0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[8];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1000FDA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FDA1C);
}

uint64_t sub_1000FDA1C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100032FA0(&qword_10015A1C8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100032FA0(&qword_10015A1B0);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = sub_100032FA0(&qword_10015A1C0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[8];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t sub_1000FDBA8()
{
  return sub_10001EFCC(&qword_10015A1A0, (void (*)(uint64_t))type metadata accessor for CalculatorAppScene);
}

uint64_t sub_1000FDBF4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FA00C(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000FDBFC@<X0>(char *a1@<X8>)
{
  return sub_1000FA7BC(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000FDC04@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FBFE4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000FDC0C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FC910(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000FDC18()
{
  uint64_t v1 = (int *)type metadata accessor for CalculatorAppScene(0);
  unint64_t v2 = (*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = v0 + v2;
  sub_100032FA0(&qword_1001590A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for OpenWindowAction();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v0 + v2, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = v3 + v1[5];
  uint64_t v6 = sub_100032FA0(&qword_10015A1A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_100032FA0(&qword_10015A1B0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v3 + v1[8];
  uint64_t v8 = sub_100032FA0(&qword_10015A1B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_100032FA0(&qword_10015A1C0);
  swift_release();
  swift_release();

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000FDE3C()
{
  return sub_1000FDE70((uint64_t (*)(uint64_t))sub_1000FCCA0);
}

uint64_t sub_1000FDE58()
{
  return sub_1000FDE70((uint64_t (*)(uint64_t))sub_1000FC4D4);
}

uint64_t sub_1000FDE70(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CalculatorAppScene(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

double sub_1000FDEE4@<D0>(uint64_t a1@<X8>)
{
  return sub_1000FC740(a1);
}

uint64_t sub_1000FDEF4()
{
  return swift_deallocObject();
}

uint64_t sub_1000FDF0C()
{
  return sub_1000FC540();
}

uint64_t sub_1000FDF30()
{
  swift_release();

  return swift_deallocObject();
}

void sub_1000FDF6C(unsigned __int8 *a1)
{
}

uint64_t sub_1000FDF94@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FB3C0(*(char **)(v1 + 16), a1);
}

void sub_1000FDFA0(char *a1)
{
}

uint64_t sub_1000FDFC8()
{
  return swift_deallocObject();
}

uint64_t sub_1000FDFF8()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_1000FE01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000FCE80(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.horizontalSizeClass.setter);
}

uint64_t sub_1000FE048()
{
  return EnvironmentValues.verticalSizeClass.getter();
}

uint64_t sub_1000FE06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000FCE80(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.verticalSizeClass.setter);
}

uint64_t sub_1000FE098()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_1000FE0C4()
{
  return sub_1000FDE70((uint64_t (*)(uint64_t))sub_1000F96E4);
}

uint64_t sub_1000FE0DC()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1000FE118()
{
  return sub_1000FDE70((uint64_t (*)(uint64_t))sub_1000F9E14);
}

uint64_t sub_1000FE138()
{
  return sub_1000F98E4();
}

uint64_t sub_1000FE154()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1000FE260(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = *(void *)(v8 + 64);
  unint64_t v12 = ((v11 + ((v6 + v9) & ~v9) + 23) & 0xFFFFFFFFFFFFFFF8) + 9;
  unsigned int v13 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v13 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v18 = ((unint64_t)v4 + v10) & v17;
    unint64_t v19 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v18, v19, v7);
    unint64_t v20 = (v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v21 = (v19 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = *(void *)v21;
    LOBYTE(v21) = *(unsigned char *)(v21 + 8);
    *(void *)unint64_t v20 = v22;
    *(unsigned char *)(v20 + 8) = v21;
    unint64_t v23 = (v18 + v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v19 + v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = *(void *)v24;
    LOBYTE(v24) = *(unsigned char *)(v24 + 8);
    *(void *)unint64_t v23 = v25;
    *(unsigned char *)(v23 + 8) = v24;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000FE430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 40);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  unint64_t v17 = (v14 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  LOBYTE(v18) = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = v18;
  swift_retain();
  swift_release();
  unint64_t v20 = (v15 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)v21;
  LOBYTE(v21) = *(unsigned char *)(v21 + 8);
  *(void *)unint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v21;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000FE54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 32);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v17 = v19;
  unint64_t v20 = (v15 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  *(void *)unint64_t v20 = v22;
  return a1;
}

uint64_t sub_1000FE648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 24);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  LOBYTE(v18) = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = v18;
  swift_release();
  unint64_t v20 = (v15 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)v21;
  LOBYTE(v21) = *(unsigned char *)(v21 + 8);
  *(void *)unint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v21;
  swift_release();
  return a1;
}

uint64_t sub_1000FE754(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v7 + 64);
  if (v8 <= v6) {
    unsigned int v11 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v7 + 84);
  }
  if (v11 <= 0xFE) {
    unsigned int v11 = 254;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(v4 - 8) + 64) + v9;
  if (v11 < a2)
  {
    unint64_t v13 = ((v10 + (v12 & ~v9) + 23) & 0xFFFFFFFFFFFFFFF8) + 9;
    unsigned int v14 = (a2 - v11 + 255) >> (8 * v13);
    if (v13 < 4) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      LODWORD(v16) = 4;
    }
    else {
      LODWORD(v16) = 2;
    }
    if (v15 < 0x100) {
      LODWORD(v16) = 1;
    }
    if (v15 >= 2) {
      uint64_t v16 = v16;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = a1[v13];
        if (!a1[v13]) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v17 = *(unsigned __int16 *)&a1[v13];
        if (*(_WORD *)&a1[v13]) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1000FE940);
      case 4:
        int v17 = *(_DWORD *)&a1[v13];
        if (!v17) {
          break;
        }
LABEL_24:
        int v19 = (v17 - 1) << (8 * v13);
        if (v13 >= 4) {
          int v19 = 0;
        }
        if (((v10 + (v12 & ~v9) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
          int v20 = *a1;
        }
        else {
          int v20 = *(_DWORD *)a1;
        }
        return v11 + (v20 | v19) + 1;
      default:
        break;
    }
  }
  if (v6 == v11) {
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48))(a1, v6, v4);
  }
  unint64_t v21 = (unint64_t)&a1[v12] & ~v9;
  if (v8 == v11) {
    return (*(uint64_t (**)(unint64_t))(v7 + 48))(v21);
  }
  unsigned int v22 = *(unsigned __int8 *)(((v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v22 > 1) {
    return (v22 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

void sub_1000FE954(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v8 + 64);
  if (v9 <= v7) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (v12 <= 0xFE) {
    unsigned int v12 = 254;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + v10;
  size_t v14 = ((v11 + (v13 & ~v10) + 23) & 0xFFFFFFFFFFFFFFF8) + 9;
  char v15 = 8 * v14;
  if (v12 >= a3)
  {
    int v19 = 0;
    if (v12 >= a2)
    {
LABEL_19:
      switch(v19)
      {
        case 1:
          a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 2:
          *(_WORD *)&a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 3:
          goto LABEL_52;
        case 4:
          *(_DWORD *)&a1[v14] = 0;
          goto LABEL_35;
        default:
LABEL_35:
          if (a2)
          {
LABEL_36:
            if (v7 == v12)
            {
              unsigned int v22 = *(void (**)(void))(v6 + 56);
              v22();
            }
            else
            {
              unint64_t v23 = (unint64_t)&a1[v13] & ~v10;
              if (v9 == v12)
              {
                unint64_t v24 = *(void (**)(unint64_t))(v8 + 56);
                v24(v23);
              }
              else
              {
                unint64_t v25 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
                if (a2 > 0xFE)
                {
                  *(unsigned char *)(v25 + 8) = 0;
                  *(void *)unint64_t v25 = a2 - 255;
                }
                else
                {
                  *(unsigned char *)(v25 + 8) = -(char)a2;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = (a3 - v12 + 255) >> v15;
    if (v14 <= 3) {
      unsigned int v17 = v16 + 1;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v12 >= a2) {
      goto LABEL_19;
    }
  }
  if (v14 < 4) {
    unsigned int v20 = ((~v12 + a2) >> v15) + 1;
  }
  else {
    unsigned int v20 = 1;
  }
  if (v14 >= 4) {
    unsigned int v21 = ~v12 + a2;
  }
  else {
    unsigned int v21 = (~(_BYTE)v12 + a2);
  }
  bzero(a1, v14);
  if (v14 == 1) {
    *a1 = v21;
  }
  else {
    *(_DWORD *)a1 = v21;
  }
  switch(v19)
  {
    case 1:
      a1[v14] = v20;
      break;
    case 2:
      *(_WORD *)&a1[v14] = v20;
      break;
    case 3:
LABEL_52:
      __break(1u);
      JUMPOUT(0x1000FEC20);
    case 4:
      *(_DWORD *)&a1[v14] = v20;
      break;
    default:
      return;
  }
}

uint64_t sub_1000FEC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for _ConditionalContent.Storage();
  double v6 = __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t, double))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3, v6);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000FED40@<X0>(uint64_t a1@<X3>, char *a2@<X8>)
{
  unsigned int v20 = a2;
  uint64_t v3 = type metadata accessor for ModifiedContent();
  uint64_t v19 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v17 - v4;
  uint64_t v23 = a1;
  unint64_t v24 = &protocol witness table for _PaddingLayout;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v21 = v3;
  uint64_t v22 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v7 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unsigned int v12 = (char *)&v17 - v11;
  static Edge.Set.horizontal.getter();
  View.padding(_:_:)();
  sub_100032FA0(&qword_10015A4D0);
  type metadata accessor for PresentationDetent();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100110A40;
  static PresentationDetent.medium.getter();
  static PresentationDetent.large.getter();
  sub_100068174(v13);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  View.presentationDetents(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
  size_t v14 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v14(v12, v9, OpaqueTypeMetadata2);
  char v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, OpaqueTypeMetadata2);
  v14(v20, v12, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v15)(v12, OpaqueTypeMetadata2);
}

uint64_t sub_1000FF08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a3 + *(int *)(type metadata accessor for CalculatorPresentationView() + 60) + 8);
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_10003B8B4(v4, v3);
  swift_release();
  swift_getKeyPath();
  sub_100012230(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v6 = *(unsigned __int8 *)(v5 + 16);
  swift_release();
  if (v6 == 1) {
    return static NavigationSplitViewVisibility.all.getter();
  }
  else {
    return static NavigationSplitViewVisibility.detailOnly.getter();
  }
}

uint64_t sub_1000FF190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = type metadata accessor for NavigationSplitViewVisibility();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unsigned int v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[0] = a5;
  v23[1] = a6;
  void v23[2] = a7;
  v23[3] = a8;
  LOBYTE(a8) = *(unsigned char *)(a4 + *(int *)(type metadata accessor for CalculatorPresentationView() + 60) + 8);
  uint64_t v17 = swift_retain();
  uint64_t v18 = sub_10003B8B4(v17, a8);
  swift_release();
  static NavigationSplitViewVisibility.all.getter();
  char v19 = static NavigationSplitViewVisibility.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (qword_100154790 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1001613A0;
  sub_100006C54();
  if ((v19 & 1) != 0
    && (swift_getKeyPath(),
        v23[0] = v20,
        sub_100012230((unint64_t *)&qword_100155228, (void (*)(uint64_t))type metadata accessor for AppSettings), ObservationRegistrar.access<A, B>(_:keyPath:)(), swift_release(), *(unsigned char *)(v20 + 64) == 1))
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v18;
    *(unsigned char *)(v21 + 24) = 1;
    swift_retain();
    sub_1000F8E4C((uint64_t)sub_10006C2D0, v21);
    swift_release();
  }
  else
  {
    sub_1000943FC(v19 & 1);
  }
  return swift_release();
}

uint64_t sub_1000FF3FC@<X0>(uint64_t a1@<X3>, char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ModifiedContent();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v15 - v9;
  sub_1000FF588();
  unint64_t v11 = sub_10003BF90();
  v15[0] = a1;
  v15[1] = v11;
  swift_getWitnessTable();
  unsigned int v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v12(v10, v7, v4);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  v12(a2, v10, v4);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, v4);
}

uint64_t sub_1000FF588()
{
  return swift_release();
}

uint64_t sub_1000FF64C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = a4;
  uint64_t v40 = a6;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  uint64_t v48 = a5;
  uint64_t v9 = type metadata accessor for CalculatorPresentationView();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v35 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v33 = (char *)&v31 - v11;
  uint64_t v12 = type metadata accessor for ModifiedContent();
  uint64_t v39 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v32 = (char *)&v31 - v13;
  uint64_t v14 = type metadata accessor for ModifiedContent();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v34 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v36 = (char *)&v31 - v18;
  uint64_t v19 = a3;
  View.modifier<A>(_:)();
  uint64_t v20 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v33, a1, v9);
  unint64_t v21 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = (char *)swift_allocObject();
  *((void *)v22 + 2) = v37;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v38;
  *((void *)v22 + 5) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v22[v21], v20, v9);
  unint64_t v23 = sub_10003C064();
  uint64_t v43 = a5;
  unint64_t v44 = v23;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v25 = v34;
  uint64_t v26 = v32;
  View.onAppear(perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v12);
  uint64_t v41 = WitnessTable;
  uint64_t v42 = &protocol witness table for _AppearanceActionModifier;
  swift_getWitnessTable();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v28 = v36;
  v27(v36, v25, v14);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v25, v14);
  v27(v40, v28, v14);
  return ((uint64_t (*)(char *, uint64_t))v29)(v28, v14);
}

uint64_t sub_1000FFA04(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + *(int *)(type metadata accessor for CalculatorPresentationView() + 60) + 8);
  uint64_t v2 = swift_retain();
  sub_10003B8B4(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_100012230(&qword_100154FF0, (void (*)(uint64_t))type metadata accessor for CalculatorToolbarViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_1000FFB20()
{
  uint64_t v1 = *(void *)(type metadata accessor for CalculatorPresentationView() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000FF08C(v2, v3, v4);
}

uint64_t sub_1000FFBD4(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = *(void *)(type metadata accessor for CalculatorPresentationView() - 8);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_1000FF190(a1, v8, v9, v10, v3, v4, v5, v6);
}

uint64_t sub_1000FFC84()
{
  return sub_1000FFCB4((uint64_t (*)(void, void, void, void, void))sub_1000FF3FC);
}

uint64_t sub_1000FFC9C()
{
  return sub_1000FFCB4((uint64_t (*)(void, void, void, void, void))sub_1000FF64C);
}

uint64_t sub_1000FFCB4(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000FFCCC@<X0>(uint64_t a1@<X0>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v100 = a1;
  uint64_t v124 = a3;
  int v104 = a2 & 1;
  uint64_t v3 = type metadata accessor for ContainerBackgroundPlacement();
  uint64_t v122 = *(void *)(v3 - 8);
  uint64_t v123 = v3;
  __chkstk_darwin(v3);
  uint64_t v121 = (char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v99);
  uint64_t v6 = (_OWORD *)((char *)&v96 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = sub_100032FA0(&qword_10015A4D8);
  __chkstk_darwin(v97);
  uint64_t v8 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100032FA0(&qword_10015A4E0);
  __chkstk_darwin(v98);
  uint64_t v10 = (char *)&v96 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_100032FA0(&qword_10015A4E8);
  __chkstk_darwin(v101);
  uint64_t v12 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100032FA0(&qword_10015A4F0);
  __chkstk_darwin(v102);
  uint64_t v103 = (uint64_t)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_100032FA0(&qword_10015A4F8);
  __chkstk_darwin(v106);
  uint64_t v105 = (uint64_t)&v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_100032FA0(&qword_10015A500);
  uint64_t v108 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v107 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100032FA0(&qword_10015A508);
  uint64_t v117 = *(void *)(v16 - 8);
  uint64_t v118 = v16;
  __chkstk_darwin(v16);
  uint64_t v111 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100032FA0(&qword_10015A510);
  uint64_t v119 = *(void *)(v18 - 8);
  uint64_t v120 = v18;
  __chkstk_darwin(v18);
  uint64_t v115 = (char *)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_100032FA0(&qword_10015A518);
  __chkstk_darwin(v116);
  char v113 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100032FA0(&qword_10015A520);
  uint64_t v112 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  uint64_t v109 = (char *)&v96 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100154638 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_100161240;
  swift_retain();
  uint64_t v23 = static Color.black.getter();
  char v24 = static Edge.Set.all.getter();
  uint64_t v25 = static Alignment.center.getter();
  uint64_t v27 = v26;
  uint64_t v28 = sub_100032FA0(&qword_10015A528);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v8, v100, v28);
  uint64_t v29 = &v8[*(int *)(v97 + 36)];
  *(void *)uint64_t v29 = v22;
  *((void *)v29 + 1) = v23;
  v29[16] = v24;
  *((void *)v29 + 3) = v25;
  *((void *)v29 + 4) = v27;
  uint64_t v30 = (char *)v6 + *(int *)(v99 + 20);
  uint64_t v31 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v32 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #20.0 }
  *uint64_t v6 = _Q0;
  uint64_t v38 = (uint64_t)&v10[*(int *)(v98 + 36)];
  sub_100093634((uint64_t)v6, v38);
  *(_WORD *)(v38 + *(int *)(sub_100032FA0(&qword_100156D98) + 36)) = 256;
  sub_100033344((uint64_t)v8, (uint64_t)v10, &qword_10015A4D8);
  sub_100093698((uint64_t)v6);
  sub_100032F44((uint64_t)v8, &qword_10015A4D8);
  char v39 = static Edge.Set.top.getter();
  if (qword_100154288 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  sub_100033344((uint64_t)v10, (uint64_t)v12, &qword_10015A4E0);
  uint64_t v48 = &v12[*(int *)(v101 + 36)];
  *uint64_t v48 = v39;
  *((void *)v48 + 1) = v41;
  *((void *)v48 + 2) = v43;
  *((void *)v48 + 3) = v45;
  *((void *)v48 + 4) = v47;
  v48[40] = 0;
  sub_100032F44((uint64_t)v10, &qword_10015A4E0);
  char v49 = static Edge.Set.bottom.getter();
  uint64_t v50 = swift_retain();
  char v51 = v104;
  sub_10002BD88(v50, v104);
  swift_release();
  sub_10001A4E8();
  swift_release();
  EdgeInsets.init(_all:)();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v103;
  sub_100033344((uint64_t)v12, v103, &qword_10015A4E8);
  uint64_t v61 = v60 + *(int *)(v102 + 36);
  *(unsigned char *)uint64_t v61 = v49;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_100032F44((uint64_t)v12, &qword_10015A4E8);
  char v62 = static Edge.Set.leading.getter();
  uint64_t v63 = swift_retain();
  sub_10002BD88(v63, v51);
  swift_release();
  sub_10001A4E8();
  swift_release();
  uint64_t v64 = swift_retain();
  sub_10002BD88(v64, v51);
  swift_release();
  sub_100006B10();
  swift_release();
  uint64_t v65 = swift_retain();
  uint64_t v66 = sub_10002BD88(v65, v51);
  swift_release();
  swift_getKeyPath();
  uint64_t v125 = v66;
  sub_100012230((unint64_t *)&qword_100154820, (void (*)(uint64_t))type metadata accessor for CalculatorLayout);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_release();
  if (qword_100154290 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v75 = v105;
  sub_100033344(v60, v105, &qword_10015A4F0);
  uint64_t v76 = v106;
  uint64_t v77 = v75 + *(int *)(v106 + 36);
  *(unsigned char *)uint64_t v77 = v62;
  *(void *)(v77 + 8) = v68;
  *(void *)(v77 + 16) = v70;
  *(void *)(v77 + 24) = v72;
  *(void *)(v77 + 32) = v74;
  *(unsigned char *)(v77 + 40) = 0;
  sub_100032F44(v60, &qword_10015A4F0);
  sub_100032FA0(&qword_10015A530);
  type metadata accessor for ToolbarPlacement();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10010DCB0;
  static ToolbarPlacement.navigationBar.getter();
  uint64_t v78 = sub_10010164C(&qword_10015A538, &qword_10015A4F8, (void (*)(void))sub_100101624);
  uint64_t v79 = v107;
  View.toolbar(_:for:)();
  swift_bridgeObjectRelease();
  sub_100032F44(v75, &qword_10015A4F8);
  uint64_t v80 = v121;
  static ContainerBackgroundPlacement.navigation.getter();
  static Alignment.center.getter();
  uint64_t v125 = v76;
  uint64_t v126 = (void *)v78;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v82 = v111;
  uint64_t v83 = v110;
  View.containerBackground<A>(for:alignment:content:)();
  uint64_t v84 = v123;
  uint64_t v85 = *(void (**)(char *, uint64_t))(v122 + 8);
  v85(v80, v123);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v79, v83);
  static ContainerBackgroundPlacement.navigationSplitView.getter();
  static Alignment.center.getter();
  uint64_t v125 = v83;
  uint64_t v126 = &type metadata for Color;
  uint64_t v127 = OpaqueTypeConformance2;
  char v128 = &protocol witness table for Color;
  swift_getOpaqueTypeConformance2();
  uint64_t v86 = v115;
  uint64_t v87 = v118;
  View.containerBackground<A>(for:alignment:content:)();
  v85(v80, v84);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v82, v87);
  uint64_t v88 = static SafeAreaRegions.keyboard.getter();
  char v89 = static Edge.Set.all.getter();
  uint64_t v91 = v119;
  uint64_t v90 = v120;
  uint64_t v92 = (uint64_t)v113;
  (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v113, v86, v120);
  uint64_t v93 = v92 + *(int *)(v116 + 36);
  *(void *)uint64_t v93 = v88;
  *(unsigned char *)(v93 + 8) = v89;
  (*(void (**)(char *, uint64_t))(v91 + 8))(v86, v90);
  sub_100101858();
  uint64_t v94 = v109;
  View.sidebarDimmingIgnoresSafeArea(_:)();
  sub_100032F44(v92, &qword_10015A518);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v112 + 32))(v124, v94, v114);
}

uint64_t sub_1001009D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Color.black.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1001009FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000FFCCC(a1, *(unsigned char *)(v2 + 8), a2);
}

uint64_t sub_100100A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v30 = type metadata accessor for ContainerBackgroundPlacement();
  uint64_t v28 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100032FA0(&qword_10015A570);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100032FA0(&qword_10015A578);
  uint64_t v32 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100032FA0(&qword_10015A580);
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v25 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100032FA0(&qword_10015A530);
  type metadata accessor for ToolbarPlacement();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10010DCB0;
  static ToolbarPlacement.navigationBar.getter();
  uint64_t v10 = sub_100032FA0(&qword_10015A588);
  uint64_t v11 = sub_100040BE4(&qword_10015A590, &qword_10015A588);
  View.toolbar(_:for:)();
  swift_bridgeObjectRelease();
  static ContainerBackgroundPlacement.navigation.getter();
  static Alignment.center.getter();
  uint64_t v35 = v10;
  uint64_t v36 = (void *)v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v26;
  View.containerBackground<A>(for:alignment:content:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v15 = v30;
  v14(v2, v30);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v13);
  static ContainerBackgroundPlacement.navigationSplitView.getter();
  static Alignment.center.getter();
  uint64_t v35 = v13;
  uint64_t v36 = &type metadata for Color;
  uint64_t v37 = OpaqueTypeConformance2;
  uint64_t v38 = &protocol witness table for Color;
  swift_getOpaqueTypeConformance2();
  uint64_t v16 = v25;
  uint64_t v17 = v29;
  View.containerBackground<A>(for:alignment:content:)();
  v14(v2, v15);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v17);
  uint64_t v18 = static SafeAreaRegions.keyboard.getter();
  char v19 = static Edge.Set.all.getter();
  uint64_t v20 = v31;
  uint64_t v22 = v33;
  uint64_t v21 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v34, v16, v33);
  uint64_t v23 = v21 + *(int *)(sub_100032FA0(&qword_10015A598) + 36);
  *(void *)uint64_t v23 = v18;
  *(unsigned char *)(v23 + 8) = v19;
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v16, v22);
}

uint64_t sub_100100F30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Color.clear.getter();
  *a1 = result;
  return result;
}

void sub_100100F60(char *a1)
{
}

uint64_t sub_100100F8C@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  type metadata accessor for CalculatorPresentationView();

  return sub_1000FED40(v3, a1);
}

uint64_t sub_10010104C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v5 = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (int *)(type metadata accessor for CalculatorPresentationView() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v3, v1);
  (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(v3 + v2[15]);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_100101194()
{
  uint64_t v1 = *(void *)(type metadata accessor for CalculatorPresentationView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000FFA04(v2);
}

uint64_t sub_100101240()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100101278()
{
  return swift_getWitnessTable();
}

uint64_t sub_1001015E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100101600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100101624()
{
  return sub_10010164C(&qword_10015A540, &qword_10015A4F0, (void (*)(void))sub_1001016CC);
}

uint64_t sub_10010164C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000317D8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1001016CC()
{
  return sub_10010164C(&qword_10015A548, &qword_10015A4E8, (void (*)(void))sub_1001016F4);
}

unint64_t sub_1001016F4()
{
  unint64_t result = qword_10015A550;
  if (!qword_10015A550)
  {
    sub_1000317D8(&qword_10015A4E0);
    sub_100101794();
    sub_100040BE4(&qword_100157D98, &qword_100156D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A550);
  }
  return result;
}

unint64_t sub_100101794()
{
  unint64_t result = qword_10015A558;
  if (!qword_10015A558)
  {
    sub_1000317D8(&qword_10015A4D8);
    sub_100040BE4(&qword_10015A560, &qword_10015A528);
    sub_100040BE4(&qword_100157D88, &qword_100157D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A558);
  }
  return result;
}

unint64_t sub_100101858()
{
  unint64_t result = qword_10015A568;
  if (!qword_10015A568)
  {
    sub_1000317D8(&qword_10015A518);
    sub_1000317D8(&qword_10015A508);
    sub_1000317D8(&qword_10015A500);
    sub_1000317D8(&qword_10015A4F8);
    sub_10010164C(&qword_10015A538, &qword_10015A4F8, (void (*)(void))sub_100101624);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A568);
  }
  return result;
}

uint64_t sub_1001019B0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100101A10()
{
  unint64_t result = qword_10015A5A0;
  if (!qword_10015A5A0)
  {
    sub_1000317D8(&qword_10015A598);
    sub_1000317D8(&qword_10015A578);
    sub_1000317D8(&qword_10015A570);
    sub_1000317D8(&qword_10015A588);
    sub_100040BE4(&qword_10015A590, &qword_10015A588);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A5A0);
  }
  return result;
}

uint64_t sub_100101B6C()
{
  return sub_10003D2B0();
}

uint64_t sub_100101B84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = sub_100032FA0(&qword_100159878);
  __chkstk_darwin(v2 - 8);
  uint64_t v29 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100032FA0(&qword_1001596F8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100032FA0(&qword_10015A6A0);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v11 = v1[1];
  long long v31 = *v1;
  long long v32 = v11;
  long long v33 = v1[2];
  sub_100032FA0(&qword_10015A698);
  Binding.projectedValue.getter();
  uint64_t v12 = v34;
  uint64_t v13 = v35;
  long long v28 = v36;
  uint64_t v14 = v37;
  uint64_t v15 = v38;
  long long v31 = v1[3];
  LOBYTE(v32) = *((unsigned char *)v1 + 64);
  sub_100032FA0(&qword_1001555B8);
  Binding.projectedValue.getter();
  uint64_t v16 = v34;
  uint64_t v17 = v35;
  int v27 = v36;
  uint64_t v18 = enum case for ColorScheme.dark(_:);
  uint64_t v19 = type metadata accessor for ColorScheme();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v20 + 104))(v6, v18, v19);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v20 + 56))(v6, 0, 1, v19);
  uint64_t v21 = v29;
  sub_100033344((uint64_t)v6, (uint64_t)v29, &qword_1001596F8);
  sub_100033344((uint64_t)v21, (uint64_t)&v10[*(int *)(v8 + 44)], &qword_100159878);
  *(void *)uint64_t v10 = v12;
  *((void *)v10 + 1) = v13;
  *((_OWORD *)v10 + 1) = v28;
  *((void *)v10 + 4) = v14;
  *((void *)v10 + 5) = v15;
  *((void *)v10 + 6) = v16;
  *((void *)v10 + 7) = v17;
  v10[64] = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100032F44((uint64_t)v21, &qword_100159878);
  sub_100032F44((uint64_t)v6, &qword_1001596F8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = static SafeAreaRegions.all.getter();
  LOBYTE(v16) = static Edge.Set.all.getter();
  uint64_t v23 = v30;
  sub_100033344((uint64_t)v10, v30, &qword_10015A6A0);
  uint64_t v24 = v23 + *(int *)(sub_100032FA0(&qword_10015A6A8) + 36);
  *(void *)uint64_t v24 = v22;
  *(unsigned char *)(v24 + 8) = v16;
  return sub_100032F44((uint64_t)v10, &qword_10015A6A0);
}

uint64_t sub_100101EAC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MathPaperViewWrapper.Coordinator()
{
  return self;
}

__n128 sub_100101F28()
{
  sub_100032FA0(&qword_10015A698);
  Binding.projectedValue.getter();
  sub_100032FA0(&qword_1001555B8);
  Binding.projectedValue.getter();
  type metadata accessor for MathPaperViewWrapper.Coordinator();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  __n128 result = v4;
  *(__n128 *)(v0 + 32) = v4;
  *(void *)(v0 + 48) = v5;
  *(void *)(v0 + 56) = v6;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = v3;
  *(unsigned char *)(v0 + 80) = v4.n128_u8[0];
  return result;
}

uint64_t sub_100101FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001029C4();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100102058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1001029C4();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1001020BC()
{
}

id sub_1001020E4()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for MathNotesHostingViewController()) init];
  type metadata accessor for MathPaperViewWrapper.Coordinator();
  sub_100102A18();
  sub_100032FA0(&qword_10015A6D8);
  UIViewControllerRepresentableContext.coordinator.getter();
  dispatch thunk of MathNotesHostingViewController.delegate.setter();
  return v0;
}

void sub_100102164(void *a1@<X8>)
{
  sub_100101F28();
  *a1 = v2;
}

uint64_t sub_10010218C()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1001021C8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_10010226C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100102298(a2, a3);
}

uint64_t sub_100102298(uint64_t a1, void *a2)
{
  if (a2)
  {
    self;
    uint64_t v3 = (void *)swift_dynamicCastObjCClass();
    id v4 = a2;
    uint64_t v5 = v4;
    if (v3)
    {
      [v3 mass];
      [v3 stiffness];
      [v3 damping];
      [v3 initialVelocity];
      static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
    }
    else
    {
      id v6 = [v4 timingFunction];
      if (v6)
      {
        uint64_t v7 = v6;
        sub_100032FA0(&qword_10015A690);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100110A40;
        *(void *)(inited + 32) = 0;
        uint64_t v9 = swift_initStackObject();
        *(_OWORD *)(v9 + 16) = xmmword_100110A40;
        *(void *)(v9 + 32) = 0;
        [v7 getControlPointAtIndex:1 values:inited + 32];
        [v7 getControlPointAtIndex:2 values:v9 + 32];
        [v5 duration];
        static Animation.timingCurve(_:_:_:_:duration:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  __chkstk_darwin(a1);
  withAnimation<A>(_:_:)();
  return swift_release();
}

uint64_t sub_100102528()
{
  return sub_1001021C8();
}

ValueMetadata *type metadata accessor for MathPaperView()
{
  return &type metadata for MathPaperView;
}

uint64_t sub_100102578()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t _s10Calculator20MathPaperViewWrapperVwxx_0()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t _s10Calculator20MathPaperViewWrapperVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s10Calculator20MathPaperViewWrapperVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t _s10Calculator20MathPaperViewWrapperVwta_0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t _s10Calculator20MathPaperViewWrapperVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1001027B0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MathPaperViewWrapper()
{
  return &type metadata for MathPaperViewWrapper;
}

unint64_t sub_100102818()
{
  unint64_t result = qword_10015A6B0;
  if (!qword_10015A6B0)
  {
    sub_1000317D8(&qword_10015A6A8);
    sub_100102894();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A6B0);
  }
  return result;
}

unint64_t sub_100102894()
{
  unint64_t result = qword_10015A6B8;
  if (!qword_10015A6B8)
  {
    sub_1000317D8(&qword_10015A6A0);
    sub_100102910();
    sub_100102964();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A6B8);
  }
  return result;
}

unint64_t sub_100102910()
{
  unint64_t result = qword_10015A6C0;
  if (!qword_10015A6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A6C0);
  }
  return result;
}

unint64_t sub_100102964()
{
  unint64_t result = qword_100159870;
  if (!qword_100159870)
  {
    sub_1000317D8(&qword_100159878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100159870);
  }
  return result;
}

unint64_t sub_1001029C4()
{
  unint64_t result = qword_10015A6C8;
  if (!qword_10015A6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A6C8);
  }
  return result;
}

unint64_t sub_100102A18()
{
  unint64_t result = qword_10015A6D0;
  if (!qword_10015A6D0)
  {
    type metadata accessor for MathPaperViewWrapper.Coordinator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A6D0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL sub_100102A90(int a1, int a2, int a3)
{
  if (qword_100160C70 == -1)
  {
    BOOL v6 = dword_100160C60 < a1;
    if (dword_100160C60 > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100160C70, 0, (dispatch_function_t)sub_100102B84);
    BOOL v6 = dword_100160C60 < a1;
    if (dword_100160C60 > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_100160C64 > a2) {
    return 1;
  }
  return dword_100160C64 >= a2 && dword_100160C68 >= a3;
}

uint64_t sub_100102B84()
{
  return sub_100102D30(1);
}

uint64_t sub_100102B8C(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_100160C78 == -1)
  {
    if (qword_100160C80) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_100160C78, 0, (dispatch_function_t)sub_100102D28);
    if (qword_100160C80) {
      return _availability_version_check();
    }
  }
  if (qword_100160C70 == -1)
  {
    BOOL v8 = dword_100160C60 < a2;
    if (dword_100160C60 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100160C70, 0, (dispatch_function_t)sub_100102B84);
    BOOL v8 = dword_100160C60 < a2;
    if (dword_100160C60 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_100160C64 > a3) {
    return 1;
  }
  return dword_100160C64 >= a3 && dword_100160C68 >= a4;
}

uint64_t sub_100102D28()
{
  return sub_100102D30(0);
}

uint64_t sub_100102D30(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_100160C80;
  if (qword_100160C80) {
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
      qword_100160C80 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        long long v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    long long v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    long long v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          int v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
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
                                            sscanf(v29, "%d.%d.%d", &dword_100160C60, &dword_100160C64, &dword_100160C68);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
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

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for IntentAuthenticationPolicy()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.host.getter()
{
  return URLComponents.host.getter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t DateComponents.hour.getter()
{
  return DateComponents.hour.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t SortDescriptor.init<A>(_:order:)()
{
  return SortDescriptor.init<A>(_:order:)();
}

uint64_t type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority()
{
  return type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority();
}

uint64_t AttributeScopes.AccessibilityAttributes.accessibilitySpeechSpellsOutCharacters.getter()
{
  return AttributeScopes.AccessibilityAttributes.accessibilitySpeechSpellsOutCharacters.getter();
}

uint64_t AttributeScopes.AccessibilityAttributes.accessibilitySpeechAnnouncementPriority.getter()
{
  return AttributeScopes.AccessibilityAttributes.accessibilitySpeechAnnouncementPriority.getter();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t type metadata accessor for AttributedString.FormattingOptions()
{
  return type metadata accessor for AttributedString.FormattingOptions();
}

uint64_t type metadata accessor for AttributedString.InterpolationOptions()
{
  return type metadata accessor for AttributedString.InterpolationOptions();
}

uint64_t AttributedString.init(localized:options:table:bundle:locale:comment:)()
{
  return AttributedString.init(localized:options:table:bundle:locale:comment:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributedString.init(_:)()
{
  return AttributedString.init(_:)();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)()
{
  return static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
}

uint64_t type metadata accessor for PredicateExpressions.ComparisonOperator()
{
  return type metadata accessor for PredicateExpressions.ComparisonOperator();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return type metadata accessor for Locale.LanguageCode();
}

Swift::String_optional __swiftcall Locale.localizedString(forIdentifier:)(Swift::String forIdentifier)
{
  uint64_t v1 = Locale.localizedString(forIdentifier:)(forIdentifier._countAndFlagsBits, forIdentifier._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

Swift::String_optional __swiftcall Locale.localizedString(forLanguageCode:)(Swift::String forLanguageCode)
{
  uint64_t v1 = Locale.localizedString(forLanguageCode:)(forLanguageCode._countAndFlagsBits, forLanguageCode._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.availableIdentifiers.getter()
{
  return static Locale.availableIdentifiers.getter();
}

uint64_t Locale.Region.icuDisplayName.getter()
{
  return Locale.Region.icuDisplayName.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t Locale.region.getter()
{
  return Locale.region.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.languageCode.getter()
{
  return Locale.Language.languageCode.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t Calendar.isDateInToday(_:)()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t Calendar.isDateInYesterday(_:)()
{
  return Calendar.isDateInYesterday(_:)();
}

uint64_t Calendar.isDate(_:equalTo:toGranularity:)()
{
  return Calendar.isDate(_:equalTo:toGranularity:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t type metadata accessor for Predicate()
{
  return type metadata accessor for Predicate();
}

uint64_t Predicate.init(_:)()
{
  return Predicate.init(_:)();
}

uint64_t CalculateExpressionView.init(expression:isEditable:height:minFontSizeRatio:textAlignment:textColor:truncationMode:operationCallback:)()
{
  return CalculateExpressionView.init(expression:isEditable:height:minFontSizeRatio:textAlignment:textColor:truncationMode:operationCallback:)();
}

uint64_t CalculateExpressionView.init(expression:isEditable:fontSize:minFontSizeRatio:textAlignment:textColor:truncationMode:operationCallback:)()
{
  return CalculateExpressionView.init(expression:isEditable:fontSize:minFontSizeRatio:textAlignment:textColor:truncationMode:operationCallback:)();
}

uint64_t type metadata accessor for CalculateExpressionView()
{
  return type metadata accessor for CalculateExpressionView();
}

uint64_t CalculateExpressionStackView.init(expression:textAlignment:textColor:rowCount:separatorColor:operationCallback:)()
{
  return CalculateExpressionStackView.init(expression:textAlignment:textColor:rowCount:separatorColor:operationCallback:)();
}

uint64_t type metadata accessor for CalculateExpressionStackView()
{
  return type metadata accessor for CalculateExpressionStackView();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

Swift::Void __swiftcall _AccessibilityNotifications.post()()
{
}

uint64_t type metadata accessor for AccessibilityNotification.Announcement()
{
  return type metadata accessor for AccessibilityNotification.Announcement();
}

uint64_t AccessibilityNotification.Announcement.init(_:)()
{
  return AccessibilityNotification.Announcement.init(_:)();
}

uint64_t type metadata accessor for AccessibilityNotification.ScreenChanged()
{
  return type metadata accessor for AccessibilityNotification.ScreenChanged();
}

uint64_t AccessibilityNotification.ScreenChanged.init(_:)()
{
  return AccessibilityNotification.ScreenChanged.init(_:)();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.setter()
{
  return dispatch thunk of MathNotesHostingViewController.delegate.setter();
}

uint64_t type metadata accessor for MathNotesHostingViewController()
{
  return type metadata accessor for MathNotesHostingViewController();
}

uint64_t MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:animationSettings:)()
{
  return MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:animationSettings:)();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.image.getter()
{
  return Tip.image.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t type metadata accessor for Tips.EmptyDonation()
{
  return type metadata accessor for Tips.EmptyDonation();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t Tips.Event.init<>(id:)()
{
  return Tips.Event.init<>(id:)();
}

uint64_t Tips.Event.donations.getter()
{
  return Tips.Event.donations.getter();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

Swift::Void __swiftcall NWPathMonitor.cancel()()
{
}

uint64_t NWPathMonitor.init()()
{
  return NWPathMonitor.init()();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t static NWPath.Status.== infix(_:_:)()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t static EdgeInsets.== infix(_:_:)()
{
  return static EdgeInsets.== infix(_:_:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t EditButton.init()()
{
  return EditButton.init()();
}

uint64_t type metadata accessor for EditButton()
{
  return type metadata accessor for EditButton();
}

uint64_t FocusState.wrappedValue.getter()
{
  return FocusState.wrappedValue.getter();
}

uint64_t FocusState.wrappedValue.setter()
{
  return FocusState.wrappedValue.setter();
}

uint64_t FocusState.projectedValue.getter()
{
  return FocusState.projectedValue.getter();
}

uint64_t FocusState.Binding.wrappedValue.getter()
{
  return FocusState.Binding.wrappedValue.getter();
}

uint64_t FocusState.Binding.wrappedValue.setter()
{
  return FocusState.Binding.wrappedValue.setter();
}

uint64_t FocusState.Binding.projectedValue.getter()
{
  return FocusState.Binding.projectedValue.getter();
}

uint64_t FocusState.init<>()()
{
  return FocusState.init<>()();
}

uint64_t FocusState.init<A>()()
{
  return FocusState.init<A>()();
}

uint64_t LazyHStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t LazyVStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t TapGesture.init(count:)()
{
  return TapGesture.init(count:)();
}

uint64_t type metadata accessor for TapGesture()
{
  return type metadata accessor for TapGesture();
}

uint64_t Transition.combined<A>(with:)()
{
  return Transition.combined<A>(with:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t CommandMenu.init(_:content:)()
{
  return CommandMenu.init(_:content:)();
}

uint64_t type metadata accessor for ControlSize()
{
  return type metadata accessor for ControlSize();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t static GestureMask.subviews.getter()
{
  return static GestureMask.subviews.getter();
}

Swift::Void __swiftcall PPTTestCase.finishTest()()
{
}

uint64_t PPTTestCase.parameters.getter()
{
  return PPTTestCase.parameters.getter();
}

uint64_t PPTTestCase.performResizeTest(onComplete:)()
{
  return PPTTestCase.performResizeTest(onComplete:)();
}

uint64_t PPTTestCase.performScrollTest(_:onComplete:)()
{
  return PPTTestCase.performScrollTest(_:onComplete:)();
}

uint64_t PPTTestCase.Name.rawValue.getter()
{
  return PPTTestCase.Name.rawValue.getter();
}

uint64_t type metadata accessor for PPTTestCase.Name()
{
  return type metadata accessor for PPTTestCase.Name();
}

uint64_t PPTTestCase.Name.init(_:)()
{
  return PPTTestCase.Name.init(_:)();
}

Swift::Void __swiftcall PPTTestCase.startTest()()
{
}

uint64_t type metadata accessor for PPTTestCase()
{
  return type metadata accessor for PPTTestCase();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t Transaction.disablesAnimations.setter()
{
  return Transaction.disablesAnimations.setter();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
}

uint64_t Transaction.init(animation:)()
{
  return Transaction.init(animation:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t CommandGroup.init(before:addition:)()
{
  return CommandGroup.init(before:addition:)();
}

uint64_t CommandGroup.init(replacing:addition:)()
{
  return CommandGroup.init(replacing:addition:)();
}

uint64_t PickerOption.init(value:content:)()
{
  return PickerOption.init(value:content:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t static VerticalEdge.Set.all.getter()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t static AnyTransition.asymmetric(insertion:removal:)()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t static AnyTransition.identity.getter()
{
  return static AnyTransition.identity.getter();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t GeometryProxy.safeAreaInsets.getter()
{
  return GeometryProxy.safeAreaInsets.getter();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.subscript.getter()
{
  return GeometryProxy.subscript.getter();
}

uint64_t KeyEquivalent.init(extendedGraphemeClusterLiteral:)()
{
  return KeyEquivalent.init(extendedGraphemeClusterLiteral:)();
}

uint64_t static KeyEquivalent.delete.getter()
{
  return static KeyEquivalent.delete.getter();
}

uint64_t type metadata accessor for KeyEquivalent()
{
  return type metadata accessor for KeyEquivalent();
}

uint64_t LayoutSubview.sizeThatFits(_:)()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t dispatch thunk of PickerContent._identifiedView.getter()
{
  return dispatch thunk of PickerContent._identifiedView.getter();
}

uint64_t PickerContent.keyboardShortcut(_:modifiers:)()
{
  return PickerContent.keyboardShortcut(_:modifiers:)();
}

uint64_t PickerContent.disabled(_:)()
{
  return PickerContent.disabled(_:)();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t static TintPlacement.switchThumb.getter()
{
  return static TintPlacement.switchThumb.getter();
}

uint64_t type metadata accessor for TintPlacement()
{
  return type metadata accessor for TintPlacement();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:completionCriteria:_:completion:)()
{
  return withAnimation<A>(_:completionCriteria:_:completion:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t static EventModifiers.shift.getter()
{
  return static EventModifiers.shift.getter();
}

uint64_t static EventModifiers.option.getter()
{
  return static EventModifiers.option.getter();
}

uint64_t static EventModifiers.command.getter()
{
  return static EventModifiers.command.getter();
}

uint64_t static EventModifiers.control.getter()
{
  return static EventModifiers.control.getter();
}

uint64_t EventModifiers.init(rawValue:)()
{
  return EventModifiers.init(rawValue:)();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t LayoutSubviews.subscript.getter()
{
  return LayoutSubviews.subscript.getter();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t MoveTransition.init(edge:)()
{
  return MoveTransition.init(edge:)();
}

uint64_t type metadata accessor for MoveTransition()
{
  return type metadata accessor for MoveTransition();
}

uint64_t PlainListStyle.init()()
{
  return PlainListStyle.init()();
}

uint64_t type metadata accessor for PlainListStyle()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t ViewDimensions.height.getter()
{
  return ViewDimensions.height.getter();
}

uint64_t ViewDimensions.subscript.getter()
{
  return ViewDimensions.subscript.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibilityCustomContent(_:_:importance:)()
{
  return ModifiedContent<>.accessibilityCustomContent(_:_:importance:)();
}

uint64_t ModifiedContent<>.accessibilityHint(_:)()
{
  return ModifiedContent<>.accessibilityHint(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel(_:)()
{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel<A>(_:)()
{
  return ModifiedContent<>.accessibilityLabel<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityValue(_:isEnabled:)()
{
  return ModifiedContent<>.accessibilityValue(_:isEnabled:)();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return ModifiedContent<>.accessibilityValue<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityHidden(_:)()
{
  return ModifiedContent<>.accessibilityHidden(_:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityIdentifier(_:)()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityCustomAttribute(_:value:)()
{
  return ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
}

{
  return ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
}

{
  return ModifiedContent<>.accessibilityCustomAttribute(_:value:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.keyboard.getter()
{
  return static SafeAreaRegions.keyboard.getter();
}

uint64_t ScrollViewProxy.scrollTo<A>(_:anchor:)()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t withTransaction<A>(_:_:)()
{
  return withTransaction<A>(_:_:)();
}

uint64_t type metadata accessor for GroupedFormStyle()
{
  return type metadata accessor for GroupedFormStyle();
}

uint64_t LongPressGesture.init(minimumDuration:maximumDistance:)()
{
  return LongPressGesture.init(minimumDuration:maximumDistance:)();
}

uint64_t type metadata accessor for LongPressGesture()
{
  return type metadata accessor for LongPressGesture();
}

Swift::Void __swiftcall OpenWindowAction.callAsFunction(id:)(Swift::String id)
{
}

uint64_t type metadata accessor for OpenWindowAction()
{
  return type metadata accessor for OpenWindowAction();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t static ProposedViewSize.unspecified.getter()
{
  return static ProposedViewSize.unspecified.getter();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t ToolbarItemGroup.init(placement:content:)()
{
  return ToolbarItemGroup.init(placement:content:)();
}

uint64_t static ToolbarPlacement.navigationBar.getter()
{
  return static ToolbarPlacement.navigationBar.getter();
}

uint64_t type metadata accessor for ToolbarPlacement()
{
  return type metadata accessor for ToolbarPlacement();
}

uint64_t type metadata accessor for _BlendModeEffect()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ContentShapeKinds.hoverEffect.getter()
{
  return static ContentShapeKinds.hoverEffect.getter();
}

uint64_t static ContentShapeKinds.interaction.getter()
{
  return static ContentShapeKinds.interaction.getter();
}

uint64_t static ContentShapeKinds.accessibility.getter()
{
  return static ContentShapeKinds.accessibility.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t static ContentTransition.identity.getter()
{
  return static ContentTransition.identity.getter();
}

uint64_t type metadata accessor for ContentTransition()
{
  return type metadata accessor for ContentTransition();
}

uint64_t static CustomHoverEffect<>.automatic.getter()
{
  return static CustomHoverEffect<>.automatic.getter();
}

uint64_t static CustomHoverEffect<>.highlight.getter()
{
  return static CustomHoverEffect<>.highlight.getter();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.openWindow.getter()
{
  return EnvironmentValues.openWindow.getter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.controlSize.getter()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t EnvironmentValues.controlSize.setter()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t EnvironmentValues.placementTint.getter()
{
  return EnvironmentValues.placementTint.getter();
}

uint64_t EnvironmentValues.placementTint.setter()
{
  return EnvironmentValues.placementTint.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.layoutDirection.setter()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t EnvironmentValues.contentTransition.getter()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t EnvironmentValues.contentTransition.setter()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t EnvironmentValues.verticalSizeClass.getter()
{
  return EnvironmentValues.verticalSizeClass.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.editMode.getter()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t EnvironmentValues.editMode.setter()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t EnvironmentValues.textCase.getter()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t EnvironmentValues.textCase.setter()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t InlinePickerStyle.init()()
{
  return InlinePickerStyle.init()();
}

uint64_t type metadata accessor for InlinePickerStyle()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t OpacityTransition.init()()
{
  return OpacityTransition.init()();
}

uint64_t type metadata accessor for OpacityTransition()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.bottom.getter()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation(_:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static PresentationDetent.large.getter()
{
  return static PresentationDetent.large.getter();
}

uint64_t static PresentationDetent.medium.getter()
{
  return static PresentationDetent.medium.getter();
}

uint64_t type metadata accessor for PresentationDetent()
{
  return type metadata accessor for PresentationDetent();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.isKeyboardKey.getter()
{
  return static AccessibilityTraits.isKeyboardKey.getter();
}

uint64_t static AccessibilityTraits.isMathEquation.getter()
{
  return static AccessibilityTraits.isMathEquation.getter();
}

uint64_t static AccessibilityTraits.isModal.getter()
{
  return static AccessibilityTraits.isModal.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t static AccessibilityTraits.isToggle.getter()
{
  return static AccessibilityTraits.isToggle.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.listRowSeparatorLeading.getter()
{
  return static HorizontalAlignment.listRowSeparatorLeading.getter();
}

uint64_t static HorizontalAlignment.listRowSeparatorTrailing.getter()
{
  return static HorizontalAlignment.listRowSeparatorTrailing.getter();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static HorizontalAlignment.trailing.getter()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t NavigationSplitView.init<>(columnVisibility:sidebar:detail:)()
{
  return NavigationSplitView.init<>(columnVisibility:sidebar:detail:)();
}

uint64_t type metadata accessor for NavigationSplitView()
{
  return type metadata accessor for NavigationSplitView();
}

uint64_t TupleCommandContent.init(_:)()
{
  return TupleCommandContent.init(_:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for AutomaticHoverEffect()
{
  return type metadata accessor for AutomaticHoverEffect();
}

uint64_t type metadata accessor for HighlightHoverEffect()
{
  return type metadata accessor for HighlightHoverEffect();
}

uint64_t static SearchFieldPlacement.navigationBarDrawer(displayMode:)()
{
  return static SearchFieldPlacement.navigationBarDrawer(displayMode:)();
}

uint64_t static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter()
{
  return static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter();
}

uint64_t type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode()
{
  return type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode();
}

uint64_t type metadata accessor for SearchFieldPlacement()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t static ToolbarItemPlacement.confirmationAction.getter()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t static ToolbarItemPlacement.automatic.getter()
{
  return static ToolbarItemPlacement.automatic.getter();
}

uint64_t static ToolbarItemPlacement.bottomBar.getter()
{
  return static ToolbarItemPlacement.bottomBar.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t static CommandGroupPlacement.newItem.getter()
{
  return static CommandGroupPlacement.newItem.getter();
}

uint64_t static CommandGroupPlacement.sidebar.getter()
{
  return static CommandGroupPlacement.sidebar.getter();
}

uint64_t static CommandGroupPlacement.toolbar.getter()
{
  return static CommandGroupPlacement.toolbar.getter();
}

uint64_t type metadata accessor for CommandGroupPlacement()
{
  return type metadata accessor for CommandGroupPlacement();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t static ContentMarginPlacement.scrollContent.getter()
{
  return static ContentMarginPlacement.scrollContent.getter();
}

uint64_t type metadata accessor for ContentMarginPlacement()
{
  return type metadata accessor for ContentMarginPlacement();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.tertiary.getter()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t static UserInterfaceSizeClass.== infix(_:_:)()
{
  return static UserInterfaceSizeClass.== infix(_:_:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t UserInterfaceSizeClass.init(_:)()
{
  return UserInterfaceSizeClass.init(_:)();
}

uint64_t static AccessibilityActionKind.escape.getter()
{
  return static AccessibilityActionKind.escape.getter();
}

uint64_t static AccessibilityActionKind.default.getter()
{
  return static AccessibilityActionKind.default.getter();
}

uint64_t type metadata accessor for AccessibilityActionKind()
{
  return type metadata accessor for AccessibilityActionKind();
}

uint64_t AccessibilityFocusState.wrappedValue.setter()
{
  return AccessibilityFocusState.wrappedValue.setter();
}

uint64_t AccessibilityFocusState.projectedValue.getter()
{
  return AccessibilityFocusState.projectedValue.getter();
}

uint64_t AccessibilityFocusState.init<>()()
{
  return AccessibilityFocusState.init<>()();
}

uint64_t type metadata accessor for AccessibilityFocusState()
{
  return type metadata accessor for AccessibilityFocusState();
}

uint64_t type metadata accessor for PopoverAttachmentAnchor()
{
  return type metadata accessor for PopoverAttachmentAnchor();
}

uint64_t SafeAreaPaddingModifier.init(edges:insets:)()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t type metadata accessor for AccessibilityTechnologies()
{
  return type metadata accessor for AccessibilityTechnologies();
}

uint64_t static MatchedGeometryProperties.size.getter()
{
  return static MatchedGeometryProperties.size.getter();
}

uint64_t static MatchedGeometryProperties.frame.getter()
{
  return static MatchedGeometryProperties.frame.getter();
}

uint64_t static ScrollIndicatorVisibility.hidden.getter()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t type metadata accessor for ScrollIndicatorVisibility()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t static AccessibilityChildBehavior.contain.getter()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t static AnimationCompletionCriteria.logicallyComplete.getter()
{
  return static AnimationCompletionCriteria.logicallyComplete.getter();
}

uint64_t type metadata accessor for AnimationCompletionCriteria()
{
  return type metadata accessor for AnimationCompletionCriteria();
}

uint64_t static ContainerBackgroundPlacement.navigation.getter()
{
  return static ContainerBackgroundPlacement.navigation.getter();
}

uint64_t static ContainerBackgroundPlacement.navigationSplitView.getter()
{
  return static ContainerBackgroundPlacement.navigationSplitView.getter();
}

uint64_t type metadata accessor for ContainerBackgroundPlacement()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t static NavigationSplitViewVisibility.detailOnly.getter()
{
  return static NavigationSplitViewVisibility.detailOnly.getter();
}

uint64_t static NavigationSplitViewVisibility.== infix(_:_:)()
{
  return static NavigationSplitViewVisibility.== infix(_:_:)();
}

uint64_t static NavigationSplitViewVisibility.all.getter()
{
  return static NavigationSplitViewVisibility.all.getter();
}

uint64_t type metadata accessor for NavigationSplitViewVisibility()
{
  return type metadata accessor for NavigationSplitViewVisibility();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t static SearchPresentationToolbarBehavior.avoidHidingContent.getter()
{
  return static SearchPresentationToolbarBehavior.avoidHidingContent.getter();
}

uint64_t type metadata accessor for SearchPresentationToolbarBehavior()
{
  return type metadata accessor for SearchPresentationToolbarBehavior();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Edge.Set.init(_:)()
{
  return Edge.Set.init(_:)();
}

uint64_t type metadata accessor for Font._StylisticAlternative()
{
  return type metadata accessor for Font._StylisticAlternative();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t Font.bold()()
{
  return Font.bold()();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t static Font.caption2.getter()
{
  return static Font.caption2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Form.init(content:)()
{
  return Form.init(content:)();
}

uint64_t Link.init(destination:label:)()
{
  return Link.init(destination:label:)();
}

uint64_t List.init(selection:content:)()
{
  return List.init(selection:content:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Path.init(roundedRect:cornerRadius:style:)()
{
  return Path.init(roundedRect:cornerRadius:style:)();
}

uint64_t type metadata accessor for Text.TruncationMode()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text._stylisticAlternative(_:)()
{
  return Text._stylisticAlternative(_:)();
}

uint64_t type metadata accessor for Text.Case()
{
  return type metadata accessor for Text.Case();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.popoverTip<A>(_:arrowEdge:action:)()
{
  return View.popoverTip<A>(_:arrowEdge:action:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.background<A>(_:ignoresSafeAreaEdges:)()
{
  return View.background<A>(_:ignoresSafeAreaEdges:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.onKeyPress(_:action:)()
{
  return View.onKeyPress(_:action:)();
}

uint64_t View.searchable(text:isPresented:placement:prompt:)()
{
  return View.searchable(text:isPresented:placement:prompt:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.contextMenu<A>(menuItems:)()
{
  return View.contextMenu<A>(menuItems:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.hoverEffect<A>(_:isEnabled:)()
{
  return View.hoverEffect<A>(_:isEnabled:)();
}

uint64_t View.onDisappear(perform:)()
{
  return View.onDisappear(perform:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.popoverCore<A>(isPresented:attachmentAnchor:arrowEdges:isDetachable:content:)()
{
  return View.popoverCore<A>(isPresented:attachmentAnchor:arrowEdges:isDetachable:content:)();
}

uint64_t View.keyboardType(_:)()
{
  return View.keyboardType(_:)();
}

uint64_t View.labelsHidden()()
{
  return View.labelsHidden()();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.swipeActions<A>(edge:allowsFullSwipe:content:)()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:content:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.contentMargins(_:_:for:)()
{
  return View.contentMargins(_:_:for:)();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.ignoresSafeArea(_:edges:)()
{
  return View.ignoresSafeArea(_:edges:)();
}

uint64_t View.keyboardShortcut(_:modifiers:)()
{
  return View.keyboardShortcut(_:modifiers:)();
}

uint64_t View.scrollIndicators(_:axes:)()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t View.accessibilityHint(_:)()
{
  return View.accessibilityHint(_:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:message:)()
{
  return View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t View.lineHeightMultiple(_:)()
{
  return View.lineHeightMultiple(_:)();
}

uint64_t View.accessibilityAction(_:_:)()
{
  return View.accessibilityAction(_:_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.allowsSecureDrawing()()
{
  return View.allowsSecureDrawing()();
}

uint64_t View.containerBackground<A>(for:alignment:content:)()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t View.presentationDetents(_:)()
{
  return View.presentationDetents(_:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.accessibilityFocused(_:)()
{
  return View.accessibilityFocused(_:)();
}

uint64_t View.listRowSeparatorTint(_:edges:)()
{
  return View.listRowSeparatorTint(_:edges:)();
}

uint64_t View._onModifierKeysChanged(mask:initial:_:)()
{
  return View._onModifierKeysChanged(mask:initial:_:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.scrollContentBackground(_:)()
{
  return View.scrollContentBackground(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.sidebarDimmingIgnoresSafeArea(_:)()
{
  return View.sidebarDimmingIgnoresSafeArea(_:)();
}

uint64_t View.searchPresentationToolbarBehavior(_:)()
{
  return View.searchPresentationToolbarBehavior(_:)();
}

uint64_t View.font(_:)()
{
  return View.font(_:)();
}

uint64_t View.help(_:)()
{
  return View.help(_:)();
}

{
  return View.help(_:)();
}

uint64_t View.help<A>(_:)()
{
  return View.help<A>(_:)();
}

uint64_t View.alert<A, B>(_:isPresented:actions:message:)()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.onTest(_:handler:)()
{
  return View.onTest(_:handler:)();
}

uint64_t View.focused<A>(_:equals:)()
{
  return View.focused<A>(_:equals:)();
}

uint64_t View.padding(_:_:)()
{
  return View.padding(_:_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.toolbar(_:for:)()
{
  return View.toolbar(_:for:)();
}

uint64_t View.modifier<A>(_:)()
{
  return View.modifier<A>(_:)();
}

uint64_t View.onAppear(perform:)()
{
  return View.onAppear(perform:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.fixedSize(horizontal:vertical:)()
{
  return View.fixedSize(horizontal:vertical:)();
}

uint64_t View.focusable(_:)()
{
  return View.focusable(_:)();
}

uint64_t View.formStyle<A>(_:)()
{
  return View.formStyle<A>(_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.onOpenURL(perform:)()
{
  return View.onOpenURL(perform:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.orange.getter()
{
  return static Color.orange.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t static Scene._makeScene(scene:inputs:)()
{
  return static Scene._makeScene(scene:inputs:)();
}

uint64_t Scene.allowsSecureDrawing(_:)()
{
  return Scene.allowsSecureDrawing(_:)();
}

uint64_t Scene.commands<A>(content:)()
{
  return Scene.commands<A>(content:)();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t static Shape.role.getter()
{
  return static Shape.role.getter();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t static Anchor.Source<A>.bounds.getter()
{
  return static Anchor.Source<A>.bounds.getter();
}

uint64_t static Anchor<A>.== infix(_:_:)()
{
  return static Anchor<A>.== infix(_:_:)();
}

uint64_t Button.init(role:action:label:)()
{
  return Button.init(role:action:label:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:role:action:)()
{
  return Button<>.init(_:role:action:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Layout<>.makeCache(subviews:)()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t Picker<>.init<A>(_:selection:content:)()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t ZStack.init(alignment:content:)()
{
  return ZStack.init(alignment:content:)();
}

uint64_t type metadata accessor for ZStack()
{
  return type metadata accessor for ZStack();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t GridRow.init(alignment:content:)()
{
  return GridRow.init(alignment:content:)();
}

uint64_t type metadata accessor for GridRow()
{
  return type metadata accessor for GridRow();
}

uint64_t Section<>.init(_:content:)()
{
  return Section<>.init(_:content:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.collapsible(_:)()
{
  return Section<>.collapsible(_:)();
}

uint64_t Section<>.init(footer:content:)()
{
  return Section<>.init(footer:content:)();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t EditMode.isEditing.getter()
{
  return EditMode.isEditing.getter();
}

uint64_t type metadata accessor for EditMode()
{
  return type metadata accessor for EditMode();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t type metadata accessor for KeyPress.Result()
{
  return type metadata accessor for KeyPress.Result();
}

uint64_t static Material.ultraThin.getter()
{
  return static Material.ultraThin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.bottomLeading.getter()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t static Animation.timingCurve(_:_:_:_:duration:)()
{
  return static Animation.timingCurve(_:_:_:_:duration:)();
}

uint64_t static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)()
{
  return static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t static Animation.easeOut.getter()
{
  return static Animation.easeOut.getter();
}

uint64_t static Animation.easeInOut.getter()
{
  return static Animation.easeInOut.getter();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t static FormStyle<>.grouped.getter()
{
  return static FormStyle<>.grouped.getter();
}

uint64_t LazyState.init(wrappedValue:)()
{
  return LazyState.init(wrappedValue:)();
}

uint64_t LazyState.wrappedValue.getter()
{
  return LazyState.wrappedValue.getter();
}

uint64_t LazyState.wrappedValue.setter()
{
  return LazyState.wrappedValue.setter();
}

uint64_t LazyState.projectedValue.getter()
{
  return LazyState.projectedValue.getter();
}

uint64_t type metadata accessor for LazyState()
{
  return type metadata accessor for LazyState();
}

uint64_t Namespace.wrappedValue.getter()
{
  return Namespace.wrappedValue.getter();
}

uint64_t TextField<>.init(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.topLeading.getter()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t dispatch thunk of CalculateExpression.RichExpression.isZero.getter()
{
  return dispatch thunk of CalculateExpression.RichExpression.isZero.getter();
}

uint64_t dispatch thunk of CalculateExpression.RichExpression.isEmpty.getter()
{
  return dispatch thunk of CalculateExpression.RichExpression.isEmpty.getter();
}

uint64_t CalculateExpression.copyableExpression.getter()
{
  return CalculateExpression.copyableExpression.getter();
}

Swift::Void __swiftcall CalculateExpression.copyToClipboard(overridePlaintext:)(Swift::String_optional overridePlaintext)
{
}

uint64_t CalculateExpression.expression.getter()
{
  return CalculateExpression.expression.getter();
}

uint64_t CalculateExpression.expression.setter()
{
  return CalculateExpression.expression.setter();
}

uint64_t CalculateExpression.activeError.getter()
{
  return CalculateExpression.activeError.getter();
}

uint64_t CalculateExpression.postfixStack.getter()
{
  return CalculateExpression.postfixStack.getter();
}

uint64_t type metadata accessor for CalculateExpression.RandOperation()
{
  return type metadata accessor for CalculateExpression.RandOperation();
}

uint64_t CalculateExpression.assumeDegrees.getter()
{
  return CalculateExpression.assumeDegrees.getter();
}

uint64_t CalculateExpression.assumeDegrees.setter()
{
  return CalculateExpression.assumeDegrees.setter();
}

uint64_t CalculateExpression.inlineEvaluate(_:)()
{
  return CalculateExpression.inlineEvaluate(_:)();
}

Swift::Void __swiftcall CalculateExpression.inlineEvaluate()()
{
}

uint64_t type metadata accessor for CalculateExpression.DeleteOperation()
{
  return type metadata accessor for CalculateExpression.DeleteOperation();
}

uint64_t CalculateExpression.activeOperation.getter()
{
  return CalculateExpression.activeOperation.getter();
}

uint64_t type metadata accessor for CalculateExpression.LiteralOperation()
{
  return type metadata accessor for CalculateExpression.LiteralOperation();
}

uint64_t CalculateExpression.debugDescription.getter()
{
  return CalculateExpression.debugDescription.getter();
}

uint64_t type metadata accessor for CalculateExpression.ConstantOperation()
{
  return type metadata accessor for CalculateExpression.ConstantOperation();
}

uint64_t CalculateExpression.allowedOperations.getter()
{
  return CalculateExpression.allowedOperations.getter();
}

uint64_t type metadata accessor for CalculateExpression.CustomOperandOperation()
{
  return type metadata accessor for CalculateExpression.CustomOperandOperation();
}

uint64_t CalculateExpression.CustomOperandOperation.__allocating_init(_:)()
{
  return CalculateExpression.CustomOperandOperation.__allocating_init(_:)();
}

uint64_t CalculateExpression.accessibilityMathEquation.getter()
{
  return CalculateExpression.accessibilityMathEquation.getter();
}

uint64_t CalculateExpression.accessibilityMathEquationDescription.getter()
{
  return CalculateExpression.accessibilityMathEquationDescription.getter();
}

uint64_t CalculateExpression.Base.init(rawValue:)()
{
  return CalculateExpression.Base.init(rawValue:)();
}

uint64_t type metadata accessor for CalculateExpression.Base()
{
  return type metadata accessor for CalculateExpression.Base();
}

uint64_t CalculateExpression.base.getter()
{
  return CalculateExpression.base.getter();
}

uint64_t CalculateExpression.base.setter()
{
  return CalculateExpression.base.setter();
}

uint64_t CalculateExpression.rich.getter()
{
  return CalculateExpression.rich.getter();
}

uint64_t CalculateExpression.ascii.getter()
{
  return CalculateExpression.ascii.getter();
}

Swift::Void __swiftcall CalculateExpression.clear()()
{
}

uint64_t CalculateExpression.error.getter()
{
  return CalculateExpression.error.getter();
}

uint64_t CalculateExpression.engine.setter()
{
  return CalculateExpression.engine.setter();
}

uint64_t CalculateExpression.format.getter()
{
  return CalculateExpression.format.getter();
}

uint64_t CalculateExpression.format.setter()
{
  return CalculateExpression.format.setter();
}

uint64_t CalculateExpression.__allocating_init(result:error:options:base:id:)()
{
  return CalculateExpression.__allocating_init(result:error:options:base:id:)();
}

uint64_t CalculateExpression.result.getter()
{
  return CalculateExpression.result.getter();
}

uint64_t CalculateExpression.update(_:)()
{
  return CalculateExpression.update(_:)();
}

uint64_t CalculateExpression.locales.setter()
{
  return CalculateExpression.locales.setter();
}

uint64_t CalculateExpression.__allocating_init(options:base:id:)()
{
  return CalculateExpression.__allocating_init(options:base:id:)();
}

uint64_t CalculateExpression.options.getter()
{
  return CalculateExpression.options.getter();
}

uint64_t CalculateExpression.unicode.getter()
{
  return CalculateExpression.unicode.getter();
}

uint64_t static CalculateExpression.Operation.leftRotate.getter()
{
  return static CalculateExpression.Operation.leftRotate.getter();
}

uint64_t static CalculateExpression.Operation.reciprocal.getter()
{
  return static CalculateExpression.Operation.reciprocal.getter();
}

uint64_t static CalculateExpression.Operation.rightShift.getter()
{
  return static CalculateExpression.Operation.rightShift.getter();
}

uint64_t static CalculateExpression.Operation.squareRoot.getter()
{
  return static CalculateExpression.Operation.squareRoot.getter();
}

uint64_t static CalculateExpression.Operation.eulerNumber.getter()
{
  return static CalculateExpression.Operation.eulerNumber.getter();
}

uint64_t static CalculateExpression.Operation.inverseSine.getter()
{
  return static CalculateExpression.Operation.inverseSine.getter();
}

uint64_t static CalculateExpression.Operation.reverseRoot.getter()
{
  return static CalculateExpression.Operation.reverseRoot.getter();
}

uint64_t static CalculateExpression.Operation.rightRotate.getter()
{
  return static CalculateExpression.Operation.rightRotate.getter();
}

uint64_t static CalculateExpression.Operation.inverseCosine.getter()
{
  return static CalculateExpression.Operation.inverseCosine.getter();
}

uint64_t static CalculateExpression.Operation.hyperbolicSine.getter()
{
  return static CalculateExpression.Operation.hyperbolicSine.getter();
}

uint64_t static CalculateExpression.Operation.inverseTangent.getter()
{
  return static CalculateExpression.Operation.inverseTangent.getter();
}

uint64_t static CalculateExpression.Operation.logarithmBase2.getter()
{
  return static CalculateExpression.Operation.logarithmBase2.getter();
}

uint64_t static CalculateExpression.Operation.leftShiftCustom.getter()
{
  return static CalculateExpression.Operation.leftShiftCustom.getter();
}

uint64_t static CalculateExpression.Operation.logarithmBase10.getter()
{
  return static CalculateExpression.Operation.logarithmBase10.getter();
}

uint64_t static CalculateExpression.Operation.openParenthesis.getter()
{
  return static CalculateExpression.Operation.openParenthesis.getter();
}

uint64_t static CalculateExpression.Operation.closeParenthesis.getter()
{
  return static CalculateExpression.Operation.closeParenthesis.getter();
}

uint64_t static CalculateExpression.Operation.exponentialBase2.getter()
{
  return static CalculateExpression.Operation.exponentialBase2.getter();
}

uint64_t static CalculateExpression.Operation.hyperbolicCosine.getter()
{
  return static CalculateExpression.Operation.hyperbolicCosine.getter();
}

uint64_t static CalculateExpression.Operation.logarithmNatural.getter()
{
  return static CalculateExpression.Operation.logarithmNatural.getter();
}

uint64_t static CalculateExpression.Operation.rightShiftCustom.getter()
{
  return static CalculateExpression.Operation.rightShiftCustom.getter();
}

uint64_t static CalculateExpression.Operation.exponentialBase10.getter()
{
  return static CalculateExpression.Operation.exponentialBase10.getter();
}

uint64_t static CalculateExpression.Operation.hyperbolicTangent.getter()
{
  return static CalculateExpression.Operation.hyperbolicTangent.getter();
}

uint64_t static CalculateExpression.Operation.logarithmBaseCustom.getter()
{
  return static CalculateExpression.Operation.logarithmBaseCustom.getter();
}

uint64_t static CalculateExpression.Operation.exponentialBaseEuler.getter()
{
  return static CalculateExpression.Operation.exponentialBaseEuler.getter();
}

uint64_t static CalculateExpression.Operation.exponentialBaseCustom.getter()
{
  return static CalculateExpression.Operation.exponentialBaseCustom.getter();
}

uint64_t static CalculateExpression.Operation.inverseHyperbolicSine.getter()
{
  return static CalculateExpression.Operation.inverseHyperbolicSine.getter();
}

uint64_t static CalculateExpression.Operation.inverseHyperbolicCosine.getter()
{
  return static CalculateExpression.Operation.inverseHyperbolicCosine.getter();
}

uint64_t static CalculateExpression.Operation.inverseHyperbolicTangent.getter()
{
  return static CalculateExpression.Operation.inverseHyperbolicTangent.getter();
}

uint64_t static CalculateExpression.Operation.ee.getter()
{
  return static CalculateExpression.Operation.ee.getter();
}

uint64_t static CalculateExpression.Operation.== infix(_:_:)()
{
  return static CalculateExpression.Operation.== infix(_:_:)();
}

uint64_t static CalculateExpression.Operation.or.getter()
{
  return static CalculateExpression.Operation.or.getter();
}

uint64_t static CalculateExpression.Operation.pi.getter()
{
  return static CalculateExpression.Operation.pi.getter();
}

uint64_t static CalculateExpression.Operation.add.getter()
{
  return static CalculateExpression.Operation.add.getter();
}

uint64_t static CalculateExpression.Operation.and.getter()
{
  return static CalculateExpression.Operation.and.getter();
}

uint64_t static CalculateExpression.Operation.mod.getter()
{
  return static CalculateExpression.Operation.mod.getter();
}

uint64_t static CalculateExpression.Operation.neg.getter()
{
  return static CalculateExpression.Operation.neg.getter();
}

uint64_t static CalculateExpression.Operation.nor.getter()
{
  return static CalculateExpression.Operation.nor.getter();
}

uint64_t static CalculateExpression.Operation.not.getter()
{
  return static CalculateExpression.Operation.not.getter();
}

uint64_t static CalculateExpression.Operation.xor.getter()
{
  return static CalculateExpression.Operation.xor.getter();
}

uint64_t static CalculateExpression.Operation.cube.getter()
{
  return static CalculateExpression.Operation.cube.getter();
}

uint64_t static CalculateExpression.Operation.drop.getter()
{
  return static CalculateExpression.Operation.drop.getter();
}

uint64_t static CalculateExpression.Operation.root.getter()
{
  return static CalculateExpression.Operation.root.getter();
}

uint64_t static CalculateExpression.Operation.sine.getter()
{
  return static CalculateExpression.Operation.sine.getter();
}

uint64_t static CalculateExpression.Operation.swap.getter()
{
  return static CalculateExpression.Operation.swap.getter();
}

uint64_t static CalculateExpression.Operation.clear.getter()
{
  return static CalculateExpression.Operation.clear.getter();
}

uint64_t static CalculateExpression.Operation.enter.getter()
{
  return static CalculateExpression.Operation.enter.getter();
}

uint64_t static CalculateExpression.Operation.power.getter()
{
  return static CalculateExpression.Operation.power.getter();
}

uint64_t static CalculateExpression.Operation.cosine.getter()
{
  return static CalculateExpression.Operation.cosine.getter();
}

uint64_t static CalculateExpression.Operation.delete.getter()
{
  return static CalculateExpression.Operation.delete.getter();
}

uint64_t static CalculateExpression.Operation.digit0.getter()
{
  return static CalculateExpression.Operation.digit0.getter();
}

uint64_t static CalculateExpression.Operation.digit1.getter()
{
  return static CalculateExpression.Operation.digit1.getter();
}

uint64_t static CalculateExpression.Operation.digit2.getter()
{
  return static CalculateExpression.Operation.digit2.getter();
}

uint64_t static CalculateExpression.Operation.digit3.getter()
{
  return static CalculateExpression.Operation.digit3.getter();
}

uint64_t static CalculateExpression.Operation.digit4.getter()
{
  return static CalculateExpression.Operation.digit4.getter();
}

uint64_t static CalculateExpression.Operation.digit5.getter()
{
  return static CalculateExpression.Operation.digit5.getter();
}

uint64_t static CalculateExpression.Operation.digit6.getter()
{
  return static CalculateExpression.Operation.digit6.getter();
}

uint64_t static CalculateExpression.Operation.digit7.getter()
{
  return static CalculateExpression.Operation.digit7.getter();
}

uint64_t static CalculateExpression.Operation.digit8.getter()
{
  return static CalculateExpression.Operation.digit8.getter();
}

uint64_t static CalculateExpression.Operation.digit9.getter()
{
  return static CalculateExpression.Operation.digit9.getter();
}

uint64_t static CalculateExpression.Operation.digitA.getter()
{
  return static CalculateExpression.Operation.digitA.getter();
}

uint64_t static CalculateExpression.Operation.digitB.getter()
{
  return static CalculateExpression.Operation.digitB.getter();
}

uint64_t static CalculateExpression.Operation.digitC.getter()
{
  return static CalculateExpression.Operation.digitC.getter();
}

uint64_t static CalculateExpression.Operation.digitD.getter()
{
  return static CalculateExpression.Operation.digitD.getter();
}

uint64_t static CalculateExpression.Operation.digitE.getter()
{
  return static CalculateExpression.Operation.digitE.getter();
}

uint64_t static CalculateExpression.Operation.digitF.getter()
{
  return static CalculateExpression.Operation.digitF.getter();
}

uint64_t static CalculateExpression.Operation.divide.getter()
{
  return static CalculateExpression.Operation.divide.getter();
}

uint64_t static CalculateExpression.Operation.equals.getter()
{
  return static CalculateExpression.Operation.equals.getter();
}

uint64_t static CalculateExpression.Operation.negate.getter()
{
  return static CalculateExpression.Operation.negate.getter();
}

uint64_t static CalculateExpression.Operation.random.getter()
{
  return static CalculateExpression.Operation.random.getter();
}

uint64_t static CalculateExpression.Operation.rollIn.getter()
{
  return static CalculateExpression.Operation.rollIn.getter();
}

uint64_t static CalculateExpression.Operation.square.getter()
{
  return static CalculateExpression.Operation.square.getter();
}

uint64_t static CalculateExpression.Operation.decimal.getter()
{
  return static CalculateExpression.Operation.decimal.getter();
}

uint64_t static CalculateExpression.Operation.digit00.getter()
{
  return static CalculateExpression.Operation.digit00.getter();
}

uint64_t static CalculateExpression.Operation.digitFF.getter()
{
  return static CalculateExpression.Operation.digitFF.getter();
}

uint64_t static CalculateExpression.Operation.percent.getter()
{
  return static CalculateExpression.Operation.percent.getter();
}

uint64_t static CalculateExpression.Operation.rollOut.getter()
{
  return static CalculateExpression.Operation.rollOut.getter();
}

uint64_t static CalculateExpression.Operation.tangent.getter()
{
  return static CalculateExpression.Operation.tangent.getter();
}

uint64_t static CalculateExpression.Operation.byteFlip.getter()
{
  return static CalculateExpression.Operation.byteFlip.getter();
}

uint64_t static CalculateExpression.Operation.cubeRoot.getter()
{
  return static CalculateExpression.Operation.cubeRoot.getter();
}

uint64_t static CalculateExpression.Operation.multiply.getter()
{
  return static CalculateExpression.Operation.multiply.getter();
}

uint64_t static CalculateExpression.Operation.subtract.getter()
{
  return static CalculateExpression.Operation.subtract.getter();
}

uint64_t static CalculateExpression.Operation.wordFlip.getter()
{
  return static CalculateExpression.Operation.wordFlip.getter();
}

uint64_t static CalculateExpression.Operation.factorial.getter()
{
  return static CalculateExpression.Operation.factorial.getter();
}

uint64_t static CalculateExpression.Operation.leftShift.getter()
{
  return static CalculateExpression.Operation.leftShift.getter();
}

uint64_t type metadata accessor for CalculateExpression.Operation()
{
  return type metadata accessor for CalculateExpression.Operation();
}

uint64_t type metadata accessor for CalculateExpression()
{
  return type metadata accessor for CalculateExpression();
}

uint64_t CalculateExpression.init(_:options:base:id:)()
{
  return CalculateExpression.init(_:options:base:id:)();
}

uint64_t evaluateError(_:options:)()
{
  return evaluateError(_:options:)();
}

uint64_t StocksKitCurrencyCache.Provider.destination.getter()
{
  return StocksKitCurrencyCache.Provider.destination.getter();
}

uint64_t StocksKitCurrencyCache.Provider.logo.getter()
{
  return StocksKitCurrencyCache.Provider.logo.getter();
}

uint64_t StocksKitCurrencyCache.Provider.name.getter()
{
  return StocksKitCurrencyCache.Provider.name.getter();
}

uint64_t type metadata accessor for StocksKitCurrencyCache.Provider()
{
  return type metadata accessor for StocksKitCurrencyCache.Provider();
}

uint64_t dispatch thunk of StocksKitCurrencyCache.needsRefresh.getter()
{
  return dispatch thunk of StocksKitCurrencyCache.needsRefresh.getter();
}

uint64_t static StocksKitCurrencyCache.shared.getter()
{
  return static StocksKitCurrencyCache.shared.getter();
}

uint64_t static StocksKitCurrencyCache.isEnabled.getter()
{
  return static StocksKitCurrencyCache.isEnabled.getter();
}

uint64_t type metadata accessor for StocksKitCurrencyCache()
{
  return type metadata accessor for StocksKitCurrencyCache();
}

uint64_t evaluate(_:options:)()
{
  return evaluate(_:options:)();
}

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return dispatch thunk of BackingData.setValue<A>(forKey:to:)();
}

uint64_t ModelActor.modelContext.getter()
{
  return ModelActor.modelContext.getter();
}

uint64_t dispatch thunk of ModelContext.save()()
{
  return dispatch thunk of ModelContext.save()();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return dispatch thunk of ModelContext.fetch<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)()
{
  return dispatch thunk of ModelContext.delete<A>(model:where:includeSubclasses:)();
}

uint64_t dispatch thunk of ModelContext.insert<A>(_:)()
{
  return dispatch thunk of ModelContext.insert<A>(_:)();
}

uint64_t static ModelContext.didSave.getter()
{
  return static ModelContext.didSave.getter();
}

uint64_t type metadata accessor for ModelContext()
{
  return type metadata accessor for ModelContext();
}

uint64_t ModelContext.init(_:)()
{
  return ModelContext.init(_:)();
}

uint64_t ModelContainer.__allocating_init(for:migrationPlan:configurations:)()
{
  return ModelContainer.__allocating_init(for:migrationPlan:configurations:)();
}

uint64_t type metadata accessor for ModelContainer()
{
  return type metadata accessor for ModelContainer();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return FetchDescriptor.init(predicate:sortBy:)();
}

uint64_t dispatch thunk of static PersistentModel.schemaMetadata.getter()
{
  return dispatch thunk of static PersistentModel.schemaMetadata.getter();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return static PersistentModel.createBackingData<A>()();
}

uint64_t PersistentModel.hash(into:)()
{
  return PersistentModel.hash(into:)();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return PersistentModel.getValue<A>(forKey:)();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return PersistentModel.setValue<A>(forKey:to:)();
}

uint64_t static ModelConfiguration.GroupContainer.automatic.getter()
{
  return static ModelConfiguration.GroupContainer.automatic.getter();
}

uint64_t type metadata accessor for ModelConfiguration.GroupContainer()
{
  return type metadata accessor for ModelConfiguration.GroupContainer();
}

uint64_t static ModelConfiguration.CloudKitDatabase.none.getter()
{
  return static ModelConfiguration.CloudKitDatabase.none.getter();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return type metadata accessor for ModelConfiguration.CloudKitDatabase();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return type metadata accessor for ModelConfiguration();
}

uint64_t ModelConfiguration.init(_:schema:isStoredInMemoryOnly:allowsSave:groupContainer:cloudKitDatabase:)()
{
  return ModelConfiguration.init(_:schema:isStoredInMemoryOnly:allowsSave:groupContainer:cloudKitDatabase:)();
}

uint64_t DefaultSerialModelExecutor.init(modelContext:)()
{
  return DefaultSerialModelExecutor.init(modelContext:)();
}

uint64_t type metadata accessor for DefaultSerialModelExecutor()
{
  return type metadata accessor for DefaultSerialModelExecutor();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return type metadata accessor for Schema.PropertyMetadata();
}

uint64_t type metadata accessor for Schema.Version()
{
  return type metadata accessor for Schema.Version();
}

uint64_t Schema.Version.init(_:_:_:)()
{
  return Schema.Version.init(_:_:_:)();
}

uint64_t type metadata accessor for Schema()
{
  return type metadata accessor for Schema();
}

uint64_t Schema.init(_:version:)()
{
  return Schema.init(_:version:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.contains<A>(_:)()
{
  return BidirectionalCollection<>.contains<A>(_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation(_:options:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation(_:options:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.background.getter()
{
  return static TaskPriority.background.getter();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t CalculateUnit.id.getter()
{
  return CalculateUnit.id.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t CalculateResult.converted(to:from:)()
{
  return CalculateResult.converted(to:from:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t NSAttributedString.init(_:)()
{
  return NSAttributedString.init(_:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t CalculateUnitCategory.id.getter()
{
  return CalculateUnitCategory.id.getter();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.localizedStandardCompare<A>(_:)()
{
  return StringProtocol.localizedStandardCompare<A>(_:)();
}

uint64_t StringProtocol.decomposedStringWithCompatibilityMapping.getter()
{
  return StringProtocol.decomposedStringWithCompatibilityMapping.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t static Duration.zero.getter()
{
  return static Duration.zero.getter();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateCopyWithAttributes(original, attributes);
}

uint64_t MobileGestalt_get_appleInternalInstallCapability()
{
  return _MobileGestalt_get_appleInternalInstallCapability();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t _AXSAutomationEnabled()
{
  return __AXSAutomationEnabled();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}