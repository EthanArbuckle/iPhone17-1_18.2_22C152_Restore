unint64_t _getDatestamp()
{
  void *v0;
  double v1;
  unint64_t v2;

  v0 = [MEMORY[0x1E4F1C9C8] date];
  [v0 timeIntervalSince1970];
  v2 = v1 / 0x15180uLL;

  return v2;
}

void lookupBlockCreatingIfNotExists(void *a1, uint64_t a2, unsigned int a3, char a4, unsigned int a5, void *a6)
{
  id v11 = a1;
  id v12 = a6;
  if (!v11) {
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 172, "storage");
  }
  if (!a2) {
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 173, "key");
  }
  v13 = v12;
  if (!v12) {
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 176, "block");
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  unint64_t v14 = a3 + (unint64_t)a5 + 10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __lookupBlockCreatingIfNotExists_block_invoke;
  v17[3] = &unk_1E56C4150;
  uint64_t v21 = a2;
  __int16 v22 = a3;
  id v15 = v11;
  id v18 = v15;
  char v24 = a4;
  __int16 v23 = a5;
  id v16 = v13;
  id v19 = v16;
  v20 = &v25;
  [v15 expand:v14 andRunWithLock:v17];
  if (*((unsigned char *)v26 + 24)) {
    [v15 reset];
  }

  _Block_object_dispose(&v25, 8);
}

void sub_190C03CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __lookupBlockCreatingIfNotExists_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  __int16 v8 = 8997;
  uint64_t v9 = *(unsigned __int16 *)(a1 + 64);
  if (*(_WORD *)(a1 + 64))
  {
    v10 = *(unsigned __int8 **)(a1 + 56);
    do
    {
      __int16 v11 = *v10++;
      __int16 v8 = 435 * (v8 ^ v11);
      --v9;
    }
    while (v9);
  }
  unsigned int v12 = 4 * (v8 ^ HIBYTE(v8));
  unsigned int BucketPtr = getBucketPtr(a2, a3, v12, *(void **)(a1 + 32));
  if (BucketPtr == -1)
  {
    LOWORD(v20) = *(_WORD *)(a1 + 64);
LABEL_15:
    char v21 = *(unsigned char *)(a1 + 68);
    __int16 v22 = *(_WORD *)(a1 + 66);
    uint64_t v23 = a2 + a4;
    *(unsigned char *)uint64_t v23 = -28;
    *(unsigned char *)(v23 + 1) = v21;
    *(_WORD *)(v23 + 2) = v22;
    *(_WORD *)(v23 + 4) = v20;
    *(_DWORD *)(v23 + 6) = -1;
    memcpy((void *)(a2 + a4 + 10), *(const void **)(a1 + 56), *(unsigned __int16 *)(a1 + 64));
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
      setBucketPtr(a2, a3, v12, a4, *(void **)(a1 + 32));
      return 1;
    }
LABEL_34:
    __assert_rtn("lookupBlockCreatingIfNotExists_block_invoke", "PETAggregateState.m", 226, "!keepNewAllocation");
  }
  unsigned int v14 = BucketPtr;
  while (1)
  {
    unsigned int v15 = v14;
    unint64_t v16 = v14 + 10;
    if (v16 > a3)
    {
LABEL_17:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v33) = 0;
        uint64_t v25 = MEMORY[0x1E4F14500];
        v26 = "Bounds overflow! Invalid data";
        uint32_t v27 = 2;
LABEL_32:
        _os_log_error_impl(&dword_190C01000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v33, v27);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v17 = (unsigned __int8 *)(a2 + v14);
    int v18 = *v17;
    if (v18 != 228)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v33 = 67109376;
        int v34 = 228;
        __int16 v35 = 1024;
        int v36 = v18;
        uint64_t v25 = MEMORY[0x1E4F14500];
        v26 = "Magic number not found: expected %i, got %i";
        goto LABEL_31;
      }
      goto LABEL_20;
    }
    unsigned int v14 = *(_DWORD *)(v17 + 6);
    uint64_t v19 = *((unsigned __int16 *)v17 + 2);
    int v20 = *(unsigned __int16 *)(a1 + 64);
    if (v20 == v19)
    {
      if (v16 + v19 > a3) {
        goto LABEL_17;
      }
      if (!memcmp(*(const void **)(a1 + 56), v17 + 10, *((unsigned __int16 *)v17 + 2))) {
        break;
      }
    }
    if (v15 >= v14)
    {
      [*(id *)(a1 + 32) saveCorruptState];
      [*(id *)(a1 + 32) resetLocked];
      __break(1u);
      goto LABEL_34;
    }
    if (v14 == -1)
    {
      unsigned int v12 = v15 + 6;
      goto LABEL_15;
    }
  }
  int v28 = v17[1];
  int v29 = *(unsigned __int8 *)(a1 + 68);
  if (v29 != v28)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v33 = 67109376;
      int v34 = v29;
      __int16 v35 = 1024;
      int v36 = v28;
      uint64_t v25 = MEMORY[0x1E4F14500];
      v26 = "Block type mismatch: expected %i, got %i";
LABEL_31:
      uint32_t v27 = 14;
      goto LABEL_32;
    }
LABEL_20:
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    return result;
  }
  int v30 = *((unsigned __int16 *)v17 + 1);
  int v31 = *(unsigned __int16 *)(a1 + 66);
  if (v31 != v30)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v33 = 67109376;
      int v34 = v31;
      __int16 v35 = 1024;
      int v36 = v30;
      uint64_t v25 = MEMORY[0x1E4F14500];
      v26 = "Block length mismatch: expected %u, got %u";
      goto LABEL_31;
    }
    goto LABEL_20;
  }
  v32 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v32();
}

uint64_t getBucketPtr(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  id v7 = a4;
  __int16 v8 = v7;
  if ((unint64_t)a3 + 4 > a2)
  {
    [v7 saveCorruptState];
    uint64_t result = [v8 resetLocked];
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(unsigned int *)(a1 + a3);

    return v9;
  }
  return result;
}

