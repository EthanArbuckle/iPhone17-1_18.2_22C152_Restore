unint64_t sub_100002EB4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000063E8(&qword_10000C538);
  v2 = (void *)sub_100006FE0();
  v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    v5 = *((void *)v4 - 2);
    v6 = *((void *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1000043B8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

unint64_t sub_100002FC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000063E8(&qword_10000C530);
  v2 = (void *)sub_100006FE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000043B8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

unint64_t sub_1000030E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000063E8(&qword_10000C550);
  v2 = (void *)sub_100006FE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000043B8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_100003208(uint64_t *a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v6 = sub_100006F00();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  char v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  sub_1000063E8(&qword_10000C540);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007380;
  *(void *)(inited + 32) = sub_100006DA0();
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = v11;
  *(void *)(inited + 56) = v12;
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_1000030E4(inited);
  sub_100006E80();
  swift_bridgeObjectRetain_n();
  v16 = sub_100006EF0();
  os_log_type_t v17 = sub_100006F60();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v29 = v6;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    v28[2] = v20;
    *(_DWORD *)uint64_t v19 = 141558274;
    uint64_t v31 = 1752392040;
    v32[0] = v20;
    sub_100006F80();
    *(_WORD *)(v19 + 12) = 2080;
    v28[1] = v19 + 14;
    swift_bridgeObjectRetain();
    uint64_t v21 = v7;
    v22 = a2;
    uint64_t v23 = sub_100006F10();
    uint64_t v30 = a3;
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v26 = v23;
    a2 = v22;
    uint64_t v31 = sub_100003C00(v26, v25, v32);
    sub_100006F80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Engagement plugin response %{mask.hash}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v29);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v32[3] = sub_1000063E8(&qword_10000C548);
  v32[0] = v15;
  a2(v32, 0);
  return sub_100006588((uint64_t)v32);
}

uint64_t sub_10000350C(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v6 = sub_100006F00();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  char v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006E80();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v11 = sub_100006EF0();
  os_log_type_t v12 = sub_100006F60();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = a2;
    uint64_t v14 = (uint8_t *)v13;
    *(void *)&v21[0] = swift_slowAlloc();
    v18[0] = v6;
    v18[1] = a3;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_getErrorValue();
    uint64_t v15 = sub_100007020();
    uint64_t v20 = sub_100003C00(v15, v16, (uint64_t *)v21);
    sub_100006F80();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Engagement plugin error %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v19;
    swift_slowDealloc();

    (*(void (**)(char *, void))(v7 + 8))(v10, v18[0]);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  memset(v21, 0, sizeof(v21));
  a2(v21, a1);
  return sub_100006588((uint64_t)v21);
}

uint64_t sub_100003778()
{
  uint64_t v0 = sub_100006F00();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006E80();
  uint64_t v5 = sub_100006EF0();
  os_log_type_t v6 = sub_100006F60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Engagement plugin invalidating connection", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_100006EB0();
}

void sub_100003928(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100006520(a1, (uint64_t)v11);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_log_type_t v6 = sub_1000065E8(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6, v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = sub_100007000();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_100006398((uint64_t)v11);
  if (a2) {
LABEL_3:
  }
    a2 = (void *)sub_100006D70();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();
}

id sub_100003ACC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EngagementExtensionProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EngagementExtensionProvider()
{
  return self;
}

id sub_100003B24(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100006F20();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100006D80();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_100003C00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003CD4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000646C((uint64_t)v12, *a3);
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
      sub_10000646C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006398((uint64_t)v12);
  return v7;
}

uint64_t sub_100003CD4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006F90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100003E90(a5, a6);
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
  uint64_t v8 = sub_100006FC0();
  if (!v8)
  {
    sub_100006FD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006FF0();
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

uint64_t sub_100003E90(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100003F28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004108(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004108(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100003F28(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000040A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006FB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006FD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006F50();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006FF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006FD0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000040A0(uint64_t a1, uint64_t a2)
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
  sub_1000063E8(&qword_10000C558);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004108(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000063E8(&qword_10000C558);
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
  uint64_t result = sub_100006FF0();
  __break(1u);
  return result;
}

uint64_t sub_100004258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  swift_errorRetain();

  return sub_100006DD0();
}

uint64_t sub_1000042FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  sub_1000063E8(a6);
  uint64_t v13 = (void (*)(uint64_t, void *))sub_100006DE0();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();

  return swift_release();
}

unint64_t sub_1000043B8(uint64_t a1, uint64_t a2)
{
  sub_100007030();
  sub_100006F40();
  Swift::Int v4 = sub_100007040();

  return sub_100004430(a1, a2, v4);
}

unint64_t sub_100004430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100007010() & 1) == 0)
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
      while (!v14 && (sub_100007010() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100004514(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_100006B28(v6, 0);
}

uint64_t sub_1000045A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1000063E8(&qword_10000C4F0);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_100006DE0();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_100006B0C, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_100004674(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_1000063E8(&qword_10000C4F0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  BOOL v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    a5(a1);
    unint64_t v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_100006DE0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a3;
    *(void *)(v17 + 24) = a4;
    swift_retain();
    v16(sub_100006A74, v17);
    swift_release();
    swift_release();
    sub_100006B28(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  else
  {
    uint64_t v18 = a1;
    char v19 = 0;
    return a3(&v18);
  }
}

uint64_t sub_100004810(uint64_t a1, uint64_t a2, char a3, void (*a4)(uint64_t *), uint64_t a5, void (*a6)(uint64_t *), uint64_t a7)
{
  uint64_t v13 = sub_1000063E8(&qword_10000C4F0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v21 = a1;
    LOBYTE(v22) = 1;
    swift_errorRetain();
    a6(&v21);
    return sub_100006BB0(a1, a2, 1);
  }
  else
  {
    uint64_t v21 = a1;
    uint64_t v22 = a2;
    swift_bridgeObjectRetain();
    a4(&v21);
    uint64_t v18 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_100006DE0();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a6;
    *(void *)(v19 + 24) = a7;
    swift_retain();
    v18(sub_100006A74, v19);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000049CC(uint64_t a1, uint64_t a2, char a3, void (*a4)(void *), uint64_t a5, void (*a6)(void *), uint64_t a7)
{
  uint64_t v13 = sub_1000063E8(&qword_10000C4E8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v22[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = a1;
  v22[1] = a2;
  if (a3)
  {
    char v23 = 1;
    swift_errorRetain();
    a6(v22);
    return sub_100006BB0(a1, a2, 1);
  }
  else
  {
    swift_bridgeObjectRetain();
    a4(v22);
    uint64_t v18 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_100006DE0();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a6;
    *(void *)(v19 + 24) = a7;
    swift_retain();
    v18(sub_100006D14, v19);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100004B88(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  int64_t v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = v6;
  v7[5] = v5;
  swift_bridgeObjectRetain();
  swift_retain();

  return sub_100006DD0();
}

uint64_t sub_100004C2C(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = a5[1];
  uint64_t v9 = *a5;
  uint64_t v10 = v6;
  a3(&v11, &v9);
  uint64_t v7 = v11;
  uint64_t v9 = v11;
  LOBYTE(v10) = 0;
  a1(&v9);

  return sub_100006B28(v7, 0);
}

id sub_100004CC8()
{
  sub_100006F00();
  __chkstk_darwin();
  id v0 = objc_allocWithZone((Class)LSApplicationRecord);
  id v1 = sub_100003B24(0xD000000000000011, 0x8000000100007670, 0);
  id v2 = [v1 applicationState];
  id v3 = [v2 isInstalled];

  return v3;
}

uint64_t sub_100004F74(uint64_t a1, const void *a2)
{
  uint64_t v155 = sub_100006D90();
  unint64_t v162 = *(void *)(v155 - 8);
  uint64_t v5 = __chkstk_darwin(v155, v4);
  v165 = (char *)&v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  v160 = (char *)&v143 - v8;
  uint64_t v153 = sub_1000063E8(&qword_10000C4E8);
  uint64_t v152 = *(void *)(v153 - 8);
  uint64_t v10 = __chkstk_darwin(v153, v9);
  v148 = (char *)&v143 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  v149 = (char *)&v143 - v14;
  uint64_t v147 = v15;
  __chkstk_darwin(v13, v16);
  v150 = (char *)&v143 - v17;
  uint64_t v18 = sub_1000063E8(&qword_10000C4F0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  v154 = (char *)&v143 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21, v23);
  v161 = (char *)&v143 - v25;
  uint64_t v27 = __chkstk_darwin(v24, v26);
  uint64_t v29 = (char *)&v143 - v28;
  uint64_t v151 = v30;
  __chkstk_darwin(v27, v31);
  v33 = (char *)&v143 - v32;
  uint64_t v145 = sub_100006E50();
  uint64_t v144 = *(void *)(v145 - 8);
  __chkstk_darwin(v145, v34);
  v146 = (char *)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100006F00();
  uint64_t v168 = *(void *)(v36 - 8);
  uint64_t v38 = __chkstk_darwin(v36, v37);
  *(void *)&long long v167 = (char *)&v143 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __chkstk_darwin(v38, v40);
  v164 = (char *)&v143 - v42;
  __chkstk_darwin(v41, v43);
  v45 = (char *)&v143 - v44;
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = a2;
  _Block_copy(a2);
  sub_100006E80();
  v166 = (char *)a1;
  sub_10000646C(a1, (uint64_t)&v171);
  v47 = sub_100006EF0();
  os_log_type_t v48 = sub_100006F60();
  BOOL v49 = os_log_type_enabled(v47, v48);
  uint64_t v169 = v46;
  v163 = (void (**)(const void *, uint64_t, void))a2;
  uint64_t v159 = v18;
  uint64_t v158 = v19;
  v157 = v33;
  v156 = v29;
  if (v49)
  {
    uint64_t v50 = swift_slowAlloc();
    uint64_t v170 = swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 141558274;
    uint64_t v174 = 1752392040;
    sub_100006F80();
    *(_WORD *)(v50 + 12) = 2080;
    sub_10000646C((uint64_t)&v171, (uint64_t)&v174);
    uint64_t v51 = sub_100006F30();
    uint64_t v174 = sub_100003C00(v51, v52, &v170);
    sub_100006F80();
    swift_bridgeObjectRelease();
    sub_100006398((uint64_t)&v171);
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Engagement plugin received request %{mask.hash}s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100006398((uint64_t)&v171);
  }

  v53 = *(void (**)(char *, uint64_t))(v168 + 8);
  v53(v45, v36);
  v54 = (char *)v36;
  v55 = v165;
  v56 = (char *)v167;
  unsigned __int8 v57 = sub_100004CC8();
  if (sub_100006E60())
  {
    sub_1000063E8(&qword_10000C510);
    uint64_t inited = swift_initStackObject();
    long long v167 = xmmword_100007380;
    *(_OWORD *)(inited + 16) = xmmword_100007380;
    *(void *)(inited + 32) = sub_100006DB0();
    *(void *)(inited + 40) = v59;
    sub_1000063E8(&qword_10000C518);
    uint64_t v60 = swift_initStackObject();
    *(_OWORD *)(v60 + 16) = v167;
    *(void *)(v60 + 32) = sub_100006DC0();
    *(void *)(v60 + 40) = v61;
    *(unsigned char *)(v60 + 48) = v57 & 1;
    *(void *)(inited + 48) = sub_100002EB4(v60);
    unint64_t v62 = sub_100002FC8(inited);
    v63 = v164;
    sub_100006E80();
    swift_bridgeObjectRetain_n();
    v64 = sub_100006EF0();
    os_log_type_t v65 = sub_100006F60();
    if (os_log_type_enabled(v64, v65))
    {
      v166 = v54;
      v66 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v171 = swift_slowAlloc();
      *(_DWORD *)v66 = 136446210;
      swift_bridgeObjectRetain();
      sub_1000063E8(&qword_10000C528);
      uint64_t v67 = sub_100006F10();
      unint64_t v69 = v68;
      swift_bridgeObjectRelease();
      uint64_t v174 = sub_100003C00(v67, v69, (uint64_t *)&v171);
      sub_100006F80();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Engagement plugin response %{public}s", v66, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v70 = v164;
      v71 = v166;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v70 = v63;
      v71 = v54;
    }
    v53(v70, (uint64_t)v71);
    *((void *)&v172 + 1) = sub_1000063E8(&qword_10000C520);
    *(void *)&long long v171 = v62;
    sub_100006520((uint64_t)&v171, (uint64_t)&v174);
    uint64_t v114 = v175;
    if (v175)
    {
      v115 = sub_1000065E8(&v174, v175);
      uint64_t v116 = *(void *)(v114 - 8);
      __chkstk_darwin(v115, v115);
      v118 = (char *)&v143 - ((v117 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v116 + 16))(v118);
      uint64_t v119 = sub_100007000();
      (*(void (**)(char *, uint64_t))(v116 + 8))(v118, v114);
      sub_100006398((uint64_t)&v174);
    }
    else
    {
      uint64_t v119 = 0;
    }
    v163[2](v163, v119, 0);
    swift_unknownObjectRelease();
    sub_100006588((uint64_t)&v171);
  }
  else if (v57)
  {
    sub_100006EE0();
    sub_100006E20();
    sub_10000662C();
    sub_100006F70();
    uint64_t v72 = sub_100006EC0();
    sub_100006ED0();
    uint64_t v168 = v72;
    swift_retain();
    sub_100006F70();
    (*(void (**)(char *, void, uint64_t))(v144 + 104))(v146, enum case for EventDispatchStrategy.async(_:), v145);
    *((void *)&v172 + 1) = sub_100006E40();
    v173 = &protocol witness table for DispatchTimerProvider;
    sub_10000666C((uint64_t *)&v171);
    sub_100006E30();
    sub_100006EA0();
    swift_allocObject();
    sub_100006E90();
    sub_100006E10();
    swift_allocObject();
    uint64_t v73 = sub_100006E00();
    v74 = v149;
    sub_100006E70();
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = sub_1000066D0;
    *(void *)(v75 + 24) = v73;
    *(void *)&long long v167 = v73;
    uint64_t v76 = v152;
    v166 = *(char **)(v152 + 16);
    v77 = v148;
    uint64_t v78 = v153;
    ((void (*)(char *, char *, uint64_t))v166)(v148, v74, v153);
    uint64_t v79 = *(unsigned __int8 *)(v76 + 80);
    v164 = (char *)(v79 | 7);
    uint64_t v80 = (v79 + 16) & ~v79;
    v165 = (char *)v80;
    unint64_t v81 = (v147 + v80 + 7) & 0xFFFFFFFFFFFFFFF8;
    v163 = (void (**)(const void *, uint64_t, void))(v81 + 16);
    uint64_t v82 = swift_allocObject();
    unint64_t v162 = *(void *)(v76 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v162)(v82 + v80, v77, v78);
    v83 = (void *)(v82 + v81);
    void *v83 = sub_1000066D4;
    v83[1] = v75;
    swift_retain();
    v84 = v150;
    sub_100006DD0();
    v160 = *(char **)(v76 + 8);
    ((void (*)(char *, uint64_t))v160)(v74, v78);
    uint64_t v85 = swift_allocObject();
    uint64_t v155 = (uint64_t)sub_100006464;
    uint64_t v86 = v169;
    *(void *)(v85 + 16) = sub_100006464;
    *(void *)(v85 + 24) = v86;
    uint64_t v87 = v86;
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = sub_100006770;
    *(void *)(v88 + 24) = v85;
    ((void (*)(char *, char *, uint64_t))v166)(v74, v84, v78);
    uint64_t v89 = swift_allocObject();
    ((void (*)(char *, char *, uint64_t))v162)(&v165[v89], v74, v78);
    v90 = (uint64_t (**)(uint64_t *))(v89 + v81);
    *v90 = sub_10000679C;
    v90[1] = (uint64_t (*)(uint64_t *))v88;
    uint64_t v91 = v87;
    swift_retain();
    v166 = (char *)&type metadata for () + 8;
    v92 = v161;
    sub_100006DD0();
    ((void (*)(char *, uint64_t))v160)(v84, v78);
    uint64_t v93 = swift_allocObject();
    *(void *)(v93 + 16) = v155;
    *(void *)(v93 + 24) = v91;
    uint64_t v94 = swift_allocObject();
    *(void *)(v94 + 16) = sub_10000689C;
    *(void *)(v94 + 24) = v93;
    uint64_t v95 = v158;
    v165 = *(char **)(v158 + 16);
    v96 = v154;
    uint64_t v97 = v159;
    ((void (*)(char *, char *, uint64_t))v165)(v154, v92, v159);
    uint64_t v98 = *(unsigned __int8 *)(v95 + 80);
    uint64_t v99 = (v98 + 16) & ~v98;
    v164 = (char *)(v98 | 7);
    unint64_t v100 = (v151 + v99 + 7) & 0xFFFFFFFFFFFFFFF8;
    v163 = (void (**)(const void *, uint64_t, void))(v100 + 16);
    unint64_t v162 = v100;
    uint64_t v101 = swift_allocObject();
    v102 = *(void (**)(uint64_t, char *, uint64_t))(v95 + 32);
    v102(v101 + v99, v96, v97);
    v103 = (uint64_t (**)(uint64_t))(v101 + v100);
    *v103 = sub_1000068C8;
    v103[1] = (uint64_t (*)(uint64_t))v94;
    swift_retain();
    v104 = v156;
    sub_100006DD0();
    v160 = *(char **)(v95 + 8);
    v105 = v161;
    ((void (*)(char *, uint64_t))v160)(v161, v97);
    ((void (*)(char *, char *, uint64_t))v165)(v105, v104, v97);
    uint64_t v106 = swift_allocObject();
    v102(v106 + v99, v105, v97);
    v107 = (uint64_t (**)())(v106 + v162);
    v108 = (uint64_t (*)())v168;
    *v107 = sub_100006990;
    v107[1] = v108;
    swift_retain();
    v109 = v157;
    sub_100006DD0();
    v110 = v104;
    v111 = v160;
    ((void (*)(char *, uint64_t))v160)(v110, v97);
    v112 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_100006DE0();
    uint64_t v113 = swift_allocObject();
    *(void *)(v113 + 16) = 0;
    *(void *)(v113 + 24) = 0;
    v112(sub_100006A74, v113);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    ((void (*)(char *, uint64_t))v111)(v109, v97);
  }
  else
  {
    unint64_t v120 = v162;
    v121 = v160;
    uint64_t v122 = v155;
    (*(void (**)(char *, void, uint64_t))(v162 + 104))(v160, enum case for EngagementError.appNotInstalled(_:), v155);
    sub_100006E80();
    v165 = *(char **)(v120 + 16);
    ((void (*)(char *, char *, uint64_t))v165)(v55, v121, v122);
    v123 = v56;
    v124 = sub_100006EF0();
    os_log_type_t v125 = sub_100006F60();
    if (os_log_type_enabled(v124, v125))
    {
      v126 = (uint8_t *)swift_slowAlloc();
      v164 = (char *)swift_slowAlloc();
      *(void *)&long long v171 = v164;
      *(_DWORD *)v126 = 136446210;
      v166 = v54;
      sub_1000064C8();
      uint64_t v127 = sub_100007020();
      uint64_t v174 = sub_100003C00(v127, v128, (uint64_t *)&v171);
      sub_100006F80();
      swift_bridgeObjectRelease();
      v129 = *(void (**)(char *, uint64_t))(v162 + 8);
      v129(v55, v122);
      _os_log_impl((void *)&_mh_execute_header, v124, v125, "Engagement plugin error %{public}s", v126, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v130 = (char *)v167;
      v131 = v166;
    }
    else
    {
      v129 = *(void (**)(char *, uint64_t))(v120 + 8);
      v129(v55, v122);

      v130 = v123;
      v131 = v54;
    }
    v53(v130, (uint64_t)v131);
    v132 = v160;
    v133 = (void (*)(uint64_t, char *, uint64_t))v165;
    sub_1000064C8();
    long long v171 = 0u;
    long long v172 = 0u;
    swift_allocError();
    v133(v134, v132, v122);
    sub_100006520((uint64_t)&v171, (uint64_t)&v174);
    uint64_t v135 = v175;
    if (v175)
    {
      v136 = sub_1000065E8(&v174, v175);
      uint64_t v137 = *(void *)(v135 - 8);
      __chkstk_darwin(v136, v136);
      v139 = (char *)&v143 - ((v138 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v137 + 16))(v139);
      uint64_t v140 = sub_100007000();
      (*(void (**)(char *, uint64_t))(v137 + 8))(v139, v135);
      sub_100006398((uint64_t)&v174);
    }
    else
    {
      uint64_t v140 = 0;
    }
    v141 = (void *)sub_100006D70();
    ((void (**)(const void *, uint64_t, void *))v163)[2](v163, v140, v141);
    swift_unknownObjectRelease();

    swift_errorRelease();
    sub_100006588((uint64_t)&v171);
    v129(v132, v122);
  }
  return swift_release();
}

uint64_t sub_100006398(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000063E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000642C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006464(uint64_t a1, void *a2)
{
  sub_100003928(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000646C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000064C8()
{
  unint64_t result = qword_10000C4F8;
  if (!qword_10000C4F8)
  {
    sub_100006D90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4F8);
  }
  return result;
}

uint64_t sub_100006520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063E8(&qword_10000C500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006588(uint64_t a1)
{
  uint64_t v2 = sub_1000063E8(&qword_10000C500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1000065E8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000662C()
{
  unint64_t result = qword_10000C508;
  if (!qword_10000C508)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C508);
  }
  return result;
}

uint64_t *sub_10000666C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000066D4(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_100006704()
{
  return sub_1000069A4(&qword_10000C4E8);
}

uint64_t sub_100006710(uint64_t a1, uint64_t a2)
{
  return sub_1000067D8(a1, a2, &qword_10000C4E8, (uint64_t)&unk_100008768, (uint64_t)sub_100006C98);
}

uint64_t sub_100006738()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006770(uint64_t *a1)
{
  return sub_100003208(a1, *(void (**)(void, void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000679C(uint64_t *a1)
{
  return sub_100004B88(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000067A4()
{
  return sub_1000069A4(&qword_10000C4E8);
}

uint64_t sub_1000067B0(uint64_t a1, uint64_t a2)
{
  return sub_1000067D8(a1, a2, &qword_10000C4E8, (uint64_t)&unk_1000086F0, (uint64_t)sub_100006B98);
}

uint64_t sub_1000067D8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(sub_1000063E8(a3) - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000042FC(a1, a2, v5 + v12, *(void *)(v5 + v13), *(void *)(v5 + v13 + 8), a3, a4, a5);
}

uint64_t sub_10000689C(uint64_t a1)
{
  return sub_10000350C(a1, *(void (**)(void, void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000068C8(uint64_t a1)
{
  return sub_100004258(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000068D0()
{
  return sub_1000069A4(&qword_10000C4F0);
}

uint64_t sub_1000068DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_1000063E8(&qword_10000C4F0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + v6;
  uint64_t v8 = (uint64_t *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];

  return sub_1000045A8(a1, a2, v7, v9, v10);
}

uint64_t sub_100006990()
{
  return sub_100003778();
}

uint64_t sub_100006998()
{
  return sub_1000069A4(&qword_10000C4F0);
}

uint64_t sub_1000069A4(uint64_t *a1)
{
  uint64_t v2 = sub_1000063E8(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return _swift_deallocObject(v1, v7, v6);
}

uint64_t sub_100006A48(uint64_t a1, uint64_t a2)
{
  return sub_1000067D8(a1, a2, &qword_10000C4F0, (uint64_t)&unk_100008650, (uint64_t)sub_100006A90);
}

uint64_t sub_100006A78()
{
  return sub_100006C48((void (*)(void))&_swift_release);
}

uint64_t sub_100006A90(uint64_t *a1)
{
  uint64_t v2 = *(void (**)(uint64_t *))(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v6 = *a1;
  char v7 = v4;
  v2(&v6);
  return v3(&v6);
}

uint64_t sub_100006AF4()
{
  return sub_100006C48((void (*)(void))&_swift_release);
}

uint64_t sub_100006B0C(uint64_t a1)
{
  return sub_100004674(*(void *)a1, *(unsigned char *)(a1 + 8), *(uint64_t (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_100006B28(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100006B34()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006B74(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_100004514(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100006B80()
{
  return sub_100006C48((void (*)(void))&_swift_release);
}

uint64_t sub_100006B98(uint64_t a1)
{
  return sub_100006CB0(a1, (uint64_t (*)(void, void, void, void, void, void, void))sub_100004810);
}

uint64_t sub_100006BB0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100006BC4(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_100006C0C()
{
  return sub_100006C48((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_100006C24(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_100004C2C(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 16), *(void *)(v2 + 24), (uint64_t *)(v2 + 32));
}

uint64_t sub_100006C30()
{
  return sub_100006C48((void (*)(void))&_swift_release);
}

uint64_t sub_100006C48(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 40));

  return _swift_deallocObject(v1, 48, 7);
}

uint64_t sub_100006C98(uint64_t a1)
{
  return sub_100006CB0(a1, (uint64_t (*)(void, void, void, void, void, void, void))sub_1000049CC);
}

uint64_t sub_100006CB0(uint64_t a1, uint64_t (*a2)(void, void, void, void, void, void, void))
{
  return a2(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_100006CD4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006D14(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(long long *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 16);
  long long v4 = *(_OWORD *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_100006D70()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006D80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100006D90()
{
  return type metadata accessor for EngagementError();
}

uint64_t sub_100006DA0()
{
  return static EngagementConstants.jsonPayloadKey.getter();
}

uint64_t sub_100006DB0()
{
  return static EngagementConstants.nativeResponseKey.getter();
}

uint64_t sub_100006DC0()
{
  return static EngagementConstants.nativeResponseAppInstalledKey.getter();
}

uint64_t sub_100006DD0()
{
  return Promise.init(asyncOperation:)();
}

uint64_t sub_100006DE0()
{
  return Promise.operation.getter();
}

uint64_t sub_100006DF0()
{
  return EngagementClient.dispatchEngagementRequest(json:)();
}

uint64_t sub_100006E00()
{
  return EngagementClient.init(connection:eventHub:)();
}

uint64_t sub_100006E10()
{
  return type metadata accessor for EngagementClient();
}

uint64_t sub_100006E20()
{
  return static MachServiceConstants.daemon.getter();
}

uint64_t sub_100006E30()
{
  return DispatchTimerProvider.init()();
}

uint64_t sub_100006E40()
{
  return type metadata accessor for DispatchTimerProvider();
}

uint64_t sub_100006E50()
{
  return type metadata accessor for EventDispatchStrategy();
}

uint64_t sub_100006E60()
{
  return static EngagementRequestProcessor.isAppInstalledRequest(_:)();
}

uint64_t sub_100006E70()
{
  return static EngagementRequestProcessor.validateEngagementRequest(_:)();
}

uint64_t sub_100006E80()
{
  return static Log.default.getter();
}

uint64_t sub_100006E90()
{
  return EventHub.init(queue:dispatchStrategy:timerProvider:)();
}

uint64_t sub_100006EA0()
{
  return type metadata accessor for EventHub();
}

uint64_t sub_100006EB0()
{
  return dispatch thunk of XPCClient.invalidate()();
}

uint64_t sub_100006EC0()
{
  return XPCClient.__allocating_init(machServiceName:queue:)();
}

uint64_t sub_100006ED0()
{
  return dispatch thunk of XPCClient.activate()();
}

uint64_t sub_100006EE0()
{
  return type metadata accessor for XPCClient();
}

uint64_t sub_100006EF0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006F00()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006F10()
{
  return Dictionary.description.getter();
}

NSString sub_100006F20()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006F30()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100006F40()
{
  return String.hash(into:)();
}

Swift::Int sub_100006F50()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006F60()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006F70()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100006F80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006F90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006FA0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100006FB0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006FC0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006FD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006FE0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006FF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007000()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100007010()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007020()
{
  return Error.logOutput.getter();
}

uint64_t sub_100007030()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007040()
{
  return Hasher._finalize()();
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_release()
{
  return _swift_release();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}