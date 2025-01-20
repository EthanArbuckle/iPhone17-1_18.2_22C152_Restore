BOOL sub_1000042D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000042E8()
{
  Swift::UInt v1 = *v0;
  sub_10000DDF8();
  sub_10000DE08(v1);
  return sub_10000DE18();
}

void sub_100004330()
{
  sub_10000DE08(*v0);
}

Swift::Int sub_10000435C()
{
  Swift::UInt v1 = *v0;
  sub_10000DDF8();
  sub_10000DE08(v1);
  return sub_10000DE18();
}

uint64_t sub_1000043B0(uint64_t a1, uint64_t a2, void (*a3)(long long *, uint64_t))
{
  sub_10000AF54(a1, (uint64_t)&v14, &qword_1000145B0);
  if (v15)
  {
    sub_10000AF3C(&v14, v16);
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10000DC08();
    sub_10000ABD4(v5, (uint64_t)qword_1000156E0);
    v6 = sub_10000DBE8();
    os_log_type_t v7 = sub_10000DC98();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Returning values to AMS", v8, 2u);
      swift_slowDealloc();
    }

    sub_10000AEE0((uint64_t)v16, (uint64_t)&v14);
    a3(&v14, 0);
    sub_10000B238((uint64_t)&v14, &qword_1000145B0);
    return sub_10000AB00((uint64_t)v16);
  }
  else
  {
    sub_10000B238((uint64_t)&v14, &qword_1000145B0);
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10000DC08();
    sub_10000ABD4(v10, (uint64_t)qword_1000156E0);
    v11 = sub_10000DBE8();
    os_log_type_t v12 = sub_10000DC88();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Tried to run command but no value was found", v13, 2u);
      swift_slowDealloc();
    }

    memset(v16, 0, sizeof(v16));
    a3(v16, a2);
    return sub_10000B238((uint64_t)v16, &qword_1000145B0);
  }
}

void sub_100004674(uint64_t a1, void *a2, uint64_t a3)
{
  sub_10000AF54(a1, (uint64_t)v11, &qword_1000145B0);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = sub_10000AB90(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = sub_10000DD88();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10000AB00((uint64_t)v11);
  if (a2) {
LABEL_3:
  }
    a2 = (void *)sub_10000DA68();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();
}

unint64_t sub_1000047E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000AC60(&qword_1000145D8);
  uint64_t v2 = sub_10000DD18();
  v3 = (void *)v2;
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
    sub_10000AF54(v6, (uint64_t)&v15, &qword_1000145E8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100008E3C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000AF3C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100004918(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000AC60(&qword_1000145E0);
  uint64_t v2 = (void *)sub_10000DD18();
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
    swift_bridgeObjectRetain();
    unint64_t result = sub_100008E3C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_100004A34(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_10000AC60(&qword_1000145D8);
    uint64_t v2 = (void *)sub_10000DD18();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  char v10 = (uint64_t *)&unk_1000145C0;
  uint64_t v11 = (char *)&type metadata for Any + 8;
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
          sub_10000AF4C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (int64_t i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000AC60(v10);
    swift_dynamicCast();
    sub_10000AF3C(v6, v7);
    sub_10000AF3C(v7, v40);
    sub_10000AF3C(v40, &v38);
    unint64_t result = sub_100008E3C(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      BOOL v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      long long v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *long long v17 = v35;
      v17[1] = v36;
      char v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_10000AB00((uint64_t)v18);
      unint64_t result = (unint64_t)sub_10000AF3C(&v38, v18);
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
    v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_10000AF3C(&v38, (_OWORD *)(v2[7] + 32 * result));
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

id sub_100004DE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BooksEngagementPluginProvider();
  return [super dealloc];
}

uint64_t type metadata accessor for BooksEngagementPluginProvider()
{
  return self;
}

uint64_t sub_100004E40(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t *, void))
{
  if (a1)
  {
    sub_100005344(a1, a1, v30);
    sub_10000AC60(&qword_1000145C8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000E1F0;
    *(void *)(inited + 32) = 0x65736E6F70736572;
    *(void *)(inited + 40) = 0xE800000000000000;
    sub_10000AEE0((uint64_t)v30, inited + 48);
    unint64_t v6 = sub_1000047E0(inited);
    sub_10000AC60(&qword_1000145D0);
    uint64_t v7 = swift_initStackObject();
    *(_OWORD *)(v7 + 16) = xmmword_10000E1F0;
    strcpy((char *)(v7 + 32), "json-payload");
    *(unsigned char *)(v7 + 45) = 0;
    *(_WORD *)(v7 + 46) = -5120;
    *(void *)(v7 + 48) = v6;
    unint64_t v8 = sub_100004918(v7);
    unint64_t v9 = sub_100004A34(v8);
    swift_bridgeObjectRelease();
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10000DC08();
    sub_10000ABD4(v10, (uint64_t)qword_1000156E0);
    uint64_t v11 = sub_10000DBE8();
    os_log_type_t v12 = sub_10000DC98();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "PerformRequest: Sending value back to AMS", v13, 2u);
      swift_slowDealloc();
    }

    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_10000DBE8();
    os_log_type_t v15 = sub_10000DC98();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      v29[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_10000DC18();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_1000087E4(v17, v19, v29);
      sub_10000DCA8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Plugin Response = %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v29[3] = sub_10000AC60(&qword_1000145C0);
    v29[0] = v9;
    a4(v29, 0);
    sub_10000AB00((uint64_t)v30);
    char v26 = v29;
  }
  else
  {
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_10000DC08();
    sub_10000ABD4(v22, (uint64_t)qword_1000156E0);
    swift_bridgeObjectRetain_n();
    int64_t v23 = sub_10000DBE8();
    os_log_type_t v24 = sub_10000DC88();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      v30[0] = (char *)swift_slowAlloc();
      *(_DWORD *)unint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      v29[0] = sub_1000087E4(a2, a3, (uint64_t *)v30);
      sub_10000DCA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to get propertyValues for %s, returning empty response", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v27 = (char *)sub_10000ADE4();
    v30[3] = (char *)sub_10000AC60(&qword_1000145C0);
    v30[0] = v27;
    a4((uint64_t *)v30, 0);
    char v26 = (uint64_t *)v30;
  }
  return sub_10000B238((uint64_t)v26, &qword_1000145B0);
}

uint64_t sub_100005344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  if (!a1 || !*(void *)(a1 + 16))
  {
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10000DC08();
    sub_10000ABD4(v12, (uint64_t)qword_1000156E0);
    uint64_t v13 = sub_10000DBE8();
    os_log_type_t v14 = sub_10000DC98();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Engagement Property did not return any property value", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = *(void *)(a2 + 16);
    if (v16)
    {
      uint64_t v17 = a2 + 32;
      swift_bridgeObjectRetain();
      unint64_t v18 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000AFB8(v17, (uint64_t)v32);
        sub_10000B088((uint64_t)v32, (void (*)(void, void, void, void, void, void))sub_10000B014);
        sub_10000DB78();
        sub_10000B088((uint64_t)v32, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
        if (v30)
        {
          sub_10000AF3C(&v29, v31);
          sub_10000AF3C(v31, &v29);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v18 = sub_1000086D4(0, *((void *)v18 + 2) + 1, 1, v18);
          }
          unint64_t v20 = *((void *)v18 + 2);
          unint64_t v19 = *((void *)v18 + 3);
          if (v20 >= v19 >> 1) {
            unint64_t v18 = sub_1000086D4((char *)(v19 > 1), v20 + 1, 1, v18);
          }
          *((void *)v18 + 2) = v20 + 1;
          sub_10000AF3C(&v29, &v18[32 * v20 + 32]);
        }
        else
        {
          sub_10000B238((uint64_t)&v29, &qword_1000145B0);
        }
        v17 += 48;
        --v16;
      }
      while (v16);
      goto LABEL_33;
    }
LABEL_34:
    unint64_t v18 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_35;
  }
  sub_10000AFB8(a1 + 32, (uint64_t)&v29);
  sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B014);
  if (qword_1000144B8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000DC08();
  sub_10000ABD4(v5, (uint64_t)qword_1000156E0);
  sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B014);
  sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B014);
  unint64_t v6 = sub_10000DBE8();
  os_log_type_t v7 = sub_10000DC98();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 136315138;
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B014);
    uint64_t v9 = sub_10000DB88();
    unint64_t v11 = v10;
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
    *(void *)&v31[0] = sub_1000087E4(v9, v11, v32);
    sub_10000DCA8();
    swift_bridgeObjectRelease();
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Engagement Property found a value of type: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
  }

  sub_10000AFB8((uint64_t)&v29, (uint64_t)v32);
  if (v33)
  {
    sub_10000B088((uint64_t)&v29, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
    uint64_t v21 = *(void *)(a2 + 16);
    if (v21)
    {
      uint64_t v22 = a2 + 32;
      swift_bridgeObjectRetain();
      unint64_t v18 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000AFB8(v22, (uint64_t)v31);
        sub_10000B088((uint64_t)v31, (void (*)(void, void, void, void, void, void))sub_10000B014);
        sub_10000DB78();
        sub_10000B088((uint64_t)v31, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
        if (v27)
        {
          sub_10000AF3C(&v26, v28);
          sub_10000AF3C(v28, &v26);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v18 = sub_1000086D4(0, *((void *)v18 + 2) + 1, 1, v18);
          }
          unint64_t v24 = *((void *)v18 + 2);
          unint64_t v23 = *((void *)v18 + 3);
          if (v24 >= v23 >> 1) {
            unint64_t v18 = sub_1000086D4((char *)(v23 > 1), v24 + 1, 1, v18);
          }
          *((void *)v18 + 2) = v24 + 1;
          sub_10000AF3C(&v26, &v18[32 * v24 + 32]);
        }
        else
        {
          sub_10000B238((uint64_t)&v26, &qword_1000145B0);
        }
        v22 += 48;
        --v21;
      }
      while (v21);
LABEL_33:
      swift_bridgeObjectRelease();
LABEL_35:
      uint64_t result = sub_10000AC60(&qword_1000145F0);
      a3[3] = (char *)result;
      *a3 = v18;
      return result;
    }
    goto LABEL_34;
  }
  return sub_10000DB78();
}

