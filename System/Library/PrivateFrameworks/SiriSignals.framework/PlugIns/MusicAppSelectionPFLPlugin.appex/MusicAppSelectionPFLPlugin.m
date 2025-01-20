void sub_100003C70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned char *v18;
  uint64_t v19;

  v3 = v2;
  v6 = (void *)sub_100017400();
  v7 = [v6 error];
  if (v7)
  {

    if (qword_100020B20 != -1) {
      swift_once();
    }
    v8 = sub_100017250();
    sub_10000471C(v8, (uint64_t)qword_100022C60);
    v9 = v6;
    swift_bridgeObjectRetain_n();
    v10 = v9;
    v11 = sub_100017230();
    v12 = sub_100017430();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = (void *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_100006A54(a1, a2, &v19);
      sub_100017450();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2112;
      if ([v10 error])
      {
        v15 = _swift_stdlib_bridgeErrorToNSError();
        sub_100017450();
      }
      else
      {
        sub_100017450();
        v15 = 0;
      }
      *v14 = v15;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error executing %s in Biome: %@", (uint8_t *)v13, 0x16u);
      sub_1000047A8(&qword_100020C70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v17 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    sub_100004754();
    swift_allocError();
    *v18 = 0;
    swift_willThrow();
  }
  else
  {
    v16 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v6;
  }
}

NSObject *sub_100003FB4()
{
  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = [v1 error];
    if (v2)
    {
      v3 = v2;
      if (qword_100020B20 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_100017250();
      sub_10000471C(v4, (uint64_t)qword_100022C60);
      v5 = v3;
      v6 = sub_100017230();
      os_log_type_t v7 = sub_100017430();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = (void *)swift_slowAlloc();
        *(_DWORD *)v8 = 138412290;
        v10 = v5;
        uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
        sub_100017450();
        void *v9 = v21;

        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error in fetching row: %@", v8, 0xCu);
        sub_1000047A8(&qword_100020C70);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      sub_100004754();
      swift_allocError();
      unsigned char *v19 = 0;
      swift_willThrow();

      return v5;
    }
    v11 = *(void **)(v0 + 16);
    if (v11)
    {
      id v12 = [v11 row];
      if (v12)
      {
        v13 = v12;
        uint64_t v14 = sub_100017290();

        v5 = sub_1000042F4(v14);
        swift_bridgeObjectRelease();
        if (v5) {
          return v5;
        }
      }
    }
  }
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_100017250();
  sub_10000471C(v15, (uint64_t)qword_100022C60);
  v5 = sub_100017230();
  os_log_type_t v16 = sub_100017420();
  if (os_log_type_enabled(v5, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v16, "Row cannot be converted into SiriPrivateLearningPFLBiomeSQLRow", v17, 2u);
    swift_slowDealloc();
  }

  sub_100004754();
  swift_allocError();
  unsigned char *v18 = 1;
  swift_willThrow();
  return v5;
}

unint64_t sub_1000042F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000047A8(&qword_100020C78);
    id v2 = (void *)sub_100017530();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_100004904();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1000047EC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_100004848(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1000047EC((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_1000048A4((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_100004904();
      swift_release();
      return 0;
    }
    sub_100004848((uint64_t)v31 + 8, (uint64_t)v25);
    sub_1000048A4((uint64_t)v30);
    sub_10000490C(v25, v26);
    long long v27 = v24;
    sub_10000490C(v26, v28);
    long long v16 = v27;
    sub_10000490C(v28, v29);
    sub_10000490C(v29, &v27);
    unint64_t result = sub_1000070AC(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_10000491C((uint64_t)v9);
      unint64_t result = (unint64_t)sub_10000490C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_10000490C(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1000046B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BiomeSQLClient()
{
  return self;
}

uint64_t sub_10000471C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100004754()
{
  unint64_t result = qword_100020C68;
  if (!qword_100020C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C68);
  }
  return result;
}

uint64_t sub_1000047A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000047EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100004848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000048A4(uint64_t a1)
{
  uint64_t v2 = sub_1000047A8(&qword_100020C80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004904()
{
  return swift_release();
}

_OWORD *sub_10000490C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000491C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000496C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000047A8(&qword_100020C78);
  uint64_t v2 = sub_100017530();
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
    sub_100008CEC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000070AC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000490C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_100004A98(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000047A8(&qword_100020F20);
  uint64_t v2 = (void *)sub_100017530();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000070AC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
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

unint64_t sub_100004BAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v44 = 0u;
    long long v45 = 0u;
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = v4[7];
  uint64_t v7 = v4[8];
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000070AC(v6, v7);
  if ((v9 & 1) == 0)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_100004848(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v44);
  swift_bridgeObjectRelease();
  if (!*((void *)&v45 + 1))
  {
LABEL_11:
    sub_1000094D4((uint64_t)&v44);
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    unint64_t result = sub_1000050E4(a1);
    if (!v3)
    {
      uint64_t v12 = result;
      int v13 = v11;
      uint64_t v14 = v4 + 2;
      swift_beginAccess();
      uint64_t v15 = v4[2];
      if (*(void *)(v15 + 16) && (unint64_t v16 = sub_100007124(v43), (v17 & 1) != 0))
      {
        uint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
        swift_retain();
        swift_retain();
        sub_1000065F4(v12);
        swift_release();
        uint64_t v32 = (void *)(v18 + 24);
        swift_beginAccess();
        v33 = *(void **)(v18 + 24);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v18 + 24) = v33;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v33 = sub_100006944(0, v33[2] + 1, 1, v33);
          *uint64_t v32 = v33;
        }
        unint64_t v35 = v33[2];
        unint64_t v36 = v33[3];
        unint64_t v37 = v35 + 1;
        if (v35 >= v36 >> 1)
        {
          unint64_t v42 = v35 + 1;
          v39 = v33;
          unint64_t v40 = v33[2];
          v41 = sub_100006944((void *)(v36 > 1), v35 + 1, 1, v39);
          unint64_t v35 = v40;
          unint64_t v37 = v42;
          v33 = v41;
          *uint64_t v32 = v41;
        }
        _OWORD v33[2] = v37;
        *((_DWORD *)v33 + v35 + 8) = v13;
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        swift_retain();
        char v38 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v14;
        *uint64_t v14 = 0x8000000000000000;
        sub_1000078A8(v18, v43, v38);
        *uint64_t v14 = v46;
        swift_bridgeObjectRelease();
        swift_endAccess();
        return swift_release();
      }
      else
      {
        if (qword_100020B20 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_100017250();
        sub_10000471C(v24, (uint64_t)qword_100022C60);
        v25 = sub_100017230();
        os_log_type_t v26 = sub_100017420();
        if (os_log_type_enabled(v25, v26))
        {
          long long v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)long long v27 = 134217984;
          sub_100017450();
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "Initializing training data for aggregating value %ld", v27, 0xCu);
          swift_slowDealloc();
        }

        sub_1000047A8(&qword_100020F08);
        uint64_t v28 = swift_allocObject();
        sub_1000047A8(&qword_100020F10);
        v29 = (void *)swift_allocObject();
        v29[3] = 1;
        v29[4] = *(void *)(v12 + 16);
        _OWORD v29[2] = v12;
        *(void *)(v28 + 16) = v29;
        sub_1000047A8(&qword_100020EB8);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_100017C60;
        *(_DWORD *)(v30 + 32) = v13;
        *(void *)(v28 + 24) = v30;
        swift_beginAccess();
        char v31 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v14;
        *uint64_t v14 = 0x8000000000000000;
        sub_1000078A8(v28, v43, v31);
        *uint64_t v14 = v46;
        swift_bridgeObjectRelease();
        return swift_endAccess();
      }
    }
    return result;
  }
LABEL_12:
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_100017250();
  sub_10000471C(v19, (uint64_t)qword_100022C60);
  BOOL v20 = sub_100017230();
  os_log_type_t v21 = sub_100017430();
  if (os_log_type_enabled(v20, v21))
  {
    int64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "aggregatingValue not found.", v22, 2u);
    swift_slowDealloc();
  }

  sub_100007FF4();
  swift_allocError();
  *uint64_t v23 = 2;
  return swift_willThrow();
}

unint64_t sub_1000050E4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1[9] + 16);
  if (!v4)
  {
    unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_22:
    uint64_t v19 = v2[10];
    unint64_t v18 = v2[11];
    if (*(void *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_1000070AC(v19, v18);
      if (v21)
      {
        sub_100004848(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v43);
      }
      else
      {
        long long v43 = 0u;
        long long v44 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v44 + 1))
      {
        sub_10000490C(&v43, v45);
        unint64_t v22 = sub_10000906C((uint64_t)v45);
        sub_10000491C((uint64_t)v45);
        if ((v22 & 0x100000000) == 0) {
          return v8;
        }
        swift_bridgeObjectRelease();
LABEL_32:
        if (qword_100020B20 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_100017250();
        sub_10000471C(v23, (uint64_t)qword_100022C60);
        swift_bridgeObjectRetain_n();
        swift_retain();
        uint64_t v24 = sub_100017230();
        os_log_type_t v25 = sub_100017430();
        unint64_t v8 = v25;
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = swift_slowAlloc();
          *(void *)&v45[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)&long long v43 = sub_100006A54(v19, v18, (uint64_t *)v45);
          sub_100017450();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_1000172A0();
          unint64_t v29 = v28;
          swift_bridgeObjectRelease();
          *(void *)&long long v43 = sub_100006A54(v27, v29, (uint64_t *)v45);
          sub_100017450();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v8, "Couldn't find %s value in %s", (uint8_t *)v26, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
LABEL_42:
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release();
        }
        goto LABEL_43;
      }
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1000094D4((uint64_t)&v43);
    goto LABEL_32;
  }
  unint64_t v42 = v1;
  uint64_t v6 = v1[10];
  uint64_t v5 = v1[11];
  uint64_t v7 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v10 = *(v7 - 1);
    unint64_t v9 = *v7;
    BOOL v11 = v10 == v6 && v9 == v5;
    if (v11 || (sub_100017640() & 1) != 0) {
      goto LABEL_4;
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    swift_bridgeObjectRetain_n();
    unint64_t v12 = sub_1000070AC(v10, v9);
    if (v13)
    {
      sub_100004848(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v43);
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v44 + 1)) {
      goto LABEL_38;
    }
    sub_10000490C(&v43, v45);
    unint64_t v14 = sub_10000906C((uint64_t)v45);
    if ((v14 & 0x100000000) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020B20 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_100017250();
      sub_10000471C(v37, (uint64_t)qword_100022C60);
      swift_bridgeObjectRetain();
      char v38 = sub_100017230();
      os_log_type_t v39 = sub_100017430();
      if (os_log_type_enabled(v38, v39))
      {
        unint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v43 = swift_slowAlloc();
        *(_DWORD *)unint64_t v40 = 136315138;
        unint64_t v8 = (unint64_t)(v40 + 12);
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_100006A54(v10, v9, (uint64_t *)&v43);
        sub_100017450();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Unable to convert value for %s to float", v40, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_100007FF4();
      swift_allocError();
      unsigned char *v41 = 4;
      swift_willThrow();
      sub_10000491C((uint64_t)v45);
      return v8;
    }
    int v15 = v14;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v8 = (unint64_t)sub_100006944(0, *(void *)(v8 + 16) + 1, 1, (void *)v8);
    }
    unint64_t v17 = *(void *)(v8 + 16);
    unint64_t v16 = *(void *)(v8 + 24);
    if (v17 >= v16 >> 1) {
      unint64_t v8 = (unint64_t)sub_100006944((void *)(v16 > 1), v17 + 1, 1, (void *)v8);
    }
    *(void *)(v8 + 16) = v17 + 1;
    *(_DWORD *)(v8 + 4 * v17 + 32) = v15;
    sub_10000491C((uint64_t)v45);
LABEL_4:
    v7 += 2;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v42;
      goto LABEL_22;
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  swift_bridgeObjectRetain();
LABEL_38:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000094D4((uint64_t)&v43);
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100017250();
  sub_10000471C(v30, (uint64_t)qword_100022C60);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_100017230();
  os_log_type_t v31 = sub_100017430();
  if (os_log_type_enabled(v24, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    *(void *)&v45[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v43 = sub_100006A54(v10, v9, (uint64_t *)v45);
    sub_100017450();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_1000172A0();
    unint64_t v8 = v34;
    swift_bridgeObjectRelease();
    *(void *)&long long v43 = sub_100006A54(v33, v8, (uint64_t *)v45);
    sub_100017450();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v31, "Couldn't find %s value in %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_42;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
LABEL_43:
  sub_100007FF4();
  swift_allocError();
  *unint64_t v35 = 4;
  swift_willThrow();
  return v8;
}

uint64_t sub_10000592C()
{
  v56 = *(void **)(v0[9] + 16);
  swift_beginAccess();
  v52 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_100007F0C(v2);
  swift_bridgeObjectRelease();
  v57[0] = v3;
  swift_bridgeObjectRetain();
  sub_100007EA0(v57);
  if (v1)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    swift_release();
    uint64_t v4 = v57[0];
    uint64_t v5 = v57[0][2];
    if (v5)
    {
      uint64_t v6 = 40;
      v51 = v57[0];
      while (1)
      {
        uint64_t v7 = *(void *)((char *)v4 + v6);
        uint64_t v8 = *(void *)(v7 + 16);
        unint64_t v9 = *(void **)(v8 + 32);
        if (v9 != v56) {
          break;
        }
        uint64_t v53 = v6;
        uint64_t v54 = v5;
        swift_beginAccess();
        uint64_t v10 = *(void **)(v8 + 16);
        swift_retain();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v8 + 16) = v10;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v10 = sub_100008C9C(v10);
        }
        *(void *)(v8 + 16) = v10;
        swift_endAccess();
        swift_release();
        swift_beginAccess();
        unint64_t v12 = *(void **)(v7 + 24);
        char v13 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v7 + 24) = v12;
        if ((v13 & 1) == 0) {
          unint64_t v12 = sub_100008C9C(v12);
        }
        v55 = v10 + 4;
        *(void *)(v7 + 24) = v12;
        swift_endAccess();
        sub_1000047A8(&qword_100020E88);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_100017C70;
        *(NSNumber *)(v14 + 32) = sub_1000173F0();
        *(NSNumber *)(v14 + 40) = sub_1000173F0();
        v57[0] = (void *)v14;
        sub_100017360();
        uint64_t v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_100017C70;
        *(NSNumber *)(v15 + 32) = sub_1000173F0();
        *(NSNumber *)(v15 + 40) = sub_1000173F0();
        v57[0] = (void *)v15;
        sub_100017360();
        id v16 = objc_allocWithZone((Class)MLMultiArray);
        sub_100008CB0(0, &qword_100020E90);
        Class isa = sub_100017340().super.isa;
        swift_bridgeObjectRelease();
        Class v18 = sub_100017340().super.isa;
        swift_bridgeObjectRelease();
        v57[0] = 0;
        id v19 = [v16 initWithDataPointer:v55 shape:isa dataType:65568 strides:v18 deallocator:0 error:v57];

        unint64_t v20 = v57[0];
        if (!v19)
        {
          uint64_t v4 = v57[0];
          sub_100017180();

          swift_willThrow();
          swift_release();
LABEL_23:
          swift_bridgeObjectRelease();
          if (qword_100020B20 != -1) {
            swift_once();
          }
          uint64_t v41 = sub_100017250();
          sub_10000471C(v41, (uint64_t)qword_100022C60);
          swift_errorRetain();
          swift_errorRetain();
          unint64_t v42 = sub_100017230();
          os_log_type_t v43 = sub_100017430();
          if (os_log_type_enabled(v42, v43))
          {
            long long v44 = (uint8_t *)swift_slowAlloc();
            long long v45 = (void *)swift_slowAlloc();
            *(_DWORD *)long long v44 = 138412290;
            uint64_t v4 = v44 + 12;
            swift_errorRetain();
            uint64_t v46 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v57[0] = v46;
            sub_100017450();
            *long long v45 = v46;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "Error forming MLBatchProvider: %@", v44, 0xCu);
            sub_1000047A8(&qword_100020C70);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_errorRelease();
            swift_errorRelease();
          }

          sub_100007FF4();
          swift_allocError();
          unsigned char *v47 = 6;
          swift_willThrow();
          swift_errorRelease();
          goto LABEL_29;
        }
        uint64_t v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_100017C80;
        unint64_t v22 = v20;
        *(NSNumber *)(v21 + 32) = sub_1000173F0();
        v57[0] = (void *)v21;
        sub_100017360();
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_100017C80;
        *(NSNumber *)(v23 + 32) = sub_100017440(1);
        v57[0] = (void *)v23;
        sub_100017360();
        id v24 = objc_allocWithZone((Class)MLMultiArray);
        Class v25 = sub_100017340().super.isa;
        swift_bridgeObjectRelease();
        Class v26 = sub_100017340().super.isa;
        swift_bridgeObjectRelease();
        v57[0] = 0;
        id v27 = [v24 initWithDataPointer:v12 + 4 shape:v25 dataType:65568 strides:v26 deallocator:0 error:v57];

        unint64_t v28 = v57[0];
        if (!v27)
        {
          uint64_t v4 = v57[0];
          sub_100017180();

          swift_willThrow();
          swift_release();

          goto LABEL_23;
        }
        sub_1000047A8(&qword_100020E98);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100017C90;
        uint64_t v30 = v52[4];
        *(void *)(inited + 32) = v52[3];
        *(void *)(inited + 40) = v30;
        uint64_t v31 = sub_100008CB0(0, &qword_100020EA0);
        *(void *)(inited + 72) = v31;
        *(void *)(inited + 48) = v19;
        uint64_t v32 = v52[6];
        *(void *)(inited + 80) = v52[5];
        *(void *)(inited + 88) = v32;
        *(void *)(inited + 120) = v31;
        *(void *)(inited + 96) = v27;
        uint64_t v33 = v28;
        swift_bridgeObjectRetain();
        id v34 = v19;
        swift_bridgeObjectRetain();
        id v35 = v27;
        sub_10000496C(inited);
        id v36 = objc_allocWithZone((Class)MLDictionaryFeatureProvider);
        sub_10000685C();
        uint64_t v4 = v51;
        sub_100017330();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100017370();
        }
        sub_100017390();
        sub_100017360();
        swift_release();

        uint64_t v6 = v53 + 16;
        uint64_t v5 = v54 - 1;
        if (v54 == 1) {
          goto LABEL_14;
        }
      }
      swift_retain();
      swift_release();
      swift_bridgeObjectRelease();
      if (qword_100020B20 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_100017250();
      sub_10000471C(v37, (uint64_t)qword_100022C60);
      char v38 = sub_100017230();
      os_log_type_t v39 = sub_100017430();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v4 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v4 = 134218240;
        v57[0] = v9;
        sub_100017450();
        *((_WORD *)v4 + 6) = 2048;
        v57[0] = v56;
        sub_100017450();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Mismatch in number of columns in trainingData %ld and number of features in arg %ld", (uint8_t *)v4, 0x16u);
        swift_slowDealloc();
      }

      sub_100007FF4();
      swift_allocError();
      *unint64_t v40 = 5;
      swift_willThrow();
LABEL_29:
      swift_release();
    }
    else
    {
LABEL_14:
      swift_release();
      id v48 = objc_allocWithZone((Class)MLArrayBatchProvider);
      sub_1000047A8(&qword_100020EA8);
      Class v49 = sub_100017340().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v4 = [v48 initWithFeatureProviderArray:v49];
    }
    return (uint64_t)v4;
  }
  return result;
}

