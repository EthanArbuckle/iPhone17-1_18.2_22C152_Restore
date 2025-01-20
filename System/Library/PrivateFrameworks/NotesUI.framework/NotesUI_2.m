uint64_t sub_1B0B4C7E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B0B82E5C();
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
    sub_1B0B4FC90();
    sub_1B0B8277C();
    v1 = v30;
    v29 = v31;
    v2 = v32;
    v3 = v33;
    v4 = v34;
  }
  else
  {
    v5 = -1 << *(unsigned char *)(a1 + 32);
    v29 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64) {
      v7 = ~(-1 << v6);
    }
    else {
      v7 = -1;
    }
    v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v8 = (unint64_t)(v2 + 64) >> 6;
  v9 = (void *)MEMORY[0x1E4FBC860];
  while (1)
  {
    if (v1 < 0)
    {
      if (!sub_1B0B82EDC()) {
        goto LABEL_48;
      }
      sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v13 = v35;
      swift_unknownObjectRelease();
      v12 = v3;
      v10 = v4;
      if (!v35) {
        goto LABEL_48;
      }
    }
    else
    {
      if (v4)
      {
        v10 = (v4 - 1) & v4;
        v11 = __clz(__rbit64(v4)) | (v3 << 6);
        v12 = v3;
      }
      else
      {
        v14 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_53;
        }
        if (v14 >= v8) {
          goto LABEL_48;
        }
        v15 = *(void *)(v29 + 8 * v14);
        v12 = v3 + 1;
        if (!v15)
        {
          v12 = v3 + 2;
          if (v3 + 2 >= v8) {
            goto LABEL_48;
          }
          v15 = *(void *)(v29 + 8 * v12);
          if (!v15)
          {
            v12 = v3 + 3;
            if (v3 + 3 >= v8) {
              goto LABEL_48;
            }
            v15 = *(void *)(v29 + 8 * v12);
            if (!v15)
            {
              v12 = v3 + 4;
              if (v3 + 4 >= v8) {
                goto LABEL_48;
              }
              v15 = *(void *)(v29 + 8 * v12);
              if (!v15)
              {
                v12 = v3 + 5;
                if (v3 + 5 >= v8) {
                  goto LABEL_48;
                }
                v15 = *(void *)(v29 + 8 * v12);
                if (!v15)
                {
                  v16 = v3 + 6;
                  while (v8 != v16)
                  {
                    v15 = *(void *)(v29 + 8 * v16++);
                    if (v15)
                    {
                      v12 = v16 - 1;
                      goto LABEL_31;
                    }
                  }
LABEL_48:
                  sub_1B0A2E1C8();
                  return (uint64_t)v9;
                }
              }
            }
          }
        }
LABEL_31:
        v10 = (v15 - 1) & v15;
        v11 = __clz(__rbit64(v15)) + (v12 << 6);
      }
      v13 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
      if (!v13) {
        goto LABEL_48;
      }
    }
    v17 = sub_1B0B82B0C();

    v18 = *(void *)(v17 + 16);
    v19 = v9[2];
    v20 = v19 + v18;
    if (__OFADD__(v19, v18)) {
      break;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) != 0 && v20 <= v9[3] >> 1)
    {
      if (!*(void *)(v17 + 16)) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v19 <= v20) {
        v22 = v19 + v18;
      }
      else {
        v22 = v19;
      }
      v9 = sub_1B0AD8518((void *)isUniquelyReferenced_nonNull_native, v22, 1, v9);
      if (!*(void *)(v17 + 16))
      {
LABEL_8:
        if (v18) {
          goto LABEL_50;
        }
        goto LABEL_9;
      }
    }
    v23 = v9[2];
    if ((v9[3] >> 1) - v23 < v18) {
      goto LABEL_51;
    }
    v24 = (unint64_t)&v9[5 * v23 + 4];
    if (v17 + 32 < v24 + 40 * v18 && v24 < v17 + 32 + 40 * v18) {
      goto LABEL_54;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4B098);
    swift_arrayInitWithCopy();
    if (v18)
    {
      v25 = v9[2];
      v26 = __OFADD__(v25, v18);
      v27 = v25 + v18;
      if (v26) {
        goto LABEL_52;
      }
      v9[2] = v27;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    v3 = v12;
    v4 = v10;
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B4CBD8(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1B0B831DC())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1B3E9D5F0](i - 4, a1) : *(id *)(a1 + 8 * i);
      v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_note);

      if (v7)
      {
        MEMORY[0x1B3E9CB90]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B0B8262C();
        }
        sub_1B0B8265C();
        sub_1B0B8261C();
      }
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

void *sub_1B0B4CD58(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1B0B831DC())
  {
    v3 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1B3E9D5F0](v4 - 4, a1) : *(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = objc_msgSend(v5, sel_identifier);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_1B0B8240C();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v3 = sub_1B0AD8408(0, v3[2] + 1, 1, v3);
        }
        unint64_t v14 = v3[2];
        unint64_t v13 = v3[3];
        if (v14 >= v13 >> 1) {
          v3 = sub_1B0AD8408((void *)(v13 > 1), v14 + 1, 1, v3);
        }
        v3[2] = v14 + 1;
        v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  v3 = (void *)MEMORY[0x1E4FBC860];
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

void __swiftcall ICActivityStreamSelection.init(mentions:)(ICActivityStreamSelection_optional *__return_ptr retstr, Swift::OpaquePointer mentions)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1B0A2E124(0, (unint64_t *)&qword_1E9B4BBB8);
  v3 = (void *)sub_1B0B825AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_objc_initWithMentions_, v3);
}

id ICActivityStreamSelection.init(mentions:)(unint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  MEMORY[0x1F4188790](v2 - 8);
  v30 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_1B0B7FDEC();
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = sub_1B0B4CBD8(a1);
  uint64_t v6 = sub_1B0ADCE30(v5);
  swift_bridgeObjectRelease();
  unint64_t v32 = a1;
  uint64_t v7 = sub_1B0B4CD58(a1);
  uint64_t v8 = sub_1B0ADC8B8((uint64_t)v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1B0B4C7E8(v6);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1B0B4EAB8(v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v29 = v10;
  if (v11)
  {
    uint64_t v12 = v10 + 32;
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      sub_1B0A2E040(v12, (uint64_t)v39);
      sub_1B0A2E040((uint64_t)v39, (uint64_t)v38);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4B098);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4B0A0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v37 = 0;
        long long v35 = 0u;
        long long v36 = 0u;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
      if (*((void *)&v36 + 1))
      {
        sub_1B0A2E0A4(&v35, (uint64_t)v38);
        sub_1B0A2E0A4(v38, (uint64_t)&v35);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v13 = sub_1B0AD852C(0, v13[2] + 1, 1, v13);
        }
        unint64_t v15 = v13[2];
        unint64_t v14 = v13[3];
        if (v15 >= v14 >> 1) {
          unint64_t v13 = sub_1B0AD852C((void *)(v14 > 1), v15 + 1, 1, v13);
        }
        v13[2] = v15 + 1;
        sub_1B0A2E0A4(&v35, (uint64_t)&v13[5 * v15 + 4]);
      }
      else
      {
        sub_1B0A2E21C((uint64_t)&v35, &qword_1E9B4B0A8);
      }
      v12 += 40;
      --v11;
    }
    while (v11);
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v16 = sub_1B0B4C4EC((uint64_t)v13);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_1B0B4C618(v29);
  swift_bridgeObjectRelease();
  v18 = v30;
  sub_1B0B4D6F8(v17, v30);
  swift_bridgeObjectRelease();
  uint64_t v19 = v31;
  uint64_t v20 = v33;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v18, 1, v33) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B0A2E21C((uint64_t)v18, &qword_1EBBB44D8);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v22 = v28;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v28, v18, v20);
    sub_1B0ADC8B8(v16);
    swift_bridgeObjectRelease();
    v23 = (void *)sub_1B0B8272C();
    swift_bridgeObjectRelease();
    sub_1B0A2E124(0, (unint64_t *)&qword_1E9B4A7B8);
    v24 = (void *)sub_1B0B82A1C();
    v25 = (void *)sub_1B0B7FD5C();
    id v21 = objc_msgSend(v34, sel_initWithItemIDs_filter_displayDate_, v23, v24, v25);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v20);
  }
  return v21;
}

uint64_t sub_1B0B4D414(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v32 = v4;
  uint64_t v33 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v31 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (1)
    {
      int64_t v12 = v11;
      if (!v8) {
        break;
      }
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      if (*(void *)(v5 + 16)) {
        goto LABEL_31;
      }
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v12 + 2;
      if (v12 + 2 >= v31) {
        goto LABEL_48;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v12 + 3;
        if (v12 + 3 >= v31) {
          goto LABEL_48;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(void *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(void *)(v32 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_1B0B8349C();
      swift_bridgeObjectRetain();
      sub_1B0B8246C();
      uint64_t v21 = sub_1B0B834EC();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = *(void *)(v5 + 48);
        v25 = (void *)(v24 + 16 * v23);
        BOOL v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_1B0B8339C() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
LABEL_45:
          sub_1B0A2E1C8();
          return v30;
        }
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_1B0B8339C() & 1) != 0) {
            goto LABEL_44;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    uint64_t v30 = 1;
    goto LABEL_45;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_30;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_1B0B4D6F8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_1B0B7FDEC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  unint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  unint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (!v17)
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v19(v9, 1, 1, v10);
    goto LABEL_5;
  }
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  long long v36 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
  uint64_t v37 = v11 + 16;
  v36(v9, a1 + v18, v10);
  uint64_t v31 = a1;
  v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v38(v9, 0, 1, v10);
  id v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v35 = v11 + 48;
  if (v34(v9, 1, v10) == 1)
  {
    uint64_t v19 = v38;
LABEL_5:
    sub_1B0A2E21C((uint64_t)v9, &qword_1EBBB44D8);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a2, 1, 1, v10);
  }
  uint64_t v30 = a2;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v33(v16, v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v21 = v17 - 1;
  if (v21)
  {
    uint64_t v23 = *(void *)(v11 + 72);
    uint64_t v24 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v32 = v23;
    unint64_t v25 = v31 + v23 + v18;
    BOOL v26 = v33;
    while (1)
    {
      v36(v7, v25, v10);
      v38(v7, 0, 1, v10);
      if (v34(v7, 1, v10) == 1) {
        break;
      }
      v26(v14, v7, v10);
      sub_1B0B4ECB0(&qword_1E9B4C0A8, MEMORY[0x1E4F27928]);
      char v27 = sub_1B0B823AC();
      v28 = *v24;
      if (v27)
      {
        v28(v16, v10);
        v26(v16, v14, v10);
      }
      else
      {
        v28(v14, v10);
      }
      v25 += v32;
      if (!--v21) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v38(v7, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_1B0A2E21C((uint64_t)v7, &qword_1EBBB44D8);
  uint64_t v22 = v30;
  v33(v30, v16, v10);
  return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v38)(v22, 0, 1, v10);
}

void ICActivityStreamSelection.Model.init(from:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_itemIDs);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_1B0B8273C();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
  id v6 = objc_msgSend(a1, sel_filter);
  type metadata accessor for ICActivityStreamSelection.Model();
  sub_1B0B829EC();
  id v7 = objc_msgSend(a1, sel_displayDate);
  sub_1B0B7FDAC();
}

id ICActivityStreamSelection.Model.selection.getter()
{
  uint64_t v1 = sub_1B0B7FDEC();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)v0;
  uint64_t v6 = type metadata accessor for ICActivityStreamSelection.Model();
  swift_bridgeObjectRetain();
  id v7 = (void *)sub_1B0B829FC();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, &v0[*(int *)(v6 + 24)], v1);
  if (v5)
  {
    uint64_t v8 = (void *)sub_1B0B8272C();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_allocWithZone((Class)ICActivityStreamSelection);
  uint64_t v10 = (void *)sub_1B0B7FD5C();
  id v11 = objc_msgSend(v9, sel_initWithItemIDs_filter_displayDate_, v8, v7, v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v11;
}

uint64_t sub_1B0B4DDEC()
{
  uint64_t v1 = 0x7265746C6966;
  if (*v0 != 1) {
    uint64_t v1 = 0x4479616C70736964;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7344496D657469;
  }
}

uint64_t sub_1B0B4DE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B0B4EDB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0B4DE74(uint64_t a1)
{
  unint64_t v2 = sub_1B0B4EC5C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B0B4DEB0(uint64_t a1)
{
  unint64_t v2 = sub_1B0B4EC5C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ICActivityStreamSelection.Model.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CB60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0B4EC5C();
  sub_1B0B8357C();
  uint64_t v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4EB8);
  sub_1B0AC9C80(&qword_1EBBB4EC0);
  sub_1B0B832EC();
  if (!v2)
  {
    type metadata accessor for ICActivityStreamSelection.Model();
    v10[6] = 1;
    sub_1B0B82A0C();
    sub_1B0B4ECB0(&qword_1E9B4CB70, MEMORY[0x1E4F82F90]);
    sub_1B0B8333C();
    v10[5] = 2;
    sub_1B0B7FDEC();
    sub_1B0B4ECB0(&qword_1EBBB4D90, MEMORY[0x1E4F27928]);
    sub_1B0B8333C();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ICActivityStreamSelection.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_1B0B7FDEC();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1B0B82A0C();
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CB78);
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for ICActivityStreamSelection.Model();
  MEMORY[0x1F4188790](v28);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = 0;
  uint64_t v14 = a1[3];
  BOOL v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_1B0B4EC5C();
  sub_1B0B8356C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = v23;
    uint64_t v20 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4EB8);
    char v31 = 0;
    sub_1B0AC9C80(&qword_1E9B4C020);
    uint64_t v16 = v24;
    sub_1B0B8327C();
    *(void *)uint64_t v13 = v32;
    char v30 = 1;
    sub_1B0B4ECB0(&qword_1E9B4CB80, MEMORY[0x1E4F82F90]);
    uint64_t v17 = v27;
    sub_1B0B832CC();
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v13[*(int *)(v28 + 20)], v8, v17);
    char v29 = 2;
    sub_1B0B4ECB0(&qword_1EBBB44D0, MEMORY[0x1E4F27928]);
    unint64_t v18 = v20;
    sub_1B0B832CC();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v16);
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v13[*(int *)(v28 + 24)], v18, v4);
    sub_1B0B4ECF8((uint64_t)v13, v22);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    return sub_1B0B4ED5C((uint64_t)v13);
  }
}

uint64_t sub_1B0B4E630@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ICActivityStreamSelection.Model.init(from:)(a1, a2);
}

uint64_t sub_1B0B4E648(void *a1)
{
  return ICActivityStreamSelection.Model.encode(to:)(a1);
}

uint64_t ICActivityStreamSelection.encoded()()
{
  uint64_t v1 = type metadata accessor for ICActivityStreamSelection.Model();
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (uint64_t *)((char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B0B7F77C();
  swift_allocObject();
  sub_1B0B7F76C();
  id v4 = v0;
  id v5 = objc_msgSend(v4, sel_itemIDs);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_1B0B8273C();
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t *v3 = v7;
  id v8 = objc_msgSend(v4, sel_filter);
  sub_1B0B829EC();
  id v9 = objc_msgSend(v4, sel_displayDate);
  sub_1B0B7FDAC();

  sub_1B0B4ECB0(&qword_1E9B4CB88, (void (*)(uint64_t))type metadata accessor for ICActivityStreamSelection.Model);
  uint64_t v10 = sub_1B0B7F75C();
  sub_1B0B4ED5C((uint64_t)v3);
  swift_release();
  return v10;
}

uint64_t sub_1B0B4EAB8(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v6 = a1 + 32;
    uint64_t v7 = MEMORY[0x1E4FBC860];
    do
    {
      sub_1B0A2E040(v6, (uint64_t)&v13);
      __swift_project_boxed_opaque_existential_1(&v13, v14);
      uint64_t v8 = sub_1B0B800AC();
      char v9 = sub_1B0B4D414(a2, v8);
      swift_bridgeObjectRelease();
      if (v9)
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v13);
      }
      else
      {
        sub_1B0A2E0A4(&v13, (uint64_t)v12);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1B0B3C664(0, *(void *)(v7 + 16) + 1, 1);
        }
        uint64_t v7 = v15;
        unint64_t v11 = *(void *)(v15 + 16);
        unint64_t v10 = *(void *)(v15 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1B0B3C664(v10 > 1, v11 + 1, 1);
          uint64_t v7 = v15;
        }
        *(void *)(v7 + 16) = v11 + 1;
        sub_1B0A2E0A4(v12, v7 + 40 * v11 + 32);
      }
      v6 += 40;
      --v4;
    }
    while (v4);
    return v15;
  }
  return result;
}

uint64_t type metadata accessor for ICActivityStreamSelection.Model()
{
  uint64_t result = qword_1E9B4CB90;
  if (!qword_1E9B4CB90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1B0B4EC5C()
{
  unint64_t result = qword_1E9B4CB68;
  if (!qword_1E9B4CB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CB68);
  }
  return result;
}

uint64_t sub_1B0B4ECB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B0B4ECF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ICActivityStreamSelection.Model();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B0B4ED5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ICActivityStreamSelection.Model();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B0B4EDB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7344496D657469 && a2 == 0xE700000000000000;
  if (v2 || (sub_1B0B8339C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746C6966 && a2 == 0xE600000000000000 || (sub_1B0B8339C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4479616C70736964 && a2 == 0xEB00000000657461)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1B0B8339C();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

id _sSo25ICActivityStreamSelectionC7NotesUIE4from4dataABSg10Foundation4DataV_tFZ_0()
{
  uint64_t v0 = sub_1B0B7FDEC();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for ICActivityStreamSelection.Model();
  MEMORY[0x1F4188790](v4);
  char v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B0B7F74C();
  swift_allocObject();
  sub_1B0B7F73C();
  sub_1B0B4ECB0(qword_1E9B4CBB8, (void (*)(uint64_t))type metadata accessor for ICActivityStreamSelection.Model);
  sub_1B0B7F72C();
  swift_release();
  uint64_t v7 = *(void *)v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_1B0B829FC();
  (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(v3, &v6[*(int *)(v4 + 24)], v0);
  if (v7)
  {
    char v9 = (void *)sub_1B0B8272C();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  id v10 = objc_allocWithZone((Class)ICActivityStreamSelection);
  unint64_t v11 = (void *)sub_1B0B7FD5C();
  id v12 = objc_msgSend(v10, sel_initWithItemIDs_filter_displayDate_, v9, v8, v11);

  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1B0B4ED5C((uint64_t)v6);
  return v12;
}

uint64_t *_s5ModelVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v8 = *(int *)(a3 + 20);
    char v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1B0B82A0C();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_1B0B7FDEC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v7;
}

uint64_t _s5ModelVwxx(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1B0B82A0C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_1B0B7FDEC();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *_s5ModelVwcp(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B0B82A0C();
  id v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_1B0B7FDEC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

void *_s5ModelVwca(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B0B82A0C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  id v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1B0B7FDEC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

void *_s5ModelVwtk(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B0B82A0C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  id v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1B0B7FDEC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

void *_s5ModelVwta(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B0B82A0C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  id v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1B0B7FDEC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t _s5ModelVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B0B4F738);
}

uint64_t sub_1B0B4F738(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_1B0B82A0C();
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      id v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = sub_1B0B7FDEC();
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t _s5ModelVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B0B4F884);
}

void *sub_1B0B4F884(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = sub_1B0B82A0C();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      id v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1B0B7FDEC();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_1B0B4F9B0()
{
  uint64_t result = sub_1B0B82A0C();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1B0B7FDEC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *_s5ModelV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B0B4FB50);
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

ValueMetadata *_s5ModelV10CodingKeysOMa()
{
  return &_s5ModelV10CodingKeysON;
}

unint64_t sub_1B0B4FB8C()
{
  unint64_t result = qword_1E9B4CBA0;
  if (!qword_1E9B4CBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CBA0);
  }
  return result;
}

unint64_t sub_1B0B4FBE4()
{
  unint64_t result = qword_1E9B4CBA8;
  if (!qword_1E9B4CBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CBA8);
  }
  return result;
}

unint64_t sub_1B0B4FC3C()
{
  unint64_t result = qword_1E9B4CBB0;
  if (!qword_1E9B4CBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CBB0);
  }
  return result;
}

unint64_t sub_1B0B4FC90()
{
  unint64_t result = qword_1EBBB49D8;
  if (!qword_1EBBB49D8)
  {
    sub_1B0A2E124(255, (unint64_t *)&qword_1EBBB49D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB49D8);
  }
  return result;
}

uint64_t sub_1B0B4FCFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_1B0B4FD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0B8134C();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1B0B8135C();
}

uint64_t sub_1B0B4FE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B0B8134C();
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1B0B8135C();
}

void ThumbnailView.init(thumbnailService:configuration:content:placeholder:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAC8);
  sub_1B0B81B1C();
  id v13 = a1;
  id v14 = a2;
  sub_1B0A46460(a3);
  sub_1B0A46460(a5);
  type metadata accessor for ThumbnailView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAD0);
  sub_1B0B81B2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAD0);
  sub_1B0B81B3C();
  sub_1B0A2508C(a5);
  sub_1B0A2508C(a3);

  *a7 = v13;
  a7[1] = v14;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  a7[6] = v16;
  a7[7] = v17;
}

id ThumbnailView.thumbnailService.getter()
{
  return *v0;
}

id ThumbnailView.configuration.getter()
{
  return *(id *)(v0 + 8);
}

uint64_t ThumbnailView.content.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1B0A46460(v1);
  return v1;
}

uint64_t ThumbnailView.placeholder.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_1B0A46460(v1);
  return v1;
}

uint64_t type metadata accessor for ThumbnailView()
{
  return swift_getGenericMetadata();
}

uint64_t ThumbnailView.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v39 = a2;
  uint64_t v33 = a1[2];
  uint64_t v4 = v33;
  uint64_t v34 = sub_1B0B8136C();
  uint64_t v5 = a1[3];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4B3B8);
  uint64_t v32 = v5;
  uint64_t v35 = sub_1B0B8136C();
  sub_1B0B8136C();
  uint64_t v6 = sub_1B0B81A9C();
  uint64_t v38 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = sub_1B0B80DFC();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  long long v36 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v37 = (char *)&v32 - v13;
  long long v14 = v2[1];
  long long v54 = *v2;
  long long v55 = v14;
  long long v15 = v2[3];
  long long v56 = v2[2];
  long long v57 = v15;
  uint64_t v40 = v4;
  uint64_t v41 = v5;
  uint64_t v16 = a1[4];
  uint64_t v17 = a1[5];
  uint64_t v42 = v16;
  uint64_t v43 = v17;
  v44 = &v54;
  uint64_t v52 = v16;
  uint64_t v53 = MEMORY[0x1E4F3EC88];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
  uint64_t v50 = v17;
  uint64_t v51 = v19;
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v48 = WitnessTable;
  uint64_t v49 = v20;
  uint64_t v21 = swift_getWitnessTable();
  sub_1B0B81A8C();
  v58[0] = v54;
  v58[1] = v55;
  v58[2] = v56;
  v58[3] = v57;
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v32;
  *(void *)(v22 + 16) = v33;
  *(void *)(v22 + 24) = v23;
  *(void *)(v22 + 32) = v16;
  *(void *)(v22 + 40) = v17;
  long long v24 = v55;
  *(_OWORD *)(v22 + 48) = v54;
  *(_OWORD *)(v22 + 64) = v24;
  long long v25 = v57;
  *(_OWORD *)(v22 + 80) = v56;
  *(_OWORD *)(v22 + 96) = v25;
  sub_1B0B51A5C((uint64_t)v58);
  uint64_t v47 = v21;
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v27 = v36;
  sub_1B0B8199C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
  uint64_t v45 = v26;
  uint64_t v46 = MEMORY[0x1E4F3DCD8];
  swift_getWitnessTable();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  char v29 = v37;
  v28(v37, v27, v9);
  char v30 = *(void (**)(char *, uint64_t))(v10 + 8);
  v30(v27, v9);
  v28(v39, v29, v9);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, v9);
}

uint64_t sub_1B0B5050C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v85 = a6;
  uint64_t v73 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1);
  v72 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v71 = (char *)&v71 - v14;
  uint64_t v76 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  v75 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  v77 = (char *)&v71 - v18;
  uint64_t v19 = sub_1B0B8136C();
  v80 = *(void (***)(char *, uint64_t, uint64_t))(v19 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  v79 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v78 = (uint64_t)&v71 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4B3B8);
  uint64_t v24 = sub_1B0B8136C();
  uint64_t v74 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v24);
  uint64_t v27 = (void (**)(char *, uint64_t, uint64_t))((char *)&v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v25);
  char v29 = (char *)&v71 - v28;
  uint64_t v86 = v19;
  uint64_t v84 = v30;
  uint64_t v83 = sub_1B0B8136C();
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x1F4188790](v83);
  v81 = (char *)&v71 - v31;
  uint64_t v32 = a1[6];
  uint64_t v33 = a1[7];
  uint64_t v103 = a2;
  uint64_t v104 = a3;
  uint64_t v87 = a5;
  uint64_t v88 = a4;
  uint64_t v105 = a4;
  uint64_t v106 = a5;
  type metadata accessor for ThumbnailView();
  uint64_t v103 = v32;
  uint64_t v104 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAD0);
  sub_1B0B81B2C();
  uint64_t v34 = v107;
  if (v107)
  {
    uint64_t v35 = (void (*)(uint64_t))a1[2];
    if (v35)
    {
      swift_retain();
      uint64_t v36 = (uint64_t)v75;
      v35(v34);
      uint64_t v37 = v76;
      uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
      uint64_t v74 = v34;
      v39 = v77;
      v38(v77, v36, a2);
      uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
      v40(v36, a2);
      v38((char *)v36, (uint64_t)v39, a2);
      uint64_t v41 = v78;
      sub_1B0B4FD34(v36, a2);
      sub_1B0A2508C((uint64_t)v35);
      v40(v36, a2);
      v40((uint64_t)v39, a2);
    }
    else
    {
      uint64_t v103 = v107;
      uint64_t v41 = v78;
      sub_1B0B4FE2C((uint64_t)&v103, a2, MEMORY[0x1E4F3EC98]);
    }
    uint64_t v91 = v88;
    uint64_t v51 = MEMORY[0x1E4F3EC88];
    uint64_t v92 = MEMORY[0x1E4F3EC88];
    uint64_t v52 = v86;
    swift_getWitnessTable();
    uint64_t v53 = v80;
    uint64_t v54 = (uint64_t)v79;
    v80[2](v79, v41, v52);
    uint64_t v55 = sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
    uint64_t v89 = v87;
    uint64_t v90 = v55;
    swift_getWitnessTable();
    long long v56 = v81;
    sub_1B0B4FD34(v54, v52);
    swift_release();
    long long v57 = v53[1];
    ((void (*)(uint64_t, uint64_t))v57)(v54, v52);
    ((void (*)(uint64_t, uint64_t))v57)(v41, v52);
  }
  else
  {
    uint64_t v78 = v23;
    uint64_t v42 = v71;
    uint64_t v43 = v72;
    uint64_t v44 = v73;
    v79 = v29;
    v80 = v27;
    uint64_t v45 = (void (*)(uint64_t))a1[4];
    if (v45)
    {
      uint64_t v46 = swift_retain();
      uint64_t v47 = (uint64_t)v43;
      v45(v46);
      uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
      v48(v42, v47, a3);
      uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v49(v47, a3);
      v48((char *)v47, (uint64_t)v42, a3);
      sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
      uint64_t v50 = v79;
      sub_1B0B4FD34(v47, a3);
      sub_1B0A2508C((uint64_t)v45);
      v49(v47, a3);
      v49((uint64_t)v42, a3);
    }
    else
    {
      id v58 = objc_msgSend(self, sel_quaternaryLabelColor);
      uint64_t v103 = MEMORY[0x1B3E9BFD0](v58);
      LOWORD(v104) = 256;
      sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
      uint64_t v50 = v79;
      sub_1B0B4FE2C((uint64_t)&v103, a3, v78);
      swift_release();
    }
    uint64_t v59 = (uint64_t)v80;
    uint64_t v60 = sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
    uint64_t v101 = v87;
    uint64_t v102 = v60;
    uint64_t v61 = v84;
    swift_getWitnessTable();
    uint64_t v62 = v74;
    (*(void (**)(uint64_t, char *, uint64_t))(v74 + 16))(v59, v50, v61);
    uint64_t v99 = v88;
    uint64_t v51 = MEMORY[0x1E4F3EC88];
    uint64_t v100 = MEMORY[0x1E4F3EC88];
    uint64_t v63 = v86;
    swift_getWitnessTable();
    long long v56 = v81;
    sub_1B0B4FE2C(v59, v63, v61);
    v64 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
    v64(v59, v61);
    v64((uint64_t)v50, v61);
  }
  uint64_t v97 = v88;
  uint64_t v98 = v51;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v66 = sub_1B0A48B54(&qword_1E9B4B3B0, &qword_1E9B4B3B8);
  uint64_t v95 = v87;
  uint64_t v96 = v66;
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v93 = WitnessTable;
  uint64_t v94 = v67;
  uint64_t v68 = v83;
  swift_getWitnessTable();
  uint64_t v69 = v82;
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v85, v56, v68);
  return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v56, v68);
}

uint64_t sub_1B0B50ED8@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0B5050C(*(void **)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

void sub_1B0B50EE8(uint64_t a1)
{
  long long v3 = v1[1];
  *(_OWORD *)uint64_t v20 = *v1;
  long long v21 = v3;
  long long v4 = v1[3];
  long long v22 = v1[2];
  long long v23 = v4;
  id v5 = v20[0];
  id v6 = v20[1];
  id v7 = objc_msgSend(objc_msgSend(v20[0], sel_cache), sel_objectForKeyedSubscript_, v20[1]);
  swift_unknownObjectRelease();
  if (v7)
  {
    long long v8 = v23;
    sub_1B0B51A5C((uint64_t)v20);
    id v9 = objc_msgSend(v7, sel_image);
    if (v9) {
      id v9 = (id)_s7SwiftUI5ImageV05NotesB0EyACSo7UIImageCcfC_0();
    }
    long long v15 = v8;
    id v24 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAD0);
    sub_1B0B81B3C();

    sub_1B0B51B5C((uint64_t)v20);
  }
  else
  {
    uint64_t v10 = (_OWORD *)swift_allocObject();
    long long v11 = *(_OWORD *)(a1 + 32);
    v10[1] = *(_OWORD *)(a1 + 16);
    v10[2] = v11;
    long long v12 = v1[1];
    v10[3] = *v1;
    v10[4] = v12;
    long long v13 = v1[3];
    v10[5] = v1[2];
    v10[6] = v13;
    uint64_t v18 = sub_1B0B51B4C;
    uint64_t v19 = v10;
    *(void *)&long long v15 = MEMORY[0x1E4F143A8];
    *((void *)&v15 + 1) = 1107296256;
    uint64_t v16 = sub_1B0A5ADEC;
    uint64_t v17 = &block_descriptor_21;
    uint64_t v14 = _Block_copy(&v15);
    sub_1B0B51A5C((uint64_t)v20);
    swift_release();
    objc_msgSend(v5, sel_thumbnailWithConfiguration_completion_, v6, v14);
    _Block_release(v14);
  }
}

uint64_t sub_1B0B510A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B510E4(void *a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v10 = sub_1B0B81C8C();
  uint64_t v27 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  long long v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1B0B81CCC();
  uint64_t v13 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  long long v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0A5086C();
  uint64_t v16 = (void *)sub_1B0B8295C();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  uint64_t v18 = v25;
  *(void *)(v17 + 32) = v24;
  *(void *)(v17 + 40) = v18;
  long long v19 = a2[1];
  *(_OWORD *)(v17 + 48) = *a2;
  *(_OWORD *)(v17 + 64) = v19;
  long long v20 = a2[3];
  *(_OWORD *)(v17 + 80) = a2[2];
  *(_OWORD *)(v17 + 96) = v20;
  *(void *)(v17 + 112) = a1;
  aBlock[4] = sub_1B0B51C50;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B0A965E8;
  aBlock[3] = &block_descriptor_10;
  long long v21 = _Block_copy(aBlock);
  sub_1B0B51A5C((uint64_t)a2);
  id v22 = a1;
  swift_release();
  sub_1B0B81CAC();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1B0B51C64();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB48F0);
  sub_1B0A48B54((unint64_t *)&qword_1EBBB4900, (uint64_t *)&unk_1EBBB48F0);
  sub_1B0B82E1C();
  MEMORY[0x1B3E9CF80](0, v15, v12, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v26);
}

uint64_t sub_1B0B513C0(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, sel_image)) {
    _s7SwiftUI5ImageV05NotesB0EyACSo7UIImageCcfC_0();
  }
  type metadata accessor for ThumbnailView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BAD0);
  sub_1B0B81B3C();
  return sub_1B0B51B5C(a1);
}

uint64_t sub_1B0B5148C(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  swift_release();
  return swift_release();
}

void *sub_1B0B514F8(void *a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  id v7 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 16);
  id v8 = v4;
  id v9 = v5;
  if (v6)
  {
    uint64_t v10 = *(void *)(a2 + 24);
    a1[2] = v6;
    a1[3] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v7;
  }
  uint64_t v11 = *(void *)(a2 + 32);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 40);
    a1[4] = v11;
    a1[5] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  }
  uint64_t v13 = *(void *)(a2 + 48);
  uint64_t v14 = *(void *)(a2 + 56);
  a1[6] = v13;
  a1[7] = v14;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1B0B515A4(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v10;
      *(void *)(a1 + 24) = v11;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v12;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v13 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v13;
      *(void *)(a1 + 40) = v15;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v14;
  swift_retain();
  swift_release();
LABEL_15:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
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

uint64_t sub_1B0B516F0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v8;
      *(void *)(a1 + 40) = v10;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  swift_release();
LABEL_15:
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t sub_1B0B517E8(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B0B51830(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1B0B51880()
{
  return swift_getWitnessTable();
}

void sub_1B0B51A0C()
{
  uint64_t v0 = type metadata accessor for ThumbnailView();
  sub_1B0B50EE8(v0);
}

uint64_t sub_1B0B51A5C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)a1;
  id v6 = v2;
  sub_1B0A46460(v3);
  sub_1B0A46460(v4);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t objectdestroyTm_2()
{
  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  if (*(void *)(v0 + 80)) {
    swift_release();
  }
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 112, 7);
}

uint64_t sub_1B0B51B4C(void *a1)
{
  return sub_1B0B510E4(a1, (_OWORD *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1B0B51B5C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);

  sub_1B0A2508C(v3);
  sub_1B0A2508C(v4);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_1B0B51BD8()
{
  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  if (*(void *)(v0 + 80)) {
    swift_release();
  }
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 120, 7);
}

uint64_t sub_1B0B51C50()
{
  return sub_1B0B513C0(v0 + 48, *(void **)(v0 + 112));
}

unint64_t sub_1B0B51C64()
{
  unint64_t result = qword_1EBBB48C0;
  if (!qword_1EBBB48C0)
  {
    sub_1B0B81C8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB48C0);
  }
  return result;
}

void sub_1B0B51CC4(uint64_t a1, char *a2)
{
  uint64_t v2 = a2;
  *(void *)(swift_allocObject() + 16) = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = v2;
    swift_bridgeObjectRetain();
    sub_1B0B82E5C();
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
    sub_1B0A7AB50((unint64_t *)&qword_1EBBB49D8, (unint64_t *)&qword_1EBBB49D0);
    sub_1B0B8277C();
    a1 = aBlock[6];
    uint64_t v33 = aBlock[7];
    uint64_t v6 = aBlock[8];
    uint64_t v5 = aBlock[9];
    unint64_t v7 = aBlock[10];
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v33 = a1 + 56;
    uint64_t v6 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    uint64_t v11 = v2;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  uint64_t v31 = v6;
  int64_t v32 = (unint64_t)(v6 + 64) >> 6;
  uint64_t v34 = a1;
  uint64_t v35 = v2;
  while (1)
  {
    if (a1 < 0)
    {
      if (!sub_1B0B82EDC()) {
        goto LABEL_42;
      }
      sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      long long v19 = (void *)aBlock[0];
      swift_unknownObjectRelease();
      id v20 = v19;
      uint64_t v18 = v5;
      uint64_t v16 = v7;
      if (!v20) {
        goto LABEL_42;
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v16 = (v7 - 1) & v7;
        unint64_t v17 = __clz(__rbit64(v7)) | (v5 << 6);
        uint64_t v18 = v5;
      }
      else
      {
        int64_t v21 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_44;
        }
        if (v21 >= v32) {
          goto LABEL_42;
        }
        unint64_t v22 = *(void *)(v33 + 8 * v21);
        uint64_t v18 = v5 + 1;
        if (!v22)
        {
          uint64_t v18 = v5 + 2;
          if (v5 + 2 >= v32) {
            goto LABEL_42;
          }
          unint64_t v22 = *(void *)(v33 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v5 + 3;
            if (v5 + 3 >= v32) {
              goto LABEL_42;
            }
            unint64_t v22 = *(void *)(v33 + 8 * v18);
            if (!v22)
            {
              uint64_t v18 = v5 + 4;
              if (v5 + 4 >= v32) {
                goto LABEL_42;
              }
              unint64_t v22 = *(void *)(v33 + 8 * v18);
              if (!v22)
              {
                uint64_t v18 = v5 + 5;
                if (v5 + 5 >= v32) {
                  goto LABEL_42;
                }
                unint64_t v22 = *(void *)(v33 + 8 * v18);
                if (!v22)
                {
                  uint64_t v23 = v5 + 6;
                  while (v32 != v23)
                  {
                    unint64_t v22 = *(void *)(v33 + 8 * v23++);
                    if (v22)
                    {
                      uint64_t v18 = v23 - 1;
                      goto LABEL_30;
                    }
                  }
LABEL_42:
                  sub_1B0A2E1C8();

                  swift_release();
                  return;
                }
              }
            }
          }
        }
LABEL_30:
        uint64_t v16 = (v22 - 1) & v22;
        unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
      }
      id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
      if (!v20) {
        goto LABEL_42;
      }
    }
    uint64_t v37 = v18;
    uint64_t v36 = v20;
    unint64_t v24 = sub_1B0B52980(v20);
    unint64_t v25 = v24;
    if (v24 >> 62)
    {
      uint64_t v26 = sub_1B0B831DC();
      if (!v26) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v26 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v26) {
        goto LABEL_8;
      }
    }
    if (v26 < 1) {
      break;
    }
    uint64_t v27 = 0;
    uint64_t v28 = *(void **)&v35[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService];
    do
    {
      if ((v25 & 0xC000000000000001) != 0) {
        id v29 = (id)MEMORY[0x1B3E9D5F0](v27, v25);
      }
      else {
        id v29 = *(id *)(v25 + 8 * v27 + 32);
      }
      uint64_t v30 = v29;
      ++v27;
      objc_msgSend(objc_msgSend(v28, sel_cache, v31), sel_setObject_forKeyedSubscript_, 0, v29);

      swift_unknownObjectRelease();
    }
    while (v26 != v27);
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v2 = v35;
    id v12 = objc_msgSend(*(id *)&v35[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v35;
    aBlock[4] = sub_1B0B5AFC8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B0A965E8;
    aBlock[3] = &block_descriptor_160;
    uint64_t v14 = _Block_copy(aBlock);
    uint64_t v15 = v35;
    swift_release();
    objc_msgSend(v12, sel_performBlock_, v14);
    _Block_release(v14);

    unint64_t v7 = v16;
    uint64_t v5 = v37;
    a1 = v34;
  }
  __break(1u);
LABEL_44:
  __break(1u);
}

uint64_t sub_1B0B521B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1B0B521C0()
{
  uint64_t v0 = sub_1B0B8093C();
  __swift_allocate_value_buffer(v0, qword_1EBBB4898);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBBB4898);
  return sub_1B0B8088C();
}

id sub_1B0B5220C()
{
  id v0 = objc_msgSend(self, sel_defaultManager);
  id v1 = objc_msgSend(self, sel_sharedThumbnailService);
  uint64_t v2 = (char *)objc_allocWithZone((Class)type metadata accessor for SystemPaperThumbnailService());
  id result = sub_1B0B5998C((uint64_t)v0, (uint64_t)v1, v2);
  qword_1EBBB4470 = (uint64_t)result;
  return result;
}

id SystemPaperThumbnailService.__allocating_init(fileManager:thumbnailService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (char *)objc_allocWithZone(v3);
  uint64_t ObjectType = swift_getObjectType();
  return sub_1B0B59BF0(a1, a3, v7, ObjectType, a2);
}

id static SystemPaperThumbnailService.shared.getter()
{
  if (qword_1EBBB4870 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1EBBB4470;
  return v0;
}

uint64_t SystemPaperThumbnailService.fileManager.getter()
{
  return swift_unknownObjectRetain();
}

id SystemPaperThumbnailService.thumbnailService.getter()
{
  return *(id *)(v0 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
}

void *SystemPaperThumbnailService.traitCollection.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void SystemPaperThumbnailService.traitCollection.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  uint64_t v4 = *v3;
  objc_class *v3 = a1;
}

uint64_t (*SystemPaperThumbnailService.traitCollection.modify())()
{
  return j__swift_endAccess;
}

id SystemPaperThumbnailService.init(fileManager:thumbnailService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return sub_1B0B59BF0(a1, a3, v3, ObjectType, a2);
}

id SystemPaperThumbnailService.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (qword_1EBBB48B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1B0B8093C();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBBB4898);
  uint64_t v4 = sub_1B0B8092C();
  os_log_type_t v5 = sub_1B0B8283C();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B08EB000, v4, v5, "Cancelled observing System Paper notes for changes", v6, 2u);
    MEMORY[0x1B3E9F6B0](v6, -1, -1);
  }

  *(void *)&v1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_observations] = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

Swift::Void __swiftcall SystemPaperThumbnailService.cancel()()
{
  uint64_t v1 = v0;
  if (qword_1EBBB48B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B0B8093C();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBBB4898);
  uint64_t v3 = sub_1B0B8092C();
  os_log_type_t v4 = sub_1B0B8283C();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_1B08EB000, v3, v4, "Cancelled observing System Paper notes for changes", v5, 2u);
    MEMORY[0x1B3E9F6B0](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_observations) = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
}

uint64_t sub_1B0B52980(void *a1)
{
  id v3 = objc_msgSend(self, sel_currentDevice);
  id v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (v4) {
    BOOL v5 = v4 == (id)5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B0B9EB40;
    unint64_t v7 = self;
    id v8 = a1;
    id v9 = objc_msgSend(v7, sel_appearanceInfoWithType_, 0);
    id v10 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperPreviewWithNote_appearanceInfo_, v8, v9);

    *(void *)(v6 + 32) = v10;
    id v11 = v8;
    id v12 = objc_msgSend(v7, sel_appearanceInfoWithType_, 1);
    id v13 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperPreviewWithNote_appearanceInfo_, v11, v12);

    *(void *)(v6 + 40) = v13;
    id v14 = v11;
    id v15 = objc_msgSend(v7, sel_appearanceInfoWithType_, 0);
    uint64_t v16 = (void *)(v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
    swift_beginAccess();
    id v17 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForLargeQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v14, v15, *v16);

    *(void *)(v6 + 48) = v17;
    id v18 = v14;
    id v19 = objc_msgSend(v7, sel_appearanceInfoWithType_, 1);
    id v20 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForLargeQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v18, v19, *v16);

    *(void *)(v6 + 56) = v20;
    id v21 = v18;
    id v22 = objc_msgSend(v7, sel_appearanceInfoWithType_, 0);
    id v23 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSmallQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v21, v22, *v16);

    *(void *)(v6 + 64) = v23;
    id v24 = v21;
    id v25 = objc_msgSend(v7, sel_appearanceInfoWithType_, 1);
    id v26 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSmallQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v24, v25, *v16);

    *(void *)(v6 + 72) = v26;
LABEL_9:
    sub_1B0B8261C();
    return v6;
  }
  if (v4 == (id)1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B0B9EB50;
    uint64_t v27 = self;
    id v28 = a1;
    id v29 = objc_msgSend(v27, sel_appearanceInfoWithType_, 0);
    id v30 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperChromeWithNote_appearanceInfo_, v28, v29);

    *(void *)(v6 + 32) = v30;
    id v31 = v28;
    id v32 = objc_msgSend(v27, sel_appearanceInfoWithType_, 1);
    id v33 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperChromeWithNote_appearanceInfo_, v31, v32);

    *(void *)(v6 + 40) = v33;
    id v34 = v31;
    id v35 = objc_msgSend(v27, sel_appearanceInfoWithType_, 0);
    id v36 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperPreviewWithNote_appearanceInfo_, v34, v35);

    *(void *)(v6 + 48) = v36;
    id v37 = v34;
    id v38 = objc_msgSend(v27, sel_appearanceInfoWithType_, 1);
    id v39 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperPreviewWithNote_appearanceInfo_, v37, v38);

    *(void *)(v6 + 56) = v39;
    id v40 = v37;
    id v41 = objc_msgSend(v27, sel_appearanceInfoWithType_, 0);
    uint64_t v42 = (void *)(v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
    swift_beginAccess();
    id v43 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForLargeQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v40, v41, *v42);

    *(void *)(v6 + 64) = v43;
    id v44 = v40;
    id v45 = objc_msgSend(v27, sel_appearanceInfoWithType_, 1);
    id v46 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForLargeQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v44, v45, *v42);

    *(void *)(v6 + 72) = v46;
    id v47 = v44;
    id v48 = objc_msgSend(v27, sel_appearanceInfoWithType_, 0);
    id v49 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSmallQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v47, v48, *v42);

    *(void *)(v6 + 80) = v49;
    id v50 = v47;
    id v51 = objc_msgSend(v27, sel_appearanceInfoWithType_, 1);
    id v52 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSmallQuickNoteWidgetWithNote_appearanceInfo_traitCollection_, v50, v51, *v42);

    *(void *)(v6 + 88) = v52;
    goto LABEL_9;
  }
  return MEMORY[0x1E4FBC860];
}

unint64_t SystemPaperThumbnailService.updateIfNeeded(for:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v5 = sub_1B0B81C8C();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x1F4188790](v5);
  id v38 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_1B0B81CCC();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  id v36 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B0B81C9C();
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  MEMORY[0x1F4188790](v8);
  id v31 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_t v10 = dispatch_group_create();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 0;
  unint64_t result = sub_1B0B52980(a1);
  unint64_t v13 = result;
  if (!(result >> 62))
  {
    uint64_t v14 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB5780);
    id v20 = v31;
    uint64_t v19 = v32;
    uint64_t v21 = v33;
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, *MEMORY[0x1E4FBCB28], v33);
    id v22 = (void *)sub_1B0B829BC();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
    id v23 = (void *)swift_allocObject();
    v23[2] = v11;
    v23[3] = a1;
    uint64_t v25 = v34;
    uint64_t v24 = v35;
    v23[4] = v34;
    v23[5] = v24;
    aBlock[4] = sub_1B0B5A888;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B0A965E8;
    aBlock[3] = &block_descriptor_22;
    id v26 = _Block_copy(aBlock);
    id v27 = a1;
    swift_retain();
    sub_1B0A46460(v25);
    id v28 = v36;
    sub_1B0B81CAC();
    uint64_t v42 = MEMORY[0x1E4FBC860];
    sub_1B0B5ACAC((unint64_t *)&qword_1EBBB48C0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB48F0);
    sub_1B0A48B54((unint64_t *)&qword_1EBBB4900, (uint64_t *)&unk_1EBBB48F0);
    id v29 = v38;
    uint64_t v30 = v41;
    sub_1B0B82E1C();
    sub_1B0B828DC();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v39);
    swift_release();
    return swift_release();
  }
  unint64_t result = sub_1B0B831DC();
  uint64_t v14 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0) {
        id v16 = (id)MEMORY[0x1B3E9D5F0](v15, v13);
      }
      else {
        id v16 = *(id *)(v13 + 8 * v15 + 32);
      }
      id v17 = v16;
      ++v15;
      dispatch_group_enter(v10);
      swift_retain();
      id v18 = v10;
      sub_1B0B5A0AC(a1, (uint64_t)v17, v3, v11, v18);

      swift_release();
    }
    while (v14 != v15);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1B0B5344C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOBYTE(a1) = *(unsigned char *)(a2 + 16) | (a1 != 0);
  swift_beginAccess();
  *(unsigned char *)(a2 + 16) = a1 & 1;
  dispatch_group_leave(a3);
}

void sub_1B0B534D0(uint64_t a1, void *a2, void (*a3)(void))
{
  swift_beginAccess();
  if (*(unsigned char *)(a1 + 16) == 1 && a2 != 0)
  {
    id v7 = objc_msgSend(a2, sel_objectID);
    if (v7)
    {
      uint64_t v8 = v7;
      if (qword_1EBBB48B8 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_1B0B8093C();
      __swift_project_value_buffer(v9, (uint64_t)qword_1EBBB4898);
      dispatch_group_t v10 = v8;
      uint64_t v11 = sub_1B0B8092C();
      os_log_type_t v12 = sub_1B0B8283C();
      if (os_log_type_enabled(v11, v12))
      {
        unint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v13 = 138412290;
        dispatch_group_t v10 = v10;
        sub_1B0B82DAC();
        *uint64_t v14 = v8;

        _os_log_impl(&dword_1B08EB000, v11, v12, "Updated System Paper thumbnails {objectID: %@}", v13, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4410);
        swift_arrayDestroy();
        MEMORY[0x1B3E9F6B0](v14, -1, -1);
        MEMORY[0x1B3E9F6B0](v13, -1, -1);
      }
      else
      {

        uint64_t v11 = v10;
      }
    }
  }
  if (a3) {
    a3();
  }
}

void SystemPaperThumbnailService.updateIfNeeded(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v65 = a3;
  uint64_t v64 = a2;
  uint64_t v6 = sub_1B0B81C8C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B0B81CCC();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v66 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1B0B81C9C();
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v61 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  dispatch_group_t v74 = v14;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(0, (uint64_t)sub_1B0B5AF1C, v15);
  swift_release();
  uint64_t v71 = v6;
  uint64_t v70 = v7;
  uint64_t v69 = v10;
  uint64_t v68 = v9;
  uint64_t v67 = v11;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B0B82E5C();
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
    sub_1B0A7AB50((unint64_t *)&qword_1EBBB49D8, (unint64_t *)&qword_1EBBB49D0);
    sub_1B0B8277C();
    uint64_t v16 = v88;
    uint64_t v80 = v89;
    uint64_t v17 = v90;
    uint64_t v18 = v91;
    unint64_t v19 = v92;
  }
  else
  {
    uint64_t v20 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v80 = a1 + 56;
    uint64_t v17 = ~v20;
    uint64_t v22 = -v20;
    if (v22 < 64) {
      uint64_t v23 = ~(-1 << v22);
    }
    else {
      uint64_t v23 = -1;
    }
    unint64_t v19 = v23 & v21;
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
    uint64_t v16 = a1;
  }
  uint64_t v76 = v16 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v60 = v17;
  int64_t v79 = (unint64_t)(v17 + 64) >> 6;
  v72 = &v84;
  uint64_t v75 = MEMORY[0x1E4FBC838] + 8;
  v77 = v4;
  uint64_t v73 = v16;
  if ((v16 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_29:
  uint64_t v31 = sub_1B0B82EDC();
  if (!v31) {
    goto LABEL_45;
  }
  uint64_t v81 = v31;
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v30 = aBlock;
  swift_unknownObjectRelease();
  uint64_t v26 = v18;
  uint64_t v24 = v19;
  if (!v30) {
    goto LABEL_45;
  }
  while (1)
  {
    if (objc_msgSend(v30, sel_isEmpty, v60))
    {

      goto LABEL_10;
    }
    if ((objc_msgSend(v30, sel_isDeletedOrInTrash) & 1) == 0)
    {
      dispatch_group_t v39 = v74;
      dispatch_group_enter(v74);
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = v39;
      uint64_t v41 = v39;
      id v42 = v30;
      SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v30, (uint64_t)sub_1B0B5A8A4, v40);

      swift_release();
LABEL_10:
      uint64_t v18 = v26;
      unint64_t v19 = v24;
      if (v16 < 0) {
        goto LABEL_29;
      }
      goto LABEL_11;
    }
    id v78 = v30;
    unint64_t v32 = sub_1B0B52980(v30);
    unint64_t v33 = v32;
    if (v32 >> 62)
    {
      uint64_t v34 = sub_1B0B831DC();
      if (v34)
      {
LABEL_35:
        if (v34 < 1) {
          goto LABEL_47;
        }
        uint64_t v35 = 0;
        id v36 = *(void **)&v77[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService];
        do
        {
          if ((v33 & 0xC000000000000001) != 0) {
            id v37 = (id)MEMORY[0x1B3E9D5F0](v35, v33);
          }
          else {
            id v37 = *(id *)(v33 + 8 * v35 + 32);
          }
          id v38 = v37;
          ++v35;
          objc_msgSend(objc_msgSend(v36, sel_cache), sel_setObject_forKeyedSubscript_, 0, v37);

          swift_unknownObjectRelease();
        }
        while (v34 != v35);
      }
    }
    else
    {
      uint64_t v34 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v34) {
        goto LABEL_35;
      }
    }
    swift_bridgeObjectRelease();
    id v4 = v77;
    id v43 = objc_msgSend(*(id *)&v77[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v4;
    uint64_t v86 = sub_1B0B5A8AC;
    uint64_t v87 = (void *)v44;
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v83 = 1107296256;
    uint64_t v84 = sub_1B0A965E8;
    uint64_t v85 = &block_descriptor_21;
    id v45 = _Block_copy(&aBlock);
    id v46 = v4;
    swift_release();
    objc_msgSend(v43, sel_performBlock_, v45);
    _Block_release(v45);
    id v47 = v78;

    uint64_t v18 = v26;
    unint64_t v19 = v24;
    uint64_t v16 = v73;
    if (v73 < 0) {
      goto LABEL_29;
    }
LABEL_11:
    if (!v19) {
      break;
    }
    uint64_t v24 = (v19 - 1) & v19;
    unint64_t v25 = __clz(__rbit64(v19)) | (v18 << 6);
    uint64_t v26 = v18;
LABEL_27:
    id v30 = *(id *)(*(void *)(v16 + 48) + 8 * v25);
    if (!v30) {
      goto LABEL_45;
    }
  }
  int64_t v27 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
LABEL_47:
    __break(1u);
    return;
  }
  if (v27 >= v79) {
    goto LABEL_45;
  }
  unint64_t v28 = *(void *)(v80 + 8 * v27);
  uint64_t v26 = v18 + 1;
  if (v28) {
    goto LABEL_26;
  }
  uint64_t v26 = v18 + 2;
  if (v18 + 2 >= v79) {
    goto LABEL_45;
  }
  unint64_t v28 = *(void *)(v80 + 8 * v26);
  if (v28) {
    goto LABEL_26;
  }
  uint64_t v26 = v18 + 3;
  if (v18 + 3 >= v79) {
    goto LABEL_45;
  }
  unint64_t v28 = *(void *)(v80 + 8 * v26);
  if (v28) {
    goto LABEL_26;
  }
  uint64_t v26 = v18 + 4;
  if (v18 + 4 >= v79) {
    goto LABEL_45;
  }
  unint64_t v28 = *(void *)(v80 + 8 * v26);
  if (v28)
  {
LABEL_26:
    uint64_t v24 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v26 << 6);
    goto LABEL_27;
  }
  uint64_t v29 = v18 + 5;
  while (v79 != v29)
  {
    unint64_t v28 = *(void *)(v80 + 8 * v29++);
    if (v28)
    {
      uint64_t v26 = v29 - 1;
      goto LABEL_26;
    }
  }
LABEL_45:
  sub_1B0A2E1C8();
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB5780);
  uint64_t v48 = v62;
  id v49 = v61;
  uint64_t v50 = v63;
  (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x1E4FBCB28], v63);
  id v51 = (void *)sub_1B0B829BC();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  id v52 = (void *)swift_allocObject();
  uint64_t v53 = v64;
  v52[2] = v4;
  v52[3] = v53;
  v52[4] = v65;
  uint64_t v86 = sub_1B0B5A898;
  uint64_t v87 = v52;
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v83 = 1107296256;
  uint64_t v84 = sub_1B0A965E8;
  uint64_t v85 = &block_descriptor_12_1;
  uint64_t v54 = _Block_copy(&aBlock);
  uint64_t v55 = v4;
  sub_1B0A46460(v53);
  long long v56 = v66;
  sub_1B0B81CAC();
  uint64_t v81 = MEMORY[0x1E4FBC860];
  sub_1B0B5ACAC((unint64_t *)&qword_1EBBB48C0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB48F0);
  sub_1B0A48B54((unint64_t *)&qword_1EBBB4900, (uint64_t *)&unk_1EBBB48F0);
  long long v57 = v68;
  uint64_t v58 = v71;
  sub_1B0B82E1C();
  dispatch_group_t v59 = v74;
  sub_1B0B828DC();
  _Block_release(v54);

  (*(void (**)(char *, uint64_t))(v70 + 8))(v57, v58);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v56, v69);
  swift_release();
}

{
  char *v3;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void v11[6];

  uint64_t v7 = objc_msgSend(*(id *)&v3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = v3;
  v8[4] = a2;
  v8[5] = a3;
  v11[4] = sub_1B0B5A8CC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B0A965E8;
  v11[3] = &block_descriptor_41_0;
  uint64_t v9 = _Block_copy(v11);
  swift_bridgeObjectRetain();
  uint64_t v10 = v3;
  sub_1B0A46460(a2);
  swift_release();
  objc_msgSend(v7, sel_performBlock_, v9);
  _Block_release(v9);
}

void SystemPaperThumbnailService.invalidate(for:)(void *a1)
{
  unint64_t v2 = sub_1B0B52980(a1);
  unint64_t v3 = v2;
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(*(id *)&v1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v1;
    v13[4] = sub_1B0B5AFC8;
    v13[5] = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 1107296256;
    v13[2] = sub_1B0A965E8;
    v13[3] = &block_descriptor_28_0;
    uint64_t v11 = _Block_copy(v13);
    uint64_t v12 = v1;
    swift_release();
    objc_msgSend(v9, sel_performBlock_, v11);
    _Block_release(v11);

    return;
  }
  uint64_t v4 = sub_1B0B831DC();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void **)&v1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x1B3E9D5F0](v5, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      ++v5;
      objc_msgSend(objc_msgSend(v6, sel_cache), sel_setObject_forKeyedSubscript_, 0, v7);

      swift_unknownObjectRelease();
    }
    while (v4 != v5);
    goto LABEL_10;
  }
  __break(1u);
}

void sub_1B0B54354(char *a1, void (*a2)(void))
{
  id v4 = objc_msgSend(*(id *)&a1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  v8[4] = sub_1B0B5AFC8;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1B0A965E8;
  v8[3] = &block_descriptor_167_0;
  uint64_t v6 = _Block_copy(v8);
  id v7 = a1;
  swift_release();
  objc_msgSend(v4, sel_performBlock_, v6);
  _Block_release(v6);

  if (a2) {
    a2();
  }
}

Swift::Void __swiftcall SystemPaperThumbnailService.updateRecentSystemPaperNote()()
{
}

uint64_t sub_1B0B546E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_msgSend(*(id *)(a2 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService), sel_workerContext);
  sub_1B0B59E68(a1, v7);
  unint64_t v9 = v8;

  unint64_t v17 = MEMORY[0x1E4FBC860];
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    unint64_t v15 = MEMORY[0x1E4FBC860];
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1B0ADCE30(v15);
    swift_bridgeObjectRelease();
    SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v16, a3, a4);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1B0B831DC();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x1B3E9D5F0](i, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * i + 32);
      }
      uint64_t v14 = v13;
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x1B3E9CB90]();
        if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B0B8262C();
        }
        sub_1B0B8265C();
        sub_1B0B8261C();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v15 = v17;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void SystemPaperThumbnailService.updateIfNeeded(completion:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(*(id *)&v2[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  v9[4] = sub_1B0B5A8DC;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1B0A965E8;
  v9[3] = &block_descriptor_47_0;
  id v7 = _Block_copy(v9);
  unint64_t v8 = v2;
  sub_1B0A46460(a1);
  swift_release();
  objc_msgSend(v5, sel_performBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_1B0B54B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EBBB48B8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1B0B8093C();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBBB4898);
  id v7 = sub_1B0B8092C();
  os_log_type_t v8 = sub_1B0B8283C();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_1B08EB000, v7, v8, "Updating all System Paper note thumbnails…", v9, 2u);
    MEMORY[0x1B3E9F6B0](v9, -1, -1);
  }

  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_predicateForSystemPaperNotesNotInTrash);
  id v12 = objc_msgSend(*(id *)(a1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService), sel_workerContext);
  id v13 = objc_msgSend(v10, sel_notesMatchingPredicate_context_, v11, v12);

  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  unint64_t v14 = sub_1B0B825CC();

  uint64_t v15 = sub_1B0ADCE30(v14);
  swift_bridgeObjectRelease();
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v15, a2, a3);
  return swift_bridgeObjectRelease();
}

void sub_1B0B54E7C(uint64_t a1)
{
  uint64_t v2 = sub_1B0B7F70C();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_1B0B7FBEC();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v39 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v40 = (uint64_t)&v36 - v7;
  os_log_type_t v8 = self;
  id v9 = objc_msgSend(*(id *)(a1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService), sel_workerContext);
  id v10 = objc_msgSend(v8, sel_mostRecentSystemPaperNoteInManagedObjectContext_, v9);

  if (v10)
  {
    uint64_t v37 = v4;
    uint64_t v38 = v3;
    id v11 = objc_msgSend(v10, sel_account);
    if (v11
      && (id v12 = v11, v13 = objc_msgSend(v11, sel_identifier), v12, v13))
    {
      uint64_t v14 = sub_1B0B8240C();
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    id v17 = objc_msgSend(v10, sel_identifier);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_1B0B8240C();
      uint64_t v21 = v20;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    uint64_t v22 = (objc_class *)type metadata accessor for ThumbnailKey();
    id v23 = objc_allocWithZone(v22);
    id v24 = ThumbnailKey.init(accountId:objectId:)(v14, v16, v19, v21);
    sub_1B0AF5F88(v40);

    id v25 = objc_allocWithZone(v22);
    uint64_t v26 = (void *)sub_1B0B823CC();
    int64_t v27 = (void *)sub_1B0B823CC();
    id v28 = objc_msgSend(v25, sel_initWithAccountId_objectId_thumbnailId_, 0, v26, v27);

    sub_1B0AF5F88(v39);
    swift_getObjectType();
    sub_1B0B800EC();
    uint64_t v29 = v37;
    sub_1B0B800FC();
    uint64_t v30 = v38;
    if (qword_1EBBB48B8 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1B0B8093C();
    __swift_project_value_buffer(v31, (uint64_t)qword_1EBBB4898);
    unint64_t v32 = sub_1B0B8092C();
    os_log_type_t v33 = sub_1B0B8283C();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_1B08EB000, v32, v33, "Successfully updated recent System Paper thumbnail", v34, 2u);
      MEMORY[0x1B3E9F6B0](v34, -1, -1);
    }

    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v35(v39, v30);
    v35(v40, v30);
  }
}

void SystemPaperThumbnailService.invalidate(for:)(uint64_t a1)
{
  sub_1B0B51CC4(a1, (char *)v1);
}

{
  char *v1;
  id v3;
  uint64_t v4;
  void *v5;
  char *v6;
  void v7[6];

  uint64_t v3 = objc_msgSend(*(id *)&v1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  v7[4] = sub_1B0B5A900;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1B0A965E8;
  v7[3] = &block_descriptor_53;
  uint64_t v5 = _Block_copy(v7);
  swift_bridgeObjectRetain();
  uint64_t v6 = v1;
  swift_release();
  objc_msgSend(v3, sel_performBlock_, v5);
  _Block_release(v5);
}

uint64_t sub_1B0B55960(uint64_t a1, char *a2)
{
  id v4 = objc_msgSend(*(id *)&a2[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  sub_1B0B59E68(a1, v4);
  unint64_t v6 = v5;

  unint64_t v14 = MEMORY[0x1E4FBC860];
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    unint64_t v12 = MEMORY[0x1E4FBC860];
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1B0ADCE30(v12);
    swift_bridgeObjectRelease();
    sub_1B0B51CC4(v13, a2);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1B0B831DC();
  uint64_t v7 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x1B3E9D5F0](i, v6);
      }
      else {
        id v10 = *(id *)(v6 + 8 * i + 32);
      }
      id v11 = v10;
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x1B3E9CB90]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B0B8262C();
        }
        sub_1B0B8265C();
        sub_1B0B8261C();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v12 = v14;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall SystemPaperThumbnailService.invalidate()()
{
}

void sub_1B0B55D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(*(id *)&v3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  v10[4] = a2;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1B0A965E8;
  v10[3] = a3;
  os_log_type_t v8 = _Block_copy(v10);
  id v9 = v3;
  swift_release();
  objc_msgSend(v6, sel_performBlock_, v8);
  _Block_release(v8);
}

uint64_t sub_1B0B55E00(char *a1)
{
  if (qword_1EBBB48B8 != -1) {
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v2 = sub_1B0B8093C();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EBBB4898);
    uint64_t v3 = sub_1B0B8092C();
    os_log_type_t v4 = sub_1B0B8283C();
    if (os_log_type_enabled(v3, v4))
    {
      unint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_1B08EB000, v3, v4, "Invalidating all System Paper note thumbnails…", v5, 2u);
      MEMORY[0x1B3E9F6B0](v5, -1, -1);
    }

    SystemPaperThumbnailService.invalidate(for:)(0);
    id v6 = self;
    id v7 = objc_msgSend(v6, sel_predicateForSystemPaperNotesNotInTrash);
    os_log_type_t v8 = *(void **)&a1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService];
    id v9 = objc_msgSend(v8, sel_workerContext);
    id v10 = objc_msgSend(v6, sel_notesMatchingPredicate_context_, v7, v9);

    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
    unint64_t v11 = sub_1B0B825CC();

    if (!(v11 >> 62))
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v13 = a1;
      swift_bridgeObjectRetain();
      if (!v12) {
        break;
      }
      goto LABEL_6;
    }
    id v28 = a1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B0B831DC();
    if (!v12) {
      break;
    }
LABEL_6:
    uint64_t v14 = 0;
    uint64_t v30 = v12;
    uint64_t v31 = a1;
    while (1)
    {
      id v19 = (v11 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x1B3E9D5F0](v14, v11)
          : *(id *)(v11 + 32 + 8 * v14);
      uint64_t v20 = v19;
      if (__OFADD__(v14++, 1)) {
        break;
      }
      unint64_t v22 = sub_1B0B52980(v19);
      unint64_t v23 = v22;
      if (v22 >> 62)
      {
        uint64_t v24 = sub_1B0B831DC();
        if (!v24) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v24) {
          goto LABEL_7;
        }
      }
      if (v24 < 1) {
        goto LABEL_24;
      }
      uint64_t v25 = 0;
      do
      {
        if ((v23 & 0xC000000000000001) != 0) {
          id v26 = (id)MEMORY[0x1B3E9D5F0](v25, v23);
        }
        else {
          id v26 = *(id *)(v23 + 8 * v25 + 32);
        }
        int64_t v27 = v26;
        ++v25;
        objc_msgSend(objc_msgSend(v8, sel_cache), sel_setObject_forKeyedSubscript_, 0, v26);

        swift_unknownObjectRelease();
      }
      while (v24 != v25);
LABEL_7:
      swift_bridgeObjectRelease();
      id v15 = objc_msgSend(v8, sel_workerContext);
      uint64_t v16 = swift_allocObject();
      a1 = v31;
      *(void *)(v16 + 16) = v31;
      aBlock[4] = sub_1B0B5AFC8;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B0A965E8;
      aBlock[3] = &block_descriptor_150;
      id v17 = _Block_copy(aBlock);
      uint64_t v18 = v31;
      swift_release();
      objc_msgSend(v15, sel_performBlock_, v17);
      _Block_release(v17);

      if (v14 == v30)
      {
        swift_bridgeObjectRelease();

        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_once();
  }
  swift_bridgeObjectRelease();

LABEL_28:
  return swift_bridgeObjectRelease();
}

void sub_1B0B5626C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *(void **)&a1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService];
  os_log_type_t v8 = a1;
  id v9 = objc_msgSend(v7, sel_workerContext);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v13[4] = a4;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1B0A965E8;
  v13[3] = a5;
  unint64_t v11 = _Block_copy(v13);
  uint64_t v12 = v8;
  swift_release();
  objc_msgSend(v9, sel_performBlock_, v11);
  _Block_release(v11);
}

Swift::Void __swiftcall SystemPaperThumbnailService.observe()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45F0);
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v29 = (uint64_t)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45C0);
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3960);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBBB48B8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1B0B8093C();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EBBB4898);
  uint64_t v12 = sub_1B0B8092C();
  os_log_type_t v13 = sub_1B0B8283C();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1B08EB000, v12, v13, "Observing System Paper notes for changes…", v14, 2u);
    MEMORY[0x1B3E9F6B0](v14, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B0B9B8E0;
  sub_1B0B56864((uint64_t)v10);
  *(void *)(swift_allocObject() + 16) = v1;
  sub_1B0A48B54(&qword_1EBBB4608, &qword_1EBBB3960);
  id v16 = v1;
  uint64_t v17 = sub_1B0B80C6C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(v15 + 32) = v17;
  sub_1B0B577F8((uint64_t)v6);
  *(void *)(swift_allocObject() + 16) = v16;
  sub_1B0A48B54(&qword_1EBBB45B8, &qword_1EBBB45C0);
  id v18 = v16;
  uint64_t v19 = v28;
  uint64_t v20 = sub_1B0B80C6C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  *(void *)(v15 + 40) = v20;
  uint64_t v21 = v29;
  sub_1B0B582F8(v29);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v18;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_1B0B5A920;
  *(void *)(v23 + 24) = v22;
  sub_1B0A48B54(&qword_1EBBB45E8, &qword_1EBBB45F0);
  uint64_t v24 = (char *)v18;
  uint64_t v25 = v31;
  uint64_t v26 = sub_1B0B80C6C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v21, v25);
  *(void *)(v15 + 48) = v26;
  uint64_t v32 = v15;
  sub_1B0B8261C();
  *(void *)&v24[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_observations] = v32;
  swift_bridgeObjectRelease();
}

uint64_t sub_1B0B56864@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4970);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v91 = (char *)v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B0B8293C();
  uint64_t v89 = *(void *)(v4 - 8);
  uint64_t v90 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v88 = (char *)v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4968);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v87 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_1B0B81C9C();
  uint64_t v86 = *(void *)(v95 - 8);
  MEMORY[0x1F4188790](v95);
  id v78 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45B0);
  uint64_t v84 = *(void *)(v9 - 8);
  uint64_t v85 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v83 = (void *)((char *)v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4540);
  MEMORY[0x1F4188790](v67);
  uint64_t v12 = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = (void (*)(char *, uint64_t, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4688);
  MEMORY[0x1F4188790](v66);
  uint64_t v14 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4628);
  uint64_t v68 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4530);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  uint64_t v19 = (char *)v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4648);
  uint64_t v71 = *(void (***)(char *, uint64_t))(v72 - 8);
  MEMORY[0x1F4188790](v72);
  uint64_t v21 = (char *)v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4588);
  uint64_t v73 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790](v75);
  unint64_t v92 = (char *)v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45A8);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790](v77);
  dispatch_group_t v74 = (char *)v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45D0);
  uint64_t v80 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v94 = (char *)v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4610);
  uint64_t v26 = MEMORY[0x1F4188790](v25 - 8);
  uint64_t v81 = (char *)v65 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)v65 - v28;
  uint64_t v30 = v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didUpdateSystemPaperNotes;
  swift_beginAccess();
  uint64_t v79 = v30;
  sub_1B0A48C00(v30, (uint64_t)v29, &qword_1EBBB4610);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3960);
  uint64_t v32 = *(void *)(v31 - 8);
  os_log_type_t v33 = *(unsigned int (**)(char *, uint64_t))(v32 + 48);
  uint64_t v93 = v31;
  if (v33(v29, 1) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v96, v29, v93);
  }
  sub_1B0A2E21C((uint64_t)v29, &qword_1EBBB4610);
  sub_1B0B59228(&OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidUpdateObject, (uint64_t)sub_1B0B58958, (uint64_t)sub_1B0B58964, (uint64_t)v14);
  sub_1B0B58968((uint64_t)v12);
  sub_1B0A48B54(&qword_1EBBB4680, &qword_1EBBB4688);
  sub_1B0A48B54(&qword_1EBBB4538, &qword_1EBBB4540);
  sub_1B0B80A5C();
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  sub_1B0A48B54(&qword_1EBBB4620, &qword_1EBBB4628);
  sub_1B0B80B9C();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v17, v15);
  sub_1B0A48B54(&qword_1EBBB4528, &qword_1EBBB4530);
  uint64_t v34 = v70;
  sub_1B0B80C0C();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v34);
  swift_getKeyPath();
  sub_1B0A48B54(&qword_1EBBB4640, &qword_1EBBB4648);
  uint64_t v35 = v72;
  sub_1B0B80BAC();
  swift_release();
  v71[1](v21, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4980);
  uint64_t v36 = v83;
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB5780);
  LODWORD(v72) = *MEMORY[0x1E4FBCB28];
  uint64_t v37 = v86;
  uint64_t v38 = v78;
  uint64_t v39 = *(void (***)(char *, uint64_t))(v86 + 104);
  uint64_t v70 = v86 + 104;
  uint64_t v71 = v39;
  uint64_t v40 = v95;
  ((void (*)(char *))v39)(v78);
  uint64_t v41 = sub_1B0B829BC();
  uint64_t v69 = *(void *)(v37 + 8);
  ((void (*)(char *, uint64_t))v69)(v38, v40);
  *uint64_t v36 = v41;
  sub_1B0B8292C();
  uint64_t v42 = *MEMORY[0x1E4F1A928];
  uint64_t v86 = v32;
  uint64_t v44 = v84;
  uint64_t v43 = v85;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v84 + 104))(v36, v42, v85);
  uint64_t v67 = sub_1B0B8290C();
  uint64_t v45 = *(void *)(v67 - 8);
  uint64_t v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56);
  uint64_t v68 = v45 + 56;
  uint64_t v46 = (uint64_t)v87;
  v66(v87, 1, 1, v67);
  sub_1B0A48B54(&qword_1EBBB4580, &qword_1EBBB4588);
  v65[1] = sub_1B0A7AB50(&qword_1EBBB4978, (unint64_t *)&qword_1EBBB5780);
  id v47 = v74;
  uint64_t v48 = v75;
  id v49 = v92;
  sub_1B0B80C1C();
  sub_1B0A2E21C(v46, &qword_1EBBB4968);
  (*(void (**)(uint64_t *, uint64_t))(v44 + 8))(v36, v43);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v49, v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4938);
  sub_1B0A48B54(&qword_1EBBB45A0, &qword_1EBBB45A8);
  uint64_t v50 = v77;
  sub_1B0B80BBC();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v47, v50);
  id v51 = v88;
  sub_1B0B8292C();
  uint64_t v52 = (uint64_t)v91;
  sub_1B0B8291C();
  uint64_t v54 = v89;
  uint64_t v53 = v90;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v89 + 56))(v52, 0, 1, v90);
  uint64_t v55 = v95;
  ((void (*)(char *, void, uint64_t))v71)(v38, v72, v95);
  long long v56 = (void *)sub_1B0B829BC();
  ((void (*)(char *, uint64_t))v69)(v38, v55);
  id v97 = v56;
  v66((char *)v46, 1, 1, v67);
  sub_1B0A48B54(&qword_1EBBB45C8, &qword_1EBBB45D0);
  uint64_t v57 = v96;
  uint64_t v58 = v82;
  dispatch_group_t v59 = v94;
  sub_1B0B80BCC();
  sub_1B0A2E21C(v46, &qword_1EBBB4968);

  sub_1B0A2E21C(v52, &qword_1EBBB4970);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v53);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v59, v58);
  uint64_t v60 = v86;
  uint64_t v61 = (uint64_t)v81;
  uint64_t v62 = v93;
  (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v81, v57, v93);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v61, 0, 1, v62);
  uint64_t v63 = v79;
  swift_beginAccess();
  sub_1B0B0234C(v61, v63, &qword_1EBBB4610);
  return swift_endAccess();
}

void sub_1B0B576E0(uint64_t *a1, char *a2)
{
  uint64_t v3 = *a1;
  id v4 = objc_msgSend(*(id *)&a2[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v3;
  v5[3] = a2;
  v5[4] = 0;
  v5[5] = 0;
  v8[4] = sub_1B0B5AF10;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1B0A965E8;
  v8[3] = &block_descriptor_137;
  uint64_t v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  uint64_t v7 = a2;
  swift_release();
  objc_msgSend(v4, sel_performBlock_, v6);
  _Block_release(v6);
}

uint64_t sub_1B0B577F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4968);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v62 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B0B81C9C();
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v53 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45B0);
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  MEMORY[0x1F4188790](v6);
  dispatch_group_t v59 = (uint64_t *)((char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4688);
  uint64_t v45 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4520);
  uint64_t v46 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4638);
  uint64_t v47 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4578);
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v48 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4598);
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x1F4188790](v56);
  uint64_t v50 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC70);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v55 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v45 - v22;
  uint64_t v24 = v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didDeleteSystemPaperNotes;
  swift_beginAccess();
  uint64_t v52 = v24;
  sub_1B0A48C00(v24, (uint64_t)v23, &qword_1E9B4CC70);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45C0);
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v23, 1, v25) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v63, v23, v25);
  }
  sub_1B0A2E21C((uint64_t)v23, &qword_1E9B4CC70);
  sub_1B0B59228(&OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidDeleteObject, (uint64_t)sub_1B0B596B4, (uint64_t)sub_1B0B58964, (uint64_t)v10);
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  sub_1B0A48B54(&qword_1EBBB4680, &qword_1EBBB4688);
  sub_1B0B80B9C();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v8);
  sub_1B0A48B54(&qword_1EBBB4518, &qword_1EBBB4520);
  sub_1B0B80C0C();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v13, v11);
  swift_getKeyPath();
  sub_1B0A48B54(&qword_1EBBB4630, &qword_1EBBB4638);
  uint64_t v27 = v48;
  sub_1B0B80BAC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4980);
  uint64_t v28 = v59;
  uint64_t v47 = v25;
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB5780);
  uint64_t v30 = v57;
  uint64_t v29 = v58;
  uint64_t v31 = v53;
  (*(void (**)(char *, void, uint64_t))(v57 + 104))(v53, *MEMORY[0x1E4FBCB28], v58);
  uint64_t v32 = sub_1B0B829BC();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
  uint64_t *v28 = v32;
  sub_1B0B8292C();
  uint64_t v34 = v60;
  uint64_t v33 = v61;
  (*(void (**)(uint64_t *, void, uint64_t))(v60 + 104))(v28, *MEMORY[0x1E4F1A928], v61);
  uint64_t v35 = sub_1B0B8290C();
  uint64_t v36 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v62, 1, 1, v35);
  sub_1B0A48B54(&qword_1EBBB4570, &qword_1EBBB4578);
  sub_1B0A7AB50(&qword_1EBBB4978, (unint64_t *)&qword_1EBBB5780);
  uint64_t v38 = v50;
  uint64_t v37 = v51;
  sub_1B0B80C1C();
  sub_1B0A2E21C(v36, &qword_1EBBB4968);
  (*(void (**)(uint64_t *, uint64_t))(v34 + 8))(v28, v33);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v27, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4938);
  sub_1B0A48B54(&qword_1EBBB4590, &qword_1EBBB4598);
  uint64_t v39 = v63;
  uint64_t v40 = v56;
  sub_1B0B80BBC();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v40);
  uint64_t v41 = (uint64_t)v55;
  uint64_t v42 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v55, v39, v47);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v41, 0, 1, v42);
  uint64_t v43 = v52;
  swift_beginAccess();
  sub_1B0B0234C(v41, v43, &qword_1E9B4CC70);
  return swift_endAccess();
}

void sub_1B0B581E4(uint64_t *a1, char *a2)
{
  uint64_t v3 = *a1;
  id v4 = objc_msgSend(*(id *)&a2[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = a2;
  v8[4] = sub_1B0B5AF0C;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1B0A965E8;
  v8[3] = &block_descriptor_130;
  uint64_t v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  uint64_t v7 = a2;
  swift_release();
  objc_msgSend(v4, sel_performBlock_, v6);
  _Block_release(v6);
}

uint64_t sub_1B0B582F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB46D0);
  uint64_t v3 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45F8);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = v1 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___accessibilityAppearanceDidChange;
  swift_beginAccess();
  sub_1B0A48C00(v12, (uint64_t)v11, &qword_1EBBB45F8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45F0);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a1, v11, v13);
  }
  sub_1B0A2E21C((uint64_t)v11, &qword_1EBBB45F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A58);
  uint64_t v29 = sub_1B0B82B3C();
  uint64_t v30 = a1;
  uint64_t v26 = v12;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1B0B9A2F0;
  uint64_t v31 = v9;
  uint64_t v15 = self;
  id v16 = objc_msgSend(v15, sel_defaultCenter);
  sub_1B0B82B4C();

  uint64_t v27 = v3;
  id v17 = objc_msgSend(v15, sel_defaultCenter);
  sub_1B0B82B4C();

  id v18 = objc_msgSend(v15, sel_defaultCenter);
  sub_1B0B82B4C();

  id v19 = objc_msgSend(v15, sel_defaultCenter);
  sub_1B0B82B4C();

  sub_1B0B5ACAC(&qword_1EBBB49B0, MEMORY[0x1E4F27FC8]);
  sub_1B0B80A9C();
  sub_1B0A48B54(&qword_1EBBB46C8, &qword_1EBBB46D0);
  uint64_t v20 = v30;
  uint64_t v21 = v32;
  sub_1B0B80BBC();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v21);
  uint64_t v22 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v31, v20, v13);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v13);
  uint64_t v23 = v26;
  swift_beginAccess();
  sub_1B0B0234C(v22, v23, &qword_1EBBB45F8);
  return swift_endAccess();
}

void sub_1B0B587C4(char *a1)
{
  id v2 = objc_msgSend(*(id *)&a1[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService], sel_workerContext);
  uint64_t v3 = (void *)swift_allocObject();
  v3[3] = 0;
  v3[4] = 0;
  v3[2] = a1;
  v6[4] = sub_1B0B5B01C;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1B0A965E8;
  v6[3] = &block_descriptor_123;
  uint64_t v4 = _Block_copy(v6);
  uint64_t v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_performBlock_, v4);
  _Block_release(v4);
}

uint64_t sub_1B0B58958@<X0>(void *a1@<X8>)
{
  return sub_1B0B596C0(a1);
}

uint64_t sub_1B0B58968@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB49E8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B0B82B3C();
  uint64_t v40 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB46E0);
  uint64_t v41 = *(void *)(v10 - 8);
  uint64_t v42 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4558);
  uint64_t v45 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v43 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4548);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v46 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v37 - v18;
  uint64_t v20 = v2 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___cacheDidInvalidateObject;
  swift_beginAccess();
  uint64_t v44 = v20;
  sub_1B0A48C00(v20, (uint64_t)v19, &qword_1EBBB4548);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4540);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(a1, v19, v21);
  }
  sub_1B0A2E21C((uint64_t)v19, &qword_1EBBB4548);
  id v23 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v24 = @"ICThumbnailCacheDidInvalidateThumbnailNotification";
  uint64_t v39 = v13;
  uint64_t v25 = v24;
  sub_1B0B82B4C();

  id v47 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v26 = sub_1B0B82D2C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4A00);
  uint64_t v38 = a1;
  sub_1B0B5ACAC(&qword_1EBBB49B0, MEMORY[0x1E4F27FC8]);
  uint64_t v37 = v2;
  sub_1B0A7AB50(&qword_1EBBB49F8, (unint64_t *)&qword_1EBBB4A00);
  sub_1B0B80C2C();
  sub_1B0A2E21C((uint64_t)v6, &qword_1EBBB49E8);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v7);
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
  sub_1B0A48B54(&qword_1EBBB46D8, &qword_1EBBB46E0);
  uint64_t v28 = v42;
  uint64_t v27 = v43;
  sub_1B0B80B9C();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v28);
  id v29 = objc_msgSend(*(id *)(v37 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService), sel_viewContext);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_1B0B5ADFC;
  *(void *)(v31 + 24) = v30;
  sub_1B0A2E124(0, (unint64_t *)&unk_1EBBB4950);
  uint64_t v33 = v38;
  uint64_t v32 = v39;
  sub_1B0B80A3C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v32);
  uint64_t v34 = (uint64_t)v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v46, v33, v21);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v34, 0, 1, v21);
  uint64_t v35 = v44;
  swift_beginAccess();
  sub_1B0B0234C(v34, v35, &qword_1EBBB4548);
  return swift_endAccess();
}

uint64_t sub_1B0B59020@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1B0B7F85C();
  if (!v2)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_10:
    uint64_t result = sub_1B0A2E21C((uint64_t)&v8, &qword_1EBBB5790);
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  sub_1B0B8240C();
  sub_1B0B82F3C();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_1B0A26374((uint64_t)v7), (v5 & 1) != 0))
  {
    sub_1B0A2DF34(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1B0A2DFEC((uint64_t)v7);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_10;
  }
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_11:
  }
    *a1 = 0;
  return result;
}

id sub_1B0B5912C@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v5 = *a1;
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    *a2 = v3;
    return v5;
  }
  else
  {
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (result)
    {
      id result = objc_msgSend(result, sel_note);
      *a2 = (uint64_t)result;
    }
    else
    {
      *a2 = 0;
    }
  }
  return result;
}

uint64_t sub_1B0B591E0@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1B0ADCE60(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_1B0B59228@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v33 = sub_1B0B82B3C();
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  long long v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4568);
  uint64_t v34 = *(void *)(v10 - 8);
  uint64_t v35 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4690);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v29 - v17;
  uint64_t v19 = v4 + *a1;
  swift_beginAccess();
  sub_1B0A48C00(v19, (uint64_t)v18, &qword_1EBBB4690);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4688);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(a4, v18, v20);
  }
  sub_1B0A2E21C((uint64_t)v18, &qword_1EBBB4690);
  id v22 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v30 = a4;
  id v23 = objc_msgSend(*(id *)(v4 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService), sel_viewContext);
  v29[1] = a3;
  id v24 = v23;
  sub_1B0B82B4C();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4920);
  sub_1B0B5ACAC(&qword_1EBBB49B0, MEMORY[0x1E4F27FC8]);
  uint64_t v25 = v33;
  sub_1B0B80B9C();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v25);
  sub_1B0B80AAC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB46C0);
  sub_1B0A48B54(&qword_1EBBB4560, &qword_1EBBB4568);
  sub_1B0A48B54(&qword_1EBBB46B8, &qword_1EBBB46C0);
  uint64_t v26 = v30;
  uint64_t v27 = v35;
  sub_1B0B80C7C();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v16, v26, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v16, 0, 1, v20);
  swift_beginAccess();
  sub_1B0B0234C((uint64_t)v16, v19, &qword_1EBBB4690);
  return swift_endAccess();
}

uint64_t sub_1B0B596B4@<X0>(void *a1@<X8>)
{
  return sub_1B0B596C0(a1);
}

uint64_t sub_1B0B596C0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1B0B7F85C();
  if (!v2)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_10:
    uint64_t result = sub_1B0A2E21C((uint64_t)&v8, &qword_1EBBB5790);
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  sub_1B0B8240C();
  sub_1B0B82F3C();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_1B0A26374((uint64_t)v7), (v5 & 1) != 0))
  {
    sub_1B0A2DF34(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1B0A2DFEC((uint64_t)v7);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4920);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_11:
  }
    *a1 = 0;
  return result;
}

uint64_t sub_1B0B597C4()
{
  return sub_1B0B80A8C();
}

id sub_1B0B5985C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  self;
  id result = (id)swift_dynamicCastObjCClass();
  id v5 = result;
  if (result) {
    id result = v3;
  }
  *a2 = v5;
  return result;
}

id sub_1B0B598B0(id *a1)
{
  return objc_msgSend(*a1, sel_isSystemPaper);
}

id SystemPaperThumbnailService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SystemPaperThumbnailService.init()()
{
}

void sub_1B0B59968()
{
}

id sub_1B0B5998C(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection] = 0;
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_observations] = MEMORY[0x1E4FBC860];
  uint64_t v7 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidUpdateObject];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4688);
  long long v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  uint64_t v10 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___cacheDidInvalidateObject];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4540);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didUpdateSystemPaperNotes];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3960);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v9(&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidDeleteObject], 1, 1, v8);
  uint64_t v14 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didDeleteSystemPaperNotes];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45C0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___accessibilityAppearanceDidChange];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45F0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_fileManager];
  uint64_t v19 = MEMORY[0x1E4F82F88];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = v19;
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService] = a2;
  v21.receiver = a3;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_1B0B59BF0(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection] = 0;
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_observations] = MEMORY[0x1E4FBC860];
  uint64_t v10 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidUpdateObject];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4688);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  uint64_t v13 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___cacheDidInvalidateObject];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4540);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didUpdateSystemPaperNotes];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3960);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v12(&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidDeleteObject], 1, 1, v11);
  uint64_t v17 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didDeleteSystemPaperNotes];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45C0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___accessibilityAppearanceDidChange];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB45F0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  objc_super v21 = &a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_fileManager];
  *(void *)objc_super v21 = a1;
  *((void *)v21 + 1) = a5;
  *(void *)&a3[OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService] = a2;
  v23.receiver = a3;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t sub_1B0B59E58()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

void sub_1B0B59E68(uint64_t a1, void *a2)
{
  unint64_t v3 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_1B0B82EAC();
    if (!v4) {
      return;
    }
    uint64_t v25 = MEMORY[0x1E4FBC860];
    sub_1B0B830BC();
    uint64_t v22 = sub_1B0B82E4C();
    uint64_t v23 = v5;
    unsigned __int8 v24 = 1;
    if ((v4 & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    __break(1u);
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v25 = MEMORY[0x1E4FBC860];
    sub_1B0B830BC();
    uint64_t v22 = sub_1B0ADC7D8(a1);
    uint64_t v23 = v6;
    unsigned __int8 v24 = v7 & 1;
    while (1)
    {
LABEL_9:
      while (1)
      {
        uint64_t v13 = v22;
        uint64_t v14 = v23;
        uint64_t v15 = v24;
        sub_1B0ADC7C4(v22, v23, v24, a1);
        uint64_t v17 = v16;
        id v18 = objc_msgSend(a2, sel_objectWithID_, v16);

        sub_1B0B8308C();
        sub_1B0B830CC();
        sub_1B0B830DC();
        sub_1B0B8309C();
        if (v3) {
          break;
        }
        uint64_t v8 = sub_1B0B0FA14(v13, v14, v15, a1);
        uint64_t v10 = v9;
        char v12 = v11;
        sub_1B0A2E280(v13, v14, v15);
        uint64_t v22 = v8;
        uint64_t v23 = v10;
        unsigned __int8 v24 = v12 & 1;
        if (!--v4) {
          goto LABEL_14;
        }
      }
      if ((v15 & 1) == 0) {
        break;
      }
      if (sub_1B0B82E6C()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC78);
      uint64_t v19 = (void (*)(unsigned char *, void))sub_1B0B8276C();
      sub_1B0B82F0C();
      v19(v21, 0);
      if (!--v4)
      {
LABEL_14:
        sub_1B0A2E280(v22, v23, v24);
        return;
      }
    }

    __break(1u);
  }
}

uint64_t sub_1B0B5A0AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v65 = a1;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  uint64_t v9 = MEMORY[0x1F4188790](v67);
  uint64_t v63 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v66 = (char *)&v59 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v59 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v59 - v16;
  uint64_t v18 = sub_1B0B7FDEC();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v62 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  unsigned __int8 v24 = (char *)&v59 - v23;
  MEMORY[0x1F4188790](v22);
  uint64_t v68 = (char *)&v59 - v25;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = a4;
  *(void *)(v26 + 24) = a5;
  uint64_t v27 = *(void **)(a3 + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
  uint64_t v64 = a4;
  swift_retain();
  uint64_t v28 = a5;
  id v69 = v27;
  id v29 = objc_msgSend(v27, sel_cache);
  uint64_t v70 = a2;
  id v30 = objc_msgSend(v29, sel_creationDateFor_, a2);
  swift_unknownObjectRelease();
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    goto LABEL_9;
  }
  dispatch_group_t v60 = v28;
  sub_1B0B7FDAC();

  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  v31(v17, v24, v18);
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v61(v17, 0, 1, v18);
  uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v32(v17, 1, v18) == 1)
  {
LABEL_9:
    sub_1B0A2E21C((uint64_t)v17, &qword_1EBBB44D8);
    uint64_t v75 = sub_1B0B5AF04;
    uint64_t v76 = v26;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v72 = 1107296256;
    uint64_t v73 = sub_1B0A5ADEC;
    dispatch_group_t v74 = &block_descriptor_173;
    uint64_t v44 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v69, sel_thumbnailWithConfiguration_completion_, v70, v44);
    _Block_release(v44);
    return swift_release();
  }
  v31(v68, v17, v18);
  if (qword_1EBBB4780 != -1) {
    swift_once();
  }
  dispatch_group_t v59 = (void (*)(char *, uint64_t, uint64_t))v31;
  uint64_t v33 = __swift_project_value_buffer(v67, (uint64_t)qword_1EBBB4450);
  sub_1B0A48C00(v33, (uint64_t)v15, &qword_1EBBB44D8);
  uint64_t v34 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v32;
  if (v32(v15, 1, v18) != 1)
  {
    uint64_t v35 = v68;
    char v36 = sub_1B0B7FD7C();
    uint64_t v37 = v15;
    uint64_t v38 = *(void (**)(char *, uint64_t))(v19 + 8);
    v38(v37, v18);
    if (v36)
    {
      id v39 = v69;
      id v40 = objc_msgSend(v69, sel_cache);
      uint64_t v41 = v70;
      objc_msgSend(v40, sel_setObject_forKeyedSubscript_, 0, v70);
      swift_unknownObjectRelease();
      uint64_t v75 = sub_1B0B5AF04;
      uint64_t v76 = v26;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v72 = 1107296256;
      uint64_t v73 = sub_1B0A5ADEC;
      dispatch_group_t v74 = &block_descriptor_179;
      uint64_t v42 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v39, sel_thumbnailWithConfiguration_completion_, v41, v42);
      _Block_release(v42);
      uint64_t v43 = v35;
LABEL_19:
      v38(v43, v18);
      return swift_release();
    }
    if (v65)
    {
      id v45 = objc_msgSend(v65, sel_modificationDate);
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = (uint64_t)v63;
        sub_1B0B7FDAC();

        uint64_t v48 = 0;
      }
      else
      {
        uint64_t v48 = 1;
        uint64_t v47 = (uint64_t)v63;
      }
      v61((char *)v47, v48, 1, v18);
      uint64_t v49 = (uint64_t)v66;
      sub_1B0B3C388(v47, (uint64_t)v66);
      if (v34(v49, 1, v18) != 1)
      {
        uint64_t v54 = v62;
        v59(v62, v49, v18);
        uint64_t v50 = v68;
        if (sub_1B0B7FD7C())
        {
          id v55 = v69;
          id v56 = objc_msgSend(v69, sel_cache);
          uint64_t v57 = v70;
          objc_msgSend(v56, sel_setObject_forKeyedSubscript_, 0, v70);
          swift_unknownObjectRelease();
          uint64_t v75 = sub_1B0B5AF04;
          uint64_t v76 = v26;
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v72 = 1107296256;
          uint64_t v73 = sub_1B0A5ADEC;
          dispatch_group_t v74 = &block_descriptor_176;
          uint64_t v58 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          objc_msgSend(v55, sel_thumbnailWithConfiguration_completion_, v57, v58);
          _Block_release(v58);
          v38(v54, v18);
          goto LABEL_18;
        }
        v38(v54, v18);
LABEL_17:
        uint64_t v51 = v64;
        swift_beginAccess();
        char v52 = *(unsigned char *)(v51 + 16);
        swift_beginAccess();
        *(unsigned char *)(v51 + 16) = v52;
        dispatch_group_leave(v60);
LABEL_18:
        uint64_t v43 = v50;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v49 = (uint64_t)v66;
      v61(v66, 1, 1, v18);
    }
    sub_1B0A2E21C(v49, &qword_1EBBB44D8);
    uint64_t v50 = v68;
    goto LABEL_17;
  }

  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1B0B5A870()
{
  return objectdestroy_2Tm(MEMORY[0x1E4FBC8D0]);
}

void sub_1B0B5A888()
{
  sub_1B0B534D0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32));
}

void sub_1B0B5A898()
{
  sub_1B0B54354(*(char **)(v0 + 16), *(void (**)(void))(v0 + 24));
}

void sub_1B0B5A8A4()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

void sub_1B0B5A8AC()
{
  sub_1B0B54E7C(*(void *)(v0 + 16));
}

uint64_t sub_1B0B5A8B4()
{
  return objectdestroy_2Tm(MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B0B5A8CC()
{
  return sub_1B0B546E4(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1B0B5A8DC()
{
  return sub_1B0B54B28(v0[2], v0[3], v0[4]);
}

uint64_t sub_1B0B5A8E8()
{
  return objectdestroy_49Tm(MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B0B5A900()
{
  return sub_1B0B55960(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_1B0B5A908()
{
  return sub_1B0B55E00(*(char **)(v0 + 16));
}

void sub_1B0B5A910(uint64_t *a1)
{
  sub_1B0B576E0(a1, *(char **)(v1 + 16));
}

void sub_1B0B5A918(uint64_t *a1)
{
  sub_1B0B581E4(a1, *(char **)(v1 + 16));
}

void sub_1B0B5A920()
{
  sub_1B0B587C4(*(char **)(v0 + 16));
}

uint64_t sub_1B0B5A928(uint64_t a1)
{
  return sub_1B0B00638(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1B0B5A930()
{
  return type metadata accessor for SystemPaperThumbnailService();
}

uint64_t type metadata accessor for SystemPaperThumbnailService()
{
  uint64_t result = qword_1EBBB4878;
  if (!qword_1EBBB4878) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B0B5A984()
{
  sub_1B0B5ABAC(319, &qword_1EBBB4698, &qword_1EBBB4688);
  if (v0 <= 0x3F)
  {
    sub_1B0B5ABAC(319, &qword_1EBBB4550, &qword_1EBBB4540);
    if (v1 <= 0x3F)
    {
      sub_1B0B5ABAC(319, &qword_1EBBB4618, &qword_1EBBB3960);
      if (v2 <= 0x3F)
      {
        sub_1B0B5ABAC(319, &qword_1E9B4CC68, &qword_1EBBB45C0);
        if (v3 <= 0x3F)
        {
          sub_1B0B5ABAC(319, &qword_1EBBB4600, &qword_1EBBB45F0);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for SystemPaperThumbnailService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SystemPaperThumbnailService);
}

uint64_t dispatch thunk of SystemPaperThumbnailService.__allocating_init(fileManager:thumbnailService:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

void sub_1B0B5ABAC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_1B0B82D7C();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1B0B5ABFC()
{
  return objectdestroy_49Tm(MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B0B5AC18()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0B5AC50()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t objectdestroy_8Tm_0()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B0B5ACAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B0B5ACF4()
{
  return objectdestroy_49Tm(MEMORY[0x1E4FBC898]);
}

char *keypath_get_selector_objectID()
{
  return sel_objectID;
}

id sub_1B0B5AD18@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_objectID);
  *a2 = result;
  return result;
}

uint64_t sub_1B0B5AD54()
{
  return objectdestroy_2Tm(MEMORY[0x1E4FBC898]);
}

uint64_t objectdestroy_2Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  if (*(void *)(v1 + 32)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v1, 48, 7);
}

uint64_t sub_1B0B5ADC4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B0B5ADFC(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(v1 + 16), sel_objectWithID_, a1);
  return v2;
}

uint64_t sub_1B0B5AE38()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0B5AE70@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B0B5AEA4()
{
  return objectdestroy_49Tm(MEMORY[0x1E4FBC8D0]);
}

uint64_t objectdestroy_49Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  return MEMORY[0x1F4186498](v1, 32, 7);
}

void sub_1B0B5AF04(uint64_t a1)
{
  sub_1B0B5344C(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_1B0B5B020(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_1B0B8019C();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t LinkSuggestionsView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

double LinkSuggestionsView.init(viewModel:)@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t *)(a1 + *(int *)(type metadata accessor for LinkSuggestionsView(0) + 24));
  *uint64_t v2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for LinkEditorViewModel();
  sub_1B0B638C4(&qword_1E9B4CC88, (void (*)(uint64_t))type metadata accessor for LinkEditorViewModel);
  swift_retain();
  *(void *)(a1 + 48) = sub_1B0B80DBC();
  *(void *)(a1 + 56) = v3;
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_1B0B823CC();
  id v6 = objc_msgSend(v4, sel_localizedFrameworkStringForKey_value_table_allowSiri_, v5, 0, 0, 1);

  uint64_t v7 = sub_1B0B8240C();
  uint64_t v9 = v8;

  uint64_t v10 = (void *)sub_1B0B823CC();
  id v11 = objc_msgSend(v4, sel_localizedFrameworkStringForKey_value_table_allowSiri_, v10, 0, 0, 1);

  uint64_t v12 = sub_1B0B8240C();
  uint64_t v14 = v13;
  swift_release();

  *(void *)&double result = 1;
  *(_OWORD *)a1 = xmmword_1B0B9EC30;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v14;
  return result;
}

uint64_t type metadata accessor for LinkSuggestionsView(uint64_t a1)
{
  return sub_1B0A5E8D0(a1, (uint64_t *)&unk_1E9B4CD10);
}

uint64_t sub_1B0B5B2F0()
{
  return sub_1B0B80F9C();
}

uint64_t sub_1B0B5B314(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
  MEMORY[0x1F4188790](v2 - 8);
  sub_1B0A48C00(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9B4CD00);
  return sub_1B0B80FAC();
}

uint64_t LinkSuggestionsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC90);
  MEMORY[0x1F4188790](v36);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC98);
  MEMORY[0x1F4188790](v34);
  uint64_t v32 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCA0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCA8);
  MEMORY[0x1F4188790](v31);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCB0);
  uint64_t v10 = MEMORY[0x1F4188790](v33);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v30 - v13;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  if (v37 == 1)
  {
    *(void *)uint64_t v7 = sub_1B0B8121C();
    *((void *)v7 + 1) = 0;
    v7[16] = 1;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCF8);
    sub_1B0B5B804(v1, (uint64_t)&v7[*(int *)(v15 + 44)]);
    char v16 = sub_1B0B8158C();
    sub_1B0B80C8C();
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    sub_1B0A48C00((uint64_t)v7, (uint64_t)v9, &qword_1E9B4CCA0);
    uint64_t v25 = &v9[*(int *)(v31 + 36)];
    char *v25 = v16;
    *((void *)v25 + 1) = v18;
    *((void *)v25 + 2) = v20;
    *((void *)v25 + 3) = v22;
    *((void *)v25 + 4) = v24;
    v25[40] = 0;
    sub_1B0A2E21C((uint64_t)v7, &qword_1E9B4CCA0);
    char v26 = sub_1B0B8158C();
    sub_1B0A48C00((uint64_t)v9, (uint64_t)v12, &qword_1E9B4CCA8);
    v12[*(int *)(v33 + 36)] = v26;
    sub_1B0A2E21C((uint64_t)v9, &qword_1E9B4CCA8);
    uint64_t v27 = &qword_1E9B4CCB0;
    sub_1B0A24FC4((uint64_t)v12, (uint64_t)v14, &qword_1E9B4CCB0);
    sub_1B0A48C00((uint64_t)v14, v32, &qword_1E9B4CCB0);
    swift_storeEnumTagMultiPayload();
    sub_1B0B64104(&qword_1E9B4CCB8, &qword_1E9B4CCB0, (void (*)(void))sub_1B0B5C1B0);
    sub_1B0B5C250();
    sub_1B0B8135C();
    uint64_t v28 = (uint64_t)v14;
  }
  else
  {
    sub_1B0B5B804(v1, (uint64_t)v3);
    uint64_t v27 = &qword_1E9B4CC90;
    sub_1B0A48C00((uint64_t)v3, v32, &qword_1E9B4CC90);
    swift_storeEnumTagMultiPayload();
    sub_1B0B64104(&qword_1E9B4CCB8, &qword_1E9B4CCB0, (void (*)(void))sub_1B0B5C1B0);
    sub_1B0B5C250();
    sub_1B0B8135C();
    uint64_t v28 = (uint64_t)v3;
  }
  return sub_1B0A2E21C(v28, v27);
}

uint64_t sub_1B0B5B804@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCE0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v67 = (uint64_t)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LinkSuggestionsView(0);
  uint64_t v68 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v69 = v7;
  uint64_t v70 = (uint64_t)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE50);
  uint64_t v71 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v72 = (char *)&v60 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE58);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v66 = (uint64_t)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v65 = (uint64_t)&v60 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v60 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v73 = (uint64_t)&v60 - v21;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = v74;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = v74;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  if (v74 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCF0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(a2, 1, 1, v51);
  }
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  if (!*(void *)(v22 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE70);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v73, 1, 1, v53);
    if (*(void *)(v23 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE70);
    uint64_t v50 = v65;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v65, 1, 1, v54);
    goto LABEL_8;
  }
  uint64_t v24 = a1[3];
  uint64_t v74 = a1[2];
  uint64_t v75 = v24;
  swift_bridgeObjectRetain();
  sub_1B0B80D0C();
  sub_1B0B63A84();
  uint64_t v64 = v8;
  sub_1B0B818EC();
  swift_bridgeObjectRelease();
  uint64_t v61 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v24) = v74;
  uint64_t v25 = v70;
  sub_1B0B63AD8((uint64_t)a1, v70);
  unint64_t v26 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  uint64_t v27 = swift_allocObject();
  sub_1B0B63B40(v25, v27 + v26);
  uint64_t v28 = v23;
  uint64_t v29 = v71;
  uint64_t v30 = v72;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  v31(v11, v72, v64);
  v31(v20, v11, v64);
  uint64_t v32 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE68) + 48)];
  uint64_t v33 = v61;
  *(void *)uint64_t v32 = v22;
  *((void *)v32 + 1) = v33;
  v32[16] = 0;
  v32[17] = v24;
  *((void *)v32 + 3) = sub_1B0B63BA4;
  *((void *)v32 + 4) = v27;
  swift_bridgeObjectRetain();
  sub_1B0A46460((uint64_t)sub_1B0B63BA4);
  uint64_t v34 = v29;
  uint64_t v23 = v28;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v8 = v64;
  v35(v30, v64);
  swift_bridgeObjectRelease();
  sub_1B0A2508C((uint64_t)sub_1B0B63BA4);
  v35(v11, v8);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE70);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v20, 0, 1, v36);
  sub_1B0A24FC4((uint64_t)v20, v73, &qword_1E9B4CE58);
  if (!*(void *)(v23 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v37 = (uint64_t)v62;
  uint64_t v38 = v62[5];
  uint64_t v74 = v62[4];
  uint64_t v75 = v38;
  swift_bridgeObjectRetain();
  sub_1B0B80D0C();
  sub_1B0B63A84();
  uint64_t v39 = v23;
  id v40 = v72;
  sub_1B0B818EC();
  swift_bridgeObjectRelease();
  uint64_t v64 = *(void *)(v37 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1B0B80B5C();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v38) = v74;
  uint64_t v41 = v70;
  sub_1B0B63AD8(v37, v70);
  unint64_t v42 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  uint64_t v43 = swift_allocObject();
  sub_1B0B63B40(v41, v43 + v42);
  uint64_t v44 = v71;
  id v45 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  v45(v11, v40, v8);
  v45(v20, v11, v8);
  uint64_t v46 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE68) + 48)];
  uint64_t v47 = v64;
  *(void *)uint64_t v46 = v39;
  *((void *)v46 + 1) = v47;
  v46[16] = 0;
  v46[17] = v38;
  *((void *)v46 + 3) = sub_1B0B63D40;
  *((void *)v46 + 4) = v43;
  swift_bridgeObjectRetain();
  sub_1B0A46460((uint64_t)sub_1B0B63D40);
  uint64_t v48 = *(void (**)(char *, uint64_t))(v44 + 8);
  v48(v40, v8);
  swift_bridgeObjectRelease();
  sub_1B0A2508C((uint64_t)sub_1B0B63D40);
  v48(v11, v8);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE70);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v20, 0, 1, v49);
  uint64_t v50 = v65;
  sub_1B0A24FC4((uint64_t)v20, v65, &qword_1E9B4CE58);
LABEL_8:
  uint64_t v55 = v73;
  sub_1B0A48C00(v73, (uint64_t)v20, &qword_1E9B4CE58);
  uint64_t v56 = v66;
  sub_1B0A48C00(v50, v66, &qword_1E9B4CE58);
  uint64_t v57 = v67;
  sub_1B0A48C00((uint64_t)v20, v67, &qword_1E9B4CE58);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE78);
  sub_1B0A48C00(v56, v57 + *(int *)(v58 + 48), &qword_1E9B4CE58);
  sub_1B0A2E21C(v50, &qword_1E9B4CE58);
  sub_1B0A2E21C(v55, &qword_1E9B4CE58);
  sub_1B0A2E21C(v56, &qword_1E9B4CE58);
  sub_1B0A2E21C((uint64_t)v20, &qword_1E9B4CE58);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CCF0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v57, 0, 1, v59);
  return sub_1B0A24FC4(v57, v63, &qword_1E9B4CCE0);
}

unint64_t sub_1B0B5C1B0()
{
  unint64_t result = qword_1E9B4CCC0;
  if (!qword_1E9B4CCC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CCA8);
    sub_1B0A48B54(&qword_1E9B4CCC8, &qword_1E9B4CCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CCC0);
  }
  return result;
}

unint64_t sub_1B0B5C250()
{
  unint64_t result = qword_1E9B4CCD0;
  if (!qword_1E9B4CCD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CC90);
    sub_1B0B5C2C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CCD0);
  }
  return result;
}

unint64_t sub_1B0B5C2C4()
{
  unint64_t result = qword_1E9B4CCD8;
  if (!qword_1E9B4CCD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CCE0);
    sub_1B0A48B54(&qword_1E9B4CCE8, &qword_1E9B4CCF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CCD8);
  }
  return result;
}

uint64_t sub_1B0B5C35C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B5C378()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5568);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1B0B7FBEC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B8017C();
  sub_1B0B7FBDC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_1B0A2E21C((uint64_t)v2, (uint64_t *)&unk_1EBBB5568);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  swift_retain();
  uint64_t v8 = sub_1B0B7FB4C();
  uint64_t v10 = v9;
  swift_getKeyPath();
  swift_getKeyPath();
  v11[0] = v8;
  v11[1] = v10;
  sub_1B0B80B6C();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v11[0]) = 0;
  swift_retain();
  sub_1B0B80B6C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1B0B5C598()
{
  uint64_t result = sub_1B0B8011C();
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = v1;
    uint64_t v4 = sub_1B0B8013C();
    if (v5)
    {
      uint64_t v6 = v4;
      uint64_t v7 = v5;
      uint64_t v8 = (objc_class *)type metadata accessor for NoteSelection();
      uint64_t v9 = (char *)objc_allocWithZone(v8);
      uint64_t v10 = &v9[OBJC_IVAR____TtC7NotesUI13NoteSelection_noteID];
      *(void *)uint64_t v10 = v2;
      *((void *)v10 + 1) = v3;
      uint64_t v11 = &v9[OBJC_IVAR____TtC7NotesUI13NoteSelection_noteTitle];
      *(void *)uint64_t v11 = v6;
      *((void *)v11 + 1) = v7;
      v12.receiver = v9;
      v12.super_class = v8;
      swift_retain();
      objc_msgSendSuper2(&v12, sel_init);
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_1B0B80B6C();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1B0B5C6B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = a3;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4C928) - 8;
  MEMORY[0x1F4188790](v49);
  uint64_t v47 = (uint64_t *)((char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4C8F0);
  MEMORY[0x1F4188790](v6 - 8);
  id v45 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE38) - 8;
  MEMORY[0x1F4188790](v46);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE40) - 8;
  MEMORY[0x1F4188790](v50);
  uint64_t v48 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  sub_1B0A4BE24();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1B0B8180C();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_1B0B81A1C();
  uint64_t v16 = sub_1B0B8177C();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v22 = v21;
  swift_release();
  char v23 = v20 & 1;
  sub_1B0A533AC(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v24 = *MEMORY[0x1E4F3E268];
  uint64_t v25 = sub_1B0B817AC();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v45, v24, v25);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v25);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = v47;
  sub_1B0A48C00(v27, (uint64_t)v47 + *(int *)(v49 + 36), &qword_1E9B4C8F0);
  *uint64_t v29 = KeyPath;
  sub_1B0A48C00((uint64_t)v29, (uint64_t)&v9[*(int *)(v46 + 44)], &qword_1E9B4C928);
  *(void *)uint64_t v9 = v16;
  *((void *)v9 + 1) = v18;
  v9[16] = v23;
  *((void *)v9 + 3) = v22;
  sub_1B0A5339C(v16, v18, v23);
  swift_bridgeObjectRetain();
  sub_1B0A2E21C((uint64_t)v29, &qword_1E9B4C928);
  sub_1B0A2E21C(v27, &qword_1E9B4C8F0);
  sub_1B0A533AC(v16, v18, v23);
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_1B0B816BC();
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = v48;
  sub_1B0A48C00((uint64_t)v9, v48, &qword_1E9B4CE38);
  uint64_t v33 = (uint64_t *)(v32 + *(int *)(v50 + 44));
  *uint64_t v33 = v31;
  v33[1] = v30;
  sub_1B0A2E21C((uint64_t)v9, &qword_1E9B4CE38);
  LOBYTE(v30) = sub_1B0B815AC();
  sub_1B0B80C8C();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v42 = v51;
  sub_1B0A48C00(v32, v51, &qword_1E9B4CE40);
  uint64_t v43 = v42 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE48) + 36);
  *(unsigned char *)uint64_t v43 = v30;
  *(void *)(v43 + 8) = v35;
  *(void *)(v43 + 16) = v37;
  *(void *)(v43 + 24) = v39;
  *(void *)(v43 + 32) = v41;
  *(unsigned char *)(v43 + 40) = 0;
  return sub_1B0A2E21C(v32, &qword_1E9B4CE40);
}

uint64_t sub_1B0B5CAC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0B5C6B4(*v1, v1[1], a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for LinkSuggestionsView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = a2[3];
    v3[2] = a2[2];
    v3[3] = v5;
    uint64_t v6 = a2[5];
    v3[4] = a2[4];
    v3[5] = v6;
    uint64_t v7 = a2[7];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (uint64_t *)((char *)a2 + v8);
    uint64_t v10 = (uint64_t *)((char *)v3 + v8);
    v3[6] = a2[6];
    v3[7] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1B0B8143C();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
        memcpy(v10, v9, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v10, v9, v11);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
      }
    }
    else
    {
      *uint64_t v10 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for LinkSuggestionsView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1B0B8143C();
    uint64_t v8 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for LinkSuggestionsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a2 + v7);
  uint64_t v9 = (void *)(a1 + v7);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1B0B8143C();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
      memcpy(v9, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v9, v8, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v9 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for LinkSuggestionsView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
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
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_1B0A2E21C((uint64_t)a1 + v6, &qword_1E9B4CC80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1B0B8143C();
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
        memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
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

_OWORD *initializeWithTake for LinkSuggestionsView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1B0B8143C();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v7, v8, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for LinkSuggestionsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (const void *)(a2 + v9);
    sub_1B0A2E21C(a1 + v9, &qword_1E9B4CC80);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1B0B8143C();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD00);
        memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v10, v11, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkSuggestionsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B0B5D50C);
}

uint64_t sub_1B0B5D50C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD08);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LinkSuggestionsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B0B5D5D4);
}

uint64_t sub_1B0B5D5D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD08);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1B0B5D680()
{
  sub_1B0B5D720();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1B0B5D720()
{
  if (!qword_1E9B4CD20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CD00);
    unint64_t v0 = sub_1B0B80CEC();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9B4CD20);
    }
  }
}

uint64_t destroy for LinkSuggestionsView.Configuration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LinkSuggestionsView.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LinkSuggestionsView.Configuration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

uint64_t assignWithTake for LinkSuggestionsView.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkSuggestionsView.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkSuggestionsView.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LinkSuggestionsView.Configuration()
{
  return &type metadata for LinkSuggestionsView.Configuration;
}

unint64_t sub_1B0B5D978()
{
  unint64_t result = qword_1E9B4CD28;
  if (!qword_1E9B4CD28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CD30);
    sub_1B0B64104(&qword_1E9B4CCB8, &qword_1E9B4CCB0, (void (*)(void))sub_1B0B5C1B0);
    sub_1B0B5C250();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CD28);
  }
  return result;
}

uint64_t *sub_1B0B5DA20(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B0B8019C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_1B0B5DB00(uint64_t a1)
{
  uint64_t v2 = sub_1B0B8019C();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_1B0B5DB64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1B0B5DBF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1B0B5DC88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1B0B5DD18(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1B0B5DDA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B0B5DDBC);
}

uint64_t sub_1B0B5DDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0B8019C();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1B0B5DE28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B0B5DE3C);
}

uint64_t sub_1B0B5DE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B0B8019C();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for NewNoteLinkSuggestionRow(uint64_t a1)
{
  return sub_1B0A5E8D0(a1, (uint64_t *)&unk_1E9B4CD38);
}

uint64_t sub_1B0B5DECC()
{
  uint64_t result = sub_1B0B8019C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B0B5DF68(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1B0B8019C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1B0B5E064(uint64_t a1)
{
  uint64_t v2 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_1B0B5E0D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_retain();
  return a1;
}

uint64_t sub_1B0B5E188(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1B0B5E250(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  return a1;
}

uint64_t sub_1B0B5E2FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  uint64_t v7 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1B0B5E3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B0B5E3C8);
}

uint64_t sub_1B0B5E3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B0B8019C();
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

uint64_t sub_1B0B5E488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B0B5E49C);
}

uint64_t sub_1B0B5E49C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1B0B8019C();
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

uint64_t type metadata accessor for LinkSuggestionRow(uint64_t a1)
{
  return sub_1B0A5E8D0(a1, (uint64_t *)&unk_1E9B4CD48);
}

uint64_t sub_1B0B5E578()
{
  uint64_t result = sub_1B0B8019C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for SuggestionListView(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for SuggestionListView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = (_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v6;
  }
  return a1;
}

uint64_t assignWithCopy for SuggestionListView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 24);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(void *)(a2 + 24);
  if (!v5)
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = v8;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SuggestionListView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  if (!v5)
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SuggestionListView()
{
  return &type metadata for SuggestionListView;
}

void *initializeBufferWithCopyOfBuffer for LinkSuggestionsView.LinkSuggestionHeader(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LinkSuggestionsView.LinkSuggestionHeader(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LinkSuggestionsView.LinkSuggestionHeader(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LinkSuggestionsView.LinkSuggestionHeader()
{
  return &type metadata for LinkSuggestionsView.LinkSuggestionHeader;
}

uint64_t sub_1B0B5E908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B5E924()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B5E940@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDC8);
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 16)) {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v6 = *(void *)(v1 + 8);
  }
  uint64_t v7 = sub_1B0B5B020(v6, *(void *)v1);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v13 = v12;
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRetain();
LABEL_6:
    uint64_t v14 = sub_1B0B618F8(v7, v9, v11, v13, &qword_1E9B4C130, MEMORY[0x1E4F82DB8]);
    goto LABEL_13;
  }
  uint64_t v24 = a1;
  sub_1B0B833AC();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    swift_unknownObjectRelease();
    uint64_t v15 = MEMORY[0x1E4FBC860];
  }
  uint64_t v16 = *(void *)(v15 + 16);
  swift_release();
  if (__OFSUB__(v13 >> 1, v11))
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v16 != (v13 >> 1) - v11)
  {
LABEL_15:
    swift_unknownObjectRelease();
    a1 = v24;
    goto LABEL_6;
  }
  uint64_t v14 = swift_dynamicCastClass();
  a1 = v24;
  if (!v14)
  {
    swift_unknownObjectRelease();
    uint64_t v14 = MEMORY[0x1E4FBC860];
  }
LABEL_13:
  swift_unknownObjectRelease();
  size_t v17 = sub_1B0B6344C(v14);
  swift_release();
  size_t v26 = v17;
  swift_getKeyPath();
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v19 = swift_allocObject();
  long long v20 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v19 + 32) = v20;
  *(void *)(v19 + 48) = *(void *)(v1 + 32);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1B0B63824;
  *(void *)(v21 + 24) = v19;
  swift_bridgeObjectRetain();
  sub_1B0A46460(v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDD8);
  sub_1B0A48B54(&qword_1E9B4CDE0, &qword_1E9B4CDD0);
  sub_1B0B638C4(&qword_1E9B4CDE8, MEMORY[0x1E4F82DB8]);
  sub_1B0A48B54(&qword_1E9B4CDF0, &qword_1E9B4CDD8);
  sub_1B0B81BAC();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v25);
}

uint64_t sub_1B0B5ECB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v101 = a2;
  uint64_t v93 = a1;
  uint64_t v98 = a4;
  uint64_t v92 = sub_1B0B81B9C();
  uint64_t v90 = *(void *)(v92 - 8);
  MEMORY[0x1F4188790](v92);
  uint64_t v89 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB40E8);
  MEMORY[0x1F4188790](v87);
  uint64_t v91 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4160);
  uint64_t v95 = *(void *)(v96 - 8);
  MEMORY[0x1F4188790](v96);
  uint64_t v88 = (uint64_t)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE00);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v97 = (uint64_t)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v99 = (char *)&v86 - v11;
  uint64_t v12 = sub_1B0B8139C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v112 = v12;
  uint64_t v113 = v13;
  MEMORY[0x1F4188790](v12);
  v109 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B0B8019C();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x1F4188790](v15);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE08);
  uint64_t v111 = *(void *)(v108 - 8);
  MEMORY[0x1F4188790](v108);
  uint64_t v103 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE10);
  uint64_t v107 = *(void *)(v110 - 8);
  MEMORY[0x1F4188790](v110);
  uint64_t v104 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE18) - 8;
  uint64_t v20 = MEMORY[0x1F4188790](v106);
  uint64_t v94 = (uint64_t)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v105 = (char *)&v86 - v23;
  MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)&v86 - v24;
  uint64_t v26 = *(void *)a3;
  uint64_t v100 = *(void *)(a3 + 24);
  uint64_t v27 = v101;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v101, v15);
  unint64_t v28 = (*(unsigned __int8 *)(v16 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v29 = swift_allocObject();
  uint64_t v102 = a3;
  long long v30 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v29 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v29 + 32) = v30;
  *(void *)(v29 + 48) = *(void *)(a3 + 32);
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v29 + v28, (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  uint64_t v114 = v27;
  swift_bridgeObjectRetain();
  sub_1B0A46460(v100);
  type metadata accessor for LinkSuggestionRow(0);
  sub_1B0B638C4(&qword_1E9B4C7F0, (void (*)(uint64_t))type metadata accessor for LinkSuggestionRow);
  uint64_t v31 = v103;
  sub_1B0B81B5C();
  uint64_t v32 = v109;
  sub_1B0B8138C();
  sub_1B0A48B54(&qword_1E9B4CE20, &qword_1E9B4CE08);
  sub_1B0B638C4(&qword_1EBBB4208, MEMORY[0x1E4F3D8B0]);
  uint64_t v33 = v104;
  uint64_t v34 = v108;
  uint64_t v35 = v112;
  sub_1B0B8184C();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v32, v35);
  (*(void (**)(char *, uint64_t))(v111 + 8))(v31, v34);
  uint64_t v36 = sub_1B0B811FC();
  uint64_t v37 = v107;
  uint64_t v38 = (uint64_t)v105;
  uint64_t v39 = v110;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v105, v33, v110);
  uint64_t v40 = (uint64_t *)(v38 + *(int *)(v106 + 44));
  *uint64_t v40 = v36;
  v40[1] = (uint64_t)sub_1B0B5F824;
  v40[2] = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v33, v39);
  sub_1B0A24FC4(v38, (uint64_t)v25, &qword_1E9B4CE18);
  if ((*(unsigned char *)(v102 + 17) & 1) == 0)
  {
    uint64_t v41 = 1;
    uint64_t v42 = v96;
    uint64_t v43 = (uint64_t)v99;
    goto LABEL_18;
  }
  if (*(unsigned char *)(v102 + 16)) {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v44 = *(void *)(v102 + 8);
  }
  uint64_t v45 = sub_1B0B5B020(v44, v26);
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  unint64_t v51 = v50;
  if (v50)
  {
    sub_1B0B833AC();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v53 = swift_dynamicCastClass();
    if (!v53)
    {
      swift_unknownObjectRelease();
      uint64_t v53 = MEMORY[0x1E4FBC860];
    }
    uint64_t v54 = *(void *)(v53 + 16);
    swift_release();
    if (__OFSUB__(v51 >> 1, v49))
    {
      __break(1u);
    }
    else if (v54 == (v51 >> 1) - v49)
    {
      uint64_t v52 = swift_dynamicCastClass();
      uint64_t v43 = (uint64_t)v99;
      if (!v52)
      {
        swift_unknownObjectRelease();
        uint64_t v52 = MEMORY[0x1E4FBC860];
      }
      goto LABEL_15;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v43 = (uint64_t)v99;
  uint64_t v52 = sub_1B0B618F8(v45, v47, v49, v51, &qword_1E9B4C130, MEMORY[0x1E4F82DB8]);
LABEL_15:
  swift_unknownObjectRelease();
  uint64_t v55 = *(void *)(v52 + 16);
  swift_release();
  uint64_t v42 = v96;
  if (v55 - 1 <= v93)
  {
    uint64_t v41 = 1;
  }
  else
  {
    uint64_t v56 = v89;
    sub_1B0B81B8C();
    char v57 = sub_1B0B815BC();
    sub_1B0B80C8C();
    uint64_t v59 = v58;
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    uint64_t v66 = v90;
    uint64_t v67 = (uint64_t)v91;
    uint64_t v68 = v92;
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v91, v56, v92);
    uint64_t v69 = v67 + *(int *)(v87 + 36);
    *(unsigned char *)uint64_t v69 = v57;
    *(void *)(v69 + 8) = v59;
    *(void *)(v69 + 16) = v61;
    *(void *)(v69 + 24) = v63;
    *(void *)(v69 + 32) = v65;
    *(unsigned char *)(v69 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v68);
    char v70 = sub_1B0B815DC();
    sub_1B0B80C8C();
    uint64_t v72 = v71;
    uint64_t v74 = v73;
    uint64_t v76 = v75;
    uint64_t v78 = v77;
    uint64_t v79 = v88;
    sub_1B0A48C00(v67, v88, &qword_1EBBB40E8);
    uint64_t v80 = v79 + *(int *)(v42 + 36);
    *(unsigned char *)uint64_t v80 = v70;
    *(void *)(v80 + 8) = v72;
    *(void *)(v80 + 16) = v74;
    *(void *)(v80 + 24) = v76;
    *(void *)(v80 + 32) = v78;
    *(unsigned char *)(v80 + 40) = 0;
    sub_1B0A2E21C(v67, &qword_1EBBB40E8);
    sub_1B0A24FC4(v79, v43, &qword_1EBBB4160);
    uint64_t v41 = 0;
  }
LABEL_18:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v95 + 56))(v43, v41, 1, v42);
  uint64_t v81 = v94;
  sub_1B0A48C00((uint64_t)v25, v94, &qword_1E9B4CE18);
  uint64_t v82 = v97;
  sub_1B0A48C00(v43, v97, &qword_1E9B4CE00);
  uint64_t v83 = v98;
  sub_1B0A48C00(v81, v98, &qword_1E9B4CE18);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE28);
  sub_1B0A48C00(v82, v83 + *(int *)(v84 + 48), &qword_1E9B4CE00);
  sub_1B0A2E21C(v43, &qword_1E9B4CE00);
  sub_1B0A2E21C((uint64_t)v25, &qword_1E9B4CE18);
  sub_1B0A2E21C(v82, &qword_1E9B4CE00);
  return sub_1B0A2E21C(v81, &qword_1E9B4CE18);
}

uint64_t sub_1B0B5F754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1B0B8019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t v5 = (int *)type metadata accessor for LinkSuggestionRow(0);
  uint64_t v6 = v5[5];
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1818]), sel_init);
  uint64_t result = _s7SwiftUI5ImageV05NotesB0EyACSo7UIImageCcfC_0();
  *(void *)(a2 + v6) = result;
  *(void *)(a2 + v5[6]) = 0;
  *(void *)(a2 + v5[7]) = 1;
  *(void *)(a2 + v5[8]) = 0x402A000000000000;
  *(void *)(a2 + v5[9]) = 0x4018000000000000;
  *(void *)(a2 + v5[10]) = 0x4010000000000000;
  return result;
}

double sub_1B0B5F824()
{
  return 20.0;
}

uint64_t sub_1B0B5F830()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B5F84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v124 = a2;
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD70) - 8;
  MEMORY[0x1F4188790](v117);
  v116 = (uint64_t *)((char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v115 = sub_1B0B8176C();
  uint64_t v128 = *(void *)(v115 - 8);
  MEMORY[0x1F4188790](v115);
  uint64_t v113 = (char *)&v108 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD78) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v114);
  uint64_t v140 = (uint64_t)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v141 = (uint64_t)&v108 - v7;
  uint64_t v8 = sub_1B0B81ACC();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B81ABC();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4F3EBF8], v8);
  uint64_t v132 = sub_1B0B81B0C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v139 = sub_1B0B81A4C();
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for NewNoteLinkSuggestionRow(0);
  uint64_t v110 = a1;
  sub_1B0B81BFC();
  sub_1B0B80D4C();
  LOBYTE(v9) = v150;
  uint64_t v133 = v149;
  uint64_t v134 = v151;
  unsigned __int8 v12 = v152;
  uint64_t v136 = v154;
  uint64_t v137 = v153;
  int v135 = sub_1B0B815BC();
  sub_1B0B80C8C();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  unsigned __int8 v169 = 1;
  unsigned __int8 v166 = v9;
  unsigned __int8 v164 = v12;
  unsigned __int8 v161 = 0;
  sub_1B0B81BFC();
  sub_1B0B80D4C();
  uint64_t v123 = v155;
  int v122 = v156;
  uint64_t v121 = v157;
  int v120 = v158;
  uint64_t v118 = v160;
  uint64_t v119 = v159;
  uint64_t v21 = self;
  uint64_t v22 = (void *)sub_1B0B823CC();
  uint64_t v23 = (void *)sub_1B0B823CC();
  id v109 = v21;
  id v24 = objc_msgSend(v21, sel_localizedFrameworkStringForKey_value_table_allowSiri_, v22, v23, 0, 1);

  uint64_t v25 = sub_1B0B8240C();
  uint64_t v27 = v26;

  uint64_t v179 = v25;
  uint64_t v180 = v27;
  unint64_t v28 = sub_1B0A4BE24();
  uint64_t v29 = sub_1B0B8180C();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_1B0B81A4C();
  uint64_t v34 = sub_1B0B8177C();
  uint64_t v129 = v35;
  uint64_t v130 = v34;
  char v37 = v36;
  uint64_t v131 = v38;
  swift_release();
  int v127 = v37 & 1;
  sub_1B0A533AC(v29, v31, v33);
  swift_bridgeObjectRelease();
  uint64_t v39 = (void *)sub_1B0B823CC();
  uint64_t v40 = (void *)sub_1B0B823CC();
  id v41 = objc_msgSend(v21, sel_localizedFrameworkStringForKey_value_table_allowSiri_, v39, v40, 0, 1);

  uint64_t v42 = sub_1B0B8240C();
  uint64_t v44 = v43;

  uint64_t v179 = v42;
  uint64_t v180 = v44;
  unint64_t v108 = v28;
  uint64_t v45 = sub_1B0B8180C();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  sub_1B0B81A4C();
  uint64_t v50 = sub_1B0B8177C();
  uint64_t v111 = v51;
  uint64_t v112 = v50;
  char v53 = v52;
  uint64_t v126 = v54;
  swift_release();
  int v125 = v53 & 1;
  sub_1B0A533AC(v45, v47, v49);
  swift_bridgeObjectRelease();
  uint64_t v179 = sub_1B0B8017C();
  uint64_t v180 = v55;
  uint64_t v56 = sub_1B0B8180C();
  uint64_t v58 = v57;
  LOBYTE(v21) = v59 & 1;
  sub_1B0B81A4C();
  uint64_t v60 = sub_1B0B8177C();
  uint64_t v62 = v61;
  LOBYTE(v45) = v63;
  uint64_t v110 = v64;
  swift_release();
  LOBYTE(v47) = v45 & 1;
  sub_1B0A533AC(v56, v58, (char)v21);
  swift_bridgeObjectRelease();
  uint64_t v65 = swift_getKeyPath();
  uint64_t v66 = v128;
  uint64_t v67 = v113;
  uint64_t v68 = v115;
  (*(void (**)(char *, void, uint64_t))(v128 + 104))(v113, *MEMORY[0x1E4F3E240], v115);
  uint64_t v69 = swift_getKeyPath();
  char v70 = v116;
  uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  uint64_t v72 = v68;
  v71((char *)v116 + *(int *)(v117 + 36), v67, v68);
  uint64_t v73 = (uint64_t)v70;
  *char v70 = v69;
  uint64_t v74 = v140;
  sub_1B0A48C00(v73, v140 + *(int *)(v114 + 44), &qword_1E9B4CD70);
  *(void *)uint64_t v74 = v60;
  *(void *)(v74 + 8) = v62;
  *(unsigned char *)(v74 + 16) = v47;
  *(void *)(v74 + 24) = v110;
  *(void *)(v74 + 32) = v65;
  *(void *)(v74 + 40) = 1;
  *(unsigned char *)(v74 + 48) = 0;
  sub_1B0A5339C(v60, v62, v47);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B0A2E21C(v73, &qword_1E9B4CD70);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v67, v72);
  sub_1B0A533AC(v60, v62, v47);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v75 = v74;
  sub_1B0A24FC4(v74, v141, &qword_1E9B4CD78);
  uint64_t v76 = (void *)sub_1B0B823CC();
  uint64_t v77 = (void *)sub_1B0B823CC();
  id v78 = objc_msgSend(v109, sel_localizedFrameworkStringForKey_value_table_allowSiri_, v76, v77, 0, 1);

  uint64_t v79 = sub_1B0B8240C();
  uint64_t v81 = v80;

  uint64_t v179 = v79;
  uint64_t v180 = v81;
  uint64_t v82 = sub_1B0B8180C();
  uint64_t v84 = v83;
  LOBYTE(v74) = v85 & 1;
  sub_1B0B81A4C();
  uint64_t v113 = (char *)sub_1B0B8177C();
  uint64_t v114 = v86;
  uint64_t v110 = v87;
  LOBYTE(v79) = v88;
  swift_release();
  LODWORD(v109) = v79 & 1;
  sub_1B0A533AC(v82, v84, v74);
  swift_bridgeObjectRelease();
  LOBYTE(v62) = v169;
  LODWORD(v116) = v169;
  int v147 = v167;
  __int16 v148 = v168;
  LOBYTE(v72) = v166;
  LODWORD(v117) = v166;
  v146[0] = *(_DWORD *)v165;
  *(_DWORD *)((char *)v146 + 3) = *(_DWORD *)&v165[3];
  LOBYTE(v82) = v164;
  LODWORD(v128) = v164;
  v145[0] = *(_DWORD *)v163;
  *(_DWORD *)((char *)v145 + 3) = *(_DWORD *)&v163[3];
  *(_DWORD *)((char *)v144 + 3) = *(_DWORD *)&v162[3];
  v144[0] = *(_DWORD *)v162;
  LODWORD(v81) = v161;
  LOBYTE(v65) = v127;
  char v143 = v127;
  LOBYTE(v79) = v125;
  char v142 = v125;
  sub_1B0A48C00(v141, v75, &qword_1E9B4CD78);
  v170[0] = v132;
  v170[1] = 0;
  LOWORD(v171) = v62;
  *(_DWORD *)((char *)&v171 + 2) = v167;
  WORD3(v171) = v168;
  *((void *)&v171 + 1) = KeyPath;
  *(void *)&long long v172 = v139;
  *((void *)&v172 + 1) = v133;
  LOBYTE(v173) = v72;
  *(_DWORD *)((char *)&v173 + 1) = *(_DWORD *)v165;
  DWORD1(v173) = *(_DWORD *)&v165[3];
  *((void *)&v173 + 1) = v134;
  LOBYTE(v174) = v82;
  *(_DWORD *)((char *)&v174 + 1) = *(_DWORD *)v163;
  DWORD1(v174) = *(_DWORD *)&v163[3];
  *((void *)&v174 + 1) = v137;
  *(void *)&long long v175 = v136;
  BYTE8(v175) = v135;
  *(_DWORD *)((char *)&v175 + 9) = *(_DWORD *)v162;
  HIDWORD(v175) = *(_DWORD *)&v162[3];
  *(void *)&long long v176 = v14;
  *((void *)&v176 + 1) = v16;
  *(void *)&long long v177 = v18;
  *((void *)&v177 + 1) = v20;
  LODWORD(v115) = v81;
  char v178 = v81;
  long long v89 = (unint64_t)v132;
  long long v90 = v171;
  long long v91 = v173;
  long long v92 = v174;
  uint64_t v93 = v124;
  *(_OWORD *)(v124 + 32) = v172;
  *(_OWORD *)(v93 + 48) = v91;
  *(_OWORD *)uint64_t v93 = v89;
  *(_OWORD *)(v93 + 16) = v90;
  long long v94 = v175;
  long long v95 = v176;
  long long v96 = v177;
  *(unsigned char *)(v93 + 128) = v81;
  *(_OWORD *)(v93 + 96) = v95;
  *(_OWORD *)(v93 + 112) = v96;
  *(_OWORD *)(v93 + 64) = v92;
  *(_OWORD *)(v93 + 80) = v94;
  *(void *)(v93 + 136) = 0;
  *(unsigned char *)(v93 + 144) = 1;
  *(void *)(v93 + 152) = v123;
  *(unsigned char *)(v93 + 160) = v122;
  *(void *)(v93 + 168) = v121;
  *(unsigned char *)(v93 + 176) = v120;
  uint64_t v97 = v118;
  *(void *)(v93 + 184) = v119;
  *(void *)(v93 + 192) = v97;
  uint64_t v99 = v129;
  uint64_t v98 = v130;
  *(void *)(v93 + 200) = v130;
  *(void *)(v93 + 208) = v99;
  *(unsigned char *)(v93 + 216) = v65;
  uint64_t v101 = v111;
  uint64_t v100 = v112;
  *(void *)(v93 + 224) = v131;
  *(void *)(v93 + 232) = v100;
  *(void *)(v93 + 240) = v101;
  *(unsigned char *)(v93 + 248) = v79;
  *(void *)(v93 + 256) = v126;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD80);
  sub_1B0A48C00(v140, v93 + *(int *)(v102 + 96), &qword_1E9B4CD78);
  uint64_t v103 = v93 + *(int *)(v102 + 112);
  uint64_t v105 = (uint64_t)v113;
  uint64_t v104 = v114;
  uint64_t v106 = v110;
  *(void *)uint64_t v103 = v113;
  *(void *)(v103 + 8) = v106;
  LOBYTE(v62) = (_BYTE)v109;
  *(unsigned char *)(v103 + 16) = (_BYTE)v109;
  *(void *)(v103 + 24) = v104;
  sub_1B0B61DF0((uint64_t)v170);
  sub_1B0A5339C(v98, v99, v127);
  swift_bridgeObjectRetain();
  sub_1B0A5339C(v100, v101, v125);
  swift_bridgeObjectRetain();
  sub_1B0A5339C(v105, v106, v62);
  swift_bridgeObjectRetain();
  sub_1B0A2E21C(v141, &qword_1E9B4CD78);
  sub_1B0A533AC(v105, v106, v62);
  swift_bridgeObjectRelease();
  sub_1B0A2E21C(v140, &qword_1E9B4CD78);
  sub_1B0A533AC(v100, v101, v142);
  swift_bridgeObjectRelease();
  sub_1B0A533AC(v130, v129, v143);
  swift_bridgeObjectRelease();
  uint64_t v179 = v132;
  uint64_t v180 = 0;
  char v181 = (char)v116;
  char v182 = 0;
  int v183 = v147;
  __int16 v184 = v148;
  uint64_t v185 = KeyPath;
  uint64_t v186 = v139;
  uint64_t v187 = v133;
  char v188 = v117;
  *(_DWORD *)v189 = v146[0];
  *(_DWORD *)&v189[3] = *(_DWORD *)((char *)v146 + 3);
  uint64_t v190 = v134;
  char v191 = v128;
  *(_DWORD *)&v192[3] = *(_DWORD *)((char *)v145 + 3);
  *(_DWORD *)v192 = v145[0];
  uint64_t v193 = v137;
  uint64_t v194 = v136;
  char v195 = v135;
  *(_DWORD *)&v196[3] = *(_DWORD *)((char *)v144 + 3);
  *(_DWORD *)v196 = v144[0];
  uint64_t v197 = v14;
  uint64_t v198 = v16;
  uint64_t v199 = v18;
  uint64_t v200 = v20;
  char v201 = v115;
  return sub_1B0B61E38((uint64_t)&v179);
}

uint64_t sub_1B0B604A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD58);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_1B0B8111C();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD60);
  sub_1B0B5F84C(v2, (uint64_t)&v6[*(int *)(v7 + 44)]);
  char v8 = sub_1B0B815EC();
  sub_1B0B80C8C();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  sub_1B0A48C00((uint64_t)v6, a1, &qword_1E9B4CD58);
  uint64_t v17 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD68) + 36);
  *(unsigned char *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = v10;
  *(void *)(v17 + 16) = v12;
  *(void *)(v17 + 24) = v14;
  *(void *)(v17 + 32) = v16;
  *(unsigned char *)(v17 + 40) = 0;
  return sub_1B0A2E21C((uint64_t)v6, &qword_1E9B4CD58);
}

uint64_t sub_1B0B605C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD88);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD90);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD98);
  uint64_t v11 = v10 - 8;
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B0B8111C();
  uint64_t v15 = *(void *)(v2 + *(int *)(type metadata accessor for LinkSuggestionRow(0) + 36));
  *(void *)uint64_t v6 = v14;
  *((void *)v6 + 1) = v15;
  v6[16] = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDA0);
  sub_1B0B60858(v2, (uint64_t *)&v6[*(int *)(v16 + 44)]);
  uint64_t v17 = sub_1B0B81BFC();
  sub_1B0B68088(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, 0.0, 1, v17, v18);
  sub_1B0A2E21C((uint64_t)v6, &qword_1E9B4CD88);
  LOBYTE(v6) = sub_1B0B815EC();
  sub_1B0B80C8C();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_1B0A48C00((uint64_t)v9, (uint64_t)v13, &qword_1E9B4CD90);
  uint64_t v27 = &v13[*(int *)(v11 + 44)];
  *uint64_t v27 = (char)v6;
  *((void *)v27 + 1) = v20;
  *((void *)v27 + 2) = v22;
  *((void *)v27 + 3) = v24;
  *((void *)v27 + 4) = v26;
  v27[40] = 0;
  sub_1B0A2E21C((uint64_t)v9, &qword_1E9B4CD90);
  LOBYTE(v6) = sub_1B0B8157C();
  sub_1B0B80C8C();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_1B0A48C00((uint64_t)v13, a1, &qword_1E9B4CD98);
  uint64_t v36 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDA8) + 36);
  *(unsigned char *)uint64_t v36 = (_BYTE)v6;
  *(void *)(v36 + 8) = v29;
  *(void *)(v36 + 16) = v31;
  *(void *)(v36 + 24) = v33;
  *(void *)(v36 + 32) = v35;
  *(unsigned char *)(v36 + 40) = 0;
  return sub_1B0A2E21C((uint64_t)v13, &qword_1E9B4CD98);
}

uint64_t sub_1B0B60858@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v92 = a2;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CD70);
  MEMORY[0x1F4188790](v85);
  long long v89 = (uint64_t *)((char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_1B0B8176C();
  uint64_t v87 = *(void *)(v4 - 8);
  uint64_t v88 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v76 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDB0);
  MEMORY[0x1F4188790](v78);
  uint64_t v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDB8);
  uint64_t v8 = MEMORY[0x1F4188790](v86);
  uint64_t v95 = (uint64_t)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v94 = (uint64_t)&v71 - v10;
  uint64_t v11 = sub_1B0B81ACC();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B8012C();
  if (v15)
  {
    sub_1B0B81ABC();
  }
  else
  {
    type metadata accessor for LinkSuggestionRow(0);
    swift_retain();
  }
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4F3EBF8], v11);
  uint64_t v93 = sub_1B0B81B0C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v91 = sub_1B0B81A4C();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = type metadata accessor for LinkSuggestionRow(0);
  sub_1B0B81BFC();
  sub_1B0B80D4C();
  uint64_t v84 = v98;
  int v83 = v99;
  uint64_t v82 = v100;
  int v81 = v101;
  uint64_t v80 = v102;
  uint64_t v79 = v103;
  uint64_t v96 = sub_1B0B8017C();
  uint64_t v97 = v17;
  unint64_t v71 = sub_1B0A4BE24();
  uint64_t v18 = sub_1B0B8180C();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_1B0B81A4C();
  uint64_t v23 = sub_1B0B8177C();
  uint64_t v77 = a1;
  uint64_t v74 = v23;
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v75 = v28;
  swift_release();
  int v29 = v27 & 1;
  sub_1B0A533AC(v18, v20, v22);
  swift_bridgeObjectRelease();
  uint64_t v30 = swift_getKeyPath();
  uint64_t v73 = *(void *)(a1 + *(int *)(v16 + 28));
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = v87;
  uint64_t v33 = v88;
  uint64_t v34 = v76;
  (*(void (**)(char *, void, uint64_t))(v87 + 104))(v76, *MEMORY[0x1E4F3E240], v88);
  uint64_t v35 = swift_getKeyPath();
  uint64_t v36 = v89;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)v89 + *(int *)(v85 + 28), v34, v33);
  *uint64_t v36 = v35;
  sub_1B0A48C00((uint64_t)v36, (uint64_t)&v7[*(int *)(v78 + 36)], &qword_1E9B4CD70);
  uint64_t v37 = v74;
  *(void *)uint64_t v7 = v74;
  *((void *)v7 + 1) = v25;
  uint64_t v38 = v25;
  char v39 = v29;
  int v72 = v29;
  v7[16] = v29;
  *((void *)v7 + 3) = v75;
  *((void *)v7 + 4) = v30;
  unsigned char v7[40] = 0;
  uint64_t v40 = v73;
  *((void *)v7 + 6) = v31;
  *((void *)v7 + 7) = v40;
  v7[64] = 0;
  uint64_t v41 = v37;
  uint64_t v42 = v38;
  sub_1B0A5339C(v37, v38, v39);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1B0A2E21C((uint64_t)v36, &qword_1E9B4CD70);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v33);
  sub_1B0A533AC(v41, v42, v72);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v43 = v95;
  sub_1B0A48C00((uint64_t)v7, v95, &qword_1E9B4CDB0);
  *(void *)(v43 + *(int *)(v86 + 36)) = 0x3FF0000000000000;
  sub_1B0A2E21C((uint64_t)v7, &qword_1E9B4CDB0);
  sub_1B0A24FC4(v43, v94, &qword_1E9B4CDB8);
  uint64_t v44 = sub_1B0B8018C();
  if (v45)
  {
    uint64_t v96 = v44;
    uint64_t v97 = v45;
    uint64_t v46 = sub_1B0B8180C();
    uint64_t v48 = v47;
    char v50 = v49 & 1;
    sub_1B0B81A5C();
    uint64_t v51 = sub_1B0B8177C();
    uint64_t v88 = v52;
    long long v89 = (uint64_t *)v51;
    char v54 = v53;
    uint64_t v87 = v55;
    swift_release();
    uint64_t v85 = v54 & 1;
    sub_1B0A533AC(v46, v48, v50);
    swift_bridgeObjectRelease();
    uint64_t v86 = swift_getKeyPath();
    int v56 = 65792;
    uint64_t v57 = 1;
  }
  else
  {
    uint64_t v88 = 0;
    long long v89 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    uint64_t v87 = 0;
    uint64_t v57 = 0;
    int v56 = 0;
  }
  uint64_t v58 = v95;
  sub_1B0A48C00(v94, v95, &qword_1E9B4CDB8);
  char v59 = v92;
  *long long v92 = v93;
  v59[1] = 0;
  *((_WORD *)v59 + 8) = 1;
  uint64_t v60 = v91;
  v59[3] = KeyPath;
  v59[4] = v60;
  v59[5] = v84;
  *((unsigned char *)v59 + 48) = v83;
  v59[7] = v82;
  *((unsigned char *)v59 + 64) = v81;
  uint64_t v61 = v79;
  v59[9] = v80;
  v59[10] = v61;
  uint64_t v62 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDC0);
  sub_1B0A48C00(v58, (uint64_t)v59 + v62[12], &qword_1E9B4CDB8);
  char v63 = (char *)v59 + v62[16];
  *(void *)char v63 = 0;
  v63[8] = 1;
  uint64_t v64 = (char *)v59 + v62[20];
  uint64_t v66 = v88;
  uint64_t v65 = (uint64_t)v89;
  *(void *)uint64_t v64 = v89;
  *((void *)v64 + 1) = v66;
  char v68 = v85;
  uint64_t v67 = v86;
  uint64_t v69 = v87;
  *((void *)v64 + 2) = v85;
  *((void *)v64 + 3) = v69;
  *((void *)v64 + 4) = v67;
  *((void *)v64 + 5) = v57;
  v64[50] = BYTE2(v56);
  *((_WORD *)v64 + 24) = v56;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1B0B61E8C(v65, v66, v68, v69);
  sub_1B0A2E21C(v94, &qword_1E9B4CDB8);
  sub_1B0B61EDC(v65, v66, v68, v69);
  sub_1B0A2E21C(v95, &qword_1E9B4CDB8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B0B61070()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B6108C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1B0B618F8(a1, a2, a3, a4, &qword_1EBBB5750, MEMORY[0x1E4F27990]);
}

uint64_t sub_1B0B610AC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1B0B82EAC();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1B0B62600((uint64_t)&v8, v3 + 4, v2, a1, (void (*)(void))_s5IndexCMa, (unint64_t *)&qword_1EBBB43D8, (void (*)(uint64_t))_s5IndexCMa);
  uint64_t result = sub_1B0A2E1C8();
  if (v6 == v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void *sub_1B0B611EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4C088);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  uint64_t v5 = sub_1B0B62900((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_1B0A2E1C8();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

size_t sub_1B0B612E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B4C510);
  uint64_t v3 = *(void *)(sub_1B0B8055C() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_1B0B62B10(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1B0A2E1C8();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1B0B61434(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A50);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1B0B62E58((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1B0A2E1C8();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1B0B6151C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x1E4FBC860];
    }
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 40 * a3;
        if (v10 < (unint64_t)&v8[5 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 40 * v5) {
          goto LABEL_17;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4B0A0);
        swift_arrayInitWithCopy();
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4C088);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 40);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

size_t sub_1B0B616B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5750);
  uint64_t v3 = *(void *)(sub_1B0B7FE4C() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1B0B63058(&v10, (char *)v6 + v5, v1, a1);
      sub_1B0A2E1C8();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1B0B617EC(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1B0B62384((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B0B831DC();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

uint64_t sub_1B0B618E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1B0B61B54(a1, a2, a3, a4, (unint64_t *)&qword_1EBBB4960);
}

uint64_t sub_1B0B618F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  unint64_t v6 = a4 >> 1;
  uint64_t v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v7) {
    return MEMORY[0x1E4FBC860];
  }
  if (v7 <= 0)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    if (v6 != a3)
    {
LABEL_10:
      if (v7 < 0) {
        goto LABEL_24;
      }
      uint64_t v17 = *(void *)(a6(0) - 8);
      uint64_t v18 = (char *)v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
      uint64_t v19 = *(void *)(v17 + 72);
      unint64_t v20 = a2 + v19 * a3;
      uint64_t v21 = v19 * v7;
      char v22 = &v18[v21];
      unint64_t v23 = v20 + v21;
      if (v20 < (unint64_t)v22 && (unint64_t)v18 < v23) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return (uint64_t)v14;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v11 = *(void *)(a6(0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (void *)swift_allocObject();
  size_t v15 = _swift_stdlib_malloc_size(v14);
  if (v12)
  {
    if (v15 - v13 == 0x8000000000000000 && v12 == -1) {
      goto LABEL_23;
    }
    v14[2] = v7;
    v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
    if (v6 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B61B40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1B0B61B54(a1, a2, a3, a4, (unint64_t *)&qword_1E9B4B8B0);
}

uint64_t sub_1B0B61B54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v6) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v10 = v6;
    if (v6 <= 0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4FBC860];
      if (v5 != a3)
      {
LABEL_7:
        if (v6 < 0) {
          goto LABEL_19;
        }
        unint64_t v14 = a2 + 8 * a3;
        if (v14 < (unint64_t)&v11[v10 + 4] && (unint64_t)(v11 + 4) < v14 + v10 * 8) {
          goto LABEL_19;
        }
        sub_1B0A2E124(0, a5);
        swift_arrayInitWithCopy();
        return (uint64_t)v11;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
      uint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      void v11[2] = v6;
      v11[3] = (2 * (v13 >> 3)) | 1;
      if (v5 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B61D00()
{
  return sub_1B0B80F0C();
}

uint64_t sub_1B0B61D24(uint64_t a1)
{
  uint64_t v2 = sub_1B0B8176C();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1B0B80F1C();
}

uint64_t sub_1B0B61DF0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0B61E38(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0B61E8C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B0A5339C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B0B61EDC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B0A533AC(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B0B61F2C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B0B831DC();
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
    uint64_t v10 = sub_1B0B831DC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B0A48B54(&qword_1E9B4CE98, &qword_1E9B4CE90);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE90);
          int64_t v12 = sub_1B0ADC22C(v16, i, a3);
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
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB5740);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B62160(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B0B831DC();
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
    uint64_t v10 = sub_1B0B831DC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B0A48B54((unint64_t *)&unk_1E9B4BC50, &qword_1E9B4BC48);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4BC48);
          int64_t v12 = sub_1B0ADC298(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
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
    sub_1B0B820DC();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B62384(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B0B831DC();
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
    uint64_t v10 = sub_1B0B831DC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B0A48B54(&qword_1E9B4CE88, &qword_1E9B4CE80);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE80);
          int64_t v12 = sub_1B0ADC300(v16, i, a3);
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
    sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B0B8323C();
  __break(1u);
  return result;
}

uint64_t sub_1B0B625B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0B62600(a1, a2, a3, a4, MEMORY[0x1E4F56880], &qword_1E9B4BC70, MEMORY[0x1E4F56880]);
}

uint64_t sub_1B0B62600(uint64_t result, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  uint64_t v7 = a4;
  uint64_t v9 = a2;
  uint64_t v30 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1B0B82E5C();
    a5(0);
    sub_1B0B638C4(a6, a7);
    uint64_t result = sub_1B0B8277C();
    uint64_t v7 = v34;
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    int64_t v15 = v37;
    unint64_t v16 = v38;
    if (v9) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v17 = 0;
    goto LABEL_38;
  }
  int64_t v15 = 0;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v13 = a4 + 56;
  uint64_t v14 = ~v25;
  uint64_t v26 = -v25;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  else {
    uint64_t v27 = -1;
  }
  unint64_t v16 = v27 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v17 = 0;
LABEL_38:
    uint64_t v28 = v30;
LABEL_41:
    void *v28 = v7;
    v28[1] = v13;
    v28[2] = v14;
    v28[3] = v15;
    v28[4] = v16;
    return v17;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v17 = 0;
  int64_t v31 = (unint64_t)(v14 + 64) >> 6;
  uint64_t v29 = v14;
  while (1)
  {
    if (v7 < 0)
    {
      if (!sub_1B0B82EDC()) {
        goto LABEL_40;
      }
      a5(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v20 = v33;
      uint64_t result = swift_unknownObjectRelease();
      if (!v33) {
        goto LABEL_40;
      }
      goto LABEL_8;
    }
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v15 << 6);
      goto LABEL_7;
    }
    int64_t v21 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v21 >= v31)
    {
      unint64_t v16 = 0;
      goto LABEL_40;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v21);
    if (v22) {
      goto LABEL_23;
    }
    int64_t v23 = v15 + 2;
    if (v15 + 2 >= v31)
    {
      unint64_t v16 = 0;
      ++v15;
      goto LABEL_40;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v23);
    if (!v22)
    {
      if (v15 + 3 >= v31) {
        goto LABEL_44;
      }
      unint64_t v22 = *(void *)(v13 + 8 * (v15 + 3));
      if (v22)
      {
        int64_t v21 = v15 + 3;
        goto LABEL_23;
      }
      int64_t v23 = v15 + 4;
      if (v15 + 4 >= v31)
      {
        unint64_t v16 = 0;
        v15 += 3;
        goto LABEL_40;
      }
      unint64_t v22 = *(void *)(v13 + 8 * v23);
      if (!v22)
      {
        int64_t v21 = v15 + 5;
        if (v15 + 5 >= v31)
        {
LABEL_44:
          unint64_t v16 = 0;
          int64_t v15 = v23;
          goto LABEL_40;
        }
        unint64_t v22 = *(void *)(v13 + 8 * v21);
        if (!v22)
        {
          int64_t v24 = v15 + 6;
          while (v31 != v24)
          {
            unint64_t v22 = *(void *)(v13 + 8 * v24++);
            if (v22)
            {
              int64_t v21 = v24 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v16 = 0;
          int64_t v15 = v31 - 1;
          goto LABEL_40;
        }
        goto LABEL_23;
      }
    }
    int64_t v21 = v23;
LABEL_23:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v21 << 6);
    int64_t v15 = v21;
LABEL_7:
    uint64_t v20 = *(void *)(*(void *)(v7 + 48) + 8 * v19);
    uint64_t result = swift_retain();
    if (!v20) {
      goto LABEL_40;
    }
LABEL_8:
    ++v17;
    *v9++ = v20;
    if (v17 == a3)
    {
      uint64_t v17 = a3;
LABEL_40:
      uint64_t v14 = v29;
      uint64_t v28 = v30;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1B0B62900(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
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
    uint64_t v13 = 0;
LABEL_36:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    sub_1B0A2E040(*(void *)(a4 + 56) + 40 * v16, (uint64_t)v21);
    sub_1B0A2E0A4(v21, (uint64_t)v22);
    uint64_t result = sub_1B0A2E0A4(v22, v11);
    v11 += 40;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v20;
      goto LABEL_36;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18) {
    goto LABEL_23;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_23;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_23;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_16:
    int64_t v17 = v19;
LABEL_23:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1B0B62B10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B0B8055C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  unint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 56) + v29 * v24, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B0B62E58(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
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
    void *v5 = a4;
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
  uint64_t v11 = a2;
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
    int64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
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

uint64_t sub_1B0B63058(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5720);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B0B7FE4C();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t result = MEMORY[0x1F4188790](v11);
  uint64_t v40 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v15 = a4 + 56;
  uint64_t v14 = *(void *)(a4 + 56);
  uint64_t v32 = -1 << *(unsigned char *)(a4 + 32);
  if (-v32 < 64) {
    uint64_t v16 = ~(-1 << -(char)v32);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  if (!a2)
  {
    int64_t v18 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = ~v32;
    *a1 = v42;
    a1[1] = v15;
    a1[2] = v28;
    a1[3] = v18;
    a1[4] = v17;
    return a3;
  }
  if (!a3)
  {
    int64_t v18 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v36 = a3;
  int64_t v18 = 0;
  a3 = 0;
  int64_t v19 = v40;
  uint64_t v38 = v41 + 16;
  uint64_t v39 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v37 = v41 + 48;
  uint64_t v35 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v33 = v15;
  int64_t v34 = (unint64_t)(63 - v32) >> 6;
  int64_t v30 = v34 - 1;
  uint64_t v31 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    uint64_t v25 = v41;
    uint64_t v26 = *(void *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v10, *(void *)(v42 + 48) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v33;
      goto LABEL_38;
    }
    ++a3;
    int64_t v27 = *v35;
    (*v35)(v19, v10, v11);
    uint64_t result = v27(a2, v19, v11);
    if (a3 == v36)
    {
      a3 = v36;
      a1 = v31;
      uint64_t v15 = v33;
      goto LABEL_39;
    }
    a2 += v26;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    uint64_t v15 = v33;
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v33 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v18 + 2;
      ++v18;
      if (v22 + 1 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v18 = v22 + 1;
      if (v22 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v18 = v22 + 2;
        if (v22 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v33 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v18 = v22 + 3;
          if (v22 + 4 < v34)
          {
            unint64_t v23 = *(void *)(v33 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v34)
                {
                  int64_t v18 = v30;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v33 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v39)(v10, 1, 1, v11);
          unint64_t v17 = 0;
LABEL_38:
          sub_1B0A2E21C((uint64_t)v10, &qword_1EBBB5720);
          a1 = v31;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

size_t sub_1B0B6344C(uint64_t a1)
{
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDF8);
  uint64_t v2 = MEMORY[0x1F4188790](v57);
  int v56 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v55 = (void *)((char *)v46 - v5);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v46 - v6;
  uint64_t v58 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v54 = v10;
  v46[0] = a1;
  if (v10)
  {
    uint64_t v47 = (v9 + 32) & ~v9;
    uint64_t v12 = MEMORY[0x1E4FBC860] + v47;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v53 = sub_1B0B8019C();
    uint64_t v15 = *(void *)(v53 - 8);
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v51 = v15 + 16;
    uint64_t v52 = v16;
    uint64_t v17 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    char v49 = v7;
    char v50 = (void (**)(char *, char *, uint64_t))(v15 + 32);
    uint64_t v48 = *(void *)(v15 + 72);
    int64_t v18 = &qword_1E9B4CDF8;
    v46[1] = v9 | 7;
    int64_t v19 = v11;
    while (1)
    {
      uint64_t v21 = v57;
      int64_t v22 = &v56[*(int *)(v57 + 48)];
      uint64_t v23 = v53;
      v52(v22, v17, v53);
      uint64_t v24 = *(int *)(v21 + 48);
      uint64_t v25 = v18;
      uint64_t v26 = v55;
      int64_t v27 = (char *)v55 + v24;
      *uint64_t v55 = v13;
      (*v50)(v27, v22, v23);
      uint64_t v28 = (uint64_t)v26;
      int64_t v18 = v25;
      size_t result = sub_1B0A24FC4(v28, (uint64_t)v7, v25);
      if (v14)
      {
        uint64_t v11 = v19;
        BOOL v20 = __OFSUB__(v14--, 1);
        if (v20) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v30 = v19[3];
        if ((uint64_t)((v30 >> 1) + 0x4000000000000000) < 0)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
        int64_t v31 = v30 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v31;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CE30);
        uint64_t v33 = *(void *)(v58 + 72);
        uint64_t v34 = v47;
        uint64_t v11 = (void *)swift_allocObject();
        size_t result = _swift_stdlib_malloc_size(v11);
        if (!v33) {
          goto LABEL_34;
        }
        int64_t v35 = result - v34;
        if (result - v34 == 0x8000000000000000 && v33 == -1) {
          goto LABEL_35;
        }
        uint64_t v37 = v35 / v33;
        void v11[2] = v32;
        v11[3] = 2 * (v35 / v33);
        uint64_t v38 = (char *)v11 + v34;
        uint64_t v39 = v19[3] >> 1;
        uint64_t v40 = v39 * v33;
        if (v19[2])
        {
          if (v11 < v19 || v38 >= (char *)v19 + v47 + v40)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v19)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v19[2] = 0;
        }
        uint64_t v12 = (uint64_t)&v38[v40];
        uint64_t v42 = (v37 & 0x7FFFFFFFFFFFFFFFLL) - v39;
        swift_release();
        int64_t v18 = v25;
        BOOL v20 = __OFSUB__(v42, 1);
        uint64_t v14 = v42 - 1;
        if (v20)
        {
LABEL_27:
          __break(1u);
          break;
        }
      }
      ++v13;
      uint64_t v7 = v49;
      sub_1B0A24FC4((uint64_t)v49, v12, v18);
      v12 += *(void *)(v58 + 72);
      v17 += v48;
      int64_t v19 = v11;
      if (v54 == v13) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v43 = v11[3];
  if (v43 >= 2)
  {
    unint64_t v44 = v43 >> 1;
    BOOL v20 = __OFSUB__(v44, v14);
    uint64_t v45 = v44 - v14;
    if (v20) {
      goto LABEL_36;
    }
    void v11[2] = v45;
  }
  return (size_t)v11;
}

uint64_t sub_1B0B637DC()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B0B63824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B0B5ECB0(a1, a2, v3 + 16, a3);
}

uint64_t sub_1B0B6382C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0B63864(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CDF8);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_1B0B638C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B0B6390C()
{
  uint64_t v1 = sub_1B0B8019C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  uint64_t v5 = v3 | 7;
  uint64_t v6 = (v3 + 56) & ~v3;
  uint64_t v7 = v6 + v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v6, v1);
  return MEMORY[0x1F4186498](v0, v7, v5);
}

uint64_t sub_1B0B639E8()
{
  uint64_t v1 = sub_1B0B8019C();
  uint64_t v4 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v3 = v4;
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v0 + 40);
  if (v5) {
    return v5(v0 + ((*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  }
  return result;
}

uint64_t sub_1B0B63A54@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0B5F754(*(void *)(v1 + 16), a1);
}

unint64_t sub_1B0B63A84()
{
  unint64_t result = qword_1E9B4CE60;
  if (!qword_1E9B4CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CE60);
  }
  return result;
}

uint64_t sub_1B0B63AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkSuggestionsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B0B63B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkSuggestionsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B0B63BA4(uint64_t a1)
{
  return sub_1B0B63D58(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1B0B5C378);
}

uint64_t objectdestroy_66Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for LinkSuggestionsView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CC80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1B0B8143C();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1B0B63D40(uint64_t a1)
{
  return sub_1B0B63D58(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1B0B5C598);
}

uint64_t sub_1B0B63D58(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for LinkSuggestionsView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_1B0B63DEC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_1B0B8248C();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x1F4183BA0](a1, a2, a3, a4);
}

uint64_t sub_1B0B63E88(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1B0B831DC();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B0B831DC();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1B0B831DC();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_1B0B8204C();
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10 + 1;
      sub_1B0B82FEC();
      uint64_t v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B0B831EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

unint64_t sub_1B0B64020()
{
  unint64_t result = qword_1E9B4CEA0;
  if (!qword_1E9B4CEA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CD68);
    sub_1B0A48B54(&qword_1E9B4CEA8, &qword_1E9B4CD58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CEA0);
  }
  return result;
}

uint64_t sub_1B0B640C0()
{
  return sub_1B0B64104(&qword_1E9B4CEB0, &qword_1E9B4CDA8, (void (*)(void))sub_1B0B64180);
}

uint64_t sub_1B0B64104(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B0B64180()
{
  return sub_1B0B64104(&qword_1E9B4CEB8, &qword_1E9B4CD98, (void (*)(void))sub_1B0B641B0);
}

unint64_t sub_1B0B641B0()
{
  unint64_t result = qword_1E9B4CEC0;
  if (!qword_1E9B4CEC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CD90);
    sub_1B0A48B54(&qword_1E9B4CEC8, &qword_1E9B4CD88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CEC0);
  }
  return result;
}

unint64_t sub_1B0B64254()
{
  unint64_t result = qword_1E9B4CED0;
  if (!qword_1E9B4CED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CDC8);
    sub_1B0A48B54(&qword_1E9B4CDF0, &qword_1E9B4CDD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CED0);
  }
  return result;
}

uint64_t sub_1B0B642EC()
{
  return sub_1B0B64104(&qword_1E9B4CED8, &qword_1E9B4CE48, (void (*)(void))sub_1B0B64330);
}

unint64_t sub_1B0B64330()
{
  unint64_t result = qword_1E9B4CEE0;
  if (!qword_1E9B4CEE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CE40);
    sub_1B0B643D0();
    sub_1B0A48B54(&qword_1EBBB4290, &qword_1EBBB4298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CEE0);
  }
  return result;
}

unint64_t sub_1B0B643D0()
{
  unint64_t result = qword_1E9B4CEE8;
  if (!qword_1E9B4CEE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CE38);
    sub_1B0A48B54(&qword_1E9B4C9A0, &qword_1E9B4C928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CEE8);
  }
  return result;
}

uint64_t destroy for CalculateErrorView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CalculateErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CalculateErrorView(void *a1, void *a2)
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
  a1[8] = a2[8];
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CalculateErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CalculateErrorView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CalculateErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalculateErrorView()
{
  return &type metadata for CalculateErrorView;
}

uint64_t sub_1B0B646FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B64718@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = sub_1B0B8118C();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1B0B7FE4C();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1B0B81FFC();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = (double *)a1;
  sub_1B0A24FC4(a1, (uint64_t)v76, (uint64_t *)&unk_1EBBB4E88);
  sub_1B0A24FC4((uint64_t)v76, (uint64_t)v77, (uint64_t *)&unk_1EBBB4E88);
  if (v77[1])
  {
    uint64_t v65 = v77[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5700);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B0B9A310;
    uint64_t v10 = (void *)*MEMORY[0x1E4F568D8];
    *(void *)(v9 + 32) = *MEMORY[0x1E4F568D8];
    id v11 = objc_allocWithZone(NSNumber);
    sub_1B0A4B940((uint64_t)v76);
    id v12 = v10;
    id v13 = objc_msgSend(v11, sel_initWithUnsignedInteger_, 1);
    *(void *)(v9 + 64) = sub_1B0A4B9C4();
    *(void *)(v9 + 40) = v13;
    sub_1B0A3D9C4(v9);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F56838], v5);
    sub_1B0B7FE3C();
    sub_1B0B820DC();
    swift_allocObject();
    sub_1B0B820EC();
    uint64_t v65 = MEMORY[0x1B3E9A620](18.0);
    swift_release();
  }
  else
  {
    uint64_t v65 = 0;
  }
  sub_1B0B8117C();
  sub_1B0B8116C();
  sub_1B0B81ABC();
  sub_1B0B8114C();
  swift_release();
  sub_1B0B8116C();
  sub_1B0B8115C();
  sub_1B0B8116C();
  sub_1B0B811AC();
  uint64_t v14 = sub_1B0B817EC();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_1B0B81A5C();
  uint64_t v32 = sub_1B0B8177C();
  uint64_t v20 = v19;
  char v22 = v21;
  swift_release();
  sub_1B0A533AC(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_1B0B816BC();
  uint64_t v23 = sub_1B0B817CC();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  LOBYTE(v14) = v27 & 1;
  sub_1B0A533AC(v32, v20, v22 & 1);
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_1B0B817BC();
  uint64_t v30 = v29;
  LODWORD(v32) = v31;
  uint64_t v34 = v33;
  sub_1B0A533AC(v23, v25, v14);
  swift_bridgeObjectRelease();
  uint64_t v35 = *((void *)v67 + 5);
  if (v35)
  {
    uint64_t v36 = *((void *)v67 + 4);
    double v37 = v67[6];
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_1B0B81BFC();
    sub_1B0B680E4(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v74, 0.0, 1, v37, 0, v38, v39, 0, 1);
    *(void *)&v73[0] = v36;
    *((void *)&v73[0] + 1) = v35;
    sub_1B0A4BE24();
    uint64_t v40 = sub_1B0B8180C();
    int v61 = v32;
    uint64_t v42 = v41;
    uint64_t v59 = v43;
    LOBYTE(v37) = v44 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v45 = swift_getKeyPath();
    uint64_t v67 = (double *)sub_1B0B81A5C();
    uint64_t v46 = swift_getKeyPath();
    uint64_t v63 = v28;
    uint64_t v47 = v46;
    uint64_t v48 = sub_1B0B816BC();
    uint64_t v62 = v30;
    uint64_t v49 = v48;
    uint64_t v50 = swift_getKeyPath();
    uint64_t v64 = v34;
    uint64_t v51 = v50;
    char v69 = LOBYTE(v37);
    char v68 = 0;
    uint64_t v32 = v40;
    uint64_t v52 = v40;
    uint64_t v53 = v42;
    sub_1B0A5339C(v52, v42, SLOBYTE(v37));
    uint64_t v54 = v59;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1B0A533AC(v32, v53, SLOBYTE(v37));
    swift_release();
    swift_release();
    swift_release();
    uint64_t v55 = v47;
    swift_release();
    swift_release();
    uint64_t v56 = KeyPath;
    swift_release();
    swift_bridgeObjectRelease();
    v73[4] = v74[4];
    v73[5] = v74[5];
    v73[6] = v74[6];
    v73[7] = v74[7];
    v73[0] = v74[0];
    v73[1] = v74[1];
    v73[2] = v74[2];
    v73[3] = v74[3];
    *(void *)&v73[8] = v32;
    *((void *)&v73[8] + 1) = v53;
    LOBYTE(v32) = v61;
    LOBYTE(v73[9]) = LOBYTE(v37);
    DWORD1(v73[9]) = *(_DWORD *)((char *)v72 + 3);
    *(_DWORD *)((char *)&v73[9] + 1) = v72[0];
    *((void *)&v73[9] + 1) = v54;
    *(void *)&v73[10] = v56;
    *((void *)&v73[10] + 1) = 10;
    LOBYTE(v73[11]) = 0;
    *(_DWORD *)((char *)&v73[11] + 1) = *(_DWORD *)v71;
    DWORD1(v73[11]) = *(_DWORD *)&v71[3];
    *((void *)&v73[11] + 1) = v45;
    LOBYTE(v73[12]) = 1;
    *(_DWORD *)((char *)&v73[12] + 1) = *(_DWORD *)v70;
    DWORD1(v73[12]) = *(_DWORD *)&v70[3];
    *((void *)&v73[12] + 1) = v55;
    *(void *)&v73[13] = v67;
    *((void *)&v73[13] + 1) = v51;
    uint64_t v28 = v63;
    uint64_t v34 = v64;
    *(void *)&v73[14] = v49;
    uint64_t v30 = v62;
    nullsub_1(v73);
  }
  else
  {
    sub_1B0B65000((uint64_t)v73);
  }
  sub_1B0A24FC4((uint64_t)v73, (uint64_t)v75, &qword_1E9B4CEF0);
  sub_1B0A24FC4((uint64_t)v75, (uint64_t)v71, &qword_1E9B4CEF0);
  sub_1B0A24FC4((uint64_t)v71, (uint64_t)v72, &qword_1E9B4CEF0);
  *(void *)&v73[0] = v65;
  *((void *)&v73[0] + 1) = v28;
  *(void *)&v73[1] = v30;
  BYTE8(v73[1]) = v32 & 1;
  *(void *)&v73[2] = v34;
  sub_1B0A24FC4((uint64_t)v72, (uint64_t)&v73[2] + 8, &qword_1E9B4CEF0);
  memcpy(v66, v73, 0x110uLL);
  sub_1B0A24FC4((uint64_t)v71, (uint64_t)v74, &qword_1E9B4CEF0);
  swift_retain();
  sub_1B0A5339C(v28, v30, v32 & 1);
  swift_bridgeObjectRetain();
  sub_1B0B650E0(v72, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1B0B65028);
  sub_1B0B650E0(v74, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6515C);
  sub_1B0A533AC(v28, v30, v32 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_1B0B64ECC@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 48);
  v26[2] = *(_OWORD *)(v1 + 32);
  v26[3] = v3;
  uint64_t v27 = *(void *)(v1 + 64);
  long long v4 = *(_OWORD *)(v1 + 16);
  v26[0] = *(_OWORD *)v1;
  v26[1] = v4;
  uint64_t v5 = sub_1B0B8120C();
  sub_1B0B64718((uint64_t)v26, __src);
  v29[280] = 1;
  memcpy(&v29[7], __src, 0x110uLL);
  char v6 = sub_1B0B8157C();
  sub_1B0B80C8C();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v30 = 0;
  char v15 = sub_1B0B815AC();
  sub_1B0B80C8C();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  char v24 = v30;
  char v31 = 0;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  __n128 result = memcpy((void *)(a1 + 17), v29, 0x117uLL);
  *(unsigned char *)(a1 + 296) = v6;
  *(void *)(a1 + 304) = v8;
  *(void *)(a1 + 312) = v10;
  *(void *)(a1 + 320) = v12;
  *(void *)(a1 + 328) = v14;
  *(unsigned char *)(a1 + 336) = v24;
  *(unsigned char *)(a1 + 344) = v15;
  *(void *)(a1 + 352) = v17;
  *(void *)(a1 + 360) = v19;
  *(void *)(a1 + 368) = v21;
  *(void *)(a1 + 376) = v23;
  *(unsigned char *)(a1 + 384) = v31;
  return result;
}

double sub_1B0B65000(uint64_t a1)
{
  *(void *)(a1 + 224) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1B0B65028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20)
{
  if (a20)
  {
    sub_1B0A5339C(a17, a18, a19 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void *sub_1B0B650E0(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24],
    a1[25],
    a1[26],
    a1[27],
    a1[28]);
  return a1;
}

uint64_t sub_1B0B6515C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20)
{
  if (a20)
  {
    sub_1B0A533AC(a17, a18, a19 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B0B65214@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B0B80FDC();
  *a1 = result;
  return result;
}

uint64_t sub_1B0B65240()
{
  return sub_1B0B80FEC();
}

uint64_t sub_1B0B65268@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0B80F2C();
  *a1 = result;
  return result;
}

uint64_t sub_1B0B65294()
{
  return sub_1B0B80F3C();
}

uint64_t sub_1B0B652C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1B0B8107C();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B0B652F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1B0B8107C();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B0B65328()
{
  return sub_1B0B8108C();
}

uint64_t sub_1B0B65358()
{
  return sub_1B0B8108C();
}

uint64_t sub_1B0B65388@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B0B80FDC();
  *a1 = result;
  return result;
}

uint64_t sub_1B0B653B4()
{
  return sub_1B0B80FEC();
}

uint64_t sub_1B0B653DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0B80F2C();
  *a1 = result;
  return result;
}

uint64_t sub_1B0B65408()
{
  return sub_1B0B80F3C();
}

uint64_t sub_1B0B6543C()
{
  return sub_1B0B654A0(&qword_1E9B4CEF8, &qword_1E9B4CF00, (void (*)(void))sub_1B0B65478);
}

uint64_t sub_1B0B65478()
{
  return sub_1B0B654A0(&qword_1E9B4CF08, &qword_1E9B4CF10, (void (*)(void))sub_1B0B65520);
}

uint64_t sub_1B0B654A0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B0B65520()
{
  unint64_t result = qword_1E9B4CF18;
  if (!qword_1E9B4CF18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9B4CF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CF18);
  }
  return result;
}

uint64_t sub_1B0B6557C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CF28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B0B9A320;
  sub_1B0A2E124(0, &qword_1EBBB54D0);
  sub_1B0B2D164();
  *(void *)(inited + 32) = sub_1B0B82CBC();
  uint64_t v1 = (void *)sub_1B0B8207C();
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_formattedResult, 0, 0, 0, nullsub_1, 0);

    uint64_t v4 = sub_1B0B8240C();
    uint64_t v6 = v5;

    uint64_t v7 = (void *)sub_1B0B823CC();
    id v8 = objc_msgSend(self, sel_systemImageNamed_, v7);

    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v4;
    *(void *)(v9 + 24) = v6;
    swift_bridgeObjectRetain();
    uint64_t v1 = (void *)sub_1B0B82CBC();
  }
  *(void *)(inited + 40) = v1;
  sub_1B0B8261C();
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v10 = *(void *)(inited + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = *(void **)(inited + 8 * i + 32);
      if (v12)
      {
        id v13 = v12;
        MEMORY[0x1B3E9CB90]();
        if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B0B8262C();
        }
        sub_1B0B8265C();
        sub_1B0B8261C();
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_1B0A2E124(0, &qword_1EBBB49E0);
  return sub_1B0B82C4C();
}

void sub_1B0B65854()
{
  id v0 = objc_msgSend(self, sel_generalPasteboard);
  id v1 = (id)sub_1B0B823CC();
  objc_msgSend(v0, sel_setString_, v1);
}

uint64_t sub_1B0B658E8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _s19ContextMenuProviderCMa()
{
  return self;
}

uint64_t sub_1B0B65944()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B0B6597C()
{
}

void sub_1B0B65984()
{
  qword_1E9B4CF30 = 0x4030000000000000;
}

double static ActivityStream.Layout.horizontalPadding.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A358, (uint64_t)&qword_1E9B4CF30);
}

void sub_1B0B659B8()
{
  qword_1E9B4CF38 = 0x4020000000000000;
}

double static ActivityStream.Layout.verticalPadding.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A360, (uint64_t)&qword_1E9B4CF38);
}

void sub_1B0B659EC()
{
  qword_1E9B4CF40 = 0x4046000000000000;
}

double static ActivityStream.Layout.headerHeight.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A368, (uint64_t)&qword_1E9B4CF40);
}

void sub_1B0B65A20()
{
  qword_1E9B4CF48 = 0x4024000000000000;
}

double static ActivityStream.Layout.compactItemSpacing.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A370, (uint64_t)&qword_1E9B4CF48);
}

void sub_1B0B65A54()
{
  qword_1E9B4CF50 = 0x4030000000000000;
}

double static ActivityStream.Layout.compactItemGroupSpacing.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A378, (uint64_t)&qword_1E9B4CF50);
}

void sub_1B0B65A88()
{
  qword_1E9B4CF58 = 0x4010000000000000;
}

double static ActivityStream.Layout.colorBarWidth.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A380, (uint64_t)&qword_1E9B4CF58);
}

void sub_1B0B65ABC()
{
  qword_1E9B4CF60 = 0x4020000000000000;
}

double static ActivityStream.Layout.colorBarSpacing.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A388, (uint64_t)&qword_1E9B4CF60);
}

int64x2_t sub_1B0B65AF0()
{
  int64x2_t result = vdupq_n_s64(0x4040000000000000uLL);
  xmmword_1E9B4CF68 = (__int128)result;
  return result;
}

double static ActivityStream.Layout.avatarSize.getter()
{
  return sub_1B0B65FAC(&qword_1E9B4A390, (uint64_t)&xmmword_1E9B4CF68);
}

void sub_1B0B65B30()
{
  qword_1E9B4CF78 = 0x4024000000000000;
}

double static ActivityStream.Layout.avatarSpacing.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A398, (uint64_t)&qword_1E9B4CF78);
}

void sub_1B0B65B64()
{
  qword_1E9B4CF80 = 0x4020000000000000;
}

double static ActivityStream.Layout.timestampSpacing.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A3A0, (uint64_t)&qword_1E9B4CF80);
}

void sub_1B0B65B98()
{
  qword_1E9B4CF88 = 0x4010000000000000;
}

double static ActivityStream.Layout.emphasizedDividerHeight.getter()
{
  return sub_1B0B65BCC(&qword_1E9B4A3A8, (uint64_t)&qword_1E9B4CF88);
}

double sub_1B0B65BCC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t sub_1B0B65C08(uint64_t a1)
{
  return sub_1B0B65C8C(a1, MEMORY[0x1E4F3E140], &qword_1E9B4CF90);
}

uint64_t static ActivityStream.Layout.primaryFont.getter()
{
  return sub_1B0B65F24(&qword_1E9B4A3B0);
}

uint64_t sub_1B0B65C40(uint64_t a1)
{
  return sub_1B0B65C8C(a1, MEMORY[0x1E4F3E178], &qword_1E9B4CF98);
}

uint64_t static ActivityStream.Layout.secondaryFont.getter()
{
  return sub_1B0B65F24(&qword_1E9B4A3B8);
}

uint64_t sub_1B0B65C78(uint64_t a1)
{
  return sub_1B0B65C8C(a1, MEMORY[0x1E4F3E168], &qword_1E9B4CFA0);
}

uint64_t sub_1B0B65C8C(uint64_t a1, unsigned int *a2, uint64_t *a3)
{
  uint64_t v5 = sub_1B0B8161C();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB56A8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1B0B816DC();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *a2, v12);
  uint64_t v16 = sub_1B0B8164C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  sub_1B0B8168C();
  sub_1B0A5FE00((uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F3E060], v5);
  uint64_t v17 = sub_1B0B8162C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  *a3 = v17;
  return result;
}

uint64_t static ActivityStream.Layout.tertiaryFont.getter()
{
  return sub_1B0B65F24(&qword_1E9B4A3C0);
}

uint64_t sub_1B0B65F24(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

__n128 sub_1B0B65F70()
{
  __asm { FMOV            V0.2D, #8.0 }
  xmmword_1E9B4CFA8 = (__int128)result;
  return result;
}

double static ActivityStream.Layout.selectionCornerSize.getter()
{
  return sub_1B0B65FAC(&qword_1E9B4A3C8, (uint64_t)&xmmword_1E9B4CFA8);
}

double sub_1B0B65FAC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

ValueMetadata *type metadata accessor for ActivityStream.Layout()
{
  return &type metadata for ActivityStream.Layout;
}

uint64_t CloudRecordSnapshot<>.init(record:from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)sub_1B0B7F83C();
  uint64_t v5 = sub_1B0B8240C();
  uint64_t v7 = v6;
  if (v5 == sub_1B0B8240C() && v7 == v8)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_1B0B8339C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_27;
    }
  }
  uint64_t v11 = sub_1B0B7F85C();
  if (!v11)
  {
    long long v26 = 0u;
    long long v27 = 0u;
LABEL_26:
    sub_1B0A4BA04((uint64_t)&v26);
    goto LABEL_27;
  }
  uint64_t v12 = v11;
  sub_1B0B8240C();
  sub_1B0B82F3C();
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_1B0A26374((uint64_t)&v25), (v14 & 1) != 0))
  {
    sub_1B0A2DF34(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v26);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1B0A2DFEC((uint64_t)&v25);
  if (!*((void *)&v27 + 1)) {
    goto LABEL_26;
  }
  sub_1B0A2E124(0, &qword_1E9B4CFC0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v15 = v25;
  uint64_t v16 = sub_1B0B7F85C();
  if (!v16)
  {
    long long v26 = 0u;
    long long v27 = 0u;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v17 = v16;
  sub_1B0B8240C();
  sub_1B0B82F3C();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_1B0A26374((uint64_t)&v25), (v19 & 1) != 0))
  {
    sub_1B0A2DF34(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v26);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1B0A2DFEC((uint64_t)&v25);
  if (!*((void *)&v27 + 1)) {
    goto LABEL_25;
  }
  if (swift_dynamicCast())
  {
    sub_1B0A2E124(0, &qword_1E9B4CFC8);
    sub_1B0B8027C();
    uint64_t v20 = sub_1B0B7F86C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a1, v20);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CFB8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a2, 0, 1, v21);
  }

LABEL_27:
  uint64_t v23 = sub_1B0B7F86C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a1, v23);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CFB8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(a2, 1, 1, v24);
}

id CloudRecordSnapshot<>.isOwnedByCurrentUser.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4CFB8);
  uint64_t v0 = (void *)sub_1B0B8026C();
  id v1 = objc_msgSend(v0, sel_ic_isOwnedByCurrentUser);

  return v1;
}

id ICUnifiedNoteContext.modernManagedObjectContext.getter()
{
  unsigned int v1 = objc_msgSend(v0, sel_resolvedPrefersViewContext);
  id v2 = objc_msgSend(v0, sel_modernNoteContext);
  id v3 = v2;
  uint64_t v4 = &selRef_managedObjectContext;
  if (!v1) {
    uint64_t v4 = &selRef_workerManagedObjectContext;
  }
  id v5 = [v2 *v4];

  return v5;
}

id ICUnifiedNoteContext.modernCrossProcessChangeCoordinator.getter()
{
  id v1 = objc_msgSend(v0, sel_modernNoteContext);
  id v2 = objc_msgSend(v1, sel_crossProcessChangeCoordinator);

  return v2;
}

id sub_1B0B66570(void *a1, uint64_t a2, SEL *a3, SEL *a4)
{
  id v6 = a1;
  id v7 = [v6 *a3];
  id v8 = [v7 *a4];

  return v8;
}

id ICUnifiedNoteContext.htmlManagedObjectContext.getter()
{
  id v1 = objc_msgSend(v0, sel_htmlNoteContext);
  id v2 = objc_msgSend(v1, sel_managedObjectContext);

  return v2;
}

NSManagedObjectContext_optional __swiftcall ICUnifiedNoteContext.managedObjectContext(for:)(NSManagedObjectID a1)
{
  uint64_t v3 = sub_1B0B8093C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([(objc_class *)a1.super.isa ic_isModernType])
  {
    id v7 = (objc_class *)objc_msgSend(v1, sel_modernManagedObjectContext);
  }
  else if ([(objc_class *)a1.super.isa ic_isLegacyType])
  {
    id v7 = (objc_class *)objc_msgSend(v1, sel_htmlManagedObjectContext);
  }
  else
  {
    sub_1B0B808FC();
    os_log_type_t v9 = sub_1B0B8285C();
    char v10 = sub_1B0B8092C();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v17 = v13;
      *(_DWORD *)uint64_t v12 = 136315650;
      uint64_t v14 = sub_1B0B82FDC();
      unint64_t v16 = sub_1B0A43464(v14, v15, &v17);
      sub_1B0B82DAC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2048;
      unint64_t v16 = 36;
      sub_1B0B82DAC();
      *(_WORD *)(v12 + 22) = 2080;
      unint64_t v16 = sub_1B0A43464(0x1000000000000042, 0x80000001B0BB4330, &v17);
      sub_1B0B82DAC();
      _os_log_impl(&dword_1B08EB000, v10, v11, "Failed assertion at %s:%lu: %s", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B3E9F6B0](v13, -1, -1);
      MEMORY[0x1B3E9F6B0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v7 = 0;
  }
  result.value.super.isa = v7;
  result.is_nil = v8;
  return result;
}

NSManagedObjectContext __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ICUnifiedNoteContext.managedObjectContext(for:)(NSManagedObject a1)
{
  return (NSManagedObjectContext)sub_1B0B678B0(a1.super.isa);
}

uint64_t sub_1B0B66A18()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3968);
  swift_allocObject();
  uint64_t result = sub_1B0B835AC();
  qword_1EBBB50A8 = result;
  return result;
}

uint64_t static ICUnifiedNoteContext.$prefersViewContext.getter()
{
  if (qword_1EBBB50A0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static ICUnifiedNoteContext.prefersViewContext.getter()
{
  if (qword_1EBBB50A0 != -1) {
    swift_once();
  }
  sub_1B0B835BC();
  return v1;
}

uint64_t ICUnifiedNoteContext.resolvedPrefersViewContext.getter()
{
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_options) & 3;
  if (v1 == 1) {
    return 1;
  }
  if (v1 == 2) {
    return 0;
  }
  if (qword_1EBBB50A0 != -1) {
    swift_once();
  }
  sub_1B0B835BC();
  return v3;
}

id ICUnifiedNoteContext.defaultAccountObjectID.getter()
{
  unint64_t v1 = self;
  id v2 = objc_msgSend(v0, sel_htmlNoteContext);
  id v3 = objc_msgSend(v1, sel_defaultAccountWithHTMLNoteContext_, v2);

  if (!v3) {
    return 0;
  }
  id v4 = objc_msgSend(v3, sel_objectID);

  return v4;
}

id ICUnifiedNoteContext.legacyAccountForLocalAccount.getter()
{
  unint64_t v1 = self;
  id v2 = objc_msgSend(v0, sel_htmlNoteContext);
  id v3 = objc_msgSend(v1, sel_legacyAccountForLocalAccountWithContext_, v2);

  return v3;
}

id ICUnifiedNoteContext.legacyAccount(forEmailAddress:)()
{
  unint64_t v1 = self;
  id v2 = (void *)sub_1B0B823CC();
  id v3 = objc_msgSend(v0, sel_htmlNoteContext);
  id v4 = objc_msgSend(v1, sel_accountForEmailAddress_context_, v2, v3);

  return v4;
}

id ICUnifiedNoteContext.legacyFolder(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1B0B67084(a1, a2, (SEL *)&selRef_folderForIdentifier_);
}

id ICUnifiedNoteContext.legacyNote(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1B0B67084(a1, a2, (SEL *)&selRef_noteForIdentifier_);
}

id ICUnifiedNoteContext.legacyAttachment(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1B0B67084(a1, a2, (SEL *)&selRef_attachmentForIdentifier_);
}

id sub_1B0B67084(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v5 = objc_msgSend(v3, sel_htmlNoteContext);
  id v6 = (void *)sub_1B0B823CC();
  id v7 = objc_msgSend(v5, *a3, v6);

  return v7;
}

id sub_1B0B67114(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_1B0B8240C();
  id v6 = a1;
  id v7 = objc_msgSend(v6, sel_htmlNoteContext);
  Swift::Bool v8 = (void *)sub_1B0B823CC();
  id v9 = objc_msgSend(v7, *a4, v8);

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t ICUnifiedNoteContext.managedObjectContext(for:)(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_1B0B8056C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v2, sel_modernManagedObjectContext);
  id v9 = objc_msgSend(v2, sel_htmlManagedObjectContext);
  if (!v9)
  {
    type metadata accessor for ICError(0);
    v15[11] = 225;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4A9B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B0B9A310;
    *(void *)(inited + 32) = sub_1B0B8240C();
    *(void *)(inited + 40) = v13;
    *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 48) = 0xD000000000000025;
    *(void *)(inited + 56) = 0x80000001B0BB4380;
    sub_1B0A3DB44(inited);
    sub_1B0A7F18C();
    sub_1B0B7FABC();
    swift_willThrow();

    return (uint64_t)v2;
  }
  id v2 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v10 == *MEMORY[0x1E4F82F38])
  {
    os_log_type_t v11 = v2;
    id v2 = v8;
LABEL_6:

    return (uint64_t)v2;
  }
  os_log_type_t v11 = v8;
  if (v10 == *MEMORY[0x1E4F82F30]) {
    goto LABEL_6;
  }
  uint64_t result = sub_1B0B8338C();
  __break(1u);
  return result;
}

uint64_t ICUnifiedNoteContext.perform<A, B>(with:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  v7[5] = a3;
  v7[3] = a1;
  return MEMORY[0x1F4188298](sub_1B0B6749C, 0, 0);
}

uint64_t sub_1B0B6749C()
{
  *(void *)(v0 + 16) = 0;
  id v1 = objc_msgSend(*(id *)(v0 + 72), sel_managedObjectContextForObject_error_, *(void *)(v0 + 32), v0 + 16);
  *(void *)(v0 + 80) = v1;
  id v2 = *(void **)(v0 + 16);
  if (v1)
  {
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v5 = *(void **)(v0 + 32);
    uint64_t v6 = swift_allocObject();
    *(void *)(v0 + 88) = v6;
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 56);
    *(void *)(v6 + 32) = v4;
    *(void *)(v6 + 40) = v3;
    *(void *)(v6 + 48) = v5;
    id v7 = v2;
    swift_retain();
    id v8 = v5;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1B0B67688;
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v11 = *(void *)(v0 + 24);
    return MEMORY[0x1F4139B00](v11, sub_1B0B67A2C, v6, v10);
  }
  else
  {
    id v12 = v2;
    sub_1B0B7FADC();

    swift_willThrow();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_1B0B67688()
{
  id v2 = (void *)*v1;
  v2[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B0B6781C, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)v2[10];
    swift_release();

    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_1B0B6781C()
{
  id v1 = *(void **)(v0 + 80);
  swift_release();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_1B0B678B0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_managedObjectContext);
  if (!v2)
  {
    type metadata accessor for ICError(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4A9B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B0B9A320;
    uint64_t v4 = sub_1B0B8240C();
    uint64_t v5 = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 32) = v4;
    *(void *)(inited + 40) = v6;
    *(void *)(inited + 72) = v5;
    *(void *)(inited + 48) = 0xD00000000000002ALL;
    *(void *)(inited + 56) = 0x80000001B0BB4530;
    *(void *)(inited + 80) = sub_1B0B8240C();
    *(void *)(inited + 88) = v7;
    id v8 = objc_msgSend(a1, sel_objectID);
    *(void *)(inited + 120) = sub_1B0B39514();
    *(void *)(inited + 96) = v8;
    sub_1B0A3DB44(inited);
    sub_1B0A7F18C();
    sub_1B0B7FABC();
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1B0B679EC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B0B67A2C()
{
  return (*(uint64_t (**)(void))(v0 + 32))(*(void *)(v0 + 48));
}

void static Color.quaternary.getter()
{
}

void static Color.background.getter()
{
}

void static Color.tertiary.getter()
{
}

void static Color.groupBackground.getter()
{
}

void static Color.tint.getter()
{
}

void sub_1B0B67A9C(SEL *a1)
{
  id v1 = [self *a1];
  JUMPOUT(0x1B3E9BFD0);
}

uint64_t sub_1B0B67AE8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_1B0B8285C();
    uint64_t v23 = (void *)sub_1B0B8155C();
    sub_1B0B807CC();
  }
  sub_1B0B80E7C();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  a9[4] = v13[4];
  *(_OWORD *)((char *)a9 + 73) = *(_OWORD *)((char *)v13 + 73);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[10] = v31;
  a9[11] = v32;
  a9[12] = v33;
  a9[6] = v27;
  a9[7] = v28;
  a9[8] = v29;
  a9[9] = v30;
  return sub_1B0B68E4C((uint64_t)v13);
}

uint64_t sub_1B0B67CB0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, long long *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_1B0B8285C();
    uint64_t v23 = (void *)sub_1B0B8155C();
    sub_1B0B807CC();
  }
  sub_1B0B80E7C();
  long long v24 = v13[1];
  long long v35 = *(long long *)((char *)v13 + 25);
  long long v38 = *v13;
  long long v39 = v24;
  sub_1B0B68D64((uint64_t)&v38, (uint64_t)v41);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  long long v26 = v13[2];
  a9[8] = v33;
  a9[9] = v34;
  a9[6] = v31;
  a9[7] = v32;
  a9[2] = v26;
  a9[3] = v28;
  uint64_t v40 = *((void *)&v39 + 1);
  uint64_t v36 = *(void *)((char *)&v35 + 7);
  char v37 = HIBYTE(v35);
  a9[4] = v29;
  a9[5] = v30;
  sub_1B0B68DC0((uint64_t)v41);
  sub_1B0B68DF4((uint64_t)&v40);
  return sub_1B0B68E20((uint64_t)&v36);
}

uint64_t sub_1B0B67E94@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
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
    sub_1B0B8285C();
    long long v31 = (void *)sub_1B0B8155C();
    sub_1B0B807CC();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_1B0B80E7C();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_1B0A5339C(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

double sub_1B0B68088@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1B0B68290(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1E9B4CD88, &qword_1E9B4CD90).n128_u64[0];
  return result;
}

__n128 sub_1B0B680E4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
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
    sub_1B0B8285C();
    long long v27 = (void *)sub_1B0B8155C();
    sub_1B0B807CC();

    char v18 = a17;
  }
  sub_1B0B80E7C();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  __n128 result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

__n128 sub_1B0B68290@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  char v19 = a17;
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
    sub_1B0B8285C();
    long long v28 = (void *)sub_1B0B8155C();
    sub_1B0B807CC();

    char v19 = a17;
  }
  sub_1B0B80E7C();
  sub_1B0A48C00(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  void v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t static String.placeholder.getter()
{
  return 0x209480E220;
}

uint64_t sub_1B0B68474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v58 = a1;
  uint64_t v63 = a2;
  uint64_t v57 = sub_1B0B80E6C() - 8;
  MEMORY[0x1F4188790](v57);
  uint64_t v5 = (_OWORD *)((char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3838) - 8;
  MEMORY[0x1F4188790](v62);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3858) - 8;
  MEMORY[0x1F4188790](v61);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3870) - 8;
  uint64_t v10 = MEMORY[0x1F4188790](v60);
  id v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v59 = (uint64_t)&v56 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3830);
  MEMORY[0x1F4188790](v14 - 8);
  unint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3850);
  MEMORY[0x1F4188790](v17 - 8);
  char v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3860);
  uint64_t v21 = v20 - 8;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  long long v24 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  long long v26 = (char *)&v56 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3878);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v16, v58, v27);
  uint64_t v28 = sub_1B0B81BFC();
  sub_1B0B68290(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, 0.0, 1, v28, v29, &qword_1EBBB3830, &qword_1EBBB3850);
  sub_1B0A2E21C((uint64_t)v16, &qword_1EBBB3830);
  sub_1B0A48C00((uint64_t)v19, (uint64_t)v24, &qword_1EBBB3850);
  *(void *)&v24[*(int *)(v21 + 44)] = 0x3FF0000000000000;
  sub_1B0A2E21C((uint64_t)v19, &qword_1EBBB3850);
  sub_1B0A24FC4((uint64_t)v24, (uint64_t)v26, &qword_1EBBB3860);
  long long v30 = (char *)v5 + *(int *)(v57 + 28);
  uint64_t v31 = *MEMORY[0x1E4F3D4A0];
  uint64_t v32 = sub_1B0B811BC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #2.0 }
  _OWORD *v5 = _Q0;
  LOBYTE(v30) = sub_1B0B815EC();
  sub_1B0B80C8C();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  sub_1B0A51804((uint64_t)v5, (uint64_t)v7);
  uint64_t v46 = &v7[*(int *)(v62 + 44)];
  *uint64_t v46 = (char)v30;
  *((void *)v46 + 1) = v39;
  *((void *)v46 + 2) = v41;
  *((void *)v46 + 3) = v43;
  *((void *)v46 + 4) = v45;
  v46[40] = 0;
  sub_1B0A51868((uint64_t)v5);
  sub_1B0A48C00((uint64_t)v7, (uint64_t)v9, &qword_1EBBB3838);
  *(void *)&v9[*(int *)(v61 + 44)] = 0x3FB47AE147AE147BLL;
  sub_1B0A2E21C((uint64_t)v7, &qword_1EBBB3838);
  sub_1B0B81C4C();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  sub_1B0A48C00((uint64_t)v9, (uint64_t)v12, &qword_1EBBB3858);
  uint64_t v51 = &v12[*(int *)(v60 + 44)];
  *(double *)uint64_t v51 = a3;
  *((void *)v51 + 1) = 0x3FF0000000000000;
  *((void *)v51 + 2) = v48;
  *((void *)v51 + 3) = v50;
  sub_1B0A2E21C((uint64_t)v9, &qword_1EBBB3858);
  uint64_t v52 = v59;
  sub_1B0A24FC4((uint64_t)v12, v59, &qword_1EBBB3870);
  sub_1B0A48C00((uint64_t)v26, (uint64_t)v24, &qword_1EBBB3860);
  sub_1B0A48C00(v52, (uint64_t)v12, &qword_1EBBB3870);
  uint64_t v53 = v63;
  sub_1B0A48C00((uint64_t)v24, v63, &qword_1EBBB3860);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3868);
  sub_1B0A48C00((uint64_t)v12, v53 + *(int *)(v54 + 48), &qword_1EBBB3870);
  sub_1B0A2E21C(v52, &qword_1EBBB3870);
  sub_1B0A2E21C((uint64_t)v26, &qword_1EBBB3860);
  sub_1B0A2E21C((uint64_t)v12, &qword_1EBBB3870);
  return sub_1B0A2E21C((uint64_t)v24, &qword_1EBBB3860);
}

uint64_t sub_1B0B689F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  double v5 = *v2;
  *a2 = sub_1B0B81BFC();
  a2[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3828);
  return sub_1B0B68474(a1, (uint64_t)a2 + *(int *)(v7 + 44), v5);
}

uint64_t Text.placeholder(_:scale:)(char a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a1)
  {
    sub_1B0A5339C(a2, a3, a4 & 1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3848);
    sub_1B0B68B10();
  }
  else
  {
    sub_1B0A5339C(a2, a3, a4 & 1);
    swift_bridgeObjectRetain();
  }
  return sub_1B0B81B7C();
}

unint64_t sub_1B0B68B10()
{
  unint64_t result = qword_1EBBB3840;
  if (!qword_1EBBB3840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBBB3848);
    sub_1B0B68B8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB3840);
  }
  return result;
}

unint64_t sub_1B0B68B8C()
{
  unint64_t result = qword_1EBBB3790[0];
  if (!qword_1EBBB3790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBBB3790);
  }
  return result;
}

double PlaceholderText.scale.getter()
{
  return *(double *)v0;
}

void PlaceholderText.scale.setter(double a1)
{
  *id v1 = a1;
}

uint64_t (*PlaceholderText.scale.modify())()
{
  return nullsub_1;
}

void PlaceholderText.init(scale:)(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

uint64_t PlaceholderText.body.getter@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3848);
  sub_1B0B68B10();
  uint64_t result = sub_1B0B81B7C();
  *a1 = result;
  return result;
}

uint64_t sub_1B0B68C8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B68CA8@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB3848);
  sub_1B0B68B10();
  uint64_t result = sub_1B0B81B7C();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderText()
{
  return &type metadata for PlaceholderText;
}

uint64_t sub_1B0B68D2C()
{
  return MEMORY[0x1E4F3EDF8];
}

ValueMetadata *type metadata accessor for TextPlaceholderViewModifier()
{
  return &type metadata for TextPlaceholderViewModifier;
}

uint64_t sub_1B0B68D48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0B68D64(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B0B68DC0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0B68DF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0B68E20(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0B68E4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 80);
  char v5 = *(unsigned char *)(a1 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B0A46460(v2);
  sub_1B0A46460(v3);
  sub_1B0A65140(v4, v5);
  return a1;
}

unint64_t sub_1B0B68ED4()
{
  unint64_t result = qword_1EBBB3890;
  if (!qword_1EBBB3890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBBB3898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB3890);
  }
  return result;
}

id sub_1B0B68F30()
{
  id result = objc_msgSend(self, sel_ic_isVision);
  double v1 = 44.0;
  if (!result) {
    double v1 = 24.0;
  }
  qword_1E9B4CFD8 = *(void *)&v1;
  return result;
}

double static ICCollaboratorAvatarsView.avatarDimension.getter()
{
  if (qword_1E9B4A3D8 != -1) {
    swift_once();
  }
  return *(double *)&qword_1E9B4CFD8;
}

uint64_t AvatarStackView.participants.getter()
{
  return swift_bridgeObjectRetain();
}

NotesUI::AvatarStackView __swiftcall AvatarStackView.init(participants:)(NotesUI::AvatarStackView participants)
{
  v1->participants._rawValue = participants.participants._rawValue;
  return participants;
}

uint64_t AvatarStackView.makeUIView(context:)()
{
  return _sSo25ICCollaboratorAvatarsViewC7NotesUIE015makeAvatarStackC03forABSaySo18CKShareParticipantCG_tFZ_0(*v0);
}

void AvatarStackView.updateUIView(_:context:)(void *a1)
{
  sub_1B0A9CD8C();
  id v2 = (id)sub_1B0B825AC();
  objc_msgSend(a1, sel_setParticipants_, v2);
}

double AvatarStackView.sizeThatFits(_:uiView:context:)(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  double v6 = 0.0;
  if (a2) {
    *(double *)&a1 = 0.0;
  }
  if ((a4 & 1) == 0) {
    double v6 = *(double *)&a3;
  }
  objc_msgSend(a5, sel_systemLayoutSizeFittingSize_, *(double *)&a1, v6);
  return result;
}

uint64_t sub_1B0B69098()
{
  return _sSo25ICCollaboratorAvatarsViewC7NotesUIE015makeAvatarStackC03forABSaySo18CKShareParticipantCG_tFZ_0(*v0);
}

void sub_1B0B690A0(void *a1)
{
  sub_1B0A9CD8C();
  id v2 = (id)sub_1B0B825AC();
  objc_msgSend(a1, sel_setParticipants_, v2);
}

double sub_1B0B6911C(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  double v6 = 0.0;
  if (a2) {
    *(double *)&a1 = 0.0;
  }
  if ((a4 & 1) == 0) {
    double v6 = *(double *)&a3;
  }
  objc_msgSend(a5, sel_systemLayoutSizeFittingSize_, *(double *)&a1, v6);
  return result;
}

uint64_t sub_1B0B69178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B0B69674();
  return MEMORY[0x1F40F9EF0](a1, a2, a3, v6);
}

uint64_t sub_1B0B691DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B0B69674();
  return MEMORY[0x1F40F9E78](a1, a2, a3, v6);
}

void sub_1B0B69240()
{
}

double sub_1B0B69268()
{
  if (qword_1E9B4A3D8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_1E9B4CFD8;
  qword_1E9B4CFE0 = qword_1E9B4CFD8;
  return result;
}

double static AvatarStackView.avatarDimension.getter()
{
  if (qword_1E9B4A3E0 != -1) {
    swift_once();
  }
  return *(double *)&qword_1E9B4CFE0;
}

uint64_t _sSo25ICCollaboratorAvatarsViewC7NotesUIE015makeAvatarStackC03forABSaySo18CKShareParticipantCG_tFZ_0(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)ICCollaboratorAvatarsView), sel_init);
  if (qword_1E9B4A3D8 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_setDimension_, *(double *)&qword_1E9B4CFD8);
  unsigned int v4 = objc_msgSend(self, sel_deviceIsVision);
  double v5 = -12.0;
  if (v4) {
    double v5 = -28.0;
  }
  objc_msgSend(v3, sel_setSpacing_, v5);
  objc_msgSend(v3, sel_setReverseZIndexing_, 1);
  if (!((unint64_t)a1 >> 62))
  {
    if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  if (a1 < 0) {
    uint64_t v10 = a1;
  }
  else {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1B0B831DC();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1B0B831DC();
  swift_bridgeObjectRelease();
  if (v11 < 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v9 >= 3) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = v9;
  }
  if (v9 >= 0) {
    uint64_t v6 = v19;
  }
  else {
    uint64_t v6 = 3;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_1B0B831DC();
  uint64_t result = swift_bridgeObjectRelease();
  if (v20 >= v6)
  {
LABEL_10:
    if ((a1 & 0xC000000000000001) != 0 && v6)
    {
      sub_1B0A9CD8C();
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = v7 + 1;
        sub_1B0B82FEC();
        uint64_t v7 = v8;
      }
      while (v6 != v8);
    }
    if ((unint64_t)a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1B0B831EC();
      uint64_t v11 = v12;
      uint64_t v9 = v13;
      unint64_t v1 = v14;
      swift_bridgeObjectRelease_n();
      if (v1) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v11 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v1 = (2 * v6) | 1;
      if (v1)
      {
LABEL_19:
        sub_1B0B833AC();
        swift_unknownObjectRetain_n();
        uint64_t v15 = swift_dynamicCastClass();
        if (!v15)
        {
          swift_unknownObjectRelease();
          uint64_t v15 = MEMORY[0x1E4FBC860];
        }
        uint64_t v16 = *(void *)(v15 + 16);
        swift_release();
        if (!__OFSUB__(v1 >> 1, v9))
        {
          if (v16 == (v1 >> 1) - v9)
          {
            if (!swift_dynamicCastClass()) {
              swift_unknownObjectRelease();
            }
            goto LABEL_25;
          }
          goto LABEL_32;
        }
LABEL_31:
        __break(1u);
LABEL_32:
        swift_unknownObjectRelease();
      }
    }
    sub_1B0B61B40(v10, v11, v9, v1);
LABEL_25:
    swift_unknownObjectRelease();
    sub_1B0A9CD8C();
    uint64_t v17 = (void *)sub_1B0B825AC();
    swift_release();
    objc_msgSend(v3, sel_setParticipants_, v17);

    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

unint64_t sub_1B0B69610()
{
  unint64_t result = qword_1E9B4CFE8;
  if (!qword_1E9B4CFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CFE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarStackView()
{
  return &type metadata for AvatarStackView;
}

unint64_t sub_1B0B69674()
{
  unint64_t result = qword_1E9B4CFF0;
  if (!qword_1E9B4CFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B4CFF0);
  }
  return result;
}

uint64_t sub_1B0B696C8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_1B0B696F0(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_1B0B6973C()
{
  uint64_t v0 = sub_1B0B8093C();
  __swift_allocate_value_buffer(v0, qword_1E9B4CFF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9B4CFF8);
  return sub_1B0B8088C();
}

id ThumbnailGeneratorSystemPaper.__allocating_init(managedObjectContext:cache:)(void *a1, uint64_t a2)
{
  double v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___ICThumbnailGeneratorSystemPaper_cache] = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithManagedObjectContext_, a1);

  return v6;
}

id ThumbnailGeneratorSystemPaper.init(managedObjectContext:cache:)(void *a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___ICThumbnailGeneratorSystemPaper_cache] = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithManagedObjectContext_, a1);

  return v6;
}

void static ThumbnailGeneratorSystemPaper.chromeBackdropImageUrl(for:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperChromeLayerWithThumbnailType_traitCollection_, 5, a1);
  id v4 = objc_msgSend(v3, sel_uniqueKey);

  sub_1B0AF5D28(a2);
}

double static ThumbnailGeneratorSystemPaper.chromeSize.getter()
{
  if (qword_1EBBB4E20 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_1EBBB4C98;
}

double sub_1B0B69B74()
{
  sub_1B0B69BC0((uint64_t)&v1);
  xmmword_1EBBB4CB8 = v3;
  *(_OWORD *)&qword_1EBBB4CC8 = v4;
  qword_1EBBB4CD8 = v5;
  double result = *(double *)&v2;
  xmmword_1EBBB4C98 = v1;
  *(_OWORD *)&qword_1EBBB4CA8 = v2;
  return result;
}

void sub_1B0B69BC0(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_currentDevice);
  id v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  if (v3 == (id)1)
  {
    long long v4 = xmmword_1B0B9F520;
    int64x2_t v5 = (int64x2_t)xmmword_1B0B9F530;
    long long v6 = 0uLL;
    double v7 = 17.0;
  }
  else
  {
    int64x2_t v5 = vdupq_n_s64(0x405C000000000000uLL);
    long long v4 = *MEMORY[0x1E4FB2848];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = 35.0;
  }
  *(_OWORD *)a1 = xmmword_1B0B9F540;
  *(int64x2_t *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = v6;
  *(double *)(a1 + 64) = v7;
}

void ThumbnailGeneratorSystemPaper.generateThumbnail(with:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  long long v4 = v3;
  id v8 = objc_msgSend(v4, sel_managedObjectContext);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = a3;
  v13[4] = sub_1B0B69D98;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1B0A965E8;
  v13[3] = &block_descriptor_23;
  uint64_t v10 = _Block_copy(v13);
  id v11 = v4;
  id v12 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_performBlock_, v10);
  _Block_release(v10);
}

void __swiftcall ThumbnailGeneratorSystemPaper.thumbnail(with:)(ICThumbnailDescription *__return_ptr retstr, ICThumbnailConfiguration *with)
{
  switch([(ICThumbnailConfiguration *)with thumbnailType])
  {
    case 4:
      id v3 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailDescription), sel_initWithConfiguration_, with);
      uint64_t v4 = (uint64_t)sub_1B0B6A5AC(with);
      break;
    case 7:
      id v3 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailDescription), sel_initWithConfiguration_, with);
      uint64_t v4 = sub_1B0B6A0F8(with);
      break;
    case 0xALL:
    case 0xBLL:
      id v3 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailDescription), sel_initWithConfiguration_, with);
      uint64_t v4 = (uint64_t)sub_1B0B6AAF4(with);
      break;
    default:
      sub_1B0B831CC();
      __break(1u);
      JUMPOUT(0x1B0B69F58);
  }
  int64x2_t v5 = (void *)v4;
  objc_msgSend(v3, sel_setImage_, v4);
}

uint64_t sub_1B0B6A0F8(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  id v4 = objc_msgSend(a1, sel_associatedObjectIdentifier);
  if (v4)
  {
    sub_1B0B8240C();

    int64x2_t v5 = self;
    swift_bridgeObjectRetain();
    long long v6 = (void *)sub_1B0B823CC();
    id v7 = objc_msgSend(v1, sel_managedObjectContext);
    id v4 = objc_msgSend(v5, sel_visibleNoteWithIdentifier_context_, v6, v7);
    swift_bridgeObjectRelease_n();

    if (v4)
    {
      id v8 = v4;
      id v4 = sub_1B0B6ACB8(v8, a1);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B0B9F550;
  *(void *)(v9 + 32) = objc_msgSend(a1, sel_traitCollection);
  uint64_t v10 = self;
  *(void *)(v9 + 40) = objc_msgSend(v10, sel_traitCollectionWithUserInterfaceLevel_, 1);
  sub_1B0B8261C();
  sub_1B0A2E124(0, &qword_1EBBB4EC8);
  id v11 = (void *)sub_1B0B825AC();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_traitCollectionWithTraitsFromCollections_, v11, v9);

  id v13 = objc_msgSend(a1, sel_backgroundColor);
  if (v13)
  {
    unint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_resolvedColorWithTraitCollection_, v12);
  }
  else
  {
    id v15 = 0;
  }
  if (qword_1EBBB4E20 != -1) {
    swift_once();
  }
  float64x2_t v16 = vdivq_f64(*(float64x2_t *)&qword_1EBBB4CA8, (float64x2_t)xmmword_1EBBB4C98);
  if (v16.f64[0] >= v16.f64[1]) {
    double v17 = v16.f64[1];
  }
  else {
    double v17 = v16.f64[0];
  }
  double v18 = *((double *)&xmmword_1EBBB4CB8 + 1) * v17;
  double v19 = *(double *)&xmmword_1EBBB4CB8 * v17;
  if (v4)
  {
    objc_msgSend(v4, sel_size);
    double v21 = v17 * v20;
    objc_msgSend(v4, sel_size);
    double v23 = v17 * v22;
  }
  else
  {
    double v23 = 0.0;
    double v21 = 0.0;
  }
  id v24 = objc_msgSend(a1, sel_traitCollection);
  id v25 = objc_msgSend(self, sel_formatForTraitCollection_, v24);

  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17D8]), sel_initWithSize_format_, v25, *(double *)&qword_1EBBB4CA8, unk_1EBBB4CB0);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v15;
  *(void *)(v27 + 24) = v4;
  *(double *)(v27 + 32) = v18;
  *(double *)(v27 + 40) = v19;
  *(double *)(v27 + 48) = v21;
  *(double *)(v27 + 56) = v23;
  *(void *)(v27 + 64) = ObjectType;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_1B0B6B2E8;
  *(void *)(v28 + 24) = v27;
  v35[4] = sub_1B0AF0BC0;
  v35[5] = v28;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 1107296256;
  v35[2] = sub_1B0B696F0;
  v35[3] = &block_descriptor_20;
  uint64_t v29 = _Block_copy(v35);
  id v30 = v15;
  id v31 = v4;
  swift_retain();
  swift_release();
  id v32 = objc_msgSend(v26, sel_imageWithActions_, v29);

  _Block_release(v29);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return (uint64_t)v32;
  }
  __break(1u);
  return result;
}

id sub_1B0B6A5AC(void *a1)
{
  uint64_t v2 = v1;
  id v3 = a1;
  id v4 = objc_msgSend(a1, sel_traitCollection);
  id v5 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailConfiguration), sel_initForSystemPaperChromeLayerWithThumbnailType_traitCollection_, 5, v4);

  id v6 = objc_msgSend(*(id *)(v2 + OBJC_IVAR___ICThumbnailGeneratorSystemPaper_cache), sel_objectForKeyedSubscript_, v5);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(v6, sel_image);

    if (v8) {
      goto LABEL_8;
    }
  }
  if (qword_1E9B4A3E8 != -1) {
    goto LABEL_16;
  }
  while (1)
  {
    uint64_t v9 = sub_1B0B8093C();
    __swift_project_value_buffer(v9, (uint64_t)qword_1E9B4CFF8);
    id v10 = v3;
    id v11 = sub_1B0B8092C();
    os_log_type_t v12 = sub_1B0B8285C();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      unint64_t v14 = (void *)swift_slowAlloc();
      *(_DWORD *)id v13 = 138412290;
      id v15 = objc_msgSend(v10, sel_traitCollection);
      aBlock[0] = v15;
      sub_1B0B82DAC();
      *unint64_t v14 = v15;

      _os_log_impl(&dword_1B08EB000, v11, v12, "System Paper chrome backdrop thumbnail is unavailable {traitCollection: %@}", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4410);
      swift_arrayDestroy();
      MEMORY[0x1B3E9F6B0](v14, -1, -1);
      MEMORY[0x1B3E9F6B0](v13, -1, -1);
    }
    else
    {
    }
    id v8 = 0;
LABEL_8:
    id v16 = objc_msgSend(v3, sel_associatedObjectIdentifier);
    if (v16)
    {
      sub_1B0B8240C();

      double v17 = self;
      swift_bridgeObjectRetain();
      double v18 = (void *)sub_1B0B823CC();
      id v19 = objc_msgSend((id)v2, sel_managedObjectContext);
      id v16 = objc_msgSend(v17, sel_visibleNoteWithIdentifier_context_, v18, v19);
      swift_bridgeObjectRelease_n();

      if (v16)
      {
        id v20 = v16;
        id v16 = sub_1B0B6ACB8(v20, v3);
      }
    }
    if (qword_1EBBB4E20 != -1) {
      swift_once();
    }
    long long v21 = xmmword_1EBBB4C98;
    long long v22 = xmmword_1EBBB4CB8;
    id v23 = objc_msgSend(v3, sel_traitCollection);
    id v3 = objc_msgSend(self, sel_formatForTraitCollection_, v23);

    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17D8]), sel_initWithSize_format_, v3, xmmword_1EBBB4C98);
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 24) = 0;
    *(void *)(v2 + 32) = 0;
    *(void *)(v2 + 16) = v8;
    *(_OWORD *)(v2 + 40) = v21;
    *(void *)(v2 + 56) = v16;
    *(void *)(v2 + 64) = *((void *)&v22 + 1);
    *(void *)(v2 + 72) = v22;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = sub_1B0B6B58C;
    *(void *)(v25 + 24) = v2;
    aBlock[4] = sub_1B0AF3534;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B0B696F0;
    aBlock[3] = &block_descriptor_30;
    id v26 = _Block_copy(aBlock);
    id v27 = v16;
    swift_retain();
    id v28 = v8;
    swift_release();
    id v29 = objc_msgSend(v24, sel_imageWithActions_, v26);

    _Block_release(v26);
    LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v26 & 1) == 0) {
      break;
    }
    __break(1u);
LABEL_16:
    swift_once();
  }
  return v29;
}

id sub_1B0B6AAF4(void *a1)
{
  id v3 = objc_msgSend(a1, sel_associatedObjectIdentifier);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  sub_1B0B8240C();

  id v5 = self;
  swift_bridgeObjectRetain();
  id v6 = (void *)sub_1B0B823CC();
  id v7 = objc_msgSend(v1, sel_managedObjectContext);
  id v8 = objc_msgSend(v5, sel_visibleNoteWithIdentifier_context_, v6, v7);
  swift_bridgeObjectRelease_n();

  if (!v8) {
    return 0;
  }
  id v9 = v8;
  id v10 = objc_msgSend(v1, sel_managedObjectContext);
  id v11 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailGeneratorNote), sel_initWithManagedObjectContext_, v10);

  id v12 = objc_msgSend(v11, sel_generateThumbnailImageWithNote_configuration_, v9, a1);
  return v12;
}

id sub_1B0B6ACB8(void *a1, id a2)
{
  id v32 = objc_msgSend(a2, sel_thumbnailType);
  v34[3] = sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  v34[0] = a1;
  id v4 = a1;
  id v5 = objc_msgSend(v4, sel_identifier);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_1B0B8240C();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = objc_msgSend(v4, sel_title);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = sub_1B0B8240C();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(v4, sel_account);
  id v16 = v15;
  if (v15)
  {
    id v17 = objc_msgSend(v15, sel_identifier);

    if (v17)
    {
      id v16 = (void *)sub_1B0B8240C();
      uint64_t v19 = v18;

      goto LABEL_12;
    }
    id v16 = 0;
  }
  uint64_t v19 = 0;
LABEL_12:
  if (qword_1EBBB4E20 != -1) {
    swift_once();
  }
  double v20 = *(double *)&xmmword_1EBBB4C98 - *((double *)&xmmword_1EBBB4CB8 + 1) - unk_1EBBB4CD0;
  double v21 = *((double *)&xmmword_1EBBB4C98 + 1) - *(double *)&xmmword_1EBBB4CB8 - *(double *)&qword_1EBBB4CC8;
  objc_msgSend(a2, sel_scale);
  double v23 = v22;
  id v24 = objc_msgSend(a2, sel_appearanceInfo);
  char v25 = objc_msgSend(a2, sel_hasBorder);
  id v26 = objc_allocWithZone((Class)ICThumbnailConfiguration);
  id v27 = sub_1B0B6B30C((uint64_t)v32, v34, v20, v21, v23, v7, v9, v12, v14, (uint64_t)v16, v19, 0, v24, 0, v25);
  id v28 = objc_msgSend(v33, sel_managedObjectContext);
  id v29 = objc_msgSend(objc_allocWithZone((Class)ICThumbnailGeneratorNote), sel_initWithManagedObjectContext_, v28);

  objc_msgSend(v29, sel_setMaximumWidth_, *(double *)&xmmword_1EBBB4C98);
  objc_msgSend(v29, sel_setMargin_, *(double *)&qword_1EBBB4CD8);
  id v30 = objc_msgSend(v29, sel_generateThumbnailImageWithNote_configuration_, v4, v27);

  return v30;
}

id sub_1B0B6AFAC(void *a1, id a2, void *a3, double a4, double a5, double a6, double a7)
{
  objc_msgSend(a2, sel_set);
  if (qword_1EBBB4E20 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_fillRect_, 0.0, 0.0, *(double *)&qword_1EBBB4CA8, unk_1EBBB4CB0);
  return objc_msgSend(a3, sel_drawInRect_, a4, a5, a6, a7);
}

id ThumbnailGeneratorSystemPaper.__allocating_init(managedObjectContext:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithManagedObjectContext_, a1);

  return v3;
}

void ThumbnailGeneratorSystemPaper.init(managedObjectContext:)()
{
}

id ThumbnailGeneratorSystemPaper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ThumbnailGeneratorSystemPaper()
{
  return self;
}

uint64_t method lookup function for ThumbnailGeneratorSystemPaper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ThumbnailGeneratorSystemPaper);
}

uint64_t dispatch thunk of ThumbnailGeneratorSystemPaper.__allocating_init(managedObjectContext:cache:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1B0B6B1C4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t objectdestroyTm_3()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1B0B6B248()
{
  uint64_t v1 = *(void (**)(void))(v0 + 32);
  ThumbnailGeneratorSystemPaper.thumbnail(with:)(*(ICThumbnailDescription **)(v0 + 16), *(ICThumbnailConfiguration **)(v0 + 24));
  id v3 = v2;
  v1();
}

uint64_t sub_1B0B6B2A8()
{
  return MEMORY[0x1F4186498](v0, 72, 7);
}

id sub_1B0B6B2E8(void *a1)
{
  return sub_1B0B6AFAC(a1, *(id *)(v1 + 16), *(void **)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48), *(double *)(v1 + 56));
}

uint64_t sub_1B0B6B2FC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1B0B6B30C(uint64_t a1, void *a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, char a15)
{
  uint64_t v36 = a1;
  v35[0] = a8;
  v35[1] = a10;
  uint64_t v21 = a2[3];
  if (v21)
  {
    double v23 = __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    uint64_t v24 = *(void *)(v21 - 8);
    MEMORY[0x1F4188790](v23);
    id v26 = (char *)v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v26);
    uint64_t v27 = sub_1B0B8337C();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v21);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a2);
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    id v28 = 0;
    uint64_t v29 = a12;
    if (a9) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v27 = 0;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  id v28 = (void *)sub_1B0B823CC();
  swift_bridgeObjectRelease();
  uint64_t v29 = a12;
  if (a9)
  {
LABEL_4:
    id v30 = (void *)sub_1B0B823CC();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  id v30 = 0;
LABEL_8:
  if (a11)
  {
    id v31 = (void *)sub_1B0B823CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v31 = 0;
  }
  LOBYTE(v34) = a15 & 1;
  id v32 = objc_msgSend(v37, sel_initWithThumbnailType_associatedObject_associatedObjectIdentifier_associatedObjectTitle_accountIdentifier_cacheLevel_preferredSize_scale_appearanceInfo_backgroundColor_hasBorder_, v36, v27, v28, v30, v31, v29, a3, a4, a5, a13, a14, v34);
  swift_unknownObjectRelease();

  return v32;
}

uint64_t sub_1B0B6B54C()
{
  return MEMORY[0x1F4186498](v0, 80, 7);
}

id sub_1B0B6B58C()
{
  uint64_t v1 = *(void **)(v0 + 56);
  double v2 = *(double *)(v0 + 64);
  double v3 = *(double *)(v0 + 72);
  objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
  return objc_msgSend(v1, sel_drawAtPoint_, v2, v3);
}

uint64_t sub_1B0B6B5F4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id ICCalculateScrubberController.textView.getter()
{
  return *(id *)(v0 + OBJC_IVAR___ICCalculateScrubberController_textView);
}

void *ICCalculateScrubberController.note.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  double v2 = *v1;
  id v3 = v2;
  return v2;
}

void ICCalculateScrubberController.note.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  id v4 = *v3;
  void *v3 = a1;
}

uint64_t ICCalculateScrubberController.isScrubbing.getter()
{
  if (!*(void *)(v0 + OBJC_IVAR___ICCalculateScrubberController_scrubber)) {
    return 0;
  }
  swift_retain();
  char v1 = sub_1B0B8004C();
  swift_release();
  return v1 & 1;
}

id sub_1B0B6B840(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_scrubber) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_numberLiteral) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_note) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_scrubberView) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR___ICCalculateScrubberController_isBlockingMerge) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_viewController) = 0;
  *(void *)(v1 + OBJC_IVAR___ICCalculateScrubberController_textView) = a1;
  v3.super_class = (Class)ICCalculateScrubberController;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_1B0B6B90C()
{
  uint64_t v1 = OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController;
  double v2 = *(void **)(v0 + OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController);
  }
  else
  {
    id v4 = (objc_class *)_s15HoverControllerCMa();
    id v5 = (char *)objc_allocWithZone(v4);
    swift_unknownObjectWeakInit();
    *(void *)&v5[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral] = 0;
    id v6 = &v5[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex];
    *(void *)id v6 = 0;
    v6[8] = 1;
    *(void *)&v5[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer] = 0;
    swift_unknownObjectWeakAssign();
    v11.receiver = v5;
    v11.super_class = v4;
    id v7 = objc_msgSendSuper2(&v11, sel_init);
    uint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    double v2 = 0;
  }
  id v9 = v2;
  return v3;
}

uint64_t ICCalculateScrubberController.isShowing.getter()
{
  uint64_t result = *(void *)(v0 + OBJC_IVAR___ICCalculateScrubberController_viewController);
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend((id)result, sel_view);
    if (result)
    {
      double v2 = (void *)result;
      id v3 = objc_msgSend((id)result, sel_window);

      if (v3)
      {

        return 1;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_1B0B6BAF0(void *a1, char a2)
{
  id v3 = v2;
  if (a1)
  {
    uint64_t v6 = OBJC_IVAR___ICCalculateScrubberController_numberLiteral;
    id v7 = *(void **)&v2[OBJC_IVAR___ICCalculateScrubberController_numberLiteral];
    if (v7)
    {
      type metadata accessor for ICNumberLiteral();
      id v19 = a1;
      id v8 = v7;
      char v9 = sub_1B0B82C8C();

      if (v9 & 1) != 0 && (objc_msgSend(v3, sel_isShowing))
      {
LABEL_14:

        return;
      }
    }
    else
    {
      id v10 = a1;
    }
    objc_msgSend(v3, sel_hideScrubber);
    objc_super v11 = *(void **)&v3[v6];
    *(void *)&v3[v6] = a1;
    id v19 = a1;

    objc_msgSend(v3, sel_deselectText);
    id v12 = objc_msgSend(v19, sel_string);
    sub_1B0B8240C();

    sub_1B0B8008C();
    swift_allocObject();
    uint64_t v13 = sub_1B0B8006C();
    uint64_t v14 = OBJC_IVAR___ICCalculateScrubberController_scrubber;
    *(void *)&v3[OBJC_IVAR___ICCalculateScrubberController_scrubber] = v13;
    swift_release();
    uint64_t v15 = *(void *)&v3[v14];
    if (!v15) {
      goto LABEL_14;
    }
    *(void *)(swift_allocObject() + 16) = v3;
    swift_retain();
    id v16 = v3;
    sub_1B0B8005C();
    *(void *)(swift_allocObject() + 16) = v16;
    id v17 = v16;
    sub_1B0B8007C();
    *(void *)(swift_allocObject() + 16) = v17;
    uint64_t v18 = v17;
    sub_1B0B8003C();
    objc_msgSend(v18, sel_startBlockingMerge);
    sub_1B0B6BDA8(v15, a2 & 1);

    swift_release();
  }
  else
  {
    objc_msgSend(v2, sel_hideScrubber);
  }
}

void sub_1B0B6BDA8(uint64_t a1, int a2)
{
  objc_allocWithZone((Class)type metadata accessor for CalculateScrubberViewController());
  swift_retain();
  id v5 = v2;
  id v6 = sub_1B0B14654(a1, v5, a2);
  swift_release();
  uint64_t v7 = OBJC_IVAR___ICCalculateScrubberController_viewController;
  id v8 = *(void **)&v5[OBJC_IVAR___ICCalculateScrubberController_viewController];
  *(void *)&v5[OBJC_IVAR___ICCalculateScrubberController_viewController] = v6;

  id v9 = objc_msgSend(v5, sel_textView);
  while (1)
  {
    id v10 = v9;
    id v9 = objc_msgSend(v9, sel_nextResponder);

    if (!v9) {
      break;
    }
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();
    if (v11)
    {
      id v12 = (void *)v11;
      uint64_t v13 = *(void **)&v5[OBJC_IVAR___ICCalculateScrubberController_numberLiteral];
      if (!v13) {
        goto LABEL_20;
      }
      id v14 = objc_msgSend(v13, sel_range);
      uint64_t v16 = v15;
      id v17 = objc_msgSend(v5, sel_textView);
      objc_msgSend(v17, sel_ic_rectForRange_, v14, v16);
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      id v26 = objc_msgSend(v5, sel_textView);
      objc_msgSend(v26, sel_textContainerInset);
      CGFloat v28 = v27;

      id v29 = objc_msgSend(v5, sel_textView);
      objc_msgSend(v29, sel_textContainerInset);
      CGFloat v31 = v30;

      v56.origin.double x = v19;
      v56.origin.double y = v21;
      v56.size.double width = v23;
      v56.size.double height = v25;
      CGRect v57 = CGRectOffset(v56, v28, v31);
      id v32 = *(void **)&v5[v7];
      if (v32)
      {
        double x = v57.origin.x;
        double y = v57.origin.y;
        double width = v57.size.width;
        double height = v57.size.height;
        id v54 = v32;
        id v37 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v37)
        {
          uint64_t v38 = v37;
          id v39 = objc_msgSend(v5, sel_textView);
          objc_msgSend(v38, sel_setSourceView_, v39);
        }
        id v40 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v40)
        {
          uint64_t v41 = v40;
          objc_msgSend(v40, sel_setPermittedArrowDirections_, 3);
        }
        id v42 = objc_msgSend(v54, sel_popoverPresentationController);
        objc_msgSend(v42, sel_setSourceRect_, x, y, width, height);

        id v43 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v43)
        {
          uint64_t v44 = v43;
          objc_msgSend(v43, sel_setCanOverlapSourceViewRect_, 0);
        }
        id v45 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v45)
        {
          uint64_t v46 = v45;
          objc_msgSend(v45, sel__setShouldDimPresentingViewTint_, 0);
        }
        id v47 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v47)
        {
          uint64_t v48 = v47;
          objc_msgSend(v47, sel__setCornerRadius_, 8.0);
        }
        id v49 = objc_msgSend(v54, sel_popoverPresentationController);
        if (v49)
        {
          uint64_t v50 = v49;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4A70);
          uint64_t v51 = swift_allocObject();
          *(_OWORD *)(v51 + 16) = xmmword_1B0B9B380;
          *(void *)(v51 + 32) = objc_msgSend(v5, sel_textView);
          sub_1B0B8261C();
          sub_1B0A2E124(0, &qword_1EBBB54B8);
          uint64_t v52 = (void *)sub_1B0B825AC();
          swift_bridgeObjectRelease();
          objc_msgSend(v50, sel_setPassthroughViews_, v52);
        }
        objc_msgSend(v12, sel_presentViewController_animated_completion_, v54, 1, 0);

        uint64_t v53 = v54;
      }
      else
      {
LABEL_20:
        uint64_t v53 = v9;
      }

      return;
    }
  }
}

Swift::Void __swiftcall ICCalculateScrubberController.hideScrubber()()
{
  if (objc_msgSend(v0, sel_isShowing))
  {
    uint64_t v1 = *(void **)&v0[OBJC_IVAR___ICCalculateScrubberController_viewController];
    if (v1) {
      objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
    objc_msgSend(v0, sel_endBlockingMerge);
    objc_msgSend(v0, sel_endPausingUndoActions);
  }
}

Swift::Void __swiftcall ICCalculateScrubberController.didBeginScrub()()
{
  objc_msgSend(v0, sel_startPausingUndoActions);
}

Swift::Void __swiftcall ICCalculateScrubberController.updateText(string:)(Swift::String string)
{
  uint64_t v2 = OBJC_IVAR___ICCalculateScrubberController_numberLiteral;
  id v3 = *(void **)&v1[OBJC_IVAR___ICCalculateScrubberController_numberLiteral];
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_range);
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v1, sel_note);
    if (v7)
    {
      id v8 = v7;
      id v9 = objc_msgSend(v7, sel_textStorage);

      if (v9)
      {
        id v10 = (void *)sub_1B0B823CC();
        objc_msgSend(v9, sel_replaceCharactersInRange_withString_, v4, v6, v10);
      }
    }
    uint64_t v11 = sub_1B0B8247C();
    id v12 = *(void **)&v1[v2];
    if (v12) {
      objc_msgSend(v12, sel_setRange_, v4, v11);
    }
    id v13 = objc_msgSend(v1, sel_note);
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_msgSend(v13, sel_calculateDocumentController);

      if (v15)
      {
        objc_msgSend(v15, sel_scheduleUpdateAffectingChangeCounts_isHighPriority_, 1, 1);
      }
    }
  }
}

Swift::Void __swiftcall ICCalculateScrubberController.didEndScrub()()
{
  id v1 = objc_msgSend(v0, sel_note);
  objc_msgSend(v1, sel_updateModificationDateAndChangeCountAndSaveImmediately);
}

Swift::Void __swiftcall ICCalculateScrubberController.hideIfNotScrubbing()()
{
  id v1 = *(void **)&v0[OBJC_IVAR___ICCalculateScrubberController_viewController];
  if (v1)
  {
    id v3 = v1;
    swift_retain();
    char v2 = sub_1B0B8004C();
    swift_release();
    if ((v2 & 1) == 0) {
      objc_msgSend(v0, sel_hideScrubber);
    }
  }
}

void sub_1B0B6C720()
{
  id v1 = objc_msgSend(v0, sel_textView);
  objc_msgSend(v1, sel_selectedRange);
  uint64_t v3 = v2;

  if (v3 >= 1)
  {
    id v6 = objc_msgSend(v0, sel_textView);
    id v4 = objc_msgSend(v0, sel_textView);
    id v5 = objc_msgSend(v4, sel_selectedRange);

    objc_msgSend(v6, sel_setSelectedRange_, v5, 0);
  }
}

void sub_1B0B6C858()
{
  id v1 = objc_msgSend(v0, sel_note);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_documentMergeController);

    if (v3)
    {
      uint64_t v4 = OBJC_IVAR___ICCalculateScrubberController_isBlockingMerge;
      if (*((unsigned char *)v0 + OBJC_IVAR___ICCalculateScrubberController_isBlockingMerge))
      {
        swift_unknownObjectRelease();
      }
      else
      {
        id v5 = objc_msgSend(v0, sel_textView);
        objc_msgSend(v3, sel_beginBlockingMergeForReason_textView_, 6, v5);

        swift_unknownObjectRelease();
        *((unsigned char *)v0 + v4) = 1;
      }
    }
  }
}

void sub_1B0B6C980()
{
  uint64_t v1 = OBJC_IVAR___ICCalculateScrubberController_isBlockingMerge;
  if (*((unsigned char *)v0 + OBJC_IVAR___ICCalculateScrubberController_isBlockingMerge) == 1)
  {
    id v2 = objc_msgSend(v0, sel_note);
    if (v2)
    {
      id v3 = v2;
      id v4 = objc_msgSend(v2, sel_documentMergeController);

      if (v4)
      {
        id v5 = objc_msgSend(v0, sel_textView);
        objc_msgSend(v4, sel_endBlockingMergeForReason_textView_, 6, v5);

        swift_unknownObjectRelease();
      }
    }
    *((unsigned char *)v0 + v1) = 0;
  }
}

void __swiftcall ICCalculateScrubberController.init()(ICCalculateScrubberController *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void ICCalculateScrubberController.init()()
{
}

void sub_1B0B6CD74()
{
  qword_1E9B51DF0 = sub_1B0B6CD94();
}

double sub_1B0B6CD94()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_standardUserDefaults);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4A9B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B0B9A310;
  uint64_t v3 = *MEMORY[0x1E4F83858];
  *(void *)(inited + 32) = sub_1B0B8240C();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 48) = 1;
  sub_1B0A3DB44(inited);
  id v5 = (void *)sub_1B0B8232C();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_registerDefaults_, v5);

  id v6 = objc_msgSend(v0, sel_standardUserDefaults);
  objc_msgSend(v6, sel_doubleForKey_, v3);
  double v8 = v7;

  return v8;
}

void sub_1B0B6CED0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B0B8001C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4C548);
  MEMORY[0x1F4188790](v10);
  id v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v2
                 + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex
                 + 8) & 1) == 0)
  {
    uint64_t v13 = *(void *)(v2
                    + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex);
    if ((a2 & 1) != 0 || v13 != a1)
    {
      uint64_t v14 = v3 + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_scrubberController;
      uint64_t v15 = MEMORY[0x1B3E9F7C0](v3 + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_scrubberController);
      if (v15)
      {
        uint64_t v16 = (char *)v15;
        uint64_t v39 = v7;
        id v17 = (void *)MEMORY[0x1B3E9F7C0](v14);
        if (v17)
        {
          double v18 = v17;
          id v19 = objc_msgSend(v17, sel_note);

          id v20 = objc_msgSend(v19, sel_calculateDocumentController);
        }
        else
        {
          id v20 = 0;
        }
        CGFloat v21 = (char *)objc_msgSend(v20, sel_numberLiteralAtLocation_, v13);

        if (objc_msgSend(v16, sel_isShowing))
        {
          uint64_t v22 = OBJC_IVAR___ICCalculateScrubberController_viewController;
          CGFloat v23 = *(void **)&v16[OBJC_IVAR___ICCalculateScrubberController_viewController];
          if (v23)
          {
            id v24 = v23;
            sub_1B0B8127C();
            CGFloat v25 = &v12[*(int *)(v10 + 36)];
            char v26 = *v25;
            uint64_t v27 = *((void *)v25 + 1);
            char v40 = v26;
            uint64_t v41 = v27;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4AA00);
            sub_1B0B81B2C();
            char v28 = v42;
            sub_1B0B149F8((uint64_t)v12);

            if (v28) {
              goto LABEL_21;
            }
            id v29 = *(void **)&v16[v22];
            if (v29)
            {
              id v30 = v29;
              sub_1B0B8127C();
              uint64_t v31 = v39;
              (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v9, v12, v6);
              sub_1B0B149F8((uint64_t)v12);
              char v32 = sub_1B0B8000C();
              (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);

              if ((v32 & 1) == 0) {
                goto LABEL_21;
              }
            }
          }
        }
        uint64_t v33 = OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral;
        uint64_t v34 = *(void **)(v3 + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral);
        if (v21)
        {
          if (v34)
          {
            type metadata accessor for ICNumberLiteral();
            id v35 = v34;
            uint64_t v36 = v21;
            char v37 = sub_1B0B82C8C();

            if (v37)
            {
              CGFloat v21 = v36;
LABEL_21:

              uint64_t v16 = v21;
LABEL_22:

              return;
            }
            uint64_t v34 = *(void **)(v3 + v33);
          }
        }
        else if (!v34)
        {
          goto LABEL_22;
        }
        *(void *)(v3 + v33) = v21;
        uint64_t v38 = v21;

        CGFloat v21 = (char *)sub_1B0B6D22C();
        objc_msgSend(v21, sel_requestFire);

        uint64_t v16 = v38;
        goto LABEL_21;
      }
    }
  }
}

id sub_1B0B6D22C()
{
  uint64_t v1 = OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer];
  }
  else
  {
    uint64_t v4 = qword_1E9B4A3F8;
    id v5 = v0;
    if (v4 != -1) {
      swift_once();
    }
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F837C8]), sel_initWithTarget_selector_delay_waitToFireUntilRequestsStop_callOnMainThread_, v5, sel_showScrubber, 1, 1, *(double *)&qword_1E9B51DF0);

    uint64_t v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

Swift::Void __swiftcall ICCalculateScrubberController.resetHoverTimer()()
{
  id v0 = sub_1B0B6B90C();
  id v1 = sub_1B0B6D22C();
  objc_msgSend(v1, sel_cancelPreviousFireRequests);
}

id sub_1B0B6D520@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_note);
  *a2 = result;
  return result;
}

id sub_1B0B6D55C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNote_, *a1);
}

uint64_t type metadata accessor for ICCalculateScrubberController(uint64_t a1)
{
  return sub_1B0A2E124(a1, &qword_1E9B4D060);
}

uint64_t _s15HoverControllerCMa()
{
  return self;
}

uint64_t sub_1B0B6D610()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B0B6D648()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_didBeginScrub);
}

void sub_1B0B6D658()
{
  id v1 = *(void **)(v0 + 16);
  id v2 = (id)sub_1B0B823CC();
  objc_msgSend(v1, sel_updateText_, v2);
}

id sub_1B0B6D6B0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_didEndScrub);
}

void sub_1B0B6D6C8()
{
  id v1 = (void *)MEMORY[0x1B3E9F7C0](v0+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController);
  if (v1)
  {
    id v2 = v1;
    id v6 = objc_msgSend(v1, sel_textView);

    id v3 = v6;
    if (v6)
    {
      uint64_t v4 = OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_errorMenuGestureRecognizer;
      if (!*(void *)(v0
                      + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_errorMenuGestureRecognizer))
      {
        id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D38]), sel_initWithTarget_action_, v0, sel_didTapTextView_);
        objc_msgSend(v5, sel_setDelegate_, v0);
        objc_msgSend(v6, sel_addGestureRecognizer_, v5);

        id v3 = *(void **)(v0 + v4);
        *(void *)(v0 + v4) = v5;
      }
    }
  }
}

id sub_1B0B6D7C4(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  v4[88] = 2;
  *(_OWORD *)&v1[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_hitTestSize] = xmmword_1B0B9F5C0;
  *(void *)&v1[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_errorMenuGestureRecognizer] = 0;
  swift_unknownObjectWeakAssign();
  v13.receiver = v1;
  v13.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v13, sel_init);
  id v6 = self;
  id v7 = v5;
  id v8 = objc_msgSend(v6, sel_defaultCenter);
  uint64_t v9 = *MEMORY[0x1E4FB30A0];
  id v10 = v7;
  id v11 = objc_msgSend(a1, sel_textView);
  objc_msgSend(v8, sel_addObserver_selector_name_object_, v10, sel_textViewDidChangeText_, v9, v11);

  return v10;
}

void sub_1B0B6D934(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(*(id *)a1, sel_tooltip);
  if (v4)
  {
    id v5 = v4;
    sub_1B0B8240C();

    objc_allocWithZone((Class)type metadata accessor for CalculateErrorViewController());
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v6 = (void *)sub_1B0B8125C();
    objc_msgSend(v6, sel_setModalPresentationStyle_, 7);
    id v7 = objc_msgSend(v6, sel_popoverPresentationController);
    if (v7)
    {
      id v8 = v7;
      objc_msgSend(v7, sel_setPermittedArrowDirections_, 3);
    }
    id v9 = objc_msgSend(v6, sel_popoverPresentationController);
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v9, sel__setShouldHideArrow_, 1);
    }
    uint64_t v11 = v2
        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController;
    id v12 = (void *)MEMORY[0x1B3E9F7C0](v2+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController);
    if (v12
      && (objc_super v13 = v12, v14 = objc_msgSend(v12, sel_textView), v13, v14))
    {
      uint64_t v15 = (void *)MEMORY[0x1B3E9F7C0](v11);
      if (v15
        && (uint64_t v16 = v15, v17 = objc_msgSend(v15, sel_textView), v16, v17)
        && (id v18 = objc_msgSend(v17, sel_window), v17, v18)
        && (id v19 = objc_msgSend(v18, sel_rootViewController), v18, v19))
      {
        objc_msgSend(v14, sel_ic_rectForRange_, *(void *)(a1 + 8), *(void *)(a1 + 16));
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        objc_msgSend(v14, sel_textContainerInset);
        CGFloat v29 = v28;
        objc_msgSend(v14, sel_textContainerInset);
        CGFloat v31 = v30;
        v39.origin.double x = v21;
        v39.origin.double y = v23;
        v39.size.double width = v25;
        v39.size.double height = v27;
        CGRect v40 = CGRectOffset(v39, v29, v31);
        double x = v40.origin.x;
        double y = v40.origin.y;
        double width = v40.size.width;
        double height = v40.size.height;
        id v36 = objc_msgSend(v6, sel_popoverPresentationController);
        objc_msgSend(v36, sel_setSourceRect_, x, y, width, height);

        id v37 = objc_msgSend(v6, sel_popoverPresentationController);
        if (v37)
        {
          uint64_t v38 = v37;
          objc_msgSend(v37, sel_setSourceView_, v14);
        }
        objc_msgSend(v19, sel_presentViewController_animated_completion_, v6, 1, 0);

        id v14 = *(id *)(v2
                    + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController);
        *(void *)(v2
                  + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController) = v6;
      }
      else
      {
      }
    }
    else
    {
      id v14 = v6;
    }
  }
}

void sub_1B0B6DC64(CGFloat *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  id v7 = &v3[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController];
  id v8 = (void *)MEMORY[0x1B3E9F7C0](&v3[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController]);
  CGFloat v9 = 0.0;
  if (!v8) {
    goto LABEL_16;
  }
  id v10 = v8;
  id v11 = objc_msgSend(v8, sel_textView);

  if (!v11) {
    goto LABEL_16;
  }
  id v12 = (void *)MEMORY[0x1B3E9F7C0](v7);
  if (!v12
    || (objc_super v13 = v12, v14 = objc_msgSend(v12, sel_note), v13, !v14)
    || (id v15 = objc_msgSend(v14, sel_calculateDocumentController),
        v14,
        !v15))
  {

    goto LABEL_16;
  }
  id v16 = objc_msgSend(v15, sel_note);
  if (!v16
    || (id v17 = v16,
        id v18 = objc_msgSend(v16, sel_textStorage),
        v17,
        (id v82 = v18) == 0))
  {

    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5158);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B0B9A300;
  double v20 = a2
      - *(double *)&v3[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_hitTestSize]
      * 0.5;
  double v21 = *(double *)&v3[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_hitTestSize
                     + 8]
      * 0.5;
  *(double *)(inited + 32) = v20;
  *(double *)(inited + 40) = a3 - v21;
  *(double *)(inited + 48) = v20;
  *(double *)(inited + 56) = a3;
  *(double *)(inited + 64) = v20;
  *(double *)(inited + 72) = v21 + a3;
  id v22 = v11;
  CGFloat v23 = v3;
  double v24 = (void *)sub_1B0B6F5B4(inited, v22, (uint64_t)v23);

  swift_setDeallocating();
  uint64_t v100 = MEMORY[0x1E4FBC860];
  uint64_t v25 = v24[2];
  uint64_t v76 = v22;
  uint64_t v77 = v15;
  if (!v25)
  {
    swift_bridgeObjectRelease();
    id v43 = 0;
    uint64_t v44 = MEMORY[0x1E4FBC860];
LABEL_20:
    uint64_t v55 = *(void *)(v44 + 16);
    if (v55)
    {
      uint64_t v75 = (uint64_t)v43;
      uint64_t v56 = *(void *)(v44 + 112);
      uint64_t v57 = *(void *)(v44 + 96);
      uint64_t v79 = *(void *)(v44 + 104);
      uint64_t v80 = *(void *)(v44 + 88);
      CGFloat v53 = *(double *)(v44 + 72);
      CGFloat v54 = *(double *)(v44 + 80);
      CGFloat v52 = *(double *)(v44 + 64);
      uint64_t v58 = v44 + 56;
      CGFloat v9 = *(double *)(v44 + 56);
      uint64_t v78 = *(void *)(v44 + 48);
      uint64_t v81 = *(void *)(v44 + 40);
      id v59 = *(id *)(v44 + 32);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v74 = v59;
      uint64_t v86 = v57;
      uint64_t v87 = v74;
      uint64_t v84 = v56;
      do
      {
        uint64_t v60 = *(void *)(v58 - 16);
        uint64_t v61 = *(void *)(v58 - 8);
        CGFloat v62 = *(double *)v58;
        CGFloat v63 = *(double *)(v58 + 8);
        CGFloat v64 = *(double *)(v58 + 16);
        CGFloat v65 = *(double *)(v58 + 24);
        uint64_t v67 = *(void *)(v58 + 32);
        uint64_t v66 = *(void *)(v58 + 40);
        uint64_t v69 = *(void *)(v58 + 48);
        uint64_t v68 = *(void *)(v58 + 56);
        id v70 = *(id *)(v58 - 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v101.origin.double x = v9;
        v101.origin.double y = v52;
        v101.size.double width = v53;
        v101.size.double height = v54;
        CGRectGetMidX(v101);
        v102.size.double height = v54;
        double v93 = v9;
        v102.origin.double x = v9;
        v102.origin.double y = v52;
        v102.size.double width = v53;
        CGRectGetMidY(v102);
        TSDDistance();
        double v72 = fabs(v71);
        v103.origin.double x = v62;
        v103.origin.double y = v63;
        v103.size.double width = v64;
        v103.size.double height = v65;
        CGRectGetMidX(v103);
        v104.origin.double x = v62;
        v104.origin.double y = v63;
        v104.size.double width = v64;
        v104.size.double height = v65;
        CGRectGetMidY(v104);
        TSDDistance();
        if (fabs(v73) >= v72)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          CGFloat v9 = v93;
        }
        else
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v86 = v66;
          uint64_t v87 = v70;
          uint64_t v80 = v67;
          uint64_t v81 = v60;
          uint64_t v78 = v61;
          uint64_t v79 = v69;
          CGFloat v9 = v62;
          CGFloat v52 = v63;
          CGFloat v53 = v64;
          CGFloat v54 = v65;
          uint64_t v84 = v68;
        }
        v58 += 88;
        --v55;
      }
      while (v55);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      sub_1B0A2508C(v75);
      uint64_t v48 = v80;
      uint64_t v46 = v81;
      uint64_t v47 = v78;
      uint64_t v50 = v79;
      uint64_t v49 = v86;
      id v45 = v87;
      uint64_t v51 = v84;
      goto LABEL_17;
    }

    swift_bridgeObjectRelease();
    sub_1B0A2508C((uint64_t)v43);
LABEL_16:
    id v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    CGFloat v52 = 0.0;
    CGFloat v53 = 0.0;
    CGFloat v54 = 0.0;
LABEL_17:
    *(void *)a1 = v45;
    *((void *)a1 + 1) = v46;
    *((void *)a1 + 2) = v47;
    a1[3] = v9;
    a1[4] = v52;
    a1[5] = v53;
    a1[6] = v54;
    *((void *)a1 + 7) = v48;
    *((void *)a1 + 8) = v49;
    *((void *)a1 + 9) = v50;
    *((void *)a1 + 10) = v51;
    return;
  }
  uint64_t v91 = v24[4];
  uint64_t v83 = v24[5];
  uint64_t v85 = v24;
  id v26 = objc_msgSend(v18, sel_highlightsAttributedString);
  CGFloat v27 = (void *)*MEMORY[0x1E4F83558];
  double v28 = (void *)swift_allocObject();
  v28[2] = v22;
  v28[3] = v15;
  v28[4] = &v100;
  id v90 = v22;
  id v29 = v27;
  id v89 = v15;
  sub_1B0A2508C(0);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_1B0B6FB68;
  *(void *)(v30 + 24) = v28;
  uint64_t v98 = sub_1B0AB9760;
  uint64_t v99 = v30;
  uint64_t v88 = MEMORY[0x1E4F143A8];
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v95 = 1107296256;
  uint64_t v96 = sub_1B0A37CEC;
  uint64_t v97 = &block_descriptor_24;
  CGFloat v31 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v26, sel_enumerateAttribute_inRange_options_usingBlock_, v29, v91, v83, 0, v31);

  _Block_release(v31);
  LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v29 & 1) == 0)
  {
    uint64_t v32 = v25 - 1;
    if (v32)
    {
      uint64_t v33 = v85 + 7;
      do
      {
        uint64_t v34 = *(v33 - 1);
        uint64_t v92 = *v33;
        id v35 = objc_msgSend(v82, sel_highlightsAttributedString);
        id v36 = (void *)*MEMORY[0x1E4F83558];
        uint64_t v37 = swift_allocObject();
        *(void *)(v37 + 16) = v90;
        *(void *)(v37 + 24) = v89;
        *(void *)(v37 + 32) = &v100;
        id v38 = v90;
        id v39 = v36;
        id v40 = v89;
        sub_1B0A2508C((uint64_t)sub_1B0B6FB68);
        uint64_t v41 = swift_allocObject();
        *(void *)(v41 + 16) = sub_1B0B6FB68;
        *(void *)(v41 + 24) = v37;
        uint64_t v98 = sub_1B0AB9760;
        uint64_t v99 = v41;
        uint64_t aBlock = v88;
        uint64_t v95 = 1107296256;
        uint64_t v96 = sub_1B0A37CEC;
        uint64_t v97 = &block_descriptor_24;
        char v42 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v35, sel_enumerateAttribute_inRange_options_usingBlock_, v39, v34, v92, 0, v42);

        _Block_release(v42);
        LOBYTE(v37) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (v37) {
          goto LABEL_28;
        }
        v33 += 2;
      }
      while (--v32);
    }
    swift_bridgeObjectRelease();
    id v43 = sub_1B0B6FB68;
    uint64_t v44 = v100;
    id v22 = v76;
    id v15 = v77;
    goto LABEL_20;
  }
LABEL_28:
  __break(1u);
}

void sub_1B0B6E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void **a7)
{
  sub_1B0AAB9F4(a1, (uint64_t)v49);
  if (!(void)v50)
  {
    sub_1B0A4BA04((uint64_t)v49);
    return;
  }
  sub_1B0A2E124(0, &qword_1E9B4D128);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  uint64_t v47 = a3;
  id v11 = v48[0];
  id v12 = objc_msgSend(v48[0], sel_errors);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4AD50);
  uint64_t v13 = sub_1B0B825CC();

  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (!v14)
  {

    return;
  }
  objc_msgSend(a5, sel_textContainerInset);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  objc_msgSend(a5, sel_ic_rectForRange_, a2, v47);
  CGRect v54 = CGRectOffset(v53, v18, v16);
  CGFloat x = v54.origin.x;
  CGFloat y = v54.origin.y;
  CGFloat width = v54.size.width;
  CGFloat height = v54.size.height;
  id v23 = objc_msgSend(v48[0], sel_errors);
  uint64_t v24 = sub_1B0B825CC();

  if (!*(void *)(v24 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v25 = *(void **)(v24 + 32);
  id v26 = v25;
  swift_bridgeObjectRelease();
  v49[0] = v25;
  sub_1B0A2E124(0, (unint64_t *)&qword_1E9B4C8A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    uint64_t v46 = 0;
    uint64_t v31 = 0;
    goto LABEL_14;
  }
  id v27 = objc_msgSend(v48[0], sel_localizedFailureReason);
  if (!v27
    || (v27,
        (id v28 = objc_msgSend(v48[0], sel_localizedFailureReason)) == 0))
  {

    goto LABEL_13;
  }
  id v29 = v28;
  uint64_t v46 = sub_1B0B8240C();
  uint64_t v31 = v30;

LABEL_14:
  sub_1B0A6B230();
  sub_1B0A4B0C4(a2, 1, v48);
  swift_release();
  sub_1B0A24FC4((uint64_t)v48, (uint64_t)v49, &qword_1E9B4AF20);
  uint64_t v32 = (void *)v49[0];
  if (v49[0])
  {
    uint64_t v33 = v49[1];
    uint64_t v34 = v49[2];
    long long v51 = v50;
    sub_1B0A6C4F8();
    id v35 = v32;
    sub_1B0A4DF70(v35, v33, v34);

    uint64_t v36 = sub_1B0B820FC();
    swift_release();
    long long v52 = v51;
    sub_1B0A77490((uint64_t)&v52);
    swift_release();
    if (v36)
    {
      swift_retain();
      sub_1B0B8206C();
      swift_release();
      uint64_t v37 = sub_1B0B81F1C();
      uint64_t v39 = v38;
      swift_release();
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v39 = 0;
    }
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  id v40 = *a7;
  swift_bridgeObjectRetain();
  id v41 = v11;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a7 = v40;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v40 = sub_1B0AD8E18(0, v40[2] + 1, 1, v40);
    *a7 = v40;
  }
  unint64_t v44 = v40[2];
  unint64_t v43 = v40[3];
  if (v44 >= v43 >> 1)
  {
    id v40 = sub_1B0AD8E18((void *)(v43 > 1), v44 + 1, 1, v40);
    *a7 = v40;
  }
  v40[2] = v44 + 1;
  id v45 = (CGFloat *)&v40[11 * v44];
  *((void *)v45 + 4) = v41;
  *((void *)v45 + 5) = a2;
  *((void *)v45 + 6) = v47;
  v45[7] = x;
  v45[8] = y;
  v45[9] = width;
  v45[10] = height;
  *((void *)v45 + 11) = v37;
  *((void *)v45 + 12) = v39;
  *((void *)v45 + 13) = v46;
  *((void *)v45 + 14) = v31;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

void sub_1B0B6E85C(void *a1)
{
  id v3 = (void *)MEMORY[0x1B3E9F7C0](v1+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_textView);

    if (v5)
    {
      objc_msgSend(a1, sel_locationInView_, v5);
      sub_1B0B6DC64(v69, v6, v7);
      CGFloat v8 = v69[0];
      sub_1B0A24FC4((uint64_t)v69, (uint64_t)&v70, &qword_1EBBB3920);
      CGFloat v9 = v70;
      if (v70)
      {
        uint64_t v11 = v71;
        uint64_t v10 = v72;
        uint64_t v13 = v73;
        uint64_t v12 = v74;
        uint64_t v15 = v75;
        uint64_t v14 = v76;
        uint64_t v16 = v77;
        uint64_t v17 = v78;
        uint64_t v19 = v79;
        uint64_t v18 = v80;
        uint64_t v20 = v1 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state;
        uint64_t v21 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 8);
        CGFloat v65 = *(void **)(v1
                       + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state);
        uint64_t v22 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 16);
        uint64_t v58 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 24);
        uint64_t v59 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 32);
        uint64_t v67 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 40);
        uint64_t v60 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 48);
        uint64_t v57 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 56);
        uint64_t v63 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 64);
        uint64_t v62 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 72);
        uint64_t v61 = *(void *)(v1
                        + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                        + 80);
        unsigned __int8 v23 = *(unsigned char *)(v1
                       + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                       + 88);
        if (!v23 && v21 == v71 && v22 == v72)
        {
          *(void *)uint64_t v20 = v70;
          *(void *)(v20 + 8) = v11;
          *(void *)(v20 + 16) = v10;
          *(void *)(v20 + 24) = v13;
          *(void *)(v20 + 32) = v12;
          *(void *)(v20 + 40) = v15;
          *(void *)(v20 + 48) = v14;
          *(void *)(v20 + 56) = v16;
          *(void *)(v20 + 64) = v17;
          *(void *)(v20 + 72) = v19;
          *(void *)(v20 + 80) = v18;
          *(unsigned char *)(v20 + 88) = 1;
          uint64_t v27 = v10;
          uint64_t v54 = v11;
          uint64_t v55 = v10;
          uint64_t v28 = v11;
          swift_bridgeObjectRetain();
          id v29 = *(id *)&v8;
          swift_bridgeObjectRetain();
          sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FBE0);
          sub_1B0B6F170((uint64_t)v65, v28, v27, v58, v59, v67, v60, v57, v63, v62, v61, 0);
          sub_1B0B6F218(v65, v54, v55, v58, v59, v67, v60, v57, v63, v62, v61, 0);
          if (*(unsigned char *)(v20 + 88))
          {
            if (*(unsigned char *)(v20 + 88) != 1)
            {
              uint64_t v30 = *(void **)(v1
                             + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController);
              if (v30) {
                objc_msgSend(v30, sel_dismissViewControllerAnimated_completion_, 1, 0);
              }
            }
            sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);

            sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);
            sub_1B0B6F218(v65, v54, v55, v58, v59, v67, v60, v57, v63, v62, v61, 0);
          }
          else
          {
            uint64_t v42 = *(void *)(v20 + 72);
            uint64_t v41 = *(void *)(v20 + 80);
            uint64_t v43 = *(void *)(v20 + 64);
            uint64_t v56 = *(void *)(v20 + 56);
            uint64_t v44 = *(void *)(v20 + 40);
            uint64_t v45 = *(void *)(v20 + 32);
            uint64_t v52 = *(void *)(v20 + 24);
            uint64_t v53 = *(void *)(v20 + 48);
            uint64_t v46 = *(void *)(v20 + 8);
            uint64_t v51 = *(void *)(v20 + 16);
            uint64_t v47 = *(void **)v20;
            uint64_t v81 = v47;
            uint64_t v82 = v46;
            uint64_t v83 = v51;
            uint64_t v84 = v52;
            uint64_t v85 = v45;
            uint64_t v86 = v44;
            uint64_t v87 = v53;
            uint64_t v88 = v56;
            uint64_t v89 = v43;
            uint64_t v90 = v42;
            uint64_t v48 = v43;
            uint64_t v91 = v41;
            uint64_t v49 = v41;
            swift_bridgeObjectRetain();
            id v50 = v47;
            swift_bridgeObjectRetain();
            sub_1B0B6D934((uint64_t)&v81);
            sub_1B0B6F218(v47, v46, v51, v52, v45, v44, v53, v56, v48, v42, v49, 0);
            sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);

            sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);
            sub_1B0B6F218(v65, v54, v55, v58, v59, v67, v60, v57, v63, v62, v61, 0);
          }
        }
        else
        {
          *(void *)uint64_t v20 = v70;
          *(void *)(v20 + 8) = v11;
          *(void *)(v20 + 16) = v10;
          *(void *)(v20 + 24) = v13;
          *(void *)(v20 + 32) = v12;
          *(void *)(v20 + 40) = v15;
          *(void *)(v20 + 48) = v14;
          *(void *)(v20 + 56) = v16;
          *(void *)(v20 + 64) = v17;
          *(void *)(v20 + 72) = v19;
          *(void *)(v20 + 80) = v18;
          *(unsigned char *)(v20 + 88) = 0;
          swift_bridgeObjectRetain_n();
          id v24 = v9;
          swift_bridgeObjectRetain_n();
          id v25 = v24;
          sub_1B0B6F218(v65, v21, v22, v58, v59, v67, v60, v57, v63, v62, v61, v23);
          if (*(unsigned char *)(v20 + 88))
          {
            if (*(unsigned char *)(v20 + 88) != 1)
            {
              id v26 = *(void **)(v1
                             + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController);
              if (v26) {
                objc_msgSend(v26, sel_dismissViewControllerAnimated_completion_, 1, 0);
              }
            }
          }
          else
          {
            uint64_t v32 = *(void *)(v20 + 72);
            uint64_t v31 = *(void *)(v20 + 80);
            uint64_t v33 = *(void *)(v20 + 56);
            uint64_t v34 = *(void *)(v20 + 64);
            uint64_t v66 = *(void *)(v20 + 40);
            uint64_t v68 = *(void *)(v20 + 48);
            uint64_t v35 = *(void *)(v20 + 24);
            uint64_t v64 = *(void *)(v20 + 32);
            uint64_t v36 = *(void *)(v20 + 8);
            uint64_t v37 = *(void *)(v20 + 16);
            uint64_t v81 = *(void **)v20;
            uint64_t v38 = v81;
            uint64_t v82 = v36;
            uint64_t v83 = v37;
            uint64_t v84 = v35;
            uint64_t v85 = v64;
            uint64_t v86 = v66;
            uint64_t v87 = v68;
            uint64_t v88 = v33;
            uint64_t v39 = v33;
            uint64_t v89 = v34;
            uint64_t v90 = v32;
            uint64_t v91 = v31;
            swift_bridgeObjectRetain();
            id v40 = v38;
            swift_bridgeObjectRetain();
            sub_1B0B6D934((uint64_t)&v81);
            sub_1B0B6F218(v38, v36, v37, v35, v64, v66, v68, v39, v34, v32, v31, 0);
          }
          sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);

          sub_1B0B6FB84(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);
        }
      }
      else
      {
      }
    }
  }
}

id sub_1B0B6EDC4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state);
  uint64_t v3 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 8);
  uint64_t v4 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 16);
  uint64_t v5 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 24);
  uint64_t v6 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 32);
  uint64_t v7 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 40);
  uint64_t v8 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 48);
  uint64_t v9 = *(void *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 56);
  long long v10 = *(_OWORD *)(v0
                  + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                  + 64);
  uint64_t v11 = *(void *)(v0
                  + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                  + 80);
  unsigned __int8 v12 = *(unsigned char *)(v0
                 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                 + 88);
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(void *)(v1 + 80) = 0;
  *(unsigned char *)(v1 + 88) = 2;
  id result = sub_1B0B6F218(v2, v3, v4, v5, v6, v7, v8, v9, v10, *((uint64_t *)&v10 + 1), v11, v12);
  if (*(unsigned char *)(v1 + 88))
  {
    if (*(unsigned char *)(v1 + 88) != 1)
    {
      id result = *(id *)(v0
                     + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController);
      if (result)
      {
        return objc_msgSend(result, sel_dismissViewControllerAnimated_completion_, 1, 0);
      }
    }
  }
  else
  {
    uint64_t v15 = *(void *)(v1 + 72);
    uint64_t v14 = *(void *)(v1 + 80);
    uint64_t v16 = *(void *)(v1 + 64);
    uint64_t v17 = *(void *)(v1 + 40);
    uint64_t v24 = *(void *)(v1 + 48);
    uint64_t v25 = *(void *)(v1 + 56);
    uint64_t v19 = *(void *)(v1 + 24);
    uint64_t v18 = *(void *)(v1 + 32);
    uint64_t v21 = *(void *)(v1 + 8);
    uint64_t v20 = *(void *)(v1 + 16);
    uint64_t v22 = *(void **)v1;
    v26[0] = v22;
    v26[1] = v21;
    v26[2] = v20;
    v26[3] = v19;
    _OWORD v26[4] = v18;
    v26[5] = v17;
    v26[6] = v24;
    v26[7] = v25;
    v26[8] = v16;
    v26[9] = v15;
    v26[10] = v14;
    swift_bridgeObjectRetain();
    id v23 = v22;
    swift_bridgeObjectRetain();
    sub_1B0B6D934((uint64_t)v26);
    return sub_1B0B6F218(v22, v21, v20, v19, v18, v17, v24, v25, v16, v15, v14, 0);
  }
  return result;
}

uint64_t _s26ErrorInteractionControllerCMa()
{
  return self;
}

uint64_t sub_1B0B6F170(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12)
{
  if (a12 <= 1u)
  {
    unsigned __int8 v12 = (void *)result;
    swift_bridgeObjectRetain();
    id v13 = v12;
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *_s26ErrorInteractionControllerC6StatesOwxx(uint64_t a1)
{
  return sub_1B0B6F218(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(unsigned char *)(a1 + 88));
}

void *sub_1B0B6F218(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12)
{
  if (a12 <= 1u)
  {

    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s26ErrorInteractionControllerC6StatesOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  unsigned __int8 v15 = *(unsigned char *)(a2 + 88);
  sub_1B0B6F170(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  return a1;
}

uint64_t _s26ErrorInteractionControllerC6StatesOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 80);
  unsigned __int8 v26 = *(unsigned char *)(a2 + 88);
  sub_1B0B6F170(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  unsigned __int8 v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 80);
  unsigned __int8 v22 = *(unsigned char *)(a1 + 88);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 80) = v25;
  *(unsigned char *)(a1 + 88) = v26;
  sub_1B0B6F218(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t _s26ErrorInteractionControllerC6StatesOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 80);
  char v4 = *(unsigned char *)(a2 + 88);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 80);
  unsigned __int8 v15 = *(unsigned char *)(a1 + 88);
  long long v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  long long v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v3;
  *(unsigned char *)(a1 + 88) = v4;
  sub_1B0B6F218(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, v15);
  return a1;
}

uint64_t _s26ErrorInteractionControllerC6StatesOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 89)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 88);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s26ErrorInteractionControllerC6StatesOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)id result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 89) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 89) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 88) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B0B6F55C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 88) <= 1u) {
    return *(unsigned __int8 *)(a1 + 88);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1B0B6F574(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)id result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 88) = a2;
  return result;
}

ValueMetadata *_s26ErrorInteractionControllerC6StatesOMa()
{
  return &_s26ErrorInteractionControllerC6StatesON;
}

uint64_t sub_1B0B6F5B4(uint64_t a1, void *a2, uint64_t a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (v3)
  {
    sub_1B0B3C694(0, v3, 0);
    uint64_t v4 = v17;
    double v8 = *(double *)(a3
                   + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_hitTestSize);
    uint64_t v9 = (double *)(a1 + 40);
    do
    {
      id v10 = objc_msgSend(a2, sel_ic_rangeFromRect_, *(v9 - 1), *v9, v8, 0.0);
      uint64_t v12 = v11;
      unint64_t v14 = *(void *)(v17 + 16);
      unint64_t v13 = *(void *)(v17 + 24);
      if (v14 >= v13 >> 1) {
        sub_1B0B3C694(v13 > 1, v14 + 1, 1);
      }
      *(void *)(v17 + 16) = v14 + 1;
      uint64_t v15 = v17 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      v9 += 2;
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t sub_1B0B6F6C4(void *a1)
{
  uint64_t result = MEMORY[0x1B3E9F7C0](v1+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_recognitionController);
  if (result)
  {
    uint64_t v4 = (void *)result;
    id v5 = objc_msgSend((id)result, sel_textView);

    if (v5)
    {
      id v6 = objc_msgSend(a1, sel_allTouches);
      if (!v6
        || (uint64_t v7 = v6,
            sub_1B0A2E124(0, &qword_1EBBB3940),
            sub_1B0B6FA74(),
            uint64_t v8 = sub_1B0B8273C(),
            v7,
            uint64_t v9 = (void *)sub_1B0AD4A54(v8),
            swift_bridgeObjectRelease(),
            !v9))
      {
LABEL_24:

        return 0;
      }
      id v10 = objc_msgSend(a1, sel_allTouches);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_1B0B8273C();

        uint64_t v13 = (v12 & 0xC000000000000001) != 0 ? sub_1B0B82EAC() : *(void *)(v12 + 16);
        swift_bridgeObjectRelease();
        if (v13 == 1)
        {
          objc_msgSend(v9, sel_locationInView_, v5);
          sub_1B0B6DC64(v57, v14, v15);
          sub_1B0A24FC4((uint64_t)v57, (uint64_t)v58, &qword_1EBBB3920);
          uint64_t v16 = v1 + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state;
          if (v58[0])
          {
            if (*(unsigned char *)(v16 + 88) != 1)
            {

              sub_1B0B6FB84(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);
              return 1;
            }
            uint64_t v18 = *(void *)(v16 + 72);
            uint64_t v17 = *(void *)(v16 + 80);
            uint64_t v19 = *(void *)(v16 + 64);
            uint64_t v20 = *(void *)(v16 + 40);
            uint64_t v21 = *(void *)(v16 + 48);
            uint64_t v51 = v21;
            uint64_t v53 = *(void *)(v16 + 56);
            uint64_t v23 = *(void *)(v16 + 24);
            uint64_t v22 = *(void *)(v16 + 32);
            uint64_t v25 = *(void *)(v16 + 8);
            uint64_t v24 = *(void *)(v16 + 16);
            unsigned __int8 v26 = *(void **)v16;
            uint64_t v48 = v58[2];
            uint64_t v49 = v20;
            uint64_t v55 = v58[1];
            sub_1B0B6F170((uint64_t)v26, v25, v24, v23, v22, v20, v21, v53, v19, v18, v17, 1u);

            sub_1B0B6FB84(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_1B0B6FADC);
            sub_1B0B6F218(v26, v25, v24, v23, v22, v49, v51, v53, v19, v18, v17, 1u);
            return v25 != v55 || v24 != v48;
          }
          uint64_t v27 = *(void **)v16;
          uint64_t v28 = *(void *)(v16 + 8);
          uint64_t v29 = *(void *)(v16 + 16);
          uint64_t v30 = *(void *)(v16 + 24);
          uint64_t v31 = *(void *)(v16 + 32);
          uint64_t v32 = *(void *)(v16 + 40);
          uint64_t v33 = *(void *)(v16 + 48);
          uint64_t v34 = *(void *)(v16 + 56);
          long long v35 = *(_OWORD *)(v16 + 64);
          uint64_t v36 = *(void *)(v16 + 80);
          unsigned __int8 v37 = *(unsigned char *)(v16 + 88);
          *(_OWORD *)uint64_t v16 = 0u;
          *(_OWORD *)(v16 + 16) = 0u;
          *(_OWORD *)(v16 + 32) = 0u;
          *(_OWORD *)(v16 + 48) = 0u;
          *(_OWORD *)(v16 + 64) = 0u;
          *(void *)(v16 + 80) = 0;
          *(unsigned char *)(v16 + 88) = 2;
          sub_1B0B6F218(v27, v28, v29, v30, v31, v32, v33, v34, v35, *((uint64_t *)&v35 + 1), v36, v37);
          if (*(unsigned char *)(v16 + 88))
          {
            if (*(unsigned char *)(v16 + 88) != 1)
            {
              uint64_t v38 = *(void **)(v1
                             + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController);
              if (v38) {
                objc_msgSend(v38, sel_dismissViewControllerAnimated_completion_, 1, 0);
              }
            }
          }
          else
          {
            uint64_t v39 = *(void *)(v16 + 72);
            uint64_t v40 = *(void *)(v16 + 80);
            uint64_t v41 = *(void *)(v16 + 64);
            uint64_t v54 = *(void *)(v16 + 48);
            uint64_t v56 = *(void *)(v16 + 56);
            uint64_t v42 = *(void *)(v16 + 24);
            uint64_t v50 = *(void *)(v16 + 32);
            uint64_t v52 = *(void *)(v16 + 40);
            uint64_t v44 = *(void *)(v16 + 8);
            uint64_t v43 = *(void *)(v16 + 16);
            v59[0] = *(void *)v16;
            uint64_t v45 = (void *)v59[0];
            v59[1] = v44;
            v59[2] = v43;
            v59[3] = v42;
            v59[4] = v50;
            v59[5] = v52;
            v59[6] = v54;
            v59[7] = v56;
            v59[8] = v41;
            v59[9] = v39;
            uint64_t v46 = v39;
            v59[10] = v40;
            swift_bridgeObjectRetain();
            id v47 = v45;
            swift_bridgeObjectRetain();
            sub_1B0B6D934((uint64_t)v59);
            sub_1B0B6F218(v45, v44, v43, v42, v50, v52, v54, v56, v41, v46, v40, 0);
          }

          goto LABEL_24;
        }
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_1B0B6FA74()
{
  unint64_t result = qword_1EBBB4408;
  if (!qword_1EBBB4408)
  {
    sub_1B0A2E124(255, &qword_1EBBB3940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB4408);
  }
  return result;
}

void *sub_1B0B6FADC(void *result)
{
  if (result)
  {

    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B0B6FB28()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1B0B6FB68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B0B6E434(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void ***)(v4 + 32));
}

uint64_t sub_1B0B6FB74()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void *sub_1B0B6FB84(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1B0B6FBE0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_bridgeObjectRetain();
    id v2 = v1;
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwxx(id *a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwcp(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwta(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s26ErrorInteractionControllerC10ErrorModelVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s26ErrorInteractionControllerC10ErrorModelVMa()
{
  return &_s26ErrorInteractionControllerC10ErrorModelVN;
}

id UIImage.image(for:)()
{
  uint64_t v0 = sub_1B0B80CCC();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F3C5B8], v0);
  char v4 = sub_1B0B80CBC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, v5);
  id v7 = objc_msgSend(v13, sel_imageAsset);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, sel_imageWithTraitCollection_, v6);

    if (v9) {
      return v9;
    }
  }
  else
  {
  }
  id v11 = v13;
  return v11;
}

void sub_1B0B7007C()
{
  uint64_t v1 = (void *)MEMORY[0x1B3E9F7C0](v0 + 16);
  if (v1)
  {
    id v13 = v1;
    id v2 = objc_msgSend(v1, sel_note);
    if (v2)
    {
      int64_t v3 = v2;
      id v4 = objc_msgSend(v2, sel_textContentStorage);

      if (v4)
      {
        id v5 = objc_msgSend(v4, sel_textStorage);
        objc_msgSend(v5, sel_beginEditing);

        id v6 = objc_msgSend(v13, sel_expressionsIndexSet);
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = swift_allocObject();
          *(void *)(v8 + 16) = v4;
          uint64_t v9 = swift_allocObject();
          *(void *)(v9 + 16) = sub_1B0B72780;
          *(void *)(v9 + 24) = v8;
          aBlock[4] = sub_1B0B72798;
          aBlock[5] = v9;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1B0B7212C;
          aBlock[3] = &block_descriptor_7;
          id v10 = _Block_copy(aBlock);
          id v11 = v4;
          swift_retain();
          swift_release();
          objc_msgSend(v7, sel_enumerateRangesUsingBlock_, v10);

          _Block_release(v10);
          LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if ((v7 & 1) == 0)
          {
            id v12 = objc_msgSend(v11, sel_textStorage);
            objc_msgSend(v12, sel_endEditing);
            swift_release();

            return;
          }
          __break(1u);
        }
        __break(1u);
        return;
      }
    }
  }
}

uint64_t sub_1B0B702DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B0B8083C();
  uint64_t v120 = *(void *)(v2 - 8);
  uint64_t v121 = v2;
  uint64_t v3 = MEMORY[0x1F4188790](v2);
  id v5 = (char *)v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v118 = (char *)v101 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB3900);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = sub_1B0B807FC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v119 = (char *)v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)v101 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)v101 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (uint64_t)v101 - v20;
  uint64_t v22 = v1 + 16;
  uint64_t result = MEMORY[0x1B3E9F7C0](v1 + 16);
  if (result)
  {
    uint64_t v24 = (void *)result;
    v116 = v16;
    uint64_t v117 = v19;
    sub_1B0A6C4F8();
    uint64_t v25 = sub_1B0B8216C();
    swift_release();
    if ((v25 & 0xC000000000000001) != 0) {
      uint64_t v26 = sub_1B0B82EAC();
    }
    else {
      uint64_t v26 = *(void *)(v25 + 16);
    }
    swift_bridgeObjectRelease();
    if (!v26 || (id v27 = objc_msgSend(v24, sel_note)) == 0)
    {

      return 0;
    }
    uint64_t v28 = v27;
    id v29 = objc_msgSend(v27, sel_textStorage);
    if (!v29)
    {

      return 0;
    }
    uint64_t v115 = v1;
    uint64_t v30 = v29;
    id v31 = objc_msgSend(v29, sel_highlightsAttributedString);
    self;
    id v113 = (id)swift_dynamicCastObjCClass();
    if (!v113)
    {

      return 0;
    }
    id v107 = v31;
    uint64_t v114 = v30;
    id v106 = v28;
    if (qword_1EBBB4F58 != -1) {
      goto LABEL_69;
    }
LABEL_10:
    uint64_t v32 = sub_1B0B8082C();
    uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)qword_1EBBB4F40);
    sub_1B0B807EC();
    uint64_t v105 = v33;
    uint64_t v34 = sub_1B0B8081C();
    int v35 = sub_1B0B82A6C();
    char v36 = sub_1B0B82D5C();
    CGRect v102 = v5;
    if (v36)
    {
      uint64_t v111 = *(void (**)(char *, uint64_t, unint64_t))(v11 + 16);
      LODWORD(v112) = v35;
      unsigned __int8 v37 = v117;
      v111(v117, v21, v10);
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      os_signpost_id_t v39 = sub_1B0B807DC();
      _os_signpost_emit_with_name_impl(&dword_1B08EB000, v34, (os_signpost_type_t)v112, v39, "updateHighlights()", "", v38, 2u);
      uint64_t v40 = v38;
      id v5 = v102;
      MEMORY[0x1B3E9F6B0](v40, -1, -1);

      (*(void (**)(char *, unint64_t))(v11 + 8))(v37, v10);
      unint64_t v41 = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v42 = v111;
    }
    else
    {

      uint64_t v42 = *(void (**)(char *, uint64_t, unint64_t))(v11 + 16);
      unint64_t v41 = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      unsigned __int8 v37 = v117;
    }
    uint64_t v111 = v42;
    v101[3] = v41;
    v42(v37, v21, v10);
    sub_1B0B8086C();
    swift_allocObject();
    uint64_t v110 = sub_1B0B8085C();
    uint64_t v44 = *(void (**)(char *, unint64_t))(v11 + 8);
    uint64_t v43 = v11 + 8;
    unint64_t v104 = v10;
    CGRect v103 = v44;
    v44((char *)v21, v10);
    uint64_t v45 = *(void *)(v115 + 24);
    id v46 = v113;
    id v47 = objc_msgSend(v113, sel_ic_range);
    objc_msgSend(v46, sel_removeAttribute_range_, v45, v47, v48);
    uint64_t v49 = (void *)MEMORY[0x1B3E9F7C0](v22);
    if (v49)
    {
      uint64_t v50 = v49;
      unsigned int v51 = objc_msgSend(v49, sel_isCalculateMathEnabled);

      if (v51)
      {
        v101[2] = v43;
        sub_1B0A6C4F8();
        uint64_t v22 = sub_1B0B8216C();
        swift_release();
        if ((v22 & 0xC000000000000001) != 0)
        {
          sub_1B0B82E5C();
          _s5IndexCMa();
          sub_1B0B727C0();
          sub_1B0B8277C();
          uint64_t v22 = v124;
          uint64_t v52 = v125;
          uint64_t v53 = v126;
          uint64_t v11 = v127;
          unint64_t v10 = v128;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v54 = -1 << *(unsigned char *)(v22 + 32);
          uint64_t v52 = v22 + 56;
          uint64_t v55 = ~v54;
          uint64_t v56 = -v54;
          if (v56 < 64) {
            uint64_t v57 = ~(-1 << v56);
          }
          else {
            uint64_t v57 = -1;
          }
          unint64_t v10 = v57 & *(void *)(v22 + 56);
          uint64_t v53 = v55;
        }
        uint64_t v109 = v22 & 0x7FFFFFFFFFFFFFFFLL;
        v101[1] = v53;
        int64_t v112 = (unint64_t)(v53 + 64) >> 6;
        uint64_t v108 = MEMORY[0x1E4FBC838] + 8;
        while (1)
        {
          if (v22 < 0)
          {
            uint64_t v60 = sub_1B0B82EDC();
            if (!v60) {
              goto LABEL_51;
            }
            uint64_t v122 = v60;
            _s5IndexCMa();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v5 = v123;
            swift_unknownObjectRelease();
            uint64_t v21 = v11;
            uint64_t v58 = v10;
          }
          else
          {
            if (v10)
            {
              uint64_t v58 = (v10 - 1) & v10;
              unint64_t v59 = __clz(__rbit64(v10)) | (v11 << 6);
              uint64_t v21 = v11;
            }
            else
            {
              int64_t v61 = v11 + 1;
              if (__OFADD__(v11, 1))
              {
                __break(1u);
LABEL_69:
                swift_once();
                goto LABEL_10;
              }
              if (v61 >= v112) {
                goto LABEL_51;
              }
              unint64_t v62 = *(void *)(v52 + 8 * v61);
              uint64_t v21 = v11 + 1;
              if (!v62)
              {
                uint64_t v21 = v11 + 2;
                if (v11 + 2 >= v112) {
                  goto LABEL_51;
                }
                unint64_t v62 = *(void *)(v52 + 8 * v21);
                if (!v62)
                {
                  uint64_t v21 = v11 + 3;
                  if (v11 + 3 >= v112) {
                    goto LABEL_51;
                  }
                  unint64_t v62 = *(void *)(v52 + 8 * v21);
                  if (!v62)
                  {
                    uint64_t v21 = v11 + 4;
                    if (v11 + 4 >= v112) {
                      goto LABEL_51;
                    }
                    unint64_t v62 = *(void *)(v52 + 8 * v21);
                    if (!v62)
                    {
                      uint64_t v63 = v11 + 5;
                      while (v112 != v63)
                      {
                        unint64_t v62 = *(void *)(v52 + 8 * v63++);
                        if (v62)
                        {
                          uint64_t v21 = v63 - 1;
                          goto LABEL_46;
                        }
                      }
LABEL_51:
                      sub_1B0A2E1C8();
                      id v5 = v102;
                      id v46 = v113;
                      break;
                    }
                  }
                }
              }
LABEL_46:
              uint64_t v58 = (v62 - 1) & v62;
              unint64_t v59 = __clz(__rbit64(v62)) + (v21 << 6);
            }
            id v5 = *(char **)(*(void *)(v22 + 48) + 8 * v59);
            swift_retain();
          }
          if (!v5) {
            goto LABEL_51;
          }
          sub_1B0A2E0BC((uint64_t)&v5[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateDocumentController5Index_paperKitIndex], (uint64_t)v9);
          uint64_t v64 = sub_1B0B81ECC();
          int v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v64 - 8) + 48))(v9, 1, v64);
          sub_1B0A4DF10((uint64_t)v9);
          if (v65 == 1) {
            sub_1B0B71510(v114, (uint64_t)v5);
          }
          swift_release();
          uint64_t v11 = v21;
          unint64_t v10 = v58;
        }
      }
    }
    uint64_t v66 = *(void **)(v115 + 32);
    if (v66
      && (sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB43B0),
          id v67 = v107,
          id v68 = v66,
          char v69 = sub_1B0B82C8C(),
          v67,
          v68,
          (v69 & 1) != 0))
    {
      id v70 = sub_1B0B8081C();
      uint64_t v71 = v119;
      sub_1B0B8084C();
      os_signpost_type_t v72 = sub_1B0B82A5C();
      if (sub_1B0B82D5C())
      {
        swift_retain();
        sub_1B0B8087C();
        swift_release();
        uint64_t v74 = v120;
        uint64_t v73 = v121;
        int v75 = (*(uint64_t (**)(char *, uint64_t))(v120 + 88))(v5, v121);
        unint64_t v76 = v104;
        if (v75 == *MEMORY[0x1E4FBD340])
        {
          uint64_t v77 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v74 + 8))(v5, v73);
          uint64_t v77 = "";
        }
        uint64_t v96 = v119;
        v111(v117, (uint64_t)v119, v76);
        uint64_t v97 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v97 = 0;
        os_signpost_id_t v98 = sub_1B0B807DC();
        uint64_t v99 = v117;
        _os_signpost_emit_with_name_impl(&dword_1B08EB000, v70, v72, v98, "updateHighlights()", v77, v97, 2u);
        MEMORY[0x1B3E9F6B0](v97, -1, -1);

        uint64_t v100 = v103;
        v103(v96, v76);
        v100(v99, v76);
      }
      else
      {

        v103(v71, v104);
      }

      swift_release();
      return 0;
    }
    else
    {
      id v78 = objc_msgSend(self, sel_defaultCenter);
      objc_msgSend(v78, sel_postNotificationName_object_, @"ICCalculateDocumentControllerDidUpdateHighlights", v24);

      id v79 = objc_msgSend(v46, sel_copy);
      uint64_t v80 = *(void **)(v115 + 32);
      *(void *)(v115 + 32) = v79;

      uint64_t v81 = sub_1B0B8081C();
      uint64_t v82 = v116;
      sub_1B0B8084C();
      os_signpost_type_t v83 = sub_1B0B82A5C();
      if (sub_1B0B82D5C())
      {
        swift_retain();
        uint64_t v84 = v118;
        sub_1B0B8087C();
        swift_release();
        uint64_t v86 = v120;
        uint64_t v85 = v121;
        int v87 = (*(uint64_t (**)(char *, uint64_t))(v120 + 88))(v84, v121);
        unint64_t v88 = v104;
        if (v87 == *MEMORY[0x1E4FBD340])
        {
          uint64_t v89 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v86 + 8))(v84, v85);
          uint64_t v89 = "";
        }
        uint64_t v91 = v116;
        id v90 = v107;
        v111(v117, (uint64_t)v116, v88);
        uint64_t v92 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v92 = 0;
        os_signpost_id_t v93 = sub_1B0B807DC();
        uint64_t v94 = v117;
        _os_signpost_emit_with_name_impl(&dword_1B08EB000, v81, v83, v93, "updateHighlights()", v89, v92, 2u);
        MEMORY[0x1B3E9F6B0](v92, -1, -1);

        uint64_t v95 = v103;
        v103(v91, v88);
        v95(v94, v88);
      }
      else
      {

        id v90 = v107;
        v103(v82, v104);
      }

      swift_release();
      return 1;
    }
  }
  return result;
}

uint64_t sub_1B0B70F24()
{
  uint64_t v0 = sub_1B0B8093C();
  __swift_allocate_value_buffer(v0, qword_1EBBB4FE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBBB4FE8);
  return sub_1B0B808EC();
}

uint64_t sub_1B0B70F70()
{
  uint64_t v0 = sub_1B0B8093C();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B0B8082C();
  __swift_allocate_value_buffer(v4, qword_1EBBB4F40);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBBB4F40);
  if (qword_1EBBB5000 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_1EBBB4FE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1B0B8080C();
}

void sub_1B0B710AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = (void *)MEMORY[0x1B3E9F7C0](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_note);

    if (v5)
    {
      id v20 = objc_msgSend(v5, sel_managedObjectContext);

      if (v20)
      {
        uint64_t v6 = (void *)MEMORY[0x1B3E9F7C0](v2);
        if (v6
          && (uint64_t v7 = v6, v8 = objc_msgSend(v6, sel_note), v7, v8)
          && (id v9 = objc_msgSend(v8, sel_deviceManagementRestrictionsManager),
              v8,
              v9))
        {
          swift_getKeyPath();
          uint64_t v10 = swift_allocObject();
          swift_weakInit();
          uint64_t v11 = swift_allocObject();
          *(void *)(v11 + 16) = v20;
          *(void *)(v11 + 24) = v10;
          id v12 = v20;
          uint64_t v13 = sub_1B0B7FB0C();
          swift_release();
          swift_release();
          uint64_t v14 = *(void **)(v1 + 48);
          *(void *)(v1 + 48) = v13;

          swift_getKeyPath();
          uint64_t v15 = swift_allocObject();
          swift_weakInit();
          uint64_t v16 = swift_allocObject();
          *(void *)(v16 + 16) = v12;
          *(void *)(v16 + 24) = v15;
          id v17 = v12;
          uint64_t v18 = sub_1B0B7FB0C();

          swift_release();
          swift_release();

          uint64_t v19 = *(void **)(v1 + 56);
          *(void *)(v1 + 56) = v18;
        }
        else
        {
        }
      }
    }
  }
}

id sub_1B0B7132C()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = *(id *)(v0 + 40);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F837C8]), sel_initWithTarget_selector_delay_maximumDelay_callOnMainThread_, v0, sel_performHighlightsUpdate, 0, 0.05, 0.2);
    uint64_t v4 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

void sub_1B0B713BC()
{
  uint64_t v1 = (void *)MEMORY[0x1B3E9F7C0](v0 + 16);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_note);

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_managedObjectContext);

      if (v4)
      {
        v6[4] = sub_1B0B72744;
        v6[5] = v0;
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 1107296256;
        v6[2] = sub_1B0A965E8;
        v6[3] = &block_descriptor_25;
        id v5 = _Block_copy(v6);
        swift_retain();
        swift_release();
        objc_msgSend(v4, sel_performBlock_, v5);
        _Block_release(v5);
      }
    }
  }
}

void sub_1B0B71510(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B0B820CC();
  uint64_t v7 = *(char **)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v12 = (char *)v75 - v11;
  uint64_t v13 = v2 + 16;
  uint64_t v14 = (void *)MEMORY[0x1B3E9F7C0](v13);
  if (!v14) {
    return;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_note);

  if (!v16) {
    return;
  }
  id v93 = objc_msgSend(v16, sel_managedObjectContext);

  if (!v93) {
    return;
  }
  uint64_t v17 = MEMORY[0x1B3E9F7C0](v13);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    sub_1B0A6C4F8();

    aBlock[0] = a2;
    uint64_t v19 = sub_1B0B820FC();
    swift_release();
    if (!v19)
    {
LABEL_48:

      return;
    }
    if ((sub_1B0B2C5D8() & 1) == 0) {
      goto LABEL_40;
    }
    uint64_t v20 = sub_1B0A4D0C0();
    if (v21) {
      goto LABEL_40;
    }
    NSUInteger v22 = v20;
    if (v20 >= (uint64_t)objc_msgSend(a1, sel_length)) {
      goto LABEL_40;
    }
    id v23 = objc_msgSend(a1, sel_string);
    id v92 = (id)sub_1B0B8240C();

    NSUInteger v91 = v22;
    uint64_t v24 = sub_1B0B8242C();
    uint64_t v77 = v25;
    LOBYTE(v23) = v26;
    swift_bridgeObjectRelease();
    if (v23)
    {
LABEL_40:

      swift_release();
      return;
    }
    uint64_t v76 = v24;
    sub_1B0B8206C();
    unint64_t v27 = sub_1B0B81F2C();
    swift_release();
    unint64_t v85 = v27;
    if (v27 >> 62) {
      goto LABEL_67;
    }
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_12:
    int64_t v29 = v91;
    v75[1] = v19;
    if (v28)
    {
      unint64_t v84 = v27 & 0xC000000000000001;
      os_signpost_type_t v83 = v95;
      unsigned int v82 = *MEMORY[0x1E4F56868];
      uint64_t v81 = (void (**)(char *, void, uint64_t))(v7 + 104);
      uint64_t v80 = (id *)(v7 + 8);
      int64_t v79 = v76 + v77;
      uint64_t v30 = 4;
      id v92 = a1;
      uint64_t v78 = v28;
      while (1)
      {
        uint64_t v31 = v30 - 4;
        uint64_t v88 = v30;
        if (v84)
        {
          uint64_t v32 = MEMORY[0x1B3E9D5F0](v30 - 4, v27);
          uint64_t v7 = (char *)(v31 + 1);
          if (__OFADD__(v31, 1)) {
            goto LABEL_65;
          }
        }
        else
        {
          uint64_t v32 = *(void *)(v27 + 8 * v30);
          swift_retain();
          uint64_t v7 = (char *)(v31 + 1);
          if (__OFADD__(v31, 1))
          {
LABEL_65:
            __break(1u);
LABEL_66:
            __break(1u);
LABEL_67:
            swift_bridgeObjectRetain();
            unint64_t v27 = v85;
            uint64_t v28 = sub_1B0B831DC();
            swift_bridgeObjectRelease();
            goto LABEL_12;
          }
        }
        sub_1B0B8201C();
        int v87 = v7;
        if ((v33 & 0x1000000000000000) != 0) {
          uint64_t v34 = sub_1B0B824EC();
        }
        else {
          uint64_t v34 = sub_1B0B824FC();
        }
        NSUInteger v35 = v34;
        swift_bridgeObjectRelease();
        uint64_t v36 = swift_allocObject();
        *(void *)(v36 + 16) = v35;
        id v90 = (void *)(v36 + 16);
        uint64_t v37 = swift_allocObject();
        *(void *)(v37 + 16) = v32;
        *(void *)(v37 + 24) = v36;
        v95[2] = sub_1B0B72868;
        uint64_t v96 = v37;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        v95[0] = sub_1B0A72424;
        v95[1] = &block_descriptor_16;
        uint64_t v38 = _Block_copy(aBlock);
        uint64_t v19 = v96;
        swift_retain();
        uint64_t v89 = v36;
        swift_retain();
        swift_release();
        NSUInteger v86 = v35;
        objc_msgSend(v92, sel_ic_enumerateInlineAttachmentsInContext_range_options_usingBlock_, v93, v29, v35, 0, v38);
        _Block_release(v38);
        sub_1B0B8202C();
        (*v81)(v10, v82, v6);
        LOBYTE(v38) = sub_1B0B820BC();
        uint64_t v7 = (char *)*v80;
        ((void (*)(char *, uint64_t))*v80)(v10, v6);
        ((void (*)(char *, uint64_t))v7)(v12, v6);
        NSUInteger v91 = v29;
        if (v38)
        {
          id v39 = objc_msgSend(objc_allocWithZone((Class)ICCalculateHighlightAttribute), sel_init);
          objc_msgSend(v39, sel_setType_, 1);
        }
        else
        {
          uint64_t v40 = *(void *)(sub_1B0B8203C() + 16);
          swift_bridgeObjectRelease();
          if (!v40)
          {
            char IsMathDebugHighlightingEnabled = ICInternalSettingsIsMathDebugHighlightingEnabled();
            a1 = v90;
            if ((IsMathDebugHighlightingEnabled & 1) == 0) {
              goto LABEL_29;
            }
            id v39 = objc_msgSend(objc_allocWithZone((Class)ICCalculateHighlightAttribute), sel_init);
            if (!v39) {
              goto LABEL_29;
            }
            goto LABEL_26;
          }
          id v39 = objc_msgSend(objc_allocWithZone((Class)ICCalculateHighlightAttribute), sel_init);
        }
        sub_1B0B8203C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4AD50);
        unint64_t v41 = (void *)sub_1B0B825AC();
        swift_bridgeObjectRelease();
        objc_msgSend(v39, sel_setErrors_, v41);
        a1 = v90;

LABEL_26:
        uint64_t v7 = (char *)objc_msgSend(v92, sel_highlightsAttributedString);
        self;
        uint64_t v42 = (void *)swift_dynamicCastObjCClass();
        if (v42)
        {
          uint64_t v43 = v42;
          v100.location = (NSUInteger)objc_msgSend(v42, sel_ic_range);
          v100.length = v44;
          v98.location = v91;
          v98.length = v86;
          NSRange v45 = NSIntersectionRange(v98, v100);
          objc_msgSend(v43, sel_addAttribute_value_range_, *(void *)(v3 + 24), v39, v45.location, v45.length);
        }

LABEL_29:
        swift_beginAccess();
        int64_t v29 = v91 + *a1;
        if (__OFADD__(v91, *a1)) {
          goto LABEL_66;
        }
        swift_release();
        swift_release();
        a1 = v92;
        if (v29 < v79)
        {
          uint64_t v30 = v88 + 1;
          unint64_t v27 = v85;
          if (v87 != (char *)v78) {
            continue;
          }
        }
        break;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v48 = self;
    id v49 = objc_msgSend(v48, sel_ic_attachmentCharacterString);
    sub_1B0B8240C();

    uint64_t v50 = sub_1B0B8250C();
    swift_bridgeObjectRelease();
    BOOL v51 = __OFSUB__(v29, v50);
    int64_t v52 = v29 - v50;
    if (v51)
    {
      __break(1u);
    }
    else
    {
      if (v52 < 0 || v52 >= v76 + v77)
      {
LABEL_47:
        swift_release();
        goto LABEL_48;
      }
      id v53 = objc_msgSend(a1, sel_string);
      if (v53)
      {
        uint64_t v54 = v53;
        unsigned int v55 = objc_msgSend(v53, sel_characterAtIndex_, v52);

        id v56 = objc_msgSend(v48, sel_ic_attachmentCharacterString);
        sub_1B0B8240C();

        NSUInteger v57 = sub_1B0B8250C();
        swift_bridgeObjectRelease();
        if ((v55 & 0xF800) == 0xD800)
        {
          uint64_t v58 = 0;
          uint64_t v59 = 0;
        }
        else
        {
          int v60 = (v55 & 0x3F) << 8;
          unsigned int v61 = (v60 | (v55 >> 6)) + 33217;
          int v62 = ((v55 >> 12) | ((v60 | (v55 >> 6) & 0x3F) << 8)) + 8487393;
          if (v55 >= 0x800) {
            unsigned int v61 = v62;
          }
          if (v55 <= 0x7F) {
            unsigned int v61 = v55 + 1;
          }
          aBlock[0] = (v61 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v61) >> 3)) & 7)));
          uint64_t v58 = MEMORY[0x1B3E9CA50](aBlock);
          uint64_t v59 = v63;
        }
        id v64 = objc_msgSend(v48, sel_ic_attachmentCharacterString);
        uint64_t v65 = sub_1B0B8240C();
        uint64_t v67 = v66;

        if (!v59)
        {
          swift_release();

          swift_bridgeObjectRelease();
          return;
        }
        if (v58 == v65 && v59 == v67)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_61:
          id v69 = sub_1B0B72ADC();
          id v70 = objc_msgSend(a1, sel_highlightsAttributedString);
          self;
          uint64_t v71 = (void *)swift_dynamicCastObjCClass();
          if (v71)
          {
            os_signpost_type_t v72 = v71;
            v101.location = (NSUInteger)objc_msgSend(v71, sel_ic_range);
            v101.length = v73;
            v99.location = v52;
            v99.length = v57;
            NSRange v74 = NSIntersectionRange(v99, v101);
            objc_msgSend(v72, sel_addAttribute_value_range_, *(void *)(v3 + 24), v69, v74.location, v74.length);
          }

          swift_release();
          return;
        }
        char v68 = sub_1B0B8339C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v68) {
          goto LABEL_61;
        }
        goto LABEL_47;
      }
    }
    __break(1u);
    return;
  }
  id v47 = v93;
}

id sub_1B0B71F3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id result = objc_msgSend(a1, sel_isCalculateGraphExpressionAttachment);
  if (result)
  {
    uint64_t v9 = sub_1B0B8201C();
    uint64_t v11 = v10;
    id v12 = objc_msgSend(self, sel_ic_equalsSignCharacterString);
    uint64_t v13 = sub_1B0B8240C();
    uint64_t v15 = v14;

    if (v9 == v13 && v11 == v15)
    {
      return (id)swift_bridgeObjectRelease_n();
    }
    else
    {
      char v17 = sub_1B0B8339C();
      swift_bridgeObjectRelease();
      id result = (id)swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
      {
        id v18 = objc_msgSend(a1, sel_displayText);
        sub_1B0B8240C();

        uint64_t v19 = sub_1B0B8247C();
        id result = (id)swift_bridgeObjectRelease();
        BOOL v20 = __OFSUB__(v19, 2);
        uint64_t v21 = v19 - 2;
        if (v20)
        {
          __break(1u);
        }
        else
        {
          NSUInteger v22 = (void *)(a6 + 16);
          id result = (id)swift_beginAccess();
          if (!__OFSUB__(*v22, v21))
          {
            *v22 -= v21;
            return result;
          }
        }
        __break(1u);
      }
    }
  }
  return result;
}

void sub_1B0B7209C(uint64_t a1, uint64_t a2, int a3, id a4)
{
  id v7 = objc_msgSend(a4, sel_textStorage);
  objc_msgSend(a4, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, v7, 2, a1, a2, 0, a1, a2);
}

uint64_t sub_1B0B7212C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4);
}

void sub_1B0B72160(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[4] = a5;
  v8[5] = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1B0A965E8;
  v8[3] = a6;
  id v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_performBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_1B0B72210()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1B0B702DC();
    return swift_release();
  }
  return result;
}

void sub_1B0B72268()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = (void *)MEMORY[0x1B3E9F7C0](v0 + 16);
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_note);

  if (!v4) {
    return;
  }
  id v13 = objc_msgSend(v4, sel_textStorage);

  if (!v13) {
    return;
  }
  id v5 = objc_msgSend(v13, sel_highlightsAttributedString);
  uint64_t v6 = *(void **)(v0 + 32);
  if (v5)
  {
    id v7 = v5;
    if (v6)
    {
      sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB43B0);
      id v8 = v6;
      id v9 = v7;
      char v10 = sub_1B0B82C8C();

      if (v10) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  else if (!v6)
  {
    goto LABEL_13;
  }
  id v11 = objc_msgSend(self, sel_defaultCenter);
  id v12 = (void *)MEMORY[0x1B3E9F7C0](v1);
  objc_msgSend(v11, sel_postNotificationName_object_, @"ICCalculateDocumentControllerDidUpdateHighlights", v12);

LABEL_13:
}

uint64_t sub_1B0B726C0()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocClassInstance();
}

uint64_t _s11HighlighterCMa()
{
  return self;
}

uint64_t sub_1B0B72748()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B0B72780(uint64_t a1, uint64_t a2, int a3)
{
  sub_1B0B7209C(a1, a2, a3, *(id *)(v3 + 16));
}

uint64_t sub_1B0B72788()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0B72798()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1B0B727C0()
{
  unint64_t result = qword_1EBBB43D8;
  if (!qword_1EBBB43D8)
  {
    _s5IndexCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBB43D8);
  }
  return result;
}

uint64_t sub_1B0B72818()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0B72828()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1B0B72868(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B0B71F3C(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

void sub_1B0B72870(void *a1)
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = (void *)*MEMORY[0x1E4F83558];
  *(void *)(v1 + 24) = *MEMORY[0x1E4F83558];
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  swift_unknownObjectWeakAssign();
  id v4 = v3;
  id v5 = objc_msgSend(a1, sel_note);
  if (v5 && (uint64_t v6 = v5, v7 = objc_msgSend(v5, sel_textStorage), v6, v7))
  {

    id v8 = self;
    id v9 = objc_msgSend(v8, sel_defaultCenter);
    uint64_t v10 = *MEMORY[0x1E4FB07F0];
    swift_retain();
    id v11 = objc_msgSend(a1, sel_note);
    id v12 = v11;
    if (v11)
    {
      id v13 = objc_msgSend(v11, sel_textStorage);

      if (v13)
      {
        sub_1B0A2E124(0, &qword_1EBBB5848);
        id v12 = (void *)sub_1B0B8337C();
      }
      else
      {
        id v12 = 0;
      }
    }
    objc_msgSend(v9, sel_addObserver_selector_name_object_, v1, sel_textStorageDidProcessEndEditing_, v10, v12);

    swift_release();
    swift_unknownObjectRelease();
    id v14 = objc_msgSend(v8, sel_defaultCenter);
    objc_msgSend(v14, sel_addObserver_selector_name_object_, v1, sel_calculateDocumentControllerDidUpdateDocument_, @"ICCalculateDocumentControllerDidUpdateDocument", a1);

    id v15 = objc_msgSend(v8, sel_defaultCenter);
    swift_retain();
    id v16 = objc_msgSend(a1, sel_note);
    objc_msgSend(v15, sel_addObserver_selector_name_object_, v1, sel_noteDidChangeCalculatePreviewBehavior_, @"ICNoteDidChangeCalculatePreviewBehavior", v16);

    swift_release();
    sub_1B0B710AC();
  }
  else
  {
    __break(1u);
  }
}

id sub_1B0B72ADC()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)ICCalculateHighlightAttribute), sel_init);
  objc_msgSend(v0, sel_setType_, 2);
  uint64_t v1 = sub_1B0B8205C();
  if (v1)
  {
    uint64_t v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4D130);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1B0B9A310;
    *(void *)(v3 + 32) = v2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4AD50);
  id v4 = (void *)sub_1B0B825AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setErrors_, v4);

  return v0;
}

uint64_t sub_1B0B72BBC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B0B72BF8(uint64_t a1, uint64_t a2)
{
  sub_1B0B72160(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), (uint64_t)sub_1B0B72CB4, (uint64_t)&block_descriptor_36_0);
}

uint64_t objectdestroy_21Tm()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B0B72C7C(uint64_t a1, uint64_t a2)
{
  sub_1B0B72160(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), (uint64_t)sub_1B0B72CB4, (uint64_t)&block_descriptor_33_0);
}

uint64_t sub_1B0B72CB4()
{
  return sub_1B0B72210();
}

uint64_t sub_1B0B72CE8(__int16 a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, a1);
}

void static LockedNotesSwitchViewController.present(for:skipsAlerts:window:completion:)(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v10 = a1;
  __LockedNotesViewConfigurationAccount.init(account:)(v10, (uint64_t)&v35);
  int v11 = v35;
  uint64_t v12 = v36;
  uint64_t v13 = v38;
  uint64_t v32 = v37;
  id v33 = (id)*((void *)&v35 + 1);
  char v30 = v40;
  __int16 v31 = v39;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  *(unsigned char *)(v14 + 24) = a2;
  *(void *)(v14 + 32) = a3;
  *(void *)(v14 + 40) = v5;
  *(void *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = a5;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = a3;
  LODWORD(v35) = v11;
  *((void *)&v35 + 1) = v33;
  uint64_t v36 = v12;
  uint64_t v37 = v32;
  uint64_t v38 = v13;
  __int16 v39 = v31;
  char v40 = v30;
  unint64_t v41 = sub_1B0B73340;
  uint64_t v42 = v14;
  uint64_t v43 = sub_1B0AF4628;
  uint64_t v44 = v15;
  id v16 = v10;
  id v17 = a3;
  id v18 = v16;
  id v19 = v17;
  swift_retain();
  id v20 = sub_1B0AF38FC(&v35, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B0A2508C((uint64_t)sub_1B0B73340);
  sub_1B0A2508C((uint64_t)sub_1B0AF4628);
  id v21 = objc_msgSend(v20, sel_navigationController);
  if (v21)
  {
    NSUInteger v22 = v21;
    objc_msgSend(v21, sel_setNavigationBarHidden_, 1);
  }
  id v34 = v20;
  id v23 = objc_msgSend(v34, sel_view);
  if (v23)
  {
    uint64_t v24 = v23;
    unsigned int v25 = objc_msgSend(v23, sel_ic_hasCompactWidth);

    if (v25)
    {
      double v26 = *MEMORY[0x1E4FB2848];
      double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    else
    {
      double v26 = 0.0;
      double v27 = 64.0;
      double v28 = 0.0;
      double v29 = 64.0;
    }
    objc_msgSend(v34, sel_setAdditionalSafeAreaInsets_, v26, v27, v28, v29);
  }
  else
  {
    __break(1u);
  }
}

void sub_1B0B72F3C(uint64_t a1, uint64_t a2, char a3, void *a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7)
{
  int v14 = (unsigned __int16)a1;
  id v15 = objc_msgSend(self, sel_switchToDevicePasswordInSettingsInfoAlertWithAccount_, a2);
  id v27 = v15;
  if (v14 == 2)
  {
    id v16 = objc_msgSend(self, sel_sharedMigrator);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a4;
    *(void *)(v17 + 32) = a6;
    *(void *)(v17 + 40) = a7;
    *(_WORD *)(v17 + 48) = 2;
    uint64_t v32 = sub_1B0B73C90;
    uint64_t v33 = v17;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v29 = 1107296256;
    char v30 = sub_1B0A5ADEC;
    __int16 v31 = &block_descriptor_29_0;
    id v18 = _Block_copy(&aBlock);
    id v19 = a4;
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler_, a2, 2, v19, v18, 0);

    _Block_release(v18);
  }
  else if (!objc_msgSend(v15, sel_shouldPresent) || (a3 & 1) != 0)
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a6;
    *(void *)(v23 + 24) = a7;
    *(_WORD *)(v23 + 32) = a1;
    swift_retain_n();
    id v24 = objc_msgSend(a4, sel_rootViewController);
    if (v24)
    {
      unsigned int v25 = v24;
      uint64_t v32 = sub_1B0AF4C44;
      uint64_t v33 = v23;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v29 = 1107296256;
      char v30 = sub_1B0A965E8;
      __int16 v31 = &block_descriptor_26;
      double v26 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v25, sel_dismissViewControllerAnimated_completion_, 1, v26);
      _Block_release(v26);
      swift_release();
      swift_release();
    }
    else
    {
      a6(a1);
      swift_release();
      swift_release();
    }
  }
  else
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a5;
    *(void *)(v20 + 24) = a4;
    *(void *)(v20 + 32) = a6;
    *(void *)(v20 + 40) = a7;
    *(_WORD *)(v20 + 48) = a1;
    uint64_t v32 = sub_1B0B73C7C;
    uint64_t v33 = v20;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v29 = 1107296256;
    char v30 = sub_1B0A965E8;
    __int16 v31 = &block_descriptor_23_1;
    id v21 = _Block_copy(&aBlock);
    id v22 = a4;
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_presentInWindow_completionHandler_, v22, v21);

    _Block_release(v21);
  }
}

uint64_t sub_1B0B732F8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1B0B73340(uint64_t a1)
{
  sub_1B0B72F3C(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void (**)(uint64_t))(v1 + 48), *(void *)(v1 + 56));
}

void sub_1B0B73354(uint64_t a1, void *a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  *(_WORD *)(v9 + 32) = a5;
  swift_retain_n();
  id v10 = objc_msgSend(a2, sel_rootViewController);
  if (v10)
  {
    int v11 = v10;
    v13[4] = sub_1B0AF4C44;
    v13[5] = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 1107296256;
    v13[2] = sub_1B0A965E8;
    v13[3] = &block_descriptor_41_1;
    uint64_t v12 = _Block_copy(v13);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_dismissViewControllerAnimated_completion_, 1, v12);
    _Block_release(v12);
    swift_release();
    swift_release();
  }
  else
  {
    a3(a5);
    swift_release();
    swift_release();
  }
}

void sub_1B0B734D0(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  *(_WORD *)(v10 + 32) = a6;
  swift_retain_n();
  id v11 = objc_msgSend(a3, sel_rootViewController);
  if (v11)
  {
    uint64_t v12 = v11;
    v14[4] = sub_1B0AF4C44;
    v14[5] = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 1107296256;
    v14[2] = sub_1B0A965E8;
    v14[3] = &block_descriptor_35_2;
    uint64_t v13 = _Block_copy(v14);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, v13);
    _Block_release(v13);
    swift_release();
    swift_release();
  }
  else
  {
    a4(a6);
    swift_release();
    swift_release();
  }
}

uint64_t sub_1B0B7364C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0B7368C(int a1, int a2, void *a3, char a4, void *a5, void *aBlock)
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  swift_getObjCClassMetadata();
  id v11 = a3;
  id v12 = a5;
  static LockedNotesSwitchViewController.present(for:skipsAlerts:window:completion:)(v11, a4, v12, (uint64_t)sub_1B0B73C28, v10);

  return swift_release();
}

Swift::Void __swiftcall LockedNotesSwitchViewController.viewDidLoad()()
{
  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalPresentationStyle_, 2);
  objc_msgSend(v0, sel_setPreferredContentSize_, 600.0, 820.0);
}

void sub_1B0B737C8(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  id v1 = v2.receiver;
  objc_msgSendSuper2(&v2, sel_viewDidLoad);
  objc_msgSend(v1, sel_setModalPresentationStyle_, 2, v2.receiver, v2.super_class);
  objc_msgSend(v1, sel_setPreferredContentSize_, 600.0, 820.0);
}

uint64_t LockedNotesSwitchViewController.cancelAction(_:)()
{
  id v1 = (char *)v0 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60);
  objc_super v2 = (uint64_t (*)(void))*((void *)v1 + 6);
  if (v2) {
    return v2(*((unsigned __int16 *)v1 + 20));
  }
  return result;
}

uint64_t sub_1B0B738B0(void *a1)
{
  swift_unknownObjectRetain();
  objc_super v2 = a1;
  sub_1B0B82E0C();
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)v2 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v2) + 0x60);
  id v4 = (void (*)(void))*((void *)v3 + 6);
  if (v4) {
    v4(*((unsigned __int16 *)v3 + 20));
  }

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

id LockedNotesSwitchViewController.__allocating_init(configuration:)(int *a1)
{
  uint64_t v3 = objc_allocWithZone(v1);
  int v4 = *a1;
  uint64_t v5 = *((void *)a1 + 1);
  uint64_t v6 = *((void *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 20);
  char v8 = *((unsigned char *)a1 + 42);
  uint64_t v9 = (void *)MEMORY[0x1E4FBC8C8];
  *(void *)((char *)v3 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v3) + 0x68)) = 0;
  *(void *)((char *)v3 + *(void *)((*v9 & *v3) + 0x70)) = 0;
  *(void *)((char *)v3 + *(void *)((*v9 & *v3) + 0x78)) = 0;
  uint64_t v10 = (char *)v3 + *(void *)((*v9 & *v3) + 0x60);
  *(_DWORD *)uint64_t v10 = v4;
  *((void *)v10 + 1) = v5;
  *((void *)v10 + 2) = v6;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a1 + 6);
  *((_WORD *)v10 + 20) = v7;
  v10[42] = v8;
  long long v11 = *((_OWORD *)a1 + 4);
  *((_OWORD *)v10 + 3) = *((_OWORD *)a1 + 3);
  *((_OWORD *)v10 + 4) = v11;
  v13.receiver = v3;
  v13.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4D138);
  return objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
}

id LockedNotesSwitchViewController.init(configuration:)(int *a1)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = *((void *)a1 + 2);
  __int16 v5 = *((_WORD *)a1 + 20);
  char v6 = *((unsigned char *)a1 + 42);
  __int16 v7 = (void *)MEMORY[0x1E4FBC8C8];
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68)) = 0;
  *(void *)((char *)v1 + *(void *)((*v7 & *v1) + 0x70)) = 0;
  *(void *)((char *)v1 + *(void *)((*v7 & *v1) + 0x78)) = 0;
  char v8 = (char *)v1 + *(void *)((*v7 & *v1) + 0x60);
  *(_DWORD *)char v8 = v2;
  *((void *)v8 + 1) = v3;
  *((void *)v8 + 2) = v4;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 6);
  *((_WORD *)v8 + 20) = v5;
  v8[42] = v6;
  long long v9 = *((_OWORD *)a1 + 4);
  *((_OWORD *)v8 + 3) = *((_OWORD *)a1 + 3);
  *((_OWORD *)v8 + 4) = v9;
  v11.receiver = v1;
  v11.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4D138);
  return objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
}

id LockedNotesSwitchViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LockedNotesSwitchViewController()
{
  uint64_t result = qword_1EBBB5C80;
  if (!qword_1EBBB5C80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B0B73BE8()
{
  return type metadata accessor for LockedNotesSwitchViewController();
}

uint64_t sub_1B0B73BF0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0B73C28(__int16 a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1);
}

uint64_t sub_1B0B73C40()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 34, 7);
}

void sub_1B0B73C7C()
{
  sub_1B0B73354(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40), *(unsigned __int16 *)(v0 + 48));
}

void sub_1B0B73C90(uint64_t a1)
{
  sub_1B0B734D0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(unsigned __int16 *)(v1 + 48));
}

uint64_t ICSystemPaperTextAttachment.encrypt(_:)()
{
  id v1 = objc_msgSend(v0, sel_attachment);
  uint64_t v2 = sub_1B0B8059C();

  return v2;
}

uint64_t ICSystemPaperTextAttachment.decrypt(_:)()
{
  id v1 = objc_msgSend(v0, sel_attachment);
  uint64_t v2 = sub_1B0B8057C();

  return v2;
}

void ICSystemPaperTextAttachment.encrypt(_:)()
{
  id v1 = objc_msgSend(v0, sel_attachment);
  sub_1B0B8058C();
}

uint64_t sub_1B0B73E18()
{
  id v1 = objc_msgSend(*v0, sel_attachment);
  uint64_t v2 = sub_1B0B8059C();

  return v2;
}

uint64_t sub_1B0B73E80()
{
  id v1 = objc_msgSend(*v0, sel_attachment);
  uint64_t v2 = sub_1B0B8057C();

  return v2;
}

void sub_1B0B73EF8()
{
  id v1 = objc_msgSend(*v0, sel_attachment);
  sub_1B0B8058C();
}

id sub_1B0B73F68()
{
  uint64_t v1 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78);
  uint64_t v2 = *(void **)((char *)v0 + v1);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + v1);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_doneAction_);
    __int16 v5 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t static LockedNotesLearnMoreViewController.present(for:window:)(void *a1, void *a2)
{
  __LockedNotesViewConfigurationAccount.init(account:)(a1, (uint64_t)&v10);
  int v4 = v10;
  uint64_t v5 = v11;
  uint64_t v6 = v12;
  long long v7 = v13;
  __int16 v8 = v14;
  char v9 = v15;
  LockedNotesLearnMoreView.Configuration.init(account:)(&v4, (uint64_t)v16);

  return sub_1B0AF4B94((uint64_t)v16);
}

Swift::Void __swiftcall LockedNotesLearnMoreViewController.viewDidLoad()()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v1, sel_setTitle_, 0);

  id v2 = objc_msgSend(v0, sel_navigationItem);
  id v3 = sub_1B0B73F68();
  objc_msgSend(v2, sel_setRightBarButtonItem_, v3);
}

void sub_1B0B74140(void *a1)
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  id v1 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidLoad);
  id v2 = objc_msgSend(v1, sel_navigationItem, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_setTitle_, 0);

  id v3 = objc_msgSend(v1, sel_navigationItem);
  id v4 = sub_1B0B73F68();
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);
}

void sub_1B0B74204(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = a4;
  __LockedNotesViewConfigurationAccount.init(account:)(v6, (uint64_t)&v14);
  int v8 = v14;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  long long v11 = v17;
  __int16 v12 = v18;
  char v13 = v19;
  LockedNotesLearnMoreView.Configuration.init(account:)(&v8, (uint64_t)v20);

  sub_1B0AF4B94((uint64_t)v20);
}

id LockedNotesLearnMoreViewController.doneAction(_:)()
{
  return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

uint64_t sub_1B0B742D8(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_1B0B82E0C();
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v4);
}

id LockedNotesLearnMoreViewController.__allocating_init(configuration:)(int *a1)
{
  id v3 = objc_allocWithZone(v1);
  int v4 = *a1;
  uint64_t v5 = *((void *)a1 + 1);
  uint64_t v6 = *((void *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 20);
  char v8 = *((unsigned char *)a1 + 42);
  long long v9 = *((_OWORD *)a1 + 3);
  long long v10 = *((_OWORD *)a1 + 4);
  long long v11 = *((_OWORD *)a1 + 5);
  uint64_t v12 = *((void *)a1 + 12);
  uint64_t v13 = *((void *)a1 + 13);
  int v14 = (void *)MEMORY[0x1E4FBC8C8];
  *(void *)((char *)v3 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v3) + 0x68)) = 0;
  *(void *)((char *)v3 + *(void *)((*v14 & *v3) + 0x70)) = 0;
  *(void *)((char *)v3 + *(void *)((*v14 & *v3) + 0x78)) = 0;
  uint64_t v15 = (char *)v3 + *(void *)((*v14 & *v3) + 0x60);
  *(_DWORD *)uint64_t v15 = v4;
  *((void *)v15 + 1) = v5;
  *((void *)v15 + 2) = v6;
  *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 6);
  *((_WORD *)v15 + 20) = v7;
  v15[42] = v8;
  *((_OWORD *)v15 + 3) = v9;
  *((_OWORD *)v15 + 4) = v10;
  *((_OWORD *)v15 + 5) = v11;
  *((void *)v15 + 12) = v12;
  *((void *)v15 + 13) = v13;
  v17.receiver = v3;
  v17.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4D140);
  return objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, 0, 0);
}

id LockedNotesLearnMoreViewController.init(configuration:)(int *a1)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = *((void *)a1 + 2);
  __int16 v5 = *((_WORD *)a1 + 20);
  char v6 = *((unsigned char *)a1 + 42);
  long long v7 = *((_OWORD *)a1 + 3);
  long long v8 = *((_OWORD *)a1 + 4);
  long long v9 = *((_OWORD *)a1 + 5);
  uint64_t v10 = *((void *)a1 + 12);
  uint64_t v11 = *((void *)a1 + 13);
  uint64_t v12 = (void *)MEMORY[0x1E4FBC8C8];
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x68)) = 0;
  *(void *)((char *)v1 + *(void *)((*v12 & *v1) + 0x70)) = 0;
  *(void *)((char *)v1 + *(void *)((*v12 & *v1) + 0x78)) = 0;
  uint64_t v13 = (char *)v1 + *(void *)((*v12 & *v1) + 0x60);
  *(_DWORD *)uint64_t v13 = v2;
  *((void *)v13 + 1) = v3;
  *((void *)v13 + 2) = v4;
  *(_OWORD *)(v13 + 24) = *(_OWORD *)(a1 + 6);
  *((_WORD *)v13 + 20) = v5;
  v13[42] = v6;
  *((_OWORD *)v13 + 3) = v7;
  *((_OWORD *)v13 + 4) = v8;
  *((_OWORD *)v13 + 5) = v9;
  *((void *)v13 + 12) = v10;
  *((void *)v13 + 13) = v11;
  v15.receiver = v1;
  v15.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B4D140);
  return objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);
}

id LockedNotesLearnMoreViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LockedNotesLearnMoreViewController()
{
  uint64_t result = qword_1EBBB5C90;
  if (!qword_1EBBB5C90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B0B74608()
{
  return type metadata accessor for LockedNotesLearnMoreViewController();
}

uint64_t sub_1B0B74610()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPFileMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPFileMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPImageClass_block_invoke_cold_1(v0);
}

uint64_t __getLPImageClass_block_invoke_cold_1()
{
  return +[UIDevice(IC) ic_isLocked]();
}

uint64_t __getVNSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageRequestHandlerClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNSceneClassificationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNSceneClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __48__ICAttachmentPreviewGeneratorOCROperation_main__block_invoke_cold_1(v0);
}

uint64_t __getLPMetadataProviderClass_block_invoke_cold_1()
{
  return __getLPMapMetadataClass_block_invoke_cold_1();
}

uint64_t __getLPMapMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __38__ICAttachmentThumbnailOperation_main__block_invoke_cold_1(v0);
}

uint64_t __getQLThumbnailGenerationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getQLThumbnailGeneratorClass_block_invoke_cold_1(v0);
}

uint64_t __getQLThumbnailGeneratorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICAttachmentPaperBundleModel(UI) drawPreviewInRect:](v0);
}

void ICSymbolImageNameForICFilterType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ICLocalizedStringForICFilterType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ICTintColorForICFilterType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getACUILocalizationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICAudioController play](v0);
}

uint64_t __getLPAudioPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPAudioClass_block_invoke_cold_1(v0);
}

uint64_t __getLPAudioClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICAttachmentDrawingModel(PreviewGeneration) needToGeneratePreviews](v0);
}

uint64_t __getLPLinkViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICMoveDecision accountForObject:](v0);
}

uint64_t sub_1B0B7F6EC()
{
  return MEMORY[0x1F40E2D48]();
}

uint64_t sub_1B0B7F6FC()
{
  return MEMORY[0x1F40E2D60]();
}

uint64_t sub_1B0B7F70C()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1B0B7F71C()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1B0B7F72C()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1B0B7F73C()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1B0B7F74C()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1B0B7F75C()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B0B7F76C()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B0B7F77C()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B0B7F78C()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1B0B7F79C()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1B0B7F7AC()
{
  return MEMORY[0x1F40E3340]();
}

uint64_t sub_1B0B7F7BC()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1B0B7F7CC()
{
  return MEMORY[0x1F40E3370]();
}

uint64_t sub_1B0B7F7DC()
{
  return MEMORY[0x1F40E3380]();
}

uint64_t sub_1B0B7F7EC()
{
  return MEMORY[0x1F40E33E8]();
}

uint64_t sub_1B0B7F7FC()
{
  return MEMORY[0x1F40E3400]();
}

uint64_t sub_1B0B7F80C()
{
  return MEMORY[0x1F40E3418]();
}

uint64_t sub_1B0B7F81C()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1B0B7F82C()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1B0B7F83C()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1B0B7F84C()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1B0B7F85C()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1B0B7F86C()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1B0B7F87C()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1B0B7F88C()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1B0B7F89C()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1B0B7F8AC()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1B0B7F8BC()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1B0B7F8CC()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B0B7F8DC()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1B0B7F8EC()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B0B7F8FC()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1B0B7F90C()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1B0B7F91C()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1B0B7F92C()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1B0B7F93C()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1B0B7F94C()
{
  return MEMORY[0x1F41656E0]();
}

uint64_t sub_1B0B7F95C()
{
  return MEMORY[0x1F40E3CD0]();
}

uint64_t sub_1B0B7F96C()
{
  return MEMORY[0x1F40E3CE8]();
}

uint64_t sub_1B0B7F97C()
{
  return MEMORY[0x1F40E3CF8]();
}

uint64_t sub_1B0B7F98C()
{
  return MEMORY[0x1F40E3D08]();
}

uint64_t sub_1B0B7F99C()
{
  return MEMORY[0x1F40E3D10]();
}

uint64_t sub_1B0B7F9AC()
{
  return MEMORY[0x1F40E3D18]();
}

uint64_t sub_1B0B7F9BC()
{
  return MEMORY[0x1F40E3D20]();
}

uint64_t sub_1B0B7F9CC()
{
  return MEMORY[0x1F40E3E40]();
}

uint64_t sub_1B0B7F9DC()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1B0B7F9EC()
{
  return MEMORY[0x1F40E3ED0]();
}

uint64_t sub_1B0B7F9FC()
{
  return MEMORY[0x1F40E3F10]();
}

uint64_t sub_1B0B7FA0C()
{
  return MEMORY[0x1F4187828]();
}

uint64_t sub_1B0B7FA1C()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1B0B7FA2C()
{
  return MEMORY[0x1F40E4138]();
}

uint64_t sub_1B0B7FA3C()
{
  return MEMORY[0x1F40E42B0]();
}

uint64_t sub_1B0B7FA4C()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1B0B7FABC()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1B0B7FACC()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B0B7FADC()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B0B7FAEC()
{
  return MEMORY[0x1F40E4680]();
}

uint64_t sub_1B0B7FAFC()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1B0B7FB0C()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1B0B7FB1C()
{
  return MEMORY[0x1F40E4830]();
}

uint64_t sub_1B0B7FB2C()
{
  return MEMORY[0x1F40E4840]();
}

uint64_t sub_1B0B7FB3C()
{
  return MEMORY[0x1F40E4868]();
}

uint64_t sub_1B0B7FB4C()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B0B7FB5C()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1B0B7FB6C()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1B0B7FB7C()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1B0B7FB8C()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B0B7FB9C()
{
  return MEMORY[0x1F4187838]();
}

uint64_t sub_1B0B7FBAC()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1B0B7FBBC()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1B0B7FBCC()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B0B7FBDC()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B0B7FBEC()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B0B7FBFC()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1B0B7FC0C()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B0B7FC1C()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B0B7FC2C()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1B0B7FC3C()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1B0B7FC4C()
{
  return MEMORY[0x1F40E4F48]();
}

uint64_t sub_1B0B7FC5C()
{
  return MEMORY[0x1F40E5030]();
}

uint64_t sub_1B0B7FC6C()
{
  return MEMORY[0x1F40E5048]();
}

uint64_t sub_1B0B7FC7C()
{
  return MEMORY[0x1F40E5058]();
}

uint64_t sub_1B0B7FC8C()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1B0B7FC9C()
{
  return MEMORY[0x1F4139BB0]();
}

uint64_t sub_1B0B7FCAC()
{
  return MEMORY[0x1F4139BB8]();
}

uint64_t sub_1B0B7FCBC()
{
  return MEMORY[0x1F4139BC0]();
}

uint64_t sub_1B0B7FCCC()
{
  return MEMORY[0x1F4139BC8]();
}

uint64_t sub_1B0B7FCDC()
{
  return MEMORY[0x1F4139BD8]();
}

uint64_t sub_1B0B7FCEC()
{
  return MEMORY[0x1F40E50A0]();
}

uint64_t sub_1B0B7FCFC()
{
  return MEMORY[0x1F40E50E8]();
}

uint64_t sub_1B0B7FD0C()
{
  return MEMORY[0x1F40E50F0]();
}

uint64_t sub_1B0B7FD1C()
{
  return MEMORY[0x1F40E50F8]();
}

uint64_t sub_1B0B7FD2C()
{
  return MEMORY[0x1F40E5100]();
}

uint64_t sub_1B0B7FD3C()
{
  return MEMORY[0x1F40E5118]();
}

uint64_t sub_1B0B7FD4C()
{
  return MEMORY[0x1F40E5148]();
}

uint64_t sub_1B0B7FD5C()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B0B7FD6C()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1B0B7FD7C()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1B0B7FD8C()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1B0B7FD9C()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1B0B7FDAC()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B0B7FDBC()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1B0B7FDCC()
{
  return MEMORY[0x1F40E5358]();
}

uint64_t sub_1B0B7FDDC()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B0B7FDEC()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B0B7FDFC()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B0B7FE0C()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1B0B7FE1C()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1B0B7FE2C()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1B0B7FE3C()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B0B7FE4C()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B0B7FE5C()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1B0B7FE6C()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B0B7FE7C()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1B0B7FE8C()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1B0B7FE9C()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1B0B7FEAC()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1B0B7FEBC()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1B0B7FECC()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1B0B7FEDC()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1B0B7FEEC()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1B0B7FEFC()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1B0B7FF0C()
{
  return MEMORY[0x1F40E5B50]();
}

uint64_t sub_1B0B7FF1C()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1B0B7FF2C()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1B0B7FF3C()
{
  return MEMORY[0x1F40E5BF0]();
}

uint64_t sub_1B0B7FF4C()
{
  return MEMORY[0x1F40E5C68]();
}

uint64_t sub_1B0B7FF5C()
{
  return MEMORY[0x1F40E5C98]();
}

uint64_t sub_1B0B7FF6C()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1B0B7FF7C()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1B0B7FF8C()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1B0B7FF9C()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1B0B7FFAC()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1B0B7FFBC()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1B0B7FFCC()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1B0B7FFDC()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1B0B7FFEC()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1B0B7FFFC()
{
  return MEMORY[0x1F410DE98]();
}

uint64_t sub_1B0B8000C()
{
  return MEMORY[0x1F410DEA0]();
}

uint64_t sub_1B0B8001C()
{
  return MEMORY[0x1F410DEA8]();
}

uint64_t sub_1B0B8002C()
{
  return MEMORY[0x1F410DEB0]();
}

uint64_t sub_1B0B8003C()
{
  return MEMORY[0x1F410DEB8]();
}

uint64_t sub_1B0B8004C()
{
  return MEMORY[0x1F410DEC0]();
}

uint64_t sub_1B0B8005C()
{
  return MEMORY[0x1F410DEC8]();
}

uint64_t sub_1B0B8006C()
{
  return MEMORY[0x1F410DED0]();
}

uint64_t sub_1B0B8007C()
{
  return MEMORY[0x1F410DED8]();
}

uint64_t sub_1B0B8008C()
{
  return MEMORY[0x1F410DEE0]();
}

uint64_t sub_1B0B8009C()
{
  return MEMORY[0x1F41396F0]();
}

uint64_t sub_1B0B800AC()
{
  return MEMORY[0x1F41396F8]();
}

uint64_t sub_1B0B800BC()
{
  return MEMORY[0x1F4139700]();
}

uint64_t _s7NotesUI29ActivityStreamItemConvertiblePAA0A6Shared0C5EventRzrlE08activityE9Timestamp10Foundation4DateVvg_0()
{
  return MEMORY[0x1F4139710]();
}

uint64_t sub_1B0B800EC()
{
  return MEMORY[0x1F4139718]();
}

uint64_t sub_1B0B800FC()
{
  return MEMORY[0x1F4139720]();
}

uint64_t sub_1B0B8010C()
{
  return MEMORY[0x1F4139728]();
}

uint64_t sub_1B0B8011C()
{
  return MEMORY[0x1F4139730]();
}

uint64_t sub_1B0B8012C()
{
  return MEMORY[0x1F4139738]();
}

uint64_t sub_1B0B8013C()
{
  return MEMORY[0x1F4139740]();
}

uint64_t sub_1B0B8014C()
{
  return MEMORY[0x1F4139748]();
}

uint64_t sub_1B0B8015C()
{
  return MEMORY[0x1F4139750]();
}

uint64_t sub_1B0B8016C()
{
  return MEMORY[0x1F4139758]();
}

uint64_t sub_1B0B8017C()
{
  return MEMORY[0x1F4139760]();
}

uint64_t sub_1B0B8018C()
{
  return MEMORY[0x1F4139768]();
}

uint64_t sub_1B0B8019C()
{
  return MEMORY[0x1F4139770]();
}

uint64_t sub_1B0B801AC()
{
  return MEMORY[0x1F4139778]();
}

uint64_t sub_1B0B801CC()
{
  return MEMORY[0x1F4139788]();
}

uint64_t sub_1B0B801DC()
{
  return MEMORY[0x1F4139790]();
}

uint64_t sub_1B0B801EC()
{
  return MEMORY[0x1F4139798]();
}

uint64_t sub_1B0B801FC()
{
  return MEMORY[0x1F41397A0]();
}

uint64_t sub_1B0B8020C()
{
  return MEMORY[0x1F41397A8]();
}

uint64_t sub_1B0B8021C()
{
  return MEMORY[0x1F41397B0]();
}

uint64_t sub_1B0B8022C()
{
  return MEMORY[0x1F41397B8]();
}

uint64_t sub_1B0B8023C()
{
  return MEMORY[0x1F41397C0]();
}

uint64_t sub_1B0B8024C()
{
  return MEMORY[0x1F41397C8]();
}

uint64_t sub_1B0B8025C()
{
  return MEMORY[0x1F41397D0]();
}

uint64_t sub_1B0B8026C()
{
  return MEMORY[0x1F41397D8]();
}

uint64_t sub_1B0B8027C()
{
  return MEMORY[0x1F41397E0]();
}

uint64_t sub_1B0B8028C()
{
  return MEMORY[0x1F41397E8]();
}

uint64_t sub_1B0B8029C()
{
  return MEMORY[0x1F41397F0]();
}

uint64_t sub_1B0B802AC()
{
  return MEMORY[0x1F41397F8]();
}

uint64_t sub_1B0B802BC()
{
  return MEMORY[0x1F4139800]();
}

uint64_t sub_1B0B802CC()
{
  return MEMORY[0x1F4139808]();
}

uint64_t sub_1B0B802DC()
{
  return MEMORY[0x1F4139810]();
}

uint64_t sub_1B0B802EC()
{
  return MEMORY[0x1F4139818]();
}

uint64_t sub_1B0B802FC()
{
  return MEMORY[0x1F4139820]();
}

uint64_t sub_1B0B8030C()
{
  return MEMORY[0x1F4139828]();
}

uint64_t sub_1B0B8031C()
{
  return MEMORY[0x1F4139830]();
}

uint64_t sub_1B0B8032C()
{
  return MEMORY[0x1F4139838]();
}

uint64_t sub_1B0B8033C()
{
  return MEMORY[0x1F4139840]();
}

uint64_t sub_1B0B8034C()
{
  return MEMORY[0x1F4139848]();
}

uint64_t sub_1B0B8035C()
{
  return MEMORY[0x1F4139850]();
}

uint64_t sub_1B0B8036C()
{
  return MEMORY[0x1F4139858]();
}

uint64_t sub_1B0B8037C()
{
  return MEMORY[0x1F4139860]();
}

uint64_t sub_1B0B8038C()
{
  return MEMORY[0x1F4139868]();
}

uint64_t sub_1B0B8039C()
{
  return MEMORY[0x1F4139870]();
}

uint64_t sub_1B0B803AC()
{
  return MEMORY[0x1F4139878]();
}

uint64_t sub_1B0B803BC()
{
  return MEMORY[0x1F4139880]();
}

uint64_t sub_1B0B803CC()
{
  return MEMORY[0x1F4139888]();
}

uint64_t sub_1B0B803DC()
{
  return MEMORY[0x1F4139890]();
}

uint64_t sub_1B0B803EC()
{
  return MEMORY[0x1F4139898]();
}

uint64_t sub_1B0B803FC()
{
  return MEMORY[0x1F41398A0]();
}

uint64_t sub_1B0B8040C()
{
  return MEMORY[0x1F41398A8]();
}

uint64_t sub_1B0B8041C()
{
  return MEMORY[0x1F41398B0]();
}

uint64_t sub_1B0B8042C()
{
  return MEMORY[0x1F41398B8]();
}

uint64_t sub_1B0B8043C()
{
  return MEMORY[0x1F41398C0]();
}

uint64_t sub_1B0B8044C()
{
  return MEMORY[0x1F41398C8]();
}

uint64_t sub_1B0B8045C()
{
  return MEMORY[0x1F41398D0]();
}

uint64_t sub_1B0B8046C()
{
  return MEMORY[0x1F41398D8]();
}

uint64_t sub_1B0B8047C()
{
  return MEMORY[0x1F41398E0]();
}

uint64_t sub_1B0B8048C()
{
  return MEMORY[0x1F41398E8]();
}

uint64_t sub_1B0B8049C()
{
  return MEMORY[0x1F41398F0]();
}

uint64_t sub_1B0B804AC()
{
  return MEMORY[0x1F41398F8]();
}

uint64_t sub_1B0B804BC()
{
  return MEMORY[0x1F4139900]();
}

uint64_t sub_1B0B804CC()
{
  return MEMORY[0x1F4139908]();
}

uint64_t sub_1B0B804DC()
{
  return MEMORY[0x1F4139910]();
}

uint64_t sub_1B0B804EC()
{
  return MEMORY[0x1F4139918]();
}

uint64_t sub_1B0B804FC()
{
  return MEMORY[0x1F4139920]();
}

uint64_t sub_1B0B8050C()
{
  return MEMORY[0x1F4139928]();
}

uint64_t sub_1B0B8051C()
{
  return MEMORY[0x1F4139930]();
}

uint64_t sub_1B0B8052C()
{
  return MEMORY[0x1F4139938]();
}

uint64_t sub_1B0B8053C()
{
  return MEMORY[0x1F4139940]();
}

uint64_t sub_1B0B8054C()
{
  return MEMORY[0x1F4139948]();
}

uint64_t sub_1B0B8055C()
{
  return MEMORY[0x1F4139950]();
}

uint64_t sub_1B0B8056C()
{
  return MEMORY[0x1F4139958]();
}

uint64_t sub_1B0B8057C()
{
  return MEMORY[0x1F4139960]();
}

uint64_t sub_1B0B8058C()
{
  return MEMORY[0x1F4139968]();
}

uint64_t sub_1B0B8059C()
{
  return MEMORY[0x1F4139970]();
}

uint64_t sub_1B0B805AC()
{
  return MEMORY[0x1F4139978]();
}

uint64_t sub_1B0B805BC()
{
  return MEMORY[0x1F4139980]();
}

uint64_t sub_1B0B805CC()
{
  return MEMORY[0x1F4139988]();
}

uint64_t sub_1B0B805DC()
{
  return MEMORY[0x1F4139990]();
}

uint64_t sub_1B0B805EC()
{
  return MEMORY[0x1F4139998]();
}

uint64_t sub_1B0B805FC()
{
  return MEMORY[0x1F41399A0]();
}

uint64_t sub_1B0B8060C()
{
  return MEMORY[0x1F41399A8]();
}

uint64_t sub_1B0B8061C()
{
  return MEMORY[0x1F41874E8]();
}

uint64_t sub_1B0B8062C()
{
  return MEMORY[0x1F41874F0]();
}

uint64_t sub_1B0B8063C()
{
  return MEMORY[0x1F4187510]();
}

uint64_t sub_1B0B8064C()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1B0B8065C()
{
  return MEMORY[0x1F4139BE0]();
}

uint64_t sub_1B0B8067C()
{
  return MEMORY[0x1F4139BF0]();
}

uint64_t sub_1B0B8068C()
{
  return MEMORY[0x1F4139C00]();
}

uint64_t sub_1B0B8069C()
{
  return MEMORY[0x1F4139E40]();
}

uint64_t sub_1B0B806AC()
{
  return MEMORY[0x1F4139E48]();
}

uint64_t sub_1B0B806BC()
{
  return MEMORY[0x1F41126B0]();
}

uint64_t sub_1B0B806CC()
{
  return MEMORY[0x1F41126C0]();
}

uint64_t sub_1B0B806DC()
{
  return MEMORY[0x1F41126E8]();
}

uint64_t sub_1B0B806EC()
{
  return MEMORY[0x1F41126F0]();
}

uint64_t sub_1B0B806FC()
{
  return MEMORY[0x1F41126F8]();
}

uint64_t sub_1B0B8070C()
{
  return MEMORY[0x1F4112708]();
}

uint64_t sub_1B0B8071C()
{
  return MEMORY[0x1F4112720]();
}

uint64_t sub_1B0B8072C()
{
  return MEMORY[0x1F4112728]();
}

uint64_t sub_1B0B8073C()
{
  return MEMORY[0x1F4112730]();
}

uint64_t sub_1B0B8074C()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1B0B8075C()
{
  return MEMORY[0x1F4187860]();
}

uint64_t sub_1B0B8076C()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1B0B8077C()
{
  return MEMORY[0x1F41878E0]();
}

uint64_t sub_1B0B8078C()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1B0B8079C()
{
  return MEMORY[0x1F4187928]();
}

uint64_t sub_1B0B807AC()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1B0B807BC()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1B0B807CC()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B0B807DC()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1B0B807EC()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1B0B807FC()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1B0B8080C()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1B0B8081C()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1B0B8082C()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1B0B8083C()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1B0B8084C()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1B0B8085C()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1B0B8086C()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1B0B8087C()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1B0B8088C()
{
  return MEMORY[0x1F41399B0]();
}

uint64_t sub_1B0B8089C()
{
  return MEMORY[0x1F41399B8]();
}

uint64_t sub_1B0B808AC()
{
  return MEMORY[0x1F41399C0]();
}

uint64_t sub_1B0B808BC()
{
  return MEMORY[0x1F41399C8]();
}

uint64_t sub_1B0B808CC()
{
  return MEMORY[0x1F41399D0]();
}

uint64_t sub_1B0B808DC()
{
  return MEMORY[0x1F41399D8]();
}

uint64_t sub_1B0B808EC()
{
  return MEMORY[0x1F41399E0]();
}

uint64_t sub_1B0B808FC()
{
  return MEMORY[0x1F41399E8]();
}

uint64_t sub_1B0B8090C()
{
  return MEMORY[0x1F41399F0]();
}

uint64_t sub_1B0B8091C()
{
  return MEMORY[0x1F41399F8]();
}

uint64_t sub_1B0B8092C()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B0B8093C()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B0B8094C()
{
  return MEMORY[0x1F4165C40]();
}

uint64_t sub_1B0B8095C()
{
  return MEMORY[0x1F4165F78]();
}

uint64_t sub_1B0B8096C()
{
  return MEMORY[0x1F4166218]();
}

uint64_t sub_1B0B8097C()
{
  return MEMORY[0x1F4166290]();
}

uint64_t sub_1B0B8098C()
{
  return MEMORY[0x1F41662B8]();
}

uint64_t sub_1B0B8099C()
{
  return MEMORY[0x1F41662F0]();
}

uint64_t sub_1B0B809AC()
{
  return MEMORY[0x1F4166310]();
}

uint64_t sub_1B0B809BC()
{
  return MEMORY[0x1F4166318]();
}

uint64_t sub_1B0B809CC()
{
  return MEMORY[0x1F4166340]();
}

uint64_t sub_1B0B809DC()
{
  return MEMORY[0x1F4166368]();
}

uint64_t sub_1B0B809EC()
{
  return MEMORY[0x1F41663E8]();
}

uint64_t sub_1B0B809FC()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1B0B80A0C()
{
  return MEMORY[0x1F40D6618]();
}

uint64_t sub_1B0B80A1C()
{
  return MEMORY[0x1F40D6628]();
}

uint64_t sub_1B0B80A2C()
{
  return MEMORY[0x1F40D6638]();
}

uint64_t sub_1B0B80A3C()
{
  return MEMORY[0x1F40D6648]();
}

uint64_t sub_1B0B80A4C()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1B0B80A5C()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1B0B80A6C()
{
  return MEMORY[0x1F40D67C8]();
}

uint64_t sub_1B0B80A7C()
{
  return MEMORY[0x1F40D6810]();
}

uint64_t sub_1B0B80A8C()
{
  return MEMORY[0x1F40D6840]();
}

uint64_t sub_1B0B80A9C()
{
  return MEMORY[0x1F40D6888]();
}

uint64_t sub_1B0B80AAC()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1B0B80ABC()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1B0B80ACC()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1B0B80ADC()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1B0B80AEC()
{
  return MEMORY[0x1F40D6AC8]();
}

uint64_t sub_1B0B80AFC()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1B0B80B0C()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1B0B80B1C()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1B0B80B2C()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1B0B80B3C()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1B0B80B4C()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1B0B80B5C()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1B0B80B6C()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1B0B80B7C()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1B0B80B8C()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1B0B80B9C()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1B0B80BAC()
{
  return MEMORY[0x1F40D6C48]();
}

uint64_t sub_1B0B80BBC()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1B0B80BCC()
{
  return MEMORY[0x1F40D6CB0]();
}

uint64_t sub_1B0B80BDC()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1B0B80BEC()
{
  return MEMORY[0x1F40D6CC8]();
}

uint64_t sub_1B0B80BFC()
{
  return MEMORY[0x1F40D6CE0]();
}

uint64_t sub_1B0B80C0C()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1B0B80C1C()
{
  return MEMORY[0x1F40D6D48]();
}

uint64_t sub_1B0B80C2C()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1B0B80C3C()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1B0B80C4C()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1B0B80C5C()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1B0B80C6C()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1B0B80C7C()
{
  return MEMORY[0x1F40D6E40]();
}

uint64_t sub_1B0B80C8C()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1B0B80C9C()
{
  return MEMORY[0x1F40F7F20]();
}

uint64_t sub_1B0B80CAC()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_1B0B80CBC()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1B0B80CCC()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1B0B80CDC()
{
  return MEMORY[0x1F40F8068]();
}

uint64_t sub_1B0B80CEC()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1B0B80CFC()
{
  return MEMORY[0x1F40F8318]();
}

uint64_t sub_1B0B80D0C()
{
  return MEMORY[0x1F40F8330]();
}

uint64_t sub_1B0B80D1C()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1B0B80D2C()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1B0B80D3C()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1B0B80D4C()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1B0B80D5C()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1B0B80D6C()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1B0B80D8C()
{
  return MEMORY[0x1F40F86E0]();
}

uint64_t sub_1B0B80D9C()
{
  return MEMORY[0x1F40F86E8]();
}

uint64_t sub_1B0B80DAC()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_1B0B80DBC()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1B0B80DDC()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1B0B80DEC()
{
  return MEMORY[0x1F40F8B98]();
}

uint64_t sub_1B0B80DFC()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1B0B80E0C()
{
  return MEMORY[0x1F40F8C70]();
}

uint64_t sub_1B0B80E1C()
{
  return MEMORY[0x1F40F8D78]();
}

uint64_t sub_1B0B80E2C()
{
  return MEMORY[0x1F40F8D80]();
}

uint64_t sub_1B0B80E3C()
{
  return MEMORY[0x1F40F8D88]();
}

uint64_t sub_1B0B80E4C()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1B0B80E5C()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1B0B80E6C()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1B0B80E7C()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1B0B80E8C()
{
  return MEMORY[0x1F40F8F78]();
}

uint64_t sub_1B0B80E9C()
{
  return MEMORY[0x1F40F8F98]();
}

uint64_t sub_1B0B80EAC()
{
  return MEMORY[0x1F40F90A8]();
}

uint64_t sub_1B0B80EBC()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1B0B80ECC()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1B0B80EDC()
{
  return MEMORY[0x1F40F9160]();
}

uint64_t sub_1B0B80EEC()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1B0B80EFC()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_1B0B80F0C()
{
  return MEMORY[0x1F40F9248]();
}

uint64_t sub_1B0B80F1C()
{
  return MEMORY[0x1F40F9250]();
}

uint64_t sub_1B0B80F2C()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1B0B80F3C()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1B0B80F4C()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1B0B80F5C()
{
  return MEMORY[0x1F40F92B8]();
}

uint64_t sub_1B0B80F6C()
{
  return MEMORY[0x1F40F9378]();
}

uint64_t sub_1B0B80F7C()
{
  return MEMORY[0x1F40F93A8]();
}

uint64_t sub_1B0B80F8C()
{
  return MEMORY[0x1F40F93B0]();
}

uint64_t sub_1B0B80F9C()
{
  return MEMORY[0x1F40F93E8]();
}

uint64_t sub_1B0B80FAC()
{
  return MEMORY[0x1F40F93F0]();
}

uint64_t sub_1B0B80FBC()
{
  return MEMORY[0x1F40F9400]();
}

uint64_t sub_1B0B80FCC()
{
  return MEMORY[0x1F40F9410]();
}

uint64_t sub_1B0B80FDC()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1B0B80FEC()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1B0B80FFC()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1B0B8100C()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1B0B8101C()
{
  return MEMORY[0x1F40F9570]();
}

uint64_t sub_1B0B8102C()
{
  return MEMORY[0x1F40F9588]();
}

uint64_t sub_1B0B8103C()
{
  return MEMORY[0x1F40F9618]();
}

uint64_t sub_1B0B8104C()
{
  return MEMORY[0x1F40F9628]();
}

uint64_t sub_1B0B8105C()
{
  return MEMORY[0x1F40F9648]();
}

uint64_t sub_1B0B8106C()
{
  return MEMORY[0x1F40F9658]();
}

uint64_t sub_1B0B8107C()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1B0B8108C()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1B0B8109C()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1B0B810AC()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1B0B810BC()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_1B0B810CC()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_1B0B810DC()
{
  return MEMORY[0x1F40F97B8]();
}

uint64_t sub_1B0B810EC()
{
  return MEMORY[0x1F40F97C8]();
}

uint64_t sub_1B0B810FC()
{
  return MEMORY[0x1F40F9888]();
}

uint64_t sub_1B0B8110C()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1B0B8111C()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1B0B8112C()
{
  return MEMORY[0x1F40F9A40]();
}

uint64_t sub_1B0B8113C()
{
  return MEMORY[0x1F40F9A50]();
}

uint64_t sub_1B0B8114C()
{
  return MEMORY[0x1F40F9A80]();
}

uint64_t sub_1B0B8115C()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1B0B8116C()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1B0B8117C()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1B0B8118C()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1B0B8119C()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1B0B811AC()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1B0B811BC()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1B0B811CC()
{
  return MEMORY[0x1F40F9BB8]();
}

uint64_t sub_1B0B811DC()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1B0B811EC()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1B0B811FC()
{
  return MEMORY[0x1F40F9CB8]();
}

uint64_t sub_1B0B8120C()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1B0B8121C()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1B0B8122C()
{
  return MEMORY[0x1F40F9CF0]();
}

uint64_t sub_1B0B8123C()
{
  return MEMORY[0x1F40F9D90]();
}

uint64_t sub_1B0B8124C()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1B0B8125C()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1B0B8126C()
{
  return MEMORY[0x1F40F9E20]();
}

uint64_t sub_1B0B8127C()
{
  return MEMORY[0x1F40F9E28]();
}

uint64_t sub_1B0B8128C()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1B0B8129C()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1B0B812AC()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1B0B812CC()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1B0B812DC()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1B0B812EC()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1B0B812FC()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1B0B8130C()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1B0B8131C()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1B0B8133C()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1B0B8134C()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1B0B8135C()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1B0B8136C()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1B0B8137C()
{
  return MEMORY[0x1F40F9FF8]();
}

uint64_t sub_1B0B8138C()
{
  return MEMORY[0x1F40FA220]();
}

uint64_t sub_1B0B8139C()
{
  return MEMORY[0x1F40FA230]();
}

uint64_t sub_1B0B813AC()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1B0B813BC()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1B0B813CC()
{
  return MEMORY[0x1F40FA2B8]();
}

uint64_t sub_1B0B813DC()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_1B0B813EC()
{
  return MEMORY[0x1F40FA350]();
}

uint64_t sub_1B0B813FC()
{
  return MEMORY[0x1F40FA3A0]();
}

uint64_t sub_1B0B8140C()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1B0B8141C()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1B0B8142C()
{
  return MEMORY[0x1F40FA458]();
}

uint64_t sub_1B0B8143C()
{
  return MEMORY[0x1F40FA470]();
}

uint64_t sub_1B0B8144C()
{
  return MEMORY[0x1F40FA690]();
}

uint64_t sub_1B0B8145C()
{
  return MEMORY[0x1F40FA6A0]();
}

uint64_t sub_1B0B8146C()
{
  return MEMORY[0x1F40FA6B8]();
}

uint64_t sub_1B0B8147C()
{
  return MEMORY[0x1F40FA758]();
}

uint64_t sub_1B0B8148C()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1B0B8149C()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1B0B814AC()
{
  return MEMORY[0x1F40FAAA8]();
}

uint64_t sub_1B0B814BC()
{
  return MEMORY[0x1F40FAAC0]();
}

uint64_t sub_1B0B814CC()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1B0B814DC()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1B0B814FC()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1B0B8150C()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1B0B8151C()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1B0B8153C()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1B0B8154C()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1B0B8155C()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1B0B8156C()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1B0B8157C()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1B0B8158C()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1B0B8159C()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1B0B815AC()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1B0B815BC()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1B0B815CC()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1B0B815DC()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1B0B815EC()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1B0B815FC()
{
  return MEMORY[0x1F40FAE58]();
}

uint64_t sub_1B0B8160C()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1B0B8161C()
{
  return MEMORY[0x1F40FAED8]();
}

uint64_t sub_1B0B8162C()
{
  return MEMORY[0x1F40FAEE0]();
}

uint64_t sub_1B0B8163C()
{
  return MEMORY[0x1F40FAF48]();
}

uint64_t sub_1B0B8164C()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1B0B8165C()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1B0B8166C()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1B0B8167C()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1B0B8168C()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_1B0B8169C()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1B0B816AC()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1B0B816BC()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1B0B816CC()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1B0B816DC()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_1B0B816EC()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_1B0B816FC()
{
  return MEMORY[0x1F40FB1B0]();
}

uint64_t sub_1B0B8170C()
{
  return MEMORY[0x1F40FB1C8]();
}

uint64_t sub_1B0B8171C()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1B0B8172C()
{
  return MEMORY[0x1F40FB270]();
}

uint64_t sub_1B0B8173C()
{
  return MEMORY[0x1F40FB2A8]();
}

uint64_t sub_1B0B8174C()
{
  return MEMORY[0x1F40FB2F0]();
}

uint64_t sub_1B0B8175C()
{
  return MEMORY[0x1F40FB2F8]();
}

uint64_t sub_1B0B8176C()
{
  return MEMORY[0x1F40FB3A0]();
}

uint64_t sub_1B0B8177C()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1B0B8178C()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1B0B8179C()
{
  return MEMORY[0x1F40FB418]();
}

uint64_t sub_1B0B817AC()
{
  return MEMORY[0x1F40FB438]();
}

uint64_t sub_1B0B817BC()
{
  return MEMORY[0x1F40FB440]();
}

uint64_t sub_1B0B817CC()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1B0B817DC()
{
  return MEMORY[0x1F40FB548]();
}

uint64_t sub_1B0B817EC()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1B0B817FC()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1B0B8180C()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1B0B8181C()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1B0B8182C()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1B0B8183C()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1B0B8184C()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1B0B8185C()
{
  return MEMORY[0x1F40FB6E0]();
}

uint64_t sub_1B0B8186C()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_1B0B8187C()
{
  return MEMORY[0x1F40FB728]();
}

uint64_t sub_1B0B8188C()
{
  return MEMORY[0x1F40FB758]();
}

uint64_t sub_1B0B8189C()
{
  return MEMORY[0x1F40FB7B0]();
}

uint64_t sub_1B0B818AC()
{
  return MEMORY[0x1F40FB8B0]();
}

uint64_t sub_1B0B818BC()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1B0B818CC()
{
  return MEMORY[0x1F40FBA58]();
}

uint64_t sub_1B0B818DC()
{
  return MEMORY[0x1F40FBA98]();
}

uint64_t sub_1B0B818EC()
{
  return MEMORY[0x1F40FBAA8]();
}

uint64_t sub_1B0B818FC()
{
  return MEMORY[0x1F40FBB30]();
}

uint64_t sub_1B0B8190C()
{
  return MEMORY[0x1F40FBB90]();
}

uint64_t sub_1B0B8191C()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1B0B8192C()
{
  return MEMORY[0x1F40FBDF8]();
}

uint64_t sub_1B0B8193C()
{
  return MEMORY[0x1F40FBEC0]();
}

uint64_t sub_1B0B8194C()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1B0B8195C()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_1B0B8196C()
{
  return MEMORY[0x1F40FC070]();
}

uint64_t sub_1B0B8197C()
{
  return MEMORY[0x1F40FC0A8]();
}

uint64_t sub_1B0B8198C()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1B0B8199C()
{
  return MEMORY[0x1F40FC150]();
}

uint64_t sub_1B0B819AC()
{
  return MEMORY[0x1F40FC180]();
}

uint64_t sub_1B0B819BC()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_1B0B819CC()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1B0B819DC()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1B0B819EC()
{
  return MEMORY[0x1F40FC2F0]();
}

uint64_t sub_1B0B819FC()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1B0B81A0C()
{
  return MEMORY[0x1F40FC338]();
}

uint64_t sub_1B0B81A1C()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1B0B81A2C()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1B0B81A3C()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1B0B81A4C()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1B0B81A5C()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1B0B81A6C()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_1B0B81A7C()
{
  return MEMORY[0x1F40FC4C8]();
}

uint64_t sub_1B0B81A8C()
{
  return MEMORY[0x1F40FC518]();
}

uint64_t sub_1B0B81A9C()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t _s7SwiftUI5ImageV05NotesB0EyACSo7UIImageCcfC_0()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1B0B81ABC()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1B0B81ACC()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1B0B81ADC()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_1B0B81AEC()
{
  return MEMORY[0x1F40FC5C0]();
}

uint64_t sub_1B0B81AFC()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1B0B81B0C()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1B0B81B1C()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1B0B81B2C()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1B0B81B3C()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1B0B81B4C()
{
  return MEMORY[0x1F40FC728]();
}

uint64_t sub_1B0B81B5C()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1B0B81B6C()
{
  return MEMORY[0x1F40FC7A0]();
}

uint64_t sub_1B0B81B7C()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1B0B81B8C()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1B0B81B9C()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1B0B81BAC()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1B0B81BBC()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1B0B81BCC()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1B0B81BDC()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_1B0B81BEC()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1B0B81BFC()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1B0B81C0C()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1B0B81C1C()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_1B0B81C2C()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1B0B81C3C()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_1B0B81C4C()
{
  return MEMORY[0x1F40FCEE0]();
}

uint64_t sub_1B0B81C5C()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1B0B81C6C()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1B0B81C7C()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1B0B81C8C()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B0B81C9C()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1B0B81CAC()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B0B81CBC()
{
  return MEMORY[0x1F4186D48]();
}

uint64_t sub_1B0B81CCC()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B0B81CDC()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1B0B81CEC()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1B0B81CFC()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1B0B81D0C()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1B0B81D1C()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1B0B81D2C()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1B0B81D3C()
{
  return MEMORY[0x1F413A080]();
}

uint64_t sub_1B0B81D4C()
{
  return MEMORY[0x1F413A088]();
}

uint64_t sub_1B0B81D5C()
{
  return MEMORY[0x1F413A090]();
}

uint64_t sub_1B0B81D6C()
{
  return MEMORY[0x1F413A098]();
}

uint64_t sub_1B0B81D7C()
{
  return MEMORY[0x1F413A0A0]();
}

uint64_t sub_1B0B81D8C()
{
  return MEMORY[0x1F413A0A8]();
}

uint64_t sub_1B0B81D9C()
{
  return MEMORY[0x1F413A0C0]();
}

uint64_t sub_1B0B81DAC()
{
  return MEMORY[0x1F413A0D0]();
}

uint64_t sub_1B0B81DBC()
{
  return MEMORY[0x1F413A0D8]();
}

uint64_t sub_1B0B81DDC()
{
  return MEMORY[0x1F413A0E8]();
}

uint64_t sub_1B0B81DEC()
{
  return MEMORY[0x1F413A108]();
}

uint64_t sub_1B0B81DFC()
{
  return MEMORY[0x1F413A118]();
}

uint64_t sub_1B0B81E0C()
{
  return MEMORY[0x1F413A120]();
}

uint64_t sub_1B0B81E1C()
{
  return MEMORY[0x1F413A128]();
}

uint64_t sub_1B0B81E2C()
{
  return MEMORY[0x1F413A130]();
}

uint64_t sub_1B0B81E3C()
{
  return MEMORY[0x1F413A138]();
}

uint64_t sub_1B0B81E4C()
{
  return MEMORY[0x1F413A140]();
}

uint64_t sub_1B0B81E5C()
{
  return MEMORY[0x1F413A148]();
}

uint64_t sub_1B0B81E6C()
{
  return MEMORY[0x1F413A158]();
}

uint64_t sub_1B0B81E7C()
{
  return MEMORY[0x1F413A160]();
}

uint64_t sub_1B0B81E9C()
{
  return MEMORY[0x1F413A170]();
}

uint64_t sub_1B0B81EAC()
{
  return MEMORY[0x1F413A178]();
}

uint64_t sub_1B0B81EBC()
{
  return MEMORY[0x1F413A180]();
}

uint64_t sub_1B0B81ECC()
{
  return MEMORY[0x1F413A188]();
}

uint64_t sub_1B0B81EDC()
{
  return MEMORY[0x1F413A190]();
}

uint64_t sub_1B0B81EEC()
{
  return MEMORY[0x1F413A198]();
}

uint64_t sub_1B0B81EFC()
{
  return MEMORY[0x1F413A1B0]();
}

uint64_t sub_1B0B81F0C()
{
  return MEMORY[0x1F413A1B8]();
}

uint64_t sub_1B0B81F1C()
{
  return MEMORY[0x1F410DD28]();
}

uint64_t sub_1B0B81F2C()
{
  return MEMORY[0x1F410DD30]();
}

uint64_t sub_1B0B81F3C()
{
  return MEMORY[0x1F410DD38]();
}

uint64_t sub_1B0B81F4C()
{
  return MEMORY[0x1F410DD40]();
}

uint64_t sub_1B0B81F5C()
{
  return MEMORY[0x1F410DD48]();
}

uint64_t sub_1B0B81F6C()
{
  return MEMORY[0x1F410DD50]();
}

uint64_t sub_1B0B81F7C()
{
  return MEMORY[0x1F410DD58]();
}

uint64_t sub_1B0B81F8C()
{
  return MEMORY[0x1F410DD60]();
}

uint64_t sub_1B0B81F9C()
{
  return MEMORY[0x1F410DD68]();
}

uint64_t sub_1B0B81FAC()
{
  return MEMORY[0x1F410DD70]();
}

uint64_t sub_1B0B81FBC()
{
  return MEMORY[0x1F410DD78]();
}

uint64_t sub_1B0B81FCC()
{
  return MEMORY[0x1F410DD80]();
}

uint64_t sub_1B0B81FDC()
{
  return MEMORY[0x1F410DD88]();
}

uint64_t sub_1B0B81FEC()
{
  return MEMORY[0x1F410DD90]();
}

uint64_t sub_1B0B81FFC()
{
  return MEMORY[0x1F410DD98]();
}

uint64_t sub_1B0B8200C()
{
  return MEMORY[0x1F410DDA0]();
}

uint64_t sub_1B0B8201C()
{
  return MEMORY[0x1F410DDA8]();
}

uint64_t sub_1B0B8202C()
{
  return MEMORY[0x1F410DDB0]();
}

uint64_t sub_1B0B8203C()
{
  return MEMORY[0x1F410DDB8]();
}

uint64_t sub_1B0B8204C()
{
  return MEMORY[0x1F410DDC0]();
}

uint64_t sub_1B0B8205C()
{
  return MEMORY[0x1F410DDC8]();
}

uint64_t sub_1B0B8206C()
{
  return MEMORY[0x1F410DDD0]();
}

uint64_t sub_1B0B8207C()
{
  return MEMORY[0x1F410DDE0]();
}

uint64_t sub_1B0B8208C()
{
  return MEMORY[0x1F410DDE8]();
}

uint64_t sub_1B0B8209C()
{
  return MEMORY[0x1F410DDF0]();
}

uint64_t sub_1B0B820AC()
{
  return MEMORY[0x1F410DDF8]();
}

uint64_t sub_1B0B820BC()
{
  return MEMORY[0x1F410DE00]();
}

uint64_t sub_1B0B820CC()
{
  return MEMORY[0x1F410DE08]();
}

uint64_t sub_1B0B820DC()
{
  return MEMORY[0x1F410DE10]();
}

uint64_t sub_1B0B820EC()
{
  return MEMORY[0x1F410DE18]();
}

uint64_t sub_1B0B820FC()
{
  return MEMORY[0x1F410DE20]();
}

uint64_t sub_1B0B8210C()
{
  return MEMORY[0x1F410DE28]();
}

uint64_t sub_1B0B8211C()
{
  return MEMORY[0x1F410DE30]();
}

uint64_t sub_1B0B8212C()
{
  return MEMORY[0x1F410DE38]();
}

uint64_t sub_1B0B8213C()
{
  return MEMORY[0x1F410DE40]();
}

uint64_t sub_1B0B8214C()
{
  return MEMORY[0x1F410DE48]();
}

uint64_t sub_1B0B8215C()
{
  return MEMORY[0x1F410DE50]();
}

uint64_t sub_1B0B8216C()
{
  return MEMORY[0x1F410DE58]();
}

uint64_t sub_1B0B8217C()
{
  return MEMORY[0x1F410DE60]();
}

uint64_t sub_1B0B8218C()
{
  return MEMORY[0x1F410DE68]();
}

uint64_t sub_1B0B8219C()
{
  return MEMORY[0x1F410DE80]();
}

uint64_t sub_1B0B821AC()
{
  return MEMORY[0x1F410DE88]();
}

uint64_t sub_1B0B821BC()
{
  return MEMORY[0x1F41122E8]();
}

uint64_t sub_1B0B821CC()
{
  return MEMORY[0x1F413A1C8]();
}

uint64_t sub_1B0B821DC()
{
  return MEMORY[0x1F4112510]();
}

uint64_t sub_1B0B821EC()
{
  return MEMORY[0x1F413A218]();
}

uint64_t sub_1B0B821FC()
{
  return MEMORY[0x1F413A220]();
}

uint64_t sub_1B0B8220C()
{
  return MEMORY[0x1F413A228]();
}

uint64_t sub_1B0B8221C()
{
  return MEMORY[0x1F413A230]();
}

uint64_t sub_1B0B8222C()
{
  return MEMORY[0x1F413A238]();
}

uint64_t sub_1B0B8223C()
{
  return MEMORY[0x1F413A240]();
}

uint64_t sub_1B0B8224C()
{
  return MEMORY[0x1F413A250]();
}

uint64_t sub_1B0B8225C()
{
  return MEMORY[0x1F4112550]();
}

uint64_t sub_1B0B8226C()
{
  return MEMORY[0x1F4112570]();
}

uint64_t sub_1B0B8227C()
{
  return MEMORY[0x1F4112578]();
}

uint64_t sub_1B0B8228C()
{
  return MEMORY[0x1F4112580]();
}

uint64_t sub_1B0B8229C()
{
  return MEMORY[0x1F41125B8]();
}

uint64_t sub_1B0B822AC()
{
  return MEMORY[0x1F4112600]();
}

uint64_t sub_1B0B822BC()
{
  return MEMORY[0x1F4112608]();
}

uint64_t sub_1B0B822CC()
{
  return MEMORY[0x1F40F46E0]();
}

uint64_t sub_1B0B822DC()
{
  return MEMORY[0x1F40F46E8]();
}

uint64_t sub_1B0B822EC()
{
  return MEMORY[0x1F40F46F0]();
}

uint64_t sub_1B0B822FC()
{
  return MEMORY[0x1F4104398]();
}

uint64_t sub_1B0B8230C()
{
  return MEMORY[0x1F41043B8]();
}

uint64_t sub_1B0B8231C()
{
  return MEMORY[0x1F41043C0]();
}

uint64_t sub_1B0B8232C()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B0B8233C()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B0B8234C()
{
  return MEMORY[0x1F4183340]();
}

uint64_t sub_1B0B8235C()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B0B8236C()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B0B8237C()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1B0B8238C()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B0B8239C()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1B0B823AC()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1B0B823BC()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B0B823CC()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B0B823DC()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1B0B823EC()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B0B823FC()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B0B8240C()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B0B8241C()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B0B8242C()
{
  return MEMORY[0x1F4139A00]();
}

uint64_t sub_1B0B8243C()
{
  return MEMORY[0x1F4139A08]();
}

uint64_t sub_1B0B8244C()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1B0B8245C()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B0B8246C()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B0B8247C()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B0B8248C()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1B0B8249C()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1B0B824AC()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1B0B824BC()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B0B824CC()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B0B824DC()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B0B824EC()
{
  return MEMORY[0x1F4183AD8]();
}

uint64_t sub_1B0B824FC()
{
  return MEMORY[0x1F4183AF0]();
}

uint64_t sub_1B0B8250C()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1B0B8251C()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1B0B8252C()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1B0B8253C()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1B0B8255C()
{
  return MEMORY[0x1F4139C08]();
}

uint64_t sub_1B0B8256C()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t sub_1B0B8257C()
{
  return MEMORY[0x1F4183D60]();
}

uint64_t sub_1B0B8258C()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1B0B8259C()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B0B825AC()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B0B825BC()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1B0B825CC()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B0B825DC()
{
  return MEMORY[0x1F4139A10]();
}

uint64_t sub_1B0B825EC()
{
  return MEMORY[0x1F4139A18]();
}

uint64_t sub_1B0B825FC()
{
  return MEMORY[0x1F4139A20]();
}

uint64_t sub_1B0B8260C()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B0B8261C()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B0B8262C()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B0B8263C()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B0B8264C()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B0B8265C()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B0B8266C()
{
  return MEMORY[0x1F413A258]();
}

uint64_t sub_1B0B8267C()
{
  return MEMORY[0x1F413A260]();
}

uint64_t sub_1B0B8268C()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B0B8269C()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1B0B826AC()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1B0B826BC()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B0B826CC()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B0B826DC()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1B0B826EC()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1B0B826FC()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B0B8270C()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B0B8271C()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1B0B8272C()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B0B8273C()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1B0B8274C()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1B0B8275C()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B0B8276C()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1B0B8277C()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1B0B8278C()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1B0B8279C()
{
  return MEMORY[0x1F4184290]();
}

uint64_t sub_1B0B827AC()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1B0B827BC()
{
  return MEMORY[0x1F4139A28]();
}

uint64_t sub_1B0B827CC()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1B0B827DC()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1B0B827EC()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1B0B827FC()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1B0B8280C()
{
  return MEMORY[0x1F4188468]();
}

uint64_t sub_1B0B8281C()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1B0B8282C()
{
  return MEMORY[0x1F4139A30]();
}

uint64_t sub_1B0B8283C()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B0B8284C()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B0B8285C()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B0B8286C()
{
  return MEMORY[0x1F4166510]();
}

uint64_t sub_1B0B8287C()
{
  return MEMORY[0x1F4166518]();
}

uint64_t sub_1B0B8288C()
{
  return MEMORY[0x1F4166530]();
}

uint64_t sub_1B0B8289C()
{
  return MEMORY[0x1F4166550]();
}

uint64_t sub_1B0B828AC()
{
  return MEMORY[0x1F4166558]();
}

uint64_t sub_1B0B828BC()
{
  return MEMORY[0x1F4166560]();
}

uint64_t sub_1B0B828CC()
{
  return MEMORY[0x1F4166568]();
}

uint64_t sub_1B0B828DC()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1B0B828EC()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B0B828FC()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1B0B8290C()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1B0B8291C()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1B0B8292C()
{
  return MEMORY[0x1F4187070]();
}

uint64_t sub_1B0B8293C()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1B0B8294C()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B0B8295C()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1B0B8296C()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1B0B8297C()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1B0B8298C()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B0B8299C()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1B0B829AC()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B0B829BC()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1B0B829CC()
{
  return MEMORY[0x1F41665E0]();
}

uint64_t sub_1B0B829DC()
{
  return MEMORY[0x1F4139A38]();
}

uint64_t sub_1B0B829EC()
{
  return MEMORY[0x1F4139A40]();
}

uint64_t sub_1B0B829FC()
{
  return MEMORY[0x1F4139A48]();
}

uint64_t sub_1B0B82A0C()
{
  return MEMORY[0x1F4139A50]();
}

uint64_t sub_1B0B82A1C()
{
  return MEMORY[0x1F4139A58]();
}

uint64_t sub_1B0B82A2C()
{
  return MEMORY[0x1F4139A60]();
}

uint64_t sub_1B0B82A3C()
{
  return MEMORY[0x1F40E6718]();
}

uint64_t sub_1B0B82A4C()
{
  return MEMORY[0x1F40E6740]();
}

uint64_t sub_1B0B82A5C()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1B0B82A6C()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1B0B82A7C()
{
  return MEMORY[0x1F4139A68]();
}

uint64_t sub_1B0B82A8C()
{
  return MEMORY[0x1F4139A70]();
}

uint64_t sub_1B0B82A9C()
{
  return MEMORY[0x1F4139A78]();
}

uint64_t sub_1B0B82AAC()
{
  return MEMORY[0x1F4139A80]();
}

uint64_t sub_1B0B82ABC()
{
  return MEMORY[0x1F4139A88]();
}

uint64_t sub_1B0B82ACC()
{
  return MEMORY[0x1F4139A90]();
}

uint64_t sub_1B0B82ADC()
{
  return MEMORY[0x1F4139A98]();
}

uint64_t sub_1B0B82AEC()
{
  return MEMORY[0x1F4139AA0]();
}

uint64_t sub_1B0B82AFC()
{
  return MEMORY[0x1F4139AA8]();
}

uint64_t sub_1B0B82B0C()
{
  return MEMORY[0x1F4139AB0]();
}

uint64_t sub_1B0B82B1C()
{
  return MEMORY[0x1F4139AB8]();
}

uint64_t sub_1B0B82B2C()
{
  return MEMORY[0x1F4139AC0]();
}

uint64_t sub_1B0B82B3C()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1B0B82B4C()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1B0B82B5C()
{
  return MEMORY[0x1F4166658]();
}

uint64_t sub_1B0B82B6C()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1B0B82B7C()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1B0B82B8C()
{
  return MEMORY[0x1F4139AC8]();
}

uint64_t sub_1B0B82B9C()
{
  return MEMORY[0x1F4139AD0]();
}

uint64_t sub_1B0B82BAC()
{
  return MEMORY[0x1F4139AD8]();
}

uint64_t sub_1B0B82BBC()
{
  return MEMORY[0x1F4139AE0]();
}

uint64_t sub_1B0B82BCC()
{
  return MEMORY[0x1F4139AE8]();
}

uint64_t sub_1B0B82BEC()
{
  return MEMORY[0x1F4139AF8]();
}

uint64_t sub_1B0B82C0C()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_1B0B82C1C()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1B0B82C2C()
{
  return MEMORY[0x1F41666B0]();
}

uint64_t sub_1B0B82C3C()
{
  return MEMORY[0x1F4166730]();
}

uint64_t sub_1B0B82C4C()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1B0B82C5C()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1B0B82C6C()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1B0B82C7C()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B0B82C8C()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B0B82C9C()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1B0B82CAC()
{
  return MEMORY[0x1F4139B08]();
}

uint64_t sub_1B0B82CBC()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1B0B82CCC()
{
  return MEMORY[0x1F40E6940]();
}

uint64_t sub_1B0B82CDC()
{
  return MEMORY[0x1F40E6948]();
}

uint64_t sub_1B0B82CEC()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1B0B82CFC()
{
  return MEMORY[0x1F4139B10]();
}

uint64_t sub_1B0B82D0C()
{
  return MEMORY[0x1F4139B18]();
}

uint64_t sub_1B0B82D1C()
{
  return MEMORY[0x1F4139B20]();
}

uint64_t sub_1B0B82D2C()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1B0B82D3C()
{
  return MEMORY[0x1F40E6AB0]();
}

uint64_t sub_1B0B82D4C()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1B0B82D5C()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1B0B82D6C()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1B0B82D7C()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B0B82D8C()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1B0B82D9C()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1B0B82DAC()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B0B82DBC()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B0B82DCC()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1B0B82DDC()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B0B82DEC()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1B0B82DFC()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1B0B82E0C()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B0B82E1C()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B0B82E2C()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B0B82E3C()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1B0B82E4C()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1B0B82E5C()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B0B82E6C()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1B0B82E7C()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1B0B82E8C()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1B0B82E9C()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1B0B82EAC()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1B0B82EBC()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1B0B82ECC()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1B0B82EDC()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B0B82EEC()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1B0B82EFC()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1B0B82F0C()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1B0B82F1C()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B0B82F2C()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B0B82F3C()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1B0B82F4C()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B0B82F5C()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B0B82F6C()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1B0B82F7C()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B0B82F8C()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B0B82F9C()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B0B82FAC()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B0B82FBC()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_1B0B82FCC()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1B0B82FDC()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1B0B82FEC()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1B0B82FFC()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B0B8300C()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1B0B8301C()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1B0B8302C()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1B0B8303C()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B0B8304C()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1B0B8305C()
{
  return MEMORY[0x1F4184E10]();
}

uint64_t sub_1B0B8306C()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1B0B8307C()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B0B8308C()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B0B8309C()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B0B830AC()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1B0B830BC()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1B0B830CC()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B0B830DC()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B0B830EC()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1B0B830FC()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1B0B8310C()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1B0B8311C()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t sub_1B0B8312C()
{
  return MEMORY[0x1F4185030]();
}

uint64_t sub_1B0B8313C()
{
  return MEMORY[0x1F4185038]();
}

uint64_t sub_1B0B8314C()
{
  return MEMORY[0x1F4185040]();
}

uint64_t sub_1B0B8315C()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B0B8316C()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B0B8317C()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1B0B8318C()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1B0B8319C()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B0B831AC()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1B0B831BC()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B0B831CC()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B0B831DC()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B0B831EC()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1B0B831FC()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B0B8320C()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B0B8321C()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1B0B8322C()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B0B8323C()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B0B8324C()
{
  return MEMORY[0x1F4185410]();
}

uint64_t sub_1B0B8326C()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1B0B8327C()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B0B8328C()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B0B8329C()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1B0B832AC()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1B0B832BC()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1B0B832CC()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B0B832DC()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1B0B832EC()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1B0B832FC()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B0B8330C()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1B0B8331C()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1B0B8332C()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1B0B8333C()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B0B8334C()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B0B8335C()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B0B8337C()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B0B8338C()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1B0B8339C()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B0B833AC()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1B0B833CC()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1B0B833DC()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B0B833EC()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B0B833FC()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B0B8342C()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1B0B8343C()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B0B8344C()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B0B8345C()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B0B8346C()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B0B8348C()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1B0B8349C()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B0B834AC()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B0B834BC()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1B0B834CC()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1B0B834DC()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1B0B834EC()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B0B834FC()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1B0B8350C()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1B0B8351C()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1B0B8352C()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1B0B8353C()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1B0B8354C()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1B0B8355C()
{
  return MEMORY[0x1F4185FA0]();
}

uint64_t sub_1B0B8356C()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B0B8357C()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1B0B835AC()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1B0B835BC()
{
  return MEMORY[0x1F41881A8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D8688](string, range.location, range.length);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9860](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
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

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x1F40D9EC0]();
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x1F40D9F78](c);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
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

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1F40DA100]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8A0](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1F40DA9B0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACA0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CGPDFPageCopyString()
{
  return MEMORY[0x1F40DAD70]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x1F40DAD98](retstr, page, *(void *)&box, *(void *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1F40DB4D8]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1F40DB968](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1F40DF420]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t DDShouldUseLightLinksForResult()
{
  return MEMORY[0x1F41173A0]();
}

uint64_t ICCGColorCreateWithString()
{
  return MEMORY[0x1F4139C20]();
}

uint64_t ICCGColorEquivalentToColor()
{
  return MEMORY[0x1F4139C28]();
}

uint64_t ICCheckedDynamicCast()
{
  return MEMORY[0x1F4139C30]();
}

uint64_t ICCheckedProtocolCast()
{
  return MEMORY[0x1F4139C38]();
}

uint64_t ICCipherNameForCipherVersion()
{
  return MEMORY[0x1F4139B28]();
}

uint64_t ICClassAndProtocolCast()
{
  return MEMORY[0x1F4139C40]();
}

uint64_t ICDataFromCGImage()
{
  return MEMORY[0x1F4139C48]();
}

uint64_t ICDebugModeEnabled()
{
  return MEMORY[0x1F4139C58]();
}

uint64_t ICDynamicCast()
{
  return MEMORY[0x1F4139C60]();
}

uint64_t ICGenericError()
{
  return MEMORY[0x1F4139C70]();
}

uint64_t ICInternalSettingsDefaultToPaperKitPDFsAndScans()
{
  return MEMORY[0x1F4139C88]();
}

uint64_t ICInternalSettingsGetBundleBoolSettingValue()
{
  return MEMORY[0x1F4139C98]();
}

uint64_t ICInternalSettingsIsAlexandriaDemoModeEnabled()
{
  return MEMORY[0x1F4139CA0]();
}

uint64_t ICInternalSettingsIsAppleAccountBrandingEnabled()
{
  return MEMORY[0x1F4139CA8]();
}

uint64_t ICInternalSettingsIsAudioTranscriptionEnabled()
{
  return MEMORY[0x1F4139CB8]();
}

uint64_t ICInternalSettingsIsBlockQuoteEnabled()
{
  return MEMORY[0x1F4139CC0]();
}

uint64_t ICInternalSettingsIsCollapsibleSectionsEnabled()
{
  return MEMORY[0x1F4139CC8]();
}

uint64_t ICInternalSettingsIsEmphasisEnabled()
{
  return MEMORY[0x1F4139CD0]();
}

uint64_t ICInternalSettingsIsLinkConversionEnabled()
{
  return MEMORY[0x1F4139CD8]();
}

uint64_t ICInternalSettingsIsMathDebugHighlightingEnabled()
{
  return MEMORY[0x1F4139CE8]();
}

uint64_t ICInternalSettingsIsMathEnabled()
{
  return MEMORY[0x1F4139CF0]();
}

uint64_t ICInternalSettingsIsPDFsInNotesEnabled()
{
  return MEMORY[0x1F4139D08]();
}

uint64_t ICInternalSettingsIsSpotlightInstantAnswersEnabled()
{
  return MEMORY[0x1F4139D18]();
}

uint64_t ICInternalSettingsIsTextKit2Enabled()
{
  return MEMORY[0x1F4139D28]();
}

uint64_t ICIsNotesURLScheme()
{
  return MEMORY[0x1F4139B30]();
}

uint64_t ICIsSandboxModeEnabled()
{
  return MEMORY[0x1F4139D48]();
}

uint64_t ICJPEGDataFromCGImage()
{
  return MEMORY[0x1F4139D50]();
}

uint64_t ICKeyPathFromSelector()
{
  return MEMORY[0x1F4139D58]();
}

uint64_t ICKeyPathFromSelectors()
{
  return MEMORY[0x1F4139D60]();
}

uint64_t ICLegacyEntityNameFolder()
{
  return MEMORY[0x1F4139B38]();
}

uint64_t ICLegacyEntityNameNote()
{
  return MEMORY[0x1F4139B40]();
}

uint64_t ICLocalizedStringFromICTagSelectionOperator()
{
  return MEMORY[0x1F4139B48]();
}

uint64_t ICNoteHTMLFromPlainText()
{
  return MEMORY[0x1F4139B58]();
}

uint64_t ICNoteTitleFromPlainText()
{
  return MEMORY[0x1F4139B60]();
}

uint64_t ICNotesAppURLScheme()
{
  return MEMORY[0x1F4139B68]();
}

uint64_t ICPNGDataFromCGImage()
{
  return MEMORY[0x1F4139D70]();
}

uint64_t ICProtocolCast()
{
  return MEMORY[0x1F4139D78]();
}

uint64_t ICRectEdgeAtIndex()
{
  return MEMORY[0x1F4139D80]();
}

uint64_t ICStringForDocumentMergeControllingReason()
{
  return MEMORY[0x1F4139B70]();
}

uint64_t ICStringFromCGColor()
{
  return MEMORY[0x1F4139DA0]();
}

uint64_t ICStringFromRect()
{
  return MEMORY[0x1F4139DA8]();
}

uint64_t ICTTNamedStyleIsList()
{
  return MEMORY[0x1F4139B78]();
}

uint64_t ICTransformFromImageOrientation()
{
  return MEMORY[0x1F4139B80]();
}

uint64_t ICUIFrameworkBundleIdentifier()
{
  return MEMORY[0x1F4139DB8]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromAccountDataLockedNotesMode()
{
  return MEMORY[0x1F4139B88]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NotesAppURLForNoteIdentifierOrTokenContentIdentifier()
{
  return MEMORY[0x1F4139B98]();
}

uint64_t PFSceneTaxonomyFillNodeData()
{
  return MEMORY[0x1F41407A8]();
}

uint64_t PFSceneTaxonomyNodeLocalizedLabel()
{
  return MEMORY[0x1F41407D8]();
}

uint64_t PFSceneTaxonomyNodeLocalizedSynonyms()
{
  return MEMORY[0x1F41407E0]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x1F41407F8]();
}

uint64_t PFSceneTaxonomyNodeVisitParents()
{
  return MEMORY[0x1F4140810]();
}

uint64_t PKIsInlineDrawingOrPaperAttachment()
{
  return MEMORY[0x1F40F46F8]();
}

uint64_t TSDDistance()
{
  return MEMORY[0x1F4139DD8]();
}

uint64_t TSDMultiplySizeScalar()
{
  return MEMORY[0x1F4139DE0]();
}

uint64_t TSDScaleSizeWithinSize()
{
  return MEMORY[0x1F4139DF0]();
}

uint64_t TSDShrinkSizeToFitInSize()
{
  return MEMORY[0x1F4139DF8]();
}

uint64_t TSUClampRange()
{
  return MEMORY[0x1F4139E00]();
}

uint64_t TSUColorLightness()
{
  return MEMORY[0x1F4139E10]();
}

uint64_t TSUCreateRGBABitmapContext()
{
  return MEMORY[0x1F4139E18]();
}

uint64_t TSUDeviceRGBColorSpace()
{
  return MEMORY[0x1F4139E20]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1F4166AD8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4166B38]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x1F4165068]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4166BE0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void UIRectFill(CGRect rect)
{
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1F4178968]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1F4178A18]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x1F4178AD8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x1F4165080]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4166FA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
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

void bzero(void *a1, size_t a2)
{
}

uint64_t dispatchMainAfterDelay()
{
  return MEMORY[0x1F4139E28]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t performBlockOnMainThread()
{
  return MEMORY[0x1F4139E30]();
}

uint64_t performBlockOnMainThreadAndWait()
{
  return MEMORY[0x1F4139E38]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}