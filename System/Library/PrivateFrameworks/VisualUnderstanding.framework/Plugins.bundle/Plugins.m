uint64_t sub_3190(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = sub_113C0();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_11440();
  swift_retain_n();
  v8 = sub_11430();
  v9 = sub_115C0();
  if (os_log_type_enabled(v8, v9))
  {
    v17 = v1;
    v10 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v19 = v16;
    *(_DWORD *)v10 = 136315138;
    v15[1] = v10 + 4;
    sub_113E0();
    sub_3CF8();
    v11 = sub_116C0();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v18 = sub_36A0(v11, v13, &v19);
    sub_115F0();
    swift_release_n();
    v2 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v8, v9, "Initializing VUPersonalizationPlugin for the VUGallery for %s client", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  *(void *)(v2 + 16) = a1;
  return v2;
}

uint64_t sub_340C()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7Plugins23VUPersonalizationPlugin_logger;
  uint64_t v2 = sub_11450();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_34B4()
{
  return type metadata accessor for VUPersonalizationPlugin();
}

uint64_t type metadata accessor for VUPersonalizationPlugin()
{
  uint64_t result = qword_186B8;
  if (!qword_186B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3508()
{
  uint64_t result = sub_11450();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_35A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for VUPersonalizationPlugin();
  uint64_t v4 = swift_allocObject();
  uint64_t result = sub_3190(a1);
  *a2 = v4;
  return result;
}

void sub_35F8()
{
  uint64_t v0 = sub_11430();
  os_log_type_t v1 = sub_115E0();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, v0, v1, "Personalization plugin updated", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_36A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_3774(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_3DA0((uint64_t)v12, *a3);
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
      sub_3DA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_3D50((uint64_t)v12);
  return v7;
}

uint64_t sub_3774(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_11600();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_3930(a5, a6);
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
  uint64_t v8 = sub_11660();
  if (!v8)
  {
    sub_11670();
    __break(1u);
LABEL_17:
    uint64_t result = sub_116A0();
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

uint64_t sub_3930(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_39C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3BA8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_3BA8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_39C8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_3B40(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_11640();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_11670();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_114C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_116A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_11670();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_3B40(uint64_t a1, uint64_t a2)
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
  sub_3DFC(&qword_18770);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_3BA8(char a1, int64_t a2, char a3, char *a4)
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
    sub_3DFC(&qword_18770);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

unint64_t sub_3CF8()
{
  unint64_t result = qword_18B20;
  if (!qword_18B20)
  {
    sub_113C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18B20);
  }
  return result;
}

uint64_t sub_3D50(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3DFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3E44(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_113C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_11440();
  *(void *)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary) = 0;
  swift_retain_n();
  int64_t v8 = sub_11430();
  os_log_type_t v9 = sub_115C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v10 = 136315138;
    v16[1] = v10 + 4;
    v17 = v10;
    sub_113E0();
    sub_11174((unint64_t *)&qword_18B20, (void (*)(uint64_t))&type metadata accessor for VUGallery.Client);
    uint64_t v11 = sub_116C0();
    uint64_t v12 = a1;
    unint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v19 = sub_36A0(v11, v14, &v20);
    sub_115F0();
    swift_release_n();
    a1 = v12;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v8, v9, "Initializing VUDeviceOwnerPlugin for the VUGallery for %s client", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  *(void *)(v2 + 16) = a1;
  return v2;
}

id sub_4100()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_11260();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary;
  int64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary);
  if (v7)
  {
    id v8 = *(id *)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary);
  }
  else
  {
    os_log_type_t v9 = self;
    if ([v9 isMultiLibraryModeEnabled])
    {
      id v10 = [v9 systemPhotoLibraryURL];
      sub_11250();

      id v11 = objc_allocWithZone((Class)PHPhotoLibrary);
      sub_11240(v12);
      unint64_t v14 = v13;
      id v15 = [v11 initWithPhotoLibraryURL:v13];

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      id v15 = [v9 sharedPhotoLibrary];
    }
    v16 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v15;
    id v8 = v15;

    int64_t v7 = 0;
  }
  id v17 = v7;
  return v8;
}

unint64_t sub_429C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3DFC(&qword_18B18);
  uint64_t v2 = (void *)sub_11690();
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
    unint64_t result = sub_B918(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v10 = (uint64_t *)(v2[6] + 16 * result);
    *id v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
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

unint64_t sub_43B0(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3DFC(a2);
  uint64_t v3 = (void *)sub_11690();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    id v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_B918(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v12 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

Class sub_44C8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10BF8(0, &qword_18B08);
    v4.super.isa = sub_11460().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

void sub_4564(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_3DFC(&qword_18B00);
    uint64_t v2 = (void *)sub_11690();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10B8C();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_B918(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *uint64_t v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    v23 = (uint64_t *)(v2[6] + 16 * v20);
    uint64_t *v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_4808()
{
  uint64_t v1 = sub_11200();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v38 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  sub_3DFC(&qword_18BA0);
  uint64_t v5 = swift_allocBox();
  uint64_t v7 = v6;
  uint64_t v39 = v2;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v6, 1, 1, v1);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  v40 = (uint64_t *)(v8 + 16);
  *(unsigned char *)(v8 + 24) = 1;
  id v9 = [objc_allocWithZone((Class)CNContactStore) init];
  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = v0;
  v10[3] = v9;
  v10[4] = v4;
  v10[5] = v5;
  v10[6] = v8;
  aBlock[4] = (uint64_t)sub_10CD4;
  aBlock[5] = (uint64_t)v10;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_5864;
  aBlock[3] = (uint64_t)&unk_149B8;
  int64_t v11 = _Block_copy(aBlock);
  swift_retain();
  id v12 = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  [v12 requestAccessForEntityType:0 completionHandler:v11];
  _Block_release(v11);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  int64_t v13 = sub_11430();
  int v14 = sub_115C0();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v36 = v14;
    id v37 = v12;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v15 = 136315650;
    swift_beginAccess();
    unint64_t v16 = *(void *)(v4 + 24);
    uint64_t v34 = v4 + 16;
    if (v16)
    {
      uint64_t v17 = *(void *)(v4 + 16);
      unint64_t v18 = v16;
    }
    else
    {
      unint64_t v18 = 0xE300000000000000;
      uint64_t v17 = 7104878;
    }
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_36A0(v17, v18, aBlock);
    sub_115F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    swift_beginAccess();
    uint64_t v19 = v39;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v7, 1, v1))
    {
      unint64_t v20 = 0xE300000000000000;
      uint64_t v21 = 7104878;
    }
    else
    {
      char v22 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
      v33 = v13;
      v23 = v38;
      v22(v38, v7, v1);
      uint64_t v21 = sub_111D0();
      unint64_t v20 = v24;
      BOOL v25 = v23;
      int64_t v13 = v33;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v1);
    }
    uint64_t v41 = sub_36A0(v21, v20, aBlock);
    sub_115F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    uint64_t v26 = v40;
    swift_beginAccess();
    if (*(unsigned char *)(v8 + 24))
    {
      unint64_t v27 = 0xE300000000000000;
      uint64_t v28 = 7104878;
    }
    else
    {
      uint64_t v41 = *v26;
      sub_10CE4();
      uint64_t v28 = sub_11620();
      unint64_t v27 = v29;
    }
    uint64_t v41 = sub_36A0(v28, v27, aBlock);
    sub_115F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v13, (os_log_type_t)v36, "Fetched me contact with meContactIdentifier: %s and meBirthday %s and meAge %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
    swift_release_n();
    swift_release_n();
  }
  swift_beginAccess();
  uint64_t v30 = *(void *)(v4 + 16);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v30;
}

void sub_4E18(char a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v88 = a5;
  id v95 = a4;
  uint64_t v93 = sub_112F0();
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v91 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_11200();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v83 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v94 = (char *)&v81 - v15;
  uint64_t v16 = sub_11280();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v97 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_3DFC(&qword_18BA0);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v90 = (uint64_t)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v87 = (char *)&v81 - v22;
  uint64_t v89 = swift_projectBox();
  if (a2)
  {
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    v23 = sub_11430();
    os_log_type_t v24 = sub_115D0();
    if (!os_log_type_enabled(v23, v24))
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();
      if ((a1 & 1) == 0) {
        return;
      }
      goto LABEL_7;
    }
    uint64_t v25 = swift_slowAlloc();
    uint64_t v85 = v17;
    uint64_t v26 = (uint8_t *)v25;
    unint64_t v27 = (void *)swift_slowAlloc();
    uint64_t v86 = v16;
    v99[0] = v27;
    uint64_t v96 = v12;
    uint64_t v84 = v11;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_getErrorValue();
    uint64_t v28 = sub_116E0();
    uint64_t v98 = sub_36A0(v28, v29, (uint64_t *)v99);
    uint64_t v11 = v84;
    uint64_t v12 = v96;
    sub_115F0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v23, v24, "Failed to fetch the me contact identifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v86;
    swift_slowDealloc();
    uint64_t v17 = v85;
    swift_slowDealloc();
    swift_errorRelease();
  }
  if ((a1 & 1) == 0) {
    return;
  }
LABEL_7:
  sub_3DFC(&qword_18BB0);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_11CB0;
  *(void *)(v30 + 32) = CNContactIdentifierKey;
  *(void *)(v30 + 40) = CNContactBirthdayKey;
  v99[0] = (id)v30;
  sub_11520();
  v31 = CNContactIdentifierKey;
  uint64_t v32 = CNContactBirthdayKey;
  sub_3DFC(&qword_18BB8);
  Class isa = sub_114F0().super.isa;
  swift_bridgeObjectRelease();
  v99[0] = 0;
  id v34 = [v95 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:v99];

  if (v34)
  {
    uint64_t v96 = v12;
    uint64_t v35 = a7;
    uint64_t v36 = v88;
    id v37 = v99[0];
    id v38 = v34;
    id v39 = [v38 identifier];
    uint64_t v40 = sub_114A0();
    uint64_t v42 = v41;

    uint64_t v43 = 1;
    swift_beginAccess();
    *(void *)(v36 + 16) = v40;
    *(void *)(v36 + 24) = v42;
    swift_bridgeObjectRelease();
    id v95 = v38;
    id v44 = [v38 birthday];
    uint64_t v82 = v35;
    uint64_t v86 = v16;
    uint64_t v85 = v17;
    if (v44)
    {
      v45 = v44;
      uint64_t v46 = (uint64_t)v87;
      sub_111E0();

      uint64_t v43 = 0;
    }
    else
    {
      uint64_t v46 = (uint64_t)v87;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v96 + 56))(v46, v43, 1, v11);
    uint64_t v48 = v89;
    swift_beginAccess();
    sub_10D38(v46, v48, &qword_18BA0);
    sub_11270();
    v49 = v91;
    sub_112D0();
    sub_3DFC(&qword_18BC0);
    uint64_t v50 = sub_112E0();
    uint64_t v51 = *(void *)(v50 - 8);
    uint64_t v84 = v11;
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)(v51 + 72);
    unint64_t v54 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_11CC0;
    unint64_t v56 = v55 + v54;
    v57 = *(void (**)(unint64_t, void, uint64_t))(v52 + 104);
    v57(v56, enum case for Calendar.Component.year(_:), v50);
    v57(v56 + v53, enum case for Calendar.Component.month(_:), v50);
    v57(v56 + 2 * v53, enum case for Calendar.Component.day(_:), v50);
    v57(v56 + 3 * v53, enum case for Calendar.Component.hour(_:), v50);
    unint64_t v58 = v56 + 4 * v53;
    uint64_t v59 = v96;
    v57(v58, enum case for Calendar.Component.minute(_:), v50);
    sub_10D9C(v55);
    swift_setDeallocating();
    v60 = v97;
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v61 = v94;
    sub_112C0();
    uint64_t v62 = v84;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v49, v93);
    swift_beginAccess();
    uint64_t v63 = v90;
    sub_110B4(v48, v90, &qword_18BA0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v63, 1, v62) == 1)
    {
      id v64 = v95;

      (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v85 + 8))(v60, v86);
      sub_11118(v63, &qword_18BA0);
    }
    else
    {
      v65 = v83;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v83, v63, v62);
      uint64_t v66 = sub_111F0();
      uint64_t v67 = v86;
      uint64_t v68 = v85;
      if (v69)
      {
        id v79 = v95;

        v80 = *(void (**)(char *, uint64_t))(v59 + 8);
        v80(v65, v62);
        v80(v61, v62);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v97, v67);
      }
      else
      {
        uint64_t v70 = v66;
        uint64_t v71 = sub_111F0();
        char v73 = v72;
        id v74 = v95;

        v75 = *(void (**)(char *, uint64_t))(v59 + 8);
        v75(v65, v62);
        v75(v61, v62);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v97, v67);
        uint64_t v76 = v82;
        if ((v73 & 1) == 0)
        {
          BOOL v77 = __OFSUB__(v71, v70);
          uint64_t v78 = v71 - v70;
          if (v77) {
            __break(1u);
          }
          swift_beginAccess();
          *(void *)(v76 + 16) = v78;
          *(unsigned char *)(v76 + 24) = 0;
        }
      }
    }
  }
  else
  {
    id v47 = v99[0];
    sub_11210();

    swift_willThrow();
    swift_errorRelease();
  }
}

