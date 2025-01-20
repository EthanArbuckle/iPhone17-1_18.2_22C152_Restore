uint64_t sub_25DB7C57C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v0 = sub_25DB864D0();
  v1 = *(void *)(v0 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1AD0);
  v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (uint64_t *)((char *)&v17 - v7);
  sub_25DB864A0();
  v9 = sub_25DB85AF0();
  if (v9 == 52)
  {
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F74C30], v0);
    v10 = sub_25DB864C0();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    *v8 = v10;
    v8[1] = v12;
  }
  else
  {
    *v8 = sub_25DB85B44(v9);
    v8[1] = v13;
  }
  v14 = *MEMORY[0x263F74C98];
  v15 = sub_25DB86540();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v8, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v15);
  return sub_25DB86550();
}

uint64_t sub_25DB7C798()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for BaseSuggestionsAssetProvider()
{
  return self;
}

uint64_t sub_25DB7C7CC()
{
  return sub_25DB7C57C();
}

uint64_t sub_25DB7C7E4()
{
  uint64_t v1 = sub_25DB86610();
  v0[7] = v1;
  v0[8] = *(void *)(v1 - 8);
  v0[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DB7C8A0, 0, 0);
}

uint64_t sub_25DB7C8A0()
{
  uint64_t v23 = v0;
  if (qword_26A6B1AB0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A6B2A30;
  v22[3] = sub_25DB86480();
  v22[4] = sub_25DB7CD60();
  v22[0] = v1;
  sub_25DB86530();
  swift_allocObject();
  swift_retain();
  sub_25DB86520();
  v20 = (char *)sub_25DB85C4C();
  uint64_t v2 = *((void *)v20 + 2);
  if (v2)
  {
    uint64_t v3 = v20 + 32;
    v4 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 64) + 8);
    do
    {
      char v6 = *v3++;
      char v5 = v6;
      sub_25DB86560();
      v7 = sub_25DB86600();
      os_log_type_t v8 = sub_25DB86750();
      BOOL v9 = os_log_type_enabled(v7, v8);
      uint64_t v10 = *(void *)(v0 + 72);
      uint64_t v11 = *(void *)(v0 + 56);
      if (v9)
      {
        v21 = v3;
        uint64_t v12 = swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        v22[0] = v13;
        *(_DWORD *)uint64_t v12 = 136315138;
        uint64_t v14 = sub_25DB85C58(v5);
        *(void *)(v12 + 4) = sub_25DB7CDF4(v14, v15, v22);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25DB7A000, v7, v8, "BaseSuggestionsOwnerDefinitionFactory:: '%s' not added due to 'addToSuggestionPool' is false", (uint8_t *)v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611BEE00](v13, -1, -1);
        uint64_t v16 = v12;
        uint64_t v3 = v21;
        MEMORY[0x2611BEE00](v16, -1, -1);
      }

      (*v4)(v10, v11);
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  sub_25DB86510();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1AE8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_25DB86AA0;
  sub_25DB7CDB0((long long *)(v0 + 16), v17 + 32);
  swift_release();
  swift_task_dealloc();
  v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v18(v17);
}

uint64_t type metadata accessor for BaseSuggestionsOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_25DB7CB64()
{
  return MEMORY[0x270F71C50](v0);
}

uint64_t sub_25DB7CB6C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB7CBF8;
  return sub_25DB7C7E4();
}

uint64_t sub_25DB7CBF8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_25DB7CD60()
{
  unint64_t result = qword_26A6B1AE0;
  if (!qword_26A6B1AE0)
  {
    sub_25DB86480();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B1AE0);
  }
  return result;
}

uint64_t sub_25DB7CDB0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25DB7CDC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25DB7CDF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DB7CEC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DB7D5FC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25DB7D5FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25DB7CEC8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25DB7D020((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25DB86760();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25DB7D0F8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25DB86790();
    if (!v8)
    {
      uint64_t result = sub_25DB867A0();
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

void *sub_25DB7D020(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DB867B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25DB7D0F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DB7D190(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25DB7D36C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25DB7D36C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DB7D190(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25DB86710();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25DB7D304(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25DB86780();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25DB867B0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25DB867A0();
  __break(1u);
  return result;
}

void *sub_25DB7D304(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1AF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25DB7D36C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1AF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DB7D51C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DB7D444(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DB7D444(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DB867B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25DB7D51C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25DB867B0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_25DB7D5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25DB7D660()
{
  OUTLINED_FUNCTION_10();
  uint64_t v1 = sub_25DB86430();
  v0[3] = v1;
  OUTLINED_FUNCTION_0(v1);
  v0[4] = v2;
  v0[5] = OUTLINED_FUNCTION_4();
  uint64_t v3 = sub_25DB86450();
  v0[6] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[7] = v4;
  v0[8] = OUTLINED_FUNCTION_4();
  uint64_t v5 = sub_25DB86470();
  v0[9] = v5;
  OUTLINED_FUNCTION_0(v5);
  v0[10] = v6;
  v0[11] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DB7D748()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  sub_25DB86440();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F078A0], v3);
  sub_25DB86420();
  uint64_t v7 = sub_25DB86460();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
    uint64_t v9 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v9 + 16) = xmmword_25DB86AA0;
    v0[2] = v7 - 1;
    uint64_t v10 = sub_25DB867C0();
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v11;
    OUTLINED_FUNCTION_11();
    v12();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
    return v13(v9);
  }
  return result;
}

uint64_t type metadata accessor for PreviousYearResolver()
{
  return self;
}

uint64_t sub_25DB7D8FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB7D660();
}

uint64_t sub_25DB7D98C()
{
  OUTLINED_FUNCTION_10();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BB8);
  OUTLINED_FUNCTION_15(v3);
  v1[4] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25DB7DA0C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = sub_25DB7DB58(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 24) + 32), *(void *)(*(void *)(v0 + 24) + 40), *(void *)(*(void *)(v0 + 24) + 48), *(void *)(*(void *)(v0 + 24) + 56));
  sub_25DB7E44C(v2, MEMORY[0x263F80BA8], v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_25DB866E0();
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
    sub_25DB81904(*(void *)(v0 + 32), &qword_26A6B1BB8);
  }
  else
  {
    uint64_t v4 = sub_25DB866D0();
    uint64_t v6 = v5;
    uint64_t v7 = OUTLINED_FUNCTION_33();
    v8(v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
    uint64_t v9 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v9 + 16) = xmmword_25DB86AA0;
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    *(void *)(v9 + 32) = v4;
    *(void *)(v9 + 40) = v6;
  }
  swift_task_dealloc();
  uint64_t v10 = OUTLINED_FUNCTION_17();
  return v11(v10);
}

uint64_t sub_25DB7DB58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v68 = a3;
  uint64_t v67 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BB8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v81 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25DB866E0();
  uint64_t v71 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v80 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v70 = (char *)&v64 - v16;
  uint64_t v17 = sub_25DB865C0();
  v82 = *(uint64_t (***)(void, void, void))(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v79 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v78 = (char *)&v64 - v20;
  uint64_t v88 = sub_25DB865F0();
  uint64_t v21 = *(void *)(v88 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v88);
  v87 = (char *)&v64 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v83 = (char *)&v64 - v25;
  MEMORY[0x270FA5388](v24);
  v86 = (char *)&v64 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DB864F0();
  uint64_t v27 = sub_25DB86730();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v93 = MEMORY[0x263F8EE78];
  uint64_t v30 = *(void *)(v27 + 16);
  uint64_t v84 = v13;
  v85 = v10;
  uint64_t v77 = v30;
  if (v30)
  {
    uint64_t v65 = a4;
    uint64_t v66 = a5;
    unint64_t v31 = 0;
    uint64_t v76 = v21 + 16;
    unsigned int v75 = *MEMORY[0x263F4E2B8];
    v74 = (void (**)(char *, void, uint64_t))(v82 + 13);
    v72 = (void (**)(char *, uint64_t))(v82 + 1);
    v69 = (uint64_t (**)(char *, uint64_t))(v21 + 8);
    v82 = (uint64_t (**)(void, void, void))(v21 + 32);
    uint64_t v32 = v21;
    uint64_t v73 = v21;
    while (1)
    {
      if (v31 >= *(void *)(v27 + 16))
      {
        __break(1u);
        return result;
      }
      unint64_t v33 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      uint64_t v34 = *(void *)(v32 + 72);
      uint64_t v35 = v27;
      (*(void (**)(char *, unint64_t, uint64_t))(v32 + 16))(v86, v27 + v33 + v34 * v31, v88);
      v36 = v78;
      sub_25DB865E0();
      v37 = v79;
      (*v74)(v79, v75, v17);
      sub_25DB815D8(&qword_26A6B1BC8, 255, MEMORY[0x263F4E2E8]);
      sub_25DB86720();
      sub_25DB86720();
      if (v91 == v89 && v92 == v90) {
        break;
      }
      char v39 = sub_25DB867D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v40 = *v72;
      (*v72)(v37, v17);
      v40(v36, v17);
      if (v39) {
        goto LABEL_11;
      }
      uint64_t result = (*v69)(v86, v88);
      uint64_t v13 = v84;
      uint64_t v10 = v85;
      uint64_t v32 = v73;
      uint64_t v27 = v35;
LABEL_16:
      if (v77 == ++v31)
      {
        uint64_t v29 = v93;
        a5 = v66;
        a4 = v65;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease_n();
    v41 = *v72;
    (*v72)(v37, v17);
    v41(v36, v17);
LABEL_11:
    v42 = (uint64_t (*)(char *, char *, uint64_t))*v82;
    (*v82)(v83, v86, v88);
    uint64_t v43 = v93;
    uint64_t v27 = v35;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25DB81578(0, *(void *)(v43 + 16) + 1, 1);
      uint64_t v43 = v93;
    }
    unint64_t v45 = *(void *)(v43 + 16);
    unint64_t v44 = *(void *)(v43 + 24);
    if (v45 >= v44 >> 1)
    {
      sub_25DB81578(v44 > 1, v45 + 1, 1);
      uint64_t v43 = v93;
    }
    *(void *)(v43 + 16) = v45 + 1;
    uint64_t result = v42((char *)(v43 + v33 + v45 * v34), v83, v88);
    uint64_t v93 = v43;
    uint64_t v13 = v84;
    uint64_t v10 = v85;
    uint64_t v32 = v73;
    goto LABEL_16;
  }
  uint64_t v32 = v21;
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v46 = v68;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_25DB7F324(v29, v67, v46, a4, a5);
  uint64_t v48 = *(void *)(v47 + 16);
  if (v48)
  {
    v50 = *(char **)(v32 + 16);
    uint64_t v49 = v32 + 16;
    v86 = v50;
    unint64_t v51 = v47 + ((*(unsigned __int8 *)(v49 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 64));
    v52 = *(char **)(v49 + 56);
    v82 = (uint64_t (**)(void, void, void))v47;
    v83 = v52;
    v53 = (void (**)(char *, uint64_t))(v49 - 8);
    v54 = (void (**)(char *, uint64_t, uint64_t))(v71 + 32);
    uint64_t v55 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v56 = v49;
      ((void (*)(char *, unint64_t, uint64_t))v86)(v87, v51, v88);
      sub_25DB865D0();
      uint64_t v57 = sub_25DB866B0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v57) == 1)
      {
        sub_25DB81904((uint64_t)v10, &qword_26A6B1BC0);
        uint64_t v58 = v81;
        __swift_storeEnumTagSinglePayload(v81, 1, 1, v13);
      }
      else
      {
        uint64_t v59 = v81;
        sub_25DB86690();
        uint64_t v58 = v59;
        uint64_t v13 = v84;
        (*(void (**)(char *, uint64_t))(*(void *)(v57 - 8) + 8))(v10, v57);
      }
      (*v53)(v87, v88);
      if (__swift_getEnumTagSinglePayload(v58, 1, v13) == 1)
      {
        sub_25DB81904(v58, &qword_26A6B1BB8);
      }
      else
      {
        v60 = *v54;
        v61 = v70;
        (*v54)(v70, v58, v13);
        v60(v80, (uint64_t)v61, v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v55 = sub_25DB80E10(0, *(void *)(v55 + 16) + 1, 1, v55);
        }
        unint64_t v63 = *(void *)(v55 + 16);
        unint64_t v62 = *(void *)(v55 + 24);
        if (v63 >= v62 >> 1) {
          uint64_t v55 = sub_25DB80E10(v62 > 1, v63 + 1, 1, v55);
        }
        *(void *)(v55 + 16) = v63 + 1;
        v60((char *)(v55+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v63), (uint64_t)v80, v13);
        uint64_t v10 = v85;
      }
      uint64_t v49 = v56;
      v51 += (unint64_t)v83;
      --v48;
    }
    while (v48);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v55;
}

uint64_t sub_25DB7E434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25DB7E44C(a1, MEMORY[0x263F4E500], a2);
}

