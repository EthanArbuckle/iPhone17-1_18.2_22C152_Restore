void sub_1C68BB2B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t i;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a1 + 56;
  v2 = 1 << *(unsigned char *)(a1 + 32);
  v3 = -1;
  if (v2 < 64) {
    v3 = ~(-1 << v2);
  }
  v4 = v3 & *(void *)(a1 + 56);
  v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  v6 = 0;
  v7 = MEMORY[0x1E4FBC860];
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  v8 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (i = v8 | (v6 << 6); ; i = __clz(__rbit64(v11)) + (v6 << 6))
  {
    v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1C65C8524();
      v7 = v18;
    }
    v16 = *(void *)(v7 + 16);
    if (v16 >= *(void *)(v7 + 24) >> 1)
    {
      sub_1C65C8524();
      v7 = v19;
    }
    *(void *)(v7 + 16) = v16 + 1;
    v17 = v7 + 16 * v16;
    *(void *)(v17 + 32) = v14;
    *(void *)(v17 + 40) = v15;
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    v10 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v10 >= v5) {
      goto LABEL_27;
    }
    v11 = *(void *)(v20 + 8 * v10);
    ++v6;
    if (!v11)
    {
      v6 = v10 + 1;
      if (v10 + 1 >= v5) {
        goto LABEL_27;
      }
      v11 = *(void *)(v20 + 8 * v6);
      if (!v11)
      {
        v6 = v10 + 2;
        if (v10 + 2 >= v5) {
          goto LABEL_27;
        }
        v11 = *(void *)(v20 + 8 * v6);
        if (!v11)
        {
          v6 = v10 + 3;
          if (v10 + 3 >= v5) {
            goto LABEL_27;
          }
          v11 = *(void *)(v20 + 8 * v6);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_20:
    v4 = (v11 - 1) & v11;
  }
  v12 = v10 + 4;
  if (v12 >= v5)
  {
LABEL_27:
    swift_release();
    return;
  }
  v11 = *(void *)(v20 + 8 * v12);
  if (v11)
  {
    v6 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v6 >= v5) {
      goto LABEL_27;
    }
    v11 = *(void *)(v20 + 8 * v6);
    ++v12;
    if (v11) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_1C68BB4AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = *(void *)(sub_1C68EA8C8() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v11 = *(void *)(v3 + 72);
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x1E4FBC860];
    do
    {
      sub_1C68CC204();
      if (v13)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C662F038();
          uint64_t v5 = v8;
        }
        unint64_t v6 = *(void *)(v5 + 16);
        if (v6 >= *(void *)(v5 + 24) >> 1)
        {
          sub_1C662F038();
          uint64_t v5 = v9;
        }
        *(void *)(v5 + 16) = v6 + 1;
        uint64_t v7 = v5 + 40 * v6;
        *(void *)(v7 + 32) = v12;
        *(void *)(v7 + 40) = v13;
        *(_OWORD *)(v7 + 48) = v14;
        *(void *)(v7 + 64) = v15;
      }
      v4 += v11;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

void sub_1C68BB670(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = MEMORY[0x1E4FBC860];
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_22:
    swift_bridgeObjectRetain();
    __int16 v11 = sub_1C65CAAA8();
    if (v11 != 376)
    {
      __int16 v12 = v11;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C65C8B7C();
        uint64_t v7 = v14;
      }
      unint64_t v13 = *(void *)(v7 + 16);
      if (v13 >= *(void *)(v7 + 24) >> 1)
      {
        sub_1C65C8B7C();
        uint64_t v7 = v15;
      }
      *(void *)(v7 + 16) = v13 + 1;
      *(_WORD *)(v7 + 2 * v13 + 32) = v12;
    }
  }
  int64_t v8 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v8 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v8);
  ++v6;
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 1;
  if (v8 + 1 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 2;
  if (v8 + 2 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 3;
  if (v8 + 3 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9)
  {
LABEL_21:
    uint64_t v4 = (v9 - 1) & v9;
    goto LABEL_22;
  }
  int64_t v10 = v8 + 4;
  if (v10 >= v5)
  {
LABEL_28:
    swift_release();
    return;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v10);
  if (v9)
  {
    int64_t v6 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v6 >= v5) {
      goto LABEL_28;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v6);
    ++v10;
    if (v9) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
}

void sub_1C68BB868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v36 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a1 + 56);
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v12 = MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v61 = v12;
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v11 >= v37) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v36 + 8 * v11);
    if (!v16) {
      break;
    }
LABEL_18:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_19:
    uint64_t v18 = *(void *)(a1 + 48) + 48 * v14;
    uint64_t v19 = *(void *)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 16);
    uint64_t v22 = *(void *)(v18 + 24);
    uint64_t v23 = *(void *)(v18 + 32);
    char v24 = *(unsigned char *)(v18 + 40);
    v59[0] = *(void *)v18;
    uint64_t v20 = v59[0];
    v59[1] = v19;
    v59[2] = v21;
    v59[3] = v22;
    v59[4] = v23;
    char v60 = v24;
    sub_1C67A4428(v59[0], v19, v21, v22, v23, v24);
    sub_1C68D0200((uint64_t)v59, a2, a3, a4, a5, a6, &v49);
    if (v7)
    {
      sub_1C680B2EC(v20, v19, v21, v22, v23, v24);
      swift_bridgeObjectRelease();
LABEL_32:
      swift_release();
      sub_1C68D84CC(a2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    sub_1C680B2EC(v20, v19, v21, v22, v23, v24);
    uint64_t v25 = v50;
    if (v50)
    {
      uint64_t v26 = v49;
      uint64_t v27 = v53;
      long long v47 = v54;
      long long v48 = v51;
      long long v46 = v55;
      uint64_t v28 = v56;
      uint64_t v29 = v57;
      uint64_t v44 = v58;
      uint64_t v45 = v52;
      uint64_t v30 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C662F0B4();
        uint64_t v30 = v34;
      }
      unint64_t v31 = *(void *)(v30 + 16);
      uint64_t v32 = v30;
      if (v31 >= *(void *)(v30 + 24) >> 1)
      {
        sub_1C662F0B4();
        uint64_t v32 = v35;
      }
      *(void *)(v32 + 16) = v31 + 1;
      uint64_t v12 = v32;
      uint64_t v33 = v32 + 104 * v31;
      *(void *)(v33 + 32) = v26;
      *(void *)(v33 + 40) = v25;
      *(_OWORD *)(v33 + 48) = v48;
      *(void *)(v33 + 64) = v45;
      *(void *)(v33 + 72) = v27;
      *(_OWORD *)(v33 + 80) = v47;
      *(_OWORD *)(v33 + 96) = v46;
      *(void *)(v33 + 112) = v28;
      *(void *)(v33 + 120) = v29;
      *(void *)(v33 + 128) = v44;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v12 = v61;
    }
  }
  int64_t v17 = v11 + 1;
  if (v11 + 1 >= v37) {
    goto LABEL_32;
  }
  unint64_t v16 = *(void *)(v36 + 8 * v17);
  if (v16) {
    goto LABEL_17;
  }
  int64_t v17 = v11 + 2;
  if (v11 + 2 >= v37) {
    goto LABEL_32;
  }
  unint64_t v16 = *(void *)(v36 + 8 * v17);
  if (v16) {
    goto LABEL_17;
  }
  int64_t v17 = v11 + 3;
  if (v11 + 3 >= v37) {
    goto LABEL_32;
  }
  unint64_t v16 = *(void *)(v36 + 8 * v17);
  if (v16) {
    goto LABEL_17;
  }
  int64_t v17 = v11 + 4;
  if (v11 + 4 >= v37) {
    goto LABEL_32;
  }
  unint64_t v16 = *(void *)(v36 + 8 * v17);
  if (v16)
  {
LABEL_17:
    int64_t v11 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v37) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v36 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_18;
    }
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_1C68BBBA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a1;
  sub_1C65EA404(a2, v28);
  uint64_t v7 = v28[0];
  int64_t v8 = v28[3];
  unint64_t v9 = v28[4];
  uint64_t v22 = v28[1];
  int64_t v23 = (unint64_t)(v28[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v11 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v12 = v11 | (v8 << 6);
  while (1)
  {
    unint64_t v16 = (void *)(*(void *)(v7 + 56) + 40 * v12);
    uint64_t v17 = v16[1];
    uint64_t v18 = v16[2];
    uint64_t v19 = v16[3];
    uint64_t v20 = v16[4];
    *(void *)&long long v24 = *v16;
    *((void *)&v24 + 1) = v17;
    uint64_t v25 = v18;
    uint64_t v26 = v19;
    uint64_t v27 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C68C11DC((uint64_t)&v29, &v24, a3, a4);
    if (v4)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a3;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v13 >= v23) {
      goto LABEL_24;
    }
    unint64_t v14 = *(void *)(v22 + 8 * v13);
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v23) {
        goto LABEL_24;
      }
      unint64_t v14 = *(void *)(v22 + 8 * v15);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v8 + 3;
      if (v8 + 3 >= v23) {
        goto LABEL_24;
      }
      unint64_t v14 = *(void *)(v22 + 8 * v15);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v8 + 4;
      if (v8 + 4 >= v23) {
        goto LABEL_24;
      }
      unint64_t v14 = *(void *)(v22 + 8 * v15);
      if (v14)
      {
LABEL_12:
        int64_t v13 = v15;
      }
      else
      {
        int64_t v13 = v8 + 5;
        if (v8 + 5 >= v23) {
          goto LABEL_24;
        }
        unint64_t v14 = *(void *)(v22 + 8 * v13);
        if (!v14)
        {
          int64_t v21 = v8 + 6;
          while (v21 < v23)
          {
            unint64_t v14 = *(void *)(v22 + 8 * v21++);
            if (v14)
            {
              int64_t v13 = v21 - 1;
              goto LABEL_13;
            }
          }
LABEL_24:
          swift_bridgeObjectRelease();
          swift_release();
          a3 = v29;
          swift_bridgeObjectRelease();
          return a3;
        }
      }
    }
LABEL_13:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v13 << 6);
    int64_t v8 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68BBE00(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)a1;
  uint64_t v13 = a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_1C68ED528())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v9 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C87A4300](i - 4, a2) : *(id *)(a2 + 8 * i);
      uint64_t v6 = v9;
      uint64_t v10 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v12 = v9;
      sub_1C68C3988(&v13, &v12, a3);
      if (v3)
      {
        swift_release();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return (uint64_t)v6;
      }

      if (v10 == v7)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_release();
  swift_bridgeObjectRelease();
  return (uint64_t)v6;
}

uint64_t sub_1C68BBF4C(uint64_t result, int64_t a2, int64_t a3, void (*a4)(uint64_t **__return_ptr, unint64_t), uint64_t *a5, uint64_t a6, uint64_t *a7, void (*a8)(char *, char *), uint64_t a9)
{
  uint64_t v18 = result;
  if (a2 == a3)
  {
    uint64_t v11 = result;
LABEL_9:
    swift_bridgeObjectRelease();
    return v11;
  }
  else
  {
    int64_t v13 = a2;
    if (a3 >= a2)
    {
      uint64_t v11 = a9;
      while (v13 < a3)
      {
        uint64_t result = sub_1C68BC664(&v18, v13, a4, a5, a6, a7, a8, a9);
        if (v9)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
        if (a3 == ++v13)
        {
          uint64_t v11 = v18;
          goto LABEL_9;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1C68BC040(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned char *))
{
  uint64_t v3 = v2;
  uint64_t v17 = MEMORY[0x1E4FBC860];
  sub_1C669FA00();
  uint64_t v5 = v17;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v14 = a1;
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 32;
    while (1)
    {
      memcpy(__dst, (const void *)(v14 + v8), 0x108uLL);
      memcpy(v16, (const void *)(v14 + v8), 0x108uLL);
      __dst[33] = v7;
      sub_1C65B537C(__dst);
      uint64_t v9 = a2(v7, v16);
      if (v3) {
        break;
      }
      uint64_t v10 = v9;
      sub_1C65B6550(__dst);
      uint64_t v17 = v5;
      unint64_t v11 = *(void *)(v5 + 16);
      if (v11 >= *(void *)(v5 + 24) >> 1)
      {
        sub_1C669FA00();
        uint64_t v5 = v17;
      }
      ++v7;
      *(void *)(v5 + 16) = v11 + 1;
      *(void *)(v5 + 8 * v11 + 32) = v10;
      v8 += 264;
      if (v6 == v7) {
        goto LABEL_9;
      }
    }
    sub_1C65B6550(__dst);
    swift_release();
  }
LABEL_9:
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C68BC1B4@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = type metadata accessor for Contact();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF52B0);
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C6626FA0(v2, (uint64_t)v11, &qword_1EBBF52B0);
  uint64_t v12 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6) != 1)
  {
    sub_1C65C54EC((uint64_t)v11, (uint64_t)v8);
    a1(v8);
    uint64_t result = sub_1C68D8374((uint64_t)v8, (void (*)(void))type metadata accessor for Contact);
    if (v3) {
      return result;
    }
    uint64_t v12 = 0;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  return __swift_storeEnumTagSinglePayload(a2, v12, 1, v14);
}

uint64_t sub_1C68BC354(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (*(void *)(a3 + 16) > 1uLL)
  {
    uint64_t v8 = sub_1C68ECD78();
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_1C68B7A98(v5, (uint64_t)&v8, a1);
    uint64_t v3 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_1C68BC3E8(void (*a1)(uint64_t **__return_ptr, unint64_t), uint64_t *a2, void (*a3)(char *, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a5;
  int64_t v13 = *(void *)(a5 + 16);
  swift_bridgeObjectRetain();
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t v15 = sub_1C68EC748();
  swift_bridgeObjectRetain();
  sub_1C68BBF4C(v15, 0, v13, a1, a2, a5, &v30, a3, a4);
  swift_bridgeObjectRetain();
  sub_1C68306F0();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v29 = v17;
  sub_1C68BDA44(&v29);
  swift_bridgeObjectRelease();
  uint64_t v18 = v29;
  uint64_t v19 = *(void *)(v29 + 16);
  if (v19)
  {
    uint64_t v29 = v14;
    sub_1C669FB20();
    uint64_t v20 = 0;
    uint64_t v14 = v29;
    unint64_t v21 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v26 = v30 + v21;
    uint64_t v27 = v30;
    while (1)
    {
      unint64_t v22 = *(void *)(v18 + 8 * v20 + 32);
      if ((v22 & 0x8000000000000000) != 0) {
        break;
      }
      if (v22 >= *(void *)(v27 + 16)) {
        goto LABEL_10;
      }
      uint64_t v23 = *(void *)(v28 + 72);
      sub_1C6626FA0(v26 + v23 * v22, (uint64_t)v12, &qword_1EBBF5210);
      uint64_t v29 = v14;
      unint64_t v24 = *(void *)(v14 + 16);
      if (v24 >= *(void *)(v14 + 24) >> 1)
      {
        sub_1C669FB20();
        uint64_t v14 = v29;
      }
      ++v20;
      *(void *)(v14 + 16) = v24 + 1;
      sub_1C6626FE4((uint64_t)v12, v14 + v21 + v24 * v23, &qword_1EBBF5210);
      if (v19 == v20) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_8:
    swift_release();
    swift_bridgeObjectRelease();
    return v14;
  }
  return result;
}

uint64_t sub_1C68BC664(uint64_t *a1, unint64_t a2, void (*a3)(uint64_t **__return_ptr, unint64_t), uint64_t *a4, uint64_t a5, uint64_t *a6, void (*a7)(char *, char *), uint64_t a8)
{
  uint64_t v9 = v8;
  v31[1] = a8;
  uint64_t v32 = a7;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210) - 8;
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  unint64_t v22 = (char *)v31 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v33 = (char *)v31 - v24;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)(a5 + 16) <= a2)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v38 = v8;
  unint64_t v34 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v35 = a6;
  uint64_t v9 = *(void *)(v23 + 72);
  a3(&v36, a5 + v34 + v9 * a2);
  a4 = v36;
  a5 = v37;
  unint64_t v25 = sub_1C6833168((uint64_t)v36, v37, *a1);
  if (v26)
  {
    swift_bridgeObjectRetain();
    sub_1C6851E80(a2, (uint64_t)a4, a5);
    return swift_bridgeObjectRelease_n();
  }
  a3 = (void (*)(uint64_t **__return_ptr, unint64_t))v25;
  if ((v25 & 0x8000000000000000) != 0) {
    goto LABEL_13;
  }
  uint64_t v27 = *v35;
  unint64_t v28 = *(void *)(*v35 + 16);
  if (v25 >= v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  a4 = (uint64_t *)(v27 + v34);
  a5 = v25 * v9;
  sub_1C6626FA0(v27 + v34 + v25 * v9, (uint64_t)v22, &qword_1EBBF5210);
  if (v28 > a2)
  {
    sub_1C6626FA0((uint64_t)a4 + v9 * a2, (uint64_t)v19, &qword_1EBBF5210);
    uint64_t v9 = (uint64_t)v33;
    v32(v22, v19);
    sub_1C65C117C((uint64_t)v19, &qword_1EBBF5210);
    sub_1C65C117C((uint64_t)v22, &qword_1EBBF5210);
    a4 = v35;
    uint64_t v29 = *v35;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v29;
    if (result) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  __break(1u);
LABEL_16:
  uint64_t result = sub_1C681A348();
  uint64_t v29 = result;
  *a4 = result;
LABEL_8:
  if ((unint64_t)a3 >= *(void *)(v29 + 16))
  {
    __break(1u);
  }
  else
  {
    sub_1C65E7B74(v9, v29 + v34 + a5, &qword_1EBBF5210);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C68BC914()
{
  sub_1C68ED598();
  OUTLINED_FUNCTION_2_1();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1C68BC958(char a1)
{
  if (a1) {
    char v1 = sub_1C68ED7E8();
  }
  else {
    char v1 = 1;
  }
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C68BC9E8(unint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  unint64_t v5 = sub_1C68D7134(a1, a2);
  uint64_t v6 = *v2;
  uint64_t v7 = *(void *)(*v2 + 16);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int64_t v9 = v5;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = v6;
  if (!isUniquelyReferenced_nonNull_native || (uint64_t v11 = *(void *)(v6 + 24) >> 1, v11 < v8))
  {
    sub_1C662E714();
    uint64_t v6 = v12;
    *uint64_t v2 = v12;
    uint64_t v11 = *(void *)(v12 + 24) >> 1;
  }
  uint64_t v13 = *(void *)(v6 + 16);
  uint64_t v14 = v11 - v13;
  uint64_t v15 = sub_1C68D7374(&v31, v6 + 4 * v13 + 32, v11 - v13, a1, v3);
  if (v15 < v9) {
    goto LABEL_12;
  }
  if (v15 >= 1)
  {
    uint64_t v16 = *(void *)(v6 + 16);
    BOOL v17 = __OFADD__(v16, v15);
    uint64_t v18 = v16 + v15;
    if (v17)
    {
      __break(1u);
      goto LABEL_20;
    }
    *(void *)(v6 + 16) = v18;
  }
  if (v15 == v14)
  {
LABEL_13:
    int64_t v9 = v33;
    uint64_t v14 = v34;
    if (v33 >= v34) {
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v6 = v31;
    unint64_t v3 = v32;
    if ((v32 & 0x1000000000000000) != 0)
    {
      uint64_t v20 = sub_1C68ED388();
      BOOL v22 = (v3 & 0x2000000000000000) == 0;
      goto LABEL_21;
    }
    if ((v32 & 0x2000000000000000) == 0)
    {
      if ((v31 & 0x1000000000000000) == 0) {
        sub_1C68ED408();
      }
      uint64_t v20 = sub_1C68ED418();
      BOOL v22 = 1;
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v20 = sub_1C68ED418();
    BOOL v22 = 0;
LABEL_21:
    uint64_t v23 = v21 + v9;
    while (1)
    {
      uint64_t v24 = *v2;
      uint64_t v25 = *(void *)(*v2 + 24) >> 1;
      uint64_t v26 = v8 + 1;
      if (v25 < v8 + 1)
      {
        uint64_t v29 = v20;
        sub_1C662E714();
        uint64_t v26 = v8 + 1;
        uint64_t v24 = v30;
        uint64_t v20 = v29;
        *uint64_t v2 = v24;
        uint64_t v25 = *(void *)(v24 + 24) >> 1;
      }
      if (v8 < v25)
      {
        *(_DWORD *)(v24 + 4 * v8 + 32) = v20;
        if (v23 >= v14)
        {
LABEL_38:
          uint64_t v6 = *v2;
          *(void *)(*v2 + 16) = v26;
          break;
        }
        uint64_t v27 = v24 + 36;
        while (1)
        {
          if ((v3 & 0x1000000000000000) != 0)
          {
            uint64_t v20 = sub_1C68ED388();
          }
          else
          {
            if (v22 && (v6 & 0x1000000000000000) == 0) {
              sub_1C68ED408();
            }
            uint64_t v20 = sub_1C68ED418();
          }
          v23 += v28;
          if (v8 + 1 >= v25) {
            break;
          }
          *(_DWORD *)(v27 + 4 * v8++) = v20;
          if (v23 >= v14)
          {
            uint64_t v26 = v8 + 1;
            goto LABEL_38;
          }
        }
        uint64_t v24 = *v2;
        ++v8;
      }
      *(void *)(v24 + 16) = v8;
    }
  }
LABEL_10:
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = v6;
  return result;
}

void sub_1C68BCCAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v5 = a1;
  if (!swift_isUniquelyReferenced_nonNull_native() || (uint64_t v6 = *(void *)(v3 + 24) >> 1, v6 < v4 + v2))
  {
    sub_1C662E824();
    uint64_t v3 = v7;
    uint64_t v6 = *(void *)(v7 + 24) >> 1;
  }
  uint64_t v8 = v6 - *(void *)(v3 + 16);
  sub_1C687B374();
  if (v9 < v2) {
    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v13 = *(void *)(v3 + 16);
    BOOL v14 = __OFADD__(v13, v9);
    uint64_t v15 = v13 + v9;
    if (v14)
    {
      __break(1u);
      goto LABEL_42;
    }
    *(void *)(v3 + 16) = v15;
  }
  if (v9 != v8)
  {
LABEL_10:
    sub_1C6645058();
    *char v1 = v3;
    return;
  }
LABEL_13:
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v9 = v44;
  uint64_t v10 = v45;
  uint64_t v11 = v46;
  int64_t v12 = v47;
  if (!v48)
  {
LABEL_42:
    int64_t v30 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_60;
    }
    int64_t v18 = (unint64_t)(v11 + 64) >> 6;
    if (v30 >= v18) {
      goto LABEL_10;
    }
    unint64_t v31 = *(void *)(v10 + 8 * v30);
    int64_t v32 = v12 + 1;
    if (!v31)
    {
      if (v12 + 2 >= v18) {
        goto LABEL_10;
      }
      uint64_t v9 = OUTLINED_FUNCTION_22_35();
      if (!v31)
      {
        if (v33 + 2 >= v18) {
          goto LABEL_10;
        }
        uint64_t v9 = OUTLINED_FUNCTION_22_35();
        if (!v31)
        {
          if (v34 + 3 >= v18) {
            goto LABEL_10;
          }
          uint64_t v9 = OUTLINED_FUNCTION_22_35();
          if (!v31)
          {
            if (v35 + 4 >= v18) {
              goto LABEL_10;
            }
            uint64_t v9 = OUTLINED_FUNCTION_22_35();
            if (!v31)
            {
              int64_t v40 = v36 + 6;
              do
              {
                if (v40 >= v18) {
                  goto LABEL_10;
                }
                unint64_t v31 = *(void *)(v38 + 8 * v40++);
              }
              while (!v31);
              int64_t v32 = v40 - 1;
              uint64_t v11 = v37;
              uint64_t v10 = v38;
              uint64_t v9 = v39;
            }
          }
        }
      }
    }
    unint64_t v16 = (v31 - 1) & v31;
    unint64_t v17 = __clz(__rbit64(v31)) + (v32 << 6);
    int64_t v12 = v32;
    goto LABEL_15;
  }
  unint64_t v16 = (v48 - 1) & v48;
  unint64_t v17 = __clz(__rbit64(v48)) | (v47 << 6);
  int64_t v18 = (unint64_t)(v46 + 64) >> 6;
LABEL_15:
  uint64_t v19 = *(void *)(*(void *)(v9 + 48) + 8 * v17);
  while (1)
  {
    uint64_t v20 = *(void *)(v3 + 24) >> 1;
    if (v20 < v5 + 1)
    {
      uint64_t v42 = v10;
      uint64_t v43 = v9;
      uint64_t v41 = v11;
      uint64_t v27 = v12;
      unint64_t v28 = v16;
      sub_1C662E824();
      unint64_t v16 = v28;
      int64_t v12 = v27;
      uint64_t v11 = v41;
      uint64_t v10 = v42;
      uint64_t v3 = v29;
      uint64_t v9 = v43;
      uint64_t v20 = *(void *)(v3 + 24) >> 1;
    }
    if (v5 < v20) {
      break;
    }
LABEL_38:
    *(void *)(v3 + 16) = v5;
  }
  while (1)
  {
    *(void *)(v3 + 32 + 8 * v5++) = v19;
    if (v16)
    {
      unint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v22 = v21 | (v12 << 6);
      goto LABEL_37;
    }
    int64_t v23 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v23 >= v18) {
      goto LABEL_39;
    }
    unint64_t v24 = *(void *)(v10 + 8 * v23);
    int64_t v25 = v12 + 1;
    if (!v24)
    {
      int64_t v25 = v12 + 2;
      if (v12 + 2 >= v18) {
        goto LABEL_39;
      }
      unint64_t v24 = *(void *)(v10 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v12 + 3;
        if (v12 + 3 >= v18) {
          goto LABEL_39;
        }
        unint64_t v24 = *(void *)(v10 + 8 * v25);
        if (!v24)
        {
          int64_t v25 = v12 + 4;
          if (v12 + 4 >= v18) {
            goto LABEL_39;
          }
          unint64_t v24 = *(void *)(v10 + 8 * v25);
          if (!v24)
          {
            int64_t v25 = v12 + 5;
            if (v12 + 5 >= v18) {
              goto LABEL_39;
            }
            unint64_t v24 = *(void *)(v10 + 8 * v25);
            if (!v24)
            {
              int64_t v26 = v12 + 6;
              while (v26 < v18)
              {
                unint64_t v24 = *(void *)(v10 + 8 * v26++);
                if (v24)
                {
                  int64_t v25 = v26 - 1;
                  goto LABEL_36;
                }
              }
LABEL_39:
              *(void *)(v3 + 16) = v5;
              goto LABEL_10;
            }
          }
        }
      }
    }
LABEL_36:
    unint64_t v16 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
    int64_t v12 = v25;
LABEL_37:
    uint64_t v19 = *(void *)(*(void *)(v9 + 48) + 8 * v22);
    if (v5 >= v20) {
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_60:
  __break(1u);
}

void sub_1C68BD004()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_152();
  if (v8)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v5;
  if (!OUTLINED_FUNCTION_43_13() || v4 > *(void *)(v2 + 24) >> 1)
  {
    OUTLINED_FUNCTION_41_20();
    uint64_t v2 = v11();
  }
  if (!*(void *)(v0 + 16))
  {
    if (!v3) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v13 = (*(void *)(v2 + 24) >> 1) - v12;
  uint64_t v14 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(v9) - 8);
  if (v13 < v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v10(v0 + v15, v3, v2 + v15 + *(void *)(v14 + 72) * v12);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *char v1 = v2;
    OUTLINED_FUNCTION_10();
    return;
  }
  OUTLINED_FUNCTION_42_17();
  if (!v8)
  {
    *(void *)(v2 + 16) = v16;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD114(uint64_t a1)
{
}

void sub_1C68BD140(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_43_13() || v7 + v5 > *(void *)(v6 + 24) >> 1)
  {
    OUTLINED_FUNCTION_41_20();
    uint64_t v6 = a2();
  }
  if (!*(void *)(v3 + 16))
  {
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_13_59();
  if (v10 != v11)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = OUTLINED_FUNCTION_12_54();
  a3(v12);
  if (!v5)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v4 = v6;
    return;
  }
  OUTLINED_FUNCTION_42_17();
  if (!v11)
  {
    *(void *)(v6 + 16) = v13;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD210(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C68ED528();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v3 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C68ED528();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *char v1 = v3;
  uint64_t v4 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
  {
    uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v4 = 1;
  }
  uint64_t v13 = v2;
  if (v3 >> 62) {
    goto LABEL_27;
  }
  uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v8 <= v5) {
      uint64_t v8 = v5;
    }
    swift_bridgeObjectRetain();
    unint64_t v3 = MEMORY[0x1C87A4310](v4, v8, 1, v3);
    swift_bridgeObjectRelease();
    *char v1 = v3;
    uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8;
    uint64_t v2 = v13;
LABEL_16:
    OUTLINED_FUNCTION_25_37(v7);
    sub_1C68D6F88();
    if (v9 >= v2) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1C68ED528();
    swift_bridgeObjectRelease();
  }
  if (v9 >= 1)
  {
    OUTLINED_FUNCTION_54_13();
    if (v12)
    {
      __break(1u);
      return;
    }
    *(void *)(v10 + 16) = v11;
  }
  swift_bridgeObjectRelease();

  sub_1C68ECC18();
}

void sub_1C68BD414()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_152();
  if (v8)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v5;
  if (!OUTLINED_FUNCTION_43_13() || v4 > *(void *)(v2 + 24) >> 1)
  {
    OUTLINED_FUNCTION_41_20();
    uint64_t v2 = v11();
  }
  if (!*(void *)(v0 + 16))
  {
    if (!v3) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v13 = (*(void *)(v2 + 24) >> 1) - v12;
  uint64_t v14 = *(void *)(v9(0) - 8);
  if (v13 < v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v10(v0 + v15, v3, v2 + v15 + *(void *)(v14 + 72) * v12);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *char v1 = v2;
    OUTLINED_FUNCTION_10();
    return;
  }
  OUTLINED_FUNCTION_42_17();
  if (!v8)
  {
    *(void *)(v2 + 16) = v16;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD528(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_1C65C8A90();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1C669E1F0();
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *char v1 = v3;
    return;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD608(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_1C662F0B4();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1C669F500(a1 + 32, v2);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *char v1 = v3;
    return;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD6E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_1C662F158();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1C669F5B8(a1 + 32, v2);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *char v1 = v3;
    return;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1C68BD7C4(unint64_t a1)
{
}

uint64_t sub_1C68BD800(char a1)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_118_0();
    goto LABEL_5;
  }
  if (a1 != 1)
  {
LABEL_5:
    char v1 = sub_1C68ED7E8();
    goto LABEL_6;
  }
  char v1 = 1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C68BD88C(char a1)
{
  if (a1)
  {
    if (a1 != 1)
    {
      char v1 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    OUTLINED_FUNCTION_118_0();
  }
  char v1 = sub_1C68ED7E8();
LABEL_7:
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C68BD910()
{
  return sub_1C68E9B88();
}

uint64_t sub_1C68BD960(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210) - 8);
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C676B16C();
    uint64_t v5 = v6;
  }
  uint64_t v7 = *(void *)(v5 + 16);
  v9[0] = v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v9[1] = v7;
  swift_bridgeObjectRetain();
  sub_1C68D3E8C(v9, a2);
  *a1 = v5;
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1C68BDA44(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C676B240();
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_1C68D4E8C(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_1C68BDAB0(uint64_t result)
{
  int64_t v1 = 0;
  uint64_t v2 = result + 56;
  uint64_t v3 = 1 << *(unsigned char *)(result + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(result + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  while (v5)
  {
    unint64_t v7 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v8 = v7 | (v1 << 6);
LABEL_22:
    if (*(unsigned char *)(*(void *)(result + 48) + 48 * v8 + 40) != 2) {
      return 0;
    }
  }
  int64_t v9 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v9 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v9);
  ++v1;
  if (v10) {
    goto LABEL_21;
  }
  int64_t v1 = v9 + 1;
  if (v9 + 1 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10) {
    goto LABEL_21;
  }
  int64_t v1 = v9 + 2;
  if (v9 + 2 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10) {
    goto LABEL_21;
  }
  int64_t v1 = v9 + 3;
  if (v9 + 3 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10)
  {
LABEL_21:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v1 << 6);
    goto LABEL_22;
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v11);
  if (v10)
  {
    int64_t v1 = v11;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v1 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v1 >= v6) {
      return 1;
    }
    unint64_t v10 = *(void *)(v2 + 8 * v1);
    ++v11;
    if (v10) {
      goto LABEL_21;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_1C68BDBD8(void *a1@<X8>)
{
}

BOOL sub_1C68BDBE0(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

void sub_1C68BDC0C(uint64_t a1)
{
  OUTLINED_FUNCTION_84_2(*v1 | a1);
}

void sub_1C68BDC18(uint64_t a1)
{
  OUTLINED_FUNCTION_84_2(*v1 & a1);
}

BOOL sub_1C68BDC24(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1C68BDC30(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

void sub_1C68BDC3C(uint64_t a1)
{
  int64_t v2 = 0;
  uint64_t v3 = a1 + 56;
  OUTLINED_FUNCTION_19_31();
  unint64_t v6 = v5 & v4;
  int64_t v8 = (unint64_t)(v7 + 63) >> 6;
  if ((v5 & v4) == 0) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v2 << 6))
  {
    sub_1C67FB9F8((uint64_t)v14, *(void *)(*(void *)(a1 + 48) + 8 * i));
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v11 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
      return;
    }
    if (v11 >= v8) {
      goto LABEL_21;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v2;
    if (!v12)
    {
      int64_t v2 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_21;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v2);
      if (!v12)
      {
        int64_t v2 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_21;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v2);
        if (!v12)
        {
          int64_t v2 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_21;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v2);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 < v8)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v2 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_25;
        }
        if (v2 >= v8) {
          goto LABEL_21;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v2);
        ++v13;
        if (v12) {
          goto LABEL_18;
        }
      }
    }
    int64_t v2 = v13;
    goto LABEL_18;
  }
LABEL_21:

  swift_release();
}

uint64_t sub_1C68BDD88(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v4 = *(v3 - 1);
      uint64_t v5 = *v3;
      swift_bridgeObjectRetain();
      sub_1C67FB8C8((uint64_t)&v14, v4, v5, v6, v7, v8, v9, v10, v13, v14);
      swift_bridgeObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    return v15;
  }
  else
  {
    uint64_t v11 = a2;
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t sub_1C68BDE24(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v5 = result + 56;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v17 = a2;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v4;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  if ((v7 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v3 << 6))
  {
    sub_1C67A4394(*(void *)(v2 + 48) + 48 * i, (uint64_t)v18);
    sub_1C68D8450((uint64_t)v18);
    sub_1C67FDCCC((uint64_t)v15, (uint64_t)v18);
    uint64_t result = sub_1C680B2EC(v15[0], v15[1], v15[2], v15[3], v15[4], v16);
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v9) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v3;
    if (!v13)
    {
      int64_t v3 = v12 + 1;
      if (v12 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v3);
      if (!v13)
      {
        int64_t v3 = v12 + 2;
        if (v12 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v3);
        if (!v13)
        {
          int64_t v3 = v12 + 3;
          if (v12 + 3 >= v9) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v3);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9)
  {
LABEL_23:
    swift_release();
    return v17;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v3 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v3 >= v9) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v3);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C68BDFD0(uint64_t a1)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_39_7();
  __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
  uint64_t v7 = (void *)(v1 + *(void *)(*(void *)v1 + 104));
  *uint64_t v7 = 0;
  swift_beginAccess();
  *uint64_t v7 = a1;
  swift_release();
  return v1;
}

void sub_1C68BE064()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6308);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68FB070;
  *(void *)(inited + 32) = sub_1C68EC898();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = sub_1C68EC898();
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = sub_1C68EC898();
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 80) = sub_1C68EC898();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 96) = sub_1C68EC898();
  *(void *)(inited + 104) = v5;
  *(void *)(inited + 112) = sub_1C68EC898();
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 128) = sub_1C68EC898();
  *(void *)(inited + 136) = v7;
  sub_1C67FA15C();
  qword_1EA4428E8 = v8;
}

uint64_t sub_1C68BE148()
{
  type metadata accessor for StringTokenizer();
  sub_1C68E9C68();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_2_22();

  return v1(v0);
}

void sub_1C68BE1B4()
{
  OUTLINED_FUNCTION_15_0();
  char v2 = v1;
  char v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v62 = sub_1C68E92E8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v61 = v12;
  uint64_t v13 = OUTLINED_FUNCTION_6();
  uint64_t v14 = type metadata accessor for UCGStringTokenizer(v13);
  uint64_t v15 = OUTLINED_FUNCTION_3(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_11();
  uint64_t v16 = StringTokenizer.tokenize(_:useMorphun:removeEmojis:)(v8, v6, v4, v2);
  type metadata accessor for StringTokenizer();
  char v17 = sub_1C65C501C();
  uint64_t v18 = OUTLINED_FUNCTION_65_5();
  sub_1C65DCFC4(v18, v19);
  if (v17)
  {
    sub_1C68D8374(v0, (void (*)(void))type metadata accessor for UCGStringTokenizer);
  }
  else
  {
    uint64_t v64 = sub_1C68E9C18();
    uint64_t v65 = v20;
    v63[0] = 28523;
    v63[1] = 0xE200000000000000;
    sub_1C65C7508();
    sub_1C65C7554();
    char v21 = sub_1C68EC808();
    swift_bridgeObjectRelease();
    sub_1C68D8374(v0, (void (*)(void))type metadata accessor for UCGStringTokenizer);
    if ((v21 & 1) == 0) {
      goto LABEL_45;
    }
  }
  uint64_t v64 = MEMORY[0x1E4FBC860];
  uint64_t v22 = *(void *)(v16 + 16);
  if (v22)
  {
    swift_bridgeObjectRetain();
    int64_t v23 = (unint64_t *)(v16 + 40);
    do
    {
      unint64_t v24 = *(v23 - 1);
      unint64_t v25 = *v23;
      swift_bridgeObjectRetain();
      sub_1C68BC9E8(v24, v25);
      v23 += 2;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease_n();
    uint64_t v26 = v64;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = MEMORY[0x1E4FBC860];
  }
  uint64_t v27 = *(void *)(v26 + 16);
  if (v27)
  {
    uint64_t v64 = MEMORY[0x1E4FBC860];
    sub_1C669F7F0();
    uint64_t v28 = 0;
    do
    {
      unsigned int v29 = *(_DWORD *)(v26 + 4 * v28 + 32);
      if (v29 > 0x7F)
      {
        int v37 = (*(_DWORD *)(v26 + 4 * v28 + 32) & 0x3F) << 8;
        if (v29 >= 0x800)
        {
          unsigned int v38 = v29 >> 12;
          int v39 = (v37 | (v29 >> 6) & 0x3F) << 8;
          unsigned int v40 = HIWORD(v29);
          unsigned int v30 = (((v39 | (v29 >> 12) & 0x3F) << 8) | (v29 >> 18)) - 2122219023;
          int v41 = (v39 | v38) + 8487393;
          if (!v40) {
            unsigned int v30 = v41;
          }
        }
        else
        {
          unsigned int v30 = (v37 | (v29 >> 6)) + 33217;
        }
      }
      else
      {
        unsigned int v30 = v29 + 1;
      }
      v63[0] = (v30 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v30) >> 3))));
      uint64_t v31 = MEMORY[0x1C87A38D0](v63);
      uint64_t v33 = v32;
      uint64_t v34 = (void *)v64;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_67_6();
        uint64_t v34 = (void *)v64;
      }
      unint64_t v35 = v34[2];
      if (v35 >= v34[3] >> 1)
      {
        sub_1C669F7F0();
        uint64_t v34 = (void *)v64;
      }
      ++v28;
      v34[2] = v35 + 1;
      uint64_t v36 = &v34[2 * v35];
      v36[4] = v31;
      v36[5] = v33;
    }
    while (v27 != v28);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v42 = v34[2];
  if (v42)
  {
    v63[0] = MEMORY[0x1E4FBC860];
    sub_1C669F7F0();
    uint64_t v43 = (void (**)(uint64_t, uint64_t))(v10 + 8);
    uint64_t v44 = v34 + 5;
    do
    {
      uint64_t v45 = *v44;
      uint64_t v64 = *(v44 - 1);
      uint64_t v65 = v45;
      swift_bridgeObjectRetain();
      sub_1C68E92C8();
      sub_1C65C74BC();
      uint64_t v46 = sub_1C68ED128();
      uint64_t v48 = v47;
      (*v43)(v61, v62);
      swift_bridgeObjectRelease();
      uint64_t v49 = (void *)v63[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C669F7F0();
        uint64_t v49 = (void *)v63[0];
      }
      unint64_t v50 = v49[2];
      if (v50 >= v49[3] >> 1)
      {
        sub_1C669F7F0();
        uint64_t v49 = (void *)v63[0];
      }
      v44 += 2;
      v49[2] = v50 + 1;
      long long v51 = &v49[2 * v50];
      v51[4] = v46;
      v51[5] = v48;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v49 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v52 = v49[2];
  if (v52)
  {
    uint64_t v53 = v49 + 5;
    uint64_t v54 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v56 = *(v53 - 1);
      uint64_t v55 = *v53;
      uint64_t v57 = HIBYTE(*v53) & 0xF;
      if ((*v53 & 0x2000000000000000) == 0) {
        uint64_t v57 = v56 & 0xFFFFFFFFFFFFLL;
      }
      if (v57)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v64 = v54;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_67_6();
          uint64_t v54 = v64;
        }
        unint64_t v59 = *(void *)(v54 + 16);
        if (v59 >= *(void *)(v54 + 24) >> 1)
        {
          sub_1C669F7F0();
          uint64_t v54 = v64;
        }
        *(void *)(v54 + 16) = v59 + 1;
        uint64_t v60 = v54 + 16 * v59;
        *(void *)(v60 + 32) = v56;
        *(void *)(v60 + 40) = v55;
      }
      v53 += 2;
      --v52;
    }
    while (v52);
  }
  swift_bridgeObjectRelease();
LABEL_45:
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C68BE718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t v72 = a3;
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C68EC478();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)&unk_1EBBF7A68);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1C68EC458();
  os_log_type_t v16 = sub_1C68ECE48();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = OUTLINED_FUNCTION_39();
    uint64_t v80 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315650;
    swift_bridgeObjectRetain();
    sub_1C65B4078(a5, a6, (uint64_t)&v80, v18, v19, v20, v21, v22, v57, v7, v14, v69, v72, v76, v80, v81, v82, v83, v84,
      v85);
    uint64_t v77 = v23;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1C65B4078(v73, a4, (uint64_t)&v80, v24, v25, v26, v27, v28, v58, v62, v66, a5, v73, v77, v80, v81, v82, v83, v84,
      v85);
    uint64_t v78 = v29;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_1C65B4078(a1, a2, (uint64_t)&v80, v30, v31, v32, v33, v34, v59, v63, v67, v70, v74, v78, v80, v81, v82, v83, v84,
      v85);
    uint64_t v76 = v35;
    a5 = v69;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C65AE000, v15, v16, "[UCG] Relationship alias lookup: locale='%s' normalizedLabel='%s' label='%s'", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_27_9();
  }
  uint64_t v36 = sub_1C68BEBA4(a1, a2, a5, a6);
  if ((v37 & 1) == 0) {
    return v36;
  }
  uint64_t v36 = sub_1C68BEBA4(v72, a4, a5, a6);
  if ((v38 & 1) == 0) {
    return v36;
  }
  uint64_t v39 = sub_1C65CF6FC(a1, a2);
  if (v40)
  {
    uint64_t v41 = a1;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_1C68EC458();
    os_log_type_t v43 = sub_1C68ECE48();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = OUTLINED_FUNCTION_49();
      uint64_t v80 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315394;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v41, a2, (uint64_t)&v80, v45, v46, v47, v48, v49, v57, v61, v65, v69, v72, v76, v80, v81, v82, v83, v84,
        v85);
      uint64_t v79 = v50;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v44 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C65B4078(a5, a6, (uint64_t)&v80, v51, v52, v53, v54, v55, v60, v64, v68, v71, v75, v79, v80, v81, v82, v83, v84,
        v85);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v42, v43, "[UCG] Label '%s' does not map to a valid relationship in locale '%s'", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_27_9();
      swift_bridgeObjectRelease_n();
    }
  }
  return v39;
}

uint64_t sub_1C68BEBA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!sub_1C65CD0E8()) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0710;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 64) = &off_1F2186408;
  *(void *)(inited + 32) = a3;
  *(void *)(inited + 40) = a4;
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = &off_1F2186408;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = OUTLINED_FUNCTION_47_12();
  uint64_t v14 = sub_1C65CD3F0(v11, v12, v13);
  if (!v4) {
    a2 = v14;
  }
  swift_setDeallocating();
  sub_1C65C7004();
  swift_release();
  return a2;
}

uint64_t sub_1C68BECC0(uint64_t a1)
{
  if (!sub_1C65CD0E8()) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A68);
  uint64_t inited = swift_initStackObject();
  uint64_t v4 = MEMORY[0x1E4FBC1C8];
  *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
  *(void *)(inited + 56) = v4;
  *(void *)(inited + 64) = &off_1F2186400;
  *(void *)(inited + 32) = a1;
  unint64_t v5 = OUTLINED_FUNCTION_127_1();
  uint64_t v7 = sub_1C65CD4E4(v5, v6, inited);
  if (!v1) {
    a1 = v7;
  }
  swift_setDeallocating();
  sub_1C65C7004();
  swift_release();
  return a1;
}

uint64_t sub_1C68BEDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!sub_1C65CD0E8()) {
    return MEMORY[0x1E4FBC870];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A68);
  uint64_t inited = swift_initStackObject();
  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  *(_OWORD *)(inited + 16) = xmmword_1C68F0710;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 64) = &off_1F2186408;
  uint64_t v9 = MEMORY[0x1E4FBC1C8];
  *(void *)(inited + 32) = a2;
  *(void *)(inited + 40) = a3;
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = &off_1F2186400;
  *(void *)(inited + 72) = a1;
  swift_bridgeObjectRetain();
  unint64_t v10 = OUTLINED_FUNCTION_47_12();
  sub_1C65E2E30(v10, v11, v12);
  swift_setDeallocating();
  if (v3)
  {
    uint64_t v13 = inited;
    sub_1C65C7004();
  }
  else
  {
    sub_1C65C7004();
    uint64_t v14 = sub_1C68BAA30();
    uint64_t v13 = sub_1C6688970(v14);
    swift_release();
  }
  swift_release();
  return v13;
}

uint64_t sub_1C68BEEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a3 & ~a4) == 0)
  {
    OUTLINED_FUNCTION_123_1();
    swift_bridgeObjectRetain();
  }
  return OUTLINED_FUNCTION_66();
}

uint64_t sub_1C68BEF3C(uint64_t a1)
{
  if (qword_1EA405860 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = qword_1EA4428F0;
  MEMORY[0x1F4188790](a1);
  OUTLINED_FUNCTION_59_8();
  sub_1C689A694((void (*)(uint64_t *__return_ptr, void *))sub_1C68D8E3C, v1, v2);
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = MEMORY[0x1C87A3B40](v1, MEMORY[0x1E4FBB1A0]);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1C68BF014()
{
  qword_1EA4428F0 = (uint64_t)&unk_1F216CAA0;
}

void sub_1C68BF028(void *a1@<X8>)
{
}

uint64_t sub_1C68BF030()
{
  return sub_1C68BEF3C(*v0);
}

uint64_t sub_1C68BF038(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_73_6(a1);
  uint64_t result = j__OUTLINED_FUNCTION_64_7(v2, v3);
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_1C68BF060(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_73_6(a1);
  uint64_t result = j__OUTLINED_FUNCTION_58_4(v2, v3);
  *uint64_t v1 = result;
  return result;
}

BOOL sub_1C68BF088(void *a1, uint64_t *a2)
{
  return sub_1C68BDBE0(a1, *a2);
}

uint64_t sub_1C68BF090@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1C66C0750(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1C68BF0C4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1C66C0790(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1C68BF0F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C66C07C4(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1C68BF128(uint64_t *a1)
{
  return sub_1C68BDC24(*a1, *v1);
}

BOOL sub_1C68BF134(uint64_t *a1)
{
  return sub_1C68BDC30(*a1, *v1);
}

void sub_1C68BF140(void *a1@<X8>)
{
}

uint64_t sub_1C68BF148()
{
  swift_bridgeObjectRetain();
  sub_1C68EC7D8();
  swift_bridgeObjectRelease();
  sub_1C68ED948();
  if (!*(void *)(v0 + 32)) {
    return sub_1C68ED958();
  }
  sub_1C68ED958();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_66();
  sub_1C68EC7D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68BF1F4()
{
  OUTLINED_FUNCTION_123_1();
  BOOL v3 = *v2 == *v0 && v1[1] == v0[1];
  if (v3 || (sub_1C68ED7E8(), uint64_t result = OUTLINED_FUNCTION_8_7(), (v5 & 1) != 0))
  {
    if (v1[2] == v0[2])
    {
      uint64_t v6 = v1[4];
      uint64_t v7 = v0[4];
      if (v6)
      {
        if (v7)
        {
          BOOL v8 = v1[3] == v0[3] && v6 == v7;
          if (v8 || (sub_1C68ED7E8() & 1) != 0) {
            return 1;
          }
        }
      }
      else if (!v7)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1C68BF28C()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF2CC()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF30C(uint64_t a1)
{
  if (qword_1EA405868 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = qword_1EA4428F8;
  MEMORY[0x1F4188790](a1);
  OUTLINED_FUNCTION_59_8();
  sub_1C689A694((void (*)(uint64_t *__return_ptr, void *))sub_1C68D9084, v1, v2);
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = MEMORY[0x1C87A3B40](v1, MEMORY[0x1E4FBB1A0]);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1C68BF3E4()
{
  qword_1EA4428F8 = (uint64_t)&unk_1F216CBB0;
}

uint64_t sub_1C68BF3F8()
{
  return sub_1C68ED948();
}

uint64_t sub_1C68BF44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 == a4 && a2 == a5) {
    return a3 == a6;
  }
  sub_1C68ED7E8();
  uint64_t result = OUTLINED_FUNCTION_8_7();
  if (v10) {
    return a3 == a6;
  }
  return result;
}

uint64_t sub_1C68BF49C()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF50C()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_151();
  sub_1C68EC7D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_93_2();
  sub_1C68EC7D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68BF590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v12 = a1 == a5 && a2 == a6;
  if (v12 || (sub_1C68ED7E8(), uint64_t result = OUTLINED_FUNCTION_8_7(), (v14 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_1C68ED7E8();
    }
  }
  return result;
}

uint64_t sub_1C68BF62C()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF6A8()
{
  return sub_1C68BF30C(*v0);
}

uint64_t sub_1C68BF6B0()
{
  return sub_1C68BF49C();
}

uint64_t sub_1C68BF6BC()
{
  return sub_1C68BF3F8();
}

uint64_t sub_1C68BF6C8()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF738(uint64_t *a1, uint64_t *a2)
{
  return sub_1C68BF44C(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_1C68BF754()
{
  return sub_1C68BF62C();
}

uint64_t sub_1C68BF760()
{
  return sub_1C68BF50C();
}

uint64_t sub_1C68BF76C()
{
  return sub_1C68ED988();
}

uint64_t sub_1C68BF7F0(uint64_t *a1, uint64_t *a2)
{
  return sub_1C68BF590(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_1C68BF80C()
{
  sub_1C67A4394(v0, (uint64_t)&v2);
  if (v5)
  {
    long long v6 = v2;
    if (v5 == 1)
    {
      *(void *)&long long v7 = v3;
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v7 = v3;
      long long v9 = v3;
      long long v10 = v2;
      sub_1C663E728((uint64_t)&v10);
      sub_1C663E728((uint64_t)&v9);
    }
  }
  else
  {
    long long v6 = v2;
    long long v7 = v3;
    uint64_t v8 = v4;
    long long v10 = v2;
    sub_1C6626FE4((uint64_t)&v7 + 8, (uint64_t)&v9, qword_1EBBF6270);
    sub_1C663E728((uint64_t)&v10);
    sub_1C663E728((uint64_t)&v9);
  }
  return sub_1C68EC8F8();
}

uint64_t sub_1C68BF8F0()
{
  sub_1C67A4394(v0, (uint64_t)v2);
  if (v4)
  {
    if (v4 == 1)
    {
      sub_1C68ED948();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      sub_1C68D8450(v0);
      return sub_1C68ED948();
    }
    else
    {
      sub_1C68ED948();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    long long v5 = v2[0];
    long long v6 = v2[1];
    uint64_t v7 = v3;
    sub_1C68ED948();
    return sub_1C68BF148();
  }
}

uint64_t sub_1C68BFA1C(uint64_t a1, uint64_t a2)
{
  sub_1C67A4394(a1, (uint64_t)&v33);
  if (v38)
  {
    if (v38 == 1)
    {
      uint64_t v3 = v33;
      uint64_t v4 = v34;
      uint64_t v5 = v35;
      sub_1C67A4394(a2, (uint64_t)&v27);
      if (v32 != 1) {
        return 0;
      }
      uint64_t v6 = v29;
      if (v3 != v27 || v4 != v28)
      {
        OUTLINED_FUNCTION_2_22();
        if ((sub_1C68ED7E8() & 1) == 0) {
          return 0;
        }
      }
      return v5 == v6;
    }
    uint64_t v18 = v33;
    uint64_t v19 = v34;
    uint64_t v20 = v35;
    uint64_t v21 = v36;
    sub_1C67A4394(a2, (uint64_t)&v27);
    if (v32 != 2) {
      return 0;
    }
    uint64_t v22 = v29;
    uint64_t v23 = v30;
    BOOL v24 = v18 == v27 && v19 == v28;
    if (!v24 && (sub_1C68ED7E8() & 1) == 0) {
      return 0;
    }
    if (v20 == v22 && v21 == v23) {
      return 1;
    }
    OUTLINED_FUNCTION_2_22();
  }
  else
  {
    uint64_t v8 = v33;
    uint64_t v9 = v34;
    uint64_t v11 = v35;
    uint64_t v10 = v36;
    uint64_t v12 = v37;
    sub_1C67A4394(a2, (uint64_t)&v27);
    if (v32) {
      return 0;
    }
    uint64_t v14 = v29;
    uint64_t v13 = v30;
    uint64_t v15 = v31;
    BOOL v16 = v8 == v27 && v9 == v28;
    if (!v16 && (sub_1C68ED7E8() & 1) == 0 || v11 != v14) {
      return 0;
    }
    if (!v12) {
      return !v15;
    }
    if (!v15) {
      return 0;
    }
    if (v10 == v13 && v12 == v15) {
      return 1;
    }
    OUTLINED_FUNCTION_76_2();
  }
  return (sub_1C68ED7E8() & 1) != 0;
}

uint64_t sub_1C68BFBB4()
{
  OUTLINED_FUNCTION_53();
  sub_1C67A4394(v0, (uint64_t)v2);
  if (v4)
  {
    if (v4 == 1)
    {
      sub_1C68ED948();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      sub_1C68D8450(v0);
      sub_1C68ED948();
    }
    else
    {
      sub_1C68ED948();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_81_1();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    long long v5 = v2[0];
    long long v6 = v2[1];
    uint64_t v7 = v3;
    sub_1C68ED948();
    sub_1C68BF148();
  }
  return sub_1C68ED988();
}

uint64_t sub_1C68BFCE0()
{
  sub_1C67A4394(v0, (uint64_t)&v2);
  return sub_1C68BFBB4();
}

uint64_t sub_1C68BFD18()
{
  sub_1C67A4394(v0, (uint64_t)&v2);
  return sub_1C68BF8F0();
}

uint64_t sub_1C68BFD58()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  sub_1C68ED938();
  if (v4)
  {
    sub_1C68ED948();
    swift_bridgeObjectRetain();
    sub_1C68EC7D8();
    if (v4 == 1)
    {
      uint64_t v5 = OUTLINED_FUNCTION_151();
      sub_1C680B2EC(v5, v6, v1, v2, v3, 1);
      sub_1C68ED948();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1C68ED948();
    sub_1C68BF148();
  }
  return sub_1C68ED988();
}

uint64_t sub_1C68BFE78()
{
  sub_1C67A4394(v0, (uint64_t)&v2);
  return sub_1C68BF80C();
}

uint64_t sub_1C68BFEB0(uint64_t a1, uint64_t a2)
{
  sub_1C67A4394(a1, (uint64_t)v4);
  sub_1C67A4394(a2, (uint64_t)v5);
  return sub_1C68BFA1C((uint64_t)v4, (uint64_t)v5) & 1;
}

uint64_t sub_1C68BFEFC()
{
  uint64_t v1 = *v0;
  if (v0[3])
  {
    uint64_t v3 = *v0;
    swift_bridgeObjectRetain();
    sub_1C68ECA18();
    sub_1C68ECA18();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

uint64_t sub_1C68BFF84()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_1C68EC7D8();
  swift_bridgeObjectRelease();
  if (!v1) {
    return sub_1C68ED948();
  }
  sub_1C68ED948();
  swift_bridgeObjectRetain();
  sub_1C68EC7D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68C0038(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (sub_1C68ED7E8(), uint64_t result = OUTLINED_FUNCTION_8_7(), (v8 & 1) != 0))
  {
    if (v3)
    {
      if (v4)
      {
        if (v2 == v5 && v3 == v4) {
          return 1;
        }
        OUTLINED_FUNCTION_66();
        if (sub_1C68ED7E8()) {
          return 1;
        }
      }
    }
    else if (!v4)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1C68C00E0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_53();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_81_1();
  swift_bridgeObjectRelease();
  sub_1C68ED948();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1C68EC7D8();
    swift_bridgeObjectRelease();
  }
  return sub_1C68ED988();
}

uint64_t sub_1C68C0180()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_1C68ED938();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_81_1();
  swift_bridgeObjectRelease();
  sub_1C68ED948();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1C68EC7D8();
    swift_bridgeObjectRelease();
  }
  return sub_1C68ED988();
}

uint64_t sub_1C68C0224()
{
  sub_1C668DA34();
  *(void *)(v0 + 16) = sub_1C68EC748();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B408);
  *(void *)(v0 + 24) = sub_1C68EC748();
  return v0;
}

uint64_t sub_1C68C029C(uint64_t *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v2 = a1[4];
  uint64_t v79 = v2 + 56;
  uint64_t v4 = a1[1];
  uint64_t v77 = *a1;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  uint64_t v59 = (void *)(v1 + 24);
  int64_t v80 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v66 = &v99;
  uint64_t v68 = a1[2];
  unint64_t v64 = (char *)&v96 + 8;
  swift_bridgeObjectRetain();
  unint64_t v61 = 0;
  int64_t v8 = 0;
  *(void *)&long long v9 = 136315394;
  long long v72 = v9;
  uint64_t v70 = MEMORY[0x1E4FBC840] + 8;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v8 << 6);
LABEL_20:
    sub_1C67A4394(*(void *)(v2 + 48) + 48 * v11, (uint64_t)v88);
    sub_1C68D8450((uint64_t)v88);
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C68EC478();
    __swift_project_value_buffer(v15, (uint64_t)&unk_1EBBF7A68);
    sub_1C68D8450((uint64_t)v88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C68D8450((uint64_t)v88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    BOOL v16 = sub_1C68EC458();
    os_log_type_t v17 = sub_1C68ECE48();
    if (os_log_type_enabled(v16, v17))
    {
      int64_t v81 = v8;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v83[0] = v19;
      *(_DWORD *)uint64_t v18 = v72;
      if (v3)
      {
        *(void *)&long long v84 = v77;
        *((void *)&v84 + 1) = v4;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C68ECA18();
        sub_1C68ECA18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v26 = *((void *)&v84 + 1);
        uint64_t v25 = v84;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = v77;
        uint64_t v26 = v4;
      }
      sub_1C65B4078(v25, v26, (uint64_t)v83, v20, v21, v22, v23, v24, v55, v57, (uint64_t)v59, (uint64_t)v61, (uint64_t)v64, (uint64_t)v66, v68, v70, v72, *((uint64_t *)&v72 + 1), v75,
        v77);
      *(void *)(v18 + 4) = v27;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      sub_1C67A4394((uint64_t)v88, (uint64_t)&v91);
      if (v94)
      {
        if (v94 == 1)
        {
          long long v84 = v91;
          *(void *)&long long v85 = v92;
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v98 = v91;
          long long v99 = v92;
          long long v28 = *v67;
          long long v100 = v91;
          long long v101 = v28;
          long long v84 = v91;
          long long v85 = v92;
          sub_1C663E728((uint64_t)&v100);
          sub_1C663E728((uint64_t)&v101);
        }
      }
      else
      {
        long long v95 = v91;
        long long v96 = v92;
        uint64_t v97 = v93;
        long long v102 = v91;
        sub_1C6626FE4(v65, (uint64_t)v103, qword_1EBBF6270);
        long long v84 = v95;
        long long v85 = v96;
        uint64_t v86 = v97;
        sub_1C663E728((uint64_t)&v102);
        sub_1C663E728((uint64_t)v103);
      }
      uint64_t v29 = sub_1C68EC8F8();
      sub_1C65B4078(v29, v30, (uint64_t)v83, v31, v32, v33, v34, v35, v56, v58, v60, v62, v65, (uint64_t)v67, v69, v71, v73, v74, v76,
        v78);
      *(void *)(v18 + 14) = v36;
      swift_bridgeObjectRelease();
      sub_1C68D8450((uint64_t)v88);
      sub_1C68D8450((uint64_t)v88);
      _os_log_impl(&dword_1C65AE000, v16, v17, "[UCG] Adding new match type for candidate[%s]: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v19, -1, -1);
      MEMORY[0x1C87A54F0](v18, -1, -1);

      int64_t v8 = v81;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      sub_1C68D8450((uint64_t)v88);
      sub_1C68D8450((uint64_t)v88);
    }
    sub_1C67A4394((uint64_t)v88, (uint64_t)v89);
    if (v90 == 2)
    {
      sub_1C68D8450((uint64_t)v88);
    }
    else
    {
      int64_t v82 = v8;
      uint64_t v37 = v89[1];
      uint64_t v38 = v89[0];
      swift_bridgeObjectRetain();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_1C65B2CA8((uint64_t)v61);
      swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v84 = *v59;
      uint64_t v39 = v84;
      *uint64_t v59 = 0x8000000000000000;
      uint64_t v63 = v37;
      unint64_t v40 = sub_1C68506A0(v38, v37);
      if (__OFADD__(*(void *)(v39 + 16), (v41 & 1) == 0)) {
        goto LABEL_49;
      }
      unint64_t v42 = v40;
      char v43 = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B3B0);
      char v44 = sub_1C68ED4D8();
      uint64_t v45 = v84;
      if (v44)
      {
        unint64_t v46 = sub_1C68506A0(v38, v63);
        if ((v43 & 1) != (v47 & 1)) {
          goto LABEL_51;
        }
        unint64_t v42 = v46;
      }
      *uint64_t v59 = v45;
      swift_bridgeObjectRelease();
      uint64_t v48 = (void *)*v59;
      if ((v43 & 1) == 0)
      {
        v48[(v42 >> 6) + 8] |= 1 << v42;
        uint64_t v49 = (uint64_t *)(v48[6] + 16 * v42);
        *uint64_t v49 = v38;
        v49[1] = v63;
        *(void *)(v48[7] + 8 * v42) = MEMORY[0x1E4FBC870];
        uint64_t v50 = v48[2];
        uint64_t v51 = v50 + 1;
        BOOL v52 = __OFADD__(v50, 1);
        swift_bridgeObjectRetain();
        if (v52) {
          goto LABEL_50;
        }
        v48[2] = v51;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_1C67FDCCC((uint64_t)&v84, (uint64_t)v88);
      swift_endAccess();
      swift_bridgeObjectRelease_n();
      sub_1C680B2EC(v84, *((uint64_t *)&v84 + 1), v85, *((uint64_t *)&v85 + 1), v86, v87);
      unint64_t v61 = sub_1C68C0AB4;
      int64_t v8 = v82;
    }
  }
  int64_t v12 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v12 >= v80) {
    goto LABEL_46;
  }
  unint64_t v13 = *(void *)(v79 + 8 * v12);
  ++v8;
  if (v13) {
    goto LABEL_19;
  }
  int64_t v8 = v12 + 1;
  if (v12 + 1 >= v80) {
    goto LABEL_46;
  }
  unint64_t v13 = *(void *)(v79 + 8 * v8);
  if (v13) {
    goto LABEL_19;
  }
  int64_t v8 = v12 + 2;
  if (v12 + 2 >= v80) {
    goto LABEL_46;
  }
  unint64_t v13 = *(void *)(v79 + 8 * v8);
  if (v13)
  {
LABEL_19:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
    goto LABEL_20;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v80)
  {
LABEL_46:
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B3B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
    *(void *)(inited + 32) = v77;
    *(void *)(inited + 40) = v4;
    *(void *)(inited + 48) = v68;
    *(void *)(inited + 56) = v3;
    *(void *)(inited + 64) = v77;
    *(void *)(inited + 72) = v4;
    *(void *)(inited + 80) = v68;
    *(void *)(inited + 88) = v3;
    *(void *)(inited + 96) = v2;
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C68D67F4(inited, (uint64_t *)(v57 + 16));
    swift_endAccess();
    return sub_1C65B2CA8((uint64_t)v61);
  }
  unint64_t v13 = *(void *)(v79 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v80) {
      goto LABEL_46;
    }
    unint64_t v13 = *(void *)(v79 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_19;
    }
  }
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_1C68ED868();
  __break(1u);
  return result;
}

void sub_1C68C0AB4(void *a1@<X8>)
{
  *a1 = MEMORY[0x1E4FBC870];
}

uint64_t sub_1C68C0AC4(void *__src)
{
  memcpy(v69, __src, sizeof(v69));
  swift_beginAccess();
  uint64_t v68 = *(void *)(v1 + 16);
  uint64_t v2 = qword_1EBBF5DA0;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C68EC478();
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)&unk_1EBBF7A68);
  uint64_t v5 = sub_1C68EC458();
  os_log_type_t v6 = sub_1C68ECE48();
  unint64_t v7 = &unk_1C68F0000;
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 134217984;
    swift_beginAccess();
    v67[0] = *(void *)(v68 + 16);
    sub_1C68ED0C8();
    _os_log_impl(&dword_1C65AE000, v5, v6, "[UCG] Beginning merge and filter stage for %ld match records...", v8, 0xCu);
    MEMORY[0x1C87A54F0](v8, -1, -1);
  }

  memcpy(v67, v69, 0x108uLL);
  if (((sub_1C65C1034() & 1) != 0
     || ((v69[20] & 0x2000000000000000) != 0 ? (uint64_t v9 = HIBYTE(v69[20]) & 0xFLL) : (uint64_t v9 = v69[19] & 0xFFFFFFFFFFFFLL), v9))
    && (sub_1C6626FE4((uint64_t)&v69[21], (uint64_t)v70, &qword_1EA40B3A8),
        sub_1C6626FE4((uint64_t)v70, (uint64_t)v72, &qword_1EA40B3A8),
        v74)
    && ((v74 & 0x2000000000000000) != 0 ? (uint64_t v10 = HIBYTE(v74) & 0xF) : (uint64_t v10 = v73 & 0xFFFFFFFFFFFFLL), v10))
  {
    swift_beginAccess();
    uint64_t v11 = v68;
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    uint64_t v14 = sub_1C68D3294(v12);
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v14 + 16);
    if (v15)
    {
      uint64_t v56 = 0;
      uint64_t v16 = *(void *)(v11 + 16);
      os_log_type_t v17 = sub_1C68EC458();
      os_log_type_t v18 = sub_1C68ECE48();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = v16 - v15;
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134217984;
        v67[0] = v19;
        sub_1C68ED0C8();
        _os_log_impl(&dword_1C65AE000, v17, v18, "[UCG] We have at least one candidate that was specified with a name AND relationship. Discarding %ld other candidates", v20, 0xCu);
        MEMORY[0x1C87A54F0](v20, -1, -1);
      }

      uint64_t v68 = v14;
      swift_bridgeObjectRelease();
      uint64_t v13 = v56;
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  memcpy(v67, v69, 0x108uLL);
  if ((sub_1C65C1034() & 1) != 0
    || ((v69[20] & 0x2000000000000000) != 0 ? (uint64_t v21 = HIBYTE(v69[20]) & 0xFLL) : (uint64_t v21 = v69[19] & 0xFFFFFFFFFFFFLL),
        v21
     || (sub_1C6626FE4((uint64_t)&v69[21], (uint64_t)v71, &qword_1EA40B3A8),
         sub_1C6626FE4((uint64_t)v71, (uint64_t)v67, &qword_1EA40B3A8),
         v67[2])
     && ((v67[2] & 0x2000000000000000) != 0 ? (uint64_t v53 = HIBYTE(v67[2]) & 0xFLL) : (uint64_t v53 = v67[1] & 0xFFFFFFFFFFFFLL), v53)))
  {
    swift_beginAccess();
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_1C68BABEC(v22);
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_1C6688970(v24);
    uint64_t v26 = swift_bridgeObjectRetain();
    sub_1C68BAE14(v26);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_1C668948C(v28);
    if (*(void *)(v25 + 16))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v30 = sub_1C68EC458();
      os_log_type_t v31 = sub_1C68ECE48();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v56 = v13;
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        v66[0] = v33;
        uint64_t v55 = v4;
        *(_DWORD *)uint64_t v32 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_1C68ECD68();
        uint64_t v36 = v35;
        swift_bridgeObjectRelease();
        sub_1C65B4078(v34, v36, (uint64_t)v66, v37, v38, v39, v40, v41, v54[4], (unint64_t)(v32 + 4), v55, v56, v57, v58, v59, v60, v61, v62, v63,
          v64);
        uint64_t v65 = v42;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C65AE000, v30, v31, "[UCG] We have MeCard relationship matches, will filter out partial name matches: %s", v32, 0xCu);
        swift_arrayDestroy();
        uint64_t v43 = v33;
        unint64_t v7 = (void *)&unk_1C68F0000;
        MEMORY[0x1C87A54F0](v43, -1, -1);
        MEMORY[0x1C87A54F0](v32, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_beginAccess();
      uint64_t v44 = v68;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1C68BBBA8(MEMORY[0x1E4FBC868], v44, v25, v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v68 = v45;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v46 = sub_1C68EC458();
  os_log_type_t v47 = sub_1C68ECE48();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = v7[320];
    swift_beginAccess();
    uint64_t v65 = *(void *)(v68 + 16);
    sub_1C68ED0C8();
    _os_log_impl(&dword_1C65AE000, v46, v47, "[UCG] Consolidating %ld filtered match records into candidates...", v48, 0xCu);
    MEMORY[0x1C87A54F0](v48, -1, -1);
  }

  uint64_t v49 = swift_beginAccess();
  MEMORY[0x1F4188790](v49);
  v54[2] = v69;
  uint64_t v50 = swift_bridgeObjectRetain();
  uint64_t v51 = sub_1C68B93F8(v50, (void (*)(void *, void *))sub_1C68D861C, (uint64_t)v54);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v51;
}

void sub_1C68C11DC(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4)
{
  long long v6 = a2[1];
  long long v30 = *a2;
  long long v31 = v6;
  uint64_t v7 = *((void *)a2 + 4);
  uint64_t v32 = v7;
  uint64_t v33 = v7;
  swift_bridgeObjectRetain();
  sub_1C68D8480((uint64_t)&v30);
  swift_bridgeObjectRetain();
  sub_1C667680C((uint64_t)&v33);
  uint64_t v8 = sub_1C68D5D44(v7, a3, (uint64_t)&v30, a4);
  if (*(void *)(v8 + 16))
  {
    long long v9 = v30;
    long long v10 = v31;
    long long v27 = v30;
    long long v28 = v31;
    uint64_t v29 = v8;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C6852130((uint64_t)&v27, v9, *((uint64_t *)&v9 + 1), v10, *((uint64_t *)&v10 + 1));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1C68EC478();
    __swift_project_value_buffer(v11, (uint64_t)&unk_1EBBF7A68);
    sub_1C68D8480((uint64_t)&v30);
    sub_1C68D8480((uint64_t)&v30);
    uint64_t v12 = sub_1C68EC458();
    os_log_type_t v13 = sub_1C68ECE48();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      long long v16 = v30;
      long long v17 = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1C68B7A04(v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1));
      sub_1C65B4078(v18, v19, (uint64_t)&v27, v20, v21, v22, v23, v24, v25, (unint64_t)(v14 + 4), v26, v15, *((uint64_t *)&v27 + 1), v28, *((uint64_t *)&v28 + 1), v29, v30, *((uint64_t *)&v30 + 1), v31,
        *((uint64_t *)&v31 + 1));
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68D84CC((uint64_t)&v30);
      sub_1C68D84CC((uint64_t)&v30);
      _os_log_impl(&dword_1C65AE000, v12, v13, "[UCG] Discarding match [%s] after relationship filtering - looks like this was a partial name match containing a relationship label", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v15, -1, -1);
      MEMORY[0x1C87A54F0](v14, -1, -1);
    }
    else
    {
      sub_1C68D84CC((uint64_t)&v30);
      sub_1C68D84CC((uint64_t)&v30);
    }
  }
}

uint64_t sub_1C68C1480@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v163 = a3;
  uint64_t v160 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6510);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  v191 = (char *)&v156 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v166 = (uint64_t)&v156 - v9;
  uint64_t v10 = sub_1C68E9BF8();
  uint64_t v190 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  v189 = (char *)&v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v186 = (char *)&v156 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v192 = (char *)&v156 - v16;
  MEMORY[0x1F4188790](v15);
  v188 = (char *)&v156 - v17;
  v185 = (int *)type metadata accessor for ContactResolver.SignalSet(0);
  MEMORY[0x1F4188790](v185);
  v187 = (char *)&v156 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = type metadata accessor for Contact();
  MEMORY[0x1F4188790](v169);
  v182 = (uint64_t *)((char *)&v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = *a1;
  uint64_t v21 = a1[1];
  uint64_t v22 = (void (**)(char *, uint64_t, uint64_t))a1[3];
  uint64_t v161 = a1[2];
  uint64_t v162 = v20;
  uint64_t v23 = *a2;
  uint64_t v24 = a2[1];
  uint64_t v25 = a2[3];
  v183 = a2[2];
  uint64_t v184 = v23;
  unint64_t v26 = a2[4];
  if (qword_1EBBF5DA0 != -1) {
LABEL_124:
  }
    swift_once();
  uint64_t v27 = sub_1C68EC478();
  uint64_t v28 = __swift_project_value_buffer(v27, (uint64_t)&unk_1EBBF7A68);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_1C68EC458();
  LODWORD(v181) = sub_1C68ECE48();
  BOOL v30 = os_log_type_enabled(v29, (os_log_type_t)v181);
  v172 = v26;
  uint64_t v170 = v10;
  unint64_t v157 = v28;
  if (v30)
  {
    os_log_t v180 = v29;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v195[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315394;
    if (v22)
    {
      v197[0] = v162;
      v197[1] = v21;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1C68ECA18();
      sub_1C68ECA18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v197[0];
      uint64_t v39 = v197[1];
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v38 = v162;
      uint64_t v39 = v21;
    }
    sub_1C65B4078(v38, v39, (uint64_t)v195, v33, v34, v35, v36, v37, v156, v157, v158, (uint64_t)v159, v160, v161, v162, (uint64_t)v163, v164, *((uint64_t *)&v164 + 1), v165,
      v166);
    v197[0] = v40;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    v197[0] = v184;
    v197[1] = v24;
    v197[2] = v183;
    v197[3] = v25;
    v197[4] = v172;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_1C68EC8F8();
    sub_1C65B4078(v41, v42, (uint64_t)v195, v43, v44, v45, v46, v47, v156, v157, v158, (uint64_t)v159, v160, v161, v162, (uint64_t)v163, v164, *((uint64_t *)&v164 + 1), v165,
      v166);
    v197[0] = v48;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v49 = v180;
    _os_log_impl(&dword_1C65AE000, v180, (os_log_type_t)v181, "[UCG] Peeking at matches for [%s]: %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v32, -1, -1);
    MEMORY[0x1C87A54F0](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v50 = swift_bridgeObjectRetain();
  int v167 = sub_1C68BDAB0(v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v171 = sub_1C68D5FE8((uint64_t)v172);
  uint64_t v177 = 0;
  uint64_t v51 = v163;
  memcpy(v197, v163, sizeof(v197));
  sub_1C65B537C(v163);
  BOOL v52 = v182;
  sub_1C65DE1E8(v197, (uint64_t)v182);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *BOOL v52 = v162;
  v52[1] = v21;
  uint64_t v158 = v21;
  uint64_t v53 = (void *)((char *)v52 + *(int *)(v169 + 88));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *uint64_t v53 = v161;
  v53[1] = v22;
  v168 = v22;
  uint64_t v10 = (uint64_t)v172;
  uint64_t v54 = v187;
  sub_1C66A2A70((uint64_t)v187);
  LOBYTE(v55) = 1;
  v54[v185[57]] = 1;
  v54 += 8;
  memcpy(v197, v54, sizeof(v197));
  v159 = v54;
  memcpy(v54, v51, 0x108uLL);
  sub_1C65B537C(v51);
  sub_1C65B6550(v197);
  uint64_t v196 = MEMORY[0x1E4FBC870];
  uint64_t v56 = *(void *)(v10 + 56);
  uint64_t v178 = v10 + 56;
  uint64_t v57 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v58 = -1;
  if (v57 < 64) {
    uint64_t v58 = ~(-1 << v57);
  }
  unint64_t v26 = v58 & v56;
  int64_t v175 = (unint64_t)(v57 + 63) >> 6;
  uint64_t v22 = (void (**)(char *, uint64_t, uint64_t))(v190 + 32);
  swift_bridgeObjectRetain();
  uint64_t v59 = 0;
  long long v164 = xmmword_1C68F0550;
  uint64_t v25 = (uint64_t)v191;
  while (v26)
  {
    unint64_t v60 = __clz(__rbit64(v26));
    v26 &= v26 - 1;
    unint64_t v61 = v60 | (v59 << 6);
LABEL_24:
    uint64_t v65 = *(void *)(v10 + 48) + 48 * v61;
    uint64_t v66 = *(void *)v65;
    uint64_t v21 = *(void *)(v65 + 8);
    uint64_t v55 = *(void *)(v65 + 16);
    uint64_t v67 = *(void *)(v65 + 24);
    uint64_t v24 = *(void *)(v65 + 32);
    int v68 = *(unsigned __int8 *)(v65 + 40);
    if (v68)
    {
      if (v68 == 1)
      {
        if (!*(void *)(v182[27] + 16))
        {
          v183 = v26;
          uint64_t v69 = v10;
          uint64_t v70 = v59;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA406318);
          uint64_t v71 = swift_allocObject();
          uint64_t v72 = v21;
          uint64_t v21 = v55;
          uint64_t v55 = v71;
          *(_OWORD *)(v71 + 16) = v164;
          *(void *)(v71 + 64) = 0;
          *(void *)(v71 + 72) = 0xE000000000000000;
          *(void *)(v71 + 32) = 0;
          *(void *)(v71 + 40) = 0xE000000000000000;
          *(void *)(v71 + 48) = v66;
          *(void *)(v71 + 56) = v72;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v59 = (uint64_t)v70;
          uint64_t v10 = v69;
          unint64_t v26 = (unint64_t)v183;
          v182[27] = v55;
          LOBYTE(v55) = v21;
        }
        uint64_t v73 = v185;
        uint64_t v74 = (uint64_t)v187;
        v187[v185[35]] = 1;
        *(unsigned char *)(v74 + v73[36]) = v55 & 1;
        *(unsigned char *)(v74 + v73[37]) = (v55 & 2) != 0;
        *(unsigned char *)(v74 + 338) = 1;
      }
      else if (v167)
      {
        uint64_t v179 = v24;
        os_log_t v180 = (os_log_t)v59;
        uint64_t v176 = v55;
        v183 = v26;
        uint64_t v76 = v185;
        uint64_t v77 = (uint64_t)v187;
        *((unsigned char *)v182 + *(int *)(v169 + 92)) = (v187[v185[53]] & 1) == 0;
        *(unsigned char *)(v77 + v76[51]) = 1;
        *(_WORD *)(v77 + 338) = 0;
        swift_bridgeObjectRetain();
        uint64_t v184 = v67;
        swift_bridgeObjectRetain();
        uint64_t v78 = v177;
        sub_1C68BB0D4(v171);
        uint64_t v80 = v79;
        uint64_t v177 = v78;
        uint64_t v81 = *(void *)(v79 + 16);
        if (v81)
        {
          uint64_t v181 = v21;
          swift_bridgeObjectRetain();
          uint64_t v174 = v80;
          uint64_t v82 = v80 + 40;
          uint64_t v55 = MEMORY[0x1E4FBC860];
          uint64_t v24 = v170;
          do
          {
            swift_bridgeObjectRetain();
            sub_1C68E9B88();
            swift_bridgeObjectRelease();
            if (__swift_getEnumTagSinglePayload(v25, 1, v24) == 1)
            {
              sub_1C65C117C(v25, &qword_1EBBF6510);
            }
            else
            {
              uint64_t v83 = *v22;
              long long v84 = v186;
              (*v22)(v186, v25, v24);
              v83(v189, (uint64_t)v84, v24);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v55 = sub_1C65C7CD4(0, *(void *)(v55 + 16) + 1, 1, v55);
              }
              unint64_t v86 = *(void *)(v55 + 16);
              unint64_t v85 = *(void *)(v55 + 24);
              if (v86 >= v85 >> 1) {
                uint64_t v55 = sub_1C65C7CD4(v85 > 1, v86 + 1, 1, v55);
              }
              *(void *)(v55 + 16) = v86 + 1;
              v83((char *)(v55+ ((*(unsigned __int8 *)(v190 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v190 + 80))+ *(void *)(v190 + 72) * v86), (uint64_t)v189, v24);
              uint64_t v25 = (uint64_t)v191;
            }
            v82 += 16;
            --v81;
          }
          while (v81);
          swift_bridgeObjectRelease();
          uint64_t v21 = v181;
        }
        else
        {
          LOBYTE(v55) = MEMORY[0x1E4FBC860];
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C68BD414();
        sub_1C680B2EC(v66, v21, v176, v184, v179, 2);
        swift_bridgeObjectRelease();
        goto LABEL_72;
      }
    }
    else
    {
      os_log_t v180 = (os_log_t)v59;
      v183 = v26;
      uint64_t v184 = v67;
      if (v168)
      {
        if (!v24)
        {
          swift_bridgeObjectRetain();
          uint64_t v176 = 0;
          goto LABEL_51;
        }
        uint64_t v75 = v182;
        sub_1C67A4428(v66, v21, v55, v67, v24, 0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v75[5] = v67;
        v75[6] = v24;
        swift_bridgeObjectRelease();
        v75[9] = 0;
        v75[10] = 0xE000000000000000;
        swift_bridgeObjectRelease();
        v75[7] = 0;
        v75[8] = 0xE000000000000000;
        swift_bridgeObjectRelease();
        v75[15] = 0;
        v75[16] = 0xE000000000000000;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t v176 = v24;
LABEL_51:
      uint64_t v87 = v66;
      BOOL v88 = (v55 & 0x20) != 0;
      uint64_t v89 = (uint64_t)v187;
      v187[333] = v88;
      uint64_t v90 = v89 + v185[33];
      *(unsigned char *)(v90 + 8) = v88;
      *(unsigned char *)(v90 + 10) = v55 & 1;
      *(unsigned char *)(v90 + 12) = (v55 & 2) != 0;
      *(unsigned char *)(v90 + 11) = (v55 & 4) != 0;
      *(unsigned char *)(v90 + 13) = (v55 & 8) != 0;
      *(unsigned char *)(v90 + 15) = (v55 & 0x10) != 0;
      swift_bridgeObjectRetain();
      uint64_t v173 = v87;
      uint64_t v181 = v21;
      sub_1C67FB8C8((uint64_t)v195, v87, v21, v91, v92, v93, v94, v95, v156, v157);
      swift_bridgeObjectRelease();
      *(void *)(v90 + 40) = v184;
      *(void *)(v90 + 48) = v24;
      uint64_t v179 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v89 + 338) = 1;
      if ((v55 & 0x40) != 0)
      {
        v187[336] = 1;
        *(unsigned char *)(v90 + 10) = 0;
      }
      uint64_t v96 = v166;
      uint64_t v24 = v170;
      if ((v55 & 0x80) != 0) {
        v187[335] = 1;
      }
      uint64_t v97 = v171;
      uint64_t v21 = v181;
      if (*(void *)(v171 + 16))
      {
        uint64_t v176 = v55;
        long long v98 = v185;
        uint64_t v99 = (uint64_t)v187;
        *((unsigned char *)v182 + *(int *)(v169 + 92)) = (v187[v185[53]] & 1) == 0;
        *(unsigned char *)(v99 + v98[51]) = 1;
        *(unsigned char *)(v99 + 339) = 0;
        uint64_t v100 = v177;
        sub_1C68BB0D4(v97);
        uint64_t v177 = v100;
        uint64_t v174 = v101;
        uint64_t v102 = *(void *)(v101 + 16);
        if (v102)
        {
          uint64_t v103 = swift_bridgeObjectRetain() + 40;
          uint64_t v55 = MEMORY[0x1E4FBC860];
          do
          {
            swift_bridgeObjectRetain();
            sub_1C68E9B88();
            swift_bridgeObjectRelease();
            if (__swift_getEnumTagSinglePayload(v96, 1, v24) == 1)
            {
              sub_1C65C117C(v96, &qword_1EBBF6510);
            }
            else
            {
              v104 = *v22;
              v105 = v188;
              (*v22)(v188, v96, v24);
              v104(v192, (uint64_t)v105, v24);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v55 = sub_1C65C7CD4(0, *(void *)(v55 + 16) + 1, 1, v55);
              }
              unint64_t v107 = *(void *)(v55 + 16);
              unint64_t v106 = *(void *)(v55 + 24);
              if (v107 >= v106 >> 1) {
                uint64_t v55 = sub_1C65C7CD4(v106 > 1, v107 + 1, 1, v55);
              }
              *(void *)(v55 + 16) = v107 + 1;
              v104((char *)(v55+ ((*(unsigned __int8 *)(v190 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v190 + 80))+ *(void *)(v190 + 72) * v107), (uint64_t)v192, v24);
              uint64_t v25 = (uint64_t)v191;
            }
            v103 += 16;
            --v102;
          }
          while (v102);
          swift_bridgeObjectRelease();
          uint64_t v21 = v181;
        }
        else
        {
          LOBYTE(v55) = MEMORY[0x1E4FBC860];
        }
        swift_bridgeObjectRelease();
        v108 = v185;
        uint64_t v109 = (uint64_t)v187;
        sub_1C68BD414();
        sub_1C680B2EC(v173, v21, v176, v184, v179, 0);
        *(unsigned char *)(v109 + v108[54]) = 1;
      }
      else
      {
        sub_1C680B2EC(v173, v181, v55, v184, v179, 0);
      }
LABEL_72:
      uint64_t v10 = (uint64_t)v172;
      uint64_t v59 = (uint64_t)v180;
      unint64_t v26 = (unint64_t)v183;
    }
  }
  BOOL v62 = __OFADD__(v59++, 1);
  if (v62)
  {
    __break(1u);
LABEL_119:
    uint64_t v142 = v158;
    swift_bridgeObjectRetain();
    uint64_t v141 = v142;
    uint64_t v140 = v162;
    goto LABEL_120;
  }
  if (v59 < v175)
  {
    unint64_t v63 = *(void *)(v178 + 8 * v59);
    if (!v63)
    {
      uint64_t v64 = v59 + 1;
      if (v59 + 1 >= v175) {
        goto LABEL_73;
      }
      unint64_t v63 = *(void *)(v178 + 8 * v64);
      if (!v63)
      {
        uint64_t v64 = v59 + 2;
        if (v59 + 2 >= v175) {
          goto LABEL_73;
        }
        unint64_t v63 = *(void *)(v178 + 8 * v64);
        if (!v63)
        {
          uint64_t v64 = v59 + 3;
          if (v59 + 3 >= v175) {
            goto LABEL_73;
          }
          unint64_t v63 = *(void *)(v178 + 8 * v64);
          if (!v63)
          {
            while (1)
            {
              uint64_t v59 = v64 + 1;
              if (__OFADD__(v64, 1)) {
                break;
              }
              if (v59 >= v175) {
                goto LABEL_73;
              }
              unint64_t v63 = *(void *)(v178 + 8 * v59);
              ++v64;
              if (v63) {
                goto LABEL_23;
              }
            }
LABEL_123:
            __break(1u);
            goto LABEL_124;
          }
        }
      }
      uint64_t v59 = v64;
    }
LABEL_23:
    unint64_t v26 = (v63 - 1) & v63;
    unint64_t v61 = __clz(__rbit64(v63)) + (v59 << 6);
    goto LABEL_24;
  }
LABEL_73:
  swift_release();
  uint64_t result = swift_release();
  uint64_t v25 = v196;
  uint64_t v22 = v168;
  v111 = v163;
  uint64_t v24 = (uint64_t)v185;
  if (*(void *)(v196 + 16))
  {
    uint64_t v112 = swift_bridgeObjectRetain();
    uint64_t v113 = v177;
    sub_1C68BB2B0(v112);
    uint64_t v115 = v114;
    uint64_t v177 = v113;
    swift_bridgeObjectRelease();
    v195[0] = v115;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
    sub_1C666EF30((unint64_t *)&qword_1EBBF6848, &qword_1EBBF6840);
    uint64_t v116 = sub_1C68EC818();
    v118 = v117;
    swift_bridgeObjectRelease();
    unint64_t v26 = (unint64_t)&v187[*(int *)(v24 + 132)];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v26 + 24) = v116;
    *(void *)(v26 + 32) = v118;
    uint64_t v10 = (uint64_t)v172;
  }
  v119 = &v187[*(int *)(v24 + 132)];
  if (v119[13] != 1 || (v119[9] & 1) != 0 || (v119[10] & 1) != 0 || (v119[11] & 1) != 0 || (v119[12] & 1) != 0) {
    char v120 = 0;
  }
  else {
    char v120 = v119[15] ^ 1;
  }
  int64_t v121 = 0;
  v119[14] = v120 & 1;
  uint64_t v122 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v123 = -1;
  if (v122 < 64) {
    uint64_t v123 = ~(-1 << v122);
  }
  unint64_t v124 = v123 & *(void *)(v10 + 56);
  int64_t v125 = (unint64_t)(v122 + 63) >> 6;
  while (1)
  {
    if (v124)
    {
      unint64_t v126 = __clz(__rbit64(v124));
      v124 &= v124 - 1;
      unint64_t v127 = v126 | (v121 << 6);
      goto LABEL_101;
    }
    BOOL v62 = __OFADD__(v121++, 1);
    if (v62)
    {
      __break(1u);
      goto LABEL_123;
    }
    if (v121 >= v125) {
      break;
    }
    unint64_t v128 = *(void *)(v178 + 8 * v121);
    if (!v128)
    {
      int64_t v129 = v121 + 1;
      if (v121 + 1 >= v125) {
        break;
      }
      unint64_t v128 = *(void *)(v178 + 8 * v129);
      if (!v128)
      {
        int64_t v129 = v121 + 2;
        if (v121 + 2 >= v125) {
          break;
        }
        unint64_t v128 = *(void *)(v178 + 8 * v129);
        if (!v128)
        {
          int64_t v129 = v121 + 3;
          if (v121 + 3 >= v125) {
            break;
          }
          unint64_t v128 = *(void *)(v178 + 8 * v129);
          if (!v128)
          {
            int64_t v129 = v121 + 4;
            if (v121 + 4 >= v125) {
              break;
            }
            unint64_t v128 = *(void *)(v178 + 8 * v129);
            if (!v128)
            {
              int64_t v129 = v121 + 5;
              if (v121 + 5 >= v125) {
                break;
              }
              unint64_t v128 = *(void *)(v178 + 8 * v129);
              if (!v128)
              {
                while (1)
                {
                  int64_t v121 = v129 + 1;
                  if (__OFADD__(v129, 1)) {
                    break;
                  }
                  if (v121 >= v125) {
                    goto LABEL_107;
                  }
                  unint64_t v128 = *(void *)(v178 + 8 * v121);
                  ++v129;
                  if (v128) {
                    goto LABEL_100;
                  }
                }
                __break(1u);
                return result;
              }
            }
          }
        }
      }
      int64_t v121 = v129;
    }
LABEL_100:
    unint64_t v130 = __clz(__rbit64(v128));
    unint64_t v124 = (v128 - 1) & v128;
    unint64_t v127 = v130 + (v121 << 6);
LABEL_101:
    if (*(unsigned char *)(*(void *)(v10 + 48) + 48 * v127 + 40) == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_121;
    }
  }
LABEL_107:
  swift_bridgeObjectRelease();
  memcpy(v195, v111, sizeof(v195));
  if (sub_1C65C1034()) {
    goto LABEL_121;
  }
  uint64_t v131 = v111[20];
  if ((v131 & 0x2000000000000000) != 0)
  {
    if ((v131 & 0xF00000000000000) != 0) {
      goto LABEL_121;
    }
  }
  else if ((v111[19] & 0xFFFFFFFFFFFFLL) != 0)
  {
    goto LABEL_121;
  }
  sub_1C6626FE4((uint64_t)(v111 + 21), (uint64_t)v199, &qword_1EA40B3A8);
  sub_1C6626FE4((uint64_t)v199, (uint64_t)v200, &qword_1EA40B3A8);
  uint64_t v132 = v202;
  if (v202)
  {
    uint64_t v133 = v201;
    memcpy(v195, v159, sizeof(v195));
    uint64_t v134 = (uint64_t)v187;
    *((void *)v187 + 1) = 0;
    *(void *)(v134 + 16) = 0xE000000000000000;
    *(unsigned char *)(v134 + 24) = 0;
    *(void *)(v134 + 48) = 0;
    *(void *)(v134 + 56) = 0xE000000000000000;
    *(void *)(v134 + 64) = 0;
    *(void *)(v134 + 72) = 0xE000000000000000;
    *(void *)(v134 + 80) = 0;
    *(void *)(v134 + 88) = 0xE000000000000000;
    *(void *)(v134 + 96) = 0;
    *(void *)(v134 + 104) = 0xE000000000000000;
    *(void *)(v134 + 112) = 0;
    *(void *)(v134 + 120) = 0xE000000000000000;
    *(void *)(v134 + 128) = 0;
    *(void *)(v134 + 136) = 0xE000000000000000;
    *(void *)(v134 + 144) = 0;
    *(void *)(v134 + 152) = 0xE000000000000000;
    *(void *)(v134 + 160) = 0;
    *(void *)(v134 + 168) = 0xE000000000000000;
    *(void *)(v134 + 176) = 0;
    *(void *)(v134 + 184) = 0;
    *(void *)(v134 + 192) = 0;
    *(void *)(v134 + 248) = MEMORY[0x1E4FBC860];
    *(unsigned char *)(v134 + 256) = 1;
    *(void *)(v134 + 264) = 0;
    swift_bridgeObjectRetain();
    sub_1C65B6550(v195);
    *(void *)(v134 + 32) = v133;
    *(void *)(v134 + 40) = v132;
    *(unsigned char *)(v134 + 336) = 0;
    sub_1C6626FE4((uint64_t)(v111 + 24), (uint64_t)v198, &qword_1EBBF48F0);
    sub_1C6626FE4((uint64_t)v198, v134 + 200, &qword_1EBBF48F0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C68D8344((uint64_t)v198);
    unint64_t v26 = sub_1C68EC458();
    LOBYTE(v55) = sub_1C68ECE48();
    if (!os_log_type_enabled((os_log_t)v26, (os_log_type_t)v55))
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      goto LABEL_121;
    }
    uint64_t v25 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v194 = v10;
    *(_DWORD *)uint64_t v25 = 136315394;
    if (!v22) {
      goto LABEL_119;
    }
    v193[0] = v162;
    v193[1] = v158;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C68ECA18();
    sub_1C68ECA18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v140 = v193[0];
    uint64_t v141 = v193[1];
LABEL_120:
    sub_1C65B4078(v140, v141, (uint64_t)&v194, v135, v136, v137, v138, v139, v156, v157, v158, (uint64_t)v159, v160, v161, v162, (uint64_t)v163, v164, *((uint64_t *)&v164 + 1), v165,
      v166);
    v193[0] = v143;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    swift_beginAccess();
    memcpy(v193, v159, sizeof(v193));
    uint64_t v144 = ContactQuery.description.getter();
    sub_1C65B4078(v144, v145, (uint64_t)&v194, v146, v147, v148, v149, v150, v156, v157, v158, (uint64_t)v159, v160, v161, v162, (uint64_t)v163, v164, *((uint64_t *)&v164 + 1), v165,
      v166);
    v193[0] = v151;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, (os_log_t)v26, (os_log_type_t)v55, "[UCG] Note: we've re-written the originalQuery of the signals for %s to be a name query instead of a relationship one: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v10, -1, -1);
    MEMORY[0x1C87A54F0](v25, -1, -1);
  }
LABEL_121:
  uint64_t v152 = (uint64_t)v182;
  uint64_t v153 = v160;
  sub_1C65DCFC4((uint64_t)v182, v160);
  uint64_t v154 = (uint64_t)v187;
  swift_beginAccess();
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  sub_1C65DCFC4(v154, v153 + *(int *)(v155 + 36));
  sub_1C68D8374(v154, (void (*)(void))type metadata accessor for ContactResolver.SignalSet);
  return sub_1C68D8374(v152, (void (*)(void))type metadata accessor for Contact);
}

uint64_t sub_1C68C298C(char a1)
{
  if (!a1) {
    return 0x737961776C61;
  }
  if (a1 == 1) {
    return 0x6E49646E61436F6ELL;
  }
  return 1701736302;
}

uint64_t sub_1C68C29E0(unsigned __int8 *a1, char *a2)
{
  return sub_1C6618A34(*a1, *a2);
}

uint64_t sub_1C68C29EC()
{
  return sub_1C6702A08();
}

uint64_t sub_1C68C29F4()
{
  return sub_1C6678E8C();
}

uint64_t sub_1C68C29FC()
{
  return sub_1C680CFFC();
}

uint64_t sub_1C68C2A04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C68BC914();
  *a1 = result;
  return result;
}

uint64_t sub_1C68C2A34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C68C298C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void static ContactRecall.search(config:locale:stringQuery:)()
{
  OUTLINED_FUNCTION_63();
  uint64_t v49 = v2;
  uint64_t v50 = v3;
  uint64_t v45 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B2A0);
  uint64_t v8 = OUTLINED_FUNCTION_3(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v47 = v9;
  OUTLINED_FUNCTION_6();
  sub_1C68E9C68();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = OUTLINED_FUNCTION_9_1();
  uint64_t v12 = type metadata accessor for UCGStringTokenizer(v11);
  uint64_t v13 = OUTLINED_FUNCTION_3(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_20();
  uint64_t v46 = v14;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (uint64_t *)((char *)&v44 - v16);
  uint64_t v18 = type metadata accessor for ContactResolverConfig(0);
  uint64_t v19 = OUTLINED_FUNCTION_3(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_11();
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B990]), sel_init);
  objc_msgSend(v20, sel_setUseOutOfProcessMapperExclusively_, 1);
  id v21 = objc_allocWithZone(MEMORY[0x1E4F1B980]);
  id v48 = v20;
  id v22 = objc_msgSend(v21, sel_initWithConfiguration_, v20);
  v65[3] = sub_1C65BAD10(0, &qword_1EBBF5388);
  v65[4] = &off_1F2174450;
  v65[0] = v22;
  uint64_t v54 = v65;
  uint64_t v23 = (void *)sub_1C68C2F54(0x64726143654DLL, 0xE600000000000000, (void (*)(uint64_t *__return_ptr))sub_1C68C3508);
  uint64_t v24 = sub_1C68C31E0();
  id v44 = objc_msgSend(self, sel_indexMatcher);
  uint64_t v51 = v6;
  sub_1C65DCFC4(v6, v0);
  OUTLINED_FUNCTION_23_39();
  v25();
  StringTokenizer.init(locale:)(v1, v17);
  sub_1C65C0368((uint64_t)v65, (uint64_t)v64);
  memset(v62, 0, sizeof(v62));
  long long v63 = xmmword_1C68F0C30;
  uint64_t v61 = 0;
  memset(v60, 0, sizeof(v60));
  if (v24)
  {
    uint64_t v26 = type metadata accessor for RelationshipLocalizer();
    uint64_t v59 = &off_1F2185EE8;
    *((void *)&v58 + 1) = v26;
    *(void *)&long long v57 = v24;
  }
  else
  {
    uint64_t v59 = 0;
    long long v57 = 0uLL;
    long long v58 = 0uLL;
  }
  type metadata accessor for AsrPhoneticSequenceFetcher();
  memset(v66, 0, 57);
  uint64_t v27 = v47;
  OUTLINED_FUNCTION_39_7();
  __swift_storeEnumTagSinglePayload(v28, v29, v30, v31);
  type metadata accessor for UnifiedContactGenerator(0);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v46;
  sub_1C65DCFC4((uint64_t)v17, v46);
  id v34 = v23;
  swift_retain();
  uint64_t v43 = v27;
  uint64_t v35 = MEMORY[0x1E4FBC860];
  sub_1C68D77DC((uint64_t)v44, MEMORY[0x1E4FBC860], v0, 0, v33, (uint64_t)v66, (uint64_t)v64, v23, (uint64_t)v62, (uint64_t)v60, (uint64_t)&v57, 0, 0, 0, 2, 0, v43, v32);
  sub_1C68D8374((uint64_t)v17, (void (*)(void))type metadata accessor for UCGStringTokenizer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5408);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
  v56[0] = 0;
  v56[1] = 0xE000000000000000;
  LOBYTE(v56[2]) = 0;
  v56[3] = v49;
  v56[4] = v50;
  v56[5] = 0;
  v56[6] = 0xE000000000000000;
  v56[7] = 0;
  v56[8] = 0xE000000000000000;
  v56[9] = 0;
  v56[10] = 0xE000000000000000;
  v56[11] = 0;
  v56[12] = 0xE000000000000000;
  v56[13] = 0;
  v56[14] = 0xE000000000000000;
  v56[15] = 0;
  v56[16] = 0xE000000000000000;
  v56[17] = 0;
  v56[18] = 0xE000000000000000;
  v56[19] = 0;
  v56[20] = 0xE000000000000000;
  memset(&v56[21], 0, 72);
  v56[30] = v35;
  LOBYTE(v56[31]) = 1;
  v56[32] = 0;
  memcpy((void *)(inited + 32), v56, 0x108uLL);
  swift_bridgeObjectRetain();
  sub_1C65B537C(v56);
  sub_1C65C5CC0(v51, inited, v37, v38, v39, v40, v41, v42, (uint64_t)v44, v45, v46, v47, (uint64_t)v48, v49, v50, v51, v52, v53, (uint64_t)v54,
    v55);
  swift_release();
  swift_release();

  swift_setDeallocating();
  sub_1C65C6F88();
  sub_1C65B6550(v56);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  OUTLINED_FUNCTION_54_0();
}

uint64_t type metadata accessor for UCGStringTokenizer(uint64_t a1)
{
  return sub_1C65B1F9C(a1, (uint64_t *)&unk_1EA40B328);
}

uint64_t sub_1C68C2F54(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  a3(&v4);
  return v4;
}

uint64_t sub_1C68C31E0()
{
  sub_1C68C3524(&v1);
  return v1;
}

uint64_t sub_1C68C3464@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  if (qword_1EBBF6328 != -1) {
    swift_once();
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(qword_1EBBF7A80, v4, v5);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1C68C3508@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C68C3464(*(void **)(v1 + 16), a1);
}

uint64_t sub_1C68C3524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6888);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1C68E9968();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v18 - v11;
  if (qword_1EBBF4648 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_1EBBF7970);
  sub_1C6626FA0(v13, (uint64_t)v5, &qword_1EBBF6888);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = *v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6650);
    return swift_willThrowTypedImpl();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v12, v5, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5318);
    swift_allocObject();
    sub_1C65E7954((uint64_t)v10);
    if (v1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
    else
    {
      uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      sub_1C65C5940(&v19, v15);
      uint64_t result = swift_release();
      if (v19)
      {
        type metadata accessor for RelationshipLocalizer();
        uint64_t v16 = swift_allocObject();
        swift_allocObject();
        uint64_t v17 = swift_retain();
        *(void *)(v16 + 16) = sub_1C68BDFD0(v17);
        uint64_t result = swift_release();
      }
      else
      {
        uint64_t v16 = 0;
      }
      *a1 = v16;
    }
  }
  return result;
}

uint64_t sub_1C68C3804()
{
  uint64_t v1 = OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator____lazy_storage___semanticRelationshipMapping;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator____lazy_storage___semanticRelationshipMapping))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator____lazy_storage___semanticRelationshipMapping);
  }
  else
  {
    uint64_t v2 = sub_1C68C386C(v0);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C68C386C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 104);
  if (v1)
  {
    id v3 = (id)*MEMORY[0x1E4F1AF50];
    id v4 = v1;
    id v5 = objc_msgSend(v4, sel_contactRelations);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF5390);
    unint64_t v6 = sub_1C68ECBF8();

    swift_retain();
    uint64_t v7 = sub_1C68BBE00(MEMORY[0x1E4FBC868], v6, a1);
    swift_bridgeObjectRelease();

    return v7;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
    return sub_1C68EC748();
  }
}

id sub_1C68C3988(uint64_t *a1, id *a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43F0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = *a2;
  id result = objc_msgSend(*a2, sel_label);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v74 = v3;
    uint64_t v13 = sub_1C68EC898();
    uint64_t v15 = v14;

    id v16 = objc_msgSend(v10, sel_value);
    id v17 = objc_msgSend(v16, sel_name);

    uint64_t v18 = sub_1C68EC898();
    unint64_t v20 = v19;

    swift_bridgeObjectRelease();
    uint64_t v21 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (!v21) {
      return (id)swift_bridgeObjectRelease();
    }
    uint64_t v72 = v13;
    uint64_t v73 = v15;
    uint64_t v22 = a3 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config;
    uint64_t v23 = v22 + *(int *)(type metadata accessor for ContactResolverConfig(0) + 32);
    uint64_t v24 = sub_1C68E9C68();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v9, v23, v24);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v24);
    sub_1C65C74BC();
    uint64_t v25 = sub_1C68ED108();
    uint64_t v70 = v26;
    uint64_t v71 = v25;
    sub_1C65C117C((uint64_t)v9, &qword_1EBBF43F0);
    swift_bridgeObjectRetain();
    id v27 = objc_msgSend(v10, sel_value);
    id v28 = objc_msgSend(v27, sel_name);

    uint64_t v29 = sub_1C68EC898();
    uint64_t v68 = v30;
    uint64_t v69 = v29;

    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v72 = *a1;
    uint64_t v31 = v72;
    *a1 = 0x8000000000000000;
    unint64_t v32 = sub_1C68506A0(v13, v15);
    if (__OFADD__(*(void *)(v31 + 16), (v33 & 1) == 0))
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    unint64_t v34 = v32;
    char v35 = v33;
    v67[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40A548);
    if (sub_1C68ED4D8())
    {
      unint64_t v36 = sub_1C68506A0(v13, v15);
      if ((v35 & 1) != (v37 & 1))
      {
LABEL_29:
        id result = (id)sub_1C68ED868();
        __break(1u);
        return result;
      }
      unint64_t v34 = v36;
    }
    *a1 = v72;
    swift_bridgeObjectRelease();
    uint64_t v38 = *a1;
    swift_bridgeObjectRetain();
    if ((v35 & 1) == 0)
    {
      sub_1C6853F78(v34, v13, v15, MEMORY[0x1E4FBC860], v38);
      swift_bridgeObjectRetain();
    }
    uint64_t v39 = *(void *)(v38 + 56);
    swift_bridgeObjectRelease();
    uint64_t v40 = (uint64_t *)(v39 + 8 * v34);
    sub_1C662DB48();
    uint64_t v41 = *(void *)(*v40 + 16);
    sub_1C662DE44(v41);
    uint64_t v42 = *v40;
    *(void *)(v42 + 16) = v41 + 1;
    uint64_t v43 = v42 + 16 * v41;
    uint64_t v44 = v68;
    *(void *)(v43 + 32) = v69;
    *(void *)(v43 + 40) = v44;
    swift_bridgeObjectRelease();
    uint64_t v46 = v70;
    uint64_t v45 = v71;
    if (v13 != v71 || v15 != v70)
    {
      char v48 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      if (v48) {
        return (id)swift_bridgeObjectRelease();
      }
      id v49 = objc_msgSend(v10, sel_value);
      id v50 = objc_msgSend(v49, sel_name);

      uint64_t v51 = sub_1C68EC898();
      uint64_t v53 = v52;

      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v72 = *a1;
      uint64_t v54 = v72;
      *a1 = 0x8000000000000000;
      unint64_t v55 = sub_1C68506A0(v45, v46);
      char v57 = v56;
      if (!__OFADD__(*(void *)(v54 + 16), (v56 & 1) == 0))
      {
        unint64_t v58 = v55;
        if ((sub_1C68ED4D8() & 1) == 0)
        {
LABEL_20:
          *a1 = v72;
          swift_bridgeObjectRelease();
          uint64_t v61 = *a1;
          swift_bridgeObjectRetain();
          if ((v57 & 1) == 0)
          {
            sub_1C6853F78(v58, v71, v46, MEMORY[0x1E4FBC860], v61);
            swift_bridgeObjectRetain();
          }
          uint64_t v62 = *(void *)(v61 + 56);
          swift_bridgeObjectRelease();
          long long v63 = (uint64_t *)(v62 + 8 * v58);
          sub_1C662DB48();
          uint64_t v64 = *(void *)(*v63 + 16);
          sub_1C662DE44(v64);
          uint64_t v65 = *v63;
          *(void *)(v65 + 16) = v64 + 1;
          uint64_t v66 = v65 + 16 * v64;
          *(void *)(v66 + 32) = v51;
          *(void *)(v66 + 40) = v53;
          return (id)swift_bridgeObjectRelease();
        }
        unint64_t v59 = sub_1C68506A0(v71, v46);
        if ((v57 & 1) == (v60 & 1))
        {
          unint64_t v58 = v59;
          goto LABEL_20;
        }
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_1C68C3E94(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v432 = a4;
  uint64_t v427 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5370);
  MEMORY[0x1F4188790](v6);
  v439 = (char *)&v418 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5378);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  v441 = (char *)&v418 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v440 = (char *)&v418 - v11;
  uint64_t v437 = sub_1C68E97F8();
  uint64_t v424 = *(void *)(v437 - 8);
  MEMORY[0x1F4188790](v437);
  v436 = (char *)&v418 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v420 = type metadata accessor for Signpost();
  MEMORY[0x1F4188790](v420);
  uint64_t v422 = (uint64_t)&v418 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v449 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v451 = *(void *)(v449 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v449);
  uint64_t v450 = (uint64_t)&v418 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v418 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v445 = (uint64_t)&v418 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  *(void *)&long long v433 = (char *)&v418 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v429 = (uint64_t)&v418 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  unint64_t v419 = (unint64_t)&v418 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v418 = (uint64_t)&v418 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v421 = (uint64_t)&v418 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v442 = (uint64_t *)((char *)&v418 - v32);
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  uint64_t v428 = (uint64_t)&v418 - v34;
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  uint64_t v426 = (uint64_t)&v418 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  v444 = (uint64_t *)((char *)&v418 - v38);
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  uint64_t v425 = (uint64_t)&v418 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  uint64_t v443 = (uint64_t)&v418 - v42;
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  *(void *)&long long v435 = (char *)&v418 - v44;
  uint64_t v45 = MEMORY[0x1F4188790](v43);
  uint64_t v448 = (uint64_t)&v418 - v46;
  uint64_t v47 = MEMORY[0x1F4188790](v45);
  *(void *)&long long v434 = (char *)&v418 - v48;
  uint64_t v49 = MEMORY[0x1F4188790](v47);
  uint64_t v438 = (uint64_t)&v418 - v50;
  uint64_t v51 = MEMORY[0x1F4188790](v49);
  *(void *)&long long v430 = (char *)&v418 - v52;
  MEMORY[0x1F4188790](v51);
  uint64_t v54 = (char *)&v418 - v53;
  memcpy(v460, a2, 0x108uLL);
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v55 = sub_1C68EC478();
  uint64_t v56 = __swift_project_value_buffer(v55, (uint64_t)&unk_1EBBF7A68);
  sub_1C65B537C(v460);
  sub_1C65B537C(v460);
  uint64_t v446 = v56;
  char v57 = sub_1C68EC458();
  os_log_type_t v58 = sub_1C68ECE48();
  unint64_t v59 = v58;
  BOOL v60 = os_log_type_enabled(v57, v58);
  uint64_t v431 = a3;
  uint64_t v452 = v6;
  v423 = v18;
  if (v60)
  {
    uint64_t v61 = swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    v458[0] = v62;
    *(_DWORD *)uint64_t v61 = 134218242;
    v459[0] = v427;
    sub_1C68ED0C8();
    *(_WORD *)(v61 + 12) = 2080;
    uint64_t v427 = v61 + 14;
    memcpy(v459, v460, sizeof(v459));
    uint64_t v63 = ContactQuery.description.getter();
    sub_1C65B4078(v63, v64, (uint64_t)v458, v65, v66, v67, v68, v69, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
      v429);
    v459[0] = v70;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    sub_1C65B6550(v460);
    sub_1C65B6550(v460);
    _os_log_impl(&dword_1C65AE000, v57, (os_log_type_t)v59, "[UCG] Beginning search for query [%ld]: %s", (uint8_t *)v61, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v62, -1, -1);
    uint64_t v71 = v61;
    a3 = v431;
    MEMORY[0x1C87A54F0](v71, -1, -1);
  }
  else
  {
    sub_1C65B6550(v460);
    sub_1C65B6550(v460);
  }

  memcpy(v459, v460, sizeof(v459));
  sub_1C68C6ED0();
  uint64_t v73 = v72;
  uint64_t v454 = MEMORY[0x1E4FBC860];
  uint64_t v74 = *(void *)(v72 + 16);
  if (v74)
  {
    swift_bridgeObjectRetain();
    memcpy(v459, (const void *)(v73 + 32), sizeof(v459));
    memcpy(v458, v459, sizeof(v458));
    sub_1C65B537C(v459);
    uint64_t v75 = v447;
    sub_1C68C7370(v458, a3, v432, v453);
    if (v75)
    {
LABEL_11:
      uint64_t v447 = v75;
      sub_1C65B6550(v459);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v76 = 296;
    while (1)
    {
      uint64_t v447 = v75;
      sub_1C65B6550(v459);
      sub_1C68BD004();
      if (!--v74) {
        break;
      }
      memcpy(v459, (const void *)(v73 + v76), sizeof(v459));
      memcpy(v458, v459, sizeof(v458));
      sub_1C65B537C(v459);
      uint64_t v75 = v447;
      sub_1C68C7370(v458, v431, v432, v453);
      v76 += 264;
      if (v75) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  memcpy(v459, v460, sizeof(v459));
  swift_bridgeObjectRetain();
  sub_1C68D0CAC();
  uint64_t v79 = v78;
  swift_bridgeObjectRelease_n();
  v461 = (void *)v79;
  swift_bridgeObjectRetain();
  uint64_t v80 = sub_1C68BC3E8((void (*)(uint64_t **__return_ptr, unint64_t))sub_1C68C9BAC, 0, (void (*)(char *, char *))sub_1C68C9BB8, 0, v79);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v461 = (void *)v80;
  uint64_t v81 = *(void *)(v80 + 16);
  if (v81)
  {
    uint64_t v82 = v80 + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
    uint64_t v83 = *(void *)(v451 + 72);
    swift_bridgeObjectRetain();
    uint64_t v84 = (uint64_t)&qword_1EBBF5210;
    do
    {
      sub_1C6626FA0(v82, (uint64_t)v54, &qword_1EBBF5210);
      unint64_t v85 = &v54[*(int *)(v449 + 36)];
      LOBYTE(v85) = v85[*(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 140)];
      sub_1C65C117C((uint64_t)v54, &qword_1EBBF5210);
      if (v85)
      {
        swift_bridgeObjectRelease();
        uint64_t v86 = (uint64_t)v461;
        goto LABEL_36;
      }
      v82 += v83;
      --v81;
    }
    while (v81);
    swift_bridgeObjectRelease();
    uint64_t v80 = (uint64_t)v461;
    uint64_t v84 = v461[2];
  }
  else
  {
    uint64_t v84 = 0;
  }
  uint64_t v86 = MEMORY[0x1E4FBC860];
  v459[0] = MEMORY[0x1E4FBC860];
  uint64_t v87 = swift_bridgeObjectRetain();
  uint64_t v88 = v430;
  if (!v84) {
    goto LABEL_34;
  }
  unint64_t v89 = 0;
  uint64_t v90 = &qword_1EBBF5210;
  uint64_t v427 = v84;
  do
  {
    if (v89 >= *(void *)(v80 + 16)) {
      goto LABEL_221;
    }
    unint64_t v91 = (*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80);
    uint64_t v86 = *(void *)(v451 + 72);
    sub_1C6626FA0(v80 + v91 + v86 * v89, v88, &qword_1EBBF5210);
    uint64_t v92 = v447;
    char v93 = sub_1C68CA3A8(v88);
    if (v92)
    {
      sub_1C65C117C(v88, &qword_1EBBF5210);
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    uint64_t v447 = 0;
    if (v93)
    {
      sub_1C6626FE4(v88, v438, &qword_1EBBF5210);
      uint64_t v94 = v459[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C669FB20();
        uint64_t v94 = v459[0];
      }
      unint64_t v59 = *(void *)(v94 + 16);
      if (v59 >= *(void *)(v94 + 24) >> 1)
      {
        sub_1C669FB20();
        uint64_t v94 = v459[0];
      }
      *(void *)(v94 + 16) = v59 + 1;
      uint64_t v87 = sub_1C6626FE4(v438, v94 + v91 + v59 * v86, &qword_1EBBF5210);
      uint64_t v88 = v430;
      uint64_t v84 = v427;
    }
    else
    {
      uint64_t v87 = sub_1C65C117C(v88, &qword_1EBBF5210);
    }
    ++v89;
  }
  while (v84 != v89);
  uint64_t v86 = v459[0];
LABEL_34:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v461 = (void *)v86;
LABEL_36:
  uint64_t v90 = (uint64_t *)v449;
  uint64_t v95 = *(void *)(v86 + 16);
  if (!v95) {
    goto LABEL_41;
  }
  uint64_t v96 = v86 + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
  uint64_t v97 = *(void *)(v451 + 72);
  uint64_t v438 = v86;
  swift_bridgeObjectRetain();
  uint64_t v84 = (uint64_t)&qword_1EBBF5210;
  uint64_t v98 = v434;
  while (2)
  {
    sub_1C6626FA0(v96, v98, &qword_1EBBF5210);
    uint64_t v99 = v98 + *((int *)v90 + 9);
    unint64_t v59 = *(unsigned __int8 *)(v99 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 140));
    sub_1C65C117C(v98, &qword_1EBBF5210);
    if (v59)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v96 += v97;
      if (--v95) {
        continue;
      }
      swift_bridgeObjectRelease();
      uint64_t v86 = (uint64_t)v461;
      uint64_t v95 = v461[2];
LABEL_41:
      v459[0] = MEMORY[0x1E4FBC860];
      uint64_t v87 = swift_bridgeObjectRetain();
      if (v95)
      {
        uint64_t v90 = 0;
        uint64_t v438 = v448 + 336;
        *(void *)&long long v434 = v95;
        while (1)
        {
          if ((unint64_t)v90 >= *(void *)(v86 + 16)) {
            goto LABEL_222;
          }
          unint64_t v100 = (*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80);
          unint64_t v59 = *(void *)(v451 + 72);
          uint64_t v101 = v86;
          uint64_t v102 = v86 + v100 + v59 * (void)v90;
          uint64_t v103 = v448;
          sub_1C6626FA0(v102, v448, &qword_1EBBF5210);
          uint64_t v104 = v449;
          char v105 = *(unsigned char *)(v438 + *(int *)(v449 + 36));
          uint64_t v106 = v103;
          uint64_t v107 = v435;
          sub_1C6626FA0(v106, v435, &qword_1EBBF5210);
          if ((v105 & 1) == 0) {
            break;
          }
          uint64_t v108 = v107 + *(int *)(v104 + 36);
          uint64_t v84 = *(unsigned __int8 *)(v108 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 204));
          sub_1C65C117C(v107, &qword_1EBBF5210);
          if (v84 == 1) {
            goto LABEL_48;
          }
          uint64_t v87 = sub_1C65C117C(v448, &qword_1EBBF5210);
          uint64_t v86 = v101;
          uint64_t v109 = (uint64_t *)v434;
LABEL_53:
          uint64_t v90 = (uint64_t *)((char *)v90 + 1);
          if (v109 == v90) {
            goto LABEL_54;
          }
        }
        sub_1C65C117C(v107, &qword_1EBBF5210);
LABEL_48:
        sub_1C6626FE4(v448, v443, &qword_1EBBF5210);
        uint64_t v110 = v459[0];
        uint64_t v86 = v101;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C669FB20();
          uint64_t v110 = v459[0];
        }
        uint64_t v109 = (uint64_t *)v434;
        unint64_t v111 = *(void *)(v110 + 16);
        uint64_t v84 = v111 + 1;
        if (v111 >= *(void *)(v110 + 24) >> 1)
        {
          sub_1C669FB20();
          uint64_t v110 = v459[0];
        }
        *(void *)(v110 + 16) = v84;
        uint64_t v87 = sub_1C6626FE4(v443, v110 + v100 + v111 * v59, &qword_1EBBF5210);
        goto LABEL_53;
      }
LABEL_54:
      swift_bridgeObjectRelease();
      uint64_t v112 = (void *)v459[0];
      uint64_t v90 = (uint64_t *)v449;
      if (*(void *)(v459[0] + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v113 = v447;
        sub_1C68B89B4();
        uint64_t v115 = v114;
        swift_bridgeObjectRelease();
        uint64_t v116 = sub_1C6688970(v115);
        sub_1C68B89B4();
        uint64_t v447 = v113;
        sub_1C68D6868(v117, v116);
        swift_bridgeObjectRelease();
        swift_retain();
        v118 = sub_1C68EC458();
        os_log_type_t v119 = sub_1C68ECE48();
        if (os_log_type_enabled(v118, v119))
        {
          char v120 = (uint8_t *)swift_slowAlloc();
          uint64_t v448 = swift_slowAlloc();
          v459[0] = v448;
          *(_DWORD *)char v120 = 136315138;
          uint64_t v443 = (uint64_t)(v120 + 4);
          swift_retain();
          uint64_t v121 = sub_1C68ECD68();
          uint64_t v123 = v122;
          swift_release();
          sub_1C65B4078(v121, v123, (uint64_t)v459, v124, v125, v126, v127, v128, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
            v429);
          v458[0] = v129;
          uint64_t v90 = (uint64_t *)v449;
          sub_1C68ED0C8();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C65AE000, v118, v119, "[UCG] There are non-hypocorism matches. Discarding hypocorism candidate(s): %s", v120, 0xCu);
          uint64_t v130 = v448;
          swift_arrayDestroy();
          MEMORY[0x1C87A54F0](v130, -1, -1);
          MEMORY[0x1C87A54F0](v120, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        swift_bridgeObjectRelease();
        v461 = v112;
      }
      else
      {
        swift_release();
      }
    }
    break;
  }
  uint64_t v131 = v461[2];
  uint64_t v86 = v425;
  if (v131)
  {
    uint64_t v132 = (uint64_t)v461
         + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
    uint64_t v133 = *(void *)(v451 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C6626FA0(v132, v86, &qword_1EBBF5210);
      uint64_t v134 = v86 + *((int *)v90 + 9);
      LOBYTE(v134) = *(unsigned char *)(v134 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 140));
      sub_1C65C117C(v86, &qword_1EBBF5210);
      if (v134) {
        break;
      }
      v132 += v133;
      if (!--v131)
      {
        swift_bridgeObjectRelease();
        uint64_t v135 = v461[2];
        goto LABEL_67;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v84 = v431;
    unint64_t v59 = 0x1C68F6000;
LABEL_96:
    uint64_t v178 = v429;
    goto LABEL_99;
  }
  uint64_t v135 = 0;
LABEL_67:
  uint64_t v136 = MEMORY[0x1E4FBC860];
  v459[0] = MEMORY[0x1E4FBC860];
  uint64_t v87 = swift_bridgeObjectRetain();
  uint64_t v84 = v426;
  if (v135)
  {
    unint64_t v59 = 0;
    uint64_t v443 = (uint64_t)v444 + 333;
    *(void *)&long long v435 = v426 + 334;
    uint64_t v448 = v135;
    uint64_t v438 = v87;
    while (1)
    {
      if (v59 >= *(void *)(v87 + 16)) {
        goto LABEL_223;
      }
      unint64_t v137 = (*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80);
      uint64_t v138 = *(void *)(v451 + 72);
      uint64_t v86 = (uint64_t)v90;
      uint64_t v139 = (uint64_t)v444;
      sub_1C6626FA0(v87 + v137 + v138 * v59, (uint64_t)v444, &qword_1EBBF5210);
      int v140 = *(unsigned __int8 *)(v443 + *(int *)(v86 + 36));
      sub_1C6626FA0(v139, v84, &qword_1EBBF5210);
      if (v140 == 1)
      {
        char v141 = *(unsigned char *)(v435 + *(int *)(v86 + 36));
        sub_1C65C117C(v84, &qword_1EBBF5210);
        uint64_t v90 = (uint64_t *)v86;
        if (v141)
        {
          sub_1C6626FE4((uint64_t)v444, v428, &qword_1EBBF5210);
          uint64_t v142 = v459[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1C669FB20();
            uint64_t v142 = v459[0];
          }
          unint64_t v143 = *(void *)(v142 + 16);
          if (v143 >= *(void *)(v142 + 24) >> 1)
          {
            sub_1C669FB20();
            uint64_t v142 = v459[0];
          }
          *(void *)(v142 + 16) = v143 + 1;
          sub_1C6626FE4(v428, v142 + v137 + v143 * v138, &qword_1EBBF5210);
          uint64_t v90 = (uint64_t *)v449;
          uint64_t v84 = v426;
          goto LABEL_79;
        }
      }
      else
      {
        sub_1C65C117C(v84, &qword_1EBBF5210);
        uint64_t v90 = (uint64_t *)v86;
      }
      sub_1C65C117C((uint64_t)v444, &qword_1EBBF5210);
LABEL_79:
      ++v59;
      uint64_t v87 = v438;
      if (v448 == v59)
      {
        uint64_t v144 = v459[0];
        goto LABEL_83;
      }
    }
  }
  uint64_t v144 = v136;
LABEL_83:
  swift_bridgeObjectRelease();
  uint64_t v145 = *(void *)(v144 + 16);
  if (v145)
  {
    v459[0] = MEMORY[0x1E4FBC860];
    sub_1C669F7F0();
    uint64_t v146 = *(unsigned __int8 *)(v451 + 80);
    v444 = (uint64_t *)v144;
    uint64_t v147 = v144 + ((v146 + 32) & ~v146);
    uint64_t v448 = *(void *)(v451 + 72);
    do
    {
      uint64_t v148 = v442;
      sub_1C6626FA0(v147, (uint64_t)v442, &qword_1EBBF5210);
      uint64_t v149 = *v148;
      uint64_t v150 = v148[1];
      swift_bridgeObjectRetain();
      sub_1C65C117C((uint64_t)v148, &qword_1EBBF5210);
      uint64_t v151 = v459[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C669F7F0();
        uint64_t v151 = v459[0];
      }
      unint64_t v152 = *(void *)(v151 + 16);
      if (v152 >= *(void *)(v151 + 24) >> 1)
      {
        sub_1C669F7F0();
        uint64_t v151 = v459[0];
      }
      *(void *)(v151 + 16) = v152 + 1;
      uint64_t v153 = v151 + 16 * v152;
      *(void *)(v153 + 32) = v149;
      *(void *)(v153 + 40) = v150;
      uint64_t v90 = (uint64_t *)v449;
      v147 += v448;
      --v145;
    }
    while (v145);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v151 = MEMORY[0x1E4FBC860];
  }
  uint64_t v154 = sub_1C6688970(v151);
  unint64_t v59 = (unint64_t)&OBJC_IVAR____TtC13SiriInference22MegadomeEntityFeatures_callPopularityGivenCoarseGeoHash;
  if (!*(void *)(v154 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v84 = v431;
    goto LABEL_96;
  }
  uint64_t v155 = swift_bridgeObjectRetain();
  uint64_t v156 = v154;
  uint64_t v157 = v447;
  uint64_t v158 = sub_1C68B7E90(v155, v156);
  swift_bridgeObjectRetain();
  sub_1C68B89B4();
  uint64_t v160 = v159;
  swift_bridgeObjectRelease();
  uint64_t v161 = sub_1C6688970(v160);
  sub_1C68B89B4();
  uint64_t v447 = v157;
  sub_1C68D6868(v162, v161);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  swift_retain();
  v163 = sub_1C68EC458();
  os_log_type_t v164 = sub_1C68ECE48();
  if (os_log_type_enabled(v163, v164))
  {
    uint64_t v165 = swift_slowAlloc();
    uint64_t v448 = swift_slowAlloc();
    v459[0] = v448;
    *(_DWORD *)uint64_t v165 = 134218242;
    uint64_t v166 = *(void *)(v158 + 16);
    swift_bridgeObjectRelease();
    v458[0] = v166;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v165 + 12) = 2080;
    v444 = (uint64_t *)(v165 + 14);
    swift_retain();
    uint64_t v167 = sub_1C68ECD68();
    uint64_t v169 = v168;
    swift_release();
    uint64_t v170 = v167;
    unint64_t v59 = 0x1C68F6000;
    sub_1C65B4078(v170, v169, (uint64_t)v459, v171, v172, v173, v174, v175, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
      v429);
    v458[0] = v176;
    sub_1C68ED0C8();
    swift_release_n();
    uint64_t v90 = (uint64_t *)v449;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v163, v164, "[UCG] We have %ld candidate(s) with exact name matches or from PICS. Discarding other non-exact candidate(s): %s", (uint8_t *)v165, 0x16u);
    uint64_t v177 = v448;
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v177, -1, -1);
    MEMORY[0x1C87A54F0](v165, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v84 = v431;
  uint64_t v178 = v429;
  swift_bridgeObjectRelease();
  v461 = (void *)v158;
LABEL_99:
  uint64_t v179 = swift_bridgeObjectRetain();
  uint64_t v86 = sub_1C65CFB9C(v179);
  swift_bridgeObjectRelease_n();
  v461 = (void *)v86;
  if (*(unsigned char *)(v432 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors) == 1)
  {
    uint64_t v180 = *(void *)(v432 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3Orchestrator);
    if (v180)
    {
      uint64_t v438 = v432 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors;
      uint64_t v181 = qword_1EBBF68D0;
      uint64_t v448 = v180;
      swift_retain();
      if (v181 != -1) {
        goto LABEL_250;
      }
      goto LABEL_102;
    }
  }
LABEL_128:
  uint64_t v213 = type metadata accessor for ContactResolverConfig(0);
  if ((*(unsigned char *)(v84 + *(int *)(v213 + 48)) & 1) == 0)
  {
    v442 = (uint64_t *)v213;
    v214 = sub_1C68EC458();
    os_log_type_t v215 = sub_1C68ECE48();
    if (os_log_type_enabled(v214, v215))
    {
      v216 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v216 = 0;
      _os_log_impl(&dword_1C65AE000, v214, v215, "[UCG] Filtering out contacts that are first party based on config...", v216, 2u);
      v217 = v216;
      uint64_t v84 = v431;
      MEMORY[0x1C87A54F0](v217, -1, -1);
    }

    swift_beginAccess();
    v218 = (void *)MEMORY[0x1E4FBC860];
    v459[0] = MEMORY[0x1E4FBC860];
    uint64_t v219 = v461[2];
    uint64_t v448 = (uint64_t)v461;
    swift_bridgeObjectRetain();
    v444 = (uint64_t *)v219;
    if (v219)
    {
      uint64_t v90 = 0;
      uint64_t v443 = v178 + 8;
      uint64_t v84 = (uint64_t)&qword_1EBBF5210;
      uint64_t v87 = v448;
      do
      {
        if ((unint64_t)v90 >= *(void *)(v87 + 16)) {
          goto LABEL_224;
        }
        unint64_t v220 = v59;
        uint64_t v86 = (*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80);
        uint64_t v221 = *(void *)(v451 + 72);
        sub_1C6626FA0(v87 + v86 + v221 * (void)v90, v178, &qword_1EBBF5210);
        uint64_t v222 = v178;
        uint64_t v223 = *(void *)(v443 + *(int *)(type metadata accessor for Contact() + 88));
        swift_bridgeObjectRelease();
        if (v223)
        {
          sub_1C6626FE4(v222, v433, &qword_1EBBF5210);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_1C669FB20();
          }
          uint64_t v224 = v459[0];
          unint64_t v225 = *(void *)(v459[0] + 16);
          if (v225 >= *(void *)(v459[0] + 24) >> 1)
          {
            sub_1C669FB20();
            uint64_t v224 = v459[0];
          }
          *(void *)(v224 + 16) = v225 + 1;
          sub_1C6626FE4(v433, v224 + v86 + v225 * v221, &qword_1EBBF5210);
          unint64_t v59 = 0x1C68F6000;
          uint64_t v178 = v429;
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_1C65C117C(v222, &qword_1EBBF5210);
          uint64_t v178 = v222;
          unint64_t v59 = v220;
        }
        uint64_t v90 = (uint64_t *)((char *)v90 + 1);
        uint64_t v87 = v448;
      }
      while (v444 != v90);
      v218 = (void *)v459[0];
      uint64_t v90 = (uint64_t *)v449;
      uint64_t v84 = v431;
    }
    swift_bridgeObjectRelease();
    v461 = v218;
    swift_bridgeObjectRelease();
    uint64_t v213 = (uint64_t)v442;
  }
  uint64_t v226 = *(void *)(v84 + *(int *)(v213 + 44));
  uint64_t v227 = *(void *)(v226 + 16);
  if (v227)
  {
    swift_bridgeObjectRetain();
    unint64_t v228 = sub_1C65C7508();
    uint64_t v448 = sub_1C65C7554();
    uint64_t v443 = v226;
    v229 = (uint64_t *)(v226 + 40);
    v230 = (void *)MEMORY[0x1E4FBC860];
    v444 = (uint64_t *)v228;
    do
    {
      uint64_t v231 = *(v229 - 1);
      uint64_t v232 = *v229;
      v459[0] = v231;
      v459[1] = v232;
      uint64_t v454 = 0x6C7070612E6D6F63;
      unint64_t v455 = 0xEA00000000002E65;
      swift_bridgeObjectRetain();
      if (sub_1C68EC808())
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v456 = v230;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1C669F7F0();
          v230 = v456;
        }
        unint64_t v234 = v230[2];
        if (v234 >= v230[3] >> 1)
        {
          sub_1C669F7F0();
          v230 = v456;
        }
        v230[2] = v234 + 1;
        v235 = &v230[2 * v234];
        v235[4] = v231;
        v235[5] = v232;
        unint64_t v59 = 0x1C68F6000;
      }
      v229 += 2;
      --v227;
    }
    while (v227);
    swift_bridgeObjectRelease();
    uint64_t v90 = (uint64_t *)v449;
  }
  else
  {
    v230 = (void *)MEMORY[0x1E4FBC860];
  }
  swift_beginAccess();
  uint64_t v236 = swift_bridgeObjectRetain();
  uint64_t v237 = v447;
  uint64_t v238 = sub_1C68B8484(v236, v230);
  uint64_t v447 = v237;
  v461 = (void *)v238;
  swift_bridgeObjectRelease();
  if (*(void *)(v238 + 16) != 1)
  {
LABEL_161:
    sub_1C65B537C(v460);
    sub_1C65B537C(v460);
    uint64_t v86 = sub_1C68EC458();
    os_log_type_t v241 = sub_1C68ECE48();
    if (os_log_type_enabled((os_log_t)v86, v241))
    {
      uint64_t v242 = swift_slowAlloc();
      uint64_t v243 = swift_slowAlloc();
      v456 = (void *)v243;
      *(_DWORD *)uint64_t v242 = *(void *)(v59 + 1856);
      v459[0] = v461[2];
      sub_1C68ED0C8();
      *(_WORD *)(v242 + 12) = 2080;
      memcpy(v459, v460, sizeof(v459));
      uint64_t v244 = ContactQuery.description.getter();
      sub_1C65B4078(v244, v245, (uint64_t)&v456, v246, v247, v248, v249, v250, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
        v429);
      v459[0] = v251;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C65B6550(v460);
      sub_1C65B6550(v460);
      _os_log_impl(&dword_1C65AE000, (os_log_t)v86, v241, "[UCG] Final candidates (%ld) before signal generation for query: %s", (uint8_t *)v242, 0x16u);
      uint64_t v252 = MEMORY[0x1E4FBC840];
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v243, -1, -1);
      MEMORY[0x1C87A54F0](v242, -1, -1);

      unint64_t v59 = (unint64_t)v440;
      v253 = v441;
      uint64_t v84 = (uint64_t)v423;
      uint64_t v254 = v445;
    }
    else
    {
      sub_1C65B6550(v460);
      sub_1C65B6550(v460);

      unint64_t v59 = (unint64_t)v440;
      v253 = v441;
      uint64_t v84 = (uint64_t)v423;
      uint64_t v254 = v445;
      uint64_t v252 = MEMORY[0x1E4FBC840];
    }
    uint64_t v255 = v461[2];
    *(void *)&long long v435 = &v457;
    *(void *)&long long v434 = v424 + 8;
    uint64_t v438 = (uint64_t)v461;
    uint64_t v87 = swift_bridgeObjectRetain();
    uint64_t v90 = 0;
    *(void *)&long long v256 = 134218498;
    long long v433 = v256;
    uint64_t v432 = v252 + 8;
    v444 = (uint64_t *)v255;
    while (1)
    {
      if (v90 == (uint64_t *)v255)
      {
        uint64_t v257 = 1;
        v258 = (char *)v255;
      }
      else
      {
        if ((unint64_t)v90 >= *(void *)(v438 + 16))
        {
          __break(1u);
LABEL_221:
          __break(1u);
LABEL_222:
          __break(1u);
LABEL_223:
          __break(1u);
LABEL_224:
          __break(1u);
LABEL_225:
          uint64_t v380 = v87;
          uint64_t v427 = v86;
          v381 = sub_1C68EC458();
          os_log_type_t v382 = sub_1C68ECE48();
          if (os_log_type_enabled(v381, v382))
          {
            uint64_t v383 = v380;
            v384 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v384 = 0;
            _os_log_impl(&dword_1C65AE000, v381, v382, "[UCG][ASR-E3] Candidates:", v384, 2u);
            v385 = v384;
            uint64_t v380 = v383;
            MEMORY[0x1C87A54F0](v385, -1, -1);
          }

          uint64_t v386 = *(void *)(v380 + 16);
          if (v386)
          {
            uint64_t v387 = v380
                 + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
            uint64_t v388 = *(void *)(v451 + 72);
            *(void *)&long long v434 = v424 + 8;
            uint64_t v426 = v380;
            swift_bridgeObjectRetain();
            *(void *)&long long v389 = 136315138;
            long long v430 = v389;
            uint64_t v428 = MEMORY[0x1E4FBC840] + 8;
            uint64_t v390 = v419;
            *(void *)&long long v435 = v388;
            do
            {
              sub_1C6626FA0(v387, v390, &qword_1EBBF5210);
              v391 = sub_1C68EC458();
              os_log_type_t v392 = sub_1C68ECE48();
              if (os_log_type_enabled(v391, v392))
              {
                uint64_t v393 = swift_slowAlloc();
                v442 = (uint64_t *)swift_slowAlloc();
                v459[0] = v442;
                *(_DWORD *)uint64_t v393 = v430;
                v394 = v436;
                Contact.nameComponents.getter();
                uint64_t v395 = sub_1C68E97D8();
                uint64_t v397 = v396;
                v398 = v394;
                uint64_t v388 = v435;
                (*(void (**)(char *, uint64_t))v434)(v398, v437);
                sub_1C65B4078(v395, v397, (uint64_t)v459, v399, v400, v401, v402, v403, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
                  v429);
                *(void *)(v393 + 4) = v404;
                uint64_t v90 = (uint64_t *)v449;
                swift_bridgeObjectRelease();
                sub_1C65C117C(v419, &qword_1EBBF5210);
                _os_log_impl(&dword_1C65AE000, v391, v392, "%s", (uint8_t *)v393, 0xCu);
                uint64_t v405 = (uint64_t)v442;
                swift_arrayDestroy();
                MEMORY[0x1C87A54F0](v405, -1, -1);
                uint64_t v406 = v393;
                uint64_t v390 = v419;
                MEMORY[0x1C87A54F0](v406, -1, -1);
              }
              else
              {

                sub_1C65C117C(v390, &qword_1EBBF5210);
              }
              v387 += v388;
              --v386;
            }
            while (v386);
            uint64_t v380 = v426;
            swift_bridgeObjectRelease();
            uint64_t v84 = v431;
            unint64_t v59 = 0x1C68F6000;
          }
          swift_bridgeObjectRetain();
          v407 = sub_1C68EC458();
          os_log_type_t v408 = sub_1C68ECE48();
          if (os_log_type_enabled(v407, v408))
          {
            uint64_t v409 = v380;
            v410 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v410 = 134217984;
            uint64_t v411 = *(void *)(v409 + 16);
            swift_bridgeObjectRelease();
            v459[0] = v411;
            unint64_t v59 = 0x1C68F6000;
            uint64_t v84 = v431;
            sub_1C68ED0C8();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C65AE000, v407, v408, "[UCG][ASR-E3] Generated (%ld) candidates from Euclid match and not passing any to CRR since triggering condition is set to None", v410, 0xCu);
            MEMORY[0x1C87A54F0](v410, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v178 = v429;
          if (*(unsigned char *)(v438 + 56) == 1)
          {
            sub_1C662E914();
            uint64_t v86 = v412;
            unint64_t v413 = *(void *)(v412 + 16);
            unint64_t v414 = v413 + 1;
            if (v413 >= *(void *)(v412 + 24) >> 1)
            {
              sub_1C662E914();
              uint64_t v86 = v416;
            }
            *(void *)(v86 + 16) = v414;
            *(unsigned char *)(v86 + v413 + 32) = 0;
            if (!v461[2])
            {
              uint64_t v415 = v413 + 2;
              if (v415 > *(void *)(v86 + 24) >> 1)
              {
                sub_1C662E914();
                uint64_t v86 = v417;
              }
              *(void *)(v86 + 16) = v415;
              *(unsigned char *)(v86 + v414 + 32) = 1;
            }
          }
          else
          {
            uint64_t v86 = MEMORY[0x1E4FBC860];
          }
          sub_1C68CA73C();
          swift_bridgeObjectRelease();
LABEL_126:
          swift_bridgeObjectRelease();
LABEL_127:
          sub_1C68ECF88();
          uint64_t v212 = v422;
          sub_1C68EC428();
          swift_release();
          sub_1C68D8374(v212, (void (*)(void))type metadata accessor for Signpost);
          goto LABEL_128;
        }
        uint64_t v259 = v452;
        v258 = (char *)v90 + 1;
        uint64_t v260 = (uint64_t)&v439[*(int *)(v452 + 48)];
        sub_1C6626FA0(v438+ ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80))+ *(void *)(v451 + 72) * (void)v90, v260, &qword_1EBBF5210);
        uint64_t v261 = (uint64_t)v253 + *(int *)(v259 + 48);
        void *v253 = v90;
        uint64_t v262 = v260;
        uint64_t v254 = v445;
        sub_1C6626FE4(v262, v261, &qword_1EBBF5210);
        uint64_t v257 = 0;
      }
      uint64_t v263 = v452;
      __swift_storeEnumTagSinglePayload((uint64_t)v253, v257, 1, v452);
      sub_1C6626FE4((uint64_t)v253, v59, &qword_1EBBF5378);
      if (__swift_getEnumTagSinglePayload(v59, 1, v263) == 1)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v461;
      }
      uint64_t v449 = (uint64_t)v258;
      uint64_t v86 = *(void *)v59;
      sub_1C6626FE4(v59 + *(int *)(v452 + 48), v254, &qword_1EBBF5210);
      sub_1C6626FA0(v254, v84, &qword_1EBBF5210);
      sub_1C6626FA0(v254, v450, &qword_1EBBF5210);
      uint64_t v264 = v254;
      v265 = sub_1C68EC458();
      os_log_type_t v266 = sub_1C68ECE48();
      uint64_t v267 = v84;
      int v268 = v266;
      uint64_t v448 = (uint64_t)v265;
      if (os_log_type_enabled(v265, v266))
      {
        uint64_t v269 = swift_slowAlloc();
        uint64_t v443 = swift_slowAlloc();
        v459[0] = v443;
        *(_DWORD *)uint64_t v269 = v433;
        v456 = (void *)v86;
        LODWORD(v442) = v268;
        sub_1C68ED0C8();
        *(_WORD *)(v269 + 12) = 2080;
        v270 = v436;
        uint64_t v271 = v267;
        Contact.nameComponents.getter();
        uint64_t v272 = sub_1C68E97D8();
        uint64_t v274 = v273;
        v275 = v270;
        uint64_t v276 = v450;
        (*(void (**)(char *, uint64_t))v434)(v275, v437);
        sub_1C65B4078(v272, v274, (uint64_t)v459, v277, v278, v279, v280, v281, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
          v429);
        v456 = v282;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        uint64_t v283 = v271;
        sub_1C65C117C(v271, &qword_1EBBF5210);
        *(_WORD *)(v269 + 22) = 2080;
        uint64_t v284 = sub_1C67E4EA4();
        sub_1C65B4078(v284, v285, (uint64_t)v459, v286, v287, v288, v289, v290, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
          v429);
        v456 = v291;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        sub_1C65C117C(v276, &qword_1EBBF5210);
        id v292 = (id)v448;
        _os_log_impl(&dword_1C65AE000, (os_log_t)v448, (os_log_type_t)v442, "[UCG] Candidate [%ld] (\"%s\"): %s", (uint8_t *)v269, 0x20u);
        uint64_t v86 = v443;
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v86, -1, -1);
        uint64_t v293 = v269;
        unint64_t v59 = (unint64_t)v440;
        v253 = v441;
        MEMORY[0x1C87A54F0](v293, -1, -1);

        uint64_t v254 = v445;
        uint64_t v87 = sub_1C65C117C(v445, &qword_1EBBF5210);
        uint64_t v84 = v283;
      }
      else
      {

        sub_1C65C117C(v450, &qword_1EBBF5210);
        sub_1C65C117C(v267, &qword_1EBBF5210);
        uint64_t v87 = sub_1C65C117C(v264, &qword_1EBBF5210);
        uint64_t v84 = v267;
        uint64_t v254 = v264;
      }
      uint64_t v255 = (uint64_t)v444;
      uint64_t v90 = (uint64_t *)v449;
    }
  }
  swift_beginAccess();
  uint64_t v239 = (uint64_t)v461;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v239 = sub_1C681A348();
  }
  if (*(void *)(v239 + 16))
  {
    unint64_t v240 = v239
         + *((int *)v90 + 9)
         + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
    *(unsigned char *)(v240 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 224)) = 1;
    v461 = (void *)v239;
    swift_endAccess();
    goto LABEL_161;
  }
  __break(1u);
LABEL_250:
  swift_once();
LABEL_102:
  v182 = (void *)qword_1EBBF7B08;
  uint64_t v183 = v420;
  uint64_t v184 = v422;
  uint64_t v185 = v422 + *(int *)(v420 + 20);
  *(void *)uint64_t v185 = "ContactResolver.UCG.ASRE3";
  *(void *)(v185 + 8) = 25;
  v444 = (uint64_t *)v185;
  *(unsigned char *)(v185 + 16) = 2;
  id v186 = v182;
  sub_1C68EC438();
  uint64_t v443 = *(int *)(v183 + 24);
  *(void *)(v184 + v443) = v186;
  id v187 = v186;
  sub_1C68ECF98();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
  uint64_t v188 = swift_allocObject();
  long long v435 = xmmword_1C68F0550;
  *(_OWORD *)(v188 + 16) = xmmword_1C68F0550;
  uint64_t v189 = sub_1C68ED3B8();
  uint64_t v191 = v190;
  *(void *)(v188 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v188 + 64) = sub_1C66246B0();
  *(void *)(v188 + 32) = v189;
  *(void *)(v188 + 40) = v191;
  sub_1C68EC418();
  swift_bridgeObjectRelease();

  uint64_t v192 = v460[3];
  uint64_t v86 = v460[4];
  uint64_t v193 = v460[4] & 0x2000000000000000;
  uint64_t v194 = HIBYTE(v460[4]) & 0xFLL;
  uint64_t v195 = v460[3] & 0xFFFFFFFFFFFFLL;
  if ((v460[4] & 0x2000000000000000) != 0) {
    uint64_t v196 = HIBYTE(v460[4]) & 0xFLL;
  }
  else {
    uint64_t v196 = v460[3] & 0xFFFFFFFFFFFFLL;
  }
  if (!v196)
  {
    uint64_t v192 = v460[7];
    uint64_t v86 = v460[8];
    uint64_t v193 = v460[8] & 0x2000000000000000;
    uint64_t v194 = HIBYTE(v460[8]) & 0xFLL;
    uint64_t v195 = v460[7] & 0xFFFFFFFFFFFFLL;
    if (!((v460[8] & 0x2000000000000000) != 0 ? HIBYTE(v460[8]) & 0xFLL : v460[7] & 0xFFFFFFFFFFFFLL))
    {
      uint64_t v192 = v460[11];
      uint64_t v86 = v460[12];
      uint64_t v193 = v460[12] & 0x2000000000000000;
      uint64_t v194 = HIBYTE(v460[12]) & 0xFLL;
      uint64_t v195 = v460[11] & 0xFFFFFFFFFFFFLL;
    }
  }
  uint64_t v90 = (uint64_t *)v449;
  unint64_t v59 = (unint64_t)&OBJC_IVAR____TtC13SiriInference22MegadomeEntityFeatures_callPopularityGivenCoarseGeoHash;
  uint64_t v178 = v429;
  swift_bridgeObjectRetain();
  if (v193) {
    uint64_t v198 = v194;
  }
  else {
    uint64_t v198 = v195;
  }
  if (!v198)
  {
    swift_bridgeObjectRelease();
    uint64_t v84 = v431;
    goto LABEL_127;
  }
  v459[0] = v192;
  v459[1] = v86;
  v458[0] = 31868;
  v458[1] = 0xE200000000000000;
  sub_1C65C74BC();
  if (sub_1C68ED198())
  {
    v459[0] = v192;
    v459[1] = v86;
    uint64_t v199 = sub_1C68ED1A8();
    swift_bridgeObjectRelease();
    uint64_t v86 = *(void *)(v199 + 16);
    if (v86)
    {
      v459[0] = MEMORY[0x1E4FBC860];
      sub_1C669F7F0();
      v200 = (void *)v459[0];
      *(void *)&long long v435 = v199;
      uint64_t v201 = (uint64_t *)(v199 + 56);
      do
      {
        uint64_t v203 = *(v201 - 3);
        uint64_t v202 = *(v201 - 2);
        uint64_t v204 = *(v201 - 1);
        uint64_t v205 = *v201;
        swift_bridgeObjectRetain();
        uint64_t v206 = MEMORY[0x1C87A3880](v203, v202, v204, v205);
        uint64_t v208 = v207;
        swift_bridgeObjectRelease();
        v459[0] = v200;
        unint64_t v209 = v200[2];
        if (v209 >= v200[3] >> 1)
        {
          sub_1C669F7F0();
          v200 = (void *)v459[0];
        }
        v200[2] = v209 + 1;
        v210 = &v200[2 * v209];
        v210[4] = v206;
        v210[5] = v208;
        v201 += 4;
        --v86;
      }
      while (v86);
      swift_bridgeObjectRelease();
      uint64_t v90 = (uint64_t *)v449;
      unint64_t v59 = 0x1C68F6000;
      uint64_t v178 = v429;
    }
    else
    {
      swift_bridgeObjectRelease();
      v200 = (void *)MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6308);
    v200 = (void *)swift_allocObject();
    *((_OWORD *)v200 + 1) = v435;
    v200[4] = v192;
    v200[5] = v86;
  }
  swift_bridgeObjectRetain();
  char v211 = sub_1C68BC914();
  uint64_t v84 = v431;
  if (v211 == 3) {
    goto LABEL_126;
  }
  char v294 = v211;
  if (sub_1C68BC958(v211))
  {
    uint64_t v295 = sub_1C68CAB3C((uint64_t)v200);
    swift_bridgeObjectRelease();
    memcpy(v459, v460, sizeof(v459));
    uint64_t v296 = v447;
    uint64_t v297 = sub_1C68CAF08(v295, v459);
    uint64_t v447 = v296;
    if (v296)
    {
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_197;
    }
    uint64_t v338 = v297;
    uint64_t v426 = v295;
    v339 = sub_1C68EC458();
    os_log_type_t v340 = sub_1C68ECE48();
    if (os_log_type_enabled(v339, v340))
    {
      v341 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v341 = 0;
      _os_log_impl(&dword_1C65AE000, v339, v340, "[UCG][ASR-E3] Candidates:", v341, 2u);
      MEMORY[0x1C87A54F0](v341, -1, -1);
    }

    uint64_t v342 = *(void *)(v338 + 16);
    uint64_t v427 = v338;
    if (v342)
    {
      uint64_t v343 = v338 + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
      uint64_t v344 = *(void *)(v451 + 72);
      *(void *)&long long v434 = v424 + 8;
      swift_bridgeObjectRetain();
      *(void *)&long long v345 = 136315138;
      long long v430 = v345;
      uint64_t v428 = MEMORY[0x1E4FBC840] + 8;
      uint64_t v346 = v421;
      *(void *)&long long v435 = v344;
      do
      {
        sub_1C6626FA0(v343, v346, &qword_1EBBF5210);
        v347 = sub_1C68EC458();
        os_log_type_t v348 = sub_1C68ECE48();
        if (os_log_type_enabled(v347, v348))
        {
          uint64_t v349 = swift_slowAlloc();
          uint64_t v438 = swift_slowAlloc();
          v459[0] = v438;
          *(_DWORD *)uint64_t v349 = v430;
          v350 = v436;
          Contact.nameComponents.getter();
          uint64_t v351 = sub_1C68E97D8();
          uint64_t v353 = v352;
          v354 = v350;
          uint64_t v344 = v435;
          (*(void (**)(char *, uint64_t))v434)(v354, v437);
          sub_1C65B4078(v351, v353, (uint64_t)v459, v355, v356, v357, v358, v359, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
            v429);
          *(void *)(v349 + 4) = v360;
          uint64_t v90 = (uint64_t *)v449;
          swift_bridgeObjectRelease();
          sub_1C65C117C(v421, &qword_1EBBF5210);
          _os_log_impl(&dword_1C65AE000, v347, v348, "%s", (uint8_t *)v349, 0xCu);
          uint64_t v361 = v438;
          swift_arrayDestroy();
          MEMORY[0x1C87A54F0](v361, -1, -1);
          uint64_t v362 = v349;
          uint64_t v346 = v421;
          MEMORY[0x1C87A54F0](v362, -1, -1);
        }
        else
        {

          sub_1C65C117C(v346, &qword_1EBBF5210);
        }
        v343 += v344;
        --v342;
      }
      while (v342);
      uint64_t v338 = v427;
      swift_bridgeObjectRelease();
      unint64_t v59 = 0x1C68F6000;
    }
    v363 = v461;
    uint64_t v364 = v461[2];
    v365 = (void *)MEMORY[0x1E4FBC860];
    if (v364)
    {
      v459[0] = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      sub_1C669F7F0();
      uint64_t v366 = *(unsigned __int8 *)(v451 + 80);
      *(void *)&long long v435 = v363;
      uint64_t v367 = (uint64_t)v363 + ((v366 + 32) & ~v366);
      uint64_t v438 = *(void *)(v451 + 72);
      v365 = (void *)v459[0];
      do
      {
        v368 = v442;
        sub_1C6626FA0(v367, (uint64_t)v442, &qword_1EBBF5210);
        uint64_t v370 = *v368;
        uint64_t v369 = v368[1];
        swift_bridgeObjectRetain();
        sub_1C65C117C((uint64_t)v368, &qword_1EBBF5210);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C669F7F0();
          v365 = (void *)v459[0];
        }
        unint64_t v371 = v365[2];
        if (v371 >= v365[3] >> 1)
        {
          sub_1C669F7F0();
          v365 = (void *)v459[0];
        }
        v365[2] = v371 + 1;
        v372 = &v365[2 * v371];
        v372[4] = v370;
        v372[5] = v369;
        v367 += v438;
        --v364;
        uint64_t v90 = (uint64_t *)v449;
      }
      while (v364);
      swift_bridgeObjectRelease();
      unint64_t v59 = 0x1C68F6000;
      uint64_t v338 = v427;
    }
    swift_bridgeObjectRetain();
    uint64_t v373 = v447;
    uint64_t v374 = sub_1C68B81C0(v338, (uint64_t)v365);
    sub_1C6635758(v426, v365);
    uint64_t v86 = v375;
    uint64_t v447 = v373;
    swift_bridgeObjectRetain();
    sub_1C68BD004();
    swift_bridgeObjectRetain();
    v376 = sub_1C68EC458();
    os_log_type_t v377 = sub_1C68ECE48();
    if (os_log_type_enabled(v376, v377))
    {
      v378 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v378 = 134217984;
      uint64_t v379 = *(void *)(v374 + 16);
      swift_bridgeObjectRelease();
      v459[0] = v379;
      uint64_t v90 = (uint64_t *)v449;
      unint64_t v59 = 0x1C68F6000;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v376, v377, "[UCG][ASR-E3] Generated new (%ld) candidates from Euclid match and appending it in CRR since triggering condition is set to always", v378, 0xCu);
      MEMORY[0x1C87A54F0](v378, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v84 = v431;
    uint64_t v178 = v429;
LABEL_219:
    sub_1C68CA73C();
    goto LABEL_126;
  }
  if (sub_1C68BD800(v294))
  {
    v298 = sub_1C68EC458();
    os_log_type_t v299 = sub_1C68ECE48();
    uint64_t v86 = v299;
    if (os_log_type_enabled(v298, v299))
    {
      v300 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v300 = 134217984;
      swift_beginAccess();
      v459[0] = v461[2];
      unint64_t v59 = 0x1C68F6000;
      uint64_t v178 = v429;
      sub_1C68ED0C8();
      _os_log_impl(&dword_1C65AE000, v298, (os_log_type_t)v86, "[UCG][ASR-E3] Candidate count to CRR pre ASR-E3: %ld", v300, 0xCu);
      v301 = v300;
      uint64_t v84 = v431;
      MEMORY[0x1C87A54F0](v301, -1, -1);
    }

    swift_beginAccess();
    if (v461[2]) {
      goto LABEL_126;
    }
    uint64_t v302 = sub_1C68CAB3C((uint64_t)v200);
    swift_bridgeObjectRelease();
    memcpy(v459, v460, sizeof(v459));
    uint64_t v303 = v447;
    uint64_t v304 = sub_1C68CAF08(v302, v459);
    uint64_t v447 = v303;
    if (!v303)
    {
      uint64_t v305 = v304;
      uint64_t v428 = v302;
      v306 = sub_1C68EC458();
      os_log_type_t v307 = sub_1C68ECE48();
      if (os_log_type_enabled(v306, v307))
      {
        uint64_t v308 = v305;
        v309 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v309 = 0;
        _os_log_impl(&dword_1C65AE000, v306, v307, "[UCG][ASR-E3] Candidates:", v309, 2u);
        v310 = v309;
        uint64_t v305 = v308;
        MEMORY[0x1C87A54F0](v310, -1, -1);
      }

      uint64_t v311 = *(void *)(v305 + 16);
      if (v311)
      {
        uint64_t v312 = v305 + ((*(unsigned __int8 *)(v451 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v451 + 80));
        uint64_t v313 = *(void *)(v451 + 72);
        *(void *)&long long v435 = v424 + 8;
        uint64_t v427 = v305;
        swift_bridgeObjectRetain();
        *(void *)&long long v314 = 136315138;
        long long v434 = v314;
        *(void *)&long long v430 = MEMORY[0x1E4FBC840] + 8;
        uint64_t v315 = v418;
        uint64_t v438 = v313;
        do
        {
          sub_1C6626FA0(v312, v315, &qword_1EBBF5210);
          v316 = sub_1C68EC458();
          os_log_type_t v317 = sub_1C68ECE48();
          if (os_log_type_enabled(v316, v317))
          {
            uint64_t v318 = swift_slowAlloc();
            v442 = (uint64_t *)swift_slowAlloc();
            v459[0] = v442;
            *(_DWORD *)uint64_t v318 = v434;
            v319 = v436;
            Contact.nameComponents.getter();
            uint64_t v320 = sub_1C68E97D8();
            uint64_t v322 = v321;
            v323 = v319;
            uint64_t v313 = v438;
            (*(void (**)(char *, uint64_t))v435)(v323, v437);
            sub_1C65B4078(v320, v322, (uint64_t)v459, v324, v325, v326, v327, v328, v418, v419, v420, v421, v422, (uint64_t)v423, v424, v425, v426, v427, v428,
              v429);
            *(void *)(v318 + 4) = v329;
            uint64_t v90 = (uint64_t *)v449;
            swift_bridgeObjectRelease();
            sub_1C65C117C(v418, &qword_1EBBF5210);
            _os_log_impl(&dword_1C65AE000, v316, v317, "%s", (uint8_t *)v318, 0xCu);
            uint64_t v330 = (uint64_t)v442;
            swift_arrayDestroy();
            MEMORY[0x1C87A54F0](v330, -1, -1);
            uint64_t v331 = v318;
            uint64_t v315 = v418;
            MEMORY[0x1C87A54F0](v331, -1, -1);
          }
          else
          {

            sub_1C65C117C(v315, &qword_1EBBF5210);
          }
          v312 += v313;
          --v311;
        }
        while (v311);
        uint64_t v305 = v427;
        swift_bridgeObjectRelease();
        uint64_t v84 = v431;
        unint64_t v59 = 0x1C68F6000;
      }
      v461 = (void *)v305;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      v332 = sub_1C68EC458();
      os_log_type_t v333 = sub_1C68ECE48();
      if (os_log_type_enabled(v332, v333))
      {
        uint64_t v334 = v305;
        v335 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v335 = 134217984;
        uint64_t v336 = *(void *)(v334 + 16);
        swift_bridgeObjectRelease();
        v459[0] = v336;
        unint64_t v59 = 0x1C68F6000;
        uint64_t v84 = v431;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C65AE000, v332, v333, "[UCG][ASR-E3] Generated (%ld) candidates from Euclid match and appending it in CRR since triggering condition is set to noCandidatesInCrr", v335, 0xCu);
        MEMORY[0x1C87A54F0](v335, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v86 = v428;
      uint64_t v178 = v429;
      goto LABEL_219;
    }
  }
  else
  {
    if ((sub_1C68BD88C(v294) & 1) == 0) {
      goto LABEL_126;
    }
    uint64_t v86 = sub_1C68CAB3C((uint64_t)v200);
    swift_bridgeObjectRelease();
    memcpy(v459, v460, sizeof(v459));
    uint64_t v337 = v447;
    uint64_t v87 = sub_1C68CAF08(v86, v459);
    uint64_t v447 = v337;
    if (!v337) {
      goto LABEL_225;
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
LABEL_197:
  sub_1C68D8374(v422, (void (*)(void))type metadata accessor for Signpost);
  return swift_bridgeObjectRelease();
}

void sub_1C68C6ED0()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_133_0(v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5408);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C68F0550;
  OUTLINED_FUNCTION_133_0((void *)(v0 + 32));
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)&v34[0] = MEMORY[0x1E4FBC860];
  OUTLINED_FUNCTION_133_0(v36);
  swift_getKeyPath();
  long long v38 = v37;
  *(_OWORD *)__dst = v37;
  sub_1C65B537C(v41);
  sub_1C65B537C(v36);
  sub_1C663E728((uint64_t)&v38);
  sub_1C65C74BC();
  OUTLINED_FUNCTION_51_11();
  uint64_t v2 = sub_1C68ED1A8();
  sub_1C6620378((uint64_t)&v38);
  sub_1C65B537C(v36);
  swift_retain();
  uint64_t v3 = sub_1C68BA0B0(v2, v36);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C65B6550(v36);
  sub_1C68BD528(v3);
  swift_setDeallocating();
  sub_1C65C6F88();
  uint64_t v4 = *(void *)&v34[0];
  uint64_t v5 = *(void *)(*(void *)&v34[0] + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 32;
    while (1)
    {
      memcpy(__dst, (const void *)(v4 + v6), sizeof(__dst));
      swift_getKeyPath();
      long long v39 = *(_OWORD *)&__dst[88];
      v34[0] = *(_OWORD *)&__dst[88];
      sub_1C65B537C(__dst);
      sub_1C663E728((uint64_t)&v39);
      OUTLINED_FUNCTION_51_11();
      uint64_t v7 = sub_1C68ED1A8();
      sub_1C6620378((uint64_t)&v39);
      sub_1C65B537C(__dst);
      swift_retain();
      uint64_t v8 = sub_1C68BA0B0(v7, __dst);
      swift_release();
      swift_bridgeObjectRelease();
      sub_1C65B6550(__dst);
      uint64_t v9 = *(void *)(v8 + 16);
      uint64_t v10 = *(void *)(v1 + 16);
      if (__OFADD__(v10, v9)) {
        break;
      }
      if (!swift_isUniquelyReferenced_nonNull_native() || v10 + v9 > *(void *)(v1 + 24) >> 1)
      {
        sub_1C65C8A90();
        uint64_t v1 = v11;
      }
      if (*(void *)(v8 + 16))
      {
        OUTLINED_FUNCTION_85_2();
        if (v13 != v14) {
          goto LABEL_44;
        }
        unint64_t v15 = OUTLINED_FUNCTION_55_11(v1 + 264 * v12);
        BOOL v17 = v17 || v15 >= v16;
        if (!v17) {
          goto LABEL_48;
        }
        swift_arrayInitWithCopy();
        if (v9)
        {
          uint64_t v18 = *(void *)(v1 + 16);
          BOOL v14 = __OFADD__(v18, v9);
          uint64_t v19 = v18 + v9;
          if (v14) {
            goto LABEL_46;
          }
          *(void *)(v1 + 16) = v19;
        }
      }
      else if (v9)
      {
        goto LABEL_41;
      }
      swift_bridgeObjectRelease();
      v6 += 264;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
  }
  else
  {
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(v1 + 16);
    if (!v20)
    {
LABEL_39:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      return;
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = MEMORY[0x1E4FBC860];
    uint64_t v22 = 32;
    while (1)
    {
      memcpy(v34, (const void *)(v1 + v22), 0x108uLL);
      swift_getKeyPath();
      long long v40 = *(_OWORD *)((char *)&v34[1] + 8);
      sub_1C65B537C(v34);
      sub_1C663E728((uint64_t)&v40);
      OUTLINED_FUNCTION_51_11();
      uint64_t v23 = sub_1C68ED1A8();
      sub_1C6620378((uint64_t)&v40);
      sub_1C65B537C(v34);
      swift_retain();
      uint64_t v24 = sub_1C68BA0B0(v23, v34);
      swift_release();
      swift_bridgeObjectRelease();
      sub_1C65B6550(v34);
      uint64_t v25 = *(void *)(v24 + 16);
      uint64_t v26 = *(void *)(v21 + 16);
      if (__OFADD__(v26, v25)) {
        break;
      }
      if (!swift_isUniquelyReferenced_nonNull_native() || v26 + v25 > *(void *)(v21 + 24) >> 1)
      {
        sub_1C65C8A90();
        uint64_t v21 = v27;
      }
      if (*(void *)(v24 + 16))
      {
        OUTLINED_FUNCTION_85_2();
        if (v13 != v14) {
          goto LABEL_45;
        }
        unint64_t v29 = OUTLINED_FUNCTION_55_11(v21 + 264 * v28);
        if (!v17 && v29 < v30) {
          goto LABEL_48;
        }
        swift_arrayInitWithCopy();
        if (v25)
        {
          uint64_t v32 = *(void *)(v21 + 16);
          BOOL v14 = __OFADD__(v32, v25);
          uint64_t v33 = v32 + v25;
          if (v14) {
            goto LABEL_47;
          }
          *(void *)(v21 + 16) = v33;
        }
      }
      else if (v25)
      {
        goto LABEL_43;
      }
      swift_bridgeObjectRelease();
      v22 += 264;
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  OUTLINED_FUNCTION_8_85();
  OUTLINED_FUNCTION_70();
  __break(1u);
}

uint64_t sub_1C68C7370@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v204 = a3;
  uint64_t v201 = a2;
  uint64_t v188 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v187 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v202 = (uint64_t *)((char *)&v184 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v6);
  uint64_t v203 = (uint64_t)&v184 - v8;
  uint64_t v9 = sub_1C68EC448();
  uint64_t v189 = *(void *)(v9 - 8);
  uint64_t v190 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v196 = (char *)&v184 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Signpost();
  MEMORY[0x1F4188790](v11);
  char v13 = (char *)&v184 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v208, a1, 0x108uLL);
  if (qword_1EBBF68D0 != -1) {
    swift_once();
  }
  BOOL v14 = (void *)qword_1EBBF7B08;
  unint64_t v15 = &v13[*(int *)(v11 + 20)];
  *(void *)unint64_t v15 = "UCG.GenerateCandidatesForQuery";
  *((void *)v15 + 1) = 30;
  uint64_t v198 = v15;
  v15[16] = 2;
  id v16 = v14;
  sub_1C68EC438();
  uint64_t v197 = *(int *)(v11 + 24);
  *(void *)&v13[v197] = v16;
  id v17 = v16;
  sub_1C68ECF98();
  uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
  uint64_t v18 = swift_allocObject();
  long long v192 = xmmword_1C68F0550;
  *(_OWORD *)(v18 + 16) = xmmword_1C68F0550;
  uint64_t v19 = sub_1C68ED3B8();
  uint64_t v21 = v20;
  *(void *)(v18 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v191 = sub_1C66246B0();
  *(void *)(v18 + 64) = v191;
  *(void *)(v18 + 32) = v19;
  *(void *)(v18 + 40) = v21;
  uint64_t v182 = v18;
  char v181 = 2;
  uint64_t v180 = 22;
  uint64_t v199 = v13;
  sub_1C68EC418();
  swift_bridgeObjectRelease();

  type metadata accessor for ContactSearchResultCollector();
  swift_allocObject();
  uint64_t v22 = sub_1C68C0224();
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_1C68EC478();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)&unk_1EBBF7A68);
  sub_1C65B537C(v208);
  sub_1C65B537C(v208);
  id v200 = (id)v24;
  uint64_t v25 = sub_1C68EC458();
  os_log_type_t v26 = sub_1C68ECE48();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v205 = v22;
  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v209 = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    memcpy(v207, v208, sizeof(v207));
    uint64_t v30 = ContactQuery.description.getter();
    sub_1C65B4078(v30, v31, (uint64_t)&v209, v32, v33, v34, v35, v36, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
      v194);
    v207[0] = v37;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    sub_1C65B6550(v208);
    sub_1C65B6550(v208);
    _os_log_impl(&dword_1C65AE000, v25, v26, "[UCG] Looking at ASR candidate: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v29, -1, -1);
    MEMORY[0x1C87A54F0](v28, -1, -1);
  }
  else
  {
    sub_1C65B6550(v208);
    sub_1C65B6550(v208);
  }

  uint64_t v38 = v201;
  memcpy(v207, v208, sizeof(v207));
  if (sub_1C65C1034()) {
    goto LABEL_12;
  }
  uint64_t v39 = v208[19] & 0xFFFFFFFFFFFFLL;
  if ((v208[20] & 0x2000000000000000) != 0) {
    uint64_t v39 = HIBYTE(v208[20]) & 0xFLL;
  }
  if (v39)
  {
LABEL_12:
    memcpy(v207, v208, sizeof(v207));
    long long v40 = (void *)sub_1C65C6D90();
    MEMORY[0x1F4188790](v40);
    uint64_t v182 = v38;
    v207[0] = sub_1C68BC354((void (*)(uint64_t *__return_ptr, void *))sub_1C68D86A8, (uint64_t)&v180, (uint64_t)v40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
    sub_1C666EF30((unint64_t *)&qword_1EBBF6848, &qword_1EBBF6840);
    uint64_t v41 = sub_1C68EC818();
    uint64_t v43 = v42;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1C68EC458();
    os_log_type_t v45 = sub_1C68ECE48();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      id v185 = (id)swift_slowAlloc();
      v207[0] = (uint64_t)v185;
      *(_DWORD *)uint64_t v46 = 136315394;
      id v186 = (uint8_t *)v41;
      uint64_t v47 = swift_bridgeObjectRetain();
      uint64_t v48 = MEMORY[0x1C87A3B40](v47, MEMORY[0x1E4FBB1A0]);
      uint64_t v195 = v40;
      uint64_t v50 = v49;
      swift_bridgeObjectRelease();
      sub_1C65B4078(v48, v50, (uint64_t)v207, v51, v52, v53, v54, v55, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
        v194);
      uint64_t v209 = v56;
      uint64_t v41 = (uint64_t)v186;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      long long v40 = v195;
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v41, v43, (uint64_t)v207, v57, v58, v59, v60, v61, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
        v194);
      uint64_t v209 = v62;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v44, v45, "[UCG] Searching for contacts by name tokens: %s (\"%s\")", (uint8_t *)v46, 0x16u);
      id v63 = v185;
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v63, -1, -1);
      MEMORY[0x1C87A54F0](v46, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v70 = v206;
    sub_1C68CB6F0(v41, v43, v64, v65, v66, v67, v68, v69, v184, v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
      v194);
    if (v70)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
LABEL_65:
      uint64_t v172 = (uint64_t)v199;
      sub_1C68ECF88();
      sub_1C68EC428();
      uint64_t v173 = v172;
      return sub_1C68D8374(v173, (void (*)(void))type metadata accessor for Signpost);
    }
    uint64_t v72 = v71;
    uint64_t v195 = v40;
    uint64_t v206 = 0;
    swift_bridgeObjectRelease();
    uint64_t v73 = *(void *)(v72 + 16);
    if (v73)
    {
      uint64_t v74 = (uint64_t *)(v72 + 64);
      do
      {
        uint64_t v75 = *(v74 - 4);
        uint64_t v76 = *(v74 - 3);
        uint64_t v77 = *(v74 - 2);
        uint64_t v78 = *(v74 - 1);
        uint64_t v79 = *v74;
        v74 += 5;
        v207[0] = v75;
        v207[1] = v76;
        v207[2] = v77;
        v207[3] = v78;
        v207[4] = v79;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C68C029C(v207);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        --v73;
      }
      while (v73);
    }
    swift_bridgeObjectRelease();
    uint64_t v80 = v195[2];
    if (v80)
    {
      uint64_t v82 = v195[4];
      uint64_t v81 = v195[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v80 == 1)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v83 = sub_1C68EC458();
        os_log_type_t v84 = sub_1C68ECE48();
        if (os_log_type_enabled(v83, v84))
        {
          unint64_t v85 = (uint8_t *)swift_slowAlloc();
          uint64_t v86 = swift_slowAlloc();
          v207[0] = v86;
          *(_DWORD *)unint64_t v85 = 136315138;
          swift_bridgeObjectRetain();
          sub_1C65B4078(v82, v81, (uint64_t)v207, v87, v88, v89, v90, v91, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
            v194);
          uint64_t v209 = v92;
          sub_1C68ED0C8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C65AE000, v83, v84, "[UCG] Searching for contacts by relationship using name field as relationship label: %s", v85, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C87A54F0](v86, -1, -1);
          MEMORY[0x1C87A54F0](v85, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v207[0] = v82;
        v207[1] = v81;
        uint64_t v128 = sub_1C68ECB08();
        v207[0] = 0;
        v207[1] = v128;
        v207[2] = v129;
        type metadata accessor for ContactResolverConfig(0);
        uint64_t v130 = v206;
        sub_1C68CDAE4();
        uint64_t v206 = v130;
        if (v130)
        {
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_65;
        }
        uint64_t v132 = *(void *)(v131 + 16);
        if (v132)
        {
          uint64_t v133 = (uint64_t *)(v131 + 64);
          do
          {
            uint64_t v134 = *(v133 - 4);
            uint64_t v135 = *(v133 - 3);
            uint64_t v136 = *(v133 - 2);
            uint64_t v137 = *(v133 - 1);
            uint64_t v138 = *v133;
            v133 += 5;
            v207[0] = v134;
            v207[1] = v135;
            v207[2] = v136;
            v207[3] = v137;
            v207[4] = v138;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1C68C029C(v207);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            --v132;
          }
          while (v132);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_25:
  uint64_t v93 = v208[23];
  if (v208[23])
  {
    uint64_t v94 = v208[22];
    uint64_t v95 = HIBYTE(v208[23]) & 0xFLL;
    if ((v208[23] & 0x2000000000000000) == 0) {
      uint64_t v95 = v208[22] & 0xFFFFFFFFFFFFLL;
    }
    if (v95)
    {
      uint64_t v96 = (void *)v208[21];
      sub_1C65B54A8(v208[21], v208[22], v208[23]);
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_1C68EC458();
      os_log_type_t v98 = sub_1C68ECE48();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = (uint8_t *)swift_slowAlloc();
        uint64_t v100 = swift_slowAlloc();
        v207[0] = v100;
        uint64_t v195 = v96;
        *(_DWORD *)uint64_t v99 = 136315138;
        id v186 = v99 + 4;
        swift_bridgeObjectRetain();
        sub_1C65B4078(v94, v93, (uint64_t)v207, v101, v102, v103, v104, v105, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
          v194);
        uint64_t v209 = v106;
        uint64_t v96 = v195;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        sub_1C65B6684((uint64_t)v96, v94, v93);
        _os_log_impl(&dword_1C65AE000, v97, v98, "[UCG] Searching for contacts by relationship label: %s", v99, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v100, -1, -1);
        MEMORY[0x1C87A54F0](v99, -1, -1);
      }
      else
      {
        sub_1C65B6684((uint64_t)v96, v94, v93);
      }

      v207[0] = (uint64_t)v96;
      v207[1] = v94;
      v207[2] = v93;
      type metadata accessor for ContactResolverConfig(0);
      uint64_t v107 = v206;
      sub_1C68CDAE4();
      if (v107)
      {
        swift_release();
        uint64_t v109 = v96;
LABEL_49:
        sub_1C65B6684((uint64_t)v109, v94, v93);
        goto LABEL_65;
      }
      uint64_t v195 = v96;
      id v186 = (uint8_t *)v94;
      uint64_t v206 = 0;
      uint64_t v110 = *(void *)(v108 + 16);
      if (v110)
      {
        unint64_t v111 = (uint64_t *)(v108 + 64);
        do
        {
          uint64_t v112 = *(v111 - 4);
          uint64_t v113 = *(v111 - 3);
          uint64_t v114 = *(v111 - 2);
          uint64_t v115 = *(v111 - 1);
          uint64_t v116 = *v111;
          v111 += 5;
          v207[0] = v112;
          v207[1] = v113;
          v207[2] = v114;
          v207[3] = v115;
          v207[4] = v116;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C68C029C(v207);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          --v110;
        }
        while (v110);
      }
      swift_bridgeObjectRelease();
      uint64_t v117 = v195;
      uint64_t v94 = (uint64_t)v186;
      sub_1C65B54A8((uint64_t)v195, (uint64_t)v186, v93);
      v118 = sub_1C68EC458();
      os_log_type_t v119 = sub_1C68ECE48();
      if (os_log_type_enabled(v118, v119))
      {
        char v120 = (uint8_t *)swift_slowAlloc();
        uint64_t v121 = swift_slowAlloc();
        v207[0] = v121;
        *(_DWORD *)char v120 = 136315138;
        swift_bridgeObjectRetain();
        sub_1C65B4078((uint64_t)v186, v93, (uint64_t)v207, v122, v123, v124, v125, v126, v184, (unint64_t)v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
          v194);
        uint64_t v209 = v127;
        uint64_t v94 = (uint64_t)v186;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        sub_1C65B6684((uint64_t)v117, v94, v93);
        _os_log_impl(&dword_1C65AE000, v118, v119, "[UCG] Searching for contacts by name using the relationship label as a search term: %s", v120, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v121, -1, -1);
        MEMORY[0x1C87A54F0](v120, -1, -1);
      }
      else
      {
        sub_1C65B6684((uint64_t)v117, v94, v93);
      }

      uint64_t v139 = v206;
      sub_1C68CB6F0(v94, v93, v140, v141, v142, v143, v144, v145, v184, v185, (uint64_t)v186, v187, (uint64_t)v188, v189, v190, v191, v192, *((uint64_t *)&v192 + 1), v193,
        v194);
      if (v139)
      {
        swift_release();
        uint64_t v109 = v195;
        goto LABEL_49;
      }
      uint64_t v206 = 0;
      uint64_t v147 = *(void *)(v146 + 16);
      if (v147)
      {
        uint64_t v148 = (uint64_t *)(v146 + 64);
        do
        {
          uint64_t v149 = *(v148 - 4);
          uint64_t v150 = *(v148 - 3);
          uint64_t v151 = *(v148 - 2);
          uint64_t v152 = *(v148 - 1);
          uint64_t v153 = *v148;
          v148 += 5;
          v207[0] = v149;
          v207[1] = v150;
          v207[2] = v151;
          v207[3] = v152;
          v207[4] = v153;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C68C029C(v207);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          --v147;
        }
        while (v147);
      }
      swift_bridgeObjectRelease();
      sub_1C65B6684((uint64_t)v195, (uint64_t)v186, v93);
    }
  }
  id v154 = (id)qword_1EBBF7B08;
  sub_1C68EC438();
  sub_1C68ECF98();
  uint64_t v155 = swift_allocObject();
  *(_OWORD *)(v155 + 16) = v192;
  uint64_t v156 = sub_1C68ED3B8();
  unint64_t v157 = v191;
  *(void *)(v155 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v155 + 64) = v157;
  *(void *)(v155 + 32) = v156;
  *(void *)(v155 + 40) = v158;
  uint64_t v182 = v155;
  char v181 = 2;
  uint64_t v180 = 22;
  sub_1C68EC418();
  swift_bridgeObjectRelease();
  memcpy(v207, v208, sizeof(v207));
  uint64_t v159 = (void *)sub_1C68C0AC4(v207);
  uint64_t v160 = v159[2];
  if (v160)
  {
    id v200 = v154;
    v207[0] = MEMORY[0x1E4FBC860];
    sub_1C669FB20();
    unint64_t v161 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
    uint64_t v195 = v159;
    uint64_t v162 = (uint64_t)v159 + v161;
    uint64_t v163 = *(void *)(v187 + 72);
    uint64_t v164 = v203;
    while (1)
    {
      uint64_t v165 = v202;
      sub_1C6626FA0(v162, (uint64_t)v202, &qword_1EBBF5210);
      uint64_t v166 = v206;
      sub_1C68C8750(v165, v204, (uint64_t)&v209, v164);
      uint64_t v206 = v166;
      if (v166) {
        break;
      }
      sub_1C65C117C((uint64_t)v165, &qword_1EBBF5210);
      uint64_t v167 = v207[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C669FB20();
        uint64_t v167 = v207[0];
      }
      unint64_t v168 = *(void *)(v167 + 16);
      if (v168 >= *(void *)(v167 + 24) >> 1)
      {
        sub_1C669FB20();
        uint64_t v167 = v207[0];
      }
      *(void *)(v167 + 16) = v168 + 1;
      uint64_t v169 = v167 + v161 + v168 * v163;
      uint64_t v164 = v203;
      sub_1C6626FE4(v203, v169, &qword_1EBBF5210);
      v162 += v163;
      if (!--v160)
      {
        uint64_t v175 = swift_bridgeObjectRelease();
        id v154 = v200;
        goto LABEL_67;
      }
    }
    sub_1C65C117C((uint64_t)v165, &qword_1EBBF5210);
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C68ECF88();
    uint64_t v170 = v200;
    uint64_t v171 = v196;
    sub_1C68EC428();
    (*(void (**)(char *, uint64_t))(v189 + 8))(v171, v190);
    swift_release();

    goto LABEL_65;
  }
  uint64_t v175 = swift_bridgeObjectRelease();
LABEL_67:
  MEMORY[0x1F4188790](v175);
  uint64_t v182 = v204;
  uint64_t v183 = v201;
  sub_1C6815AC8();
  uint64_t v177 = v176;
  swift_bridgeObjectRelease();
  sub_1C68ECF88();
  uint64_t v178 = v196;
  sub_1C68EC428();
  (*(void (**)(char *, uint64_t))(v189 + 8))(v178, v190);
  swift_release();

  void *v188 = v177;
  sub_1C68ECF88();
  uint64_t v179 = (uint64_t)v199;
  sub_1C68EC428();
  uint64_t v173 = v179;
  return sub_1C68D8374(v173, (void (*)(void))type metadata accessor for Signpost);
}

uint64_t sub_1C68C8624@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43F0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[1];
  v16[0] = *a1;
  v16[1] = v9;
  uint64_t v10 = a2 + *(int *)(type metadata accessor for ContactResolverConfig(0) + 32);
  uint64_t v11 = sub_1C68E9C68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v11);
  sub_1C65C74BC();
  uint64_t v12 = sub_1C68ED108();
  uint64_t v14 = v13;
  uint64_t result = sub_1C65C117C((uint64_t)v8, &qword_1EBBF43F0);
  *a3 = v12;
  a3[1] = v14;
  return result;
}

uint64_t sub_1C68C8750@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v234 = a3;
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v8 = MEMORY[0x1F4188790](v233);
  uint64_t v226 = (uint64_t *)((char *)&v217 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v232 = (uint64_t)&v217 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v231 = ((char *)&v217 - v13);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v230 = (uint64_t)&v217 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v229 = (uint64_t)&v217 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  unint64_t v228 = (uint64_t *)((char *)&v217 - v19);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v227 = (uint64_t *)((char *)&v217 - v21);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v217 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF52B0);
  MEMORY[0x1F4188790](v24 - 8);
  os_log_type_t v26 = (char *)&v217 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40AF88);
  uint64_t v28 = MEMORY[0x1F4188790](v27 - 8);
  uint64_t v30 = (char *)&v217 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v28);
  uint64_t v32 = (char *)&v217 - v31;
  sub_1C6626FA0(a2 + 56, (uint64_t)&v240, &qword_1EA40B3A0);
  if (!v241)
  {
    sub_1C65C117C((uint64_t)&v240, &qword_1EA40B3A0);
    return sub_1C6626FA0((uint64_t)a1, a4, &qword_1EBBF5210);
  }
  uint64_t v223 = a2;
  uint64_t v224 = v32;
  sub_1C65C490C(&v240, (uint64_t)v242);
  uint64_t v33 = *a1;
  unint64_t v34 = a1[1];
  uint64_t v35 = HIBYTE(v34) & 0xF;
  if ((v34 & 0x2000000000000000) == 0) {
    uint64_t v35 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v35)
  {
LABEL_22:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v242);
    return sub_1C6626FA0((uint64_t)a1, a4, &qword_1EBBF5210);
  }
  unint64_t v225 = a1;
  uint64_t v222 = a4;
  uint64_t v37 = v243;
  uint64_t v36 = v244;
  __swift_project_boxed_opaque_existential_1(v242, v243);
  uint64_t v38 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v36 + 24))(v33, v34, v37, v36);
  if (v4)
  {
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v242);
    *(void *)uint64_t v234 = v4;
    return result;
  }
  if (v38)
  {
    id v40 = v38;
    sub_1C667A62C();
    uint64_t v41 = type metadata accessor for Contact();
    __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v41);
  }
  else
  {
    uint64_t v43 = type metadata accessor for Contact();
    uint64_t v42 = __swift_storeEnumTagSinglePayload((uint64_t)v26, 1, 1, v43);
  }
  a1 = v225;
  MEMORY[0x1F4188790](v42);
  *(&v217 - 2) = (uint64_t)a1;
  uint64_t v44 = (uint64_t)v224;
  sub_1C68BC1B4((void (*)(char *))sub_1C68D86B0, (uint64_t)v224);
  sub_1C65C117C((uint64_t)v26, &qword_1EBBF52B0);
  sub_1C6626FA0(v44, (uint64_t)v30, &qword_1EA40AF88);
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v233) == 1)
  {
    sub_1C65C117C((uint64_t)v30, &qword_1EA40AF88);
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_1C68EC478();
    __swift_project_value_buffer(v45, (uint64_t)&unk_1EBBF7A68);
    uint64_t v46 = v227;
    sub_1C6626FA0((uint64_t)a1, (uint64_t)v227, &qword_1EBBF5210);
    uint64_t v47 = sub_1C68EC458();
    os_log_type_t v48 = sub_1C68ECE48();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(void *)&long long v240 = v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      uint64_t v221 = 0;
      uint64_t v51 = *v46;
      uint64_t v52 = v46[1];
      swift_bridgeObjectRetain();
      sub_1C65B4078(v51, v52, (uint64_t)&v240, v53, v54, v55, v56, v57, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
        (uint64_t)v228);
      v239[0] = v58;
      sub_1C68ED0C8();
      a1 = v225;
      swift_bridgeObjectRelease();
      sub_1C65C117C((uint64_t)v46, &qword_1EBBF5210);
      _os_log_impl(&dword_1C65AE000, v47, v48, "[UCG] Unable to find candidate %s in the contact store. Skipping hydration of it...", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v50, -1, -1);
      MEMORY[0x1C87A54F0](v49, -1, -1);

      uint64_t v59 = (uint64_t)v224;
    }
    else
    {

      sub_1C65C117C((uint64_t)v46, &qword_1EBBF5210);
      uint64_t v59 = v44;
    }
    sub_1C65C117C(v59, &qword_1EA40AF88);
    a4 = v222;
    goto LABEL_22;
  }
  sub_1C6626FE4((uint64_t)v30, (uint64_t)v23, &qword_1EBBF5210);
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_1C68EC478();
  uint64_t v61 = __swift_project_value_buffer(v60, (uint64_t)&unk_1EBBF7A68);
  uint64_t v62 = v228;
  sub_1C6626FA0((uint64_t)a1, (uint64_t)v228, &qword_1EBBF5210);
  uint64_t v219 = v61;
  id v63 = sub_1C68EC458();
  os_log_type_t v64 = sub_1C68ECE48();
  BOOL v65 = os_log_type_enabled(v63, v64);
  uint64_t v221 = 0;
  if (v65)
  {
    uint64_t v66 = swift_slowAlloc();
    uint64_t v234 = swift_slowAlloc();
    *(void *)&long long v240 = v234;
    *(_DWORD *)uint64_t v66 = 136315394;
    uint64_t v67 = *v62;
    uint64_t v68 = v62[1];
    swift_bridgeObjectRetain();
    sub_1C65B4078(v67, v68, (uint64_t)&v240, v69, v70, v71, v72, v73, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    v239[0] = v74;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    sub_1C65C117C((uint64_t)v62, &qword_1EBBF5210);
    *(_WORD *)(v66 + 12) = 2080;
    swift_beginAccess();
    uint64_t v75 = Contact.description.getter();
    sub_1C65B4078(v75, v76, (uint64_t)&v240, v77, v78, v79, v80, v81, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    v239[0] = v82;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v63, v64, "[UCG] Found candidate %s in address book: %s", (uint8_t *)v66, 0x16u);
    uint64_t v83 = v234;
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v83, -1, -1);
    MEMORY[0x1C87A54F0](v66, -1, -1);
  }
  else
  {
    sub_1C65C117C((uint64_t)v62, &qword_1EBBF5210);
  }

  uint64_t v84 = v233;
  unint64_t v85 = (char *)v225 + *(int *)(v233 + 36);
  memcpy(v245, v85 + 8, 0x108uLL);
  uint64_t v86 = (void *)(v223 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer);
  __swift_project_boxed_opaque_existential_1(v86, v86[3]);
  sub_1C65B537C(v245);
  sub_1C66879F4();
  unint64_t v228 = (uint64_t *)v87;
  sub_1C65B6550(v245);
  uint64_t v234 = type metadata accessor for ContactResolver.SignalSet(0);
  uint64_t v88 = &v85[*(int *)(v234 + 132)];
  uint64_t v89 = *((void *)v88 + 4);
  unint64_t v220 = v86;
  if (v89)
  {
    uint64_t v90 = *((void *)v88 + 3);
    uint64_t v91 = v86[3];
    uint64_t v92 = v86[4];
    __swift_project_boxed_opaque_existential_1(v86, v91);
    swift_bridgeObjectRetain();
    uint64_t v93 = sub_1C689BA74(v90, v89, v91, v92);
    uint64_t v94 = sub_1C6688970(v93);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v94 = 0;
  }
  uint64_t v95 = v229;
  sub_1C6626FA0((uint64_t)v225, v229, &qword_1EBBF5210);
  uint64_t v96 = v220;
  if (!v94)
  {
    __swift_project_boxed_opaque_existential_1(v220, v220[3]);
    sub_1C6687D14();
    uint64_t v94 = v97;
  }
  uint64_t v227 = (uint64_t *)v94;
  sub_1C65C117C(v95, &qword_1EBBF5210);
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(v96, v96[3]);
  sub_1C6687D14();
  uint64_t v229 = v98;
  uint64_t v99 = *((void *)v88 + 6);
  if (v99)
  {
    uint64_t v100 = *((void *)v88 + 5);
    uint64_t v101 = v96[3];
    uint64_t v102 = v96[4];
    __swift_project_boxed_opaque_existential_1(v96, v101);
    swift_bridgeObjectRetain();
    uint64_t v103 = sub_1C689BA74(v100, v99, v101, v102);
    uint64_t v104 = sub_1C6688970(v103);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v104 = 0;
  }
  uint64_t v105 = v230;
  uint64_t v106 = (uint64_t *)v231;
  sub_1C6626FA0((uint64_t)v225, v230, &qword_1EBBF5210);
  uint64_t v107 = v229;
  if (!v104)
  {
    __swift_project_boxed_opaque_existential_1(v96, v96[3]);
    sub_1C6687D14();
    uint64_t v104 = v108;
  }
  sub_1C65C117C(v105, &qword_1EBBF5210);
  sub_1C6626FA0((uint64_t)v225, (uint64_t)v106, &qword_1EBBF5210);
  swift_bridgeObjectRetain_n();
  uint64_t v109 = (uint64_t)v227;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v110 = sub_1C68EC458();
  os_log_type_t v111 = sub_1C68ECE48();
  uint64_t v231 = v110;
  LODWORD(v230) = v111;
  if (os_log_type_enabled(v110, v111))
  {
    uint64_t v112 = swift_slowAlloc();
    unint64_t v218 = swift_slowAlloc();
    v239[0] = v218;
    *(_DWORD *)uint64_t v112 = 136316162;
    uint64_t v113 = *v106;
    uint64_t v114 = v106[1];
    swift_bridgeObjectRetain();
    sub_1C65B4078(v113, v114, (uint64_t)v239, v115, v116, v117, v118, v119, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    uint64_t v238 = v120;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    sub_1C65C117C((uint64_t)v106, &qword_1EBBF5210);
    *(_WORD *)(v112 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v121 = sub_1C68ECD68();
    uint64_t v123 = v122;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v121, v123, (uint64_t)v239, v124, v125, v126, v127, v128, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    uint64_t v238 = v129;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v130 = sub_1C68ECD68();
    uint64_t v132 = v131;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v130, v132, (uint64_t)v239, v133, v134, v135, v136, v137, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    uint64_t v238 = v138;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v139 = sub_1C68ECD68();
    uint64_t v141 = v140;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v139, v141, (uint64_t)v239, v142, v143, v144, v145, v146, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    uint64_t v238 = v147;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 42) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v148 = sub_1C68ECD68();
    uint64_t v150 = v149;
    swift_bridgeObjectRelease();
    uint64_t v151 = v148;
    uint64_t v84 = v233;
    sub_1C65B4078(v151, v150, (uint64_t)v239, v152, v153, v154, v155, v156, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
      (uint64_t)v228);
    uint64_t v238 = v157;
    uint64_t v107 = v229;
    uint64_t v158 = (uint64_t)v225;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v159 = v231;
    _os_log_impl(&dword_1C65AE000, v231, (os_log_type_t)v230, "[UCG] Candidate %s match:\n  queryTokens=%s matchedQueryTokens=%s\n  contactTokens=%s matchedContactTokens=%s", (uint8_t *)v112, 0x34u);
    unint64_t v160 = v218;
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v160, -1, -1);
    MEMORY[0x1C87A54F0](v112, -1, -1);

    uint64_t v109 = (uint64_t)v227;
  }
  else
  {
    sub_1C65C117C((uint64_t)v106, &qword_1EBBF5210);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v158 = (uint64_t)v225;
  }
  char v161 = sub_1C6816200(v104, v107);
  swift_bridgeObjectRelease();
  uint64_t v162 = v232;
  sub_1C6626FA0(v158, v232, &qword_1EBBF5210);
  if (v161) {
    char v163 = *(unsigned char *)(v162 + *(int *)(v84 + 36) + 335) ^ 1;
  }
  else {
    char v163 = 0;
  }
  sub_1C65C117C(v162, &qword_1EBBF5210);
  swift_beginAccess();
  uint64_t v164 = &v23[*(int *)(v84 + 36)];
  v164[334] = v163 & 1;
  uint64_t v165 = v234;
  uint64_t v166 = &v164[*(int *)(v234 + 132)];
  v166[9] = v163 & 1;
  *(void *)uint64_t v166 = *(void *)(v107 + 16);
  swift_bridgeObjectRelease();
  uint64_t v167 = (uint64_t)v228;
  char v168 = sub_1C6816200(v109, (uint64_t)v228);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v169 = &v23[*(int *)(v84 + 36)];
  v169[333] = v168 & 1;
  v169[*(int *)(v165 + 132) + 8] = v168 & 1;
  uint64_t v170 = *((void *)v23 + 15);
  unint64_t v171 = *((void *)v23 + 16);
  uint64_t v172 = HIBYTE(v171) & 0xF;
  if ((v171 & 0x2000000000000000) == 0) {
    uint64_t v172 = v170 & 0xFFFFFFFFFFFFLL;
  }
  if (v172)
  {
    uint64_t v173 = v158;
    uint64_t v174 = v220[3];
    uint64_t v175 = v220[4];
    __swift_project_boxed_opaque_existential_1(v220, v174);
    swift_bridgeObjectRetain();
    uint64_t v176 = v175;
    uint64_t v158 = v173;
    uint64_t v84 = v233;
    uint64_t v177 = sub_1C689BA74(v170, v171, v174, v176);
    swift_bridgeObjectRelease();
    uint64_t v178 = sub_1C6688970(v177);
    char v179 = sub_1C6816200(v178, v167);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v179)
    {
      uint64_t v180 = v226;
      sub_1C6626FA0(v158, (uint64_t)v226, &qword_1EBBF5210);
      char v181 = sub_1C68EC458();
      os_log_type_t v182 = sub_1C68ECE48();
      if (os_log_type_enabled(v181, v182))
      {
        uint64_t v183 = (uint8_t *)swift_slowAlloc();
        uint64_t v232 = swift_slowAlloc();
        v237[0] = v232;
        *(_DWORD *)uint64_t v183 = 136315138;
        uint64_t v184 = *v180;
        uint64_t v185 = v180[1];
        swift_bridgeObjectRetain();
        sub_1C65B4078(v184, v185, (uint64_t)v237, v186, v187, v188, v189, v190, v217, v218, v219, (uint64_t)v220, v221, v222, v223, (uint64_t)v224, (uint64_t)v225, (uint64_t)v226, (uint64_t)v227,
          (uint64_t)v228);
        uint64_t v236 = v191;
        uint64_t v84 = v233;
        uint64_t v192 = (uint64_t)v225;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        sub_1C65C117C((uint64_t)v180, &qword_1EBBF5210);
        _os_log_impl(&dword_1C65AE000, v181, v182, "[UCG] Candidate %s is an exact nickname match. Overriding exact match signals...", v183, 0xCu);
        uint64_t v193 = v232;
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v193, -1, -1);
        uint64_t v194 = v183;
        uint64_t v158 = v192;
        MEMORY[0x1C87A54F0](v194, -1, -1);
      }
      else
      {
        sub_1C65C117C((uint64_t)v180, &qword_1EBBF5210);
      }

      swift_beginAccess();
      uint64_t v195 = &v23[*(int *)(v84 + 36)];
      v195[333] = 1;
      v195[*(int *)(v234 + 132) + 8] = 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v23[*(int *)(v84 + 36) + *(int *)(v234 + 236)] = 1;
  *((void *)v23 + 27) = *(void *)(v158 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C690DE60;
  *(void *)(inited + 32) = swift_getKeyPath();
  *(void *)(inited + 40) = swift_getKeyPath();
  *(void *)(inited + 48) = swift_getKeyPath();
  uint64_t v236 = inited;
  sub_1C68ECC18();
  uint64_t v197 = v236;
  sub_1C66749C8(0, (v236 & 0xC000000000000001) == 0, v236);
  sub_1C66749C8(2uLL, (v197 & 0xC000000000000001) == 0, v197);
  uint64_t v198 = 0;
  do
  {
    if ((v197 & 0xC000000000000001) != 0) {
      MEMORY[0x1C87A4300](v198, v197);
    }
    else {
      swift_retain();
    }
    swift_beginAccess();
    swift_getAtKeyPath();
    char v199 = v235;
    swift_endAccess();
    if (v199) {
      char v200 = 1;
    }
    else {
      char v200 = v23[*(int *)(v84 + 36) + *(int *)(v234 + 144)];
    }
    ++v198;
    swift_beginAccess();
    char v235 = v200;
    swift_setAtWritableKeyPath();
    swift_endAccess();
    swift_release();
  }
  while (v198 != 3);
  swift_bridgeObjectRelease();
  uint64_t v201 = *(void **)(v223 + 104);
  if (!v201)
  {
    sub_1C65C117C((uint64_t)v224, &qword_1EA40AF88);
    goto LABEL_72;
  }
  uint64_t v203 = *(void *)v23;
  uint64_t v202 = *((void *)v23 + 1);
  id v204 = v201;
  swift_bridgeObjectRetain();
  id v205 = objc_msgSend(v204, sel_identifier);
  uint64_t v206 = sub_1C68EC898();
  uint64_t v208 = v207;

  if (v203 == v206 && v202 == v208)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v211 = v233;
LABEL_67:
    id v212 = objc_msgSend(v204, sel_identifier);
    uint64_t v213 = sub_1C68EC898();
    unint64_t v215 = v214;

    swift_bridgeObjectRelease();
    if ((v215 & 0x2000000000000000) != 0) {
      uint64_t v216 = HIBYTE(v215) & 0xF;
    }
    else {
      uint64_t v216 = v213 & 0xFFFFFFFFFFFFLL;
    }
    sub_1C65C117C((uint64_t)v224, &qword_1EA40AF88);
    if (v216)
    {
      swift_beginAccess();
      v23[16] = 1;
      v23[*(int *)(v211 + 36) + *(int *)(v234 + 136)] = 1;
    }
    goto LABEL_72;
  }
  char v210 = sub_1C68ED7E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v211 = v233;
  if (v210) {
    goto LABEL_67;
  }
  sub_1C65C117C((uint64_t)v224, &qword_1EA40AF88);

LABEL_72:
  sub_1C6626FA0((uint64_t)v23, v222, &qword_1EBBF5210);
  sub_1C65C117C((uint64_t)v23, &qword_1EBBF5210);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v242);
}

uint64_t sub_1C68C9B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1C65DCFC4(a1, a3);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  return sub_1C65DCFC4(a2 + *(int *)(v5 + 36), a3 + *(int *)(v5 + 36));
}

uint64_t sub_1C68C9BAC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C68C9BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v73 = a3;
  uint64_t v5 = type metadata accessor for ContactResolver.SignalSet(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  unint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (uint64_t *)((char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1C68EC478();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)&unk_1EBBF7A68);
  sub_1C6626FA0(a1, (uint64_t)v11, &qword_1EBBF5210);
  unint64_t v75 = v13;
  uint64_t v14 = sub_1C68EC458();
  os_log_type_t v15 = sub_1C68ECE48();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v71 = v7;
  uint64_t v72 = v5;
  uint64_t v74 = v8;
  if (v16)
  {
    unint64_t v69 = v9;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v78 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v19 = a2;
    uint64_t v70 = a1;
    uint64_t v20 = *v11;
    uint64_t v21 = v11[1];
    swift_bridgeObjectRetain();
    uint64_t v22 = v20;
    a2 = v19;
    sub_1C65B4078(v22, v21, (uint64_t)&v78, v23, v24, v25, v26, v27, v68, v69, v70, (uint64_t)v71, v72, v73, v74, v75, v76, v77, v78,
      v79);
    uint64_t v76 = v28;
    unint64_t v9 = v69;
    sub_1C68ED0C8();
    a1 = v70;
    swift_bridgeObjectRelease();
    sub_1C65C117C((uint64_t)v11, &qword_1EBBF5210);
    _os_log_impl(&dword_1C65AE000, v14, v15, "[UCG] We found candidate %s multiple ways - attempting to de-duplicate it...", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v18;
    uint64_t v8 = v74;
    MEMORY[0x1C87A54F0](v29, -1, -1);
    MEMORY[0x1C87A54F0](v17, -1, -1);
  }
  else
  {
    sub_1C65C117C((uint64_t)v11, &qword_1EBBF5210);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4072C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0C10;
  *(void *)(inited + 32) = swift_getKeyPath();
  *(void *)(inited + 40) = 10;
  *(void *)(inited + 48) = swift_getKeyPath();
  *(void *)(inited + 56) = 10;
  *(void *)(inited + 64) = swift_getKeyPath();
  *(void *)(inited + 72) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5448);
  uint64_t v31 = *(void *)(v9 + 72);
  unint64_t v32 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1C68F0710;
  sub_1C6626FA0(a1, v33 + v32, &qword_1EBBF5210);
  sub_1C6626FA0(a2, v33 + v32 + v31, &qword_1EBBF5210);
  uint64_t v78 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C68BD960(&v78, inited);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_1C66715C8();
  uint64_t v34 = v78;
  swift_retain_n();
  uint64_t v35 = sub_1C68EC458();
  int v36 = sub_1C68ECE48();
  if (!os_log_type_enabled(v35, (os_log_type_t)v36))
  {

    swift_release_n();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v37 = swift_slowAlloc();
  uint64_t v38 = swift_slowAlloc();
  uint64_t v78 = v38;
  *(_DWORD *)uint64_t v37 = 136315650;
  if (!*(void *)(v34 + 16))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v69 = v38;
  LODWORD(v70) = v36;
  unint64_t v75 = v32;
  unint64_t v39 = v34 + v32;
  uint64_t v40 = *(void *)(v34 + v32);
  uint64_t v41 = *(void *)(v34 + v32 + 8);
  swift_bridgeObjectRetain();
  sub_1C65B4078(v40, v41, (uint64_t)&v78, v42, v43, v44, v45, v46, v68, v69, v70, (uint64_t)v71, v72, v73, v74, v75, v76, v77, v78,
    v79);
  uint64_t v76 = v47;
  sub_1C68ED0C8();
  swift_bridgeObjectRelease();
  *(_WORD *)(v37 + 12) = 2080;
  uint64_t v48 = v39 + *(int *)(v8 + 36);
  uint64_t v49 = (uint64_t)v71;
  sub_1C65DCFC4(v48, (uint64_t)v71);
  uint64_t v50 = sub_1C68EC8F8();
  sub_1C65B4078(v50, v51, (uint64_t)&v78, v52, v53, v54, v55, v56, v68, v69, v70, (uint64_t)v71, v72, v73, v74, v75, v76, v77, v78,
    v79);
  uint64_t v76 = v57;
  sub_1C68ED0C8();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v37 + 22) = 2080;
  if (*(void *)(v34 + 16) >= 2uLL)
  {
    sub_1C65DCFC4(v39 + v31 + *(int *)(v74 + 36), v49);
    uint64_t v58 = sub_1C68EC8F8();
    sub_1C65B4078(v58, v59, (uint64_t)&v78, v60, v61, v62, v63, v64, v68, v69, v70, (uint64_t)v71, v72, v73, v74, v75, v76, v77, v78,
      v79);
    uint64_t v76 = v65;
    sub_1C68ED0C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v35, (os_log_type_t)v70, "[UCG] Picking match [a] over [b] in de-dup for %s:\n  [a] %s\n  [b] %s", (uint8_t *)v37, 0x20u);
    unint64_t v66 = v69;
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v66, -1, -1);
    MEMORY[0x1C87A54F0](v37, -1, -1);

    unint64_t v32 = v75;
LABEL_11:
    if (*(void *)(v34 + 16))
    {
      sub_1C6626FA0(v34 + v32, v73, &qword_1EBBF5210);
      return swift_release();
    }
    __break(1u);
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1C68CA1F8(uint64_t a1, uint64_t a2)
{
  v17[2] = a1;
  swift_bridgeObjectRetain();
  sub_1C665FA88(sub_1C68D9020, (uint64_t)v17, a2);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4FBC860];
    sub_1C66A0128(0, v5, 0);
    uint64_t v6 = v18;
    unint64_t v7 = v18[2];
    uint64_t v8 = 40;
    do
    {
      uint64_t v9 = *(void *)(v4 + v8);
      uint64_t v18 = v6;
      unint64_t v10 = v6[3];
      if (v7 >= v10 >> 1)
      {
        sub_1C66A0128(v10 > 1, v7 + 1, 1);
        uint64_t v6 = v18;
      }
      uint64_t v6[2] = v7 + 1;
      v6[v7 + 4] = v9;
      v8 += 16;
      ++v7;
      --v5;
    }
    while (v5);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v6[2];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v6 + 4;
    while (1)
    {
      uint64_t v15 = *v14++;
      BOOL v16 = __OFADD__(v13, v15);
      v13 += v15;
      if (v16) {
        break;
      }
      if (!--v12) {
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v13 = 0;
LABEL_14:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_1C68CA350()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_1C68CA3A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v3 = MEMORY[0x1F4188790](v2);
  uint64_t v42 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  unint64_t v7 = (uint64_t *)((char *)&v40 - v6);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  unint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = (unsigned char *)(a1 + *(int *)(v8 + 36));
  uint64_t v12 = type metadata accessor for ContactResolver.SignalSet(0);
  char v13 = v11[*(int *)(v12 + 204)];
  sub_1C6626FA0(a1, (uint64_t)v10, &qword_1EBBF5210);
  if (v13) {
    char v14 = 1;
  }
  else {
    char v14 = v10[*(int *)(v2 + 36) + (uint64_t)*(int *)(v12 + 236)] ^ 1;
  }
  sub_1C65C117C((uint64_t)v10, &qword_1EBBF5210);
  memcpy(v44, v11 + 8, 0x108uLL);
  uint64_t v15 = *(void *)(sub_1C6610A08() + 16);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(sub_1C667F180() + 16);
  swift_bridgeObjectRelease();
  uint64_t result = 1;
  if (v15 && v16 && (v14 & 1) == 0 && (v11[333] & 1) == 0 && (v11[334] & 1) == 0)
  {
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C68EC478();
    __swift_project_value_buffer(v18, (uint64_t)&unk_1EBBF7A68);
    sub_1C6626FA0(a1, (uint64_t)v7, &qword_1EBBF5210);
    uint64_t v19 = v42;
    sub_1C6626FA0(a1, v42, &qword_1EBBF5210);
    uint64_t v20 = sub_1C68EC458();
    os_log_type_t v21 = sub_1C68ECE48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      unint64_t v41 = swift_slowAlloc();
      v44[0] = v41;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v23 = *v7;
      uint64_t v24 = v7[1];
      swift_bridgeObjectRetain();
      sub_1C65B4078(v23, v24, (uint64_t)v44, v25, v26, v27, v28, v29, v40, v41, v42, v43, v44[0], v44[1], v44[2], v44[3], v44[4], v44[5], v44[6],
        v44[7]);
      uint64_t v45 = v30;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C65C117C((uint64_t)v7, &qword_1EBBF5210);
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v31 = sub_1C67E4EA4();
      sub_1C65B4078(v31, v32, (uint64_t)v44, v33, v34, v35, v36, v37, v40, v41, v42, v43, v44[0], v44[1], v44[2], v44[3], v44[4], v44[5], v44[6],
        v44[7]);
      uint64_t v45 = v38;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C65C117C(v19, &qword_1EBBF5210);
      _os_log_impl(&dword_1C65AE000, v20, v21, "[UCG] Discarding overmatched candidate %s (queryOvermatch && nameOvermatch): %s", (uint8_t *)v22, 0x16u);
      unint64_t v39 = v41;
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v39, -1, -1);
      MEMORY[0x1C87A54F0](v22, -1, -1);
    }
    else
    {
      sub_1C65C117C((uint64_t)v7, &qword_1EBBF5210);
      sub_1C65C117C(v19, &qword_1EBBF5210);
    }

    return 0;
  }
  return result;
}

void sub_1C68CA73C()
{
  OUTLINED_FUNCTION_15_0();
  uint64_t v2 = v0;
  uint64_t v61 = v3;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_28_0();
  uint64_t v62 = sub_1C68E9BF8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v60 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_20();
  uint64_t v64 = v8;
  OUTLINED_FUNCTION_13();
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_120_1(v10, v11, v12, v13, v14, v15, v16, v17, v53);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6510);
  uint64_t v19 = OUTLINED_FUNCTION_3(v18);
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (char *)&v53 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v53 - v26;
  uint64_t v28 = type metadata accessor for InferenceEuclidLog(0);
  uint64_t v29 = v28 - 8;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_12_1();
  sub_1C672870C(v5, v1);
  uint64_t v30 = v1 + *(int *)(v29 + 28);
  uint64_t v31 = type metadata accessor for InferenceEuclidDebugMetrics(0);
  uint64_t v32 = v30 + *(int *)(v31 + 28);
  if (*(void *)(v32 + 8) != 1)
  {
    float v33 = *(double *)(v0 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors + 48);
    *(float *)(v32 + 16) = v33;
    *(unsigned char *)(v32 + 20) = 0;
  }
  uint64_t v63 = *(void *)(v61 + 16);
  if (v63)
  {
    uint64_t v54 = v31;
    uint64_t v55 = v30;
    uint64_t v56 = v27;
    uint64_t v57 = v1;
    uint64_t v58 = v22;
    uint64_t v59 = v0;
    uint64_t v34 = (void (**)(void))(v60 + 32);
    swift_bridgeObjectRetain();
    uint64_t v35 = 0;
    uint64_t v36 = MEMORY[0x1E4FBC860];
    uint64_t v37 = v62;
    do
    {
      sub_1C68E9B88();
      OUTLINED_FUNCTION_4((uint64_t)v25, 1, v37);
      if (v38)
      {
        sub_1C65C117C((uint64_t)v25, &qword_1EBBF6510);
      }
      else
      {
        unint64_t v39 = *v34;
        OUTLINED_FUNCTION_66();
        OUTLINED_FUNCTION_92_2();
        v39();
        OUTLINED_FUNCTION_92_2();
        v39();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          char v43 = OUTLINED_FUNCTION_16_16();
          uint64_t v36 = sub_1C65C7CD4(v43, v44, v45, v36);
        }
        unint64_t v42 = *(void *)(v36 + 16);
        unint64_t v41 = *(void *)(v36 + 24);
        if (v42 >= v41 >> 1)
        {
          char v46 = OUTLINED_FUNCTION_43_6(v41);
          uint64_t v36 = sub_1C65C7CD4(v46, v47, v48, v36);
        }
        *(void *)(v36 + 16) = v42 + 1;
        uint64_t v37 = v62;
        OUTLINED_FUNCTION_92_2();
        v39();
      }
      ++v35;
    }
    while (v63 != v35);
    swift_bridgeObjectRelease();
    uint64_t v22 = v58;
    uint64_t v2 = v59;
    uint64_t v27 = v56;
    uint64_t v1 = v57;
    uint64_t v31 = v54;
    uint64_t v30 = v55;
  }
  else
  {
    uint64_t v36 = MEMORY[0x1E4FBC860];
  }
  uint64_t v49 = *(int *)(v31 + 20);
  swift_bridgeObjectRelease();
  *(void *)(v30 + v49) = v36;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_22();
  if (sub_1C68BC914() == 3)
  {
    OUTLINED_FUNCTION_39_7();
    __swift_storeEnumTagSinglePayload(v50, v51, v52, v62);
  }
  else
  {
    sub_1C68BD910();
  }
  sub_1C65E7B74((uint64_t)v27, v30, &qword_1EBBF6510);
  sub_1C65B9DEC(*(void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config + 8), *(void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config + 16));
  sub_1C6843C60();
  sub_1C65C117C((uint64_t)v22, &qword_1EBBF6510);
  sub_1C68D8374(v1, (void (*)(void))type metadata accessor for InferenceEuclidLog);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C68CAB3C(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C68EC478();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)&unk_1EBBF7A68);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = (void *)sub_1C68EC458();
  os_log_type_t v7 = sub_1C68ECE48();
  if (OUTLINED_FUNCTION_41_1(v7))
  {
    uint64_t v8 = (_DWORD *)OUTLINED_FUNCTION_30();
    v32[0] = OUTLINED_FUNCTION_39();
    *uint64_t v8 = 136315138;
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x1C87A3B40](v9, MEMORY[0x1E4FBB1A0]);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v10, v12, (uint64_t)v32, v13, v14, v15, v16, v17, v5, v31, v32[0], v32[1], v32[2], v32[3], v32[4], v32[5], v32[6], v32[7], v32[8],
      v32[9]);
    sub_1C68ED0C8();
    OUTLINED_FUNCTION_27_9();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_130_0();
    _os_log_impl(v18, v19, v20, v21, v22, v23);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    OUTLINED_FUNCTION_27_9();
  }
  if (!*(void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3Orchestrator)) {
    return MEMORY[0x1E4FBC860];
  }
  double v25 = *(double *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors + 40);
  double v24 = *(double *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors + 48);
  uint64_t v27 = *(void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors + 24);
  uint64_t v26 = *(void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors + 32);
  uint64_t v28 = (void *)(v2 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer);
  swift_retain();
  uint64_t v29 = sub_1C6727E20(a1, v26, v24, v25, v27, v28);
  swift_release();
  return v29;
}

uint64_t sub_1C68CAF08(uint64_t a1, const void *a2)
{
  memcpy(v9, a2, sizeof(v9));
  sub_1C6626FA0(v2 + 56, (uint64_t)&v6, &qword_1EA40B3A0);
  if (v7)
  {
    uint64_t v4 = sub_1C65C490C(&v6, (uint64_t)v8);
    MEMORY[0x1F4188790](v4);
    sub_1C689AABC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    if (v3) {
      return v2;
    }
  }
  else
  {
    sub_1C65C117C((uint64_t)&v6, &qword_1EA40B3A0);
  }
  uint64_t v2 = sub_1C68CB60C();
  swift_bridgeObjectRelease();
  return v2;
}

void *sub_1C68CB030@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v74 = a4;
  uint64_t v70 = (void *)a3;
  uint64_t v73 = type metadata accessor for ContactResolver.SignalSet(0);
  MEMORY[0x1F4188790](v73);
  uint64_t v71 = (uint64_t)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C68E97F8();
  uint64_t v68 = *(void *)(v7 - 8);
  uint64_t v69 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Contact();
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v61 - v14;
  uint64_t v16 = *(void *)(a1 + 8);
  uint64_t v72 = *(void *)a1;
  unint64_t v17 = *(void *)(a1 + 16);
  float v18 = *(float *)(a1 + 24);
  uint64_t v20 = a2[3];
  uint64_t v19 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v20);
  uint64_t v21 = v75;
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v19 + 24))(v16, v17, v20, v19);
  if (!v21)
  {
    unint64_t v75 = v9;
    uint64_t v23 = (uint64_t)v13;
    uint64_t v25 = v72;
    uint64_t v24 = v73;
    if (result)
    {
      id v67 = result;
      sub_1C667A62C();
      if (qword_1EBBF5DA0 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_1C68EC478();
      __swift_project_value_buffer(v26, (uint64_t)&unk_1EBBF7A68);
      unint64_t v66 = v15;
      sub_1C65DCFC4((uint64_t)v15, v23);
      swift_bridgeObjectRetain_n();
      unint64_t v27 = v17;
      swift_bridgeObjectRetain_n();
      uint64_t v28 = sub_1C68EC458();
      os_log_type_t v29 = sub_1C68ECE48();
      int v30 = v29;
      uint64_t v31 = v24;
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v32 = swift_slowAlloc();
        HIDWORD(v64) = v30;
        uint64_t v33 = v23;
        uint64_t v34 = v32;
        uint64_t v65 = swift_slowAlloc();
        v77[0] = v65;
        *(_DWORD *)uint64_t v34 = 136315394;
        uint64_t v61 = v34 + 4;
        uint64_t v35 = v75;
        os_log_t v63 = v28;
        Contact.nameComponents.getter();
        uint64_t v36 = sub_1C68E97D8();
        unint64_t v62 = v27;
        uint64_t v38 = v37;
        unint64_t v39 = v35;
        uint64_t v31 = v24;
        (*(void (**)(char *, uint64_t))(v68 + 8))(v39, v69);
        sub_1C65B4078(v36, v38, (uint64_t)v77, v40, v41, v42, v43, v44, v61, v62, (uint64_t)v63, v64, v65, (uint64_t)v66, (uint64_t)v67, v68, v69, (uint64_t)v70, v71,
          v72);
        double v76 = v45;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        sub_1C68D8374(v33, (void (*)(void))type metadata accessor for Contact);
        *(_WORD *)(v34 + 12) = 2048;
        double v76 = v18;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        os_log_t v46 = v63;
        _os_log_impl(&dword_1C65AE000, v63, BYTE4(v64), "[UCG][ASR-E3] Euclid candidate found: %s, with score: %f", (uint8_t *)v34, 0x16u);
        uint64_t v47 = v65;
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v47, -1, -1);
        MEMORY[0x1C87A54F0](v34, -1, -1);
      }
      else
      {
        sub_1C68D8374(v23, (void (*)(void))type metadata accessor for Contact);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v49 = v74;
      uint64_t v50 = v25;
      uint64_t v52 = v70;
      uint64_t v51 = v71;
      sub_1C66A2A70(v71);
      memcpy(v77, (const void *)(v51 + 8), 0x108uLL);
      sub_1C65B537C(v52);
      sub_1C65B6550(v77);
      memcpy((void *)(v51 + 8), v52, 0x108uLL);
      *(unsigned char *)(v51 + *(int *)(v31 + 232)) = 1;
      sub_1C66F8188(1, v50);
      uint64_t v53 = (unsigned char *)(v51 + *(int *)(v31 + 132));
      v53[10] = v54 & 1;
      sub_1C66F8188(4, v50);
      v53[11] = v55 & 1;
      sub_1C66F8188(2, v50);
      v53[12] = v56 & 1;
      sub_1C66F8188(16, v50);
      v53[15] = v57 & 1;
      sub_1C66F8188(32, v50);
      char v59 = v58;

      v53[8] = v59 & 1;
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
      sub_1C65DCFC4(v51, v49 + *(int *)(v60 + 36));
      sub_1C65C54EC((uint64_t)v66, v49);
      __swift_storeEnumTagSinglePayload(v49, 0, 1, v60);
      return (void *)sub_1C68D8374(v51, (void (*)(void))type metadata accessor for ContactResolver.SignalSet);
    }
    else
    {
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
      return (void *)__swift_storeEnumTagSinglePayload(v74, 1, 1, v48);
    }
  }
  return result;
}

uint64_t sub_1C68CB60C()
{
  swift_retain();
  uint64_t v1 = OUTLINED_FUNCTION_2_22();
  sub_1C68B9700(v1, v2);
  sub_1C6815AC8();
  OUTLINED_FUNCTION_2_1();
  return v0;
}

uint64_t sub_1C68CB68C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unsigned __int16 v6 = *(_WORD *)(a2 + *(int *)(type metadata accessor for ContactResolverConfig(0) + 60));
  return sub_1C68D2928(a1, &v6, a3);
}

void sub_1C68CB6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_63();
  a19 = v23;
  a20 = v24;
  unint64_t v129 = v21;
  uint64_t v125 = (void *)v20;
  uint64_t v126 = v25;
  uint64_t v127 = v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B2A0);
  uint64_t v28 = OUTLINED_FUNCTION_3(v27);
  MEMORY[0x1F4188790](v28);
  int v30 = (char *)&v119 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = type metadata accessor for AsrPhoneticSequenceFetcher();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_1();
  unint64_t v120 = v32;
  uint64_t v33 = type metadata accessor for Signpost();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_16_0();
  if (qword_1EBBF68D0 != -1) {
    goto LABEL_72;
  }
  while (1)
  {
    uint64_t v35 = (void *)qword_1EBBF7B08;
    uint64_t v36 = (uint64_t)&v22[*(int *)(v33 + 20)];
    *(void *)uint64_t v36 = "UCG.SearchForCandidatesByName";
    *(void *)(v36 + 8) = 29;
    uint64_t v123 = v36;
    *(unsigned char *)(v36 + 16) = 2;
    id v37 = v35;
    sub_1C68EC438();
    uint64_t v122 = *(int *)(v33 + 24);
    *(void *)&v22[v122] = v37;
    id v38 = v37;
    sub_1C68ECF98();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
    uint64_t v39 = OUTLINED_FUNCTION_9();
    *(_OWORD *)(v39 + 16) = xmmword_1C68F0550;
    uint64_t v40 = sub_1C68ED3B8();
    uint64_t v42 = v41;
    *(void *)(v39 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v39 + 64) = sub_1C66246B0();
    *(void *)(v39 + 32) = v40;
    *(void *)(v39 + 40) = v42;
    uint64_t v124 = v22;
    sub_1C68EC418();
    swift_bridgeObjectRelease();

    uint64_t v43 = v125;
    sub_1C6626FA0((uint64_t)v125 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_phoneSequenceFetcher, (uint64_t)v30, &qword_1EA40B2A0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v128) == 1)
    {
      sub_1C65C117C((uint64_t)v30, &qword_1EA40B2A0);
      id v44 = 0;
      uint64_t v45 = v127;
    }
    else
    {
      uint64_t v46 = v120;
      sub_1C65C54EC((uint64_t)v30, v120);
      uint64_t v45 = v127;
      if (qword_1EBBF5DA0 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_1C68EC478();
      os_log_type_t v48 = __swift_project_value_buffer(v47, (uint64_t)&unk_1EBBF7A68);
      swift_bridgeObjectRetain_n();
      uint64_t v49 = sub_1C68EC458();
      os_log_type_t v50 = sub_1C68ECE48();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v22 = (uint8_t *)OUTLINED_FUNCTION_30();
        a10 = (id)OUTLINED_FUNCTION_39();
        *(_DWORD *)uint64_t v22 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v51 = v126;
        sub_1C65B4078(v126, v127, (uint64_t)&a10, v52, v53, v54, v55, v56, v119, v120, (uint64_t)v121, v122, v123, (uint64_t)v124, (uint64_t)v125, v126, v127, v128, v129,
          v130);
        OUTLINED_FUNCTION_1_92(v57);
        uint64_t v46 = v120;
        uint64_t v45 = v127;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C65AE000, v49, v50, "[UCG] fetching ASR phone sequence for %s", v22, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {

        OUTLINED_FUNCTION_4_3();
        uint64_t v51 = v126;
      }
      id v121 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA2998]), sel_init);
      if (v121)
      {
        uint64_t v58 = sub_1C6637F3C(v51, v45);
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)(v58 + 16);
          if (v60)
          {
            sub_1C65BAD10(0, &qword_1EA40B380);
            swift_bridgeObjectRetain();
            uint64_t v61 = (uint64_t *)(v59 + 40);
            id v62 = v121;
            do
            {
              uint64_t v63 = *(v61 - 1);
              uint64_t v64 = *v61;
              swift_bridgeObjectRetain_n();
              id v65 = sub_1C6638AD4(v63, v64);
              objc_msgSend(v62, sel_addAsrTokens_, v65);
              swift_bridgeObjectRelease();

              v61 += 2;
              --v60;
            }
            while (v60);
            swift_bridgeObjectRelease();
            uint64_t v45 = v127;
            uint64_t v43 = v125;
            uint64_t v46 = v120;
          }
          swift_bridgeObjectRelease();
        }
        id v66 = v121;
        id v67 = sub_1C68EC458();
        os_log_type_t v68 = sub_1C68ECE48();
        if (OUTLINED_FUNCTION_7_0(v68))
        {
          uint64_t v69 = (uint8_t *)OUTLINED_FUNCTION_30();
          *(_DWORD *)uint64_t v69 = 134217984;
          a10 = objc_msgSend(v66, sel_asrTokensCount);
          uint64_t v45 = v127;
          sub_1C68ED0C8();

          _os_log_impl(&dword_1C65AE000, v67, v48, "[UCG] finished fetching asr tokens. Found %lu token(s) matching search string", v69, 0xCu);
          OUTLINED_FUNCTION_0();
        }
        else
        {
        }
        sub_1C68D8374(v46, (void (*)(void))type metadata accessor for AsrPhoneticSequenceFetcher);
        id v44 = v121;
      }
      else
      {
        uint64_t v70 = sub_1C68EC458();
        os_log_type_t v71 = sub_1C68ECE48();
        if (OUTLINED_FUNCTION_1_1(v71))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v72 = 0;
          _os_log_impl(&dword_1C65AE000, v70, (os_log_type_t)v22, "[UCG] failed to initialize SIRINLUEXTERNALAsrHypothesis. Skipping phone sequence fetching", v72, 2u);
          OUTLINED_FUNCTION_0();
        }

        sub_1C68D8374(v46, (void (*)(void))type metadata accessor for AsrPhoneticSequenceFetcher);
        id v44 = 0;
      }
    }
    uint64_t v73 = v43[5];
    uint64_t v74 = v43[6];
    __swift_project_boxed_opaque_existential_1(v43 + 2, v73);
    unint64_t v75 = (char *)v43 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config;
    uint64_t v76 = type metadata accessor for ContactResolverConfig(0);
    unint64_t v77 = v129;
    unint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t, char *, id, uint64_t, uint64_t))(v74 + 8))(v126, v45, &v75[*(int *)(v76 + 32)], v44, v73, v74);
    if (v77)
    {

      sub_1C68ECF88();
      uint64_t v79 = (uint64_t)v124;
      OUTLINED_FUNCTION_43();
      sub_1C68EC428();
      sub_1C68D8374(v79, (void (*)(void))type metadata accessor for Signpost);
      goto LABEL_66;
    }
    unint64_t v80 = v78;
    if (v78 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_1C68ED528();
    }
    else
    {
      uint64_t v81 = *(void *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v120 = 0;
    id v121 = v44;
    uint64_t v82 = MEMORY[0x1E4FBC860];
    if (!v81) {
      break;
    }
    unint64_t v129 = v80 & 0xC000000000000001;
    uint64_t v22 = (uint8_t *)sub_1C68EB178();
    uint64_t v83 = 4;
    uint64_t v128 = v81;
    while (1)
    {
      int v30 = (char *)(v83 - 4);
      if (v129) {
        MEMORY[0x1C87A4300](v83 - 4, v80);
      }
      else {
        swift_retain();
      }
      uint64_t v33 = v83 - 3;
      if (__OFADD__(v30, 1)) {
        break;
      }
      sub_1C68EB298();
      if (a10 || (sub_1C68EB418(), sub_1C68EB298(), a10))
      {
        uint64_t v84 = sub_1C68EADC8();
        swift_release();
        swift_release();
        if (v84) {
          int v30 = (char *)v84;
        }
        else {
          int v30 = (char *)MEMORY[0x1E4FBC860];
        }
      }
      else
      {
        swift_release();
        int v30 = (char *)MEMORY[0x1E4FBC860];
      }
      uint64_t v85 = *((void *)v30 + 2);
      uint64_t v86 = *(void *)(v82 + 16);
      uint64_t v87 = v86 + v85;
      if (__OFADD__(v86, v85)) {
        goto LABEL_68;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0 || v87 > *(void *)(v82 + 24) >> 1)
      {
        if (v86 <= v87) {
          uint64_t v89 = v86 + v85;
        }
        else {
          uint64_t v89 = v86;
        }
        uint64_t v82 = sub_1C662F06C(isUniquelyReferenced_nonNull_native, v89, 1, v82);
      }
      if (*((void *)v30 + 2))
      {
        uint64_t v90 = (*(void *)(v82 + 24) >> 1) - *(void *)(v82 + 16);
        sub_1C68EA8C8();
        if (v90 < v85) {
          goto LABEL_70;
        }
        OUTLINED_FUNCTION_95_2();
        BOOL v93 = v93 || v91 >= v92;
        if (!v93)
        {
          OUTLINED_FUNCTION_8_85();
          OUTLINED_FUNCTION_70();
          __break(1u);
          return;
        }
        swift_arrayInitWithCopy();
        if (v85)
        {
          uint64_t v94 = *(void *)(v82 + 16);
          BOOL v95 = __OFADD__(v94, v85);
          uint64_t v96 = v94 + v85;
          if (v95) {
            goto LABEL_71;
          }
          *(void *)(v82 + 16) = v96;
        }
      }
      else if (v85)
      {
        goto LABEL_69;
      }
      swift_bridgeObjectRelease();
      ++v83;
      if (v33 == v128) {
        goto LABEL_59;
      }
    }
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    swift_once();
  }
LABEL_59:
  OUTLINED_FUNCTION_53_12();
  uint64_t v97 = v127;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v98 = v126;
  unint64_t v99 = v120;
  uint64_t v100 = sub_1C68BB4AC(v82);
  swift_bridgeObjectRelease();
  if (!*(void *)(v100 + 16))
  {
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v101 = sub_1C68EC478();
    __swift_project_value_buffer(v101, (uint64_t)&unk_1EBBF7A68);
    OUTLINED_FUNCTION_145();
    swift_bridgeObjectRetain_n();
    uint64_t v102 = sub_1C68EC458();
    os_log_type_t v103 = sub_1C68ECE48();
    if (os_log_type_enabled(v102, v103))
    {
      uint64_t v104 = (_DWORD *)OUTLINED_FUNCTION_30();
      uint64_t v105 = OUTLINED_FUNCTION_39();
      unint64_t v120 = v99;
      a10 = (id)v105;
      *uint64_t v104 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v98, v97, (uint64_t)&a10, v106, v107, v108, v109, v110, v119, v120, (uint64_t)v121, v122, v123, (uint64_t)v124, (uint64_t)v125, v126, v127, v128, v129,
        v130);
      OUTLINED_FUNCTION_1_92(v111);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_130_0();
      _os_log_impl(v112, v113, v114, v115, v116, v117);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_145();
      swift_bridgeObjectRelease_n();
    }
  }

  sub_1C68ECF88();
  uint64_t v118 = (uint64_t)v124;
  sub_1C68EC428();
  sub_1C68D8374(v118, (void (*)(void))type metadata accessor for Signpost);
LABEL_66:
  OUTLINED_FUNCTION_54_0();
}

void sub_1C68CC204()
{
  OUTLINED_FUNCTION_15_0();
  unint64_t v267 = v2;
  uint64_t v268 = (uint64_t)v3;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B388);
  uint64_t v7 = OUTLINED_FUNCTION_3(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_1();
  unint64_t v266 = v8;
  OUTLINED_FUNCTION_6();
  uint64_t v265 = sub_1C68EAF08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v252 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v264 = v11;
  OUTLINED_FUNCTION_6();
  uint64_t v255 = sub_1C68EB948();
  OUTLINED_FUNCTION_0_1();
  uint64_t v258 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_39_0(v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B390);
  uint64_t v16 = OUTLINED_FUNCTION_3(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_1();
  unint64_t v253 = v17;
  OUTLINED_FUNCTION_6();
  uint64_t v257 = sub_1C68EB978();
  OUTLINED_FUNCTION_0_1();
  long long v256 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_20();
  uint64_t v251 = v20;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_39_0(v22);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B398);
  uint64_t v24 = OUTLINED_FUNCTION_3(v23);
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_16_0();
  uint64_t v269 = sub_1C68EA848();
  OUTLINED_FUNCTION_0_1();
  uint64_t v259 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_20();
  uint64_t v262 = v27;
  OUTLINED_FUNCTION_13();
  uint64_t v29 = MEMORY[0x1F4188790](v28);
  uint64_t v31 = (char *)&v241 - v30;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_19_2();
  uint64_t v260 = v32;
  OUTLINED_FUNCTION_6();
  uint64_t v33 = sub_1C68EA8C8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v263 = v34;
  uint64_t v36 = MEMORY[0x1F4188790](v35);
  id v38 = (char *)&v241 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x1F4188790](v36);
  uint64_t v41 = (char *)&v241 - v40;
  MEMORY[0x1F4188790](v39);
  uint64_t v43 = (uint64_t)&v241 - v42;
  uint64_t v44 = sub_1C68EA888();
  if (!v45) {
    goto LABEL_23;
  }
  uint64_t v46 = (char *)v44;
  uint64_t v47 = v45;
  uint64_t v48 = sub_1C68EA858();
  uint64_t v261 = v49;
  if (!v49)
  {
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    *(void *)(v5 + 32) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    goto LABEL_32;
  }
  unint64_t v248 = v48;
  uint64_t v250 = (void *)v5;
  uint64_t v249 = v0;
  uint64_t v50 = sub_1C68EA898();
  if (v51)
  {
    BOOL v52 = v50 == 0x50646574616C6552 && v51 == 0xED00006E6F737265;
    if (v52)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v53 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      if ((v53 & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v81 = sub_1C68EC478();
    __swift_project_value_buffer(v81, (uint64_t)&unk_1EBBF7A68);
    uint64_t v82 = v261;
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_1C68EC458();
    os_log_type_t v84 = sub_1C68ECE48();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = (uint8_t *)OUTLINED_FUNCTION_30();
      uint64_t v271 = OUTLINED_FUNCTION_39();
      *(_DWORD *)uint64_t v85 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v248, v82, (uint64_t)&v271, v86, v87, v88, v89, v90, v241, v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)v250, v251,
        v252);
      OUTLINED_FUNCTION_115_2(v91);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v83, v84, "[UCG] Ignoring span match '%s' - this is a relationship origin match, not a name match", v85, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_145();
      swift_bridgeObjectRelease_n();
    }
    goto LABEL_31;
  }
LABEL_9:
  if (qword_1EA405858 != -1) {
    swift_once();
  }
  uint64_t v54 = OUTLINED_FUNCTION_21_12();
  sub_1C65CDAC4(v54, v55, v56);
  if ((v57 & 1) != 0
    || (uint64_t v58 = sub_1C68EA878(), (v58 & 0x100000000) != 0)
    || (v59 = v58, uint64_t v60 = sub_1C68EA8A8(), (v60 & 0x100000000) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_31:
    unint64_t v92 = v250;
    v250[4] = 0;
    *unint64_t v92 = 0u;
    v92[1] = 0u;
    goto LABEL_32;
  }
  uint64_t v62 = v59;
  unint64_t v245 = v59;
  uint64_t v246 = v60;
  uint64_t v63 = v268;
  unint64_t v64 = v267;
  sub_1C68D2FDC(v268, v267, v62, v60, v61);
  uint64_t v271 = v63;
  unint64_t v272 = v64;
  unint64_t v247 = sub_1C65C74BC();
  swift_bridgeObjectRetain();
  unint64_t v245 = sub_1C68EC9B8();
  uint64_t v271 = v63;
  unint64_t v272 = v64;
  swift_bridgeObjectRetain();
  unint64_t v65 = (unint64_t)sub_1C68EC9B8() >> 14;
  if (v65 <= v245 >> 14) {
    goto LABEL_18;
  }
  unint64_t v66 = HIBYTE(v64) & 0xF;
  if ((v64 & 0x2000000000000000) == 0) {
    unint64_t v66 = v268 & 0xFFFFFFFFFFFFLL;
  }
  if (v65 > 4 * v66)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_1C68EC478();
    __swift_project_value_buffer(v67, (uint64_t)&unk_1EBBF7A68);
    v263[2]((uint64_t)v38, v249, v33);
    uint64_t v68 = v267;
    swift_bridgeObjectRetain_n();
    uint64_t v69 = sub_1C68EC458();
    os_log_type_t v70 = sub_1C68ECE58();
    BOOL v71 = os_log_type_enabled(v69, v70);
    uint64_t v72 = (uint8_t *)v268;
    if (v71)
    {
      uint64_t v73 = OUTLINED_FUNCTION_49();
      uint64_t v271 = swift_slowAlloc();
      *(_DWORD *)uint64_t v73 = 136315394;
      swift_bridgeObjectRetain();
      sub_1C65B4078((uint64_t)v72, v68, (uint64_t)&v271, v74, v75, v76, v77, v78, v241, v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)v250, v251,
        v252);
      v270[0] = v79;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v73 + 12) = 2080;
      uint64_t v80 = sub_1C68DF4C4();
      sub_1C65B4078(v80, v100, (uint64_t)&v271, v101, v102, v103, v104, v105, v241, v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)v250, v251,
        v252);
      v270[0] = v106;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      uint64_t v107 = OUTLINED_FUNCTION_87_1();
      v108(v107);
      _os_log_impl(&dword_1C65AE000, v69, v70, "[UCG] Indexes look wrong for query string '%s': %s", (uint8_t *)v73, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      uint64_t v93 = OUTLINED_FUNCTION_87_1();
      v94(v93);
    }

    goto LABEL_31;
  }
  uint64_t v95 = sub_1C68ECB18();
  unint64_t v245 = MEMORY[0x1C87A3880](v95);
  uint64_t v246 = v96;
  swift_bridgeObjectRelease();
  if (v46 == (char *)sub_1C68EC898() && v47 == v97)
  {
    swift_bridgeObjectRelease();
LABEL_44:
    uint64_t v109 = 0;
    uint64_t v5 = 0;
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_21_12();
  char v99 = sub_1C68ED7E8();
  swift_bridgeObjectRelease();
  if (v99) {
    goto LABEL_44;
  }
  if (v46 == (char *)0xD00000000000001BLL && v47 == 0x80000001C6914B60)
  {
    uint64_t v5 = 0;
    uint64_t v244 = 0;
    goto LABEL_49;
  }
  if (OUTLINED_FUNCTION_138_0()) {
    goto LABEL_44;
  }
  swift_bridgeObjectRetain();
  uint64_t v109 = (uint64_t)v46;
  uint64_t v5 = v47;
LABEL_45:
  if (v46 == (char *)0xD000000000000014 && v47 == 0x80000001C6920DD0)
  {
    swift_bridgeObjectRelease();
LABEL_50:
    uint64_t v111 = v249;
    swift_bridgeObjectRelease();
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v112 = sub_1C68EC478();
    uint64_t v113 = __swift_project_value_buffer(v112, (uint64_t)&unk_1EBBF7A68);
    os_log_type_t v114 = v263[2];
    v114(v43, v111, v33);
    uint64_t v265 = v113;
    uint64_t v115 = sub_1C68EC458();
    os_log_type_t v116 = sub_1C68ECE48();
    if (OUTLINED_FUNCTION_41_1(v116))
    {
      uint32_t v117 = (uint8_t *)OUTLINED_FUNCTION_30();
      uint64_t v271 = OUTLINED_FUNCTION_39();
      uint64_t v268 = (uint64_t)v117;
      *(_DWORD *)uint32_t v117 = 136315138;
      OUTLINED_FUNCTION_113_2((uint64_t)(v117 + 4));
      v114((uint64_t)v41, v43, v33);
      uint64_t v118 = sub_1C68EC8F8();
      sub_1C65B4078(v118, v119, (uint64_t)&v271, v120, v121, v122, v123, v124, v241, v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)v250, v251,
        v252);
      OUTLINED_FUNCTION_115_2(v125);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      uint64_t v126 = OUTLINED_FUNCTION_137();
      v127(v126);
      _os_log_impl(&dword_1C65AE000, v115, (os_log_type_t)v5, "[UCG] Found a potential pics span: %s", (uint8_t *)v268, 0xCu);
      swift_arrayDestroy();
      uint64_t v111 = v249;
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      uint64_t v128 = OUTLINED_FUNCTION_137();
      v129(v128);
    }

    OUTLINED_FUNCTION_154();
    unint64_t v130 = v261;
    uint64_t v131 = sub_1C68EA898();
    if (!v132) {
      goto LABEL_61;
    }
    if (v131 == 0x4364656E7261656CLL && v132 == 0xEE00746361746E6FLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v134 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      if ((v134 & 1) == 0)
      {
LABEL_61:
        OUTLINED_FUNCTION_148();
        goto LABEL_22;
      }
    }
    uint64_t v144 = v111;
    uint64_t v145 = *(void *)(sub_1C68EA868() + 16);
    if (!v145)
    {
      swift_bridgeObjectRelease();
      uint64_t v151 = (void *)MEMORY[0x1E4FBC860];
LABEL_92:
      if (v151[2] == 1)
      {
        uint64_t v164 = v151[4];
        uint64_t v163 = v151[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA406360);
        uint64_t inited = (__n128 *)swift_initStackObject();
        uint64_t v166 = OUTLINED_FUNCTION_58_8(inited, (__n128)xmmword_1C68F0550);
        v166[3].n128_u64[0] = v248;
        v166[3].n128_u64[1] = v130;
        v166[4].n128_u64[0] = 0;
        v166[4].n128_u8[8] = 2;
        sub_1C67FB2CC((uint64_t)v166);
        *(void *)uint64_t v5 = v164;
        *(void *)(v5 + 8) = v163;
        *(void *)(v5 + 16) = 0;
        *(void *)(v5 + 24) = 0;
        *(void *)(v5 + 32) = v167;
        goto LABEL_32;
      }
      OUTLINED_FUNCTION_148();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      char v168 = (void *)sub_1C68EC458();
      os_log_type_t v169 = sub_1C68ECE48();
      if (OUTLINED_FUNCTION_2_0(v169))
      {
        uint64_t v170 = (_DWORD *)OUTLINED_FUNCTION_30();
        *uint64_t v170 = 134217984;
        uint64_t v5 = (uint64_t)(v170 + 1);
        uint64_t v171 = v151[2];
        swift_bridgeObjectRelease();
        uint64_t v271 = v171;
        OUTLINED_FUNCTION_153();
        OUTLINED_FUNCTION_154();
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_132_0(&dword_1C65AE000, v172, v173, "[UCG] ignoring PICs span. Expected exactly one suggested contact but got %ld");
        OUTLINED_FUNCTION_0();
      }
      else
      {

        OUTLINED_FUNCTION_27_9();
      }
      goto LABEL_23;
    }
    uint64_t v268 = *(void *)(v259 + 16);
    OUTLINED_FUNCTION_8();
    uint64_t v148 = v146 + v147;
    OUTLINED_FUNCTION_113_2(*(void *)(v149 + 56));
    uint64_t v264 = v150;
    swift_bridgeObjectRetain();
    uint64_t v151 = (void *)MEMORY[0x1E4FBC860];
    unint64_t v266 = 0x80000001C6920DF0;
    OUTLINED_FUNCTION_110_1();
    while (1)
    {
      ((void (*)(uint64_t, uint64_t, uint64_t))v268)(v111, v148, v144);
      if (sub_1C68EA838() == 0xD000000000000012 && v152 == v266)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v5 = sub_1C68ED7E8();
        swift_bridgeObjectRelease();
        if ((v5 & 1) == 0) {
          goto LABEL_88;
        }
      }
      uint64_t v153 = sub_1C68EA818();
      if (v154)
      {
        uint64_t v5 = v153;
        uint64_t v144 = v154;
        uint64_t v155 = HIBYTE(v154) & 0xF;
        if ((v154 & 0x2000000000000000) == 0) {
          uint64_t v155 = v153 & 0xFFFFFFFFFFFFLL;
        }
        if (v155)
        {
          OUTLINED_FUNCTION_44_9();
          v156();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_16_16();
            sub_1C65C8524();
            uint64_t v151 = v161;
          }
          unint64_t v157 = v151[2];
          uint64_t v111 = v157 + 1;
          if (v157 >= v151[3] >> 1)
          {
            sub_1C65C8524();
            uint64_t v151 = v162;
          }
          v151[2] = v111;
          uint64_t v158 = &v151[2 * v157];
          v158[4] = v5;
          v158[5] = v144;
          OUTLINED_FUNCTION_154();
          OUTLINED_FUNCTION_110_1();
          goto LABEL_89;
        }
        swift_bridgeObjectRelease();
      }
LABEL_88:
      uint64_t v144 = v269;
      OUTLINED_FUNCTION_44_9();
      v159();
      OUTLINED_FUNCTION_154();
LABEL_89:
      OUTLINED_FUNCTION_108_2();
      v148 += v160;
      if (!--v145)
      {
        OUTLINED_FUNCTION_97_2();
        unint64_t v130 = v261;
        goto LABEL_92;
      }
    }
  }
  uint64_t v244 = v109;
LABEL_49:
  char v110 = OUTLINED_FUNCTION_138_0();
  swift_bridgeObjectRelease();
  if (v110) {
    goto LABEL_50;
  }
  uint64_t v243 = v5;
  swift_bridgeObjectRetain();
  uint64_t v135 = v249;
  uint64_t v136 = sub_1C68EA868();
  uint64_t v137 = *(void *)(v136 + 16);
  if (v137)
  {
    uint64_t v41 = (char *)(v259 + 16);
    uint64_t v138 = *(void (**)(char *, uint64_t, uint64_t))(v259 + 16);
    OUTLINED_FUNCTION_8();
    uint64_t v47 = v136 + v139;
    uint64_t v46 = v41 - 8;
    uint64_t v140 = (uint8_t *)v136;
    uint64_t v141 = *((void *)v41 + 7);
    uint64_t v268 = (uint64_t)v140;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_109_1();
    while (1)
    {
      v138(v31, v47, v135);
      uint64_t v135 = (uint64_t)v31;
      if (sub_1C68EA838() == 0x6369746E616D6573 && v142 == 0xEE0065756C61765FLL) {
        break;
      }
      uint64_t v135 = v142;
      uint64_t v43 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      if (v43) {
        goto LABEL_102;
      }
      uint64_t v135 = v269;
      (*(void (**)(char *, uint64_t))v46)(v31, v269);
      v47 += v141;
      if (!--v137)
      {
        swift_bridgeObjectRelease();
        goto LABEL_99;
      }
    }
    swift_bridgeObjectRelease();
LABEL_102:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_109_1();
    OUTLINED_FUNCTION_40_16();
    OUTLINED_FUNCTION_2();
    v175();
    uint64_t v174 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_109_1();
LABEL_99:
    OUTLINED_FUNCTION_40_16();
  }
  __swift_storeEnumTagSinglePayload(v1, v174, 1, v135);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4(v1, 1, v135);
  uint64_t v176 = v262;
  uint64_t v177 = v254;
  if (v52)
  {
    sub_1C65C117C(v1, &qword_1EA40B398);
    unint64_t v242 = 0;
    uint64_t v178 = 0;
    unint64_t v180 = 0;
  }
  else
  {
    uint64_t v178 = sub_1C68EA818();
    unint64_t v180 = v179;
    OUTLINED_FUNCTION_19_6();
    v181();
    if (v180)
    {
      swift_bridgeObjectRetain();
      unint64_t v242 = v178;
    }
    else
    {
      unint64_t v242 = 0;
    }
  }
  sub_1C68EA8B8();
  OUTLINED_FUNCTION_4(v47, 1, v43);
  unint64_t v253 = v180;
  if (!v52)
  {
    OUTLINED_FUNCTION_2();
    v183();
    sub_1C68EB928();
    char v184 = sub_1C68EB8F8();
    uint64_t v185 = *(void (**)(void))(v258 + 8);
    v258 += 8;
    OUTLINED_FUNCTION_19_6();
    v185();
    uint64_t v186 = 32;
    if ((v184 & 1) == 0) {
      uint64_t v186 = 0;
    }
    uint64_t v260 = v186;
    if (v180)
    {
      uint64_t v271 = v178;
      unint64_t v272 = v180;
      v270[0] = v245;
      v270[1] = v246;
      uint64_t v187 = sub_1C68ED148();
      swift_bridgeObjectRelease();
      uint64_t v43 = v257;
      uint64_t v46 = v256;
      swift_bridgeObjectRelease();
      LODWORD(v268) = v187 == 0;
    }
    else
    {
      OUTLINED_FUNCTION_148();
      LODWORD(v268) = 0;
    }
    sub_1C68EB908();
    char v188 = sub_1C68EB8F8();
    uint64_t v189 = v255;
    ((void (*)(char *, uint64_t))v185)(v41, v255);
    (*((void (**)(uint64_t, uint64_t, uint64_t))v46 + 2))(v251, v177, v43);
    if (v188)
    {
      uint64_t v190 = OUTLINED_FUNCTION_75_4();
      ((void (*)(uint64_t))v41)(v190);
      unint64_t v182 = v260;
    }
    else
    {
      sub_1C68EB938();
      char v191 = sub_1C68EB8F8();
      ((void (*)(char *, uint64_t))v185)(v41, v189);
      uint64_t v192 = OUTLINED_FUNCTION_75_4();
      ((void (*)(uint64_t))v41)(v192);
      unint64_t v182 = v260;
      if (v268 & 1 | ((v191 & 1) == 0)) {
        goto LABEL_121;
      }
    }
    v182 |= 0x80uLL;
LABEL_121:
    sub_1C68EB918();
    char v193 = sub_1C68EB8F8();
    OUTLINED_FUNCTION_19_6();
    v185();
    if (v193)
    {
      uint64_t v194 = sub_1C68EB958();
      unint64_t v180 = v253;
      if ((v194 & 0x100000000) != 0
        || (v195 = v194, uint64_t v196 = sub_1C68EB968(), (v196 & 0x100000000) != 0)
        || v195 >= v196)
      {
        v182 |= 0x40uLL;
        uint64_t v211 = OUTLINED_FUNCTION_39_15();
        ((void (*)(uint64_t))v41)(v211);
      }
      else
      {
        unint64_t v197 = v180;
        if (qword_1EBBF5DA0 != -1) {
          swift_once();
        }
        uint64_t v198 = sub_1C68EC478();
        __swift_project_value_buffer(v198, (uint64_t)&unk_1EBBF7A68);
        uint64_t v199 = v243;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        char v200 = sub_1C68EC458();
        os_log_type_t v201 = sub_1C68ECE48();
        if (os_log_type_enabled(v200, v201))
        {
          uint64_t v202 = (uint8_t *)OUTLINED_FUNCTION_30();
          v270[0] = OUTLINED_FUNCTION_39();
          *(_DWORD *)uint64_t v202 = 136315138;
          if (v199)
          {
            uint64_t v271 = v248;
            unint64_t v272 = v261;
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            sub_1C68ECA18();
            sub_1C68ECA18();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v208 = v271;
            uint64_t v209 = v272;
          }
          else
          {
            uint64_t v209 = v261;
            swift_bridgeObjectRetain();
            uint64_t v208 = v248;
          }
          sub_1C65B4078(v208, v209, (uint64_t)v270, v203, v204, v205, v206, v207, v241, v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)v250, v251,
            v252);
          uint64_t v271 = v212;
          OUTLINED_FUNCTION_153();
          sub_1C68ED0C8();
          OUTLINED_FUNCTION_97_2();
          OUTLINED_FUNCTION_97_2();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C65AE000, v200, v201, "[UCG] Skipping hypocorism annotation of match for %s because there are also non-alias token matches", v202, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_0();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_97_2();
        }

        OUTLINED_FUNCTION_19_6();
        ((void (*)(void))v41)();
        uint64_t v176 = v262;
        unint64_t v180 = v197;
      }
    }
    else
    {
      uint64_t v210 = OUTLINED_FUNCTION_39_15();
      ((void (*)(uint64_t))v41)(v210);
      unint64_t v180 = v253;
    }
    goto LABEL_136;
  }
  OUTLINED_FUNCTION_148();
  swift_bridgeObjectRelease();
  sub_1C65C117C(v47, &qword_1EA40B390);
  unint64_t v182 = 0;
LABEL_136:
  uint64_t v213 = sub_1C68EC748();
  uint64_t v214 = sub_1C68EA868();
  uint64_t v215 = *(void *)(v214 + 16);
  if (v215)
  {
    uint64_t v260 = v182;
    uint64_t v268 = *(void *)(v259 + 16);
    OUTLINED_FUNCTION_8();
    uint64_t v259 = v214;
    uint64_t v217 = v214 + v216;
    OUTLINED_FUNCTION_113_2(*(void *)(v218 + 56));
    uint64_t v263 = (void (**)(uint64_t, uint64_t, uint64_t))(v252 + 32);
    uint64_t v219 = (void (**)(uint64_t, uint64_t))(v252 + 8);
    uint64_t v221 = (void (**)(uint64_t, uint64_t))(v220 - 8);
    uint64_t v222 = v269;
    do
    {
      ((void (*)(uint64_t, uint64_t, uint64_t))v268)(v176, v217, v222);
      unint64_t v223 = v266;
      sub_1C68EA828();
      uint64_t v224 = v223;
      uint64_t v225 = v223;
      uint64_t v226 = v265;
      OUTLINED_FUNCTION_4(v225, 1, v265);
      if (v52)
      {
        (*v221)(v176, v222);
        sub_1C65C117C(v224, &qword_1EA40B388);
      }
      else
      {
        (*v263)(v264, v224, v226);
        uint64_t v227 = sub_1C68EAEF8();
        if (*(void *)(v213 + 16) && (unint64_t v229 = sub_1C68506A0(v227, v228), (v230 & 1) != 0))
        {
          uint64_t v231 = *(void *)(*(void *)(v213 + 56) + 8 * v229);
          swift_bridgeObjectRelease();
          if ((v231 & ~v260) != 0) {
            uint64_t v232 = v231;
          }
          else {
            uint64_t v232 = 0;
          }
          v260 |= v232;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        (*v219)(v264, v226);
        uint64_t v176 = v262;
        uint64_t v222 = v269;
        (*v221)(v262, v269);
      }
      OUTLINED_FUNCTION_108_2();
      v217 += v233;
      --v215;
    }
    while (v215);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v180 = v253;
    unint64_t v182 = v260;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA406360);
  uint64_t v234 = (__n128 *)swift_initStackObject();
  char v235 = OUTLINED_FUNCTION_58_8(v234, (__n128)xmmword_1C68F0550);
  unint64_t v236 = v242;
  v235[3].n128_u64[0] = v182;
  v235[3].n128_u64[1] = v236;
  v235[4].n128_u64[0] = v180;
  v235[4].n128_u8[8] = 0;
  sub_1C67FB2CC((uint64_t)v235);
  uint64_t v237 = v250;
  uint64_t v238 = v261;
  *uint64_t v250 = v248;
  v237[1] = v238;
  uint64_t v239 = v243;
  v237[2] = v244;
  uint64_t v237[3] = v239;
  v237[4] = v240;
LABEL_32:
  OUTLINED_FUNCTION_10();
}

void sub_1C68CDAE4()
{
  OUTLINED_FUNCTION_63();
  uint64_t v350 = v1;
  v316 = v0;
  uint64_t v324 = v3;
  OUTLINED_FUNCTION_28_0();
  uint64_t v4 = (int *)type metadata accessor for Signpost();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_16_0();
  uint64_t v325 = (int *)*v0;
  uint64_t v6 = v0[2];
  uint64_t v330 = (void *)v0[1];
  if (qword_1EBBF68D0 != -1) {
    goto LABEL_110;
  }
LABEL_2:
  uint64_t v7 = (void *)qword_1EBBF7B08;
  uint64_t v8 = (uint64_t)v2 + v4[5];
  *(void *)uint64_t v8 = "UCG.SearchForCandidatesByRelationship";
  *(void *)(v8 + 8) = 37;
  uint64_t v311 = v8;
  *(unsigned char *)(v8 + 16) = 2;
  id v9 = v7;
  sub_1C68EC438();
  uint64_t v310 = v4[6];
  *(void *)((char *)v2 + v310) = v9;
  id v10 = v9;
  sub_1C68ECF98();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
  uint64_t v11 = OUTLINED_FUNCTION_9();
  long long v333 = xmmword_1C68F0550;
  *(_OWORD *)(v11 + 16) = xmmword_1C68F0550;
  uint64_t v12 = sub_1C68ED3B8();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v11 + 64) = sub_1C66246B0();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  OUTLINED_FUNCTION_32_7();
  uint64_t v312 = v2;
  sub_1C68EC418();
  swift_bridgeObjectRelease();

  unint64_t v2 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6308);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v333;
  uint64_t v16 = v330;
  *(void *)(inited + 32) = v330;
  *(void *)(inited + 40) = v6;
  uint64_t v347 = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v336 = v16;
  uint64_t v337 = v6;
  swift_bridgeObjectRetain();
  sub_1C68CF5A4((uint64_t)&v347, (uint64_t *)&v336, (uint64_t)v316, v324);
  uint64_t v326 = v350;
  if (v350)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_1C65C7028();
LABEL_40:
    sub_1C68ECF88();
    uint64_t v96 = (uint64_t)v312;
    OUTLINED_FUNCTION_43();
    sub_1C68EC428();
    sub_1C68D8374(v96, (void (*)(void))type metadata accessor for Signpost);
LABEL_41:
    OUTLINED_FUNCTION_54_0();
    return;
  }
  uint64_t v322 = v2;
  uint64_t v323 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_1C65C7028();
  uint64_t v17 = v347;
  uint64_t v331 = v347 + 56;
  OUTLINED_FUNCTION_19_31();
  uint64_t v20 = v19 & v18;
  *(void *)&long long v332 = (unint64_t)(v21 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v22 = 0;
  uint64_t v4 = (int *)&unk_1EBBF5000;
  *(void *)&long long v23 = 136315394;
  long long v329 = v23;
  uint64_t v327 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v328 = v17;
  if (v20)
  {
LABEL_5:
    unint64_t v24 = __clz(__rbit64(v20));
    v20 &= v20 - 1;
    unint64_t v25 = v24 | (v22 << 6);
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_108;
    }
    uint64_t v20 = (uint64_t)v330;
    if (v26 >= (uint64_t)v332) {
      break;
    }
    ++v22;
    if (*(void *)(v331 + 8 * v26)) {
      goto LABEL_19;
    }
    uint64_t v22 = v26 + 1;
    if (v26 + 1 >= (uint64_t)v332) {
      break;
    }
    if (*(void *)(v331 + 8 * v22)) {
      goto LABEL_19;
    }
    uint64_t v22 = v26 + 2;
    if (v26 + 2 >= (uint64_t)v332) {
      break;
    }
    if (*(void *)(v331 + 8 * v22)) {
      goto LABEL_19;
    }
    uint64_t v27 = v26 + 3;
    if (v27 >= (uint64_t)v332) {
      break;
    }
    if (!*(void *)(v331 + 8 * v27))
    {
      while (1)
      {
        uint64_t v22 = v27 + 1;
        if (__OFADD__(v27, 1)) {
          break;
        }
        if (v22 >= (uint64_t)v332) {
          goto LABEL_26;
        }
        ++v27;
        if (*(void *)(v331 + 8 * v22)) {
          goto LABEL_19;
        }
      }
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      swift_once();
      goto LABEL_2;
    }
    uint64_t v22 = v27;
LABEL_19:
    OUTLINED_FUNCTION_126_1();
    unint64_t v25 = v28 + (v22 << 6);
LABEL_20:
    uint64_t v6 = *(unsigned __int16 *)(*(void *)(v17 + 48) + 2 * v25);
    if (*((void *)v4 + 436) != -1) {
      swift_once();
    }
    uint64_t v29 = sub_1C68EC478();
    __swift_project_value_buffer(v29, (uint64_t)&unk_1EBBF7A68);
    uint64_t v30 = sub_1C68EC458();
    os_log_type_t v31 = sub_1C68ECE48();
    if (OUTLINED_FUNCTION_1_1(v31))
    {
      uint64_t v350 = v22;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v336 = (void *)OUTLINED_FUNCTION_13_39();
      *(_DWORD *)uint64_t v32 = v329;
      uint64_t v33 = sub_1C67C55AC(v6);
      *(void *)&long long v333 = v20;
      sub_1C65B4078(v33, v34, (uint64_t)&v336, v35, v36, v37, v38, v39, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
        (uint64_t)v316);
      *(void *)(v32 + 4) = v40;
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      sub_1C67C1500(v6);
      uint64_t v6 = MEMORY[0x1C87A3B40]();
      uint64_t v42 = v41;
      uint64_t v20 = v333;
      swift_bridgeObjectRelease();
      sub_1C65B4078(v6, v42, (uint64_t)&v336, v43, v44, v45, v46, v47, v287, v293, v299, v304, v309, v310, v311, (uint64_t)v312, v313, v314, v315,
        (uint64_t)v316);
      *(void *)(v32 + 14) = v48;
      uint64_t v4 = (_DWORD *)&unk_1EBBF5000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v30, (os_log_type_t)v2, "[UCG] CN relationship keys for: '%s': %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      uint64_t v17 = v328;
      OUTLINED_FUNCTION_0();
      uint64_t v22 = v350;
      OUTLINED_FUNCTION_0();
    }

    if (v20) {
      goto LABEL_5;
    }
  }
LABEL_26:
  swift_release();
  uint64_t v49 = (uint64_t)v316;
  swift_retain();
  uint64_t v50 = v326;
  uint64_t v51 = v326;
  uint64_t v349 = sub_1C68BA234(v17, v49, (uint64_t (*)(void))sub_1C67C1500);
  if (*(void *)(v349 + 16)
    || (OUTLINED_FUNCTION_139(),
        swift_retain(),
        uint64_t v52 = sub_1C68BA234(v17, v49, (uint64_t (*)(void))sub_1C67C5138),
        swift_bridgeObjectRelease(),
        uint64_t v349 = v52,
        *(void *)(v52 + 16)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v346 = MEMORY[0x1E4FBC870];
    uint64_t v162 = swift_initStackObject();
    *(_OWORD *)(v162 + 16) = xmmword_1C68FCA00;
    uint64_t v163 = v323;
    *(void *)(v162 + 32) = v20;
    *(void *)(v162 + 40) = v163;
    uint64_t v336 = (void *)v20;
    uint64_t v337 = v163;
    uint64_t v347 = 32;
    unint64_t v348 = 0xE100000000000000;
    uint64_t v334 = 0;
    unint64_t v335 = 0xE000000000000000;
    sub_1C65C74BC();
    swift_bridgeObjectRetain();
    *(void *)(v162 + 48) = sub_1C68ED138();
    *(void *)(v162 + 56) = v164;
    uint64_t v336 = (void *)v20;
    uint64_t v337 = v163;
    uint64_t v347 = 32;
    unint64_t v348 = 0xE100000000000000;
    *(void *)(v162 + 64) = OUTLINED_FUNCTION_16_49(45);
    *(void *)(v162 + 72) = v165;
    uint64_t v336 = (void *)v20;
    uint64_t v337 = v163;
    uint64_t v347 = 32;
    unint64_t v348 = 0xE100000000000000;
    *(void *)(v162 + 80) = OUTLINED_FUNCTION_16_49(95);
    *(void *)(v162 + 88) = v166;
    uint64_t v167 = *(void *)(v49 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer + 24);
    uint64_t v168 = *(void *)(v49 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v49 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer), v167);
    uint64_t v336 = (void *)sub_1C689BA74(v20, v163, v167, v168);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
    sub_1C666EF30((unint64_t *)&qword_1EBBF6848, &qword_1EBBF6840);
    uint64_t v169 = sub_1C68EC818();
    uint64_t v171 = v170;
    swift_bridgeObjectRelease();
    *(void *)(v162 + 96) = v169;
    *(void *)(v162 + 104) = v171;
    sub_1C65F65DC(v162);
    int64_t v172 = sub_1C68B9A74(v328);
    swift_bridgeObjectRelease();
    uint64_t v173 = sub_1C65F65DC(v172);
    uint64_t v174 = v346;
    MEMORY[0x1F4188790](v173);
    uint64_t v311 = v324;
    swift_bridgeObjectRetain();
    sub_1C6815C08((uint64_t)sub_1C68D83E4, (uint64_t)&v309, v174);
    uint64_t v176 = v175;
    uint64_t v177 = v50;
    swift_bridgeObjectRelease();
    uint64_t v178 = sub_1C6688970(v176);
    swift_bridgeObjectRelease();
    uint64_t v346 = v178;
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v179 = sub_1C68EC478();
    __swift_project_value_buffer(v179, (uint64_t)&unk_1EBBF7A68);
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t v180 = sub_1C68EC458();
    os_log_type_t v181 = sub_1C68ECE48();
    if (os_log_type_enabled(v180, v181))
    {
      uint64_t v182 = swift_slowAlloc();
      *(void *)&long long v333 = OUTLINED_FUNCTION_13_39();
      uint64_t v336 = (void *)v333;
      *(_DWORD *)uint64_t v182 = v329;
      swift_bridgeObjectRetain();
      sub_1C65B4078((uint64_t)v330, v163, (uint64_t)&v336, v183, v184, v185, v186, v187, v313, v314, v315, (uint64_t)v316, v317, (uint64_t)v318, (uint64_t)v319, v320, (uint64_t)v321, (uint64_t)v322, v323,
        v324);
      uint64_t v347 = v188;
      sub_1C68ED0C8();
      swift_release();
      OUTLINED_FUNCTION_4_3();
      *(_WORD *)(v182 + 12) = 2080;
      *(void *)&long long v332 = v182 + 14;
      OUTLINED_FUNCTION_7_7();
      swift_bridgeObjectRetain();
      uint64_t v189 = sub_1C68ECD68();
      uint64_t v191 = v190;
      swift_bridgeObjectRelease();
      sub_1C65B4078(v189, v191, (uint64_t)&v336, v192, v193, v194, v195, v196, v313, v314, v315, (uint64_t)v316, v317, (uint64_t)v318, (uint64_t)v319, v320, (uint64_t)v321, (uint64_t)v322, v323,
        v324);
      uint64_t v347 = v197;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v180, v181, "[UCG] No semantic CN relationship found for '%s'. Will search for it as a custom relationship using these potential labels: %s", (uint8_t *)v182, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      uint64_t v177 = v50;
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_release();
    }
    OUTLINED_FUNCTION_7_7();
    swift_retain();
    uint64_t v245 = swift_bridgeObjectRetain();
    uint64_t v246 = sub_1C68BA4DC(v245);
    swift_bridgeObjectRelease();
    sub_1C6688970(v246);
    swift_bridgeObjectRetain_n();
    unint64_t v247 = sub_1C68EC458();
    os_log_type_t v248 = sub_1C68ECE48();
    if (os_log_type_enabled(v247, v248))
    {
      uint64_t v354 = v177;
      uint64_t v249 = (uint8_t *)OUTLINED_FUNCTION_30();
      uint64_t v336 = (void *)OUTLINED_FUNCTION_39();
      *(_DWORD *)uint64_t v249 = 136315138;
      *(void *)&long long v333 = v249 + 4;
      swift_bridgeObjectRetain();
      uint64_t v250 = sub_1C68ECD68();
      uint64_t v252 = v251;
      swift_bridgeObjectRelease();
      sub_1C65B4078(v250, v252, (uint64_t)&v336, v253, v254, v255, v256, v257, v313, v314, v315, (uint64_t)v316, v317, (uint64_t)v318, (uint64_t)v319, v320, (uint64_t)v321, (uint64_t)v322, v323,
        v324);
      uint64_t v347 = v258;
      sub_1C68ED0C8();
      OUTLINED_FUNCTION_64_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v247, v248, "[UCG] MeCard related names matching custom relationship: %s", v249, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      uint64_t v177 = v354;
      OUTLINED_FUNCTION_0();
    }
    else
    {

      OUTLINED_FUNCTION_64_1();
    }
    swift_retain();
    uint64_t v259 = v323;
    swift_bridgeObjectRetain();
    uint64_t v260 = OUTLINED_FUNCTION_93_2();
    uint64_t v20 = (uint64_t)v330;
    int64_t v262 = sub_1C68B9BEC(v260, v261, (uint64_t)v330, v259);
    uint64_t v51 = v177;
    swift_bridgeObjectRelease();
    sub_1C68BD6E8(v262);
    swift_bridgeObjectRelease();
    uint64_t v4 = (_DWORD *)&unk_1EBBF5000;
  }
  if (*((void *)v4 + 436) != -1) {
    swift_once();
  }
  uint64_t v53 = sub_1C68EC478();
  uint64_t v54 = __swift_project_value_buffer(v53, (uint64_t)&unk_1EBBF7A68);
  uint64_t v4 = v325;
  swift_retain();
  uint64_t v55 = v323;
  swift_bridgeObjectRetain();
  uint64_t v315 = v54;
  uint64_t v56 = sub_1C68EC458();
  os_log_type_t v57 = sub_1C68ECE48();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = swift_slowAlloc();
    *(void *)&long long v333 = OUTLINED_FUNCTION_13_39();
    uint64_t v336 = (void *)v333;
    *(_DWORD *)uint64_t v58 = v329;
    uint64_t v351 = v51;
    swift_bridgeObjectRetain();
    sub_1C65B4078(v20, v55, (uint64_t)&v336, v59, v60, v61, v62, v63, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
      (uint64_t)v316);
    uint64_t v347 = v64;
    sub_1C68ED0C8();
    swift_release();
    OUTLINED_FUNCTION_53_12();
    *(_WORD *)(v58 + 12) = 2080;
    *(void *)&long long v332 = v58 + 14;
    OUTLINED_FUNCTION_7_7();
    uint64_t v65 = v349;
    swift_bridgeObjectRetain();
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA406358);
    uint64_t v67 = MEMORY[0x1C87A3B40](v65, v66);
    uint64_t v69 = v68;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v67, v69, (uint64_t)&v336, v70, v71, v72, v73, v74, v288, v294, v300, v305, v309, v310, v311, (uint64_t)v312, v313, v314, v315,
      (uint64_t)v316);
    uint64_t v347 = v75;
    sub_1C68ED0C8();
    uint64_t v51 = v351;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_129_0();
    _os_log_impl(v76, v77, v78, v79, v80, v81);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_release();
  }
  OUTLINED_FUNCTION_7_7();
  if (!*(void *)(v349 + 16))
  {
    OUTLINED_FUNCTION_145();
    swift_retain_n();
    uint64_t v82 = sub_1C68EC458();
    os_log_type_t v83 = sub_1C68ECE48();
    if (os_log_type_enabled(v82, v83))
    {
      os_log_type_t v84 = (uint8_t *)OUTLINED_FUNCTION_30();
      *(void *)&long long v333 = OUTLINED_FUNCTION_39();
      uint64_t v336 = (void *)v333;
      *(_DWORD *)os_log_type_t v84 = 136315138;
      *(void *)&long long v332 = v84 + 4;
      sub_1C68C3804();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
      uint64_t v85 = sub_1C68EC728();
      uint64_t v87 = v86;
      swift_bridgeObjectRelease();
      sub_1C65B4078(v85, v87, (uint64_t)&v336, v88, v89, v90, v91, v92, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
        (uint64_t)v316);
      uint64_t v346 = v93;
      sub_1C68ED0C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v82, v83, "[UCG] Couldn't find any MeCard relationships matching query. Here's what's in the MeCard: %s", v84, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      uint64_t v4 = v325;
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_release_n();
    }
  }
  uint64_t v94 = swift_bridgeObjectRetain();
  uint64_t v95 = sub_1C68BA808(v94, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C68D83C8);
  uint64_t v326 = v51;
  if (v51)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v97 = v95;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v97 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v98 = 0;
    uint64_t v286 = v97;
    uint64_t v99 = v97 + 64;
    *(void *)&long long v100 = 134219010;
    long long v298 = v100;
    unint64_t v292 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v328 = v6;
    do
    {
      uint64_t v101 = *(void *)(v99 - 32);
      uint64_t v102 = *(void *)(v99 - 24);
      uint64_t v103 = *(void *)(v99 - 8);
      os_log_t v318 = *(os_log_t *)(v99 - 16);
      v319 = (void *)v101;
      uint64_t v104 = *(void **)v99;
      uint64_t v105 = *(void *)(v99 + 8);
      uint64_t v321 = *(NSObject **)(v99 + 16);
      uint64_t v322 = v104;
      uint64_t v106 = *(void *)(v99 + 32);
      uint64_t v320 = *(void *)(v99 + 24);
      uint64_t v107 = *(void *)(v99 + 48);
      uint64_t v317 = *(void *)(v99 + 40);
      uint64_t v108 = *(void *)(v99 + 64);
      uint64_t v327 = *(void *)(v99 + 56);
      *(void *)&long long v329 = v106;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v331 = v108;
      swift_bridgeObjectRetain_n();
      uint64_t v352 = v102;
      swift_bridgeObjectRetain_n();
      *(void *)&long long v333 = v103;
      swift_bridgeObjectRetain_n();
      *(void *)&long long v332 = v105;
      swift_bridgeObjectRetain_n();
      uint64_t v109 = sub_1C68EC458();
      os_log_type_t v110 = sub_1C68ECE48();
      if (OUTLINED_FUNCTION_1_1(v110))
      {
        uint64_t v111 = swift_slowAlloc();
        uint64_t v314 = swift_slowAlloc();
        uint64_t v346 = v314;
        *(_DWORD *)uint64_t v111 = v298;
        *(void *)(v111 + 4) = v98;
        *(_WORD *)(v111 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_1C65B4078(v317, v107, (uint64_t)&v346, v112, v113, v114, v115, v116, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
          (uint64_t)v316);
        *(void *)(v111 + 14) = v117;
        swift_bridgeObjectRelease();
        *(_WORD *)(v111 + 22) = 2080;
        uint64_t v336 = v319;
        uint64_t v337 = v352;
        os_log_t v338 = v318;
        *(void *)&long long v339 = v333;
        v319 = (void *)v98;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v118 = sub_1C68EC8F8();
        os_log_t v318 = v109;
        sub_1C65B4078(v118, v119, (uint64_t)&v346, v120, v121, v122, v123, v124, v289, v295, v301, v306, v309, v310, v311, (uint64_t)v312, v313, v314, v315,
          (uint64_t)v316);
        *(void *)(v111 + 24) = v125;
        uint64_t v126 = v107;
        uint64_t v127 = v331;
        swift_bridgeObjectRelease_n();
        uint64_t v313 = v126;
        swift_bridgeObjectRelease_n();
        uint64_t v128 = v329;
        OUTLINED_FUNCTION_53_12();
        LODWORD(v317) = v103;
        uint64_t v129 = v332;
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_4_3();
        OUTLINED_FUNCTION_4_3();
        swift_bridgeObjectRelease();
        *(_WORD *)(v111 + 32) = 2080;
        uint64_t v336 = v322;
        uint64_t v337 = v129;
        os_log_t v338 = v321;
        *(void *)&long long v339 = v320;
        *((void *)&v339 + 1) = v128;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v130 = sub_1C68EC8F8();
        sub_1C65B4078(v130, v131, (uint64_t)&v346, v132, v133, v134, v135, v136, v290, v296, v302, v307, v309, v310, v311, (uint64_t)v312, v313, v314, v315,
          (uint64_t)v316);
        *(void *)(v111 + 34) = v137;
        OUTLINED_FUNCTION_64_1();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_53_12();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_4_3();
        swift_bridgeObjectRelease();
        *(_WORD *)(v111 + 42) = 2080;
        swift_bridgeObjectRetain();
        sub_1C65B4078(v327, v127, (uint64_t)&v346, v138, v139, v140, v141, v142, v291, v297, v303, v308, v309, v310, v311, (uint64_t)v312, v313, v314, v315,
          (uint64_t)v316);
        *(void *)(v111 + 44) = v143;
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_53_12();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        uint64_t v98 = (uint64_t)v319;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        os_log_t v144 = v318;
        _os_log_impl(&dword_1C65AE000, v318, (os_log_type_t)v317, "[UCG] Relationship lookup [%ld] for '%s': %s => %s based on search term %s", (uint8_t *)v111, 0x34u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        uint64_t v6 = v328;
        OUTLINED_FUNCTION_0();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      ++v98;
      v99 += 104;
    }
    while (v6 != v98);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v145 = v286 + 64;
    uint64_t v146 = MEMORY[0x1E4FBC860];
    uint64_t v147 = v323;
    uint64_t v4 = v325;
    do
    {
      if ((*(void *)(v145 + 16) & 0x20) != 0)
      {
        long long v329 = *(_OWORD *)(v145 + 16);
        uint64_t v148 = (void *)v146;
        uint64_t v327 = *(void *)(v145 - 32);
        uint64_t v328 = v6;
        uint64_t v353 = *(void *)(v145 - 24);
        uint64_t v322 = *(void **)(v145 - 16);
        uint64_t v149 = *(void *)v145;
        *(void *)&long long v333 = *(void *)(v145 - 8);
        uint64_t v150 = *(void *)(v145 + 8);
        long long v332 = *(_OWORD *)(v145 + 32);
        uint64_t v151 = *(void *)(v145 + 56);
        uint64_t v331 = *(void *)(v145 + 48);
        uint64_t v152 = *(void *)(v145 + 64);
        BOOL v153 = v149 == v151 && v150 == v152;
        if (v153 || (sub_1C68ED7E8() & 1) != 0)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v146 = (uint64_t)v148;
          uint64_t v336 = v148;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_91_2();
            uint64_t v147 = v323;
            uint64_t v146 = (uint64_t)v336;
          }
          long long v155 = v329;
          unint64_t v157 = *(void *)(v146 + 16);
          unint64_t v156 = *(void *)(v146 + 24);
          if (v157 >= v156 >> 1)
          {
            sub_1C66A0BA8(v156 > 1, v157 + 1, 1);
            long long v155 = v329;
            uint64_t v147 = v323;
            uint64_t v146 = (uint64_t)v336;
          }
          *(void *)(v146 + 16) = v157 + 1;
          uint64_t v158 = v146 + 104 * v157;
          *(void *)(v158 + 32) = v327;
          *(void *)(v158 + 40) = v353;
          uint64_t v159 = v333;
          *(void *)(v158 + 48) = v322;
          *(void *)(v158 + 56) = v159;
          *(void *)(v158 + 64) = v149;
          *(void *)(v158 + 72) = v150;
          *(_OWORD *)(v158 + 80) = v155;
          *(_OWORD *)(v158 + 96) = v332;
          *(void *)(v158 + 112) = v331;
          *(void *)(v158 + 120) = v151;
          *(void *)(v158 + 128) = v152;
          uint64_t v4 = v325;
        }
        else
        {
          uint64_t v146 = (uint64_t)v148;
        }
        uint64_t v6 = v328;
      }
      v145 += 104;
      --v6;
    }
    while (v6);
    uint64_t v97 = v286;
    uint64_t v160 = v146;
    swift_bridgeObjectRelease();
    uint64_t v161 = v160;
  }
  else
  {
    uint64_t v161 = MEMORY[0x1E4FBC860];
    uint64_t v147 = v323;
  }
  if (*(void *)(v161 + 16))
  {
    uint64_t v350 = v161;
    swift_bridgeObjectRelease();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v198 = v147;
    uint64_t v199 = (void *)sub_1C68EC458();
    os_log_type_t v200 = sub_1C68ECE48();
    if (OUTLINED_FUNCTION_7_0(v200))
    {
      OUTLINED_FUNCTION_30();
      uint64_t v336 = (void *)OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_125_1(4.8149e-34);
      sub_1C65B4078((uint64_t)v330, v198, (uint64_t)&v336, v201, v202, v203, v204, v205, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
        (uint64_t)v316);
      OUTLINED_FUNCTION_62_6(v206);
      swift_release();
      OUTLINED_FUNCTION_53_12();
      uint64_t v209 = "[UCG] There is an exact relationship match for '%s'. Will discard non-exact matches...";
      goto LABEL_97;
    }
LABEL_98:

    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_99;
  }
  swift_release();
  uint64_t v210 = *(void *)(v97 + 16);
  uint64_t v211 = OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer;
  unint64_t v2 = v316;
  swift_retain();
  swift_bridgeObjectRetain();
  if (v210)
  {
    unint64_t v212 = 0;
    uint64_t v322 = (void *)((char *)v2 + v211);
    uint64_t v313 = v210 - 1;
    uint64_t v213 = v97 + 64;
    uint64_t v350 = MEMORY[0x1E4FBC860];
    uint64_t v286 = v97;
    uint64_t v327 = v210;
    *(void *)&long long v298 = v97 + 64;
LABEL_74:
    uint64_t v214 = (void *)(v213 + 104 * v212);
    unint64_t v215 = v212;
    while (v215 < *(void *)(v286 + 16))
    {
      if ((~*((_DWORD *)v214 + 4) & 3) == 0)
      {
        uint64_t v314 = v214[2];
        uint64_t v216 = v214[7];
        unint64_t v2 = (void *)v214[8];
        uint64_t v217 = v214[6];
        uint64_t v320 = v214[5];
        uint64_t v321 = v216;
        uint64_t v218 = v214[3];
        uint64_t v219 = v214[4];
        uint64_t v220 = v214[1];
        *(void *)&long long v333 = *v214;
        uint64_t v221 = *(v214 - 1);
        uint64_t v222 = *(v214 - 3);
        os_log_t v318 = (os_log_t)*(v214 - 2);
        v319 = (void *)v218;
        uint64_t v317 = *(v214 - 4);
        uint64_t v224 = v322[3];
        uint64_t v223 = v322[4];
        uint64_t v328 = v221;
        *(void *)&long long v329 = v223;
        __swift_project_boxed_opaque_existential_1(v322, v224);
        uint64_t v331 = v219;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        *(void *)&long long v332 = v222;
        uint64_t v6 = v328;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v225 = *(void *)(sub_1C689BA74(v333, v220, v224, v329) + 16);
        swift_bridgeObjectRelease();
        if (v225 >= 2)
        {
          *(void *)&long long v329 = v220;
          uint64_t v226 = v331;
          char v227 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v228 = v350;
          uint64_t v336 = (void *)v350;
          if ((v227 & 1) == 0)
          {
            OUTLINED_FUNCTION_91_2();
            uint64_t v228 = (uint64_t)v336;
          }
          uint64_t v147 = v323;
          uint64_t v229 = v317;
          uint64_t v213 = v298;
          uint64_t v230 = v226;
          uint64_t v231 = v217;
          uint64_t v232 = v6;
          uint64_t v233 = v332;
          uint64_t v234 = v2;
          uint64_t v235 = v329;
          uint64_t v237 = v320;
          uint64_t v236 = (uint64_t)v321;
          os_log_t v238 = v318;
          uint64_t v239 = (uint64_t)v319;
          uint64_t v240 = v333;
          unint64_t v242 = *(void *)(v228 + 16);
          unint64_t v241 = *(void *)(v228 + 24);
          int64_t v243 = v242 + 1;
          if (v242 >= v241 >> 1)
          {
            sub_1C66A0BA8(v241 > 1, v243, 1);
            int64_t v243 = v242 + 1;
            uint64_t v229 = v317;
            os_log_t v238 = v318;
            uint64_t v240 = v333;
            uint64_t v239 = (uint64_t)v319;
            uint64_t v237 = v320;
            uint64_t v236 = (uint64_t)v321;
            uint64_t v235 = v329;
            uint64_t v234 = v2;
            uint64_t v233 = v332;
            uint64_t v232 = v6;
            uint64_t v231 = v217;
            uint64_t v230 = v226;
            uint64_t v147 = v323;
            uint64_t v228 = (uint64_t)v336;
          }
          unint64_t v212 = v215 + 1;
          *(void *)(v228 + 16) = v243;
          uint64_t v350 = v228;
          uint64_t v244 = (void *)(v228 + 104 * v242);
          v244[4] = v229;
          v244[5] = v233;
          v244[6] = v238;
          v244[7] = v232;
          v244[8] = v240;
          v244[9] = v235;
          v244[10] = v314;
          v244[11] = v239;
          v244[12] = v230;
          v244[13] = v237;
          v244[14] = v231;
          v244[15] = v236;
          v244[16] = v234;
          BOOL v153 = v313 == v215;
          uint64_t v4 = v325;
          uint64_t v97 = v286;
          uint64_t v210 = v327;
          if (v153) {
            goto LABEL_94;
          }
          goto LABEL_74;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v147 = v323;
        uint64_t v4 = v325;
        uint64_t v210 = v327;
      }
      ++v215;
      v214 += 13;
      if (v210 == v215)
      {
        uint64_t v97 = v286;
        goto LABEL_94;
      }
    }
    goto LABEL_109;
  }
  uint64_t v350 = MEMORY[0x1E4FBC860];
LABEL_94:
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(v350 + 16))
  {
    swift_bridgeObjectRelease();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v263 = v147;
    uint64_t v199 = (void *)sub_1C68EC458();
    os_log_type_t v264 = sub_1C68ECE48();
    if (!OUTLINED_FUNCTION_7_0(v264)) {
      goto LABEL_98;
    }
    OUTLINED_FUNCTION_30();
    uint64_t v336 = (void *)OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_125_1(4.8149e-34);
    sub_1C65B4078((uint64_t)v330, v263, (uint64_t)&v336, v265, v266, v267, v268, v269, v286, v292, v298, *((uint64_t *)&v298 + 1), v309, v310, v311, (uint64_t)v312, v313, v314, v315,
      (uint64_t)v316);
    OUTLINED_FUNCTION_62_6(v270);
    swift_release();
    OUTLINED_FUNCTION_53_12();
    uint64_t v209 = "[UCG] There are relationship matches that appear to have high quality signals for '%s'. Will discard other matches...";
LABEL_97:
    OUTLINED_FUNCTION_53_3(&dword_1C65AE000, v207, v208, v209);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

LABEL_99:
    uint64_t v271 = v350;
  }
  else
  {
    swift_release();
    uint64_t v271 = v97;
  }
  uint64_t v346 = MEMORY[0x1E4FBC868];
  uint64_t v272 = *(void *)(v271 + 16);
  if (!v272)
  {
LABEL_105:
    swift_bridgeObjectRelease();
    uint64_t v284 = v326;
    sub_1C68B9DC8(v346);
    uint64_t v326 = v284;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C68ECF88();
    uint64_t v285 = (uint64_t)v312;
    OUTLINED_FUNCTION_43();
    sub_1C68EC428();
    sub_1C68D8374(v285, (void (*)(void))type metadata accessor for Signpost);
    goto LABEL_41;
  }
  uint64_t v355 = v271;
  swift_bridgeObjectRetain();
  uint64_t v273 = 0;
  while (1)
  {
    uint64_t v274 = *(void *)(v355 + v273 + 72);
    uint64_t v275 = *(void *)(v355 + v273 + 120);
    uint64_t v276 = *(void *)(v355 + v273 + 128);
    uint64_t v277 = *(void *)(v355 + v273 + 112);
    uint64_t v279 = *(void *)(v355 + v273 + 40);
    uint64_t v278 = *(NSObject **)(v355 + v273 + 48);
    long long v280 = *(_OWORD *)(v355 + v273 + 56);
    long long v281 = *(_OWORD *)(v355 + v273 + 80);
    long long v282 = *(_OWORD *)(v355 + v273 + 96);
    uint64_t v336 = *(void **)(v355 + v273 + 32);
    uint64_t v337 = v279;
    long long v339 = v280;
    os_log_t v338 = v278;
    uint64_t v340 = v274;
    long long v341 = v281;
    long long v342 = v282;
    uint64_t v343 = v277;
    uint64_t v344 = v275;
    uint64_t v345 = v276;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v283 = v326;
    sub_1C68D0670(&v346, (uint64_t)&v336, (uint64_t)v325, (uint64_t)v330, v323, v324);
    uint64_t v326 = v283;
    if (v283) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v273 += 104;
    if (!--v272)
    {
      swift_bridgeObjectRelease();
      goto LABEL_105;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
}

void sub_1C68CF5A4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = a2[1];
  uint64_t v103 = *a2;
  uint64_t v10 = sub_1C67C5414();
  uint64_t v17 = &unk_1EBBF5000;
  if ((unsigned __int16)v10 == 376)
  {
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C68EC478();
    __swift_project_value_buffer(v18, (uint64_t)&unk_1EBBF7A68);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_1C68EC458();
    os_log_type_t v20 = sub_1C68ECE48();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v98 = a1;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v110[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v103, v9, (uint64_t)v110, v23, v24, v25, v26, v27, v87, v91, v94, a4, v98, v103, v106, *((uint64_t *)&v106 + 1), v107, v108, v109,
        v110[0]);
      *(void *)&long long v106 = v28;
      uint64_t v5 = v4;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v19, v20, "[UCG] Spoken relationship label '%s' is not a semantic relationship label", v21, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v22;
      uint64_t v17 = (void *)&unk_1EBBF5000;
      MEMORY[0x1C87A54F0](v29, -1, -1);
      uint64_t v30 = v21;
      a1 = v99;
      MEMORY[0x1C87A54F0](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    sub_1C67FE314((uint64_t)v110, v10, v11, v12, v13, v14, v15, v16, v87, v91);
  }
  sub_1C6626FA0(a3 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_relationshipLocalizer, (uint64_t)&v106, &qword_1EA40B378);
  if (v108)
  {
    sub_1C65C490C(&v106, (uint64_t)v110);
    __swift_project_boxed_opaque_existential_1(v110, v110[3]);
    sub_1C65CCC18();
    if (!v5)
    {
      uint64_t v32 = v31;
      if (v17[436] != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1C68EC478();
      uint64_t v34 = __swift_project_value_buffer(v33, (uint64_t)&unk_1EBBF7A68);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v35 = sub_1C68EC458();
      os_log_type_t v36 = sub_1C68ECE48();
      int v37 = v36;
      uint64_t v100 = a1;
      if (os_log_type_enabled(v35, v36))
      {
        HIDWORD(v91) = v37;
        uint64_t v38 = swift_slowAlloc();
        uint64_t v88 = swift_slowAlloc();
        *(void *)&long long v106 = v88;
        *(_DWORD *)uint64_t v38 = 136315394;
        swift_bridgeObjectRetain();
        sub_1C65B4078(v103, v9, (uint64_t)&v106, v39, v40, v41, v42, v43, v88, v91, v34, v97, a1, v103, v106, *((uint64_t *)&v106 + 1), v107, v108, v109,
          v110[0]);
        uint64_t v111 = v44;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v38 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_1C68ECD68();
        uint64_t v47 = v46;
        swift_bridgeObjectRelease();
        sub_1C65B4078(v45, v47, (uint64_t)&v106, v48, v49, v50, v51, v52, v89, v92, v95, 0, v101, v104, v106, *((uint64_t *)&v106 + 1), v107, v108, v109,
          v110[0]);
        uint64_t v111 = v53;
        uint64_t v5 = v97;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C65AE000, v35, BYTE4(v91), "[UCG] Relationship aliases for: '%s': %s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v87, -1, -1);
        MEMORY[0x1C87A54F0](v38, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_1C68BB670(v32);
      uint64_t v59 = v58;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v60 = sub_1C68EC458();
      os_log_type_t v61 = sub_1C68ECE48();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(void *)&long long v106 = v63;
        *(_DWORD *)uint64_t v62 = 136315394;
        swift_bridgeObjectRetain();
        sub_1C65B4078(v103, v9, (uint64_t)&v106, v64, v65, v66, v67, v68, v87, v91, v94, v97, v100, v103, v106, *((uint64_t *)&v106 + 1), v107, v108, v109,
          v110[0]);
        uint64_t v111 = v69;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v62 + 12) = 2080;
        uint64_t v70 = swift_bridgeObjectRetain();
        uint64_t v71 = MEMORY[0x1C87A3B40](v70, &type metadata for NLSemanticRelationLabel);
        uint64_t v73 = v72;
        swift_bridgeObjectRelease();
        sub_1C65B4078(v71, v73, (uint64_t)&v106, v74, v75, v76, v77, v78, v90, v93, v96, v5, v102, v105, v106, *((uint64_t *)&v106 + 1), v107, v108, v109,
          v110[0]);
        uint64_t v111 = v79;
        sub_1C68ED0C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C65AE000, v60, v61, "[UCG] Semantic labels for all aliases of: '%s': %s", (uint8_t *)v62, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v63, -1, -1);
        MEMORY[0x1C87A54F0](v62, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_1C65F62E0(v59, v80, v81, v82, v83, v84, v85, v86);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
  }
  else
  {
    sub_1C65C117C((uint64_t)&v106, &qword_1EA40B378);
    if (v17[436] != -1) {
      swift_once();
    }
    uint64_t v54 = sub_1C68EC478();
    __swift_project_value_buffer(v54, (uint64_t)&unk_1EBBF7A68);
    uint64_t v55 = sub_1C68EC458();
    os_log_type_t v56 = sub_1C68ECE58();
    if (os_log_type_enabled(v55, v56))
    {
      os_log_type_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v57 = 0;
      _os_log_impl(&dword_1C65AE000, v55, v56, "[UCG] No relationship localizer available. This will hurt search results...", v57, 2u);
      MEMORY[0x1C87A54F0](v57, -1, -1);
    }
  }
}

uint64_t sub_1C68CFCAC@<X0>(__int16 *a1@<X0>, uint64_t (*a2)(void)@<X2>, void *a3@<X8>)
{
  __int16 v38 = *a1;
  uint64_t v3 = a2();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x1E4FBC860];
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t *)(v3 + 40);
    uint64_t v7 = MEMORY[0x1E4FBC860];
    uint64_t v8 = (int64_t *)MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v9 = *(v6 - 1);
      uint64_t v10 = *v6;
      swift_bridgeObjectRetain_n();
      uint64_t v11 = sub_1C68C3804();
      if (*(void *)(v11 + 16))
      {
        unint64_t v12 = sub_1C68506A0(v9, v10);
        uint64_t v13 = v7;
        if (v14)
        {
          uint64_t v13 = *(void *)(*(void *)(v11 + 56) + 8 * v12);
          swift_bridgeObjectRetain();
        }
      }
      else
      {
        uint64_t v13 = v7;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v15 = *(void *)(v13 + 16);
      int64_t v16 = v8[2];
      if (__OFADD__(v16, v15)) {
        break;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = v8;
      if (!isUniquelyReferenced_nonNull_native || v16 + v15 > (uint64_t)((unint64_t)v8[3] >> 1))
      {
        sub_1C65C8524();
        uint64_t v18 = v19;
      }
      if (*(void *)(v13 + 16))
      {
        int64_t v20 = v18[2];
        if ((uint64_t)(((unint64_t)v18[3] >> 1) - v20) < v15) {
          goto LABEL_33;
        }
        unint64_t v21 = (unint64_t)&v18[2 * v20 + 4];
        if (v13 + 32 < v21 + 16 * v15 && v21 < v13 + 32 + 16 * v15) {
          goto LABEL_35;
        }
        uint64_t v8 = v18;
        swift_arrayInitWithCopy();
        if (v15)
        {
          int64_t v23 = v8[2];
          BOOL v24 = __OFADD__(v23, v15);
          int64_t v25 = v23 + v15;
          if (v24) {
            goto LABEL_34;
          }
          v8[2] = v25;
        }
      }
      else
      {
        uint64_t v8 = v18;
        if (v15) {
          goto LABEL_32;
        }
      }
      v6 += 2;
      swift_bridgeObjectRelease();
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = MEMORY[0x1E4FBC860];
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    OUTLINED_FUNCTION_8_85();
    uint64_t result = OUTLINED_FUNCTION_70();
    __break(1u);
  }
  else
  {
    uint64_t v8 = (int64_t *)MEMORY[0x1E4FBC860];
LABEL_25:
    swift_bridgeObjectRelease();
    int64_t v26 = v8[2];
    if (v26)
    {
      sub_1C66A0BC8(0, v26, 0);
      uint64_t v27 = v8 + 5;
      do
      {
        uint64_t v28 = *(v27 - 1);
        uint64_t v29 = *v27;
        uint64_t v30 = sub_1C67C55AC(v38);
        uint64_t v32 = v31;
        unint64_t v34 = *(void *)(v5 + 16);
        unint64_t v33 = *(void *)(v5 + 24);
        swift_bridgeObjectRetain();
        if (v34 >= v33 >> 1) {
          sub_1C66A0BC8(v33 > 1, v34 + 1, 1);
        }
        v27 += 2;
        *(void *)(v5 + 16) = v34 + 1;
        uint64_t v35 = (void *)(v5 + 32 * v34);
        v35[4] = v30;
        v35[5] = v32;
        v35[6] = v28;
        v35[7] = v29;
        --v26;
      }
      while (v26);
    }
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = v5;
  }
  return result;
}

uint64_t sub_1C68CFF88@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43F0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[1];
  v15[0] = *a1;
  v15[1] = v9;
  uint64_t v10 = sub_1C68E9C68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, a2, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  sub_1C65C74BC();
  uint64_t v11 = sub_1C68ED108();
  uint64_t v13 = v12;
  uint64_t result = sub_1C65C117C((uint64_t)v8, &qword_1EBBF43F0);
  *a3 = v11;
  a3[1] = v13;
  return result;
}

void sub_1C68D00AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C68CB6F0(a3, a4, a3, a4, a5, a6, a7, a8, v23, v24, v26, *((uint64_t *)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, v30, v31, v32,
    v33);
  uint64_t v25 = v13;
  if (!v8)
  {
    uint64_t v31 = MEMORY[0x1E4FBC860];
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = 32;
      do
      {
        uint64_t v16 = *(void *)(v25 + v15 + 32);
        long long v17 = *(_OWORD *)(v25 + v15 + 16);
        long long v26 = *(_OWORD *)(v25 + v15);
        long long v27 = v17;
        uint64_t v28 = v16;
        sub_1C68D8480((uint64_t)&v26);
        sub_1C68D8480((uint64_t)&v26);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v18 = swift_bridgeObjectRetain();
        sub_1C68BB868(v18, (uint64_t)&v26, a1, a2, a3, a4);
        uint64_t v19 = a1;
        uint64_t v21 = v20;
        swift_bridgeObjectRelease();
        sub_1C68D84CC((uint64_t)&v26);
        uint64_t v22 = v21;
        a1 = v19;
        sub_1C68BD608(v22);
        v15 += 40;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void sub_1C68D0200(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  if (*(unsigned char *)(a1 + 40))
  {
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C68EC478();
    __swift_project_value_buffer(v10, (uint64_t)&unk_1EBBF7A68);
    sub_1C68D8480(a2);
    sub_1C68D8480(a2);
    uint64_t v11 = sub_1C68EC458();
    os_log_type_t v12 = sub_1C68ECE48();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      unint64_t v44 = swift_slowAlloc();
      unint64_t v54 = v44;
      *(_DWORD *)uint64_t v13 = 136315138;
      long long v14 = *(_OWORD *)(a2 + 16);
      long long v48 = *(_OWORD *)a2;
      long long v49 = v14;
      long long v15 = v48;
      sub_1C68D8514((uint64_t)&v49, (uint64_t)&v50);
      sub_1C68D8514((uint64_t)&v50, (uint64_t)&v52);
      if (v53)
      {
        uint64_t v43 = v7;
        long long v47 = v48;
        swift_bridgeObjectRetain();
        sub_1C68D8570((uint64_t)&v48);
        sub_1C68ECA18();
        sub_1C68ECA18();
        sub_1C68D85A8((uint64_t)&v48);
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_1C65B4078(v15, *((uint64_t *)&v15 + 1), (uint64_t)&v54, v16, v17, v18, v19, v20, v43, v44, v47, *((uint64_t *)&v47 + 1), v48, *((uint64_t *)&v48 + 1), v49, *((uint64_t *)&v49 + 1), v50, v51, v52,
        v53);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68D84CC(a2);
      sub_1C68D84CC(a2);
      os_log_type_t v41 = v12;
      uint64_t v42 = "[UCG] Filtering out relationship match for '%s' since it was not a name based match";
LABEL_20:
      _os_log_impl(&dword_1C65AE000, v11, v41, v42, v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v46, -1, -1);
      MEMORY[0x1C87A54F0](v13, -1, -1);
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v23 = *(void *)a1;
    uint64_t v24 = *(void *)(a1 + 8);
    uint64_t v25 = *(void *)(a1 + 16);
    uint64_t v26 = *(void *)(a1 + 24);
    uint64_t v27 = *(void *)(a1 + 32);
    if ((v25 & 8) == 0 || (v25 & 3) == 3)
    {
      uint64_t v37 = *(void *)a2;
      uint64_t v38 = *(void *)(a2 + 8);
      uint64_t v39 = *(void *)(a2 + 16);
      uint64_t v40 = *(void *)(a2 + 24);
      *a7 = v37;
      a7[1] = v38;
      a7[2] = v39;
      a7[3] = v40;
      a7[4] = v23;
      a7[5] = v24;
      a7[6] = v25;
      a7[7] = v26;
      a7[8] = v27;
      a7[9] = a3;
      a7[10] = a4;
      a7[11] = a5;
      a7[12] = a6;
      sub_1C67A4428(v23, v24, v25, v26, v27, 0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return;
    }
    if (qword_1EBBF5DA0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1C68EC478();
    __swift_project_value_buffer(v28, (uint64_t)&unk_1EBBF7A68);
    sub_1C68D8480(a2);
    sub_1C68D8480(a2);
    uint64_t v11 = sub_1C68EC458();
    os_log_type_t v29 = sub_1C68ECE48();
    if (os_log_type_enabled(v11, v29))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      unint64_t v45 = swift_slowAlloc();
      unint64_t v54 = v45;
      *(_DWORD *)uint64_t v13 = 136315138;
      long long v30 = *(_OWORD *)(a2 + 16);
      long long v48 = *(_OWORD *)a2;
      long long v49 = v30;
      long long v31 = v48;
      sub_1C68D8514((uint64_t)&v49, (uint64_t)&v50);
      sub_1C68D8514((uint64_t)&v50, (uint64_t)&v52);
      if (v53)
      {
        uint64_t v43 = v7;
        long long v47 = v48;
        swift_bridgeObjectRetain();
        sub_1C68D8570((uint64_t)&v48);
        sub_1C68ECA18();
        sub_1C68ECA18();
        sub_1C68D85A8((uint64_t)&v48);
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_1C65B4078(v31, *((uint64_t *)&v31 + 1), (uint64_t)&v54, v32, v33, v34, v35, v36, v43, v45, v47, *((uint64_t *)&v47 + 1), v48, *((uint64_t *)&v48 + 1), v49, *((uint64_t *)&v49 + 1), v50, v51, v52,
        v53);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68D84CC(a2);
      sub_1C68D84CC(a2);
      os_log_type_t v41 = v29;
      uint64_t v42 = "[UCG] Filtering out relationship match for '%s' since it was an organization match";
      goto LABEL_20;
    }
  }
  sub_1C68D84CC(a2);
  sub_1C68D84CC(a2);
LABEL_21:

  a7[12] = 0;
  *((_OWORD *)a7 + 4) = 0u;
  *((_OWORD *)a7 + 5) = 0u;
  *((_OWORD *)a7 + 2) = 0u;
  *((_OWORD *)a7 + 3) = 0u;
  *(_OWORD *)a7 = 0u;
  *((_OWORD *)a7 + 1) = 0u;
}

uint64_t sub_1C68D0670(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t isUniquelyReferenced_nonNull_native, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v73 = a6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43F0);
  MEMORY[0x1F4188790](v12 - 8);
  long long v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a2 + 8);
  uint64_t v81 = *(void *)a2;
  uint64_t v16 = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(a2 + 24);
  uint64_t v75 = a5;
  uint64_t v76 = v16;
  uint64_t v18 = *(void *)(a2 + 72);
  uint64_t v19 = *(void *)(a2 + 80);
  LOBYTE(v16) = *(unsigned char *)(a2 + 48);
  uint64_t v72 = v7;
  uint64_t v74 = isUniquelyReferenced_nonNull_native;
  if ((v16 & 0x20) != 0)
  {
    uint64_t v69 = v18;
    uint64_t v70 = v19;
    uint64_t v20 = *(uint64_t **)(a2 + 96);
    BOOL v21 = *(void *)(a2 + 32) == *(void *)(a2 + 88) && *(void *)(a2 + 40) == (void)v20;
    uint64_t v71 = *(void *)(a2 + 88);
    if (v21)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      char v22 = sub_1C68ED7E8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v22 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v71 = 0;
        goto LABEL_17;
      }
    }
    if (qword_1EBBF5DA0 == -1) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v71 = 0;
  while (1)
  {
    uint64_t v79 = v18;
    uint64_t v80 = v19;
    unint64_t v77 = isUniquelyReferenced_nonNull_native;
    uint64_t v78 = (char *)a5;
    uint64_t v42 = sub_1C68E9C68();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v14, v73, v42);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v42);
    sub_1C65C74BC();
    swift_bridgeObjectRetain();
    uint64_t v73 = sub_1C68ED178();
    sub_1C65C117C((uint64_t)v14, &qword_1EBBF43F0);
    long long v14 = v78;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v79 = *a1;
    uint64_t v43 = v79;
    uint64_t v20 = a1;
    *a1 = 0x8000000000000000;
    a1 = (uint64_t *)v15;
    uint64_t v44 = v15;
    uint64_t v15 = v17;
    unint64_t v45 = sub_1C6850E1C(v81, v44, v76, v17);
    if (!__OFADD__(*(void *)(v43 + 16), (v46 & 1) == 0)) {
      break;
    }
    __break(1u);
LABEL_29:
    swift_once();
LABEL_11:
    uint64_t v23 = sub_1C68EC478();
    __swift_project_value_buffer(v23, (uint64_t)&unk_1EBBF7A68);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1C68EC458();
    HIDWORD(v68) = sub_1C68ECE38();
    if (os_log_type_enabled(v24, BYTE4(v68)))
    {
      os_log_t v67 = v24;
      uint64_t v25 = swift_slowAlloc();
      unint64_t v66 = swift_slowAlloc();
      unint64_t v77 = v66;
      *(_DWORD *)uint64_t v25 = 136315394;
      if (v17)
      {
        uint64_t v79 = v81;
        uint64_t v80 = v15;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C68ECA18();
        sub_1C68ECA18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v31 = v79;
        uint64_t v32 = v80;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v31 = v81;
        uint64_t v32 = v15;
      }
      sub_1C65B4078(v31, v32, (uint64_t)&v77, v26, v27, v28, v29, v30, v65, v66, (uint64_t)v67, v68, v69, v70, v71, v72, v73, v74, v75,
        v76);
      uint64_t v79 = v33;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v71, (uint64_t)v20, (uint64_t)&v77, v34, v35, v36, v37, v38, v65, v66, (uint64_t)v67, v68, v69, v70, v71, v72, v73, v74, v75,
        v76);
      uint64_t v79 = v39;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      os_log_t v40 = v67;
      _os_log_impl(&dword_1C65AE000, v67, BYTE4(v68), "[UCG] relationship based match %s is based on person name %s and is an exact match", (uint8_t *)v25, 0x16u);
      unint64_t v41 = v66;
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v41, -1, -1);
      MEMORY[0x1C87A54F0](v25, -1, -1);

      uint64_t v71 = 1;
      int isUniquelyReferenced_nonNull_native = v74;
      a5 = v75;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v71 = 1;
    }
LABEL_17:
    uint64_t v18 = v69;
    uint64_t v19 = v70;
  }
  unint64_t v47 = v45;
  char v48 = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B370);
  char v49 = sub_1C68ED4D8();
  uint64_t v50 = v79;
  uint64_t v51 = v74;
  if (v49)
  {
    unint64_t v52 = sub_1C6850E1C(v81, (uint64_t)a1, v76, v15);
    if ((v48 & 1) != (v53 & 1))
    {
      uint64_t result = sub_1C68ED868();
      __break(1u);
      return result;
    }
    unint64_t v47 = v52;
  }
  *uint64_t v20 = v50;
  swift_bridgeObjectRelease();
  unint64_t v54 = (void *)*v20;
  if ((v48 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_1C68541F4(v47, v81, (uint64_t)a1, v76, v15, MEMORY[0x1E4FBC860], v54);
    swift_bridgeObjectRetain();
  }
  uint64_t v55 = v71;
  uint64_t v56 = v73;
  swift_bridgeObjectRetain();
  if (v56) {
    uint64_t v57 = v55 | 2;
  }
  else {
    uint64_t v57 = v55;
  }
  uint64_t v58 = v54[7];
  swift_bridgeObjectRelease();
  uint64_t v59 = (uint64_t *)(v58 + 8 * v47);
  sub_1C662DDFC();
  uint64_t v60 = *(void *)(*v59 + 16);
  sub_1C662E0D0(v60);
  uint64_t v61 = *v59;
  *(void *)(v61 + 16) = v60 + 1;
  uint64_t v62 = v61 + 48 * v60;
  uint64_t v63 = v75;
  *(void *)(v62 + 32) = v51;
  *(void *)(v62 + 40) = v63;
  *(void *)(v62 + 56) = 0;
  *(void *)(v62 + 64) = 0;
  *(void *)(v62 + 48) = v57;
  *(unsigned char *)(v62 + 72) = 1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C68D0CAC()
{
  OUTLINED_FUNCTION_15_0();
  uint64_t v348 = v0;
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40AF88);
  uint64_t v4 = OUTLINED_FUNCTION_3(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v332 = v5;
  uint64_t v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA409820);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20();
  uint64_t v328 = (void *)v7;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v327 = v9;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3_0();
  uint64_t v337 = v11;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_0();
  uint64_t v336 = v13;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_3_0();
  uint64_t v323 = v15;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_3_0();
  long long v341 = v17;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_3_0();
  uint64_t v324 = v19;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_3_0();
  long long v333 = v21;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_3_0();
  uint64_t v334 = v23;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_3_0();
  uint64_t v331 = (void *)v25;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_3_0();
  uint64_t v330 = v27;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_19_2();
  os_log_t v338 = v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B358);
  uint64_t v31 = OUTLINED_FUNCTION_3(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_20();
  uint64_t v340 = v32;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_19_2();
  uint64_t v344 = v34;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6510);
  uint64_t v36 = OUTLINED_FUNCTION_3(v35);
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_20();
  uint64_t v351 = v37;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_19_2();
  uint64_t v339 = v39;
  OUTLINED_FUNCTION_6();
  uint64_t v356 = sub_1C68E9BF8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v353 = v40;
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_20();
  uint64_t v349 = v42;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v43);
  OUTLINED_FUNCTION_19_2();
  uint64_t v343 = v44;
  uint64_t v363 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  OUTLINED_FUNCTION_0_1();
  uint64_t v357 = v45;
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_20();
  long long v329 = v47;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v48);
  OUTLINED_FUNCTION_3_0();
  uint64_t v326 = v49;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v50);
  OUTLINED_FUNCTION_3_0();
  uint64_t v342 = v51;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v52);
  OUTLINED_FUNCTION_3_0();
  uint64_t v335 = v53;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v54);
  OUTLINED_FUNCTION_3_0();
  uint64_t v354 = v55;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v56);
  OUTLINED_FUNCTION_3_0();
  uint64_t v362 = v57;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v58);
  OUTLINED_FUNCTION_3_0();
  uint64_t v359 = v59;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v60);
  OUTLINED_FUNCTION_3_0();
  uint64_t v361 = v61;
  OUTLINED_FUNCTION_13();
  uint64_t v63 = MEMORY[0x1F4188790](v62);
  uint64_t v65 = (uint64_t)&v319 - v64;
  MEMORY[0x1F4188790](v63);
  OUTLINED_FUNCTION_3_0();
  uint64_t v360 = v66;
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v67);
  uint64_t v69 = (uint64_t)&v319 - v68;
  uint64_t v70 = (uint64_t *)type metadata accessor for Signpost();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v71);
  uint64_t v73 = (char *)&v319 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_133_0(v368);
  if (qword_1EBBF68D0 != -1) {
    goto LABEL_123;
  }
  while (1)
  {
    uint64_t v74 = (void *)qword_1EBBF7B08;
    uint64_t v75 = &v73[*((int *)v70 + 5)];
    *(void *)uint64_t v75 = "UCG.FilterPICSCandidates";
    *((void *)v75 + 1) = 24;
    uint64_t v347 = v75;
    v75[16] = 2;
    id v76 = v74;
    sub_1C68EC438();
    uint64_t v346 = *((int *)v70 + 6);
    *(void *)&v73[v346] = v76;
    id v77 = v76;
    LODWORD(v358) = sub_1C68ECF98();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
    uint64_t v78 = swift_allocObject();
    long long v325 = xmmword_1C68F0550;
    *(_OWORD *)(v78 + 16) = xmmword_1C68F0550;
    uint64_t v79 = sub_1C68ED3B8();
    uint64_t v81 = v80;
    *(void *)(v78 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v78 + 64) = sub_1C66246B0();
    *(void *)(v78 + 32) = v79;
    *(void *)(v78 + 40) = v81;
    OUTLINED_FUNCTION_32_7();
    sub_1C68EC418();
    swift_bridgeObjectRelease();

    uint64_t v82 = MEMORY[0x1E4FBC860];
    *(void *)v365 = MEMORY[0x1E4FBC860];
    uint64_t v83 = *(objc_class **)(v2 + 16);
    swift_bridgeObjectRetain();
    uint64_t v352 = v2;
    Class v355 = v83;
    uint64_t v350 = v73;
    if (v83)
    {
      OUTLINED_FUNCTION_21_33();
      uint64_t v85 = *(void *)(v84 + 72);
      os_log_t v358 = v86;
      uint64_t v87 = (char *)v86 + v2;
      do
      {
        uint64_t v88 = OUTLINED_FUNCTION_21_12();
        sub_1C6626FA0(v88, v89, &qword_1EBBF5210);
        uint64_t v90 = (char *)(v69 + *(int *)(v363 + 36));
        if (v90[*(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 204)])
        {
          sub_1C65C117C(v69, &qword_1EBBF5210);
        }
        else
        {
          sub_1C6626FE4(v69, v360, &qword_1EBBF5210);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            OUTLINED_FUNCTION_33_26();
          }
          uint64_t v91 = *(void *)v365;
          unint64_t v92 = *(void *)(*(void *)v365 + 16);
          if (v92 >= *(void *)(*(void *)v365 + 24) >> 1)
          {
            sub_1C669FB20();
            uint64_t v91 = *(void *)v365;
          }
          *(void *)(v91 + 16) = v92 + 1;
          sub_1C6626FE4(v360, (uint64_t)v358 + v91 + v92 * v85, &qword_1EBBF5210);
        }
        v87 += v85;
        uint64_t v83 = (objc_class *)((char *)v83 - 1);
      }
      while (v83);
      uint64_t v93 = *(void *)v365;
      uint64_t v82 = MEMORY[0x1E4FBC860];
      uint64_t v2 = v352;
    }
    else
    {
      uint64_t v93 = v82;
    }
    swift_bridgeObjectRelease();
    *(void *)v365 = v82;
    swift_bridgeObjectRetain();
    uint64_t v360 = v93;
    uint64_t v94 = v363;
    Class v95 = v355;
    if (v355)
    {
      unint64_t v96 = (*(unsigned __int8 *)(v357 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v357 + 80);
      uint64_t v97 = *(void *)(v357 + 72);
      uint64_t v98 = v2 + v96;
      do
      {
        sub_1C6626FA0(v98, v65, &qword_1EBBF5210);
        uint64_t v99 = v65 + *(int *)(v94 + 36);
        if (*(unsigned char *)(v99 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 216)) == 1)
        {
          sub_1C6626FE4(v65, v361, &qword_1EBBF5210);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            OUTLINED_FUNCTION_33_26();
          }
          OUTLINED_FUNCTION_105_2();
          if (v130)
          {
            OUTLINED_FUNCTION_96_1();
            uint64_t v82 = *(void *)v365;
          }
          *(void *)(v82 + 16) = v94;
          sub_1C6626FE4(v361, v82 + v96 + v99 * v97, &qword_1EBBF5210);
          uint64_t v94 = v363;
        }
        else
        {
          sub_1C65C117C(v65, &qword_1EBBF5210);
        }
        v98 += v97;
        Class v95 = (Class)((char *)v95 - 1);
      }
      while (v95);
      uint64_t v100 = *(void *)v365;
      uint64_t v93 = v360;
      uint64_t v82 = MEMORY[0x1E4FBC860];
      uint64_t v2 = v352;
    }
    else
    {
      uint64_t v100 = v82;
    }
    swift_bridgeObjectRelease();
    *(void *)v365 = v82;
    swift_bridgeObjectRetain();
    if (v355)
    {
      uint64_t v361 = v100;
      unint64_t v101 = (*(unsigned __int8 *)(v357 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v357 + 80);
      uint64_t v102 = *(void *)(v357 + 72);
      uint64_t v103 = v2 + v101;
      Class v104 = v355;
      uint64_t v105 = (uint64_t)v359;
      do
      {
        sub_1C6626FA0(v103, v105, &qword_1EBBF5210);
        uint64_t v106 = v105 + *(int *)(v94 + 36);
        if (*(unsigned char *)(v106 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 204)) == 1)
        {
          sub_1C6626FE4(v105, (uint64_t)v362, &qword_1EBBF5210);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            OUTLINED_FUNCTION_33_26();
          }
          OUTLINED_FUNCTION_105_2();
          if (v130)
          {
            OUTLINED_FUNCTION_96_1();
            uint64_t v82 = *(void *)v365;
          }
          *(void *)(v82 + 16) = v94;
          sub_1C6626FE4((uint64_t)v362, v82 + v101 + v105 * v102, &qword_1EBBF5210);
          uint64_t v94 = v363;
          uint64_t v105 = (uint64_t)v359;
        }
        else
        {
          uint64_t v107 = OUTLINED_FUNCTION_151();
          sub_1C65C117C(v107, v108);
        }
        v103 += v102;
        Class v104 = (Class)((char *)v104 - 1);
      }
      while (v104);
      uint64_t v82 = *(void *)v365;
      uint64_t v93 = v360;
      uint64_t v100 = v361;
    }
    swift_bridgeObjectRelease();
    uint64_t v109 = v348;
    uint64_t v110 = v348 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config;
    int v111 = sub_1C65D9E98(v348 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config);
    if ((sub_1C67E22D8(*(unsigned char *)(v109 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_plusTrialFactors), v111) & 1) == 0)
    {
      swift_release();
LABEL_41:
      swift_release();
LABEL_42:
      uint64_t v65 = *(void *)(v93 + 16);
      uint64_t v112 = (uint64_t)v350;
      if (qword_1EBBF5DA0 != -1) {
        goto LABEL_125;
      }
      goto LABEL_43;
    }
    sub_1C6626FA0(v109 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_plusSuggestionHandler, (uint64_t)v365, &qword_1EA40B360);
    if (*(void *)&v365[24] == 1)
    {
      swift_release();
      swift_release();
      sub_1C65C117C((uint64_t)v365, &qword_1EA40B360);
      goto LABEL_42;
    }
    v366[0] = *(_OWORD *)v365;
    v366[1] = *(_OWORD *)&v365[16];
    uint64_t v367 = *(void *)&v365[32];
    if (v111 == 2)
    {
      swift_release();
      sub_1C66C003C((uint64_t)v366);
      goto LABEL_41;
    }
    LODWORD(v362) = v111;
    uint64_t v119 = *(void *)(v82 + 16);
    uint64_t v65 = MEMORY[0x1E4FBC860];
    uint64_t v361 = v100;
    uint64_t v352 = v82;
    if (v119) {
      break;
    }
LABEL_71:
    uint64_t v134 = v339;
    sub_1C67E4320(v110, v339);
    OUTLINED_FUNCTION_4(v134, 1, v356);
    uint64_t v2 = v343;
    uint64_t v70 = (uint64_t *)v340;
    if (v135)
    {
      sub_1C68E9BE8();
      sub_1C65C117C(v134, &qword_1EBBF6510);
    }
    else
    {
      uint64_t v136 = OUTLINED_FUNCTION_93_2();
      v137(v136);
    }
    uint64_t v73 = v350;
    memcpy(v365, v368, sizeof(v365));
    uint64_t v138 = v344;
    sub_1C67E604C(v365, v65, v2, (int)v362, v344);
    swift_bridgeObjectRelease();
    sub_1C6626FA0(v138, (uint64_t)v70, &qword_1EA40B358);
    uint64_t v139 = v345;
    OUTLINED_FUNCTION_4((uint64_t)v70, 1, v345);
    if (!v135)
    {
      uint64_t v147 = v338;
      uint64_t v148 = (uint64_t)v338 + *(int *)(v139 + 48);
      uint64_t v149 = *(int *)(v139 + 64);
      uint64_t v150 = *v70;
      uint64_t v151 = (uint64_t *)v70[1];
      *os_log_t v338 = *v70;
      v147[1] = (uint64_t)v151;
      uint64_t v152 = v353;
      Class isa = v353[4].isa;
      os_log_t v358 = v353 + 4;
      Class v355 = isa;
      OUTLINED_FUNCTION_2();
      v154();
      int v155 = *((unsigned __int8 *)v70 + v149);
      *((unsigned char *)v147 + v149) = v155;
      uint64_t v156 = qword_1EBBF5DA0;
      swift_bridgeObjectRetain();
      if (v156 != -1) {
        swift_once();
      }
      uint64_t v157 = sub_1C68EC478();
      uint64_t v158 = __swift_project_value_buffer(v157, (uint64_t)&unk_1EBBF7A68);
      uint64_t v159 = (uint64_t)v330;
      uint64_t v160 = *(int *)(v139 + 64);
      uint64_t v321 = v150;
      *uint64_t v330 = v150;
      *(void *)(v159 + 8) = v151;
      uint64_t v162 = v152 + 2;
      uint64_t v161 = (void (*)(void))v152[2].isa;
      uint64_t v339 = v148;
      OUTLINED_FUNCTION_23_39();
      v161();
      HIDWORD(v322) = v155;
      *(unsigned char *)(v159 + v160) = v155;
      uint64_t v163 = v331;
      sub_1C6626FA0(v159, (uint64_t)v331, &qword_1EA409820);
      sub_1C6626FE4(v159, v334, &qword_1EA409820);
      uint64_t v330 = v151;
      swift_bridgeObjectRetain();
      unint64_t v320 = v158;
      uint64_t v164 = sub_1C68EC458();
      os_log_type_t v165 = sub_1C68ECE48();
      int v166 = v165;
      if (os_log_type_enabled(v164, v165))
      {
        uint64_t v167 = OUTLINED_FUNCTION_30();
        LODWORD(v354) = v166;
        uint64_t v168 = (uint8_t *)v167;
        uint64_t v169 = OUTLINED_FUNCTION_39();
        uint64_t v348 = v169;
        uint64_t v340 = v168;
        *(_DWORD *)uint64_t v168 = 136315138;
        *(void *)v365 = v169;
        v319 = v168 + 4;
        uint64_t v170 = *v163;
        uint64_t v171 = v163[1];
        int64_t v172 = v162;
        uint64_t v173 = v163;
        uint64_t v174 = *(int *)(v345 + 48);
        uint64_t v175 = (char *)v163 + v174;
        uint64_t v176 = *(int *)(v345 + 64);
        char v177 = *((unsigned char *)v163 + v176);
        uint64_t v178 = (uint64_t)v333;
        uint64_t v179 = (char *)v333 + v174;
        *long long v333 = v170;
        *(void *)(v178 + 8) = v171;
        ((void (*)(char *, char *, uint64_t))v161)(v179, v175, v356);
        *(unsigned char *)(v178 + v176) = v177;
        sub_1C6626FA0(v178, v324, &qword_1EA409820);
        swift_bridgeObjectRetain();
        uint64_t v180 = sub_1C68EC8F8();
        uint64_t v182 = v181;
        uint64_t v183 = OUTLINED_FUNCTION_65_5();
        sub_1C65C117C(v183, v184);
        sub_1C65B4078(v180, v182, (uint64_t)v365, v185, v186, v187, v188, v189, (uint64_t)v319, v320, v321, v322, (uint64_t)v323, v324, v325, *((uint64_t *)&v325 + 1), v326, (uint64_t)v327, (uint64_t)v328,
          (uint64_t)v329);
        OUTLINED_FUNCTION_141(v190);
        sub_1C68ED0C8();
        uint64_t v139 = v345;
        swift_bridgeObjectRelease();
        sub_1C65C117C(v334, &qword_1EA409820);
        uint64_t v191 = (uint64_t)v173;
        uint64_t v162 = v172;
        sub_1C65C117C(v191, &qword_1EA409820);
        _os_log_impl(&dword_1C65AE000, v164, (os_log_type_t)v354, "[UCG] Found a valid PICS candidate: %s", v340, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {
        uint64_t v198 = OUTLINED_FUNCTION_21_12();
        sub_1C65C117C(v198, v199);
        sub_1C65C117C((uint64_t)v163, &qword_1EA409820);
      }

      uint64_t v200 = v336;
      uint64_t v201 = v337;
      uint64_t v202 = v351;
      uint64_t v203 = v341;
      uint64_t v204 = *(int *)(v139 + 64);
      uint64_t v205 = v330;
      void *v341 = v321;
      v203[1] = v205;
      uint64_t v359 = v161;
      OUTLINED_FUNCTION_23_39();
      v161();
      *((unsigned char *)v203 + v204) = BYTE4(v322);
      uint64_t v206 = v352;
      uint64_t v334 = *(void *)(v352 + 16);
      uint64_t v362 = (void (*)(char *, uint64_t))v162;
      if (v334)
      {
        OUTLINED_FUNCTION_21_33();
        uint64_t v348 = v206 + v207;
        uint64_t v340 = *(uint8_t **)(v208 + 72);
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v209 = 0;
        uint64_t v210 = v342;
        uint64_t v211 = v359;
        do
        {
          sub_1C6626FA0(v348 + (void)v340 * v209, v210, &qword_1EBBF5210);
          uint64_t v212 = v210 + *(int *)(v363 + 36);
          uint64_t v213 = *(void *)(v212 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 208));
          uint64_t v214 = *(void *)(v213 + 16);
          uint64_t v354 = v213;
          if (v214)
          {
            unint64_t v215 = v353;
            OUTLINED_FUNCTION_8();
            uint64_t v218 = v216 + v217;
            swift_bridgeObjectRetain_n();
            Class v219 = v215[9].isa;
            while (1)
            {
              uint64_t v220 = v356;
              OUTLINED_FUNCTION_49_10();
              v211();
              __swift_storeEnumTagSinglePayload(v202, 0, 1, v220);
              OUTLINED_FUNCTION_4(v202, 1, v220);
              if (v135) {
                break;
              }
              OUTLINED_FUNCTION_2();
              v221();
              sub_1C68D8624((unint64_t *)&qword_1EA406560, MEMORY[0x1E4F27990]);
              OUTLINED_FUNCTION_151();
              char v222 = sub_1C68EC858();
              uint64_t v223 = OUTLINED_FUNCTION_93_2();
              v224(v223);
              if (v222)
              {
                swift_release();
                swift_bridgeObjectRelease_n();
                uint64_t v232 = v332;
                sub_1C6626FE4(v342, v332, &qword_1EBBF5210);
                uint64_t v228 = 0;
                uint64_t v229 = v356;
                uint64_t v230 = v335;
                uint64_t v200 = v336;
                uint64_t v231 = v337;
                goto LABEL_107;
              }
              v218 += (uint64_t)v219;
              --v214;
              uint64_t v202 = v351;
              uint64_t v211 = v359;
              if (!v214) {
                goto LABEL_102;
              }
            }
          }
          else
          {
            swift_bridgeObjectRetain_n();
LABEL_102:
            OUTLINED_FUNCTION_39_7();
            __swift_storeEnumTagSinglePayload(v225, v226, v227, v356);
          }
          ++v209;
          swift_bridgeObjectRelease_n();
          uint64_t v210 = v342;
          sub_1C65C117C(v342, &qword_1EBBF5210);
        }
        while (v209 != v334);
        swift_release();
        uint64_t v228 = 1;
        uint64_t v229 = v356;
        uint64_t v230 = v335;
        uint64_t v200 = v336;
        uint64_t v231 = v337;
        uint64_t v232 = v332;
      }
      else
      {
        uint64_t v231 = v201;
        uint64_t v229 = v356;
        swift_bridgeObjectRetain();
        uint64_t v228 = 1;
        uint64_t v230 = v335;
        uint64_t v232 = v332;
      }
LABEL_107:
      uint64_t v233 = v363;
      __swift_storeEnumTagSinglePayload(v232, v228, 1, v363);
      swift_release();
      sub_1C65C117C((uint64_t)v341, &qword_1EA409820);
      swift_release();
      OUTLINED_FUNCTION_4(v232, 1, v233);
      uint64_t v112 = (uint64_t)v350;
      uint64_t v234 = v345;
      if (v135)
      {
        sub_1C65C117C(v232, &qword_1EA40AF88);
        uint64_t v235 = v327;
        uint64_t v236 = *(int *)(v234 + 64);
        uint64_t v237 = v330;
        *uint64_t v327 = v321;
        v235[1] = v237;
        os_log_t v238 = v359;
        OUTLINED_FUNCTION_23_39();
        v238();
        *((unsigned char *)v235 + v236) = BYTE4(v322);
        uint64_t v239 = v328;
        sub_1C6626FE4((uint64_t)v235, (uint64_t)v328, &qword_1EA409820);
        uint64_t v240 = sub_1C68EC458();
        os_log_type_t v241 = sub_1C68ECE48();
        int v242 = v241;
        if (os_log_type_enabled(v240, v241))
        {
          LODWORD(v363) = v242;
          uint64_t v243 = OUTLINED_FUNCTION_30();
          uint64_t v361 = OUTLINED_FUNCTION_39();
          *(void *)v365 = v361;
          *(_DWORD *)uint64_t v243 = 136315138;
          os_log_t v358 = (os_log_t)(v243 + 4);
          uint64_t v244 = v333;
          uint64_t v245 = (char *)v333 + *(int *)(v234 + 48);
          uint64_t v246 = *(int *)(v234 + 64);
          uint64_t v247 = v239[1];
          *long long v333 = *v239;
          v244[1] = v247;
          OUTLINED_FUNCTION_49_10();
          v238();
          *((unsigned char *)v244 + v246) = *((unsigned char *)v239 + v246);
          uint64_t v248 = sub_1C68E9BA8();
          uint64_t v249 = v229;
          uint64_t v250 = v248;
          uint64_t v252 = v251;
          uint64_t v362 = (void (*)(char *, uint64_t))v353[1].isa;
          v362(v245, v249);
          sub_1C65B4078(v250, v252, (uint64_t)v365, v253, v254, v255, v256, v257, (uint64_t)v319, v320, v321, v322, (uint64_t)v323, v324, v325, *((uint64_t *)&v325 + 1), v326, (uint64_t)v327, (uint64_t)v328,
            (uint64_t)v329);
          OUTLINED_FUNCTION_141(v258);
          sub_1C68ED0C8();
          uint64_t v112 = (uint64_t)v350;
          swift_bridgeObjectRelease();
          sub_1C65C117C((uint64_t)v239, &qword_1EA409820);
          _os_log_impl(&dword_1C65AE000, v240, (os_log_type_t)v363, "[UCG] PLUS Candidate was not a valid PICs match for this request. Removing... (plusId was %s", (uint8_t *)v243, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_0();

          sub_1C65C117C((uint64_t)v338, &qword_1EA409820);
          sub_1C65C117C(v344, &qword_1EA40B358);
          v362((char *)v343, v356);
LABEL_118:
          sub_1C66C003C((uint64_t)v366);
          goto LABEL_46;
        }

        uint64_t v278 = (uint64_t)v239;
        uint64_t v279 = &qword_1EA409820;
      }
      else
      {
        sub_1C6626FE4(v232, v230, &qword_1EBBF5210);
        uint64_t v259 = v230 + *(int *)(v233 + 36);
        uint64_t v260 = type metadata accessor for ContactResolver.SignalSet(0);
        uint64_t v261 = v230;
        if (*(unsigned char *)(v259 + *(int *)(v260 + 236)) == 1)
        {
          int64_t v262 = (int *)v260;
          LODWORD(v361) = *(void *)(*(void *)(v259 + *(int *)(v260 + 208)) + 16) > 1uLL;
          uint64_t v263 = v326;
          sub_1C6626FA0(v261, v326, &qword_1EBBF5210);
          char v264 = BYTE4(v322);
          char v265 = BYTE4(v322) ^ 1;
          *(unsigned char *)(v263 + *(int *)(type metadata accessor for Contact() + 92)) = v265;
          uint64_t v266 = v263 + *(int *)(v233 + 36);
          *(unsigned char *)(v266 + v262[51]) = 1;
          uint64_t v267 = v333;
          uint64_t v268 = (char *)v333 + *(int *)(v234 + 48);
          uint64_t v269 = *(int *)(v234 + 64);
          uint64_t v270 = v330;
          *long long v333 = v321;
          v267[1] = v270;
          uint64_t v271 = v359;
          OUTLINED_FUNCTION_49_10();
          v271();
          *((unsigned char *)v267 + v269) = v264;
          *(unsigned char *)(v266 + v262[53]) = v264;
          uint64_t v363 = (uint64_t)v353[1].isa;
          ((void (*)(char *, uint64_t))v363)(v268, v229);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA406330);
          uint64_t v272 = swift_allocObject();
          *(_OWORD *)(v272 + 16) = v325;
          uint64_t v112 = (uint64_t)v350;
          OUTLINED_FUNCTION_49_10();
          v271();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_2();
          v273();
          uint64_t v274 = v262[52];
          swift_bridgeObjectRelease();
          *(void *)(v266 + v274) = v272;
          *(unsigned char *)(v266 + v262[55]) = v361;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5448);
          unint64_t v275 = (*(unsigned __int8 *)(v357 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v357 + 80);
          uint64_t v276 = swift_allocObject();
          *(_OWORD *)(v276 + 16) = v325;
          uint64_t v277 = v326;
          sub_1C6626FA0(v326, v276 + v275, &qword_1EBBF5210);
          *(void *)v365 = v360;
          sub_1C68BD004();
          sub_1C65C117C(v335, &qword_1EBBF5210);
          sub_1C65C117C((uint64_t)v338, &qword_1EA409820);
          sub_1C65C117C(v344, &qword_1EA40B358);
          ((void (*)(uint64_t, uint64_t))v363)(v343, v229);
          sub_1C66C003C((uint64_t)v366);
          sub_1C65C117C(v277, &qword_1EBBF5210);
          goto LABEL_46;
        }
        sub_1C6626FA0(v230, (uint64_t)v329, &qword_1EBBF5210);
        long long v280 = v323;
        uint64_t v281 = *(int *)(v234 + 64);
        long long v282 = v330;
        void *v323 = v321;
        v280[1] = v282;
        uint64_t v283 = v359;
        OUTLINED_FUNCTION_23_39();
        v283();
        *((unsigned char *)v280 + v281) = BYTE4(v322);
        sub_1C6626FA0((uint64_t)v280, v200, &qword_1EA409820);
        uint64_t v284 = (uint64_t)v280;
        uint64_t v285 = v231;
        sub_1C6626FE4(v284, v231, &qword_1EA409820);
        uint64_t v286 = sub_1C68EC458();
        os_log_type_t v287 = sub_1C68ECE48();
        int v288 = v287;
        if (os_log_type_enabled(v286, v287))
        {
          uint64_t v289 = (void *)v200;
          uint64_t v290 = v234;
          uint64_t v291 = OUTLINED_FUNCTION_49();
          uint64_t v363 = swift_slowAlloc();
          *(void *)v365 = v363;
          *(_DWORD *)uint64_t v291 = 136315394;
          os_log_t v358 = v286;
          LODWORD(v361) = v288;
          unint64_t v292 = v329;
          uint64_t v293 = *v329;
          uint64_t v294 = v329[1];
          swift_bridgeObjectRetain();
          sub_1C65B4078(v293, v294, (uint64_t)v365, v295, v296, v297, v298, v299, (uint64_t)v319, v320, v321, v322, (uint64_t)v323, v324, v325, *((uint64_t *)&v325 + 1), v326, (uint64_t)v327, (uint64_t)v328,
            (uint64_t)v329);
          uint64_t v364 = v300;
          sub_1C68ED0C8();
          swift_bridgeObjectRelease();
          sub_1C65C117C((uint64_t)v292, &qword_1EBBF5210);
          *(_WORD *)(v291 + 12) = 2080;
          uint64_t v357 = v291 + 14;
          uint64_t v301 = *(int *)(v290 + 48);
          uint64_t v302 = v333;
          uint64_t v303 = *(int *)(v290 + 64);
          uint64_t v304 = v289[1];
          *long long v333 = *v289;
          v302[1] = v304;
          ((void (*)(char *, char *, uint64_t))v359)((char *)v302 + v301, (char *)v289 + v301, v356);
          *((unsigned char *)v302 + v303) = *((unsigned char *)v289 + v303);
          uint64_t v305 = sub_1C68E9BA8();
          uint64_t v307 = v306;
          uint64_t v308 = (void (*)(void))v353[1].isa;
          OUTLINED_FUNCTION_44_9();
          v308();
          uint64_t v309 = (uint64_t)v350;
          sub_1C65B4078(v305, v307, (uint64_t)v365, v310, v311, v312, v313, v314, (uint64_t)v319, v320, v321, v322, (uint64_t)v323, v324, v325, *((uint64_t *)&v325 + 1), v326, (uint64_t)v327, (uint64_t)v328,
            (uint64_t)v329);
          uint64_t v364 = v315;
          sub_1C68ED0C8();
          uint64_t v112 = v309;
          swift_bridgeObjectRelease();
          sub_1C65C117C(v337, &qword_1EA409820);
          uint64_t v316 = OUTLINED_FUNCTION_93_2();
          sub_1C65C117C(v316, v317);
          os_log_t v318 = v358;
          _os_log_impl(&dword_1C65AE000, v358, (os_log_type_t)v361, "[UCG] PLUS Candidate %s no longer exists in the address book. Ignoring... (plusId was %s)", (uint8_t *)v291, 0x16u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_0();

          sub_1C65C117C(v335, &qword_1EBBF5210);
          sub_1C65C117C((uint64_t)v338, &qword_1EA409820);
          sub_1C65C117C(v344, &qword_1EA40B358);
          OUTLINED_FUNCTION_44_9();
          v308();
          goto LABEL_118;
        }

        sub_1C65C117C(v285, &qword_1EA409820);
        sub_1C65C117C(v200, &qword_1EA409820);
        sub_1C65C117C((uint64_t)v329, &qword_1EBBF5210);
        uint64_t v278 = v335;
        uint64_t v279 = &qword_1EBBF5210;
      }
      sub_1C65C117C(v278, v279);
      sub_1C65C117C((uint64_t)v338, &qword_1EA409820);
      sub_1C65C117C(v344, &qword_1EA40B358);
      ((void (*)(uint64_t, uint64_t))v353[1].isa)(v343, v229);
      goto LABEL_118;
    }
    swift_release();
    sub_1C65C117C((uint64_t)v70, &qword_1EA40B358);
    uint64_t v69 = *(void *)(v100 + 16);
    if (!v69)
    {
LABEL_87:
      if (qword_1EBBF5DA0 != -1) {
        swift_once();
      }
      uint64_t v192 = sub_1C68EC478();
      __swift_project_value_buffer(v192, (uint64_t)&unk_1EBBF7A68);
      uint64_t v193 = (void *)sub_1C68EC458();
      os_log_type_t v194 = sub_1C68ECE48();
      if (OUTLINED_FUNCTION_2_0(v194))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_38_1(&dword_1C65AE000, v195, v196, "[UCG] No valid PICS suggestions found");
        OUTLINED_FUNCTION_0();
      }

      *(void *)v365 = v360;
      sub_1C68BD004();
      sub_1C65C117C(v344, &qword_1EA40B358);
      OUTLINED_FUNCTION_8_0();
      v197();
      sub_1C66C003C((uint64_t)v366);
      uint64_t v112 = (uint64_t)v73;
      goto LABEL_46;
    }
    unint64_t v140 = 0;
    uint64_t v65 = 2;
    uint64_t v141 = v363;
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v100 = sub_1C681A348();
      }
      if (v140 >= *(void *)(v100 + 16)) {
        break;
      }
      uint64_t v2 = v140 + 1;
      OUTLINED_FUNCTION_21_33();
      uint64_t v70 = (uint64_t *)(v100 + v142 + *(void *)(v143 + 72) * v140);
      uint64_t v144 = v100;
      uint64_t v145 = (char *)v70 + *(int *)(v141 + 36);
      uint64_t v146 = (int *)type metadata accessor for ContactResolver.SignalSet(0);
      v145[v146[51]] = 0;
      uint64_t v100 = v144;
      *((unsigned char *)v70 + *(int *)(v141 + 36) + v146[53]) = 0;
      *((unsigned char *)v70 + *(int *)(type metadata accessor for Contact() + 92)) = 2;
      *(uint64_t *)((char *)v70 + *(int *)(v141 + 36) + v146[52]) = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRelease();
      unint64_t v140 = v2;
      if (v69 == v2) {
        goto LABEL_87;
      }
    }
LABEL_122:
    __break(1u);
LABEL_123:
    swift_once();
  }
  uint64_t v359 = (void (*)(void))v110;
  OUTLINED_FUNCTION_21_33();
  uint64_t v2 = v82 + v120;
  uint64_t v122 = *(void *)(v121 + 72);
  swift_retain();
  uint64_t v70 = &qword_1EBBF5210;
  while (1)
  {
    uint64_t v123 = v354;
    sub_1C6626FA0(v2, v354, &qword_1EBBF5210);
    uint64_t v124 = v123 + *(int *)(v363 + 36);
    uint64_t v112 = *(void *)(v124 + *(int *)(type metadata accessor for ContactResolver.SignalSet(0) + 208));
    swift_bridgeObjectRetain();
    sub_1C65C117C(v123, &qword_1EBBF5210);
    uint64_t v73 = *(char **)(v112 + 16);
    uint64_t v69 = *(void *)(v65 + 16);
    uint64_t v125 = &v73[v69];
    if (__OFADD__(v69, v73))
    {
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
      goto LABEL_122;
    }
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || (uint64_t)v125 > *(void *)(v65 + 24) >> 1)
    {
      if (v69 <= (uint64_t)v125) {
        uint64_t v127 = (uint64_t)&v73[v69];
      }
      else {
        uint64_t v127 = v69;
      }
      uint64_t v65 = sub_1C65C7CD4(isUniquelyReferenced_nonNull_native, v127, 1, v65);
    }
    if (*(void *)(v112 + 16)) {
      break;
    }
    if (v73) {
      goto LABEL_120;
    }
LABEL_69:
    swift_bridgeObjectRelease();
    v2 += v122;
    if (!--v119)
    {
      swift_release();
      uint64_t v100 = v361;
      uint64_t v110 = (uint64_t)v359;
      goto LABEL_71;
    }
  }
  if ((*(void *)(v65 + 24) >> 1) - *(void *)(v65 + 16) < (uint64_t)v73) {
    goto LABEL_121;
  }
  OUTLINED_FUNCTION_95_2();
  BOOL v130 = v130 || v128 >= v129;
  if (!v130)
  {
    OUTLINED_FUNCTION_8_85();
    OUTLINED_FUNCTION_70();
    __break(1u);
    return;
  }
  swift_arrayInitWithCopy();
  if (!v73) {
    goto LABEL_69;
  }
  uint64_t v131 = *(void *)(v65 + 16);
  BOOL v132 = __OFADD__(v131, v73);
  uint64_t v133 = &v73[v131];
  if (!v132)
  {
    *(void *)(v65 + 16) = v133;
    goto LABEL_69;
  }
  __break(1u);
LABEL_125:
  swift_once();
LABEL_43:
  uint64_t v113 = sub_1C68EC478();
  __swift_project_value_buffer(v113, (uint64_t)&unk_1EBBF7A68);
  uint64_t v114 = (void *)sub_1C68EC458();
  os_log_type_t v115 = sub_1C68ECE48();
  if (OUTLINED_FUNCTION_2_0(v115))
  {
    uint64_t v116 = (uint64_t)v355 - v65;
    *(_DWORD *)OUTLINED_FUNCTION_30() = 134217984;
    *(void *)v365 = v116;
    sub_1C68ED0C8();
    OUTLINED_FUNCTION_132_0(&dword_1C65AE000, v117, v118, "[UCG] PLUS is not enabled. Will filter out PLUS candidates (%ld removed)");
    OUTLINED_FUNCTION_0();
  }

LABEL_46:
  sub_1C68ECF88();
  sub_1C68EC428();
  sub_1C68D8374(v112, (void (*)(void))type metadata accessor for Signpost);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C68D2928@<X0>(uint64_t a1@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X8>)
{
  int v4 = *a2;
  sub_1C6626FA0(a1, a3, &qword_1EBBF5210);
  type metadata accessor for Contact();
  uint64_t v5 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210) + 36);
  sub_1C6626FE4(v5 + 200, (uint64_t)v9, &qword_1EBBF48F0);
  sub_1C68D8344((uint64_t)v9);
  sub_1C68D8344((uint64_t)v9);
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C68B8AD8(v6, (uint64_t)v9, v4, a3);
  sub_1C68D8344((uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v5 + 272) = v7;
  return result;
}

uint64_t sub_1C68D2A2C(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4 = *(void *)(a1 + *(int *)(type metadata accessor for Contact() + 80));
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return 0;
  }
  int v6 = *a2;
  uint64_t v67 = *MEMORY[0x1E4F5A1E0];
  uint64_t v65 = *MEMORY[0x1E4F5A1E0] + 16;
  swift_bridgeObjectRetain_n();
  int v7 = v6;
  uint64_t v8 = 0;
  HIDWORD(v69) = v6;
  uint64_t v71 = v4;
  uint64_t v73 = a2;
  do
  {
    uint64_t v9 = *(void *)(v4 + v8 + 32);
    uint64_t v10 = *(void *)(v4 + v8 + 40);
    int v11 = *(unsigned __int8 *)(v4 + v8 + 48);
    uint64_t v12 = *(void *)(v4 + v8 + 56);
    uint64_t v13 = *(void *)(v4 + v8 + 64);
    uint64_t v14 = *(void *)(v4 + v8 + 72);
    uint64_t v15 = *(void *)(v4 + v8 + 80);
    uint64_t v16 = *(void *)(v4 + v8 + 96);
    uint64_t v93 = *(void *)(v4 + v8 + 88);
    unsigned int v17 = *(unsigned __int8 *)(v4 + v8 + 104);
    unsigned int v18 = *(unsigned __int8 *)(v4 + v8 + 105);
    if (v7 && v7 != v11) {
      goto LABEL_30;
    }
    uint64_t v19 = *((void *)a2 + 4);
    uint64_t v20 = *((void *)a2 + 5);
    *(void *)&long long v81 = v9;
    *((void *)&v81 + 1) = v10;
    uint64_t v77 = v14;
    uint64_t v79 = v12;
    uint64_t v75 = __PAIR64__(v17, v18);
    if (!v7)
    {
      *(void *)&long long v85 = v19;
      *((void *)&v85 + 1) = v20;
      *(void *)&v84[0] = 64;
      *((void *)&v84[0] + 1) = 0xE100000000000000;
      sub_1C65C74BC();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (sub_1C68ED198())
      {
        BOOL v21 = (void *)sub_1C68EC868();
        uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t, void *))(v67 + 16))(v67, v21);
        goto LABEL_10;
      }
      sub_1C65BAD10(0, (unint64_t *)&qword_1EBBF6080);
LABEL_13:
      swift_bridgeObjectRetain();
      id v27 = sub_1C667AD54();
      uint64_t v28 = sub_1C6684194(v27);
      if (v29) {
        uint64_t v24 = v28;
      }
      else {
        uint64_t v24 = 0;
      }
      if (v29) {
        unint64_t v26 = v29;
      }
      else {
        unint64_t v26 = 0xE000000000000000;
      }
      goto LABEL_19;
    }
    if (v7 != 1)
    {
      sub_1C65BAD10(0, (unint64_t *)&qword_1EBBF6080);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    BOOL v21 = (void *)sub_1C68EC868();
    uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t, void *))(v67 + 16))(v67, v21);
LABEL_10:
    id v23 = v22;

    uint64_t v24 = sub_1C68EC898();
    unint64_t v26 = v25;

LABEL_19:
    uint64_t v30 = HIBYTE(v26) & 0xF;
    if ((v26 & 0x2000000000000000) == 0) {
      uint64_t v30 = v24 & 0xFFFFFFFFFFFFLL;
    }
    a2 = v73;
    if (!v30 || (v24 == v93 ? (BOOL v31 = v26 == v16) : (BOOL v31 = 0), v31))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v32 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v4 = v71;
        int v7 = HIDWORD(v69);
        goto LABEL_30;
      }
    }
    long long v85 = v81;
    LOBYTE(v86) = v11;
    *((void *)&v86 + 1) = v79;
    *(void *)&long long v87 = v13;
    *((void *)&v87 + 1) = v77;
    uint64_t v88 = v15;
    uint64_t v89 = v93;
    uint64_t v90 = v16;
    char v91 = BYTE4(v75);
    char v92 = v75;
    long long v33 = *((_OWORD *)v73 + 1);
    v84[0] = *(_OWORD *)v73;
    v84[1] = v33;
    v84[2] = *((_OWORD *)v73 + 2);
    sub_1C668144C();
    int v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v71;
    int v7 = HIDWORD(v69);
    if (v35)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
LABEL_30:
    v8 += 80;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1C68EC478();
  __swift_project_value_buffer(v36, (uint64_t)&unk_1EBBF7A68);
  sub_1C666ED28((uint64_t)a2);
  swift_bridgeObjectRetain();
  sub_1C666ED28((uint64_t)a2);
  uint64_t v37 = sub_1C68EC458();
  os_log_type_t v38 = sub_1C68ECE48();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (long long *)a2;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    *(void *)&v84[0] = v41;
    *(_DWORD *)uint64_t v40 = 136315394;
    uint64_t v42 = swift_bridgeObjectRetain();
    uint64_t v43 = MEMORY[0x1C87A3B40](v42, &type metadata for ContactHandle);
    uint64_t v45 = v44;
    swift_bridgeObjectRelease();
    sub_1C65B4078(v43, v45, (uint64_t)v84, v46, v47, v48, v49, v50, v62, v2, v65, v67, v69, v71, (uint64_t)v73, v75, v77, v79, v81,
      *((uint64_t *)&v81 + 1));
    *(void *)&long long v85 = v51;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2080;
    long long v52 = v39[1];
    long long v85 = *v39;
    long long v86 = v52;
    long long v87 = v39[2];
    uint64_t v53 = ContactHandleQuery.description.getter();
    sub_1C65B4078(v53, v54, (uint64_t)v84, v55, v56, v57, v58, v59, v63, v64, v66, v68, v70, v72, v74, v76, v78, v80, v82,
      v83);
    *(void *)&long long v85 = v60;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    sub_1C666ECE0((uint64_t)v39);
    sub_1C666ECE0((uint64_t)v39);
    _os_log_impl(&dword_1C65AE000, v37, v38, "[UCG] Nominating contact with %s for removal because it doesn't match the query for %s", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v41, -1, -1);
    MEMORY[0x1C87A54F0](v40, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1C666ECE0((uint64_t)a2);
    sub_1C666ECE0((uint64_t)a2);
  }

  return 0;
}

void sub_1C68D2FDC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, __n128 a5)
{
  char v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v9 = a1;
  }
  uint64_t v10 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
    uint64_t v10 = 11;
  }
  uint64_t v11 = v10 | (v9 << 16);
  uint64_t v12 = v38;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  v38[0] = a3;
  v38[1] = a4;
  uint64_t v13 = &unk_1EBBF5000;
  a5.n128_u64[0] = 136315906;
  __n128 v33 = a5;
  unint64_t v32 = MEMORY[0x1E4FBC840] + 8;
  unsigned __int8 v34 = v38;
  do
  {
    char v14 = v7;
    uint64_t v15 = v12[v8];
    sub_1C68ECAA8();
    if (v16)
    {
      if (v13[436] != -1) {
        swift_once();
      }
      uint64_t v17 = sub_1C68EC478();
      __swift_project_value_buffer(v17, (uint64_t)&unk_1EBBF7A68);
      swift_bridgeObjectRetain_n();
      unsigned int v18 = sub_1C68EC458();
      os_log_type_t v19 = sub_1C68ECE68();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v21 = v11;
        uint64_t v22 = v13;
        uint64_t v23 = swift_slowAlloc();
        v37[0] = v23;
        *(_DWORD *)uint64_t v20 = v33.n128_u32[0];
        swift_bridgeObjectRetain();
        sub_1C65B4078(a1, a2, (uint64_t)v37, v24, v25, v26, v27, v28, v31, v32, v33.n128_i64[0], v33.n128_i64[1], (uint64_t)v34, v35, v36, v37[0], v37[1], v37[2], v37[3],
          v37[4]);
        *(void *)(v20 + 4) = v29;
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 12) = 2048;
        *(void *)(v20 + 14) = v15;
        *(_WORD *)(v20 + 22) = 2048;
        *(void *)(v20 + 24) = v35;
        *(_WORD *)(v20 + 32) = 2048;
        *(void *)(v20 + 34) = v36;
        _os_log_impl(&dword_1C65AE000, v18, v19, "[UCG] Invalid UTF-16 offset: string=%s offset=%ld range=%ld:%ld", (uint8_t *)v20, 0x2Au);
        swift_arrayDestroy();
        uint64_t v30 = v23;
        uint64_t v13 = v22;
        uint64_t v11 = v21;
        uint64_t v12 = v34;
        MEMORY[0x1C87A54F0](v30, -1, -1);
        MEMORY[0x1C87A54F0](v20, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    char v7 = 1;
    uint64_t v8 = 1;
  }
  while ((v14 & 1) == 0);
}

uint64_t sub_1C68D3238(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_1C68ECAB8();
    OUTLINED_FUNCTION_69_5(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x1C87A39B0](15, a1 >> 16);
    OUTLINED_FUNCTION_69_5(v3);
    return v4 | 8;
  }
}

uint64_t sub_1C68D3294(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E4F143B8];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    uint64_t v5 = (void *)((char *)v10 - ((8 * v4 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1C65F7DA0(0, v4, v5);
    sub_1C68D33F8(v5, v4, v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (unint64_t *)swift_slowAlloc();
    sub_1C65F7DA0(0, v4, v7);
    sub_1C68D33F8(v7, v4, v2);
    uint64_t v2 = v8;
    MEMORY[0x1C87A54F0](v7, -1, -1);
  }
  return v2;
}

void sub_1C68D33F8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
LABEL_4:
  uint64_t v22 = v4;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_18;
    }
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v5 >= v10) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    if (!v14) {
      break;
    }
LABEL_17:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_18:
    uint64_t v16 = swift_bridgeObjectRetain();
    char v17 = sub_1C68B8770(v16);
    swift_bridgeObjectRelease();
    if (v17)
    {
      uint64_t v18 = swift_bridgeObjectRetain();
      char v19 = sub_1C68B8890(v18);
      swift_bridgeObjectRelease();
      if (v19)
      {
        *(unint64_t *)((char *)a1 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        uint64_t v4 = v22 + 1;
        if (!__OFADD__(v22, 1)) {
          goto LABEL_4;
        }
        __break(1u);
LABEL_28:
        sub_1C68D39CC(a1, a2, v22, (void *)a3);
        return;
      }
    }
  }
  int64_t v15 = v5 + 1;
  if (v5 + 1 >= v10) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v5 + 2;
  if (v5 + 2 >= v10) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v5 + 3;
  if (v5 + 3 >= v10) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
LABEL_16:
    int64_t v5 = v15;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_17;
    }
  }
LABEL_30:
  __break(1u);
}

void sub_1C68D35D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return;
  }
  OUTLINED_FUNCTION_112_2();
  if (v7)
  {
    swift_retain();
    return;
  }
  uint64_t v8 = v6;
  unint64_t v9 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B418);
  uint64_t v10 = sub_1C68ED558();
  uint64_t v28 = v9;
  uint64_t v29 = v8;
  if (v8 < 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = *v9;
  }
  uint64_t v12 = 0;
  while (1)
  {
    if (v11)
    {
      OUTLINED_FUNCTION_90_2();
      goto LABEL_26;
    }
    uint64_t v14 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v29) {
      return;
    }
    ++v12;
    if (!v28[v14])
    {
      uint64_t v12 = v14 + 1;
      if (v14 + 1 >= v29) {
        return;
      }
      if (!v28[v12])
      {
        uint64_t v12 = v14 + 2;
        if (v14 + 2 >= v29) {
          return;
        }
        if (!v28[v12]) {
          break;
        }
      }
    }
LABEL_25:
    OUTLINED_FUNCTION_88_1();
LABEL_26:
    uint64_t v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v13);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void *)(*(void *)(v3 + 56) + 8 * v13);
    sub_1C68ED938();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C68EC7D8();
    sub_1C68ED988();
    OUTLINED_FUNCTION_37_19();
    if (v7)
    {
      OUTLINED_FUNCTION_7_45();
      while (++v22 != v23 || (v21 & 1) == 0)
      {
        BOOL v24 = v22 == v23;
        if (v22 == v23) {
          uint64_t v22 = 0;
        }
        v21 |= v24;
        if (*(void *)(v10 + 64 + 8 * v22) != -1)
        {
          OUTLINED_FUNCTION_6_53();
          goto LABEL_35;
        }
      }
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    OUTLINED_FUNCTION_8_1();
LABEL_35:
    OUTLINED_FUNCTION_27_31(v20);
    *uint64_t v25 = v18;
    v25[1] = v17;
    *(void *)(*(void *)(v10 + 56) + 8 * v26) = v19;
    OUTLINED_FUNCTION_124_1();
    if (v27) {
      goto LABEL_39;
    }
    if (!v4) {
      return;
    }
  }
  uint64_t v15 = v14 + 3;
  if (v15 >= v29) {
    return;
  }
  if (v28[v15])
  {
    uint64_t v12 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    ++v15;
    if (v28[v12]) {
      goto LABEL_25;
    }
  }
LABEL_41:
  __break(1u);
}

void sub_1C68D37D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return;
  }
  OUTLINED_FUNCTION_112_2();
  if (v7)
  {
    swift_retain();
    return;
  }
  uint64_t v8 = v6;
  unint64_t v9 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65E8);
  uint64_t v10 = sub_1C68ED558();
  uint64_t v29 = v9;
  uint64_t v30 = v8;
  if (v8 < 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = *v9;
  }
  uint64_t v12 = 0;
  while (1)
  {
    if (v11)
    {
      OUTLINED_FUNCTION_90_2();
      goto LABEL_26;
    }
    uint64_t v14 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v30) {
      return;
    }
    ++v12;
    if (!v29[v14])
    {
      uint64_t v12 = v14 + 1;
      if (v14 + 1 >= v30) {
        return;
      }
      if (!v29[v12])
      {
        uint64_t v12 = v14 + 2;
        if (v14 + 2 >= v30) {
          return;
        }
        if (!v29[v12]) {
          break;
        }
      }
    }
LABEL_25:
    OUTLINED_FUNCTION_88_1();
LABEL_26:
    uint64_t v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v13);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void **)(*(void *)(v3 + 56) + 8 * v13);
    sub_1C68ED938();
    swift_bridgeObjectRetain();
    id v20 = v19;
    sub_1C68EC7D8();
    sub_1C68ED988();
    OUTLINED_FUNCTION_37_19();
    if (v7)
    {
      OUTLINED_FUNCTION_7_45();
      while (++v23 != v24 || (v22 & 1) == 0)
      {
        BOOL v25 = v23 == v24;
        if (v23 == v24) {
          uint64_t v23 = 0;
        }
        v22 |= v25;
        if (*(void *)(v10 + 64 + 8 * v23) != -1)
        {
          OUTLINED_FUNCTION_6_53();
          goto LABEL_35;
        }
      }
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    OUTLINED_FUNCTION_8_1();
LABEL_35:
    OUTLINED_FUNCTION_27_31(v21);
    *uint64_t v26 = v18;
    v26[1] = v17;
    *(void *)(*(void *)(v10 + 56) + 8 * v27) = v20;
    OUTLINED_FUNCTION_124_1();
    if (v28) {
      goto LABEL_39;
    }
    if (!v4) {
      return;
    }
  }
  uint64_t v15 = v14 + 3;
  if (v15 >= v30) {
    return;
  }
  if (v29[v15])
  {
    uint64_t v12 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      return;
    }
    ++v15;
    if (v29[v12]) {
      goto LABEL_25;
    }
  }
LABEL_41:
  __break(1u);
}

void sub_1C68D39CC(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a3) {
    return;
  }
  uint64_t v5 = a3;
  if (a4[2] == a3)
  {
    swift_retain();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA408918);
  uint64_t v8 = (void *)sub_1C68ED558();
  BOOL v25 = a1;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_25;
    }
    uint64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_29;
    }
    if (v13 >= a2) {
      return;
    }
    unint64_t v14 = v25[v13];
    ++v10;
    if (!v14)
    {
      uint64_t v10 = v13 + 1;
      if (v13 + 1 >= a2) {
        return;
      }
      unint64_t v14 = v25[v10];
      if (!v14)
      {
        uint64_t v10 = v13 + 2;
        if (v13 + 2 >= a2) {
          return;
        }
        unint64_t v14 = v25[v10];
        if (!v14) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_25:
    uint64_t v16 = (uint64_t *)(a4[6] + 32 * v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = v16[2];
    uint64_t v20 = v16[3];
    uint64_t v21 = a4[7] + 40 * v12;
    uint64_t v22 = *(void *)(v21 + 32);
    long long v23 = *(_OWORD *)(v21 + 16);
    v26[0] = *(_OWORD *)v21;
    v26[1] = v23;
    uint64_t v27 = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C68D8480((uint64_t)v26);
    sub_1C6767980(v17, v18, v19, v20, (uint64_t)v26, v8);
    if (__OFSUB__(v5--, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (!v5) {
      return;
    }
  }
  uint64_t v15 = v13 + 3;
  if (v15 >= a2) {
    return;
  }
  unint64_t v14 = v25[v15];
  if (v14)
  {
    uint64_t v10 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= a2) {
      return;
    }
    unint64_t v14 = v25[v10];
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_1C68D3BAC(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v37 = v4;
  if (!v4) {
    return swift_bridgeObjectRelease_n();
  }
  unint64_t v5 = 0;
  uint64_t v6 = (uint64_t *)(a1 + 48);
  while (v5 < *(void *)(a1 + 16))
  {
    uint64_t v8 = v6[5];
    uint64_t v7 = v6[6];
    uint64_t v9 = v6[3];
    uint64_t v10 = v6[1];
    uint64_t v39 = v6[2];
    uint64_t v41 = v6[4];
    uint64_t v12 = *(v6 - 1);
    uint64_t v11 = *v6;
    uint64_t v13 = *(v6 - 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v12) {
      return swift_bridgeObjectRelease_n();
    }
    uint64_t v44 = v8;
    uint64_t v45 = v7;
    uint64_t v46 = v9;
    unint64_t v43 = v5;
    unint64_t v14 = (void *)*a3;
    unint64_t v16 = sub_1C6850E1C(v13, v12, v11, v10);
    uint64_t v17 = v14[2];
    BOOL v18 = (v15 & 1) == 0;
    uint64_t v19 = v17 + v18;
    if (__OFADD__(v17, v18)) {
      goto LABEL_18;
    }
    char v20 = v15;
    if (v14[3] >= v19)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40A550);
        sub_1C68ED4E8();
      }
    }
    else
    {
      sub_1C6767658(v19, a2 & 1);
      unint64_t v21 = sub_1C6850E1C(v13, v12, v11, v10);
      if ((v20 & 1) != (v22 & 1)) {
        goto LABEL_20;
      }
      unint64_t v16 = v21;
    }
    long long v23 = (void *)*a3;
    if (v20)
    {
      uint64_t v24 = 5 * v16;
      BOOL v25 = (uint64_t *)(v23[7] + 8 * v24);
      uint64_t v26 = v25[1];
      uint64_t v27 = v25[3];
      uint64_t v40 = v25[2];
      uint64_t v42 = *v25;
      uint64_t v28 = v25[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1C68BDE24(v45, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v30 = (void *)(v23[7] + 8 * v24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *uint64_t v30 = v42;
      v30[1] = v26;
      v30[2] = v40;
      v30[3] = v27;
      v30[4] = v29;
    }
    else
    {
      v23[(v16 >> 6) + 8] |= 1 << v16;
      uint64_t v31 = (uint64_t *)(v23[6] + 32 * v16);
      *uint64_t v31 = v13;
      v31[1] = v12;
      void v31[2] = v11;
      v31[3] = v10;
      unint64_t v32 = (uint64_t *)(v23[7] + 40 * v16);
      *unint64_t v32 = v39;
      v32[1] = v46;
      v32[2] = v41;
      v32[3] = v44;
      v32[4] = v45;
      uint64_t v33 = v23[2];
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (v34) {
        goto LABEL_19;
      }
      v23[2] = v35;
    }
    unint64_t v5 = v43 + 1;
    v6 += 9;
    a2 = 1;
    if (v37 == v43 + 1) {
      return swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_1C68ED868();
  __break(1u);
  return result;
}

uint64_t sub_1C68D3E8C(uint64_t *a1, uint64_t a2)
{
  uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v206 = *(void *)(v202 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v202);
  uint64_t v201 = (uint64_t)&v193 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v210 = (uint64_t)&v193 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v214 = (uint64_t)&v193 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v211 = (uint64_t)&v193 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v207 = (uint64_t)&v193 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v204 = (uint64_t)&v193 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v196 = (uint64_t)&v193 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v197 = (uint64_t)&v193 - v19;
  unint64_t v215 = a1;
  uint64_t v20 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_1C68ED798();
  if (v21 >= v20)
  {
    if (v20 < 0) {
      goto LABEL_198;
    }
    if (v20) {
      sub_1C68D5460(0, v20, 1, v215, a2);
    }
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v195 = v21;
    uint64_t v217 = v2;
    uint64_t v193 = sub_1C666E4C0(v20 / 2);
    unint64_t v205 = v22;
    long long v23 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v216 = a2;
    uint64_t v194 = v20;
    if (v20 <= 0)
    {
      unint64_t v80 = *(void *)(MEMORY[0x1E4FBC860] + 16);
      uint64_t v26 = (char *)MEMORY[0x1E4FBC860];
LABEL_154:
      uint64_t v213 = v26;
      if (v80 >= 2)
      {
        uint64_t v176 = *v215;
        do
        {
          unint64_t v177 = v80 - 2;
          if (v80 < 2) {
            goto LABEL_192;
          }
          if (!v176) {
            goto LABEL_207;
          }
          uint64_t v178 = *(void *)&v213[16 * v177 + 32];
          uint64_t v179 = *(void *)&v213[16 * v80 + 24];
          uint64_t v180 = *(void *)(v206 + 72);
          unint64_t v181 = v176 + v180 * v178;
          unint64_t v182 = v176 + v180 * *(void *)&v213[16 * v80 + 16];
          unint64_t v183 = v176 + v180 * v179;
          uint64_t v184 = v216;
          swift_bridgeObjectRetain();
          unint64_t v185 = v181;
          uint64_t v186 = v217;
          sub_1C68D5930(v185, v182, v183, v205, v184);
          uint64_t v217 = v186;
          if (v186)
          {
            uint64_t v191 = v194;
            goto LABEL_171;
          }
          if (v179 < v178) {
            goto LABEL_193;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v213 = sub_1C676B0EC();
          }
          uint64_t v187 = v213;
          if (v177 >= *((void *)v213 + 2)) {
            goto LABEL_194;
          }
          uint64_t v188 = v213 + 32;
          uint64_t v189 = &v213[16 * v177 + 32];
          *(void *)uint64_t v189 = v178;
          *((void *)v189 + 1) = v179;
          unint64_t v190 = *((void *)v187 + 2);
          if (v80 > v190) {
            goto LABEL_195;
          }
          memmove(&v188[16 * v80 - 16], &v188[16 * v80], 16 * (v190 - v80));
          *((void *)v187 + 2) = v190 - 1;
          unint64_t v80 = v190 - 1;
        }
        while (v190 > 2);
      }
      swift_bridgeObjectRelease();
      if (v194 >= -1) {
        goto LABEL_172;
      }
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = v20;
      uint64_t v26 = (char *)MEMORY[0x1E4FBC860];
      while (1)
      {
        uint64_t v27 = v24 + 1;
        uint64_t v203 = v24;
        if (v24 + 1 < v25)
        {
          uint64_t v28 = *v215;
          uint64_t v29 = *(char **)(v206 + 72);
          uint64_t v199 = v24 + 1;
          sub_1C6626FA0(v28 + (void)v29 * v27, v197, &qword_1EBBF5210);
          uint64_t v209 = v28;
          uint64_t v212 = v29;
          uint64_t v30 = v196;
          sub_1C6626FA0(v28 + (void)v29 * v24, v196, &qword_1EBBF5210);
          uint64_t v31 = v197;
          uint64_t v208 = sub_1C68CA1F8(v197, a2);
          uint64_t v200 = sub_1C68CA1F8(v30, a2);
          sub_1C65C117C(v30, &qword_1EBBF5210);
          sub_1C65C117C(v31, &qword_1EBBF5210);
          uint64_t v32 = v24 + 2;
          if (v24 + 2 < v25)
          {
            uint64_t v213 = v26;
            uint64_t v33 = v199;
            uint64_t v198 = v25;
            while (1)
            {
              uint64_t v34 = v209;
              uint64_t v35 = v212;
              uint64_t v36 = v204;
              sub_1C6626FA0(v209 + v32 * (void)v212, v204, &qword_1EBBF5210);
              uint64_t v37 = sub_1C6626FA0(v34 + v33 * (void)v35, v207, &qword_1EBBF5210);
              MEMORY[0x1F4188790](v37);
              *(&v193 - 2) = v36;
              uint64_t v38 = v216;
              swift_bridgeObjectRetain();
              uint64_t v39 = v217;
              sub_1C665FA88(sub_1C68D9020, (uint64_t)(&v193 - 4), v38);
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)(v40 + 16);
              if (v42)
              {
                uint64_t v218 = v23;
                sub_1C66A0128(0, v42, 0);
                unint64_t v43 = v218;
                unint64_t v44 = v218[2];
                uint64_t v45 = 40;
                do
                {
                  uint64_t v46 = *(void *)(v41 + v45);
                  uint64_t v218 = v43;
                  unint64_t v47 = v43[3];
                  if (v44 >= v47 >> 1)
                  {
                    sub_1C66A0128(v47 > 1, v44 + 1, 1);
                    unint64_t v43 = v218;
                  }
                  v43[2] = v44 + 1;
                  v43[v44 + 4] = v46;
                  v45 += 16;
                  ++v44;
                  --v42;
                }
                while (v42);
                swift_bridgeObjectRelease();
                long long v23 = (void *)MEMORY[0x1E4FBC860];
              }
              else
              {
                swift_bridgeObjectRelease();
                unint64_t v43 = v23;
              }
              uint64_t v48 = v43[2];
              if (v48)
              {
                uint64_t v49 = 0;
                uint64_t v50 = v43 + 4;
                do
                {
                  uint64_t v51 = *v50++;
                  BOOL v95 = __OFADD__(v49, v51);
                  v49 += v51;
                  if (v95) {
                    goto LABEL_176;
                  }
                  --v48;
                }
                while (v48);
              }
              else
              {
                uint64_t v49 = 0;
              }
              uint64_t v52 = swift_bridgeObjectRelease();
              MEMORY[0x1F4188790](v52);
              *(&v193 - 2) = v207;
              uint64_t v53 = v216;
              swift_bridgeObjectRetain();
              sub_1C665FA88(sub_1C68D9020, (uint64_t)(&v193 - 4), v53);
              uint64_t v55 = v54;
              uint64_t v217 = v39;
              uint64_t v56 = *(void *)(v54 + 16);
              if (v56)
              {
                uint64_t v218 = v23;
                sub_1C66A0128(0, v56, 0);
                uint64_t v57 = v218;
                unint64_t v58 = v218[2];
                uint64_t v59 = 40;
                do
                {
                  uint64_t v60 = *(void *)(v55 + v59);
                  uint64_t v218 = v57;
                  unint64_t v61 = v57[3];
                  if (v58 >= v61 >> 1)
                  {
                    sub_1C66A0128(v61 > 1, v58 + 1, 1);
                    uint64_t v57 = v218;
                  }
                  v57[2] = v58 + 1;
                  v57[v58 + 4] = v60;
                  v59 += 16;
                  ++v58;
                  --v56;
                }
                while (v56);
                swift_bridgeObjectRelease();
                long long v23 = (void *)MEMORY[0x1E4FBC860];
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v57 = v23;
              }
              uint64_t v62 = v57[2];
              uint64_t v25 = v198;
              uint64_t v63 = 0;
              if (v62)
              {
                unint64_t v64 = v57 + 4;
                do
                {
                  uint64_t v65 = *v64++;
                  BOOL v95 = __OFADD__(v63, v65);
                  v63 += v65;
                  if (v95) {
                    goto LABEL_177;
                  }
                  --v62;
                }
                while (v62);
              }
              BOOL v66 = v200 < v208;
              swift_bridgeObjectRelease();
              sub_1C65C117C(v207, &qword_1EBBF5210);
              sub_1C65C117C(v204, &qword_1EBBF5210);
              if (((v66 ^ (v63 >= v49)) & 1) == 0) {
                break;
              }
              uint64_t v33 = v32++;
              if (v32 >= v25)
              {
                uint64_t v32 = v25;
                break;
              }
            }
            uint64_t v26 = v213;
            uint64_t v24 = v203;
          }
          if (v200 >= v208) {
            goto LABEL_52;
          }
          if (v32 < v24) {
            goto LABEL_203;
          }
          if (v24 >= v32)
          {
LABEL_52:
            uint64_t v27 = v32;
            a2 = v216;
          }
          else
          {
            uint64_t v198 = v25;
            uint64_t v213 = v26;
            uint64_t v67 = 0;
            uint64_t v68 = v24;
            uint64_t v69 = (void)v212 * (v32 - 1);
            uint64_t v70 = v32 * (void)v212;
            uint64_t v71 = v68;
            uint64_t v72 = v68 * (void)v212;
            do
            {
              if (v71 != v32 + v67 - 1)
              {
                uint64_t v73 = v209;
                if (!v209) {
                  goto LABEL_208;
                }
                unint64_t v74 = v209 + v72;
                sub_1C6626FE4(v209 + v72, v201, &qword_1EBBF5210);
                if (v72 < v69 || v74 >= v73 + v70)
                {
                  swift_arrayInitWithTakeFrontToBack();
                }
                else if (v72 != v69)
                {
                  swift_arrayInitWithTakeBackToFront();
                }
                sub_1C6626FE4(v201, v73 + v69, &qword_1EBBF5210);
              }
              ++v71;
              --v67;
              v69 -= (uint64_t)v212;
              v70 -= (uint64_t)v212;
              v72 += (uint64_t)v212;
            }
            while (v71 < v32 + v67);
            uint64_t v27 = v32;
            a2 = v216;
            uint64_t v26 = v213;
            long long v23 = (void *)MEMORY[0x1E4FBC860];
            uint64_t v24 = v203;
            uint64_t v25 = v198;
          }
        }
        if (v27 >= v25) {
          goto LABEL_62;
        }
        if (__OFSUB__(v27, v24)) {
          goto LABEL_199;
        }
        if (v27 - v24 >= v195) {
          goto LABEL_62;
        }
        if (__OFADD__(v24, v195)) {
          goto LABEL_201;
        }
        uint64_t v76 = v24 + v195 >= v25 ? v25 : v24 + v195;
        if (v76 < v24) {
          break;
        }
        if (v27 == v76) {
          goto LABEL_62;
        }
        uint64_t v212 = *(char **)(v206 + 72);
        uint64_t v213 = v26;
        uint64_t v200 = v76;
        do
        {
          uint64_t v199 = v27;
          uint64_t v138 = v27;
          do
          {
            uint64_t v139 = v138 - 1;
            uint64_t v140 = *v215;
            uint64_t v142 = v211;
            uint64_t v141 = v212;
            uint64_t v208 = (void)v212 * v138;
            sub_1C6626FA0(v140 + (void)v212 * v138, v211, &qword_1EBBF5210);
            uint64_t v209 = v139;
            uint64_t v143 = (void)v141 * v139;
            uint64_t v144 = sub_1C6626FA0(v140 + v143, v214, &qword_1EBBF5210);
            MEMORY[0x1F4188790](v144);
            *(&v193 - 2) = v142;
            swift_bridgeObjectRetain();
            uint64_t v145 = v217;
            sub_1C665FA88(sub_1C68D8688, (uint64_t)(&v193 - 4), a2);
            uint64_t v147 = v146;
            uint64_t v148 = *(void *)(v146 + 16);
            if (v148)
            {
              uint64_t v218 = v23;
              sub_1C66A0128(0, v148, 0);
              uint64_t v149 = v218;
              unint64_t v150 = v218[2];
              uint64_t v151 = 40;
              do
              {
                uint64_t v152 = *(void *)(v147 + v151);
                uint64_t v218 = v149;
                unint64_t v153 = v149[3];
                if (v150 >= v153 >> 1)
                {
                  sub_1C66A0128(v153 > 1, v150 + 1, 1);
                  uint64_t v149 = v218;
                }
                v149[2] = v150 + 1;
                v149[v150 + 4] = v152;
                v151 += 16;
                ++v150;
                --v148;
              }
              while (v148);
              swift_bridgeObjectRelease();
              a2 = v216;
              long long v23 = (void *)MEMORY[0x1E4FBC860];
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v149 = v23;
            }
            uint64_t v154 = v149[2];
            if (v154)
            {
              uint64_t v155 = 0;
              uint64_t v156 = v149 + 4;
              while (1)
              {
                uint64_t v157 = *v156++;
                BOOL v95 = __OFADD__(v155, v157);
                v155 += v157;
                if (v95) {
                  break;
                }
                if (!--v154) {
                  goto LABEL_128;
                }
              }
              __break(1u);
LABEL_175:
              __break(1u);
LABEL_176:
              __break(1u);
LABEL_177:
              __break(1u);
LABEL_178:
              __break(1u);
LABEL_179:
              __break(1u);
LABEL_180:
              __break(1u);
LABEL_181:
              __break(1u);
LABEL_182:
              __break(1u);
LABEL_183:
              __break(1u);
LABEL_184:
              __break(1u);
LABEL_185:
              __break(1u);
LABEL_186:
              __break(1u);
LABEL_187:
              __break(1u);
LABEL_188:
              __break(1u);
LABEL_189:
              __break(1u);
LABEL_190:
              __break(1u);
LABEL_191:
              __break(1u);
LABEL_192:
              __break(1u);
LABEL_193:
              __break(1u);
LABEL_194:
              __break(1u);
LABEL_195:
              __break(1u);
LABEL_196:
              __break(1u);
LABEL_197:
              __break(1u);
LABEL_198:
              __break(1u);
LABEL_199:
              __break(1u);
              goto LABEL_200;
            }
            uint64_t v155 = 0;
LABEL_128:
            uint64_t v158 = swift_bridgeObjectRelease();
            MEMORY[0x1F4188790](v158);
            *(&v193 - 2) = v214;
            swift_bridgeObjectRetain();
            sub_1C665FA88(sub_1C68D9020, (uint64_t)(&v193 - 4), a2);
            uint64_t v160 = v159;
            uint64_t v217 = v145;
            uint64_t v161 = *(void *)(v159 + 16);
            if (v161)
            {
              uint64_t v218 = v23;
              sub_1C66A0128(0, v161, 0);
              uint64_t v162 = v218;
              unint64_t v163 = v218[2];
              uint64_t v164 = 40;
              do
              {
                uint64_t v165 = *(void *)(v160 + v164);
                uint64_t v218 = v162;
                unint64_t v166 = v162[3];
                if (v163 >= v166 >> 1)
                {
                  sub_1C66A0128(v166 > 1, v163 + 1, 1);
                  uint64_t v162 = v218;
                }
                v162[2] = v163 + 1;
                v162[v163 + 4] = v165;
                v164 += 16;
                ++v163;
                --v161;
              }
              while (v161);
              swift_bridgeObjectRelease();
              a2 = v216;
              long long v23 = (void *)MEMORY[0x1E4FBC860];
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v162 = v23;
            }
            uint64_t v167 = v162[2];
            uint64_t v24 = v203;
            uint64_t v168 = 0;
            if (v167)
            {
              uint64_t v169 = v162 + 4;
              do
              {
                uint64_t v170 = *v169++;
                BOOL v95 = __OFADD__(v168, v170);
                v168 += v170;
                if (v95) {
                  goto LABEL_175;
                }
              }
              while (--v167);
            }
            swift_bridgeObjectRelease();
            sub_1C65C117C(v214, &qword_1EBBF5210);
            sub_1C65C117C(v211, &qword_1EBBF5210);
            if (v168 >= v155) {
              break;
            }
            uint64_t v171 = *v215;
            if (!*v215) {
              goto LABEL_206;
            }
            uint64_t v172 = v208;
            unint64_t v173 = v171 + v208;
            uint64_t v174 = v171 + v143;
            sub_1C6626FE4(v171 + v208, v210, &qword_1EBBF5210);
            if (v172 < v143 || v173 >= (unint64_t)&v212[v174]) {
              swift_arrayInitWithTakeFrontToBack();
            }
            sub_1C6626FE4(v210, v174, &qword_1EBBF5210);
            uint64_t v138 = v209;
          }
          while (v209 != v24);
          uint64_t v27 = v199 + 1;
        }
        while (v199 + 1 != v200);
        uint64_t v27 = v200;
        uint64_t v26 = v213;
LABEL_62:
        if (v27 < v24) {
          goto LABEL_197;
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v199 = v27;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v26 = sub_1C65C8578(0, *((void *)v26 + 2) + 1, 1, v26);
        }
        unint64_t v79 = *((void *)v26 + 2);
        unint64_t v78 = *((void *)v26 + 3);
        unint64_t v80 = v79 + 1;
        if (v79 >= v78 >> 1) {
          uint64_t v26 = sub_1C65C8578((char *)(v78 > 1), v79 + 1, 1, v26);
        }
        *((void *)v26 + 2) = v80;
        long long v81 = v26 + 32;
        uint64_t v82 = &v26[16 * v79 + 32];
        uint64_t v83 = v199;
        *(void *)uint64_t v82 = v24;
        *((void *)v82 + 1) = v83;
        if (v79)
        {
          uint64_t v212 = v26 + 32;
          uint64_t v213 = v26;
          while (1)
          {
            unint64_t v84 = v80 - 1;
            if (v80 >= 4)
            {
              uint64_t v89 = &v81[16 * v80];
              uint64_t v90 = *((void *)v89 - 8);
              uint64_t v91 = *((void *)v89 - 7);
              BOOL v95 = __OFSUB__(v91, v90);
              uint64_t v92 = v91 - v90;
              if (v95) {
                goto LABEL_182;
              }
              uint64_t v94 = *((void *)v89 - 6);
              uint64_t v93 = *((void *)v89 - 5);
              BOOL v95 = __OFSUB__(v93, v94);
              uint64_t v87 = v93 - v94;
              char v88 = v95;
              if (v95) {
                goto LABEL_183;
              }
              unint64_t v96 = v80 - 2;
              uint64_t v97 = &v81[16 * v80 - 32];
              uint64_t v99 = *(void *)v97;
              uint64_t v98 = *((void *)v97 + 1);
              BOOL v95 = __OFSUB__(v98, v99);
              uint64_t v100 = v98 - v99;
              if (v95) {
                goto LABEL_184;
              }
              BOOL v95 = __OFADD__(v87, v100);
              uint64_t v101 = v87 + v100;
              if (v95) {
                goto LABEL_186;
              }
              if (v101 >= v92)
              {
                uint64_t v119 = &v81[16 * v84];
                uint64_t v121 = *(void *)v119;
                uint64_t v120 = *((void *)v119 + 1);
                BOOL v95 = __OFSUB__(v120, v121);
                uint64_t v122 = v120 - v121;
                if (v95) {
                  goto LABEL_196;
                }
                BOOL v112 = v87 < v122;
                goto LABEL_100;
              }
            }
            else
            {
              if (v80 != 3)
              {
                uint64_t v113 = *((void *)v26 + 4);
                uint64_t v114 = *((void *)v26 + 5);
                BOOL v95 = __OFSUB__(v114, v113);
                uint64_t v106 = v114 - v113;
                char v107 = v95;
                goto LABEL_94;
              }
              uint64_t v86 = *((void *)v26 + 4);
              uint64_t v85 = *((void *)v26 + 5);
              BOOL v95 = __OFSUB__(v85, v86);
              uint64_t v87 = v85 - v86;
              char v88 = v95;
            }
            if (v88) {
              goto LABEL_185;
            }
            unint64_t v96 = v80 - 2;
            uint64_t v102 = &v81[16 * v80 - 32];
            uint64_t v104 = *(void *)v102;
            uint64_t v103 = *((void *)v102 + 1);
            BOOL v105 = __OFSUB__(v103, v104);
            uint64_t v106 = v103 - v104;
            char v107 = v105;
            if (v105) {
              goto LABEL_187;
            }
            uint64_t v108 = &v81[16 * v84];
            uint64_t v110 = *(void *)v108;
            uint64_t v109 = *((void *)v108 + 1);
            BOOL v95 = __OFSUB__(v109, v110);
            uint64_t v111 = v109 - v110;
            if (v95) {
              goto LABEL_189;
            }
            if (__OFADD__(v106, v111)) {
              goto LABEL_191;
            }
            if (v106 + v111 >= v87)
            {
              BOOL v112 = v87 < v111;
LABEL_100:
              if (v112) {
                unint64_t v84 = v96;
              }
              goto LABEL_102;
            }
LABEL_94:
            if (v107) {
              goto LABEL_188;
            }
            os_log_type_t v115 = &v81[16 * v84];
            uint64_t v117 = *(void *)v115;
            uint64_t v116 = *((void *)v115 + 1);
            BOOL v95 = __OFSUB__(v116, v117);
            uint64_t v118 = v116 - v117;
            if (v95) {
              goto LABEL_190;
            }
            if (v118 < v106) {
              goto LABEL_111;
            }
LABEL_102:
            unint64_t v123 = v84 - 1;
            if (v84 - 1 >= v80) {
              goto LABEL_178;
            }
            uint64_t v124 = *v215;
            if (!*v215) {
              goto LABEL_205;
            }
            uint64_t v125 = &v81[16 * v123];
            uint64_t v126 = *(void *)v125;
            unint64_t v127 = v84;
            unint64_t v128 = &v81[16 * v84];
            uint64_t v129 = *((void *)v128 + 1);
            uint64_t v130 = *(void *)(v206 + 72);
            unint64_t v131 = v124 + v130 * *(void *)v125;
            unint64_t v132 = v124 + v130 * *(void *)v128;
            unint64_t v133 = v124 + v130 * v129;
            uint64_t v134 = v216;
            swift_bridgeObjectRetain();
            unint64_t v135 = v131;
            uint64_t v136 = v217;
            sub_1C68D5930(v135, v132, v133, v205, v134);
            if (v136)
            {
              uint64_t v191 = v194;
LABEL_171:
              swift_bridgeObjectRelease();
              if (v191 >= -1)
              {
LABEL_172:
                *(void *)(v193 + 16) = 0;
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                return swift_bridgeObjectRelease();
              }
LABEL_200:
              __break(1u);
LABEL_201:
              __break(1u);
              goto LABEL_202;
            }
            if (v129 < v126) {
              goto LABEL_179;
            }
            uint64_t v26 = v213;
            if (v127 > *((void *)v213 + 2)) {
              goto LABEL_180;
            }
            *(void *)uint64_t v125 = v126;
            *(void *)&v212[16 * v123 + 8] = v129;
            unint64_t v137 = *((void *)v26 + 2);
            if (v127 >= v137) {
              goto LABEL_181;
            }
            uint64_t v217 = 0;
            unint64_t v80 = v137 - 1;
            memmove(v128, v128 + 16, 16 * (v137 - 1 - v127));
            long long v81 = v212;
            *((void *)v26 + 2) = v137 - 1;
            long long v23 = (void *)MEMORY[0x1E4FBC860];
            if (v137 <= 2) {
              goto LABEL_111;
            }
          }
        }
        unint64_t v80 = 1;
LABEL_111:
        a2 = v216;
        uint64_t v25 = v215[1];
        uint64_t v24 = v199;
        if (v199 >= v25) {
          goto LABEL_154;
        }
      }
LABEL_202:
      __break(1u);
LABEL_203:
      __break(1u);
    }
    __break(1u);
LABEL_205:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_206:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_207:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_208:
    uint64_t result = swift_bridgeObjectRelease_n();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C68D4E8C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1C68ED798();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_1C676089C(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_124;
  }
  uint64_t v5 = result;
  uint64_t result = sub_1C666E478(v3 / 2);
  uint64_t v83 = a1;
  uint64_t v84 = result;
  char v88 = v6;
  uint64_t v86 = v3;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    unint64_t v26 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_90:
    if (v26 < 2)
    {
LABEL_101:
      uint64_t result = swift_bridgeObjectRelease();
      if (v86 >= -1)
      {
        *(void *)(v84 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_129;
    }
    uint64_t v76 = *v83;
    while (1)
    {
      unint64_t v77 = v26 - 2;
      if (v26 < 2) {
        break;
      }
      if (!v76) {
        goto LABEL_133;
      }
      uint64_t v78 = *(void *)(v9 + 32 + 16 * v77);
      uint64_t v79 = *(void *)(v9 + 32 + 16 * (v26 - 1) + 8);
      uint64_t result = sub_1C67608F4((uint64_t *)(v76 + 8 * v78), (uint64_t *)(v76 + 8 * *(void *)(v9 + 32 + 16 * (v26 - 1))), v76 + 8 * v79, v88);
      if (v1) {
        goto LABEL_86;
      }
      if (v79 < v78) {
        goto LABEL_119;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1C676B0EC();
        uint64_t v9 = result;
      }
      if (v77 >= *(void *)(v9 + 16)) {
        goto LABEL_120;
      }
      unint64_t v80 = (void *)(v9 + 32 + 16 * v77);
      *unint64_t v80 = v78;
      v80[1] = v79;
      unint64_t v81 = *(void *)(v9 + 16);
      if (v26 > v81) {
        goto LABEL_121;
      }
      uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v26 - 1)), (const void *)(v9 + 32 + 16 * v26), 16 * (v81 - v26));
      *(void *)(v9 + 16) = v81 - 1;
      unint64_t v26 = v81 - 1;
      if (v81 <= 2) {
        goto LABEL_101;
      }
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
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
    return result;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v82 = *a1 - 8;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  uint64_t v85 = v5;
  uint64_t v87 = *a1;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 < v3)
    {
      uint64_t v11 = *(void *)(v8 + 8 * v7);
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      uint64_t v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        uint64_t v13 = v11;
        while (1)
        {
          uint64_t v14 = *(void *)(v8 + 8 * v7);
          if (v11 < v12 == v14 >= v13) {
            break;
          }
          ++v7;
          uint64_t v13 = v14;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v11 < v12)
      {
        if (v7 < v10) {
          goto LABEL_126;
        }
        if (v10 < v7)
        {
          uint64_t v15 = v7 - 1;
          uint64_t v16 = v10;
          do
          {
            if (v16 != v15)
            {
              if (!v8) {
                goto LABEL_132;
              }
              uint64_t v17 = *(void *)(v8 + 8 * v16);
              *(void *)(v8 + 8 * v16) = *(void *)(v8 + 8 * v15);
              *(void *)(v8 + 8 * v15) = v17;
            }
            BOOL v57 = ++v16 < v15--;
          }
          while (v57);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_123;
      }
      if (v7 - v10 < v5)
      {
        uint64_t v18 = v10 + v5;
        if (__OFADD__(v10, v5)) {
          goto LABEL_127;
        }
        if (v18 >= v3) {
          uint64_t v18 = v3;
        }
        if (v18 < v10) {
          goto LABEL_128;
        }
        if (v7 != v18)
        {
          uint64_t v19 = (uint64_t *)(v82 + 8 * v7);
          do
          {
            uint64_t v20 = *(void *)(v8 + 8 * v7);
            uint64_t v21 = v10;
            unint64_t v22 = v19;
            do
            {
              uint64_t v23 = *v22;
              if (v20 >= *v22) {
                break;
              }
              if (!v8) {
                goto LABEL_130;
              }
              *unint64_t v22 = v20;
              v22[1] = v23;
              --v22;
              ++v21;
            }
            while (v7 != v21);
            ++v7;
            ++v19;
          }
          while (v7 != v18);
          uint64_t v7 = v18;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_122;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1C65C8578(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v25 = *(void *)(v9 + 16);
    unint64_t v24 = *(void *)(v9 + 24);
    unint64_t v26 = v25 + 1;
    uint64_t v8 = v87;
    if (v25 >= v24 >> 1)
    {
      uint64_t result = (uint64_t)sub_1C65C8578((char *)(v24 > 1), v25 + 1, 1, (char *)v9);
      uint64_t v8 = v87;
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v26;
    uint64_t v27 = v9 + 32;
    uint64_t v28 = (uint64_t *)(v9 + 32 + 16 * v25);
    *uint64_t v28 = v10;
    v28[1] = v7;
    if (v25) {
      break;
    }
    unint64_t v26 = 1;
LABEL_81:
    uint64_t v5 = v85;
    uint64_t v3 = v86;
    if (v7 >= v86) {
      goto LABEL_90;
    }
  }
  while (1)
  {
    unint64_t v29 = v26 - 1;
    if (v26 >= 4)
    {
      unint64_t v34 = v27 + 16 * v26;
      uint64_t v35 = *(void *)(v34 - 64);
      uint64_t v36 = *(void *)(v34 - 56);
      BOOL v40 = __OFSUB__(v36, v35);
      uint64_t v37 = v36 - v35;
      if (v40) {
        goto LABEL_107;
      }
      uint64_t v39 = *(void *)(v34 - 48);
      uint64_t v38 = *(void *)(v34 - 40);
      BOOL v40 = __OFSUB__(v38, v39);
      uint64_t v32 = v38 - v39;
      char v33 = v40;
      if (v40) {
        goto LABEL_108;
      }
      unint64_t v41 = v26 - 2;
      uint64_t v42 = (uint64_t *)(v27 + 16 * (v26 - 2));
      uint64_t v44 = *v42;
      uint64_t v43 = v42[1];
      BOOL v40 = __OFSUB__(v43, v44);
      uint64_t v45 = v43 - v44;
      if (v40) {
        goto LABEL_109;
      }
      BOOL v40 = __OFADD__(v32, v45);
      uint64_t v46 = v32 + v45;
      if (v40) {
        goto LABEL_111;
      }
      if (v46 >= v37)
      {
        unint64_t v64 = (uint64_t *)(v27 + 16 * v29);
        uint64_t v66 = *v64;
        uint64_t v65 = v64[1];
        BOOL v40 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v40) {
          goto LABEL_117;
        }
        BOOL v57 = v32 < v67;
        goto LABEL_70;
      }
    }
    else
    {
      if (v26 != 3)
      {
        uint64_t v58 = *(void *)(v9 + 32);
        uint64_t v59 = *(void *)(v9 + 40);
        BOOL v40 = __OFSUB__(v59, v58);
        uint64_t v51 = v59 - v58;
        char v52 = v40;
        goto LABEL_64;
      }
      uint64_t v31 = *(void *)(v9 + 32);
      uint64_t v30 = *(void *)(v9 + 40);
      BOOL v40 = __OFSUB__(v30, v31);
      uint64_t v32 = v30 - v31;
      char v33 = v40;
    }
    if (v33) {
      goto LABEL_110;
    }
    unint64_t v41 = v26 - 2;
    unint64_t v47 = (uint64_t *)(v27 + 16 * (v26 - 2));
    uint64_t v49 = *v47;
    uint64_t v48 = v47[1];
    BOOL v50 = __OFSUB__(v48, v49);
    uint64_t v51 = v48 - v49;
    char v52 = v50;
    if (v50) {
      goto LABEL_112;
    }
    uint64_t v53 = (uint64_t *)(v27 + 16 * v29);
    uint64_t v55 = *v53;
    uint64_t v54 = v53[1];
    BOOL v40 = __OFSUB__(v54, v55);
    uint64_t v56 = v54 - v55;
    if (v40) {
      goto LABEL_114;
    }
    if (__OFADD__(v51, v56)) {
      goto LABEL_116;
    }
    if (v51 + v56 >= v32)
    {
      BOOL v57 = v32 < v56;
LABEL_70:
      if (v57) {
        unint64_t v29 = v41;
      }
      goto LABEL_72;
    }
LABEL_64:
    if (v52) {
      goto LABEL_113;
    }
    uint64_t v60 = (uint64_t *)(v27 + 16 * v29);
    uint64_t v62 = *v60;
    uint64_t v61 = v60[1];
    BOOL v40 = __OFSUB__(v61, v62);
    uint64_t v63 = v61 - v62;
    if (v40) {
      goto LABEL_115;
    }
    if (v63 < v51) {
      goto LABEL_81;
    }
LABEL_72:
    uint64_t v68 = v9;
    unint64_t v69 = v29 - 1;
    if (v29 - 1 >= v26)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
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
      goto LABEL_118;
    }
    if (!v8) {
      goto LABEL_131;
    }
    uint64_t v70 = (uint64_t *)(v27 + 16 * v69);
    uint64_t v71 = *v70;
    uint64_t v72 = v27;
    uint64_t v73 = (void *)(v27 + 16 * v29);
    uint64_t v74 = v73[1];
    uint64_t result = sub_1C67608F4((uint64_t *)(v8 + 8 * *v70), (uint64_t *)(v8 + 8 * *v73), v8 + 8 * v74, v88);
    if (v1) {
      break;
    }
    if (v74 < v71) {
      goto LABEL_104;
    }
    if (v29 > *(void *)(v68 + 16)) {
      goto LABEL_105;
    }
    *uint64_t v70 = v71;
    *(void *)(v72 + 16 * v69 + 8) = v74;
    unint64_t v75 = *(void *)(v68 + 16);
    if (v29 >= v75) {
      goto LABEL_106;
    }
    uint64_t v9 = v68;
    unint64_t v26 = v75 - 1;
    uint64_t result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v29));
    uint64_t v27 = v72;
    *(void *)(v68 + 16) = v75 - 1;
    uint64_t v8 = v87;
    if (v75 <= 2) {
      goto LABEL_81;
    }
  }
LABEL_86:
  uint64_t result = swift_bridgeObjectRelease();
  if (v86 < -1) {
    goto LABEL_125;
  }
  *(void *)(v84 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68D5460(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v62 = a1;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v10 = MEMORY[0x1F4188790](v61);
  uint64_t v67 = (uint64_t)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v58 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v58 - v16;
  uint64_t v59 = a2;
  if (a3 != a2)
  {
    uint64_t v70 = *(void *)(v15 + 72);
    uint64_t v71 = v5;
    uint64_t v65 = v14;
    uint64_t v66 = a5;
    uint64_t v63 = a4;
    unint64_t v64 = (char *)&v58 - v16;
LABEL_4:
    uint64_t v60 = a3;
    uint64_t v19 = a3;
    while (1)
    {
      uint64_t v20 = v19 - 1;
      uint64_t v21 = *a4;
      uint64_t v22 = v70;
      uint64_t v68 = v70 * v19;
      sub_1C6626FA0(v21 + v70 * v19, (uint64_t)v17, &qword_1EBBF5210);
      uint64_t v69 = v20;
      uint64_t v23 = v22 * v20;
      uint64_t v24 = sub_1C6626FA0(v21 + v22 * v20, (uint64_t)v14, &qword_1EBBF5210);
      MEMORY[0x1F4188790](v24);
      *(&v58 - 2) = (uint64_t)v17;
      swift_bridgeObjectRetain();
      uint64_t v25 = v71;
      sub_1C665FA88(sub_1C68D9020, (uint64_t)(&v58 - 4), a5);
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)(v26 + 16);
      if (v28)
      {
        uint64_t v72 = (void *)MEMORY[0x1E4FBC860];
        sub_1C66A0128(0, v28, 0);
        unint64_t v29 = v72;
        unint64_t v30 = v72[2];
        uint64_t v31 = 40;
        do
        {
          uint64_t v32 = *(void *)(v27 + v31);
          uint64_t v72 = v29;
          unint64_t v33 = v29[3];
          if (v30 >= v33 >> 1)
          {
            sub_1C66A0128(v33 > 1, v30 + 1, 1);
            unint64_t v29 = v72;
          }
          v29[2] = v30 + 1;
          v29[v30 + 4] = v32;
          v31 += 16;
          ++v30;
          --v28;
        }
        while (v28);
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v14 = v65;
        a5 = v66;
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v29 = (void *)MEMORY[0x1E4FBC860];
      }
      uint64_t v34 = v29[2];
      if (v34) {
        break;
      }
      uint64_t v35 = 0;
LABEL_18:
      uint64_t v39 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v39);
      *(&v58 - 2) = (uint64_t)v14;
      swift_bridgeObjectRetain();
      sub_1C665FA88(sub_1C68D9020, (uint64_t)(&v58 - 4), a5);
      uint64_t v41 = v40;
      uint64_t v71 = v25;
      uint64_t v42 = *(void *)(v40 + 16);
      if (v42)
      {
        uint64_t v72 = (void *)MEMORY[0x1E4FBC860];
        sub_1C66A0128(0, v42, 0);
        uint64_t v43 = v72;
        unint64_t v44 = v72[2];
        uint64_t v45 = 40;
        do
        {
          uint64_t v46 = *(void *)(v41 + v45);
          uint64_t v72 = v43;
          unint64_t v47 = v43[3];
          if (v44 >= v47 >> 1)
          {
            sub_1C66A0128(v47 > 1, v44 + 1, 1);
            uint64_t v43 = v72;
          }
          v43[2] = v44 + 1;
          v43[v44 + 4] = v46;
          v45 += 16;
          ++v44;
          --v42;
        }
        while (v42);
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v14 = v65;
        a5 = v66;
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v43 = (void *)MEMORY[0x1E4FBC860];
      }
      uint64_t v48 = v43[2];
      uint64_t v17 = v64;
      uint64_t v49 = 0;
      if (v48)
      {
        BOOL v50 = v43 + 4;
        while (1)
        {
          uint64_t v51 = *v50++;
          BOOL v38 = __OFADD__(v49, v51);
          v49 += v51;
          if (v38) {
            break;
          }
          if (!--v48) {
            goto LABEL_29;
          }
        }
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
LABEL_29:
      swift_bridgeObjectRelease();
      sub_1C65C117C((uint64_t)v14, &qword_1EBBF5210);
      uint64_t result = sub_1C65C117C((uint64_t)v17, &qword_1EBBF5210);
      BOOL v52 = v49 < v35;
      a4 = v63;
      if (!v52) {
        goto LABEL_39;
      }
      uint64_t v53 = *v63;
      if (!*v63) {
        goto LABEL_43;
      }
      uint64_t v54 = v68;
      unint64_t v55 = v53 + v68;
      uint64_t v56 = v53 + v23;
      sub_1C6626FE4(v53 + v68, v67, &qword_1EBBF5210);
      if (v54 < v23 || v55 >= v56 + v70) {
        swift_arrayInitWithTakeFrontToBack();
      }
      sub_1C6626FE4(v67, v56, &qword_1EBBF5210);
      uint64_t v19 = v69;
      if (v69 == v62)
      {
LABEL_39:
        a3 = v60 + 1;
        if (v60 + 1 != v59) {
          goto LABEL_4;
        }
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v35 = 0;
    uint64_t v36 = v29 + 4;
    while (1)
    {
      uint64_t v37 = *v36++;
      BOOL v38 = __OFADD__(v35, v37);
      v35 += v37;
      if (v38) {
        break;
      }
      if (!--v34) {
        goto LABEL_18;
      }
    }
    __break(1u);
    goto LABEL_42;
  }
  return swift_bridgeObjectRelease();
}

void sub_1C68D5930(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v58 = a5;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5210);
  uint64_t v9 = MEMORY[0x1F4188790](v55);
  uint64_t v57 = (uint64_t)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v56 = (uint64_t)&v48 - v11;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  int64_t v14 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_76;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_77;
  }
  unint64_t v54 = a3;
  uint64_t v18 = v14 / v13;
  uint64_t v19 = v16 / v13;
  if (v14 / v13 >= v16 / v13)
  {
    sub_1C669C4D4(a2, v16 / v13);
    unint64_t v20 = a4 + v19 * v13;
    if (v19 * v13 < 1 || a1 >= a2) {
      goto LABEL_70;
    }
    unint64_t v51 = a4;
    uint64_t v52 = -v13;
    unint64_t v34 = v54;
    uint64_t v49 = v13;
    unint64_t v50 = a1;
    while (1)
    {
      unint64_t v35 = v34;
      uint64_t v36 = v52;
      v34 += v52;
      unint64_t v54 = v20 + v52;
      uint64_t v37 = v56;
      sub_1C6626FA0(v20 + v52, v56, &qword_1EBBF5210);
      unint64_t v53 = a2 + v36;
      uint64_t v38 = v57;
      sub_1C6626FA0(a2 + v36, v57, &qword_1EBBF5210);
      uint64_t v39 = v58;
      uint64_t v40 = sub_1C68CA1F8(v37, v58);
      uint64_t v41 = sub_1C68CA1F8(v38, v39);
      sub_1C65C117C(v38, &qword_1EBBF5210);
      sub_1C65C117C(v37, &qword_1EBBF5210);
      if (v41 >= v40)
      {
        if (v35 >= v20 && v34 < v20)
        {
          unint64_t v44 = v50;
          a4 = v51;
          if (v35 == v20)
          {
            unint64_t v20 = v54;
            goto LABEL_66;
          }
          unint64_t v20 = v54;
LABEL_63:
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_66;
        }
        unint64_t v20 = v54;
      }
      else
      {
        if (v35 >= a2 && v34 < a2)
        {
          unint64_t v44 = v50;
          a4 = v51;
          if (v35 == a2)
          {
            a2 = v53;
            goto LABEL_66;
          }
          a2 = v53;
          goto LABEL_63;
        }
        a2 = v53;
      }
      swift_arrayInitWithTakeFrontToBack();
      unint64_t v44 = v50;
      a4 = v51;
LABEL_66:
      uint64_t v13 = v49;
      if (v20 <= a4 || a2 <= v44) {
        goto LABEL_70;
      }
    }
  }
  sub_1C669C4D4(a1, v14 / v13);
  unint64_t v20 = a4 + v18 * v13;
  if (v18 * v13 >= 1 && a2 < v54)
  {
    unint64_t v53 = a4 + v18 * v13;
    uint64_t v23 = v56;
    uint64_t v22 = v57;
    do
    {
      sub_1C6626FA0(a2, v23, &qword_1EBBF5210);
      sub_1C6626FA0(a4, v22, &qword_1EBBF5210);
      uint64_t v24 = v58;
      uint64_t v25 = sub_1C68CA1F8(v23, v58);
      uint64_t v26 = sub_1C68CA1F8(v22, v24);
      unint64_t v27 = a2;
      uint64_t v28 = v26;
      sub_1C65C117C(v22, &qword_1EBBF5210);
      sub_1C65C117C(v23, &qword_1EBBF5210);
      if (v28 >= v25)
      {
        unint64_t v30 = a4;
        a4 += v13;
        if (a1 < v30 || a1 >= a4)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != v30)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        a2 = v27;
      }
      else
      {
        a2 = v27 + v13;
        if (a1 < v27 || a1 >= a2)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != v27)
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v20 = v53;
      a1 += v13;
    }
    while (a4 < v53 && a2 < v54);
  }
LABEL_70:
  int64_t v46 = v20 - a4;
  if (v13 != -1 || v46 != 0x8000000000000000)
  {
    sub_1C669C4D4(a4, v46 / v13);
    swift_bridgeObjectRelease();
    return;
  }
LABEL_78:
  __break(1u);
}

uint64_t sub_1C68D5D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v9 = *(unsigned char *)(a1 + 32);
  unsigned int v10 = v9 & 0x3F;
  unint64_t v11 = (unint64_t)((1 << v9) + 63) >> 6;
  swift_bridgeObjectRetain();
  sub_1C68D8480(a3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C68D8480(a3);
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
  if (v10 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    uint64_t v13 = (void *)((char *)v19 - ((8 * v11 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1C65F7DA0(0, v11, v13);
    swift_bridgeObjectRetain();
    sub_1C68D8480(a3);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1C68D6158((uint64_t)v13, v11, a1, a2, a3, a4, v14);
    swift_release();
    if (v4) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    sub_1C68D84CC(a3);
  }
  else
  {
    int64_t v16 = (void *)swift_slowAlloc();
    sub_1C65F7DA0(0, v11, v16);
    swift_bridgeObjectRetain();
    sub_1C68D8480(a3);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1C68D6158((uint64_t)v16, v11, a1, a2, a3, a4, v17);
    swift_release();
    MEMORY[0x1C87A54F0](v16, -1, -1);
    swift_bridgeObjectRelease();
    sub_1C68D84CC(a3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C68D84CC(a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C68D84CC(a3);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1C68D5FE8(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E4F143B8];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  if ((v3 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    uint64_t v5 = (void *)((char *)v9 - ((8 * v4 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1C65F7DA0(0, v4, v5);
    uint64_t v6 = sub_1C68D6678((uint64_t)v5, v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    sub_1C65F7DA0(0, v4, v7);
    uint64_t v6 = sub_1C68D6678((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x1C87A54F0](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_1C68D6158(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 a7)
{
  uint64_t v58 = a2;
  uint64_t v61 = 0;
  uint64_t v60 = (unint64_t *)result;
  int64_t v7 = 0;
  uint64_t v10 = *(void *)(a3 + 56);
  uint64_t v8 = a3 + 56;
  uint64_t v9 = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v8 - 24);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v9;
  uint64_t v63 = v8;
  int64_t v64 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v57 = &v72;
  a7.n128_u64[0] = 136315138;
  __n128 v55 = a7;
  uint64_t v54 = MEMORY[0x1E4FBC840] + 8;
  while (v13)
  {
    unint64_t v14 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v15 = v14 | (v7 << 6);
LABEL_20:
    unint64_t v67 = v15;
    uint64_t v19 = *(void *)(a3 + 48) + 48 * v15;
    if (*(unsigned char *)(v19 + 40))
    {
LABEL_39:
      *(unint64_t *)((char *)v60 + ((v67 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v67;
      if (__OFADD__(v61++, 1)) {
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v21 = *(void *)v19;
      uint64_t v20 = *(void *)(v19 + 8);
      uint64_t v23 = *(void *)(v19 + 16);
      uint64_t v22 = *(void *)(v19 + 24);
      uint64_t v24 = *(void *)(v19 + 32);
      if (!v24)
      {
        uint64_t v25 = 0;
LABEL_27:
        sub_1C67A4428(*(void *)v19, *(void *)(v19 + 8), *(void *)(v19 + 16), *(void *)(v19 + 24), v25, 0);
        if ((v23 & 0x20) != 0) {
          goto LABEL_38;
        }
        goto LABEL_28;
      }
      uint64_t v25 = *(void *)(v19 + 32);
      if ((v23 & 0x10) == 0) {
        goto LABEL_27;
      }
      sub_1C67A4428(*(void *)v19, *(void *)(v19 + 8), *(void *)(v19 + 16), *(void *)(v19 + 24), *(void *)(v19 + 32), 0);
      sub_1C65CDAC4(v22, v24, a4);
      if (v26)
      {
        if (qword_1EBBF5DA0 != -1) {
          swift_once();
        }
        uint64_t v35 = sub_1C68EC478();
        __swift_project_value_buffer(v35, (uint64_t)&unk_1EBBF7A68);
        sub_1C68D8480(a5);
        sub_1C68D8480(a5);
        uint64_t v36 = sub_1C68EC458();
        HIDWORD(v53) = sub_1C68ECE48();
        if (os_log_type_enabled(v36, BYTE4(v53)))
        {
          log = v36;
          uint64_t v37 = (_DWORD *)swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          uint64_t v75 = v50;
          *uint64_t v37 = v55.n128_u32[0];
          long long v38 = *(_OWORD *)(a5 + 16);
          long long v71 = *(_OWORD *)a5;
          long long v72 = v38;
          long long v39 = v71;
          sub_1C68D8514((uint64_t)v57, (uint64_t)v73);
          sub_1C68D8514((uint64_t)v73, (uint64_t)v74);
          if (v74[1])
          {
            unint64_t v49 = v74[0];
            sub_1C68D8570((uint64_t)&v71);
            swift_bridgeObjectRetain();
            sub_1C68ECA18();
            sub_1C68ECA18();
            sub_1C68D85A8((uint64_t)&v71);
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          sub_1C65B4078(v39, *((uint64_t *)&v39 + 1), (uint64_t)&v75, v40, v41, v42, v43, v44, v48, v49, v50, (uint64_t)v37, v53, v54, v55.n128_i64[0], v55.n128_i64[1], v56, (uint64_t)v57, v58,
            v59);
          *(void *)(v52 + 4) = v45;
          swift_bridgeObjectRelease();
          sub_1C68D84CC(a5);
          sub_1C68D84CC(a5);
          _os_log_impl(&dword_1C65AE000, log, BYTE4(v53), "[UCG] Relationship match [%s] is getting treated as an exact nickname-based relationship match.", (uint8_t *)v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C87A54F0](v51, -1, -1);
          MEMORY[0x1C87A54F0](v52, -1, -1);
        }
        else
        {
          sub_1C68D84CC(a5);
          sub_1C68D84CC(a5);
        }
LABEL_38:
        uint64_t result = sub_1C680B2EC(v21, v20, v23, v22, v24, 0);
        goto LABEL_39;
      }
      if ((v23 & 0x20) != 0) {
        goto LABEL_38;
      }
LABEL_28:
      uint64_t v28 = *(void *)a5;
      uint64_t v27 = *(void *)(a5 + 8);
      os_log_t loga = (os_log_t)v24;
      uint64_t v29 = v22;
      uint64_t v30 = v20;
      unint64_t v31 = v13;
      int64_t v32 = v7;
      uint64_t v33 = *(void *)(a5 + 16);
      uint64_t v34 = *(void *)(a5 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      LOBYTE(v33) = sub_1C66F7FFC(v28, v27, v33, v34, a6);
      int64_t v7 = v32;
      unint64_t v13 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1C680B2EC(v21, v30, v23, v29, (uint64_t)loga, 0);
      if (v33) {
        goto LABEL_39;
      }
    }
  }
  int64_t v16 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v16 >= v64) {
    goto LABEL_42;
  }
  unint64_t v17 = *(void *)(v63 + 8 * v16);
  ++v7;
  if (v17) {
    goto LABEL_19;
  }
  int64_t v7 = v16 + 1;
  if (v16 + 1 >= v64) {
    goto LABEL_42;
  }
  unint64_t v17 = *(void *)(v63 + 8 * v7);
  if (v17) {
    goto LABEL_19;
  }
  int64_t v7 = v16 + 2;
  if (v16 + 2 >= v64) {
    goto LABEL_42;
  }
  unint64_t v17 = *(void *)(v63 + 8 * v7);
  if (v17)
  {
LABEL_19:
    unint64_t v13 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v7 << 6);
    goto LABEL_20;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v64)
  {
LABEL_42:
    swift_retain();
    uint64_t v47 = sub_1C67A3B1C(v60, v58, v61, a3);
    swift_bridgeObjectRelease();
    sub_1C68D84CC(a5);
    swift_bridgeObjectRelease();
    return v47;
  }
  unint64_t v17 = *(void *)(v63 + 8 * v18);
  if (v17)
  {
    int64_t v7 = v18;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v7 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v7 >= v64) {
      goto LABEL_42;
    }
    unint64_t v17 = *(void *)(v63 + 8 * v7);
    ++v18;
    if (v17) {
      goto LABEL_19;
    }
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1C68D6678(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)result;
  uint64_t v6 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_20;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v12) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_20:
    if (*(unsigned char *)(*(void *)(a3 + 48) + 48 * v14 + 40) == 2)
    {
      *(void *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_1C67A3B1C(v5, a2, v6, a3);
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v12) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C68D67F4(uint64_t a1, uint64_t *a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *a2;
  *a2 = 0x8000000000000000;
  sub_1C68D3BAC(a1, isUniquelyReferenced_nonNull_native, &v6);
  *a2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68D6868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v28 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v27[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v27[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      sub_1C68ED938();
      swift_bridgeObjectRetain();
      sub_1C68EC7D8();
      uint64_t v9 = sub_1C68ED988();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        unint64_t v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1C68ED7E8() & 1) != 0)
        {
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          uint64_t v29 = v5;
LABEL_22:
          char v19 = *(unsigned char *)(v2 + 32);
          unint64_t v20 = (unint64_t)((1 << v19) + 63) >> 6;
          size_t v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            MEMORY[0x1F4188790](isStackAllocationSafe);
            memcpy((char *)v27 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            sub_1C68D6B7C((void *)((char *)v27 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0)), v20, v2, v11, &v28);
            uint64_t v23 = v22;
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v24 = (void *)swift_slowAlloc();
            memcpy(v24, (const void *)(v2 + 56), v21);
            sub_1C68D6B7C((unint64_t *)v24, v20, v2, v11, &v28);
            uint64_t v23 = v25;
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1C87A54F0](v24, -1, -1);
          }
          return v23;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          unint64_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1C68ED7E8() & 1) != 0)
          {
            uint64_t v29 = v5;
            uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

void sub_1C68D6B7C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    sub_1C67A332C(a1, a2, v31, a3);
    return;
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_30;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1C68ED938();
    swift_bridgeObjectRetain();
    sub_1C68EC7D8();
    uint64_t v14 = sub_1C68ED988();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    unint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1C68ED7E8() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1C68ED7E8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_13;
        }
      }
LABEL_25:
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
LABEL_13:
    unint64_t v22 = a1[v17];
    a1[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_31;
      }
      --v31;
      if (!v23) {
        return;
      }
    }
LABEL_26:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
}

void sub_1C68D6DA4()
{
}

void sub_1C68D6DE0()
{
  OUTLINED_FUNCTION_26_36();
  if (v4)
  {
    if (v0 < 0) {
      uint64_t v9 = v0;
    }
    else {
      uint64_t v9 = v8;
    }
    swift_bridgeObjectRetain();
    sub_1C68ED528();
    OUTLINED_FUNCTION_2_1();
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (!v9)
    {
LABEL_17:
      OUTLINED_FUNCTION_76_2();
      return;
    }
  }
  if (v1)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1C68ED528();
      swift_bridgeObjectRelease();
      if (v10 <= v6)
      {
        if (v9 >= 1)
        {
          uint64_t v34 = v10;
          sub_1C666EF30(v5, v3);
          swift_bridgeObjectRetain();
          do
          {
            uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(v3);
            uint64_t v19 = OUTLINED_FUNCTION_83_2(v11, v12, v13, v14, v15, v16, v17, v18, v32, v34, v36);
            unint64_t v20 = (void (*)(char *))v2(v19);
            id v22 = *v21;
            uint64_t v30 = OUTLINED_FUNCTION_117_1((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29, v33, v35, v37);
            v20(v30);
            OUTLINED_FUNCTION_157();
          }
          while (!v31);
          swift_bridgeObjectRelease();
          goto LABEL_17;
        }
        goto LABEL_20;
      }
    }
    else
    {
      if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10) <= v6)
      {
        v7((v0 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10), v1);
        goto LABEL_17;
      }
      __break(1u);
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  __break(1u);
}

void sub_1C68D6F4C()
{
}

void sub_1C68D6F88()
{
  OUTLINED_FUNCTION_26_36();
  if (v4)
  {
    if (v0 < 0) {
      uint64_t v9 = v0;
    }
    else {
      uint64_t v9 = v8;
    }
    swift_bridgeObjectRetain();
    sub_1C68ED528();
    OUTLINED_FUNCTION_2_1();
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (!v9)
    {
LABEL_17:
      OUTLINED_FUNCTION_76_2();
      return;
    }
  }
  if (v1)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1C68ED528();
      swift_bridgeObjectRelease();
      if (v10 <= v6)
      {
        if (v9 >= 1)
        {
          uint64_t v33 = v10;
          sub_1C666EF30(v5, v3);
          swift_bridgeObjectRetain();
          do
          {
            uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(v3);
            uint64_t v19 = OUTLINED_FUNCTION_83_2(v11, v12, v13, v14, v15, v16, v17, v18, v31, v33, v35);
            unint64_t v20 = (void (*)(char *))v2(v19);
            uint64_t v21 = swift_retain();
            uint64_t v29 = OUTLINED_FUNCTION_117_1(v21, v22, v23, v24, v25, v26, v27, v28, v32, v34, v36);
            v20(v29);
            OUTLINED_FUNCTION_157();
          }
          while (!v30);
          swift_bridgeObjectRelease();
          goto LABEL_17;
        }
        goto LABEL_20;
      }
    }
    else
    {
      if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10) <= v6)
      {
        v7((v0 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10), v1);
        goto LABEL_17;
      }
      __break(1u);
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C68D70F4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1C68BEEFC(*a1, a1[1], a1[2], *a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

unint64_t sub_1C68D7134(unint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1;
  }
  uint64_t v5 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  unint64_t v6 = v5 | (v4 << 16);
  unint64_t v7 = sub_1C68D75C0(0xFuLL, a1, a2);
  unint64_t result = sub_1C68D75C0(v6, a1, a2);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1C68EC978();
        unint64_t v7 = result;
      }
      else
      {
        unint64_t v12 = v7 >> 16;
        if ((a2 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a1;
          uint64_t v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          int v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1C68ED408();
          }
          int v13 = *(unsigned __int8 *)(result + v12);
        }
        int v14 = (char)v13;
        unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0) {
          LOBYTE(v15) = 1;
        }
        unint64_t v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14) {
        return v11;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    uint64_t v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a2 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1C68EC988();
        unint64_t v7 = result;
      }
      else
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a1;
          uint64_t v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            uint64_t v20 = 0;
            do
              int v21 = *((unsigned char *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            uint64_t v19 = 1 - v20;
          }
          else
          {
            uint64_t v19 = 1;
          }
        }
        else
        {
          unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1C68ED408();
          }
          uint64_t v17 = 0;
          do
            int v18 = *(unsigned char *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          uint64_t v19 = -v17;
        }
        unint64_t v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    goto LABEL_42;
  }
  return 0;
}

uint64_t sub_1C68D7374(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if ((a5 & 0x2000000000000000) != 0) {
    uint64_t v8 = HIBYTE(a5) & 0xF;
  }
  else {
    uint64_t v8 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (a2)
  {
    uint64_t v9 = a3;
    if (a3)
    {
      if (a3 < 0)
      {
        __break(1u);
        JUMPOUT(0x1C68D75A0);
      }
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      while (1)
      {
        if (v12 >= v8)
        {
          uint64_t v9 = v11;
          goto LABEL_32;
        }
        if ((a5 & 0x1000000000000000) != 0)
        {
          int v21 = a1;
          int v14 = sub_1C68ED388();
          a1 = v21;
        }
        else
        {
          if ((a5 & 0x2000000000000000) != 0)
          {
            v23[0] = a4;
            v23[1] = a5 & 0xFFFFFFFFFFFFFFLL;
            int v14 = *((unsigned __int8 *)v23 + v12);
            if (*((char *)v23 + v12) < 0)
            {
              switch(__clz(v14 ^ 0xFF))
              {
                case 0x1Au:
                  unsigned int v15 = (char *)v23 + v12;
LABEL_22:
                  int v14 = v15[1] & 0x3F | ((v14 & 0x1F) << 6);
                  uint64_t v16 = 2;
                  break;
                case 0x1Bu:
                  uint64_t v17 = (char *)v23 + v12;
LABEL_26:
                  int v14 = ((v14 & 0xF) << 12) | ((v17[1] & 0x3F) << 6) | v17[2] & 0x3F;
                  uint64_t v16 = 3;
                  break;
                case 0x1Cu:
                  int v18 = (char *)v23 + v12;
LABEL_28:
                  int v14 = ((v14 & 0xF) << 18) | ((v18[1] & 0x3F) << 12) | ((v18[2] & 0x3F) << 6) | v18[3] & 0x3F;
                  uint64_t v16 = 4;
                  break;
                default:
                  goto LABEL_17;
              }
              goto LABEL_18;
            }
          }
          else
          {
            uint64_t v13 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
            if ((a4 & 0x1000000000000000) == 0)
            {
              unint64_t v22 = a1;
              uint64_t v19 = sub_1C68ED408();
              a1 = v22;
              uint64_t v13 = v19;
            }
            int v14 = *(unsigned __int8 *)(v13 + v12);
            if (*(char *)(v13 + v12) < 0)
            {
              switch(__clz(v14 ^ 0xFF))
              {
                case 0x1Au:
                  unsigned int v15 = (char *)(v12 + v13);
                  goto LABEL_22;
                case 0x1Bu:
                  uint64_t v17 = (char *)(v12 + v13);
                  goto LABEL_26;
                case 0x1Cu:
                  int v18 = (char *)(v12 + v13);
                  goto LABEL_28;
                default:
                  break;
              }
            }
          }
LABEL_17:
          uint64_t v16 = 1;
        }
LABEL_18:
        *(_DWORD *)(a2 + 4 * v11) = v14;
        v12 += v16;
        if (v9 == ++v11) {
          goto LABEL_32;
        }
      }
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v9 = 0;
  }
LABEL_32:
  *a1 = a4;
  a1[1] = a5;
  a1[2] = v12;
  a1[3] = v8;
  return v9;
}

unint64_t sub_1C68D75C0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_1C68D7660(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1C68D76D0(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1C68D7660(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_1C68D3238(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_1C68D76D0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v10 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0) {
        uint64_t v10 = a2 & 0xFFFFFFFFFFFFLL;
      }
      if (v5 != v10)
      {
        return MEMORY[0x1F4184CD0]();
      }
    }
    else
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v9 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
        }
        else
        {
          unint64_t v9 = result >> 16;
        }
        unint64_t v5 = v9;
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v12 = result >> 16;
          uint64_t v6 = sub_1C68ED408();
          unint64_t v5 = v12;
        }
        if (v5 != v7)
        {
          do
            int v8 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v8 == 128);
          ++v5;
        }
      }
      return v5 << 16;
    }
  }
  return result;
}

uint64_t sub_1C68D77DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, char a16, uint64_t a17, uint64_t a18)
{
  v37[3] = sub_1C65BAD10(0, &qword_1EA40B3E0);
  v37[4] = &off_1F2183080;
  v37[0] = a1;
  v36[3] = type metadata accessor for UCGStringTokenizer(0);
  v36[4] = (uint64_t)&off_1F2185EC0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  sub_1C65C54EC(a5, (uint64_t)boxed_opaque_existential_1);
  uint64_t v27 = OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3Orchestrator;
  *(void *)(a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3Orchestrator) = 0;
  *(void *)(a18
            + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator____lazy_storage___semanticRelationshipMapping) = 0;
  sub_1C65C0368((uint64_t)v37, a18 + 16);
  sub_1C6626FA0(a7, a18 + 56, &qword_1EA40B3A0);
  *(void *)(a18 + 104) = a8;
  sub_1C65DCFC4(a3, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_config);
  *(void *)(a18 + 96) = a2;
  *(unsigned char *)(a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_plusTrialFactors) = a4;
  sub_1C6626FE4(a6, (uint64_t)&v38, &qword_1EA4076F8);
  uint64_t v28 = a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors;
  if ((void)v39)
  {
    long long v29 = v39;
    *(_OWORD *)uint64_t v28 = v38;
    *(_OWORD *)(v28 + 16) = v29;
    *(_OWORD *)(v28 + 32) = v40[0];
    *(_OWORD *)(v28 + 41) = *(_OWORD *)((char *)v40 + 9);
  }
  else
  {
    *(unsigned char *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 1701736302;
    *(void *)(v28 + 16) = 0xE400000000000000;
    *(void *)(v28 + 24) = 0;
    *(void *)(v28 + 32) = 0;
    *(_OWORD *)(v28 + 40) = xmmword_1C690DE70;
    *(unsigned char *)(v28 + 56) = 0;
  }
  sub_1C6626FA0(a9, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_plusSuggestionHandler, &qword_1EA40B360);
  sub_1C65C0368((uint64_t)v36, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_tokenizer);
  sub_1C6626FA0(a10, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_triggerLogger, &qword_1EA406870);
  sub_1C6626FA0(a11, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_relationshipLocalizer, &qword_1EA40B378);
  *(void *)(a18 + v27) = a12;
  id v30 = a8;
  swift_retain();
  swift_release();
  if (*(void *)(a18 + v27)
    || *(unsigned char *)(a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_e3TrialFactors) != 1)
  {

    swift_release();
    sub_1C65C117C(a11, &qword_1EA40B378);
    sub_1C65C117C(a10, &qword_1EA406870);
    sub_1C65C117C(a9, &qword_1EA40B360);
    sub_1C65C117C(a7, &qword_1EA40B3A0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    sub_1C68D8374(a3, (void (*)(void))type metadata accessor for ContactResolverConfig);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
  else
  {
    type metadata accessor for EuclidVectorDb();
    swift_allocObject();
    uint64_t v31 = sub_1C6729344();
    type metadata accessor for EuclidEmbeddingApi();
    swift_allocObject();
    uint64_t v32 = sub_1C6729D78();

    swift_release();
    sub_1C65C117C(a11, &qword_1EA40B378);
    sub_1C65C117C(a10, &qword_1EA406870);
    sub_1C65C117C(a9, &qword_1EA40B360);
    sub_1C65C117C(a7, &qword_1EA40B3A0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    sub_1C68D8374(a3, (void (*)(void))type metadata accessor for ContactResolverConfig);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    type metadata accessor for E3Orchestrator();
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v31;
    *(void *)(v33 + 24) = v32;
    *(void *)(a18 + v27) = v33;
    swift_release();
  }
  *(void *)(a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_asrE3VectorDbApi) = a13;
  *(void *)(a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_asrE3EmbedderApi) = a14;
  uint64_t v34 = a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_ucgTrialFactors;
  if (a15 == 2)
  {
    *(_WORD *)uint64_t v34 = 0;
  }
  else
  {
    *(unsigned char *)uint64_t v34 = a15 & 1;
    *(unsigned char *)(v34 + 1) = a16 & 1;
  }
  sub_1C6626FE4(a17, a18 + OBJC_IVAR____TtC13SiriInference23UnifiedContactGenerator_phoneSequenceFetcher, &qword_1EA40B2A0);
  return a18;
}

uint64_t type metadata accessor for ContactSearchResultCollector()
{
  return self;
}

void type metadata accessor for ContactRecall()
{
}

uint64_t sub_1C68D7C74()
{
  return type metadata accessor for UnifiedContactGenerator(0);
}

void sub_1C68D7C7C()
{
  type metadata accessor for ContactResolverConfig(319);
  if (v0 <= 0x3F)
  {
    sub_1C68D7DAC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1C68D7DAC()
{
  if (!qword_1EA40B320)
  {
    type metadata accessor for AsrPhoneticSequenceFetcher();
    unint64_t v0 = sub_1C68ED098();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA40B320);
    }
  }
}

uint64_t sub_1C68D7E04(uint64_t a1)
{
  return sub_1C680B2EC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t sub_1C68D7E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_1C67A4428(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_1C68D7E94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_1C67A4428(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_1C680B2EC(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1C68D7F34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_1C680B2EC(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_1C68D7F88(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
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

uint64_t sub_1C68D7FC8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1C68D8018(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_1C68D8020(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

void type metadata accessor for ContactSearchMatchType()
{
}

uint64_t sub_1C68D8034()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1C68D8078(void *a1, void *a2)
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

void *sub_1C68D80D0(void *a1, void *a2)
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

uint64_t sub_1C68D8158(uint64_t a1, uint64_t a2)
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

void type metadata accessor for ContactSearchMatch()
{
}

void type metadata accessor for ContactSharedIdentifier()
{
}

uint64_t sub_1C68D81E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C68D81FC);
}

uint64_t sub_1C68D81FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StringTokenizer();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_1C68D8244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C68D8258);
}

uint64_t sub_1C68D8258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StringTokenizer();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

unint64_t sub_1C68D82A8()
{
  unint64_t result = qword_1EA40B338;
  if (!qword_1EA40B338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B338);
  }
  return result;
}

unint64_t sub_1C68D82F8()
{
  unint64_t result = qword_1EA40B340;
  if (!qword_1EA40B340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B340);
  }
  return result;
}

uint64_t sub_1C68D8344(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_89_1(a1);
  v3(v2);
  return v1;
}

uint64_t sub_1C68D8374(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

void sub_1C68D83C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C68D00AC(a1, a2, a3, a4, v8, a6, a7, a8);
}

uint64_t sub_1C68D83E4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C68CFF88(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_1C68D8404()
{
  unint64_t result = qword_1EA40B368;
  if (!qword_1EA40B368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B368);
  }
  return result;
}

uint64_t sub_1C68D8450(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_89_1(a1);
  v3(v2);
  return v1;
}

uint64_t sub_1C68D8480(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68D84CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68D8514(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C68D8570(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68D85A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68D85E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C68CB68C(a1, *(void *)(v2 + 24), a2);
}

void *sub_1C68D8600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C68CB030(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1C68D861C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1C68C1480(a1, a2, *(void **)(v3 + 16), a3);
}

uint64_t sub_1C68D8624(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C68D866C(uint64_t a1, const void *a2)
{
  return sub_1C68C3E94(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1C68D8688()
{
  return sub_1C68CA350() & 1;
}

uint64_t sub_1C68D86A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C68C8624(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1C68D86B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C68C9B2C(a1, *(void *)(v2 + 16), a2);
}

void type metadata accessor for ContactNameMatch.Signals()
{
}

unsigned char *sub_1C68D86DC(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1C68D87A8);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for TriggeringCondition()
{
}

void *sub_1C68D87DC()
{
  OUTLINED_FUNCTION_123_1();
  *int v3 = *v2;
  v1[1] = v2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v1[2] = *(void *)(v0 + 16);
  v1[3] = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_1C68D8848()
{
  OUTLINED_FUNCTION_123_1();
  uint64_t v3 = v2[1];
  *uint64_t v1 = *v2;
  v1[1] = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 24);
  v1[2] = *(void *)(v0 + 16);
  v1[3] = v4;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1C68D888C(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_147(result, a2);
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_147(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ContactLearnedInferenceMatch()
{
}

void *sub_1C68D88D4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1C68D890C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *sub_1C68D8964(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void type metadata accessor for ContactRelationshipMatch()
{
}

uint64_t sub_1C68D89B0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C68D89EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1C68D8A34(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C68D8AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C68D8AFC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      return OUTLINED_FUNCTION_147(result, a2);
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_147(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ContactNameMatch()
{
}

unint64_t sub_1C68D8B4C()
{
  unint64_t result = qword_1EA40B430;
  if (!qword_1EA40B430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B430);
  }
  return result;
}

unint64_t sub_1C68D8B9C()
{
  unint64_t result = qword_1EA40B438;
  if (!qword_1EA40B438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B438);
  }
  return result;
}

unint64_t sub_1C68D8BEC()
{
  unint64_t result = qword_1EA40B440;
  if (!qword_1EA40B440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B440);
  }
  return result;
}

unint64_t sub_1C68D8C3C()
{
  unint64_t result = qword_1EA40B448;
  if (!qword_1EA40B448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B448);
  }
  return result;
}

unint64_t sub_1C68D8C8C()
{
  unint64_t result = qword_1EA40B450;
  if (!qword_1EA40B450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B450);
  }
  return result;
}

unint64_t sub_1C68D8CDC()
{
  unint64_t result = qword_1EA40B458;
  if (!qword_1EA40B458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B458);
  }
  return result;
}

unint64_t sub_1C68D8D28(uint64_t a1)
{
  unint64_t result = sub_1C68D8D50();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1C68D8D50()
{
  unint64_t result = qword_1EA40B460;
  if (!qword_1EA40B460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B460);
  }
  return result;
}

unint64_t sub_1C68D8DA0()
{
  unint64_t result = qword_1EA40B468;
  if (!qword_1EA40B468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B468);
  }
  return result;
}

unint64_t sub_1C68D8DF0()
{
  unint64_t result = qword_1EA40B470;
  if (!qword_1EA40B470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B470);
  }
  return result;
}

uint64_t sub_1C68D8E3C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C68D70F4(a1, *(uint64_t **)(v2 + 16), a2);
}

void type metadata accessor for ContactRelationshipMatch.Signals()
{
}

unint64_t sub_1C68D8E68()
{
  unint64_t result = qword_1EA40B478;
  if (!qword_1EA40B478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B478);
  }
  return result;
}

unint64_t sub_1C68D8EB8()
{
  unint64_t result = qword_1EA40B480;
  if (!qword_1EA40B480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B480);
  }
  return result;
}

unint64_t sub_1C68D8F04(uint64_t a1)
{
  unint64_t result = sub_1C68D8F2C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1C68D8F2C()
{
  unint64_t result = qword_1EA40B488;
  if (!qword_1EA40B488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B488);
  }
  return result;
}

unint64_t sub_1C68D8F7C()
{
  unint64_t result = qword_1EA40B490;
  if (!qword_1EA40B490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B490);
  }
  return result;
}

unint64_t sub_1C68D8FCC()
{
  unint64_t result = qword_1EA40B498;
  if (!qword_1EA40B498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B498);
  }
  return result;
}

uint64_t sub_1C68D9020()
{
  return sub_1C68D8688() & 1;
}

uint64_t sub_1C68D9040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C68D85E0(a1, a2);
}

uint64_t sub_1C68D9084@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C68D8E3C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_9_80()
{
  return sub_1C65B66C8(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_12_54()
{
  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_16_49@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 440) = a1;
  *(void *)(v1 + 448) = v2;
  return sub_1C68ED138();
}

uint64_t OUTLINED_FUNCTION_22_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_37@<X0>(uint64_t a1@<X8>)
{
  return a1 + 8 * *(void *)(a1 + 16) + 32;
}

void OUTLINED_FUNCTION_27_31(unint64_t a1@<X8>)
{
  *(void *)(v1 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
}

uint64_t OUTLINED_FUNCTION_43_13()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t OUTLINED_FUNCTION_47_12()
{
  return 0xD00000000000007CLL;
}

uint64_t OUTLINED_FUNCTION_61_7()
{
  return sub_1C65B54E8(v1, v2, v0);
}

void OUTLINED_FUNCTION_67_6()
{
  sub_1C669F7F0();
}

unint64_t OUTLINED_FUNCTION_69_5(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_73_6(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_81_1()
{
  return sub_1C68EC7D8();
}

void OUTLINED_FUNCTION_84_2(uint64_t a1@<X8>)
{
  *char v1 = a1;
}

uint64_t OUTLINED_FUNCTION_93_2()
{
  return v0;
}

void OUTLINED_FUNCTION_96_1()
{
  sub_1C669FB20();
}

uint64_t OUTLINED_FUNCTION_97_2()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_113_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 312) = a1;
}

uint64_t OUTLINED_FUNCTION_115_2(uint64_t a1)
{
  *(void *)(v1 - 208) = a1;
  return v1 - 208;
}

char *OUTLINED_FUNCTION_117_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  return &a11;
}

uint64_t OUTLINED_FUNCTION_118_0()
{
  return 0x737961776C61;
}

void OUTLINED_FUNCTION_120_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 136) = (char *)&a9 - v9;
}

void OUTLINED_FUNCTION_124_1()
{
  ++*(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_125_1(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_127_1()
{
  return 0xD000000000000033;
}

void OUTLINED_FUNCTION_132_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

void *OUTLINED_FUNCTION_133_0(void *a1)
{
  return memcpy(a1, v1, 0x108uLL);
}

uint64_t OUTLINED_FUNCTION_137()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_138_0()
{
  return sub_1C68ED7E8();
}

uint64_t OUTLINED_FUNCTION_139()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_141(uint64_t a1)
{
  *(void *)(v1 + 368) = a1;
  return v1 + 368;
}

uint64_t OUTLINED_FUNCTION_145()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_146()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_147(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_148()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_151()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_153()
{
  return v0 - 104;
}

void OUTLINED_FUNCTION_157()
{
  *(void *)(v0 + 8 * v1) = v2;
}

uint64_t sub_1C68D95EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = *(id *)MEMORY[0x1E4F143B8];
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  MEMORY[0x1F4188790](v6);
  id v7 = objc_msgSend(self, sel_defaultManager, a2, a1);
  v16[0] = 0;
  id v8 = objc_msgSend(v7, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 8, 0, 0, v16);

  id v9 = v16[0];
  if (v8)
  {
    sub_1C68E9928();
    id v10 = v9;

    sub_1C68E9908();
    sub_1C68E9908();
    char v11 = *(void (**)(void))(v3 + 8);
    OUTLINED_FUNCTION_1_138();
    v11();
    sub_1C68E9908();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_138();
    v11();
    OUTLINED_FUNCTION_1_138();
    return ((uint64_t (*)(void))v11)();
  }
  else
  {
    id v13 = v16[0];
    swift_bridgeObjectRelease();
    sub_1C68E9878();

    return swift_willThrow();
  }
}

uint64_t sub_1C68D9828()
{
  uint64_t v0 = sub_1C68E9968();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  id v8 = (char *)v11 - v7;
  sub_1C68E98D8();
  sub_1C68E9908();
  sub_1C68E9908();
  swift_bridgeObjectRelease();
  id v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v6, v0);
  return ((uint64_t (*)(char *, uint64_t))v9)(v8, v0);
}

void sub_1C68D997C()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_1C68E9948();
  uint64_t v1 = (void *)sub_1C68EC868();
  swift_bridgeObjectRelease();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
  {
    uint64_t v3 = (void *)sub_1C68E98E8();
    id v24 = 0;
    unsigned int v4 = objc_msgSend(v0, sel_removeItemAtURL_error_, v3, &v24);

    if (v4)
    {
      id v5 = v24;
    }
    else
    {
      id v6 = v24;
      uint64_t v7 = (void *)sub_1C68E9878();

      swift_willThrow();
      if (qword_1EBBF68C0 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1C68EC478();
      __swift_project_value_buffer(v8, (uint64_t)qword_1EBBF7AF0);
      id v9 = v7;
      id v10 = v7;
      char v11 = sub_1C68EC458();
      os_log_type_t v12 = sub_1C68ECE68();
      if (os_log_type_enabled(v11, v12))
      {
        id v13 = (uint8_t *)swift_slowAlloc();
        char v14 = (void *)swift_slowAlloc();
        id v24 = v14;
        *(_DWORD *)id v13 = 136315138;
        id v15 = v7;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6650);
        uint64_t v16 = sub_1C68EC8F8();
        sub_1C65B4078(v16, v17, (uint64_t)&v24, v18, v19, v20, v21, v22, v23, (unint64_t)v7, (uint64_t)v24, v25, v26, v27, v28, v29, v30, v31, v32,
          v33);
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1C65AE000, v11, v12, "error when deleting file: %s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87A54F0](v14, -1, -1);
        MEMORY[0x1C87A54F0](v13, -1, -1);
      }
      else
      {
      }
      swift_willThrow();
    }
  }
}

void *assignWithCopy for UseCaseFilter(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UseCaseFilter()
{
  return &type metadata for UseCaseFilter;
}

uint64_t sub_1C68D9CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1;
  }
  uint64_t v4 = sub_1C68EC918();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a3 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = a3 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      if (sub_1C68ECAC8()) {
        break;
      }
      v8 += 16;
      swift_bridgeObjectRelease();
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
LABEL_7:
    if (qword_1EA4057A0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1C68EC478();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EA442868);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v10 = sub_1C68EC458();
    os_log_type_t v11 = sub_1C68ECE48();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      unint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v4, v6, (uint64_t)&v27, v13, v14, v15, v16, v17, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
        v37);
      OUTLINED_FUNCTION_1_139();
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
      sub_1C65C2B80();
      uint64_t v18 = sub_1C68EC818();
      sub_1C65B4078(v18, v19, (uint64_t)&v27, v20, v21, v22, v23, v24, a3, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
        v37);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C65AE000, v10, v11, "PervasiveEntityResolution rejected use case \"%s, allowed=%s\"", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
}

uint64_t sub_1C68D9F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_1C68EC918();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a4 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v9 = a4 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      if (sub_1C68ECAC8()) {
        break;
      }
      v9 += 16;
      swift_bridgeObjectRelease();
      if (!--v8)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
LABEL_6:
    if (qword_1EA4057A0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C68EC478();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EA442868);
    swift_bridgeObjectRetain();
    os_log_type_t v11 = sub_1C68EC458();
    os_log_type_t v12 = sub_1C68ECE48();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      var48[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v5, v7, (uint64_t)var48, v14, v15, v16, v17, v18, v20, var48[0], var48[1], var48[2], var48[3], var48[4], var48[5], var48[6], var48[7], var48[8], var48[9],
        var48[10]);
      OUTLINED_FUNCTION_1_139();
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v11, v12, "PervasiveEntityResolution will log for use case \"%s", v13, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
}

uint64_t sub_1C68DA1A4(uint64_t a1)
{
  if (!a1) {
    return 5000257;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6840);
  sub_1C65C2B80();
  return sub_1C68EC818();
}

uint64_t sub_1C68DA210()
{
  return sub_1C68DA1A4(*v0);
}

uint64_t sub_1C68DA22C()
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(v0 + 16);
  unsigned int v2 = (void *)OUTLINED_FUNCTION_6_93();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1C68ED1C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  sub_1C65B9D84((uint64_t)&v46, (uint64_t)&v49);
  if (!v52)
  {
    sub_1C6627E7C((uint64_t)&v49);
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1C68EC478();
    __swift_project_value_buffer(v23, (uint64_t)qword_1EBBF7AF0);
    uint64_t v24 = sub_1C68EC458();
    os_log_type_t v25 = sub_1C68ECE48();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1C65AE000, v24, v25, "Was not able to unarchive BMBookmark: no data", v26, 2u);
      OUTLINED_FUNCTION_0();
    }

    return 0;
  }
  uint64_t v4 = self;
  id v5 = objc_msgSend(self, sel_bm_allowedClassesForSecureCodingBMBookmark);
  sub_1C68ECD58();

  uint64_t v6 = (void *)sub_1C68ECD48();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_1C68E9A08();
  id v49 = 0;
  id v8 = objc_msgSend(v4, sel_unarchivedObjectOfClasses_fromData_error_, v6, v7, &v49);

  if (!v8)
  {
    id v28 = v49;
    uint64_t v29 = (void *)sub_1C68E9878();

    swift_willThrow();
    goto LABEL_21;
  }
  id v9 = v49;
  sub_1C68ED1C8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4B8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C68EC478();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EBBF7AF0);
    OUTLINED_FUNCTION_2_146();
    OUTLINED_FUNCTION_2_146();
    uint64_t v31 = sub_1C68EC458();
    os_log_type_t v32 = sub_1C68ECE48();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_30();
      id v49 = (id)OUTLINED_FUNCTION_39();
      *(_DWORD *)uint64_t v33 = 136315138;
      OUTLINED_FUNCTION_2_146();
      uint64_t v34 = sub_1C68E99B8();
      uint64_t v36 = v35;
      OUTLINED_FUNCTION_0_114();
      sub_1C65B4078(v34, v36, (uint64_t)&v49, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, *((uint64_t *)&v46 + 1), v47, *((uint64_t *)&v47 + 1), v48, (uint64_t)v49, v50,
        v51);
      OUTLINED_FUNCTION_25_25();
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_114();
      OUTLINED_FUNCTION_0_114();
      _os_log_impl(&dword_1C65AE000, v31, v32, "Was not able to unarchive BMBookmark: %s", v33, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      OUTLINED_FUNCTION_0_114();
    }
    else
    {
      OUTLINED_FUNCTION_0_114();
      OUTLINED_FUNCTION_0_114();
      OUTLINED_FUNCTION_0_114();
    }
    return 0;
  }
  uint64_t v10 = v46;
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1C68EC478();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EBBF7AF0);
  OUTLINED_FUNCTION_2_146();
  OUTLINED_FUNCTION_2_146();
  os_log_type_t v12 = sub_1C68EC458();
  os_log_type_t v13 = sub_1C68ECE48();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_30();
    id v49 = (id)OUTLINED_FUNCTION_39();
    *(_DWORD *)uint64_t v14 = 136315138;
    OUTLINED_FUNCTION_2_146();
    uint64_t v15 = sub_1C68E99B8();
    uint64_t v17 = v16;
    OUTLINED_FUNCTION_0_114();
    sub_1C65B4078(v15, v17, (uint64_t)&v49, v18, v19, v20, v21, v22, (uint64_t)(v14 + 4), v43, v44, v45, v46, *((uint64_t *)&v46 + 1), v47, *((uint64_t *)&v47 + 1), v48, (uint64_t)v49, v50,
      v51);
    OUTLINED_FUNCTION_25_25();
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_114();
    OUTLINED_FUNCTION_0_114();
    _os_log_impl(&dword_1C65AE000, v12, v13, "returning BMBookmark bookmark: %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

    OUTLINED_FUNCTION_0_114();
  }
  else
  {
    OUTLINED_FUNCTION_0_114();
    OUTLINED_FUNCTION_0_114();
    OUTLINED_FUNCTION_0_114();
  }
  return v10;
}

uint64_t sub_1C68DA7CC(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v3 = v1;
    uint64_t v4 = self;
    id v45 = 0;
    swift_unknownObjectRetain();
    id v5 = objc_msgSend(v4, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, &v45);
    id v6 = v45;
    if (v5)
    {
      uint64_t v7 = sub_1C68E9A28();
      unint64_t v9 = v8;

      if (qword_1EBBF68C0 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_1C68EC478();
      __swift_project_value_buffer(v10, (uint64_t)qword_1EBBF7AF0);
      sub_1C663E464(v7, v9);
      sub_1C663E464(v7, v9);
      uint64_t v11 = sub_1C68EC458();
      os_log_type_t v12 = sub_1C68ECE48();
      if (os_log_type_enabled(v11, v12))
      {
        unint64_t v42 = v3;
        os_log_type_t v13 = (uint8_t *)OUTLINED_FUNCTION_30();
        id v45 = (id)OUTLINED_FUNCTION_39();
        *(_DWORD *)os_log_type_t v13 = 136315138;
        sub_1C663E464(v7, v9);
        uint64_t v14 = sub_1C68E99B8();
        uint64_t v16 = v15;
        OUTLINED_FUNCTION_3_117();
        uint64_t v17 = v14;
        unint64_t v3 = v42;
        sub_1C65B4078(v17, v16, (uint64_t)&v45, v18, v19, v20, v21, v22, (uint64_t)(v13 + 4), v42, v43, v44, (uint64_t)v45, v46, v47, v48, v49, v50, v51,
          v52);
        sub_1C68ED0C8();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_117();
        OUTLINED_FUNCTION_3_117();
        _os_log_impl(&dword_1C65AE000, v11, v12, "setting BMBookmark bookmark: %s", v13, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {
        OUTLINED_FUNCTION_3_117();
        OUTLINED_FUNCTION_3_117();
      }

      uint64_t v37 = *(void **)(v3 + 16);
      uint64_t v38 = (void *)sub_1C68E9A08();
      uint64_t v39 = (void *)OUTLINED_FUNCTION_6_93();
      objc_msgSend(v37, sel_setValue_forKey_, v38, v39);

      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_117();
      return swift_unknownObjectRelease();
    }
    uint64_t v23 = v6;
    uint64_t v24 = (void *)sub_1C68E9878();

    swift_willThrow();
    swift_unknownObjectRelease();
  }
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C68EC478();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBBF7AF0);
  swift_unknownObjectRetain_n();
  uint64_t v26 = sub_1C68EC458();
  os_log_type_t v27 = sub_1C68ECE48();
  if (!os_log_type_enabled(v26, v27))
  {

    return swift_unknownObjectRelease_n();
  }
  id v28 = (uint8_t *)OUTLINED_FUNCTION_30();
  id v45 = (id)OUTLINED_FUNCTION_39();
  *(_DWORD *)id v28 = 136315138;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA40B4A8);
  uint64_t v29 = sub_1C68EC8F8();
  sub_1C65B4078(v29, v30, (uint64_t)&v45, v31, v32, v33, v34, v35, v40, v41, v43, a1, (uint64_t)v45, v46, v47, v48, v49, v50, v51,
    v52);
  sub_1C68ED0C8();
  swift_unknownObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C65AE000, v26, v27, "Was not able to archive BMBookmark: %s", v28, 0xCu);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0();

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for SystemUserDefaultsProvider()
{
  return self;
}

uint64_t OUTLINED_FUNCTION_0_114()
{
  return sub_1C65B64F8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_146()
{
  return sub_1C663E464(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_117()
{
  return sub_1C65B64F8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_6_93()
{
  return sub_1C68EC868();
}

uint64_t UserSelection.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_1C6726848(v2, v3, v4);
}

uint64_t UserSelection.encodedPayload.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

__n128 UserSelection.init(type:encodedPayload:)@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, __n128 *a4@<X8>)
{
  unsigned __int8 v4 = a1[1].n128_u8[0];
  __n128 result = *a1;
  *a4 = *a1;
  a4[1].n128_u8[0] = v4;
  a4[1].n128_u64[1] = a2;
  a4[2].n128_u64[0] = a3;
  return result;
}

uint64_t destroy for UserSelection(uint64_t a1)
{
  sub_1C6726864(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserSelection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1C6726848(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserSelection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1C6726848(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  sub_1C6726864(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserSelection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  sub_1C6726864(v5, v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserSelection(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for UserSelection(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserSelection()
{
  return &type metadata for UserSelection;
}

uint64_t destroy for UserSelection.SelectionType(uint64_t a1)
{
  return sub_1C6726864(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s13SiriInference13UserSelectionV13SelectionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1C6726848(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UserSelection.SelectionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1C6726848(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1C6726864(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for UserSelection.SelectionType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1C6726864(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for UserSelection.SelectionType()
{
  return &type metadata for UserSelection.SelectionType;
}

void *UsoEntity_common_Agent.toContactQuery()@<X0>(void *a1@<X8>)
{
  if (qword_1EBBF5DA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C68EC478();
  __swift_project_value_buffer(v2, (uint64_t)&unk_1EBBF7A68);
  char v3 = sub_1C68EC458();
  os_log_type_t v4 = sub_1C68ECE48();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C65AE000, v3, v4, "converting USO Agent to ContactQuery", v5, 2u);
    MEMORY[0x1C87A54F0](v5, -1, -1);
  }

  *(void *)__src = 0;
  *(void *)&__src[8] = 0xE000000000000000;
  __src[16] = 0;
  *(void *)&__src[24] = 0;
  *(void *)&__src[32] = 0xE000000000000000;
  *(void *)&__src[40] = 0;
  *(void *)&__src[48] = 0xE000000000000000;
  *(void *)&__src[56] = 0;
  *(void *)&__src[64] = 0xE000000000000000;
  *(void *)&__src[72] = 0;
  *(void *)&__src[80] = 0xE000000000000000;
  *(void *)&__src[88] = 0;
  *(void *)&__src[96] = 0xE000000000000000;
  *(void *)&__src[104] = 0;
  *(void *)&__src[112] = 0xE000000000000000;
  *(void *)&__src[120] = 0;
  *(void *)&__src[128] = 0xE000000000000000;
  *(void *)&__src[136] = 0;
  *(void *)&__src[144] = 0xE000000000000000;
  *(void *)&__src[152] = 0;
  *(void *)&__src[160] = 0xE000000000000000;
  memset(&__src[168], 0, 72);
  *(void *)&__src[240] = MEMORY[0x1E4FBC860];
  *(void *)&__src[256] = 0;
  __src[248] = 2;
  uint64_t v6 = sub_1C68EB078();
  if (v7)
  {
    *(void *)&__src[24] = v6;
    *(void *)&__src[32] = v7;
  }
  if (sub_1C68EB068())
  {
    if (sub_1C68DF74C())
    {
      swift_release();
    }
    else
    {
      sub_1C68EB178();
      sub_1C68DF7B4((uint64_t)__dst);
      swift_release();
      *(void *)&__src[192] = __dst[0];
      *(void *)&__src[200] = *(void *)&__dst[8];
      *(_OWORD *)&__src[208] = *(_OWORD *)&__dst[16];
      *(void *)&__src[224] = *(void *)&__dst[32];
      *(void *)&__src[232] = *(void *)&__dst[40];
    }
  }
  uint64_t v8 = sub_1C68EADD8();
  if (v8)
  {
    uint64_t v9 = v8;
    sub_1C68EB178();
    uint64_t v10 = sub_1C65B43A8(v9);
    swift_bridgeObjectRelease();
    *(void *)&__src[240] = v10;
  }
  uint64_t v11 = sub_1C68EC458();
  os_log_type_t v12 = sub_1C68ECE48();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v14;
    *(_DWORD *)os_log_type_t v13 = 136315138;
    swift_beginAccess();
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t v15 = ContactQuery.description.getter();
    sub_1C65B4078(v15, v16, (uint64_t)&v28, v17, v18, v19, v20, v21, v24, v25, v26, *(uint64_t *)__dst, *(uint64_t *)&__dst[8], *(uint64_t *)&__dst[16], *(uint64_t *)&__dst[24], *(uint64_t *)&__dst[32], *(uint64_t *)&__dst[40], *(uint64_t *)&__dst[48], *(uint64_t *)&__dst[56],
      *(uint64_t *)&__dst[64]);
    *(void *)__dst = v22;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v11, v12, "converted UsoEntity_common_Agent to ContactQuery %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v14, -1, -1);
    MEMORY[0x1C87A54F0](v13, -1, -1);
  }

  swift_beginAccess();
  return memcpy(a1, __src, 0x108uLL);
}

void *sub_1C68DB378@<X0>(void *a1@<X8>)
{
  return UsoEntity_common_Agent.toContactQuery()(a1);
}

uint64_t UsoEntity_common_Date.toDate()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_1C68EAFC8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v89 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_1_15();
  uint64_t v90 = v7 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4C0);
  MEMORY[0x1F4188790](v8 - 8);
  OUTLINED_FUNCTION_1_15();
  uint64_t v11 = (void (*)(void))(v10 - v9);
  uint64_t v101 = sub_1C68EA968();
  OUTLINED_FUNCTION_0_1();
  uint64_t v92 = v12;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  char v107 = (char *)v87 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v100 = (char *)v87 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4C8);
  MEMORY[0x1F4188790](v20 - 8);
  OUTLINED_FUNCTION_1_15();
  uint64_t v23 = v22 - v21;
  if (sub_1C68EAF98())
  {
    sub_1C68DE51C(v112);
    swift_release();
  }
  else
  {
    v112[0] = 12;
  }
  if (sub_1C68EAF78())
  {
    uint64_t v95 = sub_1C65EF9B0();
    OUTLINED_FUNCTION_7_81();
    int v24 = v1 & 1;
  }
  else
  {
    uint64_t v95 = 0;
    int v24 = 1;
  }
  int v97 = v24;
  if (sub_1C68EAF68())
  {
    uint64_t v25 = sub_1C65EF9B0();
    OUTLINED_FUNCTION_7_81();
    int v26 = v1 & 1;
  }
  else
  {
    uint64_t v25 = 0;
    int v26 = 1;
  }
  uint64_t v27 = sub_1C68EADB8();
  uint64_t v99 = v11;
  uint64_t v94 = v25;
  int v93 = v26;
  if (v27)
  {
    char v1 = v27;
    sub_1C68DE004(&v111);
    char v28 = v111;
    if (v111 == 20)
    {
      swift_release();
      goto LABEL_13;
    }
    uint64_t v31 = sub_1C68EAFE8();
    swift_release();
    if (v31)
    {
      if (!sub_1C68EAFE8() || (sub_1C65EF9B0(), char v33 = v32, swift_release(), (v33 & 1) != 0))
      {
        swift_release();
        char v35 = 11;
        goto LABEL_80;
      }
    }
    uint64_t v34 = sub_1C68EAF98();
    swift_release();
    if (v34)
    {
      if (!sub_1C68EAF98() || (sub_1C68DE51C(&v111), swift_release(), v111 == 12))
      {
        swift_release();
        char v35 = 9;
LABEL_80:
        char v111 = v35;
        char v110 = v28;
        goto LABEL_81;
      }
    }
    uint64_t v37 = sub_1C68EAF78();
    swift_release();
    if (v37)
    {
      swift_release();
      char v35 = 10;
      goto LABEL_80;
    }
    uint64_t v40 = sub_1C68EAFF8();
    swift_release();
    if (v40)
    {
      if (!sub_1C68EAFF8()) {
        goto LABEL_69;
      }
      sub_1C68DD648(&v111);
      swift_release();
      if (v111 == 7) {
        goto LABEL_69;
      }
    }
    uint64_t v41 = sub_1C68EAF68();
    swift_release();
    if (!v41)
    {
      swift_release();
LABEL_79:
      char v35 = 38;
      goto LABEL_80;
    }
    if (!sub_1C68EAF68())
    {
LABEL_69:
      swift_release();
    }
    else
    {
      sub_1C65EF9B0();
      char v43 = v42;
      swift_release();
      swift_release();
      if ((v43 & 1) == 0) {
        goto LABEL_79;
      }
    }
    char v35 = 8;
    goto LABEL_80;
  }
LABEL_13:
  if (sub_1C68EAFE8())
  {
    sub_1C65EF954(&v111);
    swift_release();
    char v29 = v111;
    if (v111 != 20)
    {
      char v36 = 11;
      if (!sub_1C68EAFE8())
      {
LABEL_31:
        char v111 = v36;
        goto LABEL_32;
      }
LABEL_29:
      sub_1C65EF9B0();
      OUTLINED_FUNCTION_7_81();
      if ((v1 & 1) == 0) {
        char v36 = 38;
      }
      goto LABEL_31;
    }
  }
  if (sub_1C68EAF98())
  {
    sub_1C65EF954(&v111);
    swift_release();
    char v30 = v111;
    uint64_t v11 = v99;
    if (v111 != 20)
    {
      if (v112[0] == 12)
      {
        if (v111 == 3)
        {
          v112[0] = 11;
        }
        else
        {
          if (v111 != 2)
          {
            char v44 = 9;
            goto LABEL_77;
          }
          v112[0] = 0;
        }
        char v30 = 20;
      }
      char v44 = 38;
LABEL_77:
      char v111 = v44;
      char v110 = v30;
LABEL_81:
      type metadata accessor for DateTime.DateTimeRange();
      swift_allocObject();
      uint64_t v91 = OUTLINED_FUNCTION_1_140();
      goto LABEL_82;
    }
  }
  else
  {
    uint64_t v11 = v99;
  }
  if (sub_1C68EAF78())
  {
    sub_1C65EF954(&v111);
    swift_release();
    char v30 = v111;
    if (v111 != 20)
    {
      if (v97)
      {
        if (v111 == 2)
        {
          int v97 = 0;
          char v30 = 20;
          uint64_t v38 = 1;
        }
        else
        {
          if (v111 != 3)
          {
            int v97 = 1;
            goto LABEL_76;
          }
          int v97 = 0;
          char v30 = 20;
          uint64_t v38 = 52;
        }
        uint64_t v95 = v38;
      }
      else
      {
        int v97 = 0;
      }
LABEL_76:
      char v44 = 10;
      goto LABEL_77;
    }
  }
  if (sub_1C68EAF68())
  {
    sub_1C65EF954(&v111);
    swift_release();
    char v29 = v111;
    if (v111 != 20)
    {
      char v36 = 9;
      if (!sub_1C68EAF68()) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }
  }
  if (!sub_1C68EAFF8() || (sub_1C65EF954(&v111), swift_release(), char v29 = v111, v111 == 20))
  {
    if (sub_1C68EAFA8())
    {
      uint64_t v91 = UsoEntity_common_DateTimeRange.toDateTimeRange()();
      swift_release();
    }
    else
    {
      uint64_t v91 = 0;
    }
    goto LABEL_33;
  }
  if (sub_1C68EAFF8())
  {
    sub_1C68DD648(&v111);
    swift_release();
    if (v111 == 7) {
      char v39 = 10;
    }
    else {
      char v39 = 38;
    }
  }
  else
  {
    char v39 = 10;
  }
  char v111 = v39;
LABEL_32:
  char v110 = v29;
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  uint64_t v91 = OUTLINED_FUNCTION_1_140();
LABEL_33:
  uint64_t v11 = v99;
LABEL_82:
  uint64_t v45 = sub_1C68EADD8();
  uint64_t v46 = v45;
  if (!v45) {
    goto LABEL_111;
  }
  uint64_t v106 = v16;
  uint64_t v88 = v23;
  uint64_t v47 = *(void *)(v45 + 16);
  if (!v47)
  {
    uint64_t v64 = 1;
    uint64_t v50 = v101;
LABEL_105:
    uint64_t v65 = v88;
    goto LABEL_109;
  }
  v87[2] = v3;
  v87[3] = v2;
  uint64_t v11 = (void (*)(void))(v92 + 16);
  uint64_t v48 = *(void (**)(void))(v92 + 16);
  unint64_t v49 = v45 + ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80));
  uint64_t v3 = v92 + 8;
  uint64_t v103 = *(void *)(v92 + 72);
  v87[1] = v45;
  swift_bridgeObjectRetain();
  BOOL v105 = "appIntentsBiomeBookmark";
  unint64_t v96 = 0x80000001C6920FD0;
  uint64_t v104 = "DataDetectorService";
  unint64_t v98 = 0x80000001C6920FF0;
  uint64_t v102 = v3 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v51 = v100;
  uint64_t v50 = v101;
  while (1)
  {
    ((void (*)(char *, unint64_t, uint64_t))v48)(v51, v49, v50);
    uint64_t v53 = (void (*)(void))v50;
    if (sub_1C68EA8D8() == 0xD000000000000013 && v52 == v96)
    {
      swift_bridgeObjectRelease();
      uint64_t v54 = v107;
      ((void (*)(char *, char *, uint64_t))v48)(v107, v51, v50);
LABEL_107:
      (*(void (**)(char *, void (*)(void)))v3)(v54, v53);
      goto LABEL_108;
    }
    uint64_t v50 = sub_1C68ED7E8();
    swift_bridgeObjectRelease();
    uint64_t v54 = v107;
    OUTLINED_FUNCTION_5_99();
    v48();
    if (v50) {
      goto LABEL_107;
    }
    if (sub_1C68EA8D8() == 0xD000000000000015 && v55 == v98)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5_99();
      v48();
    }
    else
    {
      uint64_t v50 = sub_1C68ED7E8();
      swift_bridgeObjectRelease();
      uint64_t v56 = v107;
      OUTLINED_FUNCTION_5_99();
      v48();
      if ((v50 & 1) == 0)
      {
        uint64_t v63 = OUTLINED_FUNCTION_2_147();
        ((void (*)(uint64_t))v53)(v63);
        uint64_t v62 = v56;
        goto LABEL_101;
      }
    }
    uint64_t v57 = sub_1C68EA958();
    if (!v58)
    {
      uint64_t v61 = OUTLINED_FUNCTION_2_147();
      ((void (*)(uint64_t))v53)(v61);
      uint64_t v62 = v107;
LABEL_101:
      ((void (*)(char *, uint64_t))v53)(v62, v50);
      goto LABEL_102;
    }
    if (v57 == 0x4E796164696C6F68 && v58 == 0xEB00000000656D61) {
      break;
    }
    char v60 = sub_1C68ED7E8();
    uint64_t v53 = *(void (**)(void))v3;
    OUTLINED_FUNCTION_24_5();
    v53();
    uint64_t v51 = v100;
    OUTLINED_FUNCTION_24_5();
    v53();
    swift_bridgeObjectRelease();
    if (v60) {
      goto LABEL_108;
    }
    uint64_t v50 = v101;
LABEL_102:
    ((void (*)(char *, uint64_t))v53)(v51, v50);
    v49 += v103;
    if (!--v47)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_102();
      goto LABEL_105;
    }
  }
  uint64_t v11 = *(void (**)(void))v3;
  OUTLINED_FUNCTION_24_5();
  v11();
  OUTLINED_FUNCTION_24_5();
  v11();
  swift_bridgeObjectRelease();
LABEL_108:
  swift_bridgeObjectRelease();
  uint64_t v65 = v88;
  uint64_t v50 = v101;
  (*(void (**)(uint64_t, char *, uint64_t))(v92 + 32))(v88, v51, v101);
  OUTLINED_FUNCTION_4_102();
LABEL_109:
  __swift_storeEnumTagSinglePayload(v65, v64, 1, v50);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v65, 1, v50) == 1)
  {
    sub_1C65EA728(v65, &qword_1EA40B4C8);
    uint64_t v46 = 0;
LABEL_111:
    uint64_t v66 = 0;
  }
  else
  {
    uint64_t v46 = sub_1C68EA948();
    uint64_t v66 = v67;
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v65, v50);
  }
  uint64_t v68 = sub_1C68EAFD8();
  if (v69)
  {
    uint64_t v70 = v69;
    if (v66)
    {
      uint64_t v71 = v68;
      char v111 = 12;
      type metadata accessor for DateTime.Date.Holiday();
      swift_allocObject();
      uint64_t v66 = DateTime.Date.Holiday.init(with:name:calendarSystem:)(v46, v66, v71, v70, &v111);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v66 = 0;
  }
  uint64_t v72 = sub_1C68EAF98();
  if (v72 && (char v73 = v72, v74 = sub_1C68EB3A8(), swift_release(), v74))
  {
    uint64_t v75 = sub_1C65EF9B0();
    OUTLINED_FUNCTION_7_81();
    char v76 = v73 & 1;
  }
  else
  {
    uint64_t v75 = 0;
    char v76 = 1;
  }
  if (sub_1C68EAFE8())
  {
    uint64_t v77 = sub_1C65EF9B0();
    char v79 = v78;
    swift_release();
    char v80 = v79 & 1;
  }
  else
  {
    uint64_t v77 = 0;
    char v80 = 1;
  }
  sub_1C68EAFB8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3) == 1)
  {
    sub_1C65EA728((uint64_t)v11, &qword_1EA40B4C0);
    char v81 = 7;
  }
  else
  {
    uint64_t v82 = v89;
    uint64_t v83 = v90;
    (*(void (**)(uint64_t, void (*)(void), uint64_t))(v89 + 16))(v90, v11, v3);
    int v84 = (*(uint64_t (**)(uint64_t, uint64_t))(v82 + 88))(v83, v3);
    if (v84 == *MEMORY[0x1E4FA30E0])
    {
      char v81 = 1;
    }
    else if (v84 == *MEMORY[0x1E4FA30D0])
    {
      char v81 = 3;
    }
    else if (v84 == *MEMORY[0x1E4FA30C8])
    {
      char v81 = 5;
    }
    else if (v84 == *MEMORY[0x1E4FA30D8])
    {
      char v81 = 0;
    }
    else if (v84 == *MEMORY[0x1E4FA30C0])
    {
      char v81 = 2;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v90, v3);
      char v81 = 7;
    }
    (*(void (**)(void (*)(void), uint64_t))(v82 + 8))(v99, v3);
  }
  char v111 = v81;
  char v110 = v112[0];
  if (sub_1C68EAFF8())
  {
    sub_1C68DD648(&v109);
    swift_release();
    char v85 = v109;
  }
  else
  {
    char v85 = 7;
  }
  char v109 = v85;
  sub_1C68EAF88();
  swift_release();
  char v108 = 7;
  type metadata accessor for DateTime.Date();
  swift_allocObject();
  return DateTime.Date.init(withDay:month:year:definedValue:holiday:monthOfYear:weekOfYear:dayOfWeek:dayOfWeekOrdinal:calendarEra:occurringIn:)(v94, v93, v75, v76, v77, v80, &v111, v66, &v110, v95, v97, &v109, 0, 1, &v108, v91);
}

uint64_t OUTLINED_FUNCTION_1_140()
{
  return DateTime.DateTimeRange.init(at:start:end:duration:interval:definedValue:qualifier:)(0, 0, 0, 0, 0, (char *)(v0 - 90), (char *)(v0 - 91));
}

uint64_t OUTLINED_FUNCTION_2_147()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_81()
{
  return swift_release();
}

uint64_t sub_1C68DC14C()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_2_148()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_118()
{
  return sub_1C68EB298();
}

uint64_t UsoEntity_common_DateTimeRange.toDateTimeRange()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C68EC478();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x1F4188790](v2);
  char v42 = (char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4D8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_1C68EB518()
    || (sub_1C68DD34C((char *)&v47), swift_release(), int v7 = v47, v47 == 20))
  {
    if (sub_1C68EADB8())
    {
      sub_1C68DE004((char *)&v47);
      swift_release();
      int v7 = v47;
    }
    else
    {
      int v7 = 20;
    }
  }
  uint64_t v8 = sub_1C68EB508();
  int v41 = v7;
  if (v8 && (unint64_t v9 = UsoEntity_common_Duration.toInterval(offsetDirection:)(0), swift_release(), v9))
  {
    uint64_t v10 = *(void *)(v9 + 16);
    char v11 = *(unsigned char *)(v9 + 24);
    char v12 = *(unsigned char *)(v9 + 25);
    swift_release();
    LOBYTE(v47) = v12;
    char v46 = v7;
    type metadata accessor for DateTime.Interval();
    swift_allocObject();
    uint64_t v13 = DateTime.Interval.init(withQuantity:timeUnit:qualifier:)(v10, v11, (char *)&v47, &v46);
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (sub_1C68EB4D8())
  {
    uint64_t v14 = sub_1C65EEF50(0);
    swift_release();
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (sub_1C68EB4F8())
  {
    uint64_t v15 = sub_1C65EEF50(0);
    swift_release();
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (sub_1C68EB4E8())
  {
    uint64_t v16 = sub_1C65EEF50(0);
    swift_release();
  }
  else
  {
    uint64_t v16 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0C10;
  if (v14) {
    uint64_t v18 = swift_retain();
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)(inited + 32) = v18;
  if (v15) {
    uint64_t v19 = swift_retain();
  }
  else {
    uint64_t v19 = 0;
  }
  *(void *)(inited + 40) = v19;
  uint64_t v45 = v16;
  if (v16) {
    uint64_t v20 = swift_retain();
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)(inited + 48) = v20;
  uint64_t v47 = (void *)inited;
  sub_1C68ECC18();
  uint64_t v21 = v47;
  uint64_t v47 = (void *)MEMORY[0x1E4FBC860];
  if (v21[4])
  {
    uint64_t v22 = swift_retain();
    MEMORY[0x1C87A3B00](v22);
    OUTLINED_FUNCTION_0_115();
    if (v23) {
      OUTLINED_FUNCTION_1_142();
    }
    sub_1C68ECC58();
    sub_1C68ECC18();
  }
  if (v21[5])
  {
    uint64_t v24 = swift_retain();
    MEMORY[0x1C87A3B00](v24);
    OUTLINED_FUNCTION_0_115();
    if (v23) {
      OUTLINED_FUNCTION_1_142();
    }
    sub_1C68ECC58();
    sub_1C68ECC18();
  }
  if (v21[6])
  {
    uint64_t v25 = swift_retain();
    MEMORY[0x1C87A3B00](v25);
    OUTLINED_FUNCTION_0_115();
    if (v23) {
      OUTLINED_FUNCTION_1_142();
    }
    sub_1C68ECC58();
    sub_1C68ECC18();
  }
  swift_bridgeObjectRelease();
  if (v14) {
    uint64_t v26 = sub_1C68DCD34();
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v45;
  v40[1] = v15;
  if (v15) {
    uint64_t v28 = sub_1C68DCD34();
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = (uint64_t)v6;
  if (v27) {
    uint64_t v27 = sub_1C68DCD34();
  }
  uint64_t v30 = v13;
  swift_retain();
  sub_1C68EB4B8();
  uint64_t v31 = sub_1C68EB4C8();
  if (__swift_getEnumTagSinglePayload(v29, 1, v31) == 1)
  {
    sub_1C68DC7AC(v29);
    char v32 = 38;
  }
  else
  {
    sub_1C68DCFA4((char *)&v47);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v29, v31);
    char v32 = (char)v47;
  }
  LOBYTE(v47) = v32;
  char v46 = v41;
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  DateTime.DateTimeRange.init(at:start:end:duration:interval:definedValue:qualifier:)(v26, v28, v27, v30, 0, (char *)&v47, &v46);
  uint64_t v33 = sub_1C68DC80C();
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_1EA405780 != -1) {
    swift_once();
  }
  uint64_t v34 = v44;
  uint64_t v35 = __swift_project_value_buffer(v44, (uint64_t)qword_1EA442820);
  char v36 = v42;
  uint64_t v37 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v42, v35, v34);
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v1;
  *(void *)(v38 + 24) = v33;
  swift_retain();
  swift_retain();
  Logger.asyncBackground(_:)((uint64_t)sub_1C68DCEF8, v38);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v34);
  swift_release();
  return v33;
}

uint64_t sub_1C68DC7AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DC80C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F03F0;
  *(void *)(inited + 32) = v0;
  unint64_t v41 = inited;
  sub_1C68ECC18();
  swift_retain();
  unint64_t v2 = swift_bridgeObjectRetain();
  sub_1C68BD7C4(v2);
  unint64_t v3 = v41;
  if (v41 >> 62) {
    goto LABEL_74;
  }
  uint64_t v4 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1C68ED528())
  {
    unint64_t v5 = v3 & 0xC000000000000001;
    uint64_t v6 = 4;
    while (1)
    {
      if (v5)
      {
        uint64_t v7 = MEMORY[0x1C87A4300](v6 - 4, v3);
      }
      else
      {
        uint64_t v7 = *(void *)(v3 + 8 * v6);
        swift_retain();
      }
      uint64_t v8 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      if (*(void *)(v7 + 16))
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = *(void *)(v7 + 16);
        swift_retain();
        swift_release();
        goto LABEL_12;
      }
      swift_release();
      ++v6;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = 0;
LABEL_12:
        swift_bridgeObjectRetain();
        uint64_t v10 = 4;
        while (1)
        {
          if (v5)
          {
            uint64_t v11 = MEMORY[0x1C87A4300](v10 - 4, v3);
          }
          else
          {
            uint64_t v11 = *(void *)(v3 + 8 * v10);
            swift_retain();
          }
          uint64_t v12 = v10 - 3;
          if (__OFADD__(v10 - 4, 1)) {
            goto LABEL_68;
          }
          if (*(void *)(v11 + 24)) {
            break;
          }
          swift_release();
          ++v10;
          if (v12 == v4)
          {
            swift_bridgeObjectRelease();
            uint64_t v13 = 0;
LABEL_21:
            swift_bridgeObjectRetain();
            uint64_t v14 = 4;
            while (1)
            {
              if (v5)
              {
                uint64_t v15 = MEMORY[0x1C87A4300](v14 - 4, v3);
              }
              else
              {
                uint64_t v15 = *(void *)(v3 + 8 * v14);
                swift_retain();
              }
              uint64_t v16 = v14 - 3;
              if (__OFADD__(v14 - 4, 1)) {
                goto LABEL_69;
              }
              if (*(void *)(v15 + 32)) {
                break;
              }
              swift_release();
              ++v14;
              if (v16 == v4)
              {
                swift_bridgeObjectRelease();
                uint64_t v17 = 0;
LABEL_30:
                swift_bridgeObjectRetain();
                uint64_t v18 = 4;
                while (1)
                {
                  if (v5)
                  {
                    uint64_t v19 = MEMORY[0x1C87A4300](v18 - 4, v3);
                  }
                  else
                  {
                    uint64_t v19 = *(void *)(v3 + 8 * v18);
                    swift_retain();
                  }
                  uint64_t v20 = v18 - 3;
                  if (__OFADD__(v18 - 4, 1)) {
                    goto LABEL_70;
                  }
                  if (*(void *)(v19 + 40)) {
                    break;
                  }
                  swift_release();
                  ++v18;
                  if (v20 == v4)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v21 = 0;
LABEL_39:
                    swift_bridgeObjectRetain();
                    uint64_t v22 = 4;
                    uint64_t v39 = v17;
                    while (1)
                    {
                      if (v5)
                      {
                        uint64_t v23 = MEMORY[0x1C87A4300](v22 - 4, v3);
                      }
                      else
                      {
                        uint64_t v23 = *(void *)(v3 + 8 * v22);
                        swift_retain();
                      }
                      uint64_t v24 = v22 - 3;
                      if (__OFADD__(v22 - 4, 1)) {
                        goto LABEL_71;
                      }
                      if (*(void *)(v23 + 48)) {
                        break;
                      }
                      swift_release();
                      ++v22;
                      if (v24 == v4)
                      {
                        uint64_t v25 = v13;
                        uint64_t v26 = v9;
                        swift_bridgeObjectRelease();
                        uint64_t v27 = 0;
LABEL_48:
                        swift_bridgeObjectRetain();
                        uint64_t v28 = 4;
                        while (1)
                        {
                          if (v5)
                          {
                            uint64_t v29 = MEMORY[0x1C87A4300](v28 - 4, v3);
                          }
                          else
                          {
                            uint64_t v29 = *(void *)(v3 + 8 * v28);
                            swift_retain();
                          }
                          uint64_t v30 = v28 - 3;
                          if (__OFADD__(v28 - 4, 1)) {
                            goto LABEL_72;
                          }
                          if (*(unsigned char *)(v29 + 56) != 38) {
                            break;
                          }
                          swift_release();
                          ++v28;
                          if (v30 == v4)
                          {
                            swift_bridgeObjectRelease();
                            char v31 = 38;
LABEL_57:
                            LOBYTE(v41) = v31;
                            swift_bridgeObjectRetain();
                            uint64_t v32 = 4;
                            while (1)
                            {
                              if (v5)
                              {
                                uint64_t v33 = MEMORY[0x1C87A4300](v32 - 4, v3);
                              }
                              else
                              {
                                uint64_t v33 = *(void *)(v3 + 8 * v32);
                                swift_retain();
                              }
                              uint64_t v34 = v32 - 3;
                              if (__OFADD__(v32 - 4, 1)) {
                                goto LABEL_73;
                              }
                              if (*(unsigned char *)(v33 + 57) != 20) {
                                break;
                              }
                              swift_release();
                              ++v32;
                              if (v34 == v4)
                              {
                                swift_bridgeObjectRelease_n();
                                char v35 = 20;
LABEL_66:
                                uint64_t v36 = v26;
                                uint64_t v37 = v39;
                                goto LABEL_76;
                              }
                            }
                            swift_bridgeObjectRelease_n();
                            char v35 = *(unsigned char *)(v33 + 57);
                            swift_release();
                            goto LABEL_66;
                          }
                        }
                        swift_bridgeObjectRelease();
                        char v31 = *(unsigned char *)(v29 + 56);
                        swift_release();
                        goto LABEL_57;
                      }
                    }
                    uint64_t v25 = v13;
                    uint64_t v26 = v9;
                    swift_bridgeObjectRelease();
                    uint64_t v27 = *(void *)(v23 + 48);
                    swift_retain();
                    swift_release();
                    goto LABEL_48;
                  }
                }
                swift_bridgeObjectRelease();
                uint64_t v21 = *(void *)(v19 + 40);
                swift_retain();
                swift_release();
                goto LABEL_39;
              }
            }
            swift_bridgeObjectRelease();
            uint64_t v17 = *(void *)(v15 + 32);
            swift_retain();
            swift_release();
            goto LABEL_30;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v13 = *(void *)(v11 + 24);
        swift_retain();
        swift_release();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  LOBYTE(v41) = 38;
  swift_bridgeObjectRelease();
  uint64_t v36 = 0;
  uint64_t v25 = 0;
  uint64_t v37 = 0;
  uint64_t v21 = 0;
  uint64_t v27 = 0;
  char v35 = 20;
LABEL_76:
  char v40 = v35;
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  return DateTime.DateTimeRange.init(at:start:end:duration:interval:definedValue:qualifier:)(v36, v25, v37, v21, v27, (char *)&v41, &v40);
}

uint64_t sub_1C68DCD34()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  char v7 = *(unsigned char *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  char v6 = *(unsigned char *)(v0 + 48);
  type metadata accessor for DateTime();
  swift_allocObject();
  uint64_t v4 = DateTime.init(withDate:time:definedValue:recurrencePattern:temporalIntent:occurringIn:)(v1, v2, &v7, v3, &v6, 0);
  swift_retain();
  swift_retain();
  swift_retain();
  return v4;
}

uint64_t sub_1C68DCDCC()
{
  return 0;
}

uint64_t sub_1C68DCEB8()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C68DCEF8()
{
  return sub_1C68DCDCC();
}

uint64_t UsoEntity_common_DateTimeRange.toDateTime()()
{
  char v3 = 1;
  char v2 = 4;
  uint64_t v0 = UsoEntity_common_DateTimeRange.toDateTimeRange()();
  type metadata accessor for DateTime();
  swift_allocObject();
  return DateTime.init(withDate:time:definedValue:recurrencePattern:temporalIntent:occurringIn:)(0, 0, &v3, 0, &v2, v0);
}

uint64_t OUTLINED_FUNCTION_1_142()
{
  return sub_1C68ECC28();
}

uint64_t sub_1C68DCFA4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C68EB4C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FA3438])
  {
    char v9 = 10;
LABEL_47:
    *a1 = v9;
    return result;
  }
  if (result == *MEMORY[0x1E4FA3488])
  {
    char v9 = 18;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3428])
  {
    *a1 = 0;
    return result;
  }
  if (result == *MEMORY[0x1E4FA3480])
  {
    char v9 = 17;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3478])
  {
    char v9 = 1;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34C0])
  {
    char v9 = 21;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34E0])
  {
    char v9 = 6;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3470])
  {
    char v9 = 16;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34D0])
  {
    char v9 = 14;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34A0])
  {
    char v9 = 12;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3490])
  {
    char v9 = 20;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3468])
  {
    char v9 = 7;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34B8])
  {
    char v9 = 13;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34B0])
  {
    char v9 = 19;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3440])
  {
    char v9 = 11;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3448])
  {
    char v9 = 9;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34D8])
  {
    char v9 = 3;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34A8])
  {
    char v9 = 15;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3430])
  {
    char v9 = 8;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3460])
  {
    char v9 = 4;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA34C8])
  {
    char v9 = 2;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3458])
  {
    char v9 = 38;
    goto LABEL_47;
  }
  if (result == *MEMORY[0x1E4FA3498])
  {
    char v9 = 5;
    goto LABEL_47;
  }
  int v10 = *MEMORY[0x1E4FA3450];
  *a1 = 38;
  if (result != v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_1C68DD34C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4E8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB858();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  char v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_1C68EB848();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68DD5E8((uint64_t)v4);
LABEL_3:
    char v13 = 20;
    goto LABEL_14;
  }
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v11, v4, v5);
  v14(v9, v11, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  if (result == *MEMORY[0x1E4FA3778])
  {
    char v13 = 6;
    goto LABEL_14;
  }
  if (result == *MEMORY[0x1E4FA3780])
  {
    char v13 = 7;
    goto LABEL_14;
  }
  if (result == *MEMORY[0x1E4FA3758])
  {
    char v13 = 1;
    goto LABEL_14;
  }
  if (result == *MEMORY[0x1E4FA3768])
  {
    char v13 = 3;
    goto LABEL_14;
  }
  if (result == *MEMORY[0x1E4FA3750])
  {
    char v13 = 4;
    goto LABEL_14;
  }
  if (result == *MEMORY[0x1E4FA3770]) {
    goto LABEL_3;
  }
  if (result == *MEMORY[0x1E4FA3760])
  {
    *a1 = 0;
    return result;
  }
  if (result != *MEMORY[0x1E4FA3788])
  {
    *a1 = 20;
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  char v13 = 5;
LABEL_14:
  *a1 = v13;
  return result;
}

uint64_t sub_1C68DD5E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DD648@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4F0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB2B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  char v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_1C68EB2A8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68DD8D0((uint64_t)v4);
    char v13 = 7;
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v11, v4, v5);
    v14(v9, v11, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (result == *MEMORY[0x1E4FA31F0])
    {
      char v13 = 3;
    }
    else if (result == *MEMORY[0x1E4FA31C0])
    {
      char v13 = 2;
    }
    else if (result == *MEMORY[0x1E4FA31E8])
    {
      char v13 = 5;
    }
    else if (result == *MEMORY[0x1E4FA31C8])
    {
      char v13 = 4;
    }
    else
    {
      if (result == *MEMORY[0x1E4FA31D0])
      {
        *a1 = 0;
        return result;
      }
      if (result == *MEMORY[0x1E4FA31E0])
      {
        char v13 = 1;
      }
      else
      {
        if (result != *MEMORY[0x1E4FA31D8])
        {
          *a1 = 7;
          return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        }
        char v13 = 6;
      }
    }
  }
  *a1 = v13;
  return result;
}

uint64_t sub_1C68DD8D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t UsoEntity_common_Duration.toInterval(offsetDirection:)(uint64_t a1)
{
  unint64_t result = sub_1C68EB238();
  if (result)
  {
    uint64_t v3 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_1C68ED528();
      swift_bridgeObjectRelease();
      if (v13 == 1)
      {
LABEL_4:
        sub_1C66749C8(0, (v3 & 0xC000000000000001) == 0, v3);
        if ((v3 & 0xC000000000000001) == 0)
        {
          swift_retain();
          goto LABEL_6;
        }
LABEL_51:
        MEMORY[0x1C87A4300](0, v3);
LABEL_6:
        swift_bridgeObjectRelease();
        uint64_t v5 = sub_1C68DDD00();
        char v7 = v6;
        sub_1C68EAC88();
        if (v30 && (uint64_t v8 = sub_1C68EB6A8(), swift_release(), v8))
        {
          sub_1C68E11B8(&v31);
          swift_release();
          char v9 = v31;
        }
        else
        {
          char v9 = 13;
        }
        LOBYTE(v30) = v9;
        if (a1 && (sub_1C68DEAEC(&v31), char v10 = v31, v31 != 20))
        {
          swift_release();
        }
        else if (sub_1C68EB248())
        {
          sub_1C68DE890(&v31);
          swift_release();
          swift_release();
          char v10 = v31;
        }
        else
        {
          swift_release();
          char v10 = 20;
        }
        if (v7) {
          uint64_t v11 = 0x3FF0000000000000;
        }
        else {
          uint64_t v11 = v5;
        }
        char v29 = v10;
        type metadata accessor for DateTime.Interval();
        swift_allocObject();
        uint64_t v12 = v11;
        return DateTime.Interval.init(withQuantity:timeUnit:qualifier:)(v12, 0, (char *)&v30, &v29);
      }
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_1C68ED528();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v4 == 1) {
        goto LABEL_4;
      }
    }
    if (!v4)
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = 0;
LABEL_40:
      LOBYTE(v30) = 10;
      if (!a1 || (sub_1C68DEAEC(&v31), char v27 = v31, v31 == 20))
      {
        if (sub_1C68EB248())
        {
          sub_1C68DE890(&v31);
          swift_release();
          char v27 = v31;
        }
        else
        {
          char v27 = 20;
        }
      }
      char v29 = v27;
      type metadata accessor for DateTime.Interval();
      swift_allocObject();
      uint64_t v12 = v26;
      return DateTime.Interval.init(withQuantity:timeUnit:qualifier:)(v12, 0, (char *)&v30, &v29);
    }
    uint64_t v28 = a1;
    double v14 = 0.0;
    uint64_t v15 = 4;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        MEMORY[0x1C87A4300](v15 - 4, v3);
      }
      else {
        swift_retain();
      }
      a1 = v15 - 3;
      if (__OFADD__(v15 - 4, 1)) {
        break;
      }
      uint64_t v16 = sub_1C68DDD00();
      if (v17)
      {
        swift_release();
LABEL_45:
        swift_bridgeObjectRelease();
        return 0;
      }
      double v18 = *(double *)&v16;
      sub_1C68EAC88();
      if (v30 && (uint64_t v19 = sub_1C68EB6A8(), swift_release(), v19))
      {
        sub_1C68E11B8(&v31);
        swift_release();
        char v20 = v31;
      }
      else
      {
        char v20 = 13;
      }
      LOBYTE(v30) = v20;
      if (sub_1C68EB248())
      {
        sub_1C68DE890(&v31);
        swift_release();
        char v21 = v31;
      }
      else
      {
        char v21 = 20;
      }
      char v31 = v21;
      sub_1C68DDDDC(&v30, &v31, v18);
      double v23 = v22;
      char v25 = v24;
      swift_release();
      if (v25) {
        goto LABEL_45;
      }
      double v14 = v14 + v23;
      ++v15;
      if (a1 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v26 = *(void *)&v14;
        a1 = v28;
        goto LABEL_40;
      }
    }
    __break(1u);
    goto LABEL_51;
  }
  return result;
}

unint64_t UsoEntity_common_Duration.toInterval()()
{
  return UsoEntity_common_Duration.toInterval(offsetDirection:)(0);
}

uint64_t sub_1C68DDD00()
{
  sub_1C68EAC88();
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v0 = sub_1C68EB6B8();
  swift_release();
  if (!v0) {
    goto LABEL_5;
  }
  swift_retain();
  sub_1C68EA808();
  swift_release();
  sub_1C68EB198();
  sub_1C68EB298();
  swift_release();
  uint64_t v1 = sub_1C68EB188();
  char v3 = v2;
  swift_release();
  swift_release();
  if ((v3 & 1) == 0) {
    *(double *)&uint64_t result = (double)v1;
  }
  else {
LABEL_5:
  }
    *(double *)&uint64_t result = 0.0;
  return result;
}

double sub_1C68DDDDC(unsigned char *a1, unsigned char *a2, double a3)
{
  if (*a1 == 13)
  {
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1C68EC478();
    __swift_project_value_buffer(v3, (uint64_t)qword_1EBBF7AF0);
    uint64_t v4 = sub_1C68EC458();
    os_log_type_t v5 = sub_1C68ECE48();
    if (os_log_type_enabled(v4, v5))
    {
      char v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v6 = 0;
      char v7 = "timeUnit is not present, not normalizing and returning nil";
LABEL_6:
      _os_log_impl(&dword_1C65AE000, v4, v5, v7, v6, 2u);
      MEMORY[0x1C87A54F0](v6, -1, -1);
    }
LABEL_7:
  }
  else
  {
    double v9 = 1.0;
    if (*a2 == 9) {
      double v9 = -1.0;
    }
    switch(*a1)
    {
      case 4:
        a3 = a3 * 60.0;
        goto LABEL_13;
      case 5:
        double v10 = a3 / 1000.0;
        goto LABEL_14;
      case 6:
LABEL_13:
        double v10 = a3 * 60.0;
LABEL_14:
        double result = v10 * v9;
        break;
      case 0xA:
        double result = v9 * a3;
        break;
      default:
        if (qword_1EBBF68C0 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_1C68EC478();
        __swift_project_value_buffer(v11, (uint64_t)qword_1EBBF7AF0);
        uint64_t v4 = sub_1C68EC458();
        os_log_type_t v5 = sub_1C68ECE48();
        if (!os_log_type_enabled(v4, v5)) {
          goto LABEL_7;
        }
        char v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v6 = 0;
        char v7 = "normalization only supported for grains time less than or equal to 'hour'";
        goto LABEL_6;
    }
  }
  return result;
}

uint64_t sub_1C68DE004@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4F8);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  os_log_type_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  char v7 = (char *)&v14 - v6;
  sub_1C68EB3E8();
  uint64_t v8 = sub_1C68EB3F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) != 1)
  {
    sub_1C68DE25C((uint64_t)v7, (uint64_t)v5);
    uint64_t v10 = *(void *)(v8 - 8);
    int v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v5, v8);
    if (v11 == *MEMORY[0x1E4FA3310])
    {
      char v9 = 2;
      goto LABEL_17;
    }
    if (v11 == *MEMORY[0x1E4FA3390] || v11 == *MEMORY[0x1E4FA3398])
    {
      char v9 = 3;
      goto LABEL_17;
    }
    if (v11 == *MEMORY[0x1E4FA3410])
    {
      char v9 = 19;
      goto LABEL_17;
    }
    if (v11 == *MEMORY[0x1E4FA33F0])
    {
      char v9 = 16;
      goto LABEL_17;
    }
    if (v11 == *MEMORY[0x1E4FA33A0])
    {
      char v9 = 17;
      goto LABEL_17;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v8);
  }
  char v9 = 20;
LABEL_17:
  *a1 = v9;
  return sub_1C68DE1FC((uint64_t)v7);
}

uint64_t sub_1C68DE1FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DE25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C68DE2C4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B500);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  os_log_type_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  char v7 = (char *)&v13 - v6;
  sub_1C68EB258();
  uint64_t v8 = sub_1C68EB268();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1) {
    goto LABEL_7;
  }
  sub_1C68DE4B4((uint64_t)v7, (uint64_t)v5);
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v5, v8);
  if (v10 != *MEMORY[0x1E4FA3150])
  {
    if (v10 == *MEMORY[0x1E4FA3148])
    {
      char v11 = 0;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
LABEL_7:
    char v11 = 2;
    goto LABEL_8;
  }
  char v11 = 1;
LABEL_8:
  *a1 = v11;
  return sub_1C68DE454((uint64_t)v7);
}

uint64_t sub_1C68DE454(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DE4B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C68DE51C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B508);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB3B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  char v11 = (char *)&v15 - v10;
  sub_1C68EB398();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68DE830((uint64_t)v4);
    char v13 = 12;
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v11, v4, v5);
    v14(v9, v11, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (result == *MEMORY[0x1E4FA32A8])
    {
      char v13 = 3;
    }
    else if (result == *MEMORY[0x1E4FA32D0])
    {
      char v13 = 11;
    }
    else
    {
      if (result == *MEMORY[0x1E4FA32C0])
      {
        *a1 = 0;
        return result;
      }
      if (result == *MEMORY[0x1E4FA32E0])
      {
        char v13 = 10;
      }
      else if (result == *MEMORY[0x1E4FA32A0])
      {
        char v13 = 5;
      }
      else if (result == *MEMORY[0x1E4FA32D8])
      {
        char v13 = 1;
      }
      else if (result == *MEMORY[0x1E4FA3288])
      {
        char v13 = 8;
      }
      else if (result == *MEMORY[0x1E4FA32B0])
      {
        char v13 = 2;
      }
      else if (result == *MEMORY[0x1E4FA3298])
      {
        char v13 = 6;
      }
      else if (result == *MEMORY[0x1E4FA3290])
      {
        char v13 = 4;
      }
      else if (result == *MEMORY[0x1E4FA32B8])
      {
        char v13 = 7;
      }
      else
      {
        if (result != *MEMORY[0x1E4FA32C8])
        {
          *a1 = 12;
          return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        }
        char v13 = 9;
      }
    }
  }
  *a1 = v13;
  return result;
}

uint64_t sub_1C68DE830(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B508);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DE890@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B510);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB2D8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  char v11 = (char *)&v15 - v10;
  sub_1C68EB2C8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68DEA8C((uint64_t)v4);
    char v13 = 20;
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v11, v4, v5);
    v14(v9, v11, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (result == *MEMORY[0x1E4FA3210])
    {
      char v13 = 9;
    }
    else
    {
      if (result != *MEMORY[0x1E4FA3218])
      {
        *a1 = 20;
        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }
      char v13 = 8;
    }
  }
  *a1 = v13;
  return result;
}

uint64_t sub_1C68DEA8C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DEAEC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B518);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB568();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  char v11 = (char *)&v15 - v10;
  sub_1C68EB558();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68DECE8((uint64_t)v4);
    char v13 = 20;
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v11, v4, v5);
    v14(v9, v11, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (result == *MEMORY[0x1E4FA36C0])
    {
      char v13 = 8;
    }
    else
    {
      if (result != *MEMORY[0x1E4FA36C8])
      {
        *a1 = 20;
        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }
      char v13 = 9;
    }
  }
  *a1 = v13;
  return result;
}

uint64_t sub_1C68DECE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B518);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68DED48(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1C68EC8E8();
  uint64_t v5 = OUTLINED_FUNCTION_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_19_1();
  char v11 = a2;
  sub_1C68E92A8();
  OUTLINED_FUNCTION_20_52();
  uint64_t v6 = sub_1C68E9298();
  sub_1C66CA428();
  sub_1C68E9288();
  OUTLINED_FUNCTION_7_82();
  if (!v6)
  {
    sub_1C68EC8D8();
    OUTLINED_FUNCTION_9_81();
    if (v7)
    {
      OUTLINED_FUNCTION_4_103();
    }
    else
    {
      type metadata accessor for InferenceError();
      OUTLINED_FUNCTION_13_60();
      OUTLINED_FUNCTION_3_119();
      OUTLINED_FUNCTION_0_116(MEMORY[0x1E4FBC860], a1, v11);
      OUTLINED_FUNCTION_1_143();
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      uint64_t v9 = OUTLINED_FUNCTION_2_149();
      OUTLINED_FUNCTION_11_72(v9, v10);
      OUTLINED_FUNCTION_0_114();
    }
  }
  return OUTLINED_FUNCTION_8_86();
}

uint64_t sub_1C68DEE90()
{
  return sub_1C68DF08C((void (*)(void))type metadata accessor for StitchedContactData, &qword_1EA40B590, (void (*)(uint64_t))type metadata accessor for StitchedContactData);
}

uint64_t sub_1C68DEEEC()
{
  uint64_t v0 = sub_1C68EC8E8();
  uint64_t v1 = OUTLINED_FUNCTION_3(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_14_61();
  OUTLINED_FUNCTION_20_52();
  sub_1C68E9298();
  uint64_t v2 = sub_1C68EB178();
  sub_1C68DFEE0(&qword_1EA40B538, MEMORY[0x1E4FA3128]);
  OUTLINED_FUNCTION_19_47();
  OUTLINED_FUNCTION_7_82();
  if (!v2)
  {
    sub_1C68EC8D8();
    OUTLINED_FUNCTION_9_81();
    if (v3)
    {
      OUTLINED_FUNCTION_4_103();
    }
    else
    {
      type metadata accessor for InferenceError();
      OUTLINED_FUNCTION_13_60();
      OUTLINED_FUNCTION_3_119();
      OUTLINED_FUNCTION_0_116(MEMORY[0x1E4FBC860], v7, v8);
      OUTLINED_FUNCTION_1_143();
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      uint64_t v5 = OUTLINED_FUNCTION_2_149();
      OUTLINED_FUNCTION_11_72(v5, v6);
      OUTLINED_FUNCTION_0_114();
    }
  }
  return OUTLINED_FUNCTION_8_86();
}

uint64_t sub_1C68DF030()
{
  return sub_1C68DF08C((void (*)(void))type metadata accessor for RunTimeDataRecord, &qword_1EA40B548, (void (*)(uint64_t))type metadata accessor for RunTimeDataRecord);
}

uint64_t sub_1C68DF08C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v8 = sub_1C68EC8E8();
  uint64_t v9 = OUTLINED_FUNCTION_3(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_19_1();
  sub_1C68E92A8();
  OUTLINED_FUNCTION_20_52();
  sub_1C68E9298();
  a1(0);
  sub_1C68DFEE0(a2, a3);
  sub_1C68E9288();
  swift_release();
  if (!v3)
  {
    sub_1C68EC8D8();
    OUTLINED_FUNCTION_9_81();
    if (v10)
    {
      OUTLINED_FUNCTION_4_103();
    }
    else
    {
      type metadata accessor for InferenceError();
      OUTLINED_FUNCTION_13_60();
      OUTLINED_FUNCTION_3_119();
      OUTLINED_FUNCTION_0_116(MEMORY[0x1E4FBC860], v14, v15);
      OUTLINED_FUNCTION_1_143();
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      uint64_t v12 = OUTLINED_FUNCTION_2_149();
      OUTLINED_FUNCTION_11_72(v12, v13);
      OUTLINED_FUNCTION_0_114();
    }
  }
  return v4;
}

uint64_t sub_1C68DF20C()
{
  uint64_t v0 = sub_1C68EC8E8();
  uint64_t v1 = OUTLINED_FUNCTION_3(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_14_61();
  OUTLINED_FUNCTION_20_52();
  sub_1C68E9298();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B550);
  sub_1C6610964();
  OUTLINED_FUNCTION_19_47();
  OUTLINED_FUNCTION_7_82();
  if (!v2)
  {
    sub_1C68EC8D8();
    OUTLINED_FUNCTION_9_81();
    if (v3)
    {
      OUTLINED_FUNCTION_4_103();
    }
    else
    {
      type metadata accessor for InferenceError();
      OUTLINED_FUNCTION_13_60();
      OUTLINED_FUNCTION_3_119();
      OUTLINED_FUNCTION_0_116(MEMORY[0x1E4FBC860], v7, v8);
      OUTLINED_FUNCTION_1_143();
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      uint64_t v5 = OUTLINED_FUNCTION_2_149();
      OUTLINED_FUNCTION_11_72(v5, v6);
      OUTLINED_FUNCTION_0_114();
    }
  }
  return OUTLINED_FUNCTION_8_86();
}

uint64_t sub_1C68DF328()
{
  return sub_1C68DF08C((void (*)(void))type metadata accessor for Contact, &qword_1EA407688, (void (*)(uint64_t))type metadata accessor for Contact);
}

uint64_t sub_1C68DF384(char a1)
{
  uint64_t v2 = sub_1C68EC8E8();
  uint64_t v3 = OUTLINED_FUNCTION_3(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_19_1();
  char v10 = a1;
  sub_1C68E92A8();
  OUTLINED_FUNCTION_20_52();
  uint64_t v4 = sub_1C68E9298();
  sub_1C68DFF28();
  sub_1C68E9288();
  OUTLINED_FUNCTION_7_82();
  if (!v4)
  {
    sub_1C68EC8D8();
    OUTLINED_FUNCTION_9_81();
    if (v5)
    {
      OUTLINED_FUNCTION_4_103();
    }
    else
    {
      type metadata accessor for InferenceError();
      OUTLINED_FUNCTION_13_60();
      OUTLINED_FUNCTION_3_119();
      OUTLINED_FUNCTION_0_116(MEMORY[0x1E4FBC860], v9, v10);
      OUTLINED_FUNCTION_1_143();
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      uint64_t v7 = OUTLINED_FUNCTION_2_149();
      OUTLINED_FUNCTION_11_72(v7, v8);
      OUTLINED_FUNCTION_0_114();
    }
  }
  return OUTLINED_FUNCTION_8_86();
}

uint64_t sub_1C68DF4C4()
{
  return sub_1C68DF08C(MEMORY[0x1E4FA2CA0], &qword_1EA40B540, MEMORY[0x1E4FA2CA0]);
}

unsigned char *sub_1C68DF520()
{
  uint64_t v2 = sub_1C68EC8E8();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  memcpy(v14, v0, sizeof(v14));
  sub_1C68E92A8();
  swift_allocObject();
  sub_1C68E9298();
  sub_1C65B55D0();
  uint64_t v5 = sub_1C68E9288();
  unint64_t v7 = v6;
  swift_release();
  if (!v1)
  {
    sub_1C68EC8D8();
    uint64_t v8 = sub_1C68EC8B8();
    if (v9)
    {
      uint64_t v4 = (unsigned char *)v8;
    }
    else
    {
      uint64_t v4 = (unsigned char *)type metadata accessor for InferenceError();
      swift_allocObject();
      uint64_t v11 = sub_1C6757C90(66, 0, 0xE000000000000000, 0xD000000000000077, 0x80000001C69210D0, 0x697274536E6F736ALL, 0xEC0000002928676ELL, 14, MEMORY[0x1E4FBC860], 2);
      sub_1C675786C(0, 0xE000000000000000);
      sub_1C68DFEE0((unint64_t *)&qword_1EBBF6340, (void (*)(uint64_t))type metadata accessor for InferenceError);
      swift_allocError();
      *uint64_t v12 = v11;
      swift_willThrow();
    }
    sub_1C65B64F8(v5, v7);
  }
  return v4;
}

BOOL sub_1C68DF74C()
{
  sub_1C68EA808();
  sub_1C68EB528();
  sub_1C68EB298();
  swift_release();
  if (v1) {
    swift_release();
  }
  return v1 != 0;
}

uint64_t sub_1C68DF7B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1C68EA968();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  unint64_t v7 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C68EB548();
  unint64_t v10 = 0xE000000000000000;
  if (v9)
  {
    uint64_t v11 = HIBYTE(v9) & 0xF;
    if ((v9 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      uint64_t v12 = sub_1C667AAC4();
      unint64_t v92 = v13;
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = 0;
  unint64_t v92 = 0xE000000000000000;
LABEL_8:
  sub_1C68DFD2C(v96);
  int v14 = v96[0];
  sub_1C68EB538();
  OUTLINED_FUNCTION_5_2();
  uint64_t v94 = v16;
  if (!v28) {
    unint64_t v10 = v15;
  }
  uint64_t result = sub_1C68EADD8();
  if (!result)
  {
    uint64_t v74 = MEMORY[0x1E4FBC860];
LABEL_54:
    unint64_t v86 = v92;
    uint64_t v87 = v94;
    *(unsigned char *)a1 = v14;
    *(void *)(a1 + 8) = v87;
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v74;
    *(void *)(a1 + 32) = v12;
    *(void *)(a1 + 40) = v86;
    return result;
  }
  int v91 = v14;
  uint64_t v89 = v12;
  uint64_t v90 = a1;
  uint64_t v97 = MEMORY[0x1E4FBC870];
  uint64_t v98 = MEMORY[0x1E4FBC870];
  uint64_t v18 = *(void *)(result + 16);
  if (v18)
  {
    unint64_t v93 = v10;
    char v21 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v19 = v4 + 16;
    char v20 = v21;
    unint64_t v22 = (*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64);
    uint64_t v88 = result;
    unint64_t v23 = result + v22;
    uint64_t v24 = *(void *)(v19 + 56);
    char v25 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v95 = v19;
    while (1)
    {
      v20(v7, v23, v2);
      uint64_t v26 = sub_1C68EA958();
      if (!v27) {
        goto LABEL_26;
      }
      BOOL v28 = v26 == 0x54746361746E6F63 && v27 == 0xEB00000000657079;
      if (v28)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v29 = sub_1C68ED7E8();
        swift_bridgeObjectRelease();
        if ((v29 & 1) == 0) {
          goto LABEL_26;
        }
      }
      uint64_t v30 = sub_1C68EA948();
      uint64_t v32 = v31;
      OUTLINED_FUNCTION_26_37();
      if (sub_1C68ECAD8()) {
        break;
      }
      OUTLINED_FUNCTION_23_40();
      if (sub_1C68ECAD8())
      {
        OUTLINED_FUNCTION_23_40();
        uint64_t v44 = sub_1C68EC9C8();
        uint64_t v45 = sub_1C68DFDFC(v44);
        MEMORY[0x1C87A3880](v45);
        uint64_t v46 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_21_34(v46, v47, v48, v49, v50, v51, v52, v53, v88, v89);
        swift_bridgeObjectRelease();
        unsigned __int8 v43 = 1;
        goto LABEL_25;
      }
      OUTLINED_FUNCTION_18_45();
      if (sub_1C68ECAD8())
      {
        OUTLINED_FUNCTION_18_45();
        uint64_t v54 = sub_1C68EC9C8();
        uint64_t v55 = sub_1C68DFDFC(v54);
        MEMORY[0x1C87A3880](v55);
        uint64_t v56 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_21_34(v56, v57, v58, v59, v60, v61, v62, v63, v88, v89);
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      BOOL v64 = v30 == 0x656E6F6870 && v32 == 0xE500000000000000;
      if (v64 || (sub_1C68ED7E8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C67FD9A4((unsigned __int8 *)v96, 2u);
        uint64_t v65 = OUTLINED_FUNCTION_10_73();
        v66(v65);
        unint64_t v93 = 0xE000000000000000;
        uint64_t v94 = 0;
      }
      else
      {
        if (v30 == 0x6C69616D65 && v32 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_44:
          swift_bridgeObjectRelease();
          sub_1C67FD9A4((unsigned __int8 *)v96, 1u);
          uint64_t v71 = OUTLINED_FUNCTION_10_73();
          v72(v71);
          unint64_t v93 = 0xE000000000000000;
          uint64_t v94 = 0;
          goto LABEL_27;
        }
        char v68 = sub_1C68ED7E8();
        swift_bridgeObjectRelease();
        if (v68) {
          goto LABEL_44;
        }
        uint64_t v69 = OUTLINED_FUNCTION_10_73();
        v70(v69);
      }
LABEL_27:
      v23 += v24;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v73 = v97;
        unint64_t v10 = v93;
        goto LABEL_47;
      }
    }
    OUTLINED_FUNCTION_26_37();
    uint64_t v33 = sub_1C68EC9C8();
    uint64_t v34 = sub_1C68DFDFC(v33);
    uint64_t v35 = MEMORY[0x1C87A3880](v34);
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    sub_1C67FB8C8((uint64_t)v96, v35, v37, v38, v39, v40, v41, v42, v88, v89);
    swift_bridgeObjectRelease();
    unsigned __int8 v43 = 2;
LABEL_25:
    sub_1C67FD9A4((unsigned __int8 *)v96, v43);
LABEL_26:
    (*v25)(v7, v2);
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  uint64_t v73 = MEMORY[0x1E4FBC870];
LABEL_47:
  sub_1C6812E94(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  sub_1C683012C();
  uint64_t v74 = v75;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v76 = sub_1C66014C8(v73);
  int v78 = v77;
  int v80 = v79;
  uint64_t result = sub_1C67E6A1C(v73);
  LOBYTE(v14) = v91;
  if (((v80 | v82) & 1) == 0)
  {
    uint64_t v12 = v89;
    a1 = v90;
    if (v78 == v81)
    {
      if (v76 == result)
      {
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        sub_1C67E6CE0(v76, v78, v73, v96);
        unint64_t v83 = v10;
        unsigned __int8 v84 = v96[0];
        uint64_t v85 = *(void *)(v73 + 16);
        uint64_t result = swift_bridgeObjectRelease();
        if (v85 == 1) {
          LOBYTE(v14) = v84;
        }
        unint64_t v10 = v83;
      }
      goto LABEL_54;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68DFD2C@<X0>(char *a1@<X8>)
{
  sub_1C68EA808();
  sub_1C68EB3C8();
  swift_retain();
  sub_1C68EB298();
  swift_release();
  swift_release();
  if (v4)
  {
    uint64_t result = swift_release();
    char v3 = 2;
  }
  else
  {
    sub_1C68EB3D8();
    swift_retain();
    sub_1C68EB298();
    swift_release_n();
    uint64_t result = swift_release();
    char v3 = 0;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_1C68DFDFC(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C68EC9E8();
    uint64_t v1 = sub_1C68ECB18();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

void *sub_1C68DFEBC@<X0>(void *a1@<X8>)
{
  return UsoEntity_common_Person.toContactQuery()(a1);
}

uint64_t sub_1C68DFEE0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C68DFF28()
{
  unint64_t result = qword_1EA40B598;
  if (!qword_1EA40B598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B598);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_116@<X0>(uint64_t a1@<X8>, uint64_t a2, char a3)
{
  return sub_1C6757C90(66, 0, 0xE000000000000000, 0xD000000000000077, (v3 - 32) | 0x8000000000000000, 0x697274536E6F736ALL, 0xEC0000002928676ELL, 14, a1, a3);
}

uint64_t OUTLINED_FUNCTION_1_143()
{
  return sub_1C675786C(0, 0xE000000000000000);
}

uint64_t OUTLINED_FUNCTION_2_149()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_4_103()
{
  return sub_1C65B64F8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_82()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8_86()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_81()
{
  return sub_1C68EC8B8();
}

uint64_t OUTLINED_FUNCTION_10_73()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_72(uint64_t a1, void *a2)
{
  *a2 = v2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_13_60()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14_61()
{
  *(void *)(v1 - 40) = v0;
  return sub_1C68E92A8();
}

uint64_t OUTLINED_FUNCTION_18_45()
{
  return 0x7373657264646120;
}

uint64_t OUTLINED_FUNCTION_19_47()
{
  return sub_1C68E9288();
}

uint64_t OUTLINED_FUNCTION_20_52()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_21_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1C67FB8C8(v12 - 112, v10, v11, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t OUTLINED_FUNCTION_22_36(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_23_40()
{
  return 0x6C69616D6520;
}

uint64_t UsoEntity_common_RecurringDateTime.toDateTime()()
{
  uint64_t v0 = sub_1C68EB718();
  uint64_t v25 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v24 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B5A0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68E063C();
  uint64_t v26 = v6;
  uint64_t v7 = sub_1C68EB6C8();
  if (v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = MEMORY[0x1E4FBC860];
  }
  uint64_t v28 = MEMORY[0x1E4FBC860];
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1C68ED528();
    uint64_t v9 = result;
    if (result) {
      goto LABEL_6;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_19;
  }
LABEL_6:
  if (v9 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v23 = v5;
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v8 & 0xC000000000000001) != 0) {
      MEMORY[0x1C87A4300](i, v8);
    }
    else {
      swift_retain();
    }
    sub_1C68EAC88();
    if (v27)
    {
      UsoEntity_common_DateTime.toDateTime(recurrencePattern:)(0);
      swift_release();
      uint64_t v12 = swift_release();
      MEMORY[0x1C87A3B00](v12);
      if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C68ECC28();
      }
      sub_1C68ECC58();
      sub_1C68ECC18();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = v23;
LABEL_20:
  swift_bridgeObjectRelease();
  if (sub_1C68EB6D8())
  {
    uint64_t v13 = UsoEntity_common_DateTimeRange.toDateTimeRange()();
    swift_release();
  }
  else
  {
    uint64_t v13 = 0;
  }
  sub_1C6689150();
  uint64_t v15 = v14;
  if (sub_1C68EB6F8())
  {
    uint64_t v16 = UsoEntity_common_DateTime.toDateTime(recurrencePattern:)(0);
    swift_release();
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (sub_1C68EB6E8())
  {
    uint64_t v17 = UsoEntity_common_DateTime.toDateTime(recurrencePattern:)(0);
    swift_release();
  }
  else
  {
    uint64_t v17 = 0;
  }
  sub_1C68EB708();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v0) == 1)
  {
    sub_1C65EA728((uint64_t)v4, &qword_1EA40B5A0);
    char v18 = 3;
  }
  else
  {
    uint64_t v19 = v24;
    uint64_t v20 = v25;
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v24, v4, v0);
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v19, v0);
    if (v21 == *MEMORY[0x1E4FA3710])
    {
      char v18 = 2;
    }
    else if (v21 == *MEMORY[0x1E4FA3700])
    {
      char v18 = 0;
    }
    else if (v21 == *MEMORY[0x1E4FA3708])
    {
      char v18 = 1;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v0);
      char v18 = 3;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v0);
  }
  LOBYTE(v28) = v18;
  type metadata accessor for DateTime.RecurrencePattern();
  swift_allocObject();
  uint64_t v22 = DateTime.RecurrencePattern.init(withRecurrenceDateTimeRange:recurrencePeriod:totalNumberOfOccurrences:recurrenceDateTimes:fromDateTime:toDateTime:definedValue:)(v13, v26, 0, 1, v15, v16, v17, (char *)&v28);
  LOBYTE(v28) = 1;
  LOBYTE(v27) = 4;
  type metadata accessor for DateTime();
  swift_allocObject();
  return DateTime.init(withDate:time:definedValue:recurrencePattern:temporalIntent:occurringIn:)(0, 0, (char *)&v28, v22, (char *)&v27, v5);
}

uint64_t sub_1C68E063C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4D8);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C68EB4C8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B4D0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1C68EB728())
  {
    unint64_t v10 = UsoEntity_common_Duration.toInterval(offsetDirection:)(0);
    swift_release();
    if (v10)
    {
      type metadata accessor for DateTime.DateTimeRange();
      swift_allocObject();
      uint64_t v11 = DateTime.DateTimeRange.init(withInterval:)(v10);
      swift_retain();
      return v11;
    }
  }
  uint64_t v12 = sub_1C68EB6C8();
  if (!v12) {
    return 0;
  }
  unint64_t v13 = v12;
  uint64_t v37 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B5A8);
  uint64_t v14 = *(void *)(v4 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1C690EA80;
  unint64_t v17 = v16 + v15;
  char v18 = *(void (**)(unint64_t, void, uint64_t))(v4 + 104);
  v18(v17, *MEMORY[0x1E4FA3460], v3);
  v18(v17 + v14, *MEMORY[0x1E4FA3468], v3);
  v18(v17 + 2 * v14, *MEMORY[0x1E4FA34A8], v3);
  v18(v17 + 3 * v14, *MEMORY[0x1E4FA34B8], v3);
  v18(v17 + 4 * v14, *MEMORY[0x1E4FA3428], v3);
  v18(v17 + 5 * v14, *MEMORY[0x1E4FA34A0], v3);
  v18(v17 + 6 * v14, *MEMORY[0x1E4FA3498], v3);
  v18(v17 + 7 * v14, *MEMORY[0x1E4FA3470], v3);
  v18(v17 + 8 * v14, *MEMORY[0x1E4FA34C8], v3);
  v18(v17 + 9 * v14, *MEMORY[0x1E4FA34D8], v3);
  v18(v17 + 10 * v14, *MEMORY[0x1E4FA34D0], v3);
  v18(v17 + 11 * v14, *MEMORY[0x1E4FA34E0], v3);
  v18(v17 + 12 * v14, *MEMORY[0x1E4FA3430], v3);
  v18(v17 + 13 * v14, *MEMORY[0x1E4FA3450], v3);
  v18(v17 + 14 * v14, *MEMORY[0x1E4FA3458], v3);
  sub_1C67FB6FC();
  uint64_t v20 = v19;
  unint64_t v21 = v13 >> 62;
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C68ED528();
  }
  else
  {
    uint64_t v22 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v38 = v20;
  if (!v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  sub_1C66749C8(0, (v13 & 0xC000000000000001) == 0, v13);
  if ((v13 & 0xC000000000000001) != 0) {
    MEMORY[0x1C87A4300](0, v13);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_1C68EAC88();
  swift_release();
  if (!v40) {
    goto LABEL_16;
  }
  swift_retain();
  uint64_t v23 = sub_1C68EB1B8();
  swift_release();
  if (!v23 || (swift_release(), swift_retain(), uint64_t v24 = sub_1C68EB208(), swift_release(), swift_release(), v24))
  {
LABEL_16:
    BOOL v26 = 0;
    if (v21) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v27 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_18;
  }
  swift_retain();
  sub_1C68EB1D8();
  swift_release();
  uint64_t v25 = sub_1C68EB1E8();
  BOOL v26 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v25) == 1;
  sub_1C65EA728((uint64_t)v9, &qword_1EA40B4D0);
  if (!v21) {
    goto LABEL_17;
  }
LABEL_14:
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_1C68ED528();
  swift_bridgeObjectRelease();
LABEL_18:
  if (v27 != 1 || !v26 || !v22)
  {
    swift_bridgeObjectRelease();
LABEL_28:
    swift_bridgeObjectRelease();
LABEL_29:
    swift_release();
    return 0;
  }
  sub_1C66749C8(0, (v13 & 0xC000000000000001) == 0, v13);
  if ((v13 & 0xC000000000000001) != 0) {
    MEMORY[0x1C87A4300](0, v13);
  }
  else {
    swift_retain();
  }
  uint64_t v28 = (uint64_t)v37;
  swift_bridgeObjectRelease();
  sub_1C68EAC88();
  swift_release();
  if (!v40) {
    goto LABEL_28;
  }
  uint64_t v29 = sub_1C68EB1B8();
  swift_release();
  if (!v29) {
    goto LABEL_28;
  }
  sub_1C68EB4B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_1C65EA728((uint64_t)v2, &qword_1EA40B4D8);
    return 0;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v28, v2, v3);
  char v31 = sub_1C65CDC74(v28, v38);
  swift_bridgeObjectRelease();
  if ((v31 & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v32 = sub_1C68EB508();
  swift_release();
  if (v32
    || (uint64_t v33 = sub_1C68EB4D8(), swift_release(), v33)
    || (uint64_t v34 = sub_1C68EB4E8(), swift_release(), v34)
    || (uint64_t v35 = sub_1C68EB4F8(), swift_release(), v35))
  {
LABEL_38:
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v28, v3);
    swift_release();
    goto LABEL_29;
  }
  sub_1C68DCFA4((char *)&v40);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v28, v3);
  char v36 = v40;
  if (v40 == 38) {
    char v36 = 8;
  }
  LOBYTE(v40) = v36;
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  uint64_t v11 = DateTime.DateTimeRange.init(withDefinedValue:)(&v40);
  LOBYTE(v40) = 1;
  char v39 = 20;
  type metadata accessor for DateTime.Interval();
  swift_allocObject();
  DateTime.Interval.init(withQuantity:timeUnit:qualifier:)(0x3FF0000000000000, 0, (char *)&v40, &v39);
  return v11;
}

uint64_t UsoEntity_common_RecurringDateTime.toRecurrencePattern()()
{
  uint64_t v0 = *(void *)(UsoEntity_common_RecurringDateTime.toDateTime()() + 40);
  swift_retain();
  swift_release();
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_117()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_144()
{
  return swift_allocObject();
}

uint64_t _s12SiriOntology32UsoEntity_common_Time12HourClockC0A9InferenceE02toaI4TimeAD04DateK0C0K0CSgyF_0()
{
  if (sub_1C68EB588())
  {
    uint64_t v0 = sub_1C65EF9B0();
    char v2 = v1;
    swift_release();
    char v3 = v2 & 1;
  }
  else
  {
    uint64_t v0 = 0;
    char v3 = 1;
  }
  if (sub_1C68EB598())
  {
    uint64_t v4 = sub_1C65EF9B0();
    char v6 = v5;
    swift_release();
    char v7 = v6 & 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v7 = 1;
  }
  if (sub_1C68EB5A8())
  {
    uint64_t v8 = sub_1C65EF9B0();
    char v10 = v9;
    swift_release();
    char v11 = v10 & 1;
  }
  else
  {
    uint64_t v8 = 0;
    char v11 = 1;
  }
  if (sub_1C68EB5B8())
  {
    sub_1C68DE2C4(&v17);
    swift_release();
    char v12 = v17;
  }
  else
  {
    char v12 = 2;
  }
  char v16 = v12;
  char v15 = 3;
  if (sub_1C68EB578())
  {
    uint64_t v13 = UsoEntity_common_DateTimeRange.toDateTimeRange()();
    swift_release();
  }
  else
  {
    uint64_t v13 = 0;
  }
  type metadata accessor for DateTime.Time();
  swift_allocObject();
  return DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(v0, v3, v4, v7, v8, v11, &v16, &v15, v13, 1);
}

uint64_t _s12SiriOntology32UsoEntity_common_Time24HourClockC0A9InferenceE02toaI4TimeAD04DateK0C0K0CSgyF_0()
{
  if (sub_1C68EB5E8())
  {
    uint64_t v0 = sub_1C65EF9B0();
    char v2 = v1;
    swift_release();
    if (v2) {
      char v3 = 2;
    }
    else {
      char v3 = v0 > 11;
    }
    char v4 = (v2 & 1) != 0;
  }
  else
  {
    uint64_t v0 = 0;
    char v4 = 1;
    char v3 = 2;
  }
  if (sub_1C68EB5F8())
  {
    uint64_t v5 = sub_1C65EF9B0();
    char v7 = v6;
    swift_release();
    char v8 = v7 & 1;
  }
  else
  {
    uint64_t v5 = 0;
    char v8 = 1;
  }
  if (sub_1C68EB608())
  {
    uint64_t v9 = sub_1C65EF9B0();
    char v11 = v10;
    swift_release();
    char v12 = v11 & 1;
  }
  else
  {
    uint64_t v9 = 0;
    char v12 = 1;
  }
  char v16 = v3;
  char v15 = 3;
  if (sub_1C68EB5D8())
  {
    uint64_t v13 = UsoEntity_common_DateTimeRange.toDateTimeRange()();
    swift_release();
  }
  else
  {
    uint64_t v13 = 0;
  }
  type metadata accessor for DateTime.Time();
  swift_allocObject();
  return DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(v0, v4, v5, v8, v9, v12, &v16, &v15, v13, 1);
}

uint64_t sub_1C68E11B8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B5B8);
  MEMORY[0x1F4188790](v2 - 8);
  char v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C68EB288();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  char v11 = (char *)&v15 - v10;
  sub_1C68EB278();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_1C68E14E8((uint64_t)v4);
    char v13 = 13;
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v11, v4, v5);
    v14(v9, v11, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (result == *MEMORY[0x1E4FA3168])
    {
      char v13 = 9;
    }
    else if (result == *MEMORY[0x1E4FA3158])
    {
      char v13 = 3;
    }
    else if (result == *MEMORY[0x1E4FA3190])
    {
      char v13 = 12;
    }
    else
    {
      if (result == *MEMORY[0x1E4FA31B8])
      {
        *a1 = 0;
        return result;
      }
      if (result == *MEMORY[0x1E4FA31B0])
      {
        char v13 = 10;
      }
      else if (result == *MEMORY[0x1E4FA3170])
      {
        char v13 = 8;
      }
      else if (result == *MEMORY[0x1E4FA31A8])
      {
        char v13 = 6;
      }
      else if (result == *MEMORY[0x1E4FA3178])
      {
        char v13 = 1;
      }
      else if (result == *MEMORY[0x1E4FA3180])
      {
        char v13 = 4;
      }
      else if (result == *MEMORY[0x1E4FA3160])
      {
        char v13 = 5;
      }
      else if (result == *MEMORY[0x1E4FA3198])
      {
        char v13 = 7;
      }
      else if (result == *MEMORY[0x1E4FA31A0])
      {
        char v13 = 2;
      }
      else
      {
        if (result != *MEMORY[0x1E4FA3188])
        {
          *a1 = 13;
          return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        }
        char v13 = 11;
      }
    }
  }
  *a1 = v13;
  return result;
}

uint64_t sub_1C68E14E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B5B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68E1548@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C663EBC4, a3);
}

uint64_t sub_1C68E1574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_15_55(a1, a2, a3);
  OUTLINED_FUNCTION_0_50();
  uint64_t v37 = v4;
  uint64_t v38 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_19_1();
  uint64_t v5 = OUTLINED_FUNCTION_18_12();
  OUTLINED_FUNCTION_5_100();
  OUTLINED_FUNCTION_4_104(v6);
  sub_1C68EC938();
  swift_bridgeObjectRelease();
  uint64_t v7 = os_transaction_create();
  swift_release();
  uint64_t v36 = v5;
  *(void *)(v5 + 16) = v7;
  uint64_t v8 = (uint64_t *)(v5 + 16);
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C68EC478();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBBF7AF0);
  uint64_t v10 = (void *)sub_1C68EC458();
  os_log_type_t v11 = sub_1C68ECE48();
  if (OUTLINED_FUNCTION_25_31(v11))
  {
    OUTLINED_FUNCTION_30();
    uint64_t v44 = OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_2_150(4.8149e-34);
    uint64_t v39 = *v8;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v12 = sub_1C68EC8F8();
    sub_1C65B4078(v12, v13, (uint64_t)&v44, v14, v15, v16, v17, v18, v33, (unint64_t)v34, (uint64_t)v35, v36, v37, v38, v39, v40, v41, v42, v43,
      v44);
    OUTLINED_FUNCTION_6_94(v19);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_50(&dword_1C65AE000, v20, v21, "opening transaction %s");
    OUTLINED_FUNCTION_52_3();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }

  if (qword_1EBBF68D0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_1EBBF7B08;
  sub_1C68EC438();
  sub_1C68ECF98();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1C68F0550;
  sub_1C68ED3B8();
  *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v24 = sub_1C66246B0();
  OUTLINED_FUNCTION_3_120(v24);
  sub_1C68EC418();
  swift_bridgeObjectRelease();
  id v25 = v34;
  sub_1C6641AD8();

  sub_1C65ED460();
  sub_1C68EC748();
  BOOL v26 = (void *)OUTLINED_FUNCTION_13_61();
  sub_1C679A468(v26, v27, v28, v29);
  swift_bridgeObjectRelease();
  sub_1C66416F4(v35, v35 != 0);
  sub_1C68ECF88();
  sub_1C68EC428();
  uint64_t v30 = OUTLINED_FUNCTION_8_87();
  v31(v30);

  sub_1C68E24C0(v36);
  return swift_release();
}

uint64_t sub_1C68E18F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_15_55(a1, a2, a3);
  OUTLINED_FUNCTION_0_50();
  uint64_t v37 = v4;
  uint64_t v38 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_19_1();
  uint64_t v5 = OUTLINED_FUNCTION_18_12();
  OUTLINED_FUNCTION_5_100();
  OUTLINED_FUNCTION_4_104(v6);
  sub_1C68EC938();
  swift_bridgeObjectRelease();
  uint64_t v7 = os_transaction_create();
  swift_release();
  uint64_t v36 = v5;
  *(void *)(v5 + 16) = v7;
  uint64_t v8 = (uint64_t *)(v5 + 16);
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C68EC478();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBBF7AF0);
  uint64_t v10 = (void *)sub_1C68EC458();
  os_log_type_t v11 = sub_1C68ECE48();
  if (OUTLINED_FUNCTION_25_31(v11))
  {
    OUTLINED_FUNCTION_30();
    uint64_t v44 = OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_2_150(4.8149e-34);
    uint64_t v39 = *v8;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v12 = sub_1C68EC8F8();
    sub_1C65B4078(v12, v13, (uint64_t)&v44, v14, v15, v16, v17, v18, v33, (unint64_t)v34, (uint64_t)v35, v36, v37, v38, v39, v40, v41, v42, v43,
      v44);
    OUTLINED_FUNCTION_6_94(v19);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_50(&dword_1C65AE000, v20, v21, "opening transaction %s");
    OUTLINED_FUNCTION_52_3();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }

  if (qword_1EBBF68D0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_1EBBF7B08;
  sub_1C68EC438();
  sub_1C68ECF98();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6640);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1C68F0550;
  sub_1C68ED3B8();
  *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v24 = sub_1C66246B0();
  OUTLINED_FUNCTION_3_120(v24);
  sub_1C68EC418();
  swift_bridgeObjectRelease();
  id v25 = v34;
  sub_1C6645434();

  sub_1C65ED460();
  sub_1C68EC748();
  BOOL v26 = (void *)OUTLINED_FUNCTION_13_61();
  sub_1C679AB98(v26, v27, v28, v29);
  swift_bridgeObjectRelease();
  sub_1C66416F4(v35, v35 != 0);
  sub_1C68ECF88();
  sub_1C68EC428();
  uint64_t v30 = OUTLINED_FUNCTION_8_87();
  v31(v30);

  sub_1C68E24C0(v36);
  return swift_release();
}

uint64_t sub_1C68E1C74@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C6733AAC, a3);
}

uint64_t sub_1C68E1CA0@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v7 = OUTLINED_FUNCTION_18_12();
  OUTLINED_FUNCTION_5_100();
  OUTLINED_FUNCTION_17_57();
  sub_1C68ECA18();
  sub_1C68EC938();
  swift_bridgeObjectRelease();
  uint64_t v8 = os_transaction_create();
  swift_release();
  *(void *)(v7 + 16) = v8;
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C68EC478();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBBF7AF0);
  uint64_t v10 = sub_1C68EC458();
  os_log_type_t v11 = sub_1C68ECE48();
  if (OUTLINED_FUNCTION_25_31(v11))
  {
    uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_30();
    v28[0] = OUTLINED_FUNCTION_39();
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_beginAccess();
    uint64_t v23 = *(void *)(v7 + 16);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v13 = sub_1C68EC8F8();
    sub_1C65B4078(v13, v14, (uint64_t)v28, v15, v16, v17, v18, v19, v21, a2, v3, a3, v23, v24, v25, v26, v27, v28[0], v28[1],
      v28[2]);
    OUTLINED_FUNCTION_25_25();
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v10, v4, "opening transaction %s", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }

  sub_1C674E88C(a1);
  sub_1C68E24C0(v7);
  swift_release();
  return swift_release();
}

uint64_t sub_1C68E1ED4@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C67F3314, a3);
}

uint64_t sub_1C68E1F00@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C681EF84, a3);
}

uint64_t sub_1C68E1F2C@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C68261B8, a3);
}

uint64_t sub_1C68E1F58@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C6826DD8, a3);
}

uint64_t sub_1C68E1F84@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C682792C, a3);
}

uint64_t sub_1C68E1FB0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1C68E1FDC(a1, a2, (void (*)(void *, uint64_t))sub_1C68287A4, a3);
}

uint64_t sub_1C68E1FDC@<X0>(void *a1@<X2>, uint64_t a2@<X3>, void (*a3)(void *, uint64_t)@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8 = OUTLINED_FUNCTION_18_12();
  OUTLINED_FUNCTION_5_100();
  OUTLINED_FUNCTION_17_57();
  sub_1C68ECA18();
  sub_1C68EC938();
  swift_bridgeObjectRelease();
  uint64_t v9 = os_transaction_create();
  swift_release();
  *(void *)(v8 + 16) = v9;
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C68EC478();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBBF7AF0);
  os_log_type_t v11 = sub_1C68EC458();
  os_log_type_t v12 = sub_1C68ECE48();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v23 = (uint64_t)a3;
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_30();
    v31[0] = OUTLINED_FUNCTION_39();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_beginAccess();
    uint64_t v26 = *(void *)(v8 + 16);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v14 = sub_1C68EC8F8();
    sub_1C65B4078(v14, v15, (uint64_t)v31, v16, v17, v18, v19, v20, a2, v4, v23, a4, v26, v27, v28, v29, v30, v31[0], v31[1],
      v31[2]);
    OUTLINED_FUNCTION_25_25();
    a2 = v22;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v11, v12, "opening transaction %s", v13, 0xCu);
    OUTLINED_FUNCTION_52_3();
    OUTLINED_FUNCTION_0();
    a3 = v24;
    OUTLINED_FUNCTION_0();
  }

  a3(a1, a2);
  sub_1C68E24C0(v8);

  return swift_release();
}

uint64_t sub_1C68E2218@<X0>(unint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, void *a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v10 = OUTLINED_FUNCTION_18_12();
  OUTLINED_FUNCTION_5_100();
  uint64_t v32 = v11;
  sub_1C68ECA18();
  sub_1C68EC938();
  swift_bridgeObjectRelease();
  uint64_t v12 = os_transaction_create();
  swift_release();
  *(void *)(v10 + 16) = v12;
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C68EC478();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBBF7AF0);
  uint64_t v14 = sub_1C68EC458();
  os_log_type_t v15 = sub_1C68ECE48();
  if (os_log_type_enabled(v14, v15))
  {
    HIDWORD(v28) = a3;
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_30();
    uint64_t v35 = OUTLINED_FUNCTION_39();
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_beginAccess();
    uint64_t v31 = *(void *)(v10 + 16);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v17 = sub_1C68EC8F8();
    sub_1C65B4078(v17, v18, (uint64_t)&v35, v19, v20, v21, v22, v23, v25, a1, a2, v28, v5, a5, v31, v32, 0x80000001C6916730, v33, v34,
      v35);
    a1 = v26;
    a2 = v27;
    sub_1C68ED0C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v14, v15, "opening transaction %s", v16, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    a3 = v29;
    OUTLINED_FUNCTION_0();
  }

  sub_1C684321C(a1, a2, a3, a4);
  sub_1C68E24C0(v10);

  return swift_release();
}

uint64_t sub_1C68E2488()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C68E24C0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(a1 + 16) = 0;
  swift_unknownObjectRelease();
  if (qword_1EBBF68C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C68EC478();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBBF7AF0);
  swift_retain_n();
  uint64_t v3 = sub_1C68EC458();
  os_log_type_t v4 = sub_1C68ECE48();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v18[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_beginAccess();
    uint64_t v14 = *(void *)(a1 + 16);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF43A8);
    uint64_t v7 = sub_1C68EC8F8();
    sub_1C65B4078(v7, v8, (uint64_t)v18, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18[0], v18[1], v18[2], v18[3], v18[4], v18[5], v18[6],
      v18[7]);
    sub_1C68ED0C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C65AE000, v3, v4, "closing transaction %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87A54F0](v6, -1, -1);
    MEMORY[0x1C87A54F0](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t OUTLINED_FUNCTION_2_150(float a1)
{
  *char v1 = a1;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_120(uint64_t result)
{
  v1[8] = result;
  v1[4] = v2;
  v1[5] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_104@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 96) = (v1 - 32) | 0x8000000000000000;
  return sub_1C68ECA18();
}

uint64_t OUTLINED_FUNCTION_6_94(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_1C68ED0C8();
}

uint64_t OUTLINED_FUNCTION_8_87()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_61()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_55(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 - 152) = a3;
  *(void *)(v4 - 144) = v3;
  return sub_1C68EC448();
}

void OUTLINED_FUNCTION_16_50(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

_UNKNOWN **sub_1C68E27EC()
{
  return &off_1F21863E8;
}

_UNKNOWN **sub_1C68E27F8()
{
  return &off_1F2186400;
}

_UNKNOWN **sub_1C68E2804()
{
  return &off_1F2186408;
}

_UNKNOWN **sub_1C68E2810()
{
  return &off_1F2186430;
}

uint64_t sub_1C68E281C(uint64_t a1)
{
  unint64_t v2 = sub_1C68E29A4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C68E2858(uint64_t a1)
{
  unint64_t v2 = sub_1C68E29A4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Empty.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B5C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C68E29A4();
  sub_1C68EDA08();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1C68E29A4()
{
  unint64_t result = qword_1EA40B5C8;
  if (!qword_1EA40B5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B5C8);
  }
  return result;
}

uint64_t Empty.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1C68E2A18(uint64_t a1)
{
  return Empty.init(from:)(a1);
}

uint64_t sub_1C68E2A30(void *a1)
{
  return Empty.encode(to:)(a1);
}

uint64_t sub_1C68E2A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return MEMORY[0x1F4186538](a3, a2, AssociatedTypeWitness, &protocol requirements base descriptor for ValueResolver, &associated conformance descriptor for ValueResolver.ValueResolver.Output: Decodable);
}

uint64_t sub_1C68E2AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return MEMORY[0x1F4186538](a3, a2, AssociatedTypeWitness, &protocol requirements base descriptor for ValueResolver, &associated conformance descriptor for ValueResolver.ValueResolver.Output: Encodable);
}

uint64_t dispatch thunk of static ValueResolver.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of SingleValueResolver.findMatches(value:context:spec:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of SingleValueResolver.makeRecommendation(value:context:spec:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of MultiValueResolver.findMatches(values:context:spec:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of MultiValueResolver.makeRecommendations(values:context:spec:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

ValueMetadata *type metadata accessor for Empty()
{
  return &type metadata for Empty;
}

ValueMetadata *type metadata accessor for Empty.CodingKeys()
{
  return &type metadata for Empty.CodingKeys;
}

unint64_t sub_1C68E2C10()
{
  unint64_t result = qword_1EA40B5D0;
  if (!qword_1EA40B5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B5D0);
  }
  return result;
}

unint64_t sub_1C68E2C60()
{
  unint64_t result = qword_1EA40B5D8;
  if (!qword_1EA40B5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B5D8);
  }
  return result;
}

uint64_t sub_1C68E2CAC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA405F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 2;
  char v17 = 5;
  type metadata accessor for DateTime.Date();
  swift_allocObject();
  DateTime.Date.init(withDayOfWeek:)(&v17);
  char v17 = 0;
  type metadata accessor for DateTime.Time();
  swift_allocObject();
  OUTLINED_FUNCTION_0_59();
  DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(0, 0, 0, 0, 0, 0, v1, v2, v13, v15);
  type metadata accessor for DateTime();
  swift_allocObject();
  uint64_t v3 = OUTLINED_FUNCTION_2_55();
  DateTime.init(withDate:time:)(v3, v4);
  char v17 = 6;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = DateTime.Date.init(withDayOfWeek:)(&v17);
  char v17 = 1;
  swift_allocObject();
  OUTLINED_FUNCTION_0_59();
  DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(11, 0, 59, 0, 59, 0, v7, v8, v14, v16);
  OUTLINED_FUNCTION_0_15();
  uint64_t v9 = DateTime.init(withDate:time:)(v6, v5);
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  uint64_t v10 = OUTLINED_FUNCTION_2_55();
  DateTime.DateTimeRange.init(withStartDateTime:endDateTime:)(v10, v11);
  OUTLINED_FUNCTION_0_15();
  *(void *)(inited + 56) = DateTime.init(occurringIn:)(v9);
  sub_1C661C0B4();
  return sub_1C68EC748();
}

uint64_t sub_1C68E2E84()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA405F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0C10;
  *(_OWORD *)(inited + 32) = xmmword_1C68F0C20;
  *(unsigned char *)(inited + 48) = 0;
  type metadata accessor for DateTime.Date();
  swift_allocObject();
  DateTime.Date.init(withDay:month:)(1, 6);
  type metadata accessor for DateTime();
  swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_1_14();
  swift_allocObject();
  DateTime.Date.init(withDay:month:)(31, 8);
  OUTLINED_FUNCTION_0_15();
  uint64_t v2 = OUTLINED_FUNCTION_1_14();
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  DateTime.DateTimeRange.init(withStartDateTime:endDateTime:)(v1, v2);
  OUTLINED_FUNCTION_0_15();
  *(void *)(inited + 56) = OUTLINED_FUNCTION_6_6();
  *(_OWORD *)(inited + 64) = xmmword_1C68F0C30;
  *(unsigned char *)(inited + 80) = 1;
  char v15 = 2;
  type metadata accessor for DateTime.Date.Holiday();
  swift_allocObject();
  DateTime.Date.Holiday.init(with:name:calendarSystem:)(0x736C6F73656E756ALL, 0xEC00000065636974, 0x6C6F5320656E754ALL, 0xED00006563697473, &v15);
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_0_15();
  uint64_t v3 = OUTLINED_FUNCTION_1_14();
  uint64_t v4 = OUTLINED_FUNCTION_3_107();
  OUTLINED_FUNCTION_5_9(0x80000001C6911F60, (uint64_t)"September Equinox", v9, *(int *)v11, *(__int16 *)&v11[4], v11[6], v15);
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_7_5();
  DateTime.DateTimeRange.init(withStartDateTime:endDateTime:)(v3, v4);
  OUTLINED_FUNCTION_0_15();
  uint64_t v5 = OUTLINED_FUNCTION_6_6();
  *(void *)(inited + 96) = 0;
  *(void *)(inited + 104) = 0;
  *(void *)(inited + 88) = v5;
  *(unsigned char *)(inited + 112) = 1;
  OUTLINED_FUNCTION_3_107();
  OUTLINED_FUNCTION_5_9(0x80000001C6911F80, (uint64_t)"December Solstice", v10, v12, v13, v14, v15);
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_0_15();
  uint64_t v6 = OUTLINED_FUNCTION_1_14();
  uint64_t v7 = OUTLINED_FUNCTION_3_107();
  DateTime.Date.Holiday.init(with:name:calendarSystem:)(0x757165686372616DLL, 0xEC000000786F6E69, 0x714520686372614DLL, 0xED0000786F6E6975, &v15);
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_7_5();
  DateTime.DateTimeRange.init(withStartDateTime:endDateTime:)(v6, v7);
  OUTLINED_FUNCTION_0_15();
  *(void *)(inited + 120) = OUTLINED_FUNCTION_6_6();
  sub_1C661C0B4();
  return sub_1C68EC748();
}

uint64_t sub_1C68E3178()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA405F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 2;
  __int16 v2 = 0;
  type metadata accessor for DateTime();
  swift_allocObject();
  *(void *)(inited + 56) = DateTime.init(withStartHour:startMinute:startSecond:startMeridiem:endHour:endMinute:endSecond:endMeridiem:)(0, 0, 0, (char *)&v2 + 1, 3, 0, 0, (char *)&v2);
  sub_1C661C0B4();
  return sub_1C68EC748();
}

uint64_t sub_1C68E3238()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA405F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0550;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 2;
  char v17 = 0;
  type metadata accessor for DateTime.Date();
  swift_allocObject();
  DateTime.Date.init(withDayOfWeek:)(&v17);
  char v17 = 0;
  type metadata accessor for DateTime.Time();
  swift_allocObject();
  OUTLINED_FUNCTION_0_59();
  DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(0, 0, 0, 0, 0, 0, v1, v2, v13, v15);
  type metadata accessor for DateTime();
  swift_allocObject();
  uint64_t v3 = OUTLINED_FUNCTION_2_55();
  DateTime.init(withDate:time:)(v3, v4);
  char v17 = 4;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = DateTime.Date.init(withDayOfWeek:)(&v17);
  char v17 = 1;
  swift_allocObject();
  OUTLINED_FUNCTION_0_59();
  DateTime.Time.init(withHour:minute:second:meridiem:definedValue:occurringIn:setByUser:)(11, 0, 59, 0, 59, 0, v7, v8, v14, v16);
  OUTLINED_FUNCTION_0_15();
  uint64_t v9 = DateTime.init(withDate:time:)(v6, v5);
  type metadata accessor for DateTime.DateTimeRange();
  swift_allocObject();
  uint64_t v10 = OUTLINED_FUNCTION_2_55();
  DateTime.DateTimeRange.init(withStartDateTime:endDateTime:)(v10, v11);
  OUTLINED_FUNCTION_0_15();
  *(void *)(inited + 56) = DateTime.init(occurringIn:)(v9);
  sub_1C661C0B4();
  return sub_1C68EC748();
}

dispatch_semaphore_t sub_1C68E340C()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  qword_1EBBF6520 = (uint64_t)result;
  return result;
}

void sub_1C68E3430()
{
  qword_1EBBF6518 = MEMORY[0x1E4FBC870];
}

uint64_t static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C68ECA18();
  swift_bridgeObjectRelease();
  sub_1C68E351C();
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1C68E351C()
{
  long long v1 = v0[1];
  long long v49 = *v0;
  long long v50 = v1;
  uint64_t v51 = (void (*)(_xpc_activity_s *))*((void *)v0 + 4);
  if (qword_1EBBF6730 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EBBF6520;
  sub_1C68ECFB8();

  if (qword_1EBBF6728 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EBBF6518;
  long long v4 = v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C65CDAC4(v49, *((uint64_t *)&v49 + 1), v3);
  char v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1C68EC478();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EBBF7AF0);
    sub_1C68E5958((uint64_t)&v49);
    uint64_t v8 = sub_1C68EC458();
    os_log_type_t v9 = sub_1C68ECE48();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(void *)&long long aBlock = v11;
      *(_DWORD *)uint64_t v10 = 136446210;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v4, *((uint64_t *)&v4 + 1), (uint64_t)&aBlock, v12, v13, v14, v15, v16, v41, v43, aBlock, *((uint64_t *)&aBlock + 1), v46, *((uint64_t *)&v46 + 1), (uint64_t)v47, v48, v49, *((uint64_t *)&v49 + 1), v50,
        *((uint64_t *)&v50 + 1));
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68E5990((uint64_t)&v49);
      _os_log_impl(&dword_1C65AE000, v8, v9, "XPC activity is already registered. id=%{public}s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v11, -1, -1);
      MEMORY[0x1C87A54F0](v10, -1, -1);
    }
    else
    {
      sub_1C68E5990((uint64_t)&v49);
    }
  }
  else
  {
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C68EC478();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBBF7AF0);
    sub_1C68E5958((uint64_t)&v49);
    sub_1C68E5958((uint64_t)&v49);
    sub_1C68E5958((uint64_t)&v49);
    sub_1C68E5958((uint64_t)&v49);
    sub_1C68E5958((uint64_t)&v49);
    sub_1C68E5958((uint64_t)&v49);
    uint64_t v18 = sub_1C68EC458();
    os_log_type_t v19 = sub_1C68ECE48();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(void *)&long long aBlock = v21;
      *(_DWORD *)uint64_t v20 = 136315906;
      swift_bridgeObjectRetain();
      sub_1C65B4078(v4, *((uint64_t *)&v4 + 1), (uint64_t)&aBlock, v22, v23, v24, v25, v26, v41, v43, aBlock, *((uint64_t *)&aBlock + 1), v46, *((uint64_t *)&v46 + 1), (uint64_t)v47, v48, v49, *((uint64_t *)&v49 + 1), v50,
        *((uint64_t *)&v50 + 1));
      unint64_t v44 = v27;
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      LOBYTE(v44) = v50;
      uint64_t v28 = sub_1C68EC8F8();
      sub_1C65B4078(v28, v29, (uint64_t)&aBlock, v30, v31, v32, v33, v34, v42, v44, aBlock, *((uint64_t *)&aBlock + 1), v46, *((uint64_t *)&v46 + 1), (uint64_t)v47, v48, v49, *((uint64_t *)&v49 + 1), v50,
        *((uint64_t *)&v50 + 1));
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
      *(_WORD *)(v20 + 22) = 1024;
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68ED0C8();
      sub_1C68E5990((uint64_t)&v49);
      *(_WORD *)(v20 + 28) = 1024;
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68ED0C8();
      sub_1C68E5990((uint64_t)&v49);
      _os_log_impl(&dword_1C65AE000, v18, v19, "registering XPC activity\nid=%s\nrepeatInterval=%s\nrequireScreenSleep=%{BOOL}d\nallowBattery=%{BOOL}d", (uint8_t *)v20, 0x22u);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v21, -1, -1);
      MEMORY[0x1C87A54F0](v20, -1, -1);
    }
    else
    {
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
      sub_1C68E5990((uint64_t)&v49);
    }

    long long aBlock = v49;
    long long v46 = v50;
    uint64_t v47 = v51;
    xpc_object_t v35 = sub_1C68E500C();
    uint64_t v36 = swift_allocObject();
    long long v37 = v50;
    *(_OWORD *)(v36 + 16) = v49;
    *(_OWORD *)(v36 + 32) = v37;
    *(void *)(v36 + 48) = v51;
    uint64_t v47 = sub_1C68E5A08;
    uint64_t v48 = v36;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v46 = sub_1C67DD500;
    *((void *)&v46 + 1) = &block_descriptor_37_0;
    uint64_t v38 = _Block_copy(&aBlock);
    sub_1C68E5958((uint64_t)&v49);
    swift_release();
    uint64_t v39 = sub_1C68EC938();
    xpc_activity_register((const char *)(v39 + 32), v35, v38);
    swift_release();
    _Block_release(v38);
    swift_unknownObjectRelease();
  }
  id v40 = (id)qword_1EBBF6520;
  sub_1C68ECFC8();
}

uint64_t static XPCActivity.unregister(name:)()
{
  sub_1C68ECA18();
  uint64_t v0 = sub_1C68EC938();
  swift_bridgeObjectRelease();
  xpc_activity_unregister((const char *)(v0 + 32));

  return swift_release();
}

uint64_t static XPCActivity.registerFirstBoot()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6610);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0410;
  *(void *)(inited + 32) = *MEMORY[0x1E4F142F8];
  xpc_object_t v1 = xpc_BOOL_create(0);
  uint64_t v2 = *MEMORY[0x1E4F142C8];
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = v2;
  xpc_object_t v3 = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v4 = *MEMORY[0x1E4F14170];
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 64) = v4;
  xpc_object_t v5 = xpc_int64_create(0);
  uint64_t v6 = *MEMORY[0x1E4F141A8];
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = v6;
  *(void *)(inited + 88) = xpc_int64_create(120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A0);
  sub_1C68E3D50();
  uint64_t v7 = OUTLINED_FUNCTION_8_88();
  swift_bridgeObjectRetain();
  sub_1C6830730();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C6830750();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1C66722F0(v11);
  swift_release();
  size_t v13 = *(void *)(v7 + 16);
  swift_bridgeObjectRelease();
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)(v9 + 32), (xpc_object_t *)(v12 + 32), v13);
  swift_release();
  swift_bridgeObjectRelease();
  void v17[4] = sub_1C68E3DA4;
  v17[5] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1C67DD500;
  v17[3] = &block_descriptor_28;
  uint64_t v15 = _Block_copy(v17);
  xpc_activity_register("com.apple.siri.inference.FirstBoot", v14, v15);
  _Block_release(v15);
  return swift_unknownObjectRelease();
}

unint64_t sub_1C68E3D50()
{
  unint64_t result = qword_1EBBF5D58;
  if (!qword_1EBBF5D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBBF5A28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBF5D58);
  }
  return result;
}

void sub_1C68E3DA4(_xpc_activity_s *a1)
{
  if (qword_1EBBF6338 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C68EC478();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBBF7A88);
  xpc_object_t v3 = sub_1C68EC458();
  os_log_type_t v4 = sub_1C68ECE48();
  if (os_log_type_enabled(v3, v4))
  {
    xpc_object_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)xpc_object_t v5 = 0;
    _os_log_impl(&dword_1C65AE000, v3, v4, "received FirstBoot XPC Activity", v5, 2u);
    MEMORY[0x1C87A54F0](v5, -1, -1);
  }

  if (!xpc_activity_set_state(a1, 5))
  {
    oslog = sub_1C68EC458();
    os_log_type_t v6 = sub_1C68ECE58();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1C65AE000, oslog, v6, "failed to set FirstBoot to DONE", v7, 2u);
      MEMORY[0x1C87A54F0](v7, -1, -1);
    }
  }
}

uint64_t static XPCActivity.registerDailySignalRefresh(refreshSignalCallback:)()
{
  OUTLINED_FUNCTION_0_118();
  sub_1C68ED398();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6610);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F1550;
  xpc_object_t v3 = OUTLINED_FUNCTION_7_83(inited, *MEMORY[0x1E4F142F8]);
  uint64_t v4 = *MEMORY[0x1E4F141C8];
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = v4;
  xpc_object_t v5 = xpc_int64_create(*MEMORY[0x1E4F141E8]);
  uint64_t v6 = *MEMORY[0x1E4F142C8];
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = v6;
  xpc_object_t v7 = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v8 = *MEMORY[0x1E4F141A8];
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v8;
  xpc_object_t v9 = xpc_int64_create(60);
  uint64_t v10 = *MEMORY[0x1E4F14170];
  *(void *)(inited + 88) = v9;
  *(void *)(inited + 96) = v10;
  xpc_object_t v11 = xpc_int64_create(0);
  uint64_t v12 = *MEMORY[0x1E4F14138];
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 120) = xpc_BOOL_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A0);
  sub_1C68E3D50();
  OUTLINED_FUNCTION_1_145();
  swift_bridgeObjectRetain();
  sub_1C6830730();
  xpc_object_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C6830750();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  sub_1C66722F0(v16);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_95();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  *(void *)(v17 + 24) = v0;
  v19[4] = sub_1C68E5500;
  v19[5] = OUTLINED_FUNCTION_5_101(v17, 0xD00000000000002BLL);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  void v19[2] = sub_1C67DD500;
  v19[3] = &block_descriptor_3_0;
  _Block_copy(v19);
  OUTLINED_FUNCTION_3_121();
  swift_release();
  OUTLINED_FUNCTION_4_105();
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

uint64_t static XPCActivity.registerDailyTaskSuccessEvaluation()()
{
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_1C68ED398();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6610);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F0410;
  xpc_object_t v1 = OUTLINED_FUNCTION_7_83(inited, *MEMORY[0x1E4F142F8]);
  uint64_t v2 = *MEMORY[0x1E4F142C8];
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = v2;
  xpc_object_t v3 = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v4 = *MEMORY[0x1E4F14170];
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 64) = v4;
  xpc_object_t v5 = xpc_int64_create(86400);
  uint64_t v6 = *MEMORY[0x1E4F14138];
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = v6;
  *(void *)(inited + 88) = xpc_BOOL_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A0);
  sub_1C68E3D50();
  uint64_t v7 = OUTLINED_FUNCTION_8_88();
  swift_bridgeObjectRetain();
  sub_1C6830730();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C6830750();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1C66722F0(v11);
  swift_release();
  size_t v13 = *(void *)(v7 + 16);
  swift_bridgeObjectRelease();
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)(v9 + 32), (xpc_object_t *)(v12 + 32), v13);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_1C68E437C;
  uint64_t v22 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  unint64_t v18 = 1107296256;
  os_log_type_t v19 = sub_1C67DD500;
  uint64_t v20 = &block_descriptor_6_0;
  unint64_t v15 = _Block_copy(&v17);
  xpc_activity_register("com.apple.siri.inference.DailyTaskSuccessEvaluation", v14, v15);
  _Block_release(v15);
  return swift_unknownObjectRelease();
}

xpc_activity_state_t sub_1C68E437C(_xpc_activity_s *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6808);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_object_t v5 = (int *)type metadata accessor for TaskSuccessMetricsPublisher();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_activity_state_t result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    sub_1C65BAD10(0, (unint64_t *)&qword_1EBBF43A0);
    sub_1C68EA4E8();
    sub_1C65BAD10(0, &qword_1EA40B098);
    sub_1C68EA4E8();
    uint64_t v9 = &v7[v5[6]];
    *((void *)v9 + 3) = &type metadata for SELFTaskSuccessLogger;
    *((void *)v9 + 4) = &off_1F2181970;
    type metadata accessor for SystemUserDefaultsProvider();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = objc_msgSend(self, sel_standardUserDefaults);
    unint64_t v11 = (uint64_t *)&v7[v5[8]];
    *unint64_t v11 = v10;
    v11[1] = (uint64_t)&off_1F2186210;
    uint64_t v12 = &v7[v5[7]];
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;

    uint64_t v13 = sub_1C68E9B78();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v13);
    sub_1C68EC158();
    swift_allocObject();
    swift_unknownObjectRetain();
    sub_1C68EC138();
    if (xpc_activity_should_defer(a1))
    {
      if (qword_1EBBF68C0 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_1C68EC478();
      __swift_project_value_buffer(v14, (uint64_t)qword_1EBBF7AF0);
      unint64_t v15 = sub_1C68EC458();
      os_log_type_t v16 = sub_1C68ECE48();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1C65AE000, v15, v16, "Defer PSE collections.", v17, 2u);
        MEMORY[0x1C87A54F0](v17, -1, -1);
      }
    }
    uint64_t v29 = v7;
    uint64_t v18 = swift_allocObject();
    *(unsigned char *)(v18 + 16) = 0;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0;
    v28[1] = v19 + 16;
    uint64_t v20 = swift_allocBox();
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v13);
    swift_beginAccess();
    while (!xpc_activity_should_defer(a1))
    {
      if (*(unsigned char *)(v18 + 16)) {
        break;
      }
      uint64_t v22 = (void *)swift_allocObject();
      v22[2] = v18;
      v22[3] = v20;
      v22[4] = v19;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_1C68EC148();
      swift_release();
    }
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1C68EC478();
    __swift_project_value_buffer(v23, (uint64_t)qword_1EBBF7AF0);
    swift_retain();
    uint64_t v24 = sub_1C68EC458();
    os_log_type_t v25 = sub_1C68ECE48();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 134217984;
      swift_beginAccess();
      uint64_t v30 = *(void *)(v19 + 16);
      sub_1C68ED0C8();
      swift_release();
      _os_log_impl(&dword_1C65AE000, v24, v25, "Processed %lu PSE collections.", v26, 0xCu);
      MEMORY[0x1C87A54F0](v26, -1, -1);
      swift_release();
    }
    else
    {
      swift_release();

      swift_release();
    }
    uint64_t v27 = (uint64_t)v29;
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    return sub_1C68E58FC(v27);
  }
  return result;
}

xpc_object_t static XPCActivity.registerRecurringAudioAppSignalsSync(audioAppSignalsSync:)()
{
  OUTLINED_FUNCTION_0_118();
  sub_1C68ED398();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6610);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68FB070;
  xpc_object_t v3 = OUTLINED_FUNCTION_7_83(inited, *MEMORY[0x1E4F142F8]);
  uint64_t v4 = *MEMORY[0x1E4F141C8];
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = v4;
  xpc_object_t v5 = xpc_int64_create(*MEMORY[0x1E4F14218]);
  uint64_t v6 = *MEMORY[0x1E4F142C8];
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = v6;
  xpc_object_t v7 = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
  uint64_t v8 = *MEMORY[0x1E4F141A8];
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v8;
  xpc_object_t v9 = xpc_int64_create(60);
  uint64_t v10 = *MEMORY[0x1E4F14170];
  *(void *)(inited + 88) = v9;
  *(void *)(inited + 96) = v10;
  xpc_object_t v11 = xpc_int64_create(0);
  uint64_t v12 = *MEMORY[0x1E4F14138];
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 112) = v12;
  xpc_object_t result = xpc_BOOL_create(1);
  *(void *)(inited + 120) = result;
  if (*MEMORY[0x1E4F14330])
  {
    *(void *)(inited + 128) = *MEMORY[0x1E4F14330];
    *(void *)(inited + 136) = xpc_BOOL_create(1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A0);
    sub_1C68E3D50();
    OUTLINED_FUNCTION_1_145();
    swift_bridgeObjectRetain();
    sub_1C6830730();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C6830750();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_1C66722F0(v17);
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_95();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v1;
    *(void *)(v18 + 24) = v0;
    v19[4] = sub_1C68E552C;
    v19[5] = OUTLINED_FUNCTION_5_101(v18, 0xD000000000000035);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 1107296256;
    void v19[2] = sub_1C67DD500;
    v19[3] = &block_descriptor_12_0;
    _Block_copy(v19);
    OUTLINED_FUNCTION_3_121();
    swift_release();
    OUTLINED_FUNCTION_4_105();
    _Block_release(v15);
    return (xpc_object_t)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static XPCActivity.registerHourlySignalRefresh(hourlySignalRefresh:)()
{
  OUTLINED_FUNCTION_0_118();
  sub_1C68ED398();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF6610);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68F1550;
  xpc_object_t v3 = OUTLINED_FUNCTION_7_83(inited, *MEMORY[0x1E4F142F8]);
  uint64_t v4 = *MEMORY[0x1E4F141C8];
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = v4;
  xpc_object_t v5 = xpc_int64_create(*MEMORY[0x1E4F141F8]);
  uint64_t v6 = *MEMORY[0x1E4F142C8];
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = v6;
  xpc_object_t v7 = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v8 = *MEMORY[0x1E4F141A8];
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v8;
  xpc_object_t v9 = xpc_int64_create(60);
  uint64_t v10 = *MEMORY[0x1E4F14170];
  *(void *)(inited + 88) = v9;
  *(void *)(inited + 96) = v10;
  xpc_object_t v11 = xpc_int64_create(60);
  uint64_t v12 = *MEMORY[0x1E4F14138];
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 120) = xpc_BOOL_create(1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A0);
  sub_1C68E3D50();
  OUTLINED_FUNCTION_1_145();
  swift_bridgeObjectRetain();
  sub_1C6830730();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C6830750();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  sub_1C66722F0(v16);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_95();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  *(void *)(v17 + 24) = v0;
  v19[4] = sub_1C68E5598;
  v19[5] = OUTLINED_FUNCTION_5_101(v17, 0xD00000000000002CLL);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  void v19[2] = sub_1C67DD500;
  v19[3] = &block_descriptor_18;
  _Block_copy(v19);
  OUTLINED_FUNCTION_3_121();
  swift_release();
  OUTLINED_FUNCTION_4_105();
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

void sub_1C68E4D88(_xpc_activity_s *a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, const char *a6)
{
  if (xpc_activity_get_state(a1) == 2)
  {
    if (qword_1EBBF6338 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C68EC478();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBBF7A88);
    xpc_object_t v11 = sub_1C68EC458();
    os_log_type_t v12 = sub_1C68ECE48();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1C65AE000, v11, v12, a6, v13, 2u);
      MEMORY[0x1C87A54F0](v13, -1, -1);
    }

    a2();
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBBF7AF0);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_1C68EC458();
    os_log_type_t v15 = sub_1C68ECE48();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v24[0] = v17;
      *(_DWORD *)unint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C65B4078(a4, a5, (uint64_t)v24, v18, v19, v20, v21, v22, v23, v24[0], v24[1], v24[2], v24[3], v24[4], v24[5], v24[6], v24[7], v24[8], v24[9],
        v24[10]);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C65AE000, v14, v15, "queued XPC activity. id=%s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v17, -1, -1);
      MEMORY[0x1C87A54F0](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

xpc_object_t sub_1C68E500C()
{
  int v1 = v0[16];
  xpc_object_t v2 = (xpc_object_t)v0[16];
  unsigned __int8 v3 = v0[17];
  unsigned __int8 v4 = v0[18];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBF6600);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C68FCA00;
  *(void *)(inited + 32) = *MEMORY[0x1E4F141C8];
  uint64_t v6 = (int64_t *)MEMORY[0x1E4F141F8];
  xpc_object_t v7 = (void *)inited;
  switch((unint64_t)v2)
  {
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      uint64_t v6 = (int64_t *)MEMORY[0x1E4F14218];
      goto LABEL_5;
    case 3uLL:
      uint64_t v6 = (int64_t *)MEMORY[0x1E4F14238];
      goto LABEL_5;
    case 4uLL:
      uint64_t v6 = (int64_t *)MEMORY[0x1E4F141E8];
LABEL_5:
      xpc_object_t v2 = xpc_int64_create(*v6);
      break;
    default:
      break;
  }
  uint64_t v8 = *MEMORY[0x1E4F142F8];
  v7[5] = v2;
  v7[6] = v8;
  xpc_object_t v9 = xpc_BOOL_create(v1 != 0);
  uint64_t v10 = *MEMORY[0x1E4F142C8];
  v7[7] = v9;
  v7[8] = v10;
  xpc_object_t v11 = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v12 = *MEMORY[0x1E4F14340];
  v7[9] = v11;
  v7[10] = v12;
  xpc_object_t v13 = xpc_BOOL_create(v3);
  uint64_t v14 = *MEMORY[0x1E4F14138];
  v7[11] = v13;
  v7[12] = v14;
  v7[13] = xpc_BOOL_create(v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF5A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF65A8);
  sub_1C68E3D50();
  uint64_t v15 = sub_1C68EC748();
  swift_bridgeObjectRetain();
  sub_1C6830730();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C6830710();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  size_t v20 = *(void *)(v15 + 16);
  swift_bridgeObjectRelease();
  xpc_object_t v21 = xpc_dictionary_create((const char *const *)(v17 + 32), (xpc_object_t *)(v19 + 32), v20);
  swift_release();
  swift_release();
  return v21;
}

void sub_1C68E51FC(_xpc_activity_s *a1, uint64_t a2)
{
  if (xpc_activity_get_state(a1) == 2)
  {
    id v17 = (id)(*(uint64_t (**)(_xpc_activity_s *))(a2 + 24))(a1);
    if (qword_1EBBF68F8 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_1EBBF6830, sel_addOperation_);
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1C68EC478();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EBBF7AF0);
    sub_1C68E5958(a2);
    xpc_object_t v5 = sub_1C68EC458();
    os_log_type_t v6 = sub_1C68ECE48();
    if (os_log_type_enabled(v5, v6))
    {
      xpc_object_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      v20[0] = v8;
      *(_DWORD *)xpc_object_t v7 = 136315138;
      uint64_t v9 = *(void *)a2;
      uint64_t v10 = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      sub_1C65B4078(v9, v10, (uint64_t)v20, v11, v12, v13, v14, v15, v16, (unint64_t)v17, v19, v20[0], v20[1], v20[2], v20[3], v20[4], v20[5], v20[6], v20[7],
        v20[8]);
      sub_1C68ED0C8();
      swift_bridgeObjectRelease();
      sub_1C68E5990(a2);
      _os_log_impl(&dword_1C65AE000, v5, v6, "queued XPC activity. id=%s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87A54F0](v8, -1, -1);
      MEMORY[0x1C87A54F0](v7, -1, -1);
    }
    else
    {
      sub_1C68E5990(a2);
    }
  }
}

BOOL static XPCActivity.RepeatInterval.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t XPCActivity.RepeatInterval.hash(into:)()
{
  return sub_1C68ED948();
}

uint64_t XPCActivity.RepeatInterval.hashValue.getter()
{
  return sub_1C68ED988();
}

uint64_t block_copy_helper_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_27()
{
  return swift_release();
}

void sub_1C68E5500(_xpc_activity_s *a1)
{
  sub_1C68E4D88(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), "received DailySignalRefresh XPC Activity");
}

void sub_1C68E552C(_xpc_activity_s *a1)
{
  sub_1C68E4D88(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), "received RecurringAudioAppSignalsSync XPC Activity");
}

uint64_t objectdestroyTm_3()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C68E5598(_xpc_activity_s *a1)
{
  sub_1C68E4D88(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), "received HourlySignalRefresh XPC Activity");
}

unint64_t sub_1C68E55C4()
{
  unint64_t result = qword_1EA40B5E0;
  if (!qword_1EA40B5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B5E0);
  }
  return result;
}

uint64_t destroy for XPCActivity()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for XPCActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for XPCActivity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for XPCActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for XPCActivity()
{
  return &type metadata for XPCActivity;
}

unsigned char *storeEnumTagSinglePayload for XPCActivity.RepeatInterval(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C68E5858);
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

ValueMetadata *type metadata accessor for XPCActivity.RepeatInterval()
{
  return &type metadata for XPCActivity.RepeatInterval;
}

uint64_t sub_1C68E5890()
{
  return OUTLINED_FUNCTION_9_77(v0, 17);
}

uint64_t sub_1C68E589C()
{
  return OUTLINED_FUNCTION_9_77(v0, 24);
}

uint64_t sub_1C68E58A8()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C68E58F0(uint64_t a1)
{
  return sub_1C67E8924(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint8_t **)(v1 + 32));
}

uint64_t sub_1C68E58FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TaskSuccessMetricsPublisher();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C68E5958(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68E5990(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C68E59C8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C68E5A08(_xpc_activity_s *a1)
{
  sub_1C68E51FC(a1, v1 + 16);
}

uint64_t OUTLINED_FUNCTION_1_145()
{
  return sub_1C68EC748();
}

uint64_t OUTLINED_FUNCTION_3_121()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_4_105()
{
  xpc_activity_register(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_5_101@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = (v2 - 32) | 0x8000000000000000;
  return result;
}

xpc_object_t OUTLINED_FUNCTION_6_95()
{
  return xpc_dictionary_create((const char *const *)(v0 + 32), (xpc_object_t *)(v2 + 32), v1);
}

xpc_object_t OUTLINED_FUNCTION_7_83@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = a2;
  return xpc_BOOL_create(1);
}

uint64_t OUTLINED_FUNCTION_8_88()
{
  return sub_1C68EC748();
}

char *XPCActivityOperation.init(activity:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_activity] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_completionKVObservation] = 0;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for XPCActivityOperation();
  uint64_t v3 = (char *)objc_msgSendSuper2(&v10, sel_init);
  *(void *)&v3[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_activity] = a1;
  unsigned int v4 = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = a1;
  unsigned int v6 = v4;
  swift_unknownObjectRetain();
  uint64_t v7 = sub_1C68E9898();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  uint64_t v8 = *(void **)&v6[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_completionKVObservation];
  *(void *)&v6[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_completionKVObservation] = v7;

  return v6;
}

uint64_t type metadata accessor for XPCActivityOperation()
{
  return self;
}

char *keypath_get_selector_isFinished()
{
  return sel_isFinished;
}

uint64_t sub_1C68E5C70()
{
  if (objc_msgSend(v0, sel_isCancelled))
  {
    if (qword_1EBBF68C0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1C68EC478();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EBBF7AF0);
    uint64_t v2 = sub_1C68EC458();
    os_log_type_t v3 = sub_1C68ECE48();
    if (os_log_type_enabled(v2, v3))
    {
      unsigned int v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_1C65AE000, v2, v3, "XPC activity has been cancelled", v4, 2u);
      MEMORY[0x1C87A54F0](v4, -1, -1);
    }

    return 1;
  }
  if (*(void *)&v0[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_activity])
  {
    uint64_t v5 = (_xpc_activity_s *)swift_unknownObjectRetain();
    if (xpc_activity_should_defer(v5))
    {
      objc_msgSend(v0, sel_cancel);
      if (qword_1EBBF68C0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1C68EC478();
      __swift_project_value_buffer(v6, (uint64_t)qword_1EBBF7AF0);
      uint64_t v7 = sub_1C68EC458();
      os_log_type_t v8 = sub_1C68ECE48();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1C65AE000, v7, v8, "XPC activity has been deferred", v9, 2u);
        MEMORY[0x1C87A54F0](v9, -1, -1);
      }

      swift_unknownObjectRelease();
      return 1;
    }
    swift_unknownObjectRelease();
  }
  return 0;
}

id XPCActivityOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id XPCActivityOperation.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_activity;
  *(void *)&v0[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_activity] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13SiriInference20XPCActivityOperation_completionKVObservation] = 0;
  *(void *)&v0[v1] = 0;
  swift_unknownObjectRelease();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for XPCActivityOperation();
  return objc_msgSendSuper2(&v3, sel_init);
}

char *XPCActivityOperation.__allocating_init(activity:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return XPCActivityOperation.init(activity:)(a1);
}

id sub_1C68E5F44@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isFinished);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_1C68E5F78(uint64_t a1, uint64_t a2, uint64_t a3, _xpc_activity_s *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF3B28);
  uint64_t result = sub_1C68E9888();
  if (v7 != 2 && (v7 & 1) != 0)
  {
    if (sub_1C68E5C70()) {
      xpc_activity_state_t v6 = 3;
    }
    else {
      xpc_activity_state_t v6 = 5;
    }
    return xpc_activity_set_state(a4, v6);
  }
  return result;
}

uint64_t sub_1C68E5FF4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C68E6034(uint64_t a1, uint64_t a2)
{
  return sub_1C68E5F78(a1, a2, *(void *)(v2 + 16), *(_xpc_activity_s **)(v2 + 24));
}

id XPCActivityOperation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCActivityOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for XPCActivityOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for XPCActivityOperation);
}

uint64_t dispatch thunk of XPCActivityOperation.__allocating_init(activity:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

SiriInference::Zipcode __swiftcall Zipcode.init(value:prefix:)(SiriInference::Zipcode value, SiriInference::Zipcode::Prefix_optional prefix)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)prefix.value;
  *(Swift::String *)(v2 + 8) = *(Swift::String *)&value.prefix.value;
  LOBYTE(value.value._object) = prefix;
  return value;
}

SiriInference::Zipcode::Prefix_optional __swiftcall Zipcode.Prefix.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C68ED598();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t Zipcode.Prefix.rawValue.getter()
{
  uint64_t v1 = 28265;
  if (*v0 != 1) {
    uint64_t v1 = 1918985582;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x65646F6370697ALL;
  }
}

uint64_t sub_1C68E619C(char *a1, char *a2)
{
  return sub_1C6616D34(*a1, *a2);
}

uint64_t sub_1C68E61A8()
{
  return sub_1C6702A14();
}

uint64_t sub_1C68E61B0(uint64_t a1)
{
  return sub_1C6677FE4(a1, *v1);
}

uint64_t sub_1C68E61B8()
{
  return sub_1C680D7B0();
}

SiriInference::Zipcode::Prefix_optional sub_1C68E61C0(Swift::String *a1)
{
  return Zipcode.Prefix.init(rawValue:)(*a1);
}

uint64_t sub_1C68E61CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Zipcode.Prefix.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C68E61F4()
{
  return sub_1C68ECB98();
}

uint64_t sub_1C68E6254()
{
  return sub_1C68ECB68();
}

void Zipcode.prefix.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Zipcode.value.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static Zipcode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  BOOL v4 = *((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2);
  if (v4 || (char v5 = sub_1C68ED7E8(), result = 0, (v5 & 1) != 0))
  {
    uint64_t result = v3 == 3 && (unint64_t)(v2 == 3);
    if (v2 != 3 && v3 != 3)
    {
      return sub_1C6616D34(v2, v3);
    }
  }
  return result;
}

uint64_t sub_1C68E6378(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x786966657270 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C68ED7E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1C68ED7E8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C68E6458(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 0x786966657270;
  }
}

uint64_t sub_1C68E6488()
{
  return sub_1C68E6458(*v0);
}

uint64_t sub_1C68E6490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C68E6378(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C68E64B8(uint64_t a1)
{
  unint64_t v2 = sub_1C68E6840();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C68E64F4(uint64_t a1)
{
  unint64_t v2 = sub_1C68E6840();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Zipcode.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B600);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  uint64_t v11 = *((void *)v1 + 1);
  v13[0] = *((void *)v1 + 2);
  v13[1] = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C68E6840();
  sub_1C68EDA08();
  char v16 = v10;
  char v15 = 0;
  sub_1C68E688C();
  sub_1C68ED6F8();
  if (!v2)
  {
    char v14 = 1;
    sub_1C68ED708();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t Zipcode.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA40B618);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C68E6840();
  sub_1C68ED9E8();
  if (!v2)
  {
    sub_1C68E68D8();
    sub_1C68ED608();
    uint64_t v7 = sub_1C68ED618();
    uint64_t v9 = v8;
    uint64_t v10 = OUTLINED_FUNCTION_1_146();
    v11(v10);
    *(unsigned char *)a2 = v12;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1C68E680C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Zipcode.init(from:)(a1, a2);
}

uint64_t sub_1C68E6824(void *a1)
{
  return Zipcode.encode(to:)(a1);
}

unint64_t sub_1C68E6840()
{
  unint64_t result = qword_1EA40B608;
  if (!qword_1EA40B608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B608);
  }
  return result;
}

unint64_t sub_1C68E688C()
{
  unint64_t result = qword_1EA40B610;
  if (!qword_1EA40B610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B610);
  }
  return result;
}

unint64_t sub_1C68E68D8()
{
  unint64_t result = qword_1EA40B620;
  if (!qword_1EA40B620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B620);
  }
  return result;
}

unint64_t sub_1C68E6928()
{
  unint64_t result = qword_1EA40B628;
  if (!qword_1EA40B628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B628);
  }
  return result;
}

uint64_t assignWithCopy for Zipcode(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Zipcode(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Zipcode()
{
  return &type metadata for Zipcode;
}

unsigned char *storeEnumTagSinglePayload for Zipcode.Prefix(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C68E6AD8);
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

ValueMetadata *type metadata accessor for Zipcode.Prefix()
{
  return &type metadata for Zipcode.Prefix;
}

unsigned char *storeEnumTagSinglePayload for Zipcode.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C68E6BDCLL);
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

ValueMetadata *type metadata accessor for Zipcode.CodingKeys()
{
  return &type metadata for Zipcode.CodingKeys;
}

unint64_t sub_1C68E6C18()
{
  unint64_t result = qword_1EA40B630;
  if (!qword_1EA40B630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B630);
  }
  return result;
}

unint64_t sub_1C68E6C68()
{
  unint64_t result = qword_1EA40B638;
  if (!qword_1EA40B638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B638);
  }
  return result;
}

unint64_t sub_1C68E6CB8()
{
  unint64_t result = qword_1EA40B640;
  if (!qword_1EA40B640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B640);
  }
  return result;
}

unint64_t sub_1C68E6D04()
{
  unint64_t result = qword_1EA40B648;
  if (!qword_1EA40B648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA40B648);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_146()
{
  return v0;
}

void sub_1C68E6DD0()
{
}

id sub_1C68E6DDC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737475706E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_1C68ED7E8() & 1) != 0) {
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *(void *)(v2 + 16));
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for ContactRankerInput()
{
  return self;
}

void sub_1C68E6E9C()
{
}

void sub_1C68E6EB0()
{
}

void sub_1C68E6ECC()
{
}

void sub_1C68E6EE8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_1C68EC868();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  id v4 = objc_msgSend(v3, sel_multiArrayValue);

  if (!v4) {
LABEL_5:
  }
    __break(1u);
}

uint64_t sub_1C68E6FD4()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_featureNames);
  uint64_t v2 = sub_1C68ECD58();

  return v2;
}

id sub_1C68E702C()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_1C68EC868();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  return v3;
}

id sub_1C68E7094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  uint64_t v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t sub_1C68E7110()
{
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactRankerOutput()
{
  return self;
}

uint64_t sub_1C68E716C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E9E0]), sel_init);
  uint64_t v3 = sub_1C68E71D8(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_1C68E71D8(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for ContactRankerOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_1C68E9878();

    swift_willThrow();
  }
  return v3;
}

uint64_t type metadata accessor for ContactRanker()
{
  return self;
}

void sub_1C68E7344()
{
}

uint64_t type metadata accessor for ContactRanker_watchos_ios_baxterInput()
{
  return self;
}

id sub_1C68E7410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  id v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t type metadata accessor for ContactRanker_watchos_ios_baxterOutput()
{
  return self;
}

uint64_t type metadata accessor for ContactRanker_watchos_ios_baxter()
{
  return self;
}

void sub_1C68E74D4()
{
}

void sub_1C68E74F8()
{
}

uint64_t sub_1C68E751C(void *a1)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v19 - v10;
  sub_1C68E78D0((uint64_t)v19 - v10);
  sub_1C67ACF04();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v1);
  id v12 = sub_1C67DF4FC((uint64_t)v9, a1);
  if (v2)
  {
    uint64_t v13 = OUTLINED_FUNCTION_1_147();
    return v14(v13);
  }
  else
  {
    id v16 = v12;
    uint64_t v17 = OUTLINED_FUNCTION_1_147();
    v18(v17);
    type metadata accessor for PhoneAppPredictorPeopleCentric();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v16;
  }
  return result;
}

void sub_1C68E76B0()
{
}

id sub_1C68E76BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 88 && a2 == 0xE100000000000000;
  if (v3 || (sub_1C68ED7E8() & 1) != 0) {
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *(void *)(v2 + 16));
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for PhoneAppPredictorPeopleCentricInput()
{
  return self;
}

void sub_1C68E7768()
{
}

void sub_1C68E778C()
{
}

id sub_1C68E7830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  uint64_t v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t type metadata accessor for PhoneAppPredictorPeopleCentricOutput()
{
  return self;
}

uint64_t sub_1C68E78D0@<X0>(uint64_t a1@<X8>)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF67F0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v13 = sub_1C68E9184(0xD00000000000001ELL, 0x80000001C690F2D0, 0x636C65646F6D6C6DLL, 0xE800000000000000, v12);
  if (v13)
  {
    char v14 = v13;
    sub_1C68E9928();

    char v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v10, v7, v1);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v1);
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(a1, v10, v1);
    }
  }
  else
  {
    uint64_t result = __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68E7A9C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E9E0]), sel_init);
  uint64_t v3 = sub_1C68E7B08(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_1C68E7B08(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for PhoneAppPredictorPeopleCentricOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_1C68E9878();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_1C68E7BE0(void *a1)
{
  type metadata accessor for PhoneAppPredictorPeopleCentricInput();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  id v3 = a1;
  uint64_t v4 = sub_1C68E7A9C(v2);
  swift_release();
  return v4;
}

uint64_t type metadata accessor for PhoneAppPredictorPeopleCentric()
{
  return self;
}

uint64_t OUTLINED_FUNCTION_1_147()
{
  return v0;
}

uint64_t sub_1C68E7C88(void *a1)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v19 - v10;
  sub_1C68E7F88((uint64_t)v19 - v10);
  sub_1C67ACF04();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v1);
  id v12 = sub_1C67DF4FC((uint64_t)v9, a1);
  if (v2)
  {
    uint64_t v13 = OUTLINED_FUNCTION_1_147();
    return v14(v13);
  }
  else
  {
    id v16 = v12;
    uint64_t v17 = OUTLINED_FUNCTION_1_147();
    v18(v17);
    type metadata accessor for MessageAppPredictorPeopleCentric();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v16;
  }
  return result;
}

void sub_1C68E7E1C()
{
}

uint64_t type metadata accessor for MessageAppPredictorPeopleCentricInput()
{
  return self;
}

id sub_1C68E7EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  uint64_t v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t type metadata accessor for MessageAppPredictorPeopleCentricOutput()
{
  return self;
}

uint64_t sub_1C68E7F88@<X0>(uint64_t a1@<X8>)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF67F0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v13 = sub_1C68E9184(0xD000000000000020, 0x80000001C690F370, 0x636C65646F6D6C6DLL, 0xE800000000000000, v12);
  if (v13)
  {
    char v14 = v13;
    sub_1C68E9928();

    char v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v10, v7, v1);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v1);
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(a1, v10, v1);
    }
  }
  else
  {
    uint64_t result = __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68E8154(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E9E0]), sel_init);
  uint64_t v3 = sub_1C68E81C0(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_1C68E81C0(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for MessageAppPredictorPeopleCentricOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_1C68E9878();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_1C68E8298(void *a1)
{
  type metadata accessor for MessageAppPredictorPeopleCentricInput();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  id v3 = a1;
  uint64_t v4 = sub_1C68E8154(v2);
  swift_release();
  return v4;
}

uint64_t type metadata accessor for MessageAppPredictorPeopleCentric()
{
  return self;
}

void sub_1C68E8394()
{
}

id sub_1C68E83A0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E695F6C65646F6DLL && a2 == 0xEB00000000747570;
  if (v3 || (sub_1C68ED7E8() & 1) != 0) {
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *(void *)(v2 + 16));
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for PervasiveEntityResolutionInput()
{
  return self;
}

void sub_1C68E8478()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_1C68EC868();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  id v4 = objc_msgSend(v3, sel_multiArrayValue);

  if (!v4) {
LABEL_5:
  }
    __break(1u);
}

id sub_1C68E8594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  id v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t type metadata accessor for PervasiveEntityResolutionOutput()
{
  return self;
}

uint64_t sub_1C68E8634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1C68E9968();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF67F0);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v11 = sub_1C68E9184(0xD000000000000019, 0x80000001C690F410, 0x636C65646F6D6C6DLL, 0xE800000000000000, v10);
  if (v11)
  {
    id v12 = v11;
    sub_1C68E9928();

    id v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v8, v5, v2);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v2);
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(a1, v8, v2);
    }
  }
  else
  {
    uint64_t result = __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68E882C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E9E0]), sel_init);
  uint64_t v3 = sub_1C68E8898(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_1C68E8898(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for PervasiveEntityResolutionOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_1C68E9878();

    swift_willThrow();
  }
  return v3;
}

uint64_t type metadata accessor for PervasiveEntityResolution()
{
  return self;
}

uint64_t sub_1C68E8994(void *a1)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  id v11 = (char *)v19 - v10;
  sub_1C68E8DD4((uint64_t)v19 - v10);
  sub_1C67ACF04();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v1);
  id v12 = sub_1C67DF4FC((uint64_t)v9, a1);
  if (v2)
  {
    uint64_t v13 = OUTLINED_FUNCTION_1_147();
    return v14(v13);
  }
  else
  {
    id v16 = v12;
    uint64_t v17 = OUTLINED_FUNCTION_1_147();
    v18(v17);
    type metadata accessor for PhoneAppPredictor();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v16;
  }
  return result;
}

void sub_1C68E8B28()
{
}

id sub_1C68E8B34(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 88 && a2 == 0xE100000000000000;
  if (v3 || (sub_1C68ED7E8() & 1) != 0)
  {
    uint64_t v6 = (void *)(v2 + 16);
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v7 = a1 == 0x745F6E69616D6F64 && a2 == 0xEB00000000657079;
  if (v7 || (sub_1C68ED7E8() & 1) != 0)
  {
    uint64_t v6 = (void *)(v2 + 24);
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  return 0;
}

uint64_t sub_1C68E8C30()
{
  return v0;
}

uint64_t sub_1C68E8C58()
{
  sub_1C68E8C30();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PhoneAppPredictorInput()
{
  return self;
}

id sub_1C68E8D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_1C68EC898();
  uint64_t v7 = v6;
  swift_retain();
  uint64_t v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t type metadata accessor for PhoneAppPredictorOutput()
{
  return self;
}

uint64_t sub_1C68E8DD4@<X0>(uint64_t a1@<X8>)
{
  sub_1C68E9968();
  OUTLINED_FUNCTION_0_77();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBF67F0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v13 = sub_1C68E9184(0xD000000000000011, 0x80000001C690F490, 0x636C65646F6D6C6DLL, 0xE800000000000000, v12);
  if (v13)
  {
    char v14 = v13;
    sub_1C68E9928();

    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v10, v7, v1);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v1);
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(a1, v10, v1);
    }
  }
  else
  {
    uint64_t result = __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C68E8FA0(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E9E0]), sel_init);
  uint64_t v3 = sub_1C68E900C(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_1C68E900C(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for PhoneAppPredictorOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_1C68E9878();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_1C68E90E4(void *a1, void *a2)
{
  type metadata accessor for PhoneAppPredictorInput();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = sub_1C68E8FA0(v4);
  swift_release();
  return v7;
}

uint64_t type metadata accessor for PhoneAppPredictor()
{
  return self;
}

id sub_1C68E9184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)sub_1C68EC868();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_1C68EC868();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_1C68E9218()
{
  return MEMORY[0x1F40D4420]();
}

uint64_t sub_1C68E9228()
{
  return MEMORY[0x1F40D4430]();
}

uint64_t sub_1C68E9238()
{
  return MEMORY[0x1F40E2FF0]();
}

uint64_t sub_1C68E9248()
{
  return MEMORY[0x1F40E2FF8]();
}

uint64_t sub_1C68E9258()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C68E9268()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C68E9278()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C68E9288()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C68E9298()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C68E92A8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C68E92B8()
{
  return MEMORY[0x1F40E3358]();
}

uint64_t sub_1C68E92C8()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1C68E92D8()
{
  return MEMORY[0x1F40E3380]();
}

uint64_t sub_1C68E92E8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1C68E92F8()
{
  return MEMORY[0x1F40E3488]();
}

uint64_t sub_1C68E9308()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1C68E9318()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1C68E9328()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1C68E9338()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C68E9348()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1C68E9358()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C68E9368()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C68E9378()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C68E9388()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1C68E9398()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1C68E93A8()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1C68E93B8()
{
  return MEMORY[0x1F40E3620]();
}

uint64_t sub_1C68E93C8()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1C68E93D8()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1C68E93E8()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1C68E93F8()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1C68E9408()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C68E9418()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C68E9428()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C68E9438()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1C68E9448()
{
  return MEMORY[0x1F40E3858]();
}

uint64_t sub_1C68E9458()
{
  return MEMORY[0x1F40E3860]();
}

uint64_t sub_1C68E9468()
{
  return MEMORY[0x1F40E3868]();
}

uint64_t sub_1C68E9478()
{
  return MEMORY[0x1F40E3870]();
}

uint64_t sub_1C68E9488()
{
  return MEMORY[0x1F40E3890]();
}

uint64_t sub_1C68E9498()
{
  return MEMORY[0x1F40E3898]();
}

uint64_t sub_1C68E94A8()
{
  return MEMORY[0x1F40E38A0]();
}

uint64_t sub_1C68E94B8()
{
  return MEMORY[0x1F40E38A8]();
}

uint64_t sub_1C68E94C8()
{
  return MEMORY[0x1F40E38B8]();
}

uint64_t sub_1C68E94D8()
{
  return MEMORY[0x1F40E38C0]();
}

uint64_t sub_1C68E94E8()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1C68E94F8()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1C68E9508()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1C68E9518()
{
  return MEMORY[0x1F40E3908]();
}

uint64_t sub_1C68E9528()
{
  return MEMORY[0x1F40E3920]();
}

uint64_t sub_1C68E9538()
{
  return MEMORY[0x1F40E3928]();
}

uint64_t sub_1C68E9548()
{
  return MEMORY[0x1F40E3938]();
}

uint64_t sub_1C68E9558()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1C68E9568()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1C68E9578()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1C68E9588()
{
  return MEMORY[0x1F40E3978]();
}

uint64_t sub_1C68E9598()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1C68E95A8()
{
  return MEMORY[0x1F40E3990]();
}

uint64_t sub_1C68E95B8()
{
  return MEMORY[0x1F40E39A0]();
}

uint64_t sub_1C68E95C8()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1C68E95D8()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1C68E95E8()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1C68E95F8()
{
  return MEMORY[0x1F40E39D8]();
}

uint64_t sub_1C68E9608()
{
  return MEMORY[0x1F40E39E8]();
}

uint64_t sub_1C68E9618()
{
  return MEMORY[0x1F40E39F0]();
}

uint64_t sub_1C68E9628()
{
  return MEMORY[0x1F40E39F8]();
}

uint64_t sub_1C68E9638()
{
  return MEMORY[0x1F40E3A00]();
}

uint64_t sub_1C68E9648()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1C68E9658()
{
  return MEMORY[0x1F40E3A20]();
}

uint64_t sub_1C68E9668()
{
  return MEMORY[0x1F40E3A28]();
}

uint64_t sub_1C68E9678()
{
  return MEMORY[0x1F40E3A40]();
}

uint64_t sub_1C68E9688()
{
  return MEMORY[0x1F40E3A50]();
}

uint64_t sub_1C68E9698()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C68E96A8()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1C68E96B8()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C68E96C8()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C68E96D8()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C68E96E8()
{
  return MEMORY[0x1F40E42C0]();
}

uint64_t sub_1C68E96F8()
{
  return MEMORY[0x1F40E42C8]();
}

uint64_t sub_1C68E9708()
{
  return MEMORY[0x1F40E42D8]();
}

uint64_t sub_1C68E9718()
{
  return MEMORY[0x1F40E42F0]();
}

uint64_t sub_1C68E9728()
{
  return MEMORY[0x1F40E4300]();
}

uint64_t sub_1C68E9738()
{
  return MEMORY[0x1F40E4310]();
}

uint64_t sub_1C68E9748()
{
  return MEMORY[0x1F40E4330]();
}

uint64_t sub_1C68E9758()
{
  return MEMORY[0x1F40E4338]();
}

uint64_t sub_1C68E9768()
{
  return MEMORY[0x1F40E4340]();
}

uint64_t sub_1C68E9778()
{
  return MEMORY[0x1F40E4350]();
}

uint64_t sub_1C68E9788()
{
  return MEMORY[0x1F40E4368]();
}

uint64_t sub_1C68E9798()
{
  return MEMORY[0x1F40E4378]();
}

uint64_t sub_1C68E97A8()
{
  return MEMORY[0x1F40E4388]();
}

uint64_t sub_1C68E97B8()
{
  return MEMORY[0x1F40E4390]();
}

uint64_t sub_1C68E97C8()
{
  return MEMORY[0x1F40E43A0]();
}

uint64_t sub_1C68E97D8()
{
  return MEMORY[0x1F40E43A8]();
}

uint64_t sub_1C68E97E8()
{
  return MEMORY[0x1F40E43C0]();
}

uint64_t sub_1C68E97F8()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1C68E9848()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1C68E9878()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C68E9888()
{
  return MEMORY[0x1F40E4680]();
}

uint64_t sub_1C68E9898()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1C68E98A8()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1C68E98B8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C68E98C8()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1C68E98D8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1C68E98E8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C68E98F8()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1C68E9908()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1C68E9918()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1C68E9928()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C68E9938()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1C68E9948()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C68E9958()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C68E9968()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C68E9978()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1C68E9988()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1C68E9998()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1C68E99A8()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1C68E99B8()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1C68E99C8()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1C68E99D8()
{
  return MEMORY[0x1F40E4CC8]();
}

uint64_t sub_1C68E99E8()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1C68E99F8()
{
  return MEMORY[0x1F40E4D00]();
}

uint64_t sub_1C68E9A08()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C68E9A18()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1C68E9A28()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C68E9A38()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1C68E9A48()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C68E9A58()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1C68E9A68()
{
  return MEMORY[0x1F40E5098]();
}

uint64_t sub_1C68E9A78()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1C68E9A88()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1C68E9A98()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C68E9AA8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C68E9AB8()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C68E9AC8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C68E9AD8()
{
  return MEMORY[0x1F40E51D0]();
}

uint64_t sub_1C68E9AE8()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1C68E9AF8()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1C68E9B08()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1C68E9B18()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C68E9B28()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C68E9B38()
{
  return MEMORY[0x1F40E52D8]();
}

uint64_t sub_1C68E9B48()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C68E9B58()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1C68E9B68()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C68E9B78()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C68E9B88()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C68E9B98()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C68E9BA8()
{
  return MEMORY[0x1F40E53B8]();
}

uint64_t sub_1C68E9BB8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C68E9BC8()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C68E9BD8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C68E9BE8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C68E9BF8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C68E9C08()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1C68E9C18()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1C68E9C28()
{
  return MEMORY[0x1F40E5520]();
}

uint64_t sub_1C68E9C38()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1C68E9C48()
{
  return MEMORY[0x1F40E5688]();
}

uint64_t sub_1C68E9C58()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C68E9C68()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C68E9C78()
{
  return MEMORY[0x1F40E5898]();
}

uint64_t sub_1C68E9C88()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1C68E9C98()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1C68E9CA8()
{
  return MEMORY[0x1F40E58C0]();
}

uint64_t sub_1C68E9CB8()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1C68E9CC8()
{
  return MEMORY[0x1F40E5918]();
}

uint64_t sub_1C68E9CD8()
{
  return MEMORY[0x1F40E5938]();
}

uint64_t sub_1C68E9CE8()
{
  return MEMORY[0x1F40E5950]();
}

uint64_t sub_1C68E9CF8()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1C68E9D08()
{
  return MEMORY[0x1F40E5998]();
}

uint64_t sub_1C68E9D18()
{
  return MEMORY[0x1F40E59A0]();
}

uint64_t sub_1C68E9D28()
{
  return MEMORY[0x1F40E59D0]();
}

uint64_t sub_1C68E9D38()
{
  return MEMORY[0x1F40E5A30]();
}

uint64_t sub_1C68E9D48()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1C68E9D58()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1C68E9D68()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1C68E9D78()
{
  return MEMORY[0x1F40E5A78]();
}

uint64_t sub_1C68E9D88()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C68E9D98()
{
  return MEMORY[0x1F40E5AC0]();
}

uint64_t sub_1C68E9DA8()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1C68E9DB8()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C68E9DC8()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1C68E9DD8()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C68E9DE8()
{
  return MEMORY[0x1F40E5CC0]();
}

uint64_t sub_1C68E9DF8()
{
  return MEMORY[0x1F40E5CE0]();
}

uint64_t sub_1C68E9E08()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1C68E9E18()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1C68E9E28()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C68E9E38()
{
  return MEMORY[0x1F413F030]();
}

uint64_t sub_1C68E9E48()
{
  return MEMORY[0x1F413C760]();
}

uint64_t sub_1C68E9E58()
{
  return MEMORY[0x1F413C770]();
}

uint64_t sub_1C68E9E68()
{
  return MEMORY[0x1F413CAD8]();
}

uint64_t sub_1C68E9E78()
{
  return MEMORY[0x1F413CB68]();
}

uint64_t sub_1C68E9E88()
{
  return MEMORY[0x1F413CB70]();
}

uint64_t sub_1C68E9E98()
{
  return MEMORY[0x1F413CBE8]();
}

uint64_t sub_1C68E9EA8()
{
  return MEMORY[0x1F413CC78]();
}

uint64_t sub_1C68E9EB8()
{
  return MEMORY[0x1F413D318]();
}

uint64_t sub_1C68E9EC8()
{
  return MEMORY[0x1F413D320]();
}

uint64_t sub_1C68E9ED8()
{
  return MEMORY[0x1F413E5A8]();
}

uint64_t sub_1C68E9EE8()
{
  return MEMORY[0x1F413E5B0]();
}

uint64_t sub_1C68E9EF8()
{
  return MEMORY[0x1F413E708]();
}

uint64_t sub_1C68E9F08()
{
  return MEMORY[0x1F413E740]();
}

uint64_t sub_1C68E9F18()
{
  return MEMORY[0x1F413E948]();
}

uint64_t sub_1C68E9F28()
{
  return MEMORY[0x1F413E950]();
}

uint64_t sub_1C68E9F38()
{
  return MEMORY[0x1F413EA50]();
}

uint64_t sub_1C68E9F48()
{
  return MEMORY[0x1F413EA68]();
}

uint64_t sub_1C68E9F58()
{
  return MEMORY[0x1F413F070]();
}

uint64_t sub_1C68E9F68()
{
  return MEMORY[0x1F413F0C0]();
}

uint64_t sub_1C68E9F78()
{
  return MEMORY[0x1F413F0D0]();
}

uint64_t sub_1C68E9F88()
{
  return MEMORY[0x1F413F0D8]();
}

uint64_t sub_1C68E9F98()
{
  return MEMORY[0x1F413F148]();
}

uint64_t sub_1C68E9FA8()
{
  return MEMORY[0x1F413F150]();
}

uint64_t sub_1C68E9FC8()
{
  return MEMORY[0x1F410C8E8]();
}

uint64_t sub_1C68E9FD8()
{
  return MEMORY[0x1F410C8F8]();
}

uint64_t sub_1C68E9FE8()
{
  return MEMORY[0x1F4158A30]();
}

uint64_t sub_1C68E9FF8()
{
  return MEMORY[0x1F4158A38]();
}

uint64_t sub_1C68EA008()
{
  return MEMORY[0x1F4158A40]();
}

uint64_t sub_1C68EA018()
{
  return MEMORY[0x1F4158A48]();
}

uint64_t sub_1C68EA028()
{
  return MEMORY[0x1F4158A50]();
}

uint64_t sub_1C68EA038()
{
  return MEMORY[0x1F4158A58]();
}

uint64_t sub_1C68EA048()
{
  return MEMORY[0x1F4158A60]();
}

uint64_t sub_1C68EA058()
{
  return MEMORY[0x1F4158A68]();
}

uint64_t sub_1C68EA068()
{
  return MEMORY[0x1F4158A70]();
}

uint64_t sub_1C68EA078()
{
  return MEMORY[0x1F4158A78]();
}

uint64_t sub_1C68EA088()
{
  return MEMORY[0x1F4158A80]();
}

uint64_t sub_1C68EA0A8()
{
  return MEMORY[0x1F4158A98]();
}

uint64_t sub_1C68EA0B8()
{
  return MEMORY[0x1F4158AA0]();
}

uint64_t sub_1C68EA0C8()
{
  return MEMORY[0x1F4158AA8]();
}

uint64_t sub_1C68EA0E8()
{
  return MEMORY[0x1F4158AB8]();
}

uint64_t sub_1C68EA0F8()
{
  return MEMORY[0x1F4158AC0]();
}

uint64_t sub_1C68EA108()
{
  return MEMORY[0x1F4158AC8]();
}

uint64_t sub_1C68EA118()
{
  return MEMORY[0x1F4158AD0]();
}

uint64_t sub_1C68EA128()
{
  return MEMORY[0x1F4158AD8]();
}

uint64_t sub_1C68EA138()
{
  return MEMORY[0x1F4158AE0]();
}

uint64_t sub_1C68EA148()
{
  return MEMORY[0x1F4158AE8]();
}

uint64_t sub_1C68EA158()
{
  return MEMORY[0x1F4158AF0]();
}

uint64_t sub_1C68EA168()
{
  return MEMORY[0x1F4158AF8]();
}

uint64_t sub_1C68EA178()
{
  return MEMORY[0x1F4158B00]();
}

uint64_t sub_1C68EA188()
{
  return MEMORY[0x1F4158B08]();
}

uint64_t sub_1C68EA198()
{
  return MEMORY[0x1F4158B10]();
}

uint64_t sub_1C68EA1A8()
{
  return MEMORY[0x1F4158B18]();
}

uint64_t sub_1C68EA1B8()
{
  return MEMORY[0x1F4158B20]();
}

uint64_t sub_1C68EA1C8()
{
  return MEMORY[0x1F4158B28]();
}

uint64_t sub_1C68EA1D8()
{
  return MEMORY[0x1F4158B30]();
}

uint64_t sub_1C68EA1E8()
{
  return MEMORY[0x1F4158B38]();
}

uint64_t sub_1C68EA1F8()
{
  return MEMORY[0x1F4158B40]();
}

uint64_t sub_1C68EA208()
{
  return MEMORY[0x1F4158B48]();
}

uint64_t sub_1C68EA218()
{
  return MEMORY[0x1F4158B50]();
}

uint64_t sub_1C68EA228()
{
  return MEMORY[0x1F4158B58]();
}

uint64_t sub_1C68EA238()
{
  return MEMORY[0x1F4158B60]();
}

uint64_t sub_1C68EA248()
{
  return MEMORY[0x1F4158B68]();
}

uint64_t sub_1C68EA258()
{
  return MEMORY[0x1F4158B70]();
}

uint64_t sub_1C68EA268()
{
  return MEMORY[0x1F4158B78]();
}

uint64_t sub_1C68EA278()
{
  return MEMORY[0x1F4158B90]();
}

uint64_t sub_1C68EA288()
{
  return MEMORY[0x1F4158BB8]();
}

uint64_t sub_1C68EA298()
{
  return MEMORY[0x1F4158BC0]();
}

uint64_t sub_1C68EA2A8()
{
  return MEMORY[0x1F4158BC8]();
}

uint64_t sub_1C68EA2B8()
{
  return MEMORY[0x1F4158BD0]();
}

uint64_t sub_1C68EA2C8()
{
  return MEMORY[0x1F4158BD8]();
}

uint64_t sub_1C68EA2D8()
{
  return MEMORY[0x1F4158BE0]();
}

uint64_t sub_1C68EA2E8()
{
  return MEMORY[0x1F4158BE8]();
}

uint64_t sub_1C68EA2F8()
{
  return MEMORY[0x1F4158BF0]();
}

uint64_t sub_1C68EA308()
{
  return MEMORY[0x1F4158BF8]();
}

uint64_t sub_1C68EA328()
{
  return MEMORY[0x1F4158C28]();
}

uint64_t sub_1C68EA338()
{
  return MEMORY[0x1F4158C30]();
}

uint64_t sub_1C68EA348()
{
  return MEMORY[0x1F4158C38]();
}

uint64_t sub_1C68EA358()
{
  return MEMORY[0x1F4158C40]();
}

uint64_t sub_1C68EA368()
{
  return MEMORY[0x1F4158C48]();
}

uint64_t sub_1C68EA378()
{
  return MEMORY[0x1F4158C50]();
}

uint64_t sub_1C68EA388()
{
  return MEMORY[0x1F4158C58]();
}

uint64_t sub_1C68EA398()
{
  return MEMORY[0x1F4158C60]();
}

uint64_t sub_1C68EA3A8()
{
  return MEMORY[0x1F4158C68]();
}

uint64_t sub_1C68EA3B8()
{
  return MEMORY[0x1F4158C70]();
}

uint64_t sub_1C68EA3C8()
{
  return MEMORY[0x1F4158C78]();
}

uint64_t sub_1C68EA3D8()
{
  return MEMORY[0x1F4158C80]();
}

uint64_t sub_1C68EA3E8()
{
  return MEMORY[0x1F4158C88]();
}

uint64_t sub_1C68EA3F8()
{
  return MEMORY[0x1F4158C90]();
}

uint64_t sub_1C68EA408()
{
  return MEMORY[0x1F4158C98]();
}

uint64_t sub_1C68EA418()
{
  return MEMORY[0x1F4158CA0]();
}

uint64_t sub_1C68EA428()
{
  return MEMORY[0x1F4158CA8]();
}

uint64_t sub_1C68EA438()
{
  return MEMORY[0x1F4158CB0]();
}

uint64_t sub_1C68EA448()
{
  return MEMORY[0x1F4158CB8]();
}

uint64_t sub_1C68EA458()
{
  return MEMORY[0x1F4158CC0]();
}

uint64_t sub_1C68EA468()
{
  return MEMORY[0x1F4158CC8]();
}

uint64_t sub_1C68EA478()
{
  return MEMORY[0x1F4158D18]();
}

uint64_t sub_1C68EA488()
{
  return MEMORY[0x1F4158D20]();
}

uint64_t sub_1C68EA498()
{
  return MEMORY[0x1F4158D28]();
}

uint64_t sub_1C68EA4A8()
{
  return MEMORY[0x1F4158D30]();
}

uint64_t sub_1C68EA4B8()
{
  return MEMORY[0x1F4158D38]();
}

uint64_t sub_1C68EA4C8()
{
  return MEMORY[0x1F4158D40]();
}

uint64_t sub_1C68EA4D8()
{
  return MEMORY[0x1F410C928]();
}

uint64_t sub_1C68EA4E8()
{
  return MEMORY[0x1F410C940]();
}

uint64_t sub_1C68EA4F8()
{
  return MEMORY[0x1F410C998]();
}

uint64_t sub_1C68EA508()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1C68EA518()
{
  return MEMORY[0x1F4130438]();
}

uint64_t sub_1C68EA528()
{
  return MEMORY[0x1F4130440]();
}

uint64_t sub_1C68EA538()
{
  return MEMORY[0x1F4130448]();
}

uint64_t sub_1C68EA548()
{
  return MEMORY[0x1F4130450]();
}

uint64_t sub_1C68EA558()
{
  return MEMORY[0x1F4130458]();
}

uint64_t sub_1C68EA568()
{
  return MEMORY[0x1F4130460]();
}

uint64_t sub_1C68EA578()
{
  return MEMORY[0x1F4130468]();
}

uint64_t sub_1C68EA588()
{
  return MEMORY[0x1F4130470]();
}

uint64_t sub_1C68EA598()
{
  return MEMORY[0x1F4130478]();
}

uint64_t sub_1C68EA5A8()
{
  return MEMORY[0x1F4130480]();
}

uint64_t sub_1C68EA5B8()
{
  return MEMORY[0x1F4130488]();
}

uint64_t sub_1C68EA5C8()
{
  return MEMORY[0x1F4130490]();
}

uint64_t sub_1C68EA5D8()
{
  return MEMORY[0x1F4130498]();
}

uint64_t sub_1C68EA5E8()
{
  return MEMORY[0x1F41875C8]();
}

uint64_t sub_1C68EA5F8()
{
  return MEMORY[0x1F41875D0]();
}

uint64_t sub_1C68EA608()
{
  return MEMORY[0x1F41875F0]();
}

uint64_t sub_1C68EA618()
{
  return MEMORY[0x1F4187600]();
}

uint64_t sub_1C68EA628()
{
  return MEMORY[0x1F4187638]();
}

uint64_t sub_1C68EA638()
{
  return MEMORY[0x1F4187650]();
}

uint64_t sub_1C68EA648()
{
  return MEMORY[0x1F4154F40]();
}

uint64_t sub_1C68EA658()
{
  return MEMORY[0x1F4154F48]();
}

uint64_t sub_1C68EA668()
{
  return MEMORY[0x1F4154F60]();
}

uint64_t sub_1C68EA678()
{
  return MEMORY[0x1F4155160]();
}

uint64_t sub_1C68EA688()
{
  return MEMORY[0x1F4155168]();
}

uint64_t sub_1C68EA698()
{
  return MEMORY[0x1F4155170]();
}

uint64_t sub_1C68EA6A8()
{
  return MEMORY[0x1F41554C8]();
}

uint64_t sub_1C68EA6B8()
{
  return MEMORY[0x1F4155BC0]();
}

uint64_t sub_1C68EA6C8()
{
  return MEMORY[0x1F4155BC8]();
}

uint64_t sub_1C68EA6D8()
{
  return MEMORY[0x1F4155BD0]();
}

uint64_t sub_1C68EA6E8()
{
  return MEMORY[0x1F4155BD8]();
}

uint64_t sub_1C68EA6F8()
{
  return MEMORY[0x1F4155BF8]();
}

uint64_t sub_1C68EA708()
{
  return MEMORY[0x1F4155C00]();
}

uint64_t sub_1C68EA718()
{
  return MEMORY[0x1F4155C18]();
}

uint64_t sub_1C68EA728()
{
  return MEMORY[0x1F4155C20]();
}

uint64_t sub_1C68EA738()
{
  return MEMORY[0x1F4155C28]();
}

uint64_t sub_1C68EA748()
{
  return MEMORY[0x1F4155C30]();
}

uint64_t sub_1C68EA758()
{
  return MEMORY[0x1F4155C38]();
}

uint64_t sub_1C68EA768()
{
  return MEMORY[0x1F4155C40]();
}

uint64_t sub_1C68EA778()
{
  return MEMORY[0x1F4155C48]();
}

uint64_t sub_1C68EA788()
{
  return MEMORY[0x1F4155C50]();
}

uint64_t sub_1C68EA798()
{
  return MEMORY[0x1F4155C58]();
}

uint64_t sub_1C68EA7A8()
{
  return MEMORY[0x1F4155C60]();
}

uint64_t sub_1C68EA7B8()
{
  return MEMORY[0x1F4155C68]();
}

uint64_t sub_1C68EA7C8()
{
  return MEMORY[0x1F4155C70]();
}

uint64_t sub_1C68EA7D8()
{
  return MEMORY[0x1F4155C78]();
}

uint64_t sub_1C68EA7E8()
{
  return MEMORY[0x1F4155C80]();
}

uint64_t sub_1C68EA7F8()
{
  return MEMORY[0x1F4155CC0]();
}

uint64_t sub_1C68EA808()
{
  return MEMORY[0x1F4155CD0]();
}

uint64_t sub_1C68EA818()
{
  return MEMORY[0x1F4155D30]();
}

uint64_t sub_1C68EA828()
{
  return MEMORY[0x1F4155D38]();
}

uint64_t sub_1C68EA838()
{
  return MEMORY[0x1F4155D48]();
}

uint64_t sub_1C68EA848()
{
  return MEMORY[0x1F4155D58]();
}

uint64_t sub_1C68EA858()
{
  return MEMORY[0x1F4155D70]();
}

uint64_t sub_1C68EA868()
{
  return MEMORY[0x1F4155D90]();
}

uint64_t sub_1C68EA878()
{
  return MEMORY[0x1F4155D98]();
}

uint64_t sub_1C68EA888()
{
  return MEMORY[0x1F4155DA8]();
}

uint64_t sub_1C68EA898()
{
  return MEMORY[0x1F4155DE0]();
}

uint64_t sub_1C68EA8A8()
{
  return MEMORY[0x1F4155DE8]();
}

uint64_t sub_1C68EA8B8()
{
  return MEMORY[0x1F4155DF0]();
}

uint64_t sub_1C68EA8C8()
{
  return MEMORY[0x1F4155DF8]();
}

uint64_t sub_1C68EA8D8()
{
  return MEMORY[0x1F4155E18]();
}

uint64_t sub_1C68EA8E8()
{
  return MEMORY[0x1F4155E20]();
}

uint64_t sub_1C68EA8F8()
{
  return MEMORY[0x1F4155E38]();
}

uint64_t sub_1C68EA908()
{
  return MEMORY[0x1F4155E40]();
}

uint64_t sub_1C68EA918()
{
  return MEMORY[0x1F4155E48]();
}

uint64_t sub_1C68EA928()
{
  return MEMORY[0x1F4155E50]();
}

uint64_t sub_1C68EA938()
{
  return MEMORY[0x1F4155E70]();
}

uint64_t sub_1C68EA948()
{
  return MEMORY[0x1F4155E80]();
}

uint64_t sub_1C68EA958()
{
  return MEMORY[0x1F4155E88]();
}

uint64_t sub_1C68EA968()
{
  return MEMORY[0x1F4155E90]();
}

uint64_t sub_1C68EA978()
{
  return MEMORY[0x1F4155F50]();
}

uint64_t sub_1C68EA988()
{
  return MEMORY[0x1F4155F58]();
}

uint64_t sub_1C68EA998()
{
  return MEMORY[0x1F4155F60]();
}

uint64_t sub_1C68EA9A8()
{
  return MEMORY[0x1F4155F68]();
}

uint64_t sub_1C68EA9B8()
{
  return MEMORY[0x1F4155F70]();
}

uint64_t sub_1C68EA9C8()
{
  return MEMORY[0x1F4155F78]();
}

uint64_t sub_1C68EA9D8()
{
  return MEMORY[0x1F4155F80]();
}

uint64_t sub_1C68EA9E8()
{
  return MEMORY[0x1F4155F88]();
}

uint64_t sub_1C68EA9F8()
{
  return MEMORY[0x1F4155F98]();
}

uint64_t sub_1C68EAA08()
{
  return MEMORY[0x1F4155FA0]();
}

uint64_t sub_1C68EAA18()
{
  return MEMORY[0x1F4155FA8]();
}

uint64_t sub_1C68EAA28()
{
  return MEMORY[0x1F4155FB0]();
}

uint64_t sub_1C68EAA38()
{
  return MEMORY[0x1F4155FB8]();
}

uint64_t sub_1C68EAA48()
{
  return MEMORY[0x1F4155FC0]();
}

uint64_t sub_1C68EAA58()
{
  return MEMORY[0x1F4155FC8]();
}

uint64_t sub_1C68EAA68()
{
  return MEMORY[0x1F4155FD0]();
}

uint64_t sub_1C68EAA78()
{
  return MEMORY[0x1F4155FF0]();
}

uint64_t sub_1C68EAA88()
{
  return MEMORY[0x1F4155FF8]();
}

uint64_t sub_1C68EAA98()
{
  return MEMORY[0x1F4156000]();
}

uint64_t sub_1C68EAAA8()
{
  return MEMORY[0x1F4156008]();
}

uint64_t sub_1C68EAAB8()
{
  return MEMORY[0x1F4156010]();
}

uint64_t sub_1C68EAAC8()
{
  return MEMORY[0x1F4156018]();
}

uint64_t sub_1C68EAAD8()
{
  return MEMORY[0x1F4156020]();
}

uint64_t sub_1C68EAAE8()
{
  return MEMORY[0x1F4156028]();
}

uint64_t sub_1C68EAAF8()
{
  return MEMORY[0x1F4156030]();
}

uint64_t sub_1C68EAB08()
{
  return MEMORY[0x1F4156038]();
}

uint64_t sub_1C68EAB18()
{
  return MEMORY[0x1F4156040]();
}

uint64_t sub_1C68EAB28()
{
  return MEMORY[0x1F4156048]();
}

uint64_t sub_1C68EAB38()
{
  return MEMORY[0x1F4156050]();
}

uint64_t sub_1C68EAB48()
{
  return MEMORY[0x1F4156058]();
}

uint64_t sub_1C68EAB58()
{
  return MEMORY[0x1F4156060]();
}

uint64_t sub_1C68EAB68()
{
  return MEMORY[0x1F4156068]();
}

uint64_t sub_1C68EAB78()
{
  return MEMORY[0x1F4156070]();
}

uint64_t sub_1C68EAB88()
{
  return MEMORY[0x1F4156078]();
}

uint64_t sub_1C68EAB98()
{
  return MEMORY[0x1F4156080]();
}

uint64_t sub_1C68EABA8()
{
  return MEMORY[0x1F4156088]();
}

uint64_t sub_1C68EABB8()
{
  return MEMORY[0x1F4156090]();
}

uint64_t sub_1C68EABC8()
{
  return MEMORY[0x1F4156098]();
}

uint64_t sub_1C68EABD8()
{
  return MEMORY[0x1F41560A8]();
}

uint64_t sub_1C68EABE8()
{
  return MEMORY[0x1F41560B0]();
}

uint64_t sub_1C68EABF8()
{
  return MEMORY[0x1F41560B8]();
}

uint64_t sub_1C68EAC08()
{
  return MEMORY[0x1F41560C0]();
}

uint64_t sub_1C68EAC18()
{
  return MEMORY[0x1F41560C8]();
}

uint64_t sub_1C68EAC28()
{
  return MEMORY[0x1F41560D0]();
}

uint64_t sub_1C68EAC38()
{
  return MEMORY[0x1F41560D8]();
}

uint64_t sub_1C68EAC48()
{
  return MEMORY[0x1F41560E0]();
}

uint64_t sub_1C68EAC58()
{
  return MEMORY[0x1F41560E8]();
}

uint64_t sub_1C68EAC68()
{
  return MEMORY[0x1F41560F0]();
}

uint64_t sub_1C68EAC78()
{
  return MEMORY[0x1F41560F8]();
}

uint64_t sub_1C68EAC88()
{
  return MEMORY[0x1F4156120]();
}

uint64_t sub_1C68EAC98()
{
  return MEMORY[0x1F4156150]();
}

uint64_t sub_1C68EACA8()
{
  return MEMORY[0x1F4156158]();
}

uint64_t sub_1C68EACB8()
{
  return MEMORY[0x1F4156160]();
}

uint64_t sub_1C68EACC8()
{
  return MEMORY[0x1F4156168]();
}

uint64_t sub_1C68EACD8()
{
  return MEMORY[0x1F4156170]();
}

uint64_t sub_1C68EACE8()
{
  return MEMORY[0x1F4156178]();
}

uint64_t sub_1C68EACF8()
{
  return MEMORY[0x1F4156180]();
}

uint64_t sub_1C68EAD08()
{
  return MEMORY[0x1F4156188]();
}

uint64_t sub_1C68EAD18()
{
  return MEMORY[0x1F4156190]();
}

uint64_t sub_1C68EAD28()
{
  return MEMORY[0x1F4156198]();
}

uint64_t sub_1C68EAD38()
{
  return MEMORY[0x1F41561A0]();
}

uint64_t sub_1C68EAD48()
{
  return MEMORY[0x1F41561A8]();
}

uint64_t sub_1C68EAD58()
{
  return MEMORY[0x1F41561B0]();
}

uint64_t sub_1C68EAD68()
{
  return MEMORY[0x1F41561B8]();
}

uint64_t sub_1C68EAD78()
{
  return MEMORY[0x1F41561C0]();
}

uint64_t sub_1C68EAD88()
{
  return MEMORY[0x1F41561C8]();
}

uint64_t sub_1C68EAD98()
{
  return MEMORY[0x1F41561D0]();
}

uint64_t sub_1C68EADA8()
{
  return MEMORY[0x1F41561D8]();
}

uint64_t sub_1C68EADB8()
{
  return MEMORY[0x1F41561F8]();
}

uint64_t sub_1C68EADC8()
{
  return MEMORY[0x1F4156210]();
}

uint64_t sub_1C68EADD8()
{
  return MEMORY[0x1F4156220]();
}

uint64_t sub_1C68EADE8()
{
  return MEMORY[0x1F4156248]();
}

uint64_t sub_1C68EADF8()
{
  return MEMORY[0x1F4156250]();
}

uint64_t sub_1C68EAE08()
{
  return MEMORY[0x1F4156258]();
}

uint64_t sub_1C68EAE18()
{
  return MEMORY[0x1F4156260]();
}

uint64_t sub_1C68EAE28()
{
  return MEMORY[0x1F4156270]();
}

uint64_t sub_1C68EAE38()
{
  return MEMORY[0x1F4156278]();
}

uint64_t sub_1C68EAE48()
{
  return MEMORY[0x1F4156280]();
}

uint64_t sub_1C68EAE58()
{
  return MEMORY[0x1F4156288]();
}

uint64_t sub_1C68EAE68()
{
  return MEMORY[0x1F4156290]();
}

uint64_t sub_1C68EAE78()
{
  return MEMORY[0x1F4156298]();
}

uint64_t sub_1C68EAE88()
{
  return MEMORY[0x1F41562A0]();
}

uint64_t sub_1C68EAE98()
{
  return MEMORY[0x1F41562A8]();
}

uint64_t sub_1C68EAEA8()
{
  return MEMORY[0x1F41562B0]();
}

uint64_t sub_1C68EAEB8()
{
  return MEMORY[0x1F41562B8]();
}

uint64_t sub_1C68EAEC8()
{
  return MEMORY[0x1F4156330]();
}

uint64_t sub_1C68EAED8()
{
  return MEMORY[0x1F4156338]();
}

uint64_t sub_1C68EAEE8()
{
  return MEMORY[0x1F4156340]();
}

uint64_t sub_1C68EAEF8()
{
  return MEMORY[0x1F4156348]();
}

uint64_t sub_1C68EAF08()
{
  return MEMORY[0x1F4156350]();
}

uint64_t sub_1C68EAF18()
{
  return MEMORY[0x1F4156410]();
}

uint64_t sub_1C68EAF28()
{
  return MEMORY[0x1F4156418]();
}

uint64_t sub_1C68EAF38()
{
  return MEMORY[0x1F4156420]();
}

uint64_t sub_1C68EAF48()
{
  return MEMORY[0x1F4156428]();
}

uint64_t sub_1C68EAF58()
{
  return MEMORY[0x1F4156430]();
}

uint64_t sub_1C68EAF68()
{
  return MEMORY[0x1F4156438]();
}

uint64_t sub_1C68EAF78()
{
  return MEMORY[0x1F4156440]();
}

uint64_t sub_1C68EAF88()
{
  return MEMORY[0x1F4156448]();
}

uint64_t sub_1C68EAF98()
{
  return MEMORY[0x1F4156450]();
}

uint64_t sub_1C68EAFA8()
{
  return MEMORY[0x1F4156458]();
}

uint64_t sub_1C68EAFB8()
{
  return MEMORY[0x1F4156460]();
}

uint64_t sub_1C68EAFC8()
{
  return MEMORY[0x1F4156468]();
}

uint64_t sub_1C68EAFD8()
{
  return MEMORY[0x1F4156470]();
}

uint64_t sub_1C68EAFE8()
{
  return MEMORY[0x1F4156478]();
}

uint64_t sub_1C68EAFF8()
{
  return MEMORY[0x1F4156480]();
}

uint64_t sub_1C68EB008()
{
  return MEMORY[0x1F4156490]();
}

uint64_t sub_1C68EB018()
{
  return MEMORY[0x1F4156498]();
}

uint64_t sub_1C68EB028()
{
  return MEMORY[0x1F41564A0]();
}

uint64_t sub_1C68EB038()
{
  return MEMORY[0x1F41564A8]();
}

uint64_t sub_1C68EB048()
{
  return MEMORY[0x1F41564B0]();
}

uint64_t sub_1C68EB058()
{
  return MEMORY[0x1F41564B8]();
}

uint64_t sub_1C68EB068()
{
  return MEMORY[0x1F41564C8]();
}

uint64_t sub_1C68EB078()
{
  return MEMORY[0x1F41564D0]();
}

uint64_t sub_1C68EB088()
{
  return MEMORY[0x1F41564D8]();
}

uint64_t sub_1C68EB098()
{
  return MEMORY[0x1F41564F0]();
}

uint64_t sub_1C68EB0A8()
{
  return MEMORY[0x1F41564F8]();
}

uint64_t sub_1C68EB0B8()
{
  return MEMORY[0x1F4156500]();
}

uint64_t sub_1C68EB0C8()
{
  return MEMORY[0x1F4156508]();
}

uint64_t sub_1C68EB0D8()
{
  return MEMORY[0x1F4156510]();
}

uint64_t sub_1C68EB0E8()
{
  return MEMORY[0x1F4156518]();
}

uint64_t sub_1C68EB0F8()
{
  return MEMORY[0x1F4156520]();
}

uint64_t sub_1C68EB108()
{
  return MEMORY[0x1F4156528]();
}

uint64_t sub_1C68EB118()
{
  return MEMORY[0x1F4156530]();
}

uint64_t sub_1C68EB128()
{
  return MEMORY[0x1F4156540]();
}

uint64_t sub_1C68EB138()
{
  return MEMORY[0x1F4156548]();
}

uint64_t sub_1C68EB148()
{
  return MEMORY[0x1F4156558]();
}

uint64_t sub_1C68EB158()
{
  return MEMORY[0x1F4156560]();
}

uint64_t sub_1C68EB168()
{
  return MEMORY[0x1F4156570]();
}

uint64_t sub_1C68EB178()
{
  return MEMORY[0x1F4156578]();
}

uint64_t sub_1C68EB188()
{
  return MEMORY[0x1F4156598]();
}

uint64_t sub_1C68EB198()
{
  return MEMORY[0x1F41565A0]();
}

uint64_t sub_1C68EB1A8()
{
  return MEMORY[0x1F41565F8]();
}

uint64_t sub_1C68EB1B8()
{
  return MEMORY[0x1F4156618]();
}

uint64_t sub_1C68EB1C8()
{
  return MEMORY[0x1F4156620]();
}

uint64_t sub_1C68EB1D8()
{
  return MEMORY[0x1F4156628]();
}

uint64_t sub_1C68EB1E8()
{
  return MEMORY[0x1F4156630]();
}

uint64_t sub_1C68EB1F8()
{
  return MEMORY[0x1F4156638]();
}

uint64_t sub_1C68EB208()
{
  return MEMORY[0x1F4156640]();
}

uint64_t sub_1C68EB218()
{
  return MEMORY[0x1F4156650]();
}

uint64_t sub_1C68EB228()
{
  return MEMORY[0x1F4156658]();
}

uint64_t sub_1C68EB238()
{
  return MEMORY[0x1F4156668]();
}

uint64_t sub_1C68EB248()
{
  return MEMORY[0x1F4156670]();
}

uint64_t sub_1C68EB258()
{
  return MEMORY[0x1F4156678]();
}

uint64_t sub_1C68EB268()
{
  return MEMORY[0x1F4156680]();
}

uint64_t sub_1C68EB278()
{
  return MEMORY[0x1F4156688]();
}

uint64_t sub_1C68EB288()
{
  return MEMORY[0x1F4156690]();
}

uint64_t sub_1C68EB298()
{
  return MEMORY[0x1F4156730]();
}

uint64_t sub_1C68EB2A8()
{
  return MEMORY[0x1F4156738]();
}

uint64_t sub_1C68EB2B8()
{
  return MEMORY[0x1F4156740]();
}

uint64_t sub_1C68EB2C8()
{
  return MEMORY[0x1F4156820]();
}

uint64_t sub_1C68EB2D8()
{
  return MEMORY[0x1F4156828]();
}

uint64_t sub_1C68EB2E8()
{
  return MEMORY[0x1F4156830]();
}

uint64_t sub_1C68EB2F8()
{
  return MEMORY[0x1F4156838]();
}

uint64_t sub_1C68EB308()
{
  return MEMORY[0x1F4156840]();
}

uint64_t sub_1C68EB318()
{
  return MEMORY[0x1F4156848]();
}

uint64_t sub_1C68EB328()
{
  return MEMORY[0x1F4156850]();
}

uint64_t sub_1C68EB338()
{
  return MEMORY[0x1F4156858]();
}

uint64_t sub_1C68EB348()
{
  return MEMORY[0x1F41568E8]();
}

uint64_t sub_1C68EB358()
{
  return MEMORY[0x1F41568F0]();
}

uint64_t sub_1C68EB368()
{
  return MEMORY[0x1F41568F8]();
}

uint64_t sub_1C68EB378()
{
  return MEMORY[0x1F4156900]();
}

uint64_t sub_1C68EB388()
{
  return MEMORY[0x1F4156908]();
}

uint64_t sub_1C68EB398()
{
  return MEMORY[0x1F4156990]();
}

uint64_t sub_1C68EB3A8()
{
  return MEMORY[0x1F4156998]();
}

uint64_t sub_1C68EB3B8()
{
  return MEMORY[0x1F41569A0]();
}

uint64_t sub_1C68EB3C8()
{
  return MEMORY[0x1F41569A8]();
}

uint64_t sub_1C68EB3D8()
{
  return MEMORY[0x1F4156A08]();
}

uint64_t sub_1C68EB3E8()
{
  return MEMORY[0x1F4156A48]();
}

uint64_t sub_1C68EB3F8()
{
  return MEMORY[0x1F4156A58]();
}

uint64_t sub_1C68EB408()
{
  return MEMORY[0x1F4156A68]();
}

uint64_t sub_1C68EB418()
{
  return MEMORY[0x1F4156A70]();
}

uint64_t sub_1C68EB428()
{
  return MEMORY[0x1F4156B08]();
}

uint64_t sub_1C68EB438()
{
  return MEMORY[0x1F4156B10]();
}

uint64_t sub_1C68EB448()
{
  return MEMORY[0x1F4156B18]();
}

uint64_t sub_1C68EB458()
{
  return MEMORY[0x1F4156B28]();
}

uint64_t sub_1C68EB468()
{
  return MEMORY[0x1F4156B30]();
}

uint64_t sub_1C68EB478()
{
  return MEMORY[0x1F4156B38]();
}

uint64_t sub_1C68EB488()
{
  return MEMORY[0x1F4156B40]();
}

uint64_t sub_1C68EB498()
{
  return MEMORY[0x1F4156B48]();
}

uint64_t sub_1C68EB4A8()
{
  return MEMORY[0x1F4156B50]();
}

uint64_t sub_1C68EB4B8()
{
  return MEMORY[0x1F4156B60]();
}

uint64_t sub_1C68EB4C8()
{
  return MEMORY[0x1F4156B68]();
}

uint64_t sub_1C68EB4D8()
{
  return MEMORY[0x1F4156B70]();
}

uint64_t sub_1C68EB4E8()
{
  return MEMORY[0x1F4156B78]();
}

uint64_t sub_1C68EB4F8()
{
  return MEMORY[0x1F4156B80]();
}

uint64_t sub_1C68EB508()
{
  return MEMORY[0x1F4156B88]();
}

uint64_t sub_1C68EB518()
{
  return MEMORY[0x1F4156B90]();
}

uint64_t sub_1C68EB528()
{
  return MEMORY[0x1F4156BD0]();
}

uint64_t sub_1C68EB538()
{
  return MEMORY[0x1F4156C60]();
}

uint64_t sub_1C68EB548()
{
  return MEMORY[0x1F4156C68]();
}

uint64_t sub_1C68EB558()
{
  return MEMORY[0x1F4156D58]();
}

uint64_t sub_1C68EB568()
{
  return MEMORY[0x1F4156D60]();
}

uint64_t sub_1C68EB578()
{
  return MEMORY[0x1F4156D88]();
}

uint64_t sub_1C68EB588()
{
  return MEMORY[0x1F4156D90]();
}

uint64_t sub_1C68EB598()
{
  return MEMORY[0x1F4156D98]();
}

uint64_t sub_1C68EB5A8()
{
  return MEMORY[0x1F4156DA0]();
}

uint64_t sub_1C68EB5B8()
{
  return MEMORY[0x1F4156DA8]();
}

uint64_t sub_1C68EB5C8()
{
  return MEMORY[0x1F4156DB0]();
}

uint64_t sub_1C68EB5D8()
{
  return MEMORY[0x1F4156DB8]();
}

uint64_t sub_1C68EB5E8()
{
  return MEMORY[0x1F4156DC0]();
}

uint64_t sub_1C68EB5F8()
{
  return MEMORY[0x1F4156DC8]();
}

uint64_t sub_1C68EB608()
{
  return MEMORY[0x1F4156DD0]();
}

uint64_t sub_1C68EB618()
{
  return MEMORY[0x1F4156DD8]();
}

uint64_t sub_1C68EB628()
{
  return MEMORY[0x1F4156F30]();
}

uint64_t sub_1C68EB638()
{
  return MEMORY[0x1F4156F38]();
}

uint64_t sub_1C68EB648()
{
  return MEMORY[0x1F4156F40]();
}

uint64_t sub_1C68EB658()
{
  return MEMORY[0x1F4156F48]();
}

uint64_t sub_1C68EB668()
{
  return MEMORY[0x1F4156F50]();
}

uint64_t sub_1C68EB678()
{
  return MEMORY[0x1F4156F58]();
}

uint64_t sub_1C68EB688()
{
  return MEMORY[0x1F4156F60]();
}

uint64_t sub_1C68EB698()
{
  return MEMORY[0x1F4156F68]();
}

uint64_t sub_1C68EB6A8()
{
  return MEMORY[0x1F4156F70]();
}

uint64_t sub_1C68EB6B8()
{
  return MEMORY[0x1F4156F78]();
}

uint64_t sub_1C68EB6C8()
{
  return MEMORY[0x1F4156F80]();
}

uint64_t sub_1C68EB6D8()
{
  return MEMORY[0x1F4156F88]();
}

uint64_t sub_1C68EB6E8()
{
  return MEMORY[0x1F4156F90]();
}

uint64_t sub_1C68EB6F8()
{
  return MEMORY[0x1F4156F98]();
}

uint64_t sub_1C68EB708()
{
  return MEMORY[0x1F4156FA0]();
}

uint64_t sub_1C68EB718()
{
  return MEMORY[0x1F4156FA8]();
}

uint64_t sub_1C68EB728()
{
  return MEMORY[0x1F4156FB0]();
}

uint64_t sub_1C68EB738()
{
  return MEMORY[0x1F4157030]();
}

uint64_t sub_1C68EB748()
{
  return MEMORY[0x1F4157038]();
}

uint64_t sub_1C68EB758()
{
  return MEMORY[0x1F4157040]();
}

uint64_t sub_1C68EB768()
{
  return MEMORY[0x1F4157048]();
}

uint64_t sub_1C68EB778()
{
  return MEMORY[0x1F4157050]();
}

uint64_t sub_1C68EB788()
{
  return MEMORY[0x1F4157058]();
}

uint64_t sub_1C68EB798()
{
  return MEMORY[0x1F41570B8]();
}

uint64_t sub_1C68EB7A8()
{
  return MEMORY[0x1F41570C0]();
}

uint64_t sub_1C68EB7B8()
{
  return MEMORY[0x1F41570C8]();
}

uint64_t sub_1C68EB7C8()
{
  return MEMORY[0x1F41570D0]();
}

uint64_t sub_1C68EB7D8()
{
  return MEMORY[0x1F41570F8]();
}

uint64_t sub_1C68EB7E8()
{
  return MEMORY[0x1F4157100]();
}

uint64_t sub_1C68EB7F8()
{
  return MEMORY[0x1F4157108]();
}

uint64_t sub_1C68EB808()
{
  return MEMORY[0x1F41571A0]();
}

uint64_t sub_1C68EB818()
{
  return MEMORY[0x1F41571A8]();
}

uint64_t sub_1C68EB828()
{
  return MEMORY[0x1F41571B0]();
}

uint64_t sub_1C68EB838()
{
  return MEMORY[0x1F41571B8]();
}

uint64_t sub_1C68EB848()
{
  return MEMORY[0x1F41571E8]();
}

uint64_t sub_1C68EB858()
{
  return MEMORY[0x1F41571F0]();
}

uint64_t sub_1C68EB868()
{
  return MEMORY[0x1F41572B0]();
}

uint64_t sub_1C68EB878()
{
  return MEMORY[0x1F41572B8]();
}

uint64_t sub_1C68EB888()
{
  return MEMORY[0x1F41572C0]();
}

uint64_t sub_1C68EB898()
{
  return MEMORY[0x1F41572C8]();
}

uint64_t sub_1C68EB8A8()
{
  return MEMORY[0x1F4157448]();
}

uint64_t sub_1C68EB8B8()
{
  return MEMORY[0x1F41574B8]();
}

uint64_t sub_1C68EB8C8()
{
  return MEMORY[0x1F41575A8]();
}

uint64_t sub_1C68EB8D8()
{
  return MEMORY[0x1F41575C8]();
}

uint64_t sub_1C68EB8E8()
{
  return MEMORY[0x1F41575D0]();
}

uint64_t sub_1C68EB8F8()
{
  return MEMORY[0x1F41575D8]();
}

uint64_t sub_1C68EB908()
{
  return MEMORY[0x1F41575E0]();
}

uint64_t sub_1C68EB918()
{
  return MEMORY[0x1F41575E8]();
}

uint64_t sub_1C68EB928()
{
  return MEMORY[0x1F41575F0]();
}

uint64_t sub_1C68EB938()
{
  return MEMORY[0x1F41575F8]();
}

uint64_t sub_1C68EB948()
{
  return MEMORY[0x1F4157600]();
}

uint64_t sub_1C68EB958()
{
  return MEMORY[0x1F4157640]();
}

uint64_t sub_1C68EB968()
{
  return MEMORY[0x1F4157650]();
}

uint64_t sub_1C68EB978()
{
  return MEMORY[0x1F4157678]();
}

uint64_t sub_1C68EB988()
{
  return MEMORY[0x1F41582B8]();
}

uint64_t sub_1C68EB998()
{
  return MEMORY[0x1F4157698]();
}

uint64_t sub_1C68EB9A8()
{
  return MEMORY[0x1F4167740]();
}

uint64_t sub_1C68EB9B8()
{
  return MEMORY[0x1F4167778]();
}

uint64_t sub_1C68EB9C8()
{
  return MEMORY[0x1F41677D8]();
}

uint64_t sub_1C68EB9D8()
{
  return MEMORY[0x1F41677F8]();
}

uint64_t sub_1C68EB9E8()
{
  return MEMORY[0x1F4167800]();
}

uint64_t sub_1C68EB9F8()
{
  return MEMORY[0x1F4158388]();
}

uint64_t sub_1C68EBA08()
{
  return MEMORY[0x1F41583B0]();
}

uint64_t sub_1C68EBA18()
{
  return MEMORY[0x1F41583B8]();
}

uint64_t sub_1C68EBA28()
{
  return MEMORY[0x1F41583C8]();
}

uint64_t sub_1C68EBA38()
{
  return MEMORY[0x1F41583E0]();
}

uint64_t sub_1C68EBA48()
{
  return MEMORY[0x1F41583E8]();
}

uint64_t sub_1C68EBA58()
{
  return MEMORY[0x1F41583F0]();
}

uint64_t sub_1C68EBA68()
{
  return MEMORY[0x1F41583F8]();
}

uint64_t sub_1C68EBA78()
{
  return MEMORY[0x1F4158400]();
}

uint64_t sub_1C68EBA88()
{
  return MEMORY[0x1F4158408]();
}

uint64_t sub_1C68EBA98()
{
  return MEMORY[0x1F4158410]();
}

uint64_t sub_1C68EBAA8()
{
  return MEMORY[0x1F4158418]();
}

uint64_t sub_1C68EBAB8()
{
  return MEMORY[0x1F4158420]();
}

uint64_t sub_1C68EBAC8()
{
  return MEMORY[0x1F4158430]();
}

uint64_t sub_1C68EBAD8()
{
  return MEMORY[0x1F4158440]();
}

uint64_t sub_1C68EBAE8()
{
  return MEMORY[0x1F4158448]();
}

uint64_t sub_1C68EBAF8()
{
  return MEMORY[0x1F4158450]();
}

uint64_t sub_1C68EBB08()
{
  return MEMORY[0x1F4158458]();
}

uint64_t sub_1C68EBB18()
{
  return MEMORY[0x1F4158460]();
}

uint64_t sub_1C68EBB28()
{
  return MEMORY[0x1F4158468]();
}

uint64_t sub_1C68EBB38()
{
  return MEMORY[0x1F4158470]();
}

uint64_t sub_1C68EBB48()
{
  return MEMORY[0x1F4158478]();
}

uint64_t sub_1C68EBB58()
{
  return MEMORY[0x1F4158488]();
}

uint64_t sub_1C68EBB68()
{
  return MEMORY[0x1F4158490]();
}

uint64_t sub_1C68EBB78()
{
  return MEMORY[0x1F4158498]();
}

uint64_t sub_1C68EBB88()
{
  return MEMORY[0x1F41584A8]();
}

uint64_t sub_1C68EBB98()
{
  return MEMORY[0x1F41584B0]();
}

uint64_t sub_1C68EBBA8()
{
  return MEMORY[0x1F41584B8]();
}

uint64_t sub_1C68EBBB8()
{
  return MEMORY[0x1F41584C0]();
}

uint64_t sub_1C68EBBC8()
{
  return MEMORY[0x1F41584C8]();
}

uint64_t sub_1C68EBBD8()
{
  return MEMORY[0x1F41584D0]();
}

uint64_t sub_1C68EBBE8()
{
  return MEMORY[0x1F41584D8]();
}

uint64_t sub_1C68EBBF8()
{
  return MEMORY[0x1F41584E0]();
}

uint64_t sub_1C68EBC08()
{
  return MEMORY[0x1F41584E8]();
}

uint64_t sub_1C68EBC18()
{
  return MEMORY[0x1F4158500]();
}

uint64_t sub_1C68EBC28()
{
  return MEMORY[0x1F4158508]();
}

uint64_t sub_1C68EBC38()
{
  return MEMORY[0x1F4158510]();
}

uint64_t sub_1C68EBC48()
{
  return MEMORY[0x1F4158518]();
}

uint64_t sub_1C68EBC58()
{
  return MEMORY[0x1F4158520]();
}

uint64_t sub_1C68EBC68()
{
  return MEMORY[0x1F4158530]();
}

uint64_t sub_1C68EBC78()
{
  return MEMORY[0x1F4158538]();
}

uint64_t sub_1C68EBC88()
{
  return MEMORY[0x1F4158548]();
}

uint64_t sub_1C68EBC98()
{
  return MEMORY[0x1F4158550]();
}

uint64_t sub_1C68EBCA8()
{
  return MEMORY[0x1F4158568]();
}

uint64_t sub_1C68EBCB8()
{
  return MEMORY[0x1F4158570]();
}

uint64_t sub_1C68EBCC8()
{
  return MEMORY[0x1F4158578]();
}

uint64_t sub_1C68EBCD8()
{
  return MEMORY[0x1F4158588]();
}

uint64_t sub_1C68EBCE8()
{
  return MEMORY[0x1F41585A0]();
}

uint64_t sub_1C68EBCF8()
{
  return MEMORY[0x1F41585B0]();
}

uint64_t sub_1C68EBD08()
{
  return MEMORY[0x1F41585C0]();
}

uint64_t sub_1C68EBD18()
{
  return MEMORY[0x1F41585D0]();
}

uint64_t sub_1C68EBD28()
{
  return MEMORY[0x1F41585D8]();
}

uint64_t sub_1C68EBD38()
{
  return MEMORY[0x1F41585E0]();
}

uint64_t sub_1C68EBD48()
{
  return MEMORY[0x1F41585E8]();
}

uint64_t sub_1C68EBD58()
{
  return MEMORY[0x1F41585F0]();
}

uint64_t sub_1C68EBD68()
{
  return MEMORY[0x1F41585F8]();
}

uint64_t sub_1C68EBD78()
{
  return MEMORY[0x1F4158600]();
}

uint64_t sub_1C68EBD88()
{
  return MEMORY[0x1F4158608]();
}

uint64_t sub_1C68EBD98()
{
  return MEMORY[0x1F4158628]();
}

uint64_t sub_1C68EBDA8()
{
  return MEMORY[0x1F4158630]();
}

uint64_t sub_1C68EBDB8()
{
  return MEMORY[0x1F4158638]();
}

uint64_t sub_1C68EBDC8()
{
  return MEMORY[0x1F4158640]();
}

uint64_t sub_1C68EBDD8()
{
  return MEMORY[0x1F4158648]();
}

uint64_t sub_1C68EBDE8()
{
  return MEMORY[0x1F4158650]();
}

uint64_t sub_1C68EBDF8()
{
  return MEMORY[0x1F4158658]();
}

uint64_t sub_1C68EBE08()
{
  return MEMORY[0x1F4158660]();
}

uint64_t sub_1C68EBE18()
{
  return MEMORY[0x1F41586D0]();
}

uint64_t sub_1C68EBE28()
{
  return MEMORY[0x1F41586D8]();
}

uint64_t sub_1C68EBE38()
{
  return MEMORY[0x1F41586E0]();
}

uint64_t sub_1C68EBE48()
{
  return MEMORY[0x1F41586E8]();
}

uint64_t sub_1C68EBE58()
{
  return MEMORY[0x1F41586F0]();
}

uint64_t sub_1C68EBE68()
{
  return MEMORY[0x1F4158708]();
}

uint64_t sub_1C68EBE78()
{
  return MEMORY[0x1F41508C8]();
}

uint64_t sub_1C68EBE88()
{
  return MEMORY[0x1F415AAB0]();
}

uint64_t sub_1C68EBE98()
{
  return MEMORY[0x1F415AAC0]();
}

uint64_t sub_1C68EBEA8()
{
  return MEMORY[0x1F415AAE8]();
}

uint64_t sub_1C68EBEB8()
{
  return MEMORY[0x1F415AAF8]();
}

uint64_t sub_1C68EBEC8()
{
  return MEMORY[0x1F415AC90]();
}

uint64_t sub_1C68EBED8()
{
  return MEMORY[0x1F4151560]();
}

uint64_t sub_1C68EBEE8()
{
  return MEMORY[0x1F4151570]();
}

uint64_t sub_1C68EBEF8()
{
  return MEMORY[0x1F4151578]();
}

uint64_t sub_1C68EBF08()
{
  return MEMORY[0x1F4151580]();
}

uint64_t sub_1C68EBF18()
{
  return MEMORY[0x1F4151588]();
}

uint64_t sub_1C68EBF28()
{
  return MEMORY[0x1F4151590]();
}

uint64_t sub_1C68EBF38()
{
  return MEMORY[0x1F41515D0]();
}

uint64_t sub_1C68EBF48()
{
  return MEMORY[0x1F41515D8]();
}

uint64_t sub_1C68EBF58()
{
  return MEMORY[0x1F41515E0]();
}

uint64_t sub_1C68EBF68()
{
  return MEMORY[0x1F41515F0]();
}

uint64_t sub_1C68EBF78()
{
  return MEMORY[0x1F4151600]();
}

uint64_t sub_1C68EBF88()
{
  return MEMORY[0x1F4151608]();
}

uint64_t sub_1C68EBF98()
{
  return MEMORY[0x1F4151618]();
}

uint64_t sub_1C68EBFA8()
{
  return MEMORY[0x1F4151620]();
}

uint64_t sub_1C68EBFB8()
{
  return MEMORY[0x1F4151628]();
}

uint64_t sub_1C68EBFC8()
{
  return MEMORY[0x1F4151630]();
}

uint64_t sub_1C68EBFD8()
{
  return MEMORY[0x1F4151678]();
}

uint64_t sub_1C68EBFE8()
{
  return MEMORY[0x1F4151680]();
}

uint64_t sub_1C68EBFF8()
{
  return MEMORY[0x1F4151688]();
}

uint64_t sub_1C68EC008()
{
  return MEMORY[0x1F4151690]();
}

uint64_t sub_1C68EC018()
{
  return MEMORY[0x1F4151698]();
}

uint64_t sub_1C68EC028()
{
  return MEMORY[0x1F41516A0]();
}

uint64_t sub_1C68EC038()
{
  return MEMORY[0x1F41516A8]();
}

uint64_t sub_1C68EC048()
{
  return MEMORY[0x1F41516C8]();
}

uint64_t sub_1C68EC058()
{
  return MEMORY[0x1F41516E8]();
}

uint64_t sub_1C68EC068()
{
  return MEMORY[0x1F4151718]();
}

uint64_t sub_1C68EC078()
{
  return MEMORY[0x1F4151728]();
}

uint64_t sub_1C68EC088()
{
  return MEMORY[0x1F4151740]();
}

uint64_t sub_1C68EC098()
{
  return MEMORY[0x1F4151748]();
}

uint64_t sub_1C68EC0A8()
{
  return MEMORY[0x1F41882A0]();
}

uint64_t sub_1C68EC0B8()
{
  return MEMORY[0x1F41882C0]();
}

uint64_t sub_1C68EC0C8()
{
  return MEMORY[0x1F41882C8]();
}

uint64_t sub_1C68EC0D8()
{
  return MEMORY[0x1F41882D8]();
}

uint64_t sub_1C68EC0E8()
{
  return MEMORY[0x1F41882F0]();
}

uint64_t sub_1C68EC0F8()
{
  return MEMORY[0x1F4187688]();
}

uint64_t sub_1C68EC108()
{
  return MEMORY[0x1F4188348]();
}

uint64_t sub_1C68EC118()
{
  return MEMORY[0x1F4187698]();
}

uint64_t sub_1C68EC128()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t sub_1C68EC138()
{
  return MEMORY[0x1F4145B58]();
}

uint64_t sub_1C68EC148()
{
  return MEMORY[0x1F4145B60]();
}

uint64_t sub_1C68EC158()
{
  return MEMORY[0x1F4145B68]();
}

uint64_t sub_1C68EC168()
{
  return MEMORY[0x1F4145B70]();
}

uint64_t sub_1C68EC178()
{
  return MEMORY[0x1F4145B78]();
}

uint64_t sub_1C68EC188()
{
  return MEMORY[0x1F4145B80]();
}

uint64_t sub_1C68EC198()
{
  return MEMORY[0x1F41508E8]();
}

uint64_t sub_1C68EC1A8()
{
  return MEMORY[0x1F41508F0]();
}

uint64_t sub_1C68EC1B8()
{
  return MEMORY[0x1F4150928]();
}

uint64_t sub_1C68EC1C8()
{
  return MEMORY[0x1F4150968]();
}

uint64_t sub_1C68EC1D8()
{
  return MEMORY[0x1F4150998]();
}

uint64_t sub_1C68EC1E8()
{
  return MEMORY[0x1F4150A48]();
}

uint64_t sub_1C68EC1F8()
{
  return MEMORY[0x1F4125960]();
}

uint64_t sub_1C68EC208()
{
  return MEMORY[0x1F41259F8]();
}

uint64_t sub_1C68EC218()
{
  return MEMORY[0x1F4125A20]();
}

uint64_t sub_1C68EC228()
{
  return MEMORY[0x1F4126970]();
}

uint64_t sub_1C68EC238()
{
  return MEMORY[0x1F4126978]();
}

uint64_t sub_1C68EC248()
{
  return MEMORY[0x1F4126980]();
}

uint64_t sub_1C68EC258()
{
  return MEMORY[0x1F4126F38]();
}

uint64_t sub_1C68EC268()
{
  return MEMORY[0x1F4126F50]();
}

uint64_t sub_1C68EC278()
{
  return MEMORY[0x1F4127110]();
}

uint64_t sub_1C68EC288()
{
  return MEMORY[0x1F4127118]();
}

uint64_t sub_1C68EC298()
{
  return MEMORY[0x1F4127340]();
}

uint64_t sub_1C68EC2A8()
{
  return MEMORY[0x1F4158258]();
}

uint64_t sub_1C68EC2B8()
{
  return MEMORY[0x1F4158268]();
}

uint64_t sub_1C68EC2C8()
{
  return MEMORY[0x1F4158270]();
}

uint64_t sub_1C68EC2F8()
{
  return MEMORY[0x1F4104ED0]();
}

uint64_t sub_1C68EC308()
{
  return MEMORY[0x1F41580D0]();
}

uint64_t sub_1C68EC318()
{
  return MEMORY[0x1F41580F8]();
}

uint64_t sub_1C68EC328()
{
  return MEMORY[0x1F4158100]();
}

uint64_t sub_1C68EC338()
{
  return MEMORY[0x1F4158138]();
}

uint64_t sub_1C68EC348()
{
  return MEMORY[0x1F4158148]();
}

uint64_t sub_1C68EC358()
{
  return MEMORY[0x1F4158150]();
}

uint64_t sub_1C68EC368()
{
  return MEMORY[0x1F4158158]();
}

uint64_t sub_1C68EC378()
{
  return MEMORY[0x1F4158160]();
}

uint64_t sub_1C68EC388()
{
  return MEMORY[0x1F41581A0]();
}

uint64_t sub_1C68EC398()
{
  return MEMORY[0x1F41581A8]();
}

uint64_t sub_1C68EC3A8()
{
  return MEMORY[0x1F41581B0]();
}

uint64_t sub_1C68EC3B8()
{
  return MEMORY[0x1F41581B8]();
}

uint64_t sub_1C68EC3C8()
{
  return MEMORY[0x1F41581C0]();
}

uint64_t sub_1C68EC3D8()
{
  return MEMORY[0x1F41581C8]();
}

uint64_t sub_1C68EC3E8()
{
  return MEMORY[0x1F41581D0]();
}

uint64_t sub_1C68EC3F8()
{
  return MEMORY[0x1F41581D8]();
}

uint64_t sub_1C68EC408()
{
  return MEMORY[0x1F41581E0]();
}

uint64_t sub_1C68EC418()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1C68EC428()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1C68EC438()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1C68EC448()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C68EC458()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C68EC468()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C68EC478()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C68EC488()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C68EC498()
{
  return MEMORY[0x1F41582D0]();
}

uint64_t sub_1C68EC4A8()
{
  return MEMORY[0x1F41582D8]();
}

uint64_t sub_1C68EC4B8()
{
  return MEMORY[0x1F41582E0]();
}

uint64_t sub_1C68EC4C8()
{
  return MEMORY[0x1F4158310]();
}

uint64_t sub_1C68EC4D8()
{
  return MEMORY[0x1F4158368]();
}

uint64_t sub_1C68EC4E8()
{
  return MEMORY[0x1F4158370]();
}

uint64_t sub_1C68EC4F8()
{
  return MEMORY[0x1F4158380]();
}

uint64_t sub_1C68EC508()
{
  return MEMORY[0x1F40DB708]();
}

uint64_t sub_1C68EC518()
{
  return MEMORY[0x1F40DB728]();
}

uint64_t sub_1C68EC528()
{
  return MEMORY[0x1F40DB738]();
}

uint64_t sub_1C68EC538()
{
  return MEMORY[0x1F40F7948]();
}

uint64_t sub_1C68EC548()
{
  return MEMORY[0x1F40F7958]();
}

uint64_t sub_1C68EC558()
{
  return MEMORY[0x1F40F7960]();
}

uint64_t sub_1C68EC568()
{
  return MEMORY[0x1F40F7968]();
}

uint64_t sub_1C68EC578()
{
  return MEMORY[0x1F40F7980]();
}

uint64_t sub_1C68EC588()
{
  return MEMORY[0x1F40F7990]();
}

uint64_t sub_1C68EC598()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1C68EC5A8()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C68EC5B8()
{
  return MEMORY[0x1F40D6E58]();
}

uint64_t sub_1C68EC5C8()
{
  return MEMORY[0x1F4186C50]();
}

uint64_t sub_1C68EC5D8()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C68EC5E8()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1C68EC5F8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C68EC608()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C68EC618()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1C68EC628()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C68EC638()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C68EC648()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1C68EC658()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C68EC668()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C68EC678()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1C68EC688()
{
  return MEMORY[0x1F4186E48]();
}

uint64_t sub_1C68EC698()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C68EC6A8()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C68EC6B8()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1C68EC6C8()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1C68EC6D8()
{
  return MEMORY[0x1F40E0490]();
}

uint64_t sub_1C68EC6E8()
{
  return MEMORY[0x1F40E04A0]();
}

uint64_t sub_1C68EC6F8()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1C68EC708()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C68EC718()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C68EC728()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C68EC738()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_1C68EC748()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C68EC758()
{
  return MEMORY[0x1F41833F0]();
}

uint64_t sub_1C68EC768()
{
  return MEMORY[0x1F41834C8]();
}

uint64_t sub_1C68EC778()
{
  return MEMORY[0x1F41834E8]();
}

uint64_t sub_1C68EC788()
{
  return MEMORY[0x1F4183510]();
}

uint64_t sub_1C68EC798()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C68EC7A8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C68EC7B8()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1C68EC7C8()
{
  return MEMORY[0x1F4183650]();
}

uint64_t sub_1C68EC7D8()
{
  return MEMORY[0x1F4183678]();
}

uint64_t sub_1C68EC7E8()
{
  return MEMORY[0x1F4183698]();
}

uint64_t sub_1C68EC7F8()
{
  return MEMORY[0x1F4188400]();
}

uint64_t sub_1C68EC808()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1C68EC818()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C68EC828()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C68EC838()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1C68EC848()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1C68EC858()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C68EC868()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C68EC878()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C68EC888()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C68EC898()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C68EC8A8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1C68EC8B8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C68EC8C8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1C68EC8D8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C68EC8E8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C68EC8F8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C68EC908()
{
  return MEMORY[0x1F4183888]();
}

uint64_t sub_1C68EC918()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1C68EC928()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C68EC938()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C68EC948()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C68EC958()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t sub_1C68EC968()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1C68EC978()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1C68EC988()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1C68EC998()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C68EC9A8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C68EC9B8()
{
  return MEMORY[0x1F41839C0]();
}

uint64_t sub_1C68EC9C8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C68EC9D8()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1C68EC9E8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C68EC9F8()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1C68ECA08()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1C68ECA18()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C68ECA28()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1C68ECA38()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1C68ECA48()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1C68ECA58()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C68ECA68()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C68ECA78()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C68ECA88()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1C68ECA98()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C68ECAA8()
{
  return MEMORY[0x1F4183B08]();
}

uint64_t sub_1C68ECAB8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C68ECAC8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1C68ECAD8()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1C68ECAE8()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1C68ECAF8()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1C68ECB08()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C68ECB18()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C68ECB28()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1C68ECB38()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1C68ECB48()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1C68ECB58()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C68ECB68()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C68ECB78()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C68ECB88()
{
  return MEMORY[0x1F4183DB8]();
}

uint64_t sub_1C68ECB98()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C68ECBA8()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C68ECBB8()
{
  return MEMORY[0x1F4183E30]();
}

uint64_t sub_1C68ECBC8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C68ECBD8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C68ECBE8()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1C68ECBF8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C68ECC08()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C68ECC18()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C68ECC28()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C68ECC38()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C68ECC48()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C68ECC58()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C68ECC68()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C68ECC78()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1C68ECC88()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1C68ECC98()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C68ECCA8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C68ECCB8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C68ECCC8()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1C68ECCD8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C68ECCE8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C68ECCF8()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1C68ECD08()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1C68ECD18()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C68ECD28()
{
  return MEMORY[0x1F4184090]();
}

uint64_t sub_1C68ECD38()
{
  return MEMORY[0x1F40E63F0]();
}

uint64_t sub_1C68ECD48()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C68ECD58()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C68ECD68()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C68ECD78()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C68ECD88()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1C68ECD98()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C68ECDA8()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C68ECDB8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C68ECDC8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C68ECDD8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C68ECDE8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C68ECDF8()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1C68ECE08()
{
  return MEMORY[0x1F4158718]();
}

uint64_t sub_1C68ECE18()
{
  return MEMORY[0x1F40DB790]();
}

uint64_t sub_1C68ECE28()
{
  return MEMORY[0x1F40E6638]();
}

uint64_t sub_1C68ECE38()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C68ECE48()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C68ECE58()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C68ECE68()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C68ECE78()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C68ECE88()
{
  return MEMORY[0x1F40E6690]();
}

uint64_t sub_1C68ECE98()
{
  return MEMORY[0x1F40E6698]();
}

uint64_t sub_1C68ECEA8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1C68ECEB8()
{
  return MEMORY[0x1F40E66F8]();
}

uint64_t sub_1C68ECEC8()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1C68ECED8()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1C68ECEE8()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1C68ECEF8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C68ECF08()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1C68ECF18()
{
  return MEMORY[0x1F4187020]();
}

uint64_t sub_1C68ECF28()
{
  return MEMORY[0x1F4187028]();
}

uint64_t sub_1C68ECF38()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C68ECF48()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C68ECF58()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C68ECF68()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C68ECF78()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C68ECF88()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C68ECF98()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C68ECFA8()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1C68ECFB8()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1C68ECFC8()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1C68ECFD8()
{
  return MEMORY[0x1F4151538]();
}

uint64_t sub_1C68ECFE8()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1C68ECFF8()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_1C68ED008()
{
  return MEMORY[0x1F4158720]();
}

uint64_t sub_1C68ED018()
{
  return MEMORY[0x1F4187448]();
}

uint64_t sub_1C68ED028()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1C68ED038()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1C68ED048()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C68ED058()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C68ED068()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1C68ED078()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1C68ED088()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C68ED098()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C68ED0A8()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_1C68ED0B8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1C68ED0C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C68ED0D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C68ED0E8()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1C68ED0F8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C68ED108()
{
  return MEMORY[0x1F40E6BC0]();
}

uint64_t sub_1C68ED118()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1C68ED128()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1C68ED138()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1C68ED148()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1C68ED158()
{
  return MEMORY[0x1F40E6CE8]();
}

uint64_t sub_1C68ED168()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1C68ED178()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1C68ED188()
{
  return MEMORY[0x1F40E6D68]();
}

uint64_t sub_1C68ED198()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1C68ED1A8()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1C68ED1B8()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1C68ED1C8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C68ED1E8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C68ED1F8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C68ED208()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1C68ED218()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C68ED228()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1C68ED238()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C68ED248()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1C68ED258()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1C68ED268()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1C68ED278()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C68ED288()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C68ED298()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1C68ED2B8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C68ED2C8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C68ED2D8()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1C68ED2E8()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1C68ED2F8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C68ED308()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C68ED318()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C68ED328()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C68ED338()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C68ED348()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C68ED358()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C68ED368()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1C68ED388()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1C68ED398()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C68ED3A8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C68ED3B8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1C68ED3C8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C68ED3D8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C68ED3E8()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C68ED3F8()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C68ED408()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C68ED418()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1C68ED428()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C68ED438()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C68ED448()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C68ED458()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C68ED468()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C68ED478()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C68ED488()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C68ED498()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C68ED4A8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C68ED4B8()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1C68ED4C8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C68ED4D8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C68ED4E8()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1C68ED4F8()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C68ED508()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C68ED518()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C68ED528()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C68ED538()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C68ED548()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C68ED558()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C68ED568()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C68ED578()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1C68ED598()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C68ED5A8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C68ED5B8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C68ED5C8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C68ED5D8()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1C68ED5E8()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1C68ED5F8()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1C68ED608()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C68ED618()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C68ED628()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C68ED638()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C68ED648()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C68ED658()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1C68ED668()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C68ED678()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1C68ED688()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C68ED698()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1C68ED6A8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C68ED6B8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C68ED6C8()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1C68ED6D8()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1C68ED6E8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1C68ED6F8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1C68ED708()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C68ED718()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C68ED728()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C68ED738()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C68ED748()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1C68ED758()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C68ED768()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1C68ED778()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1C68ED788()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C68ED798()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C68ED7A8()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1C68ED7B8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C68ED7C8()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1C68ED7D8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C68ED7E8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C68ED7F8()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1C68ED808()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1C68ED818()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C68ED828()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1C68ED848()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1C68ED858()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C68ED868()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C68ED898()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C68ED8A8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C68ED8B8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C68ED8C8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C68ED8D8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C68ED8F8()
{
  return MEMORY[0x1F40E6E40]();
}

uint64_t sub_1C68ED908()
{
  return MEMORY[0x1F40E6E50]();
}

uint64_t sub_1C68ED918()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1C68ED928()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C68ED938()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C68ED948()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C68ED958()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C68ED968()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1C68ED978()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1C68ED988()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C68ED998()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1C68ED9A8()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1C68ED9B8()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1C68ED9C8()
{
  return MEMORY[0x1F40E6EA8]();
}

uint64_t sub_1C68ED9D8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1C68ED9E8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C68ED9F8()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1C68EDA08()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C68EDA38()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFCurrentUserInterfaceIdiom()
{
  return MEMORY[0x1F410AC48]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1F410ACD8]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

uint64_t AFSystemRootDirectory()
{
  return MEMORY[0x1F410AF58]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

uint64_t CKVCustomTypeToNumber()
{
  return MEMORY[0x1F4113E68]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t INMediaItemTypeGetName()
{
  return MEMORY[0x1F40E9B48]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x1F40E9BB0]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x1F40ECE20]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1F412E5B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
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

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4181FC8](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x1F4182150](db, zDbName);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x1F4182168](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1F415CC80]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1F415CD90]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1F415CDE8]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}