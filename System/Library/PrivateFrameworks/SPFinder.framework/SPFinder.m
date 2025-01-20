uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
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

void sub_2211E5D6C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211E5F58(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t finderStateChangedHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_2211E2000, v10, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager Received SPFinderStateChangedNotification distributed notification.", (uint8_t *)&v13, 2u);
  }

  v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138413058;
    uint64_t v14 = a1;
    __int16 v15 = 2112;
    uint64_t v16 = a3;
    __int16 v17 = 2112;
    uint64_t v18 = a4;
    __int16 v19 = 2112;
    uint64_t v20 = a5;
    _os_log_debug_impl(&dword_2211E2000, v11, OS_LOG_TYPE_DEBUG, "Finder State FWK: %@, %@, %@, %@", (uint8_t *)&v13, 0x2Au);
  }

  return [a2 updateStateBlock];
}

id LogCategory_Unspecified()
{
  if (LogCategory_Unspecified_onceToken != -1) {
    dispatch_once(&LogCategory_Unspecified_onceToken, &__block_literal_global);
  }
  v0 = (void *)LogCategory_Unspecified_log;
  return v0;
}

id LogCategory_AdvertisementCache()
{
  if (LogCategory_AdvertisementCache_onceToken != -1) {
    dispatch_once(&LogCategory_AdvertisementCache_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)LogCategory_AdvertisementCache_log;
  return v0;
}

void sub_2211E96C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211E99B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211E9C68(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211E9F14(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211EA354(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211EA600(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211EA8B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2211EAA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_2211EABD4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_2211EACEC()
{
  *(void *)(v1 + 64) = v0;
  return MEMORY[0x270FA2498](sub_2211EAD0C, v0, 0);
}

uint64_t sub_2211EAD0C()
{
  swift_beginAccess();
  uint64_t v1 = swift_bridgeObjectRetain();
  char v2 = sub_2211EBA98(v1);
  swift_bridgeObjectRelease();
  if (v2)
  {
    sub_2211ED080();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_2211ED010();
    sub_2211ED090();
    sub_2211ED010();
    return sub_2211ED0A0();
  }
  else
  {
    swift_beginAccess();
    sub_2211EB238();
    swift_endAccess();
    if (qword_267F47A80 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2211ECFE0();
    __swift_project_value_buffer(v4, (uint64_t)qword_267F47D10);
    v5 = sub_2211ECFC0();
    os_log_type_t v6 = sub_2211ED050();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2211E2000, v5, v6, "Booted SPOwner locationd Swift context", v7, 2u);
      MEMORY[0x223C7BB40](v7, -1, -1);
    }

    v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_2211EAF50()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for SwiftBootstrapManager()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SwiftBootstrapManager.Context(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SwiftBootstrapManager.Context(unsigned char *result, int a2, int a3)
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
        *result = a2;
        return result;
      case 2:
        *(_WORD *)result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *result = 0;
      break;
    case 2:
      *(_WORD *)result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2211EB098);
    case 4:
      *(_DWORD *)result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2211EB0C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for SwiftBootstrapManager.Context()
{
  return &type metadata for SwiftBootstrapManager.Context;
}

uint64_t sub_2211EB0DC()
{
  return v0;
}

uint64_t sub_2211EB0F8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2211ED0B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2211EB14C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2211EBB34();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2211EB178()
{
  unint64_t result = qword_267F47A98;
  if (!qword_267F47A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F47A98);
  }
  return result;
}

uint64_t sub_2211EB1CC()
{
  uint64_t v0 = sub_2211ECFE0();
  __swift_allocate_value_buffer(v0, qword_267F47D10);
  __swift_project_value_buffer(v0, (uint64_t)qword_267F47D10);
  return sub_2211ECFD0();
}

BOOL sub_2211EB238()
{
  uint64_t v1 = *v0;
  sub_2211ED0D0();
  swift_bridgeObjectRetain();
  sub_2211ED000();
  unint64_t v2 = sub_2211ED0E0() & ~(-1 << *(unsigned char *)(v1 + 32));
  uint64_t v3 = (1 << v2) & *(void *)(v1 + ((v2 >> 3) & 0xFFFFFFFFFFFFFF8) + 56);
  swift_bridgeObjectRelease();
  if (!v3)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v0;
    uint64_t *v0 = 0x8000000000000000;
    sub_2211EB5C0(v2, isUniquelyReferenced_nonNull_native);
    uint64_t *v0 = v6;
    swift_bridgeObjectRelease();
  }
  return v3 == 0;
}

uint64_t sub_2211EB328()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F47AA0);
  uint64_t v3 = sub_2211ED070();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    uint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (!v8)
      {
        int64_t v14 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v14 >= v9) {
          goto LABEL_31;
        }
        uint64_t v8 = v6[v14];
        ++v12;
        if (!v8)
        {
          int64_t v12 = v14 + 1;
          if (v14 + 1 >= v9) {
            goto LABEL_31;
          }
          uint64_t v8 = v6[v12];
          if (!v8)
          {
            int64_t v12 = v14 + 2;
            if (v14 + 2 >= v9) {
              goto LABEL_31;
            }
            uint64_t v8 = v6[v12];
            if (!v8)
            {
              int64_t v15 = v14 + 3;
              if (v15 >= v9)
              {
LABEL_31:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v23 = 1 << *(unsigned char *)(v2 + 32);
                if (v23 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v23;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              uint64_t v8 = v6[v15];
              if (!v8)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_37;
                  }
                  if (v12 >= v9) {
                    goto LABEL_31;
                  }
                  uint64_t v8 = v6[v12];
                  ++v15;
                  if (v8) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v12 = v15;
            }
          }
        }
      }
LABEL_22:
      sub_2211ED0D0();
      sub_2211ED000();
      uint64_t result = sub_2211ED0E0();
      uint64_t v16 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v19 = 0;
        unint64_t v20 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v20 && (v19 & 1) != 0)
          {
            __break(1u);
            goto LABEL_36;
          }
          BOOL v21 = v18 == v20;
          if (v18 == v20) {
            unint64_t v18 = 0;
          }
          v19 |= v21;
          uint64_t v22 = *(void *)(v10 + 8 * v18);
        }
        while (v22 == -1);
        unint64_t v13 = __clz(__rbit64(~v22)) + (v18 << 6);
      }
      v8 &= v8 - 1;
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2211EB5C0(uint64_t result, char a2)
{
  unint64_t v3 = result;
  unint64_t v4 = *(void *)(*v2 + 16);
  unint64_t v5 = *(void *)(*v2 + 24);
  if (v5 <= v4 || (a2 & 1) == 0)
  {
    if (a2)
    {
      sub_2211EB328();
      goto LABEL_8;
    }
    if (v5 <= v4)
    {
      sub_2211EB834();
LABEL_8:
      uint64_t v6 = *v2;
      sub_2211ED0D0();
      sub_2211ED000();
      uint64_t result = sub_2211ED0E0();
      unint64_t v3 = result & ~(-1 << *(unsigned char *)(v6 + 32));
      if ((*(void *)(v6 + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v3)) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    uint64_t result = (uint64_t)sub_2211EB6D4();
  }
LABEL_9:
  uint64_t v7 = *v2;
  *(void *)(*v2 + 8 * (v3 >> 6) + 56) |= 1 << v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (!v9)
  {
    *(void *)(v7 + 16) = v10;
    return result;
  }
  __break(1u);
LABEL_12:
  uint64_t result = sub_2211ED0C0();
  __break(1u);
  return result;
}

void *sub_2211EB6D4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F47AA0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2211ED060();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
  uint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (!v12)
    {
      int64_t v14 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v14 >= v13) {
        goto LABEL_27;
      }
      uint64_t v12 = *(void *)(v6 + 8 * v14);
      ++v9;
      if (!v12)
      {
        int64_t v9 = v14 + 1;
        if (v14 + 1 >= v13) {
          goto LABEL_27;
        }
        uint64_t v12 = *(void *)(v6 + 8 * v9);
        if (!v12)
        {
          int64_t v9 = v14 + 2;
          if (v14 + 2 >= v13) {
            goto LABEL_27;
          }
          uint64_t v12 = *(void *)(v6 + 8 * v9);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_12:
    v12 &= v12 - 1;
  }
  int64_t v15 = v14 + 3;
  if (v15 >= v13) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)(v6 + 8 * v15);
  if (v12)
  {
    int64_t v9 = v15;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    uint64_t v12 = *(void *)(v6 + 8 * v9);
    ++v15;
    if (v12) {
      goto LABEL_12;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2211EB834()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F47AA0);
  uint64_t v3 = sub_2211ED070();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_33:
    *uint64_t v1 = v4;
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
  uint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (!v8)
    {
      int64_t v14 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v14 >= v9) {
        goto LABEL_31;
      }
      uint64_t v8 = *(void *)(v6 + 8 * v14);
      ++v12;
      if (!v8)
      {
        int64_t v12 = v14 + 1;
        if (v14 + 1 >= v9) {
          goto LABEL_31;
        }
        uint64_t v8 = *(void *)(v6 + 8 * v12);
        if (!v8)
        {
          int64_t v12 = v14 + 2;
          if (v14 + 2 >= v9) {
            goto LABEL_31;
          }
          uint64_t v8 = *(void *)(v6 + 8 * v12);
          if (!v8) {
            break;
          }
        }
      }
    }
LABEL_22:
    sub_2211ED0D0();
    sub_2211ED000();
    uint64_t result = sub_2211ED0E0();
    uint64_t v16 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v19 = 0;
      unint64_t v20 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        BOOL v21 = v18 == v20;
        if (v18 == v20) {
          unint64_t v18 = 0;
        }
        v19 |= v21;
        uint64_t v22 = *(void *)(v10 + 8 * v18);
      }
      while (v22 == -1);
      unint64_t v13 = __clz(__rbit64(~v22)) + (v18 << 6);
    }
    v8 &= v8 - 1;
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    ++*(void *)(v4 + 16);
  }
  int64_t v15 = v14 + 3;
  if (v15 >= v9)
  {
LABEL_31:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v6 + 8 * v15);
  if (v8)
  {
    int64_t v12 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_31;
    }
    uint64_t v8 = *(void *)(v6 + 8 * v12);
    ++v15;
    if (v8) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_2211EBA98(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  sub_2211ED0D0();
  sub_2211ED000();
  unint64_t v2 = sub_2211ED0E0() & ~(-1 << *(unsigned char *)(a1 + 32));
  return (*(void *)(a1 + ((v2 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v2) & 1;
}

uint64_t sub_2211EBB2C()
{
  return 1;
}

uint64_t sub_2211EBB34()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_2211EBB50()
{
  return sub_2211ED0E0();
}

uint64_t sub_2211EBBA8()
{
  return sub_2211ED000();
}

uint64_t sub_2211EBBC4()
{
  return sub_2211ED0E0();
}

uint64_t sub_2211EBC18()
{
  type metadata accessor for SwiftBootstrapManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE88];
  qword_267F47D28 = v0;
  return result;
}

uint64_t static ObjCSwiftBridge.bootstrap(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267F47AB0 + dword_267F47AB0);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2211EBD18;
  return v7(a1, a2);
}

uint64_t sub_2211EBD18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2211EBF84(int a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  uint64_t v3 = sub_2211ECFF0();
  uint64_t v5 = v4;
  v2[3] = v4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267F47AB0 + dword_267F47AB0);
  uint64_t v6 = (void *)swift_task_alloc();
  v2[4] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_2211EC054;
  return v8(v3, v5);
}

