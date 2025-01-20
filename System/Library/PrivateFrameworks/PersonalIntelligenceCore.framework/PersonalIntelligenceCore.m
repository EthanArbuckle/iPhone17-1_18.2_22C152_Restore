id ii_default_log_handle()
{
  void *v0;
  uint64_t vars8;

  if (ii_default_log_handle__pasOnceToken2 != -1) {
    dispatch_once(&ii_default_log_handle__pasOnceToken2, &__block_literal_global_18);
  }
  v0 = (void *)ii_default_log_handle__pasExprOnceResult;
  return v0;
}

uint64_t sub_1CABEADB8()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    type metadata accessor for AppLaunchCounter();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1CABFC948();
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F502D8]), sel_init);
    id v3 = objc_msgSend(v2, sel_publisherFromStartTime_, CFAbsoluteTimeGetCurrent() + -1209600.0);

    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = &unk_1F256BBA0;
    v20 = sub_1CABECF88;
    uint64_t v21 = v4;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v17 = 1107296256;
    v18 = sub_1CABEB1A4;
    v19 = &block_descriptor;
    v5 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    id v6 = objc_msgSend(v3, sel_filterWithIsIncluded_, v5);
    _Block_release(v5);

    swift_bridgeObjectRetain();
    v7 = (void *)sub_1CABFC918();
    swift_bridgeObjectRelease();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = &unk_1F256BBA0;
    v20 = sub_1CABED0C8;
    uint64_t v21 = v8;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v17 = 1107296256;
    v18 = sub_1CABEB1FC;
    v19 = &block_descriptor_13;
    v9 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    id v10 = objc_msgSend(v6, sel_reduceWithInitial_nextPartialResult_, v7, v9);
    _Block_release(v9);

    v20 = sub_1CABEB2C0;
    uint64_t v21 = 0;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v17 = 1107296256;
    v18 = sub_1CABEB4A0;
    v19 = &block_descriptor_16;
    v11 = _Block_copy(&aBlock);
    v20 = sub_1CABED344;
    uint64_t v21 = v15;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v17 = 1107296256;
    v18 = sub_1CABEB508;
    v19 = &block_descriptor_19;
    v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v13 = objc_msgSend(v10, sel_sinkWithCompletion_receiveInput_, v11, v12);
    _Block_release(v12);
    _Block_release(v11);

    swift_beginAccess();
    uint64_t v1 = *(void *)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    *(void *)(v0 + 16) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1CABEB1A4(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

id sub_1CABEB1FC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(void *__return_ptr, void *, id);
  id v6;
  void *v7;
  void v9[4];
  void v10[4];
  uint64_t vars8;

  v5 = *(void (**)(void *__return_ptr, void *, id))(a1 + 32);
  v10[3] = swift_getObjectType();
  v10[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(v9, v10, v6);
  swift_release();

  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  v7 = (void *)sub_1CABFCC98();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v7;
}

void sub_1CABEB2C0(void *a1)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    os_log_type_t v2 = sub_1CABFCA18();
    id v3 = ii_default_log_handle();
    if (v3)
    {
      log = v3;
      if (os_log_type_enabled(v3, v2))
      {
        id v4 = a1;
        v5 = (uint8_t *)swift_slowAlloc();
        uint64_t v6 = swift_slowAlloc();
        uint64_t v13 = v6;
        *(_DWORD *)v5 = 136315138;
        id v7 = objc_msgSend(v4, sel_error);
        if (v7)
        {
          uint64_t v8 = v7;
          swift_getErrorValue();
          uint64_t v9 = sub_1CABFCCC8();
          unint64_t v11 = v10;
        }
        else
        {
          uint64_t v9 = 0;
          unint64_t v11 = 0xE000000000000000;
        }
        sub_1CABEBAA0(v9, v11, &v13);
        sub_1CABFCA58();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CABE8000, log, v2, "AppLaunchCounter: failed to completely read Biome stream %s", v5, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1CB79E890](v6, -1, -1);
        MEMORY[0x1CB79E890](v5, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1CABEB4A0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1CABEB508(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1CABEB568(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1CABEADB8();
  uint64_t v3 = sub_1CABEC6CC(v2);
  swift_bridgeObjectRelease();
  unint64_t v4 = sub_1CABEB620(v3);
  swift_release();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a1;
  sub_1CABEC914(v4, (uint64_t)sub_1CABEC8DC, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

unint64_t sub_1CABEB620(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB47D0);
    uint64_t v2 = (void *)sub_1CABFCBA8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
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
  id v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v10 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v11 = MEMORY[0x1E4FBB808];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v34 = (v5 - 1) & v5;
        unint64_t v12 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_34;
        }
        if (v13 >= v31)
        {
LABEL_31:
          sub_1CABECDE4();
          return (unint64_t)v2;
        }
        unint64_t v14 = *(void *)(v32 + 8 * v13);
        int64_t v15 = v9 + 1;
        if (!v14)
        {
          int64_t v15 = v9 + 2;
          if (v9 + 2 >= v31) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v32 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v9 + 3;
            if (v9 + 3 >= v31) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v32 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v9 + 4;
              if (v9 + 4 >= v31) {
                goto LABEL_31;
              }
              unint64_t v14 = *(void *)(v32 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v9 + 5;
                if (v9 + 5 >= v31) {
                  goto LABEL_31;
                }
                unint64_t v14 = *(void *)(v32 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_35;
                    }
                    if (v15 >= v31) {
                      goto LABEL_31;
                    }
                    unint64_t v14 = *(void *)(v32 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v15 = v9 + 5;
              }
            }
          }
        }
LABEL_25:
        uint64_t v34 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v9 = v15;
      }
      uint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
      uint64_t v35 = *v17;
      uint64_t v36 = v17[1];
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_1CABECDEC(v6, v7);
      sub_1CABECDEC(v7, v40);
      sub_1CABECDEC(v40, &v38);
      unint64_t result = sub_1CABEC258(v35, v36);
      unint64_t v18 = result;
      if ((v19 & 1) == 0) {
        break;
      }
      int64_t v33 = v9;
      v20 = v7;
      uint64_t v21 = v6;
      uint64_t v22 = v1;
      uint64_t v23 = v11;
      uint64_t v24 = v10;
      v25 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v25 = v35;
      v25[1] = v36;
      uint64_t v10 = v24;
      uint64_t v11 = v23;
      uint64_t v1 = v22;
      uint64_t v6 = v21;
      id v7 = v20;
      int64_t v9 = v33;
      v26 = (_OWORD *)(v2[7] + 32 * v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
      unint64_t result = (unint64_t)sub_1CABECDEC(&v38, v26);
      unint64_t v5 = v34;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1CABECDEC(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_33;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1CABEBA50()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_0();
  return MEMORY[0x1F4186488](v0);
}

uint64_t sub_1CABEBA80()
{
  OUTLINED_FUNCTION_0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_1CABEBAA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1CABEBB74(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1CABECB70((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1CABECB70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1CABEBB74(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1CABEBCCC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1CABFCA68();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1CABEBDA4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1CABFCAC8();
    if (!v8)
    {
      uint64_t result = sub_1CABFCB58();
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

void *sub_1CABEBCCC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1CABFCBB8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1CABEBDA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1CABEBE3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1CABEC018(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1CABEC018((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CABEBE3C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1CABFC9B8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1CABEBFB0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1CABFCAA8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1CABFCBB8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1CABFCB58();
  __break(1u);
  return result;
}

void *sub_1CABEBFB0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6110A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1CABEC018(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6110A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1CABEC1C8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1CABEC0F0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1CABEC0F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1CABFCBB8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1CABEC1C8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1CABFCBB8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1CABEC258(uint64_t a1, uint64_t a2)
{
  sub_1CABFCD18();
  sub_1CABFC998();
  uint64_t v4 = sub_1CABFCD38();
  return sub_1CABEC2D0(a1, a2, v4);
}

unint64_t sub_1CABEC2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1CABFCCA8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1CABFCCA8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1CABEC3B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB47D0);
  uint64_t v6 = sub_1CABFCB98();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      char v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * i);
      if (a2)
      {
        sub_1CABECDEC(v22, v35);
      }
      else
      {
        sub_1CABECB70((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1CABFCD18();
      sub_1CABFC998();
      uint64_t result = sub_1CABFCD38();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      int64_t v31 = (void *)(*(void *)(v7 + 48) + 16 * v26);
      *int64_t v31 = v21;
      v31[1] = v20;
      uint64_t result = (uint64_t)sub_1CABECDEC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v26));
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v16 >= v33) {
        goto LABEL_33;
      }
      unint64_t v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v33) {
          goto LABEL_33;
        }
        unint64_t v17 = v34[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            uint64_t v3 = v2;
            if (a2)
            {
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                sub_1CABEC6B0(0, (unint64_t)(v32 + 63) >> 6, v34);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_41;
              }
              if (v13 >= v33) {
                goto LABEL_33;
              }
              unint64_t v17 = v34[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1CABEC6B0(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1CABEC6CC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611090);
  uint64_t result = sub_1CABFCB88();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = result + 64;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    unint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    if (v16)
    {
      unint64_t v17 = v16 / 0xA;
      if (v17 >= 5) {
        unint64_t v17 = 5;
      }
      unint64_t v16 = v17 + 1;
    }
    int64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v19 = *v18;
    uint64_t result = v18[1];
    *(void *)(v10 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v20 = (void *)(v3[6] + 16 * i);
    void *v20 = v19;
    v20[1] = result;
    *(void *)(v3[7] + 8 * i) = v16;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v3[2] = v23;
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_28;
    }
    if (v13 >= v9) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v9) {
        return (uint64_t)v3;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v9) {
          return (uint64_t)v3;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v9) {
    return (uint64_t)v3;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v9) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1CABEC89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_1CABEC8DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1CABEC89C((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1CABEC914(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_1CABECBCC(a1, a2, a3, &v30);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CABECC08(&v28);
  uint64_t v7 = *((void *)&v28 + 1);
  if (!*((void *)&v28 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1CABECDE4();
    return swift_release();
  }
  while (1)
  {
    uint64_t v8 = v28;
    sub_1CABECDEC(&v29, v27);
    uint64_t v9 = *a5;
    unint64_t v11 = sub_1CABEC258(v8, v7);
    uint64_t v12 = *(void *)(v9 + 16);
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (*(void *)(v9 + 24) >= v14)
    {
      if (a4)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611080);
        sub_1CABFCB48();
        if (v15) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_1CABEC3B4(v14, a4 & 1);
      unint64_t v16 = sub_1CABEC258(v8, v7);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_17;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_9:
        sub_1CABECB70(*(void *)(*a5 + 56) + 32 * v11, (uint64_t)v25);
        sub_1CABECB70((uint64_t)v25, (uint64_t)v26);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
        swift_bridgeObjectRelease();
        int64_t v18 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v11);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
        sub_1CABECDEC(v26, v18);
        goto LABEL_13;
      }
    }
    uint64_t v19 = (void *)*a5;
    *(void *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    uint64_t *v20 = v8;
    v20[1] = v7;
    sub_1CABECDEC(v27, (_OWORD *)(v19[7] + 32 * v11));
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_16;
    }
    v19[2] = v23;
LABEL_13:
    sub_1CABECC08(&v28);
    uint64_t v7 = *((void *)&v28 + 1);
    a4 = 1;
    if (!*((void *)&v28 + 1)) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = sub_1CABFCCB8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AppLaunchCounter()
{
  return self;
}

uint64_t sub_1CABECB70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CABECBCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1CABECC08@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    unint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1CABECB70(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_1CABECE90((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_1CABECEF8((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_1CABECDE4()
{
  return swift_release();
}

_OWORD *sub_1CABECDEC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1CABECE90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CABECEF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB47A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CABECF58()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1CABECF88(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  id v3 = objc_msgSend(a1, sel_eventBody);
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_bundleID);

  uint64_t v6 = sub_1CABFC988();
  uint64_t v8 = v7;

  LODWORD(v6) = sub_1CABF33FC(v6, v8);
  swift_bridgeObjectRelease();
  if (v6 == 4) {
    goto LABEL_9;
  }
  uint64_t v9 = *(void *)(v2 + 16);
  if (v9)
  {
    sub_1CABED460();
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    do
    {
      char v11 = sub_1CABFC968();
      if (v11) {
        break;
      }
    }
    while (v9 - 1 != v10++);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    char v11 = 0;
  }
  return v11 & 1;
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

uint64_t sub_1CABED0C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  sub_1CABECB70(a1, (uint64_t)&v31);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611098);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v7 = v30;
  }
  else
  {
    uint64_t result = sub_1CABFC948();
    uint64_t v7 = (void *)result;
  }
  uint64_t v29 = *(void *)(v4 + 16);
  if (v29)
  {
    uint64_t v27 = v5;
    long long v28 = a2;
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    while (1)
    {
      unsigned int v9 = *(unsigned __int8 *)(v4 + v8 + 32);
      uint64_t v10 = v9 >= 3 ? 0xD000000000000017 : 0xD000000000000013;
      uint64_t v11 = v9 >= 3 ? 0x80000001CABFE4A0 : 0x80000001CABFE480;
      if (v7[2] && (unint64_t v12 = sub_1CABEC258(v10, v11), (v13 & 1) != 0)) {
        uint64_t v14 = *(void *)(v7[7] + 8 * v12);
      }
      else {
        uint64_t v14 = 0;
      }
      swift_bridgeObjectRelease();
      uint64_t v15 = v14 + 1;
      if (v14 == -1) {
        break;
      }
      swift_isUniquelyReferenced_nonNull_native();
      int64_t v31 = v7;
      unint64_t v16 = sub_1CABEC258(v10, v11);
      if (__OFADD__(v7[2], (v17 & 1) == 0)) {
        goto LABEL_29;
      }
      unint64_t v18 = v16;
      char v19 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6110A8);
      char v20 = sub_1CABFCB38();
      uint64_t v7 = v31;
      if (v20)
      {
        unint64_t v21 = sub_1CABEC258(v10, v11);
        if ((v19 & 1) != (v22 & 1)) {
          goto LABEL_31;
        }
        unint64_t v18 = v21;
      }
      if (v19)
      {
        *(void *)(v7[7] + 8 * v18) = v15;
      }
      else
      {
        v7[(v18 >> 6) + 8] |= 1 << v18;
        long long v23 = (uint64_t *)(v7[6] + 16 * v18);
        *long long v23 = v10;
        v23[1] = v11;
        *(void *)(v7[7] + 8 * v18) = v15;
        uint64_t v24 = v7[2];
        BOOL v25 = __OFADD__(v24, 1);
        uint64_t v26 = v24 + 1;
        if (v25) {
          goto LABEL_30;
        }
        v7[2] = v26;
        swift_bridgeObjectRetain();
      }
      ++v8;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v29 == v8)
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = v27;
        a2 = v28;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    uint64_t result = sub_1CABFCCB8();
    __break(1u);
  }
  else
  {
LABEL_27:
    a2[3] = v5;
    *a2 = v7;
  }
  return result;
}

void sub_1CABED344()
{
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611098);
  if (swift_dynamicCast())
  {
    swift_beginAccess();
    *(void *)(v0 + 16) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CABFCA18();
    id v1 = ii_default_log_handle();
    if (v1)
    {
      uint64_t v2 = v1;
      sub_1CABFC8D8();
    }
    else
    {
      __break(1u);
    }
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1CABED460()
{
  unint64_t result = qword_1EA6110B0;
  if (!qword_1EA6110B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6110B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return v0;
}

BOOL sub_1CABED4DC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1CABED4EC()
{
  return sub_1CABFCD28();
}

uint64_t sub_1CABED514()
{
  return sub_1CABFCD38();
}

BOOL sub_1CABED55C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1CABED4DC(*a1, *a2);
}

uint64_t sub_1CABED568()
{
  return sub_1CABED514();
}

uint64_t sub_1CABED570()
{
  return sub_1CABED4EC();
}

uint64_t sub_1CABED578()
{
  return sub_1CABFCD38();
}

BOOL sub_1CABED5CC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1CABED5DC()
{
  return sub_1CABFCD28();
}

uint64_t sub_1CABED604(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6156656C62756F64 && a2 == 0xEB0000000065756CLL;
    if (v6 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6156676E69727473 && a2 == 0xEB0000000065756CLL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = OUTLINED_FUNCTION_1();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1CABED72C(char a1)
{
  return qword_1CABFDC58[a1];
}

BOOL sub_1CABED74C(char *a1, char *a2)
{
  return sub_1CABED5CC(*a1, *a2);
}

uint64_t sub_1CABED758()
{
  return sub_1CABEE700();
}

uint64_t sub_1CABED774()
{
  return sub_1CABED5DC();
}

uint64_t sub_1CABED780()
{
  return sub_1CABED72C(*v0);
}

uint64_t sub_1CABED788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1CABED604(a1, a2);
  *a3 = result;
  return result;
}

void sub_1CABED7B4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1CABED7C0()
{
  sub_1CABF0210();
  uint64_t v0 = OUTLINED_FUNCTION_12();
  return MEMORY[0x1F41862A8](v0);
}

uint64_t sub_1CABED7F8()
{
  sub_1CABF0210();
  uint64_t v0 = OUTLINED_FUNCTION_12();
  return MEMORY[0x1F41862B0](v0);
}

uint64_t sub_1CABED830(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB47E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF0210();
  OUTLINED_FUNCTION_15();
  sub_1CABFCC48();
  if (!v1)
  {
    OUTLINED_FUNCTION_5();
    sub_1CABFCC38();
    OUTLINED_FUNCTION_8();
    sub_1CABFCC28();
  }
  uint64_t v3 = OUTLINED_FUNCTION_6();
  return v4(v3);
}

uint64_t sub_1CABED95C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA611188);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF0210();
  sub_1CABFCD48();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  OUTLINED_FUNCTION_10();
  uint64_t v5 = sub_1CABFCBE8();
  uint64_t v7 = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_10();
  uint64_t v8 = sub_1CABFCBD8();
  char v18 = v9;
  uint64_t v17 = v8;
  OUTLINED_FUNCTION_10();
  uint64_t v10 = sub_1CABFCBC8();
  uint64_t v12 = v11;
  uint64_t v16 = v10;
  uint64_t v13 = OUTLINED_FUNCTION_16();
  v14(v13);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v17;
  *(unsigned char *)(a2 + 24) = v18 & 1;
  *(void *)(a2 + 32) = v16;
  *(void *)(a2 + 40) = v12;
  return result;
}

double sub_1CABEDB50(void *a1)
{
  uint64_t v2 = sub_1CABED95C(a1, (uint64_t)v12);
  if (!v1) {
    v10.n128_u64[0] = OUTLINED_FUNCTION_21(v2, v3, v4, v5, v6, v7, v8, v9, v12[0], v12[1], v10).n128_u64[0];
  }
  return v10.n128_f64[0];
}

uint64_t sub_1CABEDB88(void *a1)
{
  return sub_1CABED830(a1);
}

uint64_t sub_1CABEDBA0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    swift_bridgeObjectRetain();
    return v1;
  }
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v4 = (void *)(v2 + 72);
    uint64_t v5 = (char *)MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v6 = *(v4 - 4);
      if (*(unsigned char *)(v4 - 2))
      {
        if (!*v4)
        {
          uint64_t v18 = 0;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v15 = 0u;
          goto LABEL_16;
        }
        *(void *)&long long v15 = *(v4 - 5);
        *((void *)&v15 + 1) = v6;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
      }
      else
      {
        *(void *)&long long v15 = *(v4 - 5);
        *((void *)&v15 + 1) = v6;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
      }
      sub_1CABFCA88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v15 + 1))
      {
        long long v11 = v15;
        long long v12 = v16;
        long long v13 = v17;
        uint64_t v14 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_1CABF02C8(0, *((void *)v5 + 2) + 1, 1, (uint64_t)v5);
        }
        unint64_t v8 = *((void *)v5 + 2);
        unint64_t v7 = *((void *)v5 + 3);
        if (v8 >= v7 >> 1) {
          uint64_t v5 = sub_1CABF02C8((char *)(v7 > 1), v8 + 1, 1, (uint64_t)v5);
        }
        *((void *)v5 + 2) = v8 + 1;
        uint64_t v9 = &v5[56 * v8];
        *((void *)v9 + 10) = v14;
        *((_OWORD *)v9 + 3) = v12;
        *((_OWORD *)v9 + 4) = v13;
        *((_OWORD *)v9 + 2) = v11;
        goto LABEL_17;
      }
LABEL_16:
      sub_1CABF0F68((uint64_t)&v15, &qword_1EA6111A8);
LABEL_17:
      v4 += 6;
      if (!--v3)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_20;
      }
    }
  }
  uint64_t v5 = (char *)MEMORY[0x1E4FBC860];
LABEL_20:
  uint64_t v1 = sub_1CABEE4E0((uint64_t)v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 40) = v1;
  return v1;
}

uint64_t sub_1CABEDDE0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  sub_1CABF0E48(a1, v51);
  uint64_t v44 = v51[0];
  int64_t v45 = v51[3];
  uint64_t v42 = v51[1];
  int64_t v43 = (unint64_t)(v51[2] + 64) >> 6;
  unint64_t v4 = v51[4];
  uint64_t v5 = v59;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  if (!v4) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v46 = (v4 - 1) & v4;
  unint64_t v8 = __clz(__rbit64(v4)) | (v45 << 6);
  while (1)
  {
    long long v12 = (uint64_t *)(*(void *)(v44 + 48) + 16 * v8);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    sub_1CABECB70(*(void *)(v44 + 56) + 32 * v8, (uint64_t)v50);
    *(void *)&long long v49 = v14;
    *((void *)&v49 + 1) = v13;
    long long v47 = v49;
    v48[0] = v50[0];
    v48[1] = v50[1];
    swift_bridgeObjectRetain();
    uint64_t v15 = *((void *)&v47 + 1);
    uint64_t v16 = v47;
    long long v60 = v47;
    sub_1CABECB70((uint64_t)v48, (uint64_t)v61);
    sub_1CABECB70((uint64_t)v48, (uint64_t)v59);
    swift_bridgeObjectRetain();
    sub_1CABECB70((uint64_t)v59, (uint64_t)v56);
    sub_1CABF0E80();
    swift_bridgeObjectRetain();
    if (swift_dynamicCast())
    {
      id v17 = v52;
      objc_msgSend(v52, sel_doubleValue);
      char v19 = v18;

      unsigned __int8 v20 = 0;
      id v21 = v19;
      unint64_t v22 = MEMORY[0x1E4FBC840];
    }
    else
    {
      sub_1CABECB70((uint64_t)v59, (uint64_t)v56);
      unint64_t v22 = MEMORY[0x1E4FBC840];
      int v23 = swift_dynamicCast();
      id v21 = v23 ? v52 : 0;
      unsigned __int8 v20 = v23 ^ 1;
    }
    sub_1CABECB70((uint64_t)v59, (uint64_t)v56);
    if (swift_dynamicCast())
    {
      uint64_t v5 = v52;
      unint64_t v22 = v53;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (v20)
      {
        swift_bridgeObjectRelease();
        sub_1CABF0EC0();
        uint64_t v3 = (void *)swift_allocError();
        *uint64_t v24 = 0;
        swift_willThrow();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v59);
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      uint64_t v5 = 0;
      unint64_t v22 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v59);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned __int8 v62 = v20;
LABEL_26:
    if (v3)
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
      os_log_type_t v25 = sub_1CABFCA18();
      uint64_t result = (uint64_t)ii_default_log_handle();
      if (!result) {
        goto LABEL_49;
      }
      uint64_t v26 = result;
      long long v60 = v47;
      sub_1CABECB70((uint64_t)v48, (uint64_t)v61);
      sub_1CABF0FC4((uint64_t)&v60, (uint64_t)&v57, &qword_1EBCB47A0);
      v56[0] = v60;
      v56[1] = v61[0];
      v56[2] = v61[1];
      if (os_log_type_enabled(v26, v25))
      {
        uint64_t v27 = a2;
        swift_bridgeObjectRetain();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v55 = v41;
        *(_DWORD *)uint64_t v28 = 136315394;
        uint64_t v29 = *(void *)&v27[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
        unint64_t v30 = *(void *)&v27[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8];
        swift_bridgeObjectRetain();
        id v52 = (id)sub_1CABEBAA0(v29, v30, &v55);
        sub_1CABFCA58();
        swift_bridgeObjectRelease();

        *(_WORD *)(v28 + 12) = 2080;
        uint64_t v31 = (uint64_t)v57;
        unint64_t v32 = v58;
        id v52 = v57;
        unint64_t v53 = v58;
        sub_1CABECB70((uint64_t)v59, (uint64_t)v54);
        swift_bridgeObjectRetain();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v54);
        id v52 = (id)sub_1CABEBAA0(v31, v32, &v55);
        sub_1CABFCA58();
        swift_bridgeObjectRelease();
        sub_1CABF0F68((uint64_t)v56, &qword_1EBCB47A0);
        sub_1CABF0F68((uint64_t)&v57, &qword_1EBCB47A0);
        _os_log_impl(&dword_1CABE8000, v26, v25, "MetricMessage: Found message %s with uncodable value for key %s, this key will not be persisted.", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1CB79E890](v41, -1, -1);
        MEMORY[0x1CB79E890](v28, -1, -1);
      }
      else
      {
        swift_bridgeObjectRetain();

        sub_1CABF0F68((uint64_t)v56, &qword_1EBCB47A0);
        sub_1CABF0F68((uint64_t)&v57, &qword_1EBCB47A0);
      }
      uint64_t v3 = 0;
      unint64_t v22 = 0;
      uint64_t v5 = 0;
      uint64_t v33 = 0;
      id v21 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v33 = v62;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
    }
    uint64_t result = sub_1CABF0F68((uint64_t)&v47, &qword_1EBCB47A0);
    if (v15)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1CABF03C0(0, *(void *)(v7 + 16) + 1, 1, v7);
        uint64_t v7 = result;
      }
      uint64_t v34 = v7;
      unint64_t v35 = *(void *)(v7 + 16);
      uint64_t v36 = v34;
      unint64_t v37 = *(void *)(v34 + 24);
      if (v35 >= v37 >> 1)
      {
        uint64_t result = (uint64_t)sub_1CABF03C0((char *)(v37 > 1), v35 + 1, 1, v36);
        uint64_t v36 = result;
      }
      *(void *)(v36 + 16) = v35 + 1;
      uint64_t v38 = v36 + 48 * v35;
      uint64_t v7 = v36;
      *(void *)(v38 + 32) = v16;
      *(void *)(v38 + 40) = v15;
      *(void *)(v38 + 48) = v21;
      *(unsigned char *)(v38 + 56) = v33 != 0;
      *(void *)(v38 + 64) = v5;
      *(void *)(v38 + 72) = v22;
    }
    unint64_t v4 = v46;
    uint64_t v5 = v59;
    if (v46) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v45 + 1;
    if (__OFADD__(v45, 1)) {
      break;
    }
    if (v9 >= v43) {
      goto LABEL_47;
    }
    unint64_t v10 = *(void *)(v42 + 8 * v9);
    if (!v10)
    {
      int64_t v11 = v45 + 2;
      if (v45 + 2 >= v43) {
        goto LABEL_47;
      }
      unint64_t v10 = *(void *)(v42 + 8 * v11);
      if (v10) {
        goto LABEL_12;
      }
      int64_t v11 = v45 + 3;
      if (v45 + 3 >= v43) {
        goto LABEL_47;
      }
      unint64_t v10 = *(void *)(v42 + 8 * v11);
      if (v10) {
        goto LABEL_12;
      }
      int64_t v11 = v45 + 4;
      if (v45 + 4 >= v43) {
        goto LABEL_47;
      }
      unint64_t v10 = *(void *)(v42 + 8 * v11);
      if (v10)
      {
LABEL_12:
        int64_t v9 = v11;
      }
      else
      {
        int64_t v9 = v45 + 5;
        if (v45 + 5 >= v43) {
          goto LABEL_47;
        }
        unint64_t v10 = *(void *)(v42 + 8 * v9);
        if (!v10)
        {
          int64_t v39 = v45 + 6;
          while (v39 < v43)
          {
            unint64_t v10 = *(void *)(v42 + 8 * v39++);
            if (v10)
            {
              int64_t v9 = v39 - 1;
              goto LABEL_13;
            }
          }
LABEL_47:

          swift_release();
          return v7;
        }
      }
    }
LABEL_13:
    uint64_t v46 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v9 << 6);
    int64_t v45 = v9;
  }
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_1CABEE4E0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6111C0);
    uint64_t v1 = sub_1CABFCBA8();
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1CABF0814(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1CABEE58C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646E656B636162 && a2 == 0xE700000000000000;
  if (v3 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001CABFE5B0 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
    if (v6 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x7372655661746164 && a2 == 0xEB000000006E6F69)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = OUTLINED_FUNCTION_1();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_1CABEE700()
{
  return sub_1CABFCD38();
}

unint64_t sub_1CABEE748(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x73646C656966;
      break;
    case 3:
      unint64_t result = 0x7372655661746164;
      break;
    default:
      unint64_t result = 0x646E656B636162;
      break;
  }
  return result;
}

uint64_t sub_1CABEE7E4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB47E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF0074();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_8();
  sub_1CABFCC68();
  if (!v1)
  {
    OUTLINED_FUNCTION_5();
    sub_1CABFCC48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB47A8);
    sub_1CABF0154((unint64_t *)&unk_1EBCB47B0, (void (*)(void))sub_1CABF01C4);
    OUTLINED_FUNCTION_8();
    sub_1CABFCC58();
    OUTLINED_FUNCTION_8();
    sub_1CABFCC78();
  }
  uint64_t v3 = OUTLINED_FUNCTION_6();
  return v4(v3);
}