void sub_190C05C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_190C06AE8()
{
  uint64_t v0 = sub_190C28660();
  __swift_allocate_value_buffer(v0, qword_1E92A89E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92A89E8);
  return sub_190C28650();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_190C06BF0()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  type metadata accessor for EventTracker();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  qword_1E92A87D8 = result;
  return result;
}

uint64_t static EventTracker.shared.getter()
{
  if (qword_1E92A87E0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E92A87D8;

  return MEMORY[0x1F4186770](v0);
}

void sub_190C06CA8(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *(void **)(v5 + 16);
  if (v7)
  {
    uint64_t v11 = OUTLINED_FUNCTION_0(a1);
    if (v6)
    {
      if (qword_1E92A87E8 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_190C28660();
      __swift_project_value_buffer(v13, (uint64_t)qword_1E92A89E8);
      swift_bridgeObjectRetain_n();
      oslog = sub_190C28640();
      os_log_type_t v14 = sub_190C28690();
      if (os_log_type_enabled(oslog, v14))
      {
        unsigned int v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)unsigned int v15 = 136315138;
        swift_bridgeObjectRetain();
        sub_190C07248(a2, a3, &v22);
        sub_190C286A0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_190C01000, oslog, v14, "PET2 does not support required fields on %s", v15, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();

        return;
      }
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v16 = v11;
      unint64_t v17 = v12;
      int v18 = (void *)sub_190C28620();
      sub_190C07A00(v16, v17);
      uint64_t v19 = (void *)sub_190C28670();
      if (a5) {
        uint64_t v20 = sub_190C28670();
      }
      else {
        uint64_t v20 = 0;
      }
      objc_msgSend(v7, sel_logMessageData_objcClassName_subGroup_, v18, v19, v20);
    }
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_190C06F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return MEMORY[0x1F4188298](sub_190C06F7C, 0, 0);
}

uint64_t sub_190C06F7C()
{
  uint64_t v20 = v1;
  v2 = *(void **)(*(void *)(v1 + 64) + 16);
  if (v2)
  {
    uint64_t v3 = OUTLINED_FUNCTION_0(*(void **)(v1 + 24));
    if (v0)
    {
      if (qword_1E92A87E8 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_190C28660();
      __swift_project_value_buffer(v5, (uint64_t)qword_1E92A89E8);
      swift_bridgeObjectRetain_n();
      v6 = sub_190C28640();
      os_log_type_t v7 = sub_190C28690();
      BOOL v8 = os_log_type_enabled(v6, v7);
      unint64_t v9 = *(void *)(v1 + 40);
      if (v8)
      {
        uint64_t v18 = *(void *)(v1 + 32);
        v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        *(_DWORD *)v10 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v1 + 16) = sub_190C07248(v18, v9, &v19);
        sub_190C286A0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_190C01000, v6, v7, "PET2 does not support required fields on %s", v10, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      uint64_t v11 = v3;
      unint64_t v12 = v4;
      uint64_t v13 = *(void *)(v1 + 56);
      v6 = sub_190C28620();
      sub_190C07A00(v11, v12);
      os_log_type_t v14 = (void *)sub_190C28670();
      if (v13) {
        unsigned int v15 = (void *)sub_190C28670();
      }
      else {
        unsigned int v15 = 0;
      }
      objc_msgSend(v2, sel_logMessageData_objcClassName_subGroup_, v6, v14, v15);
    }
  }
  uint64_t v16 = *(uint64_t (**)(void))(v1 + 8);
  return v16();
}

uint64_t EventTracker.deinit()
{
  return v0;
}

uint64_t EventTracker.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_190C07248(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_190C0731C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_190C07D30((uint64_t)v12, *a3);
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
      sub_190C07D30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_190C0731C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_190C07474((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_190C286B0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_190C0754C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_190C286D0();
    if (!v8)
    {
      uint64_t result = sub_190C286E0();
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

void *sub_190C07474(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_190C286F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_190C0754C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_190C075E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_190C077C0(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_190C077C0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_190C075E4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_190C28680();
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
  unint64_t v3 = sub_190C07758(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_190C286C0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_190C286F0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_190C286E0();
  __break(1u);
  return result;
}

void *sub_190C07758(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A8800);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_190C077C0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A8800);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_190C07970(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_190C07898(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_190C07898(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_190C286F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_190C07970(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_190C286F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_190C07A00(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for EventTracker()
{
  return self;
}

uint64_t method lookup function for EventTracker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EventTracker);
}

uint64_t dispatch thunk of EventTracker.log(message:objcClassName:subGroup:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of EventTracker.log(message:objcClassName:subGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v5 + 104)
                                                                            + **(int **)(*(void *)v5 + 104));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *unint64_t v12 = v6;
  v12[1] = sub_190C07BEC;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t sub_190C07BEC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
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

uint64_t sub_190C07D30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t OUTLINED_FUNCTION_0(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return MEMORY[0x1F4127348](0, v1, v2);
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x192FD4D50);
}

uint64_t ___findBucket_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_190C09C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void parse(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  if (*(void *)(a1 + 16) < *(void *)(a1 + 8))
  {
    while (1)
    {
      unint64_t Varint = readVarint(a1);
      if (*(unsigned char *)(a1 + 40)) {
        break;
      }
      unint64_t v8 = Varint;
      unint64_t v9 = Varint >> 3;
      uint64_t v10 = *(void *)(a1 + 16);
      switch(Varint & 7)
      {
        case 0uLL:
          readVarint(a1);
          if (!*(unsigned char *)(a1 + 40)) {
            goto LABEL_18;
          }
          goto LABEL_25;
        case 1uLL:
          unint64_t v11 = v10 + 8;
          goto LABEL_16;
        case 2uLL:
          uint64_t v12 = readVarint(a1);
          if (*(unsigned char *)(a1 + 40)) {
            goto LABEL_25;
          }
          uint64_t v13 = *(void *)(a1 + 16);
          if ((unint64_t)(v13 + v12) > *(void *)(a1 + 8))
          {
LABEL_23:
            *(unsigned char *)(a1 + 40) = 1;
            goto LABEL_25;
          }
          *(void *)(a1 + 16) = v13 + v12;
          char v22 = 0;
          if (!v5[2](v5, v9, &v22)) {
            goto LABEL_20;
          }
          if (v22)
          {
            CFDataRef Mutable = CFDataCreateMutable(0, 0);
            uint64_t v15 = *(void *)(a1 + 16);
            v21[0] = v13;
            v21[1] = v15;
            v21[2] = v13;
            v21[3] = v13;
            v21[4] = Mutable;
            v21[5] = 0;
            *(void *)(a1 + 24) = v15;
            parse(v21, v5, v6);
            writeVarint(*(__CFData **)(a1 + 32), v8);
            CFIndex Length = CFDataGetLength(Mutable);
            if (Length < 0)
            {
              *(unsigned char *)(a1 + 40) = 1;
              CFRelease(Mutable);
              goto LABEL_25;
            }
            writeVarint(*(__CFData **)(a1 + 32), Length);
            unint64_t v17 = *(__CFData **)(a1 + 32);
            BytePtr = CFDataGetBytePtr(Mutable);
            CFIndex v19 = CFDataGetLength(Mutable);
            CFDataAppendBytes(v17, BytePtr, v19);
            CFRelease(Mutable);
            if (v6) {
              v6[2](v6);
            }
            unint64_t v20 = *(void *)(a1 + 16);
          }
          else
          {
LABEL_19:
            CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), *(const UInt8 **)(a1 + 24), *(void *)(a1 + 16) - *(void *)(a1 + 24));
LABEL_20:
            unint64_t v20 = *(void *)(a1 + 16);
            *(void *)(a1 + 24) = v20;
          }
          if (v20 >= *(void *)(a1 + 8)) {
            goto LABEL_25;
          }
          break;
        case 5uLL:
          unint64_t v11 = v10 + 4;
LABEL_16:
          if (v11 > *(void *)(a1 + 8)) {
            goto LABEL_23;
          }
          *(void *)(a1 + 16) = v11;
LABEL_18:
          LOBYTE(v21[0]) = 0;
          if (((unsigned int (**)(id, unint64_t, void *))v5)[2](v5, v9, v21)) {
            goto LABEL_19;
          }
          goto LABEL_20;
        default:
          goto LABEL_23;
      }
    }
  }
LABEL_25:
}

uint64_t readVarint(uint64_t a1)
{
  int v2 = 0;
  uint64_t result = 0;
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16) + 1;
  while (1)
  {
    if (v5 > v4)
    {
LABEL_6:
      uint64_t result = 0;
      *(unsigned char *)(a1 + 40) = 1;
      return result;
    }
    *(void *)(a1 + 16) = v5;
    if (*(unsigned char *)(a1 + 40)) {
      return 0;
    }
    result |= (unint64_t)(*(unsigned char *)(v5 - 1) & 0x7F) << v2;
    if ((*(unsigned char *)(v5 - 1) & 0x80) == 0) {
      return result;
    }
    v2 += 7;
    ++v5;
    if (v2 == 70) {
      goto LABEL_6;
    }
  }
}

void writeVarint(__CFData *a1, unint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
    int v2 = bytes;
  }
  else
  {
    int v2 = bytes;
    do
    {
      *v2++ = a2 | 0x80;
      unint64_t v3 = a2 >> 7;
      unint64_t v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  UInt8 *v2 = v3;
  CFDataAppendBytes(a1, bytes, v2 - bytes + 1);
}

BOOL PETDistributionReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 40) |= 4u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint32_t v27 = &OBJC_IVAR___PETDistribution__min;
          goto LABEL_41;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint32_t v27 = &OBJC_IVAR___PETDistribution__max;
          goto LABEL_41;
        case 3u:
          *(unsigned char *)(a1 + 40) |= 2u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint32_t v27 = &OBJC_IVAR___PETDistribution__mean;
          goto LABEL_41;
        case 4u:
          *(unsigned char *)(a1 + 40) |= 8u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint32_t v27 = &OBJC_IVAR___PETDistribution__variance;
LABEL_41:
          *(void *)(a1 + *v27) = v20;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id createBlankStorage()
{
  id v0 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:1024];
  memset((void *)[v0 mutableBytes], 255, 0x400uLL);

  return v0;
}

uint64_t PETAggregationKeyReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_42;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_44;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_44:
        uint64_t v36 = 32;
        goto LABEL_49;
      case 2u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v30;
            v20 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_48:
        uint64_t v36 = 16;
LABEL_49:
        *(_DWORD *)(a1 + v36) = v20;
        goto LABEL_52;
      case 3u:
        *(unsigned char *)(a1 + 36) |= 1u;
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v34 = *(void *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v34 = 0;
        }
        *(void *)(a1 + 8) = v34;
        goto LABEL_52;
      case 4u:
        __int16 v35 = objc_alloc_init(PETRawMessage);
        objc_storeStrong((id *)(a1 + 24), v35);
        if PBReaderPlaceMark() && (PETRawMessageReadFrom((uint64_t)v35, a2))
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_52;
    }
  }
}

uint64_t PET1KeyReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__604(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__605(uint64_t a1)
{
}

void sub_190C10FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PETUploadReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(PETMetadata);
        objc_storeStrong((id *)(a1 + 32), v17);
        if PBReaderPlaceMark() && (PETMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_27;
        }
        goto LABEL_46;
      case 2u:
        uint64_t v17 = objc_alloc_init(PETAggregatedMessage);
        [(id)a1 addAggregatedMessages:v17];
        if (!PBReaderPlaceMark() || (PETAggregatedMessageReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_27;
      case 3u:
        uint64_t v17 = objc_alloc_init(PETRawMessage);
        [(id)a1 addUnaggregatedMessages:v17];
        if PBReaderPlaceMark() && (PETRawMessageReadFrom((uint64_t)v17, a2))
        {
LABEL_27:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      case 5u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_43:
        *(unsigned char *)(a1 + 48) = v21 != 0;
        goto LABEL_44;
      case 6u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 16;
        goto LABEL_39;
      case 7u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 24;
LABEL_39:
        unsigned int v27 = *(void **)(a1 + v26);
        *(void *)(a1 + v26) = v25;

        goto LABEL_44;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

uint64_t PETMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 2u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 100) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_101;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_103;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_101:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_103:
          *(void *)(a1 + 8) = v19;
          continue;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
          goto LABEL_99;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_99;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 16;
          goto LABEL_99;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 100) |= 0x20u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_107:
          BOOL v80 = v28 != 0;
          uint64_t v81 = 94;
          goto LABEL_136;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 100) |= 0x80u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_111:
          BOOL v80 = v34 != 0;
          uint64_t v81 = 96;
          goto LABEL_136;
        case 8u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 100) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_115:
          BOOL v80 = v40 != 0;
          uint64_t v81 = 93;
          goto LABEL_136;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_99;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
          goto LABEL_99;
        case 0xBu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(_WORD *)(a1 + 100) |= 2u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v46) = 0;
          }
LABEL_119:
          uint64_t v82 = 24;
          goto LABEL_141;
        case 0xCu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(_WORD *)(a1 + 100) |= 0x100u;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  uint64_t v52 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_123:
          BOOL v80 = v52 != 0;
          uint64_t v81 = 97;
          goto LABEL_136;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_99;
        case 0xEu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + 100) |= 0x200u;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  uint64_t v58 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_127:
          BOOL v80 = v58 != 0;
          uint64_t v81 = 98;
          goto LABEL_136;
        case 0xFu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          *(_WORD *)(a1 + 100) |= 0x40u;
          while (2)
          {
            uint64_t v65 = *v3;
            unint64_t v66 = *(void *)(a2 + v65);
            if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
              *(void *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  uint64_t v64 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v64 = 0;
          }
LABEL_131:
          BOOL v80 = v64 != 0;
          uint64_t v81 = 95;
          goto LABEL_136;
        case 0x10u:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          *(_WORD *)(a1 + 100) |= 8u;
          while (2)
          {
            uint64_t v71 = *v3;
            unint64_t v72 = *(void *)(a2 + v71);
            if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
              *(void *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                BOOL v14 = v69++ >= 9;
                if (v14)
                {
                  uint64_t v70 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v70 = 0;
          }
LABEL_135:
          BOOL v80 = v70 != 0;
          uint64_t v81 = 92;
LABEL_136:
          *(unsigned char *)(a1 + v81) = v80;
          continue;
        case 0x11u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_99;
        case 0x12u:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v46 = 0;
          *(_WORD *)(a1 + 100) |= 4u;
          break;
        case 0x13u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
LABEL_99:
          v79 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v76 = *v3;
        unint64_t v77 = *(void *)(a2 + v76);
        if (v77 == -1 || v77 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v77);
        *(void *)(a2 + v76) = v77 + 1;
        v46 |= (unint64_t)(v78 & 0x7F) << v74;
        if ((v78 & 0x80) == 0) {
          goto LABEL_138;
        }
        v74 += 7;
        BOOL v14 = v75++ >= 9;
        if (v14)
        {
          LODWORD(v46) = 0;
          goto LABEL_140;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_138:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v46) = 0;
      }
LABEL_140:
      uint64_t v82 = 88;
LABEL_141:
      *(_DWORD *)(a1 + v82) = v46;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_190C15264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id displayStringForKey(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = a2;
  do
  {
    unint64_t v5 = (void *)[[NSString alloc] initWithBytes:a1 length:v4 encoding:qword_190C2D960[v3]];
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 3;
    }
    ++v3;
  }
  while (!v6);

  return v5;
}

void enumerateChain(uint64_t a1, unint64_t a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  unint64_t v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  id v14 = a6;
  int v15 = MEMORY[0x1E4F14500];
  while (v10 != 0xFFFFFFFF)
  {
    unint64_t v16 = v10 + 10;
    if (v10 + 10 <= a2)
    {
      unint64_t v17 = a1 + v10;
      if (*(unsigned __int8 *)(a1 + v10) == 228)
      {
        uint64_t v18 = *(unsigned __int16 *)(v17 + 4);
        unsigned int v19 = v16 + v18;
        if (v16 + v18 + *(unsigned __int16 *)(v17 + 2) <= a2)
        {
          unint64_t v20 = *(unsigned int *)(v17 + 6);
          uint64_t v13 = v17 + 10;
          switch(*(unsigned char *)(v17 + 1))
          {
            case 0:
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                __int16 v26 = 0;
                unint64_t v21 = (uint8_t *)&v26;
                char v22 = v15;
                unint64_t v23 = "Can not have value node inside value node";
                goto LABEL_17;
              }
              break;
            case 1:
              if (v11) {
                v11[2](v11, v13, v18, *(double *)(a1 + v19));
              }
              break;
            case 2:
              visitDistribution(a1, a2, v13, v18, v19, v12, v14);
              break;
            case 3:
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v25) = 0;
                unint64_t v21 = (uint8_t *)&v25;
                char v22 = v15;
                unint64_t v23 = "Can not have distribution-tail node inside value node";
LABEL_17:
                _os_log_error_impl(&dword_190C01000, v22, OS_LOG_TYPE_ERROR, v23, v21, 2u);
              }
              break;
            default:
              break;
          }
          BOOL v24 = v10 >= v20;
          unint64_t v10 = v20;
          if (!v24) {
            continue;
          }
        }
      }
    }
    objc_msgSend(v14, "saveCorruptState", v13, v25);
    [v14 resetLocked];
    __break(1u);
    JUMPOUT(0x190C159F0);
  }
}

