unint64_t sub_230E4CA78()
{
  sub_230E4FE40();
  swift_bridgeObjectRelease();
  return 0xD000000000000028;
}

unint64_t sub_230E4CAD0()
{
  return 0xD000000000000016;
}

BOOL sub_230E4CAEC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_230E4CAFC()
{
  return sub_230E4FF10();
}

uint64_t sub_230E4CB24(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4974736163646F70 && a2 == 0xE900000000000064;
  if (v3 || (sub_230E4FED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_230E4FED0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_230E4CC04()
{
  return sub_230E4FF20();
}

uint64_t sub_230E4CC4C(char a1)
{
  if (a1) {
    return 1701669236;
  }
  else {
    return 0x4974736163646F70;
  }
}

BOOL sub_230E4CC80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_230E4CAEC(*a1, *a2);
}

uint64_t sub_230E4CC8C()
{
  return sub_230E4CC04();
}

uint64_t sub_230E4CC94()
{
  return sub_230E4CAFC();
}

uint64_t sub_230E4CC9C()
{
  return sub_230E4FF20();
}

uint64_t sub_230E4CCE0()
{
  return sub_230E4CC4C(*v0);
}

uint64_t sub_230E4CCE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_230E4CB24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230E4CD10()
{
  return 0;
}

void sub_230E4CD1C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_230E4CD28(uint64_t a1)
{
  unint64_t v2 = sub_230E4F86C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_230E4CD64(uint64_t a1)
{
  unint64_t v2 = sub_230E4F86C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_230E4CDA0(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268714BB8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230E4F86C();
  sub_230E4FF40();
  sub_230E4FEB0();
  if (!v1) {
    sub_230E4FEC0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

double sub_230E4CEE4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268714BC0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230E4F86C();
  sub_230E4FF30();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    sub_230E4FE90();
    swift_bridgeObjectRetain();
    sub_230E4FEA0();
    double v2 = v5;
    uint64_t v6 = OUTLINED_FUNCTION_7();
    v7(v6);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

void sub_230E4D08C(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v6 = sub_230E4CEE4(a1);
  if (!v2)
  {
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(double *)(a2 + 16) = v6;
  }
}

uint64_t sub_230E4D0BC(void *a1)
{
  return sub_230E4CDA0(a1);
}

void sub_230E4D0DC()
{
  unk_268714BD6 = -4864;
}

unint64_t sub_230E4D10C()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_230E4D128()
{
  type metadata accessor for DBKnowledgeStore();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_230E4E208();
  qword_268714FC0 = v0;
  return result;
}

uint64_t static DBKnowledgeStore.instance.getter()
{
  if (qword_268714FB8 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_230E4D1C4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268714B70);
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_6();
  uint64_t v6 = sub_230E4FCE0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v19 - v13;
  sub_230E4E0BC();
  uint64_t v15 = sub_230E4FDC0();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v14, v6);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = v2;
  *((void *)v17 + 5) = a1;
  *((void *)v17 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v16], v12, v6);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_230E4DB08(v3, (uint64_t)&unk_268714B80, (uint64_t)v17);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v6);
}

uint64_t sub_230E4D394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  return MEMORY[0x270FA2498](sub_230E4D3B8, 0, 0);
}

uint64_t sub_230E4D3B8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  long long v4 = *(_OWORD *)(v0 + 56);
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_230E4D4B4;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_230E4D4B4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_230E4D5B4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = sub_230E4D5A0;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_230E4D5A0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230E4D5B4()
{
  uint64_t v10 = v0;
  swift_task_dealloc();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_230E4FCF0();
  os_log_type_t v2 = sub_230E4FDE0();
  if (os_log_type_enabled(v1, v2))
  {
    id v8 = *(id *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 48);
    unint64_t v3 = *(void *)(v0 + 56);
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_230E4E498(v4, v3, &v9);
    sub_230E4FE20();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v0 + 24) = sub_230E4E498(0xD000000000000016, 0x8000000230E50470, &v9);
    sub_230E4FE20();
    *(_WORD *)(v5 + 22) = 2080;
    *(void *)(v0 + 32) = sub_230E4E498(0xD00000000000002ELL, 0x8000000230E50530, &v9);
    sub_230E4FE20();
    _os_log_impl(&dword_230E4B000, v1, v2, "Failed to set value %s for %s. Error: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

void sub_230E4D800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = a2;
  uint64_t v26 = a5;
  uint64_t v29 = a4;
  uint64_t v27 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268714B98);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_230E4FCE0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v17);
  v18 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = *(id *)(a2 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_knowledgeStore);
  uint64_t v29 = sub_230E4FD20();
  sub_230E4CA78();
  uint64_t v28 = sub_230E4FD20();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v26, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v6);
  unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v20 = (v16 + *(unsigned __int8 *)(v8 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v21 + v19, v18, v12);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v21 + v20, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_230E4F298;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_230E4DA9C;
  aBlock[3] = &block_descriptor;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v23 = (void *)v29;
  v24 = (void *)v28;
  objc_msgSend(v30, sel_setValue_forKey_completionHandler_, v29, v28, v22);
  _Block_release(v22);
}

void sub_230E4DA9C(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_230E4DB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230E4FDC0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_230E4F030(a1);
  }
  else
  {
    sub_230E4FDB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230E4FD80();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_230E4DC70()
{
  uint64_t v0 = sub_230E4FD50();
  MEMORY[0x270FA5388](v0 - 8);
  sub_230E4FC90();
  swift_allocObject();
  sub_230E4FC80();
  sub_230E4F5C4();
  uint64_t v1 = sub_230E4FC70();
  unint64_t v3 = v2;
  swift_release();
  sub_230E4FD40();
  uint64_t v4 = sub_230E4FD30();
  uint64_t v6 = v5;
  uint64_t result = sub_230E4F610(v1, v3);
  if (v6)
  {
    sub_230E4D1C4(v4, v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_230E4DF10(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_230E4FCF0();
  os_log_type_t v5 = sub_230E4FDD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    sub_230E4E498(a1, a2, &v8);
    sub_230E4FE20();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2048;
    sub_230E4FE20();
    _os_log_impl(&dword_230E4B000, v4, v5, "InternalKnowledgeStore: Setting PodcastLastInvocation for podcast: %s at time: %f", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_230E4DC70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_230E4E0BC()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_mainLog);
  sub_230E4FCD0();
  sub_230E4FE00();

  return sub_230E4FCC0();
}

uint64_t DBKnowledgeStore.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_logger;
  uint64_t v2 = sub_230E4FD10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t DBKnowledgeStore.__deallocating_deinit()
{
  DBKnowledgeStore.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_230E4E208()
{
  if (_MergedGlobals != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  sub_230E4FD00();
  uint64_t v1 = OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_mainLog;
  sub_230E4F668();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  *(void *)(v0 + v1) = sub_230E4FE10();
  uint64_t v2 = OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_knowledgeStore;
  sub_230E4FCB0();
  *(void *)(v0 + v2) = sub_230E4FCA0();
  return v0;
}

uint64_t sub_230E4E2F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_230E4E3D0;
  return v6(a1);
}

uint64_t sub_230E4E3D0()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_230E4E498(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_230E4E56C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_230E4F564((uint64_t)v12, *a3);
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
      sub_230E4F564((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_230E4E56C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_230E4E6C4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_230E4FE30();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_230E4E79C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_230E4FE60();
    if (!v8)
    {
      uint64_t result = sub_230E4FE70();
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

void *sub_230E4E6C4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_230E4FE80();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_230E4E79C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_230E4E834(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_230E4EA10(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_230E4EA10((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230E4E834(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_230E4FD70();
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
  unint64_t v3 = sub_230E4E9A8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_230E4FE50();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_230E4FE80();
  __break(1u);
LABEL_14:
  uint64_t result = sub_230E4FE70();
  __break(1u);
  return result;
}

void *sub_230E4E9A8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268714BA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_230E4EA10(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268714BA0);
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
    sub_230E4EBC0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_230E4EAE8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_230E4EAE8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_230E4FE80();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_230E4EBC0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_230E4FE80();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_230E4EC50()
{
  return type metadata accessor for DBKnowledgeStore();
}

uint64_t type metadata accessor for DBKnowledgeStore()
{
  uint64_t result = qword_268714BF0;
  if (!qword_268714BF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_230E4ECA0()
{
  uint64_t result = sub_230E4FD10();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_2(result);
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DBKnowledgeStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DBKnowledgeStore);
}

uint64_t dispatch thunk of DBKnowledgeStore.setLastInvocationFor(podcast:at:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
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

uint64_t sub_230E4EDC8()
{
  uint64_t v1 = sub_230E4FCE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 56) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_230E4EE7C()
{
  uint64_t v2 = sub_230E4FCE0();
  OUTLINED_FUNCTION_2(v2);
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (uint64_t)v0 + ((*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_230E4EF44;
  return sub_230E4D394((uint64_t)v8, v9, v10, v4, v5, v6, v7);
}

uint64_t sub_230E4EF44()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_230E4F030(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268714B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230E4F090()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_230E4F0C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_230E4EF44;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268714B88 + dword_268714B88);
  return v6(a1, v4);
}

void sub_230E4F180(uint64_t a1)
{
  sub_230E4D800(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_230E4F18C()
{
  uint64_t v1 = sub_230E4FCE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v7 = v5 + *(void *)(v6 + 64);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268714B98);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v7 + v13) & ~v13;
  uint64_t v15 = v14 + *(void *)(v12 + 64);
  uint64_t v16 = v4 | v13 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);

  return MEMORY[0x270FA0238](v0, v15, v16);
}

uint64_t sub_230E4F298(void *a1)
{
  sub_230E4FCE0();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268714B98);
  OUTLINED_FUNCTION_2(v2);
  sub_230E4FDF0();
  sub_230E4FCC0();
  if (a1)
  {
    MEMORY[0x230FCE020](a1);
    MEMORY[0x230FCE020](a1);
    MEMORY[0x230FCE020](a1);
    uint64_t v3 = sub_230E4FCF0();
    os_log_type_t v4 = sub_230E4FDE0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315394;
      sub_230E4CA78();
      sub_230E4E498(0xD000000000000028, v6, &v10);
      sub_230E4FE20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v5 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v7 = sub_230E4FEF0();
      sub_230E4E498(v7, v8, &v10);
      sub_230E4FE20();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230E4B000, v3, v4, "Error while updating value for %s: %s", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
    }
    else
    {
    }
    uint64_t v10 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268714B98);
    return sub_230E4FD90();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268714B98);
    return sub_230E4FDA0();
  }
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

uint64_t sub_230E4F564(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_230E4F5C4()
{
  unint64_t result = qword_268714BA8;
  if (!qword_268714BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268714BA8);
  }
  return result;
}

uint64_t sub_230E4F610(uint64_t a1, unint64_t a2)
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

unint64_t sub_230E4F668()
{
  unint64_t result = qword_268714BB0;
  if (!qword_268714BB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268714BB0);
  }
  return result;
}

uint64_t destroy for PodcastLastInvocation()
{
  return swift_bridgeObjectRelease();
}

void *_s25SiriDailyBriefingInternal21PodcastLastInvocationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PodcastLastInvocation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for PodcastLastInvocation(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for PodcastLastInvocation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for PodcastLastInvocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PodcastLastInvocation()
{
  return &type metadata for PodcastLastInvocation;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_230E4F86C()
{
  unint64_t result = qword_268714D00[0];
  if (!qword_268714D00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268714D00);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PodcastLastInvocation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PodcastLastInvocation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x230E4FA6CLL);
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

uint64_t sub_230E4FA94(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_230E4FAA0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PodcastLastInvocation.CodingKeys()
{
  return &type metadata for PodcastLastInvocation.CodingKeys;
}

unint64_t sub_230E4FAC0()
{
  unint64_t result = qword_268714E10[0];
  if (!qword_268714E10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268714E10);
  }
  return result;
}

unint64_t sub_230E4FB10()
{
  unint64_t result = qword_268714F20;
  if (!qword_268714F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268714F20);
  }
  return result;
}

unint64_t sub_230E4FB60()
{
  unint64_t result = qword_268714F28[0];
  if (!qword_268714F28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268714F28);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_4()
{
  JUMPOUT(0x230FCE0F0);
}

unint64_t OUTLINED_FUNCTION_5()
{
  return 0xD00000000000001CLL;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t sub_230E4FC70()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_230E4FC80()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_230E4FC90()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_230E4FCA0()
{
  return MEMORY[0x270F1A778]();
}

uint64_t sub_230E4FCB0()
{
  return MEMORY[0x270F1A788]();
}

uint64_t sub_230E4FCC0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_230E4FCD0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_230E4FCE0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_230E4FCF0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_230E4FD00()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_230E4FD10()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_230E4FD20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_230E4FD30()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_230E4FD40()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_230E4FD50()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_230E4FD60()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_230E4FD70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_230E4FD80()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_230E4FD90()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_230E4FDA0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_230E4FDB0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_230E4FDC0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_230E4FDD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_230E4FDE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_230E4FDF0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_230E4FE00()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_230E4FE10()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_230E4FE20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_230E4FE30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_230E4FE40()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_230E4FE50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_230E4FE60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_230E4FE70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_230E4FE80()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_230E4FE90()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_230E4FEA0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_230E4FEB0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_230E4FEC0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_230E4FED0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_230E4FEF0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_230E4FF00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_230E4FF10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_230E4FF20()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_230E4FF30()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_230E4FF40()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
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

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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