uint64_t sub_25DB7E44C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v7);
}

uint64_t sub_25DB7E4F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25DB7E528()
{
  sub_25DB7E4F8();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for AppEntityResolver()
{
  return self;
}

uint64_t sub_25DB7E580()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB7D98C();
}

uint64_t sub_25DB7E618()
{
  OUTLINED_FUNCTION_10();
  v0[6] = v1;
  uint64_t v2 = sub_25DB866E0();
  v0[7] = v2;
  OUTLINED_FUNCTION_0(v2);
  v0[8] = v3;
  v0[9] = OUTLINED_FUNCTION_4();
  uint64_t v4 = sub_25DB864D0();
  v0[10] = v4;
  OUTLINED_FUNCTION_0(v4);
  v0[11] = v5;
  v0[12] = OUTLINED_FUNCTION_2();
  v0[13] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25DB7E6E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v5 = (void *)v0[6];
  uint64_t v66 = v5;
  unsigned int v70 = *MEMORY[0x263F74C40];
  uint64_t v68 = *(void (**)(void))(v4 + 104);
  v68(v0[13]);
  uint64_t v6 = sub_25DB864C0();
  uint64_t v8 = v7;
  uint64_t v9 = *(void (**)(void))(v4 + 8);
  OUTLINED_FUNCTION_11();
  v9();
  uint64_t v10 = sub_25DB7DB58(v5, v6, v8, 0x6E457265646C6F46, 0xEC00000079746974);
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, void, uint64_t))v68)(v2, v70, v3);
  uint64_t v11 = v10;
  uint64_t v12 = sub_25DB864C0();
  uint64_t v14 = v13;
  OUTLINED_FUNCTION_11();
  v9();
  uint64_t v15 = sub_25DB7DB58(v66, v12, v14, 0x7469746E45676154, 0xE900000000000079);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v11 + 16);
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v62 = v15;
  if (v16)
  {
    uint64_t v18 = v1[8];
    uint64_t v73 = (void *)MEMORY[0x263F8EE78];
    OUTLINED_FUNCTION_27();
    v18 += 16;
    unint64_t v19 = v11 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
    uint64_t v67 = *(void *)(v18 + 56);
    uint64_t v20 = (void (**)(uint64_t, uint64_t))(v18 - 8);
    uint64_t v21 = v73;
    uint64_t v22 = v1;
    do
    {
      uint64_t v23 = v22[9];
      uint64_t v24 = v22[7];
      OUTLINED_FUNCTION_26();
      v25();
      uint64_t v26 = sub_25DB866D0();
      uint64_t v28 = v27;
      (*v20)(v23, v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_32(v21[2]);
        uint64_t v21 = v73;
      }
      unint64_t v30 = v21[2];
      unint64_t v29 = v21[3];
      if (v30 >= v29 >> 1)
      {
        OUTLINED_FUNCTION_19(v29);
        uint64_t v21 = v73;
      }
      v21[2] = v30 + 1;
      unint64_t v31 = &v21[2 * v30];
      v31[4] = v26;
      v31[5] = v28;
      v19 += v67;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    uint64_t v15 = v62;
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)MEMORY[0x263F8EE78];
    uint64_t v22 = v1;
  }
  uint64_t v32 = *(void *)(v15 + 16);
  if (v32)
  {
    uint64_t v71 = v22;
    uint64_t v74 = v17;
    uint64_t v33 = v22[8];
    OUTLINED_FUNCTION_27();
    v33 += 16;
    unint64_t v34 = v15 + ((*(unsigned __int8 *)(v33 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 64));
    uint64_t v64 = *(void *)(v33 + 56);
    uint64_t v35 = (void (**)(uint64_t, uint64_t))(v33 - 8);
    uint64_t v36 = v17;
    do
    {
      uint64_t v37 = v71[9];
      uint64_t v38 = v71[7];
      OUTLINED_FUNCTION_26();
      v39();
      uint64_t v40 = sub_25DB866D0();
      uint64_t v42 = v41;
      (*v35)(v37, v38);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_32(*(void *)(v36 + 16));
        uint64_t v36 = v74;
      }
      unint64_t v44 = *(void *)(v36 + 16);
      unint64_t v43 = *(void *)(v36 + 24);
      if (v44 >= v43 >> 1)
      {
        OUTLINED_FUNCTION_19(v43);
        uint64_t v36 = v74;
      }
      *(void *)(v36 + 16) = v44 + 1;
      uint64_t v45 = v36 + 16 * v44;
      *(void *)(v45 + 32) = v40;
      *(void *)(v45 + 40) = v42;
      v34 += v64;
      --v32;
    }
    while (v32);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v22 = v71;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v36 = MEMORY[0x263F8EE78];
  }
  uint64_t v47 = *(void *)(v36 + 16);
  if (v47)
  {
    unint64_t v48 = 0;
    uint64_t v49 = v21[2];
    uint64_t v50 = v36 + 32;
    unint64_t v51 = v21 + 5;
    uint64_t v61 = v49;
    uint64_t v63 = *(void *)(v36 + 16);
    while (1)
    {
      if (v48 >= *(void *)(v36 + 16))
      {
        __break(1u);
        return result;
      }
      if (v49) {
        break;
      }
LABEL_27:
      if (++v48 == v47) {
        goto LABEL_28;
      }
    }
    unint64_t v65 = v48;
    v52 = (uint64_t *)(v50 + 16 * v48);
    uint64_t v53 = v52[1];
    uint64_t v69 = *v52;
    sub_25DB818B8();
    uint64_t v72 = v53;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v54 = v49;
    while (1)
    {
      uint64_t v56 = *(v51 - 1);
      uint64_t v55 = *v51;
      v22[2] = v56;
      v22[3] = v55;
      v22[4] = v69;
      uint64_t v22[5] = v72;
      swift_bridgeObjectRetain();
      if (!sub_25DB86770()) {
        break;
      }
      v51 += 2;
      swift_bridgeObjectRelease();
      if (!--v54)
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v47 = v63;
        unint64_t v48 = v65;
        uint64_t v50 = v36 + 32;
        uint64_t v49 = v61;
        unint64_t v51 = v21 + 5;
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
    uint64_t v57 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v57 + 16) = xmmword_25DB86AA0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C08);
    uint64_t v58 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v58 + 16) = xmmword_25DB86B80;
    *(void *)(v58 + 32) = v69;
    *(void *)(v58 + 40) = v72;
    *(void *)(v58 + 48) = v56;
    *(void *)(v58 + 56) = v55;
    *(void *)(v57 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C10);
    *(void *)(v57 + 32) = v58;
  }
  else
  {
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v59 = OUTLINED_FUNCTION_17();
  return v60(v59);
}

uint64_t type metadata accessor for NotesTagAndFolderResolver()
{
  return self;
}

uint64_t sub_25DB7EC30()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB7E618();
}