void visitDistribution(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6, void *a7)
{
  v38[8] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (!v13) {
    goto LABEL_21;
  }
  unint64_t v16 = (unsigned __int16 *)(a1 + a5);
  if (*((_DWORD *)v16 + 11) != 1167568894)
  {
LABEL_23:
    [v15 saveCorruptState];
    [v15 resetLocked];
    __break(1u);
  }
  uint64_t v35 = a3;
  unsigned int v36 = a4;
  id v37 = v14;
  unsigned int v34 = *v16;
  uint64_t v17 = *((unsigned int *)v16 + 1);
  double v18 = *((double *)v16 + 1);
  double v19 = *((double *)v16 + 2);
  double v20 = *((double *)v16 + 3);
  double v21 = *((double *)v16 + 4);
  unint64_t v22 = *((unsigned int *)v16 + 10);
  unsigned int v23 = v16[1];
  MEMORY[0x1F4188790]();
  bzero(v33, 0x83FuLL);
  MEMORY[0x1F4188790]();
  bzero(v32, 0x20FuLL);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __visitDistribution_block_invoke;
  v38[3] = &__block_descriptor_64_e5_v8__0l;
  v38[4] = v33;
  v38[5] = 1;
  v38[6] = v32;
  v38[7] = 1;
  BOOL v24 = (void (**)(void))MEMORY[0x192FD4A60](v38);
  v33[0] = v16 + 24;
  if (v23 >= 0xFA) {
    __int16 v26 = 250;
  }
  else {
    __int16 v26 = v23;
  }
  LOWORD(v32[0]) = v26;
  if (v22 != 0xFFFFFFFF)
  {
    unsigned __int16 v28 = v23 - v26;
    uint64_t v27 = 1;
    while (v22 + 2048 <= a2)
    {
      uint64_t v29 = (unsigned int *)(a1 + v22);
      if (*(_DWORD *)(a1 + v22 + 4) != -461418838) {
        break;
      }
      unint64_t v30 = *v29;
      v33[v27] = v29 + 2;
      __int16 v31 = v28;
      if (v28 >= 0xFFu) {
        __int16 v31 = 255;
      }
      *((_WORD *)v32 + v27) = v31;
      if (v22 >= v30) {
        break;
      }
      ++v27;
      v28 -= v31;
      unint64_t v22 = v30;
      if (v30 == 0xFFFFFFFF) {
        goto LABEL_15;
      }
    }
    id v15 = v37;
    objc_msgSend(v37, "saveCorruptState", v32[0]);
    [v15 resetLocked];
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v27 = 1;
LABEL_15:
  if (v17 <= 1) {
    v25.n128_u64[0] = 0x7FF8000000000000;
  }
  else {
    v25.n128_f64[0] = v19 / (double)(v17 - 1);
  }
  (*((void (**)(id, uint64_t, void, void, uint64_t, uint64_t, void *, void *, double, __n128, double, double))v13
   + 2))(v13, v35, v36, v34, v17, v27, v33, v32, v18, v25, v20, v21);
  if (v24) {
    v24[2](v24);
  }

  id v15 = v37;
LABEL_21:
}

void sub_190C15CFC(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void __visitDistribution_block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    free(*(void **)(a1 + 32));
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    int v2 = *(void **)(a1 + 48);
    free(v2);
  }
}