uint64_t sub_10000627C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BiomeSQLRowAggregator()
{
  return self;
}

uint64_t sub_100006304()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100006358(uint64_t a1, uint64_t a2)
{
  type metadata accessor for InputMatrix();
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_retain();
  swift_retain();
  BOOL v6 = sub_100006464(v4, v5);
  swift_release();
  swift_release();
  if (v6)
  {
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v7 = sub_1000173A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

BOOL sub_100006464(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_1000173A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v4 & 1) != 0 && *(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32);
}

uint64_t sub_100006538()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TrainingData()
{
  return sub_100009638();
}

uint64_t sub_100006590()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000065E8(uint64_t *a1, uint64_t *a2)
{
  return sub_100006358(*a1, *a2);
}

uint64_t sub_1000065F4(uint64_t a1)
{
  if (*(void *)(a1 + 16) == *(void *)(v1 + 32))
  {
    swift_beginAccess();
    uint64_t v2 = swift_bridgeObjectRetain();
    sub_1000066B8(v2);
    uint64_t result = swift_endAccess();
    uint64_t v4 = *(void *)(v1 + 24);
    BOOL v5 = __OFADD__(v4, 1);
    uint64_t v6 = v4 + 1;
    if (v5) {
      __break(1u);
    }
    else {
      *(void *)(v1 + 24) = v6;
    }
  }
  else
  {
    sub_100007FF4();
    swift_allocError();
    *char v7 = 3;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1000066B8(uint64_t a1)
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
  uint64_t v3 = sub_100006944(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  unint64_t v9 = (char *)v3 + 4 * v8 + 32;
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
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
  uint64_t result = sub_100017540();
  __break(1u);
  return result;
}

uint64_t sub_100006800()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InputMatrix()
{
  return sub_100009638();
}

BOOL sub_100006850(uint64_t *a1, uint64_t *a2)
{
  return sub_100006464(*a1, *a2);
}

id sub_10000685C()
{
  Class isa = sub_100017280().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithDictionary:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_100017180();

    swift_willThrow();
  }
  return v2;
}

void *sub_100006944(void *result, int64_t a2, char a3, void *a4)
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
      sub_1000047A8(&qword_100020EB8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = &_swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage + 4;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= (void *)((char *)a4 + 4 * v8 + 32)) {
          memmove(v13, a4 + 4, 4 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000093E4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006A54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006B28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004848((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100004848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000491C((uint64_t)v12);
  return v7;
}

uint64_t sub_100006B28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100017460();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006CE4(a5, a6);
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
  uint64_t v8 = sub_1000174F0();
  if (!v8)
  {
    sub_100017500();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100017540();
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

uint64_t sub_100006CE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006D7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006F5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006F5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006D7C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006EF4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000174E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100017500();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100017300();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100017540();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100017500();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006EF4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000047A8(&qword_100020F00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006F5C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000047A8(&qword_100020F00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100017540();
  __break(1u);
  return result;
}

unint64_t sub_1000070AC(uint64_t a1, uint64_t a2)
{
  sub_1000176C0();
  sub_1000172F0();
  Swift::Int v4 = sub_1000176E0();
  return sub_100007168(a1, a2, v4);
}

unint64_t sub_100007124(uint64_t a1)
{
  uint64_t v2 = sub_1000176B0();
  return sub_10000724C(a1, v2);
}

unint64_t sub_100007168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100017640() & 1) == 0)
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
      while (!v14 && (sub_100017640() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000724C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000072E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000047A8(&qword_100020F18);
  uint64_t result = sub_100017520();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  uint64_t *v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_1000176B0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000075A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000047A8(&qword_100020F20);
  char v37 = a2;
  uint64_t v6 = sub_100017520();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
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
            if (v14 >= v11) {
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    int v33 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1000176C0();
    sub_1000172F0();
    uint64_t result = sub_1000176E0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000078A8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100007124(a2);
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
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100007B4C();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_1000072E8(result, a3 & 1);
  uint64_t result = sub_100007124(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_100017660();
  __break(1u);
  return result;
}

uint64_t sub_1000079E4(uint64_t a1, uint64_t a2, char a3, float a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000070AC(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100007CF0();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(float *)(v18[7] + 4 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000075A0(result, a3 & 1);
  uint64_t result = sub_1000070AC(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_100017660();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a1;
  v20[1] = a2;
  *(float *)(v18[7] + 4 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;
  return swift_bridgeObjectRetain();
}

void *sub_100007B4C()
{
  uint64_t v1 = v0;
  sub_1000047A8(&qword_100020F18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100017510();
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100007CF0()
{
  uint64_t v1 = v0;
  sub_1000047A8(&qword_100020F20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100017510();
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
    uint64_t v19 = 4 * v15;
    int v20 = *(_DWORD *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v19) = v20;
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

Swift::Int sub_100007EA0(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_100008D54(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_100008180(v5);
  *a1 = v2;
  return result;
}

void *sub_100007F0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000047A8(&qword_100020ED0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100008D68((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100004904();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

unint64_t sub_100007FF4()
{
  unint64_t result = qword_100020E80;
  if (!qword_100020E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020E80);
  }
  return result;
}

char *sub_100008048(char *a1, uint64_t a2)
{
  if (!a2) {
    return (char *)_swiftEmptyArrayStorage;
  }
  if (a2 > 0)
  {
    sub_1000047A8(&qword_100020EB8);
    uint64_t v4 = 4 * a2;
    uint64_t v5 = (char *)swift_allocObject();
    int64_t v6 = j__malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 29;
    }
    *((void *)v5 + 2) = a2;
    *((void *)v5 + 3) = 2 * (v7 >> 2);
    uint64_t v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 4 * a2);
      return v5;
    }
  }
  unint64_t result = (char *)sub_100017540();
  __break(1u);
  return result;
}

Swift::Int sub_100008180(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100017620(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v85 = 0;
      uint64_t v86 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v88 = *(void *)(v86 + 16 * i);
        uint64_t v89 = v85;
        do
        {
          if (v88 >= *(void *)(v86 + v89)) {
            break;
          }
          if (!v86) {
            goto LABEL_140;
          }
          v90 = (void *)(v86 + v89);
          uint64_t v91 = *(void *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          void *v90 = v88;
          v90[1] = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
      }
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
    goto LABEL_145;
  }
  Swift::Int v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    int64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      v92 = v12;
      v103 = v9;
      if (v13 >= 2)
      {
        uint64_t v93 = *v101;
        do
        {
          unint64_t v94 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v93) {
            goto LABEL_144;
          }
          v95 = v92;
          uint64_t v96 = *(void *)&v92[16 * v94 + 32];
          uint64_t v97 = *(void *)&v92[16 * v13 + 24];
          sub_100008854((char *)(v93 + 16 * v96), (char *)(v93 + 16 * *(void *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1) {
            break;
          }
          if (v97 < v96) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v95 = sub_100008C88((uint64_t)v95);
          }
          if (v94 >= *((void *)v95 + 2)) {
            goto LABEL_133;
          }
          v98 = &v95[16 * v94 + 32];
          *(void *)v98 = v96;
          *((void *)v98 + 1) = v97;
          unint64_t v99 = *((void *)v95 + 2);
          if (v13 > v99) {
            goto LABEL_134;
          }
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          v92 = v95;
          *((void *)v95 + 2) = v99 - 1;
          unint64_t v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v103[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_1000047A8(&qword_100020EC0);
    uint64_t v8 = sub_100017380();
    *(void *)(v8 + 16) = v7;
    v103 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v102 = *a1 + 32;
  uint64_t v100 = *a1 - 16;
  unint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v104 = v6;
  Swift::Int v105 = v3;
  uint64_t v106 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10);
      uint64_t v16 = 16 * v14;
      uint64_t v17 = *(void *)(v11 + 16 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v18 = (uint64_t *)(v102 + 16 * v14);
        uint64_t v19 = v15;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 2;
          uint64_t v20 = v21;
          if (v15 < v17 == v21 >= v19) {
            break;
          }
          ++v10;
          uint64_t v19 = v20;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v22 = 16 * v10;
          Swift::Int v23 = v10;
          Swift::Int v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = *(void *)(v11 + v16);
              uint64_t v27 = *(void *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(void *)(v25 - 16) = v26;
              *(void *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    Swift::Int v28 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v28 >= v3) {
      Swift::Int v28 = v3;
    }
    if (v28 < v14) {
      break;
    }
    if (v10 != v28)
    {
      uint64_t v29 = v100 + 16 * v10;
      do
      {
        uint64_t v30 = *(void *)(v11 + 16 * v10);
        Swift::Int v31 = v14;
        uint64_t v32 = v29;
        do
        {
          if (v30 >= *(void *)v32) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v33 = *(void *)(v32 + 24);
          *(_OWORD *)(v32 + 16) = *(_OWORD *)v32;
          *(void *)uint64_t v32 = v30;
          *(void *)(v32 + 8) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      Swift::Int v10 = v28;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_100008AD0(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v35 = *((void *)v12 + 2);
    unint64_t v34 = *((void *)v12 + 3);
    unint64_t v13 = v35 + 1;
    uint64_t v11 = v106;
    if (v35 >= v34 >> 1)
    {
      v84 = sub_100008AD0((char *)(v34 > 1), v35 + 1, 1, v12);
      uint64_t v11 = v106;
      unint64_t v12 = v84;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v36 = v12 + 32;
    char v37 = &v12[16 * v35 + 32];
    *(void *)char v37 = v14;
    *((void *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        unint64_t v38 = v13 - 1;
        if (v13 >= 4)
        {
          os_log_type_t v43 = &v36[16 * v13];
          uint64_t v44 = *((void *)v43 - 8);
          uint64_t v45 = *((void *)v43 - 7);
          BOOL v49 = __OFSUB__(v45, v44);
          uint64_t v46 = v45 - v44;
          if (v49) {
            goto LABEL_119;
          }
          uint64_t v48 = *((void *)v43 - 6);
          uint64_t v47 = *((void *)v43 - 5);
          BOOL v49 = __OFSUB__(v47, v48);
          uint64_t v41 = v47 - v48;
          char v42 = v49;
          if (v49) {
            goto LABEL_120;
          }
          unint64_t v50 = v13 - 2;
          v51 = &v36[16 * v13 - 32];
          uint64_t v53 = *(void *)v51;
          uint64_t v52 = *((void *)v51 + 1);
          BOOL v49 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          if (v49) {
            goto LABEL_122;
          }
          BOOL v49 = __OFADD__(v41, v54);
          uint64_t v55 = v41 + v54;
          if (v49) {
            goto LABEL_125;
          }
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            uint64_t v75 = *(void *)v73;
            uint64_t v74 = *((void *)v73 + 1);
            BOOL v49 = __OFSUB__(v74, v75);
            uint64_t v76 = v74 - v75;
            if (v49) {
              goto LABEL_129;
            }
            BOOL v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v67 = *((void *)v12 + 4);
            uint64_t v68 = *((void *)v12 + 5);
            BOOL v49 = __OFSUB__(v68, v67);
            uint64_t v60 = v68 - v67;
            char v61 = v49;
            goto LABEL_77;
          }
          uint64_t v40 = *((void *)v12 + 4);
          uint64_t v39 = *((void *)v12 + 5);
          BOOL v49 = __OFSUB__(v39, v40);
          uint64_t v41 = v39 - v40;
          char v42 = v49;
        }
        if (v42) {
          goto LABEL_121;
        }
        unint64_t v50 = v13 - 2;
        v56 = &v36[16 * v13 - 32];
        uint64_t v58 = *(void *)v56;
        uint64_t v57 = *((void *)v56 + 1);
        BOOL v59 = __OFSUB__(v57, v58);
        uint64_t v60 = v57 - v58;
        char v61 = v59;
        if (v59) {
          goto LABEL_124;
        }
        v62 = &v36[16 * v38];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v49 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v49) {
          goto LABEL_127;
        }
        if (__OFADD__(v60, v65)) {
          goto LABEL_128;
        }
        if (v60 + v65 >= v41)
        {
          BOOL v66 = v41 < v65;
LABEL_83:
          if (v66) {
            unint64_t v38 = v50;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v61) {
          goto LABEL_123;
        }
        v69 = &v36[16 * v38];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v49 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v49) {
          goto LABEL_126;
        }
        if (v72 < v60) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v77 = v38 - 1;
        if (v38 - 1 >= v13)
        {
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
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        v78 = v12;
        v79 = &v36[16 * v77];
        uint64_t v80 = *(void *)v79;
        v81 = &v36[16 * v38];
        uint64_t v82 = *((void *)v81 + 1);
        sub_100008854((char *)(v11 + 16 * *(void *)v79), (char *)(v11 + 16 * *(void *)v81), v11 + 16 * v82, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v82 < v80) {
          goto LABEL_116;
        }
        if (v38 > *((void *)v78 + 2)) {
          goto LABEL_117;
        }
        *(void *)v79 = v80;
        *(void *)&v36[16 * v77 + 8] = v82;
        unint64_t v83 = *((void *)v78 + 2);
        if (v38 >= v83) {
          goto LABEL_118;
        }
        unint64_t v12 = v78;
        unint64_t v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((void *)v78 + 2) = v83 - 1;
        uint64_t v11 = v106;
        if (v83 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v104;
    Swift::Int v3 = v105;
    if (v10 >= v105)
    {
      int64_t v9 = v103;
      goto LABEL_102;
    }
  }
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
  Swift::Int result = sub_100017500();
  __break(1u);
  return result;
}

uint64_t sub_100008854(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
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
  Swift::Int v24 = __src;
  Swift::Int v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v16 = &v4[16 * v13];
      uint64_t v22 = v16;
      Swift::Int v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v17 = (char *)(a3 - 16);
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            uint64_t v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)uint64_t v17 = *((_OWORD *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
            }
            Swift::Int v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 16;
          Swift::Int v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    Swift::Int v14 = &v4[16 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          Swift::Int v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        Swift::Int v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      Swift::Int v24 = v7;
    }
LABEL_42:
    sub_100008BCC((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_100017540();
  __break(1u);
  return result;
}

char *sub_100008AD0(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000047A8(&qword_100020EC8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  Swift::Int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100008BCC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_100017540();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_100008C88(uint64_t a1)
{
  return sub_100008AD0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_100008C9C(void *a1)
{
  return sub_100006944(0, a1[2], 0, a1);
}

uint64_t sub_100008CB0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100008CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000047A8(&qword_100020EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008D54(void *a1)
{
  return sub_10000ED24(0, a1[2], 0, a1);
}

uint64_t sub_100008D68(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    void *v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
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
  int64_t v11 = a2;
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
    uint64_t v20 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_retain();
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

unint64_t sub_100008F6C(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_1000047A8(&qword_100020F18);
  Swift::Int v3 = (void *)sub_100017530();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_100007124(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain();
    unint64_t result = sub_100007124(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10000906C(uint64_t a1)
{
  sub_100004848(a1, (uint64_t)v22);
  sub_1000047A8(&qword_100020EE0);
  if (swift_dynamicCast())
  {
    sub_100009534(v21, (uint64_t)v19);
    uint64_t v1 = v20;
    uint64_t v2 = sub_10000954C(v19, v20);
    uint64_t v3 = *(void *)(v1 - 8);
    __chkstk_darwin(v2);
    uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v3 + 16))(v5);
    if (sub_100017490() < 65)
    {
      char v11 = sub_1000174A0();
      uint64_t v12 = sub_100017480();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
      if (v11) {
        float v6 = (float)v12;
      }
      else {
        float v6 = (float)(unint64_t)v12;
      }
    }
    else
    {
      sub_100009590();
      sub_1000095E4();
      sub_100017270();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
      float v6 = v18;
    }
    float v10 = v6;
    goto LABEL_12;
  }
  sub_1000047A8(&qword_100020EE8);
  if (swift_dynamicCast())
  {
    sub_100009534(v21, (uint64_t)v19);
    char v7 = sub_10000954C(v19, v20);
    __chkstk_darwin(v7);
    (*(void (**)(unsigned char *))(v9 + 16))(&v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    sub_100009590();
    sub_100017260();
    float v10 = v18;
LABEL_12:
    sub_10000491C((uint64_t)v19);
    unsigned __int8 v15 = 0;
    goto LABEL_13;
  }
  sub_100008CB0(0, &qword_100020E90);
  if (swift_dynamicCast())
  {
    sub_1000173B0();
    float v14 = v13;

    unsigned __int8 v15 = 0;
    float v10 = v14;
  }
  else
  {
    float v10 = 0.0;
    unsigned __int8 v15 = 1;
  }
LABEL_13:
  sub_10000491C((uint64_t)v22);
  LOBYTE(v21[0]) = v15;
  return LODWORD(v10) | ((unint64_t)v15 << 32);
}

char *sub_1000093E4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    char v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_100017540();
  __break(1u);
  return result;
}

uint64_t sub_1000094D4(uint64_t a1)
{
  uint64_t v2 = sub_1000047A8(&qword_100020ED8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009534(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000954C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009590()
{
  unint64_t result = qword_100020EF0;
  if (!qword_100020EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020EF0);
  }
  return result;
}

unint64_t sub_1000095E4()
{
  unint64_t result = qword_100020EF8;
  if (!qword_100020EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020EF8);
  }
  return result;
}

uint64_t sub_100009638()
{
  return swift_getGenericMetadata();
}

MusicAppSelectionPFLPlugin::BiomeSQLClientError_optional __swiftcall BiomeSQLClientError.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 10002) {
    v1.value = MusicAppSelectionPFLPlugin_BiomeSQLClientError_rowConversionFailed;
  }
  else {
    v1.value = MusicAppSelectionPFLPlugin_BiomeSQLClientError_unknownDefault;
  }
  if (rawValue == 10001) {
    return 0;
  }
  else {
    return v1;
  }
}

uint64_t BiomeSQLClientError.rawValue.getter(char a1)
{
  return (a1 & 1) + 10001;
}

Swift::Int sub_100009698()
{
  int v1 = *v0;
  sub_1000176C0();
  if (v1) {
    Swift::UInt v2 = 10002;
  }
  else {
    Swift::UInt v2 = 10001;
  }
  sub_1000176D0(v2);
  return sub_1000176E0();
}

void sub_1000096E8()
{
  if (*v0) {
    Swift::UInt v1 = 10002;
  }
  else {
    Swift::UInt v1 = 10001;
  }
  sub_1000176D0(v1);
}

Swift::Int sub_100009720()
{
  int v1 = *v0;
  sub_1000176C0();
  if (v1) {
    Swift::UInt v2 = 10002;
  }
  else {
    Swift::UInt v2 = 10001;
  }
  sub_1000176D0(v2);
  return sub_1000176E0();
}

void *sub_10000976C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10002) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10001) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_100009794(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10001;
  if (*v1) {
    uint64_t v2 = 10002;
  }
  *a1 = v2;
}

uint64_t sub_1000097B0(uint64_t a1, uint64_t a2)
{
  return sub_100009CA8(a1, a2, (uint64_t (*)(void))sub_10000A28C);
}

uint64_t BiomeSQLRowAggregatorError.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 10101;
}

Swift::Int sub_1000097E0()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10101);
  return sub_1000176E0();
}

void sub_10000982C()
{
  sub_1000176D0(*v0 + 10101);
}

Swift::Int sub_100009860()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10101);
  return sub_1000176E0();
}

uint64_t sub_1000098A8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s26MusicAppSelectionPFLPlugin26BiomeSQLRowAggregatorErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1000098D4(void *a1@<X8>)
{
  *a1 = *v1 + 10101;
}

uint64_t sub_1000098E8(uint64_t a1, uint64_t a2)
{
  return sub_100009CA8(a1, a2, (uint64_t (*)(void))sub_10000A238);
}

uint64_t ModelTrainerError.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 10201;
}

Swift::Int sub_100009910()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10201);
  return sub_1000176E0();
}

void sub_10000995C()
{
  sub_1000176D0(*v0 + 10201);
}

Swift::Int sub_100009990()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10201);
  return sub_1000176E0();
}

uint64_t sub_1000099D8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s26MusicAppSelectionPFLPlugin17ModelTrainerErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_100009A04(void *a1@<X8>)
{
  *a1 = *v1 + 10201;
}

uint64_t sub_100009A18(uint64_t a1, uint64_t a2)
{
  return sub_100009CA8(a1, a2, (uint64_t (*)(void))sub_10000A190);
}

BOOL sub_100009A30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100009A48()
{
  int v1 = *v0;
  sub_1000176C0();
  if (v1) {
    Swift::UInt v2 = 10302;
  }
  else {
    Swift::UInt v2 = 10301;
  }
  sub_1000176D0(v2);
  return sub_1000176E0();
}

void sub_100009A98()
{
  if (*v0) {
    Swift::UInt v1 = 10302;
  }
  else {
    Swift::UInt v1 = 10301;
  }
  sub_1000176D0(v1);
}

Swift::Int sub_100009AD0()
{
  int v1 = *v0;
  sub_1000176C0();
  if (v1) {
    Swift::UInt v2 = 10302;
  }
  else {
    Swift::UInt v2 = 10301;
  }
  sub_1000176D0(v2);
  return sub_1000176E0();
}

void *sub_100009B1C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10302) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10301) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_100009B44(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10301;
  if (*v1) {
    uint64_t v2 = 10302;
  }
  *a1 = v2;
}

uint64_t sub_100009B5C(uint64_t a1, uint64_t a2)
{
  return sub_100009CA8(a1, a2, (uint64_t (*)(void))sub_10000A728);
}

BOOL sub_100009B74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100009B88()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10401);
  return sub_1000176E0();
}

void sub_100009BD4()
{
  sub_1000176D0(*v0 + 10401);
}

Swift::Int sub_100009C08()
{
  uint64_t v1 = *v0;
  sub_1000176C0();
  sub_1000176D0(v1 + 10401);
  return sub_1000176E0();
}

uint64_t sub_100009C50@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000A77C(*a1);
  *a2 = result;
  return result;
}

void sub_100009C7C(void *a1@<X8>)
{
  *a1 = *v1 + 10401;
}

uint64_t sub_100009C90(uint64_t a1, uint64_t a2)
{
  return sub_100009CA8(a1, a2, (uint64_t (*)(void))sub_10000A6D4);
}

uint64_t sub_100009CA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  unint64_t v6 = sub_10000A1E4();
  return Error<>._code.getter(a1, a2, v5, v6);
}

uint64_t _s26MusicAppSelectionPFLPlugin26BiomeSQLRowAggregatorErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 10101) >= 8) {
    return 8;
  }
  else {
    return a1 - 10101;
  }
}

uint64_t _s26MusicAppSelectionPFLPlugin17ModelTrainerErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 10201) >= 5) {
    return 5;
  }
  else {
    return a1 - 10201;
  }
}

unint64_t sub_100009D38()
{
  unint64_t result = qword_100020F28;
  if (!qword_100020F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F28);
  }
  return result;
}

unint64_t sub_100009D90()
{
  unint64_t result = qword_100020F30;
  if (!qword_100020F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F30);
  }
  return result;
}

unint64_t sub_100009DE8()
{
  unint64_t result = qword_100020F38;
  if (!qword_100020F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F38);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for BiomeSQLClientError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLClientError()
{
  return &type metadata for BiomeSQLClientError;
}

uint64_t getEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x100009FC4);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLRowAggregatorError()
{
  return &type metadata for BiomeSQLRowAggregatorError;
}

uint64_t getEnumTagSinglePayload for ModelTrainerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ModelTrainerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000A158);
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

ValueMetadata *type metadata accessor for ModelTrainerError()
{
  return &type metadata for ModelTrainerError;
}

unint64_t sub_10000A190()
{
  unint64_t result = qword_100020F40;
  if (!qword_100020F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F40);
  }
  return result;
}

unint64_t sub_10000A1E4()
{
  unint64_t result = qword_100020F48;
  if (!qword_100020F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F48);
  }
  return result;
}

unint64_t sub_10000A238()
{
  unint64_t result = qword_100020F50;
  if (!qword_100020F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F50);
  }
  return result;
}

unint64_t sub_10000A28C()
{
  unint64_t result = qword_100020F58;
  if (!qword_100020F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s26MusicAppSelectionPFLPlugin19BiomeSQLClientErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000A43CLL);
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

uint64_t sub_10000A464(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A46C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgsError()
{
  return &type metadata for MusicAppSelectionPFLPluginArgsError;
}

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginRunnerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MusicAppSelectionPFLPluginRunnerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x10000A5E4);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_10000A60C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginRunnerError()
{
  return &type metadata for MusicAppSelectionPFLPluginRunnerError;
}

unint64_t sub_10000A628()
{
  unint64_t result = qword_100020F60;
  if (!qword_100020F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F60);
  }
  return result;
}

unint64_t sub_10000A680()
{
  unint64_t result = qword_100020F68;
  if (!qword_100020F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F68);
  }
  return result;
}

unint64_t sub_10000A6D4()
{
  unint64_t result = qword_100020F70;
  if (!qword_100020F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F70);
  }
  return result;
}

unint64_t sub_10000A728()
{
  unint64_t result = qword_100020F78;
  if (!qword_100020F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F78);
  }
  return result;
}

uint64_t sub_10000A77C(uint64_t a1)
{
  if ((unint64_t)(a1 - 10401) >= 6) {
    return 6;
  }
  else {
    return a1 - 10401;
  }
}

uint64_t sub_10000A7A8()
{
  uint64_t v0 = sub_100017250();
  sub_10000A824(v0, qword_100022C60);
  sub_10000471C(v0, (uint64_t)qword_100022C60);
  return sub_100017240();
}

uint64_t *sub_10000A824(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000A888(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64656E69617254;
  }
  else {
    uint64_t v3 = 0x656E696C65736142;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64656E69617254;
  }
  else {
    uint64_t v5 = 0x656E696C65736142;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100017640();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_10000A930(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000001000189E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74654D6C65646F4DLL;
      unint64_t v3 = 0xEF656D614E636972;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x8000000100018A10;
      break;
    case 3:
      unint64_t v5 = 0x6E4563697274654DLL;
      unint64_t v3 = 0xEE00676E69646F63;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x80000001000189E0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF656D614E636972;
      if (v5 == 0x74654D6C65646F4DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD000000000000014;
      unint64_t v6 = 0x8000000100018A10;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEE00676E69646F63;
      if (v5 == 0x6E4563697274654DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_100017640();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000AAEC()
{
  return sub_1000176E0();
}

uint64_t sub_10000ABF0()
{
  sub_1000172F0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000ACD4()
{
  return sub_1000176E0();
}

uint64_t sub_10000ADD4(char *a1, void *a2, double a3)
{
  uint64_t v7 = sub_100017200();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  float v14 = (char *)&v64 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v68 = (char *)&v64 - v16;
  __chkstk_darwin(v15);
  float v18 = (char *)&v64 - v17;
  sub_1000102D4();
  uint64_t v70 = v8;
  int64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v73 = v7;
  uint64_t v74 = a1;
  v69 = v19;
  v19(v18, (uint64_t)a1, v7);
  id v71 = a2;
  uint64_t v20 = (char *)sub_10000F2C8((uint64_t)v18, (uint64_t)a2);
  if (v3)
  {
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_100017250();
    sub_10000471C(v21, (uint64_t)qword_100022C60);
    uint64_t v22 = v68;
    uint64_t v23 = v73;
    v69(v68, (uint64_t)v74, v73);
    swift_errorRetain();
    swift_errorRetain();
    Swift::Int v24 = sub_100017230();
    os_log_type_t v25 = sub_100017430();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v67 = (char *)swift_slowAlloc();
      v69 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
      id v76 = v69;
      *(_DWORD *)uint64_t v26 = 136315394;
      sub_100010314();
      uint64_t v27 = sub_100017630();
      uint64_t v75 = sub_100006A54(v27, v28, (uint64_t *)&v76);
      sub_100017450();
      swift_bridgeObjectRelease();
      uint64_t v29 = *(void (**)(char *, uint64_t))(v70 + 8);
      v29(v22, v73);
      *(_WORD *)(v26 + 12) = 2112;
      swift_errorRetain();
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v75 = v30;
      uint64_t v23 = v73;
      sub_100017450();
      *(void *)uint64_t v67 = v30;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Model init failed for %s with error: %@", (uint8_t *)v26, 0x16u);
      sub_1000047A8(&qword_100020C70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v29 = *(void (**)(char *, uint64_t))(v70 + 8);
      v29(v22, v23);
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v38 = v72;
    sub_10001022C();
    swift_allocError();
    unsigned char *v39 = 0;
    swift_willThrow();

    swift_errorRelease();
    v29(v74, v23);
LABEL_18:
    type metadata accessor for ModelTrainer();
    swift_deallocPartialClassInstance();
    return v38;
  }
  Swift::Int v31 = v20;
  if (!v20 || (uint64_t v32 = [v20 program]) == 0)
  {
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_100017250();
    sub_10000471C(v40, (uint64_t)qword_100022C60);
    uint64_t v41 = v73;
    v69(v14, (uint64_t)v74, v73);
    char v42 = sub_100017230();
    os_log_type_t v43 = sub_100017430();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v67 = v14;
      uint64_t v45 = (uint8_t *)v44;
      id v76 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315138;
      sub_100010314();
      uint64_t v46 = sub_100017630();
      uint64_t v75 = sub_100006A54(v46, v47, (uint64_t *)&v76);
      uint64_t v41 = v73;
      sub_100017450();
      swift_bridgeObjectRelease();
      uint64_t v48 = *(void (**)(char *, uint64_t))(v70 + 8);
      v48(v67, v41);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "No ML program found for %s", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v48 = *(void (**)(char *, uint64_t))(v70 + 8);
      v48(v14, v41);
    }

    sub_10001022C();
    swift_allocError();
    *BOOL v49 = 1;
    swift_willThrow();

    v48(v74, v41);
    uint64_t v38 = v72;
    goto LABEL_18;
  }
  uint64_t v33 = v32;
  id v34 = objc_allocWithZone((Class)MLProgramTrainer);
  id v76 = 0;
  swift_unknownObjectRetain();
  id v35 = [v34 initWithProgram:v33 learningRate:&v76 error:a3];
  if (!v35)
  {
    id v51 = v76;
    sub_100017180();

    swift_willThrow();
    swift_unknownObjectRelease();
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v67 = (char *)v33;
    uint64_t v68 = v31;
    uint64_t v52 = sub_100017250();
    sub_10000471C(v52, (uint64_t)qword_100022C60);
    uint64_t v53 = v73;
    v69(v11, (uint64_t)v74, v73);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v54 = sub_100017230();
    os_log_type_t v55 = sub_100017430();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = swift_slowAlloc();
      uint64_t v64 = v11;
      os_log_t v66 = v54;
      uint64_t v57 = v56;
      uint64_t v65 = (void *)swift_slowAlloc();
      v69 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
      id v76 = v69;
      *(_DWORD *)uint64_t v57 = 136315394;
      sub_100010314();
      uint64_t v58 = sub_100017630();
      uint64_t v75 = sub_100006A54(v58, v59, (uint64_t *)&v76);
      sub_100017450();
      swift_bridgeObjectRelease();
      uint64_t v60 = *(void (**)(char *, uint64_t))(v70 + 8);
      v60(v64, v53);
      *(_WORD *)(v57 + 12) = 2112;
      swift_errorRetain();
      uint64_t v61 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v75 = v61;
      sub_100017450();
      *uint64_t v65 = v61;
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v62 = v66;
      _os_log_impl((void *)&_mh_execute_header, v66, v55, "ML program trainer init failed for %s: %@", (uint8_t *)v57, 0x16u);
      sub_1000047A8(&qword_100020C70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v60 = *(void (**)(char *, uint64_t))(v70 + 8);
      v60(v11, v53);
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v38 = v72;
    sub_10001022C();
    swift_allocError();
    *uint64_t v63 = 1;
    swift_willThrow();

    swift_errorRelease();
    swift_unknownObjectRelease();
    v60(v74, v53);

    goto LABEL_18;
  }
  id v36 = v35;
  id v37 = v76;

  swift_unknownObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v74, v73);
  uint64_t v38 = v72;
  *(void *)(v72 + 16) = v36;

  return v38;
}

void sub_10000B818(int a1, int64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v6 = a2;
  int64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    uint64_t v40 = v4;
    uint64_t v44 = _swiftEmptyArrayStorage;
    sub_10000ED04(0, v7, 0);
    uint64_t v8 = _swiftEmptyArrayStorage;
    int64_t v6 = sub_10000F01C(a3);
    uint64_t v4 = v9;
    char v11 = v10 & 1;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a3 + 32))
    {
      if (((*(void *)(a3 + 56 + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_28;
      }
      if (*(_DWORD *)(a3 + 36) != v4) {
        goto LABEL_29;
      }
      char v43 = v11;
      uint64_t v12 = *(void *)(a3 + 48) + 40 * v6;
      uint64_t v13 = *(void *)(v12 + 16);
      uint64_t v14 = *(void *)(v12 + 24);
      uint64_t v44 = v8;
      unint64_t v16 = v8[2];
      unint64_t v15 = v8[3];
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1)
      {
        sub_10000ED04(v15 > 1, v16 + 1, 1);
        uint64_t v8 = v44;
      }
      v8[2] = v16 + 1;
      uint64_t v17 = &v8[2 * v16];
      v17[4] = v13;
      v17[5] = v14;
      int64_t v18 = sub_10000F0BC(v6, v4, v43 & 1, a3);
      int64_t v6 = v18;
      uint64_t v4 = v19;
      char v11 = v20 & 1;
      if (!--v7)
      {
        sub_10000F1A0(v18, v19, v11);
        uint64_t v4 = v40;
        int64_t v6 = a2;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
LABEL_11:
    sub_10000F428((uint64_t)v8);
    swift_bridgeObjectRelease();
    if (qword_100020B20 == -1) {
      goto LABEL_12;
    }
  }
  swift_once();
LABEL_12:
  uint64_t v21 = sub_100017250();
  sub_10000471C(v21, (uint64_t)qword_100022C60);
  swift_unknownObjectRetain();
  uint64_t v22 = sub_100017230();
  os_log_type_t v23 = sub_100017410();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134218240;
    HIDWORD(v44) = (unint64_t)[(id)v6 count] >> 32;
    sub_100017450();
    swift_unknownObjectRelease();
    *(_WORD *)(v24 + 12) = 1024;
    LODWORD(v44) = a1;
    sub_100017450();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Training %ld for %u epochs.", (uint8_t *)v24, 0x12u);
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  os_log_type_t v25 = (void *)v6;
  uint64_t v26 = *(void **)(v4 + 16);
  Class isa = sub_1000173C0().super.isa;
  uint64_t v44 = 0;
  id v28 = [v26 evaluateUsingTestData:v25 evaluationMetricNames:isa error:&v44];

  if (v28)
  {
    uint64_t v29 = v44;
    id v30 = v28;
    Swift::Int v31 = v25;
    unint64_t v32 = (unint64_t)[v25 count];
    if ((v32 & 0x8000000000000000) != 0 || HIDWORD(v32))
    {
      sub_100017500();
      __break(1u);
    }
    else
    {
      if (a1)
      {
        while (1)
        {
          uint64_t v44 = 0;
          id v33 = [v26 trainUsingTrainingData:v31 error:&v44];
          id v34 = v44;
          if (!v33) {
            break;
          }

          if (!--a1) {
            goto LABEL_21;
          }
        }
        uint64_t v39 = v34;

        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_21:
        Class v35 = sub_1000173C0().super.isa;
        swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        id v36 = [v26 evaluateUsingTestData:v31 evaluationMetricNames:v35 error:&v44];

        if (v36)
        {
          id v37 = v44;

          swift_bridgeObjectRetain();
          return;
        }
        uint64_t v39 = v44;
      }
      sub_100017180();

      swift_willThrow();
    }
  }
  else
  {
    uint64_t v38 = v44;
    swift_bridgeObjectRelease();
    sub_100017180();

    swift_willThrow();
  }
}

uint64_t sub_10000BD6C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ModelTrainer()
{
  return self;
}

uint64_t sub_10000BDC8(unsigned __int8 *a1, char *a2)
{
  return sub_10000A930(*a1, *a2);
}

Swift::Int sub_10000BDD4()
{
  return sub_10000AAEC();
}

uint64_t sub_10000BDDC()
{
  return sub_10000ABF0();
}

Swift::Int sub_10000BDE4()
{
  return sub_10000ACD4();
}

uint64_t sub_10000BDEC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000F568(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000BE1C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000001000189E0;
  switch(*v1)
  {
    case 1:
      unint64_t v3 = 0xEF656D614E636972;
      unint64_t v2 = 0x74654D6C65646F4DLL;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0xD000000000000014;
      *(void *)(a1 + 8) = 0x8000000100018A10;
      break;
    case 3:
      strcpy((char *)a1, "MetricEncoding");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v2;
      *(void *)(a1 + 8) = v3;
      break;
  }
}

unint64_t sub_10000BED4()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74654D6C65646F4DLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x6E4563697274654DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000BF80@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000F568(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000BFA8()
{
  return 0;
}

void sub_10000BFB4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000BFC0(uint64_t a1)
{
  unint64_t v2 = sub_1000105F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000BFFC(uint64_t a1)
{
  unint64_t v2 = sub_1000105F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C038(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000047A8(&qword_100021090);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000954C(a1, a1[3]);
  sub_1000105F4();
  sub_100017700();
  v10[15] = 0;
  sub_1000175D0();
  if (!v2)
  {
    v10[14] = 1;
    sub_1000175D0();
    v10[13] = *(unsigned char *)(v3 + 32);
    v10[12] = 2;
    sub_1000106F0();
    sub_100017600();
    v10[11] = 3;
    sub_100010744();
    sub_100017600();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_10000C20C()
{
  return sub_1000176E0();
}

uint64_t sub_10000C2F8(uint64_t a1, uint64_t a2)
{
  return sub_10000F1AC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24), *(unsigned char *)(a2 + 32)) & 1;
}

uint64_t sub_10000C348()
{
  swift_bridgeObjectRetain();
  sub_1000172F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1000172F0();
  swift_bridgeObjectRelease();
  sub_1000172F0();
  swift_bridgeObjectRelease();
  return sub_1000172F0();
}

Swift::Int sub_10000C430()
{
  return sub_1000176E0();
}

double sub_10000C520@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000F5B4(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_10000C568(void *a1)
{
  return sub_10000C038(a1);
}

uint64_t sub_10000C580(char *a1, char *a2)
{
  return sub_10000A888(*a1, *a2);
}

Swift::Int sub_10000C58C()
{
  return sub_1000176E0();
}

uint64_t sub_10000C610()
{
  sub_1000172F0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000C680()
{
  return sub_1000176E0();
}

uint64_t sub_10000C700@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10001C940;
  v8._object = v3;
  Swift::Int v5 = sub_100017550(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_10000C760(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x656E696C65736142;
  if (*v1) {
    uint64_t v2 = 0x64656E69617254;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000C7A0()
{
  return sub_100017320();
}

uint64_t sub_10000C800()
{
  return sub_100017310();
}

uint64_t sub_10000C850()
{
  return 1;
}

Swift::Int sub_10000C858()
{
  return sub_1000176E0();
}

uint64_t sub_10000C8A8()
{
  return sub_1000172F0();
}

Swift::Int sub_10000C8BC()
{
  return sub_1000176E0();
}

uint64_t sub_10000C908@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  unint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10001C990;
  v7._object = v3;
  Swift::Int v5 = sub_100017550(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000C95C(void *a1@<X8>)
{
  *a1 = 0x72616C616353;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_10000C974()
{
  return sub_100017320();
}

uint64_t sub_10000C9D4()
{
  return sub_100017310();
}

uint64_t sub_10000CA24(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  unint64_t v10 = sub_100004A98((uint64_t)_swiftEmptyArrayStorage);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v77 = (void *)v10;
  sub_1000079E4(0x756F436863746142, 0xEA0000000000746ELL, isUniquelyReferenced_nonNull_native, (float)a4);
  uint64_t v12 = (void *)v10;
  swift_bridgeObjectRelease();
  id v13 = [a2 evaluationMetrics];
  if (!v13) {
    goto LABEL_6;
  }
  uint64_t v14 = v13;
  id v15 = [a3 evaluationMetrics];
  if (!v15)
  {
    swift_unknownObjectRelease();
LABEL_6:
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100017250();
    sub_10000471C(v18, (uint64_t)qword_100022C60);
    uint64_t v19 = sub_100017230();
    os_log_type_t v20 = sub_100017420();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Evaluation metrics are nil.", v21, 2u);
      swift_slowDealloc();
    }

    return (uint64_t)v12;
  }
  unint64_t v16 = v15;
  uint64_t v17 = sub_10000FC34(v14);
  if (v4)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v12;
  }
  uint64_t v73 = v17;
  uint64_t v72 = sub_10000FC34(v16);
  uint64_t v69 = a1 + 56;
  uint64_t v23 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & *(void *)(a1 + 56);
  int64_t v70 = (unint64_t)(v23 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v26 = 0;
  uint64_t v71 = a1;
  while (1)
  {
    if (v25)
    {
      uint64_t v74 = (v25 - 1) & v25;
      int64_t v75 = v26;
      unint64_t v27 = __clz(__rbit64(v25)) | (v26 << 6);
    }
    else
    {
      int64_t v28 = v26 + 1;
      if (__OFADD__(v26, 1)) {
        goto LABEL_72;
      }
      if (v28 >= v70)
      {
LABEL_69:
        swift_unknownObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return (uint64_t)v12;
      }
      unint64_t v29 = *(void *)(v69 + 8 * v28);
      int64_t v30 = v26 + 1;
      if (!v29)
      {
        int64_t v30 = v26 + 2;
        if (v26 + 2 >= v70) {
          goto LABEL_69;
        }
        unint64_t v29 = *(void *)(v69 + 8 * v30);
        if (!v29)
        {
          int64_t v30 = v26 + 3;
          if (v26 + 3 >= v70) {
            goto LABEL_69;
          }
          unint64_t v29 = *(void *)(v69 + 8 * v30);
          if (!v29)
          {
            uint64_t v31 = v26 + 4;
            if (v26 + 4 >= v70) {
              goto LABEL_69;
            }
            unint64_t v29 = *(void *)(v69 + 8 * v31);
            if (!v29)
            {
              while (1)
              {
                int64_t v30 = v31 + 1;
                if (__OFADD__(v31, 1)) {
                  break;
                }
                if (v30 >= v70) {
                  goto LABEL_69;
                }
                unint64_t v29 = *(void *)(v69 + 8 * v30);
                ++v31;
                if (v29) {
                  goto LABEL_33;
                }
              }
              __break(1u);
LABEL_77:
              uint64_t result = sub_100017660();
              __break(1u);
              return result;
            }
            int64_t v30 = v26 + 4;
          }
        }
      }
LABEL_33:
      uint64_t v74 = (v29 - 1) & v29;
      int64_t v75 = v30;
      unint64_t v27 = __clz(__rbit64(v29)) + (v30 << 6);
    }
    uint64_t v32 = *(void *)(a1 + 48) + 40 * v27;
    uint64_t v33 = *(void *)(v32 + 8);
    uint64_t v76 = *(void *)v32;
    uint64_t v5 = *(void *)(v32 + 16);
    a3 = *(void **)(v32 + 24);
    char v34 = *(unsigned char *)(v32 + 32);
    uint64_t v35 = *(void *)(v73 + 16);
    swift_bridgeObjectRetain();
    if (!v35)
    {
      swift_bridgeObjectRetain();
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_1000070AC(v5, (uint64_t)a3);
    if ((v37 & 1) == 0) {
      break;
    }
    int v38 = *(_DWORD *)(*(void *)(v73 + 56) + 4 * v36);
    swift_bridgeObjectRelease();
    if (!*(void *)(v72 + 16)) {
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_1000070AC(v5, (uint64_t)a3);
    if ((v40 & 1) == 0) {
      break;
    }
    int v41 = *(_DWORD *)(*(void *)(v72 + 56) + 4 * v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v5 = swift_isUniquelyReferenced_nonNull_native();
    if (v34)
    {
      unint64_t v77 = v12;
      unint64_t v43 = sub_1000070AC(v76, v33);
      uint64_t v44 = v12[2];
      BOOL v45 = (v42 & 1) == 0;
      uint64_t v46 = v44 + v45;
      if (__OFADD__(v44, v45))
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      char v47 = v42;
      if (v12[3] >= v46)
      {
        if (v5)
        {
          uint64_t v12 = v77;
          if (v42) {
            goto LABEL_53;
          }
        }
        else
        {
          sub_100007CF0();
          uint64_t v12 = v77;
          if (v47) {
            goto LABEL_53;
          }
        }
      }
      else
      {
        sub_1000075A0(v46, v5);
        unint64_t v48 = sub_1000070AC(v76, v33);
        if ((v47 & 1) != (v49 & 1)) {
          goto LABEL_77;
        }
        unint64_t v43 = v48;
        uint64_t v12 = v77;
        if (v47)
        {
LABEL_53:
          *(_DWORD *)(v12[7] + 4 * v43) = v41;
          goto LABEL_17;
        }
      }
      v12[(v43 >> 6) + 8] |= 1 << v43;
      unint64_t v50 = (uint64_t *)(v12[6] + 16 * v43);
      *unint64_t v50 = v76;
      v50[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v43) = v41;
      uint64_t v51 = v12[2];
      BOOL v52 = __OFADD__(v51, 1);
      uint64_t v53 = v51 + 1;
      if (v52) {
        goto LABEL_74;
      }
    }
    else
    {
      unint64_t v77 = v12;
      unint64_t v55 = sub_1000070AC(v76, v33);
      uint64_t v56 = v12[2];
      BOOL v57 = (v54 & 1) == 0;
      uint64_t v58 = v56 + v57;
      if (__OFADD__(v56, v57)) {
        goto LABEL_71;
      }
      char v59 = v54;
      if (v12[3] >= v58)
      {
        if (v5)
        {
          uint64_t v12 = v77;
          if (v54) {
            goto LABEL_16;
          }
        }
        else
        {
          sub_100007CF0();
          uint64_t v12 = v77;
          if (v59) {
            goto LABEL_16;
          }
        }
      }
      else
      {
        sub_1000075A0(v58, v5);
        unint64_t v60 = sub_1000070AC(v76, v33);
        if ((v59 & 1) != (v61 & 1)) {
          goto LABEL_77;
        }
        unint64_t v55 = v60;
        uint64_t v12 = v77;
        if (v59)
        {
LABEL_16:
          *(_DWORD *)(v12[7] + 4 * v55) = v38;
          goto LABEL_17;
        }
      }
      v12[(v55 >> 6) + 8] |= 1 << v55;
      os_log_t v62 = (uint64_t *)(v12[6] + 16 * v55);
      uint64_t *v62 = v76;
      v62[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v55) = v38;
      uint64_t v63 = v12[2];
      BOOL v52 = __OFADD__(v63, 1);
      uint64_t v53 = v63 + 1;
      if (v52) {
        goto LABEL_73;
      }
    }
    v12[2] = v53;
    swift_bridgeObjectRetain();
LABEL_17:
    a1 = v71;
    int64_t v26 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v25 = v74;
  }
  swift_bridgeObjectRelease();
LABEL_64:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_100020B20 == -1) {
    goto LABEL_65;
  }
LABEL_75:
  swift_once();
LABEL_65:
  uint64_t v64 = sub_100017250();
  sub_10000471C(v64, (uint64_t)qword_100022C60);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_100017230();
  os_log_type_t v66 = sub_100017430();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    unint64_t v77 = v12;
    *(_DWORD *)uint64_t v67 = 136315138;
    swift_bridgeObjectRetain();
    sub_100006A54(v5, (unint64_t)a3, (uint64_t *)&v77);
    sub_100017450();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Baseline/Trained metric value not found for %s", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_10001022C();
  swift_allocError();
  *uint64_t v68 = 4;
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return (uint64_t)v12;
}

uint64_t sub_10000D2BC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000176C0();
  swift_bridgeObjectRetain();
  sub_1000172F0();
  Swift::Int v8 = sub_1000176E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100017640() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      if (v19 || (sub_100017640() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000DE78(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000D46C(uint64_t a1, Swift::Int a2)
{
  unint64_t v3 = v2;
  uint64_t v7 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *v3;
  sub_1000176C0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000172F0();
  uint64_t v42 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v40 = v9;
  sub_1000172F0();
  uint64_t v41 = v8;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a2 + 32)) {
    uint64_t v11 = 0x64656E69617254;
  }
  else {
    uint64_t v11 = 0x656E696C65736142;
  }
  if (*(unsigned char *)(a2 + 32)) {
    unint64_t v12 = 0xE700000000000000;
  }
  else {
    unint64_t v12 = 0xE800000000000000;
  }
  uint64_t v38 = v11;
  sub_1000172F0();
  swift_bridgeObjectRelease();
  sub_1000172F0();
  Swift::Int v13 = sub_1000176E0();
  uint64_t v14 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v39 = v10;
  uint64_t v16 = v10 + 56;
  uint64_t v37 = a1;
  Swift::Int v36 = a2;
  if (((*(void *)(v10 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000E014(v36, v15, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v43;
    swift_bridgeObjectRelease();
    long long v29 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v36;
    *(_OWORD *)(v37 + 16) = v29;
    *(unsigned char *)(v37 + 32) = *(unsigned char *)(v36 + 32);
    return 1;
  }
  uint64_t v17 = ~v14;
  while (1)
  {
    uint64_t v18 = *(void *)(v39 + 48) + 40 * v15;
    uint64_t v20 = *(void *)(v18 + 16);
    uint64_t v19 = *(void *)(v18 + 24);
    int v21 = *(unsigned __int8 *)(v18 + 32);
    BOOL v22 = *(void *)v18 == v7 && *(void *)(v18 + 8) == v42;
    if (!v22 && (sub_100017640() & 1) == 0) {
      goto LABEL_9;
    }
    BOOL v23 = v20 == v40 && v19 == v41;
    if (!v23 && (sub_100017640() & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v24 = v21 ? 0x64656E69617254 : 0x656E696C65736142;
    unint64_t v25 = v21 ? 0xE700000000000000 : 0xE800000000000000;
    if (v24 == v38 && v25 == v12) {
      break;
    }
    char v27 = sub_100017640();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
LABEL_9:
    unint64_t v15 = (v15 + 1) & v17;
    if (((*(void *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_34:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)(*v3 + 48) + 40 * v15;
  uint64_t v33 = *(void *)v31;
  uint64_t v32 = *(void *)(v31 + 8);
  uint64_t v34 = *(void *)(v31 + 16);
  uint64_t v35 = *(void *)(v31 + 24);
  LOBYTE(v31) = *(unsigned char *)(v31 + 32);
  *(void *)a1 = v33;
  *(void *)(a1 + 8) = v32;
  *(void *)(a1 + 16) = v34;
  *(void *)(a1 + 24) = v35;
  *(unsigned char *)(a1 + 32) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_10000D7EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000047A8(&qword_100021030);
  uint64_t v3 = sub_1000174D0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1000176C0();
      sub_1000172F0();
      uint64_t result = sub_1000176E0();
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
            goto LABEL_38;
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
      Swift::Int v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10000DACC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000047A8(&qword_100021050);
  uint64_t v3 = sub_1000174D0();
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
    for (i = v2; ; uint64_t v2 = i)
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
                  void *v33 = -1 << v31;
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
      uint64_t v18 = *(void *)(v2 + 48) + 40 * v14;
      uint64_t v19 = *(void *)v18;
      uint64_t v20 = *(void *)(v18 + 8);
      uint64_t v21 = *(void *)(v18 + 16);
      uint64_t v22 = *(void *)(v18 + 24);
      char v23 = *(unsigned char *)(v18 + 32);
      sub_1000176C0();
      swift_bridgeObjectRetain();
      sub_1000172F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1000172F0();
      swift_bridgeObjectRelease();
      sub_1000172F0();
      swift_bridgeObjectRelease();
      sub_1000172F0();
      uint64_t result = sub_1000176E0();
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
      uint64_t v12 = *(void *)(v4 + 48) + 40 * v11;
      *(void *)uint64_t v12 = v19;
      *(void *)(v12 + 8) = v20;
      *(void *)(v12 + 16) = v21;
      *(void *)(v12 + 24) = v22;
      *(unsigned char *)(v12 + 32) = v23;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10000DE78(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000D7EC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000E350();
      goto LABEL_22;
    }
    sub_10000E6D4();
  }
  uint64_t v11 = *v4;
  sub_1000176C0();
  sub_1000172F0();
  uint64_t result = sub_1000176E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100017640(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100017650();
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
          uint64_t result = sub_100017640();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

Swift::Int sub_10000E014(Swift::Int result, unint64_t a2, char a3)
{
  Swift::Int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  Swift::Int v36 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_10000DACC();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (Swift::Int)sub_10000E504();
        goto LABEL_39;
      }
      sub_10000E984();
    }
    uint64_t v8 = *v3;
    sub_1000176C0();
    uint64_t v9 = *(void *)v5;
    uint64_t v10 = *(void *)(v5 + 8);
    swift_bridgeObjectRetain();
    sub_1000172F0();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v5 + 16);
    uint64_t v12 = *(void *)(v5 + 24);
    swift_bridgeObjectRetain();
    uint64_t v40 = v11;
    sub_1000172F0();
    uint64_t v39 = v12;
    swift_bridgeObjectRelease();
    BOOL v13 = *(unsigned char *)(v5 + 32) == 0;
    if (*(unsigned char *)(v5 + 32)) {
      uint64_t v14 = 0x64656E69617254;
    }
    else {
      uint64_t v14 = 0x656E696C65736142;
    }
    if (v13) {
      unint64_t v15 = 0xE800000000000000;
    }
    else {
      unint64_t v15 = 0xE700000000000000;
    }
    sub_1000172F0();
    swift_bridgeObjectRelease();
    sub_1000172F0();
    uint64_t result = sub_1000176E0();
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v16;
    uint64_t v38 = v8;
    uint64_t v17 = v8 + 56;
    if ((*(void *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v37 = v14;
      uint64_t v18 = ~v16;
      do
      {
        uint64_t v19 = *(void *)(v38 + 48) + 40 * a2;
        uint64_t v20 = *(void *)(v19 + 16);
        uint64_t v21 = *(void *)(v19 + 24);
        int v22 = *(unsigned __int8 *)(v19 + 32);
        BOOL v23 = *(void *)v19 == v9 && *(void *)(v19 + 8) == v10;
        if (v23 || (uint64_t result = sub_100017640(), (result & 1) != 0))
        {
          BOOL v24 = v20 == v40 && v21 == v39;
          if (v24 || (uint64_t result = sub_100017640(), (result & 1) != 0))
          {
            if (v22) {
              uint64_t v25 = 0x64656E69617254;
            }
            else {
              uint64_t v25 = 0x656E696C65736142;
            }
            if (v22) {
              unint64_t v26 = 0xE700000000000000;
            }
            else {
              unint64_t v26 = 0xE800000000000000;
            }
            if (v25 == v37 && v26 == v15) {
              goto LABEL_42;
            }
            char v28 = sub_100017640();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v28) {
              goto LABEL_43;
            }
            uint64_t result = swift_bridgeObjectRelease();
          }
        }
        a2 = (a2 + 1) & v18;
      }
      while (((*(void *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_39:
  uint64_t v29 = *v35;
  *(void *)(*v35 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v30 = *(void *)(v29 + 48) + 40 * a2;
  long long v31 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v36;
  *(_OWORD *)(v30 + 16) = v31;
  *(unsigned char *)(v30 + 32) = *(unsigned char *)(v36 + 32);
  uint64_t v32 = *(void *)(v29 + 16);
  BOOL v33 = __OFADD__(v32, 1);
  uint64_t v34 = v32 + 1;
  if (v33)
  {
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_43:
    swift_bridgeObjectRelease();
    uint64_t result = sub_100017650();
    __break(1u);
  }
  else
  {
    *(void *)(v29 + 16) = v34;
  }
  return result;
}

void *sub_10000E350()
{
  uint64_t v1 = v0;
  sub_1000047A8(&qword_100021030);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000174C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_10000E504()
{
  uint64_t v1 = v0;
  sub_1000047A8(&qword_100021050);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000174C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24)
      {
        int64_t v9 = v23 + 2;
        if (v23 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v6 + 8 * v9);
        if (!v24) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v21 = *(void *)(v17 + 24);
    LOBYTE(v17) = *(unsigned char *)(v17 + 32);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(void *)(v22 + 16) = v20;
    *(void *)(v22 + 24) = v21;
    *(unsigned char *)(v22 + 32) = v17;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v13) {
    goto LABEL_28;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000E6D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000047A8(&qword_100021030);
  uint64_t v3 = sub_1000174D0();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1000176C0();
    swift_bridgeObjectRetain();
    sub_1000172F0();
    uint64_t result = sub_1000176E0();
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
    void *v13 = v20;
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

uint64_t sub_10000E984()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000047A8(&qword_100021050);
  uint64_t v3 = sub_1000174D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v2 + 56;
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
  for (i = v2; ; uint64_t v2 = i)
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
    if (v15 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v31 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v31 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(v2 + 48) + 40 * v14;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 16);
    uint64_t v22 = *(void *)(v18 + 24);
    char v23 = *(unsigned char *)(v18 + 32);
    sub_1000176C0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1000172F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1000172F0();
    swift_bridgeObjectRelease();
    sub_1000172F0();
    swift_bridgeObjectRelease();
    sub_1000172F0();
    uint64_t result = sub_1000176E0();
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
          goto LABEL_36;
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
    uint64_t v12 = *(void *)(v4 + 48) + 40 * v11;
    *(void *)uint64_t v12 = v19;
    *(void *)(v12 + 8) = v20;
    *(void *)(v12 + 16) = v21;
    *(void *)(v12 + 24) = v22;
    *(unsigned char *)(v12 + 32) = v23;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v31 + 8 * v17);
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
    if (v10 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000ED04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000EEB0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_10000ED24(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000047A8(&qword_100020ED0);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_1000047A8(&qword_100020EC0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100017540();
  __break(1u);
  return result;
}

uint64_t sub_10000EEB0(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000047A8(&qword_100021038);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_100017540();
  __break(1u);
  return result;
}

uint64_t sub_10000F01C(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

int64_t sub_10000F0BC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000F1A0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000F1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a1 == a6 && a2 == a7 || (char v14 = 0, (sub_100017640() & 1) != 0))
  {
    if (a3 == a8 && a4 == a9 || (char v14 = 0, (sub_100017640() & 1) != 0))
    {
      if (a5) {
        uint64_t v15 = 0x64656E69617254;
      }
      else {
        uint64_t v15 = 0x656E696C65736142;
      }
      if (a5) {
        unint64_t v16 = 0xE700000000000000;
      }
      else {
        unint64_t v16 = 0xE800000000000000;
      }
      if (a10) {
        uint64_t v17 = 0x64656E69617254;
      }
      else {
        uint64_t v17 = 0x656E696C65736142;
      }
      if (a10) {
        unint64_t v18 = 0xE700000000000000;
      }
      else {
        unint64_t v18 = 0xE800000000000000;
      }
      if (v15 == v17 && v16 == v18) {
        char v14 = 1;
      }
      else {
        char v14 = sub_100017640();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v14 & 1;
}

id sub_10000F2C8(uint64_t a1, uint64_t a2)
{
  sub_1000171B0(__stack_chk_guard);
  unint64_t v5 = v4;
  id v14 = 0;
  id v6 = [(id)swift_getObjCClassFromMetadata() modelWithContentsOfURL:v4 configuration:a2 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_100017200();
    unint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_100017180();

    swift_willThrow();
    uint64_t v12 = sub_100017200();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_10000F428(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1000173E0();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000D2BC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000F4C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100010280();
  uint64_t result = sub_1000173E0();
  uint64_t v11 = result;
  if (v2)
  {
    unint64_t v4 = (unsigned char *)(a1 + 64);
    do
    {
      uint64_t v6 = *((void *)v4 - 4);
      uint64_t v5 = *((void *)v4 - 3);
      uint64_t v7 = *((void *)v4 - 2);
      uint64_t v8 = *((void *)v4 - 1);
      char v9 = *v4;
      v4 += 40;
      v12[0] = v6;
      v12[1] = v5;
      v12[2] = v7;
      uint64_t v12[3] = v8;
      char v13 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_10000D46C((uint64_t)v10, (Swift::Int)v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v11;
  }
  return result;
}

uint64_t sub_10000F568(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001C8C0;
  v6._object = a2;
  unint64_t v4 = sub_100017550(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000F5B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000047A8(&qword_100021070);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000954C(a1, a1[3]);
  sub_1000105F4();
  sub_1000176F0();
  if (v2) {
    return sub_10000491C((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = sub_100017570();
  uint64_t v11 = v10;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_100017570();
  uint64_t v14 = v13;
  uint64_t v19 = v12;
  char v22 = 2;
  sub_100010648();
  swift_bridgeObjectRetain();
  uint64_t v20 = v14;
  sub_1000175A0();
  int v18 = v23;
  char v21 = 3;
  sub_10001069C();
  sub_1000175A0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000491C((uint64_t)a1);
  uint64_t v15 = v20;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = v18;
  return result;
}

void sub_10000F890(void *a1)
{
  id v2 = [a1 type];
  if (v2 == (id)1)
  {
    [a1 int64Value];
    return;
  }
  if (v2 == (id)5)
  {
    id v3 = [a1 multiArrayValue];
    if (v3)
    {
      unint64_t v4 = v3;
      if ([v3 count] == (id)1)
      {
        id v5 = [v4 objectAtIndexedSubscript:0];
        [v5 floatValue];

        return;
      }
    }
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100017250();
    sub_10000471C(v14, (uint64_t)qword_100022C60);
    id v7 = a1;
    uint64_t v8 = sub_100017230();
    os_log_type_t v9 = sub_100017430();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      id v16 = v7;
      sub_100017450();
      *uint64_t v15 = v7;

      uint64_t v13 = "Feature value not scalar: %@";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v2 == (id)2)
  {
    [a1 doubleValue];
    return;
  }
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100017250();
  sub_10000471C(v6, (uint64_t)qword_100022C60);
  id v7 = a1;
  uint64_t v8 = sub_100017230();
  os_log_type_t v9 = sub_100017430();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_19;
  }
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  uint64_t v11 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v10 = 138412290;
  id v12 = v7;
  sub_100017450();
  void *v11 = v7;

  uint64_t v13 = "Invalid feature value %@";
LABEL_18:
  _os_log_impl((void *)&_mh_execute_header, v8, v9, v13, v10, 0xCu);
  sub_1000047A8(&qword_100020C70);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

LABEL_20:
  sub_10001022C();
  swift_allocError();
  unsigned char *v17 = 3;
  swift_willThrow();
}

uint64_t sub_10000FC34(void *a1)
{
  uint64_t v4 = v1;
  uint64_t isUniquelyReferenced_nonNull_native = sub_100004A98((uint64_t)_swiftEmptyArrayStorage);
  id v53 = a1;
  unint64_t v7 = (unint64_t)[a1 count];
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    os_log_type_t v9 = &BiomeSQLClient;
    uint64_t v51 = (char *)v7;
LABEL_4:
    if (v8 != (char *)v7)
    {
      BOOL v52 = v8 + 1;
      id v56 = objc_msgSend(v53, (SEL)v9[33].base_prots);
      id v10 = [v56 featureNames];
      uint64_t v11 = isUniquelyReferenced_nonNull_native;
      uint64_t v12 = sub_1000173D0();

      int64_t v13 = 0;
      uint64_t v14 = *(void *)(v12 + 56);
      uint64_t v54 = v12 + 56;
      uint64_t v57 = v12;
      char v15 = *(unsigned char *)(v12 + 32);
      uint64_t isUniquelyReferenced_nonNull_native = v11;
      uint64_t v16 = 1 << v15;
      if (v16 < 64) {
        uint64_t v17 = ~(-1 << v16);
      }
      else {
        uint64_t v17 = -1;
      }
      unint64_t v18 = v17 & v14;
      int64_t v55 = (unint64_t)(v16 + 63) >> 6;
      while (1)
      {
        if (v18)
        {
          unint64_t v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
          unint64_t v20 = v19 | (v13 << 6);
        }
        else
        {
          BOOL v21 = __OFADD__(v13++, 1);
          if (v21) {
            goto LABEL_55;
          }
          if (v13 >= v55)
          {
LABEL_44:
            swift_unknownObjectRelease();
            swift_release();
            unint64_t v7 = (unint64_t)v51;
            uint64_t v8 = v52;
            os_log_type_t v9 = &BiomeSQLClient;
            if (v52 != v51) {
              goto LABEL_4;
            }
            return isUniquelyReferenced_nonNull_native;
          }
          unint64_t v22 = *(void *)(v54 + 8 * v13);
          if (!v22)
          {
            int64_t v23 = v13 + 1;
            if (v13 + 1 >= v55) {
              goto LABEL_44;
            }
            unint64_t v22 = *(void *)(v54 + 8 * v23);
            if (!v22)
            {
              int64_t v23 = v13 + 2;
              if (v13 + 2 >= v55) {
                goto LABEL_44;
              }
              unint64_t v22 = *(void *)(v54 + 8 * v23);
              if (!v22)
              {
                int64_t v23 = v13 + 3;
                if (v13 + 3 >= v55) {
                  goto LABEL_44;
                }
                unint64_t v22 = *(void *)(v54 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    int64_t v13 = v23 + 1;
                    if (__OFADD__(v23, 1)) {
                      goto LABEL_56;
                    }
                    if (v13 >= v55) {
                      goto LABEL_44;
                    }
                    unint64_t v22 = *(void *)(v54 + 8 * v13);
                    ++v23;
                    if (v22) {
                      goto LABEL_23;
                    }
                  }
                }
              }
            }
            int64_t v13 = v23;
          }
LABEL_23:
          unint64_t v18 = (v22 - 1) & v22;
          unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
        }
        char v24 = (unint64_t *)(*(void *)(v57 + 48) + 16 * v20);
        unint64_t v2 = *v24;
        unint64_t v3 = v24[1];
        swift_bridgeObjectRetain();
        NSString v25 = sub_1000172B0();
        id v26 = [v56 featureValueForName:v25];

        if (!v26) {
          break;
        }
        if (*(void *)(isUniquelyReferenced_nonNull_native + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v27 = sub_1000070AC(v2, v3);
          float v28 = 0.0;
          if (v29) {
            float v28 = *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v27);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          float v28 = 0.0;
        }
        sub_10000F890(v26);
        if (v4)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          swift_release();
          return isUniquelyReferenced_nonNull_native;
        }
        float v31 = v30;
        uint64_t v32 = isUniquelyReferenced_nonNull_native;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v58 = v32;
        uint64_t v33 = v2;
        unint64_t v2 = sub_1000070AC(v2, v3);
        uint64_t v35 = *(void *)(v32 + 16);
        BOOL v36 = (v34 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        char v38 = v34;
        if (*(void *)(v32 + 24) >= v37)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_100007CF0();
          }
        }
        else
        {
          sub_1000075A0(v37, isUniquelyReferenced_nonNull_native);
          unint64_t v39 = sub_1000070AC(v33, v3);
          if ((v38 & 1) != (v40 & 1))
          {
            uint64_t result = sub_100017660();
            __break(1u);
            return result;
          }
          unint64_t v2 = v39;
        }
        float v41 = v28 + v31;
        uint64_t isUniquelyReferenced_nonNull_native = v58;
        if (v38)
        {
          *(float *)(*(void *)(v58 + 56) + 4 * v2) = v41;
        }
        else
        {
          *(void *)(v58 + 8 * (v2 >> 6) + 64) |= 1 << v2;
          uint64_t v42 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v2);
          *uint64_t v42 = v33;
          v42[1] = v3;
          *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v2) = v41;
          uint64_t v43 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
          BOOL v21 = __OFADD__(v43, 1);
          uint64_t v44 = v43 + 1;
          if (v21) {
            goto LABEL_54;
          }
          *(void *)(isUniquelyReferenced_nonNull_native + 16) = v44;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v4 = 0;
      }
      if (qword_100020B20 != -1) {
        goto LABEL_59;
      }
      goto LABEL_47;
    }
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
LABEL_47:
    uint64_t v45 = sub_100017250();
    sub_10000471C(v45, (uint64_t)qword_100022C60);
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100017230();
    os_log_type_t v47 = sub_100017430();
    if (os_log_type_enabled(v46, v47))
    {
      unint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)unint64_t v48 = 136315138;
      swift_bridgeObjectRetain();
      sub_100006A54(v2, v3, &v58);
      sub_100017450();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Couldn't find feature value for %s", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10001022C();
    swift_allocError();
    *char v49 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  return isUniquelyReferenced_nonNull_native;
}

unint64_t sub_10001022C()
{
  unint64_t result = qword_100021040;
  if (!qword_100021040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021040);
  }
  return result;
}

unint64_t sub_100010280()
{
  unint64_t result = qword_100021048;
  if (!qword_100021048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021048);
  }
  return result;
}

unint64_t sub_1000102D4()
{
  unint64_t result = qword_100021058;
  if (!qword_100021058)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021058);
  }
  return result;
}

unint64_t sub_100010314()
{
  unint64_t result = qword_100021060;
  if (!qword_100021060)
  {
    sub_100017200();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021060);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ModelEvaluationMetricSpecs(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ModelEvaluationMetricSpecs()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
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
  return a1;
}

__n128 initializeWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs()
{
  return &type metadata for ModelEvaluationMetricSpecs;
}

unint64_t sub_1000105A0()
{
  unint64_t result = qword_100021068;
  if (!qword_100021068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021068);
  }
  return result;
}

unint64_t sub_1000105F4()
{
  unint64_t result = qword_100021078;
  if (!qword_100021078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021078);
  }
  return result;
}

unint64_t sub_100010648()
{
  unint64_t result = qword_100021080;
  if (!qword_100021080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021080);
  }
  return result;
}

unint64_t sub_10001069C()
{
  unint64_t result = qword_100021088;
  if (!qword_100021088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021088);
  }
  return result;
}

unint64_t sub_1000106F0()
{
  unint64_t result = qword_100021098;
  if (!qword_100021098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021098);
  }
  return result;
}

unint64_t sub_100010744()
{
  unint64_t result = qword_1000210A0;
  if (!qword_1000210A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000108F4);
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

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs.CodingKeys()
{
  return &type metadata for ModelEvaluationMetricSpecs.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MetricEncoding(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MetricEncoding(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100010A1CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100010A44()
{
  return 0;
}

ValueMetadata *type metadata accessor for MetricEncoding()
{
  return &type metadata for MetricEncoding;
}

unsigned char *storeEnumTagSinglePayload for ModelEvaluationMetricType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100010B28);
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

ValueMetadata *type metadata accessor for ModelEvaluationMetricType()
{
  return &type metadata for ModelEvaluationMetricType;
}

unint64_t sub_100010B64()
{
  unint64_t result = qword_1000210A8;
  if (!qword_1000210A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210A8);
  }
  return result;
}

unint64_t sub_100010BBC()
{
  unint64_t result = qword_1000210B0;
  if (!qword_1000210B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210B0);
  }
  return result;
}

unint64_t sub_100010C14()
{
  unint64_t result = qword_1000210B8;
  if (!qword_1000210B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210B8);
  }
  return result;
}

unint64_t sub_100010C6C()
{
  unint64_t result = qword_1000210C0;
  if (!qword_1000210C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210C0);
  }
  return result;
}

unint64_t sub_100010CC4()
{
  unint64_t result = qword_1000210C8;
  if (!qword_1000210C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210C8);
  }
  return result;
}

unint64_t sub_100010D18()
{
  unint64_t result = qword_1000210D0;
  if (!qword_1000210D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210D0);
  }
  return result;
}

unint64_t sub_100010D6C()
{
  unint64_t result = qword_1000210D8;
  if (!qword_1000210D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000210D8);
  }
  return result;
}

uint64_t MusicAppSelectionPFLPlugin.perform(_:)(void *a1)
{
  type metadata accessor for MusicAppSelectionPFLPluginRunner();
  uint64_t v3 = swift_allocObject();
  sub_100013AA8(a1);
  if (!v1)
  {
    uint64_t v3 = sub_1000144CC();
    swift_release();
  }
  return v3;
}

Swift::Void __swiftcall MusicAppSelectionPFLPlugin.stop()()
{
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100017250();
  sub_10000471C(v0, (uint64_t)qword_100022C60);
  oslog = sub_100017230();
  os_log_type_t v1 = sub_100017420();
  if (os_log_type_enabled(oslog, v1))
  {
    int v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "MusicAppSelectionPFLPlugin requested to stop.", v2, 2u);
    swift_slowDealloc();
  }
}

id MusicAppSelectionPFLPlugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id MusicAppSelectionPFLPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicAppSelectionPFLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id MusicAppSelectionPFLPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicAppSelectionPFLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MusicAppSelectionPFLPlugin()
{
  return self;
}

uint64_t destroy for MusicAppSelectionPFLPluginArgs()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  uint64_t v9 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v9;
  uint64_t v10 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v10;
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for MusicAppSelectionPFLPluginArgs(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 176)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 176) = 1;
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
    *(unsigned char *)(result + 176) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgs()
{
  return &type metadata for MusicAppSelectionPFLPluginArgs;
}

unint64_t sub_100011700(char a1)
{
  unint64_t result = 0x676E696E7261654CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x706E496C65646F4DLL;
      break;
    case 3:
      unint64_t result = 0x62614C6C65646F4DLL;
      break;
    case 4:
      unint64_t result = 0x4E65727574616546;
      break;
    case 5:
      unint64_t result = 0x4365727574616546;
      break;
    case 6:
      unint64_t result = 0x6546746567726154;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x6D614E6C65646F4DLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100011910(char a1)
{
  unint64_t result = 0x676E696E7261654CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x706E496C65646F4DLL;
      break;
    case 3:
      unint64_t result = 0x62614C6C65646F4DLL;
      break;
    case 4:
      unint64_t result = 0x4E65727574616546;
      break;
    case 5:
      unint64_t result = 0x4365727574616546;
      break;
    case 6:
      unint64_t result = 0x6546746567726154;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x6D614E6C65646F4DLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100011B20(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100011700(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100011700(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100017640();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100011BAC()
{
  char v1 = *v0;
  sub_1000176C0();
  sub_100011700(v1);
  sub_1000172F0();
  swift_bridgeObjectRelease();
  return sub_1000176E0();
}

uint64_t sub_100011C10()
{
  sub_100011700(*v0);
  sub_1000172F0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100011C64()
{
  char v1 = *v0;
  sub_1000176C0();
  sub_100011700(v1);
  sub_1000172F0();
  swift_bridgeObjectRelease();
  return sub_1000176E0();
}

uint64_t sub_100011CC4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100012898(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100011CF4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100011700(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100011D20()
{
  return sub_100011910(*v0);
}

uint64_t sub_100011D28@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100012898(a1, a2);
  *a3 = result;
  return result;
}

void sub_100011D50(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_100011D5C(uint64_t a1)
{
  unint64_t v2 = sub_100013394();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011D98(uint64_t a1)
{
  unint64_t v2 = sub_100013394();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100011DD4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000047A8(&qword_100021208);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000954C(a1, a1[3]);
  sub_100013394();
  sub_100017700();
  LOBYTE(v11) = 0;
  sub_1000175E0();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_100017610();
    LOBYTE(v11) = 2;
    sub_1000175D0();
    LOBYTE(v11) = 3;
    sub_1000175D0();
    uint64_t v11 = *(void *)(v3 + 40);
    HIBYTE(v10) = 4;
    sub_1000047A8(&qword_1000211E0);
    sub_1000135E4(&qword_100021210);
    sub_100017600();
    LOBYTE(v11) = 5;
    sub_100017610();
    LOBYTE(v11) = 6;
    sub_1000175D0();
    LOBYTE(v11) = 7;
    sub_1000175D0();
    LOBYTE(v11) = 8;
    sub_1000175F0();
    LOBYTE(v11) = 9;
    sub_1000175F0();
    LOBYTE(v11) = 10;
    sub_1000175D0();
    uint64_t v11 = *(void *)(v3 + 120);
    HIBYTE(v10) = 11;
    sub_1000047A8(&qword_1000211F0);
    sub_100013648(&qword_100021218, (void (*)(void))sub_1000136B8);
    sub_100017600();
    LOBYTE(v11) = 12;
    sub_1000175D0();
    LOBYTE(v11) = 13;
    sub_1000175C0();
    LOBYTE(v11) = 14;
    sub_1000175C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_1000121D8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000128E4(a1, v9);
  if (!v2)
  {
    long long v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v9[10];
    long long v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    __n128 result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_10001223C(void *a1)
{
  return sub_100011DD4(a1);
}

void sub_100012254(void *a1@<X0>, uint64_t a2@<X8>)
{
  long long v5 = self;
  id v6 = [a1 parameters];
  id v7 = [v6 dictionaryRepresentation];

  sub_100017290();
  Class isa = sub_100017280().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&long long v48 = 0;
  id v9 = [v5 dataWithJSONObject:isa options:0 error:&v48];

  id v10 = (id)v48;
  if (!v9)
  {
    uint64_t v14 = v10;
    sub_100017180();

    swift_willThrow();
    goto LABEL_5;
  }
  uint64_t v11 = sub_100017220();
  unint64_t v13 = v12;

  sub_1000170D0();
  swift_allocObject();
  sub_1000170C0();
  sub_100013760();
  sub_1000170B0();
  if (v2)
  {
    sub_1000137B4(v11, v13);
    swift_release();
LABEL_5:
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100017250();
    sub_10000471C(v15, (uint64_t)qword_100022C60);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v16 = sub_100017230();
    os_log_type_t v17 = sub_100017430();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      unint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v18 = 138412290;
      swift_errorRetain();
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v48 = v20;
      sub_100017450();
      void *v19 = v20;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Couldn't form MusicAppSelectionPFLPluginArgs: %@", v18, 0xCu);
      sub_1000047A8(&qword_100020C70);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10001370C();
    swift_allocError();
    *BOOL v21 = 0;
    swift_willThrow();

    swift_errorRelease();
    return;
  }
  sub_1000137B4(v11, v13);
  swift_release();
  long long v47 = v58;
  uint64_t v45 = v57;
  uint64_t v46 = v65;
  if (*(void *)(v52 + 16) == v53)
  {
    uint64_t v42 = v67;
    uint64_t v43 = v66;
    uint64_t v41 = v64;
    uint64_t v40 = v62;
    uint64_t v38 = v61;
    uint64_t v39 = v59;
    unint64_t v22 = a1;
    uint64_t v23 = v49;
    uint64_t v24 = v51;
    uint64_t v25 = v52;
    uint64_t v26 = v55;
    uint64_t v44 = v63;
    uint64_t v37 = v60;
    uint64_t v27 = v50;
    long long v35 = v48;
    uint64_t v36 = v53;
    uint64_t v28 = v54;
    uint64_t v29 = v56;

    *(_OWORD *)a2 = v35;
    *(void *)(a2 + 16) = v23;
    *(void *)(a2 + 24) = v27;
    *(void *)(a2 + 32) = v24;
    *(void *)(a2 + 40) = v25;
    *(void *)(a2 + 48) = v36;
    *(void *)(a2 + 56) = v28;
    *(void *)(a2 + 64) = v26;
    *(void *)(a2 + 72) = v29;
    *(void *)(a2 + 80) = v45;
    *(_OWORD *)(a2 + 88) = v47;
    *(void *)(a2 + 104) = v39;
    *(void *)(a2 + 112) = v37;
    *(void *)(a2 + 120) = v38;
    *(void *)(a2 + 128) = v40;
    *(void *)(a2 + 136) = v44;
    *(void *)(a2 + 144) = v41;
    *(void *)(a2 + 152) = v46;
    *(void *)(a2 + 160) = v43;
    *(void *)(a2 + 168) = v42;
  }
  else
  {
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_100017250();
    sub_10000471C(v30, (uint64_t)qword_100022C60);
    float v31 = sub_100017230();
    os_log_type_t v32 = sub_100017430();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 134218240;
      sub_100017450();
      *(_WORD *)(v33 + 12) = 1024;
      sub_100017450();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Size of featureNames (%ld is not equal to featureCount (%u", (uint8_t *)v33, 0x12u);
      swift_slowDealloc();
    }

    sub_10001370C();
    swift_allocError();
    *char v34 = 1;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100012898(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001C9C8;
  v6._object = a2;
  unint64_t v4 = sub_100017550(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xF) {
    return 15;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000128E4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = sub_1000047A8(&qword_1000211D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v66 = a1;
  sub_10000954C(a1, v9);
  sub_100013394();
  sub_1000176F0();
  if (v2) {
    return sub_10000491C((uint64_t)v66);
  }
  uint64_t v10 = v6;
  uint64_t v61 = a2;
  LOBYTE(v78[0]) = 0;
  sub_100017580();
  unsigned int v12 = v11;
  LOBYTE(v78[0]) = 1;
  unsigned int v13 = sub_1000175B0();
  LOBYTE(v78[0]) = 2;
  uint64_t v60 = sub_100017570();
  LOBYTE(v78[0]) = 3;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_100017570();
  uint64_t v65 = v15;
  uint64_t v59 = v16;
  uint64_t v18 = v17;
  sub_1000047A8(&qword_1000211E0);
  LOBYTE(v67) = 4;
  sub_1000135E4(&qword_1000211E8);
  swift_bridgeObjectRetain();
  sub_1000175A0();
  uint64_t v64 = v18;
  uint64_t v19 = v78[0];
  LOBYTE(v78[0]) = 5;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  int v57 = sub_1000175B0();
  uint64_t v58 = v20;
  LOBYTE(v78[0]) = 6;
  uint64_t v56 = sub_100017570();
  LOBYTE(v78[0]) = 7;
  uint64_t v22 = v21;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_100017570();
  uint64_t v63 = v22;
  uint64_t v55 = v23;
  LOBYTE(v78[0]) = 8;
  uint64_t v25 = v24;
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_100017590();
  uint64_t v62 = v25;
  unsigned int v53 = v13;
  LOBYTE(v78[0]) = 9;
  uint64_t v52 = sub_100017590();
  LOBYTE(v78[0]) = 10;
  uint64_t v50 = sub_100017570();
  uint64_t v51 = v26;
  sub_1000047A8(&qword_1000211F0);
  LOBYTE(v67) = 11;
  sub_100013648(&qword_1000211F8, (void (*)(void))sub_100013430);
  swift_bridgeObjectRetain();
  sub_1000175A0();
  uint64_t v27 = v78[0];
  LOBYTE(v78[0]) = 12;
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_100017570();
  uint64_t v29 = v28;
  LOBYTE(v78[0]) = 13;
  swift_bridgeObjectRetain();
  *(void *)&long long v48 = sub_100017560();
  *((void *)&v48 + 1) = v30;
  char v95 = 14;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_100017560();
  unint64_t v47 = v32;
  uint64_t v33 = v31;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
  *(void *)&long long v67 = __PAIR64__(v53, v12);
  *((void *)&v67 + 1) = v60;
  *(void *)&long long v68 = v65;
  *((void *)&v68 + 1) = v59;
  *(void *)&long long v69 = v64;
  *((void *)&v69 + 1) = v58;
  LODWORD(v70) = v57;
  *((void *)&v70 + 1) = v56;
  *(void *)&long long v71 = v63;
  *((void *)&v71 + 1) = v55;
  *(void *)&long long v72 = v62;
  uint64_t v34 = v51;
  *((void *)&v72 + 1) = v54;
  *(void *)&long long v73 = v52;
  *((void *)&v73 + 1) = v50;
  *(void *)&long long v74 = v51;
  uint64_t v35 = *((void *)&v48 + 1);
  *((void *)&v74 + 1) = v27;
  *(void *)&long long v75 = v49;
  *((void *)&v75 + 1) = v29;
  long long v76 = v48;
  unsigned long long v77 = __PAIR128__(v47, v33);
  uint64_t v46 = v33;
  sub_100013484((uint64_t)&v67);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v36 = v58;
  swift_bridgeObjectRelease();
  uint64_t v37 = v63;
  swift_bridgeObjectRelease();
  uint64_t v38 = v62;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000491C((uint64_t)v66);
  v78[0] = __PAIR64__(v53, v12);
  v78[1] = v60;
  v78[2] = v65;
  v78[3] = v59;
  v78[4] = v64;
  v78[5] = v36;
  int v79 = v57;
  uint64_t v80 = v56;
  uint64_t v81 = v37;
  uint64_t v82 = v55;
  uint64_t v83 = v38;
  uint64_t v84 = v54;
  uint64_t v85 = v52;
  uint64_t v86 = v50;
  uint64_t v87 = v34;
  uint64_t v88 = v27;
  uint64_t v89 = v49;
  uint64_t v90 = v29;
  uint64_t v91 = v48;
  uint64_t v92 = v35;
  uint64_t v93 = v46;
  unint64_t v94 = v47;
  uint64_t result = sub_100013534((uint64_t)v78);
  long long v40 = v76;
  uint64_t v41 = v61;
  v61[8] = v75;
  v41[9] = v40;
  v41[10] = v77;
  long long v42 = v72;
  v41[4] = v71;
  v41[5] = v42;
  long long v43 = v74;
  v41[6] = v73;
  v41[7] = v43;
  long long v44 = v68;
  _OWORD *v41 = v67;
  v41[1] = v44;
  long long v45 = v70;
  v41[2] = v69;
  v41[3] = v45;
  return result;
}

unint64_t sub_100013394()
{
  unint64_t result = qword_1000211D8;
  if (!qword_1000211D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000211D8);
  }
  return result;
}

uint64_t sub_1000133E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100013430()
{
  unint64_t result = qword_100021200;
  if (!qword_100021200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021200);
  }
  return result;
}

uint64_t sub_100013484(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013534(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000135E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000133E8(&qword_1000211E0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013648(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000133E8(&qword_1000211F0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000136B8()
{
  unint64_t result = qword_100021220;
  if (!qword_100021220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021220);
  }
  return result;
}

unint64_t sub_10001370C()
{
  unint64_t result = qword_100021228;
  if (!qword_100021228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021228);
  }
  return result;
}

unint64_t sub_100013760()
{
  unint64_t result = qword_100021230;
  if (!qword_100021230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021230);
  }
  return result;
}

uint64_t sub_1000137B4(uint64_t a1, unint64_t a2)
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

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x100013968);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgs.CodingKeys()
{
  return &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys;
}

unint64_t sub_1000139A4()
{
  unint64_t result = qword_100021238;
  if (!qword_100021238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021238);
  }
  return result;
}

unint64_t sub_1000139FC()
{
  unint64_t result = qword_100021240;
  if (!qword_100021240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021240);
  }
  return result;
}

unint64_t sub_100013A54()
{
  unint64_t result = qword_100021248;
  if (!qword_100021248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021248);
  }
  return result;
}

uint64_t sub_100013AA8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000047A8(&qword_100021320);
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100017200();
  uint64_t v8 = *(void *)(v53 - 8);
  uint64_t v9 = __chkstk_darwin(v53);
  uint64_t v50 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v52 = (char *)v47 - v11;
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100017250();
  uint64_t v51 = sub_10000471C(v12, (uint64_t)qword_100022C60);
  unsigned int v13 = sub_100017230();
  os_log_type_t v14 = sub_100017410();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Initialising MusicAppSelectionPFLPluginRunner.", v15, 2u);
    swift_slowDealloc();
  }

  id v16 = a1;
  sub_100012254(v16, (uint64_t)v55);
  if (v2)
  {

LABEL_12:
    type metadata accessor for MusicAppSelectionPFLPluginRunner();
    swift_deallocPartialClassInstance();
    return v3;
  }
  long long v65 = *(_OWORD *)((char *)&v56[1] + 8);
  long long v66 = *(_OWORD *)((char *)v56 + 8);
  long long v63 = *(_OWORD *)((char *)v55 + 8);
  long long v64 = *(_OWORD *)((char *)&v55[1] + 8);
  long long v17 = v55[1];
  *(_OWORD *)(v3 + 16) = v55[0];
  *(_OWORD *)(v3 + 32) = v17;
  long long v19 = v56[2];
  long long v18 = v57;
  *(_OWORD *)(v3 + 80) = v56[1];
  *(_OWORD *)(v3 + 96) = v19;
  long long v20 = v56[0];
  *(_OWORD *)(v3 + 48) = v55[2];
  *(_OWORD *)(v3 + 64) = v20;
  long long v21 = v61;
  *(_OWORD *)(v3 + 160) = v60;
  *(_OWORD *)(v3 + 176) = v21;
  long long v22 = v59;
  *(_OWORD *)(v3 + 128) = v58;
  *(_OWORD *)(v3 + 144) = v22;
  uint64_t v48 = v8;
  uint64_t v23 = (_OWORD *)(v3 + 16);
  v47[1] = *((void *)&v57 + 1);
  uint64_t v24 = *((void *)&v55[2] + 1);
  uint64_t v62 = *((void *)&v55[2] + 1);
  *(_OWORD *)(v3 + 112) = v18;
  type metadata accessor for BiomeSQLClient();
  uint64_t v25 = swift_allocObject();
  id v49 = v16;
  uint64_t v26 = v25;
  *(void *)(v25 + 16) = 0;
  *(void *)(v25 + 24) = [objc_allocWithZone((Class)BMSQLDatabase) init];
  *(void *)(v3 + 192) = v26;
  type metadata accessor for BiomeSQLRowAggregator();
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_100008F6C(&_swiftEmptyArrayStorage);
  *(_OWORD *)(v27 + 24) = *(_OWORD *)((char *)v55 + 8);
  *(_OWORD *)(v27 + 40) = *(_OWORD *)((char *)&v55[1] + 8);
  *(_OWORD *)(v27 + 56) = *(_OWORD *)((char *)&v56[1] + 8);
  *(void *)(v27 + 72) = v24;
  *(_OWORD *)(v27 + 80) = *(_OWORD *)((char *)v56 + 8);
  *(void *)(v3 + 200) = v27;
  id v28 = v49;
  sub_100016FF8((uint64_t)&v63);
  sub_100016FF8((uint64_t)&v64);
  sub_100016FF8((uint64_t)&v65);
  sub_100017024((uint64_t)&v62);
  sub_100016FF8((uint64_t)&v66);
  swift_bridgeObjectRetain();
  sub_1000140AC(v28, (uint64_t)v7);
  swift_bridgeObjectRelease();
  uint64_t v29 = v48;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v7, 1, v53) == 1)
  {
    sub_100017050((uint64_t)v7);
    uint64_t v30 = sub_100017230();
    os_log_type_t v31 = sub_100017430();
    if (os_log_type_enabled(v30, v31))
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Model attachment not found", v32, 2u);
      swift_slowDealloc();
    }

    sub_100016E54();
    swift_allocError();
    unsigned char *v33 = 0;
    swift_willThrow();

    long long v38 = *(_OWORD *)(v3 + 160);
    v54[8] = *(_OWORD *)(v3 + 144);
    v54[9] = v38;
    v54[10] = *(_OWORD *)(v3 + 176);
    long long v39 = *(_OWORD *)(v3 + 96);
    v54[4] = *(_OWORD *)(v3 + 80);
    v54[5] = v39;
    long long v40 = *(_OWORD *)(v3 + 128);
    v54[6] = *(_OWORD *)(v3 + 112);
    v54[7] = v40;
    long long v41 = *(_OWORD *)(v3 + 32);
    v54[0] = *v23;
    v54[1] = v41;
    long long v42 = *(_OWORD *)(v3 + 64);
    v54[2] = *(_OWORD *)(v3 + 48);
    v54[3] = v42;
    sub_100013534((uint64_t)v54);
    swift_release();
    swift_release();
    goto LABEL_12;
  }
  (*(void (**)(void))(v29 + 32))();
  id v34 = [objc_allocWithZone((Class)MLModelConfiguration) init];
  [v34 setComputeUnits:0];
  uint64_t v35 = v50;
  sub_1000171C0();
  double v36 = *(float *)v23;
  type metadata accessor for ModelTrainer();
  swift_allocObject();
  id v37 = v34;
  *(void *)(v3 + 208) = sub_10000ADD4(v35, v37, v36);
  long long v44 = sub_100017230();
  os_log_type_t v45 = sub_100017410();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v46 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Finished initialising MusicAppSelectionPFLPluginRunner.", v46, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v52, v53);
  return v3;
}

uint64_t sub_1000140AC@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000047A8(&qword_100021320);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 attachments];
  NSString v8 = sub_1000172B0();
  id v9 = [v7 attachmentURLsForBasename:v8];

  uint64_t v10 = sub_100017200();
  uint64_t v11 = sub_100017350();

  unint64_t v12 = *(void *)(v11 + 16);
  if (v12 < 2) {
    goto LABEL_13;
  }
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100017250();
  sub_10000471C(v13, (uint64_t)qword_100022C60);
  swift_bridgeObjectRetain_n();
  os_log_type_t v14 = sub_100017230();
  os_log_type_t v15 = sub_100017430();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = v17;
    *(_DWORD *)id v16 = 136315138;
    uint64_t v18 = *(void *)(v11 + 16);
    uint64_t v19 = *(void *)(v10 - 8);
    uint64_t v20 = v19;
    v27[1] = v17;
    if (v18)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v6, v11 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80)), v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v6, 0, 1, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v6, 1, v10) != 1)
      {
        uint64_t v21 = sub_1000171A0();
        unint64_t v23 = v22;
        (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v10);
LABEL_11:
        v27[2] = sub_100006A54(v21, v23, &v28);
        sub_100017450();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Multiple 'model.mil' attachments found. Using the first: %s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_12;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v6, 1, 1, v10);
    }
    sub_100017050((uint64_t)v6);
    unint64_t v23 = 0xE700000000000000;
    uint64_t v21 = 0x6E776F6E6B6E75;
    goto LABEL_11;
  }

  swift_bridgeObjectRelease_n();
LABEL_12:
  unint64_t v12 = *(void *)(v11 + 16);
LABEL_13:
  uint64_t v24 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, v11+ ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80)), v10);
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(a2, v25, 1, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000144CC()
{
  id v2 = v0;
  if (qword_100020B20 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100017250();
  sub_10000471C(v3, (uint64_t)qword_100022C60);
  uint64_t v4 = sub_100017230();
  os_log_type_t v5 = sub_100017410();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Executing SQL query.", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *((void *)v2 + 24);
  sub_100003C70(*((void *)v2 + 18), *((void *)v2 + 19));
  if (v1) {
    return (uint64_t)v2;
  }
  id v9 = sub_100017230();
  os_log_type_t v10 = sub_100017410();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Aggregating SQL rows.", v11, 2u);
    swift_slowDealloc();
  }

  for (uint64_t i = *(void **)(v7 + 16); i; uint64_t i = *(void **)(v7 + 16))
  {
    if (![i next]) {
      break;
    }
    uint64_t v13 = sub_100003FB4();
    sub_100004BAC((uint64_t)v13);
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = *((void *)v2 + 25) + 16;
  swift_beginAccess();
  uint64_t v15 = *(void *)(*(void *)v14 + 16);
  id v16 = sub_100017230();
  if (!v15)
  {
    os_log_type_t v25 = sub_100017430();
    if (os_log_type_enabled(v16, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v25, "No Biome datapoints found, returning empty MLRTaskResult", v26, 2u);
      swift_slowDealloc();
    }

    sub_100016E54();
    swift_allocError();
    *uint64_t v27 = 5;
    swift_willThrow();
    return (uint64_t)v2;
  }
  os_log_type_t v17 = sub_100017410();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Producing MLBatchProvider for training.", v18, 2u);
    swift_slowDealloc();
  }

  int64_t v19 = sub_10000592C();
  swift_retain();
  uint64_t v20 = sub_100017230();
  os_log_type_t v21 = sub_100017410();
  uint64_t v70 = v14;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    v74[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315650;
    uint64_t v23 = *((void *)v2 + 15);
    unint64_t v24 = *((void *)v2 + 16);
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_100006A54(v23, v24, v74);
    sub_100017450();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2048;
    uint64_t v75 = v15;
    sub_100017450();
    *(_WORD *)(v22 + 22) = 1024;
    LODWORD(v75) = *((_DWORD *)v2 + 5);
    sub_100017450();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Training model %s with %ld datapoints for %u epochs.", (uint8_t *)v22, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  uint64_t v28 = *((void *)v2 + 26);
  int v29 = *((_DWORD *)v2 + 5);
  uint64_t v30 = swift_bridgeObjectRetain();
  uint64_t v31 = sub_10000F4C0(v30);
  swift_bridgeObjectRelease();
  sub_10000B818(v29, v19, v31);
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  id v37 = v36;
  unsigned int v71 = v38;
  swift_bridgeObjectRelease();
  uint64_t v72 = sub_10000CA24(v33, v35, v37, v71);

  uint64_t result = swift_bridgeObjectRelease();
  int64_t v39 = 0;
  uint64_t v40 = *(void *)v70;
  uint64_t v41 = 1 << *(unsigned char *)(*(void *)v70 + 32);
  uint64_t v42 = -1;
  if (v41 < 64) {
    uint64_t v42 = ~(-1 << v41);
  }
  uint64_t v44 = *(void *)(v40 + 64);
  uint64_t v43 = v40 + 64;
  unint64_t v45 = v42 & v44;
  int64_t v46 = (unint64_t)(v41 + 63) >> 6;
  for (float j = 0.0;
        ;
        float j = j
          + (float)*(uint64_t *)(*(void *)(*(void *)(*(void *)(*(void *)v70 + 56) + 8 * v49) + 16) + 24))
  {
    if (v45)
    {
      unint64_t v48 = __clz(__rbit64(v45));
      v45 &= v45 - 1;
      unint64_t v49 = v48 | (v39 << 6);
      continue;
    }
    int64_t v50 = v39 + 1;
    if (__OFADD__(v39, 1))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      return result;
    }
    if (v50 >= v46) {
      goto LABEL_45;
    }
    unint64_t v51 = *(void *)(v43 + 8 * v50);
    ++v39;
    if (!v51)
    {
      int64_t v39 = v50 + 1;
      if (v50 + 1 >= v46) {
        goto LABEL_45;
      }
      unint64_t v51 = *(void *)(v43 + 8 * v39);
      if (!v51)
      {
        int64_t v39 = v50 + 2;
        if (v50 + 2 >= v46) {
          goto LABEL_45;
        }
        unint64_t v51 = *(void *)(v43 + 8 * v39);
        if (!v51)
        {
          int64_t v39 = v50 + 3;
          if (v50 + 3 >= v46) {
            goto LABEL_45;
          }
          unint64_t v51 = *(void *)(v43 + 8 * v39);
          if (!v51)
          {
            int64_t v39 = v50 + 4;
            if (v50 + 4 >= v46) {
              goto LABEL_45;
            }
            unint64_t v51 = *(void *)(v43 + 8 * v39);
            if (!v51) {
              break;
            }
          }
        }
      }
    }
LABEL_44:
    unint64_t v45 = (v51 - 1) & v51;
    unint64_t v49 = __clz(__rbit64(v51)) + (v39 << 6);
  }
  int64_t v52 = v50 + 5;
  if (v52 < v46)
  {
    unint64_t v51 = *(void *)(v43 + 8 * v52);
    if (!v51)
    {
      while (1)
      {
        int64_t v39 = v52 + 1;
        if (__OFADD__(v52, 1)) {
          goto LABEL_60;
        }
        if (v39 >= v46) {
          goto LABEL_45;
        }
        unint64_t v51 = *(void *)(v43 + 8 * v39);
        ++v52;
        if (v51) {
          goto LABEL_44;
        }
      }
    }
    int64_t v39 = v52;
    goto LABEL_44;
  }
LABEL_45:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v74[0] = v72;
  sub_1000079E4(0x43656C706D617845, 0xEC000000746E756FLL, isUniquelyReferenced_nonNull_native, j);
  uint64_t v54 = v74[0];
  uint64_t v75 = v74[0];
  swift_bridgeObjectRelease();
  id v55 = [*(id *)(v28 + 16) copyCurrentTrainingDelta];
  id v56 = [v55 flattenedModelUpdate];

  if (v56)
  {
    uint64_t v57 = sub_100017220();
    unint64_t v59 = v58;
  }
  else
  {
    uint64_t v57 = 0;
    unint64_t v59 = 0xF000000000000000;
  }
  long long v60 = (void *)*((void *)v2 + 23);
  if (v60)
  {
    uint64_t v73 = v57;
    uint64_t v61 = *((void *)v2 + 22);
    swift_bridgeObjectRetain_n();
    uint64_t v62 = sub_100017230();
    os_log_type_t v63 = sub_100017410();
    if (os_log_type_enabled(v62, v63))
    {
      long long v64 = (uint8_t *)swift_slowAlloc();
      v74[0] = swift_slowAlloc();
      *(_DWORD *)long long v64 = 136315138;
      swift_bridgeObjectRetain();
      sub_100006A54(v61, (unint64_t)v60, v74);
      sub_100017450();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Writing deltas and metrics to %s", v64, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v57 = v73;
    sub_10001533C(v61, v60, v54, v73, v59);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  long long v65 = sub_100017230();
  os_log_type_t v66 = sub_100017410();
  if (os_log_type_enabled(v65, v66))
  {
    long long v67 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)long long v67 = 134217984;
    v74[0] = *(void *)(v54 + 16);
    sub_100017450();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Finishing plugin by returning %ld metrics and weight delta.", v67, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_100014F2C(v75);
  swift_bridgeObjectRelease();
  v68.super.Class isa = sub_100017280().super.isa;
  swift_bridgeObjectRelease();
  Class isa = 0;
  if (v59 >> 60 != 15)
  {
    Class isa = sub_100017210().super.isa;
    sub_100015328(v57, v59);
  }
  id v2 = [objc_allocWithZone((Class)MLRTaskResult) initWithJSONResult:v68.super.isa unprivatizedVector:isa];
  swift_unknownObjectRelease();

  return (uint64_t)v2;
}

unint64_t sub_100014F2C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_1000047A8(&qword_100020C78);
    id v2 = (void *)sub_100017530();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  os_log_type_t v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for Float;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100004904();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    unint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000490C(v6, v7);
    sub_10000490C(v7, v40);
    sub_10000490C(v40, &v38);
    unint64_t result = sub_1000070AC(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      unint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      id v16 = v10;
      os_log_type_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v17 = v35;
      v17[1] = v36;
      os_log_type_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_10000491C((uint64_t)v18);
      unint64_t result = (unint64_t)sub_10000490C(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_10000490C(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100015288()
{
  long long v1 = v0[10];
  v7[8] = v0[9];
  v7[9] = v1;
  v7[10] = v0[11];
  long long v2 = v0[6];
  v7[4] = v0[5];
  v7[5] = v2;
  long long v3 = v0[8];
  v7[6] = v0[7];
  v7[7] = v3;
  long long v4 = v0[2];
  v7[0] = v0[1];
  v7[1] = v4;
  long long v5 = v0[4];
  v7[2] = v0[3];
  v7[3] = v5;
  sub_100013534((uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicAppSelectionPFLPluginRunner()
{
  return self;
}

uint64_t sub_100015328(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000137B4(a1, a2);
  }
  return a1;
}

uint64_t sub_10001533C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v201 = a4;
  uint64_t v190 = a3;
  v197 = a2;
  *(void *)&long long v196 = a1;
  uint64_t v186 = sub_1000172E0();
  uint64_t v185 = *(void *)(v186 - 8);
  uint64_t v6 = __chkstk_darwin(v186);
  v191 = (char *)&v178 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v188 = (char *)&v178 - v8;
  uint64_t v194 = sub_100017100();
  v192 = *(void (**)(uint64_t, char *, uint64_t))(v194 - 8);
  __chkstk_darwin(v194);
  v193 = (void (*)(uint64_t, uint64_t))((char *)&v178 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v195 = (void *)sub_100017190();
  uint64_t v10 = *(v195 - 1);
  __chkstk_darwin(v195);
  unint64_t v12 = (char *)&v178 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000047A8(&qword_100021320);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v178 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100017200();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v19 = __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v178 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v23 = __chkstk_darwin(v22);
  __chkstk_darwin(v23);
  uint64_t v25 = __chkstk_darwin((char *)&v178 - v24);
  uint64_t v27 = (char *)&v178 - v26;
  uint64_t v28 = __chkstk_darwin(v25);
  int64_t v33 = (char *)&v178 - v32;
  if (a5 >> 60 == 15)
  {
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_100017250();
    sub_10000471C(v34, (uint64_t)qword_100022C60);
    uint64_t v35 = sub_100017230();
    os_log_type_t v36 = sub_100017430();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Weight deltas is nil", v37, 2u);
      swift_slowDealloc();
    }

    sub_100016E54();
    swift_allocError();
    *long long v38 = 1;
    return swift_willThrow();
  }
  unint64_t v40 = a5;
  v181 = (void (*)(void, void))v28;
  v179 = v21;
  uint64_t v178 = v31;
  uint64_t v182 = v30;
  uint64_t v180 = v29;
  uint64_t v41 = self;
  sub_100016EA8(v201, v40);
  id v42 = [v41 defaultManager];
  uint64_t v200 = v17;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v199 = v16;
  v43(v15, 1, 1, v16);
  id v44 = v42;
  (*(void (**)(char *, void, void *))(v10 + 104))(v12, enum case for URL.DirectoryHint.inferFromPath(_:), v195);
  swift_bridgeObjectRetain();
  sub_1000171F0();
  sub_1000171C0();
  sub_1000171E0();
  NSString v45 = sub_1000172B0();
  swift_bridgeObjectRelease();
  unsigned __int8 v46 = [v44 fileExistsAtPath:v45];

  unint64_t v189 = v40;
  unint64_t v47 = v33;
  v198 = v33;
  v183 = v27;
  id v184 = v44;
  if ((v46 & 1) == 0)
  {
    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_100017250();
    uint64_t v49 = sub_10000471C(v48, (uint64_t)qword_100022C60);
    uint64_t v50 = v200;
    uint64_t v51 = v200 + 16;
    int64_t v52 = v181;
    uint64_t v53 = v199;
    v195 = *(void **)(v200 + 16);
    ((void (*)(void (*)(void, void), char *, uint64_t))v195)(v181, v27, v199);
    uint64_t v54 = sub_100017230();
    os_log_type_t v55 = sub_100017420();
    BOOL v56 = os_log_type_enabled(v54, v55);
    v197 = (void *)v49;
    *(void *)&long long v196 = v51;
    if (v56)
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      v203[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315138;
      uint64_t v58 = sub_1000171E0();
      uint64_t v202 = sub_100006A54(v58, v59, (uint64_t *)v203);
      sub_100017450();
      swift_bridgeObjectRelease();
      v181 = *(void (**)(void, void))(v200 + 8);
      v181(v52, v53);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Creating directories at %s", v57, 0xCu);
      swift_arrayDestroy();
      id v44 = v184;
      swift_slowDealloc();
      uint64_t v27 = v183;
      swift_slowDealloc();
    }
    else
    {
      v181 = *(void (**)(void, void))(v50 + 8);
      v181(v52, v53);
    }

    sub_1000171B0(v60);
    uint64_t v62 = v61;
    v203[0] = 0;
    unsigned int v63 = [v44 createDirectoryAtURL:v61 withIntermediateDirectories:1 attributes:0 error:v203];

    unint64_t v47 = v198;
    if (!v63)
    {
      id v97 = v203[0];
      sub_100017180();

      swift_willThrow();
      v98 = v179;
      uint64_t v99 = v199;
      ((void (*)(char *, char *, uint64_t))v195)(v179, v27, v199);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v100 = sub_100017230();
      os_log_type_t v101 = sub_100017430();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v102 = swift_slowAlloc();
        *(void *)&long long v196 = swift_slowAlloc();
        v197 = (void *)swift_slowAlloc();
        v203[0] = v197;
        *(_DWORD *)uint64_t v102 = 136315394;
        uint64_t v103 = sub_1000171E0();
        uint64_t v202 = sub_100006A54(v103, v104, (uint64_t *)v203);
        sub_100017450();
        swift_bridgeObjectRelease();
        Swift::Int v105 = v98;
        uint64_t v106 = (void (*)(char *, uint64_t))v181;
        v181(v105, v199);
        *(_WORD *)(v102 + 12) = 2112;
        swift_errorRetain();
        uint64_t v107 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v202 = v107;
        sub_100017450();
        *(void *)long long v196 = v107;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v100, v101, "Couldn't create directory at %s: %@", (uint8_t *)v102, 0x16u);
        sub_1000047A8(&qword_100020C70);
        swift_arrayDestroy();
        uint64_t v27 = v183;
        uint64_t v99 = v199;
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v125 = v98;
        uint64_t v106 = (void (*)(char *, uint64_t))v181;
        v181(v125, v99);
        swift_errorRelease();
        swift_errorRelease();
      }

      sub_100016E54();
      swift_allocError();
      unsigned char *v126 = 2;
      swift_willThrow();

      sub_100015328(v201, v189);
      swift_errorRelease();
      v106(v27, v99);
      return ((uint64_t (*)(char *, uint64_t))v106)(v198, v99);
    }
    id v64 = v203[0];
  }
  sub_1000171E0();
  NSString v65 = sub_1000172B0();
  swift_bridgeObjectRelease();
  unsigned int v66 = [v44 fileExistsAtPath:v65];

  if (v66)
  {
    sub_1000171E0();
    NSString v67 = sub_1000172B0();
    swift_bridgeObjectRelease();
    v203[0] = 0;
    unsigned int v68 = [v44 removeItemAtPath:v67 error:v203];

    if (!v68)
    {
      id v108 = v203[0];
      sub_100017180();

      swift_willThrow();
      sub_100015328(v201, v189);
      v109 = *(void (**)(char *, uint64_t))(v200 + 8);
      uint64_t v110 = v199;
      v109(v27, v199);
      return ((uint64_t (*)(char *, uint64_t))v109)(v47, v110);
    }
    uint64_t v69 = qword_100020B20;
    id v70 = v203[0];
    uint64_t v71 = v199;
    uint64_t v72 = v200;
    if (v69 != -1) {
      swift_once();
    }
    uint64_t v73 = sub_100017250();
    sub_10000471C(v73, (uint64_t)qword_100022C60);
    uint64_t v74 = v178;
    (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v178, v47, v71);
    uint64_t v75 = sub_100017230();
    os_log_type_t v76 = sub_100017420();
    if (os_log_type_enabled(v75, v76))
    {
      unsigned long long v77 = (uint8_t *)swift_slowAlloc();
      v203[0] = (id)swift_slowAlloc();
      *(_DWORD *)unsigned long long v77 = 136315138;
      uint64_t v78 = sub_1000171E0();
      uint64_t v202 = sub_100006A54(v78, v79, (uint64_t *)v203);
      uint64_t v80 = v200;
      sub_100017450();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v74, v71);
      os_log_type_t v81 = v76;
      uint64_t v82 = v80;
      _os_log_impl((void *)&_mh_execute_header, v75, v81, "Attempted removing existing file %s", v77, 0xCu);
      swift_arrayDestroy();
      unint64_t v47 = v198;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v74, v71);

      uint64_t v82 = v72;
    }
  }
  else
  {
    sub_1000171D0(1);
    NSString v83 = sub_1000172B0();
    swift_bridgeObjectRelease();
    unsigned int v84 = [v44 createFileAtPath:v83 contents:0 attributes:0];

    if (qword_100020B20 != -1) {
      swift_once();
    }
    uint64_t v85 = sub_100017250();
    sub_10000471C(v85, (uint64_t)qword_100022C60);
    uint64_t v86 = sub_100017230();
    os_log_type_t v87 = sub_100017420();
    BOOL v88 = os_log_type_enabled(v86, v87);
    uint64_t v89 = v199;
    uint64_t v90 = v200;
    if (v88)
    {
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v91 = 67109120;
      LODWORD(v203[0]) = v84;
      sub_100017450();
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Attempted creating file with success: %{BOOL}d", v91, 8u);
      swift_slowDealloc();
    }

    uint64_t v82 = v90;
    uint64_t v71 = v89;
  }
  unint64_t v92 = v189;
  unint64_t v93 = v189 >> 62;
  sub_100017130();
  swift_allocObject();
  uint64_t v94 = sub_100017120();
  sub_1000047A8(&qword_100021328);
  char v95 = (_OWORD *)swift_allocObject();
  long long v196 = xmmword_100017C90;
  v95[1] = xmmword_100017C90;
  sub_1000170F0();
  sub_1000170E0();
  v203[0] = v95;
  sub_100016F5C(&qword_100021330, (void (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting);
  sub_1000047A8(&qword_100021338);
  sub_100016F00();
  sub_1000174B0();
  sub_100017110();
  switch((int)v93)
  {
    case 1:
      uint64_t v111 = v201;
      if (v111 >> 32 < (int)v111)
      {
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
      }
      sub_100016EA8(v201, v92);
      v112 = (char *)sub_100017140();
      if (v112)
      {
        uint64_t v113 = sub_100017160();
        uint64_t v114 = (int)v111 - v113;
        if (!__OFSUB__((int)v111, v113))
        {
          uint64_t v115 = sub_100017150();
          v112 += v114;
          if (v115 >= (v111 >> 32) - (int)v111) {
            uint64_t v116 = (v111 >> 32) - (int)v111;
          }
          else {
            uint64_t v116 = v115;
          }
          uint64_t v96 = v116 / 4;
          sub_100015328(v201, v92);
          goto LABEL_59;
        }
        goto LABEL_80;
      }
      sub_100017150();
      sub_100015328(v111, v92);
      uint64_t v96 = 0;
LABEL_59:
      v124 = &BiomeSQLClient;
      uint64_t v82 = v200;
LABEL_60:
      uint64_t v194 = (uint64_t)sub_100008048(v112, v96);
      if (v124[39].base_prots != (__objc2_prot_list *)-1) {
        swift_once();
      }
      uint64_t v132 = sub_100017250();
      uint64_t v133 = sub_10000471C(v132, (uint64_t)qword_100022C60);
      uint64_t v134 = v182;
      v192 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 16);
      v192(v182, v47, v71);
      v197 = (void *)v133;
      v135 = sub_100017230();
      os_log_type_t v136 = sub_100017420();
      BOOL v137 = os_log_type_enabled(v135, v136);
      v195 = (void *)v94;
      if (v137)
      {
        v138 = (uint8_t *)swift_slowAlloc();
        v203[0] = (id)swift_slowAlloc();
        *(_DWORD *)v138 = 136315138;
        sub_100016F5C((unint64_t *)&qword_100021060, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v139 = sub_100017630();
        uint64_t v202 = sub_100006A54(v139, v140, (uint64_t *)v203);
        uint64_t v71 = v199;
        sub_100017450();
        swift_bridgeObjectRelease();
        v193 = *(void (**)(uint64_t, uint64_t))(v200 + 8);
        v193(v134, v71);
        _os_log_impl((void *)&_mh_execute_header, v135, v136, "Writing deltas and metrics to %s", v138, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v193 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
        v193(v134, v71);
      }

      v141 = v191;
      uint64_t v142 = v190;
      sub_1000047A8(&qword_100020E98);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v196;
      *(void *)(inited + 32) = 0x7363697274656DLL;
      *(void *)(inited + 40) = 0xE700000000000000;
      uint64_t v144 = sub_1000047A8(&qword_100021348);
      *(void *)(inited + 48) = v142;
      *(void *)(inited + 72) = v144;
      *(void *)(inited + 80) = 0x73746867696577;
      *(void *)(inited + 88) = 0xE700000000000000;
      *(void *)(inited + 120) = sub_1000047A8(&qword_100021350);
      *(void *)(inited + 96) = v194;
      swift_bridgeObjectRetain();
      sub_10000496C(inited);
      v145 = self;
      Class isa = sub_100017280().super.isa;
      v203[0] = 0;
      id v147 = [v145 dataWithJSONObject:isa options:3 error:v203];

      id v148 = v203[0];
      if (v147)
      {
        uint64_t v149 = sub_100017220();
        unint64_t v151 = v150;

        sub_1000172D0();
        v152 = (void *)sub_1000172C0();
        if (v153)
        {
          v203[0] = v152;
          v203[1] = v153;
          sub_1000172D0();
          sub_100016FA4();
          v154 = v198;
          uint64_t v155 = v187;
          sub_100017470();
          if (!v155)
          {
            sub_1000137B4(v149, v151);

            swift_release();
            sub_100015328(v201, v189);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v185 + 8))(v141, v186);
            v177 = (void (*)(char *, uint64_t))v193;
            v193((uint64_t)v183, v71);
            v177(v154, v71);
            return swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v185 + 8))(v141, v186);
          sub_1000137B4(v149, v151);
          swift_bridgeObjectRelease();
        }
        else
        {
          v157 = sub_100017230();
          os_log_type_t v158 = sub_100017430();
          if (os_log_type_enabled(v157, v158))
          {
            v159 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v159 = 0;
            _os_log_impl((void *)&_mh_execute_header, v157, v158, "Couldn't convert JSON data to String with UTF-8", v159, 2u);
            swift_slowDealloc();
          }

          sub_100016E54();
          swift_allocError();
          unsigned char *v160 = 3;
          swift_willThrow();
          sub_1000137B4(v149, v151);
        }
      }
      else
      {
        v156 = v148;
        sub_100017180();

        swift_willThrow();
      }
      uint64_t v161 = v180;
      v192(v180, v198, v71);
      swift_errorRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      v162 = sub_100017230();
      os_log_type_t v163 = sub_100017430();
      int v164 = v163;
      if (os_log_type_enabled(v162, v163))
      {
        uint64_t v165 = swift_slowAlloc();
        v192 = (void (*)(uint64_t, char *, uint64_t))swift_slowAlloc();
        v197 = (void *)swift_slowAlloc();
        v203[0] = v197;
        *(_DWORD *)uint64_t v165 = 136315650;
        LODWORD(v194) = v164;
        swift_bridgeObjectRetain();
        *(void *)&long long v196 = (char *)&type metadata for Any + 8;
        uint64_t v166 = sub_1000172A0();
        unint64_t v168 = v167;
        swift_bridgeObjectRelease();
        uint64_t v202 = sub_100006A54(v166, v168, (uint64_t *)v203);
        sub_100017450();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v165 + 12) = 2080;
        sub_100016F5C((unint64_t *)&qword_100021060, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v169 = sub_100017630();
        uint64_t v202 = sub_100006A54(v169, v170, (uint64_t *)v203);
        sub_100017450();
        swift_bridgeObjectRelease();
        uint64_t v171 = v161;
        v172 = (void (*)(char *, uint64_t))v193;
        v193(v171, v71);
        *(_WORD *)(v165 + 22) = 2112;
        swift_errorRetain();
        uint64_t v173 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v202 = v173;
        sub_100017450();
        *(void *)v192 = v173;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v162, (os_log_type_t)v194, "Couldn't write %s to file %s: %@", (uint8_t *)v165, 0x20u);
        sub_1000047A8(&qword_100020C70);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        uint64_t v174 = v161;
        v172 = (void (*)(char *, uint64_t))v193;
        v193(v174, v71);
        swift_errorRelease();
        swift_errorRelease();
      }

      id v175 = v184;
      sub_100016E54();
      swift_allocError();
      unsigned char *v176 = 4;
      swift_willThrow();

      swift_release();
      sub_100015328(v201, v189);
      swift_errorRelease();
      v172(v183, v71);
      return ((uint64_t (*)(char *, uint64_t))v172)(v198, v71);
    case 2:
      uint64_t v117 = *(void *)(v201 + 16);
      uint64_t v118 = *(void *)(v201 + 24);
      swift_retain();
      swift_retain();
      uint64_t v119 = sub_100017140();
      if (v119)
      {
        uint64_t v120 = v119;
        uint64_t v121 = v82;
        uint64_t v122 = sub_100017160();
        if (__OFSUB__(v117, v122)) {
          goto LABEL_81;
        }
        v123 = (char *)(v120 + v117 - v122);
      }
      else
      {
        uint64_t v121 = v82;
        v123 = 0;
      }
      BOOL v127 = __OFSUB__(v118, v117);
      uint64_t v128 = v118 - v117;
      if (!v127)
      {
        uint64_t v129 = sub_100017150();
        swift_release();
        swift_release();
        if (v129 >= v128) {
          uint64_t v130 = v128;
        }
        else {
          uint64_t v130 = v129;
        }
        uint64_t v131 = v130 / 4;
        if (v123) {
          v112 = v123;
        }
        else {
          v112 = 0;
        }
        if (v123) {
          uint64_t v96 = v131;
        }
        else {
          uint64_t v96 = 0;
        }
        v124 = &BiomeSQLClient;
        uint64_t v82 = v121;
        uint64_t v71 = v199;
        goto LABEL_60;
      }
      goto LABEL_79;
    case 3:
      uint64_t v96 = 0;
      goto LABEL_42;
    default:
      uint64_t v96 = (v92 >> 50) & 0x3F;
LABEL_42:
      v112 = (char *)v203;
      v124 = &BiomeSQLClient;
      goto LABEL_60;
  }
}

unint64_t sub_100016E54()
{
  unint64_t result = qword_100021318;
  if (!qword_100021318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021318);
  }
  return result;
}

uint64_t sub_100016EA8(uint64_t a1, unint64_t a2)
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

unint64_t sub_100016F00()
{
  unint64_t result = qword_100021340;
  if (!qword_100021340)
  {
    sub_1000133E8(&qword_100021338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021340);
  }
  return result;
}

uint64_t sub_100016F5C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100016FA4()
{
  unint64_t result = qword_100021358;
  if (!qword_100021358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021358);
  }
  return result;
}

uint64_t sub_100016FF8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100017024(uint64_t a1)
{
  return a1;
}

uint64_t sub_100017050(uint64_t a1)
{
  uint64_t v2 = sub_1000047A8(&qword_100021320);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000170B0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000170C0()
{
  return JSONDecoder.init()();
}

uint64_t sub_1000170D0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1000170E0()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t sub_1000170F0()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t sub_100017100()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t sub_100017110()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t sub_100017120()
{
  return JSONEncoder.init()();
}

uint64_t sub_100017130()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100017140()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100017150()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100017160()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100017170()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100017180()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100017190()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_1000171A0()
{
  return URL.absoluteString.getter();
}

void sub_1000171B0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000171C0()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_1000171D0(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_1000171E0()
{
  return URL.path.getter();
}

uint64_t sub_1000171F0()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100017200()
{
  return type metadata accessor for URL();
}

NSData sub_100017210()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100017220()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017230()
{
  return Logger.logObject.getter();
}

uint64_t sub_100017240()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100017250()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100017260()
{
  return BinaryFloatingPoint.init<A>(_:)();
}

uint64_t sub_100017270()
{
  return static BinaryFloatingPoint<>._convert<A>(from:)();
}

NSDictionary sub_100017280()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100017290()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000172A0()
{
  return Dictionary.description.getter();
}

NSString sub_1000172B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000172C0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1000172D0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000172E0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000172F0()
{
  return String.hash(into:)();
}

Swift::Int sub_100017300()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100017310()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100017320()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100017330()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100017340()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100017350()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017360()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100017370()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100017380()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100017390()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000173A0()
{
  return static Array<A>.== infix(_:_:)();
}

uint64_t sub_1000173B0()
{
  return Float.init(truncating:)();
}

NSSet sub_1000173C0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000173D0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000173E0()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_1000173F0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100017400()
{
  return BMSQLDatabase.execute(query:)();
}

uint64_t sub_100017410()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100017420()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100017430()
{
  return static os_log_type_t.error.getter();
}

NSNumber sub_100017440(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100017450()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100017460()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100017470()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t sub_100017480()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t sub_100017490()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t sub_1000174A0()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t sub_1000174B0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000174C0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000174D0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000174E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000174F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100017500()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100017510()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100017520()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100017530()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100017540()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100017550(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100017560()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100017570()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100017580()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100017590()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000175A0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000175B0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000175C0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_1000175D0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000175E0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000175F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100017600()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_100017610()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_100017620(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100017630()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100017640()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100017650()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100017660()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100017670()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100017680()
{
  return Error._domain.getter();
}

uint64_t sub_100017690()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000176B0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_1000176C0()
{
  return Hasher.init(_seed:)();
}

void sub_1000176D0(Swift::UInt a1)
{
}

Swift::Int sub_1000176E0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000176F0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100017700()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}