uint64_t sub_1CABEE980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA611170);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF0074();
  sub_1CABFCD48();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  OUTLINED_FUNCTION_9();
  char v5 = sub_1CABFCC08();
  OUTLINED_FUNCTION_9();
  uint64_t v6 = sub_1CABFCBE8();
  uint64_t v8 = v7;
  uint64_t v13 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB47A8);
  sub_1CABF0154(&qword_1EA611180, (void (*)(void))sub_1CABF0108);
  swift_bridgeObjectRetain();
  sub_1CABFCBF8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
  int v9 = sub_1CABFCC18();
  uint64_t v10 = OUTLINED_FUNCTION_2();
  v11(v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v5;
  *(void *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v14;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = 0;
  return result;
}

unint64_t sub_1CABEEC20()
{
  return sub_1CABEE748(*v0);
}

uint64_t sub_1CABEEC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1CABEE58C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1CABEEC50(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1CABEEC5C()
{
  sub_1CABF0074();
  uint64_t v0 = OUTLINED_FUNCTION_12();
  return MEMORY[0x1F41862A8](v0);
}

uint64_t sub_1CABEEC94()
{
  sub_1CABF0074();
  uint64_t v0 = OUTLINED_FUNCTION_12();
  return MEMORY[0x1F41862B0](v0);
}

double sub_1CABEECCC(void *a1)
{
  uint64_t v2 = sub_1CABEE980(a1, (uint64_t)v12);
  if (!v1) {
    v10.n128_u64[0] = OUTLINED_FUNCTION_21(v2, v3, v4, v5, v6, v7, v8, v9, v12[0], v12[1], v10).n128_u64[0];
  }
  return v10.n128_f64[0];
}

uint64_t sub_1CABEED04(void *a1)
{
  return sub_1CABEE7E4(a1);
}

uint64_t sub_1CABEED8C()
{
  uint64_t v1 = sub_1CABFCC88();
  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRetain();
  sub_1CABFC9A8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRetain();
  sub_1CABFC938();
  sub_1CABFC9A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
  sub_1CABFCC88();
  sub_1CABFC9A8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1CABEEEAC()
{
  uint64_t v1 = OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray;
  if (*(void *)&v0[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray])
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray];
  }
  else
  {
    uint64_t v3 = v0;
    uint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v2 = sub_1CABEDDE0(v4, v3);
    swift_bridgeObjectRelease();
    *(void *)&v0[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_1CABEEF50(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v9 = objc_allocWithZone(v4);
  return sub_1CABEEFAC(a1, a2, a3, a4);
}

id sub_1CABEEFAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray] = 0;
  v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend] = a4;
  uint64_t v5 = &v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
  void *v5 = a2;
  v5[1] = a3;
  *(void *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents] = a1;
  *(_DWORD *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_dataVersion] = 1;
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for MetricMessage();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for MetricMessage()
{
  return self;
}

uint64_t sub_1CABEF048(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a3 == 1)
  {
    sub_1CABFC708();
    swift_allocObject();
    sub_1CABFC6F8();
    sub_1CABEF20C();
    sub_1CABFC6E8();
    swift_release();
    uint64_t v6 = sub_1CABEDBA0();
    unint64_t v7 = sub_1CABEF2A4(v6);
    swift_bridgeObjectRelease();
    uint64_t v5 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, void))(v4 + 144))(v7, v10, v11, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

unint64_t sub_1CABEF20C()
{
  unint64_t result = qword_1EA611310[0];
  if (!qword_1EA611310[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA611310);
  }
  return result;
}

unint64_t sub_1CABEF258()
{
  unint64_t result = qword_1EA6110F0;
  if (!qword_1EA6110F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6110F0);
  }
  return result;
}