uint64_t sub_25DB7ECC4()
{
  OUTLINED_FUNCTION_10();
  v0[6] = v1;
  uint64_t v2 = sub_25DB866B0();
  v0[7] = v2;
  OUTLINED_FUNCTION_0(v2);
  v0[8] = v3;
  v0[9] = OUTLINED_FUNCTION_2();
  v0[10] = swift_task_alloc();
  uint64_t v4 = sub_25DB865C0();
  v0[11] = v4;
  OUTLINED_FUNCTION_0(v4);
  v0[12] = v5;
  v0[13] = OUTLINED_FUNCTION_2();
  v0[14] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  OUTLINED_FUNCTION_15(v6);
  v0[15] = OUTLINED_FUNCTION_4();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  OUTLINED_FUNCTION_15(v7);
  v0[16] = OUTLINED_FUNCTION_2();
  v0[17] = swift_task_alloc();
  uint64_t v8 = sub_25DB865F0();
  v0[18] = v8;
  OUTLINED_FUNCTION_0(v8);
  v0[19] = v9;
  v0[20] = OUTLINED_FUNCTION_2();
  v0[21] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

void sub_25DB7EE28()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v51 = MEMORY[0x263F8EE78];
  uint64_t v47 = *(void *)(v2 + 16);
  if (v47)
  {
    OUTLINED_FUNCTION_31();
    uint64_t v42 = v0[19] + 16;
    OUTLINED_FUNCTION_5();
    while (1)
    {
      if (v1 >= *(void *)(v2 + 16))
      {
        __break(1u);
        return;
      }
      uint64_t v4 = OUTLINED_FUNCTION_3();
      v5(v4);
      sub_25DB865E0();
      uint64_t v6 = OUTLINED_FUNCTION_7();
      v7(v6);
      sub_25DB815D8(&qword_26A6B1BC8, 255, MEMORY[0x263F4E2E8]);
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_28();
      uint64_t v8 = (void (*)(uint64_t))v0[5];
      uint64_t v9 = v0[14];
      uint64_t v10 = v0[11];
      if (v0[2] == v0[4] && v0[3] == (void)v8) {
        break;
      }
      uint64_t v2 = sub_25DB867D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = *v39;
      OUTLINED_FUNCTION_9();
      v12();
      OUTLINED_FUNCTION_9();
      v12();
      if (v2) {
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_30();
      v13();
LABEL_16:
      ++v1;
      uint64_t v2 = v46;
      if (v47 == v1) {
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v14 = OUTLINED_FUNCTION_12();
    v8(v14);
    ((void (*)(uint64_t, uint64_t))v8)(v9, v10);
LABEL_11:
    OUTLINED_FUNCTION_29();
    ((void (*)(void))v2)();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_16();
      uint64_t v3 = v51;
    }
    unint64_t v21 = *(void *)(v3 + 24);
    if (*(void *)(v3 + 16) >= v21 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_18(v21);
      uint64_t v3 = v51;
    }
    uint64_t v22 = OUTLINED_FUNCTION_8(isUniquelyReferenced_nonNull_native, v0[20], v0[18], v16, v17, v18, v19, v20, v38, (uint64_t)v39, v40, v41, v42, v43, v44, v45, v46, v47, v48,
            v49);
    ((void (*)(uint64_t))v2)(v22);
    uint64_t v51 = v3;
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v23 = v0[18];
  uint64_t v24 = v0[15];
  swift_bridgeObjectRelease();
  sub_25DB7E44C(v3, MEMORY[0x263F4E500], v24);
  swift_release();
  if (__swift_getEnumTagSinglePayload(v24, 1, v23) == 1)
  {
    uint64_t v25 = v0[17];
    uint64_t v26 = v0[7];
    sub_25DB81904(v0[15], &qword_26A6B1C20);
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
  }
  else
  {
    uint64_t v27 = v0[18];
    uint64_t v28 = v0[19];
    uint64_t v29 = v0[15];
    sub_25DB865D0();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v27);
  }
  uint64_t v30 = v0[16];
  uint64_t v31 = v0[7];
  sub_25DB81958(v0[17], v30, &qword_26A6B1BC0);
  if (__swift_getEnumTagSinglePayload(v30, 1, v31) == 1)
  {
    sub_25DB81904(v0[16], &qword_26A6B1BC0);
LABEL_28:
    uint64_t v50 = MEMORY[0x263F8EE78];
    goto LABEL_29;
  }
  uint64_t v32 = v0[8];
  (*(void (**)(void, void, void))(v32 + 32))(v0[10], v0[16], v0[7]);
  sub_25DB86670();
  OUTLINED_FUNCTION_33();
  char v33 = sub_25DB866A0();
  unint64_t v34 = *(void (**)(void))(v32 + 8);
  OUTLINED_FUNCTION_22();
  v34();
  if (v33)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
    uint64_t v35 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v35 + 16) = xmmword_25DB86AA0;
    *(void *)(v35 + 56) = MEMORY[0x263F8D310];
    *(void *)(v35 + 32) = 1802661719;
  }
  else
  {
    sub_25DB86670();
    char v36 = sub_25DB866A0();
    OUTLINED_FUNCTION_22();
    v34();
    if ((v36 & 1) == 0)
    {
      ((void (*)(void, void))v34)(v0[10], v0[7]);
      goto LABEL_28;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
    uint64_t v35 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v35 + 16) = xmmword_25DB86AA0;
    *(void *)(v35 + 56) = MEMORY[0x263F8D310];
    *(void *)(v35 + 32) = 1701670728;
  }
  uint64_t v50 = v35;
  *(void *)(v35 + 40) = 0xE400000000000000;
  OUTLINED_FUNCTION_22();
  v34();
LABEL_29:
  sub_25DB81904(v0[17], &qword_26A6B1BC0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = (void (*)(uint64_t))v0[1];
  v37(v50);
}

uint64_t sub_25DB7F324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a2;
  uint64_t v34 = a4;
  uint64_t v35 = sub_25DB865F0();
  uint64_t v9 = *(void *)(v35 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v27 = a1;
  uint64_t v31 = *(void *)(a1 + 16);
  if (v31)
  {
    unint64_t v16 = 0;
    uint64_t v25 = a5;
    uint64_t v26 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    uint64_t v30 = v9 + 16;
    uint64_t v24 = a3;
    uint64_t v17 = v27;
    while (v16 < *(void *)(v17 + 16))
    {
      unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v19 = *(void *)(v9 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v14, v17 + v18 + v19 * v16, v35);
      char v20 = sub_25DB808B8((uint64_t)v14, v33, a3, v34, a5);
      if (v5)
      {
        (*v26)(v14, v35);
        swift_bridgeObjectRelease();
        uint64_t v15 = v36;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return v15;
      }
      if (v20)
      {
        uint64_t v28 = *v29;
        v28(v32, v14, v35);
        uint64_t v21 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25DB81578(0, *(void *)(v21 + 16) + 1, 1);
          uint64_t v21 = v36;
        }
        unint64_t v23 = *(void *)(v21 + 16);
        unint64_t v22 = *(void *)(v21 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_25DB81578(v22 > 1, v23 + 1, 1);
          uint64_t v21 = v36;
        }
        *(void *)(v21 + 16) = v23 + 1;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v28)(v21 + v18 + v23 * v19, v32, v35);
        uint64_t v36 = v21;
        a3 = v24;
        a5 = v25;
        uint64_t v17 = v27;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v26)(v14, v35);
      }
      if (v31 == ++v16)
      {
        uint64_t v15 = v36;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t type metadata accessor for DestinationResolver()
{
  return self;
}

uint64_t sub_25DB7F62C(char a1)
{
  if (a1) {
    return 0x7465736E7553;
  }
  else {
    return 0x657369726E7553;
  }
}

uint64_t sub_25DB7F660()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB7ECC4();
}

uint64_t sub_25DB7F6F4()
{
  OUTLINED_FUNCTION_10();
  uint64_t v1 = sub_25DB86450();
  v0[2] = v1;
  OUTLINED_FUNCTION_0(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_4();
  uint64_t v3 = sub_25DB86470();
  v0[5] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[6] = v4;
  v0[7] = OUTLINED_FUNCTION_4();
  uint64_t v5 = sub_25DB86430();
  v0[8] = v5;
  OUTLINED_FUNCTION_0(v5);
  v0[9] = v6;
  v0[10] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DB7F7DC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  sub_25DB86420();
  sub_25DB86440();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F07890], v6);
  uint64_t v7 = sub_25DB86460();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
  uint64_t v8 = OUTLINED_FUNCTION_6();
  uint64_t v9 = v8;
  uint64_t v10 = 0x7465736E7553;
  if (v7 < 9) {
    uint64_t v10 = 0x657369726E7553;
  }
  unint64_t v11 = 0xE600000000000000;
  if (v7 < 9) {
    unint64_t v11 = 0xE700000000000000;
  }
  uint64_t v12 = MEMORY[0x263F8D310];
  *(_OWORD *)(v8 + 16) = xmmword_25DB86AA0;
  *(void *)(v8 + 56) = v12;
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v11;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  OUTLINED_FUNCTION_11();
  v13();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v9);
}

BOOL sub_25DB7F974(uint64_t a1)
{
  return a1 > 8;
}

uint64_t sub_25DB7F980()
{
  return sub_25DB803B0();
}

uint64_t type metadata accessor for SunStageResolver()
{
  return self;
}

uint64_t sub_25DB7F9AC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25DB7F9E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB7FA6C;
  return sub_25DB7F6F4();
}

uint64_t sub_25DB7FA6C()
{
  OUTLINED_FUNCTION_10();
  swift_task_dealloc();
  uint64_t v0 = OUTLINED_FUNCTION_17();
  return v1(v0);
}

uint64_t sub_25DB7FB5C()
{
  OUTLINED_FUNCTION_10();
  v0[6] = v1;
  uint64_t v2 = sub_25DB86660();
  v0[7] = v2;
  OUTLINED_FUNCTION_0(v2);
  v0[8] = v3;
  v0[9] = OUTLINED_FUNCTION_4();
  uint64_t v4 = sub_25DB86650();
  v0[10] = v4;
  OUTLINED_FUNCTION_0(v4);
  v0[11] = v5;
  v0[12] = OUTLINED_FUNCTION_4();
  uint64_t v6 = sub_25DB865C0();
  v0[13] = v6;
  OUTLINED_FUNCTION_0(v6);
  v0[14] = v7;
  v0[15] = OUTLINED_FUNCTION_2();
  v0[16] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  OUTLINED_FUNCTION_15(v8);
  v0[17] = OUTLINED_FUNCTION_4();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  OUTLINED_FUNCTION_15(v9);
  v0[18] = OUTLINED_FUNCTION_4();
  uint64_t v10 = sub_25DB866B0();
  v0[19] = v10;
  OUTLINED_FUNCTION_0(v10);
  v0[20] = v11;
  v0[21] = OUTLINED_FUNCTION_2();
  v0[22] = swift_task_alloc();
  uint64_t v12 = sub_25DB865F0();
  v0[23] = v12;
  OUTLINED_FUNCTION_0(v12);
  v0[24] = v13;
  v0[25] = OUTLINED_FUNCTION_2();
  v0[26] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

void sub_25DB7FD14()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v74 = MEMORY[0x263F8EE78];
  uint64_t v70 = *(void *)(v2 + 16);
  if (v70)
  {
    OUTLINED_FUNCTION_31();
    uint64_t v65 = v0[24] + 16;
    OUTLINED_FUNCTION_5();
    while (1)
    {
      if (v1 >= *(void *)(v2 + 16))
      {
        __break(1u);
        return;
      }
      uint64_t v4 = OUTLINED_FUNCTION_3();
      v5(v4);
      sub_25DB865E0();
      uint64_t v6 = OUTLINED_FUNCTION_7();
      v7(v6);
      sub_25DB815D8(&qword_26A6B1BC8, 255, MEMORY[0x263F4E2E8]);
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_28();
      uint64_t v8 = (void (*)(uint64_t))v0[5];
      uint64_t v9 = v0[16];
      uint64_t v10 = v0[13];
      if (v0[2] == v0[4] && v0[3] == (void)v8) {
        break;
      }
      uint64_t v2 = sub_25DB867D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = *v62;
      OUTLINED_FUNCTION_9();
      v12();
      OUTLINED_FUNCTION_9();
      v12();
      if (v2) {
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_30();
      v13();
LABEL_16:
      ++v1;
      uint64_t v2 = v69;
      if (v70 == v1) {
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v14 = OUTLINED_FUNCTION_12();
    v8(v14);
    ((void (*)(uint64_t, uint64_t))v8)(v9, v10);
LABEL_11:
    OUTLINED_FUNCTION_29();
    ((void (*)(void))v2)();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_16();
      uint64_t v3 = v74;
    }
    unint64_t v21 = *(void *)(v3 + 24);
    if (*(void *)(v3 + 16) >= v21 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_18(v21);
      uint64_t v3 = v74;
    }
    uint64_t v22 = OUTLINED_FUNCTION_8(isUniquelyReferenced_nonNull_native, v0[25], v0[23], v16, v17, v18, v19, v20, v61, (uint64_t)v62, v63, v64, v65, v66, v67, v68, v69, v70, v71,
            v72);
    ((void (*)(uint64_t))v2)(v22);
    uint64_t v74 = v3;
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v23 = v0[23];
  uint64_t v24 = v0[17];
  swift_bridgeObjectRelease();
  sub_25DB7E44C(v3, MEMORY[0x263F4E500], v24);
  swift_release();
  if (__swift_getEnumTagSinglePayload(v24, 1, v23) == 1)
  {
    uint64_t v25 = v0[18];
    uint64_t v26 = v0[19];
    sub_25DB81904(v0[17], &qword_26A6B1C20);
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
LABEL_20:
    sub_25DB81904(v0[18], &qword_26A6B1BC0);
    goto LABEL_21;
  }
  uint64_t v28 = v0[18];
  uint64_t v27 = v0[19];
  sub_25DB865D0();
  uint64_t v29 = OUTLINED_FUNCTION_33();
  v30(v29);
  if (__swift_getEnumTagSinglePayload(v28, 1, v27) == 1) {
    goto LABEL_20;
  }
  (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  OUTLINED_FUNCTION_26();
  v32();
  uint64_t v33 = OUTLINED_FUNCTION_24();
  if (v34(v33) == *MEMORY[0x263F804E8])
  {
    (*(void (**)(void, void))(v0[20] + 96))(v0[21], v0[19]);
    swift_projectBox();
    OUTLINED_FUNCTION_26();
    v35();
    uint64_t v36 = OUTLINED_FUNCTION_24();
    if (v37(v36) == *MEMORY[0x263F80498])
    {
      uint64_t v39 = v0[11];
      uint64_t v38 = v0[12];
      uint64_t v41 = v0[9];
      uint64_t v40 = v0[10];
      (*(void (**)(uint64_t, void))(v0[8] + 96))(v41, v0[7]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v38, v41, v40);
      swift_release();
      uint64_t v42 = (void *)sub_25DB86640();
      uint64_t v43 = sub_25DB819B4(v42);
      if (v44)
      {
        uint64_t v45 = v43;
        uint64_t v46 = v44;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BA8);
        uint64_t v47 = OUTLINED_FUNCTION_6();
        uint64_t v48 = MEMORY[0x263F8D310];
        *(_OWORD *)(v47 + 16) = xmmword_25DB86AA0;
        *(void *)(v47 + 56) = v48;
        *(void *)(v47 + 32) = v45;
        *(void *)(v47 + 40) = v46;
        uint64_t v73 = v47;
        OUTLINED_FUNCTION_11();
        v49();
        uint64_t v50 = OUTLINED_FUNCTION_20();
        v51(v50);
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_11();
      v58();
      uint64_t v59 = OUTLINED_FUNCTION_20();
      v60(v59);
    }
    else
    {
      uint64_t v56 = v0[8];
      uint64_t v55 = v0[9];
      uint64_t v57 = v0[7];
      (*(void (**)(void, void))(v0[20] + 8))(v0[22], v0[19]);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
      swift_release();
    }
  }
  else
  {
    uint64_t v52 = v0[21];
    uint64_t v53 = v0[19];
    uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0[20] + 8);
    v54(v0[22], v53);
    v54(v52, v53);
  }
LABEL_21:
  uint64_t v73 = MEMORY[0x263F8EE78];
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = (void (*)(uint64_t))v0[1];
  v31(v73);
}

uint64_t type metadata accessor for PlaceNameResolver()
{
  return self;
}

uint64_t sub_25DB802E0()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB7FB5C();
}

uint64_t sub_25DB80374()
{
  return sub_25DB81A24(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x263F8EE78]);
}

uint64_t sub_25DB803B0()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_33();

  return MEMORY[0x270FA0228](v0, v1, 7);
}