void callWithHashableBytesOfString(void *a1, void *a2)
{
  theString = a1;
  uint64_t v3 = a2;
  CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  if (CStringPtr)
  {
    unint64_t v5 = (void *)CStringPtr;
    unsigned __int16 v6 = [(__CFString *)theString length];
    int64_t v7 = (void (*)(void *, void *, uint64_t))v3[2];
    uint64_t v8 = v6;
LABEL_5:
    v7(v3, v5, v8);
    goto LABEL_6;
  }
  CharactersPtr = CFStringGetCharactersPtr(theString);
  if (CharactersPtr)
  {
    unint64_t v5 = (void *)CharactersPtr;
    __int16 v10 = [(__CFString *)theString length];
    int64_t v7 = (void (*)(void *, void *, uint64_t))v3[2];
    uint64_t v8 = 2 * (v10 & 0x7FFFu);
    goto LABEL_5;
  }
  if ([(__CFString *)theString canBeConvertedToEncoding:1])
  {
    uint64_t v11 = theString;
    ((void (*)(void *, uint64_t, void))v3[2])(v3, [(__CFString *)v11 UTF8String], (unsigned __int16)[(__CFString *)v11 length]);
  }
  else
  {
    id v12 = malloc_type_malloc(2 * [(__CFString *)theString length], 0x1000040BDFB0063uLL);
    [(__CFString *)theString getCharacters:v12];
    ((void (*)(void *, void *, void))v3[2])(v3, v12, 2 * ([(__CFString *)theString length] & 0x7FFF));
    free(v12);
  }
LABEL_6:
}