unint64_t sub_1CABEF2A4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB47D0);
    uint64_t v2 = (void *)sub_1CABFCBA8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v28 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v8 = v7 | (v28 << 6);
      }
      else
      {
        int64_t v9 = v28 + 1;
        if (__OFADD__(v28, 1)) {
          goto LABEL_34;
        }
        if (v9 >= v26)
        {
LABEL_31:
          sub_1CABECDE4();
          return (unint64_t)v2;
        }
        unint64_t v10 = *(void *)(v27 + 8 * v9);
        int64_t v11 = v28 + 1;
        if (!v10)
        {
          int64_t v11 = v28 + 2;
          if (v28 + 2 >= v26) {
            goto LABEL_31;
          }
          unint64_t v10 = *(void *)(v27 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v28 + 3;
            if (v28 + 3 >= v26) {
              goto LABEL_31;
            }
            unint64_t v10 = *(void *)(v27 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v28 + 4;
              if (v28 + 4 >= v26) {
                goto LABEL_31;
              }
              unint64_t v10 = *(void *)(v27 + 8 * v11);
              if (!v10)
              {
                int64_t v12 = v28 + 5;
                if (v28 + 5 >= v26) {
                  goto LABEL_31;
                }
                unint64_t v10 = *(void *)(v27 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    int64_t v11 = v12 + 1;
                    if (__OFADD__(v12, 1)) {
                      goto LABEL_35;
                    }
                    if (v11 >= v26) {
                      goto LABEL_31;
                    }
                    unint64_t v10 = *(void *)(v27 + 8 * v11);
                    ++v12;
                    if (v10) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v11 = v28 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v10 - 1) & v10;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        int64_t v28 = v11;
      }
      uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      sub_1CABF0F0C(*(void *)(a1 + 56) + 40 * v8, (uint64_t)&v35);
      uint64_t v33 = v15;
      uint64_t v34 = v14;
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      uint64_t v17 = v15;
      uint64_t v16 = v14;
      sub_1CABECDEC(&v29, v31);
      sub_1CABECDEC(v31, v32);
      sub_1CABECDEC(v32, &v30);
      unint64_t result = sub_1CABEC258(v17, v14);
      unint64_t v18 = result;
      if ((v19 & 1) == 0) {
        break;
      }
      unsigned __int8 v20 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v20 = v17;
      v20[1] = v16;
      id v21 = (_OWORD *)(v2[7] + 32 * v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      unint64_t result = (unint64_t)sub_1CABECDEC(&v30, v21);
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v22 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v22 = v17;
    v22[1] = v16;
    unint64_t result = (unint64_t)sub_1CABECDEC(&v30, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v23 = v2[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_33;
    }
    v2[2] = v25;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1CABEF680()
{
  return sub_1CABEF764(MEMORY[0x1E4F27498], MEMORY[0x1E4F27490], MEMORY[0x1E4F27488]);
}

unint64_t sub_1CABEF6C0()
{
  unint64_t result = qword_1EBCB4E38[0];
  if (!qword_1EBCB4E38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBCB4E38);
  }
  return result;
}

uint64_t sub_1CABEF724()
{
  return sub_1CABEF764(MEMORY[0x1E4F26D58], MEMORY[0x1E4F26D50], MEMORY[0x1E4F26D40]);
}

uint64_t sub_1CABEF764(void (*a1)(void), void (*a2)(void), uint64_t (*a3)(unsigned char *, void *, unint64_t))
{
  char v7 = *(unsigned char *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend);
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier);
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1CABEEEAC();
  a1(0);
  swift_allocObject();
  a2();
  v14[0] = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v8;
  uint64_t v17 = v10;
  int v18 = 1;
  uint64_t v19 = 0;
  unint64_t v11 = sub_1CABEF6C0();
  uint64_t v12 = a3(v14, &unk_1F256BF60, v11);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v12;
}

id sub_1CABEF8A0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  unint64_t v6 = v5;

  if (v6 >> 60 == 15)
  {
    char v7 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_14();
    char v7 = (void *)sub_1CABFC768();
    uint64_t v8 = OUTLINED_FUNCTION_14();
    sub_1CABF025C(v8, v9);
  }
  return v7;
}

void sub_1CABEF924()
{
}

id sub_1CABEF964()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetricMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1CABEF9FC()
{
  unint64_t result = qword_1EA6110F8;
  if (!qword_1EA6110F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6110F8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_1CABEFA58(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_22(-1);
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
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_22(v8);
}

unsigned char *sub_1CABEFADC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_20((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_18((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1CABEFB98);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_19((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_11(result, a2 + 1);
        break;
    }
  }
  return result;
}

uint64_t sub_1CABEFBC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1CABEFBCC(unsigned char *a1, char a2)
{
  return OUTLINED_FUNCTION_11(a1, a2 & 1);
}

void type metadata accessor for MetricsError()
{
}

uint64_t sub_1CABEFBE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1CABEFC14()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CABEFC50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CABEFCA0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
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

uint64_t sub_1CABEFD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1CABEFD8C(uint64_t a1, int a2)
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

uint64_t sub_1CABEFDCC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      return OUTLINED_FUNCTION_13(result);
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

void type metadata accessor for CodableField()
{
}

void type metadata accessor for IIMetricsBackend()
{
  if (!qword_1EA611168)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA611168);
    }
  }
}

uint64_t sub_1CABEFE68()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CABEFEAC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CABEFF14(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  *(void *)(v3 + 16) = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v3 + 32) = *(_DWORD *)(v2 + 32);
  *(void *)(v3 + 40) = *(void *)(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1CABEFF90(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v3 + 32) = *(_DWORD *)(v2 + 32);
  *(void *)(v3 + 40) = *(void *)(v2 + 40);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1CABEFFE4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t sub_1CABF0024(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      return OUTLINED_FUNCTION_13(result);
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for StorableMessage()
{
}

unint64_t sub_1CABF0074()
{
  unint64_t result = qword_1EBCB4C90;
  if (!qword_1EBCB4C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4C90);
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

unint64_t sub_1CABF0108()
{
  unint64_t result = qword_1EA6115A8;
  if (!qword_1EA6115A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6115A8);
  }
  return result;
}

uint64_t sub_1CABF0154(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBCB47A8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1CABF01C4()
{
  unint64_t result = qword_1EBCB4C00[0];
  if (!qword_1EBCB4C00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBCB4C00);
  }
  return result;
}

unint64_t sub_1CABF0210()
{
  unint64_t result = qword_1EBCB4A58;
  if (!qword_1EBCB4A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4A58);
  }
  return result;
}

uint64_t sub_1CABF025C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1CABF0270(a1, a2);
  }
  return a1;
}

uint64_t sub_1CABF0270(uint64_t a1, unint64_t a2)
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

char *sub_1CABF02C8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6111B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CABF06DC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CABF04B8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1CABF03C0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_1EBCB47F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CABF0778((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CABF05DC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1CABF04B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6111B8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CABFCBB8();
  __break(1u);
  return result;
}

uint64_t sub_1CABF05DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CABFCBB8();
  __break(1u);
  return result;
}

char *sub_1CABF06DC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CABFCBB8();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

char *sub_1CABF0778(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CABFCBB8();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

void sub_1CABF0814(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v5 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1CABF0FC4(v5, (uint64_t)&v33, &qword_1EA6111B8);
    uint64_t v6 = v33;
    uint64_t v7 = v34;
    uint64_t v31 = v33;
    uint64_t v32 = v34;
    long long v28 = v35;
    long long v29 = v36;
    uint64_t v30 = v37;
    uint64_t v8 = (void *)*a3;
    unint64_t v10 = sub_1CABEC258(v33, v34);
    uint64_t v11 = v8[2];
    BOOL v12 = (v9 & 1) == 0;
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1CABFCCB8();
      __break(1u);
      goto LABEL_20;
    }
    char v14 = v9;
    if (v8[3] < v13) {
      break;
    }
    if (a2)
    {
      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6111C8);
      sub_1CABFCB48();
      if (v14) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v17 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    int v18 = (uint64_t *)(v17[6] + 16 * v10);
    uint64_t *v18 = v6;
    v18[1] = v7;
    uint64_t v19 = v17[7] + 40 * v10;
    long long v20 = v28;
    long long v21 = v29;
    *(void *)(v19 + 32) = v30;
    *(_OWORD *)uint64_t v19 = v20;
    *(_OWORD *)(v19 + 16) = v21;
    uint64_t v22 = v17[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_18;
    }
    v17[2] = v24;
    v5 += 56;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1CABF0B1C(v13, a2 & 1);
  unint64_t v15 = sub_1CABEC258(v6, v7);
  if ((v14 & 1) != (v16 & 1)) {
    goto LABEL_19;
  }
  unint64_t v10 = v15;
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v25 = (void *)swift_allocError();
  swift_willThrow();
  id v38 = v25;
  id v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA6111D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_1CABF1024((uint64_t)&v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_1CABFCA98();
  sub_1CABFC9A8();
  sub_1CABFCB28();
  sub_1CABFC9A8();
  sub_1CABFCB68();
  __break(1u);
}

uint64_t sub_1CABF0B1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6111C0);
  char v42 = a2;
  uint64_t v6 = sub_1CABFCB98();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
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
    long long v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(v5 + 56) + 40 * i;
    if (v42)
    {
      long long v24 = *(_OWORD *)v23;
      long long v25 = *(_OWORD *)(v23 + 16);
      uint64_t v45 = *(void *)(v23 + 32);
      long long v43 = v24;
      long long v44 = v25;
    }
    else
    {
      sub_1CABF0F0C(v23, (uint64_t)&v43);
      swift_bridgeObjectRetain();
    }
    sub_1CABFCD18();
    sub_1CABFC998();
    uint64_t result = sub_1CABFCD38();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        BOOL v32 = v28 == v31;
        if (v28 == v31) {
          unint64_t v28 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v28);
        if (v33 != -1)
        {
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v7 + 48) + 16 * v29);
    *uint64_t v34 = v22;
    v34[1] = v21;
    uint64_t v35 = *(void *)(v7 + 56) + 40 * v29;
    long long v36 = v43;
    long long v37 = v44;
    *(void *)(v35 + 32) = v45;
    *(_OWORD *)uint64_t v35 = v36;
    *(_OWORD *)(v35 + 16) = v37;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_42;
    }
    if (v16 >= v40)
    {
      swift_release();
      uint64_t v3 = v39;
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_35;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v41 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v41 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v40)
  {
    unint64_t v18 = *(void *)(v41 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_43;
        }
        if (v13 >= v40) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v41 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v39;
LABEL_35:
  if (v42)
  {
    uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
    if (v38 >= 64) {
      sub_1CABEC6B0(0, (unint64_t)(v38 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v38;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1CABF0E48@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

unint64_t sub_1CABF0E80()
{
  unint64_t result = qword_1EBCB47C0;
  if (!qword_1EBCB47C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBCB47C0);
  }
  return result;
}

unint64_t sub_1CABF0EC0()
{
  unint64_t result = qword_1EA611198;
  if (!qword_1EA611198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA611198);
  }
  return result;
}

uint64_t sub_1CABF0F0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1CABF0F68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CABF0FC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v4 = OUTLINED_FUNCTION_14();
  v5(v4);
  return a2;
}

uint64_t sub_1CABF1024(uint64_t a1)
{
  return a1;
}

uint64_t sub_1CABF1078(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_22(-1);
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_22(v8);
}

unsigned char *sub_1CABF10FC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_20((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_18((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1CABF11B8);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_19((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_11(result, a2 + 2);
        break;
    }
  }
  return result;
}

unsigned char *sub_1CABF11E0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for CodableField.CodingKeys()
{
}

uint64_t sub_1CABF11F4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_22(-1);
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
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 4);
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
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_22((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_22(v8);
}

unsigned char *sub_1CABF1278(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_20((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_18((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1CABF1334);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_19((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_11(result, a2 + 3);
        break;
    }
  }
  return result;
}

void type metadata accessor for StorableMessage.CodingKeys()
{
}

unint64_t sub_1CABF136C()
{
  unint64_t result = qword_1EA6115B0[0];
  if (!qword_1EA6115B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA6115B0);
  }
  return result;
}

unint64_t sub_1CABF13BC()
{
  unint64_t result = qword_1EA6116C0[0];
  if (!qword_1EA6116C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA6116C0);
  }
  return result;
}

unint64_t sub_1CABF140C()
{
  unint64_t result = qword_1EBCB4A70;
  if (!qword_1EBCB4A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4A70);
  }
  return result;
}

unint64_t sub_1CABF145C()
{
  unint64_t result = qword_1EBCB4A68;
  if (!qword_1EBCB4A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4A68);
  }
  return result;
}

unint64_t sub_1CABF14AC()
{
  unint64_t result = qword_1EBCB4CA0[0];
  if (!qword_1EBCB4CA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBCB4CA0);
  }
  return result;
}

unint64_t sub_1CABF14FC()
{
  unint64_t result = qword_1EBCB4C98;
  if (!qword_1EBCB4C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4C98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_1CABFCCA8();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2)
{
  *(unsigned char *)unint64_t result = *(unsigned char *)a2;
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

void OUTLINED_FUNCTION_5()
{
  *(unsigned char *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_1CABFC9A8();
}

unsigned char *OUTLINED_FUNCTION_11@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result)
{
  *(unsigned char *)(result + 48) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_1CABFCD58();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_19@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_20@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

__n128 OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, __n128 a11)
{
  _OWORD *v11 = a9;
  v11[1] = a10;
  __n128 result = a11;
  v11[2] = a11;
  return result;
}

uint64_t OUTLINED_FUNCTION_22@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_1CABF16F0()
{
  uint64_t result = sub_1CABF1710();
  qword_1EBCB4EC8 = result;
  return result;
}

uint64_t sub_1CABF1710()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4748);
  uint64_t v0 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  int v2 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v0);
  unsigned int v4 = (char *)v24 - v3;
  uint64_t v5 = sub_1CABFC758();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10 - v9;
  id v12 = objc_msgSend(self, sel_resourcesDirectory);
  sub_1CABFC988();

  sub_1CABFC748();
  swift_bridgeObjectRelease();
  sub_1CABFC738();
  sub_1CABF2230((uint64_t)v2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1CABF2230((uint64_t)v4);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11, v4, v5);
    id v13 = objc_msgSend(self, sel_defaultManager);
    sub_1CABFC728();
    unint64_t v14 = (void *)sub_1CABFC978();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v13, sel_contentsAtPath_, v14);

    if (v15)
    {
      uint64_t v16 = sub_1CABFC778();
      unint64_t v18 = v17;

      sub_1CABFC708();
      swift_allocObject();
      sub_1CABFC6F8();
      sub_1CABF22B8();
      sub_1CABFC6E8();
      uint64_t v21 = OUTLINED_FUNCTION_2_0();
      v22(v21);
      swift_release();
      sub_1CABF0270(v16, v18);
      return v24[1];
    }
    uint64_t v19 = OUTLINED_FUNCTION_2_0();
    v20(v19);
  }
  return 0;
}

uint64_t *sub_1CABF19D8()
{
  if (qword_1EBCB4940 != -1) {
    swift_once();
  }
  return &qword_1EBCB4EC8;
}

uint64_t sub_1CABF1A24()
{
  return sub_1CABFCD28();
}

uint64_t sub_1CABF1A4C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000001CABFE6A0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1CABFCCA8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1CABF1AD4()
{
  return sub_1CABFCD38();
}

unint64_t sub_1CABF1B18()
{
  return 0x80000001CABFE6A0;
}

uint64_t sub_1CABF1B2C()
{
  return 1;
}

uint64_t sub_1CABF1B3C()
{
  return sub_1CABFCD38();
}

unint64_t sub_1CABF1B7C()
{
  return 0xD000000000000011;
}

uint64_t sub_1CABF1BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_1CABF1A4C(a1, a2);
  *a3 = result != 0;
  return result;
}