void sub_5864(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_58DC()
{
  id v0 = sub_4100();
  id v1 = [v0 librarySpecificFetchOptions];

  sub_10BF8(0, &qword_18B98);
  unint64_t v2 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v3 = (void *)sub_11590();
  [v1 setPredicate:v3];

  uint64_t v25 = v1;
  id v4 = [self fetchPersonsWithOptions:v1];
  id v5 = [v4 fetchedObjects];

  if (v5)
  {
    sub_10BF8(0, &qword_18B90);
    unint64_t v2 = sub_11500();
  }
  if (!(v2 >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_5;
    }
LABEL_18:

    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_11680();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_5:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v2 & 0xC000000000000001;
    uint64_t v27 = v6;
    unint64_t v26 = v2 & 0xC000000000000001;
    do
    {
      if (v9) {
        id v10 = (id)sub_11650();
      }
      else {
        id v10 = *(id *)(v2 + 8 * v8 + 32);
      }
      id v11 = v10;
      uint64_t v12 = sub_11430();
      os_log_type_t v13 = sub_115C0();
      if (os_log_type_enabled(v12, v13))
      {
        unint64_t v14 = v2;
        uint64_t v15 = swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 136315394;
        id v16 = [v11 localIdentifier];
        uint64_t v17 = sub_114A0();
        unint64_t v19 = v18;

        *(void *)(v15 + 4) = sub_36A0(v17, v19, &v28);
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        id v20 = [v11 name];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = sub_114A0();
          unint64_t v24 = v23;
        }
        else
        {
          unint64_t v24 = 0xED0000646E756F66;
          uint64_t v22 = 0x20656D616E206F6ELL;
        }
        *(void *)(v15 + 14) = sub_36A0(v22, v24, &v28);

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v12, v13, "Found PHPerson with localIdentifier %s with name %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        unint64_t v2 = v14;
        uint64_t v6 = v27;
        unint64_t v9 = v26;
      }
      else
      {
      }
      ++v8;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

id sub_5CA8(uint64_t a1, unint64_t a2)
{
  id v4 = sub_4100();
  id v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  sub_10BF8(0, &qword_18B98);
  uint64_t v6 = (void *)sub_11590();
  [v5 setPredicate:v6];

  uint64_t v7 = self;
  sub_3DFC(&qword_18B78);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_11CD0;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  Class isa = sub_114F0().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v7 fetchPersonsForContactIdentifiers:isa options:v5];

  id v11 = [v10 firstObject];
  id v26 = v11;
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_11430();
  os_log_type_t v13 = sub_115C0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315650;
    swift_bridgeObjectRetain();
    sub_36A0(a1, a2, &v25);
    sub_115F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2080;
    swift_beginAccess();
    id v11 = v26;
    if (v26)
    {
      id v15 = [v26 localIdentifier];
      unint64_t v16 = sub_114A0();
      unint64_t v18 = v17;
    }
    else
    {
      unint64_t v16 = 0xD000000000000018;
      unint64_t v18 = 0x8000000000012340;
    }
    unint64_t v19 = 0xED0000646E756F66;
    uint64_t v20 = 0x20656D616E206F6ELL;
    sub_36A0(v16, v18, &v25);
    sub_115F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    if (v11)
    {
      id v21 = [v11 name];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v20 = sub_114A0();
        unint64_t v19 = v23;
      }
    }
    sub_36A0(v20, v19, &v25);
    sub_115F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v12, v13, "Found PHPerson linked with contact %s with localIdentifier: %s, name: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return v11;
}

void *sub_60A8(uint64_t a1, unint64_t a2)
{
  uint64_t v56 = sub_11230();
  uint64_t v5 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = sub_4100();
  id v9 = [v8 librarySpecificFetchOptions];

  unint64_t v10 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t v63 = (unint64_t)&_swiftEmptyArrayStorage;
  id v11 = [self fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions:v9];
  if (v11)
  {
    os_log_type_t v13 = v11;
    id v14 = [v11 fetchedObjects];

    if (v14)
    {
      sub_10BF8(0, &qword_18B90);
      unint64_t v10 = sub_11500();
    }
  }
  if (v10 >> 62) {
    goto LABEL_39;
  }
  uint64_t v49 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
  if (!v49) {
    goto LABEL_40;
  }
  do
  {
    id v43 = v9;
    unint64_t v15 = 0;
    unint64_t v54 = &v2[OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger];
    unint64_t v55 = v10 & 0xC000000000000001;
    uint64_t v45 = v10 & 0xFFFFFFFFFFFFFF8;
    unint64_t v50 = v10;
    unint64_t v44 = v10 + 32;
    uint64_t v48 = (char *)v60 + 8;
    uint64_t v53 = (void (**)(char *, uint64_t))(v5 + 8);
    *(void *)&long long v12 = 136315394;
    long long v47 = v12;
    uint64_t v46 = (char *)&type metadata for Any + 8;
    unint64_t v10 = (unint64_t)PHUserFeedback_ptr;
    uint64_t v5 = v49;
    while (1)
    {
      if (v55)
      {
        id v16 = (id)sub_11650();
        BOOL v17 = __OFADD__(v15, 1);
        unint64_t v18 = v15 + 1;
        if (v17) {
          break;
        }
        goto LABEL_14;
      }
      if (v15 >= *(void *)(v45 + 16)) {
        goto LABEL_38;
      }
      id v16 = *(id *)(v44 + 8 * v15);
      BOOL v17 = __OFADD__(v15, 1);
      unint64_t v18 = v15 + 1;
      if (v17) {
        break;
      }
LABEL_14:
      id v19 = v16;
      swift_bridgeObjectRetain_n();
      id v20 = v19;
      id v21 = sub_11430();
      os_log_type_t v22 = sub_115C0();
      BOOL v23 = os_log_type_enabled(v21, v22);
      unint64_t v57 = v18;
      id v58 = v20;
      if (v23)
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        *(void *)&long long v61 = v52;
        *(_DWORD *)uint64_t v24 = v47;
        uint64_t v51 = v24 + 4;
        uint64_t v25 = a1;
        unint64_t v26 = a2;
        id v27 = objc_msgSend(v20, "localIdentifier", v43);
        uint64_t v28 = sub_114A0();
        unint64_t v30 = v29;

        a2 = v26;
        a1 = v25;
        uint64_t v5 = v49;
        *(void *)&v60[0] = sub_36A0(v28, v30, (uint64_t *)&v61);
        sub_115F0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&v60[0] = sub_36A0(a1, a2, (uint64_t *)&v61);
        id v20 = v58;
        sub_115F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v21, v22, "Found PHPerson with localIdentifier %s with negative feedback for contact %s", (uint8_t *)v24, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      [v20 fetchPropertySetsIfNeeded];
      id v31 = [v20 userFeedbackProperties];
      id v9 = [v31 autonamingUserFeedbacks];

      if (!v9)
      {
        sub_10BF8(0, &qword_18B80);
        id v9 = (id)sub_115A0();
      }
      sub_115B0();
      unint64_t v2 = v7;
      sub_11220();
      while (v62)
      {
        sub_10BE8(&v61, v60);
        sub_10BF8(0, &qword_18B88);
        if (!swift_dynamicCast()) {
          goto LABEL_22;
        }
        id v32 = v59;
        unint64_t v33 = (unint64_t)[v59 feature];
        if ((v33 & 0x8000000000000000) == 0 && v33 == 2)
        {
          id v34 = [v32 context];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = sub_114A0();
            uint64_t v38 = v37;

            if (v36 == a1 && v38 == a2)
            {
              swift_bridgeObjectRelease();
LABEL_32:
              id v40 = v58;
              sub_114E0();
              if (*(void *)((char *)&dword_10 + (v63 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v63 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_11530();
              sub_11550();
              sub_11520();
              goto LABEL_21;
            }
            char v39 = sub_116D0();
            swift_bridgeObjectRelease();
            if (v39) {
              goto LABEL_32;
            }
          }
        }
LABEL_21:

LABEL_22:
        unint64_t v2 = v7;
        sub_11220();
      }
      (*v53)(v7, v56);

      unint64_t v15 = v57;
      if (v57 == v5)
      {

        swift_bridgeObjectRelease();
        return (void *)v63;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_11680();
    swift_bridgeObjectRelease();
    uint64_t v49 = v42;
  }
  while (v42);
LABEL_40:

  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_6760(uint64_t a1, uint64_t a2)
{
  id v4 = sub_4100();
  id v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  uint64_t v6 = self;
  sub_3DFC(&qword_18B78);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_11CD0;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  Class isa = sub_114F0().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v6 fetchPersonsWithLocalIdentifiers:isa options:v5];

  id v10 = [v9 firstObject];
  if (v10)
  {
    unsigned int v11 = [v10 ageType];
  }
  else
  {

    unsigned int v11 = 0;
  }
  return v11 | ((v10 == 0) << 16);
}

uint64_t sub_68B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v88 = sub_113C0();
  v91 = *(uint8_t **)(v88 - 8);
  __chkstk_darwin(v88);
  v87 = (char *)v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DFC(&qword_18B28);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v83 = (char *)v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  long long v12 = (char *)v72 - v11;
  uint64_t v13 = sub_3DFC(&qword_18B30);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v84 = (char *)v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)v72 - v16;
  uint64_t v18 = sub_112B0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v90 = (char *)v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_3DFC(&qword_18AD8);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v79 = (uint64_t)v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v82 = (char *)v72 - v25;
  __chkstk_darwin(v24);
  id v27 = (char *)v72 - v26;
  uint64_t v28 = sub_11360();
  uint64_t v85 = *(void *)(v28 - 8);
  uint64_t v86 = v28;
  uint64_t v81 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 56);
  v81(v27, 1, 1);
  uint64_t v89 = v3;
  id v29 = sub_5CA8(a1, a2);
  if (!v29) {
    goto LABEL_24;
  }
  id v30 = v29;
  NSString v31 = [v30 localIdentifier];
  if (!v31)
  {
    sub_114A0();
    NSString v31 = sub_11490();
    swift_bridgeObjectRelease();
  }
  id v32 = [self uuidFromLocalIdentifier:v31];

  if (!v32)
  {

    goto LABEL_24;
  }
  sub_114A0();
  uint64_t v80 = v19;

  sub_11290();
  uint64_t v33 = v80;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v17, 1, v18) == 1)
  {

    sub_11118((uint64_t)v17, &qword_18B30);
LABEL_24:
    swift_beginAccess();
    sub_110B4((uint64_t)v27, a3, &qword_18AD8);
    return sub_11118((uint64_t)v27, &qword_18AD8);
  }
  id v78 = v30;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v90, v17, v18);
  uint64_t v34 = v88;
  uint64_t v35 = v91;
  uint64_t v36 = v87;
  (*((void (**)(char *, void, uint64_t))v91 + 13))(v87, enum case for VUGallery.Client.photos(_:), v88);
  swift_retain();
  uint64_t v37 = sub_113A0();
  swift_release();
  uint64_t v38 = (void (*)(char *, uint64_t))*((void *)v35 + 1);
  v91 = v35 + 8;
  v75 = v38;
  v38(v36, v34);
  uint64_t v39 = *(void *)(v37 + 16);
  uint64_t v40 = sub_11420();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v41;
  uint64_t v77 = a3;
  uint64_t v76 = v18;
  if (v39)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v12, v37 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80)), v40);
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v43 = 1;
  }
  unint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  v44(v12, v43, 1, v40);
  swift_bridgeObjectRelease();
  uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  int v46 = v45(v12, 1, v40);
  id v47 = v78;
  if (v46 == 1)
  {

    sub_11118((uint64_t)v12, &qword_18B28);
    a3 = v77;
    uint64_t v48 = v76;
LABEL_23:
    (*(void (**)(char *, uint64_t))(v80 + 8))(v90, v48);
    goto LABEL_24;
  }
  id v74 = v45;
  char v73 = v44;
  uint64_t v49 = sub_11410();
  unint64_t v50 = *(void (**)(char *, uint64_t))(v42 + 8);
  v72[1] = v42 + 8;
  v72[0] = v50;
  v50(v12, v40);
  swift_retain();
  uint64_t v51 = v87;
  sub_113E0();
  sub_113B0();
  v75(v51, v88);
  v91 = (uint8_t *)v49;
  uint64_t v52 = sub_11390();
  swift_release();
  if (*(void *)(v52 + 16))
  {
    uint64_t v53 = v83;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v83, v52 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80)), v40);
    uint64_t v54 = 0;
    uint64_t v55 = v86;
  }
  else
  {
    uint64_t v54 = 1;
    uint64_t v55 = v86;
    uint64_t v53 = v83;
  }
  uint64_t v56 = v84;
  v73(v53, v54, 1, v40);
  swift_bridgeObjectRelease();
  int v57 = v74(v53, 1, v40);
  uint64_t v58 = (uint64_t)v53;
  uint64_t v59 = v80;
  if (v57 == 1)
  {
    sub_11118(v58, &qword_18B28);
    uint64_t v60 = 1;
  }
  else
  {
    sub_113F0();
    ((void (*)(uint64_t, uint64_t))v72[0])(v58, v40);
    uint64_t v60 = 0;
  }
  a3 = v77;
  uint64_t v48 = v76;
  uint64_t v61 = v85;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v56, v60, 1, v76);
  uint64_t v62 = (uint64_t)v82;
  sub_11370();
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v81)(v62, 0, 1, v55);
  sub_10D38(v62, (uint64_t)v27, &qword_18AD8);
  unint64_t v63 = sub_11430();
  os_log_type_t v64 = sub_115C0();
  if (!os_log_type_enabled(v63, v64))
  {

    id v70 = v78;
    goto LABEL_23;
  }
  v65 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v65 = 134217984;
  swift_beginAccess();
  uint64_t v66 = v79;
  sub_110B4((uint64_t)v27, v79, &qword_18AD8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v66, 1, v55) != 1)
  {
    v91 = v65 + 4;
    uint64_t v67 = v66;
    uint64_t v68 = sub_11350();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v67, v55);
    uint64_t v92 = v68;
    sub_115F0();
    _os_log_impl(&dword_0, v63, v64, "Device owner: found ground truth %ld", v65, 0xCu);
    swift_slowDealloc();

    id v69 = v78;
    goto LABEL_23;
  }
  uint64_t result = sub_11118((uint64_t)v27, &qword_18AD8);
  __break(1u);
  return result;
}

uint64_t sub_7234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_112B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DFC(&qword_18B28);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v119 = (char *)v110 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v120 = (char *)v110 - v11;
  uint64_t v123 = sub_11420();
  uint64_t v134 = *(void *)(v123 - 8);
  uint64_t v12 = __chkstk_darwin(v123);
  v133 = (char *)v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v110 - v14;
  uint64_t v16 = sub_113C0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v136 = v16;
  uint64_t v137 = v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v132 = (char *)v110 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v135 = (char *)v110 - v20;
  uint64_t v21 = sub_3DFC(&qword_18B30);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v24 = (char *)v110 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22);
  id v27 = (char *)v110 - v26;
  uint64_t v28 = __chkstk_darwin(v25);
  id v30 = (char *)v110 - v29;
  __chkstk_darwin(v28);
  id v32 = (char *)v110 - v31;
  v142[0] = a1;
  v142[1] = a2;
  uint64_t v140 = 58;
  unint64_t v141 = 0xE100000000000000;
  sub_10B94();
  uint64_t v33 = (void *)sub_11610();
  if (!v33[2])
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v138 = (void (*)(void, void, void, void))v30;
  v117 = v24;
  v113 = v27;
  v114 = v7;
  uint64_t v34 = v33[4];
  unint64_t v35 = v33[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_11290();
  uint64_t v118 = v5;
  uint64_t v38 = *(unsigned int (**)(void, void, void))(v5 + 48);
  uint64_t v37 = v5 + 48;
  uint64_t v36 = v38;
  if (v38(v32, 1, v4) == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = (uint64_t)v32;
LABEL_53:
    sub_11118(v39, &qword_18B30);
    return 0;
  }
  v115 = v36;
  uint64_t v116 = v37;
  sub_11118((uint64_t)v32, &qword_18B30);
  uint64_t v40 = v121 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  swift_bridgeObjectRetain_n();
  uint64_t v112 = v40;
  uint64_t v41 = sub_11430();
  os_log_type_t v42 = sub_115C0();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v111 = v4;
  if (v43)
  {
    unint64_t v44 = (uint8_t *)swift_slowAlloc();
    v142[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v44 = 136315138;
    uint64_t v4 = v111;
    swift_bridgeObjectRetain();
    uint64_t v140 = sub_36A0(v34, v35, v142);
    sub_115F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v41, v42, "Me Contact Picture: fetching tags for UUID %s", v44, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v45 = v123;
  uint64_t v46 = v134;
  id v47 = v15;
  swift_retain();
  uint64_t v48 = v138;
  sub_11290();
  swift_bridgeObjectRelease();
  uint64_t result = ((uint64_t (*)(void (*)(void, void, void, void), uint64_t, uint64_t))v115)(v48, 1, v4);
  if (result == 1) {
    goto LABEL_57;
  }
  uint64_t v51 = v136;
  uint64_t v50 = v137;
  uint64_t v52 = v135;
  v130 = *(void (**)(char *, void, uint64_t))(v137 + 104);
  uint64_t v131 = v137 + 104;
  v130(v135, enum case for VUGallery.Client.contacts(_:), v136);
  uint64_t v53 = sub_113A0();
  swift_release();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v50 + 8);
  uint64_t v137 = v50 + 8;
  v129 = v54;
  v54(v52, v51);
  uint64_t v55 = *(uint64_t (**)(void, void))(v118 + 8);
  v110[1] = v118 + 8;
  v110[0] = v55;
  uint64_t result = v55(v48, v4);
  uint64_t v56 = &_swiftEmptyArrayStorage;
  v142[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v128 = *(void *)(v53 + 16);
  if (v128)
  {
    unint64_t v57 = 0;
    uint64_t v126 = v46 + 16;
    unsigned int v125 = enum case for VUGallery.Client.photos(_:);
    v122 = (uint64_t (**)(char *, uint64_t))(v46 + 8);
    v124 = (void (**)(char *, char *, uint64_t))(v46 + 32);
    uint64_t v58 = v47;
    uint64_t v59 = v45;
    uint64_t v127 = v53;
    while (v57 < *(void *)(v53 + 16))
    {
      unint64_t v60 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
      v138 = *(void (**)(void, void, void, void))(v46 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v46 + 16))(v58, v53 + v60 + (void)v138 * v57, v59);
      uint64_t v61 = v135;
      sub_11400();
      uint64_t v62 = v132;
      uint64_t v63 = v136;
      v130(v132, v125, v136);
      sub_11174(&qword_18B68, (void (*)(uint64_t))&type metadata accessor for VUGallery.Client);
      sub_114D0();
      sub_114D0();
      int v64 = (unsigned __int16)v140;
      int v65 = v139;
      uint64_t v66 = v129;
      v129(v62, v63);
      v66(v61, v63);
      if (v64 == v65)
      {
        uint64_t v67 = *v124;
        (*v124)(v133, v58, v59);
        uint64_t v68 = v142[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_BBF8(0, *(void *)(v68 + 16) + 1, 1);
          uint64_t v68 = v142[0];
        }
        uint64_t v53 = v127;
        id v69 = v138;
        unint64_t v71 = *(void *)(v68 + 16);
        unint64_t v70 = *(void *)(v68 + 24);
        if (v71 >= v70 >> 1)
        {
          sub_BBF8(v70 > 1, v71 + 1, 1);
          uint64_t v68 = v142[0];
        }
        *(void *)(v68 + 16) = v71 + 1;
        uint64_t v59 = v123;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v67)(v68 + v60 + v71 * (void)v69, v133, v123);
        v142[0] = v68;
        uint64_t v46 = v134;
      }
      else
      {
        uint64_t result = (*v122)(v58, v59);
        uint64_t v46 = v134;
        uint64_t v53 = v127;
      }
      if (v128 == ++v57)
      {
        uint64_t v56 = (void *)v142[0];
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  uint64_t v72 = v56[2];
  if (v72 != 1)
  {
    swift_retain();
    uint64_t v81 = sub_11430();
    os_log_type_t v82 = sub_115C0();
    if (os_log_type_enabled(v81, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v83 = 134217984;
      swift_release();
      v142[0] = v72;
      sub_115F0();
      swift_release();
      _os_log_impl(&dword_0, v81, v82, "Me Contact Picture: found %ld faces, not usable for device owner inference.", v83, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  char v73 = sub_11430();
  os_log_type_t v74 = sub_115C0();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_0, v73, v74, "Me Contact Picture: found exactly one face", v75, 2u);
    swift_slowDealloc();
  }

  if (v56[2])
  {
    uint64_t v76 = v120;
    uint64_t v77 = v123;
    (*(void (**)(char *, unint64_t, uint64_t))(v46 + 16))(v120, (unint64_t)v56+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80)), v123);
    id v78 = *(void (**)(void, void, void, void))(v46 + 56);
    uint64_t v79 = v76;
    uint64_t v80 = 0;
  }
  else
  {
    id v78 = *(void (**)(void, void, void, void))(v46 + 56);
    uint64_t v76 = v120;
    uint64_t v79 = v120;
    uint64_t v80 = 1;
    uint64_t v77 = v123;
  }
  v138 = v78;
  v78(v79, v80, 1, v77);
  swift_release();
  uint64_t v84 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  uint64_t result = v84(v76, 1, v77);
  if (result != 1)
  {
    uint64_t v85 = sub_11410();
    v133 = *(char **)(v46 + 8);
    ((void (*)(char *, uint64_t))v133)(v76, v77);
    uint64_t v86 = v135;
    uint64_t v87 = v136;
    v130(v135, enum case for VUGallery.Client.photos(_:), v136);
    swift_retain();
    sub_113B0();
    v129(v86, v87);
    uint64_t v88 = sub_11390();
    swift_release();
    if (*(void *)(v88 + 16))
    {
      uint64_t v89 = (uint64_t)v119;
      (*(void (**)(char *, unint64_t, uint64_t))(v46 + 16))(v119, v88 + ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80)), v77);
      uint64_t v90 = 0;
    }
    else
    {
      uint64_t v90 = 1;
      uint64_t v89 = (uint64_t)v119;
    }
    v91 = v115;
    v138(v89, v90, 1, v77);
    swift_bridgeObjectRelease();
    if (v84((char *)v89, 1, v77) == 1)
    {
      sub_11118(v89, &qword_18B28);
      uint64_t v92 = 1;
      uint64_t v93 = v111;
      v94 = v114;
      uint64_t v95 = (uint64_t)v113;
    }
    else
    {
      uint64_t v95 = (uint64_t)v113;
      sub_113F0();
      ((void (*)(uint64_t, uint64_t))v133)(v89, v77);
      uint64_t v92 = 0;
      uint64_t v93 = v111;
      v94 = v114;
    }
    uint64_t v96 = v118;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v118 + 56))(v95, v92, 1, v93);
    uint64_t v97 = (uint64_t)v117;
    sub_110B4(v95, (uint64_t)v117, &qword_18B30);
    if (v91(v97, 1, v93) == 1)
    {
      sub_11118(v97, &qword_18B30);
      uint64_t v98 = sub_11430();
      os_log_type_t v99 = sub_115C0();
      if (os_log_type_enabled(v98, v99))
      {
        v100 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_0, v98, v99, "Me Contact Picture: does not match a PHPerson", v100, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v94, v97, v93);
      uint64_t v101 = sub_112A0();
      int v103 = sub_6760(v101, v102);
      swift_bridgeObjectRelease();
      v104 = sub_11430();
      os_log_type_t v105 = sub_115C0();
      BOOL v106 = os_log_type_enabled(v104, v105);
      if ((v103 & 0x10000) == 0 && (unsigned __int16)(v103 - 6) >= 0xFFFDu)
      {
        if (v106)
        {
          v107 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v107 = 33554688;
          LOWORD(v142[0]) = v103;
          sub_115F0();
          _os_log_impl(&dword_0, v104, v105, "Me Contact Picture: matches a PHPerson young adult, adult or senior (age %hu), returning this entity", v107, 6u);
          swift_slowDealloc();
        }

        ((void (*)(char *, uint64_t))v110[0])(v94, v111);
        sub_11118(v95, &qword_18B30);
        return v85;
      }
      if (v106)
      {
        v108 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v108 = 33554688;
        if ((v103 & 0x10000) != 0) {
          __int16 v109 = 0;
        }
        else {
          __int16 v109 = v103;
        }
        LOWORD(v142[0]) = v109;
        sub_115F0();
        _os_log_impl(&dword_0, v104, v105, "Me Contact Picture: matches a PHPerson not adult (age %hu), not usable for device owner inference", v108, 6u);
        swift_slowDealloc();
      }

      ((void (*)(char *, uint64_t))v110[0])(v94, v111);
    }
    uint64_t v39 = v95;
    goto LABEL_53;
  }