void setBucketPtr(uint64_t a1, unint64_t a2, unsigned int a3, int a4, void *a5)
{
  id v9 = a5;
  if ((unint64_t)a3 + 4 <= a2 && *(_DWORD *)(a1 + a3) == -1)
  {
    *(_DWORD *)(a1 + a3) = a4;
  }
  else
  {
    __int16 v10 = v9;
    [v9 saveCorruptState];
    [v10 resetLocked];
    __break(1u);
  }
}

void sub_190C1657C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t COMAPPLEPETCOMMONPETMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 2u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_109;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_111;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_109:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_111:
          *(void *)(a1 + 8) = v19;
          continue;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_107;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 40;
          goto LABEL_107;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 16;
          goto LABEL_107;
        case 6u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (v14)
                {
                  uint64_t v27 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_115:
          BOOL v85 = v27 != 0;
          uint64_t v86 = 110;
          goto LABEL_144;
        case 7u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(_WORD *)(a1 + 116) |= 0x100u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v33 = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_119:
          BOOL v85 = v33 != 0;
          uint64_t v86 = 112;
          goto LABEL_144;
        case 8u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          while (2)
          {
            uint64_t v40 = *v3;
            unint64_t v41 = *(void *)(a2 + v40);
            if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                BOOL v14 = v38++ >= 9;
                if (v14)
                {
                  uint64_t v39 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v39 = 0;
          }
LABEL_123:
          BOOL v85 = v39 != 0;
          uint64_t v86 = 109;
          goto LABEL_144;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 32;
          goto LABEL_107;
        case 0xAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_107;
        case 0xBu:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(_WORD *)(a1 + 116) |= 2u;
          while (2)
          {
            uint64_t v46 = *v3;
            unint64_t v47 = *(void *)(a2 + v46);
            if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v14 = v44++ >= 9;
                if (v14)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v45) = 0;
          }
LABEL_127:
          uint64_t v87 = 24;
          goto LABEL_153;
        case 0xCu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
          while (2)
          {
            uint64_t v52 = *v3;
            unint64_t v53 = *(void *)(a2 + v52);
            if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
              *(void *)(a2 + v52) = v53 + 1;
              v51 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  uint64_t v51 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v51 = 0;
          }
LABEL_131:
          BOOL v85 = v51 != 0;
          uint64_t v86 = 113;
          goto LABEL_144;
        case 0xDu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_107;
        case 0xEu:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          *(_WORD *)(a1 + 116) |= 0x400u;
          while (2)
          {
            uint64_t v58 = *v3;
            unint64_t v59 = *(void *)(a2 + v58);
            if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
              *(void *)(a2 + v58) = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                BOOL v14 = v56++ >= 9;
                if (v14)
                {
                  uint64_t v57 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v57 = 0;
          }
LABEL_135:
          BOOL v85 = v57 != 0;
          uint64_t v86 = 114;
          goto LABEL_144;
        case 0xFu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
          while (2)
          {
            uint64_t v64 = *v3;
            unint64_t v65 = *(void *)(a2 + v64);
            if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                BOOL v14 = v62++ >= 9;
                if (v14)
                {
                  uint64_t v63 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v63 = 0;
          }
LABEL_139:
          BOOL v85 = v63 != 0;
          uint64_t v86 = 111;
          goto LABEL_144;
        case 0x10u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v69 = 0;
          *(_WORD *)(a1 + 116) |= 0x10u;
          while (2)
          {
            uint64_t v70 = *v3;
            unint64_t v71 = *(void *)(a2 + v70);
            if (v71 == -1 || v71 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v71);
              *(void *)(a2 + v70) = v71 + 1;
              v69 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                BOOL v14 = v68++ >= 9;
                if (v14)
                {
                  uint64_t v69 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v69 = 0;
          }
LABEL_143:
          BOOL v85 = v69 != 0;
          uint64_t v86 = 108;
LABEL_144:
          *(unsigned char *)(a1 + v86) = v85;
          continue;
        case 0x11u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_107;
        case 0x12u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v45 = 0;
          *(_WORD *)(a1 + 116) |= 8u;
          while (2)
          {
            uint64_t v75 = *v3;
            unint64_t v76 = *(void *)(a2 + v75);
            if (v76 == -1 || v76 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
              *(void *)(a2 + v75) = v76 + 1;
              v45 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                BOOL v14 = v74++ >= 9;
                if (v14)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v45) = 0;
          }
LABEL_148:
          uint64_t v87 = 104;
          goto LABEL_153;
        case 0x13u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_107;
        case 0x14u:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v45 = 0;
          *(_WORD *)(a1 + 116) |= 4u;
          break;
        case 0x16u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
LABEL_107:
          v84 = *(void **)(a1 + v24);
          *(void *)(a1 + v24) = v23;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v80 = *v3;
        unint64_t v81 = *(void *)(a2 + v80);
        if (v81 == -1 || v81 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
        *(void *)(a2 + v80) = v81 + 1;
        v45 |= (unint64_t)(v82 & 0x7F) << v78;
        if ((v82 & 0x80) == 0) {
          goto LABEL_150;
        }
        v78 += 7;
        BOOL v14 = v79++ >= 9;
        if (v14)
        {
          LODWORD(v45) = 0;
          goto LABEL_152;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_150:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v45) = 0;
      }
LABEL_152:
      uint64_t v87 = 88;
LABEL_153:
      *(_DWORD *)(a1 + v87) = v45;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PETAggregatedMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unsigned int v18 = objc_alloc_init(PETDistribution);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || !PETDistributionReadFrom((uint64_t)v18, a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 == 2)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_37;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              LODWORD(v21) = 0;
              goto LABEL_39;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_39:
          *(_DWORD *)(a1 + 8) = v21;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        unsigned int v18 = objc_alloc_init(PETAggregationKey);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (PETAggregationKeyReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PETRawMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 28) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 16;
      }
      unsigned int v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t chunkCompareByOffset(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t ___findBucket_block_invoke_1544(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_60;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_62:
          uint64_t v54 = 24;
          goto LABEL_80;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 0x20u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_66:
          uint64_t v55 = 40;
          goto LABEL_75;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 8u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_70:
          uint64_t v55 = 32;
          goto LABEL_75;
        case 4u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            uint64_t v42 = *(void *)(a2 + v41);
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v43;
              v28 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v15 = v40++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_74:
          uint64_t v55 = 36;
LABEL_75:
          *(_DWORD *)(a1 + v55) = v28;
          continue;
        case 5u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          break;
        case 6u:
          *(unsigned char *)(a1 + 44) |= 1u;
          uint64_t v51 = *v3;
          unint64_t v52 = *(void *)(a2 + v51);
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v53 = *(void *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v52 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v53 = 0;
          }
          *(void *)(a1 + 8) = v53;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        uint64_t v48 = *(void *)(a2 + v47);
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)(a2 + *v4)) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0) {
          goto LABEL_77;
        }
        v45 += 7;
        BOOL v15 = v46++ >= 9;
        if (v15)
        {
          uint64_t v20 = 0;
          goto LABEL_79;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v20 = 0;
      }
LABEL_79:
      uint64_t v54 = 16;
LABEL_80:
      *(void *)(a1 + v54) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSUberEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 144) |= 4u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_68;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_70;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_70:
        *(_DWORD *)(a1 + 72) = v19;
        goto LABEL_80;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 32;
        goto LABEL_53;
      case 3u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 104;
        goto LABEL_53;
      case 4u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 112;
        goto LABEL_53;
      case 5u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 96;
        goto LABEL_53;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 136;
        goto LABEL_53;
      case 7u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 40;
        goto LABEL_53;
      case 8u:
        char v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSInferenceEvent);
        objc_storeStrong((id *)(a1 + 88), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 9u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 144) |= 2u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_74:
        uint64_t v39 = 16;
        goto LABEL_79;
      case 0xAu:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 128;
        goto LABEL_53;
      case 0xBu:
        char v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSAssetEvent);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 0xCu:
        char v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent);
        objc_storeStrong((id *)(a1 + 80), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 0xDu:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 48;
        goto LABEL_53;
      case 0xEu:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 56;
LABEL_53:
        char v33 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_80;
      case 0xFu:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 144) |= 1u;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v29 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_78:
        uint64_t v39 = 8;