void sub_1CABF1BD0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1CABF1BDC(uint64_t a1)
{
  sub_1CABF1D98();
  return MEMORY[0x1F41862A8](a1);
}

uint64_t sub_1CABF1C18(uint64_t a1)
{
  sub_1CABF1D98();
  return MEMORY[0x1F41862B0](a1);
}

uint64_t MetricConfiguration.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611240);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF1D98();
  sub_1CABFCD58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611248);
  sub_1CABF1F50(&qword_1EA611250);
  sub_1CABFCC58();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
}

unint64_t sub_1CABF1D98()
{
  unint64_t result = qword_1EA6117D8[0];
  if (!qword_1EA6117D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA6117D8);
  }
  return result;
}

void *MetricConfiguration.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611258);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1CABF1D98();
  sub_1CABFCD48();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611248);
    sub_1CABF1F50(&qword_1EA611260);
    sub_1CABFCBF8();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v3);
    uint64_t v9 = v11;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_1CABF1F50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA611248);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1CABF1FB4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = MetricConfiguration.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1CABF1FE0(void *a1)
{
  return MetricConfiguration.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for MetricConfiguration()
{
  return &type metadata for MetricConfiguration;
}

uint64_t getEnumTagSinglePayload for MetricConfiguration.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MetricConfiguration.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1CABF2100);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1CABF2128()
{
  return 0;
}

ValueMetadata *type metadata accessor for MetricConfiguration.CodingKeys()
{
  return &type metadata for MetricConfiguration.CodingKeys;
}

unint64_t sub_1CABF2144()
{
  unint64_t result = qword_1EA6119E0[0];
  if (!qword_1EA6119E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA6119E0);
  }
  return result;
}

unint64_t sub_1CABF2194()
{
  unint64_t result = qword_1EA611AF0;
  if (!qword_1EA611AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA611AF0);
  }
  return result;
}

unint64_t sub_1CABF21E4()
{
  unint64_t result = qword_1EA611AF8[0];
  if (!qword_1EA611AF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA611AF8);
  }
  return result;
}

uint64_t sub_1CABF2230(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4748);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_1CABF22B8()
{
  unint64_t result = qword_1EA611268;
  if (!qword_1EA611268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA611268);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t sub_1CABF2328(uint64_t a1)
{
  sub_1CABF0E48(a1, v34);
  uint64_t v1 = v34[0];
  unint64_t v2 = v34[4];
  uint64_t v26 = v34[1];
  int64_t v27 = (unint64_t)(v34[2] + 64) >> 6;
  int64_t v28 = v34[3];
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  while (v2)
  {
    unint64_t v5 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    unint64_t v6 = v5 | (v28 << 6);
LABEL_20:
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1CABECB70(*(void *)(v1 + 56) + 32 * v6, (uint64_t)v33);
    *(void *)&long long v32 = v13;
    *((void *)&v32 + 1) = v12;
    long long v30 = v32;
    v31[0] = v33[0];
    v31[1] = v33[1];
    long long v14 = v32;
    sub_1CABECB70((uint64_t)v31, (uint64_t)v29);
    sub_1CABF2844();
    swift_bridgeObjectRetain();
    if (swift_dynamicCast())
    {
      uint64_t v15 = v35;
      swift_bridgeObjectRetain();
      sub_1CABECEF8((uint64_t)&v30);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1CABF2894(0, *(void *)(v4 + 16) + 1, 1, v4);
        uint64_t v4 = result;
      }
      unint64_t v17 = *(void *)(v4 + 16);
      unint64_t v16 = *(void *)(v4 + 24);
      if (v17 >= v16 >> 1)
      {
        uint64_t result = (uint64_t)sub_1CABF2894((char *)(v16 > 1), v17 + 1, 1, v4);
        uint64_t v4 = result;
      }
      *(void *)(v4 + 16) = v17 + 1;
      uint64_t v18 = v4 + 24 * v17;
      *(_OWORD *)(v18 + 32) = v14;
      *(void *)(v18 + 48) = v15;
    }
    else
    {
      os_log_type_t v19 = sub_1CABFCA18();
      uint64_t result = (uint64_t)ii_default_log_handle();
      if (!result) {
        goto LABEL_33;
      }
      long long v20 = result;
      sub_1CABECB70((uint64_t)v31, (uint64_t)v29);
      os_log_type_t v21 = v19;
      if (os_log_type_enabled(v20, v19))
      {
        uint64_t v22 = swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v35 = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        __swift_project_boxed_opaque_existential_0(v29, v29[3]);
        swift_getDynamicType();
        uint64_t v24 = sub_1CABFCD88();
        *(void *)(v22 + 4) = sub_1CABEBAA0(v24, v25, &v35);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
        _os_log_impl(&dword_1CABE8000, v20, v21, "CABackend: failed to convert item of type %s to NSObject", (uint8_t *)v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1CB79E890](v23, -1, -1);
        MEMORY[0x1CB79E890](v22, -1, -1);
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      }
      uint64_t result = sub_1CABECEF8((uint64_t)&v30);
    }
  }
  int64_t v7 = v28 + 1;
  if (!__OFADD__(v28, 1))
  {
    if (v7 >= v27) {
      goto LABEL_31;
    }
    unint64_t v8 = *(void *)(v26 + 8 * v7);
    int64_t v9 = v28 + 1;
    if (!v8)
    {
      int64_t v9 = v28 + 2;
      if (v28 + 2 >= v27) {
        goto LABEL_31;
      }
      unint64_t v8 = *(void *)(v26 + 8 * v9);
      if (!v8)
      {
        int64_t v9 = v28 + 3;
        if (v28 + 3 >= v27) {
          goto LABEL_31;
        }
        unint64_t v8 = *(void *)(v26 + 8 * v9);
        if (!v8)
        {
          int64_t v9 = v28 + 4;
          if (v28 + 4 >= v27) {
            goto LABEL_31;
          }
          unint64_t v8 = *(void *)(v26 + 8 * v9);
          if (!v8)
          {
            int64_t v9 = v28 + 5;
            if (v28 + 5 >= v27) {
              goto LABEL_31;
            }
            unint64_t v8 = *(void *)(v26 + 8 * v9);
            if (!v8)
            {
              int64_t v10 = v28 + 6;
              while (v10 < v27)
              {
                unint64_t v8 = *(void *)(v26 + 8 * v10++);
                if (v8)
                {
                  int64_t v9 = v10 - 1;
                  goto LABEL_19;
                }
              }
LABEL_31:
              swift_release();
              return v4;
            }
          }
        }
      }
    }
LABEL_19:
    unint64_t v2 = (v8 - 1) & v8;
    unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
    int64_t v28 = v9;
    goto LABEL_20;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1CABF2700(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611278);
    uint64_t v1 = sub_1CABFCBA8();
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1CABF2B48(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1CABF27AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1CABF2328(a3);
  uint64_t v4 = sub_1CABF2700(v3);
  unint64_t v5 = (void *)sub_1CABFC978();
  sub_1CABF2844();
  unint64_t v6 = (void *)sub_1CABFC918();
  AnalyticsSendEvent();

  return v4;
}

unint64_t sub_1CABF2844()
{
  unint64_t result = qword_1EA611270;
  if (!qword_1EA611270)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA611270);
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsDispatcher()
{
  return &type metadata for CoreAnalyticsDispatcher;
}

char *sub_1CABF2894(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611288);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CABF2AAC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CABF298C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1CABF298C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611290);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CABFCBB8();
  __break(1u);
  return result;
}

char *sub_1CABF2AAC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CABFCBB8();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

void sub_1CABF2B48(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (unint64_t i = (void **)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    uint64_t v7 = (uint64_t)*(i - 2);
    uint64_t v6 = (uint64_t)*(i - 1);
    uint64_t v8 = *i;
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    id v10 = v8;
    unint64_t v12 = sub_1CABEC258(v7, v6);
    uint64_t v13 = v9[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1CABFCCB8();
      __break(1u);
      goto LABEL_20;
    }
    char v16 = v11;
    if (v9[3] < v15) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611280);
      sub_1CABFCB48();
      if (v16) {
        goto LABEL_14;
      }
    }
LABEL_10:
    os_log_type_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    long long v20 = (uint64_t *)(v19[6] + 16 * v12);
    uint64_t *v20 = v7;
    v20[1] = v6;
    *(void *)(v19[7] + 8 * v12) = v10;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_18;
    }
    v19[2] = v23;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1CABF2E1C(v15, a2 & 1);
  unint64_t v17 = sub_1CABEC258(v7, v6);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v24 = (void *)swift_allocError();
  swift_willThrow();
  id v25 = v24;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA6111D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_20:
  sub_1CABFCA98();
  sub_1CABFC9A8();
  sub_1CABFCB28();
  sub_1CABFC9A8();
  sub_1CABFCB68();
  __break(1u);
}

uint64_t sub_1CABF2E1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611278);
  char v38 = a2;
  uint64_t v6 = sub_1CABFCB98();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
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
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    long long v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void **)(*(void *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v24 = v23;
    }
    sub_1CABFCD18();
    sub_1CABFC998();
    uint64_t result = sub_1CABFCD38();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
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
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t v33 = (void *)(*(void *)(v7 + 48) + 16 * v28);
    *uint64_t v33 = v22;
    v33[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v28) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v36)
    {
      swift_release();
      uint64_t v3 = v35;
      unint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    unint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v37 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v37 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v36)
  {
    unint64_t v18 = *(void *)(v37 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v36) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v37 + 8 * v13);
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
  uint64_t v3 = v35;
LABEL_34:
  if (v38)
  {
    uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
    if (v34 >= 64) {
      sub_1CABEC6B0(0, (unint64_t)(v34 + 63) >> 6, v17);
    }
    else {
      *unint64_t v17 = -1 << v34;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1CABF311C()
{
  uint64_t v0 = sub_1CABFC908();
  __swift_allocate_value_buffer(v0, qword_1EA611E10);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA611E10);
  return sub_1CABFC8F8();
}

uint64_t sub_1CABF3194()
{
  if (qword_1EA611B80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1CABFC908();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EA611E10);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_1CABF3294()
{
  return sub_1CABEE700();
}

uint64_t sub_1CABF329C()
{
  OUTLINED_FUNCTION_1_1();
  if (v2) {
    unint64_t v3 = 0x80000001CABFE710;
  }
  else {
    unint64_t v3 = 0xEE006C69616D2E65;
  }
  if (v1 >= 2) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = v0;
  }
  OUTLINED_FUNCTION_1_1();
  if (!v13)
  {
    uint64_t v8 = v11;
    uint64_t v9 = v12;
  }
  if (v10 >= 2) {
    uint64_t v14 = v8;
  }
  else {
    uint64_t v14 = v6;
  }
  if (v10 >= 2) {
    uint64_t v15 = v9;
  }
  else {
    uint64_t v15 = v7;
  }
  if (v5 == v14 && v4 == v15) {
    char v17 = 1;
  }
  else {
    char v17 = sub_1CABFCCA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17 & 1;
}

unint64_t sub_1CABF337C(unsigned __int8 a1)
{
  unint64_t v1 = 0x6C7070612E6D6F63;
  if (a1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (a1 - 1 >= 2) {
    return v1;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_1CABF33E8()
{
  return sub_1CABF329C();
}

unint64_t sub_1CABF33F4()
{
  return sub_1CABF337C(*v0);
}

uint64_t sub_1CABF33FC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001CABFE730 || (OUTLINED_FUNCTION_1() & 1) != 0) {
    return 2;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x80000001CABFE710 || (OUTLINED_FUNCTION_1() & 1) != 0) {
    return 3;
  }
  if (OUTLINED_FUNCTION_1()) {
    return 1;
  }
  if (a1 == 0x6C7070612E6D6F63 && a2 == 0xEE006C69616D2E65) {
    return 0;
  }
  if (OUTLINED_FUNCTION_1()) {
    return 0;
  }
  return 4;
}

uint64_t getEnumTagSinglePayload for BundleId(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BundleId(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1CABF3684);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BundleId()
{
  return &type metadata for BundleId;
}

void sub_1CABF36D4()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v38 = v1;
  uint64_t v44 = v4;
  uint64_t v43 = sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  uint64_t v41 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9_0();
  uint64_t v42 = v7;
  OUTLINED_FUNCTION_48();
  MEMORY[0x1F4188790](v8);
  unsigned int v10 = (char *)v36 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4768);
  MEMORY[0x1F4188790](v11 - 8);
  int v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4760);
  MEMORY[0x1F4188790](v14 - 8);
  OUTLINED_FUNCTION_35();
  sub_1CABFC6D8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v39 = v16;
  uint64_t v40 = v15;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_37();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4758);
  MEMORY[0x1F4188790](v17 - 8);
  OUTLINED_FUNCTION_50();
  uint64_t v37 = v18;
  uint64_t v19 = sub_1CABFC818();
  OUTLINED_FUNCTION_0_0();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_21_0();
  uint64_t v23 = sub_1CABFC858();
  v36[2] = v23;
  uint64_t v45 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_20_0();
  MEMORY[0x1F4188790](v24);
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v2, *MEMORY[0x1E4F27B00], v19);
  sub_1CABFC828();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v2, v19);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v23);
  uint64_t v25 = sub_1CABFC868();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v25);
  uint64_t v26 = v41;
  sub_1CABFC6C8();
  sub_1CABFC838();
  uint64_t v27 = v37;
  sub_1CABFC848();
  unint64_t v28 = *(void (**)(void))(v26 + 8);
  v36[1] = v10;
  char v29 = v10;
  uint64_t v30 = v43;
  ((void (*)(char *, uint64_t))v28)(v29, v43);
  OUTLINED_FUNCTION_51();
  v31();
  uint64_t v40 = v0;
  OUTLINED_FUNCTION_1_2();
  v32();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_1_2();
  v33();
  if (__swift_getEnumTagSinglePayload(v27, 1, v30) == 1)
  {
    sub_1CABFC838();
    sub_1CABFC7B8();
    OUTLINED_FUNCTION_29();
    v28();
    OUTLINED_FUNCTION_29();
    v28();
    uint64_t v34 = *(void (**)(void))(v45 + 8);
    OUTLINED_FUNCTION_14_0();
    v34();
    OUTLINED_FUNCTION_14_0();
    v34();
    sub_1CABF3BE0(v27);
  }
  else
  {
    OUTLINED_FUNCTION_29();
    v28();
    uint64_t v35 = *(void (**)(void))(v45 + 8);
    OUTLINED_FUNCTION_14_0();
    v35();
    OUTLINED_FUNCTION_14_0();
    v35();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v44, v27, v30);
  }
  OUTLINED_FUNCTION_6_0();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1CABF3BE0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4758);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1CABF3C40()
{
  OUTLINED_FUNCTION_24();
  id v1 = objc_allocWithZone(v0);
  sub_1CABF3C88();
}

void sub_1CABF3C88()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_24();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4770);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_37();
  type metadata accessor for MetricMessage();
  id v7 = v0;
  id v8 = v3;
  sub_1CABFC8A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))((uint64_t)v7 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricStorage_stream, v1, v4);

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for MetricStorage(0);
  objc_msgSendSuper2(&v9, sel_init);

  OUTLINED_FUNCTION_6_0();
}

uint64_t type metadata accessor for MetricStorage(uint64_t a1)
{
  return sub_1CABF9B50(a1, (uint64_t *)&unk_1EBCB4A00);
}

uint64_t sub_1CABF3DAC()
{
  OUTLINED_FUNCTION_24();
  sub_1CABF9DA4(0, &qword_1EBCB4788);
  uint64_t v3 = self;
  uint64_t v4 = (void *)OUTLINED_FUNCTION_41();
  id v5 = objc_msgSend(v3, sel_suggestionsSubdirectory_, v4);

  uint64_t v6 = sub_1CABFC988();
  uint64_t v8 = v7;

  id v9 = sub_1CABF3E94(v6, v8, 102400);
  unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, id))(v0 + 88);
  return v10(v2, v1, v9);
}

id sub_1CABF3E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = (void *)sub_1CABFC978();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithStoreBasePath_segmentSize_, v5, a3);

  return v6;
}

id sub_1CABF3F48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetricStorage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1CABF3FE8()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_1CABFC978();
  id v2 = objc_msgSend(v0, sel_suggestionsDirectoryFile_, v1);

  uint64_t v3 = sub_1CABFC988();
  uint64_t v5 = v4;

  qword_1EBCB4EE8 = v3;
  unk_1EBCB4EF0 = v5;
}