uint64_t sub_2211EC054()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v7 = (void *)sub_2211ECFB0();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

id ObjCSwiftBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ObjCSwiftBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ObjCSwiftBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2211EC2BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2211ECEBC;
  return v6();
}

uint64_t sub_2211EC388(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_2211ECEBC;
  return v7();
}

uint64_t sub_2211EC454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2211ED040();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2211ED030();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2211ECD6C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2211ED020();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2211EC5F8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2211EC6D4;
  return v6(a1);
}

uint64_t sub_2211EC6D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2211EC7CC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2211EC7EC, 0, 0);
}

uint64_t sub_2211EC7EC()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_2211ED0B0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_2211ED080();
    swift_bridgeObjectRelease();
    sub_2211ED010();
    sub_2211ED010();
    return sub_2211ED0A0();
  }
  else
  {
    if (qword_267F47A88 != -1) {
      swift_once();
    }
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2211EC98C;
    return sub_2211EACEC();
  }
}

uint64_t sub_2211EC98C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for ObjCSwiftBridge()
{
  return self;
}

uint64_t sub_2211ECAA4()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2211ECAE4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2211EBD18;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_267F47AC0 + dword_267F47AC0);
  return v5(v2, v3);
}

uint64_t sub_2211ECB9C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2211ECEBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267F47AD0 + dword_267F47AD0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2211ECCA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2211ECEBC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267F47AE0 + dword_267F47AE0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2211ECD6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F47AB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2211ECDCC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2211ECE04(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2211EBD18;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F47AF0 + dword_267F47AF0);
  return v6(a1, v4);
}

uint64_t sub_2211ECFB0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2211ECFC0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2211ECFD0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2211ECFE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2211ECFF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2211ED000()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2211ED010()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2211ED020()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2211ED030()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2211ED040()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2211ED050()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2211ED060()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2211ED070()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2211ED080()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2211ED090()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2211ED0A0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2211ED0B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2211ED0C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2211ED0D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2211ED0E0()
{
  return MEMORY[0x270F9FC90]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}