LABEL_79:
        *(void *)(a1 + v39) = v29;
        goto LABEL_80;
      case 0x10u:
        char v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSError);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark() || (COMAPPLEPROACTIVEGMSGMSErrorReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 0x11u:
        char v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSPrewarmEvent);
        objc_storeStrong((id *)(a1 + 120), v26);
        if (PBReaderPlaceMark()
          && (COMAPPLEPROACTIVEGMSGMSPrewarmEventReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_66:
          PBReaderRecallMark();

LABEL_80:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_82:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_80;
    }
  }
}

BOOL COMAPPLEPROACTIVEGMSGMSPETUploadEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(COMAPPLEPETCOMMONPETMetadata);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (COMAPPLEPETCOMMONPETMetadataReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v17 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSUberEvent);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (COMAPPLEPROACTIVEGMSGMSUberEventReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(unsigned char *)(a1 + 64) |= 0x10u;
              break;
            case 2u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 48;
              goto LABEL_30;
            case 3u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 56;
LABEL_30:
              unsigned int v28 = *(void **)(a1 + v27);
              *(void *)(a1 + v27) = v26;

              goto LABEL_56;
            case 4u:
              *(unsigned char *)(a1 + 64) |= 8u;
              uint64_t v29 = *v3;
              unint64_t v30 = *(void *)(a2 + v29);
              if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
                *(void *)(a2 + v29) = v30 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v31 = 0;
              }
              uint64_t v38 = 32;
              goto LABEL_55;
            case 5u:
              *(unsigned char *)(a1 + 64) |= 2u;
              uint64_t v32 = *v3;
              unint64_t v33 = *(void *)(a2 + v32);
              if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v33);
                *(void *)(a2 + v32) = v33 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v31 = 0;
              }
              uint64_t v38 = 16;
              goto LABEL_55;
            case 6u:
              *(unsigned char *)(a1 + 64) |= 1u;
              uint64_t v34 = *v3;
              unint64_t v35 = *(void *)(a2 + v34);
              if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v35);
                *(void *)(a2 + v34) = v35 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v31 = 0;
              }
              uint64_t v38 = 8;
              goto LABEL_55;
            case 7u:
              *(unsigned char *)(a1 + 64) |= 4u;
              uint64_t v36 = *v3;
              unint64_t v37 = *(void *)(a2 + v36);
              if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v37);
                *(void *)(a2 + v36) = v37 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v31 = 0;
              }
              uint64_t v38 = 24;