LABEL_58:
  __break(1u);
  return result;
}

char *sub_81BC(uint64_t a1, unint64_t a2)
{
  uint64_t v84 = sub_113C0();
  uint64_t v74 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v83 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3DFC(&qword_18B30);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v70 - v10;
  uint64_t v88 = sub_112B0();
  uint64_t v73 = *(void *)(v88 - 8);
  uint64_t v12 = __chkstk_darwin(v88);
  uint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  os_log_type_t v82 = (char *)&v70 - v15;
  uint64_t v93 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v85 = v2;
  unint64_t v16 = sub_58DC();
  uint64_t v87 = v16;
  if (v16 >> 62) {
    uint64_t result = (char *)sub_11680();
  }
  else {
    uint64_t result = *(char **)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v18 = &VUPersonalizationPlugin;
  if (result)
  {
    if ((uint64_t)result >= 1)
    {
      unint64_t v71 = v14;
      uint64_t v72 = v9;
      uint64_t v19 = 0;
      uint64_t v20 = v87;
      id v90 = (id)(v87 & 0xC000000000000001);
      uint64_t v86 = (unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
      uint64_t v81 = (void (**)(char *, char *, uint64_t))(v73 + 32);
      unsigned int v80 = enum case for VUGallery.Client.photos(_:);
      id v78 = (void (**)(char *, uint64_t))(v74 + 8);
      uint64_t v79 = (void (**)(char *, void, uint64_t))(v74 + 104);
      v75 = (void (**)(char *, uint64_t))(v73 + 8);
      unint64_t v89 = (unint64_t)result;
      uint64_t v77 = v11;
      uint64_t v76 = a1;
      while (1)
      {
        if (v90) {
          id v21 = (id)sub_11650();
        }
        else {
          id v21 = *(id *)(v20 + 8 * v19 + 32);
        }
        uint64_t v22 = v21;
        id v23 = [v21 personUri];
        if (!v23) {
          goto LABEL_17;
        }
        uint64_t v24 = v23;
        uint64_t v25 = sub_114A0();
        uint64_t v27 = v26;

        if (v25 == a1 && v27 == a2)
        {

          swift_bridgeObjectRelease();
          goto LABEL_7;
        }
        char v29 = sub_116D0();
        swift_bridgeObjectRelease();
        if ((v29 & 1) == 0)
        {
LABEL_17:
          NSString v30 = [v22 *(SEL *)&v18[18].flags];
          if (!v30)
          {
            sub_114A0();
            NSString v30 = sub_11490();
            swift_bridgeObjectRelease();
          }
          id v31 = [self uuidFromLocalIdentifier:v30];

          if (v31)
          {
            sub_114A0();

            sub_11290();
            swift_bridgeObjectRelease();
            uint64_t v32 = v88;
            if ((*v86)(v11, 1, v88) == 1)
            {

              sub_11118((uint64_t)v11, &qword_18B30);
              uint64_t v20 = v87;
            }
            else
            {
              uint64_t v33 = v11;
              unint64_t v34 = a2;
              unint64_t v35 = v82;
              (*v81)(v82, v33, v32);
              uint64_t v36 = v84;
              uint64_t v37 = v83;
              (*v79)(v83, v80, v84);
              swift_retain();
              uint64_t v38 = sub_11330();
              char v40 = v39;
              swift_release();
              (*v78)(v37, v36);
              if (v40)
              {
                (*v75)(v35, v32);

                uint64_t v18 = &VUPersonalizationPlugin;
                a2 = v34;
                a1 = v76;
                uint64_t v11 = v77;
                uint64_t v20 = v87;
              }
              else
              {
                uint64_t v41 = v93;
                a2 = v34;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v41 = sub_B7C4(0, *((void *)v41 + 2) + 1, 1, v41);
                }
                a1 = v76;
                os_log_type_t v42 = v82;
                unint64_t v44 = *((void *)v41 + 2);
                unint64_t v43 = *((void *)v41 + 3);
                uint64_t v11 = v77;
                if (v44 >= v43 >> 1) {
                  uint64_t v41 = sub_B7C4((char *)(v43 > 1), v44 + 1, 1, v41);
                }
                *((void *)v41 + 2) = v44 + 1;
                *(void *)&v41[8 * v44 + 32] = v38;

                uint64_t v93 = v41;
                (*v75)(v42, v88);
                uint64_t v18 = &VUPersonalizationPlugin;
                uint64_t v20 = v87;
              }
            }
            goto LABEL_7;
          }
        }

LABEL_7:
        if (v89 == ++v19)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = v72;
          uint64_t v14 = v71;
          goto LABEL_32;
        }
      }
    }
    __break(1u);
    goto LABEL_59;
  }
  swift_bridgeObjectRelease();
LABEL_32:
  unint64_t v45 = (unint64_t)sub_60A8(a1, a2);
  unint64_t v46 = v45;
  uint64_t v47 = v88;
  if (v45 >> 62)
  {
    uint64_t v48 = sub_11680();
    if (!v48) {
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v48 = *(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8));
    if (!v48) {
      goto LABEL_55;
    }
  }
  uint64_t result = (char *)self;
  id v90 = result;
  if (v48 < 1)
  {
LABEL_59:
    __break(1u);
    return result;
  }
  uint64_t v49 = 0;
  unint64_t v89 = v46 & 0xC000000000000001;
  uint64_t v86 = (unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
  uint64_t v81 = (void (**)(char *, char *, uint64_t))(v73 + 32);
  unsigned int v80 = enum case for VUGallery.Client.photos(_:);
  id v78 = (void (**)(char *, uint64_t))(v74 + 8);
  uint64_t v79 = (void (**)(char *, void, uint64_t))(v74 + 104);
  uint64_t v77 = (char *)(v73 + 8);
  os_log_type_t v82 = (char *)v46;
  uint64_t v87 = v48;
  do
  {
    if (v89) {
      id v50 = (id)sub_11650();
    }
    else {
      id v50 = *(id *)(v46 + 8 * v49 + 32);
    }
    uint64_t v51 = v50;
    NSString v52 = [v50 *(SEL *)&v18[18].flags];
    if (!v52)
    {
      sub_114A0();
      NSString v52 = sub_11490();
      swift_bridgeObjectRelease();
    }
    id v53 = [v90 uuidFromLocalIdentifier:v52];

    if (v53)
    {
      sub_114A0();

      sub_11290();
      swift_bridgeObjectRelease();
      if ((*v86)(v9, 1, v47) == 1)
      {

        sub_11118((uint64_t)v9, &qword_18B30);
        uint64_t v48 = v87;
      }
      else
      {
        uint64_t v54 = v9;
        (*v81)(v14, v9, v47);
        uint64_t v55 = v83;
        uint64_t v56 = v47;
        uint64_t v57 = v84;
        (*v79)(v83, v80, v84);
        swift_retain();
        uint64_t v58 = sub_11330();
        char v60 = v59;
        swift_release();
        (*v78)(v55, v57);
        if (v60)
        {
          (*(void (**)(char *, uint64_t))v77)(v14, v56);

          uint64_t v9 = v54;
          uint64_t v47 = v56;
          uint64_t v18 = &VUPersonalizationPlugin;
          unint64_t v46 = (unint64_t)v82;
          uint64_t v48 = v87;
        }
        else
        {
          uint64_t v61 = v93;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v61 = sub_B7C4(0, *((void *)v61 + 2) + 1, 1, v61);
          }
          uint64_t v9 = v54;
          uint64_t v18 = &VUPersonalizationPlugin;
          unint64_t v63 = *((void *)v61 + 2);
          unint64_t v62 = *((void *)v61 + 3);
          unint64_t v46 = (unint64_t)v82;
          if (v63 >= v62 >> 1) {
            uint64_t v61 = sub_B7C4((char *)(v62 > 1), v63 + 1, 1, v61);
          }
          *((void *)v61 + 2) = v63 + 1;
          *(void *)&v61[8 * v63 + 32] = v58;

          uint64_t v93 = v61;
          uint64_t v47 = v88;
          (*(void (**)(char *, uint64_t))v77)(v14, v88);
          uint64_t v48 = v87;
        }
      }
    }
    else
    {
    }
    ++v49;
  }
  while (v48 != v49);
LABEL_55:
  swift_bridgeObjectRelease();
  int v64 = sub_11430();
  os_log_type_t v65 = sub_115C0();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    v92[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v66 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_11510();
    unint64_t v69 = v68;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_36A0(v67, v69, v92);
    sub_115F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v64, v65, "Device owner: invalid persons %s", v66, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return v93;
}

uint64_t sub_8C40(uint64_t a1, int a2)
{
  int v66 = a2;
  uint64_t v3 = sub_112B0();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  int v64 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  os_log_type_t v65 = (char *)&v63 - v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v63 - v8;
  uint64_t v10 = sub_113C0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3DFC(&qword_18B28);
  __chkstk_darwin(v14 - 8);
  unint64_t v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_3DFC(&qword_18B30);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v70 = (uint64_t)&v63 - v21;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for VUGallery.Client.photos(_:), v10);
  swift_retain();
  sub_113B0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v67 = a1;
  uint64_t v22 = sub_11390();
  swift_release();
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = sub_11420();
  uint64_t v25 = *(void *)(v24 - 8);
  if (v23)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v16, v22+ ((*(unsigned __int8 *)(*(void *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80)), v24);
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v16, v26, 1, v24);
  swift_bridgeObjectRelease();
  int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v16, 1, v24);
  uint64_t v28 = v70;
  if (v27 == 1)
  {
    sub_11118((uint64_t)v16, &qword_18B28);
    uint64_t v29 = 1;
  }
  else
  {
    sub_113F0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v24);
    uint64_t v29 = 0;
  }
  NSString v30 = v9;
  uint64_t v32 = v68;
  uint64_t v31 = v69;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v28, v29, 1, v69);
  sub_110B4(v28, (uint64_t)v20, &qword_18B30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v20, 1, v31) == 1)
  {
    sub_11118((uint64_t)v20, &qword_18B30);
LABEL_15:
    unint64_t v46 = sub_11430();
    os_log_type_t v47 = sub_115C0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 134217984;
      uint64_t v72 = v67;
      sub_115F0();
      _os_log_impl(&dword_0, v46, v47, "Age of the entity %ld not found", v48, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v49 = v28;
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v30, v20, v31);
  uint64_t v33 = sub_112A0();
  int v35 = sub_6760(v33, v34);
  swift_bridgeObjectRelease();
  if ((v35 & 0x10000) != 0)
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
    goto LABEL_15;
  }
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  if ((unsigned __int16)v35 != 1 && (v66 & ((unsigned __int16)v35 == 2)) == 0)
  {
    uint64_t v37 = v64;
    v36(v64, v30, v31);
    uint64_t v38 = sub_11430();
    os_log_type_t v39 = sub_115C0();
    if (os_log_type_enabled(v38, v39))
    {
      char v40 = v37;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      os_log_type_t v65 = (char *)v42;
      *(_DWORD *)uint64_t v41 = 134218754;
      uint64_t v71 = v67;
      uint64_t v72 = v42;
      uint64_t v67 = (uint64_t)v30;
      sub_115F0();
      *(_WORD *)(v41 + 12) = 2080;
      uint64_t v43 = sub_112A0();
      uint64_t v71 = sub_36A0(v43, v44, &v72);
      sub_115F0();
      swift_bridgeObjectRelease();
      unint64_t v45 = *(void (**)(char *, uint64_t))(v32 + 8);
      v45(v40, v31);
      *(_WORD *)(v41 + 22) = 512;
      LOWORD(v71) = v35;
      sub_115F0();
      *(_WORD *)(v41 + 26) = 1024;
      LODWORD(v71) = v66 & 1;
      sub_115F0();
      _os_log_impl(&dword_0, v38, v39, "Age of the entity %ld, UUID %s is %hu (not baby nor a child if includeChild %{BOOL}d)", (uint8_t *)v41, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v45((char *)v67, v31);
    }
    else
    {

      unint64_t v62 = *(void (**)(char *, uint64_t))(v32 + 8);
      v62(v37, v31);
      v62(v30, v31);
    }
    uint64_t v49 = v70;
LABEL_18:
    sub_11118(v49, &qword_18B30);
    return 0;
  }
  NSString v52 = v65;
  v36(v65, v30, v31);
  id v53 = sub_11430();
  os_log_type_t v54 = sub_115C0();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = v52;
    uint64_t v56 = swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    int v64 = (char *)v57;
    *(_DWORD *)uint64_t v56 = 134218754;
    uint64_t v71 = v67;
    uint64_t v72 = v57;
    uint64_t v67 = (uint64_t)v30;
    sub_115F0();
    *(_WORD *)(v56 + 12) = 2080;
    uint64_t v58 = sub_112A0();
    uint64_t v71 = sub_36A0(v58, v59, &v72);
    sub_115F0();
    swift_bridgeObjectRelease();
    char v60 = *(void (**)(char *, uint64_t))(v32 + 8);
    v60(v55, v31);
    *(_WORD *)(v56 + 22) = 512;
    LOWORD(v71) = v35;
    sub_115F0();
    *(_WORD *)(v56 + 26) = 1024;
    LODWORD(v71) = v66 & 1;
    sub_115F0();
    _os_log_impl(&dword_0, v53, v54, "Age of the entity %ld UUID %s is %hu (baby or child with includeChild %{BOOL}d), so it is considered invalid", (uint8_t *)v56, 0x20u);
    uint64_t v50 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v60((char *)v67, v31);
    sub_11118(v70, &qword_18B30);
  }
  else
  {

    uint64_t v61 = *(void (**)(char *, uint64_t))(v32 + 8);
    v61(v52, v31);
    v61(v30, v31);
    sub_11118(v28, &qword_18B30);
    return 1;
  }
  return v50;
}