uint64_t MetricStore.enrichmentProviders.getter()
{
  return sub_1CABF40F0();
}

uint64_t MetricStore.enrichmentProviders.setter(uint64_t a1)
{
  return sub_1CABF413C(a1, &OBJC_IVAR___IISMetricStore_enrichmentProviders);
}

uint64_t (*MetricStore.enrichmentProviders.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MetricStore.messageListeners.getter()
{
  return sub_1CABF40F0();
}

uint64_t sub_1CABF40F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetricStore.messageListeners.setter(uint64_t a1)
{
  return sub_1CABF413C(a1, &OBJC_IVAR___IISMetricStore_messageListeners);
}

uint64_t sub_1CABF413C(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MetricStore.messageListeners.modify())()
{
  return j_j__swift_endAccess;
}

id sub_1CABF41D4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MetricStore(0)), sel_init);
  static MetricStore.sharedInstance = (uint64_t)result;
  return result;
}

uint64_t *MetricStore.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1EBCB49D8 != -1) {
    swift_once();
  }
  return &static MetricStore.sharedInstance;
}

id static MetricStore.sharedInstance.getter()
{
  if (qword_1EBCB49D8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MetricStore.sharedInstance;
  return v0;
}

id MetricStore.__allocating_init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(a8, a1, a2, a3, a4, a5, a6, a7);
}

id MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v14 = objc_allocWithZone((Class)type metadata accessor for MetricStorage(0));
  id v15 = a4;
  uint64_t v16 = v8;
  sub_1CABF3C88();
  uint64_t v18 = v17;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F93B70]), sel_initWithGuardedData_, v17);

  *(void *)&v16[OBJC_IVAR___IISMetricStore_storageLock] = v19;
  *(void *)&v16[OBJC_IVAR___IISMetricStore_enrichmentProviders] = a5;
  *(void *)&v16[OBJC_IVAR___IISMetricStore_messageListeners] = a6;
  uint64_t v20 = sub_1CABFC808();
  uint64_t v21 = *(void *)(v20 - 8);
  OUTLINED_FUNCTION_1_2();
  v22();
  *(void *)&v16[OBJC_IVAR___IISMetricStore_configuration] = a8;
  *(double *)&v16[OBJC_IVAR___IISMetricStore_sendInterval] = a1;

  v27.receiver = v16;
  v27.super_class = ObjectType;
  id v23 = objc_msgSendSuper2(&v27, sel_init);

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a7, v20);
  return v23;
}

void sub_1CABF4518()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v56 = v2;
  Class v57 = v0;
  uint64_t v55 = v3;
  uint64_t v58 = sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v53 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9_0();
  uint64_t v52 = v10;
  OUTLINED_FUNCTION_48();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  id v14 = (char *)&v50 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v50 - v15;
  sub_1CABF9DA4(0, &qword_1EBCB4788);
  id v17 = self;
  uint64_t v18 = (void *)OUTLINED_FUNCTION_41();
  id v19 = objc_msgSend(v17, sel_suggestionsSubdirectory_, v18);

  uint64_t v20 = sub_1CABFC988();
  uint64_t v22 = v21;

  id v54 = sub_1CABF3E94(v20, v22, 102400);
  id v23 = objc_msgSend(self, sel_defaultManager);
  if (qword_1EBCB49E0 != -1) {
    swift_once();
  }
  uint64_t v24 = (void *)sub_1CABFC978();
  id v25 = objc_msgSend(v23, sel_contentsAtPath_, v24);

  if (v25)
  {
    uint64_t v26 = v16;
    uint64_t v27 = sub_1CABFC778();
    unint64_t v29 = v28;

    sub_1CABFC688();
    swift_allocObject();
    sub_1CABFC678();
    sub_1CABF9CB0(&qword_1EBCB4740, MEMORY[0x1E4F27928]);
    sub_1CABFC668();
    sub_1CABF0270(v27, v29);
    swift_release();
    uint64_t v43 = v53;
    uint64_t v16 = v26;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v26, v14, v7);
    uint64_t v44 = v7;
    uint64_t v45 = v52;
  }
  else
  {
    sub_1CABF4AEC();
    uint64_t v30 = (void *)swift_allocError();
    *BOOL v31 = 2;
    swift_willThrow();
    sub_1CABF3194();
    OUTLINED_FUNCTION_1_2();
    v32();
    id v33 = v30;
    id v34 = v30;
    uint64_t v35 = sub_1CABFC8E8();
    os_log_type_t v36 = sub_1CABFCA18();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v51 = v7;
      uint64_t v38 = (uint8_t *)v37;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v50 = v1;
      uint64_t v59 = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      swift_getErrorValue();
      uint64_t v40 = sub_1CABFCCC8();
      uint64_t v42 = sub_1CABEBAA0(v40, v41, &v59);
      OUTLINED_FUNCTION_57(v42);
      sub_1CABFCA58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CABE8000, v35, v36, "MetricStore: failed to decode start date from local file, setting start date of tomorrow UTC: %s", v38, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      uint64_t v7 = v51;
      OUTLINED_FUNCTION_3_0();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v50, v58);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v58);
    }
    uint64_t v45 = v52;
    sub_1CABFC7F8();
    sub_1CABF36D4();
    uint64_t v43 = v53;
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v45, v7);
    sub_1CABF4B38();

    uint64_t v44 = v7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4798);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_1CABFDEF0;
  type metadata accessor for AppLaunchCounter();
  *(void *)(v46 + 32) = sub_1CABEBA80();
  uint64_t v59 = v46;
  sub_1CABFC9E8();
  uint64_t v47 = v59;
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_1_2();
  v48();
  uint64_t v49 = *sub_1CABF19D8();
  objc_allocWithZone(v57);
  swift_bridgeObjectRetain();
  MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(2419200.0, v55, v56, v54, v47, MEMORY[0x1E4FBC860], v45, v49);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v44);
  OUTLINED_FUNCTION_6_0();
}

unint64_t sub_1CABF4AEC()
{
  unint64_t result = qword_1EBCB4780;
  if (!qword_1EBCB4780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCB4780);
  }
  return result;
}

void sub_1CABF4B38()
{
  OUTLINED_FUNCTION_7_0();
  sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_34();
  sub_1CABFC758();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_21_0();
  sub_1CABFC6B8();
  swift_allocObject();
  sub_1CABFC6A8();
  sub_1CABFC808();
  sub_1CABF9CB0(&qword_1EA6112A0, MEMORY[0x1E4F27928]);
  uint64_t v2 = sub_1CABFC698();
  unint64_t v4 = v3;
  if (qword_1EBCB49E0 != -1) {
    swift_once();
  }
  sub_1CABFC718();
  sub_1CABFC788();
  uint64_t v5 = OUTLINED_FUNCTION_30();
  v6(v5);
  sub_1CABF0270(v2, v4);
  swift_release();
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1CABF4E94(uint64_t (*a1)(unint64_t, unint64_t))
{
  swift_getObjectType();
  uint64_t v2 = a1(0xD00000000000001BLL, 0x80000001CABFE750);
  swift_deallocPartialClassInstance();
  return v2;
}

uint64_t MetricStore.saveMessage(_:backend:messageIdentifier:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  type metadata accessor for MetricMessage();
  unint64_t v10 = sub_1CABEF2A4(a1);
  swift_bridgeObjectRetain();
  id v11 = sub_1CABEEF50(v10, a3, a4, a2);
  uint64_t v12 = *(void **)(v5 + OBJC_IVAR___IISMetricStore_storageLock);
  uint64_t v13 = OUTLINED_FUNCTION_25();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = OUTLINED_FUNCTION_23();
  *(void *)(v14 + 16) = sub_1CABF9118;
  *(void *)(v14 + 24) = v13;
  v18[4] = sub_1CABF91C4;
  v18[5] = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 1107296256;
  v18[2] = sub_1CABF54A4;
  v18[3] = &block_descriptor_0;
  uint64_t v15 = _Block_copy(v18);
  id v16 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_runWithLockAcquired_, v15);

  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_release();
    return a1;
  }
  return result;
}

unint64_t sub_1CABF512C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCB47D0);
    uint64_t v2 = (void *)sub_1CABFCBA8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  uint64_t v9 = (unint64_t *)&qword_1EA611270;
  unint64_t v10 = 0x1E4FBA8A8uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v35 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v34 << 6);
      }
      else
      {
        int64_t v12 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v32)
        {
LABEL_31:
          sub_1CABECDE4();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v33 + 8 * v12);
        int64_t v14 = v34 + 1;
        if (!v13)
        {
          int64_t v14 = v34 + 2;
          if (v34 + 2 >= v32) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v33 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v34 + 3;
            if (v34 + 3 >= v32) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v33 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v34 + 4;
              if (v34 + 4 >= v32) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v33 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v34 + 5;
                if (v34 + 5 >= v32) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v32) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v33 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v34 + 5;
              }
            }
          }
        }
LABEL_25:
        int64_t v34 = v14;
        uint64_t v35 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      id v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      id v17 = *(void **)(*(void *)(v1 + 56) + 8 * v11);
      uint64_t v36 = *v16;
      uint64_t v37 = v16[1];
      sub_1CABF9DA4(0, v9);
      swift_bridgeObjectRetain();
      id v18 = v17;
      swift_dynamicCast();
      sub_1CABECDEC(v6, v7);
      sub_1CABECDEC(v7, v41);
      sub_1CABECDEC(v41, &v39);
      unint64_t result = sub_1CABEC258(v36, v37);
      unint64_t v19 = result;
      if ((v20 & 1) == 0) {
        break;
      }
      uint64_t v21 = v7;
      uint64_t v22 = v6;
      uint64_t v23 = v1;
      unint64_t v24 = v10;
      id v25 = v9;
      uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v26 = v36;
      v26[1] = v37;
      uint64_t v9 = v25;
      unint64_t v10 = v24;
      uint64_t v1 = v23;
      uint64_t v6 = v22;
      uint64_t v7 = v21;
      uint64_t v27 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
      unint64_t result = (unint64_t)sub_1CABECDEC(&v39, v27);
      unint64_t v5 = v35;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v28 = v36;
    v28[1] = v37;
    unint64_t result = (unint64_t)sub_1CABECDEC(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_33;
    }
    v2[2] = v31;
    unint64_t v5 = v35;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_1CABF54A4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

Swift::Void __swiftcall MetricStore.removeAllMetrics(withPrefix:)(Swift::String withPrefix)
{
  object = withPrefix._object;
  uint64_t countAndFlagsBits = withPrefix._countAndFlagsBits;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___IISMetricStore_storageLock);
  uint64_t v5 = OUTLINED_FUNCTION_23();
  *(void *)(v5 + 16) = countAndFlagsBits;
  *(void *)(v5 + 24) = object;
  uint64_t v6 = OUTLINED_FUNCTION_23();
  *(void *)(v6 + 16) = sub_1CABF923C;
  *(void *)(v6 + 24) = v5;
  v8[4] = sub_1CABF9EA0;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1CABF54A4;
  v8[3] = &block_descriptor_13_0;
  uint64_t v7 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_runWithLockAcquired_, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v4) {
    __break(1u);
  }
}

uint64_t MetricStore.registerEnrichmentProvider(_:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = swift_unknownObjectRetain();
  MEMORY[0x1CB79DE30](v1);
  sub_1CABF8DE0(*(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10));
  OUTLINED_FUNCTION_52();
  sub_1CABFCA08();
  sub_1CABFC9E8();
  return swift_endAccess();
}

uint64_t MetricStore.registerMessageListener(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_23();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  OUTLINED_FUNCTION_11_0();
  swift_retain();
  sub_1CABF8D94();
  uint64_t v6 = *(char **)(*v2 + 16);
  sub_1CABF8E0C(v6);
  uint64_t v7 = *v2;
  *(void *)(v7 + 16) = v6 + 1;
  uint64_t v8 = v7 + 16 * (void)v6;
  *(void *)(v8 + 32) = sub_1CABF92DC;
  *(void *)(v8 + 40) = v5;
  return swift_endAccess();
}

uint64_t sub_1CABF5990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)sub_1CABFC978();
  uint64_t v6 = (void *)sub_1CABFC918();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *, void *))(a4 + 16))(a4, v5, v6);

  return v7;
}

void MetricStore.sendMessages(shouldContinue:)()
{
  OUTLINED_FUNCTION_31();
  uint64_t v1 = v0;
  id v3 = v2;
  uint64_t v62 = sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  uint64_t v60 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9_0();
  uint64_t v59 = v6;
  OUTLINED_FUNCTION_48();
  MEMORY[0x1F4188790](v7);
  v61 = (char *)&v58 - v8;
  uint64_t v9 = sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  int64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  id v18 = (char *)&v58 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v58 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v58 - v22;
  sub_1CABF5F4C();
  if (v24)
  {
    id v25 = (void *)sub_1CABF68C4(v24);
    uint64_t v26 = swift_bridgeObjectRelease();
    if (v3(v26))
    {
      uint64_t v27 = sub_1CABF6EA4(v25, v3);
      swift_bridgeObjectRelease();
      if (v27)
      {
        sub_1CABF71E0();
        uint64_t v29 = v28;
        uint64_t v30 = swift_bridgeObjectRelease();
        if (v29)
        {
          MEMORY[0x1F4188790](v30);
          *(&v58 - 2) = (void (*)(uint64_t, char *, uint64_t))v1;
          sub_1CABF8A64(v29, (void (*)(uint64_t, uint64_t, uint64_t))sub_1CABF9320);
          swift_bridgeObjectRelease();
          uint64_t v31 = &v1[OBJC_IVAR___IISMetricStore_windowStartDate];
          OUTLINED_FUNCTION_10_0();
          uint64_t v32 = v59;
          uint64_t v33 = v60;
          uint64_t v58 = *(void (**)(uint64_t, char *, uint64_t))(v60 + 16);
          uint64_t v34 = v62;
          v58(v59, v31, v62);
          uint64_t v35 = v61;
          sub_1CABFC7B8();
          uint64_t v36 = *(void (**)(void))(v33 + 8);
          OUTLINED_FUNCTION_16_0();
          v36();
          sub_1CABF79E0();
          OUTLINED_FUNCTION_16_0();
          v36();
          uint64_t v37 = (void (*)(char *, char *, uint64_t))v58;
          v58(v32, v31, v34);
          sub_1CABFC7B8();
          OUTLINED_FUNCTION_16_0();
          v36();
          swift_beginAccess();
          (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v31, v35, v34);
          swift_endAccess();
          v37(v35, v31, v34);
          sub_1CABF4B38();
          OUTLINED_FUNCTION_16_0();
          v36();
        }
        else
        {
          sub_1CABF3194();
          OUTLINED_FUNCTION_15_0();
          OUTLINED_FUNCTION_1_2();
          v54();
          uint64_t v55 = sub_1CABFC8E8();
          os_log_type_t v56 = sub_1CABFCA28();
          if (OUTLINED_FUNCTION_8_0(v56))
          {
            Class v57 = (uint8_t *)OUTLINED_FUNCTION_13_0();
            *(_WORD *)Class v57 = 0;
            _os_log_impl(&dword_1CABE8000, v55, (os_log_type_t)v21, "MetricStore: deferring post-enrichment.", v57, 2u);
            OUTLINED_FUNCTION_3_0();
          }

          (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v9);
        }
      }
      else
      {
        sub_1CABF3194();
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_1_2();
        v48();
        uint64_t v49 = (void *)sub_1CABFC8E8();
        os_log_type_t v50 = sub_1CABFCA28();
        if (OUTLINED_FUNCTION_8_0(v50))
        {
          uint64_t v51 = (_WORD *)OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_42(v51);
          OUTLINED_FUNCTION_4_0(&dword_1CABE8000, v52, v53, "MetricStore: deferring after generation of missing messages.");
          OUTLINED_FUNCTION_3_0();
        }

        (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v9);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1CABF3194();
      OUTLINED_FUNCTION_15_0();
      OUTLINED_FUNCTION_1_2();
      v44();
      uint64_t v45 = sub_1CABFC8E8();
      os_log_type_t v46 = sub_1CABFCA28();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)OUTLINED_FUNCTION_13_0();
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl(&dword_1CABE8000, v45, v46, "MetricStore: deferring after grouping of messages.", v47, 2u);
        OUTLINED_FUNCTION_3_0();
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v23, v9);
    }
  }
  else
  {
    sub_1CABF3194();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_1_2();
    v38();
    long long v39 = (void *)sub_1CABFC8E8();
    os_log_type_t v40 = sub_1CABFCA28();
    if (OUTLINED_FUNCTION_8_0(v40))
    {
      unint64_t v41 = (_WORD *)OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_42(v41);
      OUTLINED_FUNCTION_4_0(&dword_1CABE8000, v42, v43, "MetricStore: deferring sending of messages fetching messages.");
      OUTLINED_FUNCTION_3_0();
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v9);
  }
  OUTLINED_FUNCTION_43();
}