uint64_t type metadata accessor for DoNotResolveResolver()
{
  return self;
}

uint64_t sub_25DB80414()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB81A38;
  return sub_25DB80374();
}

uint64_t sub_25DB804A0(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1AF8, a2, (void (*)(uint64_t))type metadata accessor for DoNotResolveResolver);
}

uint64_t sub_25DB804E8(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B08, a2, (void (*)(uint64_t))type metadata accessor for DoNotResolveResolver);
}

uint64_t sub_25DB80530(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B10, a2, (void (*)(uint64_t))type metadata accessor for PlaceNameResolver);
}

uint64_t sub_25DB80578(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B20, a2, (void (*)(uint64_t))type metadata accessor for PlaceNameResolver);
}

uint64_t sub_25DB805C0(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B28, a2, (void (*)(uint64_t))type metadata accessor for SunStageResolver);
}

uint64_t sub_25DB80608(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B38, a2, (void (*)(uint64_t))type metadata accessor for SunStageResolver);
}

uint64_t sub_25DB80650(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B40, a2, (void (*)(uint64_t))type metadata accessor for DestinationResolver);
}

uint64_t sub_25DB80698(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B50, a2, (void (*)(uint64_t))type metadata accessor for DestinationResolver);
}

uint64_t sub_25DB806E0(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B58, a2, (void (*)(uint64_t))type metadata accessor for NotesTagAndFolderResolver);
}

uint64_t sub_25DB80728(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B68, a2, (void (*)(uint64_t))type metadata accessor for NotesTagAndFolderResolver);
}

uint64_t sub_25DB80770(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B70, a2, (void (*)(uint64_t))type metadata accessor for AppEntityResolver);
}

uint64_t sub_25DB807B8(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B80, a2, (void (*)(uint64_t))type metadata accessor for AppEntityResolver);
}

uint64_t sub_25DB80800(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8((unint64_t *)&unk_26A6B1B88, a2, (void (*)(uint64_t))type metadata accessor for PreviousYearResolver);
}