void *sub_95C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_C138(v5, (uint64_t (*)(char *, unint64_t, uint64_t))sub_DA60);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_C138(v6, (uint64_t (*)(char *, unint64_t, uint64_t))sub_D920);
  swift_release();
  swift_retain();
  uint64_t v8 = sub_11430();
  os_log_type_t v9 = sub_115C0();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v2 = 12;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    v35[0] = *(void *)(v7 + 16);
    sub_115F0();
    swift_release();
    _os_log_impl(&dword_0, v8, v9, "Device owner: [Top-selfies] After filtering at min 5 selfies and on predicate, found %ld entities with selfies.", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  if (!*(void *)(v7 + 16))
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v11 = swift_bridgeObjectRetain();
  unint64_t v12 = (unint64_t)sub_BB10(v11);
  swift_release();
  v35[0] = v12;
  sub_C428(v35, sub_C49C);
  swift_release();
  uint64_t v13 = (void *)v35[0];
  sub_3DFC(&qword_18B38);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_11CD0;
  if (!v13[2]) {
    goto LABEL_45;
  }
  uint64_t v7 = v14;
  uint64_t v3 = v13 + 4;
  *(void *)(v14 + 32) = v13[4];
  uint64_t v36 = v14;
  unint64_t v2 = v13[2];
  if (v2 == 1)
  {
    swift_release();
    return (void *)v7;
  }
  if (a2 < 101)
  {
    unint64_t v12 = sub_11430();
    os_log_type_t v16 = sub_115C0();
    if (os_log_type_enabled((os_log_t)v12, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134218240;
      v35[0] = a2;
      sub_115F0();
      *(_WORD *)(v17 + 12) = 2048;
      v35[0] = 100;
      sub_115F0();
      _os_log_impl(&dword_0, (os_log_t)v12, v16, "Device owner: [Top-selfies] Number of selfies %ld is smaller than threshold %ld. Keeping at least two candidates.", (uint8_t *)v17, 0x16u);
      swift_slowDealloc();
    }

    if (v13[2] >= 2uLL)
    {
      unint64_t v12 = v13[6];
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  if (v2 <= 1)
  {
LABEL_34:
    swift_release();
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_11430();
    os_log_type_t v32 = sub_115C0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 134218240;
      v35[0] = *(void *)(v7 + 16);
      sub_115F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2048;
      v35[0] = 0x3FC3333340000000;
      sub_115F0();
      _os_log_impl(&dword_0, v31, v32, "Device owner: [Top-selfies] Found %ld candidates before the gap becomes higher than %f.", (uint8_t *)v33, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    swift_beginAccess();
    return (void *)v36;
  }
  unint64_t v12 = 1;
  unint64_t v15 = v13[2];
  while (1)
  {
    if (v12 > v15) {
      goto LABEL_47;
    }
    if (v12 >= v15) {
      break;
    }
    uint64_t v20 = &v3[2 * v12];
    uint64_t v21 = *(v20 - 1);
    uint64_t v22 = v20[1];
    BOOL v23 = __OFSUB__(v21, v22);
    uint64_t v24 = v21 - v22;
    if (v23) {
      goto LABEL_50;
    }
    if ((float)((float)v24 / (float)v21) >= 0.15) {
      goto LABEL_34;
    }
    uint64_t v25 = &v13[2 * v12 + 7];
    while (v12 < v15)
    {
      uint64_t v3 = (void *)*(v25 - 3);
      unint64_t v27 = *(void *)(v7 + 16);
      unint64_t v26 = *(void *)(v7 + 24);
      if (v27 >= v26 >> 1) {
        uint64_t v7 = (uint64_t)sub_B7C4((char *)(v26 > 1), v27 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v27 + 1;
      *(void *)(v7 + 8 * v27 + 32) = v3;
      if (v12 + 1 >= v2) {
        goto LABEL_35;
      }
      unint64_t v15 = v13[2];
      unint64_t v28 = v12;
      if (v12 >= v15) {
        goto LABEL_42;
      }
      ++v12;
      if (v28 + 1 >= v15) {
        goto LABEL_43;
      }
      uint64_t v29 = *(v25 - 2);
      uint64_t v30 = v29 - *v25;
      if (__OFSUB__(v29, *v25)) {
        goto LABEL_44;
      }
      v25 += 2;
      if ((float)((float)v30 / (float)v29) >= 0.15)
      {
LABEL_35:
        swift_release();
        uint64_t v36 = v7;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_42:
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
    uint64_t v7 = (uint64_t)sub_B7C4(0, *(void *)(v7 + 16) + 1, 1, (char *)v7);
LABEL_16:
    unint64_t v19 = *(void *)(v7 + 16);
    unint64_t v18 = *(void *)(v7 + 24);
    if (v19 >= v18 >> 1) {
      uint64_t v7 = (uint64_t)sub_B7C4((char *)(v18 > 1), v19 + 1, 1, (char *)v7);
    }
    *(void *)(v7 + 16) = v19 + 1;
    *(void *)(v7 + 8 * v19 + 32) = v12;
    uint64_t v36 = v7;
    if (v2 < 3) {
      goto LABEL_34;
    }
    unint64_t v15 = v13[2];
    unint64_t v12 = 2;
  }
  __break(1u);
LABEL_50:
  __break(1u);
  uint64_t result = (void *)swift_release();
  __break(1u);
  return result;
}

uint64_t sub_9B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = sub_C2A4(v6, a1);
    swift_bridgeObjectRelease();
    if (v7[2]) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  if (!*(void *)(a2 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = swift_bridgeObjectRetain();
  double v9 = COERCE_DOUBLE(sub_BB10(v8));
  swift_bridgeObjectRelease();
  double v28 = v9;
  sub_C428((uint64_t *)&v28, sub_CB6C);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(uint64_t **)&v28;
  swift_retain();
  uint64_t v11 = sub_11430();
  os_log_type_t v12 = sub_115C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    double v28 = *((double *)v10 + 2);
    sub_115F0();
    swift_release();
    _os_log_impl(&dword_0, v11, v12, "Device owner: [Rear-facing] Found %ld entities with rear captures.", v13, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v14 = v10[2];
  if (v14)
  {
    if (v14 == 1)
    {
      uint64_t v15 = v10[4];
      swift_release();
      return v15;
    }
    double v20 = *((double *)v10 + 5);
    uint64_t v21 = v10[7];
    if (*(double *)&v21 == 0.0)
    {
      float v22 = 0.0;
    }
    else
    {
      if (__OFSUB__(v21, *(void *)&v20))
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      float v22 = (float)(v21 - *(void *)&v20) / (float)v21;
    }
    BOOL v23 = sub_11430();
    os_log_type_t v24 = sub_115C0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 134218496;
      double v28 = v22;
      sub_115F0();
      *(_WORD *)(v25 + 12) = 2048;
      double v28 = v20;
      sub_115F0();
      *(_WORD *)(v25 + 22) = 2048;
      double v28 = *(double *)&v21;
      sub_115F0();
      _os_log_impl(&dword_0, v23, v24, "Device owner: [Rear-facing] gap between bottom-1 and bottom-2 %f (%ld and %ld)", (uint8_t *)v25, 0x20u);
      swift_slowDealloc();
    }

    if (a3 >= 101 && v22 > 0.15)
    {
LABEL_25:
      if (v10[2])
      {
        uint64_t v15 = v10[4];
        uint64_t v26 = v10[5];
        swift_release();
        if (v26 > 10) {
          return v15;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  swift_retain();
  os_log_type_t v16 = sub_11430();
  os_log_type_t v17 = sub_115C0();
  if (!os_log_type_enabled(v16, v17))
  {
    swift_release();
LABEL_18:

    if (a3 > 100) {
      goto LABEL_25;
    }
LABEL_28:
    swift_release();
    return 0;
  }
  unint64_t v18 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)unint64_t v18 = 134217984;
  if (v10[2])
  {
    unint64_t v19 = v18;
    double v28 = *((double *)v10 + 5);
    sub_115F0();
    swift_release();
    _os_log_impl(&dword_0, v16, v17, "Device owner: [Rear-facing] only one candidate with rear-facing captures %ld", v19, 0xCu);
    swift_slowDealloc();
    goto LABEL_18;
  }
LABEL_33:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_9F78(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_9FDC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v158 = a8;
  uint64_t v148 = a4;
  uint64_t v149 = a3;
  uint64_t v160 = a9;
  int v157 = a10;
  uint64_t v151 = sub_113C0();
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151);
  v147 = (char *)v141 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_3DFC(&qword_18B28);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  v143 = (char *)v141 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  v152 = (char *)v141 - v21;
  __chkstk_darwin(v20);
  v153 = (char *)v141 - v22;
  uint64_t v23 = sub_3DFC(&qword_18B30);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  v144 = (char *)v141 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v154 = (char *)v141 - v27;
  __chkstk_darwin(v26);
  v146 = (char *)v141 - v28;
  uint64_t v161 = sub_11360();
  uint64_t v29 = *(void *)(v161 - 8);
  uint64_t v30 = __chkstk_darwin(v161);
  v145 = (char *)v141 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  v155 = (char *)v141 - v33;
  __chkstk_darwin(v32);
  v156 = (char *)v141 - v34;
  uint64_t v162 = v10;
  uint64_t v35 = v10 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  uint64_t v36 = sub_11430();
  os_log_type_t v37 = sub_115C0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_0, v36, v37, "Starting getInferredDeviceOwnerVersion1", v38, 2u);
    swift_slowDealloc();
  }

  v166 = sub_95C4(a2, a1);
  if (!v166[2])
  {
    uint64_t v48 = sub_11430();
    os_log_type_t v49 = sub_115C0();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_0, v48, v49, "Device owner: [Top-selfies] No entity with selfie, returning nil.", v50, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v160, 1, 1, v161);
    goto LABEL_13;
  }
  if (a7) {
    int v39 = 256;
  }
  else {
    int v39 = 0;
  }
  unsigned int v40 = v39 & 0xFFFFFFFE | a6 & 1;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v41 = swift_bridgeObjectRetain();
  uint64_t v42 = sub_E0BC(v41, a5, v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_11430();
  os_log_type_t v44 = sub_115C0();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v159 = v35;
  if (v45)
  {
    unint64_t v46 = (_DWORD *)swift_slowAlloc();
    uint64_t v142 = v29;
    os_log_type_t v47 = v46;
    *unint64_t v46 = 134218240;
    v141[1] = v46 + 1;
    swift_beginAccess();
    uint64_t v165 = v166[2];
    sub_115F0();
    *((_WORD *)v47 + 6) = 2048;
    uint64_t v165 = *(void *)(v42 + 16);
    sub_115F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v43, v44, "Device owner: [Top-selfies] Before filtering out invalid: %ld entities, after filtering: %ld entities", (uint8_t *)v47, 0x16u);
    uint64_t v29 = v142;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  if (*(void *)(v42 + 16))
  {
    swift_beginAccess();
    uint64_t v51 = v158;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  unint64_t v62 = sub_11430();
  os_log_type_t v63 = sub_115C0();
  if (os_log_type_enabled(v62, v63))
  {
    int v64 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v64 = 0;
    _os_log_impl(&dword_0, v62, v63, "Device owner: [Top-selfies] After removing invalid: 0 entities --> Run top k selfies again", v64, 2u);
    swift_slowDealloc();
  }

  swift_bridgeObjectRetain();
  uint64_t v65 = v162;
  swift_retain();
  uint64_t v42 = (uint64_t)sub_E6D0(a2, a1, v65, a5, v40);
  swift_bridgeObjectRelease();
  swift_release();
  if (!*(void *)(v42 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v93 = sub_11430();
    os_log_type_t v94 = sub_115C0();
    if (!os_log_type_enabled(v93, v94))
    {
LABEL_52:

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v160, 1, 1, v161);
LABEL_13:
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v95 = 0;
    uint64_t v96 = "Device owner: [Top-selfies] After replacing invalid device owners, no entity with selfies left, returning nil.";
LABEL_51:
    _os_log_impl(&dword_0, v93, v94, v96, v95, 2u);
    swift_slowDealloc();
    goto LABEL_52;
  }
  if (!*(void *)(a2 + 16))
  {
    __break(1u);
    goto LABEL_92;
  }
  unint64_t v66 = sub_B8D4(*(void *)(v42 + 32));
  uint64_t v51 = v158;
  if ((v67 & 1) == 0)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t v68 = *(void *)(a2 + 56);
  uint64_t v69 = a2;
  uint64_t v70 = *(void *)(v68 + 8 * v66);
  swift_beginAccess();
  uint64_t v71 = v166;
  if (!v166[2])
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  unint64_t v72 = sub_B8D4(v166[4]);
  if ((v73 & 1) == 0)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  float v74 = (float)*(uint64_t *)(v68 + 8 * v72) * 0.5;
  if ((~LODWORD(v74) & 0x7F800000) == 0)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v74 <= -9.2234e18)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  if (v74 >= 9.2234e18)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  uint64_t v75 = (uint64_t)v74;
  swift_bridgeObjectRetain_n();
  if (v70 > v75)
  {
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_11430();
    os_log_type_t v77 = sub_115C0();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = swift_slowAlloc();
      *(_DWORD *)uint64_t v78 = 134218496;
      uint64_t v163 = 0x3FE0000000000000;
      sub_115F0();
      *(_WORD *)(v78 + 12) = 2048;
      uint64_t v71 = v166;
      if (!v166[2])
      {
LABEL_102:
        __break(1u);
        goto LABEL_103;
      }
      if (!*(void *)(v69 + 16))
      {
LABEL_103:
        __break(1u);
        goto LABEL_104;
      }
      unint64_t v79 = sub_B8D4(v166[4]);
      if ((v80 & 1) == 0)
      {
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
      uint64_t v163 = *(void *)(*(void *)(v69 + 56) + 8 * v79);
      sub_115F0();
      *(_WORD *)(v78 + 22) = 2048;
      if (!*(void *)(v69 + 16))
      {
LABEL_105:
        __break(1u);
        goto LABEL_106;
      }
      unint64_t v81 = sub_B8D4(*(void *)(v42 + 32));
      if ((v82 & 1) == 0)
      {
LABEL_106:
        __break(1u);
        goto LABEL_107;
      }
      uint64_t v83 = *(void *)(*(void *)(v69 + 56) + 8 * v81);
      swift_bridgeObjectRelease();
      uint64_t v163 = v83;
      sub_115F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v76, v77, "Device owner: [Top-selfies] After replacing invalid device owners, keeping the new top selfies persons with %f of %ld (%ld selfies)", (uint8_t *)v78, 0x20u);
      swift_slowDealloc();
      uint64_t v51 = v158;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }

    if (*(void *)(v69 + 16))
    {
      sub_B8D4(*(void *)(v42 + 32));
      if (v136)
      {
        if (v71[2])
        {
          sub_B8D4(v71[4]);
          if (v137)
          {
LABEL_17:
            v166 = (void *)v42;
            swift_bridgeObjectRelease();
            NSString v52 = sub_11430();
            os_log_type_t v53 = sub_115C0();
            if (os_log_type_enabled(v52, v53))
            {
              uint64_t v54 = swift_slowAlloc();
              *(_DWORD *)uint64_t v54 = 134218496;
              swift_beginAccess();
              uint64_t v42 = (uint64_t)v166;
              uint64_t v164 = v166[2];
              sub_115F0();
              *(_WORD *)(v54 + 12) = 2048;
              uint64_t v164 = 0x3FC3333340000000;
              sub_115F0();
              *(_WORD *)(v54 + 22) = 2048;
              uint64_t v164 = 100;
              sub_115F0();
              _os_log_impl(&dword_0, v52, v53, "Device owner: [Top-selfies] After replacing invalid, found %ld candidates before the gap > %f or because less than %ld selfies.", (uint8_t *)v54, 0x20u);
              swift_slowDealloc();
            }

            if ((v157 & 1) == 0)
            {
              if (sub_9F78(v51, v42))
              {
                swift_retain();
                uint64_t v55 = v147;
                sub_113E0();
                sub_113B0();
                (*(void (**)(char *, uint64_t))(v150 + 8))(v55, v151);
                uint64_t v56 = sub_11390();
                swift_release();
                uint64_t v57 = *(void *)(v56 + 16);
                uint64_t v58 = sub_11420();
                uint64_t v59 = *(void *)(v58 - 8);
                if (v57)
                {
                  uint64_t v60 = (uint64_t)v153;
                  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v58 - 8) + 16))(v153, v56+ ((*(unsigned __int8 *)(*(void *)(v58 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v58 - 8) + 80)), v58);
                  uint64_t v61 = 0;
                }
                else
                {
                  uint64_t v61 = 1;
                  uint64_t v60 = (uint64_t)v153;
                }
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v60, v61, 1, v58);
                swift_bridgeObjectRelease();
                BOOL v116 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v60, 1, v58) == 1;
                uint64_t v117 = v60;
                if (v116)
                {
                  sub_11118(v60, &qword_18B28);
                  uint64_t v118 = sub_112B0();
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v118 - 8) + 56))(v146, 1, 1, v118);
                }
                else
                {
                  v119 = v146;
                  uint64_t v120 = v117;
                  sub_113F0();
                  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v120, v58);
                  uint64_t v121 = sub_112B0();
                  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v119, 0, 1, v121);
                }
                v122 = v156;
                sub_11370();
                uint64_t v123 = sub_11430();
                os_log_type_t v124 = sub_115C0();
                if (os_log_type_enabled(v123, v124))
                {
                  unsigned int v125 = (uint8_t *)swift_slowAlloc();
                  *(_DWORD *)unsigned int v125 = 134217984;
                  uint64_t v164 = v51;
                  sub_115F0();
                  _os_log_impl(&dword_0, v123, v124, "Device owner: Contact picture matched a top-selfies person, returning %ld.", v125, 0xCu);
                  v122 = v156;
                  swift_slowDealloc();
                }

                uint64_t v126 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
                uint64_t v127 = v160;
                uint64_t v128 = v160;
                v129 = v122;
                goto LABEL_90;
              }
              uint64_t v93 = sub_11430();
              os_log_type_t v94 = sub_115C0();
              if (!os_log_type_enabled(v93, v94)) {
                goto LABEL_52;
              }
              uint64_t v95 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v95 = 0;
              uint64_t v96 = "Device owner: Contact picture did not match a top-selfies person, returning nil.";
              goto LABEL_51;
            }
            if (*(void *)(v42 + 16) == 1)
            {
              uint64_t v84 = *(void *)(v42 + 32);
              swift_retain();
              uint64_t v85 = sub_11380();
              swift_release();
              uint64_t v86 = *(void *)(v85 + 16);
              uint64_t v87 = sub_11420();
              uint64_t v88 = *(void *)(v87 - 8);
              if (v86)
              {
                uint64_t v89 = (uint64_t)v152;
                (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v87 - 8) + 16))(v152, v85+ ((*(unsigned __int8 *)(*(void *)(v87 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v87 - 8) + 80)), v87);
                uint64_t v90 = 0;
                uint64_t v91 = v155;
                uint64_t v92 = v154;
              }
              else
              {
                uint64_t v90 = 1;
                uint64_t v91 = v155;
                uint64_t v92 = v154;
                uint64_t v89 = (uint64_t)v152;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(v89, v90, 1, v87);
              swift_bridgeObjectRelease();
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v89, 1, v87) == 1)
              {
                sub_11118(v89, &qword_18B28);
                uint64_t v130 = sub_112B0();
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v130 - 8) + 56))(v92, 1, 1, v130);
              }
              else
              {
                sub_113F0();
                (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v89, v87);
                uint64_t v131 = sub_112B0();
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56))(v92, 0, 1, v131);
              }
              sub_11370();
              v132 = sub_11430();
              os_log_type_t v133 = sub_115C0();
              if (!os_log_type_enabled(v132, v133)) {
                goto LABEL_89;
              }
              uint64_t v134 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v134 = 134217984;
              uint64_t v164 = v84;
              sub_115F0();
              v135 = "Device owner: only 1 top-selfie, returning %ld.";
            }
            else
            {
              uint64_t v97 = swift_bridgeObjectRetain();
              uint64_t v98 = sub_9B7C(v97, v148, v149);
              char v100 = v99;
              swift_bridgeObjectRelease();
              if (v100)
              {
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v160, 1, 1, v161);
                goto LABEL_13;
              }
              swift_retain();
              uint64_t v101 = sub_11380();
              swift_release();
              uint64_t v102 = *(void *)(v101 + 16);
              uint64_t v103 = sub_11420();
              uint64_t v104 = *(void *)(v103 - 8);
              if (v102)
              {
                uint64_t v105 = (uint64_t)v143;
                (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v103 - 8) + 16))(v143, v101+ ((*(unsigned __int8 *)(*(void *)(v103 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v103 - 8) + 80)), v103);
                uint64_t v106 = 0;
                uint64_t v91 = v145;
                v107 = v144;
              }
              else
              {
                uint64_t v106 = 1;
                uint64_t v91 = v145;
                v107 = v144;
                uint64_t v105 = (uint64_t)v143;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v105, v106, 1, v103);
              swift_bridgeObjectRelease();
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v104 + 48))(v105, 1, v103) == 1)
              {
                sub_11118(v105, &qword_18B28);
                uint64_t v138 = sub_112B0();
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v138 - 8) + 56))(v107, 1, 1, v138);
              }
              else
              {
                sub_113F0();
                (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v105, v103);
                uint64_t v139 = sub_112B0();
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v139 - 8) + 56))(v107, 0, 1, v139);
              }
              sub_11370();
              v132 = sub_11430();
              os_log_type_t v133 = sub_115C0();
              if (!os_log_type_enabled(v132, v133))
              {
LABEL_89:

                uint64_t v126 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
                uint64_t v127 = v160;
                uint64_t v128 = v160;
                v129 = v91;
LABEL_90:
                uint64_t v140 = v161;
                v126(v128, v129, v161);
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v127, 0, 1, v140);
                goto LABEL_13;
              }
              uint64_t v134 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v134 = 134217984;
              uint64_t v164 = v98;
              sub_115F0();
              v135 = "Device owner: returning %ld.";
            }
            _os_log_impl(&dword_0, v132, v133, v135, v134, 0xCu);
            swift_slowDealloc();
            goto LABEL_89;
          }
          goto LABEL_101;
        }
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
        goto LABEL_102;
      }
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v108 = sub_11430();
  os_log_type_t v109 = sub_115C0();
  if (!os_log_type_enabled(v108, v109))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_81;
  }
  uint64_t v110 = swift_slowAlloc();
  *(_DWORD *)uint64_t v110 = 134218496;
  uint64_t v163 = 0x3FE0000000000000;
  sub_115F0();
  *(_WORD *)(v110 + 12) = 2048;
  if (!v166[2])
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  if (!*(void *)(v69 + 16))
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  unint64_t v111 = sub_B8D4(v166[4]);
  if ((v112 & 1) == 0)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  uint64_t v163 = *(void *)(*(void *)(v69 + 56) + 8 * v111);
  sub_115F0();
  *(_WORD *)(v110 + 22) = 2048;
  if (!*(void *)(v69 + 16))
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  unint64_t v113 = sub_B8D4(*(void *)(v42 + 32));
  if (v114)
  {
    uint64_t v115 = *(void *)(*(void *)(v69 + 56) + 8 * v113);
    swift_bridgeObjectRelease();
    uint64_t v163 = v115;
    sub_115F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v108, v109, "Device owner: [Top-selfies] After replacing invalid device owners, the top selfie person <= %f of %ld (%ld)", (uint8_t *)v110, 0x20u);
    swift_slowDealloc();