void sub_1CABF5F4C()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_24();
  sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  uint64_t v91 = v4;
  uint64_t v93 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_50();
  uint64_t v89 = v5;
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = 0;
  uint64_t v7 = OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611098);
  *(void *)(v7 + 16) = sub_1CABFC948();
  uint64_t v8 = OUTLINED_FUNCTION_25();
  type metadata accessor for MetricMessage();
  *(void *)(v8 + 16) = sub_1CABFC948();
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(void **)&v0[OBJC_IVAR___IISMetricStore_storageLock];
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v0;
  v11[3] = v6;
  v11[4] = v2;
  v11[5] = v1;
  v11[6] = v7;
  v11[7] = v8;
  uint64_t v12 = OUTLINED_FUNCTION_23();
  *(void *)(v12 + 16) = sub_1CABF93C0;
  *(void *)(v12 + 24) = v11;
  v97[4] = sub_1CABF9EA0;
  v97[5] = v12;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 1107296256;
  v97[2] = sub_1CABF54A4;
  v97[3] = &block_descriptor_35;
  uint64_t v13 = _Block_copy(v97);
  uint64_t v14 = v0;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_runWithLockAcquired_, v13);
  _Block_release(v13);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t v15 = swift_release();
  if (v13) {
    goto LABEL_73;
  }
  if ((v2(v15) & 1) == 0 || (OUTLINED_FUNCTION_10_0(), *(unsigned char *)(v6 + 16) == 1))
  {
    sub_1CABF3194();
    OUTLINED_FUNCTION_1_2();
    v16();
    uint64_t v17 = sub_1CABFC8E8();
    os_log_type_t v18 = sub_1CABFCA28();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_13_0();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1CABE8000, v17, v18, "MetricStore: deferring fetching of grouped messages.", v19, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v89, v93);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
LABEL_7:
    OUTLINED_FUNCTION_6_0();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112A8);
  uint64_t v84 = sub_1CABFC948();
  OUTLINED_FUNCTION_10_0();
  uint64_t v81 = *(void *)(v7 + 16) + 64;
  OUTLINED_FUNCTION_19_0();
  unint64_t v22 = v21 & v20;
  uint64_t v82 = v23;
  swift_bridgeObjectRetain();
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (!v22) {
    goto LABEL_11;
  }
  while (2)
  {
    uint64_t v85 = (v22 - 1) & v22;
    uint64_t v86 = v25;
    unint64_t v26 = __clz(__rbit64(v22)) | (v25 << 6);
LABEL_29:
    uint64_t v38 = (uint64_t *)(*(void *)(v82 + 48) + 16 * v26);
    uint64_t v39 = *(void *)(*(void *)(v82 + 56) + 8 * v26);
    uint64_t v88 = *v38;
    uint64_t v92 = v38[1];
    uint64_t v94 = v39 + 64;
    OUTLINED_FUNCTION_19_0();
    uint64_t v42 = v41 & v40;
    int64_t v95 = (unint64_t)(v43 + 63) >> 6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v44 = 0;
    while (1)
    {
      if (v42)
      {
        OUTLINED_FUNCTION_58();
        unint64_t v46 = v45 | (v44 << 6);
        goto LABEL_46;
      }
      int64_t v47 = v44 + 1;
      if (__OFADD__(v44, 1))
      {
        __break(1u);
        goto LABEL_67;
      }
      if (v47 >= v95) {
        goto LABEL_10;
      }
      unint64_t v48 = *(void *)(v94 + 8 * v47);
      ++v44;
      if (!v48)
      {
        int64_t v44 = v47 + 1;
        if (v47 + 1 >= v95) {
          goto LABEL_10;
        }
        unint64_t v48 = *(void *)(v94 + 8 * v44);
        if (!v48)
        {
          int64_t v44 = v47 + 2;
          if (v47 + 2 >= v95) {
            goto LABEL_10;
          }
          unint64_t v48 = *(void *)(v94 + 8 * v44);
          if (!v48) {
            break;
          }
        }
      }
LABEL_45:
      uint64_t v42 = (v48 - 1) & v48;
      unint64_t v46 = __clz(__rbit64(v48)) + (v44 << 6);
LABEL_46:
      os_log_type_t v50 = (uint64_t *)(*(void *)(v39 + 48) + 16 * v46);
      uint64_t v51 = *v50;
      uint64_t v52 = v50[1];
      uint64_t v53 = *(void *)(*(void *)(v39 + 56) + 8 * v46);
      swift_beginAccess();
      uint64_t v54 = *(void *)v9;
      uint64_t v55 = *(void *)(*(void *)v9 + 16);
      swift_bridgeObjectRetain();
      if (!v55) {
        goto LABEL_49;
      }
      swift_bridgeObjectRetain();
      unint64_t v56 = sub_1CABEC258(v51, v52);
      if (v57)
      {
        uint64_t v58 = *(void **)(*(void *)(v54 + 56) + 8 * v56);
        swift_endAccess();
        id v59 = v58;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRetain();
        id v87 = v59;
        sub_1CABF93D4((uint64_t)v24);
        swift_isUniquelyReferenced_nonNull_native();
        v96 = (void *)v84;
        unint64_t v90 = sub_1CABEC258(v88, v92);
        OUTLINED_FUNCTION_54();
        if (v29) {
          goto LABEL_68;
        }
        char v61 = v60;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112B0);
        char v62 = sub_1CABFCB38();
        v63 = v96;
        if (v62)
        {
          unint64_t v90 = sub_1CABEC258(v88, v92);
          if ((v61 & 1) != (v64 & 1)) {
            goto LABEL_75;
          }
        }
        swift_bridgeObjectRelease();
        if ((v61 & 1) == 0)
        {
          swift_bridgeObjectRetain();
          sub_1CABF87D4((uint64_t *)&v96);
          uint64_t v65 = (uint64_t)v96;
          v63[(v90 >> 6) + 8] |= 1 << v90;
          v66 = (uint64_t *)(v63[6] + 16 * v90);
          uint64_t *v66 = v88;
          v66[1] = v92;
          *(void *)(v63[7] + 8 * v90) = v65;
          uint64_t v67 = v63[2];
          BOOL v29 = __OFADD__(v67, 1);
          uint64_t v68 = v67 + 1;
          if (v29) {
            goto LABEL_70;
          }
          v63[2] = v68;
        }
        swift_bridgeObjectRetain();
        uint64_t v69 = v63[7];
        uint64_t v84 = (uint64_t)v63;
        swift_bridgeObjectRelease();
        swift_isUniquelyReferenced_nonNull_native();
        v96 = *(void **)(v69 + 8 * v90);
        uint64_t v70 = (uint64_t)v96;
        uint64_t v83 = v69;
        *(void *)(v69 + 8 * v90) = 0x8000000000000000;
        unint64_t v71 = sub_1CABF93E4((uint64_t)v87);
        if (__OFADD__(*(void *)(v70 + 16), (v72 & 1) == 0)) {
          goto LABEL_69;
        }
        unint64_t v73 = v71;
        char v74 = v72;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112B8);
        if (sub_1CABFCB38())
        {
          unint64_t v75 = sub_1CABF93E4((uint64_t)v87);
          if ((v74 & 1) != (v76 & 1)) {
            goto LABEL_75;
          }
          unint64_t v73 = v75;
        }
        v77 = v96;
        if (v74)
        {
          *(void *)(v96[7] + 8 * v73) = v53;
        }
        else
        {
          OUTLINED_FUNCTION_27((uint64_t)&v96[v73 >> 6]);
          *(void *)(v77[6] + 8 * v73) = v87;
          *(void *)(v77[7] + 8 * v73) = v53;
          uint64_t v78 = v77[2];
          BOOL v29 = __OFADD__(v78, 1);
          uint64_t v79 = v78 + 1;
          if (v29) {
            goto LABEL_71;
          }
          v77[2] = v79;
          id v80 = v87;
        }
        *(void *)(v83 + 8 * v90) = v77;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v24 = sub_1CABF87D4;
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_49:
        swift_endAccess();
        swift_bridgeObjectRelease();
      }
    }
    int64_t v49 = v47 + 3;
    if (v49 < v95)
    {
      unint64_t v48 = *(void *)(v94 + 8 * v49);
      if (!v48)
      {
        while (1)
        {
          int64_t v44 = v49 + 1;
          if (__OFADD__(v49, 1)) {
            break;
          }
          if (v44 >= v95) {
            goto LABEL_10;
          }
          unint64_t v48 = *(void *)(v94 + 8 * v44);
          ++v49;
          if (v48) {
            goto LABEL_45;
          }
        }
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      int64_t v44 = v49;
      goto LABEL_45;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v22 = v85;
    uint64_t v25 = v86;
    if (v85) {
      continue;
    }
    break;
  }
LABEL_11:
  if (__OFADD__(v25, 1))
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_46();
  if (v28 == v29) {
    goto LABEL_65;
  }
  if (*(void *)(v81 + 8 * v27)) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_17_0();
  if (v28 == v29) {
    goto LABEL_65;
  }
  OUTLINED_FUNCTION_28();
  if (v30) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_17_0();
  if (v28 == v29) {
    goto LABEL_65;
  }
  OUTLINED_FUNCTION_28();
  if (v31) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_46();
  if (v28 == v29)
  {
LABEL_65:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_1CABF93D4((uint64_t)v24);
    goto LABEL_7;
  }
  if (*(void *)(v81 + 8 * v32))
  {
LABEL_28:
    OUTLINED_FUNCTION_44();
    uint64_t v85 = v35;
    uint64_t v86 = v36;
    unint64_t v26 = v37 + (v36 << 6);
    goto LABEL_29;
  }
  while (!__OFADD__(v32, 1))
  {
    OUTLINED_FUNCTION_17_0();
    if (v28 == v29) {
      goto LABEL_65;
    }
    OUTLINED_FUNCTION_28();
    uint64_t v32 = v33 + 1;
    if (v34) {
      goto LABEL_28;
    }
  }
LABEL_74:
  __break(1u);
LABEL_75:
  sub_1CABFCCB8();
  __break(1u);
}

uint64_t sub_1CABF68C4(uint64_t a1)
{
  sub_1CABF0E48(a1, v68);
  uint64_t v55 = v68[1];
  int64_t v1 = v68[3];
  uint64_t v2 = v68[4];
  int64_t v56 = (unint64_t)(v68[2] + 64) >> 6;
  uint64_t v57 = v68[0];
  swift_bridgeObjectRetain();
  uint64_t v3 = MEMORY[0x1E4FBC868];
  if (!v2) {
    goto LABEL_3;
  }
LABEL_2:
  OUTLINED_FUNCTION_58();
  unint64_t v5 = v4 | (v1 << 6);
  while (1)
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v57 + 48) + 16 * v5);
    uint64_t v14 = v13[1];
    uint64_t v61 = *v13;
    uint64_t v15 = *(void *)(*(void *)(v57 + 56) + 8 * v5);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16) {
      break;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x1E4FBC860];
LABEL_49:
    swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v65 = v3;
    unint64_t v39 = sub_1CABEC258(v61, v14);
    if (__OFADD__(*(void *)(v3 + 16), (v40 & 1) == 0)) {
      goto LABEL_78;
    }
    unint64_t v41 = v39;
    char v42 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112C0);
    if (sub_1CABFCB38())
    {
      unint64_t v43 = sub_1CABEC258(v61, v14);
      if ((v42 & 1) != (v44 & 1)) {
        goto LABEL_81;
      }
      unint64_t v41 = v43;
    }
    uint64_t v45 = v65;
    if (v42)
    {
      uint64_t v46 = *(void *)(v65 + 56);
      swift_bridgeObjectRelease();
      *(void *)(v46 + 8 * v41) = v38;
    }
    else
    {
      OUTLINED_FUNCTION_45(v65 + 8 * (v41 >> 6));
      unint64_t v48 = (uint64_t *)(v47 + 16 * v41);
      *unint64_t v48 = v61;
      v48[1] = v14;
      *(void *)(*(void *)(v45 + 56) + 8 * v41) = v38;
      uint64_t v49 = *(void *)(v45 + 16);
      BOOL v10 = __OFADD__(v49, 1);
      uint64_t v50 = v49 + 1;
      if (v10) {
        goto LABEL_79;
      }
      *(void *)(v45 + 16) = v50;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v45;
    if (v2) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v6 = v1 + 1;
    if (__OFADD__(v1, 1)) {
      goto LABEL_80;
    }
    if (v6 >= v56) {
      goto LABEL_69;
    }
    unint64_t v7 = *(void *)(v55 + 8 * v6);
    int64_t v8 = v1 + 1;
    if (!v7)
    {
      OUTLINED_FUNCTION_56();
      if (v9 == v10) {
        goto LABEL_69;
      }
      OUTLINED_FUNCTION_55();
      if (!v7)
      {
        OUTLINED_FUNCTION_56();
        if (v9 == v10) {
          goto LABEL_69;
        }
        OUTLINED_FUNCTION_55();
        if (!v7)
        {
          OUTLINED_FUNCTION_56();
          if (v9 == v10) {
            goto LABEL_69;
          }
          OUTLINED_FUNCTION_55();
          if (!v7)
          {
            OUTLINED_FUNCTION_56();
            if (v9 == v10) {
              goto LABEL_69;
            }
            OUTLINED_FUNCTION_55();
            if (!v7)
            {
              int64_t v8 = v11 + 5;
              if (v11 + 5 >= v56) {
                goto LABEL_69;
              }
              unint64_t v7 = *(void *)(v55 + 8 * v8);
              if (!v7)
              {
                int64_t v12 = v1 + 7;
                while (v12 < v56)
                {
                  unint64_t v7 = *(void *)(v55 + 8 * v12++);
                  if (v7)
                  {
                    int64_t v8 = v12 - 1;
                    goto LABEL_24;
                  }
                }
LABEL_69:
                swift_release();
                return v3;
              }
            }
          }
        }
      }
    }
LABEL_24:
    uint64_t v2 = (v7 - 1) & v7;
    unint64_t v5 = __clz(__rbit64(v7)) + (v8 << 6);
    int64_t v1 = v8;
  }
  uint64_t v67 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRetain();
  uint64_t v60 = v14;
  swift_bridgeObjectRetain();
  sub_1CABFCAF8();
  uint64_t v18 = v15 + 64;
  unint64_t v17 = *(void *)(v15 + 64);
  uint64_t v58 = v2;
  if (v17)
  {
    uint64_t v19 = 0;
LABEL_28:
    uint64_t v20 = __clz(__rbit64(v17)) + (v19 << 6);
    goto LABEL_29;
  }
  uint64_t v51 = *(unsigned __int8 *)(v15 + 32);
  unsigned int v52 = v51 & 0x3F;
  uint64_t v20 = 1 << v51;
  if (v52 >= 7)
  {
    unint64_t v17 = *(void *)(v15 + 72);
    if (v17)
    {
      uint64_t v19 = 1;
      goto LABEL_28;
    }
    if (v52 >= 8)
    {
      unint64_t v17 = *(void *)(v15 + 80);
      if (!v17)
      {
        uint64_t v53 = 11;
        while (v53 - 8 < (unint64_t)(v20 + 63) >> 6)
        {
          unint64_t v17 = *(void *)(v15 + 8 * v53++);
          if (v17)
          {
            uint64_t v19 = v53 - 9;
            goto LABEL_28;
          }
        }
        goto LABEL_29;
      }
      uint64_t v19 = 2;
      goto LABEL_28;
    }
  }