LABEL_55:
              *(void *)(a1 + v38) = v31;
              goto LABEL_56;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_56:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_44;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_46:
          *(void *)(a1 + 40) = v20;
          goto LABEL_56;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = 0x1E92A8000uLL;
    unint64_t v8 = 0x1E92A8000uLL;
    unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v10 = 0x1E92A8000uLL;
    unint64_t v11 = 0x1E92A8000uLL;
    unint64_t v12 = 0x1E92A8000uLL;
    unint64_t v13 = 0x1E92A8000uLL;
    unint64_t v14 = 0x1E92A8000uLL;
    unint64_t v15 = 0x1E92A8000uLL;
    unint64_t v16 = 0x1E92A8000uLL;
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v3;
        uint64_t v21 = *(void *)(a2 + v20);
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)(a2 + *v4)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)(a2 + *v9) + v21);
        *(void *)(a2 + v20) = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_12;
        }
        v17 += 7;
        BOOL v24 = v18++ >= 9;
        if (v24)
        {
          unint64_t v19 = 0;
          int v25 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v25 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v19 = 0;
      }
LABEL_14:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x100000u;
          while (1)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v9) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_121;
            }
            v27 += 7;
            BOOL v24 = v28++ >= 9;
            if (v24)
            {
              LODWORD(v29) = 0;
              goto LABEL_123;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_121:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_123:
          *(_DWORD *)(a1 + *(int *)(v8 + 1892)) = v29;
          continue;
        case 2u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 8u;
          while (2)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v9) + v44);
              *(void *)(a2 + v43) = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v24 = v41++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_127:
          uint64_t v114 = *(int *)(v10 + 1896);
          goto LABEL_156;
        case 3u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x10u;
          while (2)
          {
            uint64_t v49 = *v3;
            uint64_t v50 = *(void *)(a2 + v49);
            unint64_t v51 = v50 + 1;
            if (v50 == -1 || v51 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v9) + v50);
              *(void *)(a2 + v49) = v51;
              v42 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v24 = v48++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_131:
          uint64_t v114 = *(int *)(v11 + 1900);
          goto LABEL_156;
        case 4u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x40000u;
          uint64_t v53 = *v3;
          unint64_t v54 = *(void *)(a2 + v53);
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v54);
            *(void *)(a2 + v53) = v54 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = *(int *)(v12 + 1904);
          goto LABEL_181;
        case 5u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x10000u;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v57);
            *(void *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = *(int *)(v13 + 1908);
          goto LABEL_181;
        case 6u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x20000u;
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v59);
            *(void *)(a2 + v58) = v59 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = *(int *)(v14 + 1912);
          goto LABEL_181;
        case 7u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x80000u;
          while (2)
          {
            uint64_t v62 = *v3;
            uint64_t v63 = *(void *)(a2 + v62);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v9) + v63);
              *(void *)(a2 + v62) = v64;
              v42 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v24 = v61++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_135:
          uint64_t v114 = *(int *)(v15 + 1916);
          goto LABEL_156;
        case 8u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 4u;
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v67);
            *(void *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = *(int *)(v16 + 1920);
          goto LABEL_181;
        case 9u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 2u;
          uint64_t v68 = *v3;
          unint64_t v69 = *(void *)(a2 + v68);
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v69);
            *(void *)(a2 + v68) = v69 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 16;
          goto LABEL_181;
        case 0xAu:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 1u;
          uint64_t v70 = *v3;
          unint64_t v71 = *(void *)(a2 + v70);
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v71);
            *(void *)(a2 + v70) = v71 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 8;
          goto LABEL_181;
        case 0xBu:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x1000u;
          while (2)
          {
            uint64_t v74 = *v3;
            uint64_t v75 = *(void *)(a2 + v74);
            unint64_t v76 = v75 + 1;
            if (v75 == -1 || v76 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)(a2 + *v9) + v75);
              *(void *)(a2 + v74) = v76;
              v42 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                BOOL v24 = v73++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_139:
          uint64_t v114 = 104;
          goto LABEL_156;
        case 0xCu:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x20u;
          while (2)
          {
            uint64_t v80 = *v3;
            uint64_t v81 = *(void *)(a2 + v80);
            unint64_t v82 = v81 + 1;
            if (v81 == -1 || v82 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)(a2 + *v9) + v81);
              *(void *)(a2 + v80) = v82;
              v42 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                BOOL v24 = v79++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_143:
          uint64_t v114 = 48;
          goto LABEL_156;
        case 0xDu:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x400u;
          while (2)
          {
            uint64_t v86 = *v3;
            uint64_t v87 = *(void *)(a2 + v86);
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)(a2 + *v9) + v87);
              *(void *)(a2 + v86) = v88;
              v42 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                BOOL v24 = v85++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_147:
          uint64_t v114 = 88;
          goto LABEL_156;
        case 0xEu:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x100u;
          uint64_t v90 = *v3;
          unint64_t v91 = *(void *)(a2 + v90);
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v91);
            *(void *)(a2 + v90) = v91 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 72;
          goto LABEL_181;
        case 0xFu:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x4000u;
          uint64_t v92 = *v3;
          unint64_t v93 = *(void *)(a2 + v92);
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v93);
            *(void *)(a2 + v92) = v93 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 120;
          goto LABEL_181;
        case 0x10u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x200u;
          uint64_t v94 = *v3;
          unint64_t v95 = *(void *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v95);
            *(void *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 80;
          goto LABEL_181;
        case 0x11u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x80u;
          while (2)
          {
            uint64_t v98 = *v3;
            uint64_t v99 = *(void *)(a2 + v98);
            unint64_t v100 = v99 + 1;
            if (v99 == -1 || v100 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v101 = *(unsigned char *)(*(void *)(a2 + *v9) + v99);
              *(void *)(a2 + v98) = v100;
              v42 |= (unint64_t)(v101 & 0x7F) << v96;
              if (v101 < 0)
              {
                v96 += 7;
                BOOL v24 = v97++ >= 9;
                if (v24)
                {
                  uint64_t v42 = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_151:
          uint64_t v114 = 64;
          goto LABEL_156;
        case 0x12u:
          char v102 = 0;
          unsigned int v103 = 0;
          uint64_t v42 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x8000u;
          break;
        case 0x13u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x2000u;
          uint64_t v108 = *v3;
          unint64_t v109 = *(void *)(a2 + v108);
          if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v109);
            *(void *)(a2 + v108) = v109 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 112;
          goto LABEL_181;
        case 0x14u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x40u;
          uint64_t v110 = *v3;
          unint64_t v111 = *(void *)(a2 + v110);
          if (v111 <= 0xFFFFFFFFFFFFFFF7 && v111 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v111);
            *(void *)(a2 + v110) = v111 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 56;
          goto LABEL_181;
        case 0x15u:
          *(_DWORD *)(a1 + *(int *)(v7 + 1888)) |= 0x800u;
          uint64_t v112 = *v3;
          unint64_t v113 = *(void *)(a2 + v112);
          if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v55 = *(void *)(*(void *)(a2 + *v9) + v113);
            *(void *)(a2 + v112) = v113 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v55 = 0;
          }
          uint64_t v115 = 96;
LABEL_181:
          *(void *)(a1 + v115) = v55;
          continue;
        default:
          unint64_t v34 = v8;
          unint64_t v35 = v10;
          unint64_t v36 = v11;
          unint64_t v37 = v7;
          unint64_t v38 = v12;
          uint64_t result = PBReaderSkipValueWithTag();
          unint64_t v12 = v38;
          unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
          unint64_t v7 = v37;
          unint64_t v13 = 0x1E92A8000;
          unint64_t v11 = v36;
          unint64_t v14 = 0x1E92A8000;
          unint64_t v10 = v35;
          unint64_t v16 = 0x1E92A8000;
          unint64_t v8 = v34;
          unint64_t v15 = 0x1E92A8000;
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v104 = *v3;
        uint64_t v105 = *(void *)(a2 + v104);
        unint64_t v106 = v105 + 1;
        if (v105 == -1 || v106 > *(void *)(a2 + *v4)) {
          break;
        }
        char v107 = *(unsigned char *)(*(void *)(a2 + *v9) + v105);
        *(void *)(a2 + v104) = v106;
        v42 |= (unint64_t)(v107 & 0x7F) << v102;
        if ((v107 & 0x80) == 0) {
          goto LABEL_153;
        }
        v102 += 7;
        BOOL v24 = v103++ >= 9;
        if (v24)
        {
          uint64_t v42 = 0;
          goto LABEL_155;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_153:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v42 = 0;
      }
LABEL_155:
      uint64_t v114 = 128;
LABEL_156:
      *(void *)(a1 + v114) = v42;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSPrewarmEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 28) |= 1u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 8) = v28;
      }
      else if (v18 == 2)
      {
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 28) |= 4u;
        while (1)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0) {
            goto LABEL_45;
          }
          v29 += 7;
          BOOL v15 = v30++ >= 9;
          if (v15)
          {
            LODWORD(v31) = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v31) = 0;
        }
LABEL_47:
        *(_DWORD *)(a1 + 24) = v31;
      }
      else if (v18 == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_41;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            uint64_t v21 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_43:
        *(void *)(a1 + 16) = v21;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSErrorReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_43:
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_190C28620()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_190C28640()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_190C28650()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_190C28660()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_190C28670()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_190C28680()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_190C28690()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_190C286A0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_190C286B0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_190C286C0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_190C286D0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_190C286E0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_190C286F0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}