uint64_t sub_100005930(uint64_t a1, void (*a2)(long long *, void), uint64_t a3)
{
  uint64_t v83 = a3;
  uint64_t v79 = sub_10000DB68();
  uint64_t v5 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  v78 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000AC60(&qword_100014600);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000DAF8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v82 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  if (a1)
  {
    v76 = (char *)&v70 - v14;
    v77 = (void (*)(long long *, void))a2;
    id v85 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
    uint64_t v15 = *(void *)(a1 + 16);
    *(void *)&long long v84 = v10;
    if (v15)
    {
      uint64_t v16 = a1 + 32;
      swift_bridgeObjectRetain();
      uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000AFB8(v16, (uint64_t)v90);
        sub_10000B088((uint64_t)v90, (void (*)(void, void, void, void, void, void))sub_10000B014);
        sub_10000DB78();
        sub_10000B088((uint64_t)v90, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
        if (v87)
        {
          sub_10000AF3C(&v86, &v88);
          sub_10000AF3C(&v88, &v86);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v17 = sub_1000086D4(0, *((void *)v17 + 2) + 1, 1, v17);
          }
          unint64_t v19 = *((void *)v17 + 2);
          unint64_t v18 = *((void *)v17 + 3);
          if (v19 >= v18 >> 1) {
            uint64_t v17 = sub_1000086D4((char *)(v18 > 1), v19 + 1, 1, v17);
          }
          *((void *)v17 + 2) = v19 + 1;
          sub_10000AF3C(&v86, &v17[32 * v19 + 32]);
        }
        else
        {
          sub_10000B238((uint64_t)&v86, &qword_1000145B0);
        }
        v16 += 48;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
    }
    long long v26 = sub_100006534((uint64_t)v17);
    swift_bridgeObjectRelease();
    if (v26)
    {
      uint64_t v27 = v26[2];
      if (v27)
      {
        uint64_t v28 = v26 + 4;
        v80 = (void (**)(char *, char *, uint64_t))(v11 + 32);
        v81 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
        v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
        v73 = (void (**)(char *, uint64_t))(v5 + 8);
        v74 = (void (**)(char *, uint64_t))(v11 + 8);
        long long v29 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v30 = &type metadata for String;
        v72 = v26;
        v71 = v9;
        while (1)
        {
          uint64_t v31 = *v28;
          if (*(void *)(*v28 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v32 = sub_100008E3C(0x7461447472617473, 0xE900000000000065);
            if ((v33 & 1) != 0
              && (sub_10000AEE0(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v88), (swift_dynamicCast() & 1) != 0))
            {
              uint64_t v34 = v30;
              NSString v35 = sub_10000DC28();
              swift_bridgeObjectRelease();
              id v36 = [v85 dateFromString:v35];

              if (v36)
              {
                uint64_t v37 = v82;
                sub_10000DAD8();

                long long v38 = *v80;
                uint64_t v39 = v37;
                uint64_t v40 = v84;
                (*v80)(v9, v39, v84);
                (*v81)(v9, 0, 1, v40);
                if ((*v75)(v9, 1, v40) != 1)
                {
                  v41 = v76;
                  v38(v76, v9, v40);
                  uint64_t v42 = v40;
                  v43 = v78;
                  sub_10000DB58();
                  char v44 = sub_10000DB08();
                  (*v73)(v43, v79);
                  if (v44)
                  {
                    uint64_t v89 = sub_10000AC60(&qword_1000145C0);
                    *(void *)&long long v88 = v31;
                    uint64_t v30 = v34;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      long long v29 = sub_1000086D4(0, *((void *)v29 + 2) + 1, 1, v29);
                    }
                    uint64_t v9 = v71;
                    unint64_t v46 = *((void *)v29 + 2);
                    unint64_t v45 = *((void *)v29 + 3);
                    if (v46 >= v45 >> 1) {
                      long long v29 = sub_1000086D4((char *)(v45 > 1), v46 + 1, 1, v29);
                    }
                    *((void *)v29 + 2) = v46 + 1;
                    sub_10000AF3C(&v88, &v29[32 * v46 + 32]);
                    (*v74)(v76, v84);
                  }
                  else
                  {
                    (*v74)(v41, v42);
                    swift_bridgeObjectRelease();
                    uint64_t v30 = v34;
                    uint64_t v9 = v71;
                  }
                  goto LABEL_23;
                }
              }
              else
              {
                (*v81)(v9, 1, 1, v84);
              }
              swift_bridgeObjectRelease();
              sub_10000B238((uint64_t)v9, &qword_100014600);
              uint64_t v30 = v34;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
LABEL_23:
          ++v28;
          if (!--v27) {
            goto LABEL_44;
          }
        }
      }
      long long v29 = (char *)&_swiftEmptyArrayStorage;
LABEL_44:
      swift_bridgeObjectRelease();
      uint64_t v89 = sub_10000AC60(&qword_1000145F0);
      *(void *)&long long v88 = v29;
      sub_10000AC60(&qword_1000145C8);
      uint64_t inited = swift_initStackObject();
      long long v84 = xmmword_10000E1F0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1F0;
      *(void *)(inited + 32) = 0x65736E6F70736572;
      *(void *)(inited + 40) = 0xE800000000000000;
      sub_10000AEE0((uint64_t)&v88, inited + 48);
      unint64_t v54 = sub_1000047E0(inited);
      sub_10000AC60(&qword_1000145D0);
      uint64_t v55 = swift_initStackObject();
      *(_OWORD *)(v55 + 16) = v84;
      strcpy((char *)(v55 + 32), "json-payload");
      *(unsigned char *)(v55 + 45) = 0;
      *(_WORD *)(v55 + 46) = -5120;
      *(void *)(v55 + 48) = v54;
      unint64_t v56 = sub_100004918(v55);
      unint64_t v57 = sub_100004A34(v56);
      swift_bridgeObjectRelease();
      sub_10000AB00((uint64_t)&v88);
      if (qword_1000144B8 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_10000DC08();
      sub_10000ABD4(v58, (uint64_t)qword_1000156E0);
      v59 = sub_10000DBE8();
      os_log_type_t v60 = sub_10000DC98();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "PerformRequest: Sending value back to AMS", v61, 2u);
        swift_slowDealloc();
      }

      swift_bridgeObjectRetain_n();
      v62 = sub_10000DBE8();
      os_log_type_t v63 = sub_10000DC98();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v88 = swift_slowAlloc();
        *(_DWORD *)v64 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_10000DC18();
        unint64_t v67 = v66;
        swift_bridgeObjectRelease();
        *(void *)&long long v86 = sub_1000087E4(v65, v67, (uint64_t *)&v88);
        sub_10000DCA8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "Plugin Response = %s", v64, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v68 = v77;
      uint64_t v89 = sub_10000AC60(&qword_1000145C0);
      *(void *)&long long v88 = v57;
      v68(&v88, 0);
    }
    else
    {
      v47 = v77;
      if (qword_1000144B8 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_10000DC08();
      sub_10000ABD4(v48, (uint64_t)qword_1000156E0);
      v49 = sub_10000DBE8();
      os_log_type_t v50 = sub_10000DC88();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to cast response from session, returning empty response", v51, 2u);
        swift_slowDealloc();
      }

      unint64_t v52 = sub_10000ADE4();
      uint64_t v89 = sub_10000AC60(&qword_1000145C0);
      *(void *)&long long v88 = v52;
      v47(&v88, 0);
    }

    unint64_t v25 = &v88;
  }
  else
  {
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_10000DC08();
    sub_10000ABD4(v20, (uint64_t)qword_1000156E0);
    uint64_t v21 = sub_10000DBE8();
    os_log_type_t v22 = sub_10000DC88();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to get propertyValues for 'session', returning empty response", v23, 2u);
      swift_slowDealloc();
    }

    unint64_t v24 = sub_10000ADE4();
    v90[3] = sub_10000AC60(&qword_1000145C0);
    v90[0] = v24;
    a2(v90, 0);
    unint64_t v25 = (long long *)v90;
  }
  return sub_10000B238((uint64_t)v25, &qword_1000145B0);
}