LABEL_29:
  uint64_t v59 = v15 + 64;
  while (v16)
  {
    if (v20 < 0 || v20 >= 1 << *(unsigned char *)(v15 + 32)) {
      goto LABEL_71;
    }
    if ((*(void *)(v18 + 8 * ((unint64_t)v20 >> 6)) & (1 << v20)) == 0) {
      goto LABEL_72;
    }
    uint64_t v62 = v16;
    int v63 = *(_DWORD *)(v15 + 36);
    uint64_t v21 = v15;
    unint64_t v22 = *(char **)(*(void *)(v15 + 48) + 8 * v20);
    uint64_t v23 = *(void *)&v22[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents];
    uint64_t v24 = *(void *)(*(void *)(v15 + 56) + 8 * v20);
    uint64_t v66 = MEMORY[0x1E4FBB808];
    *(void *)&long long v65 = v24;
    sub_1CABECDEC(&v65, v64);
    uint64_t v25 = v22;
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_53();
    if (v10) {
      goto LABEL_73;
    }
    unint64_t v28 = v26;
    char v29 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611080);
    if (sub_1CABFCB38())
    {
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_39();
      if (!v31) {
        goto LABEL_81;
      }
      unint64_t v28 = v30;
    }
    if (v29)
    {
      uint64_t v32 = (_OWORD *)(*(void *)(v23 + 56) + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
      sub_1CABECDEC(v64, v32);
    }
    else
    {
      OUTLINED_FUNCTION_45(v23 + 8 * (v28 >> 6));
      uint64_t v34 = (void *)(v33 + 16 * v28);
      *uint64_t v34 = 0x756F43746E657665;
      v34[1] = 0xEA0000000000746ELL;
      sub_1CABECDEC(v64, (_OWORD *)(*(void *)(v23 + 56) + 32 * v28));
      uint64_t v35 = *(void *)(v23 + 16);
      BOOL v10 = __OFADD__(v35, 1);
      uint64_t v36 = v35 + 1;
      if (v10) {
        goto LABEL_77;
      }
      *(void *)(v23 + 16) = v36;
    }
    swift_bridgeObjectRelease();
    type metadata accessor for MetricMessage();
    char v37 = v25[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend];
    swift_bridgeObjectRetain();
    sub_1CABEEF50(v23, v61, v60, v37);

    sub_1CABFCAD8();
    sub_1CABFCB08();
    OUTLINED_FUNCTION_52();
    sub_1CABFCB18();
    sub_1CABFCAE8();
    if (v20 >= -(-1 << *(unsigned char *)(v21 + 32))) {
      goto LABEL_74;
    }
    uint64_t v18 = v59;
    if ((*(void *)(v59 + 8 * ((unint64_t)v20 >> 6)) & (1 << v20)) == 0) {
      goto LABEL_75;
    }
    uint64_t v15 = v21;
    if (v63 != *(_DWORD *)(v21 + 36)) {
      goto LABEL_76;
    }
    uint64_t v20 = sub_1CABFCA78();
    uint64_t v16 = v62 - 1;
    if (v62 == 1)
    {
      uint64_t v38 = v67;
      uint64_t v2 = v58;
      uint64_t v14 = v60;
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  uint64_t result = sub_1CABFCCB8();
  __break(1u);
  return result;
}

uint64_t sub_1CABF6EA4(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR___IISMetricStore_configuration);
  if (v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = v5[2];
  if (!v6)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_24:
    swift_bridgeObjectRelease();
    return (uint64_t)a1;
  }
  uint64_t v9 = v5[4];
  uint64_t v8 = v5[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = swift_bridgeObjectRetain();
  if ((a2(v10) & 1) == 0)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v11 = 0;
  int64_t v12 = v5 + 7;
  unint64_t v30 = v5;
  while (1)
  {
    if (a1[2]
      && (swift_bridgeObjectRetain(), sub_1CABEC258(v9, v8), char v14 = v13, swift_bridgeObjectRelease(), (v14 & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4798);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_1CABFDEF0;
      type metadata accessor for MetricMessage();
      uint64_t v16 = sub_1CABFC948();
      swift_bridgeObjectRetain();
      *(void *)(v15 + 32) = sub_1CABEEF50(v16, v9, v8, 0);
      sub_1CABFC9E8();
      uint64_t v31 = v15;
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v17 = sub_1CABEC258(v9, v8);
      if (__OFADD__(a1[2], (v18 & 1) == 0)) {
        goto LABEL_27;
      }
      unint64_t v19 = v17;
      char v20 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112C0);
      if (sub_1CABFCB38())
      {
        unint64_t v21 = sub_1CABEC258(v9, v8);
        if ((v20 & 1) != (v22 & 1)) {
          goto LABEL_29;
        }
        unint64_t v19 = v21;
      }
      if (v20)
      {
        uint64_t v23 = a1[7];
        swift_bridgeObjectRelease();
        *(void *)(v23 + 8 * v19) = v31;
      }
      else
      {
        OUTLINED_FUNCTION_27((uint64_t)&a1[v19 >> 6]);
        uint64_t v24 = (uint64_t *)(a1[6] + 16 * v19);
        *uint64_t v24 = v9;
        v24[1] = v8;
        *(void *)(a1[7] + 8 * v19) = v31;
        uint64_t v25 = a1[2];
        BOOL v26 = __OFADD__(v25, 1);
        uint64_t v27 = v25 + 1;
        if (v26) {
          goto LABEL_28;
        }
        a1[2] = v27;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v5 = v30;
    }
    if (v6 - 1 == v11) {
      goto LABEL_24;
    }
    if ((unint64_t)++v11 >= v5[2]) {
      break;
    }
    uint64_t v9 = *(v12 - 1);
    uint64_t v8 = *v12;
    uint64_t v28 = swift_bridgeObjectRetain();
    v12 += 2;
    if ((a2(v28) & 1) == 0) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = sub_1CABFCCB8();
  __break(1u);
  return result;
}

void sub_1CABF71E0()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v91 = v1;
  uint64_t v92 = v2;
  uint64_t v4 = v3;
  v76[2] = sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  v76[4] = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9_0();
  v76[3] = v7;
  OUTLINED_FUNCTION_48();
  MEMORY[0x1F4188790](v8);
  v76[1] = (char *)v76 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112C8);
  uint64_t v83 = sub_1CABFC948();
  uint64_t v10 = *(void *)(v4 + 64);
  uint64_t v77 = v4 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  char v14 = (uint64_t *)(v0 + OBJC_IVAR___IISMetricStore_enrichmentProviders);
  uint64_t v82 = v4;
  swift_bridgeObjectRetain();
  uint64_t v79 = v14;
  OUTLINED_FUNCTION_10_0();
  uint64_t v15 = 0;
  unint64_t v78 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v94 = MEMORY[0x1E4FBC840] + 8;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v80 = (v13 - 1) & v13;
  uint64_t v81 = v15;
  for (unint64_t i = __clz(__rbit64(v13)) | (v15 << 6); ; unint64_t i = v27 + (v26 << 6))
  {
    uint64_t v28 = *(void *)(v82 + 56);
    char v29 = (uint64_t *)(*(void *)(v82 + 48) + 16 * i);
    uint64_t v30 = v29[1];
    uint64_t v84 = *v29;
    uint64_t v85 = v30;
    unint64_t v31 = *(void *)(v28 + 8 * i);
    swift_bridgeObjectRetain();
    uint64_t v32 = swift_bridgeObjectRetain();
    if ((((uint64_t (*)(uint64_t))v91)(v32) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1CABF3194();
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_1_2();
      v70();
      unint64_t v71 = (void *)sub_1CABFC8E8();
      os_log_type_t v72 = sub_1CABFCA28();
      if (OUTLINED_FUNCTION_8_0(v72))
      {
        unint64_t v73 = (_WORD *)OUTLINED_FUNCTION_13_0();
        OUTLINED_FUNCTION_42(v73);
        OUTLINED_FUNCTION_4_0(&dword_1CABE8000, v74, v75, "MetricStore: deferring enrichment of messages.");
        OUTLINED_FUNCTION_3_0();
      }

      goto LABEL_66;
    }
    uint64_t v33 = *v79;
    if ((unint64_t)*v79 >> 62) {
      break;
    }
    uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v34) {
      goto LABEL_26;
    }
LABEL_51:
    swift_bridgeObjectRelease();
    uint64_t v50 = v83;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v99 = v50;
    sub_1CABEC258(v84, v85);
    OUTLINED_FUNCTION_53();
    if (v19) {
      goto LABEL_75;
    }
    unint64_t v53 = v51;
    char v54 = v52;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112C0);
    if (sub_1CABFCB38())
    {
      sub_1CABEC258(v84, v85);
      OUTLINED_FUNCTION_39();
      if (!v56) {
        goto LABEL_80;
      }
      unint64_t v53 = v55;
    }
    uint64_t v83 = v99;
    if (v54)
    {
      uint64_t v57 = *(void *)(v99 + 56);
      swift_bridgeObjectRelease();
      *(void *)(v57 + 8 * v53) = v31;
    }
    else
    {
      OUTLINED_FUNCTION_27(v99 + 8 * (v53 >> 6));
      uint64_t v59 = (void *)(v58[6] + 16 * v53);
      uint64_t v60 = v85;
      *uint64_t v59 = v84;
      v59[1] = v60;
      *(void *)(v58[7] + 8 * v53) = v31;
      uint64_t v61 = v58[2];
      BOOL v19 = __OFADD__(v61, 1);
      uint64_t v62 = v61 + 1;
      if (v19) {
        goto LABEL_78;
      }
      v58[2] = v62;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = v81;
    unint64_t v13 = v80;
    if (v80) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v15, 1)) {
      goto LABEL_77;
    }
    OUTLINED_FUNCTION_46();
    if (v18 == v19)
    {
LABEL_71:
      swift_release();
      goto LABEL_67;
    }
    if (!*(void *)(v77 + 8 * v17))
    {
      OUTLINED_FUNCTION_17_0();
      if (v18 == v19) {
        goto LABEL_71;
      }
      OUTLINED_FUNCTION_40();
      if (!v20)
      {
        OUTLINED_FUNCTION_17_0();
        if (v18 == v19) {
          goto LABEL_71;
        }
        OUTLINED_FUNCTION_40();
        if (!v21)
        {
          OUTLINED_FUNCTION_46();
          if (v18 == v19) {
            goto LABEL_71;
          }
          if (!*(void *)(v77 + 8 * v22))
          {
            while (!__OFADD__(v22, 1))
            {
              OUTLINED_FUNCTION_17_0();
              if (v18 == v19) {
                goto LABEL_71;
              }
              OUTLINED_FUNCTION_40();
              uint64_t v22 = v23 + 1;
              if (v24) {
                goto LABEL_22;
              }
            }
            goto LABEL_79;
          }
        }
      }
    }
LABEL_22:
    OUTLINED_FUNCTION_44();
    uint64_t v80 = v25;
    uint64_t v81 = v26;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v34 = sub_1CABFCB78();
  swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_51;
  }
LABEL_26:
  unint64_t v90 = v33 & 0xC000000000000001;
  if ((v33 & 0xC000000000000001) != 0)
  {
    uint64_t v35 = (void *)MEMORY[0x1CB79DF10](0, v33);
    id v98 = v35;
  }
  else
  {
    if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_76;
    }
    id v98 = *(id *)(v33 + 32);
    uint64_t v35 = (void *)swift_unknownObjectRetain();
  }
  if ((((uint64_t (*)(void *))v91)(v35) & 1) == 0)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1CABF3194();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_1_2();
    v63();
    char v64 = (void *)sub_1CABFC8E8();
    os_log_type_t v65 = sub_1CABFCA28();
    if (OUTLINED_FUNCTION_8_0(v65))
    {
      uint64_t v66 = (_WORD *)OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_42(v66);
      OUTLINED_FUNCTION_4_0(&dword_1CABE8000, v67, v68, "MetricStore: deferring enrichment of messages.");
      OUTLINED_FUNCTION_3_0();
    }

    swift_unknownObjectRelease();
LABEL_66:
    OUTLINED_FUNCTION_51();
    v69();
    swift_release();
LABEL_67:
    OUTLINED_FUNCTION_6_0();
    return;
  }
  uint64_t v86 = v33 + 32;
  uint64_t v87 = v33 & 0xFFFFFFFFFFFFFF8;
  unint64_t v36 = 1;
  uint64_t v88 = v34;
  uint64_t v89 = v33;
  while (1)
  {
    if (v31 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1CABFCB78();
      swift_bridgeObjectRelease();
      if (!v37)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        unint64_t v31 = MEMORY[0x1E4FBC860];
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v37 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v37) {
        goto LABEL_41;
      }
    }
    uint64_t v99 = MEMORY[0x1E4FBC860];
    sub_1CABFCAF8();
    if (v37 < 0) {
      goto LABEL_73;
    }
    unint64_t v93 = v36;
    uint64_t v38 = type metadata accessor for MetricMessage();
    uint64_t v39 = 0;
    unint64_t v95 = v31 & 0xC000000000000001;
    uint64_t v96 = v38;
    unint64_t v97 = v31;
    do
    {
      if (v95) {
        char v40 = (unsigned char *)MEMORY[0x1CB79DF10](v39, v31);
      }
      else {
        char v40 = *(id *)(v31 + 8 * v39 + 32);
      }
      unint64_t v41 = v40;
      ++v39;
      char v42 = (void *)sub_1CABFC918();
      unint64_t v43 = (uint64_t *)&v41[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
      char v44 = (void *)sub_1CABFC978();
      id v45 = objc_msgSend(v98, sel_enrichMessage_messageName_, v42, v44);

      uint64_t v46 = sub_1CABFC928();
      uint64_t v47 = *v43;
      uint64_t v48 = v43[1];
      LOBYTE(v43) = v41[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend];
      swift_bridgeObjectRetain();
      sub_1CABEEF50(v46, v47, v48, (char)v43);

      sub_1CABFCAD8();
      sub_1CABFCB08();
      sub_1CABFCB18();
      sub_1CABFCAE8();
      unint64_t v31 = v97;
    }
    while (v37 != v39);
    uint64_t v49 = v99;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    unint64_t v31 = v49;
    uint64_t v34 = v88;
    uint64_t v33 = v89;
    unint64_t v36 = v93;
LABEL_42:
    if (v36 == v34) {
      goto LABEL_51;
    }
    if (v90)
    {
      id v98 = (id)MEMORY[0x1CB79DF10](v36, v33);
    }
    else
    {
      if (v36 >= *(void *)(v87 + 16)) {
        goto LABEL_74;
      }
      id v98 = *(id *)(v86 + 8 * v36);
      swift_unknownObjectRetain();
    }
    BOOL v19 = __OFADD__(v36++, 1);
    if (v19) {
      break;
    }
    if ((v91() & 1) == 0) {
      goto LABEL_63;
    }
  }
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  sub_1CABFCCB8();
  __break(1u);
}

uint64_t sub_1CABF79E0()
{
  uint64_t v1 = sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR___IISMetricStore_storageLock);
  OUTLINED_FUNCTION_1_2();
  v8();
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  uint64_t v11 = OUTLINED_FUNCTION_23();
  *(void *)(v11 + 16) = sub_1CABF97B8;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_1CABF9EA0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CABF54A4;
  aBlock[3] = &block_descriptor_46;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_runWithLockAcquired_, v12);
  _Block_release(v12);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall MetricStore.shouldSendMessages()()
{
  sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = v0;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_20_0();
  MEMORY[0x1F4188790](v3);
  sub_1CABFC7D8();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_2();
  v4();
  sub_1CABF9CB0(&qword_1EBCB4750, MEMORY[0x1E4F27928]);
  OUTLINED_FUNCTION_52();
  char v5 = sub_1CABFC958();
  uint64_t v6 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_26();
  v6();
  OUTLINED_FUNCTION_26();
  v6();
  return (v5 & 1) == 0;
}

void sub_1CABF7DCC()
{
  OUTLINED_FUNCTION_31();
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v22 = v4;
  uint64_t v23 = v5;
  uint64_t v7 = v6;
  uint64_t v8 = sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_36();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4770);
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_1_2();
  v17();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_2();
  v18();
  sub_1CABFC7A8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v8);
  sub_1CABF9D60(&qword_1EBCB4790, &qword_1EBCB4770);
  sub_1CABFC8C8();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
  BOOL v19 = (void *)swift_allocObject();
  v19[2] = v7;
  v19[3] = v22;
  v19[4] = v23;
  v19[5] = v24;
  v19[6] = v25;
  sub_1CABF9D60(&qword_1EA6112E8, &qword_1EA6112E0);
  swift_retain();
  id v20 = v7;
  swift_retain();
  swift_retain();
  swift_retain();

  swift_release();
  swift_release();
  OUTLINED_FUNCTION_26();
  v21();
  OUTLINED_FUNCTION_43();
}