uint64_t sub_25DB80848(uint64_t a1, uint64_t a2)
{
  return sub_25DB815D8(&qword_26A6B1B98, a2, (void (*)(uint64_t))type metadata accessor for PreviousYearResolver);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25DB808B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = a5;
  uint64_t v36 = a2;
  uint64_t v7 = sub_25DB866C0();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v33 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BD8);
  MEMORY[0x270FA5388](v35);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BE0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v34 = (uint64_t)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char **)((char *)&v33 - v18);
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v33 - v20;
  sub_25DB865D0();
  uint64_t v22 = sub_25DB866B0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v22) == 1)
  {
    sub_25DB81904((uint64_t)v13, &qword_26A6B1BC0);
    uint64_t v23 = 1;
  }
  else
  {
    sub_25DB86680();
    (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(v13, v22);
    uint64_t v23 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v21, v23, 1, v7);
  uint64_t v24 = (void *)swift_allocObject();
  uint64_t v25 = v37;
  v24[2] = v36;
  v24[3] = a3;
  v24[4] = a4;
  v24[5] = v38;
  *uint64_t v19 = v24;
  (*(void (**)(void *, void, uint64_t))(v25 + 104))(v19, *MEMORY[0x263F80740], v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v7);
  uint64_t v26 = (uint64_t)&v10[*(int *)(v35 + 48)];
  uint64_t v27 = &qword_26A6B1BE0;
  sub_25DB81958((uint64_t)v21, (uint64_t)v10, &qword_26A6B1BE0);
  sub_25DB81958((uint64_t)v19, v26, &qword_26A6B1BE0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v7) == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25DB81904((uint64_t)v19, &qword_26A6B1BE0);
    sub_25DB81904((uint64_t)v21, &qword_26A6B1BE0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v7) == 1)
    {
      char v28 = -1;
    }
    else
    {
      uint64_t v27 = &qword_26A6B1BD8;
      char v28 = 0;
    }
  }
  else
  {
    uint64_t v29 = v34;
    sub_25DB81958((uint64_t)v10, v34, &qword_26A6B1BE0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v7) == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25DB81904((uint64_t)v19, &qword_26A6B1BE0);
      sub_25DB81904((uint64_t)v21, &qword_26A6B1BE0);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v7);
      char v28 = 0;
      uint64_t v27 = &qword_26A6B1BD8;
    }
    else
    {
      uint64_t v30 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v33, v26, v7);
      sub_25DB815D8(&qword_26A6B1BE8, 255, MEMORY[0x263F80768]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v28 = sub_25DB866F0();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
      v31(v30, v7);
      uint64_t v27 = &qword_26A6B1BE0;
      sub_25DB81904((uint64_t)v19, &qword_26A6B1BE0);
      sub_25DB81904((uint64_t)v21, &qword_26A6B1BE0);
      v31((char *)v29, v7);
    }
  }
  sub_25DB81904((uint64_t)v10, v27);
  return v28 & 1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25DB80E10(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BD0);
  uint64_t v10 = *(void *)(sub_25DB866E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_25DB867A0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25DB866E0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_25DB81244(a4 + v17, v8, v18, MEMORY[0x263F80BA8]);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25DB81050(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_25DB81050(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25DB866E0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_25DB867B0();
  __break(1u);
  return result;
}

char *sub_25DB811B0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25DB867B0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_25DB81244(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    uint64_t v9 = sub_25DB867B0();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v9);
    return;
  }
  if (a3 < a1 || (a4(0), OUTLINED_FUNCTION_14(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = OUTLINED_FUNCTION_25();
    MEMORY[0x270FA01D8](v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = OUTLINED_FUNCTION_25();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

uint64_t sub_25DB81360(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25DB867B0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25DB81440(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_25DB865F0() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_25DB867B0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_25DB81558(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25DB81620(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

size_t sub_25DB81578(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25DB81704(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

uint64_t sub_25DB81598()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25DB815D8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_25DB81620(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DB811B0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DB81360((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_25DB81704(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BF0);
  uint64_t v10 = *(void *)(sub_25DB865F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25DB865F0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_25DB81244(v18, v8, v17, MEMORY[0x263F4E500]);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DB81440(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_25DB818B8()
{
  unint64_t result = qword_26A6B1C00;
  if (!qword_26A6B1C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6B1C00);
  }
  return result;
}

uint64_t sub_25DB81904(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25DB81958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DB819B4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_name);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25DB86700();

  return v3;
}

uint64_t sub_25DB81A24(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_25DB803B0();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(void *)(v22 + 16) = v21;
  return v22 + v20 + v23 * a20;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return a1 - 8;
}

size_t OUTLINED_FUNCTION_16()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25DB81578(0, v2, 1);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

size_t OUTLINED_FUNCTION_18@<X0>(unint64_t a1@<X8>)
{
  return sub_25DB81578(a1 > 1, v1, 1);
}

char *OUTLINED_FUNCTION_19@<X0>(unint64_t a1@<X8>)
{
  return sub_25DB81558((char *)(a1 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
  return sub_25DB864F0();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_25DB86720();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

char *OUTLINED_FUNCTION_27()
{
  return sub_25DB81558(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_25DB86720();
}

char *OUTLINED_FUNCTION_32@<X0>(uint64_t a1@<X8>)
{
  return sub_25DB81558(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t sub_25DB81D9C()
{
  OUTLINED_FUNCTION_10();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_25DB86430();
  OUTLINED_FUNCTION_8_0(v3);
  v1[5] = v4;
  v1[6] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25DB81E2C()
{
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_28_0();
  sub_25DB81EB4();
  char v2 = v1;
  OUTLINED_FUNCTION_13_0();
  v3();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4(v2 & 1);
}

void sub_25DB81EB4()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v101 = v0;
  uint64_t v1 = sub_25DB866B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  v92[1] = v4;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_22_0();
  v92[2] = v6;
  uint64_t v100 = sub_25DB86450();
  OUTLINED_FUNCTION_0_0();
  uint64_t v99 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25DB86470();
  OUTLINED_FUNCTION_0_0();
  uint64_t v96 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2_0();
  uint64_t v15 = OUTLINED_FUNCTION_14_0(v14);
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  v114 = (char *)v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_0();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_40(v21, v22, v23, v24, v25, v26, v27, v28, v92[0]);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  uint64_t v30 = OUTLINED_FUNCTION_15(v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21_0(v31);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  uint64_t v33 = OUTLINED_FUNCTION_15(v32);
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_1_0();
  uint64_t v95 = v34;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_22_0();
  uint64_t v103 = v36;
  uint64_t v37 = sub_25DB865F0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_1_0();
  uint64_t v116 = v41;
  OUTLINED_FUNCTION_3_0();
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_41(v43, v44, v45, v46, v47, v48, v49, v50, v92[0]);
  uint64_t v51 = (void *)OUTLINED_FUNCTION_28_0();
  __swift_project_boxed_opaque_existential_1(v51, v52);
  sub_25DB864F0();
  uint64_t v53 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v54 = v53;
  uint64_t v55 = MEMORY[0x263F8EE78];
  uint64_t v123 = MEMORY[0x263F8EE78];
  uint64_t v111 = *(void *)(v53 + 16);
  uint64_t v102 = v1;
  v98 = v10;
  uint64_t v97 = v11;
  uint64_t v113 = v39;
  if (!v111)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v71 = v94;
    sub_25DB7E434(v55, v94);
    swift_release();
    uint64_t v72 = OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_0(v72, v73, v37);
    uint64_t v74 = v103;
    if (v61)
    {
      sub_25DB856CC(v71, &qword_26A6B1C20);
      __swift_storeEnumTagSinglePayload(v74, 1, 1, v1);
    }
    else
    {
      sub_25DB865D0();
      (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v71, v37);
    }
    sub_25DB86440();
    uint64_t v75 = *MEMORY[0x263F07890];
    uint64_t v76 = v99;
    v118 = *(void (**)(char *, uint64_t, uint64_t))(v99 + 104);
    uint64_t v77 = v98;
    uint64_t v78 = v100;
    v118(v98, v75, v100);
    unint64_t v117 = sub_25DB86460();
    v79 = *(void (**)(uint64_t))(v76 + 8);
    uint64_t v80 = OUTLINED_FUNCTION_43();
    v79(v80);
    uint64_t v81 = *(void (**)(void))(v96 + 8);
    OUTLINED_FUNCTION_18_0();
    v81();
    sub_25DB86440();
    v118(v77, *MEMORY[0x263F078E8], v78);
    uint64_t v82 = sub_25DB86460();
    uint64_t v83 = OUTLINED_FUNCTION_43();
    v79(v83);
    OUTLINED_FUNCTION_18_0();
    v81();
    uint64_t v84 = v103;
    uint64_t v85 = v95;
    sub_25DB85674(v103, v95, &qword_26A6B1BC0);
    uint64_t v86 = OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_0(v86, v87, v102);
    if (v61)
    {
      sub_25DB856CC(v84, &qword_26A6B1BC0);
    }
    else
    {
      uint64_t v88 = v93;
      OUTLINED_FUNCTION_4_0();
      v89();
      if (v117 - 5 <= 4 && (unint64_t)(v82 - 7) >= 0xFFFFFFFFFFFFFFFBLL)
      {
        sub_25DB86670();
        sub_25DB866A0();
        uint64_t v91 = *(void (**)(void))(v88 + 8);
        OUTLINED_FUNCTION_33_0();
        v91();
        OUTLINED_FUNCTION_33_0();
        v91();
        sub_25DB856CC(v84, &qword_26A6B1BC0);
        goto LABEL_28;
      }
      OUTLINED_FUNCTION_33_0();
      v90();
      uint64_t v85 = v84;
    }
    sub_25DB856CC(v85, &qword_26A6B1BC0);
LABEL_28:
    OUTLINED_FUNCTION_31_0();
    return;
  }
  unint64_t v56 = 0;
  uint64_t v108 = v39 + 16;
  int v107 = *MEMORY[0x263F4E250];
  v105 = (void (**)(void))(v17 + 8);
  uint64_t v106 = v17 + 104;
  uint64_t v104 = v39 + 8;
  v115 = (void (**)(void))(v39 + 32);
  uint64_t v109 = v54;
  uint64_t v110 = v15;
  while (v56 < *(void *)(v54 + 16))
  {
    unint64_t v117 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    uint64_t v57 = v37;
    OUTLINED_FUNCTION_19_0();
    v58();
    uint64_t v59 = v112;
    sub_25DB865E0();
    OUTLINED_FUNCTION_34();
    v60();
    sub_25DB8578C(&qword_26A6B1BC8, MEMORY[0x263F4E2E8]);
    sub_25DB86720();
    sub_25DB86720();
    BOOL v61 = v121 == v119 && v122 == v120;
    if (v61)
    {
      OUTLINED_FUNCTION_35();
      uint64_t v65 = *v105;
      OUTLINED_FUNCTION_7_0();
      v65();
      ((void (*)(uint64_t, uint64_t))v65)(v59, v15);
LABEL_11:
      uint64_t v66 = *v115;
      uint64_t v37 = v57;
      OUTLINED_FUNCTION_4_0();
      v66();
      uint64_t v67 = v123;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_12_0();
        uint64_t v67 = v123;
      }
      uint64_t v15 = v110;
      uint64_t v39 = v113;
      unint64_t v69 = *(void *)(v67 + 16);
      unint64_t v68 = *(void *)(v67 + 24);
      if (v69 >= v68 >> 1)
      {
        size_t v70 = OUTLINED_FUNCTION_25_0(v68);
        sub_25DB81578(v70, v69 + 1, 1);
        uint64_t v67 = v123;
      }
      *(void *)(v67 + 16) = v69 + 1;
      OUTLINED_FUNCTION_4_0();
      v66();
      uint64_t v123 = v67;
      goto LABEL_16;
    }
    char v62 = sub_25DB867D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v63 = *v105;
    OUTLINED_FUNCTION_7_0();
    v63();
    OUTLINED_FUNCTION_7_0();
    v63();
    if (v62) {
      goto LABEL_11;
    }
    uint64_t v37 = v57;
    OUTLINED_FUNCTION_6_0();
    v64();
    uint64_t v15 = v110;
    uint64_t v39 = v113;
LABEL_16:
    ++v56;
    uint64_t v54 = v109;
    if (v111 == v56)
    {
      uint64_t v55 = v123;
      uint64_t v1 = v102;
      goto LABEL_18;
    }
  }
  __break(1u);
}

uint64_t type metadata accessor for MapsCreateRoutePlanFilter()
{
  return self;
}

uint64_t sub_25DB826FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DB857D4;
  return sub_25DB81D9C();
}

uint64_t sub_25DB82794()
{
  OUTLINED_FUNCTION_10();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_25DB86430();
  OUTLINED_FUNCTION_8_0(v3);
  v1[5] = v4;
  v1[6] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25DB82824()
{
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_28_0();
  sub_25DB828AC();
  char v2 = v1;
  OUTLINED_FUNCTION_13_0();
  v3();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4(v2 & 1);
}

void sub_25DB828AC()
{
  OUTLINED_FUNCTION_26_0();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_25DB86450();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_0();
  uint64_t v72 = v8;
  uint64_t v9 = sub_25DB86470();
  OUTLINED_FUNCTION_0_0();
  uint64_t v71 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = OUTLINED_FUNCTION_14_0((uint64_t)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_0();
  uint64_t v83 = v17;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_22_0();
  uint64_t v81 = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  uint64_t v21 = OUTLINED_FUNCTION_15(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_16_0(v22, v65[0]);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  uint64_t v24 = OUTLINED_FUNCTION_15(v23);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_2_0();
  uint64_t v70 = v25;
  uint64_t v74 = sub_25DB865F0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v85 = v29;
  OUTLINED_FUNCTION_3_0();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_41(v31, v32, v33, v34, v35, v36, v37, v38, v65[0]);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_25DB864F0();
  uint64_t v39 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v40 = v39;
  uint64_t v41 = MEMORY[0x263F8EE78];
  uint64_t v90 = MEMORY[0x263F8EE78];
  uint64_t v80 = *(void *)(v39 + 16);
  uint64_t v82 = v27;
  if (v80)
  {
    v65[1] = v9;
    uint64_t v66 = v6;
    uint64_t v67 = v3;
    uint64_t v68 = v4;
    unint64_t v42 = 0;
    uint64_t v78 = v27 + 16;
    int v77 = *MEMORY[0x263F4E250];
    uint64_t v75 = v15 + 8;
    uint64_t v76 = v15 + 104;
    uint64_t v73 = v27 + 8;
    uint64_t v84 = (void (**)(void))(v27 + 32);
    uint64_t v79 = v40;
    while (1)
    {
      if (v42 >= *(void *)(v40 + 16))
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_19_0();
      v43();
      uint64_t v44 = v81;
      sub_25DB865E0();
      OUTLINED_FUNCTION_34();
      v45();
      sub_25DB8578C(&qword_26A6B1BC8, MEMORY[0x263F4E2E8]);
      sub_25DB86720();
      sub_25DB86720();
      uint64_t v46 = v89;
      BOOL v47 = v88 == v86 && v89 == v87;
      if (v47) {
        break;
      }
      char v48 = sub_25DB867D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v49 = OUTLINED_FUNCTION_23_0();
      v46(v49);
      ((void (*)(uint64_t, uint64_t))v46)(v44, v13);
      if (v48) {
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_6_0();
      v50();
LABEL_16:
      ++v42;
      uint64_t v40 = v79;
      if (v80 == v42)
      {
        uint64_t v41 = v90;
        uint64_t v4 = v68;
        uint64_t v6 = v66;
        goto LABEL_18;
      }
    }
    OUTLINED_FUNCTION_35();
    uint64_t v51 = OUTLINED_FUNCTION_23_0();
    v46(v51);
    ((void (*)(uint64_t, uint64_t))v46)(v44, v13);
LABEL_11:
    uint64_t v52 = *v84;
    OUTLINED_FUNCTION_4_0();
    v52();
    uint64_t v53 = v90;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_12_0();
      uint64_t v53 = v90;
    }
    unint64_t v55 = *(void *)(v53 + 16);
    unint64_t v54 = *(void *)(v53 + 24);
    if (v55 >= v54 >> 1)
    {
      size_t v56 = OUTLINED_FUNCTION_25_0(v54);
      sub_25DB81578(v56, v55 + 1, 1);
      uint64_t v53 = v90;
    }
    *(void *)(v53 + 16) = v55 + 1;
    OUTLINED_FUNCTION_4_0();
    v52();
    uint64_t v90 = v53;
    goto LABEL_16;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  uint64_t v57 = v69;
  sub_25DB7E434(v41, v69);
  swift_release();
  uint64_t v58 = v74;
  OUTLINED_FUNCTION_9_0(v57, 1, v74);
  uint64_t v59 = v70;
  if (v47)
  {
    sub_25DB856CC(v57, &qword_26A6B1C20);
    uint64_t v60 = sub_25DB866B0();
    __swift_storeEnumTagSinglePayload(v59, 1, 1, v60);
  }
  else
  {
    sub_25DB865D0();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v57, v58);
  }
  sub_25DB86440();
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v72, *MEMORY[0x263F07890], v4);
  uint64_t v61 = sub_25DB86460();
  OUTLINED_FUNCTION_18_0();
  v62();
  OUTLINED_FUNCTION_6_0();
  v63();
  if ((unint64_t)(v61 - 12) <= 7)
  {
    uint64_t v64 = sub_25DB866B0();
    OUTLINED_FUNCTION_9_0(v59, 1, v64);
  }
  sub_25DB856CC(v59, &qword_26A6B1BC0);
  OUTLINED_FUNCTION_31_0();
}

uint64_t type metadata accessor for MapsSearchNearbyFilter()
{
  return self;
}

uint64_t sub_25DB82F00()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *char v1 = v0;
  v1[1] = sub_25DB857D4;
  return sub_25DB82794();
}

uint64_t sub_25DB82F98(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = v2;
  return OUTLINED_FUNCTION_15_0((uint64_t)sub_25DB82FB0);
}

uint64_t sub_25DB82FB0()
{
  OUTLINED_FUNCTION_10();
  sub_25DB83014();
  char v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = v2 & 1;
  return v1(v3);
}

void sub_25DB83014()
{
  OUTLINED_FUNCTION_26_0();
  char v1 = v0;
  uint64_t v93 = v2;
  v92[0] = v3;
  uint64_t v95 = sub_25DB86630();
  OUTLINED_FUNCTION_0_0();
  uint64_t v94 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21_0(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  uint64_t v8 = OUTLINED_FUNCTION_15(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21_0(v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  uint64_t v11 = OUTLINED_FUNCTION_15(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16_0(v12, v92[0]);
  uint64_t v100 = sub_25DB866B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v97 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_0();
  uint64_t v96 = v15;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_22_0();
  uint64_t v18 = OUTLINED_FUNCTION_14_0(v17);
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_40(v25, v26, v27, v28, v29, v30, v31, v32, v92[0]);
  uint64_t v33 = sub_25DB865F0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v35 = v34;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_1_0();
  uint64_t v109 = v37;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_30_0();
  uint64_t v116 = v39;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_30_0();
  uint64_t v114 = v41;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v42);
  uint64_t v44 = (char *)v92 - v43;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_25DB864F0();
  uint64_t v45 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v46 = MEMORY[0x263F8EE78];
  uint64_t v121 = MEMORY[0x263F8EE78];
  uint64_t v47 = *(void *)(v45 + 16);
  uint64_t v112 = v33;
  uint64_t v110 = v47;
  if (v47)
  {
    unint64_t v48 = 0;
    uint64_t v105 = v35 + 16;
    int v104 = *MEMORY[0x263F4E2B8];
    uint64_t v102 = (void (**)(void))(v20 + 8);
    uint64_t v103 = v20 + 104;
    uint64_t v101 = v35 + 8;
    uint64_t v113 = (void (**)(void))(v35 + 32);
    uint64_t v107 = v35;
    uint64_t v108 = v24;
    uint64_t v106 = v45;
    while (1)
    {
      if (v48 >= *(void *)(v45 + 16))
      {
        __break(1u);
        goto LABEL_47;
      }
      v115 = *(void (***)(void))(v35 + 72);
      OUTLINED_FUNCTION_19_0();
      v49();
      uint64_t v50 = v111;
      uint64_t v51 = v44;
      sub_25DB865E0();
      OUTLINED_FUNCTION_34();
      v52();
      sub_25DB8578C(&qword_26A6B1BC8, MEMORY[0x263F4E2E8]);
      sub_25DB86720();
      sub_25DB86720();
      BOOL v53 = v119 == v117 && v120 == v118;
      if (v53) {
        break;
      }
      char v54 = sub_25DB867D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v55 = *v102;
      OUTLINED_FUNCTION_7_0();
      v55();
      OUTLINED_FUNCTION_7_0();
      v55();
      if (v54) {
        goto LABEL_11;
      }
      uint64_t v44 = v51;
      OUTLINED_FUNCTION_6_0();
      v56();
      uint64_t v35 = v107;
LABEL_16:
      ++v48;
      uint64_t v45 = v106;
      if (v110 == v48)
      {
        uint64_t v63 = v121;
        uint64_t v46 = MEMORY[0x263F8EE78];
        goto LABEL_19;
      }
    }
    OUTLINED_FUNCTION_35();
    uint64_t v57 = *v102;
    OUTLINED_FUNCTION_7_0();
    v57();
    ((void (*)(uint64_t, uint64_t))v57)(v50, v18);
LABEL_11:
    uint64_t v58 = *v113;
    uint64_t v44 = v51;
    OUTLINED_FUNCTION_4_0();
    v58();
    uint64_t v59 = v121;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_12_0();
      uint64_t v59 = v121;
    }
    uint64_t v35 = v107;
    unint64_t v61 = *(void *)(v59 + 16);
    unint64_t v60 = *(void *)(v59 + 24);
    if (v61 >= v60 >> 1)
    {
      size_t v62 = OUTLINED_FUNCTION_25_0(v60);
      sub_25DB81578(v62, v61 + 1, 1);
      uint64_t v59 = v121;
    }
    *(void *)(v59 + 16) = v61 + 1;
    uint64_t v33 = v112;
    OUTLINED_FUNCTION_4_0();
    v58();
    uint64_t v121 = v59;
    goto LABEL_16;
  }
  uint64_t v63 = MEMORY[0x263F8EE78];
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v119 = v46;
  uint64_t v64 = *(void *)(v63 + 16);
  if (!v64)
  {
LABEL_31:
    swift_release();
    uint64_t v70 = v98;
    sub_25DB7E434(v46, v98);
    swift_release();
    OUTLINED_FUNCTION_9_0(v70, 1, v33);
    uint64_t v71 = v100;
    if (v53)
    {
      sub_25DB856CC(v70, &qword_26A6B1C20);
      uint64_t v74 = v99;
      uint64_t v72 = OUTLINED_FUNCTION_32_0();
      __swift_storeEnumTagSinglePayload(v72, v73, 1, v71);
    }
    else
    {
      uint64_t v74 = v99;
      sub_25DB865D0();
      uint64_t v75 = OUTLINED_FUNCTION_28_0();
      v76(v75);
      uint64_t v77 = OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_9_0(v77, v78, v71);
      if (!v79)
      {
        uint64_t v80 = v97;
        OUTLINED_FUNCTION_4_0();
        v81();
        uint64_t v82 = v96;
        OUTLINED_FUNCTION_26();
        v83();
        int v84 = (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 88))(v82, v71);
        if (v84 == *MEMORY[0x263F804B0])
        {
          (*(void (**)(uint64_t, uint64_t))(v80 + 96))(v82, v71);
          swift_projectBox();
          OUTLINED_FUNCTION_26();
          v85();
          swift_release();
          if (sub_25DB86620() != v92[0] || v86 != v93) {
            sub_25DB867D0();
          }
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_18_0();
          v89();
          OUTLINED_FUNCTION_6_0();
          v90();
        }
        else
        {
          uint64_t v88 = *(void (**)(void))(v80 + 8);
          OUTLINED_FUNCTION_7_0();
          v88();
          OUTLINED_FUNCTION_7_0();
          v88();
        }
        goto LABEL_37;
      }
    }
    sub_25DB856CC(v74, &qword_26A6B1BC0);
LABEL_37:
    OUTLINED_FUNCTION_31_0();
    return;
  }
  unint64_t v65 = 0;
  uint64_t v113 = (void (**)(void))(v35 + 8);
  uint64_t v114 = v64;
  v115 = (void (**)(void))(v35 + 32);
  uint64_t v111 = v35 + 16;
  while (v65 < *(void *)(v63 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v35 + 16))(v116, v63+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v65, v33);
    if (sub_25DB83934())
    {
      uint64_t v66 = *v115;
      OUTLINED_FUNCTION_4_0();
      v66();
      uint64_t v67 = v119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25DB81578(0, *(void *)(v67 + 16) + 1, 1);
        uint64_t v67 = v119;
      }
      unint64_t v69 = *(void *)(v67 + 16);
      unint64_t v68 = *(void *)(v67 + 24);
      if (v69 >= v68 >> 1)
      {
        sub_25DB81578(v68 > 1, v69 + 1, 1);
        uint64_t v67 = v119;
      }
      *(void *)(v67 + 16) = v69 + 1;
      uint64_t v33 = v112;
      OUTLINED_FUNCTION_4_0();
      v66();
      uint64_t v119 = v67;
      uint64_t v64 = v114;
    }
    else
    {
      ((void (*)(uint64_t, uint64_t))*v113)(v116, v33);
    }
    if (v64 == ++v65)
    {
      uint64_t v46 = v119;
      goto LABEL_31;
    }
  }
LABEL_47:
  __break(1u);
  OUTLINED_FUNCTION_6_0();
  v91();
  swift_release();
  swift_release();
  __break(1u);
}

uint64_t sub_25DB83934()
{
  uint64_t v0 = sub_25DB866C0();
  uint64_t v37 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v34 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BD8);
  MEMORY[0x270FA5388](v36);
  uint64_t v38 = (uint64_t)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25DB864D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BE0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v35 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v33 - v14);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - v16;
  sub_25DB865D0();
  uint64_t v18 = sub_25DB866B0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v18) == 1)
  {
    sub_25DB856CC((uint64_t)v9, &qword_26A6B1BC0);
    uint64_t v19 = 1;
  }
  else
  {
    sub_25DB86680();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v9, v18);
    uint64_t v19 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v19, 1, v0);
  uint64_t v20 = (void *)swift_allocObject();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F74C50], v3);
  uint64_t v21 = sub_25DB864C0();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v20[2] = v21;
  v20[3] = v23;
  v20[4] = 0xD000000000000017;
  v20[5] = 0x800000025DB87F40;
  *uint64_t v15 = v20;
  uint64_t v24 = v37;
  (*(void (**)(void *, void, uint64_t))(v37 + 104))(v15, *MEMORY[0x263F80740], v0);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v0);
  uint64_t v25 = v38;
  uint64_t v26 = v38 + *(int *)(v36 + 48);
  uint64_t v27 = &qword_26A6B1BE0;
  sub_25DB85674((uint64_t)v17, v38, &qword_26A6B1BE0);
  sub_25DB85674((uint64_t)v15, v26, &qword_26A6B1BE0);
  if (__swift_getEnumTagSinglePayload(v25, 1, v0) == 1)
  {
    sub_25DB856CC((uint64_t)v15, &qword_26A6B1BE0);
    sub_25DB856CC((uint64_t)v17, &qword_26A6B1BE0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v0) == 1)
    {
      char v28 = -1;
    }
    else
    {
      uint64_t v27 = &qword_26A6B1BD8;
      char v28 = 0;
    }
  }
  else
  {
    uint64_t v29 = (uint64_t)v35;
    sub_25DB85674(v25, (uint64_t)v35, &qword_26A6B1BE0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v0) == 1)
    {
      sub_25DB856CC((uint64_t)v15, &qword_26A6B1BE0);
      sub_25DB856CC((uint64_t)v17, &qword_26A6B1BE0);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v29, v0);
      char v28 = 0;
      uint64_t v27 = &qword_26A6B1BD8;
    }
    else
    {
      uint64_t v30 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v34, v26, v0);
      sub_25DB8578C(&qword_26A6B1BE8, MEMORY[0x263F80768]);
      char v28 = sub_25DB866F0();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v24 + 8);
      v31(v30, v0);
      uint64_t v27 = &qword_26A6B1BE0;
      sub_25DB856CC((uint64_t)v15, &qword_26A6B1BE0);
      sub_25DB856CC((uint64_t)v17, &qword_26A6B1BE0);
      v31(v35, v0);
    }
  }
  sub_25DB856CC(v25, v27);
  return v28 & 1;
}

uint64_t sub_25DB83ED8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for WeatherLocationEntityCurrentFilter()
{
  return self;
}

uint64_t sub_25DB83F34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DB857D4;
  return sub_25DB82F98((uint64_t)v4, a2);
}

uint64_t sub_25DB83FCC(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return OUTLINED_FUNCTION_15_0((uint64_t)sub_25DB83FE8);
}

uint64_t sub_25DB83FE8()
{
  OUTLINED_FUNCTION_39();
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = v1[3];
  v0[20] = v2;
  v0[21] = v1[4];
  v0[22] = __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v3 = sub_25DB864E0();
  uint64_t v5 = v4;
  v0[23] = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[24] = v7;
  void *v7 = v0;
  v7[1] = sub_25DB840D4;
  return MEMORY[0x270F71DB0](v0 + 2, ObjectType, v5);
}

uint64_t sub_25DB840D4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_0();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_25DB841C0()
{
  v0[25] = sub_25DB864E0();
  v0[26] = v1;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  v0[10] = v2;
  v0[11] = *(void *)(v3 + 8);
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  OUTLINED_FUNCTION_19_0();
  v4();
  v0[27] = swift_getObjectType();
  uint64_t v6 = sub_25DB86740();
  return MEMORY[0x270FA2498](sub_25DB842C4, v6, v5);
}

uint64_t sub_25DB842C4()
{
  OUTLINED_FUNCTION_10();
  sub_25DB865A0();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25DB84360()
{
  OUTLINED_FUNCTION_39();
  if (*(void *)(v0 + 120))
  {
    sub_25DB86580();
    swift_dynamicCast();
  }
  else
  {
    sub_25DB856CC(v0 + 96, &qword_26A6B1C80);
  }
  sub_25DB84440();
  char v2 = v1;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3(v2 & 1);
}

void sub_25DB84440()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v128 = v0;
  v144 = v1;
  uint64_t v3 = v2;
  uint64_t v131 = sub_25DB86660();
  OUTLINED_FUNCTION_0_0();
  uint64_t v136 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v126[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v130 = sub_25DB86650();
  OUTLINED_FUNCTION_0_0();
  uint64_t v129 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_0();
  uint64_t v153 = OUTLINED_FUNCTION_14_0(v10);
  OUTLINED_FUNCTION_0_0();
  uint64_t v142 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_0();
  uint64_t v150 = v13;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_22_0();
  uint64_t v149 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C20);
  uint64_t v17 = OUTLINED_FUNCTION_15(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21_0(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1BC0);
  uint64_t v20 = OUTLINED_FUNCTION_15(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2_0();
  v138 = v21;
  uint64_t v137 = sub_25DB866B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_1_0();
  v140 = v25;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v26);
  char v28 = &v126[-v27];
  sub_25DB865F0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v151 = v30;
  v152 = (unsigned char *)v29;
  MEMORY[0x270FA5388](v29);
  v155 = &v126[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_22_0();
  uint64_t v156 = v33;
  uint64_t v34 = sub_25DB864B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v36 = v35;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_21_0((uint64_t)&v126[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C88);
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_1_0();
  uint64_t v145 = v40;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = &v126[-v42];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6B1C90);
  uint64_t v45 = OUTLINED_FUNCTION_15(v44);
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_1_0();
  uint64_t v134 = v46;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_30_0();
  uint64_t v147 = v48;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_30_0();
  v148 = (char *)v50;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_30_0();
  uint64_t v53 = v52;
  OUTLINED_FUNCTION_3_0();
  uint64_t v55 = MEMORY[0x270FA5388](v54);
  uint64_t v57 = &v126[-v56];
  MEMORY[0x270FA5388](v55);
  uint64_t v59 = &v126[-v58];
  v139 = v7;
  v132 = v28;
  if (v3)
  {
    sub_25DB86570();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6B1CA0);
    uint64_t v60 = swift_dynamicCast() ^ 1;
    unint64_t v61 = v59;
  }
  else
  {
    unint64_t v61 = &v126[-v58];
    uint64_t v60 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v61, v60, 1, v34);
  uint64_t v62 = *MEMORY[0x263F74AE8];
  uint64_t v146 = v36;
  uint64_t v63 = *(char **)(v36 + 104);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v63)(v57, v62, v34);
  __swift_storeEnumTagSinglePayload((uint64_t)v57, 0, 1, v34);
  uint64_t v64 = (uint64_t)&v43[*(int *)(v154 + 48)];
  unint64_t v65 = &qword_26A6B1C90;
  v141 = v59;
  sub_25DB85674((uint64_t)v59, (uint64_t)v43, &qword_26A6B1C90);
  sub_25DB85674((uint64_t)v57, v64, &qword_26A6B1C90);
  OUTLINED_FUNCTION_5_0((uint64_t)v43);
  v133 = v23;
  if (v69)
  {
    sub_25DB856CC((uint64_t)v57, &qword_26A6B1C90);
    OUTLINED_FUNCTION_5_0(v64);
    if (v69)
    {
      sub_25DB856CC((uint64_t)v43, &qword_26A6B1C90);
      uint64_t v66 = OUTLINED_FUNCTION_37();
      sub_25DB85674(v66, v67, &qword_26A6B1C90);
      OUTLINED_FUNCTION_20_0();
      uint64_t v68 = v153;
LABEL_20:
      sub_25DB856CC((uint64_t)v65, &qword_26A6B1C90);
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  sub_25DB85674((uint64_t)v43, v53, &qword_26A6B1C90);
  OUTLINED_FUNCTION_5_0(v64);
  if (v69)
  {
    sub_25DB856CC((uint64_t)v57, &qword_26A6B1C90);
    (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v53, v34);
LABEL_12:
    sub_25DB856CC((uint64_t)v43, &qword_26A6B1C88);
    uint64_t v70 = OUTLINED_FUNCTION_37();
    sub_25DB85674(v70, v71, v72);
    uint64_t v59 = v140;
    uint64_t v68 = v153;
    goto LABEL_15;
  }
  uint64_t v73 = v146;
  OUTLINED_FUNCTION_4_0();
  v74();
  sub_25DB8578C(&qword_26A6B1C98, MEMORY[0x263F74B20]);
  int v127 = sub_25DB866F0();
  uint64_t v75 = *(void (**)(void))(v73 + 8);
  OUTLINED_FUNCTION_13_0();
  v75();
  sub_25DB856CC((uint64_t)v57, &qword_26A6B1C90);
  OUTLINED_FUNCTION_13_0();
  v75();
  sub_25DB856CC((uint64_t)v43, &qword_26A6B1C90);
  unint64_t v65 = (uint64_t *)v148;
  sub_25DB85674((uint64_t)v141, (uint64_t)v148, &qword_26A6B1C90);
  uint64_t v59 = v140;
  uint64_t v68 = v153;
  if (v127)
  {
    uint64_t v23 = v139;
    uint64_t v63 = v138;
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v76 = v147;
  ((void (*)(uint64_t, void, uint64_t))v63)(v147, *MEMORY[0x263F74AF8], v34);
  __swift_storeEnumTagSinglePayload(v76, 0, 1, v34);
  uint64_t v77 = v145;
  uint64_t v78 = v145 + *(int *)(v154 + 48);
  sub_25DB85674((uint64_t)v65, v145, &qword_26A6B1C90);
  sub_25DB85674(v76, v78, &qword_26A6B1C90);
  OUTLINED_FUNCTION_5_0(v77);
  if (v69)
  {
    sub_25DB856CC(v76, &qword_26A6B1C90);
    sub_25DB856CC((uint64_t)v65, &qword_26A6B1C90);
    OUTLINED_FUNCTION_5_0(v78);
    uint64_t v23 = v139;
    uint64_t v63 = v138;
    if (v69)
    {
      unint64_t v65 = (uint64_t *)v77;
      goto LABEL_20;
    }
LABEL_44:
    sub_25DB856CC(v77, &qword_26A6B1C88);
    goto LABEL_49;
  }
  uint64_t v97 = v134;
  sub_25DB85674(v77, v134, &qword_26A6B1C90);
  OUTLINED_FUNCTION_5_0(v78);
  uint64_t v23 = v139;
  uint64_t v63 = v138;
  if (v98)
  {
    sub_25DB856CC(v147, &qword_26A6B1C90);
    sub_25DB856CC((uint64_t)v65, &qword_26A6B1C90);
    (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v97, v34);
    goto LABEL_44;
  }
  uint64_t v102 = v146;
  uint64_t v103 = v143;
  OUTLINED_FUNCTION_4_0();
  v104();
  sub_25DB8578C(&qword_26A6B1C98, MEMORY[0x263F74B20]);
  LODWORD(v154) = sub_25DB866F0();
  uint64_t v105 = *(void (**)(void (**)(void), uint64_t))(v102 + 8);
  v105(v103, v34);
  sub_25DB856CC(v147, &qword_26A6B1C90);
  sub_25DB856CC((uint64_t)v65, &qword_26A6B1C90);
  v105((void (**)(void))v97, v34);
  uint64_t v106 = OUTLINED_FUNCTION_28_0();
  sub_25DB856CC(v106, v107);
  uint64_t v59 = v140;
  if ((v154 & 1) == 0) {
    goto LABEL_49;
  }
LABEL_21:
  __swift_project_boxed_opaque_existential_1(v144, v144[3]);
  sub_25DB864F0();
  uint64_t v79 = sub_25DB86730();
  swift_bridgeObjectRelease();
  uint64_t v80 = MEMORY[0x263F8EE78];
  uint64_t v159 = MEMORY[0x263F8EE78];
  v148 = *(char **)(v79 + 16);
  if (!v148)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    uint64_t v93 = v135;
    sub_25DB7E434(v80, v135);
    swift_release();
    uint64_t v94 = OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_0(v94, v95, (uint64_t)v152);
    uint64_t v96 = v136;
    if (v69)
    {
      sub_25DB856CC(v93, &qword_26A6B1C20);
      __swift_storeEnumTagSinglePayload((uint64_t)v63, 1, 1, v137);
    }
    else
    {
      sub_25DB865D0();
      OUTLINED_FUNCTION_6_0();
      v99();
      uint64_t v100 = v137;
      OUTLINED_FUNCTION_9_0((uint64_t)v63, 1, v137);
      if (!v101)
      {
        uint64_t v108 = v133;
        OUTLINED_FUNCTION_4_0();
        v109();
        OUTLINED_FUNCTION_26();
        v110();
        int v111 = (*((uint64_t (**)(unsigned char *, uint64_t))v108 + 11))(v59, v100);
        if (v111 == *MEMORY[0x263F804E8])
        {
          (*((void (**)(unsigned char *, uint64_t))v108 + 12))(v59, v100);
          swift_projectBox();
          uint64_t v112 = v131;
          OUTLINED_FUNCTION_26();
          v113();
          if ((*(unsigned int (**)(unsigned char *, uint64_t))(v96 + 88))(v23, v112) == *MEMORY[0x263F80498])
          {
            (*(void (**)(unsigned char *, uint64_t))(v96 + 96))(v23, v112);
            OUTLINED_FUNCTION_4_0();
            v114();
            swift_release();
            v115 = (void *)sub_25DB86640();
            uint64_t v116 = sub_25DB8571C(v115);
            if (v117)
            {
              sub_25DB85330(v116, v117, *(void **)(v128 + 16));
              uint64_t v118 = OUTLINED_FUNCTION_17_0();
              v119(v118);
              OUTLINED_FUNCTION_6_0();
              v120();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v123 = OUTLINED_FUNCTION_17_0();
              v124(v123);
              OUTLINED_FUNCTION_6_0();
              v125();
            }
          }
          else
          {
            OUTLINED_FUNCTION_27_0();
            v122();
            (*(void (**)(unsigned char *, uint64_t))(v96 + 8))(v23, v112);
            swift_release();
          }
        }
        else
        {
          uint64_t v121 = (void (*)(void))*((void *)v108 + 1);
          OUTLINED_FUNCTION_27_0();
          v121();
          OUTLINED_FUNCTION_27_0();
          v121();
        }
        goto LABEL_49;
      }
    }
    sub_25DB856CC((uint64_t)v63, &qword_26A6B1BC0);
LABEL_49:
    sub_25DB856CC((uint64_t)v141, &qword_26A6B1C90);
    OUTLINED_FUNCTION_31_0();
    return;
  }
  uint64_t v63 = 0;
  uint64_t v146 = v151 + 16;
  LODWORD(v145) = *MEMORY[0x263F4E230];
  v144 = (void *)(v142 + 104);
  v143 = (void (**)(void))(v142 + 8);
  uint64_t v142 = v151 + 8;
  uint64_t v154 = v151 + 32;
  uint64_t v81 = v149;
  uint64_t v147 = v79;
  while ((unint64_t)v63 < *(void *)(v79 + 16))
  {
    uint64_t v23 = *(unsigned char **)(v151 + 72);
    OUTLINED_FUNCTION_19_0();
    v82();
    sub_25DB865E0();
    OUTLINED_FUNCTION_34();
    v83();
    sub_25DB8578C(&qword_26A6B1BC8, MEMORY[0x263F4E2E8]);
    sub_25DB86720();
    sub_25DB86720();
    if (v160 == v157 && v161 == v158)
    {
      OUTLINED_FUNCTION_35();
      uint64_t v88 = *v143;
      OUTLINED_FUNCTION_7_0();
      v88();
      ((void (*)(uint64_t, uint64_t))v88)(v81, v68);
LABEL_31:
      uint64_t v89 = *(void (**)(void))v154;
      uint64_t v59 = v152;
      OUTLINED_FUNCTION_4_0();
      v89();
      uint64_t v90 = v159;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25DB81578(0, *(void *)(v90 + 16) + 1, 1);
        uint64_t v90 = v159;
      }
      uint64_t v81 = v149;
      unint64_t v92 = *(void *)(v90 + 16);
      unint64_t v91 = *(void *)(v90 + 24);
      if (v92 >= v91 >> 1)
      {
        sub_25DB81578(v91 > 1, v92 + 1, 1);
        uint64_t v90 = v159;
      }
      *(void *)(v90 + 16) = v92 + 1;
      OUTLINED_FUNCTION_4_0();
      v89();
      uint64_t v159 = v90;
      goto LABEL_36;
    }
    char v85 = sub_25DB867D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v86 = *v143;
    OUTLINED_FUNCTION_7_0();
    v86();
    OUTLINED_FUNCTION_7_0();
    v86();
    if (v85) {
      goto LABEL_31;
    }
    uint64_t v59 = v152;
    OUTLINED_FUNCTION_6_0();
    v87();
    uint64_t v81 = v149;
LABEL_36:
    ++v63;
    uint64_t v79 = v147;
    uint64_t v68 = v153;
    if (v148 == v63)
    {
      uint64_t v80 = v159;
      OUTLINED_FUNCTION_20_0();
      goto LABEL_38;
    }
  }
  __break(1u);
}

uint64_t sub_25DB85330(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25DB867D0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_25DB867D0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25DB853F8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PointOfInterestFilter()
{
  return self;
}

uint64_t sub_25DB85454(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25DB854FC;
  return sub_25DB83FCC(a1, a2);
}

uint64_t sub_25DB854FC()
{
  OUTLINED_FUNCTION_10();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_10_0();
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t sub_25DB855D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25DB85674(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_19_0();
  v4();
  return a2;
}

uint64_t sub_25DB856CC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_0();
  v3();
  return a1;
}

uint64_t sub_25DB8571C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_category);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25DB86700();

  return v3;
}

uint64_t sub_25DB8578C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

size_t OUTLINED_FUNCTION_12_0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25DB81578(0, v2, 1);
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return sub_25DB865C0();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

void OUTLINED_FUNCTION_16_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 280) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return v0;
}

void OUTLINED_FUNCTION_21_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_25_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return *(void *)(v0 - 280);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_25DB86420();
}

void OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 184) = (char *)&a9 - v9;
}