LABEL_81:

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v160, 1, 1, v161);
    goto LABEL_13;
  }
LABEL_111:
  __break(1u);
}

uint64_t sub_B59C()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  uint64_t v2 = sub_11450();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_B654()
{
  return type metadata accessor for VUDeviceOwnerPlugin();
}

uint64_t type metadata accessor for VUDeviceOwnerPlugin()
{
  uint64_t result = qword_18990;
  if (!qword_18990) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_B6A8()
{
  uint64_t result = sub_11450();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_B750@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for VUDeviceOwnerPlugin();
  uint64_t v4 = swift_allocObject();
  uint64_t result = sub_3E44(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_B7A0()
{
  return sub_EE54();
}

char *sub_B7C4(char *result, int64_t a2, char a3, char *a4)
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
      sub_3DFC(&qword_18B38);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_DFD0(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_B8D4(uint64_t a1)
{
  uint64_t v2 = sub_116F0();

  return sub_B990(a1, v2);
}

unint64_t sub_B918(uint64_t a1, uint64_t a2)
{
  sub_11700();
  sub_114B0();
  Swift::Int v4 = sub_11710();

  return sub_BA2C(a1, a2, v4);
}

unint64_t sub_B990(uint64_t a1, uint64_t a2)
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

unint64_t sub_BA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_116D0() & 1) == 0)
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
      while (!v14 && (sub_116D0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_BB10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_3DFC(&qword_18B40);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  unint64_t v6 = sub_DE20(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10B8C();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_BBF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_BC38(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_BC18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_BFD8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_BC38(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3DFC(&qword_18B70);
  uint64_t v10 = *(void *)(sub_11420() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_11420() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

uint64_t sub_BE78(char a1, int64_t a2, char a3, char *a4)
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
    sub_3DFC(&qword_18B40);
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
  size_t v14 = a4 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

uint64_t sub_BFD8(char a1, int64_t a2, char a3, char *a4)
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
    sub_3DFC(&qword_18B38);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

uint64_t sub_C138(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v4 = v2;
  uint64_t v5 = isStackAllocationSafe;
  char v6 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = a2((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, v5);
    if (v2) {
      swift_willThrow();
    }
    else {
      return v9;
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v4 = a2((char *)v10, v7, v5);
    swift_slowDealloc();
  }
  return v4;
}

unint64_t *sub_C2A4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v4 = (unint64_t *)isStackAllocationSafe;
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    size_t v8 = sub_ECB4((unint64_t *)((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, (uint64_t)v4, a2);
    if (v2) {
      swift_willThrow();
    }
    else {
      uint64_t v4 = v8;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v4 = sub_ECB4((unint64_t *)v9, v6, (uint64_t)v4, a2);
    swift_slowDealloc();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_C428(uint64_t *a1, uint64_t (*a2)(void *))
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_DFBC(v4);
  }
  uint64_t v5 = *(void *)(v4 + 16);
  v7[0] = v4 + 32;
  v7[1] = v5;
  uint64_t result = a2(v7);
  *a1 = v4;
  return result;
}

Swift::Int sub_C49C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_116B0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v86 = *(void *)(v84 + 16 * i + 8);
        uint64_t v87 = v83;
        do
        {
          uint64_t v88 = v84 + v87;
          if (*(void *)(v84 + v87 + 8) >= v86) {
            break;
          }
          if (!v84) {
            goto LABEL_140;
          }
          uint64_t v89 = *(void *)(v88 + 16);
          *(_OWORD *)(v88 + 16) = *(_OWORD *)v88;
          *(void *)uint64_t v88 = v89;
          *(void *)(v88 + 8) = v86;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
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
  char v99 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      uint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      uint64_t v90 = v12;
      uint64_t v101 = v9;
      if (v13 >= 2)
      {
        uint64_t v91 = *v99;
        do
        {
          unint64_t v92 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v91) {
            goto LABEL_144;
          }
          uint64_t v93 = v90;
          uint64_t v94 = *(void *)&v90[16 * v92 + 32];
          uint64_t v95 = *(void *)&v90[16 * v13 + 24];
          sub_D23C((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)&v90[16 * v13 + 16]), v91 + 16 * v95, __dst);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v93 = sub_D90C((uint64_t)v93);
          }
          if (v92 >= *((void *)v93 + 2)) {
            goto LABEL_133;
          }
          uint64_t v96 = &v93[16 * v92 + 32];
          *(void *)uint64_t v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v93 + 2);
          if (v13 > v97) {
            goto LABEL_134;
          }
          memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v97 - v13));
          uint64_t v90 = v93;
          *((void *)v93 + 2) = v97 - 1;
          unint64_t v13 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v101[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v101 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_3DFC(&qword_18B48);
    uint64_t v8 = sub_11540();
    *(void *)(v8 + 16) = v7;
    uint64_t v101 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v100 = *a1 + 40;
  uint64_t v98 = *a1 - 16;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v102 = v6;
  Swift::Int v103 = v3;
  uint64_t v104 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10 + 8);
      uint64_t v16 = *(void *)(v11 + 16 * v14 + 8);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v17 = (uint64_t *)(v100 + 16 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 2;
          uint64_t v19 = v20;
          if (v16 < v15 == v18 >= v20) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = (long long *)(v98 + 16 * v10);
          Swift::Int v22 = v10;
          Swift::Int v23 = v14;
          uint64_t v24 = (long long *)(v11 + 16 * v14);
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_143;
              }
              long long v25 = *v24;
              *uint64_t v24 = *v21;
              *uint64_t v21 = v25;
            }
            ++v23;
            --v21;
            ++v24;
          }
          while (v23 < v22);
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
    Swift::Int v26 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v26 >= v3) {
      Swift::Int v26 = v3;
    }
    if (v26 < v14) {
      break;
    }
    if (v10 != v26)
    {
      uint64_t v27 = (void *)(v11 + 16 * v10);
      do
      {
        uint64_t v28 = *(void *)(v11 + 16 * v10 + 8);
        Swift::Int v29 = v14;
        uint64_t v30 = v27;
        do
        {
          if (*(v30 - 1) >= v28) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v31 = *v30;
          *(_OWORD *)uint64_t v30 = *((_OWORD *)v30 - 1);
          *(v30 - 1) = v28;
          *(v30 - 2) = v31;
          v30 -= 2;
          ++v29;
        }
        while (v10 != v29);
        ++v10;
        v27 += 2;
      }
      while (v10 != v26);
      Swift::Int v10 = v26;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_D754(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v33 = *((void *)v12 + 2);
    unint64_t v32 = *((void *)v12 + 3);
    unint64_t v13 = v33 + 1;
    uint64_t v11 = v104;
    if (v33 >= v32 >> 1)
    {
      char v82 = sub_D754((char *)(v32 > 1), v33 + 1, 1, v12);
      uint64_t v11 = v104;
      uint64_t v12 = v82;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v34 = v12 + 32;
    uint64_t v35 = &v12[16 * v33 + 32];
    *(void *)uint64_t v35 = v14;
    *((void *)v35 + 1) = v10;
    if (v33)
    {
      while (1)
      {
        unint64_t v36 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v41 = &v34[16 * v13];
          uint64_t v42 = *((void *)v41 - 8);
          uint64_t v43 = *((void *)v41 - 7);
          BOOL v47 = __OFSUB__(v43, v42);
          uint64_t v44 = v43 - v42;
          if (v47) {
            goto LABEL_119;
          }
          uint64_t v46 = *((void *)v41 - 6);
          uint64_t v45 = *((void *)v41 - 5);
          BOOL v47 = __OFSUB__(v45, v46);
          uint64_t v39 = v45 - v46;
          char v40 = v47;
          if (v47) {
            goto LABEL_120;
          }
          unint64_t v48 = v13 - 2;
          os_log_type_t v49 = &v34[16 * v13 - 32];
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *((void *)v49 + 1);
          BOOL v47 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          if (v47) {
            goto LABEL_122;
          }
          BOOL v47 = __OFADD__(v39, v52);
          uint64_t v53 = v39 + v52;
          if (v47) {
            goto LABEL_125;
          }
          if (v53 >= v44)
          {
            uint64_t v71 = &v34[16 * v36];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v47 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v47) {
              goto LABEL_129;
            }
            BOOL v64 = v39 < v74;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v65 = *((void *)v12 + 4);
            uint64_t v66 = *((void *)v12 + 5);
            BOOL v47 = __OFSUB__(v66, v65);
            uint64_t v58 = v66 - v65;
            char v59 = v47;
            goto LABEL_77;
          }
          uint64_t v38 = *((void *)v12 + 4);
          uint64_t v37 = *((void *)v12 + 5);
          BOOL v47 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          char v40 = v47;
        }
        if (v40) {
          goto LABEL_121;
        }
        unint64_t v48 = v13 - 2;
        uint64_t v54 = &v34[16 * v13 - 32];
        uint64_t v56 = *(void *)v54;
        uint64_t v55 = *((void *)v54 + 1);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v58 = v55 - v56;
        char v59 = v57;
        if (v57) {
          goto LABEL_124;
        }
        uint64_t v60 = &v34[16 * v36];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v47 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v47) {
          goto LABEL_127;
        }
        if (__OFADD__(v58, v63)) {
          goto LABEL_128;
        }
        if (v58 + v63 >= v39)
        {
          BOOL v64 = v39 < v63;
LABEL_83:
          if (v64) {
            unint64_t v36 = v48;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v59) {
          goto LABEL_123;
        }
        char v67 = &v34[16 * v36];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v47 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v47) {
          goto LABEL_126;
        }
        if (v70 < v58) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v75 = v36 - 1;
        if (v36 - 1 >= v13)
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
        uint64_t v76 = v12;
        os_log_type_t v77 = &v34[16 * v75];
        uint64_t v78 = *(void *)v77;
        unint64_t v79 = &v34[16 * v36];
        uint64_t v80 = *((void *)v79 + 1);
        sub_D23C((char *)(v11 + 16 * *(void *)v77), (char *)(v11 + 16 * *(void *)v79), v11 + 16 * v80, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v80 < v78) {
          goto LABEL_116;
        }
        if (v36 > *((void *)v76 + 2)) {
          goto LABEL_117;
        }
        *(void *)os_log_type_t v77 = v78;
        *(void *)&v34[16 * v75 + 8] = v80;
        unint64_t v81 = *((void *)v76 + 2);
        if (v36 >= v81) {
          goto LABEL_118;
        }
        uint64_t v12 = v76;
        unint64_t v13 = v81 - 1;
        memmove(&v34[16 * v36], v79 + 16, 16 * (v81 - 1 - v36));
        *((void *)v76 + 2) = v81 - 1;
        uint64_t v11 = v104;
        if (v81 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v102;
    Swift::Int v3 = v103;
    if (v10 >= v103)
    {
      uint64_t v9 = v101;
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
  Swift::Int result = sub_11670();
  __break(1u);
  return result;
}

Swift::Int sub_CB6C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_116B0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v86 = *(void *)(v84 + 16 * i + 8);
        uint64_t v87 = v83;
        do
        {
          uint64_t v88 = v84 + v87;
          if (v86 >= *(void *)(v84 + v87 + 8)) {
            break;
          }
          if (!v84) {
            goto LABEL_140;
          }
          uint64_t v89 = *(void *)(v88 + 16);
          *(_OWORD *)(v88 + 16) = *(_OWORD *)v88;
          *(void *)uint64_t v88 = v89;
          *(void *)(v88 + 8) = v86;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
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
  char v99 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      uint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      uint64_t v90 = v12;
      uint64_t v101 = v9;
      if (v13 >= 2)
      {
        uint64_t v91 = *v99;
        do
        {
          unint64_t v92 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v91) {
            goto LABEL_144;
          }
          uint64_t v93 = v90;
          uint64_t v94 = *(void *)&v90[16 * v92 + 32];
          uint64_t v95 = *(void *)&v90[16 * v13 + 24];
          sub_D4C8((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)&v90[16 * v13 + 16]), v91 + 16 * v95, __dst);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v93 = sub_D90C((uint64_t)v93);
          }
          if (v92 >= *((void *)v93 + 2)) {
            goto LABEL_133;
          }
          uint64_t v96 = &v93[16 * v92 + 32];
          *(void *)uint64_t v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v93 + 2);
          if (v13 > v97) {
            goto LABEL_134;
          }
          memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v97 - v13));
          uint64_t v90 = v93;
          *((void *)v93 + 2) = v97 - 1;
          unint64_t v13 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v101[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v101 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_3DFC(&qword_18B48);
    uint64_t v8 = sub_11540();
    *(void *)(v8 + 16) = v7;
    uint64_t v101 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v100 = *a1 + 40;
  uint64_t v98 = *a1 - 16;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v102 = v6;
  Swift::Int v103 = v3;
  uint64_t v104 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10 + 8);
      uint64_t v16 = *(void *)(v11 + 16 * v14 + 8);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v17 = (uint64_t *)(v100 + 16 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 2;
          uint64_t v19 = v20;
          if (v15 < v16 == v20 >= v18) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = (long long *)(v98 + 16 * v10);
          Swift::Int v22 = v10;
          Swift::Int v23 = v14;
          uint64_t v24 = (long long *)(v11 + 16 * v14);
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_143;
              }
              long long v25 = *v24;
              *uint64_t v24 = *v21;
              *uint64_t v21 = v25;
            }
            ++v23;
            --v21;
            ++v24;
          }
          while (v23 < v22);
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
    Swift::Int v26 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v26 >= v3) {
      Swift::Int v26 = v3;
    }
    if (v26 < v14) {
      break;
    }
    if (v10 != v26)
    {
      uint64_t v27 = (void *)(v11 + 16 * v10);
      do
      {
        uint64_t v28 = *(void *)(v11 + 16 * v10 + 8);
        Swift::Int v29 = v14;
        uint64_t v30 = v27;
        do
        {
          if (v28 >= *(v30 - 1)) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v31 = *v30;
          *(_OWORD *)uint64_t v30 = *((_OWORD *)v30 - 1);
          *(v30 - 1) = v28;
          *(v30 - 2) = v31;
          v30 -= 2;
          ++v29;
        }
        while (v10 != v29);
        ++v10;
        v27 += 2;
      }
      while (v10 != v26);
      Swift::Int v10 = v26;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_D754(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v33 = *((void *)v12 + 2);
    unint64_t v32 = *((void *)v12 + 3);
    unint64_t v13 = v33 + 1;
    uint64_t v11 = v104;
    if (v33 >= v32 >> 1)
    {
      char v82 = sub_D754((char *)(v32 > 1), v33 + 1, 1, v12);
      uint64_t v11 = v104;
      uint64_t v12 = v82;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v34 = v12 + 32;
    uint64_t v35 = &v12[16 * v33 + 32];
    *(void *)uint64_t v35 = v14;
    *((void *)v35 + 1) = v10;
    if (v33)
    {
      while (1)
      {
        unint64_t v36 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v41 = &v34[16 * v13];
          uint64_t v42 = *((void *)v41 - 8);
          uint64_t v43 = *((void *)v41 - 7);
          BOOL v47 = __OFSUB__(v43, v42);
          uint64_t v44 = v43 - v42;
          if (v47) {
            goto LABEL_119;
          }
          uint64_t v46 = *((void *)v41 - 6);
          uint64_t v45 = *((void *)v41 - 5);
          BOOL v47 = __OFSUB__(v45, v46);
          uint64_t v39 = v45 - v46;
          char v40 = v47;
          if (v47) {
            goto LABEL_120;
          }
          unint64_t v48 = v13 - 2;
          os_log_type_t v49 = &v34[16 * v13 - 32];
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *((void *)v49 + 1);
          BOOL v47 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          if (v47) {
            goto LABEL_122;
          }
          BOOL v47 = __OFADD__(v39, v52);
          uint64_t v53 = v39 + v52;
          if (v47) {
            goto LABEL_125;
          }
          if (v53 >= v44)
          {
            uint64_t v71 = &v34[16 * v36];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v47 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v47) {
              goto LABEL_129;
            }
            BOOL v64 = v39 < v74;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v65 = *((void *)v12 + 4);
            uint64_t v66 = *((void *)v12 + 5);
            BOOL v47 = __OFSUB__(v66, v65);
            uint64_t v58 = v66 - v65;
            char v59 = v47;
            goto LABEL_77;
          }
          uint64_t v38 = *((void *)v12 + 4);
          uint64_t v37 = *((void *)v12 + 5);
          BOOL v47 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          char v40 = v47;
        }
        if (v40) {
          goto LABEL_121;
        }
        unint64_t v48 = v13 - 2;
        uint64_t v54 = &v34[16 * v13 - 32];
        uint64_t v56 = *(void *)v54;
        uint64_t v55 = *((void *)v54 + 1);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v58 = v55 - v56;
        char v59 = v57;
        if (v57) {
          goto LABEL_124;
        }
        uint64_t v60 = &v34[16 * v36];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v47 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v47) {
          goto LABEL_127;
        }
        if (__OFADD__(v58, v63)) {
          goto LABEL_128;
        }
        if (v58 + v63 >= v39)
        {
          BOOL v64 = v39 < v63;
LABEL_83:
          if (v64) {
            unint64_t v36 = v48;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v59) {
          goto LABEL_123;
        }
        char v67 = &v34[16 * v36];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v47 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v47) {
          goto LABEL_126;
        }
        if (v70 < v58) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v75 = v36 - 1;
        if (v36 - 1 >= v13)
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
        uint64_t v76 = v12;
        os_log_type_t v77 = &v34[16 * v75];
        uint64_t v78 = *(void *)v77;
        unint64_t v79 = &v34[16 * v36];
        uint64_t v80 = *((void *)v79 + 1);
        sub_D4C8((char *)(v11 + 16 * *(void *)v77), (char *)(v11 + 16 * *(void *)v79), v11 + 16 * v80, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v80 < v78) {
          goto LABEL_116;
        }
        if (v36 > *((void *)v76 + 2)) {
          goto LABEL_117;
        }
        *(void *)os_log_type_t v77 = v78;
        *(void *)&v34[16 * v75 + 8] = v80;
        unint64_t v81 = *((void *)v76 + 2);
        if (v36 >= v81) {
          goto LABEL_118;
        }
        uint64_t v12 = v76;
        unint64_t v13 = v81 - 1;
        memmove(&v34[16 * v36], v79 + 16, 16 * (v81 - 1 - v36));
        *((void *)v76 + 2) = v81 - 1;
        uint64_t v11 = v104;
        if (v81 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v102;
    Swift::Int v3 = v103;
    if (v10 >= v103)
    {
      uint64_t v9 = v101;
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
  Swift::Int result = sub_11670();
  __break(1u);
  return result;
}

uint64_t sub_D23C(char *__src, char *a2, unint64_t a3, char *__dst)
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
  long long v25 = __src;
  uint64_t v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v18 = &v4[16 * v13];
      Swift::Int v23 = v18;
      long long v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v19 = (char *)(a3 - 16);
        do
        {
          uint64_t v20 = v19 + 16;
          if (*((void *)v6 - 1) >= *((void *)v18 - 1))
          {
            Swift::Int v23 = v18 - 16;
            if (v20 < v18 || v19 >= v18 || v20 != v18) {
              *(_OWORD *)uint64_t v19 = *((_OWORD *)v18 - 1);
            }
            uint64_t v21 = v6;
            v18 -= 16;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v21 = v6 - 16;
            if (v20 != v6 || v19 >= v6) {
              *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
            }
            long long v25 = v6 - 16;
            if (v21 <= v7) {
              break;
            }
          }
          v19 -= 16;
          Swift::Int v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_44:
      sub_D850((void **)&v25, &v24, &v23);
      return 1;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    Swift::Int v14 = &v4[16 * v10];
    Swift::Int v23 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      uint64_t v15 = v4;
      while (1)
      {
        if (*((void *)v15 + 1) >= *((void *)v6 + 1))
        {
          uint64_t v4 = v15 + 16;
          unint64_t v17 = v15;
          uint64_t v16 = v6;
          if (v7 == v15)
          {
            v15 += 16;
            if (v7 < v4) {
              goto LABEL_22;
            }
          }
          else
          {
            v15 += 16;
          }
        }
        else
        {
          uint64_t v16 = v6 + 16;
          unint64_t v17 = v6;
          if (v7 == v6 && v7 < v16) {
            goto LABEL_22;
          }
        }
        *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 16;
        if (v15 < v14)
        {
          Swift::Int v6 = v16;
          if ((unint64_t)v16 < a3) {
            continue;
          }
        }
        uint64_t v24 = v4;
        long long v25 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

uint64_t sub_D4C8(char *__src, char *a2, unint64_t a3, char *__dst)
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
  long long v25 = __src;
  uint64_t v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v18 = &v4[16 * v13];
      Swift::Int v23 = v18;
      long long v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v19 = (char *)(a3 - 16);
        do
        {
          uint64_t v20 = v19 + 16;
          if (*((void *)v18 - 1) >= *((void *)v6 - 1))
          {
            Swift::Int v23 = v18 - 16;
            if (v20 < v18 || v19 >= v18 || v20 != v18) {
              *(_OWORD *)uint64_t v19 = *((_OWORD *)v18 - 1);
            }
            uint64_t v21 = v6;
            v18 -= 16;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v21 = v6 - 16;
            if (v20 != v6 || v19 >= v6) {
              *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
            }
            long long v25 = v6 - 16;
            if (v21 <= v7) {
              break;
            }
          }
          v19 -= 16;
          Swift::Int v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_44:
      sub_D850((void **)&v25, &v24, &v23);
      return 1;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    Swift::Int v14 = &v4[16 * v10];
    Swift::Int v23 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      uint64_t v15 = v4;
      while (1)
      {
        if (*((void *)v6 + 1) >= *((void *)v15 + 1))
        {
          uint64_t v4 = v15 + 16;
          unint64_t v17 = v15;
          uint64_t v16 = v6;
          if (v7 == v15)
          {
            v15 += 16;
            if (v7 < v4) {
              goto LABEL_22;
            }
          }
          else
          {
            v15 += 16;
          }
        }
        else
        {
          uint64_t v16 = v6 + 16;
          unint64_t v17 = v6;
          if (v7 == v6 && v7 < v16) {
            goto LABEL_22;
          }
        }
        *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 16;
        if (v15 < v14)
        {
          Swift::Int v6 = v16;
          if ((unint64_t)v16 < a3) {
            continue;
          }
        }
        uint64_t v24 = v4;
        long long v25 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  uint64_t result = sub_116A0();
  __break(1u);
  return result;
}

char *sub_D754(char *result, int64_t a2, char a3, char *a4)
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
    sub_3DFC(&qword_18B50);
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

char *sub_D850(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_116A0();
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

char *sub_D90C(uint64_t a1)
{
  return sub_D754(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t *sub_D920(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = *(void *)(a3 + 64) & v8;
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  do
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
    }
    else
    {
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_23;
      }
      if (v14 >= v10) {
        return (unint64_t *)sub_DBB0(result, a2, v4, a3);
      }
      unint64_t v15 = *(void *)(v6 + 8 * v14);
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          return (unint64_t *)sub_DBB0(result, a2, v4, a3);
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            return (unint64_t *)sub_DBB0(result, a2, v4, a3);
          }
          unint64_t v15 = *(void *)(v6 + 8 * v5);
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10) {
              return (unint64_t *)sub_DBB0(result, a2, v4, a3);
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_24;
                }
                if (v5 >= v10) {
                  return (unint64_t *)sub_DBB0(result, a2, v4, a3);
                }
                unint64_t v15 = *(void *)(v6 + 8 * v5);
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v12 = __clz(__rbit64(v15)) + (v5 << 6);
    }
    *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
  }
  while (!__OFADD__(v4++, 1));
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

unint64_t *sub_DA60(unint64_t *result, uint64_t a2, uint64_t a3)
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
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10) {
      return (unint64_t *)sub_DBB0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_DBB0(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_DBB0(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(uint64_t *)(*(void *)(a3 + 56) + 8 * v12) >= 5)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_DBB0(result, a2, v4, a3);
      }
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_DBB0(result, a2, v4, a3);
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_DBB0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_DBB0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_3DFC(&qword_18B58);
  uint64_t result = sub_11690();
  uint64_t v9 = result;
  uint64_t v31 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2) {
        return v9;
      }
      unint64_t v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          return v9;
        }
        unint64_t v16 = v31[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            return v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              return v9;
            }
            unint64_t v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  return v9;
                }
                unint64_t v16 = v31[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void *)(*(void *)(v4 + 48) + v18);
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + v18);
    uint64_t result = sub_116F0();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = 8 * v24;
    *(void *)(*(void *)(v9 + 48) + v29) = v19;
    *(void *)(*(void *)(v9 + 56) + v29) = v20;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void *sub_DE20(void *result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v13 = *(void *)(*(void *)(a4 + 56) + 8 * v12);
    *a2 = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    a2[1] = v13;
    a2 += 2;
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v14 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v14 >= v10) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v14);
  if (v15) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v14 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v14;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v8);
  if (v15)
  {
LABEL_15:
    int64_t v14 = v8;
LABEL_19:
    unint64_t v17 = __clz(__rbit64(v15));
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v12 = v17 + (v14 << 6);
    int64_t v8 = v14;
    goto LABEL_8;
  }
  int64_t v16 = v14 + 2;
  if (v14 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
LABEL_18:
    int64_t v14 = v16;
    goto LABEL_19;
  }
  int64_t v8 = v14 + 3;
  if (v14 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v14 + 2;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v8);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v14 + 4;
  if (v14 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v14 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_DFBC(uint64_t a1)
{
  return sub_BE78(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_DFD0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_116A0();
  __break(1u);
  return result;
}

uint64_t sub_E0BC(uint64_t result, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    char v4 = a3;
    unint64_t v6 = 0;
    uint64_t v7 = result + 32;
    int v8 = (a3 >> 8) & 1;
    do
    {
      if (v6 <= v3) {
        unint64_t v9 = v3;
      }
      else {
        unint64_t v9 = v6;
      }
      while (1)
      {
        if (v6 == v9) {
          goto LABEL_24;
        }
        uint64_t v10 = *(void *)(v7 + 8 * v6++);
        uint64_t v11 = *(void *)(a2 + 16);
        if (!v11) {
          goto LABEL_15;
        }
        if (*(void *)(a2 + 32) != v10) {
          break;
        }
LABEL_6:
        if (v6 == v3) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }
      if (v11 != 1)
      {
        uint64_t v12 = 5;
        while (1)
        {
          uint64_t v13 = v12 - 3;
          if (__OFADD__(v12 - 4, 1)) {
            break;
          }
          if (*(void *)(a2 + 8 * v12) == v10) {
            goto LABEL_6;
          }
          ++v12;
          if (v13 == v11) {
            goto LABEL_15;
          }
        }
        __break(1u);
LABEL_24:
        __break(1u);
        return result;
      }
LABEL_15:
      if (v4)
      {
        uint64_t result = sub_8C40(v10, v8);
        if (result) {
          goto LABEL_6;
        }
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_BC18(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      unint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        uint64_t result = sub_BC18(v14 > 1, v15 + 1, 1);
        unint64_t v16 = v15 + 1;
      }
      _swiftEmptyArrayStorage[2] = v16;
      _swiftEmptyArrayStorage[v15 + 4] = v10;
    }
    while (v6 != v3);
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_E24C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v8 = a3 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 64);
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  uint64_t v13 = 0;
  int64_t v14 = 0;
  while (2)
  {
    uint64_t v28 = v13;
    do
    {
      while (1)
      {
LABEL_6:
        if (v11)
        {
          unint64_t v15 = __clz(__rbit64(v11));
          v11 &= v11 - 1;
          unint64_t v16 = v15 | (v14 << 6);
        }
        else
        {
          if (__OFADD__(v14++, 1)) {
            goto LABEL_35;
          }
          if (v14 >= v29)
          {
LABEL_33:
            uint64_t v25 = sub_DBB0(a1, a2, v28, a3);
            swift_release();
            swift_bridgeObjectRelease();
            return v25;
          }
          unint64_t v18 = *(void *)(v8 + 8 * v14);
          if (!v18)
          {
            int64_t v19 = v14 + 1;
            if (v14 + 1 >= v29) {
              goto LABEL_33;
            }
            unint64_t v18 = *(void *)(v8 + 8 * v19);
            if (!v18)
            {
              int64_t v19 = v14 + 2;
              if (v14 + 2 >= v29) {
                goto LABEL_33;
              }
              unint64_t v18 = *(void *)(v8 + 8 * v19);
              if (!v18)
              {
                int64_t v19 = v14 + 3;
                if (v14 + 3 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v18 = *(void *)(v8 + 8 * v19);
                if (!v18)
                {
                  while (1)
                  {
                    int64_t v14 = v19 + 1;
                    if (__OFADD__(v19, 1)) {
                      break;
                    }
                    if (v14 >= v29) {
                      goto LABEL_33;
                    }
                    unint64_t v18 = *(void *)(v8 + 8 * v14);
                    ++v19;
                    if (v18) {
                      goto LABEL_18;
                    }
                  }
LABEL_36:
                  __break(1u);
                  goto LABEL_37;
                }
              }
            }
            int64_t v14 = v19;
          }
LABEL_18:
          unint64_t v11 = (v18 - 1) & v18;
          unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
        }
        uint64_t v20 = *(void *)(*(void *)(a3 + 48) + 8 * v16);
        uint64_t v21 = *(void *)(a4 + 16);
        if (!v21) {
          break;
        }
        if (*(void *)(a4 + 32) != v20)
        {
          if (v21 != 1)
          {
            uint64_t v22 = 5;
            while (1)
            {
              uint64_t v23 = v22 - 3;
              if (__OFADD__(v22 - 4, 1)) {
                break;
              }
              if (*(void *)(a4 + 8 * v22) == v20) {
                goto LABEL_6;
              }
              ++v22;
              if (v23 == v21) {
                goto LABEL_26;
              }
            }
            __break(1u);
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
          break;
        }
      }
LABEL_26:
      if ((a5 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_retain();
      char v24 = sub_8C40(v20, (a5 >> 8) & 1);
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
    }
    while ((v24 & 1) != 0);
    *(unint64_t *)((char *)a1 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    uint64_t v13 = v28 + 1;
    if (!__OFADD__(v28, 1)) {
      continue;
    }
    break;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_E4AC(uint64_t a1, uint64_t a2, __int16 a3)
{
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = swift_retain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v12 = sub_E24C((unint64_t *)((char *)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a1, a2, a3 & 0x101);
    swift_bridgeObjectRelease();
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v12 = sub_E24C((unint64_t *)v13, v9, a1, a2, a3 & 0x101);
    swift_bridgeObjectRelease();
    swift_release();
    swift_slowDealloc();
  }
  swift_release_n();
  swift_bridgeObjectRelease_n();
  return v12;
}

void *sub_E6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v9 = swift_bridgeObjectRetain();
  unint64_t v10 = sub_C138(v9, (uint64_t (*)(char *, unint64_t, uint64_t))sub_DA60);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_E4AC(v10, a4, a5 & 0x101);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_retain();
  uint64_t v12 = sub_11430();
  os_log_type_t v13 = sub_115C0();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v10 = 12;
    int64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v14 = 134217984;
    v39[0] = *(void *)(v11 + 16);
    sub_115F0();
    swift_release();
    _os_log_impl(&dword_0, v12, v13, "Device owner: [Top-selfies] After filtering at min 5 selfies and on predicate, found %ld entities with selfies.", v14, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  if (!*(void *)(v11 + 16))
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v15 = swift_bridgeObjectRetain();
  unint64_t v16 = (unint64_t)sub_BB10(v15);
  swift_release();
  v39[0] = v16;
  sub_C428(v39, sub_C49C);
  swift_release();
  unint64_t v17 = (void *)v39[0];
  sub_3DFC(&qword_18B38);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_11CD0;
  if (!v17[2]) {
    goto LABEL_45;
  }
  uint64_t v11 = v18;
  uint64_t v5 = v17 + 4;
  *(void *)(v18 + 32) = v17[4];
  uint64_t v40 = v18;
  unint64_t v10 = v17[2];
  if (v10 == 1)
  {
    swift_release();
    return (void *)v11;
  }
  if (a2 < 101)
  {
    unint64_t v16 = sub_11430();
    os_log_type_t v20 = sub_115C0();
    if (os_log_type_enabled((os_log_t)v16, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134218240;
      v39[0] = a2;
      sub_115F0();
      *(_WORD *)(v21 + 12) = 2048;
      v39[0] = 100;
      sub_115F0();
      _os_log_impl(&dword_0, (os_log_t)v16, v20, "Device owner: [Top-selfies] Number of selfies %ld is smaller than threshold %ld. Keeping at least two candidates.", (uint8_t *)v21, 0x16u);
      swift_slowDealloc();
    }

    if (v17[2] >= 2uLL)
    {
      unint64_t v16 = v17[6];
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  if (v10 <= 1)
  {
LABEL_34:
    swift_release();
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_11430();
    os_log_type_t v36 = sub_115C0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 134218240;
      v39[0] = *(void *)(v11 + 16);
      sub_115F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2048;
      v39[0] = 0x3FC3333340000000;
      sub_115F0();
      _os_log_impl(&dword_0, v35, v36, "Device owner: [Top-selfies] Found %ld candidates before the gap becomes higher than %f.", (uint8_t *)v37, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    swift_beginAccess();
    return (void *)v40;
  }
  unint64_t v16 = 1;
  unint64_t v19 = v17[2];
  while (1)
  {
    if (v16 > v19) {
      goto LABEL_47;
    }
    if (v16 >= v19) {
      break;
    }
    char v24 = &v5[2 * v16];
    uint64_t v25 = *(v24 - 1);
    uint64_t v26 = v24[1];
    BOOL v27 = __OFSUB__(v25, v26);
    uint64_t v28 = v25 - v26;
    if (v27) {
      goto LABEL_50;
    }
    if ((float)((float)v28 / (float)v25) >= 0.15) {
      goto LABEL_34;
    }
    int64_t v29 = &v17[2 * v16 + 7];
    while (v16 < v19)
    {
      uint64_t v5 = (void *)*(v29 - 3);
      unint64_t v31 = *(void *)(v11 + 16);
      unint64_t v30 = *(void *)(v11 + 24);
      if (v31 >= v30 >> 1) {
        uint64_t v11 = (uint64_t)sub_B7C4((char *)(v30 > 1), v31 + 1, 1, (char *)v11);
      }
      *(void *)(v11 + 16) = v31 + 1;
      *(void *)(v11 + 8 * v31 + 32) = v5;
      if (v16 + 1 >= v10) {
        goto LABEL_35;
      }
      unint64_t v19 = v17[2];
      unint64_t v32 = v16;
      if (v16 >= v19) {
        goto LABEL_42;
      }
      ++v16;
      if (v32 + 1 >= v19) {
        goto LABEL_43;
      }
      uint64_t v33 = *(v29 - 2);
      uint64_t v34 = v33 - *v29;
      if (__OFSUB__(v33, *v29)) {
        goto LABEL_44;
      }
      v29 += 2;
      if ((float)((float)v34 / (float)v33) >= 0.15)
      {
LABEL_35:
        swift_release();
        uint64_t v40 = v11;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_42:
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
    uint64_t v11 = (uint64_t)sub_B7C4(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
LABEL_16:
    unint64_t v23 = *(void *)(v11 + 16);
    unint64_t v22 = *(void *)(v11 + 24);
    if (v23 >= v22 >> 1) {
      uint64_t v11 = (uint64_t)sub_B7C4((char *)(v22 > 1), v23 + 1, 1, (char *)v11);
    }
    *(void *)(v11 + 16) = v23 + 1;
    *(void *)(v11 + 8 * v23 + 32) = v16;
    uint64_t v40 = v11;
    if (v10 < 3) {
      goto LABEL_34;
    }
    unint64_t v19 = v17[2];
    unint64_t v16 = 2;
  }
  __break(1u);
LABEL_50:
  __break(1u);
  uint64_t result = (void *)swift_release();
  __break(1u);
  return result;
}

unint64_t *sub_ECB4(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  do
  {
    while (1)
    {
      do
      {
LABEL_5:
        while (v10)
        {
          unint64_t v13 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
          unint64_t v14 = v13 | (v6 << 6);
          uint64_t v15 = *(void *)(a4 + 16);
          if (v15) {
            goto LABEL_22;
          }
        }
        int64_t v16 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_31;
        }
        if (v16 >= v11) {
          return (unint64_t *)sub_DBB0(result, a2, v5, a3);
        }
        unint64_t v17 = *(void *)(v7 + 8 * v16);
        ++v6;
        if (!v17)
        {
          int64_t v6 = v16 + 1;
          if (v16 + 1 >= v11) {
            return (unint64_t *)sub_DBB0(result, a2, v5, a3);
          }
          unint64_t v17 = *(void *)(v7 + 8 * v6);
          if (!v17)
          {
            int64_t v6 = v16 + 2;
            if (v16 + 2 >= v11) {
              return (unint64_t *)sub_DBB0(result, a2, v5, a3);
            }
            unint64_t v17 = *(void *)(v7 + 8 * v6);
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v11) {
                return (unint64_t *)sub_DBB0(result, a2, v5, a3);
              }
              unint64_t v17 = *(void *)(v7 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  int64_t v6 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_33;
                  }
                  if (v6 >= v11) {
                    return (unint64_t *)sub_DBB0(result, a2, v5, a3);
                  }
                  unint64_t v17 = *(void *)(v7 + 8 * v6);
                  ++v18;
                  if (v17) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v6 = v18;
            }
          }
        }
LABEL_21:
        unint64_t v10 = (v17 - 1) & v17;
        unint64_t v14 = __clz(__rbit64(v17)) + (v6 << 6);
        uint64_t v15 = *(void *)(a4 + 16);
      }
      while (!v15);
LABEL_22:
      uint64_t v19 = *(void *)(*(void *)(a3 + 48) + 8 * v14);
      if (*(void *)(a4 + 32) != v19) {
        break;
      }
LABEL_4:
      *(unint64_t *)((char *)result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v5++, 1)) {
        goto LABEL_32;
      }
    }
  }
  while (v15 == 1);
  uint64_t v20 = 5;
  while (1)
  {
    uint64_t v21 = v20 - 3;
    if (__OFADD__(v20 - 4, 1)) {
      break;
    }
    if (*(void *)(a4 + 8 * v20) == v19) {
      goto LABEL_4;
    }
    ++v20;
    if (v21 == v15) {
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_EE54()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3DFC(&qword_18AC8);
  __chkstk_darwin(v2 - 8);
  v232 = (char *)&v205 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3DFC(&qword_18AD0);
  __chkstk_darwin(v4 - 8);
  v231 = (char *)&v205 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v235 = sub_11360();
  uint64_t v6 = *(void *)(v235 - 8);
  uint64_t v7 = __chkstk_darwin(v235);
  v205 = (char *)&v205 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v211 = (char *)&v205 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v210 = (char *)&v205 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v227 = (char *)&v205 - v14;
  __chkstk_darwin(v13);
  v225 = (char *)&v205 - v15;
  uint64_t v16 = sub_3DFC(&qword_18AD8);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v208 = (uint64_t)&v205 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v207 = (uint64_t)&v205 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v206 = (uint64_t)&v205 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v209 = (uint64_t)&v205 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v216 = ((char *)&v205 - v26);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v230 = (uint64_t)&v205 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  unint64_t v31 = (char *)&v205 - v30;
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v34 = (char *)&v205 - v33;
  __chkstk_darwin(v32);
  v233 = (char *)&v205 - v35;
  v234 = (void (*)(char *, uint64_t))(v0 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger);
  os_log_type_t v36 = sub_11430();
  os_log_type_t v37 = sub_115C0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_0, v36, v37, "Updating VUDeviceOwnerPlugin", v38, 2u);
    swift_slowDealloc();
  }

  CFAbsoluteTimeGetCurrent();
  uint64_t v39 = v1;
  uint64_t v40 = (void (*)(void, void, void, void))sub_4808();
  unint64_t v42 = v41;
  uint64_t v226 = v43;
  LODWORD(v228) = v44;
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v46 = (uint64_t)v233;
  uint64_t v47 = v6;
  uint64_t v48 = v235;
  v45(v233, 1, 1, v235);
  uint64_t v229 = v47;
  uint64_t v236 = v39;
  if (v42)
  {
    v224 = v40;
    sub_68B4((uint64_t)v40, v42, (uint64_t)v34);
    sub_10D38((uint64_t)v34, v46, &qword_18AD8);
    sub_110B4(v46, (uint64_t)v31, &qword_18AD8);
    int v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v31, 1, v48);
    BOOL v212 = v49 != 1;
    if (v49 == 1)
    {
      sub_11118((uint64_t)v31, &qword_18AD8);
      uint64_t v53 = v237;
    }
    else
    {
      uint64_t v50 = v225;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v225, v31, v48);
      swift_retain();
      uint64_t v51 = sub_11340();
      v241 = (void *)sub_3DFC(&qword_18AF8);
      aBlock = (void **)v51;
      uint64_t v52 = v237;
      sub_11320();
      uint64_t v53 = v52;
      if (v52)
      {
        swift_release();
        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v48);
        uint64_t v53 = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v48);
        swift_release();
      }
      sub_3D50((uint64_t)&aBlock);
    }
    uint64_t v54 = v224;
    int v55 = (int)v228;
    v228 = sub_81BC((uint64_t)v224, v42);
    int v215 = v55 | (v226 > 29);
    if (!(v55 & 1 | (v226 > 29)))
    {
      uint64_t v56 = sub_11430();
      os_log_type_t v57 = sub_115C0();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = 134217984;
        aBlock = (void **)v226;
        sub_115F0();
        _os_log_impl(&dword_0, v56, v57, "Device owner: Not filtering out children because age of Me contact is %ld", v58, 0xCu);
        swift_slowDealloc();
      }
    }
    uint64_t v237 = v53;
    v214 = (_DWORD *)sub_7234((uint64_t)v54, v42);
    char v60 = v59;
    swift_bridgeObjectRelease();
    LODWORD(v213) = v60 & 1;
  }
  else
  {
    BOOL v212 = 0;
    LODWORD(v213) = 1;
    v214 = 0;
    v228 = (char *)_swiftEmptyArrayStorage;
    int v215 = 1;
  }
  uint64_t v61 = enum case for VUGallery.EntityClass.person(_:);
  uint64_t v62 = sub_11300();
  uint64_t v63 = *(void *)(v62 - 8);
  BOOL v64 = *(NSObject **)(v63 + 104);
  uint64_t v65 = (uint64_t)v231;
  LODWORD(v219) = v61;
  v217 = (void (*)(char *, char *, uint64_t))(v63 + 104);
  v218 = v64;
  ((void (*)(char *, uint64_t, uint64_t))v64)(v231, v61, v62);
  uint64_t v66 = *(void (**)(void, void, void, void))(v63 + 56);
  v225 = (char *)(v63 + 56);
  uint64_t v226 = v62;
  v224 = v66;
  v66(v65, 0, 1, v62);
  uint64_t v67 = enum case for VUGallery.Source.frontCamera(_:);
  uint64_t v68 = sub_113D0();
  uint64_t v69 = *(void *)(v68 - 8);
  uint64_t v70 = (char *)(v69 + 104);
  uint64_t v71 = (uint64_t)v232;
  v220 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 104);
  v220(v232, v67, v68);
  uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56);
  uint64_t v72 = v69 + 56;
  uint64_t v222 = v72;
  uint64_t v223 = v68;
  v221 = v73;
  v73(v71, 0, 1, v68);
  swift_retain();
  uint64_t v74 = sub_11310();
  swift_release();
  sub_11118(v71, &qword_18AC8);
  uint64_t result = sub_11118(v65, &qword_18AD0);
  int64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = v74 + 64;
  uint64_t v79 = 1 << *(unsigned char *)(v74 + 32);
  uint64_t v80 = -1;
  if (v79 < 64) {
    uint64_t v80 = ~(-1 << v79);
  }
  unint64_t v81 = v80 & *(void *)(v74 + 64);
  int64_t v82 = (unint64_t)(v79 + 63) >> 6;
  while (v81)
  {
    unint64_t v83 = __clz(__rbit64(v81));
    v81 &= v81 - 1;
    unint64_t v84 = v83 | (v76 << 6);
LABEL_20:
    uint64_t v85 = *(void *)(*(void *)(v74 + 56) + 8 * v84);
    BOOL v86 = __OFADD__(v77, v85);
    v77 += v85;
    if (v86)
    {
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      v172 = v70;
      uint64_t v173 = v229;
      v174 = v205;
      (*(void (**)(char *, char *, uint64_t))(v229 + 16))(v205, v172, v72);
      uint64_t v175 = sub_11350();
      uint64_t v72 = v235;
      v227 = (char *)v175;
      (*(void (**)(char *, uint64_t))(v173 + 8))(v174, v235);
      goto LABEL_129;
    }
  }
  BOOL v86 = __OFADD__(v76++, 1);
  if (v86)
  {
    __break(1u);
LABEL_159:
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
  if (v76 >= v82) {
    goto LABEL_41;
  }
  unint64_t v87 = *(void *)(v78 + 8 * v76);
  if (v87)
  {
LABEL_36:
    unint64_t v89 = __clz(__rbit64(v87));
    unint64_t v81 = (v87 - 1) & v87;
    unint64_t v84 = v89 + (v76 << 6);
    goto LABEL_20;
  }
  int64_t v88 = v76 + 1;
  if (v76 + 1 >= v82) {
    goto LABEL_41;
  }
  unint64_t v87 = *(void *)(v78 + 8 * v88);
  if (v87) {
    goto LABEL_35;
  }
  int64_t v88 = v76 + 2;
  if (v76 + 2 >= v82) {
    goto LABEL_41;
  }
  unint64_t v87 = *(void *)(v78 + 8 * v88);
  if (v87) {
    goto LABEL_35;
  }
  int64_t v88 = v76 + 3;
  if (v76 + 3 >= v82) {
    goto LABEL_41;
  }
  unint64_t v87 = *(void *)(v78 + 8 * v88);
  if (v87) {
    goto LABEL_35;
  }
  int64_t v88 = v76 + 4;
  if (v76 + 4 >= v82) {
    goto LABEL_41;
  }
  unint64_t v87 = *(void *)(v78 + 8 * v88);
  if (v87)
  {
LABEL_35:
    int64_t v76 = v88;
    goto LABEL_36;
  }
  int64_t v88 = v76 + 5;
  if (v76 + 5 < v82)
  {
    unint64_t v87 = *(void *)(v78 + 8 * v88);
    if (!v87)
    {
      while (1)
      {
        int64_t v76 = v88 + 1;
        if (__OFADD__(v88, 1)) {
          break;
        }
        if (v76 >= v82) {
          goto LABEL_41;
        }
        unint64_t v87 = *(void *)(v78 + 8 * v76);
        ++v88;
        if (v87) {
          goto LABEL_36;
        }
      }
LABEL_162:
      __break(1u);
      goto LABEL_163;
    }
    goto LABEL_35;
  }
LABEL_41:
  uint64_t v90 = (uint64_t)v231;
  uint64_t v91 = v226;
  ((void (*)(char *, void, uint64_t))v218)(v231, v219, v226);
  v224(v90, 0, 1, v91);
  uint64_t v92 = (uint64_t)v232;
  uint64_t v93 = v223;
  v220(v232, enum case for VUGallery.Source.backCamera(_:), v223);
  v221(v92, 0, 1, v93);
  swift_retain();
  uint64_t v72 = sub_11310();
  swift_release();
  sub_11118(v92, &qword_18AC8);
  uint64_t result = sub_11118(v90, &qword_18AD0);
  int64_t v94 = 0;
  uint64_t v95 = 0;
  uint64_t v96 = v72 + 64;
  uint64_t v97 = 1 << *(unsigned char *)(v72 + 32);
  uint64_t v98 = -1;
  if (v97 < 64) {
    uint64_t v98 = ~(-1 << v97);
  }
  unint64_t v99 = v98 & *(void *)(v72 + 64);
  int64_t v100 = (unint64_t)(v97 + 63) >> 6;
  while (1)
  {
    if (v99)
    {
      unint64_t v101 = __clz(__rbit64(v99));
      v99 &= v99 - 1;
      unint64_t v102 = v101 | (v94 << 6);
      goto LABEL_45;
    }
    BOOL v86 = __OFADD__(v94++, 1);
    if (v86) {
      goto LABEL_159;
    }
    if (v94 >= v100) {
      break;
    }
    unint64_t v104 = *(void *)(v96 + 8 * v94);
    if (!v104)
    {
      int64_t v105 = v94 + 1;
      if (v94 + 1 >= v100) {
        break;
      }
      unint64_t v104 = *(void *)(v96 + 8 * v105);
      if (!v104)
      {
        int64_t v105 = v94 + 2;
        if (v94 + 2 >= v100) {
          break;
        }
        unint64_t v104 = *(void *)(v96 + 8 * v105);
        if (!v104)
        {
          int64_t v105 = v94 + 3;
          if (v94 + 3 >= v100) {
            break;
          }
          unint64_t v104 = *(void *)(v96 + 8 * v105);
          if (!v104)
          {
            int64_t v105 = v94 + 4;
            if (v94 + 4 >= v100) {
              break;
            }
            unint64_t v104 = *(void *)(v96 + 8 * v105);
            if (!v104)
            {
              int64_t v105 = v94 + 5;
              if (v94 + 5 >= v100) {
                break;
              }
              unint64_t v104 = *(void *)(v96 + 8 * v105);
              if (!v104)
              {
                while (1)
                {
                  int64_t v94 = v105 + 1;
                  if (__OFADD__(v105, 1)) {
                    break;
                  }
                  if (v94 >= v100) {
                    goto LABEL_66;
                  }
                  unint64_t v104 = *(void *)(v96 + 8 * v94);
                  ++v105;
                  if (v104) {
                    goto LABEL_61;
                  }
                }
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
                return result;
              }
            }
          }
        }
      }
      int64_t v94 = v105;
    }
LABEL_61:
    unint64_t v106 = __clz(__rbit64(v104));
    unint64_t v99 = (v104 - 1) & v104;
    unint64_t v102 = v106 + (v94 << 6);
LABEL_45:
    uint64_t v103 = *(void *)(*(void *)(v72 + 56) + 8 * v102);
    BOOL v86 = __OFADD__(v95, v103);
    v95 += v103;
    if (v86) {
      goto LABEL_127;
    }
  }
LABEL_66:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v107 = sub_11430();
  os_log_type_t v108 = sub_115C0();
  if (os_log_type_enabled(v107, v108))
  {
    uint64_t v109 = swift_slowAlloc();
    *(_DWORD *)uint64_t v109 = 134218752;
    aBlock = (void **)v77;
    sub_115F0();
    *(_WORD *)(v109 + 12) = 2048;
    aBlock = *(void ***)(v74 + 16);
    sub_115F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v109 + 22) = 2048;
    aBlock = (void **)v95;
    sub_115F0();
    *(_WORD *)(v109 + 32) = 2048;
    aBlock = *(void ***)(v72 + 16);
    sub_115F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v107, v108, "Device owner: Total of %ld faces in selfies assets for %ld entities and %ld faces in rear-facing assets for %ld entities", (uint8_t *)v109, 0x2Au);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v110 = v237;
  uint64_t v111 = v229;

  uint64_t v112 = v230;
  sub_9FDC(v77, v74, v95, v72, (uint64_t)v228, 1, v215 & 1, (uint64_t)v214, v230, v213);
  uint64_t v113 = v112;
  uint64_t v114 = (uint64_t)v216;
  sub_110B4(v113, (uint64_t)v216, &qword_18AD8);
  uint64_t v115 = v235;
  v219 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v111 + 48);
  v220 = (void (*)(char *, uint64_t, uint64_t))(v111 + 48);
  if (v219(v114, 1, v235) == 1)
  {
    sub_11118(v114, &qword_18AD8);
    if (v212) {
      goto LABEL_75;
    }
    BOOL v116 = sub_11430();
    os_log_type_t v117 = sub_115C0();
    if (os_log_type_enabled(v116, v117))
    {
      uint64_t v118 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v118 = 0;
      _os_log_impl(&dword_0, v116, v117, "Device owner (me ground truth does not exist): result null", v118, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    unint64_t v119 = sub_429C((uint64_t)&off_14800);
    v241 = (void *)sub_3DFC(&qword_18AE0);
    aBlock = (void **)v119;
    sub_11320();
    if (v110) {
      goto LABEL_78;
    }
    swift_release();
    sub_3D50((uint64_t)&aBlock);
LABEL_75:
    uint64_t v120 = sub_11430();
    os_log_type_t v121 = sub_115C0();
    if (os_log_type_enabled(v120, v121))
    {
      v122 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v122 = 0;
      _os_log_impl(&dword_0, v120, v121, "Device owner: result ignoring me ground truth null", v122, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    unint64_t v123 = sub_429C((uint64_t)&off_14850);
    v241 = (void *)sub_3DFC(&qword_18AE0);
    aBlock = (void **)v123;
    sub_11320();
    if (v110)
    {
LABEL_78:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      sub_11118(v230, &qword_18AD8);
      sub_3D50((uint64_t)&aBlock);
LABEL_93:
      uint64_t v147 = (uint64_t)v233;
      return sub_11118(v147, &qword_18AD8);
    }
    swift_release();
    sub_3D50((uint64_t)&aBlock);
  }
  else
  {
    uint64_t v237 = v110;
    os_log_type_t v124 = v227;
    (*(void (**)(char *, uint64_t, uint64_t))(v111 + 32))(v227, v114, v115);
    unsigned int v125 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
    if (v212)
    {
      uint64_t v126 = v211;
    }
    else
    {
      uint64_t v127 = v210;
      v217 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
      v125(v210, v124, v115);
      uint64_t v128 = sub_11430();
      os_log_type_t v129 = sub_115C0();
      int v130 = v129;
      if (os_log_type_enabled(v128, v129))
      {
        uint64_t v131 = (uint8_t *)swift_slowAlloc();
        v216 = v128;
        v132 = v127;
        os_log_type_t v133 = v131;
        int v215 = v130;
        *(_DWORD *)uint64_t v131 = 134217984;
        v214 = v131 + 4;
        uint64_t v213 = sub_11350();
        uint64_t v134 = v132;
        uint64_t v128 = v216;
        v218 = *(NSObject **)(v229 + 8);
        ((void (*)(char *, uint64_t))v218)(v134, v235);
        aBlock = (void **)v213;
        sub_115F0();
        _os_log_impl(&dword_0, v128, (os_log_type_t)v215, "Device owner (me ground truth does not exist): result %ld", v133, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        v218 = *(NSObject **)(v229 + 8);
        ((void (*)(char *, uint64_t))v218)(v127, v235);
      }

      swift_retain();
      os_log_type_t v124 = v227;
      uint64_t v135 = sub_11340();
      v241 = (void *)sub_3DFC(&qword_18AF8);
      aBlock = (void **)v135;
      uint64_t v136 = v237;
      sub_11320();
      uint64_t v237 = v136;
      if (v136)
      {
        ((void (*)(char *, uint64_t))v218)(v124, v235);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        sub_11118(v230, &qword_18AD8);
        sub_3D50((uint64_t)&aBlock);
        goto LABEL_93;
      }
      swift_release();
      sub_3D50((uint64_t)&aBlock);
      uint64_t v115 = v235;
      uint64_t v126 = v211;
      unsigned int v125 = v217;
    }
    v125(v126, v124, v115);
    uint64_t v137 = v115;
    uint64_t v138 = sub_11430();
    os_log_type_t v139 = sub_115C0();
    if (os_log_type_enabled(v138, v139))
    {
      uint64_t v140 = (uint8_t *)swift_slowAlloc();
      v218 = v138;
      unint64_t v141 = v126;
      uint64_t v142 = v140;
      *(_DWORD *)uint64_t v140 = 134217984;
      v217 = (void (*)(char *, char *, uint64_t))(v140 + 4);
      v216 = sub_11350();
      v143 = v141;
      uint64_t v138 = v218;
      v234 = *(void (**)(char *, uint64_t))(v229 + 8);
      v234(v143, v235);
      aBlock = (void **)&v216->isa;
      sub_115F0();
      _os_log_impl(&dword_0, v138, v139, "Device owner: result ignoring me ground truth %ld", v142, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      v234 = *(void (**)(char *, uint64_t))(v229 + 8);
      v234(v126, v137);
    }

    swift_retain();
    v144 = v227;
    uint64_t v145 = sub_11340();
    v241 = (void *)sub_3DFC(&qword_18AF8);
    aBlock = (void **)v145;
    uint64_t v146 = v237;
    sub_11320();
    if (v146)
    {
      v234(v144, v235);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      sub_11118(v230, &qword_18AD8);
      sub_3D50((uint64_t)&aBlock);
      goto LABEL_93;
    }
    v234(v144, v235);
    swift_release();
    sub_3D50((uint64_t)&aBlock);
  }
  uint64_t v148 = (NSString *)sub_11490();
  Class v149 = NSClassFromString(v148);

  if (v149)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_156;
  }
  uint64_t v150 = (void *)&loc_11000;
  if (!os_variant_has_internal_ui())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_155;
  }
  sub_9FDC(v77, v74, v95, v72, (uint64_t)_swiftEmptyArrayStorage, 0, 0, 0, v209, 1u);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v151 = (uint64_t)v231;
  v224(v231, 1, 1, v226);
  uint64_t v152 = (uint64_t)v232;
  v221((uint64_t)v232, 1, 1, v223);
  swift_retain();
  uint64_t v153 = sub_11310();
  swift_release();
  sub_11118(v152, &qword_18AC8);
  uint64_t result = sub_11118(v151, &qword_18AD0);
  int64_t v154 = 0;
  uint64_t v155 = 0;
  uint64_t v156 = v153 + 64;
  uint64_t v157 = 1 << *(unsigned char *)(v153 + 32);
  uint64_t v158 = -1;
  if (v157 < 64) {
    uint64_t v158 = ~(-1 << v157);
  }
  unint64_t v159 = v158 & *(void *)(v153 + 64);
  int64_t v160 = (unint64_t)(v157 + 63) >> 6;
  uint64_t v161 = v233;
  while (2)
  {
    if (v159)
    {
      unint64_t v162 = __clz(__rbit64(v159));
      v159 &= v159 - 1;
      unint64_t v163 = v162 | (v154 << 6);
LABEL_102:
      uint64_t v164 = *(void *)(*(void *)(v153 + 56) + 8 * v163);
      BOOL v86 = __OFADD__(v155, v164);
      v155 += v164;
      if (v86) {
        goto LABEL_160;
      }
      continue;
    }
    break;
  }
  BOOL v86 = __OFADD__(v154++, 1);
  if (v86) {
    goto LABEL_161;
  }
  if (v154 < v160)
  {
    unint64_t v165 = *(void *)(v156 + 8 * v154);
    if (!v165)
    {
      int64_t v166 = v154 + 1;
      if (v154 + 1 >= v160) {
        goto LABEL_124;
      }
      unint64_t v165 = *(void *)(v156 + 8 * v166);
      if (!v165)
      {
        int64_t v166 = v154 + 2;
        if (v154 + 2 >= v160) {
          goto LABEL_124;
        }
        unint64_t v165 = *(void *)(v156 + 8 * v166);
        if (!v165)
        {
          int64_t v166 = v154 + 3;
          if (v154 + 3 >= v160) {
            goto LABEL_124;
          }
          unint64_t v165 = *(void *)(v156 + 8 * v166);
          if (!v165)
          {
            int64_t v166 = v154 + 4;
            if (v154 + 4 >= v160) {
              goto LABEL_124;
            }
            unint64_t v165 = *(void *)(v156 + 8 * v166);
            if (!v165)
            {
              int64_t v166 = v154 + 5;
              if (v154 + 5 >= v160) {
                goto LABEL_124;
              }
              unint64_t v165 = *(void *)(v156 + 8 * v166);
              if (!v165)
              {
                while (1)
                {
                  int64_t v154 = v166 + 1;
                  if (__OFADD__(v166, 1)) {
                    goto LABEL_164;
                  }
                  if (v154 >= v160) {
                    goto LABEL_124;
                  }
                  unint64_t v165 = *(void *)(v156 + 8 * v154);
                  ++v166;
                  if (v165) {
                    goto LABEL_118;
                  }
                }
              }
            }
          }
        }
      }
      int64_t v154 = v166;
    }
LABEL_118:
    unint64_t v167 = __clz(__rbit64(v165));
    unint64_t v159 = (v165 - 1) & v165;
    unint64_t v163 = v167 + (v154 << 6);
    goto LABEL_102;
  }
LABEL_124:
  swift_release();
  uint64_t v72 = v235;
  v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v219;
  LODWORD(v236) = v219(v230, 1, v235);
  LODWORD(v234) = v168(v209, 1, v72);
  uint64_t v169 = (uint64_t)v161;
  uint64_t v170 = v206;
  sub_110B4(v169, v206, &qword_18AD8);
  LODWORD(v231) = v168(v170, 1, v72);
  uint64_t v171 = v170;
  uint64_t v70 = v233;
  sub_11118(v171, &qword_18AD8);
  LODWORD(v232) = v168((uint64_t)v70, 1, v72);
  uint64_t v237 = 0;
  if (!v232) {
    goto LABEL_128;
  }
  v227 = 0;
LABEL_129:
  uint64_t v176 = v207;
  sub_110B4(v230, v207, &qword_18AD8);
  unsigned int v177 = v219(v176, 1, v72);
  uint64_t v178 = v72;
  if (v177 == 1)
  {
    sub_11118(v176, &qword_18AD8);
    uint64_t v179 = 0;
  }
  else
  {
    uint64_t v179 = sub_11350();
    (*(void (**)(uint64_t, uint64_t))(v229 + 8))(v176, v178);
  }
  BOOL v181 = v177 != 1 && v227 == (char *)v179;
  if (v232) {
    BOOL v181 = v177 == 1;
  }
  LODWORD(v232) = v181;
  v182 = v233;
  unsigned int v183 = v219((uint64_t)v233, 1, v178);
  if (v183)
  {
    v227 = 0;
  }
  else
  {
    uint64_t v184 = v229;
    v185 = v205;
    (*(void (**)(char *, char *, uint64_t))(v229 + 16))(v205, v182, v178);
    v227 = (char *)sub_11350();
    (*(void (**)(char *, uint64_t))(v184 + 8))(v185, v178);
  }
  uint64_t v186 = v208;
  sub_110B4(v209, v208, &qword_18AD8);
  unsigned int v187 = v219(v186, 1, v178);
  if (v187 == 1)
  {
    sub_11118(v186, &qword_18AD8);
    uint64_t v190 = 0;
  }
  else
  {
    unsigned int v188 = v183;
    uint64_t v189 = v186;
    uint64_t v190 = sub_11350();
    uint64_t v191 = v189;
    unsigned int v183 = v188;
    (*(void (**)(uint64_t, uint64_t))(v229 + 8))(v191, v235);
  }
  BOOL v193 = v187 != 1 && v227 == (char *)v190;
  if (v183) {
    BOOL v193 = v187 == 1;
  }
  LODWORD(v235) = v193;
  LODWORD(v231) = v231 != 1;
  sub_3DFC(&qword_18AF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11CE0;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000000012150;
  swift_bridgeObjectRelease();
  *(NSNumber *)(inited + 48) = sub_11580();
  strcpy((char *)(inited + 56), "selfiesCount");
  *(unsigned char *)(inited + 69) = 0;
  *(_WORD *)(inited + 70) = -5120;
  *(NSNumber *)(inited + 72) = sub_11580();
  *(void *)(inited + 80) = 0xD000000000000017;
  *(void *)(inited + 88) = 0x8000000000012170;
  *(NSNumber *)(inited + 96) = sub_11580();
  *(void *)(inited + 104) = 0x6F43736F746F6870;
  *(void *)(inited + 112) = 0xEB00000000746E75;
  *(NSNumber *)(inited + 120) = sub_11580();
  strcpy((char *)(inited + 128), "meNodeInferred");
  *(unsigned char *)(inited + 143) = -18;
  *(NSNumber *)(inited + 144) = sub_11560();
  *(void *)(inited + 152) = 0xD00000000000002ALL;
  *(void *)(inited + 160) = 0x8000000000012190;
  *(NSNumber *)(inited + 168) = sub_11560();
  *(void *)(inited + 176) = 0xD000000000000013;
  *(void *)(inited + 184) = 0x80000000000121C0;
  *(NSNumber *)(inited + 192) = sub_11560();
  strcpy((char *)(inited + 200), "meNodeAccuracy");
  *(unsigned char *)(inited + 215) = -18;
  *(NSNumber *)(inited + 216) = sub_11560();
  *(void *)(inited + 224) = 0xD00000000000002ALL;
  *(void *)(inited + 232) = 0x80000000000121E0;
  *(NSNumber *)(inited + 240) = sub_11560();
  unint64_t v195 = sub_43B0(inited, &qword_18B00);
  NSString v196 = sub_11490();
  uint64_t v197 = swift_allocObject();
  *(void *)(v197 + 16) = v195;
  v242 = sub_10B84;
  uint64_t v243 = v197;
  aBlock = _NSConcreteStackBlock;
  uint64_t v150 = &loc_11000;
  uint64_t v239 = 1107296256;
  v240 = sub_44C8;
  v241 = &unk_14918;
  v198 = _Block_copy(&aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v198);

  sub_11118(v209, &qword_18AD8);
LABEL_155:
  CFAbsoluteTimeGetCurrent();
  sub_3DFC(&qword_18AE8);
  uint64_t v199 = swift_initStackObject();
  *(_OWORD *)(v199 + 16) = xmmword_11CD0;
  *(void *)(v199 + 32) = 0xD000000000000020;
  *(void *)(v199 + 40) = 0x80000000000120C0;
  *(NSNumber *)(v199 + 48) = sub_11570();
  unint64_t v200 = sub_43B0(v199, &qword_18B10);
  NSString v201 = sub_11490();
  uint64_t v202 = swift_allocObject();
  *(void *)(v202 + 16) = v200;
  v242 = sub_10B64;
  uint64_t v243 = v202;
  aBlock = _NSConcreteStackBlock;
  uint64_t v239 = v150[396];
  v240 = sub_44C8;
  v241 = &unk_148C8;
  v203 = _Block_copy(&aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v203);

LABEL_156:
  v204 = v233;
  sub_11118(v230, &qword_18AD8);
  uint64_t v147 = (uint64_t)v204;
  return sub_11118(v147, &qword_18AD8);
}

uint64_t sub_10B2C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10B64()
{
  sub_4564(*(void *)(v0 + 16));
}

uint64_t sub_10B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10B7C()
{
  return swift_release();
}

uint64_t sub_10B84()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10B8C()
{
  return swift_release();
}

unint64_t sub_10B94()
{
  unint64_t result = qword_18B60;
  if (!qword_18B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18B60);
  }
  return result;
}

_OWORD *sub_10BE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10BF8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10C34()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10C6C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10C7C()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10CD4(char a1, uint64_t a2)
{
  sub_4E18(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_10CE4()
{
  unint64_t result = qword_18BA8;
  if (!qword_18BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18BA8);
  }
  return result;
}

uint64_t sub_10D38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3DFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void *sub_10D9C(uint64_t a1)
{
  uint64_t v2 = sub_112E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  os_log_type_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_3DFC(&qword_18BC8);
    uint64_t v9 = sub_11630();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    unint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_11174(&qword_18BD0, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
      uint64_t v16 = sub_11470();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_11174(&qword_18BD8, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
          char v23 = sub_11480();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_110B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3DFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_11118(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3DFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_11174(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_111D0()
{
  return DateComponents.description.getter();
}

uint64_t sub_111E0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_111F0()
{
  return DateComponents.year.getter();
}

uint64_t sub_11200()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_11210()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_11220()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_11230()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

void sub_11240(NSURL *retstr@<X8>)
{
}

uint64_t sub_11250()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_11260()
{
  return type metadata accessor for URL();
}

uint64_t sub_11270()
{
  return Date.init()();
}

uint64_t sub_11280()
{
  return type metadata accessor for Date();
}

uint64_t sub_11290()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_112A0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_112B0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_112C0()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_112D0()
{
  return static Calendar.current.getter();
}

uint64_t sub_112E0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_112F0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_11300()
{
  return type metadata accessor for VUGallery.EntityClass();
}

uint64_t sub_11310()
{
  return dispatch thunk of VUGallery.countPerEntity(for:from:)();
}

uint64_t sub_11320()
{
  return dispatch thunk of VUGallery.updateMetadata(for:value:)();
}

uint64_t sub_11330()
{
  return dispatch thunk of VUGallery.entityIdentifier(matching:for:)();
}

uint64_t sub_11340()
{
  return VUGallery.RecognitionResult.toMetadata()();
}

uint64_t sub_11350()
{
  return VUGallery.RecognitionResult.entityIdentifier.getter();
}

uint64_t sub_11360()
{
  return type metadata accessor for VUGallery.RecognitionResult();
}

uint64_t sub_11370()
{
  return VUGallery.RecognitionResult.init(_:_:_:)();
}

uint64_t sub_11380()
{
  return dispatch thunk of VUGallery.tags(for:)();
}

uint64_t sub_11390()
{
  return dispatch thunk of VUGallery.tags(label:for:)();
}

uint64_t sub_113A0()
{
  return dispatch thunk of VUGallery.tags(matching:for:)();
}

uint64_t sub_113B0()
{
  return VUGallery.Client.rawValue.getter();
}

uint64_t sub_113C0()
{
  return type metadata accessor for VUGallery.Client();
}

uint64_t sub_113D0()
{
  return type metadata accessor for VUGallery.Source();
}

uint64_t sub_113E0()
{
  return VUGallery.client.getter();
}

uint64_t sub_113F0()
{
  return VUGallery.TagView.tag.getter();
}

uint64_t sub_11400()
{
  return VUGallery.TagView.client.getter();
}

uint64_t sub_11410()
{
  return VUGallery.TagView.entity.getter();
}

uint64_t sub_11420()
{
  return type metadata accessor for VUGallery.TagView();
}

uint64_t sub_11430()
{
  return Logger.logObject.getter();
}

uint64_t sub_11440()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_11450()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_11460()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_11470()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_11480()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_11490()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_114A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_114B0()
{
  return String.hash(into:)();
}

Swift::Int sub_114C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_114D0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_114E0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_114F0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_11500()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_11510()
{
  return Array.description.getter();
}

uint64_t sub_11520()
{
  return specialized Array._endMutation()();
}

uint64_t sub_11530()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_11540()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_11550()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_11560()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_11570()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_11580()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_11590()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_115A0()
{
  return NSOrderedSet.init(arrayLiteral:)();
}

uint64_t sub_115B0()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t sub_115C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_115D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_115E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_115F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_11600()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_11610()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_11620()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_11630()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_11640()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_11650()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_11660()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_11670()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_11680()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_11690()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_116A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_116B0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_116C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_116D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_116E0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_116F0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_11700()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_11710()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}