void sub_1CABF8094()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_34();
  if (objc_msgSend(v3, sel_state) == (id)1)
  {
    uint64_t v5 = (unsigned char *)(v1 + 16);
    sub_1CABF3194();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_1_2();
    v6();
    id v7 = v3;
    uint64_t v8 = sub_1CABFC8E8();
    os_log_type_t v9 = sub_1CABFCA18();
    if (os_log_type_enabled(v8, v9))
    {
      id v20 = v5;
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      id v11 = objc_msgSend(v7, sel_error);
      if (v11)
      {
        uint64_t v12 = v11;
        swift_getErrorValue();
        uint64_t v13 = sub_1CABFCCC8();
        unint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        unint64_t v15 = 0xE000000000000000;
      }
      sub_1CABEBAA0(v13, v15, &v21);
      sub_1CABFCA58();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CABE8000, v8, v9, "MetricStore: failed to completely read Biome stream: %s", v10, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      uint64_t v18 = OUTLINED_FUNCTION_6();
      v19(v18);
      uint64_t v5 = v20;
    }
    else
    {

      uint64_t v16 = OUTLINED_FUNCTION_6();
      v17(v16);
    }
    swift_beginAccess();
    unsigned char *v5 = 1;
  }
  OUTLINED_FUNCTION_6_0();
}

void sub_1CABF82D0()
{
  OUTLINED_FUNCTION_31();
  uint64_t v3 = v2;
  os_log_type_t v65 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_1CABFC908();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_36();
  objc_msgSend(v8, sel_timestamp);
  double v18 = v17;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_2();
  v19();
  sub_1CABFC7A8();
  double v21 = v20;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0, v13);
  if (v21 + *(double *)(v6 + OBJC_IVAR___IISMetricStore_sendInterval) < v18) {
    goto LABEL_21;
  }
  uint64_t v22 = (char *)objc_msgSend(v8, sel_eventBody);
  if (!v22)
  {
    sub_1CABF3194();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_1_2();
    v57();
    uint64_t v58 = (void *)sub_1CABFC8E8();
    os_log_type_t v59 = sub_1CABFCA18();
    if (OUTLINED_FUNCTION_8_0(v59))
    {
      uint64_t v60 = (_WORD *)OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_42(v60);
      OUTLINED_FUNCTION_4_0(&dword_1CABE8000, v61, v62, "MetricStore: failed to fetch event body from event.");
      OUTLINED_FUNCTION_3_0();
    }

    uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
    v65(v63);
    goto LABEL_21;
  }
  uint64_t v23 = v22;
  uint64_t v24 = (uint64_t *)(v3 + 16);
  uint64_t v26 = *(void *)&v22[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
  uint64_t v25 = *(void *)&v22[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8];
  swift_bridgeObjectRetain();
  id v27 = objc_msgSend(v23, sel_description);
  uint64_t v64 = sub_1CABFC988();
  uint64_t v29 = v28;

  swift_beginAccess();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v66 = *v24;
  *uint64_t v24 = 0x8000000000000000;
  sub_1CABEC258(v26, v25);
  OUTLINED_FUNCTION_54();
  if (v32)
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v33 = v30;
  char v34 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112F0);
  if (sub_1CABFCB38())
  {
    sub_1CABEC258(v26, v25);
    OUTLINED_FUNCTION_39();
    if (!v36) {
      goto LABEL_25;
    }
    unint64_t v33 = v35;
  }
  *uint64_t v24 = v66;
  swift_bridgeObjectRelease();
  uint64_t v37 = (void *)*v24;
  if ((v34 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_1CABF878C(&v66);
    sub_1CABF9534(v33, v26, v25, v66, v37);
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = v37[7];
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v66 = *(void *)(v38 + 8 * v33);
  uint64_t v39 = v66;
  *(void *)(v38 + 8 * v33) = 0x8000000000000000;
  unint64_t v40 = sub_1CABEC258(v64, v29);
  if (__OFADD__(*(void *)(v39 + 16), (v41 & 1) == 0)) {
    goto LABEL_23;
  }
  unint64_t v42 = v40;
  char v43 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6110A8);
  if ((sub_1CABFCB38() & 1) == 0) {
    goto LABEL_14;
  }
  unint64_t v44 = sub_1CABEC258(v64, v29);
  if ((v43 & 1) == (v45 & 1))
  {
    unint64_t v42 = v44;
LABEL_14:
    *(void *)(v38 + 8 * v33) = v66;
    swift_bridgeObjectRelease();
    uint64_t v46 = *(void **)(v38 + 8 * v33);
    swift_bridgeObjectRetain();
    if ((v43 & 1) == 0)
    {
      sub_1CABF9534(v42, v64, v29, 0, v46);
      swift_bridgeObjectRetain();
    }
    uint64_t v47 = v46[7];
    uint64_t v48 = *(void *)(v47 + 8 * v42);
    BOOL v49 = __CFADD__(v48, 1);
    uint64_t v50 = v48 + 1;
    if (!v49)
    {
      *(void *)(v47 + 8 * v42) = v50;
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v51 = objc_msgSend(v23, sel_description);
      uint64_t v52 = sub_1CABFC988();
      uint64_t v54 = v53;

      swift_beginAccess();
      id v55 = v23;
      sub_1CABF957C((uint64_t)v55, v52, v54);
      swift_endAccess();
      uint64_t v56 = swift_bridgeObjectRelease();
      v65(v56);

LABEL_21:
      OUTLINED_FUNCTION_43();
      return;
    }
    goto LABEL_24;
  }
LABEL_25:
  sub_1CABFCCB8();
  __break(1u);
}

uint64_t sub_1CABF878C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1CABFC948();
  *a1 = result;
  return result;
}

uint64_t sub_1CABF87D4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MetricMessage();
  sub_1CABF9CB0(&qword_1EA6112D8, (void (*)(uint64_t))type metadata accessor for MetricMessage);
  uint64_t result = sub_1CABFC948();
  *a1 = result;
  return result;
}

uint64_t sub_1CABF8854(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void (*v18)(char *__return_ptr, void *, unint64_t *);
  unint64_t v19;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  void v28[2];
  uint64_t vars8;

  OUTLINED_FUNCTION_24();
  if (v8 >> 62) {
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; uint64_t v9 = sub_1CABFCB78())
  {
    unint64_t v10 = a4 + OBJC_IVAR___IISMetricStore_messageListeners;
    a4 = a3 & 0xC000000000000001;
    uint64_t v24 = v10;
    OUTLINED_FUNCTION_10_0();
    uint64_t v11 = 0;
    uint64_t v25 = a3 + 32;
    uint64_t v22 = v9;
    uint64_t v23 = a3;
    double v21 = a3 & 0xC000000000000001;
    while (1)
    {
      uint64_t v12 = a4 ? (char *)MEMORY[0x1CB79DF10](v11, a3) : (char *)*(id *)(v25 + 8 * v11);
      uint64_t v13 = v12;
      if (__OFADD__(v11++, 1)) {
        break;
      }
      if (v12[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend])
      {
      }
      else
      {
        uint64_t v15 = sub_1CABF27AC(v5, v4, *(void *)&v12[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents]);
        uint64_t v16 = *(void *)(*(void *)v24 + 16);
        if (v16)
        {
          uint64_t v17 = swift_bridgeObjectRetain() + 40;
          do
          {
            double v18 = *(void (**)(char *__return_ptr, void *, unint64_t *))(v17 - 8);
            swift_retain();
            BOOL v19 = sub_1CABF512C(v15);
            v28[0] = v5;
            v28[1] = v4;
            id v27 = v19;
            v18(&v26, v28, &v27);
            swift_release();
            swift_bridgeObjectRelease();
            v17 += 16;
            --v16;
          }
          while (v16);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v9 = v22;
          a3 = v23;
          a4 = v21;
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
      if (v11 == v9) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CABF8A64(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  sub_1CABF0E48(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v19[4];
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v5 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v16, v17, v18);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v11 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v11 >= v7) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    int64_t v13 = v5 + 1;
    if (!v12)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v7) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v4 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v7) {
          return swift_release();
        }
        unint64_t v12 = *(void *)(v4 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v7) {
            return swift_release();
          }
          unint64_t v12 = *(void *)(v4 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v7) {
              return swift_release();
            }
            unint64_t v12 = *(void *)(v4 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v5 + 6;
              while (v14 < v7)
              {
                unint64_t v12 = *(void *)(v4 + 8 * v14++);
                if (v12)
                {
                  int64_t v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v5 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CABF8BEC(void *a1)
{
  sub_1CABFC808();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_33();
  if (a1)
  {
    id v3 = a1;
    objc_msgSend(v3, sel_timestamp);
    sub_1CABFC798();
    char v4 = sub_1CABFC7C8();

    uint64_t v5 = OUTLINED_FUNCTION_52();
    v6(v5);
  }
  else
  {
    char v4 = 1;
  }
  return v4 & 1;
}

id MetricStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1CABF8D94()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_1CABF8E4C(result, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_1CABF8DE0(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x1F4183EC8](v2 > 1);
  }
  return result;
}

char *sub_1CABF8E0C(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_1CABF8E4C((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

char *sub_1CABF8E4C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611300);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CABF9054((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CABF8F3C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1CABF8F3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA611308);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CABFCBB8();
  __break(1u);
  return result;
}

char *sub_1CABF9054(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CABFCBB8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1CABF90E8()
{
  uint64_t v1 = OUTLINED_FUNCTION_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

void sub_1CABF9118()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCB4770);
  sub_1CABF9D60(&qword_1EBCB4790, &qword_1EBCB4770);
  id v2 = (id)sub_1CABFC8B8();
  objc_msgSend(v2, sel_sendEvent_, v1);
}

uint64_t sub_1CABF91C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1CABF9204()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1CABF923C()
{
  return sub_1CABFC888();
}

uint64_t sub_1CABF92A4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1CABF92DC@<X0>(void *a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void, void))(v3 + 16))(*a1, a1[1], *a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CABF9320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CABF8854(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1CABF9328()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1CABF9338()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1CABF9368()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1CABF93C0()
{
}

uint64_t sub_1CABF93D4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_1CABF93E4(uint64_t a1)
{
  uint64_t v2 = sub_1CABFCA38();
  return sub_1CABF9428(a1, v2);
}

unint64_t sub_1CABF9428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for MetricMessage();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1CABFCA48();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1CABFCA48();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1CABF9534(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1CABF957C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1CABF960C(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_1CABF960C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1CABEC258(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6112F8);
  if ((sub_1CABFCB38() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1CABEC258(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_1CABFCCB8();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1CABF9534(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1CABF9734()
{
  sub_1CABFC808();
  OUTLINED_FUNCTION_5_0();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_51();
  v5();
  return MEMORY[0x1F4186498](v0, v3, v4);
}

uint64_t sub_1CABF97B8()
{
  return sub_1CABFC888();
}

unint64_t sub_1CABF9860()
{
  unint64_t result = qword_1EA6112D0;
  if (!qword_1EA6112D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6112D0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MetricError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MetricError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1CABF9A00);
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

ValueMetadata *type metadata accessor for MetricError()
{
  return &type metadata for MetricError;
}

uint64_t sub_1CABF9A38()
{
  return type metadata accessor for MetricStorage(0);
}

void sub_1CABF9A40()
{
  sub_1CABF9AD0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1CABF9AD0()
{
  if (!qword_1EBCB4778)
  {
    type metadata accessor for MetricMessage();
    unint64_t v0 = sub_1CABFC898();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBCB4778);
    }
  }
}

uint64_t sub_1CABF9B28()
{
  return type metadata accessor for MetricStore(0);
}

uint64_t type metadata accessor for MetricStore(uint64_t a1)
{
  return sub_1CABF9B50(a1, (uint64_t *)&unk_1EBCB49F0);
}

uint64_t sub_1CABF9B50(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1CABF9B84()
{
  uint64_t result = sub_1CABFC808();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1CABF9C4C()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = OUTLINED_FUNCTION_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1CABF9C7C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1CABF9CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CABF5990(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1CABF9CA8(void *a1)
{
  return sub_1CABF8BEC(a1);
}

uint64_t sub_1CABF9CB0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1CABF9CF8()
{
}

uint64_t sub_1CABF9D00()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1CABF9D50()
{
}

uint64_t sub_1CABF9D60(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1CABF9DA4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1CABF9DE0(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = objc_msgSend(a1, sel_eventBody);
  if (!v1) {
    return 1;
  }
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();

  char v3 = sub_1CABFC9C8();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void OUTLINED_FUNCTION_3_0()
{
  JUMPOUT(0x1CB79E890);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_8_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_slowAlloc();
}

unint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_1CABEC258(0x756F43746E657665, 0xEA0000000000746ELL);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_1CABFC808();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_27(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_1CABFC978();
}

_WORD *OUTLINED_FUNCTION_42(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void OUTLINED_FUNCTION_45(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

void sub_1CABFA7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void IIExit(int a1)
{
}

void __ii_default_log_handle_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79E3D0]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalIntelligenceCore", "Default");
  uint64_t v2 = (void *)ii_default_log_handle__pasExprOnceResult;
  ii_default_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void sub_1CABFAE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1CABFC184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CABFC668()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1CABFC678()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1CABFC688()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1CABFC698()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1CABFC6A8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1CABFC6B8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1CABFC6C8()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1CABFC6D8()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1CABFC6E8()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1CABFC6F8()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1CABFC708()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1CABFC718()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1CABFC728()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1CABFC738()
{
  return MEMORY[0x1F40E4B10]();
}

uint64_t sub_1CABFC748()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1CABFC758()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1CABFC768()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1CABFC778()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1CABFC788()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1CABFC798()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1CABFC7A8()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1CABFC7B8()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1CABFC7C8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1CABFC7D8()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1CABFC7E8()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1CABFC7F8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1CABFC808()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1CABFC818()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1CABFC828()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1CABFC838()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1CABFC848()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1CABFC858()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1CABFC868()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1CABFC878()
{
  return MEMORY[0x1F410C8E0]();
}

uint64_t sub_1CABFC888()
{
  return MEMORY[0x1F410C920]();
}

uint64_t sub_1CABFC898()
{
  return MEMORY[0x1F410C928]();
}

uint64_t sub_1CABFC8A8()
{
  return MEMORY[0x1F410C930]();
}

uint64_t sub_1CABFC8B8()
{
  return MEMORY[0x1F410C990]();
}

uint64_t sub_1CABFC8C8()
{
  return MEMORY[0x1F410C998]();
}

uint64_t sub_1CABFC8D8()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1CABFC8E8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1CABFC8F8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1CABFC908()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1CABFC918()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1CABFC928()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1CABFC938()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1CABFC948()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1CABFC958()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1CABFC968()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1CABFC978()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1CABFC988()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1CABFC998()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1CABFC9A8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1CABFC9B8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1CABFC9C8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1CABFC9D8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1CABFC9E8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1CABFCA08()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1CABFCA18()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1CABFCA28()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1CABFCA38()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1CABFCA48()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1CABFCA58()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1CABFCA68()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1CABFCA78()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1CABFCA88()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1CABFCA98()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1CABFCAA8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1CABFCAB8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1CABFCAC8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1CABFCAD8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1CABFCAE8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1CABFCAF8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1CABFCB08()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1CABFCB18()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1CABFCB28()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1CABFCB38()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1CABFCB48()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1CABFCB58()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1CABFCB68()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1CABFCB78()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1CABFCB88()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1CABFCB98()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1CABFCBA8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1CABFCBB8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1CABFCBC8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1CABFCBD8()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1CABFCBE8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1CABFCBF8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1CABFCC08()
{
  return MEMORY[0x1F41855C0]();
}

uint64_t sub_1CABFCC18()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1CABFCC28()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1CABFCC38()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1CABFCC48()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1CABFCC58()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1CABFCC68()
{
  return MEMORY[0x1F41856E8]();
}

uint64_t sub_1CABFCC78()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1CABFCC88()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1CABFCC98()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1CABFCCA8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1CABFCCB8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1CABFCCC8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1CABFCCD8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1CABFCCE8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1CABFCCF8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1CABFCD08()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1CABFCD18()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1CABFCD28()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1CABFCD38()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1CABFCD48()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1CABFCD58()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1CABFCD88()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t NLLanguageIdentifierConsumeString()
{
  return MEMORY[0x1F4113F58]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1F4113F60]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1F4113F68]();
}

uint64_t NLLanguageIdentifierRelease()
{
  return MEMORY[0x1F4113F80]();
}

uint64_t NLLanguageIdentifierReset()
{
  return MEMORY[0x1F4113F90]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1F4113FA0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _exit(int a1)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

void objc_storeStrong(id *location, id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}