void OUTLINED_FUNCTION_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 136) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t sub_25DB85ADC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25DB85AF0()
{
  unint64_t v0 = sub_25DB867E0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x34) {
    return 52;
  }
  else {
    return v0;
  }
}

uint64_t sub_25DB85B44(char a1)
{
  uint64_t v2 = sub_25DB864D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, **((unsigned int **)&unk_2655139A8 + a1), v2);
  uint64_t v6 = sub_25DB864C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

void *sub_25DB85C4C()
{
  return &unk_270AA3DE0;
}

uint64_t sub_25DB85C58(char a1)
{
  uint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C505F736B6F6F42;
      break;
    case 2:
      return result;
    case 3:
      uint64_t result = 0xD000000000000016;
      break;
    case 4:
      uint64_t result = 0xD000000000000019;
      break;
    case 5:
      uint64_t result = 0xD000000000000017;
      break;
    case 6:
      uint64_t result = 0xD000000000000016;
      break;
    case 7:
      uint64_t result = 0xD000000000000017;
      break;
    case 8:
      uint64_t result = 0x65535F6B636F6C43;
      break;
    case 9:
      uint64_t result = 0xD000000000000017;
      break;
    case 10:
    case 12:
    case 17:
    case 23:
    case 24:
    case 28:
    case 34:
    case 35:
      uint64_t result = 0xD000000000000015;
      break;
    case 11:
      uint64_t result = 0xD000000000000014;
      break;
    case 13:
      uint64_t result = 0xD000000000000018;
      break;
    case 14:
      uint64_t result = 0xD000000000000017;
      break;
    case 15:
      uint64_t result = 0xD000000000000013;
      break;
    case 16:
      uint64_t result = 0xD000000000000014;
      break;
    case 18:
      uint64_t v3 = 0x525F6C69614DLL;
      goto LABEL_46;
    case 19:
      uint64_t result = 0xD000000000000013;
      break;
    case 20:
      uint64_t result = 0xD000000000000017;
      break;
    case 21:
      uint64_t result = 0xD000000000000011;
      break;
    case 22:
      uint64_t result = 0xD000000000000019;
      break;
    case 25:
      uint64_t result = 0xD000000000000013;
      break;
    case 26:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 27:
      uint64_t result = 0xD000000000000016;
      break;
    case 29:
      uint64_t result = 0xD000000000000018;
      break;
    case 30:
      uint64_t result = 0xD000000000000010;
      break;
    case 31:
      uint64_t result = 0xD000000000000019;
      break;
    case 32:
      uint64_t result = 0xD00000000000001ELL;
      break;
    case 33:
      uint64_t result = 0xD000000000000013;
      break;
    case 36:
      uint64_t result = 0xD000000000000014;
      break;
    case 37:
      uint64_t result = 0xD000000000000013;
      break;
    case 38:
      uint64_t result = 0x465F6D6574737953;
      break;
    case 39:
      uint64_t result = 0xD000000000000011;
      break;
    case 40:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 41:
      uint64_t result = 0xD000000000000014;
      break;
    case 42:
      uint64_t result = 0x545F6D6574737953;
      break;
    case 43:
      uint64_t result = 0xD000000000000019;
      break;
    case 44:
      uint64_t result = 0xD00000000000001ELL;
      break;
    case 45:
      uint64_t result = 0xD000000000000014;
      break;
    case 46:
      uint64_t result = 0xD000000000000017;
      break;
    case 47:
      uint64_t result = 0xD000000000000013;
      break;
    case 48:
      uint64_t result = 0xD000000000000010;
      break;
    case 49:
      uint64_t result = 0x6F4D77654E5F5654;
      break;
    case 50:
      uint64_t v3 = 0x7274535F5654;
LABEL_46:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6165000000000000;
      break;
    case 51:
      uint64_t result = 0x65726168535F5654;
      break;
    default:
      uint64_t result = 0x704F5F736B6F6F42;
      break;
  }
  return result;
}