void *sub_100006534(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = &_swiftEmptyArrayStorage;
  sub_100008F98(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_10000AEE0(i, (uint64_t)v9);
      sub_10000AC60(&qword_1000145C0);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100008F98(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100008F98(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v6 + 1;
      v3[v6 + 4] = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_10000667C(uint64_t a1, void (*a2)(long long *, void), uint64_t a3)
{
  uint64_t v6 = sub_10000AC60(&qword_100014600);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10000DAF8();
  uint64_t v9 = __chkstk_darwin(v81);
  *(void *)&long long v79 = (char *)v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v75 = (char *)v71 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v71 - v14;
  if (a1)
  {
    uint64_t v77 = v13;
    id v80 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
    v78 = v15;
    sub_10000DAA8();
    uint64_t v16 = *(void *)(a1 + 16);
    if (v16)
    {
      uint64_t v17 = a1 + 32;
      swift_bridgeObjectRetain();
      unint64_t v18 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000AFB8(v17, (uint64_t)v86);
        sub_10000B088((uint64_t)v86, (void (*)(void, void, void, void, void, void))sub_10000B014);
        sub_10000DB78();
        sub_10000B088((uint64_t)v86, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
        if (v83)
        {
          sub_10000AF3C(&v82, &v84);
          sub_10000AF3C(&v84, &v82);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v18 = sub_1000086D4(0, *((void *)v18 + 2) + 1, 1, v18);
          }
          unint64_t v20 = *((void *)v18 + 2);
          unint64_t v19 = *((void *)v18 + 3);
          if (v20 >= v19 >> 1) {
            unint64_t v18 = sub_1000086D4((char *)(v19 > 1), v20 + 1, 1, v18);
          }
          *((void *)v18 + 2) = v20 + 1;
          sub_10000AF3C(&v82, &v18[32 * v20 + 32]);
        }
        else
        {
          sub_10000B238((uint64_t)&v82, &qword_1000145B0);
        }
        v17 += 48;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v18 = (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v27 = sub_100006534((uint64_t)v18);
    swift_bridgeObjectRelease();
    if (v27)
    {
      v71[2] = a3;
      v72 = a2;
      uint64_t v28 = v27[2];
      v71[1] = v27;
      if (v28)
      {
        long long v29 = v27 + 4;
        v76 = (void (**)(char *, uint64_t, uint64_t))(v77 + 32);
        uint64_t v30 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
        v73 = (unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48);
        v71[0] = v77 + 8;
        v74 = &_swiftEmptyDictionarySingleton;
        uint64_t v31 = &type metadata for String;
        while (1)
        {
          unint64_t v32 = (void *)*v29;
          if (*(void *)(*v29 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v33 = sub_100008E3C(0x7461447472617473, 0xE900000000000065);
            if (v34 & 1) != 0 && (sub_10000AEE0(v32[7] + 32 * v33, (uint64_t)&v84), (swift_dynamicCast()))
            {
              NSString v35 = sub_10000DC28();
              swift_bridgeObjectRelease();
              id v36 = [v80 dateFromString:v35];

              if (v36)
              {
                uint64_t v37 = v31;
                uint64_t v38 = v79;
                sub_10000DAD8();

                uint64_t v39 = *v76;
                uint64_t v40 = v38;
                uint64_t v31 = v37;
                uint64_t v41 = v81;
                (*v76)(v8, v40, v81);
                (*v30)(v8, 0, 1, v41);
                if ((*v73)(v8, 1, v41) != 1)
                {
                  uint64_t v42 = v75;
                  uint64_t v43 = v81;
                  v39(v75, (uint64_t)v8, v81);
                  char v44 = sub_10000DAB8();
                  (*(void (**)(char *, uint64_t))v71[0])(v42, v43);
                  swift_bridgeObjectRelease();
                  if (v44) {
                    v74 = v32;
                  }
                  uint64_t v31 = v37;
                  goto LABEL_23;
                }
              }
              else
              {
                (*v30)(v8, 1, 1, v81);
              }
              swift_bridgeObjectRelease();
              sub_10000B238((uint64_t)v8, &qword_100014600);
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
LABEL_23:
          ++v29;
          if (!--v28) {
            goto LABEL_41;
          }
        }
      }
      v74 = &_swiftEmptyDictionarySingleton;
LABEL_41:
      swift_bridgeObjectRelease();
      uint64_t v52 = sub_10000AC60(&qword_1000145C0);
      uint64_t v85 = v52;
      *(void *)&long long v84 = v74;
      sub_10000AC60(&qword_1000145C8);
      uint64_t inited = swift_initStackObject();
      long long v79 = xmmword_10000E1F0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1F0;
      *(void *)(inited + 32) = 0x65736E6F70736572;
      *(void *)(inited + 40) = 0xE800000000000000;
      sub_10000AEE0((uint64_t)&v84, inited + 48);
      unint64_t v54 = sub_1000047E0(inited);
      sub_10000AC60(&qword_1000145D0);
      uint64_t v55 = swift_initStackObject();
      *(_OWORD *)(v55 + 16) = v79;
      strcpy((char *)(v55 + 32), "json-payload");
      *(unsigned char *)(v55 + 45) = 0;
      *(_WORD *)(v55 + 46) = -5120;
      *(void *)(v55 + 48) = v54;
      unint64_t v56 = sub_100004918(v55);
      unint64_t v57 = sub_100004A34(v56);
      swift_bridgeObjectRelease();
      sub_10000AB00((uint64_t)&v84);
      if (qword_1000144B8 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_10000DC08();
      sub_10000ABD4(v58, (uint64_t)qword_1000156E0);
      v59 = sub_10000DBE8();
      os_log_type_t v60 = sub_10000DC98();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "PerformRequest: Sending value back to AMS", v61, 2u);
        swift_slowDealloc();
      }

      swift_bridgeObjectRetain_n();
      v62 = sub_10000DBE8();
      os_log_type_t v63 = sub_10000DC98();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v84 = swift_slowAlloc();
        *(_DWORD *)v64 = 136315138;
        *(void *)&long long v79 = v64 + 4;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_10000DC18();
        unint64_t v67 = v66;
        swift_bridgeObjectRelease();
        *(void *)&long long v82 = sub_1000087E4(v65, v67, (uint64_t *)&v84);
        sub_10000DCA8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "Plugin Response = %s", v64, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v68 = v77;
      v69 = v78;
      uint64_t v85 = v52;
      *(void *)&long long v84 = v57;
      v72(&v84, 0);

      (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v81);
    }
    else
    {
      if (qword_1000144B8 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_10000DC08();
      sub_10000ABD4(v45, (uint64_t)qword_1000156E0);
      unint64_t v46 = sub_10000DBE8();
      os_log_type_t v47 = sub_10000DC88();
      BOOL v48 = os_log_type_enabled(v46, v47);
      uint64_t v49 = v77;
      if (v48)
      {
        os_log_type_t v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Failed to cast response from session, returning empty response", v50, 2u);
        swift_slowDealloc();
      }

      unint64_t v51 = sub_10000ADE4();
      uint64_t v85 = sub_10000AC60(&qword_1000145C0);
      *(void *)&long long v84 = v51;
      a2(&v84, 0);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v78, v81);
    }
    long long v26 = &v84;
  }
  else
  {
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10000DC08();
    sub_10000ABD4(v21, (uint64_t)qword_1000156E0);
    os_log_type_t v22 = sub_10000DBE8();
    os_log_type_t v23 = sub_10000DC88();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to get propertyValues for 'session', returning empty response", v24, 2u);
      swift_slowDealloc();
    }

    unint64_t v25 = sub_10000ADE4();
    v86[3] = sub_10000AC60(&qword_1000145C0);
    v86[0] = v25;
    a2((long long *)v86, 0);
    long long v26 = (long long *)v86;
  }
  return sub_10000B238((uint64_t)v26, &qword_1000145B0);
}

uint64_t sub_1000071A4(uint64_t a1, __objc2_prot_list *a2, uint64_t a3)
{
  uint64_t v146 = sub_10000DB28();
  uint64_t v145 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  v144 = (char *)&v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_10000DB38();
  uint64_t v7 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  *(void *)&long long v148 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_10000DB18();
  uint64_t v147 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v10 = (char *)&v130 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000AC60(&qword_100014600);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  v142 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v143 = (char *)&v130 - v14;
  uint64_t v15 = (void *)sub_10000DAF8();
  uint64_t v16 = (char *)*(v15 - 1);
  uint64_t v17 = __chkstk_darwin(v15);
  v141 = (char *)&v130 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v130 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  unint64_t v24 = (char *)&v130 - v23;
  __chkstk_darwin(v22);
  long long v26 = (char *)&v130 - v25;
  uint64_t v27 = sub_10000DB68();
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v29 = __chkstk_darwin(v28);
  if (!a1)
  {
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_10000DC08();
    sub_10000ABD4(v40, (uint64_t)qword_1000156E0);
    uint64_t v41 = sub_10000DBE8();
    os_log_type_t v42 = sub_10000DC88();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Failed to get propertyValues for 'session', returning empty response", v43, 2u);
      swift_slowDealloc();
    }

    unint64_t v44 = sub_10000ADE4();
    v155[3] = sub_10000AC60(&qword_1000145C0);
    v155[0] = v44;
    ((void (*)(void *, void))a2)(v155, 0);
    uint64_t v45 = (long long *)v155;
    return sub_10000B238((uint64_t)v45, &qword_1000145B0);
  }
  uint64_t v131 = v32;
  v132 = v21;
  v135 = v24;
  v137 = (char *)&v130 - v30;
  v138 = v26;
  uint64_t v133 = v31;
  uint64_t v134 = v29;
  v136 = v16;
  uint64_t v33 = *(void *)(a1 + 16);
  if (v33)
  {
    uint64_t v139 = v7;
    v140 = v15;
    uint64_t v34 = a3;
    NSString v35 = a2;
    uint64_t v36 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v37 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_10000AFB8(v36, (uint64_t)v155);
      sub_10000B088((uint64_t)v155, (void (*)(void, void, void, void, void, void))sub_10000B014);
      sub_10000DB78();
      sub_10000B088((uint64_t)v155, (void (*)(void, void, void, void, void, void))sub_10000B0C8);
      if (v152)
      {
        sub_10000AF3C(&v151, &v153);
        sub_10000AF3C(&v153, &v151);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v37 = sub_1000086D4(0, *((void *)v37 + 2) + 1, 1, v37);
        }
        unint64_t v39 = *((void *)v37 + 2);
        unint64_t v38 = *((void *)v37 + 3);
        if (v39 >= v38 >> 1) {
          uint64_t v37 = sub_1000086D4((char *)(v38 > 1), v39 + 1, 1, v37);
        }
        *((void *)v37 + 2) = v39 + 1;
        sub_10000AF3C(&v151, &v37[32 * v39 + 32]);
      }
      else
      {
        sub_10000B238((uint64_t)&v151, &qword_1000145B0);
      }
      v36 += 48;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    a2 = v35;
    a3 = v34;
    uint64_t v15 = v140;
    uint64_t v7 = v139;
  }
  else
  {
    uint64_t v37 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v46 = sub_100006534((uint64_t)v37);
  swift_bridgeObjectRelease();
  if (!v46)
  {
LABEL_36:
    if (qword_1000144B8 == -1)
    {
LABEL_37:
      uint64_t v69 = sub_10000DC08();
      sub_10000ABD4(v69, (uint64_t)qword_1000156E0);
      uint64_t v70 = sub_10000DBE8();
      os_log_type_t v71 = sub_10000DC88();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v72 = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "Failed to cast response from session, returning empty response", v72, 2u);
        swift_slowDealloc();
      }

      unint64_t v73 = sub_10000ADE4();
      *((void *)&v154 + 1) = sub_10000AC60(&qword_1000145C0);
      *(void *)&long long v153 = v73;
      ((void (*)(long long *, void))a2)(&v153, 0);
      goto LABEL_40;
    }
LABEL_82:
    swift_once();
    goto LABEL_37;
  }
  if (!v46[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  uint64_t v47 = v46[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v48 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
  if (!*(void *)(v47 + 16)
    || (unint64_t v49 = sub_100008E3C(0x47676E6964616572, 0xEB000000006C616FLL), (v50 & 1) == 0)
    || (sub_10000AEE0(*(void *)(v47 + 56) + 32 * v49, (uint64_t)&v153), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_10000DC08();
    sub_10000ABD4(v64, (uint64_t)qword_1000156E0);
    uint64_t v65 = sub_10000DBE8();
    os_log_type_t v66 = sub_10000DC88();
    if (os_log_type_enabled(v65, v66))
    {
      unint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to retrieve reading goal, returning empty response", v67, 2u);
      swift_slowDealloc();
    }

    unint64_t v68 = sub_10000ADE4();
    *((void *)&v154 + 1) = sub_10000AC60(&qword_1000145C0);
    *(void *)&long long v153 = v68;
    ((void (*)(long long *, void))a2)(&v153, 0);

    goto LABEL_40;
  }
  v140 = v48;
  uint64_t v139 = v47;
  uint64_t v130 = v151;
  sub_10000DB58();
  sub_10000DAE8();
  (*(void (**)(char *, void, uint64_t))(v147 + 104))(v10, enum case for Calendar.MatchingPolicy.nextTime(_:), v149);
  (*(void (**)(void, void, uint64_t))(v7 + 104))(v148, enum case for Calendar.RepeatedTimePolicy.first(_:), v150);
  uint64_t v51 = v145;
  uint64_t v52 = v7;
  v53 = v144;
  uint64_t v54 = v146;
  (*(void (**)(char *, void, uint64_t))(v145 + 104))(v144, enum case for Calendar.SearchDirection.forward(_:), v146);
  uint64_t v55 = (uint64_t)v143;
  sub_10000DB48();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v54);
  (*(void (**)(void, uint64_t))(v52 + 8))(v148, v150);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v10, v149);
  unint64_t v56 = v136;
  unint64_t v57 = (unsigned int (*)(uint64_t, uint64_t, void *))*((void *)v136 + 6);
  if (v57(v55, 1, v15) == 1)
  {
    swift_bridgeObjectRelease();
    sub_10000B238(v55, &qword_100014600);
    id v58 = v140;
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_10000DC08();
    sub_10000ABD4(v59, (uint64_t)qword_1000156E0);
    os_log_type_t v60 = sub_10000DBE8();
    os_log_type_t v61 = sub_10000DC88();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Failed computing the time remaining to reach the goal today", v62, 2u);
      swift_slowDealloc();
    }

    unint64_t v63 = sub_10000ADE4();
    *((void *)&v154 + 1) = sub_10000AC60(&qword_1000145C0);
    *(void *)&long long v153 = v63;
    ((void (*)(long long *, void))a2)(&v153, 0);

    (*((void (**)(char *, void *))v136 + 1))(v138, v15);
LABEL_68:
    (*(void (**)(char *, uint64_t))(v133 + 8))(v137, v134);
LABEL_40:
    uint64_t v45 = &v153;
    return sub_10000B238((uint64_t)v45, &qword_1000145B0);
  }
  uint64_t v149 = a3;
  uint64_t v150 = (uint64_t)a2;
  v75 = (void (*)(char *, uint64_t, void *))*((void *)v56 + 4);
  v75(v135, v55, v15);
  uint64_t v76 = v139;
  a2 = &BooksEngagementPluginProvider;
  if (!*(void *)(v139 + 16)
    || (unint64_t v77 = sub_100008E3C(1702125924, 0xE400000000000000), (v78 & 1) == 0)
    || (sub_10000AEE0(*(void *)(v76 + 56) + 32 * v77, (uint64_t)&v153), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v85 = v135;
LABEL_52:
    uint64_t v92 = v130;
    goto LABEL_53;
  }
  NSString v79 = sub_10000DC28();
  swift_bridgeObjectRelease();
  id v80 = [v140 dateFromString:v79];

  if (!v80)
  {
    uint64_t v82 = (uint64_t)v142;
    (*((void (**)(char *, uint64_t, uint64_t, void *))v136 + 7))(v142, 1, 1, v15);
    uint64_t v85 = v135;
    goto LABEL_70;
  }
  uint64_t v81 = v141;
  sub_10000DAD8();

  uint64_t v82 = (uint64_t)v142;
  v75(v142, (uint64_t)v81, v15);
  uint64_t v83 = v136;
  (*((void (**)(uint64_t, void, uint64_t, void *))v136 + 7))(v82, 0, 1, v15);
  unsigned int v84 = v57(v82, 1, v15);
  uint64_t v85 = v135;
  if (v84 == 1)
  {
LABEL_70:
    swift_bridgeObjectRelease();
    sub_10000B238(v82, &qword_100014600);
    goto LABEL_52;
  }
  long long v86 = v83;
  uint64_t v87 = v132;
  v75(v132, v82, v15);
  uint64_t v88 = v131;
  sub_10000DB58();
  char v89 = sub_10000DB08();
  (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v88, v134);
  if ((v89 & 1) == 0)
  {
    (*((void (**)(char *, void *))v86 + 1))(v87, v15);
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  uint64_t v90 = *(void *)(v76 + 16);
  uint64_t v91 = v76;
  uint64_t v92 = v130;
  if (v90 && (unint64_t v93 = sub_100008E3C(0xD000000000000013, 0x800000010000EA50), (v94 & 1) != 0))
  {
    sub_10000AEE0(*(void *)(v91 + 56) + 32 * v93, (uint64_t)&v153);
  }
  else
  {
    long long v153 = 0u;
    long long v154 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v154 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v92 = v151;
      if (qword_1000144B8 == -1) {
        goto LABEL_76;
      }
      goto LABEL_88;
    }
  }
  else
  {
    sub_10000B238((uint64_t)&v153, &qword_1000145B0);
  }
  (*((void (**)(char *, void *))v86 + 1))(v132, v15);
LABEL_53:
  long long v86 = v138;
  if (qword_1000144B8 != -1) {
    swift_once();
  }
  uint64_t v95 = sub_10000DC08();
  sub_10000ABD4(v95, (uint64_t)qword_1000156E0);
  v96 = sub_10000DBE8();
  os_log_type_t v97 = sub_10000DC98();
  if (os_log_type_enabled(v96, v97))
  {
    v98 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v98 = 0;
    _os_log_impl((void *)&_mh_execute_header, v96, v97, "No reading activity today", v98, 2u);
    long long v86 = v138;
    swift_slowDealloc();
  }

  sub_10000DAC8();
  double v100 = v99;
  sub_10000DAC8();
  double v102 = v100 - v101;
  if ((~*(void *)&v102 & 0x7FF0000000000000) != 0)
  {
    if (v102 > -9.22337204e18)
    {
      if (v102 < 9.22337204e18) {
        goto LABEL_60;
      }
      goto LABEL_87;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  swift_once();
LABEL_76:
  uint64_t v122 = sub_10000DC08();
  sub_10000ABD4(v122, (uint64_t)qword_1000156E0);
  v123 = sub_10000DBE8();
  os_log_type_t v124 = sub_10000DC98();
  if (os_log_type_enabled(v123, v124))
  {
    v125 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v125 = 134217984;
    uint64_t v85 = v135;
    *(void *)&long long v153 = v92;
    sub_10000DCA8();
    _os_log_impl((void *)&_mh_execute_header, v123, v124, "remainingTimeToRead: %ld", v125, 0xCu);
    long long v86 = v136;
    swift_slowDealloc();
  }

  sub_10000DAC8();
  double v127 = v126;
  sub_10000DAC8();
  double v129 = v128;
  uint64_t result = (*((uint64_t (**)(char *, void *))v86 + 1))(v132, v15);
  double v102 = v127 - v129;
  if ((~COERCE__INT64(v127 - v129) & 0x7FF0000000000000) != 0)
  {
    if (v102 > -9.22337204e18)
    {
      if (v102 >= 9.22337204e18)
      {
        __break(1u);
        goto LABEL_82;
      }
LABEL_60:
      *((void *)&v154 + 1) = &type metadata for Bool;
      LOBYTE(v153) = v92 < (uint64_t)v102;
      sub_10000AC60(&qword_1000145C8);
      uint64_t inited = swift_initStackObject();
      long long v148 = xmmword_10000E1F0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1F0;
      *(void *)(inited + 32) = 0x65736E6F70736572;
      *(void *)(inited + 40) = 0xE800000000000000;
      sub_10000AEE0((uint64_t)&v153, inited + 48);
      unint64_t v104 = sub_1000047E0(inited);
      sub_10000AC60(&qword_1000145D0);
      uint64_t v105 = swift_initStackObject();
      *(_OWORD *)(v105 + 16) = v148;
      strcpy((char *)(v105 + 32), "json-payload");
      *(unsigned char *)(v105 + 45) = 0;
      *(_WORD *)(v105 + 46) = -5120;
      *(void *)(v105 + 48) = v104;
      unint64_t v106 = sub_100004918(v105);
      unint64_t v107 = sub_100004A34(v106);
      swift_bridgeObjectRelease();
      sub_10000AB00((uint64_t)&v153);
      if (qword_1000144B8 != -1) {
        swift_once();
      }
      uint64_t v108 = sub_10000DC08();
      sub_10000ABD4(v108, (uint64_t)qword_1000156E0);
      v109 = sub_10000DBE8();
      os_log_type_t v110 = sub_10000DC98();
      if (os_log_type_enabled(v109, v110))
      {
        v111 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v111 = 0;
        _os_log_impl((void *)&_mh_execute_header, v109, v110, "PerformRequest: Sending value back to AMS", v111, 2u);
        swift_slowDealloc();
      }

      swift_bridgeObjectRetain_n();
      v112 = sub_10000DBE8();
      os_log_type_t v113 = sub_10000DC98();
      if (os_log_type_enabled(v112, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v153 = swift_slowAlloc();
        *(_DWORD *)v114 = 136315138;
        *(void *)&long long v148 = v114 + 4;
        swift_bridgeObjectRetain();
        uint64_t v115 = sub_10000DC18();
        v116 = v15;
        unint64_t v118 = v117;
        swift_bridgeObjectRelease();
        *(void *)&long long v151 = sub_1000087E4(v115, v118, (uint64_t *)&v153);
        sub_10000DCA8();
        swift_bridgeObjectRelease_n();
        uint64_t v15 = v116;
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "Plugin Response = %s", v114, 0xCu);
        uint64_t v85 = v135;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v119 = (void (*)(long long *, void))v150;
      id v120 = v140;
      *((void *)&v154 + 1) = sub_10000AC60(&qword_1000145C0);
      *(void *)&long long v153 = v107;
      v119(&v153, 0);

      v121 = (void (*)(char *, void *))*((void *)v136 + 1);
      v121(v85, v15);
      v121(v138, v15);
      goto LABEL_68;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_1000086D4(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000AC60(&qword_1000145F8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000B13C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000087E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000088B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AEE0((uint64_t)v12, *a3);
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
      sub_10000AEE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AB00((uint64_t)v12);
  return v7;
}

uint64_t sub_1000088B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000DCB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008A74(a5, a6);
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
  uint64_t v8 = sub_10000DCE8();
  if (!v8)
  {
    sub_10000DD08();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000DD28();
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

uint64_t sub_100008A74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008B0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008CEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008CEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008B0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008C84(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000DCD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000DD08();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000DC58();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000DD28();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000DD08();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008C84(uint64_t a1, uint64_t a2)
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
  sub_10000AC60(&qword_100014618);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008CEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000AC60(&qword_100014618);
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
  uint64_t result = sub_10000DD28();
  __break(1u);
  return result;
}

unint64_t sub_100008E3C(uint64_t a1, uint64_t a2)
{
  sub_10000DDF8();
  sub_10000DC38();
  Swift::Int v4 = sub_10000DE18();

  return sub_100008EB4(a1, a2, v4);
}

unint64_t sub_100008EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000DD98() & 1) == 0)
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
      while (!v14 && (sub_10000DD98() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100008F98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008FB8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100008FB8(char a1, int64_t a2, char a3, void *a4)
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
    sub_10000AC60(&qword_100014608);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_10000AC60(&qword_1000145C0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10000DD28();
  __break(1u);
  return result;
}

uint64_t sub_100009144()
{
  sub_10000AC60(&qword_100014610);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v1 = (char *)&v25 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000DA98();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v25 - v8;
  __chkstk_darwin(v7);
  int64_t v11 = (char *)&v25 - v10;
  id v12 = [self defaultManager];
  NSString v13 = sub_10000DC28();
  id v14 = [v12 containerURLForSecurityApplicationGroupIdentifier:v13];

  if (v14)
  {
    sub_10000DA88();

    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v15(v1, v9, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      v15(v11, v1, v2);
      sub_10000DA78();
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v9, v2);
      id v16 = objc_allocWithZone((Class)sub_10000DBA8());
      sub_10000DB98();
      id v17 = objc_allocWithZone((Class)sub_10000DBD8());
      uint64_t v18 = sub_10000DBB8();
      uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
      v19(v9, v2);
      v19(v11, v2);
      return v18;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  sub_10000B238((uint64_t)v1, &qword_100014610);
  if (qword_1000144B8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10000DC08();
  sub_10000ABD4(v20, (uint64_t)qword_1000156E0);
  uint64_t v21 = sub_10000DBE8();
  os_log_type_t v22 = sub_10000DC88();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Error while loading container for book messages. Ensure you have access to the application group folder.", v23, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_100009534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000AF54(a1, (uint64_t)&v29, &qword_1000145B0);
  if (!v30)
  {
    sub_10000B238((uint64_t)&v29, &qword_1000145B0);
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10000DC08();
    sub_10000ABD4(v15, (uint64_t)qword_1000156E0);
    id v16 = sub_10000DBE8();
    os_log_type_t v17 = sub_10000DC88();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Tried to run command but no value was found", v18, 2u);
      swift_slowDealloc();
    }

    memset(v31, 0, sizeof(v31));
    sub_10000AF54((uint64_t)v31, (uint64_t)&v29, &qword_1000145B0);
    uint64_t v19 = v30;
    if (v30)
    {
      uint64_t v20 = sub_10000AB90(&v29, v30);
      uint64_t v21 = *(void *)(v19 - 8);
      __chkstk_darwin(v20);
      uint64_t v23 = (char *)v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v21 + 16))(v23);
      uint64_t v24 = sub_10000DD88();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v19);
      sub_10000AB00((uint64_t)&v29);
      if (a2)
      {
LABEL_14:
        uint64_t v25 = (void *)sub_10000DA68();
LABEL_19:
        (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v24, v25);
        swift_unknownObjectRelease();

        return sub_10000B238((uint64_t)v31, &qword_1000145B0);
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (a2) {
        goto LABEL_14;
      }
    }
    uint64_t v25 = 0;
    goto LABEL_19;
  }
  sub_10000AF3C(&v29, v31);
  if (qword_1000144B8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000DC08();
  sub_10000ABD4(v5, (uint64_t)qword_1000156E0);
  unint64_t v6 = sub_10000DBE8();
  os_log_type_t v7 = sub_10000DC98();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Returning values to AMS", v8, 2u);
    swift_slowDealloc();
  }

  sub_10000AEE0((uint64_t)v31, (uint64_t)&v29);
  sub_10000AF54((uint64_t)&v29, (uint64_t)v27, &qword_1000145B0);
  uint64_t v9 = v28;
  if (v28)
  {
    uint64_t v10 = sub_10000AB90(v27, v28);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10);
    NSString v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    uint64_t v14 = sub_10000DD88();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    sub_10000AB00((uint64_t)v27);
  }
  else
  {
    uint64_t v14 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, v14, 0);
  swift_unknownObjectRelease();
  sub_10000B238((uint64_t)&v29, &qword_1000145B0);
  return sub_10000AB00((uint64_t)v31);
}

void sub_100009998(void *a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_10000DC08();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a3);
  _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  uint64_t v11 = self;
  sub_10000AB90(a1, a1[3]);
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  LODWORD(v11) = [v11 isValidJSONObject:sub_10000DD88()];
  swift_unknownObjectRelease();
  if (!v11)
  {
    *(void *)&long long v70 = 0;
    *((void *)&v70 + 1) = 0xE000000000000000;
    v72._countAndFlagsBits = 91;
    v72._object = (void *)0xE100000000000000;
    sub_10000DC48(v72);
    sub_10000DCF8();
    v73._countAndFlagsBits = 93;
    v73._object = (void *)0xE100000000000000;
    sub_10000DC48(v73);
    long long v12 = v70;
    if (qword_1000144B8 != -1) {
      swift_once();
    }
    sub_10000ABD4(v6, (uint64_t)qword_1000156E0);
    swift_bridgeObjectRetain();
    NSString v13 = sub_10000DBE8();
    os_log_type_t v14 = sub_10000DC88();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v70 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      v68[0] = sub_1000087E4(v12, *((unint64_t *)&v12 + 1), (uint64_t *)&v70);
      sub_10000DCA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Invalid input = %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10000AC0C();
    long long v70 = 0u;
    long long v71 = 0u;
    swift_allocError();
    char v17 = 3;
    goto LABEL_9;
  }
  sub_10000DA58();
  swift_allocObject();
  sub_10000DA48();
  sub_10000ACA4();
  sub_10000DA38();
  uint64_t v65 = a2;
  swift_release();
  uint64_t v66 = v70;
  uint64_t v25 = v71;
  uint64_t v63 = *((void *)&v70 + 1);
  if (qword_1000144B8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_10000ABD4(v6, (uint64_t)qword_1000156E0);
  uint64_t v27 = sub_10000DBE8();
  os_log_type_t v28 = sub_10000DC98();
  if (os_log_type_enabled(v27, v28))
  {
    long long v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Setting up Engagement Collector", v29, 2u);
    swift_slowDealloc();
  }

  uint64_t v30 = sub_100009144();
  uint64_t v31 = (void *)qword_1000144B0;
  qword_1000144B0 = v30;

  if (!qword_1000144B0)
  {
    swift_bridgeObjectRelease();
    unint64_t v38 = sub_10000DBE8();
    os_log_type_t v39 = sub_10000DC88();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Failed to instantiate Engagement Collector Manager", v40, 2u);
      swift_slowDealloc();
    }

    sub_10000AC0C();
    long long v70 = 0u;
    long long v71 = 0u;
    swift_allocError();
    char v17 = 5;
LABEL_9:
    *id v16 = v17;
    sub_10000AF54((uint64_t)&v70, (uint64_t)v68, &qword_1000145B0);
    uint64_t v18 = v69;
    if (v69)
    {
      uint64_t v19 = sub_10000AB90(v68, v69);
      uint64_t v20 = *(void *)(v18 - 8);
      __chkstk_darwin(v19);
      uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v20 + 16))(v22);
      uint64_t v23 = sub_10000DD88();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v18);
      sub_10000AB00((uint64_t)v68);
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v24 = (void *)sub_10000DA68();
    ((void (**)(void, uint64_t, void *))a3)[2](a3, v23, v24);
    swift_unknownObjectRelease();

    swift_errorRelease();
    sub_10000B238((uint64_t)&v70, &qword_1000145B0);
    goto LABEL_21;
  }
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v64 = v26;
  v32(v9, v26, v6);
  uint64_t v33 = sub_10000DBE8();
  os_log_type_t v34 = sub_10000DC98();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v62 = v25;
    uint64_t v67 = v10;
    NSString v35 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v70 = swift_slowAlloc();
    *(_DWORD *)NSString v35 = 136315138;
    uint64_t v36 = 0xD000000000000013;
    unint64_t v37 = 0x800000010000E8D0;
    switch(v66)
    {
      case 1:
        unint64_t v37 = 0x800000010000E8F0;
        uint64_t v36 = 0xD000000000000010;
        break;
      case 2:
        unint64_t v37 = 0xED00007974726570;
        uint64_t v36 = 0x6F72506863746566;
        break;
      case 3:
        uint64_t v36 = 0xD000000000000016;
        unint64_t v37 = 0x800000010000E910;
        break;
      default:
        break;
    }
    v68[0] = sub_1000087E4(v36, v37, (uint64_t *)&v70);
    sub_10000DCA8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Executing command: %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v10 = v67;
    uint64_t v25 = v62;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_10000AB88;
  *(void *)(v41 + 24) = v10;
  uint64_t v42 = v41;
  switch(v66)
  {
    case 0:
      uint64_t v43 = (void *)qword_1000144B0;
      if (qword_1000144B0) {
        goto LABEL_39;
      }
      goto LABEL_40;
    case 1:
      uint64_t v43 = (void *)qword_1000144B0;
      if (qword_1000144B0) {
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      if (v25)
      {
        unint64_t v44 = (void *)qword_1000144B0;
        if (qword_1000144B0)
        {
          uint64_t v45 = (void *)swift_allocObject();
          v45[2] = v63;
          v45[3] = v25;
          v45[4] = sub_10000AD30;
          v45[5] = v42;
          v45[6] = v65;
          swift_retain_n();
          id v46 = v44;
          swift_bridgeObjectRetain();
          swift_retain();
          sub_10000DBC8();
          swift_bridgeObjectRelease();
          swift_release_n();
          swift_release();

          break;
        }
        swift_retain_n();
        unint64_t v56 = sub_10000DBE8();
        os_log_type_t v57 = sub_10000DC88();
        if (os_log_type_enabled(v56, v57))
        {
          id v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v58 = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "Failed to instantiate Engagement Collector Manager", v58, 2u);
          swift_slowDealloc();
        }

        sub_10000AC0C();
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v59 = swift_allocError();
        *os_log_type_t v60 = 5;
        _Block_copy(a3);
        sub_100009534((uint64_t)&v70, v59, (uint64_t)a3);
        _Block_release(a3);
        swift_errorRelease();
        sub_10000B238((uint64_t)&v70, &qword_1000145B0);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_10000AC0C();
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v54 = swift_allocError();
        *uint64_t v55 = 3;
        swift_retain_n();
        _Block_copy(a3);
        swift_retain();
        sub_100009534((uint64_t)&v70, v54, (uint64_t)a3);
        _Block_release(a3);
        swift_errorRelease();
        sub_10000B238((uint64_t)&v70, &qword_1000145B0);
      }
      swift_release_n();
      break;
    case 3:
      uint64_t v43 = (void *)qword_1000144B0;
      if (qword_1000144B0)
      {
LABEL_39:
        uint64_t v47 = (void *)swift_allocObject();
        v47[2] = sub_10000AD30;
        v47[3] = v42;
        v47[4] = v65;
        swift_retain_n();
        swift_retain();
        id v48 = v43;
        sub_10000DBC8();
        swift_release_n();
        swift_release();
      }
      else
      {
LABEL_40:
        swift_retain_n();
        unint64_t v49 = sub_10000DBE8();
        os_log_type_t v50 = sub_10000DC88();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v51 = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to instantiate Engagement Collector Manager", v51, 2u);
          swift_slowDealloc();
        }

        sub_10000AC0C();
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v52 = swift_allocError();
        unsigned char *v53 = 5;
        _Block_copy(a3);
        sub_100009534((uint64_t)&v70, v52, (uint64_t)a3);
        _Block_release(a3);
        swift_errorRelease();
        sub_10000B238((uint64_t)&v70, &qword_1000145B0);
        swift_release_n();
      }
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    default:
      JUMPOUT(0);
  }
LABEL_21:
  swift_release();
LABEL_22:
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
}

uint64_t sub_10000AB00(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000AB50()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000AB88(uint64_t a1, void *a2)
{
  sub_100004674(a1, a2, *(void *)(v2 + 16));
}

void *sub_10000AB90(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000ABD4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000AC0C()
{
  unint64_t result = qword_1000145A8;
  if (!qword_1000145A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000145A8);
  }
  return result;
}

uint64_t sub_10000AC60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000ACA4()
{
  unint64_t result = qword_1000145B8;
  if (!qword_1000145B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000145B8);
  }
  return result;
}

uint64_t sub_10000ACF8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AD30(uint64_t a1, uint64_t a2)
{
  return sub_1000043B0(a1, a2, *(void (**)(long long *, uint64_t))(v2 + 16));
}

uint64_t sub_10000AD38(uint64_t a1)
{
  return sub_1000071A4(a1, *(__objc2_prot_list **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000AD44()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000AD7C(uint64_t a1)
{
  return sub_10000667C(a1, *(void (**)(long long *, void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000AD88(uint64_t a1)
{
  return sub_100005930(a1, *(void (**)(long long *, void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000AD94()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000ADD4(uint64_t a1)
{
  return sub_100004E40(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *, void))(v1 + 32));
}

unint64_t sub_10000ADE4()
{
  v6[3] = sub_10000AC60(&qword_1000145C0);
  v6[0] = &_swiftEmptyDictionarySingleton;
  sub_10000AC60(&qword_1000145C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000E1F0;
  *(void *)(inited + 32) = 0x65736E6F70736572;
  *(void *)(inited + 40) = 0xE800000000000000;
  sub_10000AEE0((uint64_t)v6, inited + 48);
  unint64_t v1 = sub_1000047E0(inited);
  sub_10000AC60(&qword_1000145D0);
  uint64_t v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000E1F0;
  strcpy((char *)(v2 + 32), "json-payload");
  *(unsigned char *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  *(void *)(v2 + 48) = v1;
  unint64_t v3 = sub_100004918(v2);
  unint64_t v4 = sub_100004A34(v3);
  swift_bridgeObjectRelease();
  sub_10000AB00((uint64_t)v6);
  return v4;
}

uint64_t sub_10000AEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000AF3C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000AF4C()
{
  return swift_release();
}

uint64_t sub_10000AF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000AC60(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AFB8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 != 1)
  {
    if (a6 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B088(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10000B0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 != 1)
  {
    if (a6 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B13C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10000DD28();
  __break(1u);
  return result;
}

uint64_t sub_10000B238(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000AC60(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for BooksEngagementPluginError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BooksEngagementPluginError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BooksEngagementPluginError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x10000B400);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_10000B428(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000B434(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BooksEngagementPluginError()
{
  return &type metadata for BooksEngagementPluginError;
}

unint64_t sub_10000B450()
{
  unint64_t result = qword_100014620;
  if (!qword_100014620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014620);
  }
  return result;
}

unint64_t sub_10000B4AC(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6F72506863746566;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B55C(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000013;
  unint64_t v4 = 0x800000010000E8D0;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x800000010000E8F0;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v3 = 0x6F72506863746566;
      unint64_t v4 = 0xED00007974726570;
      break;
    case 3:
      unint64_t v3 = 0xD000000000000016;
      unint64_t v4 = 0x800000010000E910;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xD000000000000013;
  unint64_t v6 = 0x800000010000E8D0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x800000010000E8F0;
      if (v3 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v5 = 0x6F72506863746566;
      unint64_t v6 = 0xED00007974726570;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0x800000010000E910;
      if (v3 == 0xD000000000000016) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v3 != v5) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_10000DD98();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000B710()
{
  return sub_10000DE18();
}

uint64_t sub_10000B810()
{
  sub_10000DC38();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000B8F4()
{
  return sub_10000DE18();
}

uint64_t sub_10000B9EC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  unint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100010660;
  v7._object = v3;
  Swift::Int v5 = sub_10000DD38(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_10000BA40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C510();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000BA6C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_100010698;
  v8._object = a2;
  Swift::Int v6 = sub_10000DD38(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_10000BAC4()
{
  return 0;
}

void sub_10000BAD0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000BADC(uint64_t a1)
{
  unint64_t v2 = sub_10000C77C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000BB18(uint64_t a1)
{
  unint64_t v2 = sub_10000C77C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000BB54(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10000AC60(&qword_1000146D0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AB90(a1, a1[3]);
  sub_10000C77C();
  sub_10000DE38();
  v13[8] = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  sub_10000CB38();
  sub_10000DD78();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

unsigned char *sub_10000BCAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000C604(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = (_BYTE)result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000BCDC(void *a1)
{
  return sub_10000BB54(a1, *(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_10000BCFC()
{
  v1._countAndFlagsBits = 0x646E616D6D6F635BLL;
  v1._object = (void *)0xEA0000000000203ALL;
  sub_10000DC48(v1);
  sub_10000DCF8();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  sub_10000DC48(v2);
  return 0;
}

uint64_t sub_10000BD9C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10000AC60(&qword_1000146C0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AB90(a1, a1[3]);
  sub_10000CA3C();
  sub_10000DE38();
  v13[8] = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  sub_10000CAE4();
  sub_10000DD78();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000BEF4(char a1)
{
  if (a1) {
    return 0x79747265706F7270;
  }
  else {
    return 0x646E616D6D6F63;
  }
}

uint64_t sub_10000BF34(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  v12[1] = a4;
  uint64_t v7 = sub_10000AC60(&qword_100014728);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AB90(a1, a1[3]);
  sub_10000D320();
  sub_10000DE38();
  char v15 = a2;
  char v14 = 0;
  sub_10000D3C8();
  sub_10000DD78();
  if (!v4)
  {
    char v13 = 1;
    sub_10000DD68();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10000C0BC()
{
  return sub_10000BCFC();
}

uint64_t destroy for JsonPayload()
{
  return swift_bridgeObjectRelease();
}

__n128 initializeWithTake for Request(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for JsonPayload()
{
  return &type metadata for JsonPayload;
}

ValueMetadata *type metadata accessor for PluginRequest()
{
  return &type metadata for PluginRequest;
}

uint64_t sub_10000C118()
{
  return 1;
}

Swift::Int sub_10000C120()
{
  return sub_10000DE18();
}

void sub_10000C164()
{
}

Swift::Int sub_10000C18C()
{
  return sub_10000DE18();
}

uint64_t sub_10000C1D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000C824(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000C1FC(uint64_t a1)
{
  unint64_t v2 = sub_10000CA3C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C238(uint64_t a1)
{
  unint64_t v2 = sub_10000CA3C();

  return CodingKey.debugDescription.getter(a1, v2);
}

unsigned char *sub_10000C274@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000C8C4(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = (_BYTE)result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000C2A4(void *a1)
{
  return sub_10000BD9C(a1, *(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

BOOL sub_10000C2C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10000C2DC()
{
  return sub_10000BEF4(*v0);
}

uint64_t sub_10000C2E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000D064(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000C30C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000C318(uint64_t a1)
{
  unint64_t v2 = sub_10000D320();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C354(uint64_t a1)
{
  unint64_t v2 = sub_10000D320();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C390@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000D160(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000C3C0(void *a1)
{
  return sub_10000BF34(a1, *(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_10000C3E0(char *a1, char *a2)
{
  return sub_10000B55C(*a1, *a2);
}

Swift::Int sub_10000C3EC()
{
  return sub_10000B710();
}

uint64_t sub_10000C3F4()
{
  return sub_10000B810();
}

Swift::Int sub_10000C3FC()
{
  return sub_10000B8F4();
}

uint64_t sub_10000C404@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000D904(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000C434@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000B4AC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000C460()
{
  return sub_10000DC78();
}

uint64_t sub_10000C4C0()
{
  return sub_10000DC68();
}

uint64_t sub_10000C510()
{
  return 0x7961702D6E6F736ALL;
}

Swift::Int sub_10000C530()
{
  return sub_10000DE18();
}

uint64_t sub_10000C58C()
{
  return sub_10000DC38();
}

Swift::Int sub_10000C5AC()
{
  return sub_10000DE18();
}

unsigned char *sub_10000C604(void *a1)
{
  uint64_t v3 = sub_10000AC60(&qword_100014690);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AB90(a1, a1[3]);
  sub_10000C77C();
  sub_10000DE28();
  if (v1)
  {
    sub_10000AB00((uint64_t)a1);
  }
  else
  {
    sub_10000C7D0();
    sub_10000DD58();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v6 = (unsigned char *)v8[8];
    sub_10000AB00((uint64_t)a1);
  }
  return v6;
}

unint64_t sub_10000C77C()
{
  unint64_t result = qword_100014698;
  if (!qword_100014698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014698);
  }
  return result;
}

unint64_t sub_10000C7D0()
{
  unint64_t result = qword_1000146A0;
  if (!qword_1000146A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146A0);
  }
  return result;
}

uint64_t sub_10000C824(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000DD98();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10000C8AC()
{
  return 0x74736575716572;
}

unsigned char *sub_10000C8C4(void *a1)
{
  uint64_t v3 = sub_10000AC60(&qword_1000146A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AB90(a1, a1[3]);
  sub_10000CA3C();
  sub_10000DE28();
  if (v1)
  {
    sub_10000AB00((uint64_t)a1);
  }
  else
  {
    sub_10000CA90();
    sub_10000DD58();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v6 = (unsigned char *)v8[8];
    sub_10000AB00((uint64_t)a1);
  }
  return v6;
}

unint64_t sub_10000CA3C()
{
  unint64_t result = qword_1000146B0;
  if (!qword_1000146B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146B0);
  }
  return result;
}

unint64_t sub_10000CA90()
{
  unint64_t result = qword_1000146B8;
  if (!qword_1000146B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146B8);
  }
  return result;
}

unint64_t sub_10000CAE4()
{
  unint64_t result = qword_1000146C8;
  if (!qword_1000146C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146C8);
  }
  return result;
}

unint64_t sub_10000CB38()
{
  unint64_t result = qword_1000146D8;
  if (!qword_1000146D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146D8);
  }
  return result;
}

uint64_t sub_10000CB98()
{
  return 0;
}

ValueMetadata *type metadata accessor for JsonPayload.CodingKeys()
{
  return &type metadata for JsonPayload.CodingKeys;
}

uint64_t _s24BooksEngagementExtension11JsonPayloadV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s24BooksEngagementExtension11JsonPayloadV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000CC9CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PluginRequest.CodingKeys()
{
  return &type metadata for PluginRequest.CodingKeys;
}

uint64_t _s24BooksEngagementExtension7RequestVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwta_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s24BooksEngagementExtension7RequestVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Request()
{
  return &type metadata for Request;
}

unint64_t sub_10000CE58()
{
  unint64_t result = qword_1000146E0;
  if (!qword_1000146E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146E0);
  }
  return result;
}

unint64_t sub_10000CEB0()
{
  unint64_t result = qword_1000146E8;
  if (!qword_1000146E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146E8);
  }
  return result;
}

unint64_t sub_10000CF08()
{
  unint64_t result = qword_1000146F0;
  if (!qword_1000146F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146F0);
  }
  return result;
}

unint64_t sub_10000CF60()
{
  unint64_t result = qword_1000146F8;
  if (!qword_1000146F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000146F8);
  }
  return result;
}

unint64_t sub_10000CFB8()
{
  unint64_t result = qword_100014700;
  if (!qword_100014700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014700);
  }
  return result;
}

unint64_t sub_10000D010()
{
  unint64_t result = qword_100014708;
  if (!qword_100014708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014708);
  }
  return result;
}

uint64_t sub_10000D064(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
  if (v3 || (sub_10000DD98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79747265706F7270 && a2 == 0xEC000000656D614ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10000DD98();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10000D160(void *a1)
{
  uint64_t v3 = sub_10000AC60(&qword_100014710);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_10000AB90(a1, v7);
  sub_10000D320();
  sub_10000DE28();
  if (!v1)
  {
    v9[14] = 0;
    sub_10000D374();
    sub_10000DD58();
    uint64_t v7 = v9[15];
    v9[13] = 1;
    sub_10000DD48();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000AB00((uint64_t)a1);
  return v7;
}

unint64_t sub_10000D320()
{
  unint64_t result = qword_100014718;
  if (!qword_100014718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014718);
  }
  return result;
}

unint64_t sub_10000D374()
{
  unint64_t result = qword_100014720;
  if (!qword_100014720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014720);
  }
  return result;
}

unint64_t sub_10000D3C8()
{
  unint64_t result = qword_100014730;
  if (!qword_100014730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014730);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Request.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Request.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D578);
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

unsigned char *sub_10000D5A0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Request.CodingKeys()
{
  return &type metadata for Request.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Command(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Command(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D718);
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

ValueMetadata *type metadata accessor for Command()
{
  return &type metadata for Command;
}

unint64_t sub_10000D754()
{
  unint64_t result = qword_100014738;
  if (!qword_100014738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014738);
  }
  return result;
}

unint64_t sub_10000D7AC()
{
  unint64_t result = qword_100014740;
  if (!qword_100014740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014740);
  }
  return result;
}

unint64_t sub_10000D804()
{
  unint64_t result = qword_100014748;
  if (!qword_100014748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014748);
  }
  return result;
}

unint64_t sub_10000D85C()
{
  unint64_t result = qword_100014750;
  if (!qword_100014750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014750);
  }
  return result;
}

unint64_t sub_10000D8B0()
{
  unint64_t result = qword_100014758;
  if (!qword_100014758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014758);
  }
  return result;
}

uint64_t sub_10000D904(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000106D0;
  v6._object = a2;
  unint64_t v4 = sub_10000DD38(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000D954()
{
  uint64_t v0 = sub_10000DC08();
  sub_10000D9D4(v0, qword_1000156E0);
  sub_10000ABD4(v0, (uint64_t)qword_1000156E0);
  return sub_10000DBF8();
}

uint64_t *sub_10000D9D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000DA38()
{
  return JSONDecoder.decode<A>(_:withJSONObject:options:)();
}

uint64_t sub_10000DA48()
{
  return JSONDecoder.init()();
}

uint64_t sub_10000DA58()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10000DA68()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000DA78()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10000DA88()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DA98()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000DAA8()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_10000DAB8()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10000DAC8()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10000DAD8()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DAE8()
{
  return Date.init()();
}

uint64_t sub_10000DAF8()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000DB08()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t sub_10000DB18()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_10000DB28()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_10000DB38()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_10000DB48()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_10000DB58()
{
  return static Calendar.current.getter();
}

uint64_t sub_10000DB68()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10000DB78()
{
  return PropertyValue.rawValue.getter();
}

uint64_t sub_10000DB88()
{
  return PropertyValue.description.getter();
}

uint64_t sub_10000DB98()
{
  return ManagerConfiguration.init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)();
}

uint64_t sub_10000DBA8()
{
  return type metadata accessor for ManagerConfiguration();
}

uint64_t sub_10000DBB8()
{
  return Manager.init(configuration:)();
}

uint64_t sub_10000DBC8()
{
  return Manager.getProperties(propertyName:assetIDs:completion:)();
}

uint64_t sub_10000DBD8()
{
  return type metadata accessor for Manager();
}

uint64_t sub_10000DBE8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000DBF8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000DC08()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000DC18()
{
  return Dictionary.description.getter();
}

NSString sub_10000DC28()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000DC38()
{
  return String.hash(into:)();
}

void sub_10000DC48(Swift::String a1)
{
}

Swift::Int sub_10000DC58()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000DC68()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10000DC78()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10000DC88()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000DC98()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000DCA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000DCB8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000DCC8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000DCD8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000DCE8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000DCF8()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000DD08()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000DD18()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000DD28()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000DD38(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000DD48()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10000DD58()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10000DD68()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10000DD78()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10000DD88()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10000DD98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000DDA8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000DDB8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000DDC8()
{
  return Error._code.getter();
}

uint64_t sub_10000DDD8()
{
  return Error._domain.getter();
}

uint64_t sub_10000DDE8()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000DDF8()
{
  return Hasher.init(_seed:)();
}

void sub_10000DE08(Swift::UInt a1)
{
}

Swift::Int sub_10000DE18()
{
  return Hasher._finalize()();
}

uint64_t sub_10000DE28()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000DE38()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}