uint64_t sub_25DB86134(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x6C6946434F44;
      return v3 & 0xFFFFFFFFFFFFLL | 0x4565000000000000;
    case 2:
    case 3:
    case 5:
      return result;
    case 4:
      return 0x6472616F424C5243;
    case 6:
      uint64_t v4 = 0x456563616C50;
      goto LABEL_19;
    case 7:
      return 0xD000000000000012;
    case 8:
      uint64_t v3 = 0x67617373654DLL;
      return v3 & 0xFFFFFFFFFFFFLL | 0x4565000000000000;
    case 9:
      return 0xD000000000000016;
    case 10:
      return 0xD00000000000001BLL;
    case 11:
      uint64_t v3 = 0x6C6369747241;
      return v3 & 0xFFFFFFFFFFFFLL | 0x4565000000000000;
    case 12:
      unsigned int v5 = 1702129486;
      goto LABEL_21;
    case 13:
      uint64_t v6 = 0x7265646C6F46;
      goto LABEL_29;
    case 14:
      return 0xD000000000000010;
    case 15:
      return 0x7469746E45676154;
    case 16:
      uint64_t v4 = 0x457465737341;
      goto LABEL_19;
    case 17:
      uint64_t v4 = 0x456D75626C41;
LABEL_19:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x746E000000000000;
      break;
    case 18:
      unsigned int v5 = 1953720652;
LABEL_21:
      uint64_t result = v5 | 0x69746E4500000000;
      break;
    case 19:
      uint64_t result = 0xD000000000000012;
      break;
    case 20:
      uint64_t result = 0x7469746E45626154;
      break;
    case 21:
      uint64_t result = 0x6B72616D6B6F6F42;
      break;
    case 22:
      uint64_t result = 0xD000000000000015;
      break;
    case 23:
      uint64_t v6 = 0x6C6F626D7953;
LABEL_29:
      uint64_t result = v6 & 0xFFFFFFFFFFFFLL | 0x6E45000000000000;
      break;
    case 24:
      uint64_t result = 0xD000000000000017;
      break;
    default:
      uint64_t result = 0x457070416B6F6F42;
      break;
  }
  return result;
}

uint64_t sub_25DB863C8()
{
  sub_25DB86480();
  swift_allocObject();
  uint64_t result = MEMORY[0x2611BE8B0](0xD000000000000018, 0x800000025DB871C0);
  qword_26A6B2A30 = result;
  return result;
}

uint64_t sub_25DB86420()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25DB86430()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25DB86440()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25DB86450()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25DB86460()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_25DB86470()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25DB86480()
{
  return MEMORY[0x270F718D0]();
}

uint64_t sub_25DB86490()
{
  return MEMORY[0x270F718D8]();
}

uint64_t sub_25DB864A0()
{
  return MEMORY[0x270F71908]();
}

uint64_t sub_25DB864B0()
{
  return MEMORY[0x270F71A50]();
}

uint64_t sub_25DB864C0()
{
  return MEMORY[0x270F71B38]();
}

uint64_t sub_25DB864D0()
{
  return MEMORY[0x270F71B40]();
}

uint64_t sub_25DB864E0()
{
  return MEMORY[0x270F71B60]();
}

uint64_t sub_25DB864F0()
{
  return MEMORY[0x270F71B88]();
}

uint64_t sub_25DB86510()
{
  return MEMORY[0x270F71C78]();
}

uint64_t sub_25DB86520()
{
  return MEMORY[0x270F71C80]();
}

uint64_t sub_25DB86530()
{
  return MEMORY[0x270F71C88]();
}

uint64_t sub_25DB86540()
{
  return MEMORY[0x270F71CA0]();
}

uint64_t sub_25DB86550()
{
  return MEMORY[0x270F71CE8]();
}

uint64_t sub_25DB86560()
{
  return MEMORY[0x270F71D28]();
}

uint64_t sub_25DB86570()
{
  return MEMORY[0x270F71D70]();
}

uint64_t sub_25DB86580()
{
  return MEMORY[0x270F71D98]();
}

uint64_t sub_25DB865A0()
{
  return MEMORY[0x270F71DC0]();
}

uint64_t sub_25DB865B0()
{
  return MEMORY[0x270F71DF0]();
}

uint64_t sub_25DB865C0()
{
  return MEMORY[0x270F41250]();
}

uint64_t sub_25DB865D0()
{
  return MEMORY[0x270F41518]();
}

uint64_t sub_25DB865E0()
{
  return MEMORY[0x270F41530]();
}

uint64_t sub_25DB865F0()
{
  return MEMORY[0x270F41550]();
}

uint64_t sub_25DB86600()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DB86610()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DB86620()
{
  return MEMORY[0x270F7FE78]();
}

uint64_t sub_25DB86630()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_25DB86640()
{
  return MEMORY[0x270F7FF98]();
}

uint64_t sub_25DB86650()
{
  return MEMORY[0x270F7FFA0]();
}

uint64_t sub_25DB86660()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_25DB86670()
{
  return MEMORY[0x270F7FFC0]();
}

uint64_t sub_25DB86680()
{
  return MEMORY[0x270F7FFC8]();
}

uint64_t sub_25DB86690()
{
  return MEMORY[0x270F7FFD8]();
}

uint64_t sub_25DB866A0()
{
  return MEMORY[0x270F7FFE8]();
}

uint64_t sub_25DB866B0()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_25DB866C0()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_25DB866D0()
{
  return MEMORY[0x270F80440]();
}

uint64_t sub_25DB866E0()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_25DB866F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25DB86700()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DB86710()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DB86720()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25DB86730()
{
  return MEMORY[0x270F71E10]();
}

uint64_t sub_25DB86740()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25DB86750()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25DB86760()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DB86770()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_25DB86780()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DB86790()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DB867A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DB867B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DB867C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DB867D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DB867E0()
{
  return MEMORY[0x270F9FA40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}