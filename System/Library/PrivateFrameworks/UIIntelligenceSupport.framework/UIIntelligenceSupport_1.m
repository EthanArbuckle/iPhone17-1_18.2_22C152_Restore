unint64_t sub_2604E4A58()
{
  unint64_t result;

  result = qword_26A8731C8;
  if (!qword_26A8731C8)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8731C8);
  }
  return result;
}

uint64_t sub_2604E4AAC()
{
  return MEMORY[0x263F8D6D8];
}

uint64_t method lookup function for IntelligenceCollectionCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntelligenceCollectionCoordinator);
}

uint64_t destroy for IntelligenceCollectionCoordinator.AsyncTask()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntelligenceCollectionCoordinator.AsyncTask(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IntelligenceCollectionCoordinator.AsyncTask(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for IntelligenceCollectionCoordinator.AsyncTask(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCollectionCoordinator.AsyncTask(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCollectionCoordinator.AsyncTask(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCollectionCoordinator.AsyncTask()
{
  return &type metadata for IntelligenceCollectionCoordinator.AsyncTask;
}

uint64_t destroy for IntelligenceCollectionCoordinator.State()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s21UIIntelligenceSupport33IntelligenceCollectionCoordinatorC5StateVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for IntelligenceCollectionCoordinator.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for IntelligenceCollectionCoordinator.State(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCollectionCoordinator.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCollectionCoordinator.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_2604E4E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8731C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604E4E90(uint64_t a1)
{
  return a1;
}

uint64_t sub_2604E4EBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2604E4EE8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2604E4F28()
{
  sub_2604E2444(*(void *)(v0 + 16));
}

uint64_t sub_2604E4F34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2604E4F7C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2604E4FCC(uint64_t *a1)
{
  return sub_2604E3748(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2604E4FE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2604E5014(uint64_t a1)
{
  return a1;
}

uint64_t sub_2604E5040(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t *sub_2604E5050(uint64_t *a1)
{
  return a1;
}

uint64_t sub_2604E5084(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_2604E50F0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2604E5140()
{
  sub_2604DFE70(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_2604E514C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceFragment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604E51B0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 125, 7);
}

void *initializeBufferWithCopyOfBuffer for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext()
{
  return swift_unknownObjectRelease();
}

void *assignWithCopy for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext()
{
  return &type metadata for IntelligenceCollectionCoordinator.CollectionState.PendingAsyncTaskContext;
}

uint64_t destroy for IntelligenceCollectionCoordinator.CollectionState()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_unknownObjectRelease();
}

void *initializeWithCopy for IntelligenceCollectionCoordinator.CollectionState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for IntelligenceCollectionCoordinator.CollectionState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for IntelligenceCollectionCoordinator.CollectionState(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCollectionCoordinator.CollectionState(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCollectionCoordinator.CollectionState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCollectionCoordinator.CollectionState()
{
  return &type metadata for IntelligenceCollectionCoordinator.CollectionState;
}

void sub_2604E55E0(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

void Logger.error(public:error:)(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = (void *)a3();
  v5 = (void *)sub_260532030();

  id v6 = objc_msgSend(v5, sel_localizedDescription);
  uint64_t v7 = sub_260532760();
  unint64_t v9 = v8;

  uint64_t v10 = a1();
  if (v11)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    id v30 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_260532480();
    os_log_type_t v15 = sub_260532A00();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v31 = v29;
      *(_DWORD *)uint64_t v16 = 136446979;
      swift_bridgeObjectRetain();
      sub_2604E5DDC(v12, v13, &v31);
      sub_260532B60();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2082;
      id v17 = objc_msgSend(v30, sel_domain);
      uint64_t v18 = v7;
      uint64_t v19 = sub_260532760();
      unint64_t v21 = v20;

      sub_2604E5DDC(v19, v21, &v31);
      sub_260532B60();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2048;
      objc_msgSend(v30, sel_code);

      sub_260532B60();
      *(_WORD *)(v16 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_2604E5DDC(v18, v9, &v31);
      sub_260532B60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_260451000, v14, v15, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v16, 0x2Au);
      swift_arrayDestroy();
      uint64_t v22 = v29;
LABEL_6:
      MEMORY[0x261213230](v22, -1, -1);
      MEMORY[0x261213230](v16, -1, -1);

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v30 = v5;
    swift_bridgeObjectRetain();
    v14 = sub_260532480();
    os_log_type_t v23 = sub_260532A00();
    if (os_log_type_enabled(v14, v23))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = v24;
      *(_DWORD *)uint64_t v16 = 136446723;
      id v25 = objc_msgSend(v30, sel_domain);
      uint64_t v26 = sub_260532760();
      unint64_t v28 = v27;

      sub_2604E5DDC(v26, v28, &v31);
      sub_260532B60();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2048;
      objc_msgSend(v30, sel_code);

      sub_260532B60();
      *(_WORD *)(v16 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_2604E5DDC(v7, v9, &v31);
      sub_260532B60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_260451000, v14, v23, "%{public}s (%ld) %{private}s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      uint64_t v22 = v24;
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t sub_2604E5B20(uint64_t a1)
{
  return sub_260452DCC(a1, qword_26B3E87B0);
}

uint64_t static Logger.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2604E5C58(qword_26B3E8458, (uint64_t)qword_26B3E87B0, a1);
}

uint64_t sub_2604E5B60(uint64_t a1)
{
  return sub_260452DCC(a1, qword_26A8719E0);
}

uint64_t static Logger.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2604E5C58(&qword_26A871A00, (uint64_t)qword_26A8719E0, a1);
}

uint64_t static Logger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2604E5C58(&qword_26B3E9308, (uint64_t)qword_26B3E9310, a1);
}

uint64_t sub_2604E5BC4(uint64_t a1)
{
  return sub_260452DCC(a1, qword_26B3E87C8);
}

uint64_t static Logger.collector.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2604E5C58(&qword_26B3E87E0, (uint64_t)qword_26B3E87C8, a1);
}

uint64_t sub_2604E5C0C(uint64_t a1)
{
  return sub_260452DCC(a1, qword_26A8732D0);
}

uint64_t static Logger.snapshotter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2604E5C58(qword_26A872148, (uint64_t)qword_26A8732D0, a1);
}

uint64_t sub_2604E5C58@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2605324A0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_2604E5CF0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2604E5D00(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2604E5D3C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2604E5D64(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2604E5DDC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_260532B60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2604E5DDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2604E5EB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2604E64B0((uint64_t)v12, *a3);
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
      sub_2604E64B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2604E5EB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_260532B70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2604E606C(a5, a6);
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
  uint64_t v8 = sub_260532D20();
  if (!v8)
  {
    sub_260532D40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_260532DA0();
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

uint64_t sub_2604E606C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2604E6104(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2604E627C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2604E627C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2604E6104(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2604BA0A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_260532CC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_260532D40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_260532850();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_260532DA0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_260532D40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2604E627C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872B90);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_260532DA0();
  __break(1u);
  return result;
}

unsigned char **sub_2604E63CC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_2604E63DC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_260532DA0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_2604E6480@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2604E64B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t IntelligenceElement.Document.file.getter()
{
  uint64_t v1 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (uint64_t *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v7, (uint64_t)v6, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v6, (uint64_t)v3, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = *v3;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
  }
  sub_2604E76A8((uint64_t)v3 + *(int *)(v8 + 48), type metadata accessor for IntelligenceFile.Attributes);
  return v9;
}

uint64_t _s8DocumentV15InternalBackingOMa(uint64_t a1)
{
  return sub_260460F68(a1, (uint64_t *)&unk_26A873370);
}

uint64_t _s8DocumentV7StorageVMa(uint64_t a1)
{
  return sub_260460F68(a1, (uint64_t *)&unk_26A873360);
}

uint64_t IntelligenceElement.Document.name.getter()
{
  uint64_t v1 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (uint64_t *)((char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v7, (uint64_t)v6, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v6, (uint64_t)v3, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = *v3;
    int v9 = *(_DWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  }
  else
  {
    uint64_t v10 = *v3;
    int v9 = *(_DWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v8 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  sub_2604E76A8((uint64_t)v3 + v9, type metadata accessor for IntelligenceFile.Attributes);
  return v8;
}

uint64_t IntelligenceElement.Document.attributes.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v9, (uint64_t)v8, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v8, (uint64_t)v5, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    return sub_2604E6A78((uint64_t)v5 + *(int *)(v10 + 48), a1, type metadata accessor for IntelligenceFile.Attributes);
  }
  else
  {
    uint64_t v12 = *v5;
    uint64_t v13 = (uint64_t)v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    sub_2604E6AE0(v12 + OBJC_IVAR____TtC21UIIntelligenceSupport16IntelligenceFile_attributes, a1, type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
    return sub_2604E76A8(v13, type metadata accessor for IntelligenceFile.Attributes);
  }
}

uint64_t sub_2604E6A78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2604E6AE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t IntelligenceElement.Document.sourceAttributes.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v9, (uint64_t)v8, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v8, (uint64_t)v5, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = &qword_26A872458;
  }
  else
  {
    swift_release();
    uint64_t v10 = &qword_26A8732E8;
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(v10);
  return sub_2604E6A78((uint64_t)&v5[*(int *)(v11 + 48)], a1, type metadata accessor for IntelligenceFile.Attributes);
}

uint64_t IntelligenceElement.Document.PaginationInfo.totalPages.getter()
{
  return *(void *)v0;
}

uint64_t IntelligenceElement.Document.PaginationInfo.totalPages.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*IntelligenceElement.Document.PaginationInfo.totalPages.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Document.PaginationInfo.visiblePages.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t IntelligenceElement.Document.PaginationInfo.visiblePages.setter(uint64_t result, uint64_t a2, char a3)
{
  *(void *)(v3 + 8) = result;
  *(void *)(v3 + 16) = a2;
  *(unsigned char *)(v3 + 24) = a3 & 1;
  return result;
}

uint64_t (*IntelligenceElement.Document.PaginationInfo.visiblePages.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Document.PaginationInfo.init(totalPages:visiblePages:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 24) = a4 & 1;
  return result;
}

BOOL static IntelligenceElement.Document.PaginationInfo.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return (*(unsigned char *)(a2 + 24) & 1) == 0
  }
        && *(void *)(a1 + 8) == *(void *)(a2 + 8)
        && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  return (*(unsigned char *)(a2 + 24) & 1) != 0;
}

uint64_t sub_2604E6DAC()
{
  if (*v0) {
    return 0x50656C6269736976;
  }
  else {
    return 0x6761506C61746F74;
  }
}

uint64_t sub_2604E6DF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604F1434(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2604E6E1C(uint64_t a1)
{
  unint64_t v2 = sub_2604E7060();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604E6E58(uint64_t a1)
{
  unint64_t v2 = sub_2604E7060();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Document.PaginationInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732F0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  uint64_t v11 = *(void *)(v1 + 16);
  uint64_t v12 = v8;
  int v16 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604E7060();
  sub_260533120();
  LOBYTE(v13) = 0;
  sub_260532F30();
  if (!v2)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    char v15 = v16;
    char v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873300);
    sub_2604E72A8(&qword_26A873308);
    sub_260532EF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2604E7060()
{
  unint64_t result = qword_26A8732F8;
  if (!qword_26A8732F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8732F8);
  }
  return result;
}

uint64_t IntelligenceElement.Document.PaginationInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873310);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604E7060();
  sub_260533100();
  if (!v2)
  {
    LOBYTE(v13) = 0;
    uint64_t v9 = sub_260532E60();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873300);
    char v15 = 1;
    sub_2604E72A8(&qword_26A873318);
    sub_260532E30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v10 = v14;
    long long v11 = v13;
    *(void *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v11;
    *(unsigned char *)(a2 + 24) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2604E72A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A873300);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_2604E730C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return (*(unsigned char *)(a2 + 24) & 1) == 0
  }
        && *(void *)(a1 + 8) == *(void *)(a2 + 8)
        && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  return (*(unsigned char *)(a2 + 24) & 1) != 0;
}

uint64_t sub_2604E7358@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceElement.Document.PaginationInfo.init(from:)(a1, a2);
}

uint64_t sub_2604E7370(void *a1)
{
  return IntelligenceElement.Document.PaginationInfo.encode(to:)(a1);
}

__n128 IntelligenceElement.Document.paginationInfo.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = (__n128 *)(v3 + *(int *)(_s8DocumentV7StorageVMa(0) + 20));
  unint64_t v5 = v4[1].n128_u64[0];
  unsigned __int8 v6 = v4[1].n128_u8[8];
  unsigned __int8 v7 = v4[1].n128_u8[9];
  __n128 result = *v4;
  *a1 = *v4;
  a1[1].n128_u64[0] = v5;
  a1[1].n128_u8[8] = v6;
  a1[1].n128_u8[9] = v7;
  return result;
}

__n128 sub_2604E7410@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = (__n128 *)(v3 + *(int *)(_s8DocumentV7StorageVMa(0) + 20));
  unint64_t v5 = v4[1].n128_u64[0];
  unsigned __int8 v6 = v4[1].n128_u8[8];
  unsigned __int8 v7 = v4[1].n128_u8[9];
  __n128 result = *v4;
  *a2 = *v4;
  a2[1].n128_u64[0] = v5;
  a2[1].n128_u8[8] = v6;
  a2[1].n128_u8[9] = v7;
  return result;
}

uint64_t IntelligenceElement.Document.paginationInfo.setter(long long *a1)
{
  uint64_t v3 = _s8DocumentV7StorageVMa(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  unsigned __int8 v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - v8;
  long long v18 = *a1;
  uint64_t v10 = *((void *)a1 + 2);
  char v11 = *((unsigned char *)a1 + 24);
  char v12 = *((unsigned char *)a1 + 25);
  uint64_t v13 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v13, (uint64_t)v9, _s8DocumentV7StorageVMa);
  char v14 = &v9[*(int *)(v4 + 28)];
  *(_OWORD *)char v14 = v18;
  *((void *)v14 + 2) = v10;
  v14[24] = v11;
  v14[25] = v12;
  sub_2604E6AE0((uint64_t)v9, (uint64_t)v6, _s8DocumentV7StorageVMa);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v15 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_2604E7708((uint64_t)v6, v15);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
    uint64_t v16 = swift_allocObject();
    sub_2604E6A78((uint64_t)v6, v16 + *(void *)(*(void *)v16 + 88), _s8DocumentV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v16;
  }
  return sub_2604E76A8((uint64_t)v9, _s8DocumentV7StorageVMa);
}

uint64_t sub_2604E76A8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2604E7708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s8DocumentV7StorageVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void (*IntelligenceElement.Document.paginationInfo.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v5 = v4 + *(int *)(_s8DocumentV7StorageVMa(0) + 20);
  uint64_t v6 = *(void *)(v5 + 16);
  char v7 = *(unsigned char *)(v5 + 24);
  char v8 = *(unsigned char *)(v5 + 25);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)v5;
  v3[2] = v6;
  *((unsigned char *)v3 + 24) = v7;
  *((unsigned char *)v3 + 25) = v8;
  return sub_2604E7824;
}

void sub_2604E7824(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (*a1)[1];
  uint64_t v3 = (*a1)[2];
  char v4 = *((unsigned char *)*a1 + 24);
  char v5 = *((unsigned char *)*a1 + 25);
  *(void *)&long long v6 = **a1;
  *((void *)&v6 + 1) = v2;
  uint64_t v7 = v3;
  char v8 = v4;
  char v9 = v5;
  IntelligenceElement.Document.paginationInfo.setter(&v6);

  free(v1);
}

uint64_t IntelligenceElement.Document.isWindowContentGeneratedPDF.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + *(int *)(_s8DocumentV7StorageVMa(0) + 24));
}

uint64_t sub_2604E78F0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t result = _s8DocumentV7StorageVMa(0);
  *a2 = *(unsigned char *)(v3 + *(int *)(result + 24));
  return result;
}

uint64_t IntelligenceElement.Document.isWindowContentGeneratedPDF.setter(char a1)
{
  uint64_t v3 = _s8DocumentV7StorageVMa(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  long long v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  char v9 = &v14[-v8];
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v10, (uint64_t)v9, _s8DocumentV7StorageVMa);
  v9[*(int *)(v4 + 32)] = a1;
  sub_2604E6AE0((uint64_t)v9, (uint64_t)v6, _s8DocumentV7StorageVMa);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_2604E7708((uint64_t)v6, v11);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
    uint64_t v12 = swift_allocObject();
    sub_2604E6A78((uint64_t)v6, v12 + *(void *)(*(void *)v12 + 88), _s8DocumentV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v12;
  }
  return sub_2604E76A8((uint64_t)v9, _s8DocumentV7StorageVMa);
}

void (*IntelligenceElement.Document.isWindowContentGeneratedPDF.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v4 + *(int *)(_s8DocumentV7StorageVMa(0) + 24));
  return sub_2604E7BD8;
}

void sub_2604E7BD8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  IntelligenceElement.Document.isWindowContentGeneratedPDF.setter(*(unsigned char *)(*(void *)a1 + 32));

  free(v1);
}

uint64_t IntelligenceElement.Document.init(file:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v36 = a1;
  v38 = a2;
  uint64_t v37 = _s8DocumentV7StorageVMa(0) - 8;
  MEMORY[0x270FA5388](v37);
  v35 = (uint64_t *)((char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v5;
  uint64_t v6 = type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v7 = (int *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v34 = (uint64_t)&v31 - v11;
  uint64_t v12 = sub_2605323B0();
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v32(v5, 1, 1, v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
  uint64_t v14 = *(void *)(*(void *)(v13 - 8) + 64);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_260532270();
  char v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v17(v15, 1, 1, v16);
  __n128 v19 = MEMORY[0x270FA5388](v18);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, __n128))v17)(v15, 1, 1, v16, v19);
  v32(v9, 1, 1, v12);
  unint64_t v20 = &v9[v7[7]];
  *(void *)unint64_t v20 = 0;
  v20[8] = 1;
  uint64_t v21 = (uint64_t)&v9[v7[8]];
  v17((char *)v21, 1, 1, v16);
  uint64_t v22 = (uint64_t)&v9[v7[9]];
  v17((char *)v22, 1, 1, v16);
  sub_26046405C((uint64_t)v33, (uint64_t)v9, &qword_26B3E9088);
  *(void *)unint64_t v20 = 0;
  v20[8] = 1;
  sub_26046405C((uint64_t)v15, v21, &qword_26A8721A0);
  sub_26046405C((uint64_t)v15, v22, &qword_26A8721A0);
  uint64_t v23 = v34;
  sub_2604E6A78((uint64_t)v9, v34, type metadata accessor for IntelligenceFile.Attributes);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
  uint64_t v25 = (uint64_t)v35;
  uint64_t v26 = (uint64_t)v35 + *(int *)(v24 + 48);
  void *v35 = v36;
  sub_2604E6A78(v23, v26, type metadata accessor for IntelligenceFile.Attributes);
  _s8DocumentV15InternalBackingOMa(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v27 = v37;
  uint64_t v28 = v25 + *(int *)(v37 + 28);
  *(void *)uint64_t v28 = 0;
  *(void *)(v28 + 8) = 0;
  *(void *)(v28 + 16) = 0;
  *(_WORD *)(v28 + 24) = 256;
  *(unsigned char *)(v25 + *(int *)(v27 + 32)) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
  uint64_t v29 = swift_allocObject();
  uint64_t result = sub_2604E6A78(v25, v29 + *(void *)(*(void *)v29 + 88), _s8DocumentV7StorageVMa);
  uint64_t *v38 = v29;
  return result;
}

uint64_t IntelligenceElement.Document.init(file:sourceAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = _s8DocumentV7StorageVMa(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  char v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (uint64_t)v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
  *char v9 = a1;
  sub_2604E6A78(a2, v10, type metadata accessor for IntelligenceFile.Attributes);
  _s8DocumentV15InternalBackingOMa(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (char *)v9 + *(int *)(v7 + 28);
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  *((_WORD *)v11 + 12) = 256;
  *((unsigned char *)v9 + *(int *)(v7 + 32)) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
  uint64_t v12 = swift_allocObject();
  uint64_t result = sub_2604E6A78((uint64_t)v9, v12 + *(void *)(*(void *)v12 + 88), _s8DocumentV7StorageVMa);
  *a3 = v12;
  return result;
}

uint64_t IntelligenceElement.Document.init(fromMetadataOfFileAt:name:attributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2605321D0();
  uint64_t v14 = *(void *)(v13 - 8);
  __n128 v15 = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v14 + 16))(v17, a1, v13, v15);
  sub_2604E6AE0(a4, (uint64_t)v12, type metadata accessor for IntelligenceFile.Attributes);
  IntelligenceElement.Document.init(fromMetadataOfFileAt:name:sourceAttributes:)((uint64_t)v17, a2, a3, (uint64_t)v12, &v20);
  sub_2604E76A8(a4, type metadata accessor for IntelligenceFile.Attributes);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  *a5 = v20;
  return result;
}

uint64_t IntelligenceElement.Document.init(fromMetadataOfFileAt:name:sourceAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v9 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2605320A0())
  {
    uint64_t v31 = a4;
    uint64_t v32 = v9;
    uint64_t v15 = sub_2605321D0();
    uint64_t v16 = *(void *)(v15 - 8);
    __n128 v17 = MEMORY[0x270FA5388](v15);
    uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v16 + 16))(v19, a1, v15, v17);
    v33 = a5;
    if (a3)
    {
      uint64_t v20 = a3;
      uint64_t v21 = v30;
    }
    else
    {
      uint64_t v21 = sub_2605320F0();
      uint64_t v20 = v22;
    }
    uint64_t v23 = *(void (**)(char *, uint64_t))(v16 + 8);
    v23(v19, v15);
    uint64_t v24 = v31;
    IntelligenceFile.Attributes.resolved(using:)(a1, (uint64_t)v14);
    sub_2604E76A8(v24, type metadata accessor for IntelligenceFile.Attributes);
    uint64_t v25 = (uint64_t)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
    *uint64_t v11 = v21;
    v11[1] = v20;
    sub_2604E6A78((uint64_t)v14, v25, type metadata accessor for IntelligenceFile.Attributes);
    _s8DocumentV15InternalBackingOMa(0);
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = v32;
    uint64_t v27 = (char *)v11 + *(int *)(v32 + 20);
    *(void *)uint64_t v27 = 0;
    *((void *)v27 + 1) = 0;
    *((void *)v27 + 2) = 0;
    *((_WORD *)v27 + 12) = 256;
    *((unsigned char *)v11 + *(int *)(v26 + 24)) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
    uint64_t v28 = swift_allocObject();
    sub_2604E6A78((uint64_t)v11, v28 + *(void *)(*(void *)v28 + 88), _s8DocumentV7StorageVMa);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v23)(a1, v15);
    uint64_t *v33 = v28;
  }
  else
  {
    unint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    unint64_t v34 = 0xD000000000000017;
    unint64_t v35 = 0x8000000260540F20;
    sub_2605320D0();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260532D50();
    __break(1u);
  }
  return result;
}

uint64_t IntelligenceElement.Document.init(name:attributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = _s8DocumentV7StorageVMa(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (uint64_t)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  *uint64_t v11 = a1;
  v11[1] = a2;
  sub_2604E6A78(a3, v12, type metadata accessor for IntelligenceFile.Attributes);
  _s8DocumentV15InternalBackingOMa(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (char *)v11 + *(int *)(v9 + 28);
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  *((_WORD *)v13 + 12) = 256;
  *((unsigned char *)v11 + *(int *)(v9 + 32)) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
  uint64_t v14 = swift_allocObject();
  uint64_t result = sub_2604E6A78((uint64_t)v11, v14 + *(void *)(*(void *)v14 + 88), _s8DocumentV7StorageVMa);
  *a4 = v14;
  return result;
}

uint64_t IntelligenceElement.Document.init(name:sourceAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = _s8DocumentV7StorageVMa(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (uint64_t)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  *uint64_t v11 = a1;
  v11[1] = a2;
  sub_2604E6A78(a3, v12, type metadata accessor for IntelligenceFile.Attributes);
  _s8DocumentV15InternalBackingOMa(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (char *)v11 + *(int *)(v9 + 28);
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  *((_WORD *)v13 + 12) = 256;
  *((unsigned char *)v11 + *(int *)(v9 + 32)) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
  uint64_t v14 = swift_allocObject();
  uint64_t result = sub_2604E6A78((uint64_t)v11, v14 + *(void *)(*(void *)v14 + 88), _s8DocumentV7StorageVMa);
  *a4 = v14;
  return result;
}

uint64_t sub_2604E8910(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733B0);
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733B8);
  uint64_t v30 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v29);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v31 = (uint64_t)&v28 - v9;
  uint64_t v10 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733C0);
  uint64_t v37 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F176C();
  sub_260533120();
  sub_2604E6AE0(v38, (uint64_t)v12, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E6A78((uint64_t)v12 + *(int *)(v16 + 48), (uint64_t)v7, type metadata accessor for IntelligenceFile.Attributes);
    char v45 = 1;
    sub_2604F17C0();
    sub_260532EC0();
    char v44 = 0;
    uint64_t v17 = v34;
    uint64_t v18 = v36;
    sub_260532F00();
    swift_bridgeObjectRelease();
    if (!v18)
    {
      char v43 = 1;
      sub_2604ECD48(&qword_26A872500, (void (*)(uint64_t))type metadata accessor for IntelligenceFile.Attributes);
      sub_260532F40();
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v17);
    uint64_t v19 = (uint64_t)v7;
  }
  else
  {
    uint64_t v20 = v30;
    uint64_t v21 = *v12;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
    uint64_t v23 = v31;
    sub_2604E6A78((uint64_t)v12 + *(int *)(v22 + 48), v31, type metadata accessor for IntelligenceFile.Attributes);
    char v42 = 0;
    sub_2604F1814();
    uint64_t v24 = v32;
    sub_260532EC0();
    uint64_t v39 = v21;
    char v41 = 0;
    type metadata accessor for IntelligenceFile(0);
    sub_2604ECD48(&qword_26A872948, (void (*)(uint64_t))type metadata accessor for IntelligenceFile);
    uint64_t v26 = v35;
    uint64_t v25 = v36;
    sub_260532F40();
    if (v25)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v26);
      sub_2604E76A8(v23, type metadata accessor for IntelligenceFile.Attributes);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v13);
      return swift_release();
    }
    char v40 = 1;
    sub_2604ECD48(&qword_26A872500, (void (*)(uint64_t))type metadata accessor for IntelligenceFile.Attributes);
    sub_260532F40();
    swift_release();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v26);
    uint64_t v19 = v23;
  }
  sub_2604E76A8(v19, type metadata accessor for IntelligenceFile.Attributes);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v15, v13);
}

uint64_t sub_2604E8F1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733E0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  uint64_t v51 = v4;
  MEMORY[0x270FA5388](v3);
  v55 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733E8);
  uint64_t v49 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  v53 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8733F0);
  uint64_t v52 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v44 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v44 - v17;
  uint64_t v19 = a1[3];
  v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_2604F176C();
  uint64_t v20 = v57;
  sub_260533100();
  if (!v20)
  {
    char v45 = v12;
    v46 = v15;
    uint64_t v21 = v54;
    uint64_t v22 = v55;
    uint64_t v23 = v53;
    uint64_t v47 = 0;
    char v44 = v18;
    uint64_t v57 = v10;
    uint64_t v24 = sub_260532EB0();
    uint64_t v25 = v24;
    uint64_t v26 = v7;
    if (*(void *)(v24 + 16) == 1)
    {
      if (*(unsigned char *)(v24 + 32))
      {
        char v63 = 1;
        sub_2604F17C0();
        uint64_t v27 = v22;
        uint64_t v28 = v47;
        sub_260532DD0();
        if (!v28)
        {
          char v62 = 0;
          uint64_t v29 = v50;
          uint64_t v36 = sub_260532E40();
          uint64_t v38 = v37;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
          uint64_t v54 = v25;
          uint64_t v39 = v45;
          *char v45 = v36;
          v39[1] = v38;
          type metadata accessor for IntelligenceFile.Attributes(0);
          char v61 = 1;
          sub_2604ECD48(&qword_26A872530, (void (*)(uint64_t))type metadata accessor for IntelligenceFile.Attributes);
          sub_260532E70();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v27, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v26);
          swift_storeEnumTagMultiPayload();
          uint64_t v42 = (uint64_t)v39;
LABEL_11:
          uint64_t v43 = (uint64_t)v44;
          sub_2604E6A78(v42, (uint64_t)v44, _s8DocumentV15InternalBackingOMa);
          sub_2604E6A78(v43, v48, _s8DocumentV15InternalBackingOMa);
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        }
      }
      else
      {
        char v60 = 0;
        sub_2604F1814();
        uint64_t v33 = v47;
        sub_260532DD0();
        if (!v33)
        {
          type metadata accessor for IntelligenceFile(0);
          char v59 = 0;
          sub_2604ECD48(&qword_26A872960, (void (*)(uint64_t))type metadata accessor for IntelligenceFile);
          uint64_t v35 = v46;
          sub_260532E70();
          v55 = v9;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
          type metadata accessor for IntelligenceFile.Attributes(0);
          char v58 = 1;
          sub_2604ECD48(&qword_26A872530, (void (*)(uint64_t))type metadata accessor for IntelligenceFile.Attributes);
          sub_260532E70();
          uint64_t v40 = (uint64_t)v35;
          uint64_t v41 = v52;
          (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v21);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v55, v7);
          swift_storeEnumTagMultiPayload();
          uint64_t v42 = v40;
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v26);
    }
    else
    {
      uint64_t v30 = sub_260532CF0();
      swift_allocError();
      uint64_t v32 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
      *uint64_t v32 = v57;
      sub_260532DE0();
      sub_260532CE0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v7);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
}

uint64_t sub_2604E9700()
{
  if (*v0) {
    return 0x617461646174656DLL;
  }
  else {
    return 1701603686;
  }
}

uint64_t sub_2604E973C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604F154C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2604E9764(uint64_t a1)
{
  unint64_t v2 = sub_2604F176C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604E97A0(uint64_t a1)
{
  unint64_t v2 = sub_2604F176C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604E97DC()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 12383;
  }
}

uint64_t sub_2604E9810@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604F1648(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2604E9838(uint64_t a1)
{
  unint64_t v2 = sub_2604F1814();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604E9874(uint64_t a1)
{
  unint64_t v2 = sub_2604F1814();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604E98B0(uint64_t a1)
{
  unint64_t v2 = sub_2604F17C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604E98EC(uint64_t a1)
{
  unint64_t v2 = sub_2604F17C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604E9928@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2604E8F1C(a1, a2);
}

uint64_t sub_2604E9940(void *a1)
{
  return sub_2604E8910(a1);
}

uint64_t sub_2604E995C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_260526C04(*a1, *a2);
}

uint64_t sub_2604E9968()
{
  return sub_2605330E0();
}

uint64_t sub_2604E9A1C()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2604E9ABC()
{
  return sub_2605330E0();
}

uint64_t sub_2604E9B6C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2604F1720();
  *a1 = result;
  return result;
}

void sub_2604E9B9C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xEE006F666E496E6FLL;
  unint64_t v5 = 0x6974616E69676170;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD00000000000001BLL;
    unint64_t v4 = 0x8000000260540BD0;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x676E696B636162;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2604E9C0C()
{
  unint64_t v1 = 0x6974616E69676170;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001BLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x676E696B636162;
  }
}

uint64_t sub_2604E9C78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2604F1720();
  *a1 = result;
  return result;
}

uint64_t sub_2604E9CA0(uint64_t a1)
{
  unint64_t v2 = sub_2604ECCA0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604E9CDC(uint64_t a1)
{
  unint64_t v2 = sub_2604ECCA0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Document.encode(to:)(void *a1)
{
  v18[0] = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v18[0]);
  unint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873328);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604ECCA0();
  sub_260533120();
  uint64_t v10 = v9 + *(void *)(*(void *)v9 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v10, (uint64_t)v4, _s8DocumentV7StorageVMa);
  LOBYTE(v19) = 0;
  _s8DocumentV15InternalBackingOMa(0);
  sub_2604ECD48(&qword_26A873338, (void (*)(uint64_t))_s8DocumentV15InternalBackingOMa);
  uint64_t v11 = v18[1];
  sub_260532F40();
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return sub_2604E76A8((uint64_t)v4, _s8DocumentV15InternalBackingOMa);
  }
  else
  {
    sub_2604E76A8((uint64_t)v4, _s8DocumentV15InternalBackingOMa);
    uint64_t v13 = v18[0];
    uint64_t v14 = v10 + *(int *)(v18[0] + 20);
    uint64_t v15 = *(void *)(v14 + 16);
    char v16 = *(unsigned char *)(v14 + 24);
    char v17 = *(unsigned char *)(v14 + 25);
    long long v19 = *(_OWORD *)v14;
    uint64_t v20 = v15;
    char v21 = v16;
    char v22 = v17;
    char v23 = 1;
    sub_2604ECCF4();
    sub_260532EF0();
    if (*(unsigned char *)(v10 + *(int *)(v13 + 24)) == 1)
    {
      LOBYTE(v19) = 2;
      sub_260532F10();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t IntelligenceElement.Document.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = _s8DocumentV15InternalBackingOMa(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873348);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604ECCA0();
  uint64_t v12 = v31;
  sub_260533100();
  if (!v12)
  {
    uint64_t v13 = v29;
    uint64_t v31 = v3;
    uint64_t v14 = (uint64_t)v5;
    LOBYTE(v32) = 0;
    sub_2604ECD48(&qword_26A873350, (void (*)(uint64_t))_s8DocumentV15InternalBackingOMa);
    sub_260532E70();
    char v38 = 1;
    sub_2604ECD90();
    sub_260532E30();
    uint64_t v16 = v32;
    uint64_t v27 = v33;
    uint64_t v17 = v34;
    int v37 = v35;
    int v26 = v36;
    LOBYTE(v32) = 2;
    char v18 = sub_260532E00();
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v11, v30);
    uint64_t v19 = (uint64_t)v8;
    uint64_t v20 = v14;
    sub_2604E6A78(v19, v14, _s8DocumentV15InternalBackingOMa);
    uint64_t v21 = v31;
    uint64_t v22 = v20 + *(int *)(v31 + 20);
    uint64_t v23 = v27;
    *(void *)uint64_t v22 = v16;
    *(void *)(v22 + 8) = v23;
    *(void *)(v22 + 16) = v17;
    *(unsigned char *)(v22 + 24) = v37;
    *(unsigned char *)(v22 + 25) = v26;
    *(unsigned char *)(v20 + *(int *)(v21 + 24)) = v18 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
    uint64_t v24 = swift_allocObject();
    sub_2604E6A78(v20, v24 + *(void *)(*(void *)v24 + 88), _s8DocumentV7StorageVMa);
    *uint64_t v28 = v24;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2604EA3F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceElement.Document.init(from:)(a1, a2);
}

uint64_t sub_2604EA410(void *a1)
{
  return IntelligenceElement.Document.encode(to:)(a1);
}

uint64_t IntelligenceElement.Document.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v115 = (uint64_t)&v110 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v110 - v4;
  uint64_t v6 = type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v114 = (uint64_t)&v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v110 - v9;
  uint64_t v117 = sub_2605323B0();
  uint64_t v121 = *(void *)(v117 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v117);
  v111 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v116 = (char *)&v110 - v13;
  uint64_t v120 = _s8DocumentV15InternalBackingOMa(0);
  uint64_t v14 = MEMORY[0x270FA5388](v120);
  v119 = (char *)&v110 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v113 = (uint64_t)&v110 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (uint64_t *)((char *)&v110 - v19);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v110 - v21;
  uint64_t v122 = _s8DocumentV7StorageVMa(0);
  uint64_t v23 = MEMORY[0x270FA5388](v122);
  uint64_t v118 = (uint64_t)&v110 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v112 = (uint64_t)&v110 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v110 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v110 - v30;
  uint64_t v32 = *v0;
  strcpy((char *)v128, "name: \"");
  v128[1] = 0xE700000000000000;
  uint64_t v33 = v32 + *(void *)(*(void *)v32 + 88);
  swift_beginAccess();
  uint64_t v123 = v33;
  sub_2604E6AE0(v33, (uint64_t)v31, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v31, (uint64_t)v22, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8((uint64_t)&v22[*(int *)(v34 + 48)], type metadata accessor for IntelligenceFile.Attributes);
  }
  else
  {
    uint64_t v35 = (uint64_t)&v22[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48)];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_2604E76A8(v35, type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
  }
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  uint64_t v36 = v128[0];
  uint64_t v37 = v128[1];
  char v38 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v40 = v38[2];
  unint64_t v39 = v38[3];
  unint64_t v41 = v40 + 1;
  if (v40 >= v39 >> 1) {
    char v38 = sub_260457640((void *)(v39 > 1), v40 + 1, 1, v38);
  }
  v38[2] = v41;
  uint64_t v42 = &v38[2 * v40];
  v42[4] = v36;
  v42[5] = v37;
  uint64_t v43 = v123;
  if (*(unsigned char *)(v123 + *(int *)(v122 + 24)) == 1)
  {
    unint64_t v44 = v38[3];
    if (v41 >= v44 >> 1) {
      char v38 = sub_260457640((void *)(v44 > 1), v40 + 2, 1, v38);
    }
    v38[2] = v40 + 2;
    char v45 = &v38[2 * v41];
    v45[4] = 0xD000000000000021;
    v45[5] = 0x8000000260542B70;
  }
  sub_2604E6AE0(v43, (uint64_t)v29, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v29, (uint64_t)v20, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E6A78((uint64_t)v20 + *(int *)(v46 + 48), (uint64_t)v10, type metadata accessor for IntelligenceFile.Attributes);
  }
  else
  {
    uint64_t v47 = *v20;
    uint64_t v48 = (uint64_t)v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    sub_2604E6AE0(v47 + OBJC_IVAR____TtC21UIIntelligenceSupport16IntelligenceFile_attributes, (uint64_t)v10, type metadata accessor for IntelligenceFile.Attributes);
    swift_retain();
    swift_release();
    sub_2604E76A8(v48, type metadata accessor for IntelligenceFile.Attributes);
  }
  swift_release();
  sub_2604ECDE4((uint64_t)v10, (uint64_t)v5);
  sub_2604E76A8((uint64_t)v10, type metadata accessor for IntelligenceFile.Attributes);
  uint64_t v49 = v121;
  uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v121 + 48);
  uint64_t v51 = v117;
  if (v50(v5, 1, v117) == 1)
  {
    sub_26045B7D4((uint64_t)v5, &qword_26B3E9088);
    goto LABEL_29;
  }
  uint64_t v52 = v49;
  uint64_t v53 = v43;
  uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
  v54(v116, v5, v51);
  uint64_t v55 = v53;
  uint64_t v56 = v112;
  sub_2604E6AE0(v55, v112, _s8DocumentV7StorageVMa);
  uint64_t v57 = v113;
  sub_2604E6A78(v56, v113, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    char v58 = &qword_26A872458;
  }
  else
  {
    swift_retain();
    swift_release();
    char v58 = &qword_26A8732E8;
  }
  uint64_t v59 = v57 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v58) + 48);
  uint64_t v60 = v114;
  sub_2604E6A78(v59, v114, type metadata accessor for IntelligenceFile.Attributes);
  swift_release();
  uint64_t v61 = v115;
  sub_2604ECDE4(v60, v115);
  sub_2604E76A8(v60, type metadata accessor for IntelligenceFile.Attributes);
  unsigned int v62 = v50((char *)v61, 1, v51);
  char v63 = v116;
  if (v62 == 1)
  {
    sub_26045B7D4(v61, &qword_26B3E9088);
  }
  else
  {
    v64 = v111;
    v54(v111, (char *)v61, v51);
    sub_2604ECD48(&qword_26A8723F8, MEMORY[0x263F8F3A0]);
    if ((sub_2605326B0() & 1) == 0)
    {
      v128[0] = 0;
      v128[1] = 0xE000000000000000;
      sub_260532CB0();
      swift_bridgeObjectRelease();
      v128[0] = 0xD000000000000014;
      v128[1] = 0x8000000260542B50;
      sub_2604ECD48(&qword_26A872490, MEMORY[0x263F8F3A0]);
      sub_260532F80();
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v65 = v128[0];
      uint64_t v66 = v128[1];
      unint64_t v68 = v38[2];
      unint64_t v67 = v38[3];
      uint64_t v43 = v123;
      if (v68 >= v67 >> 1) {
        char v38 = sub_260457640((void *)(v67 > 1), v68 + 1, 1, v38);
      }
      v38[2] = v68 + 1;
      v69 = &v38[2 * v68];
      v69[4] = v65;
      v69[5] = v66;
      (*(void (**)(char *, uint64_t))(v121 + 8))(v111, v51);
      goto LABEL_26;
    }
    (*(void (**)(char *, uint64_t))(v121 + 8))(v64, v51);
  }
  uint64_t v43 = v123;
LABEL_26:
  v128[0] = 0;
  v128[1] = 0xE000000000000000;
  sub_260532CB0();
  swift_bridgeObjectRelease();
  strcpy((char *)v128, "contentType: \"");
  HIBYTE(v128[1]) = -18;
  sub_2604ECD48(&qword_26A872490, MEMORY[0x263F8F3A0]);
  sub_260532F80();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  uint64_t v70 = v128[0];
  uint64_t v71 = v128[1];
  unint64_t v73 = v38[2];
  unint64_t v72 = v38[3];
  if (v73 >= v72 >> 1) {
    char v38 = sub_260457640((void *)(v72 > 1), v73 + 1, 1, v38);
  }
  v38[2] = v73 + 1;
  v74 = &v38[2 * v73];
  v74[4] = v70;
  v74[5] = v71;
  (*(void (**)(char *, uint64_t))(v121 + 8))(v63, v51);
LABEL_29:
  uint64_t v75 = v43 + *(int *)(v122 + 20);
  if (*(unsigned char *)(v75 + 25))
  {
LABEL_36:
    uint64_t v90 = (uint64_t)v119;
    goto LABEL_38;
  }
  uint64_t v77 = *(void *)(v75 + 8);
  uint64_t v76 = *(void *)(v75 + 16);
  char v78 = *(unsigned char *)(v75 + 24);
  v79 = *(void **)v75;
  strcpy((char *)v128, "totalPages: ");
  BYTE5(v128[1]) = 0;
  HIWORD(v128[1]) = -5120;
  v124 = v79;
  sub_260532F80();
  sub_260532840();
  swift_bridgeObjectRelease();
  uint64_t v80 = v128[0];
  uint64_t v81 = v128[1];
  unint64_t v83 = v38[2];
  unint64_t v82 = v38[3];
  if (v83 >= v82 >> 1) {
    char v38 = sub_260457640((void *)(v82 > 1), v83 + 1, 1, v38);
  }
  v38[2] = v83 + 1;
  v84 = &v38[2 * v83];
  v84[4] = v80;
  v84[5] = v81;
  if ((v78 & 1) == 0)
  {
    v128[0] = 0;
    v128[1] = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    strcpy((char *)v128, "visiblePages: ");
    HIBYTE(v128[1]) = -18;
    uint64_t v126 = v76;
    uint64_t v127 = v77;
    v124 = 0;
    unint64_t v125 = 0xE000000000000000;
    sub_260532D30();
    sub_260532840();
    sub_260532D30();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v85 = v128[0];
    uint64_t v86 = v128[1];
    unint64_t v88 = v38[2];
    unint64_t v87 = v38[3];
    if (v88 >= v87 >> 1) {
      char v38 = sub_260457640((void *)(v87 > 1), v88 + 1, 1, v38);
    }
    uint64_t v43 = v123;
    v38[2] = v88 + 1;
    v89 = &v38[2 * v88];
    v89[4] = v85;
    v89[5] = v86;
    goto LABEL_36;
  }
  uint64_t v90 = (uint64_t)v119;
  uint64_t v43 = v123;
LABEL_38:
  uint64_t v91 = v118;
  sub_2604E6AE0(v43, v118, _s8DocumentV7StorageVMa);
  sub_2604E6A78(v91, v90, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8(v90 + *(int *)(v92 + 48), type metadata accessor for IntelligenceFile.Attributes);
LABEL_44:
    swift_release();
    goto LABEL_48;
  }
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
  sub_2604E76A8(v90 + *(int *)(v93 + 48), type metadata accessor for IntelligenceFile.Attributes);
  uint64_t v94 = sub_2605321D0();
  uint64_t v95 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v97 = (char *)&v110 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
  MEMORY[0x270FA5388](v98 - 8);
  v100 = (char *)&v110 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
  IntelligenceFile.fileURL.getter((uint64_t)v100);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v100, 1, v94) == 1)
  {
    sub_26045B7D4((uint64_t)v100, &qword_26A871C58);
    unint64_t v102 = v38[2];
    unint64_t v101 = v38[3];
    if (v102 >= v101 >> 1) {
      char v38 = sub_260457640((void *)(v101 > 1), v102 + 1, 1, v38);
    }
    v38[2] = v102 + 1;
    v103 = &v38[2 * v102];
    v103[4] = 0xD000000000000011;
    v103[5] = 0x8000000260542B30;
    goto LABEL_44;
  }
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v97, v100, v94);
  strcpy((char *)v128, "fileURL: \"");
  BYTE3(v128[1]) = 0;
  HIDWORD(v128[1]) = -369098752;
  sub_260532190();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  uint64_t v104 = v128[0];
  uint64_t v105 = v128[1];
  unint64_t v107 = v38[2];
  unint64_t v106 = v38[3];
  if (v107 >= v106 >> 1) {
    char v38 = sub_260457640((void *)(v106 > 1), v107 + 1, 1, v38);
  }
  v38[2] = v107 + 1;
  v108 = &v38[2 * v107];
  v108[4] = v104;
  v108[5] = v105;
  swift_release();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v94);
LABEL_48:
  strcpy((char *)v128, "Document(");
  WORD1(v128[1]) = 0;
  HIDWORD(v128[1]) = -385875968;
  v124 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return v128[0];
}

uint64_t IntelligenceElement.Document.init(for:fromFileAt:name:attributes:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v50 = a5;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v53 = a6;
  uint64_t v49 = a2;
  uint64_t v7 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v48 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v46 = *((unsigned __int8 *)a1 + 24);
  char v9 = *((unsigned char *)a1 + 26);
  char v10 = *((unsigned char *)a1 + 27);
  char v11 = *((unsigned char *)a1 + 28);
  char v12 = *((unsigned char *)a1 + 29);
  char v13 = *((unsigned char *)a1 + 30);
  char v14 = *((unsigned char *)a1 + 31);
  uint64_t v15 = a1[4];
  char v16 = *((unsigned char *)a1 + 40);
  char v17 = *((unsigned char *)a1 + 41);
  uint64_t v18 = a1[6];
  char v19 = *((unsigned char *)a1 + 56);
  char v20 = *((unsigned char *)a1 + 57);
  uint64_t v21 = a1[8];
  char v22 = *((unsigned char *)a1 + 72);
  char v23 = *((unsigned char *)a1 + 73);
  __int16 v24 = *((_WORD *)a1 + 37);
  uint64_t v25 = a1[10];
  __int16 v26 = *((_WORD *)a1 + 44);
  char v27 = *((unsigned char *)a1 + 90);
  char v28 = *((unsigned char *)a1 + 91);
  char v29 = *((unsigned char *)a1 + 92);
  char v30 = *((unsigned char *)a1 + 93);
  uint64_t v31 = a1[12];
  char v32 = *((unsigned char *)a1 + 104);
  char v33 = *((unsigned char *)a1 + 105);
  char v34 = *((unsigned char *)a1 + 106);
  LODWORD(v8) = *((unsigned __int8 *)a1 + 107);
  uint64_t v87 = *((unsigned __int8 *)a1 + 25);
  int v47 = v8;
  int v45 = *((unsigned __int8 *)a1 + 108);
  uint64_t v54 = *a1;
  long long v55 = *(_OWORD *)(a1 + 1);
  char v56 = v46;
  char v57 = v87;
  char v58 = v9;
  char v59 = v10;
  char v60 = v11;
  char v61 = v12;
  char v62 = v13;
  char v63 = v14;
  uint64_t v64 = v15;
  char v65 = v16;
  char v66 = v17;
  uint64_t v67 = v18;
  char v68 = v19;
  char v69 = v20;
  uint64_t v70 = v21;
  char v71 = v22;
  char v72 = v23;
  __int16 v73 = v24;
  uint64_t v74 = v25;
  __int16 v75 = v26;
  char v76 = v27;
  char v77 = v28;
  char v78 = v29;
  char v79 = v30;
  uint64_t v80 = v31;
  char v81 = v32;
  char v82 = v33;
  char v83 = v34;
  char v84 = v8;
  char v85 = v45;
  uint64_t v35 = sub_2605321D0();
  uint64_t v36 = *(void *)(v35 - 8);
  __n128 v37 = MEMORY[0x270FA5388](v35);
  unint64_t v39 = &v44[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v40 = v49;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, __n128))(v36 + 16))(v39, v49, v35, v37);
  uint64_t v41 = v50;
  uint64_t v42 = v48;
  sub_2604E6AE0(v50, (uint64_t)v48, type metadata accessor for IntelligenceFile.Attributes);
  IntelligenceElement.Document.init(for:fromFileAt:name:sourceAttributes:)((uint64_t)&v54, (uint64_t)v39, v51, v52, (uint64_t)v42, &v86);
  sub_2604E76A8(v41, type metadata accessor for IntelligenceFile.Attributes);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8))(v40, v35);
  void *v53 = v86;
  return result;
}

uint64_t IntelligenceElement.Document.init(for:fromFileAt:name:sourceAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v52 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = (void *)((char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v55 = (uint64_t)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)v49 - v15;
  MEMORY[0x270FA5388](v17);
  char v19 = (char *)v49 - v18;
  int v20 = *(unsigned __int8 *)(a1 + 75);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 - 1) < 2)
  {
    v49[1] = v16;
    uint64_t v54 = a6;
    uint64_t v21 = sub_2605321D0();
    char v57 = v49;
    __n128 v22 = MEMORY[0x270FA5388](v21);
    __int16 v24 = (char *)v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    __int16 v26 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v25 + 16);
    uint64_t v50 = a2;
    v26(v24, a2, v21, v22);
    uint64_t v51 = a5;
    sub_2604E6AE0(a5, (uint64_t)v19, type metadata accessor for IntelligenceFile.Attributes);
    uint64_t v58 = 1;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    char v62 = 1;
    type metadata accessor for IntelligenceFile(0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v41 = IntelligenceFile.init(fileURL:name:attributes:automaticallyDelete:sandboxExtensionType:)((uint64_t)v24, v56, a4, (uint64_t)v19, 0, &v58);
    a2 = v50;
    uint64_t v42 = v51;
LABEL_6:
    sub_2605321D0();
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
    swift_retain();
    v43(a2, v21);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
    uint64_t v45 = (uint64_t)v53;
    uint64_t v46 = (uint64_t)v53 + *(int *)(v44 + 48);
    uint64_t *v53 = v41;
    sub_2604E6A78(v42, v46, type metadata accessor for IntelligenceFile.Attributes);
    _s8DocumentV15InternalBackingOMa(0);
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = v52;
    uint64_t v48 = v45 + *(int *)(v52 + 20);
    *(void *)uint64_t v48 = 0;
    *(void *)(v48 + 8) = 0;
    *(void *)(v48 + 16) = 0;
    *(_WORD *)(v48 + 24) = 256;
    *(unsigned char *)(v45 + *(int *)(v47 + 24)) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
    uint64_t v40 = swift_allocObject();
    uint64_t result = sub_2604E6A78(v45, v40 + *(void *)(*(void *)v40 + 88), _s8DocumentV7StorageVMa);
    a6 = v54;
    goto LABEL_7;
  }
  uint64_t v42 = a5;
  unint64_t v27 = a4;
  uint64_t v28 = v56;
  if (v20)
  {
    uint64_t v54 = a6;
    type metadata accessor for IntelligenceFile(0);
    uint64_t v21 = sub_2605321D0();
    char v57 = v49;
    __n128 v29 = MEMORY[0x270FA5388](v21);
    uint64_t v31 = (char *)v49 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v32 + 16))(v31, a2, v21, v29);
    sub_2604E6AE0(v42, (uint64_t)v16, type metadata accessor for IntelligenceFile.Attributes);
    uint64_t v58 = 1;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    char v62 = 1;
    swift_bridgeObjectRetain();
    uint64_t v41 = IntelligenceFile.__allocating_init(creatingTemporaryCopyOfFileAt:name:attributes:sandboxExtensionType:)((uint64_t)v31, v28, v27, (uint64_t)v16, (uint64_t)&v58);
    goto LABEL_6;
  }
  uint64_t v33 = sub_2605321D0();
  uint64_t v34 = *(void *)(v33 - 8);
  __n128 v35 = MEMORY[0x270FA5388](v33);
  __n128 v37 = (char *)v49 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v34 + 16))(v37, a2, v33, v35);
  uint64_t v38 = v55;
  sub_2604E6AE0(v42, v55, type metadata accessor for IntelligenceFile.Attributes);
  IntelligenceElement.Document.init(fromMetadataOfFileAt:name:sourceAttributes:)((uint64_t)v37, v28, v27, v38, &v58);
  sub_2604E76A8(v42, type metadata accessor for IntelligenceFile.Attributes);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(a2, v33);
  uint64_t v40 = v58;
LABEL_7:
  *a6 = v40;
  return result;
}

uint64_t IntelligenceElement.Document.init(for:fromData:name:attributes:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v42 = a6;
  uint64_t v43 = a2;
  uint64_t v45 = a4;
  unint64_t v46 = a5;
  unint64_t v44 = a3;
  uint64_t v47 = a7;
  uint64_t v8 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v40 = *((unsigned __int8 *)a1 + 24);
  char v11 = *((unsigned char *)a1 + 26);
  char v12 = *((unsigned char *)a1 + 27);
  char v13 = *((unsigned char *)a1 + 28);
  char v14 = *((unsigned char *)a1 + 29);
  char v15 = *((unsigned char *)a1 + 30);
  char v16 = *((unsigned char *)a1 + 31);
  uint64_t v17 = a1[4];
  char v18 = *((unsigned char *)a1 + 40);
  char v19 = *((unsigned char *)a1 + 41);
  uint64_t v20 = a1[6];
  char v21 = *((unsigned char *)a1 + 56);
  char v22 = *((unsigned char *)a1 + 57);
  uint64_t v23 = a1[8];
  char v24 = *((unsigned char *)a1 + 72);
  char v25 = *((unsigned char *)a1 + 73);
  __int16 v26 = *((_WORD *)a1 + 37);
  uint64_t v27 = a1[10];
  __int16 v28 = *((_WORD *)a1 + 44);
  char v29 = *((unsigned char *)a1 + 90);
  char v30 = *((unsigned char *)a1 + 91);
  char v31 = *((unsigned char *)a1 + 92);
  char v32 = *((unsigned char *)a1 + 93);
  uint64_t v33 = a1[12];
  char v34 = *((unsigned char *)a1 + 104);
  char v35 = *((unsigned char *)a1 + 105);
  LODWORD(v9) = *((unsigned __int8 *)a1 + 106);
  uint64_t v81 = *((unsigned __int8 *)a1 + 25);
  int v41 = v9;
  int v39 = *((unsigned __int8 *)a1 + 107);
  int v38 = *((unsigned __int8 *)a1 + 108);
  uint64_t v48 = *a1;
  long long v49 = *(_OWORD *)(a1 + 1);
  char v50 = v40;
  char v51 = v81;
  char v52 = v11;
  char v53 = v12;
  char v54 = v13;
  char v55 = v14;
  char v56 = v15;
  char v57 = v16;
  uint64_t v58 = v17;
  char v59 = v18;
  char v60 = v19;
  uint64_t v61 = v20;
  char v62 = v21;
  char v63 = v22;
  uint64_t v64 = v23;
  char v65 = v24;
  char v66 = v25;
  __int16 v67 = v26;
  uint64_t v68 = v27;
  __int16 v69 = v28;
  char v70 = v29;
  char v71 = v30;
  char v72 = v31;
  char v73 = v32;
  uint64_t v74 = v33;
  char v75 = v34;
  char v76 = v35;
  char v77 = v9;
  char v78 = v39;
  char v79 = v38;
  uint64_t v36 = v42;
  sub_2604E6AE0(v42, (uint64_t)v10, type metadata accessor for IntelligenceFile.Attributes);
  IntelligenceElement.Document.init(for:fromData:name:sourceAttributes:)((uint64_t)&v48, v43, v44, v45, v46, (uint64_t)v10, &v80);
  uint64_t result = sub_2604E76A8(v36, type metadata accessor for IntelligenceFile.Attributes);
  *uint64_t v47 = v80;
  return result;
}

uint64_t IntelligenceElement.Document.init(for:fromData:name:sourceAttributes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  char v29 = a7;
  uint64_t v28 = _s8DocumentV7StorageVMa(0);
  MEMORY[0x270FA5388](v28);
  char v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for IntelligenceFile.Attributes(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v28 - v19;
  if (*(unsigned __int8 *)(a1 + 75) - 2 < 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for IntelligenceFile(0);
    sub_2604E6AE0(a6, (uint64_t)v17, type metadata accessor for IntelligenceFile.Attributes);
    v30[0] = 1;
    memset(&v30[1], 0, 24);
    char v31 = 1;
    swift_bridgeObjectRetain();
    uint64_t v22 = IntelligenceFile.__allocating_init(writingDataToTemporaryFile:name:attributes:sandboxExtensionType:)(a2, a3, a4, a5, (uint64_t)v17, (uint64_t)v30);
LABEL_6:
    swift_bridgeObjectRelease();
    int v21 = *(_DWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t *v14 = v22;
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 75))
  {
    sub_2604E6AE0(a6, (uint64_t)&v28 - v19, type metadata accessor for IntelligenceFile.Attributes);
    type metadata accessor for IntelligenceFile(0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v22 = IntelligenceFile.init(data:name:attributes:)(a2, a3, a4, a5, (uint64_t)v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_260464128(a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v21 = *(_DWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  uint64_t *v14 = a4;
  v14[1] = a5;
LABEL_7:
  uint64_t v23 = v28;
  char v24 = v29;
  sub_2604E6A78(a6, (uint64_t)v14 + v21, type metadata accessor for IntelligenceFile.Attributes);
  _s8DocumentV15InternalBackingOMa(0);
  swift_storeEnumTagMultiPayload();
  char v25 = (char *)v14 + *(int *)(v23 + 20);
  *(void *)char v25 = 0;
  *((void *)v25 + 1) = 0;
  *((void *)v25 + 2) = 0;
  *((_WORD *)v25 + 12) = 256;
  *((unsigned char *)v14 + *(int *)(v23 + 24)) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873320);
  uint64_t v26 = swift_allocObject();
  uint64_t result = sub_2604E6A78((uint64_t)v14, v26 + *(void *)(*(void *)v26 + 88), _s8DocumentV7StorageVMa);
  *char v24 = v26;
  return result;
}

uint64_t _s21UIIntelligenceSupport19IntelligenceElementV8DocumentV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v90 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v89 = (char *)&v83 - v7;
  uint64_t v8 = _s8DocumentV15InternalBackingOMa(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v87 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v86 = (uint64_t *)((char *)&v83 - v12);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v88 = (char *)&v83 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v83 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (uint64_t *)((char *)&v83 - v19);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (uint64_t *)((char *)&v83 - v21);
  uint64_t v83 = _s8DocumentV7StorageVMa(0);
  uint64_t v23 = MEMORY[0x270FA5388](v83);
  uint64_t v85 = (uint64_t)&v83 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v84 = (uint64_t)&v83 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v92 = (uint64_t)&v83 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v91 = (uint64_t)&v83 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v83 - v32;
  MEMORY[0x270FA5388](v31);
  char v35 = (char *)&v83 - v34;
  uint64_t v36 = *a2;
  uint64_t v37 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  sub_2604E6AE0(v37, (uint64_t)v35, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v35, (uint64_t)v22, _s8DocumentV15InternalBackingOMa);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v93 = v37;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v40 = *v22;
    uint64_t v39 = v22[1];
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8((uint64_t)v22 + *(int *)(v41 + 48), type metadata accessor for IntelligenceFile.Attributes);
  }
  else
  {
    uint64_t v42 = *v22;
    uint64_t v43 = (uint64_t)v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v40 = *(void *)(v42 + 16);
    uint64_t v39 = *(void *)(v42 + 24);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_2604E76A8(v43, type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
  }
  uint64_t v44 = v36 + *(void *)(*(void *)v36 + 88);
  swift_beginAccess();
  uint64_t v94 = v44;
  sub_2604E6AE0(v44, (uint64_t)v33, _s8DocumentV7StorageVMa);
  sub_2604E6A78((uint64_t)v33, (uint64_t)v20, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v46 = *v20;
    uint64_t v45 = v20[1];
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8((uint64_t)v20 + *(int *)(v47 + 48), type metadata accessor for IntelligenceFile.Attributes);
    if (v40 != v46) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v48 = *v20;
    uint64_t v49 = (uint64_t)v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v50 = *(void *)(v48 + 16);
    uint64_t v45 = *(void *)(v48 + 24);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_2604E76A8(v49, type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
    if (v40 != v50) {
      goto LABEL_10;
    }
  }
  if (v39 == v45)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
LABEL_10:
  char v51 = sub_260532FA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v52 = 0;
  if ((v51 & 1) == 0) {
    return v52 & 1;
  }
LABEL_11:
  uint64_t v53 = v93;
  uint64_t v54 = v91;
  sub_2604E6AE0(v93, v91, _s8DocumentV7StorageVMa);
  sub_2604E6A78(v54, (uint64_t)v17, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    char v55 = &qword_26A872458;
  }
  else
  {
    swift_retain();
    swift_release();
    char v55 = &qword_26A8732E8;
  }
  uint64_t v56 = v94;
  uint64_t v58 = (uint64_t)v89;
  uint64_t v57 = (uint64_t)v90;
  uint64_t v59 = (uint64_t)v88;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(v55);
  sub_2604E6A78((uint64_t)&v17[*(int *)(v60 + 48)], v58, type metadata accessor for IntelligenceFile.Attributes);
  swift_release();
  uint64_t v61 = v92;
  sub_2604E6AE0(v56, v92, _s8DocumentV7StorageVMa);
  sub_2604E6A78(v61, v59, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    char v62 = &qword_26A872458;
  }
  else
  {
    swift_retain();
    swift_release();
    char v62 = &qword_26A8732E8;
  }
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(v62);
  sub_2604E6A78(v59 + *(int *)(v63 + 48), v57, type metadata accessor for IntelligenceFile.Attributes);
  swift_release();
  BOOL v64 = static IntelligenceFile.Attributes.== infix(_:_:)(v58, v57);
  sub_2604E76A8(v57, type metadata accessor for IntelligenceFile.Attributes);
  sub_2604E76A8(v58, type metadata accessor for IntelligenceFile.Attributes);
  if (!v64) {
    goto LABEL_31;
  }
  uint64_t v65 = v84;
  sub_2604E6AE0(v53, v84, _s8DocumentV7StorageVMa);
  char v66 = v86;
  sub_2604E6A78(v65, (uint64_t)v86, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8((uint64_t)v66 + *(int *)(v67 + 48), type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
    uint64_t v68 = 0;
  }
  else
  {
    uint64_t v68 = *v66;
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
    sub_2604E76A8((uint64_t)v66 + *(int *)(v69 + 48), type metadata accessor for IntelligenceFile.Attributes);
  }
  char v70 = (uint64_t *)v87;
  uint64_t v71 = v85;
  sub_2604E6AE0(v56, v85, _s8DocumentV7StorageVMa);
  sub_2604E6A78(v71, (uint64_t)v70, _s8DocumentV15InternalBackingOMa);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872458);
    sub_2604E76A8((uint64_t)v70 + *(int *)(v72 + 48), type metadata accessor for IntelligenceFile.Attributes);
    swift_release();
    if (!v68) {
      goto LABEL_33;
    }
LABEL_30:
    swift_release();
    goto LABEL_31;
  }
  uint64_t v73 = *v70;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8);
  sub_2604E76A8((uint64_t)v70 + *(int *)(v74 + 48), type metadata accessor for IntelligenceFile.Attributes);
  if (v68)
  {
    if (!v73) {
      goto LABEL_30;
    }
    type metadata accessor for IntelligenceFile(0);
    uint64_t v75 = swift_retain();
    char v76 = static IntelligenceFile.== infix(_:_:)(v75, v73);
    swift_release_n();
    swift_release();
    if ((v76 & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (v73)
  {
    goto LABEL_30;
  }
LABEL_33:
  uint64_t v78 = *(int *)(v83 + 20);
  uint64_t v79 = v53 + v78;
  char v80 = *(unsigned char *)(v53 + v78 + 25);
  uint64_t v81 = v56 + v78;
  char v82 = *(unsigned char *)(v56 + v78 + 25);
  if (v80) {
    goto LABEL_34;
  }
  if ((v82 & 1) != 0 || *(void *)v79 != *(void *)v81) {
    goto LABEL_31;
  }
  char v82 = *(unsigned char *)(v81 + 24);
  if (*(unsigned char *)(v79 + 24))
  {
LABEL_34:
    if (v82)
    {
LABEL_35:
      char v52 = *(unsigned char *)(v53 + *(int *)(v83 + 24)) ^ *(unsigned char *)(v94 + *(int *)(v83 + 24)) ^ 1;
      return v52 & 1;
    }
    goto LABEL_31;
  }
  if (*(unsigned char *)(v81 + 24))
  {
LABEL_31:
    char v52 = 0;
    return v52 & 1;
  }
  char v52 = 0;
  if (*(void *)(v79 + 8) == *(void *)(v81 + 8) && *(void *)(v79 + 16) == *(void *)(v81 + 16)) {
    goto LABEL_35;
  }
  return v52 & 1;
}

unint64_t sub_2604ECCA0()
{
  unint64_t result = qword_26A873330;
  if (!qword_26A873330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873330);
  }
  return result;
}

unint64_t sub_2604ECCF4()
{
  unint64_t result = qword_26A873340;
  if (!qword_26A873340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873340);
  }
  return result;
}

uint64_t sub_2604ECD48(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2604ECD90()
{
  unint64_t result = qword_26A873358;
  if (!qword_26A873358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873358);
  }
  return result;
}

uint64_t sub_2604ECDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604ECE50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  char v2 = *(unsigned char *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 25);
  long long v5 = *(_OWORD *)a1;
  uint64_t v6 = v1;
  char v7 = v2;
  char v8 = v3;
  return IntelligenceElement.Document.paginationInfo.setter(&v5);
}

uint64_t sub_2604ECEA4(char *a1)
{
  return IntelligenceElement.Document.isWindowContentGeneratedPDF.setter(*a1);
}

ValueMetadata *type metadata accessor for IntelligenceElement.Document()
{
  return &type metadata for IntelligenceElement.Document;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s8DocumentV14PaginationInfoVwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s8DocumentV14PaginationInfoVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Document.PaginationInfo()
{
  return &type metadata for IntelligenceElement.Document.PaginationInfo;
}

unsigned char *_s8DocumentV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x2604ED01CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s8DocumentV10CodingKeysOMa()
{
  return &_s8DocumentV10CodingKeysON;
}

ValueMetadata *_s8DocumentV14PaginationInfoV10CodingKeysOMa()
{
  return &_s8DocumentV14PaginationInfoV10CodingKeysON;
}

void *sub_2604ED068(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    _s8DocumentV15InternalBackingOMa(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      char v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_2605323B0();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      uint64_t v20 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v21 = v20[5];
      uint64_t v22 = &v8[v21];
      uint64_t v23 = &v9[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      v22[8] = v23[8];
      uint64_t v24 = v20[6];
      __dst = &v8[v24];
      uint64_t v25 = &v9[v24];
      uint64_t v26 = sub_260532270();
      uint64_t v27 = *(void *)(v26 - 8);
      uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
      if (v28(v25, 1, v26))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dst, v25, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(__dst, v25, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(__dst, 0, 1, v26);
      }
      uint64_t v40 = v20[7];
      uint64_t v41 = &v8[v40];
      uint64_t v42 = &v9[v40];
      if (!v28(v42, 1, v26))
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v41, v42, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v41, 0, 1, v26);
        goto LABEL_22;
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_2605323B0();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      uint64_t v30 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v31 = v30[5];
      uint64_t v32 = &v15[v31];
      uint64_t v33 = &v16[v31];
      *(void *)uint64_t v32 = *(void *)v33;
      v32[8] = v33[8];
      uint64_t v34 = v30[6];
      __dsta = &v15[v34];
      char v35 = &v16[v34];
      uint64_t v36 = sub_260532270();
      uint64_t v37 = *(void *)(v36 - 8);
      int v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
      if (v38(v35, 1, v36))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dsta, v35, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(__dsta, v35, v36);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(__dsta, 0, 1, v36);
      }
      uint64_t v44 = v30[7];
      uint64_t v41 = &v15[v44];
      uint64_t v42 = &v16[v44];
      if (!v38(v42, 1, v36))
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v41, v42, v36);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v41, 0, 1, v36);
        goto LABEL_22;
      }
    }
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
    memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
LABEL_22:
    swift_storeEnumTagMultiPayload();
    uint64_t v45 = *(int *)(a3 + 20);
    uint64_t v46 = *(int *)(a3 + 24);
    uint64_t v47 = (_OWORD *)((char *)a1 + v45);
    uint64_t v48 = (_OWORD *)((char *)a2 + v45);
    *uint64_t v47 = *v48;
    *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)((char *)v48 + 10);
    *((unsigned char *)a1 + v46) = *((unsigned char *)a2 + v46);
    return a1;
  }
  uint64_t v13 = *a2;
  *a1 = *a2;
  a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t sub_2604ED6AC(uint64_t a1)
{
  _s8DocumentV15InternalBackingOMa(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    char v2 = &qword_26A872458;
  }
  else
  {
    swift_release();
    char v2 = &qword_26A8732E8;
  }
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v2) + 48);
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  uint64_t v6 = type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v7 = v3 + *(int *)(v6 + 24);
  uint64_t v8 = sub_260532270();
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v9(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v7, v8);
  }
  uint64_t v10 = v3 + *(int *)(v6 + 28);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v10, 1, v8);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v8);
  }
  return result;
}

void *sub_2604ED894(void *a1, void *a2, uint64_t a3)
{
  _s8DocumentV15InternalBackingOMa(0);
  char v51 = a2;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_2605323B0();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
    uint64_t v18 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v19 = v18[5];
    uint64_t v20 = &v7[v19];
    uint64_t v21 = &v8[v19];
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = v18[6];
    uint64_t v23 = &v7[v22];
    uint64_t v24 = &v8[v22];
    uint64_t v25 = sub_260532270();
    uint64_t v26 = *(void *)(v25 - 8);
    uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
    if (v27(v24, 1, v25))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
    uint64_t v40 = v18[7];
    uint64_t v41 = &v7[v40];
    uint64_t v42 = &v8[v40];
    if (!v27(v42, 1, v25))
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v41, v42, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v41, 0, 1, v25);
      goto LABEL_20;
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_2605323B0();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v29 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v30 = v29[5];
    uint64_t v31 = &v13[v30];
    uint64_t v32 = &v14[v30];
    *(void *)uint64_t v31 = *(void *)v32;
    v31[8] = v32[8];
    uint64_t v33 = v29[6];
    uint64_t v34 = &v13[v33];
    char v35 = &v14[v33];
    uint64_t v36 = sub_260532270();
    uint64_t v37 = *(void *)(v36 - 8);
    int v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
    if (v38(v35, 1, v36))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v34, v35, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    uint64_t v44 = v29[7];
    uint64_t v41 = &v13[v44];
    uint64_t v42 = &v14[v44];
    if (!v38(v42, 1, v36))
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v41, v42, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v41, 0, 1, v36);
      goto LABEL_20;
    }
  }
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
  memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
LABEL_20:
  swift_storeEnumTagMultiPayload();
  uint64_t v45 = *(int *)(a3 + 20);
  uint64_t v46 = *(int *)(a3 + 24);
  uint64_t v47 = (_OWORD *)((char *)a1 + v45);
  uint64_t v48 = (_OWORD *)((char *)v51 + v45);
  *uint64_t v47 = *v48;
  *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)((char *)v48 + 10);
  *((unsigned char *)a1 + v46) = *((unsigned char *)v51 + v46);
  return a1;
}

void *sub_2604EDE70(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v51 = a3;
    sub_2604E76A8((uint64_t)a1, _s8DocumentV15InternalBackingOMa);
    _s8DocumentV15InternalBackingOMa(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      uint64_t v8 = sub_2605323B0();
      uint64_t v9 = *(void *)(v8 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      }
      uint64_t v17 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v18 = v17[5];
      uint64_t v19 = &v6[v18];
      uint64_t v20 = &v7[v18];
      char v21 = v20[8];
      *(void *)uint64_t v19 = *(void *)v20;
      v19[8] = v21;
      uint64_t v22 = v17[6];
      __dst = &v6[v22];
      uint64_t v23 = &v7[v22];
      uint64_t v24 = sub_260532270();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
      if (v26(v23, 1, v24))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dst, v23, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(__dst, v23, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
      }
      uint64_t v39 = v17[7];
      uint64_t v40 = &v6[v39];
      uint64_t v41 = &v7[v39];
      if (!v26(v41, 1, v24))
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v40, v41, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v40, 0, 1, v24);
        goto LABEL_21;
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_2605323B0();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
      uint64_t v28 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v29 = v28[5];
      uint64_t v30 = &v12[v29];
      uint64_t v31 = &v13[v29];
      char v32 = v31[8];
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v32;
      uint64_t v33 = v28[6];
      __dsta = &v12[v33];
      uint64_t v34 = &v13[v33];
      uint64_t v35 = sub_260532270();
      uint64_t v36 = *(void *)(v35 - 8);
      uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
      if (v37(v34, 1, v35))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dsta, v34, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(__dsta, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(__dsta, 0, 1, v35);
      }
      uint64_t v43 = v28[7];
      uint64_t v40 = &v12[v43];
      uint64_t v41 = &v13[v43];
      if (!v37(v41, 1, v35))
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v40, v41, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v40, 0, 1, v35);
        goto LABEL_21;
      }
    }
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
    memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
LABEL_21:
    swift_storeEnumTagMultiPayload();
    a3 = v51;
  }
  uint64_t v44 = *(int *)(a3 + 20);
  uint64_t v45 = (_OWORD *)((char *)a1 + v44);
  uint64_t v46 = (long long *)((char *)a2 + v44);
  long long v47 = *v46;
  *(_OWORD *)((char *)v45 + 10) = *(long long *)((char *)v46 + 10);
  *uint64_t v45 = v47;
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_2604EE494(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _s8DocumentV15InternalBackingOMa(0);
  uint64_t v50 = a2;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_2605323B0();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
    uint64_t v17 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v18 = v17[5];
    uint64_t v19 = &v6[v18];
    uint64_t v20 = &v7[v18];
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = v20[8];
    uint64_t v21 = v17[6];
    uint64_t v22 = &v6[v21];
    uint64_t v23 = &v7[v21];
    uint64_t v24 = sub_260532270();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    uint64_t v39 = v17[7];
    uint64_t v40 = &v6[v39];
    uint64_t v41 = &v7[v39];
    if (!v26(v41, 1, v24))
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v40, v41, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v40, 0, 1, v24);
      goto LABEL_20;
    }
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_2605323B0();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v28 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v29 = v28[5];
    uint64_t v30 = &v12[v29];
    uint64_t v31 = &v13[v29];
    *(void *)uint64_t v30 = *(void *)v31;
    v30[8] = v31[8];
    uint64_t v32 = v28[6];
    uint64_t v33 = &v12[v32];
    uint64_t v34 = &v13[v32];
    uint64_t v35 = sub_260532270();
    uint64_t v36 = *(void *)(v35 - 8);
    uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    if (v37(v34, 1, v35))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v33, v34, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    uint64_t v43 = v28[7];
    uint64_t v40 = &v12[v43];
    uint64_t v41 = &v13[v43];
    if (!v37(v41, 1, v35))
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v40, v41, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v40, 0, 1, v35);
      goto LABEL_20;
    }
  }
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
  memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
LABEL_20:
  swift_storeEnumTagMultiPayload();
  uint64_t v44 = *(int *)(a3 + 20);
  uint64_t v45 = *(int *)(a3 + 24);
  uint64_t v46 = (_OWORD *)((char *)a1 + v44);
  long long v47 = (_OWORD *)((char *)v50 + v44);
  _OWORD *v46 = *v47;
  *(_OWORD *)((char *)v46 + 10) = *(_OWORD *)((char *)v47 + 10);
  *((unsigned char *)a1 + v45) = *((unsigned char *)v50 + v45);
  return a1;
}

_OWORD *sub_2604EEA68(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v49 = a3;
    sub_2604E76A8((uint64_t)a1, _s8DocumentV15InternalBackingOMa);
    _s8DocumentV15InternalBackingOMa(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      uint64_t v8 = sub_2605323B0();
      uint64_t v9 = *(void *)(v8 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      }
      uint64_t v17 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v18 = v17[5];
      uint64_t v19 = &v6[v18];
      uint64_t v20 = &v7[v18];
      *(void *)uint64_t v19 = *(void *)v20;
      v19[8] = v20[8];
      uint64_t v21 = v17[6];
      __dst = &v6[v21];
      uint64_t v22 = &v7[v21];
      uint64_t v23 = sub_260532270();
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      if (v25(v22, 1, v23))
      {
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dst, v22, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(__dst, v22, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
      }
      uint64_t v37 = v17[7];
      uint64_t v38 = &v6[v37];
      uint64_t v39 = &v7[v37];
      if (!v25(v39, 1, v23))
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v38, v39, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v38, 0, 1, v23);
        goto LABEL_21;
      }
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_2605323B0();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
      uint64_t v27 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v28 = v27[5];
      uint64_t v29 = &v12[v28];
      uint64_t v30 = &v13[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      uint64_t v31 = v27[6];
      __dsta = &v12[v31];
      uint64_t v32 = &v13[v31];
      uint64_t v33 = sub_260532270();
      uint64_t v34 = *(void *)(v33 - 8);
      uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      if (v35(v32, 1, v33))
      {
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dsta, v32, *(void *)(*(void *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(__dsta, v32, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(__dsta, 0, 1, v33);
      }
      uint64_t v41 = v27[7];
      uint64_t v38 = &v12[v41];
      uint64_t v39 = &v13[v41];
      if (!v35(v39, 1, v33))
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v38, v39, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v38, 0, 1, v33);
        goto LABEL_21;
      }
    }
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
LABEL_21:
    swift_storeEnumTagMultiPayload();
    a3 = v49;
  }
  uint64_t v42 = *(int *)(a3 + 20);
  uint64_t v43 = *(int *)(a3 + 24);
  uint64_t v44 = (_OWORD *)((char *)a1 + v42);
  uint64_t v45 = (_OWORD *)((char *)a2 + v42);
  *uint64_t v44 = *v45;
  *(_OWORD *)((char *)v44 + 10) = *(_OWORD *)((char *)v45 + 10);
  *((unsigned char *)a1 + v43) = *((unsigned char *)a2 + v43);
  return a1;
}

uint64_t sub_2604EF078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2604EF08C);
}

uint64_t sub_2604EF08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = _s8DocumentV15InternalBackingOMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_2604EF15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2604EF170);
}

uint64_t sub_2604EF170(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = _s8DocumentV15InternalBackingOMa(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t sub_2604EF22C()
{
  uint64_t result = _s8DocumentV15InternalBackingOMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_2604EF2CC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_2605323B0();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      uint64_t v20 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v21 = v20[5];
      uint64_t v22 = &v8[v21];
      uint64_t v23 = &v9[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      v22[8] = v23[8];
      uint64_t v24 = v20[6];
      uint64_t v25 = &v8[v24];
      uint64_t v26 = &v9[v24];
      uint64_t v27 = sub_260532270();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
      if (v29(v26, 1, v27))
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      }
      uint64_t v40 = v20[7];
      uint64_t v41 = &v8[v40];
      uint64_t v42 = &v9[v40];
      if (v29(v42, 1, v27))
      {
LABEL_16:
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
LABEL_20:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_2605323B0();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      uint64_t v31 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v32 = v31[5];
      uint64_t v33 = &v15[v32];
      uint64_t v34 = &v16[v32];
      *(void *)uint64_t v33 = *(void *)v34;
      v33[8] = v34[8];
      uint64_t v35 = v31[6];
      uint64_t v36 = &v15[v35];
      uint64_t v37 = &v16[v35];
      uint64_t v27 = sub_260532270();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
      if (v38(v37, 1, v27))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v36, v37, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v36, 0, 1, v27);
      }
      uint64_t v44 = v31[7];
      uint64_t v41 = &v15[v44];
      uint64_t v42 = &v16[v44];
      if (v38(v42, 1, v27)) {
        goto LABEL_16;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v41, v42, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v41, 0, 1, v27);
    goto LABEL_20;
  }
  uint64_t v13 = *a2;
  *a1 = *a2;
  a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t sub_2604EF8BC(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    char v2 = &qword_26A872458;
  }
  else
  {
    swift_release();
    char v2 = &qword_26A8732E8;
  }
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v2) + 48);
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  uint64_t v6 = type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v7 = v3 + *(int *)(v6 + 24);
  uint64_t v8 = sub_260532270();
  uint64_t v13 = *(void *)(v8 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v9(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v7, v8);
  }
  uint64_t v10 = v3 + *(int *)(v6 + 28);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v10, 1, v8);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v8);
  }
  return result;
}

void *sub_2604EFA94(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    *a1 = *a2;
    swift_retain();
    uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_2605323B0();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v28 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v29 = v28[5];
    uint64_t v30 = &v12[v29];
    uint64_t v31 = &v13[v29];
    *(void *)uint64_t v30 = *(void *)v31;
    v30[8] = v31[8];
    uint64_t v32 = v28[6];
    uint64_t v33 = &v12[v32];
    uint64_t v34 = &v13[v32];
    uint64_t v24 = sub_260532270();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    if (v35(v34, 1, v24))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v33, v34, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v33, 0, 1, v24);
    }
    uint64_t v41 = v28[7];
    uint64_t v38 = &v12[v41];
    uint64_t v39 = &v13[v41];
    if (v35(v39, 1, v24)) {
      goto LABEL_14;
    }
LABEL_17:
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v38, v39, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v38, 0, 1, v24);
    goto LABEL_18;
  }
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2605323B0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  uint64_t v17 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v18 = v17[5];
  uint64_t v19 = &v6[v18];
  uint64_t v20 = &v7[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = v17[6];
  uint64_t v22 = &v6[v21];
  uint64_t v23 = &v7[v21];
  uint64_t v24 = sub_260532270();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v26(v23, 1, v24))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
    memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v37 = v17[7];
  uint64_t v38 = &v6[v37];
  uint64_t v39 = &v7[v37];
  if (!v26(v39, 1, v24)) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
  memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
LABEL_18:
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_2604F0034(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_2604E76A8((uint64_t)a1, _s8DocumentV15InternalBackingOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      uint64_t v5 = (char *)a1 + v4;
      uint64_t v6 = (char *)a2 + v4;
      uint64_t v7 = sub_2605323B0();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
      }
      uint64_t v16 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v17 = v16[5];
      uint64_t v18 = &v5[v17];
      uint64_t v19 = &v6[v17];
      char v20 = v19[8];
      *(void *)uint64_t v18 = *(void *)v19;
      v18[8] = v20;
      uint64_t v21 = v16[6];
      uint64_t v22 = &v5[v21];
      uint64_t v23 = &v6[v21];
      uint64_t v24 = sub_260532270();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
      if (v26(v23, 1, v24))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      uint64_t v38 = v16[7];
      uint64_t v39 = &v5[v38];
      uint64_t v40 = &v6[v38];
      if (v26(v40, 1, v24))
      {
LABEL_15:
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
LABEL_19:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_2605323B0();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      uint64_t v28 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v29 = v28[5];
      uint64_t v30 = &v11[v29];
      uint64_t v31 = &v12[v29];
      char v32 = v31[8];
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v32;
      uint64_t v33 = v28[6];
      uint64_t v34 = &v11[v33];
      uint64_t v35 = &v12[v33];
      uint64_t v24 = sub_260532270();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
      if (v36(v35, 1, v24))
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v34, v35, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v34, 0, 1, v24);
      }
      uint64_t v42 = v28[7];
      uint64_t v39 = &v11[v42];
      uint64_t v40 = &v12[v42];
      if (v36(v40, 1, v24)) {
        goto LABEL_15;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v39, v40, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v39, 0, 1, v24);
    goto LABEL_19;
  }
  return a1;
}

void *sub_2604F0604(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    *a1 = *a2;
    uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_2605323B0();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    uint64_t v27 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v28 = v27[5];
    uint64_t v29 = &v11[v28];
    uint64_t v30 = &v12[v28];
    *(void *)uint64_t v29 = *(void *)v30;
    v29[8] = v30[8];
    uint64_t v31 = v27[6];
    char v32 = &v11[v31];
    uint64_t v33 = &v12[v31];
    uint64_t v23 = sub_260532270();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
    if (v34(v33, 1, v23))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v32, v33, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v32, 0, 1, v23);
    }
    uint64_t v40 = v27[7];
    uint64_t v37 = &v11[v40];
    uint64_t v38 = &v12[v40];
    if (v34(v38, 1, v23)) {
      goto LABEL_14;
    }
LABEL_17:
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v37, v38, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v37, 0, 1, v23);
    goto LABEL_18;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2605323B0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  uint64_t v16 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
  uint64_t v17 = v16[5];
  uint64_t v18 = &v5[v17];
  uint64_t v19 = &v6[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = v16[6];
  uint64_t v21 = &v5[v20];
  uint64_t v22 = &v6[v20];
  uint64_t v23 = sub_260532270();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v25(v22, 1, v23))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  uint64_t v36 = v16[7];
  uint64_t v37 = &v5[v36];
  uint64_t v38 = &v6[v36];
  if (!v25(v38, 1, v23)) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
  memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
LABEL_18:
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *sub_2604F0B9C(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_2604E76A8((uint64_t)a1, _s8DocumentV15InternalBackingOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A872458) + 48);
      uint64_t v5 = (char *)a1 + v4;
      uint64_t v6 = (char *)a2 + v4;
      uint64_t v7 = sub_2605323B0();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
      }
      uint64_t v16 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v17 = v16[5];
      uint64_t v18 = &v5[v17];
      uint64_t v19 = &v6[v17];
      *(void *)uint64_t v18 = *(void *)v19;
      v18[8] = v19[8];
      uint64_t v20 = v16[6];
      uint64_t v21 = &v5[v20];
      uint64_t v22 = &v6[v20];
      uint64_t v23 = sub_260532270();
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      if (v25(v22, 1, v23))
      {
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      uint64_t v36 = v16[7];
      uint64_t v37 = &v5[v36];
      uint64_t v38 = &v6[v36];
      if (v25(v38, 1, v23))
      {
LABEL_15:
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
LABEL_19:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8732E8) + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_2605323B0();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      uint64_t v27 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v28 = v27[5];
      uint64_t v29 = &v11[v28];
      uint64_t v30 = &v12[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      uint64_t v31 = v27[6];
      char v32 = &v11[v31];
      uint64_t v33 = &v12[v31];
      uint64_t v23 = sub_260532270();
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      if (v34(v33, 1, v23))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v32, v33, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v32, 0, 1, v23);
      }
      uint64_t v40 = v27[7];
      uint64_t v37 = &v11[v40];
      uint64_t v38 = &v12[v40];
      if (v34(v38, 1, v23)) {
        goto LABEL_15;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v37, v38, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v37, 0, 1, v23);
    goto LABEL_19;
  }
  return a1;
}

uint64_t sub_2604F115C()
{
  uint64_t result = type metadata accessor for IntelligenceFile.Attributes(319);
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v4 = &v3;
    swift_getTupleTypeLayout2();
    uint64_t v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2604F1228()
{
  unint64_t result = qword_26A873380;
  if (!qword_26A873380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873380);
  }
  return result;
}

unint64_t sub_2604F1280()
{
  unint64_t result = qword_26A873388;
  if (!qword_26A873388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873388);
  }
  return result;
}

unint64_t sub_2604F12D8()
{
  unint64_t result = qword_26A873390;
  if (!qword_26A873390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873390);
  }
  return result;
}

unint64_t sub_2604F1330()
{
  unint64_t result = qword_26A873398;
  if (!qword_26A873398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873398);
  }
  return result;
}

unint64_t sub_2604F1388()
{
  unint64_t result = qword_26A8733A0;
  if (!qword_26A8733A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733A0);
  }
  return result;
}

unint64_t sub_2604F13E0()
{
  unint64_t result = qword_26A8733A8;
  if (!qword_26A8733A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733A8);
  }
  return result;
}

uint64_t sub_2604F1434(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6761506C61746F74 && a2 == 0xEA00000000007365;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x50656C6269736976 && a2 == 0xEC00000073656761)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2604F154C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701603686 && a2 == 0xE400000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xEC000000796C6E4FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2604F1648(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000260541310)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2604F1720()
{
  unint64_t v0 = sub_260532DC0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_2604F176C()
{
  unint64_t result = qword_26A8733C8;
  if (!qword_26A8733C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733C8);
  }
  return result;
}

unint64_t sub_2604F17C0()
{
  unint64_t result = qword_26A8733D0;
  if (!qword_26A8733D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733D0);
  }
  return result;
}

unint64_t sub_2604F1814()
{
  unint64_t result = qword_26A8733D8;
  if (!qword_26A8733D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733D8);
  }
  return result;
}

ValueMetadata *_s8DocumentV15InternalBackingO10CodingKeysOMa()
{
  return &_s8DocumentV15InternalBackingO10CodingKeysON;
}

ValueMetadata *_s8DocumentV15InternalBackingO14FileCodingKeysOMa()
{
  return &_s8DocumentV15InternalBackingO14FileCodingKeysON;
}

unsigned char *_s8DocumentV14PaginationInfoV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604F1954);
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

ValueMetadata *_s8DocumentV15InternalBackingO22MetadataOnlyCodingKeysOMa()
{
  return &_s8DocumentV15InternalBackingO22MetadataOnlyCodingKeysON;
}

unint64_t sub_2604F1990()
{
  unint64_t result = qword_26A8733F8;
  if (!qword_26A8733F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8733F8);
  }
  return result;
}

unint64_t sub_2604F19E8()
{
  unint64_t result = qword_26A873400;
  if (!qword_26A873400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873400);
  }
  return result;
}

unint64_t sub_2604F1A40()
{
  unint64_t result = qword_26A873408;
  if (!qword_26A873408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873408);
  }
  return result;
}

unint64_t sub_2604F1A98()
{
  unint64_t result = qword_26A873410;
  if (!qword_26A873410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873410);
  }
  return result;
}

unint64_t sub_2604F1AF0()
{
  unint64_t result = qword_26A873418;
  if (!qword_26A873418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873418);
  }
  return result;
}

unint64_t sub_2604F1B48()
{
  unint64_t result = qword_26A873420;
  if (!qword_26A873420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873420);
  }
  return result;
}

unint64_t sub_2604F1BA0()
{
  unint64_t result = qword_26A873428;
  if (!qword_26A873428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873428);
  }
  return result;
}

unint64_t sub_2604F1BF8()
{
  unint64_t result = qword_26A873430;
  if (!qword_26A873430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873430);
  }
  return result;
}

unint64_t sub_2604F1C50()
{
  unint64_t result = qword_26A873438;
  if (!qword_26A873438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873438);
  }
  return result;
}

uint64_t UIIntelligenceElementCollector.context.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_26046A78C(v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context, a1);
}

id UIIntelligenceElementCollector.__allocating_init(context:)(uint64_t a1)
{
  int v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults] = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementCollectionResults] = v4;
  *(void *)&v3[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementArrayCollectionResults] = v4;
  sub_26046A78C(a1, (uint64_t)&v3[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context]);
  v7.receiver = v3;
  v7.super_class = v1;
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v5;
}

id UIIntelligenceElementCollector.init(context:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults] = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementCollectionResults] = v4;
  *(void *)&v1[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementArrayCollectionResults] = v4;
  sub_26046A78C(a1, (uint64_t)&v1[OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context]);
  v7.receiver = v1;
  v7.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v5;
}

uint64_t UIIntelligenceElementCollector.createRemoteContext(description:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5, v6);
}

uint64_t UIIntelligenceElementCollector.createRemoteContext(boundingBoxTransform:description:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24))(a1, a2, a3, v7, v8);
}

uint64_t UIIntelligenceElementCollector.createRemoteContext()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

uint64_t UIIntelligenceElementCollector.createRemoteContext(boundingBoxTransform:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a1, v3, v4);
}

uint64_t UIIntelligenceElementCollector.performCollection(_:)@<X0>(void (*a1)(uint64_t)@<X0>, void *a2@<X8>)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults;
  swift_beginAccess();
  uint64_t v6 = *(void **)v5;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v6 = sub_260457FB4(0, v6[2] + 1, 1, v6);
    *(void *)uint64_t v5 = v6;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t v6 = sub_260457FB4((void *)(v8 > 1), v9 + 1, 1, v6);
    *(void *)uint64_t v5 = v6;
  }
  v6[2] = v9 + 1;
  v6[v9 + 4] = 0xF000000000000007;
  uint64_t v10 = swift_endAccess();
  a1(v10);
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)v5 + 16))
  {
    sub_2604F3538(&v13);
    uint64_t v12 = v13;
    if ((v13 & 0xF000000000000007) == 0xE000000000000007)
    {
      sub_2604F335C(*(void *)(*(void *)v5 + 16) - 1, &v13);
      uint64_t v12 = v13;
    }
    uint64_t result = swift_endAccess();
    *a2 = v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t UIIntelligenceElementCollector.collect(_:)(unint64_t *a1)
{
  unint64_t v2 = *a1;
  uint64_t v3 = v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults;
  swift_beginAccess();
  unint64_t v4 = *(void *)(*(void *)v3 + 16);
  if (v4 && (~*(void *)(*(void *)v3 + 8 * (v4 - 1) + 32) & 0xF000000000000007) == 0)
  {
    swift_beginAccess();
    uint64_t v5 = *(void **)v3;
    sub_2604761F8(v2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v3 = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v5 = sub_2604F3320(v5);
      *(void *)uint64_t v3 = v5;
    }
    if (v4 <= v5[2])
    {
      uint64_t v7 = &v5[v4 - 1];
      unint64_t v8 = v7[4];
      v7[4] = v2;
      swift_endAccess();
      return sub_260482364(v8);
    }
    __break(1u);
  }
  unint64_t result = sub_260532D50();
  __break(1u);
  return result;
}

uint64_t UIIntelligenceElementCollector.collectAsyncContent(description:timeout:fallback:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unint64_t *a5)
{
  unint64_t v10 = *a5;
  uint64_t v11 = (void **)(v5 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults);
  swift_beginAccess();
  uint64_t v12 = (*v11)[2];
  if (v12 && (~(*v11)[v12 + 3] & 0xF000000000000007) == 0)
  {
    uint64_t v27 = (*v11)[v12 + 3];
    unint64_t v28 = v10;
    unint64_t v29 = (*v11)[2];
    uint64_t v30 = v11;
    uint64_t v25 = v12 - 1;
    if (qword_26B3E93D8 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)(v5 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
    uint64_t v14 = *(void *)(v5 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v13);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v14 + 8))(&v63, v13, v14);
    uint64_t v31 = v63;
    long long v32 = v64;
    char v33 = v65;
    char v34 = v66;
    char v35 = v67;
    char v36 = v68;
    char v37 = v69;
    char v38 = v70;
    char v39 = v71;
    char v40 = v72;
    uint64_t v41 = v73;
    char v42 = v74;
    char v43 = v75;
    uint64_t v44 = v76;
    char v45 = v77;
    char v46 = v78;
    uint64_t v47 = v79;
    char v48 = v80;
    char v49 = v81;
    __int16 v50 = v82;
    uint64_t v51 = v83;
    __int16 v52 = v84;
    char v53 = v85;
    char v54 = v86;
    char v55 = v87;
    char v56 = v88;
    uint64_t v57 = v89;
    char v58 = v90;
    char v59 = v91;
    char v60 = v92;
    char v61 = v93;
    char v62 = v94;
    IntelligenceCollectionCoordinator.beginAsyncTask(for:timeout:description:)(&v31, *(double *)&a3, a4 & 1, a1, a2, (uint64_t)v95);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = v95[0];
    long long v26 = v96;
    uint64_t v16 = v97;
    type metadata accessor for IntelligenceElement.AsyncContent();
    uint64_t v17 = v95[1];
    uint64_t v18 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873460);
    uint64_t v19 = swift_allocObject();
    *(_DWORD *)(v19 + 32) = 0;
    *(unsigned char *)(v19 + 16) = 0;
    *(void *)(v19 + 24) = v27;
    *(void *)(v18 + 16) = v15;
    *(void *)(v18 + 24) = v17;
    *(_OWORD *)(v18 + 32) = v26;
    *(void *)(v18 + 48) = v16;
    *(void *)(v18 + 56) = v28;
    *(void *)(v18 + 64) = v19;
    swift_beginAccess();
    uint64_t v20 = *v30;
    sub_2604761F8(v28);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v30 = v20;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v20 = sub_2604F3320(v20);
      *uint64_t v30 = v20;
    }
    if (v29 <= v20[2])
    {
      uint64_t v22 = &v20[v25];
      unint64_t v23 = v22[4];
      v22[4] = v18;
      swift_endAccess();
      sub_260482364(v23);
      return v18;
    }
    __break(1u);
  }
  uint64_t result = sub_260532D50();
  __break(1u);
  return result;
}

uint64_t UIIntelligenceElementCollector.collectAsyncContent(description:deadline:fallback:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v8 = *a4;
  unint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_contentCollectionResults);
  swift_beginAccess();
  uint64_t v10 = *v9;
  unint64_t v11 = *(void *)(*v9 + 16);
  if (v11)
  {
    v41[0] = v11 - 1;
    if ((~*(void *)(v10 + 8 * (v11 - 1) + 32) & 0xF000000000000007) != 0)
    {
      int v40 = 0;
      uint64_t v39 = 100;
      goto LABEL_14;
    }
    uint64_t v42 = *(void *)(v10 + 8 * (v11 - 1) + 32);
    unint64_t v43 = v8;
    unint64_t v44 = v11;
    if (qword_26B3E93D8 != -1) {
      swift_once();
    }
    uint64_t v12 = off_26B3E93D0;
    uint64_t v13 = *(void *)(v4 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 24);
    uint64_t v14 = *(void *)(v4 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_context), v13);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v14 + 8))(v45, v13, v14);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8731C0);
    v41[1] = v41;
    MEMORY[0x270FA5388](v15 - 8);
    uint64_t v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = sub_260532610();
    uint64_t v19 = *(void *)(v18 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a3, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v18);
    unsigned int v20 = v45[0];
    unsigned int v21 = HIDWORD(v45[0]);
    uint64_t v22 = qword_26A872138;
    swift_bridgeObjectRetain();
    if (v22 != -1) {
      swift_once();
    }
    unint64_t v23 = (void *)(qword_26A8731B0 + 16);
    uint64_t v24 = (os_unfair_lock_s *)(qword_26A8731B0 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(qword_26A8731B0 + 24));
    sub_2604E02EC(v23, &v46);
    os_unfair_lock_unlock(v24);
    uint64_t v25 = v46;
    uint64_t v26 = mach_continuous_time();
    *(void *)&long long v46 = v25;
    *((void *)&v46 + 1) = __PAIR64__(v21, v20);
    *(void *)&long long v47 = a1;
    *((void *)&v47 + 1) = a2;
    uint64_t v48 = v26;
    MEMORY[0x270FA5388](v26);
    LODWORD(v41[-8]) = v20;
    HIDWORD(v41[-8]) = v21;
    v41[-7] = a1;
    v41[-6] = a2;
    v41[-5] = v17;
    v41[-4] = v45;
    unint64_t v28 = (uint64_t *)&v27[4];
    unint64_t v29 = v27 + 8;
    v41[-3] = v12;
    uint64_t v39 = (uint64_t)&v46;
    os_unfair_lock_lock(v27 + 8);
    sub_2604E4A2C(v28);
    os_unfair_lock_unlock(v29);
    sub_2604E49CC((uint64_t)v17);
    sub_260470850((uint64_t)v45);
    type metadata accessor for IntelligenceElement.AsyncContent();
    uint64_t v30 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A873460);
    uint64_t v31 = swift_allocObject();
    *(_DWORD *)(v31 + 32) = 0;
    *(unsigned char *)(v31 + 16) = 0;
    *(void *)(v31 + 24) = v42;
    long long v32 = v47;
    *(_OWORD *)(v30 + 16) = v46;
    *(_OWORD *)(v30 + 32) = v32;
    *(void *)(v30 + 48) = v48;
    unint64_t v33 = v43;
    *(void *)(v30 + 56) = v43;
    *(void *)(v30 + 64) = v31;
    swift_beginAccess();
    char v34 = (void *)*v9;
    sub_2604761F8(v33);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *unint64_t v9 = (uint64_t)v34;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v34 = sub_2604F3320(v34);
      *unint64_t v9 = (uint64_t)v34;
    }
    if (v44 <= v34[2])
    {
      char v36 = &v34[v41[0]];
      unint64_t v37 = v36[4];
      v36[4] = v30;
      swift_endAccess();
      sub_260482364(v37);
      return v30;
    }
    __break(1u);
  }
  int v40 = 0;
  uint64_t v39 = 98;
LABEL_14:
  uint64_t result = sub_260532D50();
  __break(1u);
  return result;
}

uint64_t UIIntelligenceElementCollector.performElementCollection(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementCollectionResults;
  swift_beginAccess();
  uint64_t v6 = *(void **)v5;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v6 = sub_2604580C4(0, v6[2] + 1, 1, v6);
    *(void *)uint64_t v5 = v6;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t v6 = sub_2604580C4((void *)(v8 > 1), v9 + 1, 1, v6);
    *(void *)uint64_t v5 = v6;
  }
  v6[2] = v9 + 1;
  uint64_t v10 = &v6[9 * v9];
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  v10[12] = 0;
  uint64_t v11 = swift_endAccess();
  a1(v11);
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)v5 + 16))
  {
    sub_2604F35A8((uint64_t)&v19);
    uint64_t v13 = v22;
    if (v22 == 1)
    {
      sub_2604F343C(*(void *)(*(void *)v5 + 16) - 1, (uint64_t)&v19);
      long long v16 = v19;
      long long v17 = v20;
      uint64_t v14 = v21;
      uint64_t v13 = v22;
      long long v18 = v23;
      uint64_t v15 = v24;
    }
    else
    {
      uint64_t v15 = v24;
      uint64_t v14 = v21;
      long long v17 = v20;
      long long v18 = v23;
      long long v16 = v19;
    }
    uint64_t result = swift_endAccess();
    *(_OWORD *)a2 = v16;
    *(_OWORD *)(a2 + 16) = v17;
    *(void *)(a2 + 32) = v14;
    *(void *)(a2 + 40) = v13;
    *(_OWORD *)(a2 + 48) = v18;
    *(void *)(a2 + 64) = v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t UIIntelligenceElementCollector.collect(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = *((unsigned __int8 *)a1 + 56);
  uint64_t v24 = a1[8];
  unint64_t v25 = a1[4];
  uint64_t v9 = v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementCollectionResults;
  swift_beginAccess();
  unint64_t v10 = *(void *)(*(void *)v9 + 16);
  if (v10 && !*(void *)(*(void *)v9 + 72 * (v10 - 1) + 72))
  {
    swift_beginAccess();
    uint64_t v11 = *(void **)v9;
    sub_2604761F8(v25);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v9 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v11 = sub_2604F3334(v11);
      *(void *)uint64_t v9 = v11;
    }
    if (v10 <= v11[2])
    {
      uint64_t v13 = &v11[9 * v10 - 9];
      uint64_t v14 = v13[4];
      uint64_t v15 = v13[5];
      uint64_t v16 = v2;
      uint64_t v17 = v13[6];
      uint64_t v18 = v13[7];
      uint64_t v19 = v3;
      uint64_t v20 = v4;
      unint64_t v21 = v13[8];
      uint64_t v22 = v13[9];
      v13[4] = v16;
      v13[5] = v19;
      v13[6] = v20;
      v13[7] = v5;
      v13[8] = v25;
      v13[9] = v6;
      v13[10] = v7;
      v13[11] = v8;
      v13[12] = v24;
      swift_endAccess();
      return sub_2604F362C(v14, v15, v17, v18, v21, v22);
    }
    __break(1u);
  }
  uint64_t result = sub_260532D50();
  __break(1u);
  return result;
}

uint64_t UIIntelligenceElementCollector.performElementArrayCollection(_:)(void (*a1)(uint64_t))
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementArrayCollectionResults;
  swift_beginAccess();
  uint64_t v4 = *(void **)v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v3 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_2604581F0(0, v4[2] + 1, 1, v4);
    *(void *)uint64_t v3 = v4;
  }
  unint64_t v7 = v4[2];
  unint64_t v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_2604581F0((void *)(v6 > 1), v7 + 1, 1, v4);
    *(void *)uint64_t v3 = v4;
  }
  v4[2] = v7 + 1;
  v4[v7 + 4] = MEMORY[0x263F8EE78];
  uint64_t v8 = swift_endAccess();
  a1(v8);
  swift_beginAccess();
  uint64_t v9 = *(void **)v3;
  if (!*(void *)(*(void *)v3 + 16))
  {
    __break(1u);
LABEL_10:
    uint64_t result = (uint64_t)sub_2604F3348(v9);
    uint64_t v9 = (void *)result;
    uint64_t v11 = *(void *)(result + 16);
    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v11 = v9[2];
  if (v11)
  {
LABEL_8:
    uint64_t v12 = v11 - 1;
    uint64_t v13 = v9[v12 + 4];
    v9[2] = v12;
    *(void *)uint64_t v3 = v9;
    swift_endAccess();
    return v13;
  }
LABEL_11:
  __break(1u);
  return result;
}

Swift::Void __swiftcall UIIntelligenceElementCollector.collect(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21UIIntelligenceSupport30UIIntelligenceElementCollector_elementArrayCollectionResults;
  swift_beginAccess();
  unint64_t v4 = *(void *)(*(void *)v3 + 16);
  if (v4 && !*(void *)(*(void *)(*(void *)v3 + 8 * (v4 - 1) + 32) + 16))
  {
    swift_beginAccess();
    uint64_t v5 = *(void **)v3;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v3 = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v5 = sub_2604F3348(v5);
      *(void *)uint64_t v3 = v5;
    }
    if (v4 <= v5[2])
    {
      v5[v4 + 3] = a1._rawValue;
      swift_endAccess();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
  sub_260532D50();
  __break(1u);
}

id UIIntelligenceElementCollector.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void UIIntelligenceElementCollector.init()()
{
}

id UIIntelligenceElementCollector.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_2604F3320(void *a1)
{
  return sub_260457FB4(0, a1[2], 0, a1);
}

void *sub_2604F3334(void *a1)
{
  return sub_2604580C4(0, a1[2], 0, a1);
}

void *sub_2604F3348(void *a1)
{
  return sub_2604581F0(0, a1[2], 0, a1);
}

uint64_t sub_2604F335C@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_2604F3320(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = &v5[a1];
    uint64_t v10 = v8[4];
    uint64_t v9 = v8 + 4;
    *a2 = v10;
    uint64_t v11 = v6 - 1 - a1;
    if (v11 >= 0)
    {
      uint64_t result = (uint64_t)memmove(v9, v9 + 1, 8 * v11);
      v5[2] = v7;
      *objc_super v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_260532DA0();
  __break(1u);
  return result;
}

uint64_t sub_2604F343C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_2604F3334(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = &v5[9 * a1];
    long long v10 = *((_OWORD *)v8 + 2);
    uint64_t v9 = v8 + 4;
    uint64_t v11 = v9[8];
    long long v12 = *((_OWORD *)v9 + 1);
    long long v13 = *((_OWORD *)v9 + 2);
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v12;
    long long v14 = *((_OWORD *)v9 + 3);
    *(_OWORD *)(a2 + 32) = v13;
    *(_OWORD *)(a2 + 48) = v14;
    *(void *)(a2 + 64) = v11;
    if ((uint64_t)(v7 - a1) >= 0)
    {
      uint64_t result = (uint64_t)memmove(v9, v9 + 9, 72 * (v7 - a1));
      v5[2] = v7;
      *objc_super v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_260532DA0();
  __break(1u);
  return result;
}

uint64_t sub_2604F3538@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v5 = v3[2];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = v5 - 1;
      *a1 = v3[v6 + 4];
      v3[2] = v6;
      *id v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2604F3320(v3);
    uint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2604F35A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v5 = v3[2];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = v5 - 1;
      unint64_t v7 = &v3[9 * v6];
      uint64_t v8 = v7[12];
      long long v9 = *((_OWORD *)v7 + 3);
      *(_OWORD *)a1 = *((_OWORD *)v7 + 2);
      *(_OWORD *)(a1 + 16) = v9;
      long long v10 = *((_OWORD *)v7 + 5);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)v7 + 4);
      *(_OWORD *)(a1 + 48) = v10;
      *(void *)(a1 + 64) = v8;
      v3[2] = v6;
      *id v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2604F3334(v3);
    uint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2604F362C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  if (a6)
  {
    sub_260476280(a5);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for UIIntelligenceElementCollector()
{
  return self;
}

uint64_t method lookup function for UIIntelligenceElementCollector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIIntelligenceElementCollector);
}

uint64_t dispatch thunk of UIIntelligenceElementCollector.__allocating_init(context:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_2604F36CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_2604F36D4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2604F3764(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_2604F381C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_2604F3848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_2604F3898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_2604F38E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_2604F3938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_2604F3988(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_2604F3AE4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x2604F3CFCLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for UIIntelligenceElementCollector.CollectionResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2604F3D6C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_2604F3D80(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

char *sub_2604F3D94(int a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873468);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260534390;
  *(void *)(inited + 32) = sub_260532760();
  *(void *)(inited + 40) = v5;
  uint64_t result = strerror(a1);
  if (result)
  {
    uint64_t v7 = MEMORY[0x261211F70]();
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    if (!v8)
    {
      sub_260532CB0();
      swift_bridgeObjectRelease();
      *(void *)&long long v28 = 0xD000000000000013;
      *((void *)&v28 + 1) = 0x8000000260543130;
      LODWORD(v27[0]) = a1;
      sub_260532F80();
      sub_260532840();
      swift_bridgeObjectRelease();
      uint64_t v7 = 0xD000000000000013;
      unint64_t v8 = 0x8000000260543130;
    }
    *(void *)(inited + 48) = v7;
    *(void *)(inited + 56) = v8;
    unint64_t v9 = sub_26045E128(inited);
    uint64_t v10 = sub_2605321D0();
    uint64_t v11 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v10);
    int v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
    MEMORY[0x270FA5388](v14 - 8);
    uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2604F4118(a2, (uint64_t)v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
    {
      sub_2604F4180((uint64_t)v16);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
      uint64_t v17 = sub_260532760();
      uint64_t v19 = v18;
      uint64_t v29 = v10;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v28);
      (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(boxed_opaque_existential_0, v13, v10);
      sub_2604678B8(&v28, v27);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v26 = v9;
      sub_2604F55D4(v27, v17, v19, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    id v22 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    id v23 = (id)*MEMORY[0x263F08430];
    uint64_t v24 = (void *)sub_260532630();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v22, sel_initWithDomain_code_userInfo_, v23, a1, v24);

    sub_2604F4180(a2);
    return (char *)v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2604F4118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604F4180(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2604F4244(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872360);
  uint64_t v6 = sub_260532D80();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v34 = (void *)(v5 + 64);
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
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_2604678B8(v24, v35);
      }
      else
      {
        sub_2604E64B0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_260533080();
      sub_260532810();
      uint64_t result = sub_2605330E0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_2604678B8(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2604F4544(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872380);
  char v44 = a2;
  char v45 = (void *)sub_260532D80();
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v41 = (void *)(v4 + 64);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v4 + 64);
    int64_t v40 = (unint64_t)(v5 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v9 = 0;
    uint64_t v43 = v4;
    while (1)
    {
      if (v7)
      {
        uint64_t v46 = (v7 - 1) & v7;
        int64_t v47 = v9;
        unint64_t v13 = __clz(__rbit64(v7)) | (v9 << 6);
      }
      else
      {
        int64_t v14 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v14 >= v40) {
          goto LABEL_23;
        }
        unint64_t v15 = v41[v14];
        int64_t v16 = v9 + 1;
        if (!v15)
        {
          int64_t v16 = v9 + 2;
          if (v9 + 2 >= v40) {
            goto LABEL_23;
          }
          unint64_t v15 = v41[v16];
          if (!v15)
          {
            uint64_t v17 = v9 + 3;
            if (v9 + 3 >= v40)
            {
LABEL_23:
              swift_release();
              if (v44)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v4 + 32);
                if (v38 > 63) {
                  bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v41 = -1 << v38;
                }
                *(void *)(v4 + 16) = 0;
              }
              break;
            }
            unint64_t v15 = v41[v17];
            if (!v15)
            {
              while (1)
              {
                int64_t v16 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_30;
                }
                if (v16 >= v40) {
                  goto LABEL_23;
                }
                unint64_t v15 = v41[v16];
                ++v17;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v16 = v9 + 3;
          }
        }
LABEL_20:
        uint64_t v46 = (v15 - 1) & v15;
        int64_t v47 = v16;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
      }
      uint64_t v18 = *(void *)(v4 + 56);
      uint64_t v19 = *(void *)(v4 + 48) + 112 * v13;
      uint64_t v20 = *(void *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v22 = *(void *)(v19 + 16);
      char v23 = *(unsigned char *)(v19 + 24);
      uint64_t v24 = *(void *)(v19 + 32);
      char v25 = *(unsigned char *)(v19 + 40);
      uint64_t v26 = *(void *)(v19 + 48);
      char v27 = *(unsigned char *)(v19 + 56);
      uint64_t v28 = *(void *)(v19 + 64);
      char v29 = *(unsigned char *)(v19 + 72);
      uint64_t v30 = *(void *)(v19 + 80);
      uint64_t v31 = *(void *)(v19 + 88);
      uint64_t v32 = *(void *)(v19 + 96);
      char v33 = *(unsigned char *)(v19 + 104);
      uint64_t v34 = *(void *)(v18 + 8 * v13);
      uint64_t v52 = v28;
      uint64_t v53 = v30;
      if ((v44 & 1) == 0)
      {
        char v35 = v33;
        uint64_t v50 = v24;
        char v36 = v23;
        uint64_t v42 = v22;
        uint64_t v37 = v20;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v20 = v37;
        uint64_t v22 = v42;
        char v23 = v36;
        uint64_t v24 = v50;
        char v33 = v35;
      }
      char v48 = v27;
      char v49 = v29;
      char v51 = v33;
      char v10 = v23;
      uint64_t v11 = v20;
      sub_260533080();
      IntelligenceImage.Representation.hash(into:)();
      sub_2605330E0();
      unint64_t result = sub_260532BE0();
      *(void *)((char *)v45 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v12 = v45[6] + 112 * result;
      *(void *)uint64_t v12 = v11;
      *(void *)(v12 + 8) = v21;
      *(void *)(v12 + 16) = v22;
      *(unsigned char *)(v12 + 24) = v10;
      *(void *)(v12 + 32) = v24;
      *(unsigned char *)(v12 + 40) = v25;
      *(void *)(v12 + 48) = v26;
      *(unsigned char *)(v12 + 56) = v48;
      *(void *)(v12 + 64) = v52;
      *(unsigned char *)(v12 + 72) = v49;
      *(void *)(v12 + 80) = v53;
      *(void *)(v12 + 88) = v31;
      *(void *)(v12 + 96) = v32;
      *(unsigned char *)(v12 + 104) = v51;
      *(void *)(v45[7] + 8 * result) = v34;
      ++v45[2];
      uint64_t v4 = v43;
      unint64_t v7 = v46;
      int64_t v9 = v47;
    }
  }
  unint64_t result = swift_release();
  *uint64_t v39 = v45;
  return result;
}

uint64_t sub_2604F48F8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872390);
  uint64_t v6 = sub_260532D80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v33 = v2;
  uint64_t v34 = v5 + 64;
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
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v34 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    uint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    char v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if (a2)
    {
      sub_2604678B8(v23, v35);
    }
    else
    {
      sub_2604E64B0((uint64_t)v23, (uint64_t)v35);
      id v24 = v22;
    }
    sub_260533080();
    type metadata accessor for CFString(0);
    sub_2604F6C9C();
    sub_260532310();
    uint64_t result = sub_2605330E0();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v7 + 48) + 8 * v15) = v22;
    uint64_t result = (uint64_t)sub_2604678B8(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  uint64_t v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2604F4C04(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for IntelligenceElement.StorageValue();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871FB8);
  int v38 = a2;
  uint64_t result = sub_260532D80();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v34 = v2;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    char v36 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v35 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v19 = v18 | (v11 << 6);
      }
      else
      {
        int64_t v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v36;
        if (v20 >= v35) {
          goto LABEL_34;
        }
        unint64_t v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          int64_t v11 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v21 = v36[v11];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_41;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v8 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v36 = -1 << v33;
              }
              uint64_t v3 = v34;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v11 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v21 = v36[v11];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v22;
          }
        }
LABEL_21:
        unint64_t v15 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      char v23 = *(unsigned char *)(*(void *)(v8 + 48) + v19);
      uint64_t v24 = *(void *)(v37 + 72);
      uint64_t v25 = *(void *)(v8 + 56) + v24 * v19;
      if (v38) {
        sub_2604F6C38(v25, (uint64_t)v7);
      }
      else {
        sub_26047EFD0(v25, (uint64_t)v7);
      }
      sub_260533080();
      sub_2605330A0();
      uint64_t result = sub_2605330E0();
      uint64_t v26 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v10 + 48) + v17) = v23;
      uint64_t result = sub_2604F6C38((uint64_t)v7, *(void *)(v10 + 56) + v24 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_2604F4F6C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8820);
  char v35 = a2;
  uint64_t result = sub_260532D80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v34[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v34[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v34[v8];
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
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v37 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      uint64_t v28 = *(void *)(v5 + 56) + 40 * v20;
      long long v36 = *(_OWORD *)v28;
      uint64_t v29 = *(void *)(v28 + 16);
      uint64_t v30 = *(void *)(v28 + 24);
      uint64_t v31 = *(void *)(v28 + 32);
      if ((v35 & 1) == 0)
      {
        swift_retain();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_260533080();
      sub_2605330D0();
      uint64_t result = sub_2605330E0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        uint64_t v17 = v37;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        uint64_t v17 = v37;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v17;
      uint64_t v18 = *(void *)(v7 + 56) + 40 * v16;
      *(_OWORD *)uint64_t v18 = v36;
      *(void *)(v18 + 16) = v29;
      *(void *)(v18 + 24) = v30;
      *(void *)(v18 + 32) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2604F52B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873470);
  char v39 = a2;
  uint64_t result = sub_260532D80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v37 = (void *)(v5 + 64);
    uint64_t v38 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v37;
        if (v20 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = v37[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v21 = v37[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v36)
            {
LABEL_33:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v37 = -1 << v35;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v37[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v21 = v37[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(v5 + 56);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 48) + 40 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      uint64_t v31 = v28[2];
      uint64_t v32 = v28[3];
      uint64_t v33 = v28[4];
      uint64_t v34 = *(void *)(v27 + 8 * v19);
      if ((v39 & 1) == 0)
      {
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_260533080();
      sub_2605330A0();
      uint64_t result = sub_2605330E0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = (void *)(*(void *)(v7 + 48) + 40 * v16);
      *uint64_t v17 = v29;
      v17[1] = v30;
      v17[2] = v31;
      v17[3] = v32;
      v17[4] = v33;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v34;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v38;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_2604F55D4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_26047F11C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2604F5FD8();
      goto LABEL_7;
    }
    sub_2604F4244(v15, a4 & 1);
    unint64_t v21 = sub_26047F11C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_260533020();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_2604678B8(a1, v19);
  }
LABEL_13:
  sub_2604F5E18(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_2604F5728(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_26047F194((uint64_t *)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2604F61C0();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2604F4544(v13, a3 & 1);
  unint64_t v19 = sub_26047F194((uint64_t *)a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_17:
    uint64_t result = sub_260533020();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  char v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  unint64_t v21 = (_OWORD *)(v16[6] + 112 * v10);
  long long v23 = *(_OWORD *)(a2 + 16);
  long long v22 = *(_OWORD *)(a2 + 32);
  *unint64_t v21 = *(_OWORD *)a2;
  v21[1] = v23;
  v21[2] = v22;
  long long v24 = *(_OWORD *)(a2 + 48);
  long long v25 = *(_OWORD *)(a2 + 64);
  long long v26 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)((char *)v21 + 89) = *(_OWORD *)(a2 + 89);
  v21[4] = v25;
  v21[5] = v26;
  v21[3] = v24;
  *(void *)(v16[7] + 8 * v10) = a1;
  uint64_t v27 = v16[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v29;

  return sub_260467BF8(a2);
}

_OWORD *sub_2604F58B4(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_26047F224((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_2604F63E8();
      goto LABEL_7;
    }
    sub_2604F48F8(v12, a3 & 1);
    unint64_t v18 = sub_26047F224((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for CFString(0);
    uint64_t result = (_OWORD *)sub_260533020();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    char v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_2604678B8(a1, v16);
  }
LABEL_13:
  sub_2604F5E84(v9, (uint64_t)a2, a1, v15);

  return a2;
}

uint64_t sub_2604F59F8(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v10 = sub_26047EF64(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2604F65B0();
      goto LABEL_7;
    }
    sub_2604F4C04(v13, a3 & 1);
    unint64_t v20 = sub_26047EF64(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_260533020();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for IntelligenceElement.StorageValue() - 8) + 72) * v10;
    return sub_2604F6BD4(a1, v18);
  }
LABEL_13:

  return sub_2604F5EEC(v10, a2, a1, v16);
}

unint64_t sub_2604F5B44(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v10 = sub_26047F2D8(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    char v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 40 * v10;
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = swift_release();
      long long v19 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)a1;
      *(_OWORD *)(v17 + 16) = v19;
      *(void *)(v17 + 32) = *(void *)(a1 + 32);
      return result;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2604F6800();
    goto LABEL_7;
  }
  sub_2604F4F6C(v13, a3 & 1);
  unint64_t v20 = sub_26047F2D8(a2);
  if ((v14 & 1) != (v21 & 1))
  {
LABEL_15:
    unint64_t result = sub_260533020();
    __break(1u);
    return result;
  }
  unint64_t v10 = v20;
  char v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:

  return sub_2604F5F80(v10, a2, a1, v16);
}

uint64_t sub_2604F5CA4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_26047F344((uint64_t *)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2604F6A00();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2604F52B4(v13, a3 & 1);
  unint64_t v19 = sub_26047F344((uint64_t *)a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_17:
    uint64_t result = sub_260533020();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  char v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v21 = v16[6] + 40 * v10;
  long long v22 = *(_OWORD *)a2;
  long long v23 = *(_OWORD *)(a2 + 16);
  *(void *)(v21 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)uint64_t v21 = v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v16[7] + 8 * v10) = a1;
  uint64_t v24 = v16[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v26;

  return sub_2604E4E90(a2);
}

_OWORD *sub_2604F5E18(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_2604678B8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

_OWORD *sub_2604F5E84(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_2604678B8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_2604F5EEC(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for IntelligenceElement.StorageValue();
  uint64_t result = sub_2604F6C38(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_2604F5F80(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  uint64_t v4 = a4[7] + 40 * result;
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 16) = v5;
  *(void *)(v4 + 32) = *(void *)(a3 + 32);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void *sub_2604F5FD8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872360);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260532D70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_2604E64B0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_2604678B8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2604F61C0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872380);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260532D70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v33 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v33 >= v13) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v6 + 8 * v33);
    ++v9;
    if (!v34)
    {
      int64_t v9 = v33 + 1;
      if (v33 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v34 = *(void *)(v6 + 8 * v9);
      if (!v34) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v34 - 1) & v34;
    unint64_t v15 = __clz(__rbit64(v34)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 112 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 112 * v15;
    char v18 = *(unsigned char *)(v17 + 24);
    uint64_t v19 = *(void *)(v17 + 32);
    char v20 = *(unsigned char *)(v17 + 40);
    uint64_t v21 = *(void *)(v17 + 48);
    char v22 = *(unsigned char *)(v17 + 56);
    uint64_t v23 = *(void *)(v17 + 64);
    char v24 = *(unsigned char *)(v17 + 72);
    uint64_t v25 = *(void *)(v17 + 80);
    uint64_t v26 = *(void *)(v17 + 88);
    uint64_t v27 = *(void *)(v17 + 96);
    char v28 = *(unsigned char *)(v17 + 104);
    uint64_t v29 = 8 * v15;
    uint64_t v30 = *(void *)(*(void *)(v2 + 56) + v29);
    uint64_t v31 = *(void *)(v4 + 48) + v16;
    long long v32 = *(_OWORD *)(v17 + 8);
    *(void *)uint64_t v31 = *(void *)v17;
    *(_OWORD *)(v31 + 8) = v32;
    *(unsigned char *)(v31 + 24) = v18;
    *(void *)(v31 + 32) = v19;
    *(unsigned char *)(v31 + 40) = v20;
    *(void *)(v31 + 48) = v21;
    *(unsigned char *)(v31 + 56) = v22;
    *(void *)(v31 + 64) = v23;
    *(unsigned char *)(v31 + 72) = v24;
    *(void *)(v31 + 80) = v25;
    *(void *)(v31 + 88) = v26;
    *(void *)(v31 + 96) = v27;
    *(unsigned char *)(v31 + 104) = v28;
    *(void *)(*(void *)(v4 + 56) + v29) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v35 = v33 + 2;
  if (v35 >= v13) {
    goto LABEL_26;
  }
  unint64_t v34 = *(void *)(v6 + 8 * v35);
  if (v34)
  {
    int64_t v9 = v35;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v6 + 8 * v9);
    ++v35;
    if (v34) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2604F63E8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A872390);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260532D70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_2604E64B0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_2604678B8(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2604F65B0()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IntelligenceElement.StorageValue();
  uint64_t v24 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871FB8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_260532D70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v23 = v1;
  id result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v15) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v9 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v9 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    char v18 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
    unint64_t v19 = *(void *)(v24 + 72) * v17;
    sub_26047EFD0(*(void *)(v5 + 56) + v19, (uint64_t)v4);
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v18;
    id result = (void *)sub_2604F6C38((uint64_t)v4, *(void *)(v7 + 56) + v19);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v15)
  {
LABEL_23:
    id result = (void *)swift_release();
    unint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v9 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v9 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2604F6800()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8820);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260532D70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = 40 * v15;
    uint64_t v18 = *(void *)(v2 + 56) + v17;
    uint64_t v20 = *(void *)(v18 + 16);
    uint64_t v19 = *(void *)(v18 + 24);
    uint64_t v21 = *(void *)(v18 + 32);
    long long v22 = *(_OWORD *)v18;
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    uint64_t v23 = *(void *)(v4 + 56) + v17;
    *(_OWORD *)uint64_t v23 = v22;
    *(void *)(v23 + 16) = v20;
    *(void *)(v23 + 24) = v19;
    *(void *)(v23 + 32) = v21;
    swift_retain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2604F6A00()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873470);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260532D70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 40 * v15);
    uint64_t v18 = v17[2];
    uint64_t v19 = v17[3];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = v17[4];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    uint64_t v24 = v17[1];
    *uint64_t v23 = *v17;
    v23[1] = v24;
    v23[2] = v18;
    v23[3] = v19;
    v23[4] = v22;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_unknownObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2604F6BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceElement.StorageValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604F6C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceElement.StorageValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2604F6C9C()
{
  unint64_t result = qword_26A872628;
  if (!qword_26A872628)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A872628);
  }
  return result;
}

unint64_t static IntelligenceSupportAgentXPCConstants.machService.getter()
{
  return 0xD000000000000025;
}

uint64_t XPCClientMessage.TransferFragments.fragments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t XPCClientMessage.TransferFragments.fragments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*XPCClientMessage.TransferFragments.fragments.modify())()
{
  return nullsub_1;
}

uint64_t XPCClientMessage.TransferFragments.signpostState.getter()
{
  return swift_retain();
}

uint64_t XPCClientMessage.TransferFragments.signpostState.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*XPCClientMessage.TransferFragments.signpostState.modify())()
{
  return nullsub_1;
}

uint64_t sub_2604F6DB8()
{
  if (*v0) {
    return 0x74736F706E676973;
  }
  else {
    return 0x746E656D67617266;
  }
}

uint64_t sub_2604F6E04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604FA0B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2604F6E2C(uint64_t a1)
{
  unint64_t v2 = sub_2604F800C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F6E68(uint64_t a1)
{
  unint64_t v2 = sub_2604F800C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604F6EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604FA1D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2604F6ECC(uint64_t a1)
{
  unint64_t v2 = sub_260454D48();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F6F08(uint64_t a1)
{
  unint64_t v2 = sub_260454D48();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604F6F44(uint64_t a1)
{
  unint64_t v2 = sub_260454C34();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F6F80(uint64_t a1)
{
  unint64_t v2 = sub_260454C34();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604F6FBC(uint64_t a1)
{
  unint64_t v2 = sub_2604F77A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F6FF8(uint64_t a1)
{
  unint64_t v2 = sub_2604F77A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604F7034(uint64_t a1)
{
  unint64_t v2 = sub_2604F76BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F7070(uint64_t a1)
{
  unint64_t v2 = sub_2604F76BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t XPCAgentMessage.RequestFragments.request.getter@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(v1 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(v1 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(v1 + 27);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(v1 + 28);
  *(unsigned char *)(a1 + 29) = *(unsigned char *)(v1 + 29);
  *(unsigned char *)(a1 + 30) = *(unsigned char *)(v1 + 30);
  *(unsigned char *)(a1 + 31) = *(unsigned char *)(v1 + 31);
  *(void *)(a1 + 32) = *(void *)(v1 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(v1 + 41);
  *(void *)(a1 + 48) = *(void *)(v1 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(v1 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(v1 + 57);
  *(void *)(a1 + 64) = *(void *)(v1 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(v1 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(v1 + 73);
  *(_WORD *)(a1 + 74) = *(_WORD *)(v1 + 74);
  *(_WORD *)(a1 + 88) = *(_WORD *)(v1 + 88);
  *(unsigned char *)(a1 + 90) = *(unsigned char *)(v1 + 90);
  *(unsigned char *)(a1 + 91) = *(unsigned char *)(v1 + 91);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(v1 + 92);
  *(unsigned char *)(a1 + 93) = *(unsigned char *)(v1 + 93);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(v1 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(v1 + 105);
  *(unsigned char *)(a1 + 106) = *(unsigned char *)(v1 + 106);
  *(unsigned char *)(a1 + 107) = *(unsigned char *)(v1 + 107);
  *(unsigned char *)(a1 + 108) = *(unsigned char *)(v1 + 108);
  uint64_t v2 = *(void *)(v1 + 80);
  *(void *)a1 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 96);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(void *)(a1 + 80) = v2;
  *(void *)(a1 + 96) = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

double XPCAgentMessage.RequestFragments.request.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  char v5 = *(unsigned char *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 25);
  char v7 = *(unsigned char *)(a1 + 26);
  char v8 = *(unsigned char *)(a1 + 27);
  char v9 = *(unsigned char *)(a1 + 28);
  char v34 = *(unsigned char *)(a1 + 30);
  char v35 = *(unsigned char *)(a1 + 29);
  char v33 = *(unsigned char *)(a1 + 31);
  uint64_t v32 = *(void *)(a1 + 32);
  char v31 = *(unsigned char *)(a1 + 40);
  char v30 = *(unsigned char *)(a1 + 41);
  uint64_t v29 = *(void *)(a1 + 48);
  char v27 = *(unsigned char *)(a1 + 57);
  char v28 = *(unsigned char *)(a1 + 56);
  uint64_t v26 = *(void *)(a1 + 64);
  char v24 = *(unsigned char *)(a1 + 73);
  char v25 = *(unsigned char *)(a1 + 72);
  __int16 v23 = *(_WORD *)(a1 + 74);
  uint64_t v22 = *(void *)(a1 + 80);
  char v20 = *(unsigned char *)(a1 + 90);
  __int16 v21 = *(_WORD *)(a1 + 88);
  char v18 = *(unsigned char *)(a1 + 92);
  char v19 = *(unsigned char *)(a1 + 91);
  char v17 = *(unsigned char *)(a1 + 93);
  uint64_t v16 = *(void *)(a1 + 96);
  char v14 = *(unsigned char *)(a1 + 105);
  char v15 = *(unsigned char *)(a1 + 104);
  char v12 = *(unsigned char *)(a1 + 107);
  char v13 = *(unsigned char *)(a1 + 106);
  char v11 = *(unsigned char *)(a1 + 108);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double result = *(double *)a1;
  *(void *)(v1 + 8) = v3;
  *(void *)(v1 + 16) = v4;
  *(double *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 24) = v5;
  *(unsigned char *)(v1 + 25) = v6;
  *(unsigned char *)(v1 + 26) = v7;
  *(unsigned char *)(v1 + 27) = v8;
  *(unsigned char *)(v1 + 28) = v9;
  *(unsigned char *)(v1 + 29) = v35;
  *(unsigned char *)(v1 + 30) = v34;
  *(unsigned char *)(v1 + 31) = v33;
  *(void *)(v1 + 32) = v32;
  *(unsigned char *)(v1 + 40) = v31;
  *(unsigned char *)(v1 + 41) = v30;
  *(void *)(v1 + 48) = v29;
  *(unsigned char *)(v1 + 56) = v28;
  *(unsigned char *)(v1 + 57) = v27;
  *(void *)(v1 + 64) = v26;
  *(unsigned char *)(v1 + 72) = v25;
  *(unsigned char *)(v1 + 73) = v24;
  *(_WORD *)(v1 + 74) = v23;
  *(void *)(v1 + 80) = v22;
  *(_WORD *)(v1 + 88) = v21;
  *(unsigned char *)(v1 + 90) = v20;
  *(unsigned char *)(v1 + 91) = v19;
  *(unsigned char *)(v1 + 92) = v18;
  *(unsigned char *)(v1 + 93) = v17;
  *(void *)(v1 + 96) = v16;
  *(unsigned char *)(v1 + 104) = v15;
  *(unsigned char *)(v1 + 105) = v14;
  *(unsigned char *)(v1 + 106) = v13;
  *(unsigned char *)(v1 + 107) = v12;
  *(unsigned char *)(v1 + 108) = v11;
  return result;
}

uint64_t (*XPCAgentMessage.RequestFragments.request.modify())()
{
  return nullsub_1;
}

double XPCAgentMessage.RequestFragments.init(request:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + 24) = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a2 + 25) = *(unsigned char *)(a1 + 25);
  *(unsigned char *)(a2 + 26) = *(unsigned char *)(a1 + 26);
  *(unsigned char *)(a2 + 27) = *(unsigned char *)(a1 + 27);
  *(unsigned char *)(a2 + 28) = *(unsigned char *)(a1 + 28);
  *(unsigned char *)(a2 + 29) = *(unsigned char *)(a1 + 29);
  *(unsigned char *)(a2 + 30) = *(unsigned char *)(a1 + 30);
  *(unsigned char *)(a2 + 31) = *(unsigned char *)(a1 + 31);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(unsigned char *)(a2 + 40) = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a2 + 41) = *(unsigned char *)(a1 + 41);
  *(void *)(a2 + 48) = *(void *)(a1 + 48);
  *(unsigned char *)(a2 + 56) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a2 + 57) = *(unsigned char *)(a1 + 57);
  *(void *)(a2 + 64) = *(void *)(a1 + 64);
  *(unsigned char *)(a2 + 72) = *(unsigned char *)(a1 + 72);
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(a1 + 73);
  *(_WORD *)(a2 + 74) = *(_WORD *)(a1 + 74);
  *(void *)(a2 + 80) = *(void *)(a1 + 80);
  *(_WORD *)(a2 + 88) = *(_WORD *)(a1 + 88);
  *(unsigned char *)(a2 + 90) = *(unsigned char *)(a1 + 90);
  *(unsigned char *)(a2 + 91) = *(unsigned char *)(a1 + 91);
  *(unsigned char *)(a2 + 92) = *(unsigned char *)(a1 + 92);
  *(unsigned char *)(a2 + 93) = *(unsigned char *)(a1 + 93);
  *(void *)(a2 + 96) = *(void *)(a1 + 96);
  *(unsigned char *)(a2 + 104) = *(unsigned char *)(a1 + 104);
  *(unsigned char *)(a2 + 105) = *(unsigned char *)(a1 + 105);
  *(unsigned char *)(a2 + 106) = *(unsigned char *)(a1 + 106);
  *(unsigned char *)(a2 + 107) = *(unsigned char *)(a1 + 107);
  double result = *(double *)a1;
  long long v3 = *(_OWORD *)(a1 + 8);
  *(unsigned char *)(a2 + 108) = *(unsigned char *)(a1 + 108);
  *(double *)a2 = result;
  *(_OWORD *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_2604F750C(uint64_t a1)
{
  unint64_t v2 = sub_2604F9250();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F7548(uint64_t a1)
{
  unint64_t v2 = sub_2604F9250();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2604F7584()
{
  return 0xD000000000000010;
}

uint64_t sub_2604F75A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2604FA358(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2604F75CC(uint64_t a1)
{
  unint64_t v2 = sub_2604F8894();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F7608(uint64_t a1)
{
  unint64_t v2 = sub_2604F8894();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604F7644(uint64_t a1)
{
  unint64_t v2 = sub_2604F88E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604F7680(uint64_t a1)
{
  unint64_t v2 = sub_2604F88E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2604F76BC()
{
  unint64_t result = qword_26B3E8CD8;
  if (!qword_26B3E8CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CD8);
  }
  return result;
}

unint64_t sub_2604F7710()
{
  unint64_t result = qword_26B3E85A0;
  if (!qword_26B3E85A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E85A0);
  }
  return result;
}

unint64_t sub_2604F7764(unint64_t result)
{
  if (result >= 2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_2604F77A8()
{
  unint64_t result = qword_26A871918;
  if (!qword_26A871918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871918);
  }
  return result;
}

uint64_t XPCClientMessage.init(from:)@<X0>(void *a1@<X0>, long long *a2@<X8>)
{
  char v30 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A98);
  uint64_t v29 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  char v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A90);
  uint64_t v28 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  char v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A88);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A78);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_260454D48();
  uint64_t v14 = v34;
  sub_260533100();
  if (v14) {
    goto LABEL_10;
  }
  uint64_t v34 = v6;
  char v15 = v31;
  uint64_t v16 = sub_260532EB0();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v18 = sub_260532CF0();
    swift_allocError();
    char v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    *char v20 = &type metadata for XPCClientMessage;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
LABEL_10:
    uint64_t v21 = (uint64_t)v32;
    return __swift_destroy_boxed_opaque_existential_1(v21);
  }
  if (*(unsigned char *)(v16 + 32))
  {
    if (*(unsigned char *)(v16 + 32) != 1)
    {
      LOBYTE(v33) = 2;
      sub_2604F76BC();
      sub_260532DD0();
      uint64_t v22 = v30;
      sub_2604F7D8C();
      uint64_t v24 = v27;
      sub_260532E70();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t v21 = (uint64_t)v32;
      *uint64_t v22 = v33;
      return __swift_destroy_boxed_opaque_existential_1(v21);
    }
    LOBYTE(v33) = 1;
    sub_2604F77A8();
    sub_260532DD0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    long long v17 = xmmword_260538480;
  }
  else
  {
    LOBYTE(v33) = 0;
    sub_260454C34();
    sub_260532DD0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    long long v17 = 0uLL;
  }
  uint64_t v21 = (uint64_t)v32;
  *char v30 = v17;
  return __swift_destroy_boxed_opaque_existential_1(v21);
}

unint64_t sub_2604F7D8C()
{
  unint64_t result = qword_26A871910;
  if (!qword_26A871910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871910);
  }
  return result;
}

uint64_t sub_2604F7DE0@<X0>(void *a1@<X0>, long long *a2@<X8>)
{
  return XPCClientMessage.init(from:)(a1, a2);
}

uint64_t XPCClientMessage.TransferFragments.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8840);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F800C();
  sub_260533120();
  uint64_t v12 = v8;
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8E28);
  sub_2604F82EC((unint64_t *)&unk_26B3E87F8, &qword_26B3E8768);
  sub_260532F40();
  if (!v2)
  {
    uint64_t v12 = v10;
    char v11 = 1;
    sub_260532470();
    sub_2604F8380(&qword_26B3E87A8, MEMORY[0x263F90248]);
    sub_260532F40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2604F800C()
{
  unint64_t result = qword_26B3E8CC0;
  if (!qword_26B3E8CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CC0);
  }
  return result;
}

uint64_t XPCClientMessage.TransferFragments.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F800C();
  sub_260533100();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8E28);
  char v13 = 0;
  sub_2604F82EC((unint64_t *)&unk_26A871A28, &qword_26A871990);
  sub_260532E70();
  uint64_t v9 = v14;
  sub_260532470();
  char v13 = 1;
  sub_2604F8380(&qword_26A8719D8, MEMORY[0x263F90248]);
  swift_bridgeObjectRetain();
  sub_260532E70();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v14;
  *a2 = v9;
  a2[1] = v10;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2604F82EC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3E8E28);
    sub_2604F8380(a2, (void (*)(uint64_t))type metadata accessor for IntelligenceFragment);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2604F8380(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2604F83C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return XPCClientMessage.TransferFragments.init(from:)(a1, a2);
}

uint64_t sub_2604F83E0(void *a1)
{
  return XPCClientMessage.TransferFragments.encode(to:)(a1);
}

uint64_t XPCAgentMessage.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A871B70);
  uint64_t v4 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B60);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v2[1];
  uint64_t v20 = v2[2];
  int v11 = *((unsigned __int8 *)v2 + 24);
  int v50 = *((unsigned __int8 *)v2 + 25);
  int v51 = v11;
  int v12 = *((unsigned __int8 *)v2 + 26);
  int v48 = *((unsigned __int8 *)v2 + 27);
  int v49 = v12;
  int v13 = *((unsigned __int8 *)v2 + 28);
  int v46 = *((unsigned __int8 *)v2 + 29);
  int v47 = v13;
  int v14 = *((unsigned __int8 *)v2 + 30);
  int v44 = *((unsigned __int8 *)v2 + 31);
  int v45 = v14;
  uint64_t v43 = v2[4];
  int v15 = *((unsigned __int8 *)v2 + 40);
  int v41 = *((unsigned __int8 *)v2 + 41);
  int v42 = v15;
  uint64_t v40 = v2[6];
  int v39 = *((unsigned __int8 *)v2 + 56);
  int v38 = *((unsigned __int8 *)v2 + 57);
  uint64_t v37 = v2[8];
  int v36 = *((unsigned __int8 *)v2 + 72);
  int v35 = *((unsigned __int8 *)v2 + 73);
  int v34 = *((unsigned __int16 *)v2 + 37);
  uint64_t v33 = v2[10];
  int v32 = *((unsigned __int16 *)v2 + 44);
  int v31 = *((unsigned __int8 *)v2 + 90);
  int v30 = *((unsigned __int8 *)v2 + 91);
  int v29 = *((unsigned __int8 *)v2 + 92);
  int v28 = *((unsigned __int8 *)v2 + 93);
  uint64_t v27 = v2[12];
  int v26 = *((unsigned __int8 *)v2 + 104);
  int v25 = *((unsigned __int8 *)v2 + 105);
  int v24 = *((unsigned __int8 *)v2 + 106);
  int v23 = *((unsigned __int8 *)v2 + 107);
  int v22 = *((unsigned __int8 *)v2 + 108);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F8894();
  sub_260533120();
  sub_2604F88E8();
  sub_260532EC0();
  uint64_t v16 = *v2;
  uint64_t v54 = v21;
  uint64_t v55 = v20;
  uint64_t v53 = v16;
  char v56 = v51;
  char v57 = v50;
  char v58 = v49;
  char v59 = v48;
  char v60 = v47;
  char v61 = v46;
  char v62 = v45;
  char v63 = v44;
  uint64_t v64 = v43;
  char v65 = v42;
  char v66 = v41;
  uint64_t v67 = v40;
  char v68 = v39;
  char v69 = v38;
  uint64_t v70 = v37;
  char v71 = v36;
  char v72 = v35;
  __int16 v73 = v34;
  uint64_t v74 = v33;
  __int16 v75 = v32;
  char v76 = v31;
  char v77 = v30;
  char v78 = v29;
  char v79 = v28;
  uint64_t v80 = v27;
  char v81 = v26;
  char v82 = v25;
  char v83 = v24;
  char v84 = v23;
  char v85 = v22;
  sub_2604F893C();
  uint64_t v17 = v52;
  sub_260532F40();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_2604F8894()
{
  unint64_t result = qword_26B3E8C78;
  if (!qword_26B3E8C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8C78);
  }
  return result;
}

unint64_t sub_2604F88E8()
{
  unint64_t result = qword_26B3E8CA8;
  if (!qword_26B3E8CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CA8);
  }
  return result;
}

unint64_t sub_2604F893C()
{
  unint64_t result = qword_26A871908;
  if (!qword_26A871908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871908);
  }
  return result;
}

uint64_t XPCAgentMessage.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  int v47 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8838);
  uint64_t v48 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8828);
  uint64_t v7 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F8894();
  sub_260533100();
  if (v2) {
    goto LABEL_5;
  }
  int v45 = a1;
  uint64_t v46 = v7;
  uint64_t v10 = v81;
  if (*(void *)(sub_260532EB0() + 16) != 1)
  {
    uint64_t v12 = sub_260532CF0();
    swift_allocError();
    int v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    void *v14 = &type metadata for XPCAgentMessage;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCB0], v12);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v10);
    a1 = v45;
LABEL_5:
    uint64_t v44 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v44);
  }
  sub_2604F88E8();
  sub_260532DD0();
  uint64_t v11 = v46;
  sub_2604F8E18();
  sub_260532E70();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v6, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  char v16 = v51;
  char v17 = v52;
  char v18 = v53;
  char v19 = v54;
  char v20 = v55;
  char v21 = v56;
  char v22 = v57;
  char v23 = v58;
  uint64_t v24 = v59;
  char v25 = v60;
  char v26 = v61;
  uint64_t v27 = v62;
  char v28 = v63;
  char v29 = v64;
  uint64_t v30 = v65;
  char v31 = v66;
  char v32 = v67;
  __int16 v33 = v68;
  uint64_t v34 = v69;
  __int16 v35 = v70;
  LOBYTE(v11) = v71;
  char v36 = v72;
  char v37 = v73;
  char v38 = v74;
  uint64_t v39 = v75;
  char v40 = v76;
  char v41 = v77;
  LODWORD(v81) = v78;
  LODWORD(v48) = v79;
  LODWORD(v46) = v80;
  long long v42 = v50;
  uint64_t v43 = v47;
  *int v47 = v49;
  *(_OWORD *)(v43 + 1) = v42;
  *((unsigned char *)v43 + 24) = v16;
  *((unsigned char *)v43 + 25) = v17;
  *((unsigned char *)v43 + 26) = v18;
  *((unsigned char *)v43 + 27) = v19;
  *((unsigned char *)v43 + 28) = v20;
  *((unsigned char *)v43 + 29) = v21;
  *((unsigned char *)v43 + 30) = v22;
  *((unsigned char *)v43 + 31) = v23;
  v43[4] = v24;
  *((unsigned char *)v43 + 40) = v25;
  *((unsigned char *)v43 + 41) = v26;
  v43[6] = v27;
  *((unsigned char *)v43 + 56) = v28;
  *((unsigned char *)v43 + 57) = v29;
  v43[8] = v30;
  *((unsigned char *)v43 + 72) = v31;
  *((unsigned char *)v43 + 73) = v32;
  *((_WORD *)v43 + 37) = v33;
  v43[10] = v34;
  *((_WORD *)v43 + 44) = v35;
  *((unsigned char *)v43 + 90) = v11;
  *((unsigned char *)v43 + 91) = v36;
  *((unsigned char *)v43 + 92) = v37;
  *((unsigned char *)v43 + 93) = v38;
  v43[12] = v39;
  *((unsigned char *)v43 + 104) = v40;
  *((unsigned char *)v43 + 105) = v41;
  *((unsigned char *)v43 + 106) = v81;
  *((unsigned char *)v43 + 107) = v48;
  *((unsigned char *)v43 + 108) = v46;
  uint64_t v44 = (uint64_t)v45;
  return __swift_destroy_boxed_opaque_existential_1(v44);
}

unint64_t sub_2604F8E18()
{
  unint64_t result = qword_26B3E8590;
  if (!qword_26B3E8590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8590);
  }
  return result;
}

uint64_t sub_2604F8E6C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return XPCAgentMessage.init(from:)(a1, a2);
}

uint64_t sub_2604F8E84(void *a1)
{
  return XPCAgentMessage.encode(to:)(a1);
}

uint64_t XPCAgentMessage.RequestFragments.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B68);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2[1];
  uint64_t v8 = v2[2];
  int v10 = *((unsigned __int8 *)v2 + 24);
  int v45 = *((unsigned __int8 *)v2 + 25);
  int v46 = v10;
  int v11 = *((unsigned __int8 *)v2 + 26);
  int v43 = *((unsigned __int8 *)v2 + 27);
  int v44 = v11;
  int v12 = *((unsigned __int8 *)v2 + 28);
  int v41 = *((unsigned __int8 *)v2 + 29);
  int v42 = v12;
  int v13 = *((unsigned __int8 *)v2 + 30);
  int v39 = *((unsigned __int8 *)v2 + 31);
  int v40 = v13;
  uint64_t v38 = v2[4];
  int v14 = *((unsigned __int8 *)v2 + 40);
  int v36 = *((unsigned __int8 *)v2 + 41);
  int v37 = v14;
  uint64_t v35 = v2[6];
  int v34 = *((unsigned __int8 *)v2 + 56);
  int v33 = *((unsigned __int8 *)v2 + 57);
  uint64_t v32 = v2[8];
  int v31 = *((unsigned __int8 *)v2 + 72);
  int v30 = *((unsigned __int8 *)v2 + 73);
  int v29 = *((unsigned __int16 *)v2 + 37);
  uint64_t v28 = v2[10];
  int v27 = *((unsigned __int16 *)v2 + 44);
  int v26 = *((unsigned __int8 *)v2 + 90);
  int v25 = *((unsigned __int8 *)v2 + 91);
  int v24 = *((unsigned __int8 *)v2 + 92);
  int v23 = *((unsigned __int8 *)v2 + 93);
  uint64_t v22 = v2[12];
  int v21 = *((unsigned __int8 *)v2 + 104);
  int v20 = *((unsigned __int8 *)v2 + 105);
  int v19 = *((unsigned __int8 *)v2 + 106);
  int v18 = *((unsigned __int8 *)v2 + 107);
  HIDWORD(v17) = *((unsigned __int8 *)v2 + 108);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F9250();
  sub_260533120();
  uint64_t v15 = *v2;
  uint64_t v48 = v9;
  uint64_t v49 = v8;
  uint64_t v47 = v15;
  char v50 = v46;
  char v51 = v45;
  char v52 = v44;
  char v53 = v43;
  char v54 = v42;
  char v55 = v41;
  char v56 = v40;
  char v57 = v39;
  uint64_t v58 = v38;
  char v59 = v37;
  char v60 = v36;
  uint64_t v61 = v35;
  char v62 = v34;
  char v63 = v33;
  uint64_t v64 = v32;
  char v65 = v31;
  char v66 = v30;
  __int16 v67 = v29;
  uint64_t v68 = v28;
  __int16 v69 = v27;
  char v70 = v26;
  char v71 = v25;
  char v72 = v24;
  char v73 = v23;
  uint64_t v74 = v22;
  char v75 = v21;
  char v76 = v20;
  char v77 = v19;
  char v78 = v18;
  char v79 = BYTE4(v17);
  sub_2604B7518();
  sub_260532F40();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2604F9250()
{
  unint64_t result = qword_26B3E8C90;
  if (!qword_26B3E8C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8C90);
  }
  return result;
}

uint64_t XPCAgentMessage.RequestFragments.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8830);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604F9250();
  sub_260533100();
  if (!v2)
  {
    sub_2604B756C();
    sub_260532E70();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    int v71 = v41;
    char v9 = v42;
    char v10 = v43;
    char v11 = v44;
    char v12 = v45;
    char v13 = v46;
    char v14 = v47;
    char v15 = v48;
    uint64_t v16 = v49;
    char v17 = v50;
    char v18 = v51;
    uint64_t v19 = v52;
    char v20 = v53;
    char v21 = v54;
    uint64_t v22 = v55;
    char v23 = v56;
    char v24 = v57;
    __int16 v25 = v58;
    uint64_t v26 = v59;
    __int16 v27 = v60;
    char v28 = v61;
    char v29 = v62;
    char v30 = v63;
    char v31 = v64;
    uint64_t v32 = v65;
    char v33 = v66;
    int v72 = v67;
    int v38 = v68;
    int v37 = v69;
    HIDWORD(v36) = v70;
    long long v34 = v40;
    *(void *)a2 = v39;
    *(_OWORD *)(a2 + 8) = v34;
    *(unsigned char *)(a2 + 24) = v71;
    *(unsigned char *)(a2 + 25) = v9;
    *(unsigned char *)(a2 + 26) = v10;
    *(unsigned char *)(a2 + 27) = v11;
    *(unsigned char *)(a2 + 28) = v12;
    *(unsigned char *)(a2 + 29) = v13;
    *(unsigned char *)(a2 + 30) = v14;
    *(unsigned char *)(a2 + 31) = v15;
    *(void *)(a2 + 32) = v16;
    *(unsigned char *)(a2 + 40) = v17;
    *(unsigned char *)(a2 + 41) = v18;
    *(void *)(a2 + 48) = v19;
    *(unsigned char *)(a2 + 56) = v20;
    *(unsigned char *)(a2 + 57) = v21;
    *(void *)(a2 + 64) = v22;
    *(unsigned char *)(a2 + 72) = v23;
    *(unsigned char *)(a2 + 73) = v24;
    *(_WORD *)(a2 + 74) = v25;
    *(void *)(a2 + 80) = v26;
    *(_WORD *)(a2 + 88) = v27;
    *(unsigned char *)(a2 + 90) = v28;
    *(unsigned char *)(a2 + 91) = v29;
    *(unsigned char *)(a2 + 92) = v30;
    *(unsigned char *)(a2 + 93) = v31;
    *(void *)(a2 + 96) = v32;
    *(unsigned char *)(a2 + 104) = v33;
    *(unsigned char *)(a2 + 105) = v72;
    *(unsigned char *)(a2 + 106) = v38;
    *(unsigned char *)(a2 + 107) = v37;
    *(unsigned char *)(a2 + 108) = BYTE4(v36);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2604F9530@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return XPCAgentMessage.RequestFragments.init(from:)(a1, a2);
}

uint64_t sub_2604F9548(void *a1)
{
  return XPCAgentMessage.RequestFragments.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgentXPCConstants()
{
  return &type metadata for IntelligenceSupportAgentXPCConstants;
}

unint64_t destroy for XPCClientMessage(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t _s21UIIntelligenceSupport16XPCClientMessageOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for XPCClientMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = v5;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_7;
  }
  *a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for XPCClientMessage(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  a1[1] = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_2604F9800(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2604F9818(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage()
{
  return &type metadata for XPCClientMessage;
}

void *assignWithCopy for XPCClientMessage.TransferFragments(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for XPCClientMessage.TransferFragments()
{
  return &type metadata for XPCClientMessage.TransferFragments;
}

ValueMetadata *type metadata accessor for XPCAgentMessage()
{
  return &type metadata for XPCAgentMessage;
}

ValueMetadata *type metadata accessor for XPCAgentMessage.RequestFragments()
{
  return &type metadata for XPCAgentMessage.RequestFragments;
}

ValueMetadata *type metadata accessor for XPCAgentMessage.RequestFragments.CodingKeys()
{
  return &type metadata for XPCAgentMessage.RequestFragments.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCAgentMessage.CodingKeys()
{
  return &type metadata for XPCAgentMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCAgentMessage.RequestFragmentsCodingKeys()
{
  return &type metadata for XPCAgentMessage.RequestFragmentsCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for XPCClientMessage.TransferFragments.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604F99F0);
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

ValueMetadata *type metadata accessor for XPCClientMessage.TransferFragments.CodingKeys()
{
  return &type metadata for XPCClientMessage.TransferFragments.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for XPCClientMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604F9AF4);
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

unsigned char *_s21UIIntelligenceSupport15XPCAgentMessageO16RequestFragmentsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2604F9BB8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2604F9BE4()
{
  unint64_t result = qword_26A873478;
  if (!qword_26A873478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873478);
  }
  return result;
}

unint64_t sub_2604F9C3C()
{
  unint64_t result = qword_26A873480;
  if (!qword_26A873480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873480);
  }
  return result;
}

unint64_t sub_2604F9C94()
{
  unint64_t result = qword_26A873488;
  if (!qword_26A873488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873488);
  }
  return result;
}

unint64_t sub_2604F9CEC()
{
  unint64_t result = qword_26A873490;
  if (!qword_26A873490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873490);
  }
  return result;
}

unint64_t sub_2604F9D44()
{
  unint64_t result = qword_26A873498;
  if (!qword_26A873498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873498);
  }
  return result;
}

unint64_t sub_2604F9D9C()
{
  unint64_t result = qword_26A8734A0;
  if (!qword_26A8734A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734A0);
  }
  return result;
}

unint64_t sub_2604F9DF4()
{
  unint64_t result = qword_26B3E8CA0;
  if (!qword_26B3E8CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CA0);
  }
  return result;
}

unint64_t sub_2604F9E4C()
{
  unint64_t result = qword_26B3E8C98;
  if (!qword_26B3E8C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8C98);
  }
  return result;
}

unint64_t sub_2604F9EA4()
{
  unint64_t result = qword_26B3E8CB8;
  if (!qword_26B3E8CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CB8);
  }
  return result;
}

unint64_t sub_2604F9EFC()
{
  unint64_t result = qword_26B3E8CB0;
  if (!qword_26B3E8CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CB0);
  }
  return result;
}

unint64_t sub_2604F9F54()
{
  unint64_t result = qword_26B3E8C88;
  if (!qword_26B3E8C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8C88);
  }
  return result;
}

unint64_t sub_2604F9FAC()
{
  unint64_t result = qword_26B3E8C80;
  if (!qword_26B3E8C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8C80);
  }
  return result;
}

unint64_t sub_2604FA004()
{
  unint64_t result = qword_26B3E8CD0;
  if (!qword_26B3E8CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CD0);
  }
  return result;
}

unint64_t sub_2604FA05C()
{
  unint64_t result = qword_26B3E8CC8;
  if (!qword_26B3E8CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8CC8);
  }
  return result;
}

uint64_t sub_2604FA0B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656D67617266 && a2 == 0xE900000000000073;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736F706E676973 && a2 == 0xED00006574617453)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2604FA1D4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696C616974696E69 && a2 == 0xEA0000000000657ALL;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x655368636E75616CLL && a2 == 0xEE006C656E69746ELL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000260543150)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2604FA358(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000260543170)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_260532FA0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t *sub_2604FA3E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_2605323B0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_2604FA538(uint64_t a1)
{
  uint64_t v2 = sub_2605323B0();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_2604FA608(void *a1, const void *a2)
{
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_2604FA718(void *a1, void *a2)
{
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_2604FA894(void *a1, const void *a2)
{
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_2604FA9A4(void *a1, void *a2)
{
  uint64_t v4 = sub_2605323B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_2604FAB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2604FAB34);
}

uint64_t sub_2604FAB34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_2604FABA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2604FABB8);
}

uint64_t sub_2604FABB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for UndeclaredUTType()
{
  uint64_t result = qword_26B3E8FF8;
  if (!qword_26B3E8FF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2604FAC78()
{
  sub_2604FAD04();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2604FAD04()
{
  if (!qword_26B3E9090)
  {
    sub_2605323B0();
    unint64_t v0 = sub_260532B40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3E9090);
    }
  }
}

uint64_t sub_2604FAD5C(char *a1, char *a2)
{
  return sub_260527F08(*a1, *a2);
}

uint64_t sub_2604FAD68()
{
  return sub_2605330E0();
}

uint64_t sub_2604FADE8()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2604FAE54()
{
  return sub_2605330E0();
}

uint64_t sub_2604FAED0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260532DC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_2604FAF30(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1701869940;
  if (*v1) {
    uint64_t v2 = 0x696669746E656469;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xEA00000000007265;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2604FAF6C()
{
  if (*v0) {
    return 0x696669746E656469;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_2604FAFA4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260532DC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2604FB008(uint64_t a1)
{
  unint64_t v2 = sub_2604FB780();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FB044(uint64_t a1)
{
  unint64_t v2 = sub_2604FB780();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FB080(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  MEMORY[0x270FA5388](v5 - 8);
  int v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8734C0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604FB780();
  sub_260533120();
  char v17 = 0;
  uint64_t v12 = sub_2605323B0();
  sub_2604D5A2C(&qword_26A8734C8);
  sub_260532EF0();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_2604ECDE4(v3, (uint64_t)v7);
  uint64_t v14 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v12) == 1)
  {
    sub_2604FB898((uint64_t)v7);
  }
  else
  {
    sub_260532330();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v12);
  }
  char v16 = 1;
  sub_260532ED0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2604FB338@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v35 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  long long v34 = (char *)&v31 - v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v38 = (uint64_t)&v31 - v8;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8734A8);
  uint64_t v32 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UndeclaredUTType();
  MEMORY[0x270FA5388](v11 - 8);
  char v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2605323B0();
  uint64_t v15 = *(void *)(v14 - 8);
  char v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v16(v13, 1, 1, v14);
  uint64_t v17 = a1[3];
  uint64_t v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_2604FB780();
  int v37 = v10;
  char v18 = v40;
  sub_260533100();
  if (!v18)
  {
    long long v40 = v16;
    uint64_t v20 = (uint64_t)v35;
    char v42 = 0;
    sub_2604D5A2C(&qword_26A8734B8);
    uint64_t v21 = v36;
    sub_260532E30();
    uint64_t v22 = (uint64_t)v34;
    uint64_t v23 = (uint64_t)v13;
    sub_2604FB830(v38, (uint64_t)v13);
    sub_2604ECDE4((uint64_t)v13, v22);
    int v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v22, 1, v14);
    uint64_t v25 = v22;
    LODWORD(v22) = v24;
    sub_2604FB898(v25);
    if (v22 == 1)
    {
      char v41 = 1;
      uint64_t v26 = v37;
      sub_260532DF0();
      uint64_t v29 = (uint64_t)v39;
      if (!v27)
      {
        uint64_t v28 = v33;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v21);
LABEL_10:
        sub_2604FB8F8(v23, v28);
        __swift_destroy_boxed_opaque_existential_1(v29);
        uint64_t v19 = v23;
        return sub_2604FB7D4(v19);
      }
      sub_260532340();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v21);
      sub_2604FB830(v20, v23);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v37, v21);
      uint64_t v29 = (uint64_t)v39;
    }
    uint64_t v28 = v33;
    goto LABEL_10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  uint64_t v19 = (uint64_t)v13;
  return sub_2604FB7D4(v19);
}

uint64_t sub_2604FB750@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2604FB338(a1, a2);
}

uint64_t sub_2604FB768(void *a1)
{
  return sub_2604FB080(a1);
}

unint64_t sub_2604FB780()
{
  unint64_t result = qword_26A8734B0;
  if (!qword_26A8734B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734B0);
  }
  return result;
}

uint64_t sub_2604FB7D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UndeclaredUTType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2604FB830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2604FB898(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2604FB8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UndeclaredUTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for UndeclaredUTType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604FBA28);
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

ValueMetadata *type metadata accessor for UndeclaredUTType.CodingKeys()
{
  return &type metadata for UndeclaredUTType.CodingKeys;
}

unint64_t sub_2604FBA64()
{
  unint64_t result = qword_26A8734D0;
  if (!qword_26A8734D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734D0);
  }
  return result;
}

unint64_t sub_2604FBABC()
{
  unint64_t result = qword_26A8734D8;
  if (!qword_26A8734D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734D8);
  }
  return result;
}

unint64_t sub_2604FBB14()
{
  unint64_t result = qword_26A8734E0;
  if (!qword_26A8734E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734E0);
  }
  return result;
}

unint64_t sub_2604FBB6C(char a1)
{
  unint64_t result = 1702060386;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x6E6565726373;
      break;
    case 3:
      unint64_t result = 0x776F646E6977;
      break;
    case 4:
      unint64_t result = 0x65746F6D6572;
      break;
    case 5:
      unint64_t result = 0x725065746F6D6572;
      break;
    case 6:
      unint64_t result = 1954047348;
      break;
    case 7:
      unint64_t result = 0x6567616D69;
      break;
    case 8:
      unint64_t result = 0x746E656D75636F64;
      break;
    case 9:
      unint64_t result = 0x64654D6567616D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2604FBC98(void *a1, uint64_t a2)
{
  uint64_t v61 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872120);
  uint64_t v59 = *(void *)(v3 - 8);
  uint64_t v60 = v3;
  MEMORY[0x270FA5388](v3);
  __int16 v58 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872118);
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v55 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720F8);
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720F0);
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872128);
  uint64_t v47 = *(void *)(v11 - 8);
  uint64_t v48 = v11;
  MEMORY[0x270FA5388](v11);
  char v46 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872100);
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  char v43 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872110);
  uint64_t v41 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  long long v40 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872108);
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  char v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872130);
  uint64_t v37 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720E8);
  uint64_t v36 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720E0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v62 = v23;
  uint64_t v63 = v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604FFEB0();
  sub_260533120();
  switch((char)v61)
  {
    case 1:
      char v65 = 1;
      sub_2605001A4();
      uint64_t v28 = v62;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v26, v28);
    case 2:
      char v66 = 2;
      sub_260500150();
      uint64_t v27 = v62;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v39);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v26, v27);
    case 3:
      char v67 = 3;
      sub_2605000FC();
      char v30 = v40;
      uint64_t v27 = v62;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v42);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v26, v27);
    case 4:
      char v68 = 4;
      sub_2605000A8();
      uint64_t v31 = v43;
      uint64_t v27 = v62;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v45);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v26, v27);
    case 5:
      char v69 = 5;
      sub_260500054();
      uint64_t v32 = v46;
      uint64_t v27 = v62;
      sub_260532EC0();
      uint64_t v34 = v47;
      uint64_t v33 = v48;
      goto LABEL_12;
    case 6:
      char v70 = 6;
      sub_260500000();
      uint64_t v32 = v49;
      uint64_t v27 = v62;
      sub_260532EC0();
      uint64_t v34 = v50;
      uint64_t v33 = v51;
      goto LABEL_12;
    case 7:
      char v71 = 7;
      sub_2604FFFAC();
      uint64_t v32 = v52;
      uint64_t v27 = v62;
      sub_260532EC0();
      uint64_t v34 = v53;
      uint64_t v33 = v54;
      goto LABEL_12;
    case 8:
      char v72 = 8;
      sub_2604FFF58();
      uint64_t v32 = v55;
      uint64_t v27 = v62;
      sub_260532EC0();
      uint64_t v34 = v56;
      uint64_t v33 = v57;
      goto LABEL_12;
    case 9:
      char v73 = 9;
      sub_2604FFF04();
      uint64_t v32 = v58;
      uint64_t v27 = v62;
      sub_260532EC0();
      uint64_t v34 = v59;
      uint64_t v33 = v60;
LABEL_12:
      (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v33);
      break;
    default:
      char v64 = 0;
      sub_2605001F8();
      uint64_t v27 = v62;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v20);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v26, v27);
}

uint64_t sub_2604FC608(uint64_t a1)
{
  unint64_t v2 = sub_2605001F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC644(uint64_t a1)
{
  unint64_t v2 = sub_2605001F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2604FC680()
{
  return sub_2604FBB6C(*v0);
}

uint64_t sub_2604FC688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26050024C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2604FC6B0(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_2604FC6BC(uint64_t a1)
{
  unint64_t v2 = sub_2604FFEB0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC6F8(uint64_t a1)
{
  unint64_t v2 = sub_2604FFEB0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC734(uint64_t a1)
{
  unint64_t v2 = sub_2604FFF58();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC770(uint64_t a1)
{
  unint64_t v2 = sub_2604FFF58();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC7AC(uint64_t a1)
{
  unint64_t v2 = sub_2604FFFAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC7E8(uint64_t a1)
{
  unint64_t v2 = sub_2604FFFAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC824(uint64_t a1)
{
  unint64_t v2 = sub_2604FFF04();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC860(uint64_t a1)
{
  unint64_t v2 = sub_2604FFF04();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC89C(uint64_t a1)
{
  unint64_t v2 = sub_2605000A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC8D8(uint64_t a1)
{
  unint64_t v2 = sub_2605000A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC914(uint64_t a1)
{
  unint64_t v2 = sub_260500054();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC950(uint64_t a1)
{
  unint64_t v2 = sub_260500054();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FC98C(uint64_t a1)
{
  unint64_t v2 = sub_260500150();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FC9C8(uint64_t a1)
{
  unint64_t v2 = sub_260500150();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FCA04(uint64_t a1)
{
  unint64_t v2 = sub_260500000();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FCA40(uint64_t a1)
{
  unint64_t v2 = sub_260500000();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FCA7C(uint64_t a1)
{
  unint64_t v2 = sub_2605001A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FCAB8(uint64_t a1)
{
  unint64_t v2 = sub_2605001A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2604FCAF4(uint64_t a1)
{
  unint64_t v2 = sub_2605000FC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FCB30(uint64_t a1)
{
  unint64_t v2 = sub_2605000FC();

  return MEMORY[0x270FA00B8](a1, v2);
}

char *sub_2604FCB6C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_260500648(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_2604FCB98(void *a1)
{
  return sub_2604FBC98(a1, *v1);
}

uint64_t sub_2604FCBB4(char *a1, char *a2)
{
  return sub_260526D38(*a1, *a2);
}

uint64_t sub_2604FCBC0()
{
  return sub_2605330E0();
}

uint64_t sub_2604FCC58()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2604FCCDC()
{
  return sub_2605330E0();
}

uint64_t sub_2604FCD70@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260532DC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_2604FCDD0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x546465646F636E65;
  if (*v1) {
    uint64_t v2 = 0x746169636F737361;
  }
  unint64_t v3 = 0xEB00000000657079;
  if (*v1) {
    unint64_t v3 = 0xEF65756C61566465;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2604FCE24()
{
  if (*v0) {
    return 0x746169636F737361;
  }
  else {
    return 0x546465646F636E65;
  }
}

uint64_t sub_2604FCE74@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260532DC0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2604FCED8(uint64_t a1)
{
  unint64_t v2 = sub_2604FF78C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2604FCF14(uint64_t a1)
{
  unint64_t v2 = sub_2604FF78C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Content.encode(to:)(void *a1)
{
  v173 = a1;
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720D8);
  MEMORY[0x270FA5388](v3);
  v170 = (char *)&v154 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872068);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v167 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v161 = (uint64_t)&v154 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v166 = (uint64_t)&v154 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v160 = (uint64_t)&v154 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v165 = (uint64_t)&v154 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v159 = (uint64_t)&v154 - v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v164 = (uint64_t)&v154 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v158 = (uint64_t)&v154 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v163 = (uint64_t)&v154 - v23;
  MEMORY[0x270FA5388](v24);
  uint64_t v157 = (uint64_t)&v154 - v25;
  MEMORY[0x270FA5388](v26);
  uint64_t v162 = (uint64_t)&v154 - v27;
  MEMORY[0x270FA5388](v28);
  uint64_t v156 = (uint64_t)&v154 - v29;
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&v154 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v155 = (uint64_t)&v154 - v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v154 - v36;
  MEMORY[0x270FA5388](v38);
  uint64_t v154 = (uint64_t)&v154 - v39;
  MEMORY[0x270FA5388](v40);
  uint64_t v42 = (char *)&v154 - v41;
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)&v154 - v44;
  MEMORY[0x270FA5388](v46);
  uint64_t v48 = (char *)&v154 - v47;
  unint64_t v49 = *v2;
  uint64_t v176 = swift_allocBox();
  uint64_t v168 = v6;
  uint64_t v169 = v5;
  uint64_t v50 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v171 = v51;
  v174 = v50;
  uint64_t v175 = v6 + 56;
  v50(v51, 1, 1, v5);
  unint64_t v52 = v49;
  switch(v49 >> 60)
  {
    case 1uLL:
      LOBYTE(v177) = 2;
      char v179 = 0;
      swift_retain();
      char v94 = v173;
      sub_2604FE658(v173, (uint64_t)v42);
      sub_2604FF484();
      uint64_t v89 = v169;
      uint64_t v95 = v172;
      sub_260532F40();
      if (v95)
      {
        long long v96 = v167;
        uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
        v97(v167, v42, v89);
        goto LABEL_28;
      }
      v172 = (void *)v49;
      uint64_t v140 = (uint64_t)v170;
      uint64_t v168 = *(void *)(v168 + 32);
      ((void (*)(char *, char *, uint64_t))v168)(v170, v42, v89);
      v174(v140, 0, 1, v89);
      uint64_t v141 = v171;
      swift_beginAccess();
      sub_2604FF4D8(v140, v141);
      uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
      char v179 = 1;
      uint64_t v142 = v154;
      sub_2604FE658(v94, v154);
      sub_2604FF738();
      sub_260532F40();
      ((void (*)(uint64_t, uint64_t, uint64_t))v168)(v140, v142, v89);
      v174(v140, 0, 1, v89);
      uint64_t v152 = v140;
      uint64_t v153 = v141;
      goto LABEL_42;
    case 2uLL:
      unint64_t v60 = v49;
      LOBYTE(v177) = 3;
      char v179 = 0;
      swift_retain();
      char v77 = v173;
      sub_2604FE658(v173, (uint64_t)v37);
      sub_2604FF484();
      uint64_t v63 = v169;
      char v78 = v172;
      sub_260532F40();
      if (v78)
      {
        char v79 = v167;
        char v66 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
        v66(v167, v37, v63);
        char v67 = v170;
        char v68 = v170;
        char v69 = v79;
        goto LABEL_13;
      }
      v132 = v77;
      uint64_t v133 = (uint64_t)v170;
      v172 = *(void **)(v168 + 32);
      ((void (*)(char *, char *, uint64_t))v172)(v170, v37, v63);
      v174(v133, 0, 1, v63);
      uint64_t v134 = v171;
      swift_beginAccess();
      sub_2604FF4D8(v133, v134);
      uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
      char v179 = 1;
      uint64_t v135 = v155;
      sub_2604FE658(v132, v155);
      sub_2604FF6E4();
      sub_260532F40();
      ((void (*)(uint64_t, uint64_t, uint64_t))v172)(v133, v135, v63);
      v174(v133, 0, 1, v63);
      uint64_t v85 = v133;
      uint64_t v86 = v134;
      goto LABEL_17;
    case 3uLL:
      unint64_t v60 = v49;
      LOBYTE(v177) = 4;
      char v179 = 0;
      swift_retain();
      unsigned __int8 v80 = v173;
      sub_2604FE658(v173, (uint64_t)v32);
      sub_2604FF484();
      uint64_t v63 = v169;
      uint64_t v81 = v172;
      sub_260532F40();
      if (v81)
      {
        char v82 = v167;
        char v83 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
        v83(v167, v32, v63);
        char v67 = v170;
        v83(v170, v82, v63);
        goto LABEL_16;
      }
      v136 = v80;
      uint64_t v137 = (uint64_t)v170;
      v172 = *(void **)(v168 + 32);
      ((void (*)(char *, char *, uint64_t))v172)(v170, v32, v63);
      v174(v137, 0, 1, v63);
      uint64_t v138 = v171;
      swift_beginAccess();
      sub_2604FF4D8(v137, v138);
      uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
      char v179 = 1;
      uint64_t v139 = v156;
      sub_2604FE658(v136, v156);
      sub_26046941C();
      sub_260532F40();
      ((void (*)(uint64_t, uint64_t, uint64_t))v172)(v137, v139, v63);
      v174(v137, 0, 1, v63);
      uint64_t v85 = v137;
      uint64_t v86 = v138;
      goto LABEL_17;
    case 4uLL:
      unint64_t v60 = v49;
      LOBYTE(v177) = 5;
      char v179 = 0;
      swift_retain();
      uint64_t v61 = v162;
      uint64_t v62 = v173;
      sub_2604FE658(v173, v162);
      sub_2604FF484();
      uint64_t v63 = v169;
      char v64 = v172;
      sub_260532F40();
      if (v64)
      {
        char v65 = v167;
        char v66 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
        v66(v167, (char *)v61, v63);
        char v67 = v170;
        char v68 = v170;
        char v69 = v65;
LABEL_13:
        v66(v68, v69, v63);
LABEL_16:
        v174((uint64_t)v67, 0, 1, v63);
        uint64_t v84 = v171;
        swift_beginAccess();
        uint64_t v85 = (uint64_t)v67;
        uint64_t v86 = v84;
      }
      else
      {
        uint64_t v127 = v62;
        uint64_t v128 = v61;
        uint64_t v129 = (uint64_t)v170;
        v172 = *(void **)(v168 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v172)(v170, v128, v63);
        v174(v129, 0, 1, v63);
        uint64_t v130 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v129, v130);
        uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
        char v179 = 1;
        uint64_t v131 = v157;
        sub_2604FE658(v127, v157);
        sub_2604FF690();
        sub_260532F40();
        ((void (*)(uint64_t, uint64_t, uint64_t))v172)(v129, v131, v63);
        v174(v129, 0, 1, v63);
        uint64_t v85 = v129;
        uint64_t v86 = v130;
      }
LABEL_17:
      sub_2604FF4D8(v85, v86);
      unint64_t v59 = v60;
      goto LABEL_43;
    case 5uLL:
      LOBYTE(v177) = 6;
      char v179 = 0;
      swift_retain();
      uint64_t v98 = v163;
      uint64_t v99 = v173;
      sub_2604FE658(v173, v163);
      sub_2604FF484();
      uint64_t v100 = v169;
      unint64_t v101 = v172;
      sub_260532F40();
      if (v101)
      {
        unint64_t v102 = v167;
        v103 = *(void (**)(char *, uint64_t, uint64_t))(v168 + 32);
        v103(v167, v98, v100);
        uint64_t v104 = (uint64_t)v170;
        v103(v170, (uint64_t)v102, v100);
        v174(v104, 0, 1, v100);
        uint64_t v105 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v104, v105);
        unint64_t v59 = v49;
        goto LABEL_43;
      }
      v172 = (void *)v49;
      uint64_t v143 = (uint64_t)v170;
      uint64_t v168 = *(void *)(v168 + 32);
      ((void (*)(char *, uint64_t, uint64_t))v168)(v170, v98, v100);
      v174(v143, 0, 1, v100);
      uint64_t v144 = v171;
      swift_beginAccess();
      sub_2604FF4D8(v143, v144);
      uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
      char v179 = 1;
      uint64_t v145 = v158;
      sub_2604FE658(v99, v158);
      sub_2604FF63C();
      sub_260532F40();
      ((void (*)(uint64_t, uint64_t, uint64_t))v168)(v143, v145, v100);
      v174(v143, 0, 1, v100);
      uint64_t v152 = v143;
      uint64_t v153 = v144;
      goto LABEL_42;
    case 6uLL:
      unint64_t v106 = v49;
      LOBYTE(v177) = 7;
      char v179 = 0;
      swift_retain();
      uint64_t v107 = v164;
      v108 = v173;
      sub_2604FE658(v173, v164);
      sub_2604FF484();
      uint64_t v109 = v169;
      uint64_t v110 = v172;
      sub_260532F40();
      if (v110)
      {
        v111 = v167;
        uint64_t v112 = *(void (**)(char *, uint64_t, uint64_t))(v168 + 32);
        v112(v167, v107, v109);
        uint64_t v113 = (uint64_t)v170;
        v112(v170, (uint64_t)v111, v109);
        v174(v113, 0, 1, v109);
        uint64_t v114 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v113, v114);
        unint64_t v59 = v106;
      }
      else
      {
        uint64_t v146 = (uint64_t)v170;
        v172 = *(void **)(v168 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v172)(v170, v107, v109);
        v174(v146, 0, 1, v109);
        uint64_t v147 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v146, v147);
        uint64_t v177 = v52 & 0xFFFFFFFFFFFFFFFLL;
        char v179 = 1;
        uint64_t v148 = v159;
        sub_2604FE658(v108, v159);
        sub_2604FF5E8();
        sub_260532F40();
        ((void (*)(uint64_t, uint64_t, uint64_t))v172)(v146, v148, v109);
        v174(v146, 0, 1, v109);
        sub_2604FF4D8(v146, v171);
        unint64_t v59 = v52;
      }
      goto LABEL_43;
    case 7uLL:
      LOBYTE(v177) = 8;
      char v179 = 0;
      swift_retain();
      uint64_t v87 = v165;
      char v88 = v173;
      sub_2604FE658(v173, v165);
      sub_2604FF484();
      uint64_t v89 = v169;
      char v90 = v172;
      sub_260532F40();
      if (v90) {
        goto LABEL_27;
      }
      v172 = (void *)v49;
      uint64_t v91 = (uint64_t)v170;
      uint64_t v168 = *(void *)(v168 + 32);
      ((void (*)(char *, uint64_t, uint64_t))v168)(v170, v87, v89);
      v174(v91, 0, 1, v89);
      uint64_t v92 = v171;
      swift_beginAccess();
      sub_2604FF4D8(v91, v92);
      uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
      char v179 = 1;
      uint64_t v93 = v160;
      sub_2604FE658(v88, v160);
      sub_2604FF594();
      goto LABEL_38;
    case 8uLL:
      LOBYTE(v177) = 9;
      char v179 = 0;
      swift_retain();
      uint64_t v87 = v166;
      uint64_t v115 = v173;
      sub_2604FE658(v173, v166);
      sub_2604FF484();
      uint64_t v89 = v169;
      v116 = v172;
      sub_260532F40();
      if (v116)
      {
LABEL_27:
        long long v96 = v167;
        uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
        v97(v167, (char *)v87, v89);
LABEL_28:
        uint64_t v117 = (uint64_t)v170;
        v97(v170, v96, v89);
        v174(v117, 0, 1, v89);
        uint64_t v118 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v117, v118);
        sub_260476280(v49);
      }
      else
      {
        v172 = (void *)v49;
        uint64_t v91 = (uint64_t)v170;
        uint64_t v168 = *(void *)(v168 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v168)(v170, v87, v89);
        v174(v91, 0, 1, v89);
        uint64_t v92 = v171;
        swift_beginAccess();
        sub_2604FF4D8(v91, v92);
        uint64_t v177 = v49 & 0xFFFFFFFFFFFFFFFLL;
        char v179 = 1;
        uint64_t v93 = v161;
        sub_2604FE658(v115, v161);
        sub_2604FF540();
LABEL_38:
        sub_260532F40();
        ((void (*)(uint64_t, uint64_t, uint64_t))v168)(v91, v93, v89);
        v174(v91, 0, 1, v89);
        uint64_t v152 = v91;
        uint64_t v153 = v92;
LABEL_42:
        sub_2604FF4D8(v152, v153);
        unint64_t v59 = (unint64_t)v172;
LABEL_43:
        sub_260476280(v59);
      }
      return swift_release();
    case 9uLL:
      if (v49 == 0x9000000000000000)
      {
        LOBYTE(v177) = 0;
        char v179 = 0;
        sub_2604FE658(v173, (uint64_t)v48);
        sub_2604FF484();
        uint64_t v70 = v169;
        char v71 = v172;
        sub_260532F40();
        uint64_t v72 = v171;
        char v73 = v174;
        if (v71)
        {
          uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
          char v75 = v167;
          v74(v167, v48, v70);
          uint64_t v76 = (uint64_t)v170;
          v74(v170, v75, v70);
          v73(v76, 0, 1, v70);
          swift_beginAccess();
          sub_2604FF4D8(v76, v72);
        }
        else
        {
          uint64_t v149 = (uint64_t)v170;
          (*(void (**)(char *, char *, uint64_t))(v168 + 32))(v170, v48, v70);
          v73(v149, 0, 1, v70);
          swift_beginAccess();
          sub_2604FF4D8(v149, v72);
        }
        return swift_release();
      }
      else
      {
        LOBYTE(v177) = 1;
        char v179 = 0;
        sub_2604FE658(v173, (uint64_t)v45);
        sub_2604FF484();
        uint64_t v119 = v169;
        uint64_t v120 = v172;
        sub_260532F40();
        v173 = v120;
        uint64_t v121 = v171;
        uint64_t v122 = (void (*)(char *, void, uint64_t, uint64_t))v174;
        if (v120)
        {
          uint64_t v123 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
          v124 = v167;
          v123(v167, v45, v119);
          unint64_t v125 = v170;
          v123(v170, v124, v119);
          v122(v125, 0, 1, v119);
          swift_beginAccess();
          uint64_t v126 = (uint64_t)v125;
        }
        else
        {
          v150 = v170;
          (*(void (**)(char *, char *, uint64_t))(v168 + 32))(v170, v45, v119);
          v122(v150, 0, 1, v119);
          swift_beginAccess();
          uint64_t v126 = (uint64_t)v150;
        }
        sub_2604FF4D8(v126, v121);
        return swift_release();
      }
    default:
      uint64_t v53 = *(os_unfair_lock_s **)(v49 + 64);
      uint64_t v54 = (uint64_t)&v53[4];
      uint64_t v55 = v53 + 8;
      swift_retain();
      os_unfair_lock_lock(v55);
      uint64_t v56 = v172;
      sub_2604AE584(v54, v178);
      if (v56)
      {
        os_unfair_lock_unlock(v55);
        __break(1u);
        JUMPOUT(0x2604FE630);
      }
      os_unfair_lock_unlock(v55);
      unint64_t v57 = v178[0];
      __int16 v58 = v173;
      if ((~v178[0] & 0xF000000000000007) == 0)
      {
        unint64_t v57 = *(void *)(v52 + 56);
        sub_2604761F8(v57);
      }
      v178[0] = v57;
      IntelligenceElement.Content.encode(to:)(v58);
      sub_260476280(v57);
      unint64_t v59 = v52;
      goto LABEL_43;
  }
}

uint64_t sub_2604FE658@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = swift_projectBox();
  sub_2605011F0(v10, (uint64_t)v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872068);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v9, v11);
  }
  sub_260501258((uint64_t)v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604FF78C();
  sub_260533120();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v6, a2, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v6, 0, 1, v11);
  swift_beginAccess();
  return sub_2604FF4D8((uint64_t)v6, v10);
}

uint64_t IntelligenceElement.Content.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2604FF78C();
  sub_260533100();
  if (!v2)
  {
    char v12 = 0;
    sub_2604FF7E0();
    sub_260532E70();
    switch((char)v11)
    {
      case 1:
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = 0x9000000000000008;
        break;
      case 2:
        char v12 = 1;
        sub_2604FFA2C();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x1000000000000000;
        break;
      case 3:
        char v12 = 1;
        sub_2604FF9D8();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x2000000000000000;
        break;
      case 4:
        char v12 = 1;
        sub_2604694C4();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x3000000000000000;
        break;
      case 5:
        char v12 = 1;
        sub_2604FF984();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x4000000000000000;
        break;
      case 6:
        char v12 = 1;
        sub_2604FF930();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x5000000000000000;
        break;
      case 7:
        char v12 = 1;
        sub_2604FF8DC();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x6000000000000000;
        break;
      case 8:
        char v12 = 1;
        sub_2604FF888();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x7000000000000000;
        break;
      case 9:
        char v12 = 1;
        sub_2604FF834();
        sub_260532E70();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = v11 | 0x8000000000000000;
        break;
      default:
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *a2 = 0x9000000000000000;
        break;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2604FED68@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return IntelligenceElement.Content.init(from:)(a1, a2);
}

uint64_t sub_2604FED80(void *a1)
{
  return IntelligenceElement.Content.encode(to:)(a1);
}

uint64_t IntelligenceElement.Content.description.getter()
{
  uint64_t v1 = type metadata accessor for IntelligenceFragment.RemoteID(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = *v0;
  switch(*v0 >> 60)
  {
    case 1uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = (unint64_t)IntelligenceElement.Screen.description.getter();
      goto LABEL_12;
    case 2uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.Window.description.getter();
      goto LABEL_12;
    case 3uLL:
      uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFFLL) + *(void *)(*(void *)(v4 & 0xFFFFFFFFFFFFFFFLL) + 88);
      swift_beginAccess();
      uint64_t v8 = _s13RemoteContextV7StorageVMa(0);
      sub_260469518(v7 + *(int *)(v8 + 20), (uint64_t)v3);
      swift_retain();
      uint64_t v5 = IntelligenceFragment.RemoteID.description.getter();
      sub_26046957C((uint64_t)v3);
      goto LABEL_6;
    case 4uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.RemoteProcess.description.getter();
      goto LABEL_12;
    case 5uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.Text.description.getter();
      goto LABEL_12;
    case 6uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.Image.description.getter();
      goto LABEL_12;
    case 7uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.Document.description.getter();
      goto LABEL_12;
    case 8uLL:
      uint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFLL;
      unint64_t v6 = IntelligenceElement.ImageMedia.description.getter();
LABEL_12:
      uint64_t v5 = v6;
      break;
    case 9uLL:
      if (v4 == 0x9000000000000000) {
        uint64_t v5 = 1702060354;
      }
      else {
        uint64_t v5 = 0xD000000000000016;
      }
      break;
    default:
      swift_retain();
      uint64_t v5 = IntelligenceElement.AsyncContent.description.getter();
LABEL_6:
      sub_260476280(v4);
      break;
  }
  return v5;
}

uint64_t _s21UIIntelligenceSupport19IntelligenceElementV7ContentO2eeoiySbAE_AEtFZ_0(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceFragment.RemoteID(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v19 - v8;
  unint64_t v10 = *a1;
  unint64_t v11 = *a2;
  switch(v10 >> 60)
  {
    case 1uLL:
      if (v11 >> 60 != 1) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      char v12 = _s21UIIntelligenceSupport19IntelligenceElementV6ScreenV2eeoiySbAE_AEtFZ_0(v20, v19);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      goto LABEL_11;
    case 2uLL:
      if (v11 >> 60 != 2) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = _s21UIIntelligenceSupport19IntelligenceElementV6WindowV2eeoiySbAE_AEtFZ_0((uint64_t)v20, v19);
      goto LABEL_24;
    case 3uLL:
      if (v11 >> 60 != 3) {
        goto LABEL_29;
      }
      uint64_t v15 = (v10 & 0xFFFFFFFFFFFFFFFLL) + *(void *)(*(void *)(v10 & 0xFFFFFFFFFFFFFFFLL) + 88);
      swift_beginAccess();
      uint64_t v16 = _s13RemoteContextV7StorageVMa(0);
      sub_260469518(v15 + *(int *)(v16 + 20), (uint64_t)v9);
      uint64_t v17 = (v11 & 0xFFFFFFFFFFFFFFFLL) + *(void *)(*(void *)(v11 & 0xFFFFFFFFFFFFFFFLL) + 88);
      swift_beginAccess();
      sub_260469518(v17 + *(int *)(v16 + 20), (uint64_t)v7);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v12 = sub_2605322A0();
      sub_26046957C((uint64_t)v7);
      sub_26046957C((uint64_t)v9);
      goto LABEL_25;
    case 4uLL:
      if (v11 >> 60 != 4) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = _s21UIIntelligenceSupport19IntelligenceElementV13RemoteProcessV2eeoiySbAE_AEtFZ_0(v20, v19);
      goto LABEL_24;
    case 5uLL:
      if (v11 >> 60 != 5) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = _s21UIIntelligenceSupport19IntelligenceElementV4TextV2eeoiySbAE_AEtFZ_0(v20, v19);
      goto LABEL_24;
    case 6uLL:
      if (v11 >> 60 != 6) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = static IntelligenceElement.Image.== infix(_:_:)((uint64_t)v20, v19);
      goto LABEL_24;
    case 7uLL:
      if (v11 >> 60 != 7) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = _s21UIIntelligenceSupport19IntelligenceElementV8DocumentV2eeoiySbAE_AEtFZ_0((uint64_t)v20, v19);
      goto LABEL_24;
    case 8uLL:
      if (v11 >> 60 != 8) {
        goto LABEL_29;
      }
      v20[0] = v10 & 0xFFFFFFFFFFFFFFFLL;
      v19[0] = v11 & 0xFFFFFFFFFFFFFFFLL;
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v13 = static IntelligenceElement.ImageMedia.== infix(_:_:)(v20, v19);
LABEL_24:
      char v12 = v13;
LABEL_25:
      sub_260476280(v10);
      sub_260476280(v11);
      sub_260476280(v11);
      sub_260476280(v10);
      return v12 & 1;
    case 9uLL:
      if (v10 == 0x9000000000000000)
      {
        if (v11 == 0x9000000000000000)
        {
          sub_260476280(0x9000000000000000);
          unint64_t v14 = 0x9000000000000000;
LABEL_28:
          sub_260476280(v14);
          char v12 = 1;
          return v12 & 1;
        }
      }
      else if (v11 == 0x9000000000000008)
      {
        sub_260476280(0x9000000000000008);
        unint64_t v14 = 0x9000000000000008;
        goto LABEL_28;
      }
LABEL_29:
      sub_2604761F8(*a2);
      sub_2604761F8(v10);
      sub_260476280(v10);
      sub_260476280(v11);
      char v12 = 0;
      return v12 & 1;
    default:
      if (v11 >> 60) {
        goto LABEL_29;
      }
      type metadata accessor for IntelligenceElement.AsyncContent();
      sub_2604761F8(v11);
      sub_2604761F8(v10);
      char v12 = static IntelligenceElement.AsyncContent.== infix(_:_:)(v10, v11);
LABEL_11:
      sub_260476280(v10);
      sub_260476280(v11);
      return v12 & 1;
  }
}

unint64_t sub_2604FF484()
{
  unint64_t result = qword_26A8720A8;
  if (!qword_26A8720A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8720A8);
  }
  return result;
}

uint64_t sub_2604FF4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_2604FF540()
{
  unint64_t result = qword_26A8734E8;
  if (!qword_26A8734E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734E8);
  }
  return result;
}

unint64_t sub_2604FF594()
{
  unint64_t result = qword_26A8720B0;
  if (!qword_26A8720B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8720B0);
  }
  return result;
}

unint64_t sub_2604FF5E8()
{
  unint64_t result = qword_26A871DD0;
  if (!qword_26A871DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871DD0);
  }
  return result;
}

unint64_t sub_2604FF63C()
{
  unint64_t result = qword_26A871BC8;
  if (!qword_26A871BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871BC8);
  }
  return result;
}

unint64_t sub_2604FF690()
{
  unint64_t result = qword_26A8734F0;
  if (!qword_26A8734F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734F0);
  }
  return result;
}

unint64_t sub_2604FF6E4()
{
  unint64_t result = qword_26A871F88;
  if (!qword_26A871F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871F88);
  }
  return result;
}

unint64_t sub_2604FF738()
{
  unint64_t result = qword_26A871F80;
  if (!qword_26A871F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871F80);
  }
  return result;
}

unint64_t sub_2604FF78C()
{
  unint64_t result = qword_26B3E8748;
  if (!qword_26B3E8748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8748);
  }
  return result;
}

unint64_t sub_2604FF7E0()
{
  unint64_t result = qword_26A871C88;
  if (!qword_26A871C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C88);
  }
  return result;
}

unint64_t sub_2604FF834()
{
  unint64_t result = qword_26A8734F8;
  if (!qword_26A8734F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8734F8);
  }
  return result;
}

unint64_t sub_2604FF888()
{
  unint64_t result = qword_26A871C90;
  if (!qword_26A871C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C90);
  }
  return result;
}

unint64_t sub_2604FF8DC()
{
  unint64_t result = qword_26A871938;
  if (!qword_26A871938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871938);
  }
  return result;
}

unint64_t sub_2604FF930()
{
  unint64_t result = qword_26A871C80;
  if (!qword_26A871C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C80);
  }
  return result;
}

unint64_t sub_2604FF984()
{
  unint64_t result = qword_26A873500;
  if (!qword_26A873500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873500);
  }
  return result;
}

unint64_t sub_2604FF9D8()
{
  unint64_t result = qword_26A871958;
  if (!qword_26A871958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871958);
  }
  return result;
}

unint64_t sub_2604FFA2C()
{
  unint64_t result = qword_26A871950;
  if (!qword_26A871950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871950);
  }
  return result;
}

unint64_t *_s7ContentOwCP(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2604761F8(*a2);
  *a1 = v3;
  return a1;
}

unint64_t _s7ContentOwxx(unint64_t *a1)
{
  return sub_260476280(*a1);
}

unint64_t *_s7ContentOwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2604761F8(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_260476280(v4);
  return a1;
}

unint64_t *_s7ContentOwta(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_260476280(v3);
  return a1;
}

uint64_t _s7ContentOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x77 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 119);
  }
  unsigned int v3 = ((*(void *)a1 >> 60) & 0x8F | (16 * (*(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x76) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s7ContentOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x76)
  {
    *(void *)unint64_t result = a2 - 119;
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 4) & 7 | (8 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2604FFBCC(void *a1)
{
  uint64_t v1 = *a1 >> 60;
  if (v1 <= 8) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 9;
  }
}

void *sub_2604FFBE8(void *result)
{
  *result &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2604FFBF8(unint64_t *result, uint64_t a2)
{
  if (a2 < 9)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 60;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 9);
    unint64_t v3 = 0x9000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Content()
{
  return &type metadata for IntelligenceElement.Content;
}

ValueMetadata *_s7ContentO11EncodedTypeOMa()
{
  return &_s7ContentO11EncodedTypeON;
}

unsigned char *_s7ContentO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2604FFD18);
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

ValueMetadata *_s7ContentO10CodingKeysOMa()
{
  return &_s7ContentO10CodingKeysON;
}

unint64_t sub_2604FFD54()
{
  unint64_t result = qword_26A873508;
  if (!qword_26A873508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873508);
  }
  return result;
}

unint64_t sub_2604FFDAC()
{
  unint64_t result = qword_26A873510;
  if (!qword_26A873510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873510);
  }
  return result;
}

unint64_t sub_2604FFE04()
{
  unint64_t result = qword_26B3E8758;
  if (!qword_26B3E8758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8758);
  }
  return result;
}

unint64_t sub_2604FFE5C()
{
  unint64_t result = qword_26B3E8750;
  if (!qword_26B3E8750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8750);
  }
  return result;
}

unint64_t sub_2604FFEB0()
{
  unint64_t result = qword_26B3E8B20;
  if (!qword_26B3E8B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B20);
  }
  return result;
}

unint64_t sub_2604FFF04()
{
  unint64_t result = qword_26A873518;
  if (!qword_26A873518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873518);
  }
  return result;
}

unint64_t sub_2604FFF58()
{
  unint64_t result = qword_26A873520;
  if (!qword_26A873520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873520);
  }
  return result;
}

unint64_t sub_2604FFFAC()
{
  unint64_t result = qword_26A8720A0;
  if (!qword_26A8720A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8720A0);
  }
  return result;
}

unint64_t sub_260500000()
{
  unint64_t result = qword_26A871EC0;
  if (!qword_26A871EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EC0);
  }
  return result;
}

unint64_t sub_260500054()
{
  unint64_t result = qword_26A873528;
  if (!qword_26A873528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873528);
  }
  return result;
}

unint64_t sub_2605000A8()
{
  unint64_t result = qword_26A871EE8;
  if (!qword_26A871EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EE8);
  }
  return result;
}

unint64_t sub_2605000FC()
{
  unint64_t result = qword_26B3E8B90;
  if (!qword_26B3E8B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B90);
  }
  return result;
}

unint64_t sub_260500150()
{
  unint64_t result = qword_26B3E8B78;
  if (!qword_26B3E8B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B78);
  }
  return result;
}

unint64_t sub_2605001A4()
{
  unint64_t result = qword_26A873530;
  if (!qword_26A873530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873530);
  }
  return result;
}

unint64_t sub_2605001F8()
{
  unint64_t result = qword_26A873538;
  if (!qword_26A873538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873538);
  }
  return result;
}

uint64_t sub_26050024C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702060386 && a2 == 0xE400000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002605431B0 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6565726373 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x776F646E6977 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x725065746F6D6572 && a2 == 0xED0000737365636FLL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x746E656D75636F64 && a2 == 0xE800000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x64654D6567616D69 && a2 == 0xEA00000000006169)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

char *sub_260500648(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D30);
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v74 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D28);
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  MEMORY[0x270FA5388](v4);
  char v78 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D08);
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  char v73 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D00);
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v64 = v8;
  MEMORY[0x270FA5388](v8);
  char v77 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D38);
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v76 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D10);
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  char v75 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D20);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v72 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D18);
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  char v71 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871D40);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CF8);
  uint64_t v52 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CF0);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1[3];
  char v79 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_2604FFEB0();
  uint64_t v25 = v80;
  sub_260533100();
  if (!v25)
  {
    uint64_t v50 = v19;
    uint64_t v49 = v17;
    uint64_t v51 = v16;
    uint64_t v26 = v75;
    uint64_t v27 = v76;
    uint64_t v29 = v77;
    uint64_t v28 = v78;
    uint64_t v80 = v21;
    uint64_t v30 = v23;
    uint64_t v31 = sub_260532EB0();
    if (*(void *)(v31 + 16) == 1)
    {
      uint64_t v23 = (char *)*(unsigned __int8 *)(v31 + 32);
      switch(*(unsigned char *)(v31 + 32))
      {
        case 1:
          uint64_t v32 = v80;
          v81[7] = 1;
          sub_2605001A4();
          uint64_t v40 = v51;
          sub_260532DD0();
          uint64_t v34 = *(void (**)(char *, uint64_t))(v53 + 8);
          uint64_t v35 = v40;
          uint64_t v36 = &v82;
          goto LABEL_10;
        case 2:
          uint64_t v32 = v80;
          v81[24] = 2;
          sub_260500150();
          uint64_t v41 = v71;
          sub_260532DD0();
          uint64_t v34 = *(void (**)(char *, uint64_t))(v55 + 8);
          uint64_t v35 = v41;
          uint64_t v36 = &v83;
          goto LABEL_10;
        case 3:
          uint64_t v32 = v80;
          v81[25] = 3;
          sub_2605000FC();
          uint64_t v42 = v72;
          sub_260532DD0();
          uint64_t v34 = *(void (**)(char *, uint64_t))(v57 + 8);
          uint64_t v35 = v42;
          uint64_t v36 = &v84;
          goto LABEL_10;
        case 4:
          uint64_t v32 = v80;
          v81[26] = 4;
          sub_2605000A8();
          sub_260532DD0();
          uint64_t v34 = *(void (**)(char *, uint64_t))(v59 + 8);
          uint64_t v35 = v26;
          uint64_t v36 = &v85;
          goto LABEL_10;
        case 5:
          uint64_t v32 = v80;
          v81[27] = 5;
          sub_260500054();
          uint64_t v29 = v27;
          sub_260532DD0();
          uint64_t v44 = v61;
          uint64_t v43 = v62;
          goto LABEL_17;
        case 6:
          uint64_t v32 = v80;
          v81[28] = 6;
          sub_260500000();
          sub_260532DD0();
          uint64_t v44 = v63;
          uint64_t v43 = v64;
          goto LABEL_17;
        case 7:
          uint64_t v32 = v80;
          v81[29] = 7;
          sub_2604FFFAC();
          uint64_t v29 = v73;
          sub_260532DD0();
          uint64_t v44 = v65;
          uint64_t v43 = v66;
LABEL_17:
          uint64_t v34 = *(void (**)(char *, uint64_t))(v44 + 8);
          uint64_t v35 = v29;
          goto LABEL_18;
        case 8:
          uint64_t v46 = v80;
          v81[30] = 8;
          sub_2604FFF58();
          sub_260532DD0();
          (*(void (**)(char *, uint64_t))(v67 + 8))(v28, v68);
          swift_bridgeObjectRelease();
          uint64_t v32 = v46;
          goto LABEL_19;
        case 9:
          uint64_t v47 = v80;
          v81[31] = 9;
          sub_2604FFF04();
          uint64_t v48 = v74;
          sub_260532DD0();
          (*(void (**)(char *, uint64_t))(v69 + 8))(v48, v70);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v20);
          break;
        default:
          uint64_t v32 = v80;
          v81[6] = 0;
          sub_2605001F8();
          uint64_t v33 = v50;
          sub_260532DD0();
          uint64_t v34 = *(void (**)(char *, uint64_t))(v52 + 8);
          uint64_t v35 = v33;
          uint64_t v36 = (uint64_t *)v81;
LABEL_10:
          uint64_t v43 = *(v36 - 32);
LABEL_18:
          v34(v35, v43);
          swift_bridgeObjectRelease();
LABEL_19:
          (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v20);
          break;
      }
    }
    else
    {
      uint64_t v37 = sub_260532CF0();
      swift_allocError();
      uint64_t v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
      *uint64_t v39 = &_s7ContentO11EncodedTypeON;
      sub_260532DE0();
      sub_260532CE0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v23, v20);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
  return v23;
}

uint64_t sub_2605011F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260501258(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8720D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s7ContentO11EncodedTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7ContentO11EncodedTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x260501414);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *_s7ContentO11EncodedTypeO10CodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO10CodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO14BaseCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO14BaseCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO32VirtualCoordinateSpaceCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO32VirtualCoordinateSpaceCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO16ScreenCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO16ScreenCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO16WindowCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO16WindowCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO16RemoteCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO16RemoteCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO23RemoteProcessCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO23RemoteProcessCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO14TextCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO14TextCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO15ImageCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO15ImageCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO18DocumentCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO18DocumentCodingKeysON;
}

ValueMetadata *_s7ContentO11EncodedTypeO20ImageMediaCodingKeysOMa()
{
  return &_s7ContentO11EncodedTypeO20ImageMediaCodingKeysON;
}

unint64_t sub_2605014F0()
{
  unint64_t result = qword_26A873540;
  if (!qword_26A873540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873540);
  }
  return result;
}

unint64_t sub_260501548()
{
  unint64_t result = qword_26B3E8B40;
  if (!qword_26B3E8B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B40);
  }
  return result;
}

unint64_t sub_2605015A0()
{
  unint64_t result = qword_26B3E8B38;
  if (!qword_26B3E8B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B38);
  }
  return result;
}

unint64_t sub_2605015F8()
{
  unint64_t result = qword_26B3E8BE0;
  if (!qword_26B3E8BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BE0);
  }
  return result;
}

unint64_t sub_260501650()
{
  unint64_t result = qword_26B3E8BD8;
  if (!qword_26B3E8BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BD8);
  }
  return result;
}

unint64_t sub_2605016A8()
{
  unint64_t result = qword_26B3E8B88;
  if (!qword_26B3E8B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B88);
  }
  return result;
}

unint64_t sub_260501700()
{
  unint64_t result = qword_26B3E8B80;
  if (!qword_26B3E8B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B80);
  }
  return result;
}

unint64_t sub_260501758()
{
  unint64_t result = qword_26B3E8BA0;
  if (!qword_26B3E8BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BA0);
  }
  return result;
}

unint64_t sub_2605017B0()
{
  unint64_t result = qword_26B3E8B98;
  if (!qword_26B3E8B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B98);
  }
  return result;
}

unint64_t sub_260501808()
{
  unint64_t result = qword_26B3E8B70;
  if (!qword_26B3E8B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B70);
  }
  return result;
}

unint64_t sub_260501860()
{
  unint64_t result = qword_26B3E8B68;
  if (!qword_26B3E8B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B68);
  }
  return result;
}

unint64_t sub_2605018B8()
{
  unint64_t result = qword_26B3E8BD0;
  if (!qword_26B3E8BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BD0);
  }
  return result;
}

unint64_t sub_260501910()
{
  unint64_t result = qword_26B3E8BC8;
  if (!qword_26B3E8BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BC8);
  }
  return result;
}

unint64_t sub_260501968()
{
  unint64_t result = qword_26B3E8B50;
  if (!qword_26B3E8B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B50);
  }
  return result;
}

unint64_t sub_2605019C0()
{
  unint64_t result = qword_26B3E8B48;
  if (!qword_26B3E8B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B48);
  }
  return result;
}

unint64_t sub_260501A18()
{
  unint64_t result = qword_26B3E8B60;
  if (!qword_26B3E8B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B60);
  }
  return result;
}

unint64_t sub_260501A70()
{
  unint64_t result = qword_26B3E8B58;
  if (!qword_26B3E8B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B58);
  }
  return result;
}

unint64_t sub_260501AC8()
{
  unint64_t result = qword_26B3E8BB0;
  if (!qword_26B3E8BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BB0);
  }
  return result;
}

unint64_t sub_260501B20()
{
  unint64_t result = qword_26B3E8BA8;
  if (!qword_26B3E8BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BA8);
  }
  return result;
}

unint64_t sub_260501B78()
{
  unint64_t result = qword_26B3E8BC0;
  if (!qword_26B3E8BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BC0);
  }
  return result;
}

unint64_t sub_260501BD0()
{
  unint64_t result = qword_26B3E8BB8;
  if (!qword_26B3E8BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8BB8);
  }
  return result;
}

unint64_t sub_260501C28()
{
  unint64_t result = qword_26B3E8B30;
  if (!qword_26B3E8B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B30);
  }
  return result;
}

unint64_t sub_260501C80()
{
  unint64_t result = qword_26B3E8B28;
  if (!qword_26B3E8B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8B28);
  }
  return result;
}

uint64_t IntelligenceElement.Text.text.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_260531DD0();
  MEMORY[0x270FA5388](v7);
  sub_260531DB0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_26050B2A8(&qword_26A871C30, MEMORY[0x270FA8478]);
  return sub_2605328B0();
}

uint64_t IntelligenceElement.Text.isTruncated.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + *(int *)(_s4TextV7StorageVMa() + 28));
}

uint64_t IntelligenceElement.Text.isWhitespaceTrimmed.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + *(int *)(_s4TextV7StorageVMa() + 32));
}

unint64_t IntelligenceElement.Text.links.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_260531EB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260531ED0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v17[0] = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873548);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26050A3D8();
  sub_260531EC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  unint64_t v15 = sub_26050A428((uint64_t)v14, (void (*)(char *, char *))sub_26050A420, v1);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v15;
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return sub_260532020();
}

uint64_t sub_260502250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_2605321D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2604F4118(a1, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_26045B7D4((uint64_t)v14, &qword_26A871C58);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8721C8);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a4, 1, 1, v15);
  }
  else
  {
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v37(v11, v14, v8);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8721C8);
    uint64_t v35 = (char *)a4 + *(int *)(v17 + 48);
    uint64_t v36 = v17;
    uint64_t v18 = sub_260531F20();
    uint64_t v33 = a2;
    uint64_t v19 = v18;
    uint64_t v34 = &v31;
    uint64_t v20 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v18);
    uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = a3 + *(void *)(*(void *)a3 + 88);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v23, v19);
    uint64_t v24 = sub_260531DD0();
    uint64_t v31 = (uint64_t)&v31;
    uint64_t v32 = v11;
    uint64_t v25 = a4;
    uint64_t v26 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v24);
    uint64_t v28 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_260531DB0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A871D48);
    MEMORY[0x270FA5388](v29 - 8);
    sub_260531DE0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v24);
    *uint64_t v25 = sub_2605327B0();
    v25[1] = v30;
    v37(v35, v32, v8);
    return (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v25, 0, 1, v36);
  }
}

uint64_t IntelligenceElement.Text.hasLinks.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_260531EB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  sub_260531ED0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871ED0);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = v9;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v55 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = v15;
  v15(v55, (uint64_t)v55, v7);
  sub_26050B2A8(&qword_26A871E08, MEMORY[0x270FA8598]);
  uint64_t v68 = v7;
  sub_2605328E0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871DF8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v61 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_260531EA0();
  uint64_t v19 = *(int *)(v11 + 44);
  uint64_t v66 = v18;
  uint64_t v20 = *(void *)(v18 - 8);
  uint64_t v69 = v14;
  uint64_t v21 = &v14[v19];
  uint64_t v22 = *(uint64_t (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v64 = v20 + 16;
  uint64_t v65 = v22;
  uint64_t v60 = v8 + 16;
  uint64_t v23 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v62 = *(void *)(v20 + 64);
  uint64_t v63 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v56 = &v14[v19];
  for (i = v23; ; uint64_t v23 = i)
  {
    uint64_t v67 = &v54;
    uint64_t v24 = v62;
    MEMORY[0x270FA5388](v18);
    uint64_t v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = v66;
    uint64_t v27 = v65(v25, v21, v66);
    MEMORY[0x270FA5388](v27);
    sub_26050B2A8(&qword_26A871E10, MEMORY[0x270FA8598]);
    sub_2605329B0();
    sub_26050B2A8(&qword_26A871E00, MEMORY[0x270FA8550]);
    char v28 = sub_2605326B0();
    uint64_t v29 = *v63;
    (*v63)(v25, v26);
    v29(v25, v26);
    uint64_t v67 = (uint64_t *)((unint64_t)v23 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
    if (v28)
    {
      uint64_t v51 = sub_260531E90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v61, 1, 1, v51);
LABEL_7:
      sub_26045B7D4((uint64_t)v69, &qword_26A871ED0);
      uint64_t v52 = 0;
      (*i)(v55, v68);
      return v52;
    }
    uint64_t v31 = v68;
    uint64_t v30 = (uint64_t)v69;
    uint64_t v32 = (uint64_t (*)(char *, void))sub_2605329D0();
    uint64_t v34 = v33;
    uint64_t v35 = sub_260531E90();
    uint64_t v36 = *(void *)(v35 - 8);
    uint64_t v37 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v61, v34, v35);
    uint64_t v38 = v32(v70, 0);
    MEMORY[0x270FA5388](v38);
    uint64_t v40 = (char *)&v54 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    v58(v40, v30, v31);
    sub_2605329C0();
    uint64_t v41 = *v23;
    (*v23)(v40, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v37, 0, 1, v35);
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v37, 1, v35);
    if (v42 == 1) {
      goto LABEL_7;
    }
    MEMORY[0x270FA5388](v42);
    uint64_t v44 = (char *)&v54 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v44, v37, v35);
    uint64_t KeyPath = swift_getKeyPath();
    *(&v54 - 2) = MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C58);
    MEMORY[0x270FA5388](v46 - 8);
    uint64_t v48 = (char *)&v54 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_26050A3D8();
    sub_260531E80();
    swift_release();
    uint64_t v49 = sub_2605321D0();
    int v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 48))(v48, 1, v49);
    sub_26045B7D4((uint64_t)v48, &qword_26A871C58);
    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v44, v35);
    if (v50 != 1) {
      break;
    }
    uint64_t v21 = v56;
  }
  sub_26045B7D4((uint64_t)v69, &qword_26A871ED0);
  uint64_t v52 = 1;
  v41(v55, v68);
  return v52;
}

void *IntelligenceElement.Text.selections.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_260531EB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260531ED0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v17[0] = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873550);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26050A9E0();
  sub_260531EC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v15 = sub_26050AA3C((uint64_t)v14, (uint64_t (*)(void, unsigned __int8 *))sub_26050AA34, v1);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v15;
}

uint64_t sub_2605030DC(char a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 1) == 0) {
    return 0;
  }
  v17[14] = v3;
  v17[15] = v4;
  uint64_t v7 = sub_260531F20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a3 + *(void *)(*(void *)a3 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = sub_260531DD0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260531DB0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A871D48);
  MEMORY[0x270FA5388](v16 - 8);
  sub_260531DE0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return sub_2605327B0();
}

uint64_t IntelligenceElement.Text.hasSelections.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_260531EB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  sub_260531ED0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871ED0);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v56 = v9;
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v8 += 16;
  uint64_t v52 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v14;
  uint64_t v55 = v13;
  v13(v52, (uint64_t)v52, v7);
  sub_26050B2A8(&qword_26A871E08, MEMORY[0x270FA8598]);
  sub_2605328E0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871DF8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v59 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_260531EA0();
  uint64_t v19 = v15 + *(int *)(v11 + 44);
  uint64_t v64 = v18;
  uint64_t v20 = *(void *)(v18 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v62 = v20 + 16;
  uint64_t v63 = v21;
  uint64_t v60 = *(void *)(v20 + 64);
  uint64_t v61 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v22 = (void (**)(char *, uint64_t))(v8 - 8);
  uint64_t v54 = v7;
  uint64_t v57 = v8;
  uint64_t v58 = (void (**)(char *, uint64_t))(v8 - 8);
  uint64_t v53 = v19;
  uint64_t v67 = v15;
  while (1)
  {
    uint64_t v66 = &v52;
    uint64_t v23 = v60;
    MEMORY[0x270FA5388](v18);
    uint64_t v24 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v25 = v64;
    uint64_t v26 = v63(v24, v19, v64);
    uint64_t v65 = &v52;
    MEMORY[0x270FA5388](v26);
    sub_26050B2A8(&qword_26A871E10, MEMORY[0x270FA8598]);
    sub_2605329B0();
    sub_26050B2A8(&qword_26A871E00, MEMORY[0x270FA8550]);
    char v27 = sub_2605326B0();
    uint64_t v28 = v7;
    uint64_t v29 = *v61;
    (*v61)(v24, v25);
    v29(v24, v25);
    uint64_t v66 = (char **)((unint64_t)v22 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
    if (v27) {
      break;
    }
    uint64_t v30 = v22;
    uint64_t v31 = v67;
    uint64_t v32 = (uint64_t (*)(char *, void))sub_2605329D0();
    uint64_t v34 = v33;
    uint64_t v35 = sub_260531E90();
    uint64_t v36 = *(void *)(v35 - 8);
    uint64_t v37 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v59, v34, v35);
    uint64_t v38 = v32(v68, 0);
    MEMORY[0x270FA5388](v38);
    uint64_t v40 = (char *)&v52 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    v55(v40, v31, v28);
    sub_2605329C0();
    uint64_t v41 = *v30;
    (*v30)(v40, v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v37, 0, 1, v35);
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v37, 1, v35);
    if (v42 == 1) {
      goto LABEL_10;
    }
    uint64_t v43 = v67;
    MEMORY[0x270FA5388](v42);
    uint64_t v45 = (char *)&v52 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v45, v37, v35);
    uint64_t KeyPath = swift_getKeyPath();
    *(&v52 - 2) = (char *)MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    sub_26050A9E0();
    sub_260531E80();
    swift_release();
    char v47 = v68[0];
    if (v68[0] == 2)
    {
      uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v45, v35);
    }
    else
    {
      uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v45, v35);
      if (v47)
      {
        sub_26045B7D4(v43, &qword_26A871ED0);
        uint64_t v48 = 1;
        uint64_t v49 = v54;
        goto LABEL_11;
      }
    }
    uint64_t v7 = v54;
    uint64_t v22 = v58;
    uint64_t v19 = v53;
  }
  uint64_t v50 = sub_260531E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v59, 1, 1, v50);
LABEL_10:
  sub_26045B7D4(v67, &qword_26A871ED0);
  uint64_t v48 = 0;
  uint64_t v41 = *v58;
  uint64_t v49 = v28;
LABEL_11:
  v41(v52, v49);
  return v48;
}

uint64_t IntelligenceElement.Text.averageFontSize.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C40);
  uint64_t v52 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260531F20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v49 = v7;
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16);
  uint64_t v47 = v6 + 16;
  uint64_t v48 = v9;
  uint64_t v46 = v10;
  ((void (*)(char *, uint64_t, uint64_t))v10)(v8, v9, v5);
  uint64_t v11 = sub_260531EB0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260531ED0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v50 = v6 + 8;
  uint64_t v51 = v5;
  uint64_t v45 = v15;
  v15(v8, v5);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C48);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26050AE70();
  sub_260531EC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  MEMORY[0x2612115E0](v16);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CB0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (double *)((char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v23 = 0.0;
  double v24 = 0.0;
  while (1)
  {
    sub_260531E70();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CA8);
    if ((*(unsigned int (**)(double *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v22, 1, v25) == 1) {
      break;
    }
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871EC8);
    MEMORY[0x270FA5388](v26);
    uint64_t v28 = (char *)v42 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    double v29 = *v22;
    char v30 = *((unsigned char *)v22 + 8);
    sub_26049C1A0((uint64_t)v22 + *(int *)(v25 + 48), (uint64_t)v28, &qword_26A871EC8);
    if ((v30 & 1) != 0
      || (sub_260531EF0(), sub_26050B2A8(&qword_26A871C50, MEMORY[0x270FA85C0]), uint64_t v31 = sub_2605326B0(), (v31 & 1) != 0))
    {
      sub_26045B7D4((uint64_t)v28, &qword_26A871EC8);
    }
    else
    {
      v42[3] = v42;
      __n128 v32 = MEMORY[0x270FA5388](v31);
      uint64_t v34 = (char *)v42 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v35 = v51;
      v46(v34, v48, v51, v32);
      uint64_t v44 = sub_260531DD0();
      v42[2] = v42;
      v42[0] = *(void *)(v44 - 8);
      MEMORY[0x270FA5388](v44);
      uint64_t v43 = (char *)v42 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_260531DB0();
      v45(v34, v35);
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A871D48);
      v42[1] = v42;
      MEMORY[0x270FA5388](v37);
      uint64_t v39 = (char *)v42 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_260531DE0();
      (*(void (**)(char *, uint64_t))(v42[0] + 8))(v43, v44);
      sub_26050B2A8(&qword_26A871C38, MEMORY[0x270FA8478]);
      uint64_t v40 = sub_2605329A0();
      sub_26045B7D4((uint64_t)v39, (uint64_t *)&unk_26A871D48);
      sub_26045B7D4((uint64_t)v28, &qword_26A871EC8);
      double v24 = v24 + v29 * (double)v40;
      double v23 = v23 + (double)v40;
    }
  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v4, v2);
  if (v23 > 0.0) {
    *(double *)&uint64_t result = v24 / v23;
  }
  else {
    *(double *)&uint64_t result = 0.0;
  }
  return result;
}

uint64_t sub_260504198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_2605326B0() & 1;
}

uint64_t IntelligenceElement.Text.attributedText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = sub_260531F20();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t IntelligenceElement.Text.Editable.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntelligenceElement.Text.Editable.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntelligenceElement.Text.Editable.label.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Text.Editable.prompt.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntelligenceElement.Text.Editable.prompt.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntelligenceElement.Text.Editable.prompt.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Text.Editable.contentType.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntelligenceElement.Text.Editable.contentType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*IntelligenceElement.Text.Editable.contentType.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Text.Editable.isSecure.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t IntelligenceElement.Text.Editable.isSecure.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t (*IntelligenceElement.Text.Editable.isSecure.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Text.Editable.isFocused.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t IntelligenceElement.Text.Editable.isFocused.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 49) = result;
  return result;
}

uint64_t (*IntelligenceElement.Text.Editable.isFocused.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceElement.Text.Editable.init(label:prompt:contentType:isSecure:isFocused:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 49) = a8;
  return result;
}

uint64_t IntelligenceElement.Text.editable.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(_s4TextV7StorageVMa() + 20);
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t v7 = *(void *)(v4 + 16);
  uint64_t v8 = *(void *)(v4 + 24);
  uint64_t v9 = *(void *)(v4 + 32);
  uint64_t v10 = *(void *)(v4 + 40);
  *(void *)a1 = *(void *)v4;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(_WORD *)(a1 + 48) = *(_WORD *)(v4 + 48);
  return sub_26050AEC4(v5, v6);
}

uint64_t sub_260504528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(_s4TextV7StorageVMa() + 20);
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t v7 = *(void *)(v4 + 16);
  uint64_t v8 = *(void *)(v4 + 24);
  uint64_t v9 = *(void *)(v4 + 32);
  uint64_t v10 = *(void *)(v4 + 40);
  *(void *)a2 = *(void *)v4;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v8;
  *(void *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(_WORD *)(a2 + 48) = *(_WORD *)(v4 + 48);
  return sub_26050AEC4(v5, v6);
}

uint64_t sub_2605045B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  __int16 v6 = *(_WORD *)(a1 + 48);
  *(void *)&long long v8 = *(void *)a1;
  *((void *)&v8 + 1) = v1;
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  __int16 v13 = v6;
  sub_26050AEC4(v8, v1);
  return IntelligenceElement.Text.editable.setter(&v8);
}

uint64_t IntelligenceElement.Text.editable.setter(long long *a1)
{
  uint64_t v3 = _s4TextV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  __int16 v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v20 - v8;
  long long v10 = *a1;
  long long v20 = a1[1];
  long long v21 = v10;
  uint64_t v11 = *((void *)a1 + 4);
  uint64_t v12 = *((void *)a1 + 5);
  __int16 v13 = *((_WORD *)a1 + 24);
  uint64_t v14 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26050AF18(v14, (uint64_t)v9);
  uint64_t v15 = &v9[*(int *)(v4 + 28)];
  sub_26050AF7C(*(void *)v15, *((void *)v15 + 1));
  long long v16 = v20;
  *(_OWORD *)uint64_t v15 = v21;
  *((_OWORD *)v15 + 1) = v16;
  *((void *)v15 + 4) = v11;
  *((void *)v15 + 5) = v12;
  *((_WORD *)v15 + 24) = v13;
  sub_26050AF18((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v17 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26050B090((uint64_t)v6, v17);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
    uint64_t v18 = swift_allocObject();
    sub_26050AFD0((uint64_t)v6, v18 + *(void *)(*(void *)v18 + 88));
    swift_release();
    *(void *)uint64_t v1 = v18;
  }
  return sub_26050B034((uint64_t)v9);
}

void (*IntelligenceElement.Text.editable.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v5 = v4 + *(int *)(_s4TextV7StorageVMa() + 20);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *(void *)(v5 + 8);
  uint64_t v8 = *(void *)(v5 + 16);
  uint64_t v9 = *(void *)(v5 + 24);
  uint64_t v10 = *(void *)(v5 + 32);
  uint64_t v11 = *(void *)(v5 + 40);
  __int16 v12 = *(_WORD *)(v5 + 48);
  *uint64_t v3 = *(void *)v5;
  v3[1] = v7;
  v3[2] = v8;
  v3[3] = v9;
  v3[4] = v10;
  v3[5] = v11;
  *((_WORD *)v3 + 24) = v12;
  sub_26050AEC4(v6, v7);
  return sub_2605048A0;
}

void sub_2605048A0(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = **a1;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  __int16 v10 = *((_WORD *)v3 + 24);
  *(void *)&long long v11 = v4;
  *((void *)&v11 + 1) = v5;
  uint64_t v12 = v6;
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  __int16 v16 = v10;
  if (a2)
  {
    sub_26050AEC4(v4, v5);
    IntelligenceElement.Text.editable.setter(&v11);
    sub_26050AF7C(*v3, v3[1]);
  }
  else
  {
    IntelligenceElement.Text.editable.setter(&v11);
  }

  free(v3);
}

uint64_t IntelligenceElement.Text.LineLimit.hash(into:)()
{
  return sub_2605330A0();
}

BOOL static IntelligenceElement.Text.LineLimit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260504984()
{
  uint64_t v1 = 0x694C656C676E6973;
  if (*v0 != 1) {
    uint64_t v1 = 0x656C7069746C756DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_2605049F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26050CB08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_260504A18(uint64_t a1)
{
  unint64_t v2 = sub_26050B0F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260504A54(uint64_t a1)
{
  unint64_t v2 = sub_26050B0F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260504A90(uint64_t a1)
{
  unint64_t v2 = sub_26050B148();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260504ACC(uint64_t a1)
{
  unint64_t v2 = sub_26050B148();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260504B08(uint64_t a1)
{
  unint64_t v2 = sub_26050B19C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260504B44(uint64_t a1)
{
  unint64_t v2 = sub_26050B19C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260504B80(uint64_t a1)
{
  unint64_t v2 = sub_26050B1F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260504BBC(uint64_t a1)
{
  unint64_t v2 = sub_26050B1F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Text.LineLimit.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C20);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  double v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C08);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C18);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C10);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26050B0F4();
  sub_260533120();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_26050B19C();
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_26050B148();
      uint64_t v17 = v23;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_26050B1F0();
    sub_260532EC0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t IntelligenceElement.Text.LineLimit.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceElement.Text.LineLimit.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CE8);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CD0);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CE0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CD8);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26050B0F4();
  uint64_t v12 = (uint64_t)v39;
  sub_260533100();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_260532EB0();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_260532CF0();
    swift_allocError();
    double v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    *double v23 = &type metadata for IntelligenceElement.Text.LineLimit;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_26050B19C();
      uint64_t v18 = v30;
      sub_260532DD0();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_26050B148();
      uint64_t v25 = v30;
      sub_260532DD0();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_26050B1F0();
    uint64_t v24 = v30;
    sub_260532DD0();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

uint64_t sub_26050555C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return IntelligenceElement.Text.LineLimit.init(from:)(a1, a2);
}

uint64_t sub_260505574(void *a1)
{
  return IntelligenceElement.Text.LineLimit.encode(to:)(a1);
}

uint64_t IntelligenceElement.Text.lineLimit.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t result = _s4TextV7StorageVMa();
  *a1 = *(unsigned char *)(v3 + *(int *)(result + 24));
  return result;
}

uint64_t sub_2605055F8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t result = _s4TextV7StorageVMa();
  *a2 = *(unsigned char *)(v3 + *(int *)(result + 24));
  return result;
}

uint64_t IntelligenceElement.Text.lineLimit.setter(char *a1)
{
  uint64_t v3 = _s4TextV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v15[-v8];
  char v10 = *a1;
  uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26050AF18(v11, (uint64_t)v9);
  v9[*(int *)(v4 + 32)] = v10;
  sub_26050AF18((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v12 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26050B090((uint64_t)v6, v12);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
    uint64_t v13 = swift_allocObject();
    sub_26050AFD0((uint64_t)v6, v13 + *(void *)(*(void *)v13 + 88));
    swift_release();
    *(void *)uint64_t v1 = v13;
  }
  return sub_26050B034((uint64_t)v9);
}

void (*IntelligenceElement.Text.lineLimit.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v4 + *(int *)(_s4TextV7StorageVMa() + 24));
  return sub_260505898;
}

void sub_260505898(uint64_t a1, char a2)
{
  unint64_t v2 = *(void **)a1;
  if (a2)
  {
    char v4 = *(unsigned char *)(*(void *)a1 + 32);
    uint64_t v3 = &v4;
  }
  else
  {
    char v5 = *(unsigned char *)(*(void *)a1 + 32);
    uint64_t v3 = &v5;
  }
  IntelligenceElement.Text.lineLimit.setter(v3);

  free(v2);
}

uint64_t IntelligenceElement.Text.init(text:editable:textOptions:)@<X0>(long long *a1@<X2>, uint64_t *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v39 = a3;
  char v5 = (int *)_s4TextV7StorageVMa();
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v31 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v31 - v11;
  long long v13 = *a1;
  long long v37 = a1[1];
  long long v38 = v13;
  uint64_t v14 = *((void *)a1 + 4);
  uint64_t v15 = *((void *)a1 + 5);
  LOWORD(a1) = *((_WORD *)a1 + 24);
  uint64_t v16 = a2[1];
  uint64_t v17 = a2[2];
  uint64_t v31 = *a2;
  uint64_t v32 = v17;
  uint64_t v18 = a2[4];
  uint64_t v33 = a2[3];
  uint64_t v34 = v18;
  int v35 = *((unsigned __int16 *)a2 + 20);
  uint64_t v19 = sub_260531FD0();
  MEMORY[0x270FA5388](v19 - 8);
  sub_260531FC0();
  sub_260531F30();
  uint64_t v20 = &v12[v5[5]];
  long long v21 = v37;
  *(_OWORD *)uint64_t v20 = v38;
  *((_OWORD *)v20 + 1) = v21;
  *((void *)v20 + 4) = v14;
  *((void *)v20 + 5) = v15;
  *((_WORD *)v20 + 24) = (_WORD)a1;
  v12[v5[6]] = 0;
  v12[v5[7]] = 0;
  v12[v5[8]] = 0;
  v12[v5[9]] = 1;
  uint64_t v22 = &v12[v5[10]];
  *(void *)uint64_t v22 = 1000000;
  *((_WORD *)v22 + 4) = 256;
  *((void *)v22 + 2) = 100000;
  *((_WORD *)v22 + 12) = 256;
  *((void *)v22 + 4) = 10000;
  *((_WORD *)v22 + 20) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v23 + *(void *)(*(void *)v23 + 88);
  uint64_t result = sub_26050AFD0((uint64_t)v12, v24);
  if ((v16 & 0xFF00) != 0x200)
  {
    swift_beginAccess();
    sub_26050AF18(v24, (uint64_t)v9);
    uint64_t v26 = &v9[v5[10]];
    *(void *)uint64_t v26 = v31;
    v26[8] = v16 & 1;
    v26[9] = BYTE1(v16) & 1;
    __int16 v27 = v33;
    *((void *)v26 + 2) = v32;
    v26[24] = v27 & 1;
    v26[25] = HIBYTE(v27) & 1;
    *((void *)v26 + 4) = v34;
    HIBYTE(v27) = BYTE1(v35);
    v26[40] = v35 & 1;
    v26[41] = HIBYTE(v27) & 1;
    uint64_t v28 = v36;
    sub_26050AF18((uint64_t)v9, v36);
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v29 = v23 + *(void *)(*(void *)v23 + 88);
      swift_beginAccess();
      sub_26050B090(v28, v29);
      swift_endAccess();
    }
    else
    {
      uint64_t v30 = swift_allocObject();
      sub_26050AFD0(v28, v30 + *(void *)(*(void *)v30 + 88));
      swift_release();
      uint64_t v23 = v30;
    }
    uint64_t result = sub_26050B034((uint64_t)v9);
  }
  *uint64_t v39 = v23;
  return result;
}

uint64_t IntelligenceElement.Text.init(text:editable:)@<X0>(long long *a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = _s4TextV7StorageVMa();
  char v5 = (int *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *a1;
  long long v18 = a1[1];
  long long v19 = v8;
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = *((void *)a1 + 5);
  __int16 v11 = *((_WORD *)a1 + 24);
  uint64_t v12 = sub_260531FD0();
  MEMORY[0x270FA5388](v12 - 8);
  sub_260531FC0();
  sub_260531F30();
  long long v13 = &v7[v5[7]];
  long long v14 = v18;
  *(_OWORD *)long long v13 = v19;
  *((_OWORD *)v13 + 1) = v14;
  *((void *)v13 + 4) = v9;
  *((void *)v13 + 5) = v10;
  *((_WORD *)v13 + 24) = v11;
  v7[v5[8]] = 0;
  v7[v5[9]] = 0;
  v7[v5[10]] = 0;
  v7[v5[11]] = 1;
  uint64_t v15 = &v7[v5[12]];
  *(void *)uint64_t v15 = 1000000;
  *((_WORD *)v15 + 4) = 256;
  *((void *)v15 + 2) = 100000;
  *((_WORD *)v15 + 12) = 256;
  *((void *)v15 + 4) = 10000;
  *((_WORD *)v15 + 20) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
  uint64_t v16 = swift_allocObject();
  uint64_t result = sub_26050AFD0((uint64_t)v7, v16 + *(void *)(*(void *)v16 + 88));
  *a2 = v16;
  return result;
}

uint64_t IntelligenceElement.Text.init(attributedText:editable:textOptions:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v7 = (int *)_s4TextV7StorageVMa();
  MEMORY[0x270FA5388](v7);
  uint64_t v44 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v43 = (uint64_t)&v37 - v10;
  MEMORY[0x270FA5388](v11);
  long long v13 = (char *)&v37 - v12;
  long long v14 = *a2;
  long long v45 = a2[1];
  long long v46 = v14;
  uint64_t v16 = *((void *)a2 + 4);
  uint64_t v15 = *((void *)a2 + 5);
  __int16 v17 = *((_WORD *)a2 + 24);
  uint64_t v18 = a3[1];
  uint64_t v38 = *a3;
  uint64_t v19 = a3[3];
  uint64_t v39 = a3[2];
  uint64_t v40 = v19;
  uint64_t v41 = a3[4];
  int v42 = *((unsigned __int16 *)a3 + 20);
  uint64_t v20 = sub_260531F20();
  __n128 v21 = MEMORY[0x270FA5388](v20);
  uint64_t v47 = v23;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v23 + 16);
  uint64_t v49 = a1;
  v24((char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v20, v21);
  swift_getKeyPath();
  sub_26050B254();
  sub_26050B2A8(&qword_26A871B98, MEMORY[0x270FA8660]);
  uint64_t v48 = v20;
  sub_260531F40();
  uint64_t v25 = &v13[v7[5]];
  long long v26 = v45;
  *(_OWORD *)uint64_t v25 = v46;
  *((_OWORD *)v25 + 1) = v26;
  *((void *)v25 + 4) = v16;
  *((void *)v25 + 5) = v15;
  *((_WORD *)v25 + 24) = v17;
  v13[v7[6]] = 0;
  v13[v7[7]] = 0;
  v13[v7[8]] = 0;
  v13[v7[9]] = 1;
  __int16 v27 = &v13[v7[10]];
  *(void *)__int16 v27 = 1000000;
  *((_WORD *)v27 + 4) = 256;
  *((void *)v27 + 2) = 100000;
  *((_WORD *)v27 + 12) = 256;
  *((void *)v27 + 4) = 10000;
  *((_WORD *)v27 + 20) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v28 + *(void *)(*(void *)v28 + 88);
  sub_26050AFD0((uint64_t)v13, v29);
  if ((v18 & 0xFF00) != 0x200)
  {
    swift_beginAccess();
    uint64_t v30 = v43;
    sub_26050AF18(v29, v43);
    uint64_t v31 = v30 + v7[10];
    *(void *)uint64_t v31 = v38;
    *(unsigned char *)(v31 + 8) = v18 & 1;
    *(unsigned char *)(v31 + 9) = BYTE1(v18) & 1;
    __int16 v32 = v40;
    *(void *)(v31 + 16) = v39;
    *(unsigned char *)(v31 + 24) = v32 & 1;
    *(unsigned char *)(v31 + 25) = HIBYTE(v32) & 1;
    *(void *)(v31 + 32) = v41;
    HIBYTE(v32) = BYTE1(v42);
    *(unsigned char *)(v31 + 40) = v42 & 1;
    *(unsigned char *)(v31 + 41) = HIBYTE(v32) & 1;
    uint64_t v33 = v44;
    sub_26050AF18(v30, v44);
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v34 = v28 + *(void *)(*(void *)v28 + 88);
      swift_beginAccess();
      sub_26050B090(v33, v34);
      swift_endAccess();
    }
    else
    {
      uint64_t v35 = swift_allocObject();
      sub_26050AFD0(v33, v35 + *(void *)(*(void *)v35 + 88));
      swift_release();
      uint64_t v28 = v35;
    }
    sub_26050B034(v30);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8))(v49, v48);
  *uint64_t v50 = v28;
  return result;
}

uint64_t IntelligenceElement.Text.init(attributedText:editable:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  __int16 v32 = a3;
  uint64_t v5 = _s4TextV7StorageVMa();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v9 = *a2;
  long long v30 = a2[1];
  long long v31 = v9;
  uint64_t v10 = *((void *)a2 + 4);
  uint64_t v28 = *((void *)a2 + 5);
  uint64_t v29 = v10;
  int v27 = *((unsigned __int16 *)a2 + 24);
  uint64_t v11 = sub_260531F20();
  uint64_t v12 = *(void **)(v11 - 8);
  uint64_t v13 = v12[8];
  __n128 v14 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = (uint64_t (*)(unsigned char *, uint64_t, uint64_t, __n128))v12[2];
  uint64_t v17 = v16(v15, a1, v11, v14);
  __n128 v18 = MEMORY[0x270FA5388](v17);
  v16(v15, (uint64_t)v15, v11, v18);
  swift_getKeyPath();
  sub_26050B254();
  sub_26050B2A8(&qword_26A871B98, MEMORY[0x270FA8660]);
  sub_260531F40();
  uint64_t v19 = &v8[v6[7]];
  long long v20 = v30;
  *(_OWORD *)uint64_t v19 = v31;
  *((_OWORD *)v19 + 1) = v20;
  uint64_t v21 = v28;
  *((void *)v19 + 4) = v29;
  *((void *)v19 + 5) = v21;
  *((_WORD *)v19 + 24) = v27;
  v8[v6[8]] = 0;
  v8[v6[9]] = 0;
  v8[v6[10]] = 0;
  v8[v6[11]] = 1;
  uint64_t v22 = &v8[v6[12]];
  *(void *)uint64_t v22 = 1000000;
  *((_WORD *)v22 + 4) = 256;
  *((void *)v22 + 2) = 100000;
  *((_WORD *)v22 + 12) = 256;
  *((void *)v22 + 4) = 10000;
  *((_WORD *)v22 + 20) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
  uint64_t v23 = swift_allocObject();
  sub_26050AFD0((uint64_t)v8, v23 + *(void *)(*(void *)v23 + 88));
  uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))v12[1];
  v24((uint64_t)v15, v11);
  uint64_t result = v24(a1, v11);
  *__int16 v32 = v23;
  return result;
}

uint64_t sub_260506534(unsigned __int8 *a1, char *a2)
{
  return sub_26052754C(*a1, *a2);
}

uint64_t sub_260506540()
{
  return sub_2605220E4();
}

uint64_t sub_260506548()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260506638()
{
  return sub_2605289C4();
}

uint64_t sub_260506640@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26050CC90();
  *a1 = result;
  return result;
}

void sub_260506678(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x676E696B636162;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x656C626174696465;
      goto LABEL_3;
    case 2:
      *a1 = 0x696D694C656E696CLL;
      a1[1] = 0xE900000000000074;
      break;
    case 3:
      *a1 = 0x61636E7572547369;
      a1[1] = 0xEB00000000646574;
      break;
    case 4:
      *a1 = 0xD000000000000013;
      a1[1] = 0x8000000260540C40;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_260506744()
{
  unint64_t result = 0x676E696B636162;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C626174696465;
      break;
    case 2:
      unint64_t result = 0x696D694C656E696CLL;
      break;
    case 3:
      unint64_t result = 0x61636E7572547369;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260506800@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26050CC90();
  *a1 = result;
  return result;
}

uint64_t sub_260506830(uint64_t a1)
{
  unint64_t v2 = sub_26050B2F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050686C(uint64_t a1)
{
  unint64_t v2 = sub_26050B2F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Text.encode(to:)(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C00);
  uint64_t v5 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26050B2F0();
  sub_260533120();
  uint64_t v9 = sub_260531F20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = v8 + *(void *)(*(void *)v8 + 88);
  swift_beginAccess();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v65 = v9;
  uint64_t v66 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13(v66, v12, v9);
  uint64_t v14 = _s4TextV7StorageVMa();
  uint64_t v15 = (int *)v14;
  uint64_t v16 = (uint64_t *)(v12 + *(int *)(v14 + 20));
  uint64_t v17 = v16[1];
  uint64_t v63 = v10;
  if (v17 == 1)
  {
    uint64_t v18 = v64;
  }
  else
  {
    uint64_t v56 = v5;
    uint64_t v57 = v7;
    uint64_t v58 = v2;
    uint64_t v59 = (int *)v14;
    uint64_t v19 = *v16;
    uint64_t v20 = v16[2];
    uint64_t v21 = v16[3];
    uint64_t v22 = v16[4];
    uint64_t v23 = v16[5];
    uint64_t v61 = v21;
    uint64_t v62 = v22;
    __int16 v24 = *((_WORD *)v16 + 24);
    uint64_t v60 = v20;
    if (v24)
    {
      uint64_t v54 = (uint64_t)&v54;
      int v75 = v24 & 1;
      MEMORY[0x270FA5388](v14);
      uint64_t v55 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_260531F10();
      uint64_t v30 = v23;
      uint64_t v31 = v65;
      __int16 v32 = v66;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v66, v65);
      uint64_t v33 = v32;
      uint64_t v23 = v30;
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v33, (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v31);
      char v27 = v75;
      uint64_t v28 = v55;
      uint64_t v26 = v60;
      uint64_t v21 = v61;
    }
    else
    {
      uint64_t v25 = v19;
      uint64_t v26 = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v27 = v24 & 1;
      uint64_t v28 = v25;
    }
    uint64_t v67 = v28;
    unint64_t v68 = v17;
    uint64_t v69 = v26;
    uint64_t v70 = v21;
    uint64_t v71 = v62;
    uint64_t v72 = v23;
    char v73 = v27;
    char v74 = HIBYTE(v24) & 1;
    char v76 = 1;
    uint64_t v34 = v28;
    sub_26050B3EC();
    uint64_t v18 = v64;
    uint64_t v35 = v57;
    uint64_t v36 = v58;
    sub_260532F40();
    if (v36)
    {
      (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v65);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v35, v18);
      return sub_26050AF7C(v34, v17);
    }
    sub_26050AF7C(v34, v17);
    uint64_t v3 = 0;
    uint64_t v5 = v56;
    uint64_t v7 = v35;
    uint64_t v15 = v59;
  }
  if (*(unsigned char *)(v12 + v15[9]) != 1)
  {
    if (*(unsigned char *)(v12 + v15[7]) == 1)
    {
      LOBYTE(v67) = 3;
      sub_260532F10();
      int v42 = v66;
      if (v3) {
        goto LABEL_27;
      }
    }
    else
    {
      int v42 = v66;
    }
    if (*(unsigned char *)(v12 + v15[8]) != 1) {
      goto LABEL_29;
    }
    LOBYTE(v67) = 4;
    sub_260532F10();
    if (!v3) {
      goto LABEL_29;
    }
LABEL_27:
    (*(void (**)(char *, uint64_t))(v63 + 8))(v42, v65);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  }
  uint64_t v67 = v8;
  swift_retain();
  char v38 = IntelligenceElement.Text.hasSelections.getter();
  uint64_t v59 = v15;
  if (v38)
  {
    uint64_t v39 = (Swift::Int *)(v12 + v15[10]);
    uint64_t v40 = (char *)(v39 + 1);
    uint64_t v41 = (unsigned __int8 *)v39 + 9;
  }
  else
  {
    uint64_t v43 = v12 + v15[5];
    if (*(void *)(v43 + 8) != 1 && (*(_WORD *)(v43 + 48) & 0x100) != 0)
    {
      uint64_t v45 = v12 + v15[10];
      uint64_t v39 = (Swift::Int *)(v45 + 16);
      uint64_t v40 = (char *)(v45 + 24);
      uint64_t v41 = (unsigned __int8 *)(v45 + 25);
    }
    else
    {
      uint64_t v44 = v12 + v15[10];
      uint64_t v39 = (Swift::Int *)(v44 + 32);
      uint64_t v40 = (char *)(v44 + 40);
      uint64_t v41 = (unsigned __int8 *)(v44 + 41);
    }
  }
  char v46 = *v40;
  Swift::Int v47 = *v39;
  int v48 = *v41;
  swift_release();
  v77.value = v47;
  v77.is_nil = v46;
  int v42 = v66;
  if (AttributedString.trim(maximumLength:trimWhitespace:)(v77, v48))
  {
    LOBYTE(v67) = 3;
    sub_260532F10();
    if (v3) {
      goto LABEL_27;
    }
  }
  if (v48)
  {
    LOBYTE(v67) = 4;
    sub_260532F10();
    if (v3) {
      goto LABEL_27;
    }
  }
  uint64_t v15 = v59;
LABEL_29:
  if (*(unsigned char *)(v12 + v15[6]))
  {
    LOBYTE(v67) = *(unsigned char *)(v12 + v15[6]);
    char v76 = 2;
    sub_26050B344();
    sub_260532F40();
    uint64_t v49 = v65;
    if (v3)
    {
LABEL_35:
      (*(void (**)(char *, uint64_t))(v63 + 8))(v42, v49);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
    }
  }
  else
  {
    uint64_t v49 = v65;
  }
  sub_260531CA0();
  swift_allocObject();
  sub_260531C90();
  sub_26050B398();
  uint64_t v50 = sub_260531C70();
  if (v3)
  {
    swift_release();
    goto LABEL_35;
  }
  uint64_t v52 = v50;
  unint64_t v53 = v51;
  swift_release();
  uint64_t v67 = v52;
  unint64_t v68 = v53;
  char v76 = 0;
  sub_260483790();
  sub_260532F40();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v42, v49);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  return sub_260464128(v52, v53);
}

uint64_t IntelligenceElement.Text.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v4 = _s4TextV7StorageVMa();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CC8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v34[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = a1[3];
  unint64_t v53 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_26050B2F0();
  sub_260533100();
  if (!v2)
  {
    uint64_t v49 = (int *)v4;
    uint64_t v50 = v6;
    uint64_t v51 = v8;
    char v60 = 0;
    sub_26048393C();
    sub_260532E70();
    uint64_t v47 = v7;
    int v48 = v10;
    long long v12 = v54;
    uint64_t v13 = sub_260531F20();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(void *)(v14 + 64);
    MEMORY[0x270FA5388](v13);
    sub_260531C60();
    swift_allocObject();
    sub_260531C50();
    sub_26050B440();
    sub_260531C30();
    uint64_t v43 = &v34[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
    long long v44 = v12;
    uint64_t v45 = v13;
    char v46 = v34;
    swift_release();
    char v60 = 2;
    sub_26050B494();
    uint64_t v17 = v47;
    uint64_t v16 = v48;
    sub_260532E30();
    if (v54 == 3) {
      int v18 = 0;
    }
    else {
      int v18 = v54;
    }
    LOBYTE(v54) = 3;
    int v19 = sub_260532E00();
    LOBYTE(v54) = 4;
    int v41 = sub_260532E00();
    int v42 = v19;
    int v59 = v18;
    char v60 = 1;
    sub_26050B4E8();
    uint64_t v21 = sub_260532E30();
    uint64_t v22 = v45;
    unint64_t v23 = *((void *)&v44 + 1);
    __int16 v24 = v43;
    uint64_t v40 = v34;
    v41 &= 1u;
    v42 &= 1u;
    long long v39 = v54;
    long long v38 = v55;
    uint64_t v37 = v56;
    uint64_t v36 = v57;
    int v35 = v58;
    __n128 v25 = MEMORY[0x270FA5388](v21);
    uint64_t v26 = &v34[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *, unsigned char *, uint64_t, __n128))(v14 + 16))(v26, v24, v22, v25);
    sub_260464128(v44, v23);
    (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v24, v22);
    (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v16, v17);
    uint64_t v27 = (uint64_t)v50;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32))(v50, v26, v22);
    uint64_t v28 = v49;
    uint64_t v29 = v27 + v49[5];
    long long v30 = v38;
    *(_OWORD *)uint64_t v29 = v39;
    *(_OWORD *)(v29 + 16) = v30;
    uint64_t v31 = v36;
    *(void *)(v29 + 32) = v37;
    *(void *)(v29 + 40) = v31;
    *(_WORD *)(v29 + 48) = v35;
    *(unsigned char *)(v27 + v28[6]) = v59;
    *(unsigned char *)(v27 + v28[7]) = v42;
    *(unsigned char *)(v27 + v28[8]) = v41;
    *(unsigned char *)(v27 + v28[9]) = 0;
    uint64_t v32 = v27 + v28[10];
    *(void *)uint64_t v32 = 1000000;
    *(_WORD *)(v32 + 8) = 256;
    *(void *)(v32 + 16) = 100000;
    *(_WORD *)(v32 + 24) = 256;
    *(void *)(v32 + 32) = 10000;
    *(_WORD *)(v32 + 40) = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871E18);
    uint64_t v33 = swift_allocObject();
    sub_26050AFD0(v27, v33 + *(void *)(*(void *)v33 + 88));
    *uint64_t v52 = v33;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
}

uint64_t sub_260507610@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceElement.Text.init(from:)(a1, a2);
}

uint64_t sub_260507628(void *a1)
{
  return IntelligenceElement.Text.encode(to:)(a1);
}

uint64_t sub_260507640(unsigned __int8 *a1, char *a2)
{
  return sub_260527378(*a1, *a2);
}

uint64_t sub_26050764C()
{
  return sub_2605330E0();
}

uint64_t sub_260507748()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_26050782C()
{
  return sub_2605330E0();
}

uint64_t sub_260507924@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26050CC90();
  *a1 = result;
  return result;
}

void sub_26050795C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x6C6562616CLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x74706D6F7270;
      goto LABEL_3;
    case 2:
      *a1 = 0x54746E65746E6F63;
      a1[1] = 0xEB00000000657079;
      break;
    case 3:
      *a1 = 0x6572756365537369;
      a1[1] = 0xE800000000000000;
      break;
    case 4:
      *a1 = 0x657375636F467369;
      a1[1] = 0xE900000000000064;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_260507A1C()
{
  uint64_t result = 0x6C6562616CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x74706D6F7270;
      break;
    case 2:
      uint64_t result = 0x54746E65746E6F63;
      break;
    case 3:
      uint64_t result = 0x6572756365537369;
      break;
    case 4:
      uint64_t result = 0x657375636F467369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260507ACC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26050CC90();
  *a1 = result;
  return result;
}

uint64_t sub_260507AFC(uint64_t a1)
{
  unint64_t v2 = sub_26050B53C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260507B38(uint64_t a1)
{
  unint64_t v2 = sub_26050B53C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Text.Editable.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873570);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v17 = *(void *)(v1 + 24);
  uint64_t v18 = v7;
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v15 = *(void *)(v1 + 40);
  uint64_t v16 = v8;
  LODWORD(v8) = *(unsigned __int8 *)(v1 + 48);
  int v13 = *(unsigned __int8 *)(v1 + 49);
  int v14 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26050B53C();
  sub_260533120();
  char v24 = 0;
  uint64_t v9 = v19;
  sub_260532ED0();
  if (!v9)
  {
    int v10 = v13;
    int v11 = v14;
    char v23 = 1;
    sub_260532ED0();
    char v22 = 2;
    sub_260532ED0();
    if (v11)
    {
      char v20 = 3;
      sub_260532F10();
    }
    if (v10)
    {
      char v21 = 4;
      sub_260532F10();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t IntelligenceElement.Text.Editable.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873580);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26050B53C();
  sub_260533100();
  if (!v2)
  {
    char v31 = 0;
    uint64_t v9 = sub_260532DF0();
    uint64_t v12 = v11;
    uint64_t v26 = v9;
    char v30 = 1;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_260532DF0();
    uint64_t v15 = v14;
    uint64_t v24 = v13;
    __n128 v25 = a2;
    char v29 = 2;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_260532DF0();
    uint64_t v18 = v17;
    uint64_t v23 = v16;
    char v28 = 3;
    swift_bridgeObjectRetain();
    int v22 = sub_260532E00();
    char v27 = 4;
    char v19 = sub_260532E00();
    v22 &= 1u;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v20 = v25;
    *__n128 v25 = v26;
    v20[1] = v12;
    v20[2] = v24;
    uint64_t v20[3] = v15;
    v20[4] = v23;
    v20[5] = v18;
    *((unsigned char *)v20 + 48) = v22;
    *((unsigned char *)v20 + 49) = v19 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2605080D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceElement.Text.Editable.init(from:)(a1, a2);
}

uint64_t sub_2605080E8(void *a1)
{
  return IntelligenceElement.Text.Editable.encode(to:)(a1);
}

unint64_t static IntelligenceElement.Text.Attributes.SelectedAttribute.name.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_260508120()
{
  return sub_260532080();
}

uint64_t sub_260508140()
{
  return sub_260532090();
}

unint64_t sub_260508160()
{
  return 0xD000000000000014;
}

uint64_t sub_26050817C()
{
  return sub_260531FE0();
}

uint64_t sub_260508194()
{
  return sub_260531FF0() & 1;
}

uint64_t sub_2605081B0()
{
  return sub_260532000();
}

unint64_t static IntelligenceElement.Text.Attributes.FontSizeAttribute.name.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_2605081E8()
{
  return sub_260532080();
}

uint64_t sub_260508208()
{
  return sub_260532090();
}

unint64_t sub_260508228()
{
  return 0xD000000000000014;
}

uint64_t sub_260508248()
{
  return MEMORY[0x261211510]();
}

uint64_t sub_260508260()
{
  return MEMORY[0x261211520]();
}

uint64_t sub_260508278(uint64_t a1)
{
  unint64_t v2 = sub_26050B254();
  return MEMORY[0x261211510](a1, v2);
}

uint64_t sub_2605082B8(uint64_t a1)
{
  unint64_t v2 = sub_26050B254();
  return MEMORY[0x261211520](a1, v2);
}

uint64_t IntelligenceElement.Text.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_260531F20();
  uint64_t v3 = *(void **)(v2 - 8);
  uint64_t v4 = v3[8];
  MEMORY[0x270FA5388](v2);
  v198 = (char *)((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)((char *)v178 - v198);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  uint64_t v7 = v3 + 2;
  v197 = (void (*)(char *, uint64_t, uint64_t))v3[2];
  uint64_t v199 = v6;
  v197(v5, v6, v2);
  uint64_t v8 = sub_260531DD0();
  unint64_t v185 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v185 + 64);
  MEMORY[0x270FA5388](v8);
  unint64_t v191 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_retain();
  sub_260531DB0();
  int v10 = (void (*)(char *, uint64_t))v3[1];
  v196 = v3 + 1;
  v10(v5, v2);
  uint64_t v190 = sub_26050B2A8(&qword_26A871C30, MEMORY[0x270FA8478]);
  uint64_t v11 = sub_2605328B0();
  unint64_t v13 = v12;
  uint64_t v14 = v1;
  swift_release();
  uint64_t v15 = swift_bridgeObjectRelease();
  uint64_t v16 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v195 = v4;
  v193 = v10;
  char v179 = (void *)v8;
  v178[2] = v9;
  uint64_t v192 = v2;
  v194 = v7;
  if (v16)
  {
    v189 = v178;
    strcpy((char *)v201, "text: \"");
    v201[1] = 0xE700000000000000;
    MEMORY[0x270FA5388](v15);
    uint64_t v17 = (char *)((char *)v178 - v198);
    uint64_t v19 = v18((char *)v178 - v198, v199, v2);
    MEMORY[0x270FA5388](v19);
    swift_retain();
    sub_260531DB0();
    v10(v17, v2);
    sub_2605328B0();
    swift_release();
    sub_260532840();
    swift_bridgeObjectRelease();
    sub_260532840();
    uint64_t v20 = v201[0];
    uint64_t v21 = v201[1];
    int v22 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v24 = v22[2];
    unint64_t v23 = v22[3];
    uint64_t v25 = v14;
    if (v24 >= v23 >> 1) {
      int v22 = sub_260457640((void *)(v23 > 1), v24 + 1, 1, v22);
    }
    _OWORD v22[2] = v24 + 1;
    uint64_t v26 = &v22[2 * v24];
    v26[4] = v20;
    v26[5] = v21;
    uint64_t v4 = v195;
    uint64_t v27 = v199;
  }
  else
  {
    int v22 = (void *)MEMORY[0x263F8EE78];
    uint64_t v27 = v199;
    uint64_t v25 = v1;
  }
  uint64_t v28 = _s4TextV7StorageVMa();
  if (*(unsigned char *)(v27 + *(int *)(v28 + 24)))
  {
    v201[0] = 0;
    v201[1] = 0xE000000000000000;
    sub_260532840();
    LOBYTE(v200) = *(unsigned char *)(v27 + *(int *)(v28 + 24));
    sub_260532D30();
    uint64_t v29 = v201[0];
    uint64_t v30 = v201[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v22 = sub_260457640(0, v22[2] + 1, 1, v22);
    }
    unint64_t v32 = v22[2];
    unint64_t v31 = v22[3];
    if (v32 >= v31 >> 1) {
      int v22 = sub_260457640((void *)(v31 > 1), v32 + 1, 1, v22);
    }
    _OWORD v22[2] = v32 + 1;
    uint64_t v33 = &v22[2 * v32];
    v33[4] = v29;
    v33[5] = v30;
  }
  BOOL v34 = *(unsigned char *)(v27 + *(int *)(v28 + 28)) == 1;
  v198 = (char *)v25;
  uint64_t v186 = v28;
  if (v34)
  {
    strcpy((char *)v201, "isTruncated: ");
    HIWORD(v201[1]) = -4864;
    sub_260532840();
    uint64_t v35 = v201[0];
    uint64_t v36 = v201[1];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int v41 = v197;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      int v22 = sub_260457640(0, v22[2] + 1, 1, v22);
    }
    unint64_t v39 = v22[2];
    unint64_t v38 = v22[3];
    if (v39 >= v38 >> 1) {
      int v22 = sub_260457640((void *)(v38 > 1), v39 + 1, 1, v22);
    }
    _OWORD v22[2] = v39 + 1;
    unint64_t v191 = (unint64_t)v22;
    uint64_t v40 = &v22[2 * v39];
    v40[4] = v35;
    v40[5] = v36;
  }
  else
  {
    unint64_t v191 = (unint64_t)v22;
    int v41 = v197;
  }
  uint64_t v42 = v192;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C40);
  v184 = (char *)v178;
  unint64_t v183 = *(void *)(v43 - 8);
  uint64_t v44 = MEMORY[0x270FA5388](v43);
  char v46 = (char *)v178 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v182 = v178;
  MEMORY[0x270FA5388](v44);
  uint64_t v47 = (char *)v178 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41(v47, v27, v42);
  uint64_t v48 = sub_260531EB0();
  v181 = (char *)v178;
  uint64_t v49 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v188 = v50;
  uint64_t v51 = (char *)v178 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_260531ED0();
  v193(v47, v42);
  uint64_t KeyPath = swift_getKeyPath();
  v178[-2] = MEMORY[0x270FA5388](KeyPath);
  swift_getKeyPath();
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871C48);
  v180 = v178;
  uint64_t v54 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v56 = (char *)v178 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26050AE70();
  sub_260531EC0();
  swift_release();
  uint64_t v57 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v190 = v48;
  v189 = (void *)(v49 + 8);
  v187 = v57;
  v57(v51, v48);
  MEMORY[0x2612115E0](v53);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CB0);
  v182 = v178;
  MEMORY[0x270FA5388](v58 - 8);
  char v60 = (double *)((char *)v178 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  v185 += 8;
  double v61 = 0.0;
  double v62 = 0.0;
  while (1)
  {
    sub_260531E70();
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871CA8);
    if ((*(unsigned int (**)(double *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 48))(v60, 1, v63) == 1) {
      break;
    }
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871EC8);
    MEMORY[0x270FA5388](v64);
    uint64_t v66 = (char *)v178 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
    double v67 = *v60;
    char v68 = *((unsigned char *)v60 + 8);
    sub_26049C1A0((uint64_t)v60 + *(int *)(v63 + 48), (uint64_t)v66, &qword_26A871EC8);
    if ((v68 & 1) != 0
      || (sub_260531EF0(), sub_26050B2A8(&qword_26A871C50, MEMORY[0x270FA85C0]), uint64_t v69 = sub_2605326B0(), (v69 & 1) != 0))
    {
      sub_26045B7D4((uint64_t)v66, &qword_26A871EC8);
    }
    else
    {
      v180 = v178;
      MEMORY[0x270FA5388](v69);
      uint64_t v71 = (char *)v178 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v72 = v192;
      uint64_t v73 = ((uint64_t (*)(char *, uint64_t, uint64_t))v197)(v71, v199, v192);
      v178[1] = v178;
      MEMORY[0x270FA5388](v73);
      v181 = (char *)v178 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_260531DB0();
      v193(v71, v72);
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A871D48);
      v178[0] = v178;
      MEMORY[0x270FA5388](v75);
      Swift::Int_optional v77 = (char *)v178 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_260531DE0();
      (*(void (**)(char *, void *))v185)(v181, v179);
      sub_26050B2A8(&qword_26A871C38, MEMORY[0x270FA8478]);
      uint64_t v78 = sub_2605329A0();
      sub_26045B7D4((uint64_t)v77, (uint64_t *)&unk_26A871D48);
      sub_26045B7D4((uint64_t)v66, &qword_26A871EC8);
      double v62 = v62 + v67 * (double)v78;
      double v61 = v61 + (double)v78;
    }
  }
  (*(void (**)(char *, uint64_t))(v183 + 8))(v46, v43);
  uint64_t v79 = (uint64_t)v198;
  swift_release();
  if (v61 <= 0.0)
  {
    uint64_t v86 = (void *)v191;
    uint64_t v88 = v195;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B88);
    uint64_t v80 = swift_allocObject();
    uint64_t v81 = MEMORY[0x263F8D538];
    *(_OWORD *)(v80 + 16) = xmmword_260534390;
    uint64_t v82 = MEMORY[0x263F8D5B8];
    *(void *)(v80 + 56) = v81;
    *(void *)(v80 + 64) = v82;
    *(double *)(v80 + 32) = v62 / v61;
    uint64_t v83 = sub_260532770();
    uint64_t v85 = v84;
    uint64_t v86 = (void *)v191;
    char v87 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v88 = v195;
    if ((v87 & 1) == 0) {
      uint64_t v86 = sub_260457640(0, v86[2] + 1, 1, v86);
    }
    unint64_t v90 = v86[2];
    unint64_t v89 = v86[3];
    if (v90 >= v89 >> 1) {
      uint64_t v86 = sub_260457640((void *)(v89 > 1), v90 + 1, 1, v86);
    }
    v86[2] = v90 + 1;
    uint64_t v91 = &v86[2 * v90];
    v91[4] = v83;
    v91[5] = v85;
  }
  v201[0] = v79;
  if (IntelligenceElement.Text.hasLinks.getter())
  {
    v201[0] = 0;
    v201[1] = 0xE000000000000000;
    sub_260532CB0();
    uint64_t v92 = swift_bridgeObjectRelease();
    v180 = v178;
    strcpy((char *)v201, "contains ");
    WORD1(v201[1]) = 0;
    HIDWORD(v201[1]) = -385875968;
    MEMORY[0x270FA5388](v92);
    unint64_t v185 = (v88 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v93 = (char *)v178 - v185;
    uint64_t v94 = v192;
    uint64_t v95 = ((uint64_t (*)(char *, uint64_t, uint64_t))v197)((char *)v178 - v185, v199, v192);
    char v179 = v178;
    MEMORY[0x270FA5388](v95);
    v184 = (char *)((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v97 = (char *)((char *)v178 - v184);
    swift_retain();
    sub_260531ED0();
    v193(v93, v94);
    uint64_t v98 = swift_getKeyPath();
    v178[-2] = MEMORY[0x270FA5388](v98);
    swift_getKeyPath();
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873548);
    unint64_t v191 = (unint64_t)v86;
    v181 = (char *)v99;
    uint64_t v100 = *(void *)(v99 - 8);
    uint64_t v101 = *(void *)(v100 + 64);
    MEMORY[0x270FA5388](v99);
    unint64_t v183 = (v101 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v102 = (char *)v178 - v183;
    v182 = (void *)sub_26050A3D8();
    sub_260531EC0();
    swift_release();
    v187(v97, v190);
    unint64_t v103 = sub_26050A428((uint64_t)v102, (void (*)(char *, char *))sub_26050A420, (uint64_t)v198);
    uint64_t v104 = *(void (**)(char *, uint64_t))(v100 + 8);
    v104(v102, v99);
    swift_release();
    uint64_t v105 = *(void **)(v103 + 16);
    swift_bridgeObjectRelease();
    v200 = v105;
    sub_260532F80();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v106 = sub_260532840();
    v180 = v178;
    MEMORY[0x270FA5388](v106);
    uint64_t v107 = (char *)v178 - v185;
    uint64_t v108 = ((uint64_t (*)(char *, uint64_t, uint64_t))v197)((char *)v178 - v185, v199, v94);
    MEMORY[0x270FA5388](v108);
    uint64_t v109 = (char *)((char *)v178 - v184);
    swift_retain();
    sub_260531ED0();
    v193(v107, v94);
    uint64_t v110 = swift_getKeyPath();
    v178[-2] = MEMORY[0x270FA5388](v110);
    uint64_t v111 = swift_getKeyPath();
    uint64_t v79 = (uint64_t)v198;
    MEMORY[0x270FA5388](v111);
    uint64_t v112 = (char *)v178 - v183;
    sub_260531EC0();
    swift_release();
    v187(v109, v190);
    sub_26050A428((uint64_t)v112, (void (*)(char *, char *))sub_26050A420, v79);
    v104(v112, (uint64_t)v181);
    swift_release();
    uint64_t v86 = (void *)v191;
    swift_bridgeObjectRelease();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v113 = v201[0];
    uint64_t v114 = v201[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v86 = sub_260457640(0, v86[2] + 1, 1, v86);
    }
    unint64_t v116 = v86[2];
    unint64_t v115 = v86[3];
    uint64_t v88 = v195;
    if (v116 >= v115 >> 1) {
      uint64_t v86 = sub_260457640((void *)(v115 > 1), v116 + 1, 1, v86);
    }
    v86[2] = v116 + 1;
    uint64_t v117 = &v86[2 * v116];
    v117[4] = v113;
    v117[5] = v114;
  }
  v201[0] = v79;
  uint64_t v118 = IntelligenceElement.Text.hasSelections.getter();
  if (v118)
  {
    v198 = (char *)v178;
    strcpy((char *)v201, "selections: ");
    BYTE5(v201[1]) = 0;
    HIWORD(v201[1]) = -5120;
    MEMORY[0x270FA5388](v118);
    uint64_t v119 = v192;
    uint64_t v120 = ((uint64_t (*)(char *, uint64_t, uint64_t))v197)((char *)v178 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0), v199, v192);
    v197 = (void (*)(char *, uint64_t, uint64_t))v178;
    MEMORY[0x270FA5388](v120);
    uint64_t v122 = (char *)v178 - ((v121 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_260531ED0();
    v193((char *)v178 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0), v119);
    uint64_t v123 = swift_getKeyPath();
    v178[-2] = MEMORY[0x270FA5388](v123);
    swift_getKeyPath();
    uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873550);
    unint64_t v125 = v86;
    uint64_t v126 = *(void *)(v124 - 8);
    MEMORY[0x270FA5388](v124);
    uint64_t v128 = (char *)v178 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_26050A9E0();
    sub_260531EC0();
    swift_release();
    v187(v122, v190);
    uint64_t v129 = sub_26050AA3C((uint64_t)v128, (uint64_t (*)(void, unsigned __int8 *))sub_26050AA34, v79);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v128, v124);
    uint64_t v86 = v125;
    swift_release();
    MEMORY[0x2612120A0](v129, MEMORY[0x263F8D310]);
    sub_260532840();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v130 = v201[0];
    uint64_t v131 = v201[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v86 = sub_260457640(0, v125[2] + 1, 1, v125);
    }
    unint64_t v133 = v86[2];
    unint64_t v132 = v86[3];
    uint64_t v134 = v186;
    if (v133 >= v132 >> 1) {
      uint64_t v86 = sub_260457640((void *)(v132 > 1), v133 + 1, 1, v86);
    }
    v86[2] = v133 + 1;
    uint64_t v135 = &v86[2 * v133];
    v135[4] = v130;
    v135[5] = v131;
  }
  else
  {
    uint64_t v134 = v186;
  }
  uint64_t v136 = v199 + *(int *)(v134 + 20);
  unint64_t v137 = *(void *)(v136 + 8);
  if (v137 == 1)
  {
    unint64_t v138 = 0xE400000000000000;
    uint64_t v139 = 1954047316;
    goto LABEL_92;
  }
  uint64_t v140 = *(void *)v136;
  uint64_t v141 = *(void *)(v136 + 16);
  unint64_t v142 = *(void *)(v136 + 24);
  uint64_t v143 = *(void *)(v136 + 32);
  unint64_t v144 = *(void *)(v136 + 40);
  __int16 v145 = *(_WORD *)(v136 + 48);
  uint64_t v199 = *(void *)v136;
  if (v137)
  {
    uint64_t v146 = HIBYTE(v137) & 0xF;
    if ((v137 & 0x2000000000000000) == 0) {
      uint64_t v146 = v140 & 0xFFFFFFFFFFFFLL;
    }
    if (v146)
    {
      strcpy((char *)v201, "label: \"");
      BYTE1(v201[1]) = 0;
      WORD1(v201[1]) = 0;
      HIDWORD(v201[1]) = -402653184;
      v198 = (char *)v141;
      sub_26050AEC4(v140, v137);
      swift_bridgeObjectRetain();
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v147 = v86;
      uint64_t v148 = v201[0];
      uint64_t v149 = v201[1];
      v150 = v147;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v150 = sub_260457640(0, v150[2] + 1, 1, v150);
      }
      unint64_t v152 = v150[2];
      unint64_t v151 = v150[3];
      if (v152 >= v151 >> 1) {
        v150 = sub_260457640((void *)(v151 > 1), v152 + 1, 1, v150);
      }
      v150[2] = v152 + 1;
      uint64_t v153 = &v150[2 * v152];
      v153[4] = v148;
      v153[5] = v149;
      uint64_t v86 = v150;
      uint64_t v141 = (uint64_t)v198;
      uint64_t v140 = v199;
      if (!v142) {
        goto LABEL_70;
      }
      goto LABEL_62;
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v142)
  {
LABEL_62:
    uint64_t v154 = HIBYTE(v142) & 0xF;
    if ((v142 & 0x2000000000000000) == 0) {
      uint64_t v154 = v141 & 0xFFFFFFFFFFFFLL;
    }
    if (v154)
    {
      v198 = (char *)v143;
      strcpy((char *)v201, "prompt: \"");
      WORD1(v201[1]) = 0;
      HIDWORD(v201[1]) = -385875968;
      swift_bridgeObjectRetain();
      uint64_t v155 = v141;
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v156 = v86;
      uint64_t v157 = v201[0];
      uint64_t v158 = v201[1];
      uint64_t v159 = v156;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v159 = sub_260457640(0, v159[2] + 1, 1, v159);
      }
      unint64_t v161 = v159[2];
      unint64_t v160 = v159[3];
      if (v161 >= v160 >> 1) {
        uint64_t v159 = sub_260457640((void *)(v160 > 1), v161 + 1, 1, v159);
      }
      v159[2] = v161 + 1;
      uint64_t v162 = &v159[2 * v161];
      v162[4] = v157;
      v162[5] = v158;
      uint64_t v86 = v159;
      uint64_t v141 = v155;
      uint64_t v143 = (uint64_t)v198;
      uint64_t v140 = v199;
    }
  }
LABEL_70:
  if (v144)
  {
    uint64_t v163 = HIBYTE(v144) & 0xF;
    if ((v144 & 0x2000000000000000) == 0) {
      uint64_t v163 = v143 & 0xFFFFFFFFFFFFLL;
    }
    if (v163)
    {
      v198 = (char *)v141;
      v201[0] = 0;
      v201[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_260532CB0();
      swift_bridgeObjectRelease();
      strcpy((char *)v201, "contentType: \"");
      HIBYTE(v201[1]) = -18;
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v164 = v86;
      uint64_t v165 = v201[0];
      uint64_t v166 = v201[1];
      v167 = v164;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v167 = sub_260457640(0, v167[2] + 1, 1, v167);
      }
      unint64_t v169 = v167[2];
      unint64_t v168 = v167[3];
      if (v169 >= v168 >> 1) {
        v167 = sub_260457640((void *)(v168 > 1), v169 + 1, 1, v167);
      }
      v167[2] = v169 + 1;
      v170 = &v167[2 * v169];
      v170[4] = v165;
      v170[5] = v166;
      uint64_t v86 = v167;
      uint64_t v140 = v199;
    }
  }
  if (v145)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v86 = sub_260457640(0, v86[2] + 1, 1, v86);
    }
    unint64_t v172 = v86[2];
    unint64_t v171 = v86[3];
    if (v172 >= v171 >> 1) {
      uint64_t v86 = sub_260457640((void *)(v171 > 1), v172 + 1, 1, v86);
    }
    v86[2] = v172 + 1;
    v173 = (char *)&v86[2 * v172];
    strcpy(v173 + 32, "isSecure: true");
    v173[47] = -18;
  }
  unint64_t v138 = 0xEC00000074786554;
  sub_26050AF7C(v140, v137);
  if ((v145 & 0x100) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v86 = sub_260457640(0, v86[2] + 1, 1, v86);
    }
    unint64_t v175 = v86[2];
    unint64_t v174 = v86[3];
    if (v175 >= v174 >> 1) {
      uint64_t v86 = sub_260457640((void *)(v174 > 1), v175 + 1, 1, v86);
    }
    v86[2] = v175 + 1;
    uint64_t v176 = &v86[2 * v175];
    v176[4] = 0x657375636F467369;
    v176[5] = 0xEF65757274203A64;
  }
  uint64_t v139 = 0x656C626174696445;
LABEL_92:
  v201[0] = v139;
  v201[1] = v138;
  sub_260532840();
  v200 = v86;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return v201[0];
}

uint64_t _s21UIIntelligenceSupport19IntelligenceElementV4TextV8EditableV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(unsigned __int8 *)(a1 + 48);
  int v9 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v14 = *(void *)(a2 + 40);
  int v15 = *(unsigned __int8 *)(a2 + 48);
  int v16 = *(unsigned __int8 *)(a2 + 49);
  if (!v3)
  {
    if (v10) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!v10) {
    return 0;
  }
  if (*(void *)a1 == *(void *)a2 && v3 == v10) {
    goto LABEL_8;
  }
  uint64_t v32 = *(void *)(a1 + 40);
  uint64_t v33 = *(void *)(a2 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  int v18 = *(unsigned __int8 *)(a2 + 48);
  int v19 = *(unsigned __int8 *)(a1 + 48);
  int v20 = *(unsigned __int8 *)(a2 + 49);
  int v21 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v22 = *(void *)(a2 + 32);
  char v23 = sub_260532FA0();
  uint64_t v12 = v22;
  int v9 = v21;
  int v16 = v20;
  int v8 = v19;
  int v15 = v18;
  uint64_t v5 = v17;
  uint64_t v7 = v32;
  uint64_t v14 = v33;
  char v24 = v23;
  uint64_t result = 0;
  if (v24)
  {
LABEL_8:
    if (v6)
    {
      if (!v13) {
        return 0;
      }
      if (v4 != v11 || v6 != v13)
      {
        int v26 = v9;
        uint64_t v27 = v12;
        char v28 = sub_260532FA0();
        uint64_t v12 = v27;
        int v9 = v26;
        char v29 = v28;
        uint64_t result = 0;
        if ((v29 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (!v7)
    {
      uint64_t result = 0;
      if (v14 || ((v8 ^ v15) & 1) != 0) {
        return result;
      }
      return v9 ^ v16 ^ 1u;
    }
    if (v14)
    {
      if (v5 == v12 && v7 == v14)
      {
        if (v8 != v15) {
          return 0;
        }
      }
      else
      {
        int v30 = v9;
        char v31 = sub_260532FA0();
        uint64_t result = 0;
        if ((v31 & 1) == 0) {
          return result;
        }
        int v9 = v30;
        if ((v8 ^ v15)) {
          return result;
        }
      }
      return v9 ^ v16 ^ 1u;
    }
    return 0;
  }
  return result;
}

BOOL _s21UIIntelligenceSupport19IntelligenceElementV4TextV2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = sub_260531F20();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = v5[8];
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2 + *(void *)(*(void *)v2 + 88);
  swift_beginAccess();
  int v9 = (uint64_t (*)(char *, uint64_t, uint64_t))v5[2];
  uint64_t v10 = v9(v7, v8, v4);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = v3 + *(void *)(*(void *)v3 + 88);
  swift_beginAccess();
  v9(v7, v11, v4);
  LOBYTE(v3) = sub_260531E50();
  uint64_t v12 = (void (*)(char *, uint64_t))v5[1];
  v12(v7, v4);
  v12(v7, v4);
  if ((v3 & 1) == 0) {
    return 0;
  }
  uint64_t v13 = _s4TextV7StorageVMa();
  uint64_t v14 = *(int *)(v13 + 20);
  uint64_t v15 = *(void *)(v8 + v14);
  uint64_t v16 = *(void *)(v8 + v14 + 8);
  uint64_t v18 = *(void *)(v8 + v14 + 16);
  uint64_t v17 = *(void *)(v8 + v14 + 24);
  uint64_t v19 = *(void *)(v8 + v14 + 32);
  uint64_t v20 = *(void *)(v8 + v14 + 40);
  int v21 = *(unsigned __int16 *)(v8 + v14 + 48);
  uint64_t v22 = v11 + v14;
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *(void *)(v22 + 8);
  uint64_t v25 = *(void *)(v22 + 16);
  uint64_t v26 = *(void *)(v22 + 24);
  uint64_t v28 = *(void *)(v22 + 32);
  uint64_t v27 = *(void *)(v22 + 40);
  __int16 v29 = *(_WORD *)(v22 + 48);
  if (v16 == 1)
  {
    int v35 = v21;
    uint64_t v36 = v19;
    uint64_t v37 = v18;
    uint64_t v38 = v15;
    uint64_t v39 = v17;
    if (v23 == 1) {
      return *(unsigned __int8 *)(v8 + *(int *)(v13 + 24)) == *(unsigned __int8 *)(v11 + *(int *)(v13 + 24));
    }
    goto LABEL_7;
  }
  v42[0] = v15;
  v42[1] = v16;
  v42[2] = v18;
  v42[3] = v17;
  void v42[4] = v19;
  v42[5] = v20;
  __int16 v43 = v21;
  if (v23 == 1)
  {
    int v35 = v21;
    uint64_t v36 = v19;
    uint64_t v37 = v18;
    uint64_t v38 = v15;
    uint64_t v30 = v17;
    v34[1] = v27;
    swift_bridgeObjectRetain();
    uint64_t v39 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_7:
    sub_26050AEC4(v24, v23);
    sub_26050AF7C(v38, v16);
    sub_26050AF7C(v24, v23);
    return 0;
  }
  v40[0] = v24;
  v40[1] = v23;
  v40[2] = v25;
  v40[3] = v26;
  v40[4] = v28;
  v40[5] = v27;
  __int16 v41 = v29 & 0x101;
  uint64_t v32 = v13;
  char v33 = _s21UIIntelligenceSupport19IntelligenceElementV4TextV8EditableV2eeoiySbAG_AGtFZ_0((uint64_t)v42, (uint64_t)v40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v32;
  if ((v33 & 1) == 0) {
    return 0;
  }
  return *(unsigned __int8 *)(v8 + *(int *)(v13 + 24)) == *(unsigned __int8 *)(v11 + *(int *)(v13 + 24));
}

uint64_t _s4TextV7StorageVMa()
{
  uint64_t result = qword_26A871E60;
  if (!qword_26A871E60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_26050A354()
{
}

uint64_t sub_26050A37C()
{
  return 8;
}

uint64_t sub_26050A388()
{
  return swift_release();
}

uint64_t sub_26050A390(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_26050A39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260504198(a1, a2, a3, &qword_26A873620) & 1;
}

uint64_t sub_26050A3C0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26A873620);
}

void *sub_26050A3CC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_26050A3D8()
{
  unint64_t result = qword_26A871C28;
  if (!qword_26A871C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C28);
  }
  return result;
}

uint64_t sub_26050A420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_260502250(a1, a2, v3, a3);
}

unint64_t sub_26050A428(uint64_t a1, void (*a2)(char *, char *), uint64_t a3)
{
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8735F0);
  uint64_t v36 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873548);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  sub_26050CCD8(&qword_26A8735F8, &qword_26A873548);
  __int16 v41 = v5;
  sub_2605328E0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873600);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_26050CCD8(&qword_26A873608, &qword_26A8735F0);
  unint64_t v45 = MEMORY[0x263F8EE78];
  uint64_t v12 = (uint64_t *)&unk_26A873610;
  uint64_t v13 = (uint64_t *)&unk_26A873618;
  uint64_t v37 = v11;
  while (1)
  {
    sub_260532B50();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v12);
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v11, 1, v14);
    if (v15 == 1) {
      break;
    }
    uint64_t v48 = &v35;
    MEMORY[0x270FA5388](v15);
    uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_26049C1A0((uint64_t)v11, (uint64_t)v17, v12);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8721C8);
    uint64_t v47 = &v35;
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(void *)(v19 + 64);
    MEMORY[0x270FA5388](v18);
    int v21 = v13;
    unint64_t v43 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v22 = (char *)&v35 - v43;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v21);
    char v46 = &v35;
    MEMORY[0x270FA5388](v23 - 8);
    uint64_t v25 = (char *)&v35 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    v38(v17, &v17[*(int *)(v14 + 48)]);
    uint64_t v26 = (uint64_t)v17;
    uint64_t v27 = v12;
    sub_26045B7D4(v26, v12);
    uint64_t v44 = v19;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v25, 1, v18) == 1)
    {
      sub_26045B7D4((uint64_t)v25, v21);
      uint64_t v13 = v21;
    }
    else
    {
      uint64_t v28 = sub_26049C1A0((uint64_t)v25, (uint64_t)v22, (uint64_t *)&unk_26A8721C8);
      MEMORY[0x270FA5388](v28);
      __int16 v29 = (char *)&v35 - v43;
      sub_26049C1A0((uint64_t)v22, (uint64_t)&v35 - v43, (uint64_t *)&unk_26A8721C8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v45 = sub_260457750(0, *(void *)(v45 + 16) + 1, 1, v45);
      }
      uint64_t v13 = v21;
      unint64_t v31 = *(void *)(v45 + 16);
      unint64_t v30 = *(void *)(v45 + 24);
      if (v31 >= v30 >> 1) {
        unint64_t v45 = sub_260457750(v30 > 1, v31 + 1, 1, v45);
      }
      uint64_t v33 = v44;
      unint64_t v32 = v45;
      *(void *)(v45 + 16) = v31 + 1;
      sub_26049C1A0((uint64_t)v29, v32+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v31, (uint64_t *)&unk_26A8721C8);
    }
    uint64_t v11 = v37;
    uint64_t v12 = v27;
  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v42);
  return v45;
}

uint64_t sub_26050A978()
{
  return sub_260532020();
}

uint64_t sub_26050A9A4()
{
  return 8;
}

uint64_t sub_26050A9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260504198(a1, a2, a3, &qword_26A8735E8) & 1;
}

uint64_t sub_26050A9D4(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26A8735E8);
}

unint64_t sub_26050A9E0()
{
  unint64_t result = qword_26A871E28;
  if (!qword_26A871E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E28);
  }
  return result;
}

uint64_t sub_26050AA34(char a1, uint64_t a2)
{
  return sub_2605030DC(a1, a2, v2);
}

void *sub_26050AA3C(uint64_t a1, uint64_t (*a2)(void, unsigned __int8 *), uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8735C0);
  uint64_t v25 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873550);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  sub_26050CCD8(&qword_26A8735C8, &qword_26A873550);
  uint64_t v28 = v5;
  sub_2605328E0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8735D0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26050CCD8(&qword_26A8735D8, &qword_26A8735C0);
  uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    sub_260532B50();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8735E0);
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v11, 1, v14);
    if (v15 == 1) {
      break;
    }
    MEMORY[0x270FA5388](v15);
    uint64_t v17 = (unsigned __int8 *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_26049C1A0((uint64_t)v11, (uint64_t)v17, &qword_26A8735E0);
    uint64_t v18 = v26(*v17, &v17[*(int *)(v14 + 48)]);
    uint64_t v20 = v19;
    sub_26045B7D4((uint64_t)v17, &qword_26A8735E0);
    if (v20)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v12 = sub_260457640(0, v12[2] + 1, 1, v12);
      }
      unint64_t v22 = v12[2];
      unint64_t v21 = v12[3];
      if (v22 >= v21 >> 1) {
        uint64_t v12 = sub_260457640((void *)(v21 > 1), v22 + 1, 1, v12);
      }
      v12[2] = v22 + 1;
      uint64_t v13 = &v12[2 * v22];
      v13[4] = v18;
      v13[5] = v20;
    }
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v29);
  return v12;
}

uint64_t sub_26050ADC4()
{
  return sub_260532020();
}

uint64_t sub_26050ADF0()
{
  return 8;
}

uint64_t sub_26050ADFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260504198(a1, a2, a3, &qword_26A8735B8) & 1;
}

uint64_t sub_26050AE20(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26A8735B8);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_260532670();
}

unint64_t sub_26050AE70()
{
  unint64_t result = qword_26A871E20;
  if (!qword_26A871E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E20);
  }
  return result;
}

uint64_t sub_26050AEC4(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_26050AF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s4TextV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26050AF7C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_26050AFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s4TextV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26050B034(uint64_t a1)
{
  uint64_t v2 = _s4TextV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26050B090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s4TextV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_26050B0F4()
{
  unint64_t result = qword_26A871E88;
  if (!qword_26A871E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E88);
  }
  return result;
}

unint64_t sub_26050B148()
{
  unint64_t result = qword_26A873558;
  if (!qword_26A873558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873558);
  }
  return result;
}

unint64_t sub_26050B19C()
{
  unint64_t result = qword_26A871E70;
  if (!qword_26A871E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E70);
  }
  return result;
}

unint64_t sub_26050B1F0()
{
  unint64_t result = qword_26A873560;
  if (!qword_26A873560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873560);
  }
  return result;
}

void sub_26050B244(void *a1@<X8>)
{
  *a1 = &type metadata for IntelligenceElement.Text.Attributes;
}

unint64_t sub_26050B254()
{
  unint64_t result = qword_26A871E30;
  if (!qword_26A871E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E30);
  }
  return result;
}

uint64_t sub_26050B2A8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_26050B2F0()
{
  unint64_t result = qword_26A871E48;
  if (!qword_26A871E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E48);
  }
  return result;
}

unint64_t sub_26050B344()
{
  unint64_t result = qword_26A871BC0;
  if (!qword_26A871BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871BC0);
  }
  return result;
}

unint64_t sub_26050B398()
{
  unint64_t result = qword_26A871E40;
  if (!qword_26A871E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E40);
  }
  return result;
}

unint64_t sub_26050B3EC()
{
  unint64_t result = qword_26A873568;
  if (!qword_26A873568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873568);
  }
  return result;
}

unint64_t sub_26050B440()
{
  unint64_t result = qword_26A871E38;
  if (!qword_26A871E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E38);
  }
  return result;
}

unint64_t sub_26050B494()
{
  unint64_t result = qword_26A871C78;
  if (!qword_26A871C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C78);
  }
  return result;
}

unint64_t sub_26050B4E8()
{
  unint64_t result = qword_26A871C70;
  if (!qword_26A871C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871C70);
  }
  return result;
}

unint64_t sub_26050B53C()
{
  unint64_t result = qword_26A873578;
  if (!qword_26A873578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873578);
  }
  return result;
}

unint64_t sub_26050B594()
{
  unint64_t result = qword_26A873588;
  if (!qword_26A873588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873588);
  }
  return result;
}

uint64_t sub_26050B5F0()
{
  return MEMORY[0x263F8D508];
}

uint64_t sub_26050B604()
{
  return MEMORY[0x263F8D558];
}

uint64_t sub_26050B624(char *a1)
{
  char v2 = *a1;
  return IntelligenceElement.Text.lineLimit.setter(&v2);
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text()
{
  return &type metadata for IntelligenceElement.Text;
}

uint64_t _s4TextV8EditableVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s4TextV8EditableVwcp(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4TextV8EditableVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s4TextV8EditableVwta(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t _s4TextV8EditableVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 50)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s4TextV8EditableVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 50) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 50) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text.Editable()
{
  return &type metadata for IntelligenceElement.Text.Editable;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text.LineLimit()
{
  return &type metadata for IntelligenceElement.Text.LineLimit;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text.Attributes()
{
  return &type metadata for IntelligenceElement.Text.Attributes;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text.Attributes.SelectedAttribute()
{
  return &type metadata for IntelligenceElement.Text.Attributes.SelectedAttribute;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Text.Attributes.FontSizeAttribute()
{
  return &type metadata for IntelligenceElement.Text.Attributes.FontSizeAttribute;
}

ValueMetadata *_s4TextV8EditableV10CodingKeysOMa()
{
  return &_s4TextV8EditableV10CodingKeysON;
}

unsigned char *_s4TextV8EditableV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x26050BA28);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *_s4TextV10CodingKeysOMa()
{
  return &_s4TextV10CodingKeysON;
}

unsigned char *_s4TextV9LineLimitOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x26050BB2CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s4TextV9LineLimitO10CodingKeysOMa()
{
  return &_s4TextV9LineLimitO10CodingKeysON;
}

ValueMetadata *_s4TextV9LineLimitO17UnknownCodingKeysOMa()
{
  return &_s4TextV9LineLimitO17UnknownCodingKeysON;
}

ValueMetadata *_s4TextV9LineLimitO20SingleLineCodingKeysOMa()
{
  return &_s4TextV9LineLimitO20SingleLineCodingKeysON;
}

ValueMetadata *_s4TextV9LineLimitO23MultipleLinesCodingKeysOMa()
{
  return &_s4TextV9LineLimitO23MultipleLinesCodingKeysON;
}

void *sub_26050BB94(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_260531F20();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *((void *)v10 + 1);
    if (v11 == 1)
    {
      long long v12 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v12;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
      *((_WORD *)v9 + 24) = *((_WORD *)v10 + 24);
    }
    else
    {
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = v11;
      uint64_t v14 = *((void *)v10 + 3);
      *((void *)v9 + 2) = *((void *)v10 + 2);
      *((void *)v9 + 3) = v14;
      uint64_t v15 = *((void *)v10 + 5);
      *((void *)v9 + 4) = *((void *)v10 + 4);
      *((void *)v9 + 5) = v15;
      *((_WORD *)v9 + 24) = *((_WORD *)v10 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v16 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v18 = a3[10];
    uint64_t v19 = (_OWORD *)((char *)a1 + v18);
    uint64_t v20 = (_OWORD *)((char *)a2 + v18);
    long long v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    *(_OWORD *)((char *)v19 + 26) = *(_OWORD *)((char *)v20 + 26);
  }
  return a1;
}

uint64_t sub_26050BD08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260531F20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = *(void *)(a1 + *(int *)(a2 + 20) + 8);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_26050BDA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260531F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(v9 + 8);
  if (v10 == 1)
  {
    long long v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_WORD *)(v8 + 48) = *(_WORD *)(v9 + 48);
  }
  else
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = v10;
    uint64_t v12 = *(void *)(v9 + 24);
    *(void *)(v8 + 16) = *(void *)(v9 + 16);
    *(void *)(v8 + 24) = v12;
    uint64_t v13 = *(void *)(v9 + 40);
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
    *(void *)(v8 + 40) = v13;
    *(_WORD *)(v8 + 48) = *(_WORD *)(v9 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v14 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = (_OWORD *)(a1 + v16);
  uint64_t v18 = (_OWORD *)(a2 + v16);
  long long v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  *(_OWORD *)((char *)v17 + 26) = *(_OWORD *)((char *)v18 + 26);
  return a1;
}

uint64_t sub_26050BEC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260531F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  if (v10 == 1)
  {
    if (v11 == 1)
    {
      long long v12 = *v9;
      long long v13 = v9[1];
      long long v14 = v9[2];
      *(_WORD *)(v8 + 48) = *((_WORD *)v9 + 24);
      *(_OWORD *)(v8 + 16) = v13;
      *(_OWORD *)(v8 + 32) = v14;
      *(_OWORD *)uint64_t v8 = v12;
    }
    else
    {
      *(void *)uint64_t v8 = *(void *)v9;
      *(void *)(v8 + 8) = *((void *)v9 + 1);
      *(void *)(v8 + 16) = *((void *)v9 + 2);
      *(void *)(v8 + 24) = *((void *)v9 + 3);
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      *(void *)(v8 + 40) = *((void *)v9 + 5);
      *(unsigned char *)(v8 + 48) = *((unsigned char *)v9 + 48);
      *(unsigned char *)(v8 + 49) = *((unsigned char *)v9 + 49);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v11 == 1)
  {
    sub_26050C0FC(v8);
    long long v16 = v9[1];
    long long v15 = v9[2];
    long long v17 = *v9;
    *(_WORD *)(v8 + 48) = *((_WORD *)v9 + 24);
    *(_OWORD *)(v8 + 16) = v16;
    *(_OWORD *)(v8 + 32) = v15;
    *(_OWORD *)uint64_t v8 = v17;
  }
  else
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = *((void *)v9 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v8 + 16) = *((void *)v9 + 2);
    *(void *)(v8 + 24) = *((void *)v9 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(void *)(v8 + 40) = *((void *)v9 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v8 + 48) = *((unsigned char *)v9 + 48);
    *(unsigned char *)(v8 + 49) = *((unsigned char *)v9 + 49);
  }
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  *(unsigned char *)(v19 + 8) = *((unsigned char *)v20 + 8);
  *(void *)uint64_t v19 = v21;
  *(unsigned char *)(v19 + 9) = *((unsigned char *)v20 + 9);
  uint64_t v22 = v20[2];
  *(unsigned char *)(v19 + 24) = *((unsigned char *)v20 + 24);
  *(void *)(v19 + 16) = v22;
  *(unsigned char *)(v19 + 25) = *((unsigned char *)v20 + 25);
  uint64_t v23 = v20[4];
  *(unsigned char *)(v19 + 40) = *((unsigned char *)v20 + 40);
  *(void *)(v19 + 32) = v23;
  *(unsigned char *)(v19 + 41) = *((unsigned char *)v20 + 41);
  return a1;
}

uint64_t sub_26050C0FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_26050C12C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260531F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_WORD *)(v9 + 48) = *(_WORD *)(v10 + 48);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  long long v14 = (_OWORD *)(a1 + v13);
  long long v15 = (_OWORD *)(a2 + v13);
  *(_OWORD *)((char *)v14 + 26) = *(_OWORD *)((char *)v15 + 26);
  long long v16 = v15[1];
  _OWORD *v14 = *v15;
  v14[1] = v16;
  return a1;
}

uint64_t sub_26050C200(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260531F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (*(void *)(a1 + v7 + 8) != 1)
  {
    uint64_t v10 = *(void *)(v9 + 8);
    if (v10 != 1)
    {
      *(void *)uint64_t v8 = *(void *)v9;
      *(void *)(v8 + 8) = v10;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(v9 + 24);
      *(void *)(v8 + 16) = *(void *)(v9 + 16);
      *(void *)(v8 + 24) = v12;
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(v9 + 40);
      *(void *)(v8 + 32) = *(void *)(v9 + 32);
      *(void *)(v8 + 40) = v13;
      swift_bridgeObjectRelease();
      *(unsigned char *)(v8 + 48) = *(unsigned char *)(v9 + 48);
      *(unsigned char *)(v8 + 49) = *(unsigned char *)(v9 + 49);
      goto LABEL_6;
    }
    sub_26050C0FC(v8);
  }
  long long v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_WORD *)(v8 + 48) = *(_WORD *)(v9 + 48);
LABEL_6:
  uint64_t v14 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(unsigned char *)(v17 + 9) = *(unsigned char *)(v18 + 9);
  *(void *)(v17 + 16) = *(void *)(v18 + 16);
  *(unsigned char *)(v17 + 24) = *(unsigned char *)(v18 + 24);
  *(unsigned char *)(v17 + 25) = *(unsigned char *)(v18 + 25);
  uint64_t v19 = *(void *)(v18 + 32);
  *(unsigned char *)(v17 + 40) = *(unsigned char *)(v18 + 40);
  *(void *)(v17 + 32) = v19;
  *(unsigned char *)(v17 + 41) = *(unsigned char *)(v18 + 41);
  return a1;
}

uint64_t sub_26050C378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26050C38C);
}

uint64_t sub_26050C38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_260531F20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 - 1) & ~(((int)v10 - 1) >> 31);
  }
}

uint64_t sub_26050C454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26050C468);
}

uint64_t sub_26050C468(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_260531F20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 + 1);
  }
  return result;
}

uint64_t sub_26050C528()
{
  uint64_t result = sub_260531F20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_26050C5E4()
{
  unint64_t result = qword_26A873590;
  if (!qword_26A873590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873590);
  }
  return result;
}

unint64_t sub_26050C63C()
{
  unint64_t result = qword_26A873598;
  if (!qword_26A873598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873598);
  }
  return result;
}

unint64_t sub_26050C694()
{
  unint64_t result = qword_26A8735A0;
  if (!qword_26A8735A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8735A0);
  }
  return result;
}

unint64_t sub_26050C6EC()
{
  unint64_t result = qword_26A8735A8;
  if (!qword_26A8735A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8735A8);
  }
  return result;
}

unint64_t sub_26050C744()
{
  unint64_t result = qword_26A8735B0;
  if (!qword_26A8735B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8735B0);
  }
  return result;
}

unint64_t sub_26050C79C()
{
  unint64_t result = qword_26A871E58;
  if (!qword_26A871E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E58);
  }
  return result;
}

unint64_t sub_26050C7F4()
{
  unint64_t result = qword_26A871E50;
  if (!qword_26A871E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E50);
  }
  return result;
}

unint64_t sub_26050C84C()
{
  unint64_t result = qword_26A871EA8;
  if (!qword_26A871EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EA8);
  }
  return result;
}

unint64_t sub_26050C8A4()
{
  unint64_t result = qword_26A871EA0;
  if (!qword_26A871EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EA0);
  }
  return result;
}

unint64_t sub_26050C8FC()
{
  unint64_t result = qword_26A871E80;
  if (!qword_26A871E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E80);
  }
  return result;
}

unint64_t sub_26050C954()
{
  unint64_t result = qword_26A871E78;
  if (!qword_26A871E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E78);
  }
  return result;
}

unint64_t sub_26050C9AC()
{
  unint64_t result = qword_26A871EB8;
  if (!qword_26A871EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EB8);
  }
  return result;
}

unint64_t sub_26050CA04()
{
  unint64_t result = qword_26A871EB0;
  if (!qword_26A871EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871EB0);
  }
  return result;
}

unint64_t sub_26050CA5C()
{
  unint64_t result = qword_26A871E98;
  if (!qword_26A871E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E98);
  }
  return result;
}

unint64_t sub_26050CAB4()
{
  unint64_t result = qword_26A871E90;
  if (!qword_26A871E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871E90);
  }
  return result;
}

uint64_t sub_26050CB08(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x694C656C676E6973 && a2 == 0xEA0000000000656ELL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C7069746C756DLL && a2 == 0xED000073656E694CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_26050CC90()
{
  unint64_t v0 = sub_260532DC0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_26050CCD8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_26050CD3C()
{
  return MEMORY[0x263F8EE78];
}

uint64_t IntelligenceSubelementProviding.intelligenceSubelements()()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_26050CD54()
{
  return 0;
}

uint64_t IntelligenceAppIntentsPayloadProviding.intelligenceAppIntentsPayload()()
{
  return 0;
}

uint64_t IntelligenceAppIntentsPayloadProviding.intelligenceAppIntentsPayloadDebugDescription()()
{
  return MEMORY[0x263F8EE78];
}

uint64_t _s21UIIntelligenceSupport31IntelligenceSubelementProvidingPAAE23intelligenceSubelements2in6boundsSayAA0C7ElementVGSo6CGRectV_AKtF_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntelligenceSubelementProviding.intelligenceSubelements(in:bounds:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntelligenceSubelementProviding.intelligenceSubelements()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntelligenceAppIntentsPayloadProviding.intelligenceAppIntentsPayload()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntelligenceAppIntentsPayloadProviding.intelligenceAppIntentsPayloadDebugDescription()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_26050CDDC(uint64_t a1)
{
  return sub_26050CEF8(a1, qword_26B3E8790, qword_26B3E8458, (uint64_t)qword_26B3E87B0);
}

uint64_t static OSSignposter.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_26050D050(&qword_26B3E8450, (uint64_t)qword_26B3E8790, a1);
}

uint64_t sub_26050CE2C(uint64_t a1)
{
  return sub_26050CEF8(a1, qword_26A873628, &qword_26B3E87E0, (uint64_t)qword_26B3E87C8);
}

uint64_t static OSSignposter.collector.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_26050D050(&qword_26A872158, (uint64_t)qword_26A873628, a1);
}

uint64_t sub_26050CE7C(uint64_t a1)
{
  return sub_26050CEF8(a1, qword_26A8719B0, &qword_26A871A00, (uint64_t)qword_26A8719E0);
}

uint64_t static OSSignposter.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_26050D050(&qword_26A8719D0, (uint64_t)qword_26A8719B0, a1);
}

uint64_t sub_26050CECC(uint64_t a1)
{
  return sub_26050CEF8(a1, qword_26B3E8E10, &qword_26B3E9308, (uint64_t)qword_26B3E9310);
}

uint64_t sub_26050CEF8(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_2605324A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_260532440();
  __swift_allocate_value_buffer(v11, a2);
  __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v7, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return sub_260532420();
}

uint64_t static OSSignposter.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_26050D050(&qword_26B3E8C48, (uint64_t)qword_26B3E8E10, a1);
}

uint64_t sub_26050D050@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_260532440();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t IntelligenceElement.Screen.DisplayType.hash(into:)()
{
  return sub_2605330A0();
}

BOOL static IntelligenceElement.Screen.DisplayType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_26050D130(uint64_t a1)
{
  unint64_t v2 = sub_2605107B0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D16C(uint64_t a1)
{
  unint64_t v2 = sub_2605107B0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26050D1A8()
{
  if (*v0) {
    return 0x79616C50726163;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_26050D1DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260510244(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_26050D204(uint64_t a1)
{
  unint64_t v2 = sub_26051075C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D240(uint64_t a1)
{
  unint64_t v2 = sub_26051075C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26050D27C(uint64_t a1)
{
  unint64_t v2 = sub_260510804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D2B8(uint64_t a1)
{
  unint64_t v2 = sub_260510804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Screen.DisplayType.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceElement.Screen.type.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t IntelligenceElement.Screen.type.setter(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = *v1;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 17);
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t v7 = *(void *)(v3 + 40);
  unint64_t v8 = *(void *)(v3 + 48);
  swift_bridgeObjectRetain();
  sub_26047F034(v7, v8);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v9 = *v1;
    swift_beginAccess();
    uint64_t v10 = *(void *)(v9 + 40);
    unint64_t v11 = *(void *)(v9 + 48);
    *(unsigned char *)(v9 + 16) = v2;
    *(unsigned char *)(v9 + 17) = v4;
    *(void *)(v9 + 24) = v6;
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    *(void *)(v9 + 48) = v8;
    swift_bridgeObjectRelease();
    return sub_26047F0A0(v10, v11);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
    uint64_t v13 = swift_allocObject();
    *(unsigned char *)(v13 + 16) = v2;
    *(unsigned char *)(v13 + 17) = v4;
    *(void *)(v13 + 24) = v6;
    *(void *)(v13 + 32) = v5;
    *(void *)(v13 + 40) = v7;
    *(void *)(v13 + 48) = v8;
    uint64_t result = swift_release();
    *unint64_t v1 = v13;
  }
  return result;
}

void (*IntelligenceElement.Screen.type.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  *((unsigned char *)v3 + 128) = *(unsigned char *)(v4 + 16);
  return sub_26050D504;
}

void sub_26050D504(uint64_t a1, char a2)
{
  char v2 = *(void **)a1;
  char v3 = *(unsigned char *)(*(void *)a1 + 128);
  uint64_t v4 = **(void **)(*(void *)a1 + 120);
  if (a2)
  {
    swift_beginAccess();
    char v5 = *(unsigned char *)(v4 + 17);
    uint64_t v7 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    unint64_t v9 = *(void *)(v4 + 48);
    swift_bridgeObjectRetain();
    sub_26047F034(v8, v9);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = (uint64_t *)v2[15];
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_5;
    }
  }
  else
  {
    swift_beginAccess();
    char v5 = *(unsigned char *)(v4 + 17);
    uint64_t v7 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    unint64_t v9 = *(void *)(v4 + 48);
    swift_bridgeObjectRetain();
    sub_26047F034(v8, v9);
    int v12 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = (uint64_t *)v2[15];
    if (v12)
    {
LABEL_5:
      uint64_t v13 = *v11;
      swift_beginAccess();
      uint64_t v14 = *(void *)(v13 + 40);
      unint64_t v15 = *(void *)(v13 + 48);
      *(unsigned char *)(v13 + 16) = v3;
      *(unsigned char *)(v13 + 17) = v5;
      *(void *)(v13 + 24) = v7;
      *(void *)(v13 + 32) = v6;
      *(void *)(v13 + 40) = v8;
      *(void *)(v13 + 48) = v9;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v14, v15);
      goto LABEL_7;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = v3;
  *(unsigned char *)(v16 + 17) = v5;
  *(void *)(v16 + 24) = v7;
  *(void *)(v16 + 32) = v6;
  *(void *)(v16 + 40) = v8;
  *(void *)(v16 + 48) = v9;
  swift_release();
  *unint64_t v11 = v16;
LABEL_7:

  free(v2);
}

uint64_t IntelligenceElement.Screen.ConnectionType.hash(into:)()
{
  return sub_2605330A0();
}

BOOL static IntelligenceElement.Screen.ConnectionType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_26050D6B0()
{
  uint64_t v1 = 0x6465646465626D65;
  if (*v0 != 1) {
    uint64_t v1 = 0x6C616E7265747865;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_26050D70C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260510338(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_26050D734(uint64_t a1)
{
  unint64_t v2 = sub_260510858();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D770(uint64_t a1)
{
  unint64_t v2 = sub_260510858();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26050D7AC(uint64_t a1)
{
  unint64_t v2 = sub_260510900();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D7E8(uint64_t a1)
{
  unint64_t v2 = sub_260510900();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26050D824(uint64_t a1)
{
  unint64_t v2 = sub_2605108AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D860(uint64_t a1)
{
  unint64_t v2 = sub_2605108AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26050D89C(uint64_t a1)
{
  unint64_t v2 = sub_260510954();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050D8D8(uint64_t a1)
{
  unint64_t v2 = sub_260510954();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Screen.ConnectionType.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceElement.Screen.connectionType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v3 + 17);
  return result;
}

uint64_t IntelligenceElement.Screen.connectionType.setter(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = *v1;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t v7 = *(void *)(v3 + 40);
  unint64_t v8 = *(void *)(v3 + 48);
  swift_bridgeObjectRetain();
  sub_26047F034(v7, v8);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v9 = *v1;
    swift_beginAccess();
    uint64_t v10 = *(void *)(v9 + 40);
    unint64_t v11 = *(void *)(v9 + 48);
    *(unsigned char *)(v9 + 16) = v4;
    *(unsigned char *)(v9 + 17) = v2;
    *(void *)(v9 + 24) = v6;
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    *(void *)(v9 + 48) = v8;
    swift_bridgeObjectRelease();
    return sub_26047F0A0(v10, v11);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
    uint64_t v13 = swift_allocObject();
    *(unsigned char *)(v13 + 16) = v4;
    *(unsigned char *)(v13 + 17) = v2;
    *(void *)(v13 + 24) = v6;
    *(void *)(v13 + 32) = v5;
    *(void *)(v13 + 40) = v7;
    *(void *)(v13 + 48) = v8;
    uint64_t result = swift_release();
    *uint64_t v1 = v13;
  }
  return result;
}

void (*IntelligenceElement.Screen.connectionType.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  *((unsigned char *)v3 + 128) = *(unsigned char *)(v4 + 17);
  return sub_26050DB24;
}

void sub_26050DB24(uint64_t a1, char a2)
{
  char v2 = *(void **)a1;
  char v3 = *(unsigned char *)(*(void *)a1 + 128);
  uint64_t v4 = **(void **)(*(void *)a1 + 120);
  if (a2)
  {
    swift_beginAccess();
    char v5 = *(unsigned char *)(v4 + 16);
    uint64_t v7 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    unint64_t v9 = *(void *)(v4 + 48);
    swift_bridgeObjectRetain();
    sub_26047F034(v8, v9);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = (uint64_t *)v2[15];
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_5;
    }
  }
  else
  {
    swift_beginAccess();
    char v5 = *(unsigned char *)(v4 + 16);
    uint64_t v7 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    unint64_t v9 = *(void *)(v4 + 48);
    swift_bridgeObjectRetain();
    sub_26047F034(v8, v9);
    int v12 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = (uint64_t *)v2[15];
    if (v12)
    {
LABEL_5:
      uint64_t v13 = *v11;
      swift_beginAccess();
      uint64_t v14 = *(void *)(v13 + 40);
      unint64_t v15 = *(void *)(v13 + 48);
      *(unsigned char *)(v13 + 16) = v5;
      *(unsigned char *)(v13 + 17) = v3;
      *(void *)(v13 + 24) = v7;
      *(void *)(v13 + 32) = v6;
      *(void *)(v13 + 40) = v8;
      *(void *)(v13 + 48) = v9;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v14, v15);
      goto LABEL_7;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = v5;
  *(unsigned char *)(v16 + 17) = v3;
  *(void *)(v16 + 24) = v7;
  *(void *)(v16 + 32) = v6;
  *(void *)(v16 + 40) = v8;
  *(void *)(v16 + 48) = v9;
  swift_release();
  *unint64_t v11 = v16;
LABEL_7:

  free(v2);
}

uint64_t IntelligenceElement.Screen.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t IntelligenceElement.Screen.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  char v6 = *(unsigned char *)(v5 + 16);
  char v7 = *(unsigned char *)(v5 + 17);
  uint64_t v8 = *(void *)(v5 + 40);
  unint64_t v9 = *(void *)(v5 + 48);
  swift_bridgeObjectRetain();
  sub_26047F034(v8, v9);
  swift_bridgeObjectRelease();
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v10 = *v2;
    swift_beginAccess();
    uint64_t v11 = *(void *)(v10 + 40);
    unint64_t v12 = *(void *)(v10 + 48);
    *(unsigned char *)(v10 + 16) = v6;
    *(unsigned char *)(v10 + 17) = v7;
    *(void *)(v10 + 24) = a1;
    *(void *)(v10 + 32) = a2;
    *(void *)(v10 + 40) = v8;
    *(void *)(v10 + 48) = v9;
    swift_bridgeObjectRelease();
    return sub_26047F0A0(v11, v12);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
    uint64_t v14 = swift_allocObject();
    *(unsigned char *)(v14 + 16) = v6;
    *(unsigned char *)(v14 + 17) = v7;
    *(void *)(v14 + 24) = a1;
    *(void *)(v14 + 32) = a2;
    *(void *)(v14 + 40) = v8;
    *(void *)(v14 + 48) = v9;
    uint64_t result = swift_release();
    *uint64_t v2 = v14;
  }
  return result;
}

void (*IntelligenceElement.Screen.identifier.modify(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x90uLL);
  *a1 = v3;
  v3[17] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 32);
  v3[15] = *(void *)(v4 + 24);
  v3[16] = v5;
  swift_bridgeObjectRetain();
  return sub_26050DE7C;
}

void sub_26050DE7C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 120);
  uint64_t v4 = *(void *)(*(void *)a1 + 128);
  uint64_t v5 = **(void **)(*(void *)a1 + 136);
  if (a2)
  {
    swift_beginAccess();
    char v6 = *(unsigned char *)(v5 + 16);
    char v7 = *(unsigned char *)(v5 + 17);
    uint64_t v8 = *(void *)(v5 + 40);
    unint64_t v9 = *(void *)(v5 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_26047F034(v8, v9);
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = (uint64_t *)v2[17];
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v12 = *v11;
      swift_beginAccess();
      uint64_t v13 = *(void *)(v12 + 40);
      unint64_t v14 = *(void *)(v12 + 48);
      *(unsigned char *)(v12 + 16) = v6;
      *(unsigned char *)(v12 + 17) = v7;
      *(void *)(v12 + 24) = v3;
      *(void *)(v12 + 32) = v4;
      *(void *)(v12 + 40) = v8;
      *(void *)(v12 + 48) = v9;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v13, v14);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
      uint64_t v24 = swift_allocObject();
      *(unsigned char *)(v24 + 16) = v6;
      *(unsigned char *)(v24 + 17) = v7;
      *(void *)(v24 + 24) = v3;
      *(void *)(v24 + 32) = v4;
      *(void *)(v24 + 40) = v8;
      *(void *)(v24 + 48) = v9;
      swift_release();
      *uint64_t v11 = v24;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    char v15 = *(unsigned char *)(v5 + 16);
    char v16 = *(unsigned char *)(v5 + 17);
    uint64_t v17 = *(void *)(v5 + 40);
    unint64_t v18 = *(void *)(v5 + 48);
    swift_bridgeObjectRetain();
    sub_26047F034(v17, v18);
    swift_bridgeObjectRelease();
    int v19 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = (uint64_t *)v2[17];
    if (v19)
    {
      uint64_t v21 = *v20;
      swift_beginAccess();
      uint64_t v22 = *(void *)(v21 + 40);
      unint64_t v23 = *(void *)(v21 + 48);
      *(unsigned char *)(v21 + 16) = v15;
      *(unsigned char *)(v21 + 17) = v16;
      *(void *)(v21 + 24) = v3;
      *(void *)(v21 + 32) = v4;
      *(void *)(v21 + 40) = v17;
      *(void *)(v21 + 48) = v18;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v22, v23);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
      uint64_t v25 = swift_allocObject();
      *(unsigned char *)(v25 + 16) = v15;
      *(unsigned char *)(v25 + 17) = v16;
      *(void *)(v25 + 24) = v3;
      *(void *)(v25 + 32) = v4;
      *(void *)(v25 + 40) = v17;
      *(void *)(v25 + 48) = v18;
      swift_release();
      *uint64_t v20 = v25;
    }
  }

  free(v2);
}

uint64_t IntelligenceElement.Screen.encodedFBSDisplayIdentity.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 40);
  sub_26047F034(v2, *(void *)(v1 + 48));
  return v2;
}

uint64_t sub_26050E0E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_26047F034(*a1, v2);
  sub_260510490(v1, v2);

  return sub_26047F0A0(v1, v2);
}

uint64_t IntelligenceElement.Screen.encodedFBSDisplayIdentity.setter(uint64_t a1, unint64_t a2)
{
  sub_260510490(a1, a2);

  return sub_26047F0A0(a1, a2);
}

void (*IntelligenceElement.Screen.encodedFBSDisplayIdentity.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x90uLL);
  *a1 = v3;
  v3[17] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 40);
  unint64_t v6 = *(void *)(v4 + 48);
  v3[15] = v5;
  v3[16] = v6;
  sub_26047F034(v5, v6);
  return sub_26050E200;
}

void sub_26050E200(uint64_t a1, char a2)
{
  unint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 120);
  unint64_t v4 = *(void *)(*(void *)a1 + 128);
  uint64_t v5 = **(void **)(*(void *)a1 + 136);
  if (a2)
  {
    swift_beginAccess();
    char v6 = *(unsigned char *)(v5 + 16);
    char v7 = *(unsigned char *)(v5 + 17);
    uint64_t v9 = *(void *)(v5 + 24);
    uint64_t v8 = *(void *)(v5 + 32);
    uint64_t v10 = *(void *)(v5 + 40);
    unint64_t v11 = *(void *)(v5 + 48);
    sub_26047F034(v3, v4);
    sub_26047F034(v3, v4);
    swift_bridgeObjectRetain();
    sub_26047F034(v10, v11);
    sub_26047F0A0(v10, v11);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = (uint64_t *)v2[17];
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v14 = *v13;
      swift_beginAccess();
      uint64_t v15 = *(void *)(v14 + 40);
      unint64_t v16 = *(void *)(v14 + 48);
      *(unsigned char *)(v14 + 16) = v6;
      *(unsigned char *)(v14 + 17) = v7;
      *(void *)(v14 + 24) = v9;
      *(void *)(v14 + 32) = v8;
      *(void *)(v14 + 40) = v3;
      *(void *)(v14 + 48) = v4;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v15, v16);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
      uint64_t v28 = swift_allocObject();
      *(unsigned char *)(v28 + 16) = v6;
      *(unsigned char *)(v28 + 17) = v7;
      *(void *)(v28 + 24) = v9;
      *(void *)(v28 + 32) = v8;
      *(void *)(v28 + 40) = v3;
      *(void *)(v28 + 48) = v4;
      swift_release();
      *uint64_t v13 = v28;
    }
    sub_26047F0A0(v3, v4);
    uint64_t v29 = v2[15];
    unint64_t v30 = v2[16];
  }
  else
  {
    swift_beginAccess();
    char v17 = *(unsigned char *)(v5 + 16);
    char v18 = *(unsigned char *)(v5 + 17);
    uint64_t v20 = *(void *)(v5 + 24);
    uint64_t v19 = *(void *)(v5 + 32);
    uint64_t v21 = *(void *)(v5 + 40);
    unint64_t v22 = *(void *)(v5 + 48);
    sub_26047F034(v3, v4);
    swift_bridgeObjectRetain();
    sub_26047F034(v21, v22);
    sub_26047F0A0(v21, v22);
    int v23 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = (uint64_t *)v2[17];
    if (v23)
    {
      uint64_t v25 = *v24;
      swift_beginAccess();
      uint64_t v26 = *(void *)(v25 + 40);
      unint64_t v27 = *(void *)(v25 + 48);
      *(unsigned char *)(v25 + 16) = v17;
      *(unsigned char *)(v25 + 17) = v18;
      *(void *)(v25 + 24) = v20;
      *(void *)(v25 + 32) = v19;
      *(void *)(v25 + 40) = v3;
      *(void *)(v25 + 48) = v4;
      swift_bridgeObjectRelease();
      sub_26047F0A0(v26, v27);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
      uint64_t v31 = swift_allocObject();
      *(unsigned char *)(v31 + 16) = v17;
      *(unsigned char *)(v31 + 17) = v18;
      *(void *)(v31 + 24) = v20;
      *(void *)(v31 + 32) = v19;
      *(void *)(v31 + 40) = v3;
      *(void *)(v31 + 48) = v4;
      swift_release();
      *uint64_t v24 = v31;
    }
    uint64_t v29 = v3;
    unint64_t v30 = v4;
  }
  sub_26047F0A0(v29, v30);

  free(v2);
}

double IntelligenceElement.Screen.init(type:connectionType:identifier:)@<D0>(char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  char v8 = *a1;
  char v9 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = v8;
  *(unsigned char *)(v10 + 17) = v9;
  *(void *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = a4;
  double result = 0.0;
  *(_OWORD *)(v10 + 40) = xmmword_260536250;
  *a5 = v10;
  return result;
}

double IntelligenceElement.Screen.init(type:identifier:)@<D0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  char v7 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = v7;
  *(unsigned char *)(v8 + 17) = 0;
  *(void *)(v8 + 24) = a2;
  *(void *)(v8 + 32) = a3;
  double result = 0.0;
  *(_OWORD *)(v8 + 40) = xmmword_260536250;
  *a4 = v8;
  return result;
}

uint64_t sub_26050E528(unsigned __int8 *a1, char *a2)
{
  return sub_2605270B4(*a1, *a2);
}

uint64_t sub_26050E534()
{
  return sub_2605221EC();
}

uint64_t sub_26050E53C()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_26050E60C()
{
  return sub_260528AC8();
}

uint64_t sub_26050E614@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260511968();
  *a1 = result;
  return result;
}

void sub_26050E644(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701869940;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEE00657079546E6FLL;
      uint64_t v3 = 0x697463656E6E6F63;
      goto LABEL_3;
    case 2:
      *a1 = 0x696669746E656469;
      a1[1] = 0xEA00000000007265;
      break;
    case 3:
      *a1 = 0xD000000000000019;
      a1[1] = 0x8000000260540C90;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_26050E6EC()
{
  unint64_t result = 1701869940;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x697463656E6E6F63;
      break;
    case 2:
      unint64_t result = 0x696669746E656469;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26050E788@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260511968();
  *a1 = result;
  return result;
}

uint64_t sub_26050E7B0(uint64_t a1)
{
  unint64_t v2 = sub_2605105B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26050E7EC(uint64_t a1)
{
  unint64_t v2 = sub_2605105B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceElement.Screen.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872038);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2605105B8();
  sub_260533120();
  swift_beginAccess();
  if (*(unsigned char *)(v8 + 16) == 1)
  {
    LOBYTE(v13) = 1;
    char v15 = 0;
    sub_26051060C();
    sub_260532F40();
    if (v2) {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  if (*(unsigned char *)(v8 + 17))
  {
    LOBYTE(v13) = *(unsigned char *)(v8 + 17);
    char v15 = 1;
    sub_260510660();
    sub_260532F40();
    if (v2) {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  if (*(void *)(v8 + 32))
  {
    LOBYTE(v13) = 2;
    swift_bridgeObjectRetain();
    sub_260532F00();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v10 = *(void *)(v8 + 48);
  if (v10 >> 60 == 15) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v11 = *(void *)(v8 + 40);
  uint64_t v13 = v11;
  unint64_t v14 = v10;
  char v15 = 3;
  sub_26047F048(v11, v10);
  sub_260483790();
  sub_260532F40();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_26047F0A0(v11, v10);
}

uint64_t IntelligenceElement.Screen.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2605105B8();
  sub_260533100();
  if (!v2)
  {
    char v22 = 0;
    sub_2605106B4();
    sub_260532E30();
    char v9 = v19;
    char v22 = 1;
    sub_260510708();
    sub_260532E30();
    if (v19 == 3) {
      int v10 = 0;
    }
    else {
      int v10 = v19;
    }
    LOBYTE(v19) = 2;
    uint64_t v17 = sub_260532DF0();
    uint64_t v18 = v12;
    int v21 = v10;
    char v22 = 3;
    sub_26048393C();
    sub_260532E30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v19;
    uint64_t v14 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
    uint64_t v15 = swift_allocObject();
    *(unsigned char *)(v15 + 16) = v9 & 1;
    *(unsigned char *)(v15 + 17) = v21;
    uint64_t v16 = v18;
    *(void *)(v15 + 24) = v17;
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v13;
    *(void *)(v15 + 48) = v14;
    *a2 = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_26050ED58@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceElement.Screen.init(from:)(a1, a2);
}

uint64_t sub_26050ED70(void *a1)
{
  return IntelligenceElement.Screen.encode(to:)(a1);
}

uint64_t IntelligenceElement.Screen.DisplayType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873648);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873650);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873658);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26051075C();
  sub_260533120();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_2605107B0();
    uint64_t v14 = v18;
    sub_260532EC0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_260510804();
    sub_260532EC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

uint64_t IntelligenceElement.Screen.DisplayType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873678);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873680);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873688);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26051075C();
  uint64_t v11 = v32;
  sub_260533100();
  if (v11) {
    goto LABEL_6;
  }
  unint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_260532EB0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_260532CF0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    *char v22 = &type metadata for IntelligenceElement.Screen.DisplayType;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_2605107B0();
    uint64_t v18 = v14;
    sub_260532DD0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_260510804();
    sub_260532DD0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_26050F484@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return IntelligenceElement.Screen.DisplayType.init(from:)(a1, a2);
}

uint64_t sub_26050F49C(void *a1)
{
  return IntelligenceElement.Screen.DisplayType.encode(to:)(a1);
}

uint64_t IntelligenceElement.Screen.ConnectionType.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872058);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872050);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872048);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872040);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260510858();
  sub_260533120();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_260510900();
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_2605108AC();
      char v17 = v23;
      sub_260532EC0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_260510954();
    sub_260532EC0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t IntelligenceElement.Screen.ConnectionType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B40);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B38);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B30);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B28);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260510858();
  uint64_t v12 = (uint64_t)v39;
  sub_260533100();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_260532EB0();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_260532CF0();
    swift_allocError();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    *uint64_t v23 = &type metadata for IntelligenceElement.Screen.ConnectionType;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_260510900();
      uint64_t v18 = v30;
      sub_260532DD0();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_2605108AC();
      uint64_t v25 = v30;
      sub_260532DD0();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_260510954();
    uint64_t v24 = v30;
    sub_260532DD0();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

uint64_t sub_26050FDD0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return IntelligenceElement.Screen.ConnectionType.init(from:)(a1, a2);
}

uint64_t sub_26050FDE8(void *a1)
{
  return IntelligenceElement.Screen.ConnectionType.encode(to:)(a1);
}

char *IntelligenceElement.Screen.description.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  if (*(unsigned char *)(v1 + 16) != 1)
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    if (!*(unsigned char *)(v1 + 17)) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  sub_260532840();
  sub_260532D30();
  uint64_t v2 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_260457640((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  uint64_t v5 = &v2[2 * v4];
  v5[4] = 0;
  v5[5] = 0xE000000000000000;
  if (*(unsigned char *)(v1 + 17))
  {
LABEL_7:
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    sub_260532CB0();
    sub_260532840();
    sub_260532D30();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_260457640((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    uint64_t v8 = &v2[2 * v7];
    v8[4] = 0;
    v8[5] = 0xE000000000000000;
  }
LABEL_12:
  unint64_t v9 = *(void *)(v1 + 32);
  if (v9)
  {
    uint64_t v10 = *(void *)(v1 + 24);
    uint64_t v11 = HIBYTE(v9) & 0xF;
    if ((v9 & 0x2000000000000000) == 0) {
      uint64_t v11 = v10 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      swift_bridgeObjectRetain();
      sub_260532CB0();
      swift_bridgeObjectRelease();
      strcpy((char *)v18, "identifier: \"");
      HIWORD(v18[1]) = -4864;
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v12 = v18[0];
      uint64_t v13 = v18[1];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
      }
      unint64_t v15 = v2[2];
      unint64_t v14 = v2[3];
      if (v15 >= v14 >> 1) {
        uint64_t v2 = sub_260457640((void *)(v14 > 1), v15 + 1, 1, v2);
      }
      v2[2] = v15 + 1;
      uint64_t v16 = &v2[2 * v15];
      v16[4] = v12;
      v16[5] = v13;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return strcpy((char *)v18, "Screen(");
}

uint64_t _s21UIIntelligenceSupport19IntelligenceElementV6ScreenV2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  int v4 = *(unsigned __int8 *)(v2 + 16);
  swift_beginAccess();
  if (v4 == *(unsigned __int8 *)(v3 + 16) && *(unsigned __int8 *)(v2 + 17) == *(unsigned __int8 *)(v3 + 17))
  {
    uint64_t v5 = *(void *)(v2 + 32);
    uint64_t v6 = *(void *)(v3 + 32);
    char v7 = (v5 | v6) == 0;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (*(void *)(v2 + 24) == *(void *)(v3 + 24) && v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = sub_260532FA0();
      }
    }
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_260510244(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79616C50726163 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_260510338(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646465626D65 && a2 == 0xE800000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C616E7265747865 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_260510490(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  char v6 = *(unsigned char *)(v5 + 16);
  char v7 = *(unsigned char *)(v5 + 17);
  uint64_t v9 = *(void *)(v5 + 24);
  uint64_t v8 = *(void *)(v5 + 32);
  uint64_t v10 = *(void *)(v5 + 40);
  unint64_t v11 = *(void *)(v5 + 48);
  sub_26047F034(a1, a2);
  swift_bridgeObjectRetain();
  sub_26047F034(v10, v11);
  sub_26047F0A0(v10, v11);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v12 = *v2;
    swift_beginAccess();
    uint64_t v13 = *(void *)(v12 + 40);
    unint64_t v14 = *(void *)(v12 + 48);
    *(unsigned char *)(v12 + 16) = v6;
    *(unsigned char *)(v12 + 17) = v7;
    *(void *)(v12 + 24) = v9;
    *(void *)(v12 + 32) = v8;
    *(void *)(v12 + 40) = a1;
    *(void *)(v12 + 48) = a2;
    swift_bridgeObjectRelease();
    return sub_26047F0A0(v13, v14);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AA8);
    uint64_t v16 = swift_allocObject();
    *(unsigned char *)(v16 + 16) = v6;
    *(unsigned char *)(v16 + 17) = v7;
    *(void *)(v16 + 24) = v9;
    *(void *)(v16 + 32) = v8;
    *(void *)(v16 + 40) = a1;
    *(void *)(v16 + 48) = a2;
    uint64_t result = swift_release();
    *BOOL v2 = v16;
  }
  return result;
}

unint64_t sub_2605105B8()
{
  unint64_t result = qword_26B3E86C8;
  if (!qword_26B3E86C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86C8);
  }
  return result;
}

unint64_t sub_26051060C()
{
  unint64_t result = qword_26A873640;
  if (!qword_26A873640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873640);
  }
  return result;
}

unint64_t sub_260510660()
{
  unint64_t result = qword_26A871F78;
  if (!qword_26A871F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871F78);
  }
  return result;
}

unint64_t sub_2605106B4()
{
  unint64_t result = qword_26A871940;
  if (!qword_26A871940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871940);
  }
  return result;
}

unint64_t sub_260510708()
{
  unint64_t result = qword_26A871948;
  if (!qword_26A871948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871948);
  }
  return result;
}

unint64_t sub_26051075C()
{
  unint64_t result = qword_26A873660;
  if (!qword_26A873660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873660);
  }
  return result;
}

unint64_t sub_2605107B0()
{
  unint64_t result = qword_26A873668;
  if (!qword_26A873668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873668);
  }
  return result;
}

unint64_t sub_260510804()
{
  unint64_t result = qword_26A873670;
  if (!qword_26A873670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873670);
  }
  return result;
}

unint64_t sub_260510858()
{
  unint64_t result = qword_26B3E86E0;
  if (!qword_26B3E86E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86E0);
  }
  return result;
}

unint64_t sub_2605108AC()
{
  unint64_t result = qword_26A873690;
  if (!qword_26A873690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873690);
  }
  return result;
}

unint64_t sub_260510900()
{
  unint64_t result = qword_26B3E8708;
  if (!qword_26B3E8708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8708);
  }
  return result;
}

unint64_t sub_260510954()
{
  unint64_t result = qword_26A873698;
  if (!qword_26A873698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873698);
  }
  return result;
}

unint64_t sub_2605109AC()
{
  unint64_t result = qword_26A8736A0;
  if (!qword_26A8736A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736A0);
  }
  return result;
}

unint64_t sub_260510A04()
{
  unint64_t result = qword_26A8736A8;
  if (!qword_26A8736A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736A8);
  }
  return result;
}

uint64_t sub_260510A58@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_260510AA0(char *a1)
{
  char v2 = *a1;
  return IntelligenceElement.Screen.type.setter(&v2);
}

uint64_t sub_260510AD8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 17);
  return result;
}

uint64_t sub_260510B20(char *a1)
{
  char v2 = *a1;
  return IntelligenceElement.Screen.connectionType.setter(&v2);
}

uint64_t sub_260510B58@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_260510BA4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return IntelligenceElement.Screen.identifier.setter(v1, v2);
}

uint64_t sub_260510BE4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  unint64_t v5 = *(void *)(v3 + 48);
  *a2 = v4;
  a2[1] = v5;
  return sub_26047F034(v4, v5);
}

ValueMetadata *type metadata accessor for IntelligenceElement.Screen()
{
  return &type metadata for IntelligenceElement.Screen;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Screen.DisplayType()
{
  return &type metadata for IntelligenceElement.Screen.DisplayType;
}

ValueMetadata *type metadata accessor for IntelligenceElement.Screen.ConnectionType()
{
  return &type metadata for IntelligenceElement.Screen.ConnectionType;
}

unsigned char *_s6ScreenV14ConnectionTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260510D38);
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

ValueMetadata *_s6ScreenV14ConnectionTypeO10CodingKeysOMa()
{
  return &_s6ScreenV14ConnectionTypeO10CodingKeysON;
}

ValueMetadata *_s6ScreenV14ConnectionTypeO17UnknownCodingKeysOMa()
{
  return &_s6ScreenV14ConnectionTypeO17UnknownCodingKeysON;
}

ValueMetadata *_s6ScreenV14ConnectionTypeO18EmbeddedCodingKeysOMa()
{
  return &_s6ScreenV14ConnectionTypeO18EmbeddedCodingKeysON;
}

ValueMetadata *_s6ScreenV14ConnectionTypeO18ExternalCodingKeysOMa()
{
  return &_s6ScreenV14ConnectionTypeO18ExternalCodingKeysON;
}

unsigned char *_s6ScreenV11DisplayTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x260510E6CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s6ScreenV11DisplayTypeO10CodingKeysOMa()
{
  return &_s6ScreenV11DisplayTypeO10CodingKeysON;
}

ValueMetadata *_s6ScreenV11DisplayTypeO17UnknownCodingKeysOMa()
{
  return &_s6ScreenV11DisplayTypeO17UnknownCodingKeysON;
}

ValueMetadata *_s6ScreenV11DisplayTypeO17CarPlayCodingKeysOMa()
{
  return &_s6ScreenV11DisplayTypeO17CarPlayCodingKeysON;
}

unsigned char *_s6ScreenV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260510F90);
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

ValueMetadata *_s6ScreenV10CodingKeysOMa()
{
  return &_s6ScreenV10CodingKeysON;
}

uint64_t _s6ScreenV7StorageVwxx(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    return sub_260464128(v4, v3);
  }
  return result;
}

uint64_t _s6ScreenV7StorageVwcp(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = (_OWORD *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v4;
  }
  else
  {
    uint64_t v6 = *(void *)v4;
    sub_26047F048(v6, v5);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v5;
  }
  return a1;
}

uint64_t _s6ScreenV7StorageVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_26047F048(*v4, v5);
      uint64_t v8 = *(void *)(a1 + 24);
      unint64_t v9 = *(void *)(a1 + 32);
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v5;
      sub_260464128(v8, v9);
      return a1;
    }
    sub_260497FA0(a1 + 24);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_26047F048(*v4, v5);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  return a1;
}

uint64_t _s6ScreenV7StorageVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = (void *)(a2 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 32);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 24);
      *(void *)(a1 + 24) = *v5;
      *(void *)(a1 + 32) = v7;
      sub_260464128(v8, v6);
      return a1;
    }
    sub_260497FA0(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v5;
  return a1;
}

uint64_t _s6ScreenV7StorageVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
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

uint64_t _s6ScreenV7StorageVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *_s6ScreenV7StorageVMa()
{
  return &_s6ScreenV7StorageVN;
}

unint64_t sub_2605112E4()
{
  unint64_t result = qword_26A8736B0;
  if (!qword_26A8736B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736B0);
  }
  return result;
}

unint64_t sub_26051133C()
{
  unint64_t result = qword_26A8736B8;
  if (!qword_26A8736B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736B8);
  }
  return result;
}

unint64_t sub_260511394()
{
  unint64_t result = qword_26A8736C0;
  if (!qword_26A8736C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736C0);
  }
  return result;
}

unint64_t sub_2605113EC()
{
  unint64_t result = qword_26B3E8700;
  if (!qword_26B3E8700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8700);
  }
  return result;
}

unint64_t sub_260511444()
{
  unint64_t result = qword_26B3E86F8;
  if (!qword_26B3E86F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86F8);
  }
  return result;
}

unint64_t sub_26051149C()
{
  unint64_t result = qword_26B3E8718;
  if (!qword_26B3E8718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8718);
  }
  return result;
}

unint64_t sub_2605114F4()
{
  unint64_t result = qword_26B3E8710;
  if (!qword_26B3E8710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8710);
  }
  return result;
}

unint64_t sub_26051154C()
{
  unint64_t result = qword_26B3E8728;
  if (!qword_26B3E8728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8728);
  }
  return result;
}

unint64_t sub_2605115A4()
{
  unint64_t result = qword_26B3E8720;
  if (!qword_26B3E8720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8720);
  }
  return result;
}

unint64_t sub_2605115FC()
{
  unint64_t result = qword_26B3E86F0;
  if (!qword_26B3E86F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86F0);
  }
  return result;
}

unint64_t sub_260511654()
{
  unint64_t result = qword_26B3E86E8;
  if (!qword_26B3E86E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86E8);
  }
  return result;
}

unint64_t sub_2605116AC()
{
  unint64_t result = qword_26A8736C8;
  if (!qword_26A8736C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736C8);
  }
  return result;
}

unint64_t sub_260511704()
{
  unint64_t result = qword_26A8736D0;
  if (!qword_26A8736D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736D0);
  }
  return result;
}

unint64_t sub_26051175C()
{
  unint64_t result = qword_26A8736D8;
  if (!qword_26A8736D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736D8);
  }
  return result;
}

unint64_t sub_2605117B4()
{
  unint64_t result = qword_26A8736E0;
  if (!qword_26A8736E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736E0);
  }
  return result;
}

unint64_t sub_26051180C()
{
  unint64_t result = qword_26A8736E8;
  if (!qword_26A8736E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736E8);
  }
  return result;
}

unint64_t sub_260511864()
{
  unint64_t result = qword_26A8736F0;
  if (!qword_26A8736F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8736F0);
  }
  return result;
}

unint64_t sub_2605118BC()
{
  unint64_t result = qword_26B3E86D8;
  if (!qword_26B3E86D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86D8);
  }
  return result;
}

unint64_t sub_260511914()
{
  unint64_t result = qword_26B3E86D0;
  if (!qword_26B3E86D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E86D0);
  }
  return result;
}

uint64_t sub_260511968()
{
  unint64_t v0 = sub_260532DC0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_2605119B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t IntelligenceCommand.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntelligenceCommand.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntelligenceCommand.title.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.standaloneTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntelligenceCommand.standaloneTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntelligenceCommand.standaloneTitle.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.menuHierarchyComponents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceCommand.menuHierarchyComponents.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*IntelligenceCommand.menuHierarchyComponents.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.menuGroup.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t IntelligenceCommand.menuGroup.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*IntelligenceCommand.menuGroup.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.KeyboardShortcut.ModifierKeys.rawValue.getter()
{
  return *(void *)v0;
}

UIIntelligenceSupport::IntelligenceCommand::KeyboardShortcut::ModifierKeys __swiftcall IntelligenceCommand.KeyboardShortcut.ModifierKeys.init(rawValue:)(UIIntelligenceSupport::IntelligenceCommand::KeyboardShortcut::ModifierKeys rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.command.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.option.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.control.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.shift.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.globe.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.numericPad.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static IntelligenceCommand.KeyboardShortcut.ModifierKeys.capsLock.getter(void *a1@<X8>)
{
  *a1 = 64;
}

uint64_t sub_260511C04()
{
  return sub_260532900();
}

uint64_t sub_260511C64()
{
  return sub_2605328F0();
}

void *sub_260511CB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_260511CC8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_260511CDC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_260511D08@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_260511D2C(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_260511D40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_260511D54(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_260511D68(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_260511D7C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_260511D90()
{
  return *v0 == 0;
}

uint64_t sub_260511DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_260511DB8(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_260511DCC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void IntelligenceCommand.KeyboardShortcut.modifierKeys.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void *IntelligenceCommand.KeyboardShortcut.modifierKeys.setter(void *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*IntelligenceCommand.KeyboardShortcut.modifierKeys.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.KeyboardShortcut.KeyEquivalent.hash(into:)()
{
  if (!*(unsigned char *)(v0 + 16))
  {
    sub_2605330A0();
    return sub_2605330A0();
  }
  if (*(unsigned char *)(v0 + 16) != 1) {
    return sub_2605330A0();
  }
  sub_2605330A0();

  return sub_260532810();
}

uint64_t sub_260511F84(char a1)
{
  uint64_t result = 0x776F7272417075;
  switch(a1)
  {
    case 1:
      unsigned int v3 = 1853321060;
      goto LABEL_4;
    case 2:
      unsigned int v3 = 1952867692;
LABEL_4:
      uint64_t result = v3 | 0x6F72724100000000;
      break;
    case 3:
      uint64_t result = 0x7272417468676972;
      break;
    case 4:
      uint64_t result = 0x6574656C6564;
      break;
    case 5:
      uint64_t result = 0x4464726177726F66;
      break;
    case 6:
      uint64_t result = 0x7261656C63;
      break;
    case 7:
      uint64_t result = 1701670760;
      break;
    case 8:
      uint64_t result = 6581861;
      break;
    case 9:
      uint64_t result = 0x705565676170;
      break;
    case 10:
      uint64_t result = 0x6E776F4465676170;
      break;
    case 11:
      uint64_t result = 6447476;
      break;
    case 12:
      uint64_t result = 0x6563617073;
      break;
    case 13:
      uint64_t result = 0x6E7275746572;
      break;
    case 14:
      uint64_t result = 0x657061637365;
      break;
    case 15:
      uint64_t result = 0x6E6F6974636E7566;
      break;
    case 16:
      uint64_t result = 0x6D6F74737563;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260512158(uint64_t a1)
{
  unint64_t v2 = sub_260518D8C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512194(uint64_t a1)
{
  unint64_t v2 = sub_260518D8C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605121D0()
{
  return sub_260511F84(*v0);
}

uint64_t sub_2605121D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26051B7FC(a1, a2);
  *a3 = result;
  return result;
}

void sub_260512200(unsigned char *a1@<X8>)
{
  *a1 = 17;
}

uint64_t sub_26051220C(uint64_t a1)
{
  unint64_t v2 = sub_2605189F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512248(uint64_t a1)
{
  unint64_t v2 = sub_2605189F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512284(uint64_t a1)
{
  unint64_t v2 = sub_260518A44();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605122C0(uint64_t a1)
{
  unint64_t v2 = sub_260518A44();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605122FC(uint64_t a1)
{
  unint64_t v2 = sub_260518E34();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512338(uint64_t a1)
{
  unint64_t v2 = sub_260518E34();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512374(uint64_t a1)
{
  unint64_t v2 = sub_260518F30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605123B0(uint64_t a1)
{
  unint64_t v2 = sub_260518F30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605123EC(uint64_t a1)
{
  unint64_t v2 = sub_260518CE4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512428(uint64_t a1)
{
  unint64_t v2 = sub_260518CE4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512464(uint64_t a1)
{
  unint64_t v2 = sub_260518AEC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605124A0(uint64_t a1)
{
  unint64_t v2 = sub_260518AEC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605124DC(uint64_t a1)
{
  unint64_t v2 = sub_260518DE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512518(uint64_t a1)
{
  unint64_t v2 = sub_260518DE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512554(uint64_t a1)
{
  unint64_t v2 = sub_260518A98();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512590(uint64_t a1)
{
  unint64_t v2 = sub_260518A98();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605125CC(uint64_t a1)
{
  unint64_t v2 = sub_260518D38();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512608(uint64_t a1)
{
  unint64_t v2 = sub_260518D38();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512644(uint64_t a1)
{
  unint64_t v2 = sub_260518EDC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512680(uint64_t a1)
{
  unint64_t v2 = sub_260518EDC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605126BC(uint64_t a1)
{
  unint64_t v2 = sub_260518C3C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605126F8(uint64_t a1)
{
  unint64_t v2 = sub_260518C3C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512734(uint64_t a1)
{
  unint64_t v2 = sub_260518C90();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512770(uint64_t a1)
{
  unint64_t v2 = sub_260518C90();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605127AC(uint64_t a1)
{
  unint64_t v2 = sub_260518B40();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605127E8(uint64_t a1)
{
  unint64_t v2 = sub_260518B40();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512824(uint64_t a1)
{
  unint64_t v2 = sub_260518E88();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512860(uint64_t a1)
{
  unint64_t v2 = sub_260518E88();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26051289C(uint64_t a1)
{
  unint64_t v2 = sub_260518B94();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605128D8(uint64_t a1)
{
  unint64_t v2 = sub_260518B94();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_260512914(uint64_t a1)
{
  unint64_t v2 = sub_260518BE8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260512950(uint64_t a1)
{
  unint64_t v2 = sub_260518BE8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26051298C(uint64_t a1)
{
  unint64_t v2 = sub_260518F84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605129C8(uint64_t a1)
{
  unint64_t v2 = sub_260518F84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceCommand.KeyboardShortcut.KeyEquivalent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873700);
  uint64_t v108 = *(void *)(v3 - 8);
  uint64_t v109 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v107 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873708);
  uint64_t v105 = *(void *)(v5 - 8);
  uint64_t v106 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v104 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873710);
  uint64_t v102 = *(void *)(v7 - 8);
  uint64_t v103 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v101 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873718);
  uint64_t v99 = *(void *)(v9 - 8);
  uint64_t v100 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v98 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873720);
  uint64_t v96 = *(void *)(v11 - 8);
  uint64_t v97 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v95 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873728);
  uint64_t v93 = *(void *)(v13 - 8);
  uint64_t v94 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v92 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873730);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  unint64_t v89 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873738);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v86 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873740);
  uint64_t v84 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v83 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873748);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v80 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873750);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  Swift::Int_optional v77 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873758);
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v74 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873760);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v71 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873768);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  char v68 = (char *)&v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873770);
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v65 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873778);
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  double v62 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873780);
  uint64_t v61 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  char v27 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873788);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v111 = v28;
  uint64_t v112 = v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v61 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *v1;
  int v33 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2605189F0();
  uint64_t v110 = v31;
  sub_260533120();
  if (v33)
  {
    if (v33 != 1)
    {
      switch(v32)
      {
        case 1:
          char v114 = 1;
          sub_260518F30();
          uint64_t v44 = v62;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v63 + 8);
          uint64_t v47 = v44;
          uint64_t v48 = (char **)&v96;
          goto LABEL_18;
        case 2:
          char v114 = 2;
          sub_260518EDC();
          uint64_t v49 = v65;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v66 + 8);
          uint64_t v47 = v49;
          uint64_t v48 = (char **)&v99;
          goto LABEL_18;
        case 3:
          char v114 = 3;
          sub_260518E88();
          uint64_t v50 = v68;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v69 + 8);
          uint64_t v47 = v50;
          uint64_t v48 = (char **)&v102;
          goto LABEL_18;
        case 4:
          char v114 = 4;
          sub_260518E34();
          uint64_t v51 = v71;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v72 + 8);
          uint64_t v47 = v51;
          uint64_t v48 = (char **)&v105;
          goto LABEL_18;
        case 5:
          char v114 = 5;
          sub_260518DE0();
          uint64_t v52 = v74;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v75 + 8);
          uint64_t v47 = v52;
          uint64_t v48 = (char **)&v108;
          goto LABEL_18;
        case 6:
          char v114 = 6;
          sub_260518D8C();
          uint64_t v53 = v77;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v78 + 8);
          uint64_t v47 = v53;
          uint64_t v48 = &v110;
          goto LABEL_18;
        case 7:
          char v114 = 7;
          sub_260518D38();
          uint64_t v54 = v80;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v81 + 8);
          uint64_t v47 = v54;
          uint64_t v48 = (char **)&v113;
          goto LABEL_18;
        case 8:
          char v114 = 8;
          sub_260518CE4();
          uint64_t v55 = v83;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v84 + 8);
          uint64_t v47 = v55;
          uint64_t v48 = (char **)&v115;
          goto LABEL_18;
        case 9:
          char v114 = 9;
          sub_260518C90();
          uint64_t v56 = v86;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v87 + 8);
          uint64_t v47 = v56;
          uint64_t v48 = (char **)&v116;
          goto LABEL_18;
        case 10:
          char v114 = 10;
          sub_260518C3C();
          uint64_t v57 = v89;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          char v46 = *(void (**)(char *, uint64_t))(v90 + 8);
          uint64_t v47 = v57;
          uint64_t v48 = (char **)&v117;
LABEL_18:
          uint64_t v58 = (uint64_t)*(v48 - 32);
          goto LABEL_24;
        case 11:
          char v114 = 11;
          sub_260518BE8();
          uint64_t v59 = v92;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          uint64_t v60 = v93;
          uint64_t v58 = v94;
          goto LABEL_23;
        case 12:
          char v114 = 12;
          sub_260518B94();
          uint64_t v59 = v95;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          uint64_t v60 = v96;
          uint64_t v58 = v97;
          goto LABEL_23;
        case 13:
          char v114 = 13;
          sub_260518B40();
          uint64_t v59 = v98;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          uint64_t v60 = v99;
          uint64_t v58 = v100;
          goto LABEL_23;
        case 14:
          char v114 = 14;
          sub_260518AEC();
          uint64_t v59 = v101;
          unint64_t v45 = v110;
          uint64_t v35 = v111;
          sub_260532EC0();
          uint64_t v60 = v102;
          uint64_t v58 = v103;
LABEL_23:
          char v46 = *(void (**)(char *, uint64_t))(v60 + 8);
          uint64_t v47 = v59;
LABEL_24:
          v46(v47, v58);
          uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v112 + 8);
          char v40 = v45;
          return v39(v40, v35);
        default:
          char v114 = 0;
          sub_260518F84();
          char v41 = v110;
          uint64_t v42 = v111;
          sub_260532EC0();
          (*(void (**)(char *, uint64_t))(v61 + 8))(v27, v25);
          return (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v41, v42);
      }
    }
    char v114 = 16;
    sub_260518A44();
    uint64_t v34 = v107;
    uint64_t v36 = v110;
    uint64_t v35 = v111;
    sub_260532EC0();
    uint64_t v37 = v109;
    sub_260532F00();
    uint64_t v38 = v108;
  }
  else
  {
    char v114 = 15;
    sub_260518A98();
    uint64_t v34 = v104;
    uint64_t v36 = v110;
    uint64_t v35 = v111;
    sub_260532EC0();
    uint64_t v37 = v106;
    sub_260532F30();
    uint64_t v38 = v105;
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v37);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v112 + 8);
  char v40 = v36;
  return v39(v40, v35);
}

uint64_t IntelligenceCommand.KeyboardShortcut.KeyEquivalent.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceCommand.KeyboardShortcut.KeyEquivalent.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v114 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873820);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v101 = v3;
  uint64_t v102 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v118 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873828);
  uint64_t v99 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  char v113 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873830);
  uint64_t v97 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  uint64_t v112 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873838);
  uint64_t v95 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v111 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873840);
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  uint64_t v110 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873848);
  uint64_t v91 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v109 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873850);
  uint64_t v89 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v108 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873858);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v107 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873860);
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v106 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873868);
  uint64_t v83 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v103 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873870);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v117 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873878);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v116 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873880);
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v105 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873888);
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v104 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873890);
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v115 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873898);
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738A0);
  uint64_t v70 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738A8);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a1[3];
  uint64_t v119 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_2605189F0();
  uint64_t v30 = v120;
  sub_260533100();
  uint64_t v31 = v30;
  if (v30) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v119);
  }
  char v68 = v24;
  uint64_t v67 = v22;
  uint64_t v69 = v21;
  int v33 = v115;
  uint64_t v32 = v116;
  uint64_t v35 = v117;
  uint64_t v34 = v118;
  uint64_t v120 = v26;
  uint64_t v36 = sub_260532EB0();
  if (*(void *)(v36 + 16) != 1)
  {
    uint64_t v39 = sub_260532CF0();
    swift_allocError();
    char v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A872528);
    *char v41 = &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent;
    sub_260532DE0();
    sub_260532CE0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v39 - 8) + 104))(v41, *MEMORY[0x263F8DCB0], v39);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v119);
  }
  switch(*(unsigned char *)(v36 + 32))
  {
    case 1:
      char v121 = 1;
      sub_260518F30();
      uint64_t v42 = v69;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v42, v72);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 1;
      break;
    case 2:
      char v121 = 2;
      sub_260518EDC();
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v73 + 8))(v33, v74);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      uint64_t v38 = 2;
      goto LABEL_8;
    case 3:
      char v121 = 3;
      sub_260518E88();
      uint64_t v44 = v104;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v75 + 8))(v44, v76);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 3;
      break;
    case 4:
      char v121 = 4;
      sub_260518E34();
      unint64_t v45 = v105;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v77 + 8))(v45, v78);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 4;
      break;
    case 5:
      char v121 = 5;
      sub_260518DE0();
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v32, v80);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 5;
      break;
    case 6:
      char v121 = 6;
      sub_260518D8C();
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v35, v82);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 6;
      break;
    case 7:
      char v121 = 7;
      sub_260518D38();
      char v46 = v103;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v83 + 8))(v46, v84);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 7;
      break;
    case 8:
      char v121 = 8;
      sub_260518CE4();
      uint64_t v47 = v106;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v85 + 8))(v47, v86);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 8;
      break;
    case 9:
      char v121 = 9;
      sub_260518C90();
      uint64_t v48 = v107;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v48, v88);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 9;
      break;
    case 0xA:
      char v121 = 10;
      sub_260518C3C();
      uint64_t v49 = v108;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v89 + 8))(v49, v90);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 10;
      break;
    case 0xB:
      char v121 = 11;
      sub_260518BE8();
      uint64_t v50 = v109;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v91 + 8))(v50, v92);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 11;
      break;
    case 0xC:
      char v121 = 12;
      sub_260518B94();
      uint64_t v51 = v110;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v93 + 8))(v51, v94);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 12;
      break;
    case 0xD:
      char v121 = 13;
      sub_260518B40();
      uint64_t v52 = v111;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v95 + 8))(v52, v96);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 13;
      break;
    case 0xE:
      char v121 = 14;
      sub_260518AEC();
      uint64_t v53 = v112;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v97 + 8))(v53, v98);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      char v43 = 2;
      uint64_t v38 = 14;
      break;
    case 0xF:
      char v121 = 15;
      sub_260518A98();
      uint64_t v54 = v113;
      sub_260532DD0();
      uint64_t v55 = v100;
      uint64_t v56 = sub_260532E60();
      uint64_t v31 = 0;
      uint64_t v57 = v120;
      uint64_t v38 = v56;
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v99 + 8))(v54, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v28, v25);
      char v43 = 0;
      break;
    case 0x10:
      char v121 = 16;
      sub_260518A44();
      uint64_t v58 = v34;
      sub_260532DD0();
      uint64_t v60 = v101;
      uint64_t v61 = sub_260532E40();
      uint64_t v66 = 0;
      uint64_t v62 = v120;
      uint64_t v38 = v61;
      uint64_t v31 = v63;
      (*(void (**)(char *, uint64_t))(v102 + 8))(v58, v60);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v28, v25);
      char v43 = 1;
      break;
    default:
      char v121 = 0;
      sub_260518F84();
      uint64_t v37 = v68;
      sub_260532DD0();
      uint64_t v66 = 0;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v37, v67);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v28, v25);
      uint64_t v38 = 0;
LABEL_8:
      char v43 = 2;
      break;
  }
  uint64_t v64 = (uint64_t)v119;
  uint64_t v65 = v114;
  *char v114 = v38;
  v65[1] = v31;
  *((unsigned char *)v65 + 16) = v43;
  return __swift_destroy_boxed_opaque_existential_1(v64);
}

uint64_t sub_260515104()
{
  return sub_2605330E0();
}

uint64_t sub_26051515C()
{
  return sub_2605330E0();
}

uint64_t sub_2605151AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceCommand.KeyboardShortcut.KeyEquivalent.init(from:)(a1, a2);
}

uint64_t sub_2605151C4(void *a1)
{
  return IntelligenceCommand.KeyboardShortcut.KeyEquivalent.encode(to:)(a1);
}

uint64_t IntelligenceCommand.KeyboardShortcut.keyEquivalent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_260518FD8(v2, v3, v4);
}

uint64_t IntelligenceCommand.KeyboardShortcut.keyEquivalent.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = sub_260518FF0(*(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  *(unsigned char *)(v1 + 24) = v4;
  return result;
}

uint64_t (*IntelligenceCommand.KeyboardShortcut.keyEquivalent.modify())()
{
  return nullsub_1;
}

__n128 IntelligenceCommand.KeyboardShortcut.init(modifierKeys:keyEquivalent:)@<Q0>(void *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 v3 = a2[1].n128_u8[0];
  *(void *)a3 = *a1;
  __n128 result = *a2;
  *(__n128 *)(a3 + 8) = *a2;
  *(unsigned char *)(a3 + 24) = v3;
  return result;
}

uint64_t IntelligenceCommand.KeyboardShortcut.hash(into:)()
{
  return IntelligenceCommand.KeyboardShortcut.KeyEquivalent.hash(into:)();
}

uint64_t static IntelligenceCommand.KeyboardShortcut.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    char v2 = *(unsigned char *)(a2 + 24);
    char v3 = *(unsigned char *)(a1 + 24);
    long long v8 = *(_OWORD *)(a1 + 8);
    char v9 = v3;
    long long v6 = *(_OWORD *)(a2 + 8);
    char v7 = v2;
    char v4 = _s21UIIntelligenceSupport19IntelligenceCommandV16KeyboardShortcutV13KeyEquivalentO2eeoiySbAG_AGtFZ_0((uint64_t)&v8, (uint64_t)&v6);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

uint64_t sub_260515334()
{
  if (*v0) {
    return 0x766975714579656BLL;
  }
  else {
    return 0x7265696669646F6DLL;
  }
}

uint64_t sub_260515384@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26051BEAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2605153AC(uint64_t a1)
{
  unint64_t v2 = sub_260519008();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605153E8(uint64_t a1)
{
  unint64_t v2 = sub_260519008();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceCommand.KeyboardShortcut.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v13 = v8;
  int v17 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519008();
  sub_260533120();
  uint64_t v14 = v9;
  char v18 = 0;
  sub_26051905C();
  sub_260532F40();
  if (!v2)
  {
    uint64_t v14 = v13;
    uint64_t v15 = v12;
    char v16 = v17;
    char v18 = 1;
    sub_2605190B0();
    sub_260532F40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t IntelligenceCommand.KeyboardShortcut.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceCommand.KeyboardShortcut.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519008();
  sub_260533100();
  if (!v2)
  {
    char v15 = 0;
    sub_260519104();
    sub_260532E70();
    uint64_t v9 = v13;
    char v15 = 1;
    sub_260519158();
    sub_260532E70();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v10 = v14;
    long long v11 = v13;
    *(void *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v11;
    *(unsigned char *)(a2 + 24) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_260515824()
{
  return sub_2605330E0();
}

uint64_t sub_260515898()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  sub_2605330A0();
  if (!v1)
  {
    sub_2605330A0();
    return sub_2605330A0();
  }
  if (v1 != 1) {
    return sub_2605330A0();
  }
  sub_2605330A0();

  return sub_260532810();
}

uint64_t sub_2605159FC()
{
  return sub_2605330E0();
}

uint64_t sub_260515A6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceCommand.KeyboardShortcut.init(from:)(a1, a2);
}

uint64_t sub_260515A84(void *a1)
{
  return IntelligenceCommand.KeyboardShortcut.encode(to:)(a1);
}

uint64_t sub_260515A9C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    char v2 = *(unsigned char *)(a2 + 24);
    char v3 = *(unsigned char *)(a1 + 24);
    long long v8 = *(_OWORD *)(a1 + 8);
    char v9 = v3;
    long long v6 = *(_OWORD *)(a2 + 8);
    char v7 = v2;
    char v4 = _s21UIIntelligenceSupport19IntelligenceCommandV16KeyboardShortcutV13KeyEquivalentO2eeoiySbAG_AGtFZ_0((uint64_t)&v8, (uint64_t)&v6);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

uint64_t IntelligenceCommand.keyboardShortcut.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v1 + 64);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 72);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_2605191AC(v2, v3, v4, v5);
}

__n128 IntelligenceCommand.keyboardShortcut.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  sub_2605191CC(*(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(unsigned char *)(v1 + 72));
  __n128 result = v5;
  *(__n128 *)(v1 + 48) = v5;
  *(void *)(v1 + 64) = v2;
  *(unsigned char *)(v1 + 72) = v3;
  return result;
}

uint64_t (*IntelligenceCommand.keyboardShortcut.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceCommand.isPerformable.getter()
{
  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t IntelligenceCommand.isPerformable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 73) = result;
  return result;
}

uint64_t (*IntelligenceCommand.isPerformable.modify())()
{
  return nullsub_1;
}

void IntelligenceCommand.identifier.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 80);
}

uint64_t sub_260515BD4()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26A873B08);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = 0;
  qword_26A8736F8 = result;
  return result;
}

UIIntelligenceSupport::IntelligenceCommand::Identifier_optional __swiftcall IntelligenceCommand.Identifier.init(_:)(Swift::String a1)
{
  uint64_t object = (uint64_t)a1._object;
  uint64_t v3 = v1;
  uint64_t v4 = HIBYTE(a1._object) & 0xF;
  a1._uint64_t object = (void *)(a1._countAndFlagsBits & 0xFFFFFFFFFFFFLL);
  if ((object & 0x2000000000000000) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = a1._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    if ((object & 0x1000000000000000) != 0)
    {
      uint64_t v6 = sub_2604BA2C4(a1._countAndFlagsBits, object, 10);
      char v8 = v23;
LABEL_44:
      a1._countAndFlagsBits = swift_bridgeObjectRelease();
      char v18 = v8 & 1;
      if (v8) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v6;
      }
      goto LABEL_47;
    }
    if ((object & 0x2000000000000000) == 0)
    {
      if ((a1._countAndFlagsBits & 0x1000000000000000) != 0) {
        a1._countAndFlagsBits = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      }
      else {
        a1._countAndFlagsBits = sub_260532D20();
      }
      uint64_t v6 = (uint64_t)sub_2604BA18C((unsigned __int8 *)a1._countAndFlagsBits, (uint64_t)a1._object, 10);
      char v8 = v7 & 1;
      goto LABEL_44;
    }
    v24[0] = a1._countAndFlagsBits;
    v24[1] = object & 0xFFFFFFFFFFFFFFLL;
    if (LOBYTE(a1._countAndFlagsBits) == 43)
    {
      if (!v4) {
        goto LABEL_58;
      }
      if (v4 == 1 || (BYTE1(a1._countAndFlagsBits) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v6 = (BYTE1(a1._countAndFlagsBits) - 48);
      if (v4 != 2)
      {
        if ((BYTE2(a1._countAndFlagsBits) - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v6 = 10 * (BYTE1(a1._countAndFlagsBits) - 48)
           + (BYTE2(a1._countAndFlagsBits) - 48);
        uint64_t v9 = v4 - 3;
        if (v9)
        {
          char v10 = (unsigned __int8 *)v24 + 3;
          while (1)
          {
            unsigned int v11 = *v10 - 48;
            if (v11 > 9) {
              goto LABEL_31;
            }
            uint64_t v12 = 10 * v6;
            if ((unsigned __int128)(v6 * (__int128)10) >> 64 != (10 * v6) >> 63) {
              goto LABEL_31;
            }
            uint64_t v6 = v12 + v11;
            if (__OFADD__(v12, v11)) {
              goto LABEL_31;
            }
            char v8 = 0;
            ++v10;
            if (!--v9) {
              goto LABEL_44;
            }
          }
        }
      }
    }
    else
    {
      if (LOBYTE(a1._countAndFlagsBits) == 45)
      {
        if (v4)
        {
          if (v4 != 1 && (BYTE1(a1._countAndFlagsBits) - 48) <= 9u)
          {
            if (v4 == 2)
            {
              char v8 = 0;
              uint64_t v6 = -(uint64_t)(BYTE1(a1._countAndFlagsBits) - 48);
              goto LABEL_44;
            }
            if ((BYTE2(a1._countAndFlagsBits) - 48) <= 9u)
            {
              uint64_t v6 = -10 * (BYTE1(a1._countAndFlagsBits) - 48)
                 - (BYTE2(a1._countAndFlagsBits) - 48);
              uint64_t v17 = v4 - 3;
              if (!v17) {
                goto LABEL_43;
              }
              uint64_t v20 = (unsigned __int8 *)v24 + 3;
              while (1)
              {
                unsigned int v21 = *v20 - 48;
                if (v21 > 9) {
                  break;
                }
                uint64_t v22 = 10 * v6;
                if ((unsigned __int128)(v6 * (__int128)10) >> 64 != (10 * v6) >> 63) {
                  break;
                }
                uint64_t v6 = v22 - v21;
                if (__OFSUB__(v22, v21)) {
                  break;
                }
                char v8 = 0;
                ++v20;
                if (!--v17) {
                  goto LABEL_44;
                }
              }
            }
          }
LABEL_31:
          uint64_t v6 = 0;
          char v8 = 1;
          goto LABEL_44;
        }
        __break(1u);
LABEL_58:
        __break(1u);
        return *(UIIntelligenceSupport::IntelligenceCommand::Identifier_optional *)&a1._countAndFlagsBits;
      }
      if (!v4 || (LOBYTE(a1._countAndFlagsBits) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v6 = (LOBYTE(a1._countAndFlagsBits) - 48);
      if (v4 != 1)
      {
        if ((BYTE1(a1._countAndFlagsBits) - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v6 = 10 * (LOBYTE(a1._countAndFlagsBits) - 48)
           + (BYTE1(a1._countAndFlagsBits) - 48);
        uint64_t v13 = v4 - 2;
        if (v13)
        {
          char v14 = (unsigned __int8 *)v24 + 2;
          while (1)
          {
            unsigned int v15 = *v14 - 48;
            if (v15 > 9) {
              goto LABEL_31;
            }
            uint64_t v16 = 10 * v6;
            if ((unsigned __int128)(v6 * (__int128)10) >> 64 != (10 * v6) >> 63) {
              goto LABEL_31;
            }
            uint64_t v6 = v16 + v15;
            if (__OFADD__(v16, v15)) {
              goto LABEL_31;
            }
            char v8 = 0;
            ++v14;
            if (!--v13) {
              goto LABEL_44;
            }
          }
        }
      }
    }
LABEL_43:
    char v8 = 0;
    goto LABEL_44;
  }
  a1._countAndFlagsBits = swift_bridgeObjectRelease();
  uint64_t v19 = 0;
  char v18 = 1;
LABEL_47:
  *(void *)uint64_t v3 = v19;
  *(unsigned char *)(v3 + 8) = v18 & 1;
  return *(UIIntelligenceSupport::IntelligenceCommand::Identifier_optional *)&a1._countAndFlagsBits;
}

uint64_t IntelligenceCommand.Identifier.description.getter()
{
  return sub_260532B90();
}

uint64_t IntelligenceCommand.Identifier.hash(into:)()
{
  return sub_2605330A0();
}

BOOL static IntelligenceCommand.Identifier.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260515F70()
{
  return 25705;
}

uint64_t sub_260515F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_260532FA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_260515FFC(uint64_t a1)
{
  unint64_t v2 = sub_260519240();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260516038(uint64_t a1)
{
  unint64_t v2 = sub_260519240();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceCommand.Identifier.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738F0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519240();
  sub_260533120();
  sub_260532F30();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t IntelligenceCommand.Identifier.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t IntelligenceCommand.Identifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873900);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519240();
  sub_260533100();
  if (!v2)
  {
    uint64_t v9 = sub_260532E60();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_260516340@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceCommand.Identifier.init(from:)(a1, a2);
}

uint64_t sub_260516358(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8738F0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519240();
  sub_260533120();
  sub_260532F30();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_260516490()
{
  return sub_260532B90();
}

double IntelligenceCommand.init(title:standaloneTitle:menuHierarchyComponents:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = qword_26A872160;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)(qword_26A8736F8 + 16);
  char v14 = (os_unfair_lock_s *)(qword_26A8736F8 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26A8736F8 + 24));
  sub_2604E02EC(v13, &v17);
  os_unfair_lock_unlock(v14);
  uint64_t v15 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2605191AC(0, 0, 0, 255);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  sub_2605191CC(0, 0, 0, 255);
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  double result = 0.0;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_WORD *)(a6 + 72) = 511;
  *(void *)(a6 + 80) = v15;
  return result;
}

uint64_t IntelligenceCommand.init(title:standaloneTitle:menuHierarchyComponents:menuGroup:keyboardShortcut:isPerformable:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v14 = *(void *)a7;
  uint64_t v13 = *(void *)(a7 + 8);
  uint64_t v15 = *(void *)(a7 + 16);
  char v16 = *(unsigned char *)(a7 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = a5;
  swift_bridgeObjectRetain();
  sub_2605191AC(v14, v13, v15, v16);
  if (qword_26A872160 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)(qword_26A8736F8 + 16);
  char v18 = (os_unfair_lock_s *)(qword_26A8736F8 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26A8736F8 + 24));
  sub_2604E02EC(v17, &v26);
  os_unfair_lock_unlock(v18);
  uint64_t v19 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2605191AC(v14, v13, v15, v16);
  sub_2605191CC(v14, v13, v15, v16);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  uint64_t result = sub_2605191CC(v14, v13, v15, v16);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = v23;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = v14;
  *(void *)(a9 + 56) = v13;
  *(void *)(a9 + 64) = v15;
  *(unsigned char *)(a9 + 72) = v16;
  *(unsigned char *)(a9 + 73) = a8 & 1;
  *(void *)(a9 + 80) = v19;
  return result;
}

double IntelligenceCommand.init(title:standaloneTitle:menuHierarchyComponents:isPerformable:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v14 = qword_26A872160;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)(qword_26A8736F8 + 16);
  char v16 = (os_unfair_lock_s *)(qword_26A8736F8 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26A8736F8 + 24));
  sub_2604E02EC(v15, &v19);
  os_unfair_lock_unlock(v16);
  uint64_t v17 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2605191AC(0, 0, 0, 255);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  sub_2605191CC(0, 0, 0, 255);
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  double result = 0.0;
  *(_OWORD *)(a7 + 40) = 0u;
  *(_OWORD *)(a7 + 56) = 0u;
  *(unsigned char *)(a7 + 72) = -1;
  *(unsigned char *)(a7 + 73) = a6 & 1;
  *(void *)(a7 + 80) = v17;
  return result;
}

uint64_t IntelligenceCommand.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  int v2 = *(unsigned __int8 *)(v0 + 72);
  swift_bridgeObjectRetain();
  sub_260532810();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_260532810();
  swift_bridgeObjectRelease();
  sub_2605330A0();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_260532810();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  sub_2605330A0();
  sub_2605330B0();
  if (v2 != 255)
  {
    sub_2605330A0();
    IntelligenceCommand.KeyboardShortcut.KeyEquivalent.hash(into:)();
  }
  sub_2605330B0();
  return sub_2605330A0();
}

uint64_t IntelligenceCommand.hashValue.getter()
{
  return sub_2605330E0();
}

unint64_t sub_260516B54(char a1)
{
  unint64_t result = 0x656C746974;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F6C61646E617473;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x756F7247756E656DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x726F667265507369;
      break;
    case 6:
      unint64_t result = 0x696669746E656469;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260516C64()
{
  return sub_2605330E0();
}

uint64_t sub_260516CE8()
{
  return sub_2605330E0();
}

unint64_t sub_260516D68()
{
  return sub_260516B54(*v0);
}

uint64_t sub_260516D70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26051BFDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_260516D98(uint64_t a1)
{
  unint64_t v2 = sub_260519540();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260516DD4(uint64_t a1)
{
  unint64_t v2 = sub_260519540();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntelligenceCommand.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873908);
  uint64_t v29 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = *v1;
  unint64_t v6 = v1[1];
  uint64_t v7 = v1[2];
  unint64_t v8 = v1[3];
  uint64_t v9 = v1[5];
  uint64_t v27 = v1[4];
  uint64_t v28 = v9;
  uint64_t v10 = v1[6];
  uint64_t v25 = v1[7];
  uint64_t v26 = v10;
  uint64_t v24 = v1[8];
  int v35 = *((unsigned __int8 *)v1 + 72);
  int v23 = *((unsigned __int8 *)v1 + 73);
  uint64_t v22 = v1[10];
  uint64_t v11 = a1[3];
  uint64_t v12 = a1;
  uint64_t v13 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v12, v11);
  sub_260519540();
  sub_260533120();
  uint64_t v14 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v14 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v14)
  {
    LOBYTE(v31) = 0;
    uint64_t v15 = v30;
    sub_260532F00();
    uint64_t v16 = v15;
    uint64_t v17 = v3;
    if (v15) {
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v17);
    }
  }
  else
  {
    uint64_t v17 = v3;
    uint64_t v16 = v30;
  }
  uint64_t v18 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v18 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v18 || (LOBYTE(v31) = 1, sub_260532F00(), !v16))
  {
    uint64_t v19 = v28;
    if (!*(void *)(v27 + 16)
      || (uint64_t v31 = v27,
          char v36 = 2,
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38),
          sub_2604839E8(&qword_26A872600),
          sub_260532F40(),
          !v16))
    {
      if (!v19 || (LOBYTE(v31) = 3, sub_260532F30(), !v16))
      {
        uint64_t v31 = v26;
        uint64_t v32 = v25;
        uint64_t v33 = v24;
        char v34 = v35;
        char v36 = 4;
        sub_260519594();
        sub_260532EF0();
        if (!v16)
        {
          if ((v23 & 1) == 0)
          {
            LOBYTE(v31) = 5;
            sub_260532F10();
          }
          uint64_t v31 = v22;
          char v36 = 6;
          sub_2605195E8();
          sub_260532F40();
        }
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v17);
}

uint64_t IntelligenceCommand.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873928);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260519540();
  sub_260533100();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    char v13 = -1;
    uint64_t v14 = 0;
  }
  else
  {
    LOBYTE(v43) = 0;
    uint64_t v9 = sub_260532DF0();
    if (v10) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = 0;
    }
    if (v10) {
      unint64_t v17 = v10;
    }
    else {
      unint64_t v17 = 0xE000000000000000;
    }
    LOBYTE(v43) = 1;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_260532DF0();
    unint64_t v42 = v17;
    uint64_t v41 = v16;
    if (v19) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = 0;
    }
    if (v19) {
      unint64_t v21 = v19;
    }
    else {
      unint64_t v21 = 0xE000000000000000;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
    char v48 = 2;
    sub_2604839E8(&qword_26A872610);
    swift_bridgeObjectRetain();
    sub_260532E70();
    unint64_t v40 = v21;
    uint64_t v22 = v43;
    LOBYTE(v43) = 3;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_260532E20();
    uint64_t v39 = v22;
    if (v24) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v23;
    }
    char v48 = 4;
    sub_26051963C();
    sub_260532E30();
    uint64_t v35 = v25;
    uint64_t v36 = v20;
    uint64_t v37 = a2;
    uint64_t v26 = v43;
    uint64_t v11 = v44;
    uint64_t v12 = v45;
    char v13 = v46;
    LOBYTE(v43) = 5;
    uint64_t v38 = v26;
    sub_2605191AC(v26, v44, v45, v46);
    int v47 = sub_260532E00();
    char v48 = 6;
    sub_260519690();
    sub_260532E70();
    int v47 = (v47 == 2) | v47 & 1;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    unint64_t v27 = v42;
    uint64_t v34 = v43;
    swift_bridgeObjectRetain();
    unint64_t v28 = v40;
    swift_bridgeObjectRetain();
    uint64_t v29 = v39;
    swift_bridgeObjectRetain();
    uint64_t v30 = v38;
    sub_2605191AC(v38, v11, v12, v13);
    sub_2605191CC(v30, v11, v12, v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v31 = v37;
    *uint64_t v37 = v41;
    v31[1] = v27;
    v31[2] = v36;
    v31[3] = v28;
    uint64_t v32 = v35;
    v31[4] = v29;
    v31[5] = v32;
    v31[6] = v30;
    v31[7] = v11;
    v31[8] = v12;
    *((unsigned char *)v31 + 72) = v13;
    *((unsigned char *)v31 + 73) = v47;
    v31[10] = v34;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = v30;
  }
  return sub_2605191CC(v14, v11, v12, v13);
}

uint64_t sub_260517728@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceCommand.init(from:)(a1, a2);
}

uint64_t sub_260517740(void *a1)
{
  return IntelligenceCommand.encode(to:)(a1);
}

unint64_t IntelligenceCommand.description.getter()
{
  unint64_t v1 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 73);
  uint64_t v5 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v5 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    strcpy((char *)v27, "title: ");
    v27[1] = 0xE700000000000000;
    swift_bridgeObjectRetain();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v6 = v27[0];
    uint64_t v7 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v9 = v7[2];
    unint64_t v8 = v7[3];
    if (v9 >= v8 >> 1) {
      uint64_t v7 = sub_260457640((void *)(v8 > 1), v9 + 1, 1, v7);
    }
    v7[2] = v9 + 1;
    unint64_t v10 = &v7[2 * v9];
    v10[4] = v6;
    v10[5] = 0xE700000000000000;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v11 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v11 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    sub_260532CB0();
    swift_bridgeObjectRelease();
    v27[0] = 0xD000000000000011;
    v27[1] = 0x8000000260543250;
    swift_bridgeObjectRetain();
    sub_260532840();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_260457640(0, v7[2] + 1, 1, v7);
    }
    unint64_t v13 = v7[2];
    unint64_t v12 = v7[3];
    if (v13 >= v12 >> 1) {
      uint64_t v7 = sub_260457640((void *)(v12 > 1), v13 + 1, 1, v7);
    }
    v7[2] = v13 + 1;
    uint64_t v14 = &v7[2 * v13];
    v14[4] = 0xD000000000000011;
    v14[5] = 0x8000000260543250;
  }
  sub_260532CB0();
  swift_bridgeObjectRelease();
  v27[0] = 0xD000000000000019;
  v27[1] = 0x8000000260543270;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = sub_260457640(0, v7[2] + 1, 1, v7);
  }
  unint64_t v16 = v7[2];
  unint64_t v15 = v7[3];
  unint64_t v17 = v16 + 1;
  if (v16 >= v15 >> 1) {
    uint64_t v7 = sub_260457640((void *)(v15 > 1), v16 + 1, 1, v7);
  }
  v7[2] = v17;
  uint64_t v18 = &v7[2 * v16];
  v18[4] = 0xD000000000000019;
  v18[5] = 0x8000000260543270;
  if ((v4 & 1) == 0)
  {
    unint64_t v19 = v7[3];
    if (v17 >= v19 >> 1) {
      uint64_t v7 = sub_260457640((void *)(v19 > 1), v16 + 2, 1, v7);
    }
    v7[2] = v16 + 2;
    uint64_t v20 = &v7[2 * v17];
    v20[4] = 0x6672657020746F6ELL;
    v20[5] = 0xEF656C62616D726FLL;
  }
  strcpy((char *)v27, "identifier: ");
  BYTE5(v27[1]) = 0;
  HIWORD(v27[1]) = -5120;
  sub_2605191EC();
  sub_260532B90();
  sub_260532840();
  swift_bridgeObjectRelease();
  uint64_t v21 = v27[0];
  uint64_t v22 = v27[1];
  unint64_t v24 = v7[2];
  unint64_t v23 = v7[3];
  if (v24 >= v23 >> 1) {
    uint64_t v7 = sub_260457640((void *)(v23 > 1), v24 + 1, 1, v7);
  }
  v7[2] = v24 + 1;
  uint64_t v25 = &v7[2 * v24];
  unsigned char v25[4] = v21;
  v25[5] = v22;
  sub_260532CB0();
  swift_bridgeObjectRelease();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return 0xD000000000000014;
}

unint64_t IntelligenceCommand.KeyboardShortcut.description.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 24);
  if (*(void *)v0)
  {
    sub_260532CB0();
    swift_bridgeObjectRelease();
    strcpy((char *)v15, "modifierKeys: ");
    HIBYTE(v15[1]) = -18;
    uint64_t v17 = v1;
    IntelligenceCommand.KeyboardShortcut.ModifierKeys.description.getter();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v5 = v15[0];
    uint64_t v6 = v15[1];
    uint64_t v7 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v9 = v7[2];
    unint64_t v8 = v7[3];
    if (v9 >= v8 >> 1) {
      uint64_t v7 = sub_260457640((void *)(v8 > 1), v9 + 1, 1, v7);
    }
    v7[2] = v9 + 1;
    unint64_t v10 = &v7[2 * v9];
    v10[4] = v5;
    v10[5] = v6;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  }
  sub_260532CB0();
  swift_bridgeObjectRelease();
  uint64_t v17 = 0x766975714579656BLL;
  unint64_t v18 = 0xEF203A746E656C61;
  v15[0] = v2;
  v15[1] = v3;
  char v16 = v4;
  IntelligenceCommand.KeyboardShortcut.KeyEquivalent.description.getter();
  sub_260532840();
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = sub_260457640(0, v7[2] + 1, 1, v7);
  }
  unint64_t v12 = v7[2];
  unint64_t v11 = v7[3];
  if (v12 >= v11 >> 1) {
    uint64_t v7 = sub_260457640((void *)(v11 > 1), v12 + 1, 1, v7);
  }
  v7[2] = v12 + 1;
  unint64_t v13 = &v7[2 * v12];
  v13[4] = 0x766975714579656BLL;
  v13[5] = 0xEF203A746E656C61;
  sub_260532CB0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return 0xD000000000000011;
}

uint64_t IntelligenceCommand.KeyboardShortcut.ModifierKeys.description.getter()
{
  uint64_t v1 = *v0;
  if ((*v0 & 0x20) == 0)
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    if ((v1 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_260457640((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  uint64_t v5 = &v2[2 * v4];
  v5[4] = 0x6461506D754ELL;
  v5[5] = 0xE600000000000000;
  if ((v1 & 0x40) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_260457640((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    unint64_t v8 = &v2[2 * v7];
    v8[4] = 0x6B636F4C73706143;
    v8[5] = 0xE800000000000000;
  }
LABEL_12:
  if ((v1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
    }
    unint64_t v10 = v2[2];
    unint64_t v9 = v2[3];
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_260457640((void *)(v9 > 1), v10 + 1, 1, v2);
    }
    v2[2] = v10 + 1;
    unint64_t v11 = &v2[2 * v10];
    v11[4] = 1819440195;
    v11[5] = 0xE400000000000000;
    if ((v1 & 2) == 0)
    {
LABEL_14:
      if ((v1 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_28;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
  }
  unint64_t v13 = v2[2];
  unint64_t v12 = v2[3];
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_260457640((void *)(v12 > 1), v13 + 1, 1, v2);
  }
  v2[2] = v13 + 1;
  uint64_t v14 = &v2[2 * v13];
  v14[4] = 7630927;
  v14[5] = 0xE300000000000000;
  if ((v1 & 8) == 0)
  {
LABEL_15:
    if ((v1 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_28:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
  }
  unint64_t v16 = v2[2];
  unint64_t v15 = v2[3];
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_260457640((void *)(v15 > 1), v16 + 1, 1, v2);
  }
  v2[2] = v16 + 1;
  uint64_t v17 = &v2[2 * v16];
  v17[4] = 0x7466696853;
  v17[5] = 0xE500000000000000;
  if ((v1 & 1) == 0)
  {
LABEL_16:
    if ((v1 & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_38;
  }
LABEL_33:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
  }
  unint64_t v19 = v2[2];
  unint64_t v18 = v2[3];
  if (v19 >= v18 >> 1) {
    uint64_t v2 = sub_260457640((void *)(v18 > 1), v19 + 1, 1, v2);
  }
  v2[2] = v19 + 1;
  uint64_t v20 = &v2[2 * v19];
  v20[4] = 6581571;
  v20[5] = 0xE300000000000000;
  if ((v1 & 0x10) != 0)
  {
LABEL_38:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260457640(0, v2[2] + 1, 1, v2);
    }
    unint64_t v22 = v2[2];
    unint64_t v21 = v2[3];
    if (v22 >= v21 >> 1) {
      uint64_t v2 = sub_260457640((void *)(v21 > 1), v22 + 1, 1, v2);
    }
    v2[2] = v22 + 1;
    unint64_t v23 = &v2[2 * v22];
    v23[4] = 0x65626F6C47;
    v23[5] = 0xE500000000000000;
  }
LABEL_43:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  uint64_t v24 = sub_260532680();
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t IntelligenceCommand.KeyboardShortcut.KeyEquivalent.description.getter()
{
  uint64_t v1 = *v0;
  if (*((unsigned char *)v0 + 16))
  {
    if (*((unsigned char *)v0 + 16) == 1)
    {
      swift_bridgeObjectRetain();
      return v1;
    }
    else
    {
      uint64_t result = 28757;
      switch(v1)
      {
        case 1:
          uint64_t result = 1853321028;
          break;
        case 2:
          uint64_t result = 1952867660;
          break;
        case 3:
          uint64_t result = 0x7468676952;
          break;
        case 4:
          uint64_t result = 0x6574656C6544;
          break;
        case 5:
          uint64_t result = 0x4464726177726F46;
          break;
        case 6:
          uint64_t result = 0x7261656C43;
          break;
        case 7:
          uint64_t result = 1701670728;
          break;
        case 8:
          uint64_t result = 6581829;
          break;
        case 9:
          uint64_t result = 0x705565676150;
          break;
        case 10:
          uint64_t result = 0x6E776F4465676150;
          break;
        case 11:
          uint64_t result = 6447444;
          break;
        case 12:
          uint64_t result = 0x6563617053;
          break;
        case 13:
          uint64_t result = 0x6E7275746552;
          break;
        case 14:
          uint64_t result = 0x657061637345;
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    sub_260532F80();
    sub_260532840();
    swift_bridgeObjectRelease();
    return 70;
  }
  return result;
}

uint64_t IntelligenceCommand.KeyboardShortcut.shortDescription.getter()
{
  if (*v0)
  {
    uint64_t v1 = IntelligenceCommand.KeyboardShortcut.ModifierKeys.description.getter();
    uint64_t v3 = v2;
    unint64_t v4 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v6 = v4[2];
    unint64_t v5 = v4[3];
    if (v6 >= v5 >> 1) {
      unint64_t v4 = sub_260457640((void *)(v5 > 1), v6 + 1, 1, v4);
    }
    v4[2] = v6 + 1;
    unint64_t v7 = &v4[2 * v6];
    v7[4] = v1;
    v7[5] = v3;
  }
  else
  {
    unint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v8 = IntelligenceCommand.KeyboardShortcut.KeyEquivalent.description.getter();
  uint64_t v10 = v9;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v4 = sub_260457640(0, v4[2] + 1, 1, v4);
  }
  unint64_t v12 = v4[2];
  unint64_t v11 = v4[3];
  if (v12 >= v11 >> 1) {
    unint64_t v4 = sub_260457640((void *)(v11 > 1), v12 + 1, 1, v4);
  }
  v4[2] = v12 + 1;
  unint64_t v13 = &v4[2 * v12];
  v13[4] = v8;
  v13[5] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  uint64_t v14 = sub_260532680();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t _s21UIIntelligenceSupport19IntelligenceCommandV16KeyboardShortcutV13KeyEquivalentO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      sub_260518FF0(*(void *)a1, v2, 0);
      sub_260518FF0(v5, v6, 0);
      int v7 = v3 == v5;
      return v7 & 1;
    }
    goto LABEL_19;
  }
  if (v4 == 1)
  {
    if (v7 == 1)
    {
      if (v3 == v5 && v2 == v6) {
        LOBYTE(v7) = 1;
      }
      else {
        LOBYTE(v7) = sub_260532FA0();
      }
      sub_260518FD8(v5, v6, 1);
      sub_260518FD8(v3, v2, 1);
      sub_260518FF0(v3, v2, 1);
      sub_260518FF0(v5, v6, 1);
      return v7 & 1;
    }
    swift_bridgeObjectRetain();
LABEL_19:
    sub_260518FD8(v5, v6, v7);
    sub_260518FF0(v3, v2, v4);
    sub_260518FF0(v5, v6, v7);
    LOBYTE(v7) = 0;
    return v7 & 1;
  }
  switch(v3)
  {
    case 1:
      if (v7 != 2 || v5 != 1 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      LOBYTE(v7) = 1;
      sub_260518FF0(1, 0, 2);
      return v7 & 1;
    case 2:
      if (v7 != 2 || v5 != 2 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 2;
      goto LABEL_148;
    case 3:
      if (v7 != 2 || v5 != 3 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 3;
      goto LABEL_148;
    case 4:
      if (v7 != 2 || v5 != 4 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 4;
      goto LABEL_148;
    case 5:
      if (v7 != 2 || v5 != 5 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 5;
      goto LABEL_148;
    case 6:
      if (v7 != 2 || v5 != 6 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 6;
      goto LABEL_148;
    case 7:
      if (v7 != 2 || v5 != 7 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 7;
      goto LABEL_148;
    case 8:
      if (v7 != 2 || v5 != 8 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 8;
      goto LABEL_148;
    case 9:
      if (v7 != 2 || v5 != 9 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 9;
      goto LABEL_148;
    case 10:
      if (v7 != 2 || v5 != 10 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 10;
      goto LABEL_148;
    case 11:
      if (v7 != 2 || v5 != 11 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 11;
      goto LABEL_148;
    case 12:
      if (v7 != 2 || v5 != 12 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 12;
      goto LABEL_148;
    case 13:
      if (v7 != 2 || v5 != 13 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 13;
      goto LABEL_148;
    case 14:
      if (v7 != 2 || v5 != 14 || v6 != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 14;
      goto LABEL_148;
    default:
      if (v7 != 2 || (v6 | v5) != 0) {
        goto LABEL_19;
      }
      sub_260518FF0(*(void *)a1, v2, 2);
      uint64_t v10 = 0;
LABEL_148:
      sub_260518FF0(v10, 0, 2);
      LOBYTE(v7) = 1;
      break;
  }
  return v7 & 1;
}

unint64_t sub_2605189F0()
{
  unint64_t result = qword_26A873790;
  if (!qword_26A873790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873790);
  }
  return result;
}

unint64_t sub_260518A44()
{
  unint64_t result = qword_26A873798;
  if (!qword_26A873798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873798);
  }
  return result;
}

unint64_t sub_260518A98()
{
  unint64_t result = qword_26A8737A0;
  if (!qword_26A8737A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737A0);
  }
  return result;
}

unint64_t sub_260518AEC()
{
  unint64_t result = qword_26A8737A8;
  if (!qword_26A8737A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737A8);
  }
  return result;
}

unint64_t sub_260518B40()
{
  unint64_t result = qword_26A8737B0;
  if (!qword_26A8737B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737B0);
  }
  return result;
}

unint64_t sub_260518B94()
{
  unint64_t result = qword_26A8737B8;
  if (!qword_26A8737B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737B8);
  }
  return result;
}

unint64_t sub_260518BE8()
{
  unint64_t result = qword_26A8737C0;
  if (!qword_26A8737C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737C0);
  }
  return result;
}

unint64_t sub_260518C3C()
{
  unint64_t result = qword_26A8737C8;
  if (!qword_26A8737C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737C8);
  }
  return result;
}

unint64_t sub_260518C90()
{
  unint64_t result = qword_26A8737D0;
  if (!qword_26A8737D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737D0);
  }
  return result;
}

unint64_t sub_260518CE4()
{
  unint64_t result = qword_26A8737D8;
  if (!qword_26A8737D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737D8);
  }
  return result;
}

unint64_t sub_260518D38()
{
  unint64_t result = qword_26A8737E0;
  if (!qword_26A8737E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737E0);
  }
  return result;
}

unint64_t sub_260518D8C()
{
  unint64_t result = qword_26A8737E8;
  if (!qword_26A8737E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737E8);
  }
  return result;
}

unint64_t sub_260518DE0()
{
  unint64_t result = qword_26A8737F0;
  if (!qword_26A8737F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737F0);
  }
  return result;
}

unint64_t sub_260518E34()
{
  unint64_t result = qword_26A8737F8;
  if (!qword_26A8737F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8737F8);
  }
  return result;
}

unint64_t sub_260518E88()
{
  unint64_t result = qword_26A873800;
  if (!qword_26A873800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873800);
  }
  return result;
}

unint64_t sub_260518EDC()
{
  unint64_t result = qword_26A873808;
  if (!qword_26A873808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873808);
  }
  return result;
}

unint64_t sub_260518F30()
{
  unint64_t result = qword_26A873810;
  if (!qword_26A873810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873810);
  }
  return result;
}

unint64_t sub_260518F84()
{
  unint64_t result = qword_26A873818;
  if (!qword_26A873818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873818);
  }
  return result;
}

uint64_t sub_260518FD8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_260518FF0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_260519008()
{
  unint64_t result = qword_26A8738B8;
  if (!qword_26A8738B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738B8);
  }
  return result;
}

unint64_t sub_26051905C()
{
  unint64_t result = qword_26A8738C0;
  if (!qword_26A8738C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738C0);
  }
  return result;
}

unint64_t sub_2605190B0()
{
  unint64_t result = qword_26A8738C8;
  if (!qword_26A8738C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738C8);
  }
  return result;
}

unint64_t sub_260519104()
{
  unint64_t result = qword_26A8738D8;
  if (!qword_26A8738D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738D8);
  }
  return result;
}

unint64_t sub_260519158()
{
  unint64_t result = qword_26A8738E0;
  if (!qword_26A8738E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738E0);
  }
  return result;
}

uint64_t sub_2605191AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 != -1) {
    return sub_260518FD8(a2, a3, a4);
  }
  return result;
}

uint64_t sub_2605191CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 != -1) {
    return sub_260518FF0(a2, a3, a4);
  }
  return result;
}

unint64_t sub_2605191EC()
{
  unint64_t result = qword_26A8738E8;
  if (!qword_26A8738E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738E8);
  }
  return result;
}

unint64_t sub_260519240()
{
  unint64_t result = qword_26A8738F8;
  if (!qword_26A8738F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8738F8);
  }
  return result;
}

BOOL _s21UIIntelligenceSupport19IntelligenceCommandV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 56);
  uint64_t v31 = *(void *)(a1 + 64);
  uint64_t v32 = *(void *)(a1 + 48);
  int v6 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *(void **)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v29 = *(void *)(a2 + 48);
  uint64_t v27 = *(void *)(a2 + 56);
  uint64_t v28 = *(void *)(a2 + 64);
  int v11 = *(unsigned __int8 *)(a2 + 72);
  int v25 = *(unsigned __int8 *)(a2 + 73);
  int v26 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v23 = *(void *)(a2 + 80);
  uint64_t v24 = *(void *)(a1 + 80);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v12 = sub_260532FA0(), BOOL result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v3 == v8 || (v14 = sub_260532FA0(), BOOL result = 0, (v14 & 1) != 0))
    {
      char v15 = sub_2604A08A8(v4, v10);
      BOOL result = 0;
      if ((v15 & 1) != 0 && v5 == v9)
      {
        char v16 = v6;
        char v17 = v11;
        if (v6 == 255)
        {
          BOOL v21 = v11 == 255;
          uint64_t v22 = v30;
          uint64_t v18 = v31;
          uint64_t v19 = v32;
          if (v21)
          {
            if (v26 == v25) {
              return v24 == v23;
            }
            return 0;
          }
        }
        else
        {
          uint64_t v18 = v31;
          uint64_t v19 = v32;
          if (v11 != 255)
          {
            if (v32 == v29)
            {
              v35[0] = v30;
              v35[1] = v31;
              char v36 = v16;
              v33[0] = v27;
              v33[1] = v28;
              char v34 = v11;
              sub_2605191AC(v32, v30, v31, v16);
              sub_260518FD8(v30, v31, v16);
              char v20 = _s21UIIntelligenceSupport19IntelligenceCommandV16KeyboardShortcutV13KeyEquivalentO2eeoiySbAG_AGtFZ_0((uint64_t)v35, (uint64_t)v33);
              sub_260518FF0(v30, v31, v16);
              sub_2605191CC(v32, v30, v31, v16);
              BOOL result = 0;
              if (v20 & 1) == 0 || ((v26 ^ v25)) {
                return result;
              }
              return v24 == v23;
            }
            sub_260518FD8(v30, v31, v16);
            sub_260518FF0(v30, v31, v16);
            return 0;
          }
          uint64_t v22 = v30;
          sub_260518FD8(v30, v31, v16);
          sub_260518FD8(v30, v31, v16);
          sub_260518FF0(v30, v31, v16);
        }
        sub_2605191AC(v29, v27, v28, v17);
        sub_2605191CC(v19, v22, v18, v16);
        sub_2605191CC(v29, v27, v28, v17);
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_260519540()
{
  unint64_t result = qword_26A873910;
  if (!qword_26A873910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873910);
  }
  return result;
}

unint64_t sub_260519594()
{
  unint64_t result = qword_26A873918;
  if (!qword_26A873918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873918);
  }
  return result;
}

unint64_t sub_2605195E8()
{
  unint64_t result = qword_26A873920;
  if (!qword_26A873920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873920);
  }
  return result;
}

unint64_t sub_26051963C()
{
  unint64_t result = qword_26A873930;
  if (!qword_26A873930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873930);
  }
  return result;
}

unint64_t sub_260519690()
{
  unint64_t result = qword_26A873938;
  if (!qword_26A873938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873938);
  }
  return result;
}

unint64_t sub_2605196E8()
{
  unint64_t result = qword_26A873940;
  if (!qword_26A873940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873940);
  }
  return result;
}

unint64_t sub_260519740()
{
  unint64_t result = qword_26A873948;
  if (!qword_26A873948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873948);
  }
  return result;
}

unint64_t sub_260519798()
{
  unint64_t result = qword_26A873950;
  if (!qword_26A873950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873950);
  }
  return result;
}

unint64_t sub_2605197F4()
{
  unint64_t result = qword_26A873958;
  if (!qword_26A873958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873958);
  }
  return result;
}

unint64_t sub_26051984C()
{
  unint64_t result = qword_26A873960;
  if (!qword_26A873960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873960);
  }
  return result;
}

unint64_t sub_2605198A4()
{
  unint64_t result = qword_26A873968;
  if (!qword_26A873968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873968);
  }
  return result;
}

unint64_t sub_2605198FC()
{
  unint64_t result = qword_26A873970;
  if (!qword_26A873970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873970);
  }
  return result;
}

unint64_t sub_260519954()
{
  unint64_t result = qword_26A873978;
  if (!qword_26A873978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873978);
  }
  return result;
}

unint64_t sub_2605199AC()
{
  unint64_t result = qword_26A873980;
  if (!qword_26A873980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873980);
  }
  return result;
}

uint64_t destroy for IntelligenceCommand(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    return sub_260518FF0(v4, v5, v3);
  }
  return result;
}

uint64_t initializeWithCopy for IntelligenceCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  int v7 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 == 255)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    uint64_t v9 = *(void *)(a2 + 64);
    sub_260518FD8(v8, v9, v7);
    *(void *)(a1 + 56) = v8;
    *(void *)(a1 + 64) = v9;
    *(unsigned char *)(a1 + 72) = v7;
  }
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t assignWithCopy for IntelligenceCommand(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = (long long *)(a1 + 48);
  uint64_t v5 = (long long *)(a2 + 48);
  int v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      long long v17 = *v5;
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *uint64_t v4 = v17;
    }
    else
    {
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      uint64_t v13 = *(void *)(a2 + 56);
      uint64_t v14 = *(void *)(a2 + 64);
      char v15 = *(unsigned char *)(a2 + 72);
      sub_260518FD8(v13, v14, v15);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v14;
      *(unsigned char *)(a1 + 72) = v15;
    }
  }
  else if (v6 == 255)
  {
    sub_260519C84(a1 + 48);
    long long v16 = *(_OWORD *)(a2 + 57);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 57) = v16;
  }
  else
  {
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    uint64_t v7 = *(void *)(a2 + 56);
    uint64_t v8 = *(void *)(a2 + 64);
    char v9 = *(unsigned char *)(a2 + 72);
    sub_260518FD8(v7, v8, v9);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    *(void *)(a1 + 56) = v7;
    *(void *)(a1 + 64) = v8;
    char v12 = *(unsigned char *)(a1 + 72);
    *(unsigned char *)(a1 + 72) = v9;
    sub_260518FF0(v10, v11, v12);
  }
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t sub_260519C84(uint64_t a1)
{
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

uint64_t assignWithTake for IntelligenceCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 72);
  if (v6 == 255) {
    goto LABEL_5;
  }
  int v7 = *(unsigned __int8 *)(a2 + 72);
  if (v7 == 255)
  {
    sub_260519C84(a1 + 48);
LABEL_5:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = v7;
  sub_260518FF0(v9, v10, v6);
LABEL_6:
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommand(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCommand(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand()
{
  return &type metadata for IntelligenceCommand;
}

uint64_t destroy for IntelligenceCommand.KeyboardShortcut(uint64_t a1)
{
  return sub_260518FF0(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for IntelligenceCommand.KeyboardShortcut(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_260518FD8(v3, v4, v5);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  return a1;
}

uint64_t assignWithCopy for IntelligenceCommand.KeyboardShortcut(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_260518FD8(v3, v4, v5);
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v5;
  sub_260518FF0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for IntelligenceCommand.KeyboardShortcut(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v7 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_260518FF0(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.ModifierKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.ModifierKeys;
}

uint64_t destroy for IntelligenceCommand.KeyboardShortcut.KeyEquivalent(uint64_t a1)
{
  return sub_260518FF0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s21UIIntelligenceSupport19IntelligenceCommandV16KeyboardShortcutV13KeyEquivalentOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_260518FD8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for IntelligenceCommand.KeyboardShortcut.KeyEquivalent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_260518FD8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_260518FF0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for IntelligenceCommand.KeyboardShortcut.KeyEquivalent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_260518FF0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut.KeyEquivalent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut.KeyEquivalent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_26051A1A8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_26051A1C0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.Identifier()
{
  return &type metadata for IntelligenceCommand.Identifier;
}

unsigned char *storeEnumTagSinglePayload for IntelligenceCommand.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x26051A2C4);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.CodingKeys()
{
  return &type metadata for IntelligenceCommand.CodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.Identifier.CodingKeys()
{
  return &type metadata for IntelligenceCommand.Identifier.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x26051A3DCLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.CodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.CodingKeys;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
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
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *__n128 result = a2 + 16;
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
        JUMPOUT(0x26051A570);
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
          *__n128 result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.UpArrowCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.UpArrowCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.DownArrowCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.DownArrowCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.LeftArrowCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.LeftArrowCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.RightArrowCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.RightArrowCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.DeleteCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.DeleteCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ForwardDeleteCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ForwardDeleteCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ClearCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ClearCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.HomeCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.HomeCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.EndCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.EndCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.PageUpCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.PageUpCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.PageDownCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.PageDownCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.TabCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.TabCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.SpaceCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.SpaceCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ReturnCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.ReturnCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.EscapeCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.EscapeCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.FunctionCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.FunctionCodingKeys;
}

unsigned char *_s21UIIntelligenceSupport19IntelligenceCommandV10IdentifierV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x26051A744);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CustomCodingKeys()
{
  return &type metadata for IntelligenceCommand.KeyboardShortcut.KeyEquivalent.CustomCodingKeys;
}

unint64_t sub_26051A780()
{
  unint64_t result = qword_26A873988;
  if (!qword_26A873988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873988);
  }
  return result;
}

unint64_t sub_26051A7D8()
{
  unint64_t result = qword_26A873990;
  if (!qword_26A873990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873990);
  }
  return result;
}

unint64_t sub_26051A830()
{
  unint64_t result = qword_26A873998;
  if (!qword_26A873998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873998);
  }
  return result;
}

unint64_t sub_26051A888()
{
  unint64_t result = qword_26A8739A0;
  if (!qword_26A8739A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739A0);
  }
  return result;
}

unint64_t sub_26051A8E0()
{
  unint64_t result = qword_26A8739A8;
  if (!qword_26A8739A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739A8);
  }
  return result;
}

unint64_t sub_26051A938()
{
  unint64_t result = qword_26A8739B0;
  if (!qword_26A8739B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739B0);
  }
  return result;
}

unint64_t sub_26051A990()
{
  unint64_t result = qword_26A8739B8;
  if (!qword_26A8739B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739B8);
  }
  return result;
}

unint64_t sub_26051A9E8()
{
  unint64_t result = qword_26A8739C0;
  if (!qword_26A8739C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739C0);
  }
  return result;
}

unint64_t sub_26051AA40()
{
  unint64_t result = qword_26A8739C8;
  if (!qword_26A8739C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739C8);
  }
  return result;
}

unint64_t sub_26051AA98()
{
  unint64_t result = qword_26A8739D0;
  if (!qword_26A8739D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739D0);
  }
  return result;
}

unint64_t sub_26051AAF0()
{
  unint64_t result = qword_26A8739D8;
  if (!qword_26A8739D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739D8);
  }
  return result;
}

unint64_t sub_26051AB48()
{
  unint64_t result = qword_26A8739E0;
  if (!qword_26A8739E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739E0);
  }
  return result;
}

unint64_t sub_26051ABA0()
{
  unint64_t result = qword_26A8739E8;
  if (!qword_26A8739E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739E8);
  }
  return result;
}

unint64_t sub_26051ABF8()
{
  unint64_t result = qword_26A8739F0;
  if (!qword_26A8739F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739F0);
  }
  return result;
}

unint64_t sub_26051AC50()
{
  unint64_t result = qword_26A8739F8;
  if (!qword_26A8739F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8739F8);
  }
  return result;
}

unint64_t sub_26051ACA8()
{
  unint64_t result = qword_26A873A00;
  if (!qword_26A873A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A00);
  }
  return result;
}

unint64_t sub_26051AD00()
{
  unint64_t result = qword_26A873A08;
  if (!qword_26A873A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A08);
  }
  return result;
}

unint64_t sub_26051AD58()
{
  unint64_t result = qword_26A873A10;
  if (!qword_26A873A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A10);
  }
  return result;
}

unint64_t sub_26051ADB0()
{
  unint64_t result = qword_26A873A18;
  if (!qword_26A873A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A18);
  }
  return result;
}

unint64_t sub_26051AE08()
{
  unint64_t result = qword_26A873A20;
  if (!qword_26A873A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A20);
  }
  return result;
}

unint64_t sub_26051AE60()
{
  unint64_t result = qword_26A873A28;
  if (!qword_26A873A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A28);
  }
  return result;
}

unint64_t sub_26051AEB8()
{
  unint64_t result = qword_26A873A30;
  if (!qword_26A873A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A30);
  }
  return result;
}

unint64_t sub_26051AF10()
{
  unint64_t result = qword_26A873A38;
  if (!qword_26A873A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A38);
  }
  return result;
}

unint64_t sub_26051AF68()
{
  unint64_t result = qword_26A873A40;
  if (!qword_26A873A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A40);
  }
  return result;
}

unint64_t sub_26051AFC0()
{
  unint64_t result = qword_26A873A48;
  if (!qword_26A873A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A48);
  }
  return result;
}

unint64_t sub_26051B018()
{
  unint64_t result = qword_26A873A50;
  if (!qword_26A873A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A50);
  }
  return result;
}

unint64_t sub_26051B070()
{
  unint64_t result = qword_26A873A58;
  if (!qword_26A873A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A58);
  }
  return result;
}

unint64_t sub_26051B0C8()
{
  unint64_t result = qword_26A873A60;
  if (!qword_26A873A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A60);
  }
  return result;
}

unint64_t sub_26051B120()
{
  unint64_t result = qword_26A873A68;
  if (!qword_26A873A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A68);
  }
  return result;
}

unint64_t sub_26051B178()
{
  unint64_t result = qword_26A873A70;
  if (!qword_26A873A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A70);
  }
  return result;
}

unint64_t sub_26051B1D0()
{
  unint64_t result = qword_26A873A78;
  if (!qword_26A873A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A78);
  }
  return result;
}

unint64_t sub_26051B228()
{
  unint64_t result = qword_26A873A80;
  if (!qword_26A873A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A80);
  }
  return result;
}

unint64_t sub_26051B280()
{
  unint64_t result = qword_26A873A88;
  if (!qword_26A873A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A88);
  }
  return result;
}

unint64_t sub_26051B2D8()
{
  unint64_t result = qword_26A873A90;
  if (!qword_26A873A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A90);
  }
  return result;
}

unint64_t sub_26051B330()
{
  unint64_t result = qword_26A873A98;
  if (!qword_26A873A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873A98);
  }
  return result;
}

unint64_t sub_26051B388()
{
  unint64_t result = qword_26A873AA0;
  if (!qword_26A873AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AA0);
  }
  return result;
}

unint64_t sub_26051B3E0()
{
  unint64_t result = qword_26A873AA8;
  if (!qword_26A873AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AA8);
  }
  return result;
}

unint64_t sub_26051B438()
{
  unint64_t result = qword_26A873AB0;
  if (!qword_26A873AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AB0);
  }
  return result;
}

unint64_t sub_26051B490()
{
  unint64_t result = qword_26A873AB8;
  if (!qword_26A873AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AB8);
  }
  return result;
}

unint64_t sub_26051B4E8()
{
  unint64_t result = qword_26A873AC0;
  if (!qword_26A873AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AC0);
  }
  return result;
}

unint64_t sub_26051B540()
{
  unint64_t result = qword_26A873AC8;
  if (!qword_26A873AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AC8);
  }
  return result;
}

unint64_t sub_26051B598()
{
  unint64_t result = qword_26A873AD0;
  if (!qword_26A873AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AD0);
  }
  return result;
}

unint64_t sub_26051B5F0()
{
  unint64_t result = qword_26A873AD8;
  if (!qword_26A873AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AD8);
  }
  return result;
}

unint64_t sub_26051B648()
{
  unint64_t result = qword_26A873AE0;
  if (!qword_26A873AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AE0);
  }
  return result;
}

unint64_t sub_26051B6A0()
{
  unint64_t result = qword_26A873AE8;
  if (!qword_26A873AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AE8);
  }
  return result;
}

unint64_t sub_26051B6F8()
{
  unint64_t result = qword_26A873AF0;
  if (!qword_26A873AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AF0);
  }
  return result;
}

unint64_t sub_26051B750()
{
  unint64_t result = qword_26A873AF8;
  if (!qword_26A873AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873AF8);
  }
  return result;
}

unint64_t sub_26051B7A8()
{
  unint64_t result = qword_26A873B00;
  if (!qword_26A873B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873B00);
  }
  return result;
}

uint64_t sub_26051B7FC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x776F7272417075 && a2 == 0xE700000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F7272416E776F64 && a2 == 0xE900000000000077 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F7272417466656CLL && a2 == 0xE900000000000077 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7272417468676972 && a2 == 0xEA0000000000776FLL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6574656C6564 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4464726177726F66 && a2 == 0xED00006574656C65 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7261656C63 && a2 == 0xE500000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1701670760 && a2 == 0xE400000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 6581861 && a2 == 0xE300000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x705565676170 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6E776F4465676170 && a2 == 0xE800000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 6447476 && a2 == 0xE300000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6563617073 && a2 == 0xE500000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6E7275746572 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x657061637365 && a2 == 0xE600000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6E6F6974636E7566 && a2 == 0xE800000000000000 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6D6F74737563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 16;
    }
    else {
      return 17;
    }
  }
}

uint64_t sub_26051BEAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7265696669646F6DLL && a2 == 0xEC0000007379654BLL;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x766975714579656BLL && a2 == 0xED0000746E656C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_26051BFDC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F6C61646E617473 && a2 == 0xEF656C746954656ELL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000002605432D0 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x756F7247756E656DLL && a2 == 0xE900000000000070 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002605432F0 || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x726F667265507369 && a2 == 0xED0000656C62616DLL || (sub_260532FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_260532FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

ValueMetadata *type metadata accessor for IntelligenceCommand.Identifier.State()
{
  return &type metadata for IntelligenceCommand.Identifier.State;
}

uint64_t DispatchTimeInterval.seconds.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_260532560();
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v4 = MEMORY[0x270FA5388](v2);
  char v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t, __n128))(v3 + 16))(v6, v1, v2, v4);
  int v7 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
  if (MEMORY[0x263F8F020] && v7 == *MEMORY[0x263F8F020])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v8 = (double)*v6 * 1000.0;
LABEL_14:
    *(double *)&uint64_t result = v8 / 1000.0;
    return result;
  }
  if (MEMORY[0x263F8EFF8] && v7 == *MEMORY[0x263F8EFF8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v8 = (double)*v6;
    goto LABEL_14;
  }
  if (MEMORY[0x263F8EFF0] && v7 == *MEMORY[0x263F8EFF0])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v9 = (double)*v6;
    double v10 = 1000.0;
LABEL_13:
    double v8 = v9 / v10;
    goto LABEL_14;
  }
  if (MEMORY[0x263F8EFD8] && v7 == *MEMORY[0x263F8EFD8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v9 = (double)*v6;
    double v10 = 1000000.0;
    goto LABEL_13;
  }
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v6, v2);
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t DispatchTimeInterval.millisecondsDescription.getter()
{
  uint64_t v1 = DispatchTimeInterval.milliseconds.getter();
  if (v2)
  {
    uint64_t v8 = sub_260532560();
    __n128 v9 = MEMORY[0x270FA5388](v8);
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))((char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v0, v8, v9);
    return sub_2605327C0();
  }
  else
  {
    uint64_t v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B88);
    uint64_t v4 = swift_allocObject();
    uint64_t v5 = MEMORY[0x263F8D538];
    *(_OWORD *)(v4 + 16) = xmmword_260534390;
    uint64_t v6 = MEMORY[0x263F8D5B8];
    *(void *)(v4 + 56) = v5;
    *(void *)(v4 + 64) = v6;
    *(void *)(v4 + 32) = v3;
    return sub_260532770();
  }
}

uint64_t DispatchTimeInterval.milliseconds.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_260532560();
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (uint64_t *)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t, __n128))(v3 + 16))(v6, v1, v2, v4);
  int v7 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
  if (MEMORY[0x263F8F020] && v7 == *MEMORY[0x263F8F020])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    *(double *)&uint64_t result = (double)*v6 * 1000.0;
    return result;
  }
  if (MEMORY[0x263F8EFF8] && v7 == *MEMORY[0x263F8EFF8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    *(double *)&uint64_t result = (double)*v6;
    return result;
  }
  if (MEMORY[0x263F8EFF0] && v7 == *MEMORY[0x263F8EFF0])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v9 = (double)*v6;
    double v10 = 1000.0;
LABEL_13:
    *(double *)&uint64_t result = v9 / v10;
    return result;
  }
  if (MEMORY[0x263F8EFD8] && v7 == *MEMORY[0x263F8EFD8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    double v9 = (double)*v6;
    double v10 = 1000000.0;
    goto LABEL_13;
  }
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v6, v2);
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t sub_26051C8BC()
{
  swift_beginAccess();
  int v1 = *(_DWORD *)(v0 + 56);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 56) = -1;
  }
  sub_26051CBF0(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_26051C928()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)(result + 16);
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 40);
    if (v3)
    {
      __swift_project_boxed_opaque_existential_1(v2, v3);
      sub_2604C49B0();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_26051C9AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t XPCRelaunchNotificationPoster.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(_DWORD *)(v0 + 16) = -1;
  sub_260453460();
  sub_2605327D0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  notify_register_plain();
  swift_endAccess();
  swift_release();
  return v0;
}

uint64_t XPCRelaunchNotificationPoster.init()()
{
  *(_DWORD *)(v0 + 16) = -1;
  sub_260453460();
  sub_2605327D0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  notify_register_plain();
  swift_endAccess();
  swift_release();
  return v0;
}

Swift::Void __swiftcall XPCRelaunchNotificationPoster.post()()
{
  sub_260453460();
  uint64_t v0 = sub_2605327D0();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v0 + 32));

  swift_release();
}

uint64_t XPCRelaunchNotificationPoster.deinit()
{
  return v0;
}

uint64_t XPCRelaunchNotificationPoster.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_26051CB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for XPCRelaunchNotificationPoster()
{
  return self;
}

uint64_t method lookup function for XPCRelaunchNotificationPoster(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCRelaunchNotificationPoster);
}

uint64_t dispatch thunk of XPCRelaunchNotificationPoster.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_26051CBF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26051CC50()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26051CC88()
{
  return sub_26051C928();
}

uint64_t IntelligenceElement.LoadableValue.isFinishedLoading.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = _s13LoadableValueV22InternalRepresentationOMa();
  __n128 v5 = MEMORY[0x270FA5388](v4);
  int v7 = (uint64_t *)&v12[-v6 - 8];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, __n128))(v8 + 16))(&v12[-v6 - 8], v2, v4, v5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_26051CDF0(*v7, (uint64_t)v12);
    swift_release();
    BOOL v9 = v13 == 0;
    if (v13) {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v3 - 8) + 8))(v7, v3);
    return 1;
  }
  return v9;
}

uint64_t _s13LoadableValueV22InternalRepresentationOMa()
{
  return __swift_instantiateGenericMetadata();
}

void sub_26051CDF0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v4 = a1 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a1 + 16);
  __n128 v5 = (os_unfair_lock_s *)(a1 + ((*(unsigned int *)(*(void *)a1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_260520B7C(v4, a2);
  os_unfair_lock_unlock(v5);
}

uint64_t IntelligenceElement.LoadableValue.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = _s13LoadableValueV22InternalRepresentationOMa();
  __n128 v7 = MEMORY[0x270FA5388](v6);
  BOOL v9 = (uint64_t *)((char *)&v12 - v8);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v10 + 16))((char *)&v12 - v8, v3, v6, v7);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 32))(a2, v9, v5);
  }
  sub_26051CFD8(*v9, a2);
  return swift_release();
}

void sub_26051CFD8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v4 = a1 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a1 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(a1 + ((*(unsigned int *)(*(void *)a1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_260520B60(v4, a2);
  os_unfair_lock_unlock(v5);
}

uint64_t IntelligenceElement.LoadableValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  _s13LoadableValueV22InternalRepresentationOMa();

  return swift_storeEnumTagMultiPayload();
}

uint64_t IntelligenceElement.LoadableValue.loadAsync(for:description:deadline:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v41 = a5;
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  unint64_t v42 = a6;
  uint64_t v43 = a2;
  uint64_t v47 = *(void *)(a5 + 16);
  uint64_t v44 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](a1);
  __n128 v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v39 = *((unsigned __int8 *)v8 + 24);
  char v9 = *((unsigned char *)v8 + 26);
  char v10 = *((unsigned char *)v8 + 27);
  char v11 = *((unsigned char *)v8 + 28);
  char v12 = *((unsigned char *)v8 + 29);
  char v13 = *((unsigned char *)v8 + 30);
  char v14 = *((unsigned char *)v8 + 31);
  uint64_t v15 = v8[4];
  char v16 = *((unsigned char *)v8 + 40);
  char v17 = *((unsigned char *)v8 + 41);
  uint64_t v18 = v8[6];
  char v19 = *((unsigned char *)v8 + 56);
  char v20 = *((unsigned char *)v8 + 57);
  uint64_t v21 = v8[8];
  char v22 = *((unsigned char *)v8 + 72);
  char v23 = *((unsigned char *)v8 + 73);
  __int16 v24 = *((_WORD *)v8 + 37);
  uint64_t v25 = v8[10];
  __int16 v26 = *((_WORD *)v8 + 44);
  char v27 = *((unsigned char *)v8 + 90);
  char v28 = *((unsigned char *)v8 + 91);
  char v29 = *((unsigned char *)v8 + 92);
  char v30 = *((unsigned char *)v8 + 93);
  uint64_t v31 = v8[12];
  char v32 = *((unsigned char *)v8 + 104);
  char v33 = *((unsigned char *)v8 + 105);
  LODWORD(v6) = *((unsigned __int8 *)v8 + 106);
  uint64_t v80 = *((unsigned __int8 *)v8 + 25);
  int v40 = v6;
  int v38 = *((unsigned __int8 *)v8 + 107);
  int v37 = *((unsigned __int8 *)v8 + 108);
  uint64_t v48 = *v8;
  long long v49 = *(_OWORD *)(v8 + 1);
  char v50 = v39;
  char v51 = v80;
  char v52 = v9;
  char v53 = v10;
  char v54 = v11;
  char v55 = v12;
  char v56 = v13;
  char v57 = v14;
  uint64_t v58 = v15;
  char v59 = v16;
  char v60 = v17;
  uint64_t v61 = v18;
  char v62 = v19;
  char v63 = v20;
  uint64_t v64 = v21;
  char v65 = v22;
  char v66 = v23;
  __int16 v67 = v24;
  uint64_t v68 = v25;
  __int16 v69 = v26;
  char v70 = v27;
  char v71 = v28;
  char v72 = v29;
  char v73 = v30;
  uint64_t v74 = v31;
  char v75 = v32;
  char v76 = v33;
  char v77 = v6;
  char v78 = v38;
  char v79 = v37;
  uint64_t v34 = v41;
  IntelligenceElement.LoadableValue.value.getter(v41, (uint64_t)v7);
  IntelligenceElement.LoadableValue.loadAsync(for:description:deadline:baseValue:)(&v48, v43, v45, v46, (uint64_t)v7, v34, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v7, v47);
}

uint64_t IntelligenceElement.LoadableValue.loadAsync(for:description:deadline:baseValue:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v51 = a3;
  uint64_t v50 = a2;
  uint64_t v13 = *(void *)(a6 + 16);
  uint64_t v14 = _s13LoadableValueV22InternalRepresentationOMa();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v17 = (void *)((char *)v45 - v16);
  long long v18 = a1[5];
  v54[4] = a1[4];
  v55[0] = v18;
  *(_OWORD *)((char *)v55 + 13) = *(_OWORD *)((char *)a1 + 93);
  long long v19 = a1[1];
  v54[0] = *a1;
  v54[1] = v19;
  long long v20 = a1[3];
  v54[2] = a1[2];
  v54[3] = v20;
  (*(void (**)(char *, uint64_t *, uint64_t))(v15 + 16))((char *)v45 - v16, v8, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = *v17;
    if (qword_26B3E8458[0] != -1) {
      swift_once();
    }
    uint64_t v22 = sub_2605324A0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B3E87B0);
    swift_retain();
    char v23 = sub_260532480();
    os_log_type_t v24 = sub_260532A00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(void *)&long long v56 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_26051DA64(v21);
      *(void *)&v52[0] = sub_2604E5DDC(v27, v28, (uint64_t *)&v56);
      sub_260532B60();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_260451000, v23, v24, "LoadableValue is already being loaded asynchronously; returning existing async loadable for %{public}s",
        v25,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x261213230](v26, -1, -1);
      MEMORY[0x261213230](v25, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    uint64_t v48 = v13;
    if (qword_26B3E93D8 != -1) {
      swift_once();
    }
    uint64_t v46 = a4;
    uint64_t v47 = a5;
    long long v49 = a7;
    v45[1] = off_26B3E93D0;
    unsigned int v29 = v54[0];
    unsigned int v30 = DWORD1(v54[0]);
    uint64_t v31 = qword_26A872138;
    uint64_t v32 = v51;
    swift_bridgeObjectRetain();
    if (v31 != -1) {
      swift_once();
    }
    char v33 = (void *)(qword_26A8731B0 + 16);
    uint64_t v34 = (os_unfair_lock_s *)(qword_26A8731B0 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(qword_26A8731B0 + 24));
    sub_2604E02EC(v33, &v56);
    os_unfair_lock_unlock(v34);
    uint64_t v35 = v56;
    uint64_t v36 = mach_continuous_time();
    v45[0] = v45;
    *(void *)&long long v56 = v35;
    *((void *)&v56 + 1) = __PAIR64__(v30, v29);
    *(void *)&long long v57 = v50;
    *((void *)&v57 + 1) = v32;
    uint64_t v58 = v36;
    MEMORY[0x270FA5388](v36);
    LODWORD(v45[-8]) = v29;
    HIDWORD(v45[-8]) = v30;
    v45[-7] = v37;
    v45[-6] = v32;
    v45[-5] = v46;
    v45[-4] = v54;
    int v39 = (uint64_t *)&v38[4];
    int v40 = v38 + 8;
    v45[-3] = v41;
    v45[-2] = &v56;
    os_unfair_lock_lock(v38 + 8);
    sub_2604E4A2C(v39);
    os_unfair_lock_unlock(v40);
    v52[0] = v56;
    v52[1] = v57;
    uint64_t v53 = v58;
    uint64_t v42 = v48;
    uint64_t v21 = sub_26051EE64((uint64_t)v52, v47, v48);
    uint64_t v43 = *(void (**)(uint64_t *, uint64_t))(v15 + 8);
    swift_retain();
    v43(v8, v14);
    *uint64_t v8 = v21;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v42 - 8) + 8))(v17, v42);
    a7 = v49;
  }
  a7[3] = _s13LoadableValueV10AsyncValueVMa();
  uint64_t result = swift_getWitnessTable();
  a7[4] = result;
  *a7 = v21;
  return result;
}

uint64_t _s13LoadableValueV10AsyncValueVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t IntelligenceElement.LoadableValue.description.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s13LoadableValueV22InternalRepresentationOMa();
  __n128 v8 = MEMORY[0x270FA5388](v7);
  char v10 = (void *)((char *)v14 - v9);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))((char *)v14 - v9, v2, v7, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_26051DA64(*v10);
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v4 + 32))(v6, v10, v3);
    v14[0] = 0;
    v14[1] = 0xE000000000000000;
    sub_260532F90();
    uint64_t v12 = v14[0];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v12;
}

uint64_t sub_26051DA64(uint64_t a1)
{
  _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v2 = (os_unfair_lock_s *)(a1 + ((*(unsigned int *)(*(void *)a1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v2);
  sub_260520B14(&v4);
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_26051DB14(uint64_t a1, uint64_t a2)
{
  _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v3 = (unint64_t *)(a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16));
  uint64_t v4 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_260520A60(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_26051DBC0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a2;
  uint64_t v20 = sub_260532B40();
  uint64_t v5 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v7 = (char *)&v18 - v6;
  unint64_t v8 = a1[3];
  if (v8)
  {
    unint64_t v18 = a1[4];
    unint64_t v9 = a1[1];
    unint64_t v10 = a1[2];
    unint64_t v11 = *a1;
    uint64_t v12 = (char *)a1 + *(int *)(_s13LoadableValueV10AsyncValueV7StorageVMa() + 28);
    uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    v13(v12, v20);
    uint64_t v14 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, v19, a3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, a3);
    unint64_t v21 = v11;
    unint64_t v22 = v9;
    unint64_t v23 = v10;
    unint64_t v24 = v8;
    unint64_t v25 = v18;
    IntelligenceCollectionCoordinator.AsyncTask.complete()();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    a1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
  else
  {
    unint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    unint64_t v21 = 0xD000000000000019;
    unint64_t v22 = 0x8000000260543480;
    uint64_t v16 = _s13LoadableValueV10AsyncValueV7StorageVMa();
    uint64_t v17 = v20;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)a1 + *(int *)(v16 + 28), v20);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 48))(v7, 1, a3);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260532D50();
    __break(1u);
  }
  return result;
}

void sub_26051DEC8(uint64_t a1)
{
}

void sub_26051DED8(uint64_t a1, uint64_t a2)
{
  _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v3 = (uint64_t *)(a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16));
  uint64_t v4 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_260520A2C(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_26051DF88(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_260532B40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = a1[3];
  if (v12)
  {
    unint64_t v14 = a1[1];
    uint64_t v13 = a1[2];
    uint64_t v15 = a1[4];
    uint64_t v16 = *a1;
    uint64_t v40 = v4;
    if (a2)
    {
      uint64_t v39 = v16;
      swift_bridgeObjectRetain();
      id v17 = a2;
      if (qword_26B3E8458[0] != -1) {
        swift_once();
      }
      uint64_t v18 = sub_2605324A0();
      __swift_project_value_buffer(v18, (uint64_t)qword_26B3E87B0);
      id v19 = a2;
      id v20 = a2;
      id v21 = a2;
      id v22 = a2;
      unint64_t v23 = sub_260532480();
      os_log_type_t v24 = sub_260532A00();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        uint64_t v37 = v15;
        uint64_t v26 = v25;
        uint64_t v36 = swift_slowAlloc();
        uint64_t v42 = v36;
        *(_DWORD *)uint64_t v26 = 136446466;
        uint64_t v38 = v13;
        swift_getErrorValue();
        uint64_t v27 = sub_260533030();
        uint64_t v41 = sub_2604E5DDC(v27, v28, &v42);
        sub_260532B60();
        swift_bridgeObjectRelease();

        *(_WORD *)(v26 + 12) = 2082;
        uint64_t v41 = (uint64_t)a2;
        id v29 = a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8723E8);
        uint64_t v30 = sub_2605327C0();
        uint64_t v41 = sub_2604E5DDC(v30, v31, &v42);
        sub_260532B60();
        uint64_t v13 = v38;
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_260451000, v23, v24, "Async value load failed with error: %{public}s; underlying error: %{public}s",
          (uint8_t *)v26,
          0x16u);
        uint64_t v32 = v36;
        swift_arrayDestroy();
        MEMORY[0x261213230](v32, -1, -1);
        uint64_t v33 = v26;
        uint64_t v15 = v37;
        MEMORY[0x261213230](v33, -1, -1);
      }
      else
      {
      }
      uint64_t v16 = v39;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    uint64_t v42 = v16;
    unint64_t v43 = v14;
    uint64_t v44 = v13;
    uint64_t v45 = v12;
    uint64_t v46 = v15;
    IntelligenceCollectionCoordinator.AsyncTask.complete()();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    a1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v43 = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    uint64_t v42 = 0xD000000000000019;
    unint64_t v43 = 0x8000000260543480;
    uint64_t v35 = _s13LoadableValueV10AsyncValueV7StorageVMa();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, (char *)a1 + *(int *)(v35 + 28), v8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 48))(v11, 1, a3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t result = sub_260532D50();
    __break(1u);
  }
  return result;
}

uint64_t sub_26051E440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_260532B40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = _s13LoadableValueV10AsyncValueV7StorageVMa();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v10 + 28), v6);
  uint64_t v11 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, a2) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a3, v9, a2);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a3, a1 + *(int *)(v10 + 32), a2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_26051E5E8@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v13 = a1[1];
  long long v14 = *a1;
  uint64_t v7 = *((void *)a1 + 4);
  uint64_t v8 = _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v12 = *(void *)(a3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4 + *(int *)(v8 + 28), 1, 1, a3);
  *(_OWORD *)a4 = v14;
  *(_OWORD *)(a4 + 16) = v13;
  *(void *)(a4 + 32) = v7;
  uint64_t v9 = a4 + *(int *)(v8 + 32);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);

  return v10(v9, a2, a3);
}

uint64_t sub_26051E6DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = sub_260532B40();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v20 - v10;
  uint64_t v12 = *(void *)(v8 - 8);
  __n128 v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + 24))
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_260532CB0();
    sub_260532840();
    sub_260532840();
    swift_bridgeObjectRelease();
    sub_260532840();
    sub_260532F90();
    sub_260532840();
  }
  else
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    uint64_t v18 = v14;
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v14 + 16))(v11, v2 + *(int *)(a1 + 28), v9, v15);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v8) == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, &v6[*(int *)(a1 + 32)], v8);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v11, v8);
    }
    sub_260532F90();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v8);
  }
  return v20;
}

void sub_26051EA60(uint64_t a1)
{
  sub_26051DB14(a1, *v1);
}

void sub_26051EA70()
{
  sub_26051DEC8(*v0);
}

uint64_t sub_26051EA80(uint64_t a1, uint64_t a2)
{
  return sub_26051DF84(a1, *v2, *(void *)(a2 + 16));
}

uint64_t sub_26051EA90()
{
  return sub_26051DA64(*v0);
}

uint64_t static IntelligenceElement.LoadableValue<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a4;
  uint64_t v32 = a2;
  uint64_t v6 = _s13LoadableValueV22InternalRepresentationOMa();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v29 - v11);
  uint64_t v30 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v13);
  __n128 v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v29 - v17;
  uint64_t v19 = type metadata accessor for IntelligenceElement.LoadableValue();
  if ((IntelligenceElement.LoadableValue.isFinishedLoading.getter(v19) & 1) == 0
    || (IntelligenceElement.LoadableValue.isFinishedLoading.getter(v19) & 1) == 0)
  {
    uint64_t v22 = v32;
    unint64_t v23 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16);
    v23(v12, a1, v6);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = *v12;
      v23(v9, v22, v6);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v25 = *v9;
        sub_26051CDF0(v24, (uint64_t)v35);
        uint64_t v26 = v35[0];
        uint64_t v27 = v35[3];
        sub_26051CDF0(v25, (uint64_t)v33);
        swift_release();
        swift_release();
        if (v27)
        {
          if (v34)
          {
            char v20 = v26 == v33[0];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v20 & 1;
          }
        }
        else if (!v34)
        {
          char v20 = 1;
          return v20 & 1;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
      }
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v12, v6);
    }
    char v20 = 0;
    return v20 & 1;
  }
  IntelligenceElement.LoadableValue.value.getter(v19, (uint64_t)v18);
  IntelligenceElement.LoadableValue.value.getter(v19, (uint64_t)v15);
  char v20 = sub_2605326B0();
  unint64_t v21 = *(void (**)(char *, uint64_t))(v30 + 8);
  v21(v15, a3);
  v21(v18, a3);
  return v20 & 1;
}

uint64_t sub_26051EDDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static IntelligenceElement.LoadableValue<>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a4 - 8));
}

uint64_t sub_26051EDE8()
{
  return sub_260532D00();
}

uint64_t sub_26051EE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - v11;
  long long v13 = *(_OWORD *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 32);
  v18[0] = *(_OWORD *)a1;
  v18[1] = v13;
  uint64_t v19 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, a3);
  sub_26051E5E8(v18, (uint64_t)v8, a3, (uint64_t)v12);
  uint64_t v15 = sub_26051EDE8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

uint64_t type metadata accessor for IntelligenceElement.LoadableValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of IntelligenceElement.AsyncLoadable.loadCompleted(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of IntelligenceElement.AsyncLoadable.loadFailed()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntelligenceElement.AsyncLoadable.loadFailed(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_26051F060()
{
  uint64_t result = _s13LoadableValueV22InternalRepresentationOMa();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_26051F0F4(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_26051F1F4(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(void *)a2;
    swift_retain();
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_26051F330(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_release();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      a1[v7] = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

void *sub_26051F54C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(void *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_26051F684(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_release();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_26051F89C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_26051F9D0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x26051FB98);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_26051FBC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_26051FC58(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 != 1)
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
      return v3;
    }
    *a1 = *(void *)a2;
    *((unsigned char *)a1 + v5) = 1;
  }
  swift_retain();
  return v3;
}

uint64_t sub_26051FDD0(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_26051FED0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(void *)a2;
    swift_retain();
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_26052000C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_release();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      a1[v7] = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

void *sub_260520228(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(void *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_260520360(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_release();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_260520578(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_2605206AC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x260520874);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_26052089C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_260520954(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_260520A2C(uint64_t *a1)
{
  return sub_26051DF88(a1, *(void **)(v1 + 24), *(void *)(v1 + 16));
}

uint64_t _s13LoadableValueV10AsyncValueV7StorageVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_260520A60(unint64_t *a1)
{
  return sub_26051DBC0(a1, *(void *)(v1 + 24), *(void *)(v1 + 16));
}

uint64_t sub_260520A7C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v4 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v4 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2, v3);
}

uint64_t sub_260520B14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = _s13LoadableValueV10AsyncValueV7StorageVMa();
  uint64_t result = sub_26051E6DC(v2);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_260520B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_26051E440(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_260520B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_260520BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_260520BB8()
{
  uint64_t result = sub_260532B40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_260520C98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v5 + 64);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v10 = *(void *)(v5 + 64);
  }
  else {
    size_t v10 = v9 + 1;
  }
  size_t v11 = v10 + v7;
  unint64_t v12 = ((v11 + ((v7 + 40) & ~(unint64_t)v7)) & ~(unint64_t)v7)
      + v9;
  int v13 = v7 & 0x100000;
  if (v8 > 7 || v13 != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v16 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v8;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v18 = a2[3];
    v3[2] = a2[2];
    v3[3] = v18;
    v3[4] = a2[4];
    uint64_t v19 = (void *)(((unint64_t)v3 + v8 + 40) & ~v8);
    char v20 = (const void *)(((unint64_t)a2 + v8 + 40) & ~v8);
    unint64_t v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    swift_bridgeObjectRetain();
    if (v21(v20, 1, v4))
    {
      memcpy(v19, v20, v10);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)v19 + v11) & v17, ((unint64_t)v20 + v11) & v17, v4);
    }
    else
    {
      uint64_t v22 = *(void (**)(void *, const void *, uint64_t))(v6 + 16);
      v22(v19, v20, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v4);
      v22((void *)(((unint64_t)v19 + v11) & v17), (const void *)(((unint64_t)v20 + v11) & v17), v4);
    }
  }
  return v3;
}

uint64_t sub_260520E60(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = a1 + v6 + 40;
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7 & ~v6, 1, v4);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  if (!v8)
  {
    unint64_t v12 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v9(v7 & ~v6, v4);
    uint64_t v9 = v12;
  }
  uint64_t v10 = (v7 | v6) + *(void *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84)) {
    ++v10;
  }

  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v10 & ~v6, v4);
}

uint64_t sub_260520F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = v7 + 40 + a1;
  int v8 = (void *)(v20 & ~v7);
  uint64_t v19 = v7 + 40 + a2;
  uint64_t v9 = (const void *)(v19 & ~v7);
  uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  swift_bridgeObjectRetain();
  if (v10(v9, 1, v5))
  {
    int v11 = *(_DWORD *)(v6 + 84);
    uint64_t v12 = *(void *)(v6 + 64);
    if (v11) {
      size_t v13 = *(void *)(v6 + 64);
    }
    else {
      size_t v13 = v12 + 1;
    }
    memcpy(v8, v9, v13);
    unsigned int v14 = *(void (**)(void *, const void *, uint64_t))(v6 + 16);
  }
  else
  {
    unsigned int v14 = *(void (**)(void *, const void *, uint64_t))(v6 + 16);
    v14(v8, v9, v5);
    uint64_t v16 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v15 = v6 + 56;
    v16(v8, 0, 1, v5);
    int v11 = *(_DWORD *)(v15 + 28);
    uint64_t v12 = *(void *)(v15 + 8);
  }
  if (v11) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = v12 + 1;
  }
  v14((void *)(((v20 | v7) + v17) & ~v7), (const void *)(((v19 | v7) + v17) & ~v7), v5);
  return a1;
}

uint64_t sub_26052111C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = v8 + 40 + a1;
  uint64_t v9 = (void *)(v22 & ~v8);
  uint64_t v10 = v8 + 40 + a2;
  int v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(v9, 1, v6);
  int v13 = v11((void *)(v10 & ~v8), 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v9, v10 & ~v8, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      goto LABEL_12;
    }
    int v14 = *(_DWORD *)(v7 + 84);
    size_t v15 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v13)
    {
      (*(void (**)(void *, uint64_t, uint64_t))(v7 + 24))(v9, v10 & ~v8, v6);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
    int v14 = *(_DWORD *)(v7 + 84);
    size_t v15 = *(void *)(v7 + 64);
  }
  if (v14) {
    size_t v16 = v15;
  }
  else {
    size_t v16 = v15 + 1;
  }
  memcpy(v9, (const void *)(v10 & ~v8), v16);
LABEL_12:
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  uint64_t v18 = v7 + 24;
  uint64_t v17 = v19;
  if (*(_DWORD *)(v18 + 60)) {
    uint64_t v20 = *(void *)(v18 + 40);
  }
  else {
    uint64_t v20 = *(void *)(v18 + 40) + 1;
  }
  v17(((v22 | v8) + v20) & ~v8, ((v10 | v8) + v20) & ~v8, v6);
  return a1;
}

uint64_t sub_260521338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = v7 + 40 + a1;
  uint64_t v8 = (void *)(v19 & ~v7);
  uint64_t v18 = v7 + 40 + a2;
  uint64_t v9 = (const void *)(v18 & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    int v10 = *(_DWORD *)(v6 + 84);
    uint64_t v11 = *(void *)(v6 + 64);
    if (v10) {
      size_t v12 = *(void *)(v6 + 64);
    }
    else {
      size_t v12 = v11 + 1;
    }
    memcpy(v8, v9, v12);
    int v13 = *(void (**)(void *, const void *, uint64_t))(v6 + 32);
  }
  else
  {
    int v13 = *(void (**)(void *, const void *, uint64_t))(v6 + 32);
    v13(v8, v9, v5);
    size_t v15 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v14 = v6 + 56;
    v15(v8, 0, 1, v5);
    int v10 = *(_DWORD *)(v14 + 28);
    uint64_t v11 = *(void *)(v14 + 8);
  }
  if (v10) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = v11 + 1;
  }
  v13((void *)(((v19 | v7) + v16) & ~v7), (const void *)(((v18 | v7) + v16) & ~v7), v5);
  return a1;
}

void *sub_2605214CC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  unint64_t v23 = (unint64_t)a1 + v9 + 40;
  int v10 = (void *)(v23 & ~v9);
  unint64_t v11 = (unint64_t)a2 + v9 + 40;
  size_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  int v13 = v12(v10, 1, v7);
  int v14 = v12((void *)(v11 & ~v9), 1, v7);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, unint64_t, uint64_t))(v8 + 32))(v10, v11 & ~v9, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(void *, unint64_t, uint64_t))(v8 + 40))(v10, v11 & ~v9, v7);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  if (v15) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v16 + 1;
  }
  memcpy(v10, (const void *)(v11 & ~v9), v17);
LABEL_12:
  uint64_t v20 = *(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40);
  uint64_t v19 = v8 + 40;
  uint64_t v18 = v20;
  if (*(_DWORD *)(v19 + 44)) {
    uint64_t v21 = *(void *)(v19 + 24);
  }
  else {
    uint64_t v21 = *(void *)(v19 + 24) + 1;
  }
  v18(((v23 | v9) + v21) & ~v9, ((v11 | v9) + v21) & ~v9, v7);
  return a1;
}

uint64_t sub_2605216D0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  unsigned int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(v4 + 64);
  if (v6) {
    uint64_t v11 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v11 = v10 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = v11 + v9;
  int v13 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_29;
  }
  uint64_t v14 = ((v12 + ((v9 + 40) & ~v9)) & ~v9) + v10;
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v18 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_29;
      }
      goto LABEL_21;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_29;
      }
      goto LABEL_21;
    }
    if (v18 < 2)
    {
LABEL_29:
      if (v6 > 0x7FFFFFFE)
      {
        uint64_t v21 = ((unint64_t)a1 + v9 + 40) & ~v9;
        if (v7 == v8)
        {
          unsigned int v22 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v21);
          if (v22 >= 2) {
            return v22 - 1;
          }
          else {
            return 0;
          }
        }
        else
        {
          uint64_t v23 = (v12 + v21) & ~v9;
          uint64_t v24 = *(uint64_t (**)(uint64_t))(v5 + 48);
          return v24(v23);
        }
      }
      else
      {
        unint64_t v20 = *((void *)a1 + 3);
        if (v20 >= 0xFFFFFFFF) {
          LODWORD(v20) = -1;
        }
        if ((v20 + 1) >= 2) {
          return v20;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_29;
  }
LABEL_21:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 > 3) {
      LODWORD(v14) = 4;
    }
    switch((int)v14)
    {
      case 2:
        LODWORD(v14) = *a1;
        break;
      case 3:
        LODWORD(v14) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v14) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v14) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v14 | v19) + 1;
}

void sub_2605218FC(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v8 = v7;
  unsigned int v9 = *(_DWORD *)(v7 + 84);
  unsigned int v10 = v9 - 1;
  if (!v9) {
    unsigned int v10 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v11 = 2147483646;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = *(void *)(v7 + 64);
  if (v9) {
    uint64_t v14 = *(void *)(v7 + 64);
  }
  else {
    uint64_t v14 = v13 + 1;
  }
  uint64_t v15 = v14 + v12;
  size_t v16 = ((v15 + ((v12 + 40) & ~v12)) & ~v12) + v13;
  BOOL v17 = a3 >= v11;
  unsigned int v18 = a3 - v11;
  if (v18 == 0 || !v17)
  {
LABEL_18:
    if (v11 < a2) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  if (v16 > 3)
  {
    int v6 = 1;
    if (v11 < a2) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  unsigned int v19 = ((v18 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
  if (!HIWORD(v19))
  {
    if (v19 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v19 > 1;
    }
    goto LABEL_18;
  }
  int v6 = 4;
  if (v11 < a2)
  {
LABEL_19:
    unsigned int v20 = ~v11 + a2;
    if (v16 < 4)
    {
      int v21 = (v20 >> (8 * v16)) + 1;
      if (v16)
      {
        int v22 = v20 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v20;
      int v21 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v16] = v21;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v21;
        return;
      case 3:
        goto LABEL_50;
      case 4:
        *(_DWORD *)&a1[v16] = v21;
        return;
      default:
        return;
    }
  }
LABEL_26:
  uint64_t v23 = ~v12;
  switch(v6)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_31;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_31;
    case 3:
LABEL_50:
      __break(1u);
      JUMPOUT(0x260521BB4);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_30;
    default:
LABEL_30:
      if (a2)
      {
LABEL_31:
        if (v9 > 0x7FFFFFFE)
        {
          unint64_t v24 = (unint64_t)&a1[v12 + 40] & v23;
          if (v10 == v11) {
            a2 = (a2 + 1);
          }
          else {
            unint64_t v24 = (v15 + v24) & v23;
          }
          uint64_t v25 = *(void (**)(unint64_t, uint64_t))(v8 + 56);
          v25(v24, a2);
        }
        else if (a2 > 0x7FFFFFFE)
        {
          *((void *)a1 + 4) = 0;
          *(_OWORD *)a1 = 0u;
          *((_OWORD *)a1 + 1) = 0u;
          *(_DWORD *)a1 = a2 - 0x7FFFFFFF;
        }
        else
        {
          *((void *)a1 + 3) = a2;
        }
      }
      return;
  }
}

uint64_t sub_260521BDC()
{
  return sub_2605330E0();
}

uint64_t sub_260521CCC()
{
  return sub_2605330E0();
}

uint64_t sub_260521DE8()
{
  return sub_2605330E0();
}

uint64_t sub_260521EE4()
{
  return sub_2605330E0();
}

uint64_t sub_260521FC0()
{
  return sub_2605330E0();
}

uint64_t sub_2605220E4()
{
  return sub_2605330E0();
}

uint64_t sub_2605221EC()
{
  return sub_2605330E0();
}

uint64_t sub_2605222D4()
{
  return sub_2605330E0();
}

uint64_t sub_260522384()
{
  return sub_260532450();
}

id IntelligenceUserActivity.userActivity.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

uint64_t IntelligenceUserActivity.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IntelligenceUserActivity() + 20);
  uint64_t v4 = sub_2605322D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for IntelligenceUserActivity()
{
  uint64_t result = qword_26B3E9048;
  if (!qword_26B3E9048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t IntelligenceUserActivity.init(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    IntelligenceUserActivity.init(userActivity:)(a1, a2);
    uint64_t v3 = type metadata accessor for IntelligenceUserActivity();
    uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    int v6 = a2;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for IntelligenceUserActivity();
    uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v5 = v8;
    int v6 = a2;
    uint64_t v7 = 1;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t IntelligenceUserActivity.init(userActivity:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel__uniqueIdentifier);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D10);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    uint64_t v8 = sub_2605322D0();
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v8);
    unsigned int v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2605322B0();

    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v12(v7, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    if (result != 1)
    {
      uint64_t v14 = type metadata accessor for IntelligenceUserActivity();
      uint64_t v15 = *(int *)(v14 + 24);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D18);
      uint64_t v16 = swift_allocObject();
      *(_DWORD *)(v16 + 40) = 0;
      *(unsigned char *)(v16 + 16) = 0;
      *(_OWORD *)(v16 + 24) = xmmword_260536250;
      *(void *)((char *)a2 + v15) = v16;
      *a2 = a1;
      return ((uint64_t (*)(char *, char *, uint64_t))v12)((char *)a2 + *(int *)(v14 + 20), v7, v8);
    }
  }
  else
  {
    uint64_t v17 = sub_2605322D0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_2605227CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  if (*(unsigned char *)a1 == 1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    unint64_t v6 = *(void *)(a1 + 16);
  }
  else
  {
    *(unsigned char *)a1 = 1;
    uint64_t v5 = *a2;
    if (*a2)
    {
      uint64_t v5 = sub_26052285C();
      unint64_t v6 = v7;
    }
    else
    {
      unint64_t v6 = 0xF000000000000000;
    }
    sub_26047F0A0(*(void *)(a1 + 8), *(void *)(a1 + 16));
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
  }
  *a3 = v5;
  a3[1] = v6;
  return sub_26047F034(v5, v6);
}

uint64_t sub_26052285C()
{
  v60[1] = *(id *)MEMORY[0x263EF8340];
  if (!MEMORY[0x263F84188]) {
    return 0;
  }
  uint64_t v1 = v0;
  uint64_t v2 = mach_continuous_time();
  id v3 = objc_msgSend(v0, sel_needsSave);
  sub_26045E128(MEMORY[0x263F8EE78]);
  id v4 = (void *)sub_260532630();
  swift_bridgeObjectRelease();
  v60[0] = 0;
  id v5 = objc_msgSend(v0, sel__createUserActivityDataWithSaving_options_error_, v3, v4, v60);

  id v6 = v60[0];
  if (!v5)
  {
    uint64_t v32 = v6;
    uint64_t v33 = (void *)sub_260532040();

    swift_willThrow();
    if (qword_26B3E8458[0] != -1) {
      swift_once();
    }
    uint64_t v34 = sub_2605324A0();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B3E87B0);
    id v35 = v33;
    id v36 = v33;
    id v37 = v1;
    id v38 = v33;
    id v39 = v37;
    id v40 = v33;
    uint64_t v41 = sub_260532480();
    os_log_type_t v42 = sub_260532A00();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      v60[0] = v58;
      *(_DWORD *)uint64_t v43 = 136446723;
      swift_getErrorValue();
      uint64_t v45 = sub_260533030();
      sub_2604E5DDC(v45, v46, (uint64_t *)v60);
      sub_260532B60();
      swift_bridgeObjectRelease();

      *(_WORD *)(v43 + 12) = 2082;
      id v47 = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8723E8);
      uint64_t v48 = sub_2605327C0();
      sub_2604E5DDC(v48, v49, (uint64_t *)v60);
      sub_260532B60();
      swift_bridgeObjectRelease();

      *(_WORD *)(v43 + 22) = 2113;
      id v59 = v39;
      id v50 = v39;
      sub_260532B60();
      *uint64_t v44 = v39;

      _os_log_impl(&dword_260451000, v41, v42, "Error encoding user activity: %{public}s; underlying error: %{public}s; user activity: %{private}@",
        (uint8_t *)v43,
        0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D60);
      swift_arrayDestroy();
      MEMORY[0x261213230](v44, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261213230](v58, -1, -1);
      MEMORY[0x261213230](v43, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  char v54 = (void *)v2;
  uint64_t v7 = sub_260532240();
  unint64_t v9 = v8;

  sub_26047F048(v7, v9);
  if (qword_26B3E8450 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_260532440();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26B3E8790);
  uint64_t v58 = v52;
  uint64_t v12 = *(void *)(v10 - 8);
  __n128 v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v12 + 16);
  uint64_t v57 = v10;
  v16(v15, v11, v10, v13);
  uint64_t v55 = sub_260532400();
  long long v56 = v52;
  uint64_t v17 = *(void *)(v55 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v55);
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  unsigned int v20 = (char *)v52 - v19;
  sub_260532430();
  swift_unknownObjectRetain();
  sub_2605323D0();
  sub_2604C2334();
  sub_260522384();
  sub_2604ADF90(v21);
  int v22 = sub_260532430();
  int v53 = sub_260532B00();
  uint64_t v23 = sub_260532B30();
  if (v23)
  {
    v52[1] = v52;
    __n128 v24 = MEMORY[0x270FA5388](v23);
    uint64_t v25 = (char *)v52 - v19;
    uint64_t v26 = (char *)v52 - v19;
    uint64_t v27 = (char *)v52 - v19;
    uint64_t v28 = v55;
    (*(void (**)(char *, char *, uint64_t, __n128))(v17 + 16))(v26, v27, v55, v24);
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134217984;
    v60[0] = v54;
    sub_260532B60();
    os_signpost_id_t v30 = sub_2605323F0();
    _os_signpost_emit_with_name_impl(&dword_260451000, v22, (os_signpost_type_t)v53, v30, "EncodeUserActivity", "%{public, signpost.description:begin_time}llu", v29, 0xCu);
    MEMORY[0x261213230](v29, -1, -1);
    sub_260464128(v7, v9);

    uint64_t v31 = *(void (**)(char *, uint64_t))(v17 + 8);
    v31(v20, v28);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v57);
    v31(v25, v28);
  }
  else
  {
    sub_260464128(v7, v9);

    (*(void (**)(char *, uint64_t))(v17 + 8))((char *)v52 - v19, v55);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v57);
  }
  return v7;
}

uint64_t static IntelligenceUserActivity.== infix(_:_:)()
{
  return sub_2605322A0() & 1;
}

uint64_t IntelligenceUserActivity.hash(into:)()
{
  return sub_260532660();
}

uint64_t IntelligenceUserActivity.hashValue.getter()
{
  return sub_2605330E0();
}

uint64_t sub_2605230DC()
{
  return sub_2605330E0();
}

uint64_t sub_260523150()
{
  return sub_260532660();
}

uint64_t sub_2605231B0()
{
  return sub_2605330E0();
}

uint64_t sub_260523220()
{
  return sub_2605322A0() & 1;
}

uint64_t sub_260523248(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_260526620(*a1, *a2);
}

uint64_t sub_260523254()
{
  return sub_2605222D4();
}

uint64_t sub_26052325C()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605232F8()
{
  return sub_260528F1C();
}

uint64_t sub_260523300@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260525B14();
  *a1 = result;
  return result;
}

void sub_260523330(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA00000000007265;
  unint64_t v4 = 0x8000000260540CB0;
  unint64_t v5 = 0xD000000000000010;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD00000000000001BLL;
    unint64_t v4 = 0x8000000260540CD0;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x696669746E656469;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_26052339C()
{
  unint64_t v1 = 0xD000000000000010;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001BLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_260523404@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260525B14();
  *a1 = result;
  return result;
}

uint64_t sub_26052342C(uint64_t a1)
{
  unint64_t v2 = sub_260523878();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260523468(uint64_t a1)
{
  unint64_t v2 = sub_260523878();

  return MEMORY[0x270FA00B8](a1, v2);
}

void IntelligenceUserActivity.encode(to:)(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260523878();
  sub_260533120();
  type metadata accessor for IntelligenceUserActivity();
  LOBYTE(v21[0]) = 0;
  sub_2605322D0();
  sub_260524D0C(&qword_26A871D58);
  uint64_t v9 = sub_260532F40();
  if (v2) {
    goto LABEL_2;
  }
  MEMORY[0x270FA5388](v9);
  v20[-2] = v3;
  uint64_t v11 = (uint64_t)&v10[4];
  uint64_t v12 = v10 + 10;
  os_unfair_lock_lock(v10 + 10);
  sub_2605238CC(v11, v21);
  os_unfair_lock_unlock(v12);
  uint64_t v14 = v21[0];
  unint64_t v13 = v21[1];
  LOBYTE(v22) = 1;
  sub_260483790();
  sub_260532EF0();
  if (!*v3 || (id v15 = objc_msgSend(*v3, sel_userInfo)) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
LABEL_9:
    sub_26047F0A0(v14, v13);
    sub_26045B7D4((uint64_t)&v22, &qword_26A872A40);
LABEL_2:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return;
  }
  uint64_t v16 = v15;
  uint64_t v17 = sub_260532640();

  v20[1] = 0xD000000000000016;
  v20[2] = 0x80000002605434A0;
  sub_260532C60();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_26047F3B0((uint64_t)v21), (v19 & 1) != 0))
  {
    sub_2604E64B0(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  sub_260483AA8((uint64_t)v21);
  swift_bridgeObjectRelease();
  if (!*((void *)&v23 + 1)) {
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_26047F0A0(v14, v13);
    goto LABEL_2;
  }
  LOBYTE(v21[0]) = 2;
  sub_260532F00();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_26047F0A0(v14, v13);
  swift_bridgeObjectRelease();
}

unint64_t sub_260523878()
{
  unint64_t result = qword_26A873D28;
  if (!qword_26A873D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873D28);
  }
  return result;
}

uint64_t sub_2605238CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2605227CC(a1, *(uint64_t **)(v2 + 16), a2);
}

void IntelligenceUserActivity.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D30);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for IntelligenceUserActivity();
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(int *)(v9 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D18);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 40) = 0;
  *(unsigned char *)(v11 + 16) = 0;
  *(_OWORD *)(v11 + 24) = xmmword_260536250;
  __int16 v67 = v8;
  id v59 = v10;
  *(Class *)((char *)&v10->isa + (void)v8) = (Class)v11;
  uint64_t v12 = a1[3];
  char v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_260523878();
  swift_retain();
  sub_260533100();
  if (v2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    swift_release();
    return;
  }
  id v55 = (id)v11;
  uint64_t v53 = v11 + 16;
  os_unfair_lock_t v54 = (os_unfair_lock_t)(v11 + 40);
  unint64_t v13 = (void *)sub_2605322D0();
  uint64_t v14 = *(v13 - 1);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v63) = 0;
  sub_260524D0C(&qword_26A871D98);
  uint64_t v17 = v58;
  sub_260532E70();
  unint64_t v18 = (char *)v67 + *(int *)(v6 + 20);
  uint64_t v52 = v14;
  (*(void (**)(char *, char *, void *))(v14 + 32))(v18, v16, v13);
  LOBYTE(v65) = 1;
  sub_26048393C();
  sub_260532E30();
  v50[1] = v13;
  char v19 = v64;
  uint64_t v20 = v57;
  if (v64 >> 60 != 15)
  {
    uint64_t v51 = v63;
    long long v22 = (void *)sub_260532230();
    id v23 = _UIIntelligenceDecodeUserActivity(v22);

    if (!v23)
    {
      swift_release();
      os_signpost_id_t v30 = (os_unfair_lock_s *)sub_260532280();
      unint64_t v32 = v31;
      if (qword_26B3E8458[0] != -1) {
        swift_once();
      }
      uint64_t v33 = sub_2605324A0();
      __swift_project_value_buffer(v33, (uint64_t)qword_26B3E87B0);
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_260532480();
      os_log_type_t v35 = sub_260532A00();
      id v59 = v34;
      if (os_log_type_enabled(v34, v35))
      {
        os_unfair_lock_t v54 = v30;
        id v55 = v5;
        id v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        char v63 = (void *)v37;
        *(_DWORD *)id v36 = 136446210;
        swift_bridgeObjectRetain();
        *(void *)&long long v65 = sub_2604E5DDC((uint64_t)v54, v32, (uint64_t *)&v63);
        sub_260532B60();
        swift_bridgeObjectRelease_n();
        id v38 = v59;
        _os_log_impl(&dword_260451000, v59, v35, "Failed to decode user activity with identifier %{public}s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261213230](v37, -1, -1);
        MEMORY[0x261213230](v36, -1, -1);
        sub_26047F0A0((uint64_t)v51, (unint64_t)v19);

        (*(void (**)(id, uint64_t))(v57 + 8))(v55, v58);
      }
      else
      {
        sub_26047F0A0((uint64_t)v51, (unint64_t)v19);
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v17);
      }
      uint64_t v39 = (uint64_t)v60;
      uint64_t v21 = (uint64_t)v67;
      *__int16 v67 = 0;
      goto LABEL_25;
    }
    v50[0] = v23;
    id v24 = objc_msgSend(v23, sel_userInfo);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = sub_260532640();

      unint64_t v61 = 0xD000000000000016;
      unint64_t v62 = 0x80000002605434A0;
      sub_260532C60();
      if (*(void *)(v26 + 16))
      {
        unint64_t v27 = sub_26047F3B0((uint64_t)&v63);
        uint64_t v28 = v51;
        if (v29)
        {
          sub_2604E64B0(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v65);
        }
        else
        {
          long long v65 = 0u;
          long long v66 = 0u;
        }
      }
      else
      {
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v28 = v51;
      }
      sub_260483AA8((uint64_t)&v63);
      swift_bridgeObjectRelease();
      if (*((void *)&v66 + 1))
      {
        id v59 = v19;
        uint64_t v40 = sub_26045B7D4((uint64_t)&v65, &qword_26A872A40);
LABEL_23:
        uint64_t v21 = (uint64_t)v67;
        *__int16 v67 = v50[0];
        MEMORY[0x270FA5388](v40);
        id v47 = v59;
        v50[-2] = v28;
        v50[-1] = v47;
        id v55 = v48;
        unint64_t v49 = v54;
        os_unfair_lock_lock(v54);
        sub_260524E10(v53);
        os_unfair_lock_unlock(v49);
        swift_release();

        (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v58);
        sub_26047F0A0((uint64_t)v51, (unint64_t)v47);
        goto LABEL_24;
      }
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v28 = v51;
    }
    sub_26045B7D4((uint64_t)&v65, &qword_26A872A40);
    LOBYTE(v63) = 2;
    uint64_t v40 = sub_260532DF0();
    uint64_t v42 = v41;
    id v59 = v19;
    if (v41)
    {
      uint64_t v43 = v40;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D38);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_260534390;
      char v63 = (void *)0xD000000000000016;
      unint64_t v64 = 0x80000002605434A0;
      uint64_t v45 = MEMORY[0x263F8D310];
      sub_260532C60();
      *(void *)(inited + 96) = v45;
      *(void *)(inited + 72) = v43;
      *(void *)(inited + 80) = v42;
      sub_26045E738(inited);
      unint64_t v46 = (void *)sub_260532630();
      swift_bridgeObjectRelease();
      objc_msgSend(v50[0], sel_addUserInfoEntriesFromDictionary_, v46);

      uint64_t v28 = v51;
    }
    goto LABEL_23;
  }
  (*(void (**)(char *, uint64_t))(v57 + 8))(v5, v17);
  swift_release();
  uint64_t v21 = (uint64_t)v67;
  *__int16 v67 = 0;
LABEL_24:
  uint64_t v39 = (uint64_t)v60;
LABEL_25:
  sub_260524D50(v21, v56);
  __swift_destroy_boxed_opaque_existential_1(v39);
  sub_260524DB4(v21);
}

void sub_26052430C(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_260524324(void *a1)
{
}

uint64_t IntelligenceUserActivity.description.getter()
{
  if (*v0)
  {
    id v1 = *v0;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    strcpy((char *)v4, "UserActivity(");
    HIWORD(v4[1]) = -4864;
    id v2 = objc_msgSend(v1, sel_description);
    sub_260532760();

    sub_260532840();
    swift_bridgeObjectRelease();
    sub_260532840();
    type metadata accessor for IntelligenceUserActivity();
    sub_260532280();
    sub_260532840();
    swift_bridgeObjectRelease();
    sub_260532840();
  }
  else
  {
    sub_260532CB0();
    swift_bridgeObjectRelease();
    v4[0] = 0xD00000000000001ELL;
    v4[1] = 0x80000002605434C0;
    type metadata accessor for IntelligenceUserActivity();
    sub_260532280();
    sub_260532840();
    swift_bridgeObjectRelease();
    sub_260532840();
  }
  return v4[0];
}

uint64_t static IntelligenceUserActivity.fetchCurrentUserActivity(completionHandler:)(void (*a1)(char *, void), uint64_t a2)
{
  unint64_t v3 = a1;
  if (MEMORY[0x263F84188])
  {
    uint64_t v37 = a1;
    uint64_t v4 = sub_2605322D0();
    os_log_type_t v35 = &v32;
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    MEMORY[0x270FA5388](v4);
    unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v8 = self;
    id v9 = objc_msgSend(v8, sel_currentUserActivityUUID);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D10);
    id v36 = &v32;
    __n128 v12 = MEMORY[0x270FA5388](v10 - 8);
    uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9)
    {
      id v33 = v8;
      uint64_t v34 = (char *)&v32 - v7;
      MEMORY[0x270FA5388](v11);
      uint64_t v15 = a2;
      uint64_t v16 = (char *)&v32 - v7;
      sub_2605322B0();

      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      unint64_t v18 = v16;
      uint64_t v19 = v15;
      v17(v14, v18, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) != 1)
      {
        uint64_t v20 = v34;
        v17(v34, v14, v4);
        uint64_t v21 = (void *)sub_260532290();
        id v36 = &v32;
        __n128 v22 = MEMORY[0x270FA5388](v21);
        id v23 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, char *, uint64_t, __n128))(v5 + 16))(v23, v20, v4, v22);
        unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v37;
        *(void *)(v25 + 24) = v19;
        v17((char *)(v25 + v24), v23, v4);
        aBlock[4] = sub_260524F40;
        aBlock[5] = v25;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_260524BEC;
        aBlock[3] = &block_descriptor_5;
        uint64_t v26 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v33, sel_fetchUserActivityWithUUID_completionHandler_, v21, v26);
        _Block_release(v26);

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v20, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v5 + 56))(v14, 1, 1, v4, v12);
    }
    sub_26045B7D4((uint64_t)v14, &qword_26A873D10);
    unint64_t v3 = v37;
  }
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  MEMORY[0x270FA5388](v28 - 8);
  os_signpost_id_t v30 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  v3(v30, 0);
  return sub_26045B7D4((uint64_t)v30, &qword_26B3E8BE8);
}

id sub_260524960(void *a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v13 = *(void *)(v12 - 8);
  __n128 v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (uint64_t *)((char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a2 || !a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v13 + 56))(v11, 1, 1, v12, v14);
    a3(v11, a2);
    return (id)sub_26045B7D4((uint64_t)v11, &qword_26B3E8BE8);
  }
  else
  {
    id v17 = a1;
    id v18 = objc_msgSend(v17, sel_parentUserActivity);
    if (v18
      || (id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D38]), sel_initWithInternalUserActivity_, v17),
          (id v18 = result) != 0))
    {
      uint64_t v20 = (char *)v16 + *(int *)(v12 + 20);
      uint64_t v21 = sub_2605322D0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, a5, v21);
      uint64_t v22 = *(int *)(v12 + 24);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A873D18);
      uint64_t v23 = swift_allocObject();
      *(_DWORD *)(v23 + 40) = 0;
      *(unsigned char *)(v23 + 16) = 0;
      *(_OWORD *)(v23 + 24) = xmmword_260536250;
      *(void *)((char *)v16 + v22) = v23;
      *uint64_t v16 = v18;
      sub_260524D50((uint64_t)v16, (uint64_t)v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
      id v24 = v18;
      a3(v11, 0);

      sub_26045B7D4((uint64_t)v11, &qword_26B3E8BE8);
      return (id)sub_260524DB4((uint64_t)v16);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_260524BEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_260524C78@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_260524C88(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_2605323F0();
  _os_signpost_emit_with_name_impl(&dword_260451000, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_260524D0C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2605322D0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_260524D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260524DB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_260524E10(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  sub_26047F048(v4, v3);
  uint64_t result = sub_26047F0A0(v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)a1 = 1;
  return result;
}

uint64_t sub_260524E74()
{
  uint64_t v1 = sub_2605322D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

id sub_260524F40(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_2605322D0() - 8);
  uint64_t v6 = *(void (**)(char *, uint64_t))(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_260524960(a1, a2, v6, v7, v8);
}

unint64_t sub_260524FC8()
{
  unint64_t result = qword_26A873D40;
  if (!qword_26A873D40)
  {
    type metadata accessor for IntelligenceUserActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873D40);
  }
  return result;
}

void **initializeBufferWithCopyOfBuffer for IntelligenceUserActivity(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2605322D0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    os_signpost_id_t v13 = v4;
    v12(v9, v10, v11);
    *(void **)((char *)v7 + *(int *)(a3 + 24)) = *(void **)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return v7;
}

uint64_t destroy for IntelligenceUserActivity(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2605322D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_release();
}

void **initializeWithCopy for IntelligenceUserActivity(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2605322D0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  *(void **)((char *)a1 + *(int *)(a3 + 24)) = *(void **)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

void **assignWithCopy for IntelligenceUserActivity(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_2605322D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void **)((char *)a1 + *(int *)(a3 + 24)) = *(void **)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for IntelligenceUserActivity(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2605322D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **assignWithTake for IntelligenceUserActivity(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2605322D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void **)((char *)a1 + *(int *)(a3 + 24)) = *(void **)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceUserActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260525464);
}

uint64_t sub_260525464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2605322D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for IntelligenceUserActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26052553C);
}

uint64_t sub_26052553C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2605322D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2605255FC()
{
  uint64_t result = sub_2605322D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for IntelligenceUserActivity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26052576CLL);
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

ValueMetadata *type metadata accessor for IntelligenceUserActivity.CodingKeys()
{
  return &type metadata for IntelligenceUserActivity.CodingKeys;
}

uint64_t destroy for IntelligenceUserActivity.EncodingState(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 >> 60 != 15) {
    return sub_260464128(*(void *)(result + 8), v1);
  }
  return result;
}

uint64_t _s21UIIntelligenceSupport24IntelligenceUserActivityV13EncodingStateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v3 = (uint64_t *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v3;
  }
  else
  {
    uint64_t v5 = *v3;
    sub_26047F048(*v3, *(void *)(a2 + 16));
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for IntelligenceUserActivity.EncodingState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v3 = (_OWORD *)(a1 + 8);
  unint64_t v4 = (uint64_t *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_26047F048(*v4, *(void *)(a2 + 16));
      uint64_t v8 = *(void *)(a1 + 8);
      unint64_t v9 = *(void *)(a1 + 16);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v5;
      sub_260464128(v8, v9);
      return a1;
    }
    sub_260497FA0(a1 + 8);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *int v3 = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_26047F048(*v4, *(void *)(a2 + 16));
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithTake for IntelligenceUserActivity.EncodingState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  unint64_t v5 = (void *)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = *v5;
      *(void *)(a1 + 16) = v7;
      sub_260464128(v8, v6);
      return a1;
    }
    sub_260497FA0(a1 + 8);
  }
  *unint64_t v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceUserActivity.EncodingState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceUserActivity.EncodingState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceUserActivity.EncodingState()
{
  return &type metadata for IntelligenceUserActivity.EncodingState;
}

unint64_t sub_260525A10()
{
  unint64_t result = qword_26A873D48;
  if (!qword_26A873D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873D48);
  }
  return result;
}

unint64_t sub_260525A68()
{
  unint64_t result = qword_26A873D50;
  if (!qword_26A873D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873D50);
  }
  return result;
}

unint64_t sub_260525AC0()
{
  unint64_t result = qword_26A873D58;
  if (!qword_26A873D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873D58);
  }
  return result;
}

uint64_t sub_260525B14()
{
  unint64_t v0 = sub_260532DC0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

id sub_260525B60()
{
  type metadata accessor for UIIntelligenceElementCollector();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A873D68 = (uint64_t)result;
  return result;
}

uint64_t static IntelligenceLocalizedStrings.snapshot(of:)()
{
  uint64_t v0 = sub_260532700();
  MEMORY[0x270FA5388](v0 - 8);
  sub_2605326F0();
  sub_2605326E0();
  sub_2605326D0();
  sub_2605326E0();
  uint64_t v1 = sub_260532720();
  MEMORY[0x270FA5388](v1 - 8);
  sub_260532710();
  if (qword_26A872168 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26A873D68;
  uint64_t v3 = sub_2605322F0();
  MEMORY[0x270FA5388](v3 - 8);
  id v4 = v2;
  sub_2605322E0();
  return sub_2605327A0();
}

uint64_t static IntelligenceLocalizedStrings.snapshot.getter()
{
  return sub_260525F54();
}

uint64_t static IntelligenceLocalizedStrings.image.getter()
{
  uint64_t v0 = sub_260532720();
  MEMORY[0x270FA5388](v0 - 8);
  sub_2605326C0();
  if (qword_26A872168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_26A873D68;
  uint64_t v2 = sub_2605322F0();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = v1;
  sub_2605322E0();
  return sub_2605327A0();
}

uint64_t static IntelligenceLocalizedStrings.document.getter()
{
  return sub_260525F54();
}

uint64_t sub_260525F54()
{
  uint64_t v0 = sub_260532720();
  MEMORY[0x270FA5388](v0 - 8);
  sub_2605326C0();
  if (qword_26A872168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_26A873D68;
  uint64_t v2 = sub_2605322F0();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = v1;
  sub_2605322E0();
  return sub_2605327A0();
}

ValueMetadata *type metadata accessor for IntelligenceLocalizedStrings()
{
  return &type metadata for IntelligenceLocalizedStrings;
}

uint64_t sub_2605260D0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_260526164()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MutableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Indirect()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_260526240()
{
  return swift_getWitnessTable();
}

uint64_t sub_260526288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + *(void *)(*(void *)a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, v5, a2);
}

uint64_t sub_26052631C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - v9;
  sub_260526288(v11, v12, (uint64_t)&v16 - v9);
  sub_260526288(a2, a3, (uint64_t)v7);
  char v13 = sub_2605326B0();
  __n128 v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v7, a3);
  v14(v10, a3);
  return v13 & 1;
}

uint64_t sub_260526448(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_26052631C(*a1, *a2, *(void *)(a3 + 16));
}

uint64_t sub_26052645C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260526288(v7, v8, (uint64_t)v6);
  sub_260532660();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a3);
}

uint64_t sub_260526540(uint64_t a1, uint64_t a2)
{
  sub_260533080();
  sub_26052645C((uint64_t)v5, a1, a2);
  return sub_2605330E0();
}

uint64_t sub_2605265A0(uint64_t a1)
{
  return sub_260526540(*v1, *(void *)(a1 + 16));
}

uint64_t sub_2605265B4(uint64_t a1, uint64_t a2)
{
  return sub_26052645C(a1, *v2, *(void *)(a2 + 16));
}

uint64_t sub_2605265C8(uint64_t a1, uint64_t a2)
{
  sub_260533080();
  sub_26052645C((uint64_t)v5, *v2, *(void *)(a2 + 16));
  return sub_2605330E0();
}

uint64_t sub_260526620(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEA00000000007265;
  unint64_t v3 = 0x696669746E656469;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000010;
    }
    else {
      unint64_t v5 = 0xD00000000000001BLL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000260540CB0;
    }
    else {
      unint64_t v6 = 0x8000000260540CD0;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x696669746E656469;
  unint64_t v6 = 0xEA00000000007265;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0xD000000000000010;
    }
    else {
      unint64_t v3 = 0xD00000000000001BLL;
    }
    if (v7 == 1) {
      unint64_t v2 = 0x8000000260540CB0;
    }
    else {
      unint64_t v2 = 0x8000000260540CD0;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_26052672C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA00000000006E65;
  uint64_t v3 = 0x6B6F547469647561;
  unint64_t v4 = 0xEA00000000006E65;
  uint64_t v5 = a1;
  unint64_t v6 = 0x6B6F547469647561;
  switch(v5)
  {
    case 1:
      unint64_t v4 = 0xE300000000000000;
      unint64_t v6 = 6580592;
      break;
    case 2:
      unint64_t v6 = 0x6973726576646970;
      unint64_t v4 = 0xEA00000000006E6FLL;
      break;
    case 3:
      unint64_t v4 = 0x80000002605408E0;
      unint64_t v6 = 0xD000000000000010;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE300000000000000;
      if (v6 == 6580592) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v3 = 0x6973726576646970;
      unint64_t v2 = 0xEA00000000006E6FLL;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0x80000002605408E0;
      if (v6 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v6 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2605268BC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x444965746F6D6572;
    }
    else {
      unint64_t v3 = 0xD000000000000014;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0x80000002605408B0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x444965746F6D6572;
      }
      else {
        unint64_t v6 = 0xD000000000000014;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0x80000002605408B0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    unint64_t v3 = 0x74736575716572;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x74736575716572)
  {
LABEL_21:
    char v8 = sub_260532FA0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2605269D8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000044;
  uint64_t v3 = 0x4974736575716572;
  uint64_t v4 = a1;
  unint64_t v5 = 0x4974736575716572;
  unint64_t v6 = 0xE900000000000044;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x444965746F6D6572;
      break;
    case 2:
      unint64_t v5 = 0x49737365636F7270;
      unint64_t v6 = 0xEB000000006F666ELL;
      break;
    case 3:
      unint64_t v6 = 0x80000002605408B0;
      unint64_t v5 = 0xD000000000000014;
      break;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x73746E656D656C65;
      break;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x73646E616D6D6F63;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x444965746F6D6572) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xEB000000006F666ELL;
      if (v5 != 0x49737365636F7270) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0x80000002605408B0;
      if (v5 != 0xD000000000000014) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x73746E656D656C65;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xE800000000000000;
      if (v5 != 0x73646E616D6D6F63) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260526C04(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x6974616E69676170;
    }
    else {
      unint64_t v3 = 0xD00000000000001BLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEE006F666E496E6FLL;
    }
    else {
      unint64_t v4 = 0x8000000260540BD0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x6974616E69676170;
      }
      else {
        unint64_t v6 = 0xD00000000000001BLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEE006F666E496E6FLL;
      }
      else {
        unint64_t v7 = 0x8000000260540BD0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    unint64_t v3 = 0x676E696B636162;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x676E696B636162)
  {
LABEL_21:
    char v8 = sub_260532FA0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260526D38(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746169636F737361;
  }
  else {
    uint64_t v3 = 0x546465646F636E65;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000657079;
  }
  else {
    unint64_t v4 = 0xEF65756C61566465;
  }
  if (a2) {
    uint64_t v5 = 0x746169636F737361;
  }
  else {
    uint64_t v5 = 0x546465646F636E65;
  }
  if (a2) {
    unint64_t v6 = 0xEF65756C61566465;
  }
  else {
    unint64_t v6 = 0xEB00000000657079;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260526DF4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE006F666E497373;
  unint64_t v3 = 0x65636F7250707061;
  uint64_t v4 = a1;
  unint64_t v5 = 0x65636F7250707061;
  unint64_t v6 = 0xEE006F666E497373;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000016;
      char v7 = "appCurrentUserActivity";
      goto LABEL_9;
    case 2:
      unint64_t v5 = 0x696669746E656469;
      unint64_t v6 = 0xEA00000000007265;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x6576697463417369;
      break;
    case 4:
      unint64_t v5 = 0x756C63634F6E6163;
      unint64_t v6 = 0xEA00000000006564;
      break;
    case 5:
      unint64_t v5 = 0x746F687370616E73;
      unint64_t v6 = 0xED00006567616D49;
      break;
    case 6:
      unint64_t v6 = 0x8000000260540D40;
      unint64_t v5 = 0xD000000000000015;
      break;
    case 7:
      unint64_t v5 = 0xD000000000000019;
      char v7 = "windowContentGeneratedPDF";
LABEL_9:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0xD000000000000016;
      char v8 = "appCurrentUserActivity";
      goto LABEL_18;
    case 2:
      unint64_t v3 = 0x696669746E656469;
      unint64_t v2 = 0xEA00000000007265;
      break;
    case 3:
      unint64_t v2 = 0xE800000000000000;
      unint64_t v3 = 0x6576697463417369;
      break;
    case 4:
      unint64_t v3 = 0x756C63634F6E6163;
      unint64_t v2 = 0xEA00000000006564;
      break;
    case 5:
      unint64_t v3 = 0x746F687370616E73;
      unint64_t v2 = 0xED00006567616D49;
      break;
    case 6:
      unint64_t v2 = 0x8000000260540D40;
      unint64_t v3 = 0xD000000000000015;
      break;
    case 7:
      unint64_t v3 = 0xD000000000000019;
      char v8 = "windowContentGeneratedPDF";
LABEL_18:
      unint64_t v2 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v9 = 1;
  }
  else {
    char v9 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_2605270B4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701869940;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1701869940;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x697463656E6E6F63;
      unint64_t v3 = 0xEE00657079546E6FLL;
      break;
    case 2:
      unint64_t v5 = 0x696669746E656469;
      unint64_t v3 = 0xEA00000000007265;
      break;
    case 3:
      unint64_t v3 = 0x8000000260540C90;
      unint64_t v5 = 0xD000000000000019;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEE00657079546E6FLL;
      if (v5 == 0x697463656E6E6F63) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 0x696669746E656469;
      unint64_t v6 = 0xEA00000000007265;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0x8000000260540C90;
      if (v5 == 0xD000000000000019) {
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
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_26052725C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6373654474786574;
    }
    else {
      uint64_t v3 = 0x6567616D69;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEF6E6F6974706972;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6373654474786574;
      }
      else {
        uint64_t v6 = 0x6567616D69;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEF6E6F6974706972;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1701667182;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1701667182)
  {
LABEL_21:
    char v8 = sub_260532FA0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260527378(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6C6562616CLL;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6C6562616CLL;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x74706D6F7270;
      break;
    case 2:
      uint64_t v5 = 0x54746E65746E6F63;
      unint64_t v3 = 0xEB00000000657079;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6572756365537369;
      break;
    case 4:
      uint64_t v5 = 0x657375636F467369;
      unint64_t v3 = 0xE900000000000064;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x74706D6F7270) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xEB00000000657079;
      if (v5 != 0x54746E65746E6F63) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x6572756365537369;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE900000000000064;
      if (v5 != 0x657375636F467369) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_26052754C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x676E696B636162;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x676E696B636162;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x656C626174696465;
      break;
    case 2:
      unint64_t v5 = 0x696D694C656E696CLL;
      unint64_t v3 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v5 = 0x61636E7572547369;
      unint64_t v3 = 0xEB00000000646574;
      break;
    case 4:
      unint64_t v3 = 0x8000000260540C40;
      unint64_t v5 = 0xD000000000000013;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x656C626174696465) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE900000000000074;
      if (v5 != 0x696D694C656E696CLL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 0x61636E7572547369;
      unint64_t v6 = 0xEB00000000646574;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0x8000000260540C40;
      if (v5 != 0xD000000000000013) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260527738(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6F4365746F6D6572;
  }
  else {
    uint64_t v3 = 0x49737365636F7270;
  }
  if (v2) {
    unint64_t v4 = 0xEB000000006F666ELL;
  }
  else {
    unint64_t v4 = 0xED0000747865746ELL;
  }
  if (a2) {
    uint64_t v5 = 0x6F4365746F6D6572;
  }
  else {
    uint64_t v5 = 0x49737365636F7270;
  }
  if (a2) {
    unint64_t v6 = 0xED0000747865746ELL;
  }
  else {
    unint64_t v6 = 0xEB000000006F666ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2605277F4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x676E696B636162;
  }
  else {
    uint64_t v3 = 0x6373654474786574;
  }
  if (v2) {
    unint64_t v4 = 0xEF6E6F6974706972;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x676E696B636162;
  }
  else {
    uint64_t v5 = 0x6373654474786574;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xEF6E6F6974706972;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2605278A8(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656761726F7473;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656761726F7473;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x676E69646E756F62;
      unint64_t v3 = 0xEB00000000786F42;
      break;
    case 2:
      uint64_t v5 = 0x746E65746E6F63;
      break;
    case 3:
      uint64_t v5 = 0x656D656C65627573;
      unint64_t v3 = 0xEB0000000073746ELL;
      break;
    case 4:
      uint64_t v5 = 0x6E6F697463617266;
      unint64_t v3 = 0xEF656C6269736956;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000786F42;
      if (v5 == 0x676E69646E756F62) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 0x746E65746E6F63) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 0x656D656C65627573;
      unint64_t v6 = 0xEB0000000073746ELL;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xEF656C6269736956;
      if (v5 != 0x6E6F697463617266) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260527AA4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xED00006874646957;
  unint64_t v3 = 0x6C6578695078616DLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6C6578695078616DLL;
  unint64_t v6 = 0xED00006874646957;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xEE00746867696548;
      break;
    case 2:
      unint64_t v6 = 0x8000000260540850;
      unint64_t v5 = 0xD00000000000001ELL;
      break;
    case 3:
      unint64_t v5 = 0xD00000000000001FLL;
      unint64_t v6 = 0x8000000260540870;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEE00746867696548;
      if (v5 == 0x6C6578695078616DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0x8000000260540850;
      unint64_t v3 = 0xD00000000000001ELL;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0x8000000260540870;
      if (v5 == 0xD00000000000001FLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260527C5C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1953393000;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1953393000;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x736E6F43657A6973;
      unint64_t v3 = 0xEF73746E69617274;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 6910052;
      break;
    case 3:
      unint64_t v3 = 0x80000002605407D0;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "lossyCompressionQuality";
      goto LABEL_7;
    case 5:
      unint64_t v5 = 0xD000000000000013;
      unint64_t v6 = "alwaysStripMetadata";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x736E6F43657A6973;
      unint64_t v7 = 0xEF73746E69617274;
      break;
    case 2:
      unint64_t v7 = 0xE300000000000000;
      unint64_t v2 = 6910052;
      break;
    case 3:
      unint64_t v7 = 0x80000002605407D0;
      unint64_t v2 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v2 = 0xD000000000000017;
      char v8 = "lossyCompressionQuality";
      goto LABEL_14;
    case 5:
      unint64_t v2 = 0xD000000000000013;
      char v8 = "alwaysStripMetadata";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_260527E5C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x656761726F7473;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0x80000002605407A0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x656761726F7473;
  }
  if (a2) {
    unint64_t v6 = 0x80000002605407A0;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260527F08(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x696669746E656469;
  }
  else {
    uint64_t v3 = 1701869940;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEA00000000007265;
  }
  if (a2) {
    uint64_t v5 = 0x696669746E656469;
  }
  else {
    uint64_t v5 = 1701869940;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000007265;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_260527FAC(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000016;
  unint64_t v3 = 0x8000000260540780;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 1701667182;
    }
    else {
      unint64_t v5 = 0x7475626972747461;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE400000000000000;
    }
    else {
      unint64_t v6 = 0xEA00000000007365;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x8000000260540780;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 1701667182;
    }
    else {
      unint64_t v2 = 0x7475626972747461;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xE400000000000000;
    }
    else {
      unint64_t v3 = 0xEA00000000007365;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_260532FA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2605280B4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB00000000657079;
  uint64_t v3 = 0x54746E65746E6F63;
  uint64_t v4 = a1;
  unint64_t v5 = 0x54746E65746E6F63;
  unint64_t v6 = 0xEB00000000657079;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x657A6953656C6966;
      break;
    case 2:
      unint64_t v5 = 0x6E6F697461657263;
      unint64_t v6 = 0xEC00000065746144;
      break;
    case 3:
      unint64_t v6 = 0x8000000260540760;
      unint64_t v5 = 0xD000000000000010;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x657A6953656C6966) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v3 = 0x6E6F697461657263;
      unint64_t v2 = 0xEC00000065746144;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0x8000000260540760;
      if (v5 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_260532FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_26052826C()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_26052837C()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605284E4()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605285C0()
{
  sub_260532810();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605286C8()
{
  return sub_2605330E0();
}

uint64_t sub_2605287B4()
{
  return sub_2605330E0();
}

uint64_t sub_2605288CC()
{
  return sub_2605330E0();
}

uint64_t sub_2605289C4()
{
  return sub_2605330E0();
}

uint64_t sub_260528AC8()
{
  return sub_2605330E0();
}

uint64_t sub_260528BAC()
{
  return sub_2605330E0();
}

uint64_t sub_260528D24()
{
  return sub_2605330E0();
}

uint64_t sub_260528E44()
{
  return sub_2605330E0();
}

uint64_t sub_260528F1C()
{
  return sub_2605330E0();
}

uint64_t IntelligenceElement.Window.appProcessInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(*(void *)v1 + *(void *)(**(void **)v1 + 88));
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  return sub_260481EE4(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_260529048@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v3;
  if (v3 == 1) {
    uint64_t v4 = swift_retain();
  }
  *a2 = v4;
  return sub_260531C20(v3);
}

uint64_t IntelligenceElement.Window.appBundleIdentifier.getter()
{
  uint64_t v1 = (uint64_t *)(*(void *)v0 + *(void *)(**(void **)v0 + 88));
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  if (v9 == 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v1[6];
  }
  sub_260481EE4(v2, v3, v4, v5, v6, v7, v8, v9);
  return v10;
}

uint64_t sub_260529114@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*(void *)a1 + *(void *)(**(void **)a1 + 88));
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  if (v11 == 1) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v3[6];
  }
  if (v11 == 1) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v3[7];
  }
  *a2 = v12;
  a2[1] = v13;
  return sub_260481EE4(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_260529190(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_260529290(v6);
  if (*(void *)(v3 + 56) != 1)
  {
    *(void *)(v3 + 48) = v2;
    *(void *)(v3 + 56) = v1;
  }
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(void *, void))v4)(v6, 0);
}

uint64_t IntelligenceElement.Window.appBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_260529290(v7);
  if (*(void *)(v4 + 56) != 1)
  {
    *(void *)(v4 + 48) = a1;
    *(void *)(v4 + 56) = a2;
  }
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(void *, void))v5)(v7, 0);
}

void (*sub_260529290(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[9] = v1;
  size_t v4 = *(void *)(*(void *)(_s6WindowV7StorageVMa() - 8) + 64);
  v3[10] = malloc(v4);
  v3[11] = malloc(v4);
  v3[12] = malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[13] = v5;
  uint64_t v6 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v6, (uint64_t)v5);
  return sub_260529374;
}

void sub_260529374(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 104);
  if (a2)
  {
    uint64_t v5 = v2[10];
    uint64_t v4 = v2[11];
    sub_26052DFFC(v3, v4);
    sub_26052DFFC(v4, v5);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v2[9];
    uint64_t v7 = v2[10];
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v9 = *(void *)v8 + *(void *)(**(void **)v8 + 88);
      swift_beginAccess();
      sub_26052E060(v7, v9);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
      uint64_t v14 = swift_allocObject();
      sub_26052E414(v7, v14 + *(void *)(*(void *)v14 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
      swift_release();
      *(void *)uint64_t v8 = v14;
    }
    uint64_t v16 = (void *)v2[12];
    uint64_t v15 = (void *)v2[13];
    id v18 = (void *)v2[10];
    id v17 = (void *)v2[11];
    sub_260530554((uint64_t)v17, (uint64_t (*)(void))_s6WindowV7StorageVMa);
  }
  else
  {
    sub_26052DFFC(v3, v2[12]);
    int v10 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = v2[12];
    uint64_t v12 = v2[9];
    if (v10)
    {
      uint64_t v13 = *(void *)v12 + *(void *)(**(void **)v12 + 88);
      swift_beginAccess();
      sub_26052E060(v11, v13);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
      uint64_t v19 = swift_allocObject();
      sub_26052E414(v11, v19 + *(void *)(*(void *)v19 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
      swift_release();
      *(void *)uint64_t v12 = v19;
    }
    uint64_t v16 = (void *)v2[12];
    uint64_t v15 = (void *)v2[13];
    id v18 = (void *)v2[10];
    id v17 = (void *)v2[11];
  }
  sub_260530554((uint64_t)v15, (uint64_t (*)(void))_s6WindowV7StorageVMa);
  free(v15);
  free(v16);
  free(v17);
  free(v18);

  free(v2);
}

void (*IntelligenceElement.Window.appBundleIdentifier.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = (uint64_t *)(*(void *)v1 + *(void *)(**(void **)v1 + 88));
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  uint64_t v9 = v4[4];
  uint64_t v10 = v4[5];
  uint64_t v11 = v4[6];
  uint64_t v12 = v4[7];
  if (v12 == 1) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v4[6];
  }
  if (v12 == 1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v4[7];
  }
  v3[7] = v13;
  v3[8] = v14;
  sub_260481EE4(v5, v6, v7, v8, v9, v10, v11, v12);
  return sub_260529674;
}

void sub_260529674(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[7];
  uint64_t v4 = (*a1)[8];
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_260529290(v2);
    if (*(void *)(v5 + 56) != 1)
    {
      *(void *)(v5 + 48) = v3;
      *(void *)(v5 + 56) = v4;
    }
    swift_bridgeObjectRelease();
    v6((uint64_t)v2, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_260529290(*a1);
    if (*(void *)(v7 + 56) != 1)
    {
      *(void *)(v7 + 48) = v3;
      *(void *)(v7 + 56) = v4;
    }
    swift_bridgeObjectRelease();
    v8((uint64_t)v2, 0);
  }

  free(v2);
}

uint64_t sub_26052974C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*(void *)a1 + *(void *)(**(void **)a1 + 88));
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  a2[6] = v10;
  a2[7] = v11;
  return sub_260481EE4(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_2605297C8(void *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  *(void *)&long long v9 = *a1;
  *((void *)&v9 + 1) = v1;
  uint64_t v10 = v2;
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  sub_260481EE4(v9, v1, v2, v3, v4, v5, v6, v7);
  return IntelligenceElement.Window.appProcessInfo.setter(&v9);
}

uint64_t IntelligenceElement.Window.appProcessInfo.setter(long long *a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v17 - v7);
  long long v9 = *a1;
  long long v18 = a1[1];
  long long v19 = v9;
  long long v17 = a1[2];
  uint64_t v10 = *((void *)a1 + 6);
  uint64_t v11 = *((void *)a1 + 7);
  uint64_t v12 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v12, (uint64_t)v8);
  sub_2604BF3D0(*v8, v8[1], v8[2], v8[3], v8[4], v8[5], v8[6], v8[7]);
  long long v13 = v18;
  *(_OWORD *)uint64_t v8 = v19;
  *((_OWORD *)v8 + 1) = v13;
  *((_OWORD *)v8 + 2) = v17;
  v8[6] = v10;
  v8[7] = v11;
  sub_26052DFFC((uint64_t)v8, (uint64_t)v5);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v14 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v5, v14);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v15 = swift_allocObject();
    sub_26052E414((uint64_t)v5, v15 + *(void *)(*(void *)v15 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v15;
  }
  return sub_260530554((uint64_t)v8, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.appProcessInfo.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = (uint64_t *)(*(void *)v1 + *(void *)(**(void **)v1 + 88));
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  uint64_t v9 = v4[4];
  uint64_t v10 = v4[5];
  uint64_t v11 = v4[6];
  uint64_t v12 = v4[7];
  *uint64_t v3 = *v4;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  v3[4] = v9;
  v3[5] = v10;
  v3[6] = v11;
  v3[7] = v12;
  sub_260481EE4(v5, v6, v7, v8, v9, v10, v11, v12);
  return sub_260529AC0;
}

void sub_260529AC0(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = **a1;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  *(void *)&long long v12 = v4;
  *((void *)&v12 + 1) = v5;
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  uint64_t v17 = v10;
  uint64_t v18 = v11;
  if (a2)
  {
    sub_260481EE4(v4, v5, v6, v7, v8, v9, v10, v11);
    IntelligenceElement.Window.appProcessInfo.setter(&v12);
    sub_2604BF3D0(*v3, v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
  }
  else
  {
    IntelligenceElement.Window.appProcessInfo.setter(&v12);
  }

  free(v3);
}

uint64_t IntelligenceElement.Window.appCurrentUserActivity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  return sub_260467B94(v3 + *(int *)(v4 + 20), a1, &qword_26B3E8BE8);
}

uint64_t sub_260529BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  return sub_260467B94(v3 + *(int *)(v4 + 20), a2, &qword_26B3E8BE8);
}

uint64_t IntelligenceElement.Window.appCurrentUserActivity.setter(uint64_t a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v10, (uint64_t)v9);
  sub_26049621C(a1, (uint64_t)&v9[*(int *)(v4 + 28)], &qword_26B3E8BE8);
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v11);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v12 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v12 + *(void *)(*(void *)v12 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v12;
  }
  sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
  return sub_26045B7D4(a1, &qword_26B3E8BE8);
}

void (*IntelligenceElement.Window.appCurrentUserActivity.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8) - 8) + 64);
  v3[4] = malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[5] = v5;
  uint64_t v6 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v7 = _s6WindowV7StorageVMa();
  sub_260467B94(v6 + *(int *)(v7 + 20), (uint64_t)v5, &qword_26B3E8BE8);
  return sub_260529F1C;
}

void sub_260529F1C(uint64_t a1, char a2)
{
}

uint64_t IntelligenceElement.Window.identifier.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + *(int *)(_s6WindowV7StorageVMa() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_260529FB4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  size_t v4 = (void *)(v3 + *(int *)(_s6WindowV7StorageVMa() + 24));
  uint64_t v5 = v4[1];
  *a2 = *v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceElement.Window.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = _s6WindowV7StorageVMa();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v17[-v10];
  uint64_t v12 = *(void *)v2 + *(void *)(**(void **)v2 + 88);
  swift_beginAccess();
  sub_26052DFFC(v12, (uint64_t)v11);
  uint64_t v13 = &v11[*(int *)(v6 + 32)];
  swift_bridgeObjectRelease();
  *uint64_t v13 = a1;
  v13[1] = a2;
  sub_26052DFFC((uint64_t)v11, (uint64_t)v8);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v14 = *(void *)v2 + *(void *)(**(void **)v2 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v8, v14);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v15 = swift_allocObject();
    sub_26052E414((uint64_t)v8, v15 + *(void *)(*(void *)v15 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v2 = v15;
  }
  return sub_260530554((uint64_t)v11, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.identifier.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v5 = (void *)(v4 + *(int *)(_s6WindowV7StorageVMa() + 24));
  uint64_t v6 = v5[1];
  v3[3] = *v5;
  v3[4] = v6;
  swift_bridgeObjectRetain();
  return sub_26052A2A4;
}

void sub_26052A2A4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    swift_bridgeObjectRetain();
    IntelligenceElement.Window.identifier.setter(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    IntelligenceElement.Window.identifier.setter(*(void *)(*(void *)a1 + 24), v4);
  }

  free(v2);
}

uint64_t IntelligenceElement.Window.isActive.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + *(int *)(_s6WindowV7StorageVMa() + 28));
}

uint64_t sub_26052A380@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t result = _s6WindowV7StorageVMa();
  *a2 = *(unsigned char *)(v3 + *(int *)(result + 28));
  return result;
}

uint64_t IntelligenceElement.Window.isActive.setter(char a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v10, (uint64_t)v9);
  v9[*(int *)(v4 + 36)] = a1;
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v11);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v12 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v12 + *(void *)(*(void *)v12 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v12;
  }
  return sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.isActive.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v4 + *(int *)(_s6WindowV7StorageVMa() + 28));
  return sub_26052A644;
}

void sub_26052A644(uint64_t a1, uint64_t a2)
{
}

uint64_t IntelligenceElement.Window.canOcclude.getter()
{
  uint64_t v1 = *(void *)v0 + *(void *)(**(void **)v0 + 88);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + *(int *)(_s6WindowV7StorageVMa() + 32));
}

uint64_t sub_26052A6C0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t result = _s6WindowV7StorageVMa();
  *a2 = *(unsigned char *)(v3 + *(int *)(result + 32));
  return result;
}

uint64_t IntelligenceElement.Window.canOcclude.setter(char a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v10, (uint64_t)v9);
  v9[*(int *)(v4 + 40)] = a1;
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v11);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v12 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v12 + *(void *)(*(void *)v12 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v12;
  }
  return sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.canOcclude.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v4 + *(int *)(_s6WindowV7StorageVMa() + 32));
  return sub_26052A984;
}

void sub_26052A984(uint64_t a1, uint64_t a2)
{
}

void sub_26052A99C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3 = *(void **)a1;
  a3(*(unsigned __int8 *)(*(void *)a1 + 32));

  free(v3);
}

uint64_t IntelligenceElement.Window.snapshotImage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  return sub_260467B94(v3 + *(int *)(v4 + 36), a1, &qword_26B3E8AD8);
}

uint64_t sub_26052AA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  return sub_260467B94(v3 + *(int *)(v4 + 36), a2, &qword_26B3E8AD8);
}

uint64_t sub_26052AAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260467B94(a1, (uint64_t)v11, a5);
  return a6(v11);
}

uint64_t IntelligenceElement.Window.snapshotImage.setter(uint64_t a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v10, (uint64_t)v9);
  sub_26049621C(a1, (uint64_t)&v9[*(int *)(v4 + 44)], &qword_26B3E8AD8);
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v11 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v11);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v12 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v12 + *(void *)(*(void *)v12 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v12;
  }
  sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
  return sub_26045B7D4(a1, &qword_26B3E8AD8);
}

void (*IntelligenceElement.Window.snapshotImage.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8) - 8) + 64);
  v3[4] = malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[5] = v5;
  uint64_t v6 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v7 = _s6WindowV7StorageVMa();
  sub_260467B94(v6 + *(int *)(v7 + 36), (uint64_t)v5, &qword_26B3E8AD8);
  return sub_26052AE3C;
}

void sub_26052AE3C(uint64_t a1, char a2)
{
}

void sub_26052AE5C(uint64_t a1, char a2, void (*a3)(void *), uint64_t *a4)
{
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)(*(void *)a1 + 32);
  uint64_t v7 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    sub_260467B94(*(void *)(*(void *)a1 + 40), (uint64_t)v6, a4);
    a3(v6);
    sub_26045B7D4((uint64_t)v7, a4);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 40));
  }
  free(v7);
  free(v6);

  free(v5);
}

void *IntelligenceElement.Window.snapshotConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  sub_26052E0C4(v3 + *(int *)(v4 + 40), (uint64_t)v6);
  sub_26052E0C4((uint64_t)v6, a1);
  return sub_26052E1A8(v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E12C);
}

void *sub_26052AF9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = _s6WindowV7StorageVMa();
  sub_26052E0C4(v3 + *(int *)(v4 + 40), (uint64_t)v6);
  sub_26052E0C4((uint64_t)v6, a2);
  return sub_26052E1A8(v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E12C);
}

uint64_t sub_26052B03C(uint64_t a1)
{
  sub_26052E0C4(a1, (uint64_t)v3);
  sub_26052E0C4((uint64_t)v3, (uint64_t)v2);
  sub_26052E1A8(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E12C);
  return IntelligenceElement.Window.snapshotConfiguration.setter((uint64_t)v2);
}

uint64_t IntelligenceElement.Window.snapshotConfiguration.setter(uint64_t a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v15[-v8];
  sub_26052E0C4(a1, (uint64_t)v16);
  uint64_t v10 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v10, (uint64_t)v9);
  uint64_t v11 = (uint64_t)&v9[*(int *)(v4 + 48)];
  sub_26052E0C4(v11, (uint64_t)v17);
  sub_26052E1A8(v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E224);
  sub_26052E0C4((uint64_t)v16, v11);
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v12 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v12);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v13 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v13 + *(void *)(*(void *)v13 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v13;
  }
  return sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.snapshotConfiguration.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x4D0uLL);
  *a1 = v3;
  v3[153] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v5 = _s6WindowV7StorageVMa();
  sub_26052E0C4(v4 + *(int *)(v5 + 40), (uint64_t)v3);
  sub_26052E0C4((uint64_t)v3, (uint64_t)(v3 + 30));
  sub_26052E1A8(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E12C);
  return sub_26052B370;
}

void sub_26052B370(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t)*a1 + 240;
  uint64_t v4 = (char *)*a1 + 480;
  uint64_t v5 = (char *)*a1 + 720;
  if (a2)
  {
    sub_26052E0C4((uint64_t)*a1 + 240, (uint64_t)v5);
    sub_26052E0C4((uint64_t)v5, (uint64_t)v2 + 960);
    sub_26052E1A8(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E12C);
    IntelligenceElement.Window.snapshotConfiguration.setter((uint64_t)v2 + 960);
    sub_26052E0C4(v3, (uint64_t)v4);
    sub_26052E1A8(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E224);
  }
  else
  {
    sub_26052E0C4((uint64_t)*a1 + 240, (uint64_t)v5);
    sub_26052E0C4((uint64_t)v5, (uint64_t)v4);
    IntelligenceElement.Window.snapshotConfiguration.setter((uint64_t)v4);
  }

  free(v2);
}

uint64_t IntelligenceElement.Window.windowContentGeneratedPDF.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(_s6WindowV7StorageVMa() + 44);
  char v5 = *(unsigned char *)(v4 + 8);
  *(void *)a1 = *(void *)v4;
  *(unsigned char *)(a1 + 8) = v5;
  return j__swift_retain();
}

uint64_t sub_26052B4D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(_s6WindowV7StorageVMa() + 44);
  char v5 = *(unsigned char *)(v4 + 8);
  *(void *)a2 = *(void *)v4;
  *(unsigned char *)(a2 + 8) = v5;
  return j__swift_retain();
}

uint64_t IntelligenceElement.Window.windowContentGeneratedPDF.setter(uint64_t *a1)
{
  uint64_t v3 = _s6WindowV7StorageVMa();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = *a1;
  char v11 = *((unsigned char *)a1 + 8);
  uint64_t v12 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  sub_26052DFFC(v12, (uint64_t)v9);
  uint64_t v13 = &v9[*(int *)(v4 + 52)];
  j__swift_release();
  *(void *)uint64_t v13 = v10;
  v13[8] = v11;
  sub_26052DFFC((uint64_t)v9, (uint64_t)v6);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v14 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
    swift_beginAccess();
    sub_26052E060((uint64_t)v6, v14);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v15 = swift_allocObject();
    sub_26052E414((uint64_t)v6, v15 + *(void *)(*(void *)v15 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    swift_release();
    *(void *)uint64_t v1 = v15;
  }
  return sub_260530554((uint64_t)v9, (uint64_t (*)(void))_s6WindowV7StorageVMa);
}

void (*IntelligenceElement.Window.windowContentGeneratedPDF.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  uint64_t v4 = *(void *)v1 + *(void *)(**(void **)v1 + 88);
  swift_beginAccess();
  uint64_t v5 = v4 + *(int *)(_s6WindowV7StorageVMa() + 44);
  char v6 = *(unsigned char *)(v5 + 8);
  v3[3] = *(void *)v5;
  *((unsigned char *)v3 + 32) = v6;
  j__swift_retain();
  return sub_26052B7DC;
}

void sub_26052B7DC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  char v4 = *(unsigned char *)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 24);
  char v6 = v4;
  if (a2)
  {
    j__swift_retain();
    IntelligenceElement.Window.windowContentGeneratedPDF.setter(&v5);
    j__swift_release();
  }
  else
  {
    IntelligenceElement.Window.windowContentGeneratedPDF.setter(&v5);
  }

  free(v3);
}

uint64_t IntelligenceElement.Window.init(identifier:isActive:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = _s6WindowV7StorageVMa();
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v11[v9[7]];
  uint64_t v13 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = &v11[v9[11]];
  uint64_t v15 = type metadata accessor for IntelligenceImage(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_26052E2A8(v20);
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *(_OWORD *)char v11 = 0u;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 7) = 1;
  uint64_t v16 = &v11[v9[8]];
  *(void *)uint64_t v16 = a1;
  *((void *)v16 + 1) = a2;
  v11[v9[9]] = a3;
  v11[v9[10]] = 1;
  sub_26052E0C4((uint64_t)v20, (uint64_t)&v11[v9[12]]);
  uint64_t v17 = &v11[v9[13]];
  *(void *)uint64_t v17 = 0;
  v17[8] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
  uint64_t v18 = swift_allocObject();
  uint64_t result = sub_26052E414((uint64_t)v11, v18 + *(void *)(*(void *)v18 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
  *a4 = v18;
  return result;
}

uint64_t IntelligenceElement.Window.init(appProcessInfo:identifier:isActive:canOcclude:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t *a6@<X8>)
{
  uint64_t v12 = _s6WindowV7StorageVMa();
  uint64_t v13 = (int *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v29 = *a1;
  long long v28 = a1[1];
  long long v27 = a1[2];
  uint64_t v16 = *((void *)a1 + 6);
  uint64_t v17 = *((void *)a1 + 7);
  uint64_t v18 = &v15[v13[7]];
  uint64_t v19 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  uint64_t v20 = &v15[v13[11]];
  uint64_t v21 = type metadata accessor for IntelligenceImage(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_26052E2A8(v30);
  long long v22 = v28;
  *(_OWORD *)uint64_t v15 = v29;
  *((_OWORD *)v15 + 1) = v22;
  *((_OWORD *)v15 + 2) = v27;
  *((void *)v15 + 6) = v16;
  *((void *)v15 + 7) = v17;
  uint64_t v23 = &v15[v13[8]];
  *(void *)uint64_t v23 = a2;
  *((void *)v23 + 1) = a3;
  v15[v13[9]] = a4;
  v15[v13[10]] = a5;
  sub_26052E0C4((uint64_t)v30, (uint64_t)&v15[v13[12]]);
  id v24 = &v15[v13[13]];
  *(void *)id v24 = 0;
  v24[8] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
  uint64_t v25 = swift_allocObject();
  uint64_t result = sub_26052E414((uint64_t)v15, v25 + *(void *)(*(void *)v25 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
  *a6 = v25;
  return result;
}

uint64_t IntelligenceElement.Window.init(appBundleIdentifier:identifier:isActive:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t *a6@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v11 = _s6WindowV7StorageVMa();
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v26[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = &v14[v12[7]];
  uint64_t v16 = type metadata accessor for IntelligenceUserActivity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = &v14[v12[11]];
  uint64_t v18 = type metadata accessor for IntelligenceImage(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_26052E2A8(v27);
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *(_OWORD *)uint64_t v14 = 0u;
  *((void *)v14 + 6) = 0;
  *((void *)v14 + 7) = 1;
  uint64_t v19 = &v14[v12[8]];
  *(void *)uint64_t v19 = a3;
  *((void *)v19 + 1) = a4;
  v14[v12[9]] = a5;
  v14[v12[10]] = 1;
  sub_26052E0C4((uint64_t)v27, (uint64_t)&v14[v12[12]]);
  uint64_t v20 = &v14[v12[13]];
  *(void *)uint64_t v20 = 0;
  v20[8] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
  uint64_t v21 = swift_allocObject();
  sub_26052E414((uint64_t)v14, v21 + *(void *)(*(void *)v21 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
  *a6 = v21;
  uint64_t v23 = sub_260529290(v26);
  if (*(void *)(v22 + 56) != 1)
  {
    *(void *)(v22 + 48) = v25;
    *(void *)(v22 + 56) = a2;
  }
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(void *, void))v23)(v26, 0);
}

unint64_t sub_26052BE7C(char a1)
{
  unint64_t result = 0x65636F7250707061;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x696669746E656469;
      break;
    case 3:
      unint64_t result = 0x6576697463417369;
      break;
    case 4:
      unint64_t result = 0x756C63634F6E6163;
      break;
    case 5:
      unint64_t result = 0x746F687370616E73;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_26052BFB0(char a1)
{
  unint64_t result = 0x65636F7250707061;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x696669746E656469;
      break;
    case 3:
      unint64_t result = 0x6576697463417369;
      break;
    case 4:
      unint64_t result = 0x756C63634F6E6163;
      break;
    case 5:
      unint64_t result = 0x746F687370616E73;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26052C0E8(unsigned __int8 *a1, char *a2)
{
  return sub_260526DF4(*a1, *a2);
}

uint64_t sub_26052C0F4()
{
  return sub_260528BAC();
}

uint64_t sub_26052C100()
{
  return sub_26052837C();
}

uint64_t sub_26052C108()
{
  return sub_260528BAC();
}

uint64_t sub_26052C110@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260531BD4();
  *a1 = result;
  return result;
}

unint64_t sub_26052C140@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_26052BE7C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_26052C16C()
{
  return sub_26052BFB0(*v0);
}

uint64_t sub_26052C174@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260531BD4();
  *a1 = result;
  return result;
}

void sub_26052C19C(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_26052C1A8(uint64_t a1)
{
  unint64_t v2 = sub_26052E2D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26052C1E4(uint64_t a1)
{
  unint64_t v2 = sub_26052E2D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void IntelligenceElement.Window.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
  MEMORY[0x270FA5388](v3 - 8);
  id v24 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v25 = (uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A872060);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26052E2D0();
  sub_260533120();
  uint64_t v12 = (_OWORD *)(v11 + *(void *)(*(void *)v11 + 88));
  uint64_t v13 = v7;
  swift_beginAccess();
  long long v14 = v12[1];
  long long v15 = v12[2];
  long long v16 = v12[3];
  v29[0] = *v12;
  v29[1] = v14;
  v29[2] = v15;
  v29[3] = v16;
  LOBYTE(v28[0]) = 0;
  sub_2604693C8();
  uint64_t v17 = v31;
  sub_260532EF0();
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    uint64_t v18 = (int *)_s6WindowV7StorageVMa();
    uint64_t v19 = v25;
    sub_260467B94((uint64_t)v12 + v18[5], v25, &qword_26B3E8BE8);
    LOBYTE(v29[0]) = 1;
    type metadata accessor for IntelligenceUserActivity();
    sub_26052E378(&qword_26A8720B8, (void (*)(uint64_t))type metadata accessor for IntelligenceUserActivity);
    sub_260532EF0();
    sub_26045B7D4(v19, &qword_26B3E8BE8);
    LOBYTE(v29[0]) = 2;
    swift_bridgeObjectRetain();
    sub_260532ED0();
    swift_bridgeObjectRelease();
    if (*((unsigned char *)v12 + v18[7]) == 1)
    {
      LOBYTE(v29[0]) = 3;
      sub_260532F10();
    }
    uint64_t v20 = (uint64_t)v24;
    if ((*((unsigned char *)v12 + v18[8]) & 1) == 0)
    {
      LOBYTE(v29[0]) = 4;
      sub_260532F10();
    }
    sub_260467B94((uint64_t)v12 + v18[9], v20, &qword_26B3E8AD8);
    char v30 = 5;
    type metadata accessor for IntelligenceImage(0);
    sub_26052E378((unint64_t *)&unk_26A872080, (void (*)(uint64_t))type metadata accessor for IntelligenceImage);
    sub_260532EF0();
    sub_26045B7D4(v20, &qword_26B3E8AD8);
    sub_26052E0C4((uint64_t)v12 + v18[10], (uint64_t)v29);
    sub_26052E0C4((uint64_t)v29, (uint64_t)v28);
    LOBYTE(v27) = 6;
    sub_26052E324();
    sub_260532EF0();
    uint64_t v21 = v10;
    uint64_t v22 = (char *)v12 + v18[11];
    uint64_t v23 = *(os_unfair_lock_s **)v22;
    if (v22[8])
    {
      j__swift_retain();
      j__swift_retain();
      os_unfair_lock_lock(v23 + 18);
      sub_260529048((uint64_t)&v23[4], v28);
      os_unfair_lock_unlock(v23 + 18);
      swift_release();
      j__swift_release();
      uint64_t v23 = (os_unfair_lock_s *)v28[0];
    }
    else
    {
      j__swift_retain();
    }
    long long v27 = v23;
    char v26 = 7;
    sub_2604FF594();
    sub_260532EF0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v21, v13);
  }
}

uint64_t IntelligenceElement.Window.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v73 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v74 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s6WindowV7StorageVMa();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A871B48);
  uint64_t v75 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  long long v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  char v78 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_26052E2D0();
  char v76 = v15;
  uint64_t v17 = v92;
  sub_260533100();
  if (v17)
  {
    uint64_t v25 = (uint64_t)v78;
  }
  else
  {
    char v71 = (int *)v8;
    uint64_t v92 = v7;
    char v70 = v10;
    char v72 = v13;
    v84[0] = 0;
    sub_260469470();
    sub_260532E30();
    uint64_t v18 = *((void *)&v85 + 1);
    uint64_t v19 = v86;
    uint64_t v20 = v87;
    uint64_t v21 = v88;
    uint64_t v67 = v85;
    uint64_t v68 = v89;
    uint64_t v22 = v90;
    uint64_t v69 = v91;
    LOBYTE(v85) = 2;
    uint64_t v61 = sub_260532DF0();
    uint64_t v62 = v23;
    uint64_t v63 = v19;
    uint64_t v64 = v18;
    uint64_t v65 = v20;
    uint64_t v66 = v21;
    LOBYTE(v85) = 3;
    LOBYTE(v19) = sub_260532E00();
    LOBYTE(v85) = 4;
    int v24 = sub_260532E00();
    uint64_t v60 = v22;
    int v58 = (v24 == 2) | v24;
    int v59 = v19 & 1;
    long long v27 = v71;
    uint64_t v28 = v63;
    long long v29 = v72;
    uint64_t v30 = (uint64_t)v72 + v71[5];
    uint64_t v31 = type metadata accessor for IntelligenceUserActivity();
    uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56);
    uint64_t v57 = v30;
    v32(v30, 1, 1, v31);
    id v33 = (char *)v29 + v27[9];
    uint64_t v34 = type metadata accessor for IntelligenceImage(0);
    os_log_type_t v35 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
    uint64_t v55 = (uint64_t)v33;
    uint64_t v56 = v34;
    v35(v33, 1, 1);
    sub_26052E2A8(&v85);
    uint64_t v36 = v64;
    *long long v29 = v67;
    v29[1] = v36;
    uint64_t v37 = v65;
    v29[2] = v28;
    v29[3] = v37;
    uint64_t v38 = v68;
    v29[4] = v66;
    v29[5] = v38;
    uint64_t v39 = v61;
    uint64_t v40 = v69;
    v29[6] = v60;
    v29[7] = v40;
    uint64_t v41 = (void *)((char *)v29 + v27[6]);
    uint64_t v42 = v62;
    *uint64_t v41 = v39;
    v41[1] = v42;
    *((unsigned char *)v29 + v27[7]) = v59;
    *((unsigned char *)v29 + v27[8]) = v58 & 1;
    uint64_t v43 = (uint64_t)v29 + v27[10];
    sub_26052E0C4((uint64_t)&v85, v43);
    uint64_t v44 = (char *)v29 + v27[11];
    *(void *)uint64_t v44 = 0;
    v44[8] = 0;
    v84[0] = 1;
    sub_26052E378(&qword_26A871C98, (void (*)(uint64_t))type metadata accessor for IntelligenceUserActivity);
    uint64_t v45 = (uint64_t)v92;
    sub_260532E30();
    uint64_t v46 = v55;
    sub_26046405C(v45, v57, &qword_26B3E8BE8);
    v84[0] = 5;
    sub_26052E378(&qword_26A871C60, (void (*)(uint64_t))type metadata accessor for IntelligenceImage);
    uint64_t v47 = (uint64_t)v74;
    sub_260532E30();
    sub_26046405C(v47, v46, &qword_26B3E8AD8);
    char v83 = 6;
    sub_26052E3C0();
    uint64_t v48 = v77;
    sub_260532E30();
    sub_26052E0C4((uint64_t)v84, (uint64_t)v81);
    sub_26052E0C4(v43, (uint64_t)v82);
    sub_26052E1A8(v82, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_26052E224);
    sub_26052E0C4((uint64_t)v81, v43);
    char v79 = 7;
    sub_2604FF888();
    unint64_t v49 = v76;
    sub_260532E30();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v49, v48);
    uint64_t v50 = v80;
    uint64_t v51 = (uint64_t)v78;
    if (v80)
    {
      j__swift_release();
      *(void *)uint64_t v44 = v50;
      v44[8] = 0;
    }
    uint64_t v52 = (uint64_t)v70;
    sub_26052DFFC((uint64_t)v29, (uint64_t)v70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AB0);
    uint64_t v53 = swift_allocObject();
    sub_26052E414(v52, v53 + *(void *)(*(void *)v53 + 88), (uint64_t (*)(void))_s6WindowV7StorageVMa);
    sub_260530554((uint64_t)v29, (uint64_t (*)(void))_s6WindowV7StorageVMa);
    *char v73 = v53;
    uint64_t v25 = v51;
  }
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

uint64_t sub_26052CF9C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return IntelligenceElement.Window.init(from:)(a1, a2);
}

void sub_26052CFB4(void *a1)
{
}

uint64_t IntelligenceElement.Window.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for IntelligenceImage(0);
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v70 = (uint64_t)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v68 = *(void *)(v9 - 8);
  uint64_t v69 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v71 = (uint64_t)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)(*(void *)v0 + *(void *)(**(void **)v0 + 88));
  swift_beginAccess();
  uint64_t v12 = v11[7];
  if (v12 == 1)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v65 = v3;
    uint64_t v67 = v6;
    uint64_t v14 = v11[5];
    uint64_t v15 = v11[6];
    uint64_t v17 = v11[3];
    uint64_t v16 = v11[4];
    uint64_t v18 = v11[1];
    uint64_t v19 = v11[2];
    uint64_t v66 = v11;
    uint64_t v20 = *v11;
    uint64_t v80 = 0x203A707061;
    unint64_t v81 = 0xE500000000000000;
    v74[0] = v20;
    v74[1] = v18;
    v74[2] = v19;
    v74[3] = v17;
    char v75 = v16 & 1;
    int v76 = HIDWORD(v16);
    int v77 = v14;
    uint64_t v78 = v15;
    uint64_t v79 = v12;
    sub_260481EE4(v20, v18, v19, v17, v16, v14, v15, v12);
    IntelligenceProcessInfo.description.getter();
    sub_260532840();
    swift_bridgeObjectRelease();
    sub_2604BF3D0(v20, v18, v19, v17, v16, v14, v15, v12);
    uint64_t v21 = v80;
    unint64_t v22 = v81;
    uint64_t v13 = sub_260457640(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v24 = v13[2];
    unint64_t v23 = v13[3];
    if (v24 >= v23 >> 1) {
      uint64_t v13 = sub_260457640((void *)(v23 > 1), v24 + 1, 1, v13);
    }
    v13[2] = v24 + 1;
    uint64_t v25 = &v13[2 * v24];
    unsigned char v25[4] = v21;
    v25[5] = v22;
    uint64_t v6 = v67;
    uint64_t v11 = v66;
    uint64_t v3 = v65;
  }
  char v26 = (int *)_s6WindowV7StorageVMa();
  long long v27 = (uint64_t *)((char *)v11 + v26[6]);
  unint64_t v28 = v27[1];
  if (v28)
  {
    uint64_t v29 = *v27;
    uint64_t v30 = HIBYTE(v28) & 0xF;
    if ((v28 & 0x2000000000000000) == 0) {
      uint64_t v30 = v29 & 0xFFFFFFFFFFFFLL;
    }
    if (v30)
    {
      v74[0] = 0;
      v74[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_260532CB0();
      swift_bridgeObjectRelease();
      strcpy((char *)v74, "identifier: \"");
      HIWORD(v74[1]) = -4864;
      sub_260532840();
      swift_bridgeObjectRelease();
      sub_260532840();
      uint64_t v31 = v74[0];
      uint64_t v32 = v74[1];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v13 = sub_260457640(0, v13[2] + 1, 1, v13);
      }
      unint64_t v34 = v13[2];
      unint64_t v33 = v13[3];
      if (v34 >= v33 >> 1) {
        uint64_t v13 = sub_260457640((void *)(v33 > 1), v34 + 1, 1, v13);
      }
      v13[2] = v34 + 1;
      os_log_type_t v35 = &v13[2 * v34];
      v35[4] = v31;
      void v35[5] = v32;
    }
  }
  strcpy((char *)v74, "isActive: ");
  BYTE3(v74[1]) = 0;
  HIDWORD(v74[1]) = -369098752;
  sub_260532840();
  swift_bridgeObjectRelease();
  uint64_t v36 = v74[0];
  uint64_t v37 = v74[1];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_260457640(0, v13[2] + 1, 1, v13);
  }
  unint64_t v39 = v13[2];
  unint64_t v38 = v13[3];
  if (v39 >= v38 >> 1) {
    uint64_t v13 = sub_260457640((void *)(v38 > 1), v39 + 1, 1, v13);
  }
  v13[2] = v39 + 1;
  uint64_t v40 = &v13[2 * v39];
  v40[4] = v36;
  v40[5] = v37;
  if ((*((unsigned char *)v11 + v26[8]) & 1) == 0)
  {
    strcpy((char *)v74, "canOcclude: ");
    BYTE5(v74[1]) = 0;
    HIWORD(v74[1]) = -5120;
    sub_260532840();
    uint64_t v41 = v74[0];
    uint64_t v42 = v74[1];
    unint64_t v44 = v13[2];
    unint64_t v43 = v13[3];
    if (v44 >= v43 >> 1) {
      uint64_t v13 = sub_260457640((void *)(v43 > 1), v44 + 1, 1, v13);
    }
    v13[2] = v44 + 1;
    uint64_t v45 = &v13[2 * v44];
    v45[4] = v41;
    v45[5] = v42;
  }
  uint64_t v46 = v70;
  sub_260467B94((uint64_t)v11 + v26[5], v70, &qword_26B3E8BE8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v46, 1, v69) == 1)
  {
    sub_26045B7D4(v46, &qword_26B3E8BE8);
  }
  else
  {
    sub_26052E414(v46, v71, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
    v74[0] = 0;
    v74[1] = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    v74[0] = 0xD000000000000018;
    v74[1] = 0x80000002605438B0;
    IntelligenceUserActivity.description.getter();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v47 = v74[0];
    uint64_t v48 = v74[1];
    unint64_t v50 = v13[2];
    unint64_t v49 = v13[3];
    if (v50 >= v49 >> 1) {
      uint64_t v13 = sub_260457640((void *)(v49 > 1), v50 + 1, 1, v13);
    }
    v13[2] = v50 + 1;
    uint64_t v51 = &v13[2 * v50];
    v51[4] = v47;
    v51[5] = v48;
    sub_260530554(v71, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
  }
  sub_260467B94((uint64_t)v11 + v26[9], (uint64_t)v3, &qword_26B3E8AD8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v3, 1, v73) == 1)
  {
    sub_26045B7D4((uint64_t)v3, &qword_26B3E8AD8);
  }
  else
  {
    sub_26052E414((uint64_t)v3, (uint64_t)v6, type metadata accessor for IntelligenceImage);
    v74[0] = 0;
    v74[1] = 0xE000000000000000;
    sub_260532CB0();
    swift_bridgeObjectRelease();
    v74[0] = 0x746F687370616E73;
    v74[1] = 0xEF203A6567616D49;
    sub_26049F9AC();
    sub_260532840();
    swift_bridgeObjectRelease();
    uint64_t v52 = v74[0];
    uint64_t v53 = v74[1];
    unint64_t v55 = v13[2];
    unint64_t v54 = v13[3];
    if (v55 >= v54 >> 1) {
      uint64_t v13 = sub_260457640((void *)(v54 > 1), v55 + 1, 1, v13);
    }
    v13[2] = v55 + 1;
    uint64_t v56 = &v13[2 * v55];
    v56[4] = v52;
    v56[5] = v53;
    sub_260530554((uint64_t)v6, type metadata accessor for IntelligenceImage);
  }
  uint64_t v57 = (char *)v11 + v26[11];
  int v58 = *(os_unfair_lock_s **)v57;
  if (v57[8])
  {
    j__swift_retain();
    j__swift_retain();
    os_unfair_lock_lock(v58 + 18);
    sub_260529048((uint64_t)&v58[4], v74);
    os_unfair_lock_unlock(v58 + 18);
    swift_release();
    j__swift_release();
    int v58 = (os_unfair_lock_s *)v74[0];
    if (!v74[0]) {
      goto LABEL_40;
    }
  }
  else
  {
    j__swift_retain();
    if (!v58) {
      goto LABEL_40;
    }
  }
  v74[0] = 0;
  v74[1] = 0xE000000000000000;
  sub_260532CB0();
  swift_bridgeObjectRelease();
  v74[0] = 0xD00000000000001BLL;
  v74[1] = 0x8000000260543890;
  uint64_t v80 = (uint64_t)v58;
  IntelligenceElement.Document.description.getter();
  sub_260532840();
  swift_bridgeObjectRelease();
  uint64_t v59 = v74[0];
  uint64_t v60 = v74[1];
  unint64_t v62 = v13[2];
  unint64_t v61 = v13[3];
  if (v62 >= v61 >> 1) {
    uint64_t v13 = sub_260457640((void *)(v61 > 1), v62 + 1, 1, v13);
  }
  v13[2] = v62 + 1;
  uint64_t v63 = &v13[2 * v62];
  v63[4] = v59;
  v63[5] = v60;
  swift_release();
LABEL_40:
  strcpy((char *)v74, "Window(");
  v74[1] = 0xE700000000000000;
  uint64_t v80 = (uint64_t)v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A871A38);
  sub_260458814();
  sub_260532680();
  swift_bridgeObjectRelease();
  sub_260532840();
  swift_bridgeObjectRelease();
  sub_260532840();
  return v74[0];
}

uint64_t _s21UIIntelligenceSupport19IntelligenceElementV6WindowV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v49 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v45 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A873DF8);
  MEMORY[0x270FA5388](v47);
  uint64_t v50 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v46 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v60 = (uint64_t)&v45 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (uint64_t)&v45 - v11;
  uint64_t v12 = *a2;
  uint64_t v13 = *(void *)a1 + *(void *)(**(void **)a1 + 88);
  swift_beginAccess();
  uint64_t v59 = *(void *)v13;
  uint64_t v58 = *(void *)(v13 + 8);
  uint64_t v57 = *(void *)(v13 + 16);
  uint64_t v56 = *(void *)(v13 + 24);
  int v53 = *(unsigned __int8 *)(v13 + 39);
  int v52 = *(unsigned __int16 *)(v13 + 37);
  uint64_t v51 = *(unsigned int *)(v13 + 33);
  uint64_t v55 = *(void *)(v13 + 32);
  uint64_t v62 = *(void *)(v13 + 40);
  uint64_t v14 = *(void *)(v13 + 56);
  uint64_t v54 = *(void *)(v13 + 48);
  uint64_t v15 = (uint64_t *)(v12 + *(void *)(*(void *)v12 + 88));
  swift_beginAccess();
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v15[2];
  uint64_t v19 = v15[3];
  uint64_t v21 = v15[4];
  uint64_t v20 = v15[5];
  uint64_t v22 = v15[6];
  uint64_t v23 = v15[7];
  if (v14 == 1)
  {
    if (v23 == 1) {
      goto LABEL_12;
    }
LABEL_6:
    v63[0] = v59;
    v63[1] = v58;
    v63[2] = v57;
    v63[3] = v56;
    v63[4] = v55;
    v63[5] = v62;
    v63[6] = v54;
    v63[7] = v14;
    v63[8] = v17;
    v63[9] = v16;
    v63[10] = v18;
    v63[11] = v19;
    v63[12] = v21;
    v63[13] = v20;
    v63[14] = v22;
    v63[15] = v23;
    sub_260481EE4(v17, v16, v18, v19, v21, v20, v22, v23);
    sub_2604C90D4(v63);
    goto LABEL_26;
  }
  if (v23 == 1)
  {
    uint64_t v24 = v15[5];
    swift_bridgeObjectRetain();
    uint64_t v20 = v24;
    goto LABEL_6;
  }
  if (((v51 | ((unint64_t)(v52 | (v53 << 16)) << 32)) >> 24) != HIDWORD(v21)
    || v62 != v20)
  {
    goto LABEL_26;
  }
LABEL_12:
  uint64_t v26 = _s6WindowV7StorageVMa();
  uint64_t v27 = v61;
  sub_260467B94(v13 + *(int *)(v26 + 20), v61, &qword_26B3E8BE8);
  uint64_t v62 = v26;
  uint64_t v28 = v60;
  sub_260467B94((uint64_t)v15 + *(int *)(v26 + 20), v60, &qword_26B3E8BE8);
  uint64_t v29 = v50;
  uint64_t v30 = v50 + *(int *)(v47 + 48);
  sub_260467B94(v27, v50, &qword_26B3E8BE8);
  sub_260467B94(v28, v30, &qword_26B3E8BE8);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  uint64_t v32 = v49;
  if (v31(v29, 1, v49) == 1)
  {
    sub_26045B7D4(v28, &qword_26B3E8BE8);
    sub_26045B7D4(v27, &qword_26B3E8BE8);
    if (v31(v30, 1, v32) == 1)
    {
      sub_26045B7D4(v29, &qword_26B3E8BE8);
      goto LABEL_19;
    }
LABEL_17:
    sub_26045B7D4(v29, &qword_26A873DF8);
    goto LABEL_26;
  }
  uint64_t v33 = v46;
  sub_260467B94(v29, v46, &qword_26B3E8BE8);
  if (v31(v30, 1, v32) == 1)
  {
    sub_26045B7D4(v60, &qword_26B3E8BE8);
    sub_26045B7D4(v61, &qword_26B3E8BE8);
    sub_260530554(v33, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
    goto LABEL_17;
  }
  uint64_t v34 = v45;
  sub_26052E414(v30, v45, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
  char v35 = sub_2605322A0();
  sub_260530554(v34, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
  sub_26045B7D4(v60, &qword_26B3E8BE8);
  sub_26045B7D4(v61, &qword_26B3E8BE8);
  sub_260530554(v33, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
  sub_26045B7D4(v29, &qword_26B3E8BE8);
  if ((v35 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_19:
  uint64_t v36 = v62;
  uint64_t v37 = *(int *)(v62 + 24);
  unint64_t v38 = (void *)(v13 + v37);
  uint64_t v39 = *(void *)(v13 + v37 + 8);
  uint64_t v40 = (uint64_t *)((char *)v15 + v37);
  uint64_t v41 = v40[1];
  if (!v39)
  {
    if (!v41)
    {
LABEL_28:
      char v43 = *(unsigned char *)(v13 + *(int *)(v36 + 28)) ^ *((unsigned char *)v15 + *(int *)(v36 + 28)) ^ 1;
      return v43 & 1;
    }
    goto LABEL_26;
  }
  if (!v41)
  {
LABEL_26:
    char v43 = 0;
    return v43 & 1;
  }
  if (*v38 == *v40 && v39 == v41) {
    goto LABEL_28;
  }
  char v42 = sub_260532FA0();
  char v43 = 0;
  if (v42) {
    goto LABEL_28;
  }
  return v43 & 1;
}

uint64_t _s6WindowV7StorageVMa()
{
  uint64_t result = qword_26B3E8B10;
  if (!qword_26B3E8B10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26052DFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6WindowV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26052E060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6WindowV7StorageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_26052E0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26052E12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    char v9 = a5 & 1;
    swift_bridgeObjectRetain();
    sub_2604DB768(a3, a4, v9);
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_26052E1A8(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
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
    a1[28],
    a1[29]);
  return a1;
}

uint64_t sub_26052E224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    char v9 = a5 & 1;
    swift_bridgeObjectRelease();
    sub_2604DB774(a3, a4, v9);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_26052E2A8(_OWORD *a1)
{
  double result = 0.0;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

unint64_t sub_26052E2D0()
{
  unint64_t result = qword_26B3E8730;
  if (!qword_26B3E8730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8730);
  }
  return result;
}

unint64_t sub_26052E324()
{
  unint64_t result = qword_26A8720C0;
  if (!qword_26A8720C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8720C0);
  }
  return result;
}

uint64_t sub_26052E378(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_26052E3C0()
{
  unint64_t result = qword_26A871CA0;
  if (!qword_26A871CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A871CA0);
  }
  return result;
}

uint64_t sub_26052E414(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_26052E490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26052AAD0(a1, a2, a3, a4, &qword_26B3E8BE8, (uint64_t (*)(char *))IntelligenceElement.Window.appCurrentUserActivity.setter);
}

uint64_t sub_26052E4C8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return IntelligenceElement.Window.identifier.setter(v1, v2);
}

uint64_t sub_26052E50C(char *a1)
{
  return IntelligenceElement.Window.isActive.setter(*a1);
}

uint64_t sub_26052E538(char *a1)
{
  return IntelligenceElement.Window.canOcclude.setter(*a1);
}

uint64_t sub_26052E564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26052AAD0(a1, a2, a3, a4, &qword_26B3E8AD8, (uint64_t (*)(char *))IntelligenceElement.Window.snapshotImage.setter);
}

uint64_t sub_26052E5A4(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v3 = *(void *)a1;
  char v4 = v1;
  j__swift_retain();
  return IntelligenceElement.Window.windowContentGeneratedPDF.setter(&v3);
}

ValueMetadata *type metadata accessor for IntelligenceElement.Window()
{
  return &type metadata for IntelligenceElement.Window;
}

uint64_t _s6WindowV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s6WindowV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26052E758);
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

ValueMetadata *_s6WindowV10CodingKeysOMa()
{
  return &_s6WindowV10CodingKeysON;
}

uint64_t sub_26052E790(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    unsigned int v6 = a3;
    uint64_t v7 = a2[7];
    long long v8 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    if (v7 == 1)
    {
      long long v9 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v9;
    }
    else
    {
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(void *)(a1 + 36) = *(uint64_t *)((char *)a2 + 36);
      *(void *)(a1 + 48) = a2[6];
      *(void *)(a1 + 56) = v7;
      swift_bridgeObjectRetain();
    }
    uint64_t v11 = v6[5];
    uint64_t v12 = (void **)(a1 + v11);
    uint64_t v13 = (void **)((char *)a2 + v11);
    uint64_t v14 = type metadata accessor for IntelligenceUserActivity();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v17 = *v13;
      *uint64_t v12 = *v13;
      uint64_t v18 = *(int *)(v14 + 20);
      long long v85 = (char *)v13 + v18;
      __dsta = (char *)v12 + v18;
      uint64_t v88 = v6;
      uint64_t v19 = sub_2605322D0();
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
      id v21 = v17;
      uint64_t v22 = v19;
      unsigned int v6 = v88;
      v20(__dsta, v85, v22);
      *(void **)((char *)v12 + *(int *)(v14 + 24)) = *(void **)((char *)v13 + *(int *)(v14 + 24));
      uint64_t v23 = *(void (**)(void **, void, uint64_t, uint64_t))(v15 + 56);
      swift_retain();
      v23(v12, 0, 1, v14);
    }
    uint64_t v24 = v6[6];
    uint64_t v25 = v6[7];
    uint64_t v26 = (void *)(a1 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    *(unsigned char *)(a1 + v25) = *((unsigned char *)a2 + v25);
    uint64_t v29 = v6[9];
    *(unsigned char *)(a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    uint64_t v30 = (void *)(a1 + v29);
    uint64_t v31 = (uint64_t *)((char *)a2 + v29);
    uint64_t v32 = type metadata accessor for IntelligenceImage(0);
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v33 + 48);
    swift_bridgeObjectRetain();
    if (v34(v31, 1, v32))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
      memcpy(v30, v31, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      type metadata accessor for IntelligenceImage.InternalRepresentation(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      *uint64_t v30 = *v31;
      if (EnumCaseMultiPayload == 1)
      {
        swift_retain();
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
        unint64_t v38 = (char *)v30 + v37;
        uint64_t v39 = (char *)v31 + v37;
        uint64_t v40 = sub_2605323B0();
        uint64_t v41 = *(void *)(v40 - 8);
        uint64_t v89 = v6;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
        {
          uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
          memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
        }
        char v43 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
        uint64_t v44 = v43[5];
        uint64_t v45 = &v38[v44];
        uint64_t v46 = &v39[v44];
        *(void *)uint64_t v45 = *(void *)v46;
        v45[8] = v46[8];
        uint64_t v47 = v43[6];
        uint64_t v84 = v39;
        __dst = &v38[v47];
        uint64_t v48 = &v39[v47];
        uint64_t v49 = sub_260532270();
        uint64_t v50 = *(void *)(v49 - 8);
        char v83 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
        if (v83(v48, 1, v49))
        {
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(__dst, v48, *(void *)(*(void *)(v51 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v50 + 16))(__dst, v48, v49);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(__dst, 0, 1, v49);
        }
        uint64_t v52 = v43[7];
        int v53 = &v38[v52];
        uint64_t v54 = &v84[v52];
        if (v83(&v84[v52], 1, v49))
        {
          uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v53, v54, v49);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v53, 0, 1, v49);
        }
        unsigned int v6 = v89;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    uint64_t v56 = v6[10];
    uint64_t v57 = a1 + v56;
    uint64_t v58 = (uint64_t)a2 + v56;
    if (*(uint64_t *)((char *)a2 + v56 + 48))
    {
      uint64_t v59 = *(void *)(v58 + 8);
      *(void *)uint64_t v57 = *(void *)v58;
      *(void *)(v57 + 8) = v59;
      uint64_t v60 = *(void *)(v58 + 16);
      uint64_t v61 = *(void *)(v58 + 24);
      char v62 = *(unsigned char *)(v58 + 32);
      swift_bridgeObjectRetain();
      sub_2604DB768(v60, v61, v62);
      *(void *)(v57 + 16) = v60;
      *(void *)(v57 + 24) = v61;
      *(unsigned char *)(v57 + 32) = v62;
      uint64_t v63 = *(void *)(v58 + 48);
      *(void *)(v57 + 40) = *(void *)(v58 + 40);
      *(void *)(v57 + 48) = v63;
      uint64_t v64 = *(void *)(v58 + 64);
      *(void *)(v57 + 56) = *(void *)(v58 + 56);
      *(void *)(v57 + 64) = v64;
      *(void *)(v57 + 72) = *(void *)(v58 + 72);
      long long v65 = *(_OWORD *)(v58 + 96);
      *(_OWORD *)(v57 + 80) = *(_OWORD *)(v58 + 80);
      *(_OWORD *)(v57 + 96) = v65;
      long long v66 = *(_OWORD *)(v58 + 160);
      *(_OWORD *)(v57 + 144) = *(_OWORD *)(v58 + 144);
      *(_OWORD *)(v57 + 160) = v66;
      long long v67 = *(_OWORD *)(v58 + 128);
      *(_OWORD *)(v57 + 112) = *(_OWORD *)(v58 + 112);
      *(_OWORD *)(v57 + 128) = v67;
      long long v68 = *(_OWORD *)(v58 + 224);
      *(_OWORD *)(v57 + 208) = *(_OWORD *)(v58 + 208);
      *(_OWORD *)(v57 + 224) = v68;
      long long v69 = *(_OWORD *)(v58 + 192);
      *(_OWORD *)(v57 + 176) = *(_OWORD *)(v58 + 176);
      *(_OWORD *)(v57 + 192) = v69;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v70 = *(_OWORD *)(v58 + 208);
      *(_OWORD *)(v57 + 192) = *(_OWORD *)(v58 + 192);
      *(_OWORD *)(v57 + 208) = v70;
      *(_OWORD *)(v57 + 224) = *(_OWORD *)(v58 + 224);
      long long v71 = *(_OWORD *)(v58 + 144);
      *(_OWORD *)(v57 + 128) = *(_OWORD *)(v58 + 128);
      *(_OWORD *)(v57 + 144) = v71;
      long long v72 = *(_OWORD *)(v58 + 176);
      *(_OWORD *)(v57 + 160) = *(_OWORD *)(v58 + 160);
      *(_OWORD *)(v57 + 176) = v72;
      long long v73 = *(_OWORD *)(v58 + 80);
      *(_OWORD *)(v57 + 64) = *(_OWORD *)(v58 + 64);
      *(_OWORD *)(v57 + 80) = v73;
      long long v74 = *(_OWORD *)(v58 + 112);
      *(_OWORD *)(v57 + 96) = *(_OWORD *)(v58 + 96);
      *(_OWORD *)(v57 + 112) = v74;
      long long v75 = *(_OWORD *)(v58 + 16);
      *(_OWORD *)uint64_t v57 = *(_OWORD *)v58;
      *(_OWORD *)(v57 + 16) = v75;
      long long v76 = *(_OWORD *)(v58 + 48);
      *(_OWORD *)(v57 + 32) = *(_OWORD *)(v58 + 32);
      *(_OWORD *)(v57 + 48) = v76;
    }
    uint64_t v77 = v6[11];
    uint64_t v78 = a1 + v77;
    uint64_t v79 = (uint64_t *)((char *)a2 + v77);
    uint64_t v80 = *v79;
    char v81 = *((unsigned char *)v79 + 8);
    j__swift_retain();
    *(void *)uint64_t v78 = v80;
    *(unsigned char *)(v78 + 8) = v81;
  }
  return a1;
}

uint64_t sub_26052EE88(uint64_t a1, int *a2)
{
  if (*(void *)(a1 + 56) != 1) {
    swift_bridgeObjectRelease();
  }
  unsigned int v4 = (id *)(a1 + a2[5]);
  uint64_t v5 = type metadata accessor for IntelligenceUserActivity();
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {

    unsigned int v6 = (char *)v4 + *(int *)(v5 + 20);
    uint64_t v7 = sub_2605322D0();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + a2[9];
  uint64_t v9 = type metadata accessor for IntelligenceImage(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    type metadata accessor for IntelligenceImage.InternalRepresentation(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
      uint64_t v11 = sub_2605323B0();
      uint64_t v12 = *(void *)(v11 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
      }
      uint64_t v13 = type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v14 = v10 + *(int *)(v13 + 24);
      uint64_t v15 = sub_260532270();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
      if (!v17(v14, 1, v15)) {
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      }
      uint64_t v18 = v10 + *(int *)(v13 + 28);
      if (!v17(v18, 1, v15)) {
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v15);
      }
    }
  }
  uint64_t v19 = a1 + a2[10];
  if (*(void *)(v19 + 48))
  {
    swift_bridgeObjectRelease();
    sub_2604DB774(*(void *)(v19 + 16), *(void *)(v19 + 24), *(unsigned char *)(v19 + 32));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return j__swift_release();
}

uint64_t sub_26052F1A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  if (v6 == 1)
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 36) = *(void *)(a2 + 36);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v6;
    swift_bridgeObjectRetain();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = (void **)(a1 + v9);
  uint64_t v11 = (void **)(a2 + v9);
  uint64_t v12 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = *v11;
    *uint64_t v10 = *v11;
    uint64_t v16 = *(int *)(v12 + 20);
    uint64_t v82 = (char *)v11 + v16;
    __dsta = (char *)v10 + v16;
    uint64_t v86 = a3;
    uint64_t v17 = sub_2605322D0();
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    id v19 = v15;
    uint64_t v20 = v17;
    a3 = v86;
    v18(__dsta, v82, v20);
    *(void **)((char *)v10 + *(int *)(v12 + 24)) = *(void **)((char *)v11 + *(int *)(v12 + 24));
    id v21 = *(void (**)(void **, void, uint64_t, uint64_t))(v13 + 56);
    swift_retain();
    v21(v10, 0, 1, v12);
  }
  uint64_t v22 = a3[6];
  uint64_t v23 = a3[7];
  uint64_t v24 = (void *)(a1 + v22);
  uint64_t v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  *(unsigned char *)(a1 + v23) = *(unsigned char *)(a2 + v23);
  uint64_t v27 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  uint64_t v30 = type metadata accessor for IntelligenceImage(0);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v31 + 48);
  swift_bridgeObjectRetain();
  if (v32(v29, 1, v30))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
    memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    type metadata accessor for IntelligenceImage.InternalRepresentation(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v28 = *v29;
    if (EnumCaseMultiPayload == 1)
    {
      swift_retain();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
      uint64_t v36 = (char *)v28 + v35;
      uint64_t v37 = (char *)v29 + v35;
      uint64_t v38 = sub_2605323B0();
      uint64_t v39 = *(void *)(v38 - 8);
      uint64_t v87 = a3;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      uint64_t v41 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v42 = v41[5];
      char v43 = &v36[v42];
      uint64_t v44 = &v37[v42];
      *(void *)char v43 = *(void *)v44;
      v43[8] = v44[8];
      uint64_t v45 = v41[6];
      char v83 = v37;
      __dst = &v36[v45];
      uint64_t v46 = &v37[v45];
      uint64_t v47 = sub_260532270();
      uint64_t v48 = *(void *)(v47 - 8);
      char v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48);
      if (v81(v46, 1, v47))
      {
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dst, v46, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(__dst, v46, v47);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(__dst, 0, 1, v47);
      }
      uint64_t v50 = v41[7];
      uint64_t v51 = &v36[v50];
      uint64_t v52 = &v83[v50];
      if (v81(&v83[v50], 1, v47))
      {
        uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v51, v52, v47);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v51, 0, 1, v47);
      }
      a3 = v87;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  uint64_t v54 = a3[10];
  uint64_t v55 = a1 + v54;
  uint64_t v56 = a2 + v54;
  if (*(void *)(a2 + v54 + 48))
  {
    uint64_t v57 = *(void *)(v56 + 8);
    *(void *)uint64_t v55 = *(void *)v56;
    *(void *)(v55 + 8) = v57;
    uint64_t v58 = *(void *)(v56 + 16);
    uint64_t v59 = *(void *)(v56 + 24);
    char v60 = *(unsigned char *)(v56 + 32);
    swift_bridgeObjectRetain();
    sub_2604DB768(v58, v59, v60);
    *(void *)(v55 + 16) = v58;
    *(void *)(v55 + 24) = v59;
    *(unsigned char *)(v55 + 32) = v60;
    uint64_t v61 = *(void *)(v56 + 48);
    *(void *)(v55 + 40) = *(void *)(v56 + 40);
    *(void *)(v55 + 48) = v61;
    uint64_t v62 = *(void *)(v56 + 64);
    *(void *)(v55 + 56) = *(void *)(v56 + 56);
    *(void *)(v55 + 64) = v62;
    *(void *)(v55 + 72) = *(void *)(v56 + 72);
    long long v63 = *(_OWORD *)(v56 + 96);
    *(_OWORD *)(v55 + 80) = *(_OWORD *)(v56 + 80);
    *(_OWORD *)(v55 + 96) = v63;
    long long v64 = *(_OWORD *)(v56 + 160);
    *(_OWORD *)(v55 + 144) = *(_OWORD *)(v56 + 144);
    *(_OWORD *)(v55 + 160) = v64;
    long long v65 = *(_OWORD *)(v56 + 128);
    *(_OWORD *)(v55 + 112) = *(_OWORD *)(v56 + 112);
    *(_OWORD *)(v55 + 128) = v65;
    long long v66 = *(_OWORD *)(v56 + 224);
    *(_OWORD *)(v55 + 208) = *(_OWORD *)(v56 + 208);
    *(_OWORD *)(v55 + 224) = v66;
    long long v67 = *(_OWORD *)(v56 + 192);
    *(_OWORD *)(v55 + 176) = *(_OWORD *)(v56 + 176);
    *(_OWORD *)(v55 + 192) = v67;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v68 = *(_OWORD *)(v56 + 208);
    *(_OWORD *)(v55 + 192) = *(_OWORD *)(v56 + 192);
    *(_OWORD *)(v55 + 208) = v68;
    *(_OWORD *)(v55 + 224) = *(_OWORD *)(v56 + 224);
    long long v69 = *(_OWORD *)(v56 + 144);
    *(_OWORD *)(v55 + 128) = *(_OWORD *)(v56 + 128);
    *(_OWORD *)(v55 + 144) = v69;
    long long v70 = *(_OWORD *)(v56 + 176);
    *(_OWORD *)(v55 + 160) = *(_OWORD *)(v56 + 160);
    *(_OWORD *)(v55 + 176) = v70;
    long long v71 = *(_OWORD *)(v56 + 80);
    *(_OWORD *)(v55 + 64) = *(_OWORD *)(v56 + 64);
    *(_OWORD *)(v55 + 80) = v71;
    long long v72 = *(_OWORD *)(v56 + 112);
    *(_OWORD *)(v55 + 96) = *(_OWORD *)(v56 + 96);
    *(_OWORD *)(v55 + 112) = v72;
    long long v73 = *(_OWORD *)(v56 + 16);
    *(_OWORD *)uint64_t v55 = *(_OWORD *)v56;
    *(_OWORD *)(v55 + 16) = v73;
    long long v74 = *(_OWORD *)(v56 + 48);
    *(_OWORD *)(v55 + 32) = *(_OWORD *)(v56 + 32);
    *(_OWORD *)(v55 + 48) = v74;
  }
  uint64_t v75 = a3[11];
  uint64_t v76 = a1 + v75;
  uint64_t v77 = (uint64_t *)(a2 + v75);
  uint64_t v78 = *v77;
  char v79 = *((unsigned char *)v77 + 8);
  j__swift_retain();
  *(void *)uint64_t v76 = v78;
  *(unsigned char *)(v76 + 8) = v79;
  return a1;
}

uint64_t sub_26052F850(uint64_t a1, long long *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 7);
  if (*(void *)(a1 + 56) == 1)
  {
    long long v7 = *a2;
    long long v8 = a2[1];
    if (v6 == 1)
    {
      long long v9 = a2[3];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v9;
      *(_OWORD *)a1 = v7;
      *(_OWORD *)(a1 + 16) = v8;
    }
    else
    {
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(_OWORD *)a1 = v7;
      *(_OWORD *)(a1 + 16) = v8;
      *(_DWORD *)(a1 + 36) = *((_DWORD *)a2 + 9);
      *(_DWORD *)(a1 + 40) = *((_DWORD *)a2 + 10);
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      *(void *)(a1 + 56) = *((void *)a2 + 7);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_2604C1024(a1);
    long long v10 = a2[3];
    long long v12 = *a2;
    long long v11 = a2[1];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v10;
    *(_OWORD *)a1 = v12;
    *(_OWORD *)(a1 + 16) = v11;
  }
  else
  {
    long long v13 = *a2;
    long long v14 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v14;
    *(_DWORD *)(a1 + 36) = *((_DWORD *)a2 + 9);
    *(_DWORD *)(a1 + 40) = *((_DWORD *)a2 + 10);
    *(void *)(a1 + 48) = *((void *)a2 + 6);
    *(void *)(a1 + 56) = *((void *)a2 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v150 = a3;
  uint64_t v15 = a3[5];
  uint64_t v16 = (void **)(a1 + v15);
  uint64_t v17 = (void **)((char *)a2 + v15);
  uint64_t v18 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = *v17;
      *uint64_t v16 = *v17;
      uint64_t v24 = *(int *)(v18 + 20);
      __int16 v145 = (char *)v17 + v24;
      __dstb = (char *)v16 + v24;
      uint64_t v25 = sub_2605322D0();
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
      id v27 = v23;
      v26(__dstb, v145, v25);
      *(void **)((char *)v16 + *(int *)(v18 + 24)) = *(void **)((char *)v17 + *(int *)(v18 + 24));
      uint64_t v28 = *(void (**)(void **, void, uint64_t, uint64_t))(v19 + 56);
      swift_retain();
      v28(v16, 0, 1, v18);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v22)
  {
    sub_260530554((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
LABEL_13:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
    memcpy(v16, v17, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v44 = *v16;
  uint64_t v45 = *v17;
  *uint64_t v16 = *v17;
  id v46 = v45;

  uint64_t v47 = *(int *)(v18 + 20);
  uint64_t v48 = (char *)v16 + v47;
  uint64_t v49 = (char *)v17 + v47;
  uint64_t v50 = sub_2605322D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 24))(v48, v49, v50);
  *(void **)((char *)v16 + *(int *)(v18 + 24)) = *(void **)((char *)v17 + *(int *)(v18 + 24));
  swift_retain();
  swift_release();
LABEL_14:
  uint64_t v30 = v150;
  uint64_t v31 = v150[6];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v150[7]) = *((unsigned char *)a2 + v150[7]);
  *(unsigned char *)(a1 + v150[8]) = *((unsigned char *)a2 + v150[8]);
  uint64_t v34 = v150[9];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = type metadata accessor for IntelligenceImage(0);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (v40)
  {
    if (!v41)
    {
      type metadata accessor for IntelligenceImage.InternalRepresentation(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      void *v35 = *v36;
      if (EnumCaseMultiPayload == 1)
      {
        swift_retain();
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v52 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
        uint64_t v53 = (char *)v35 + v52;
        uint64_t v54 = (char *)v36 + v52;
        uint64_t v55 = sub_2605323B0();
        uint64_t v56 = *(void *)(v55 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55))
        {
          uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
          memcpy(v53, v54, *(void *)(*(void *)(v57 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v53, v54, v55);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
        }
        long long v64 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
        uint64_t v65 = v64[5];
        long long v66 = &v53[v65];
        long long v67 = &v54[v65];
        char v68 = v67[8];
        *(void *)long long v66 = *(void *)v67;
        v66[8] = v68;
        uint64_t v69 = v64[6];
        uint64_t v146 = v53;
        __dst = &v53[v69];
        uint64_t v143 = v54;
        long long v70 = &v54[v69];
        uint64_t v71 = sub_260532270();
        uint64_t v72 = *(void *)(v71 - 8);
        unint64_t v142 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48);
        if (v142(v70, 1, v71))
        {
          uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(__dst, v70, *(void *)(*(void *)(v73 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v72 + 16))(__dst, v70, v71);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(__dst, 0, 1, v71);
        }
        uint64_t v74 = v64[7];
        uint64_t v75 = &v146[v74];
        uint64_t v76 = &v143[v74];
        if (v142(&v143[v74], 1, v71))
        {
          uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(v75, v76, *(void *)(*(void *)(v77 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v75, v76, v71);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v75, 0, 1, v71);
        }
        uint64_t v30 = v150;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      goto LABEL_38;
    }
LABEL_20:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
    memcpy(v35, v36, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_38;
  }
  if (v41)
  {
    sub_260530554((uint64_t)v35, type metadata accessor for IntelligenceImage);
    goto LABEL_20;
  }
  if ((long long *)a1 != a2)
  {
    sub_260530554((uint64_t)v35, type metadata accessor for IntelligenceImage.InternalRepresentation);
    type metadata accessor for IntelligenceImage.InternalRepresentation(0);
    int v51 = swift_getEnumCaseMultiPayload();
    void *v35 = *v36;
    if (v51 == 1)
    {
      swift_retain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v58 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
      uint64_t v59 = (char *)v35 + v58;
      char v60 = (char *)v36 + v58;
      uint64_t v61 = sub_2605323B0();
      uint64_t v62 = *(void *)(v61 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61))
      {
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v59, v60, v61);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
      }
      uint64_t v127 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v128 = v127[5];
      uint64_t v129 = &v59[v128];
      uint64_t v130 = &v60[v128];
      char v131 = v130[8];
      *(void *)uint64_t v129 = *(void *)v130;
      v129[8] = v131;
      uint64_t v132 = v127[6];
      __dsta = v59;
      unint64_t v133 = &v59[v132];
      uint64_t v134 = &v60[v132];
      uint64_t v135 = sub_260532270();
      uint64_t v136 = *(void *)(v135 - 8);
      unint64_t v144 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v136 + 48);
      if (v144(v134, 1, v135))
      {
        uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v133, v134, *(void *)(*(void *)(v137 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v133, v134, v135);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v136 + 56))(v133, 0, 1, v135);
      }
      uint64_t v138 = v127[7];
      uint64_t v139 = &__dsta[v138];
      uint64_t v140 = &v60[v138];
      if (v144(v140, 1, v135))
      {
        uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v139, v140, *(void *)(*(void *)(v141 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v139, v140, v135);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v136 + 56))(v139, 0, 1, v135);
      }
      uint64_t v30 = v150;
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_38:
  uint64_t v78 = v30[10];
  uint64_t v79 = a1 + v78;
  uint64_t v80 = (long long *)((char *)a2 + v78);
  uint64_t v81 = *(void *)(a1 + v78 + 48);
  uint64_t v82 = *(void *)((char *)a2 + v78 + 48);
  if (v81)
  {
    if (v82)
    {
      *(void *)uint64_t v79 = *(void *)v80;
      *(void *)(v79 + 8) = *((void *)v80 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v83 = *((void *)v80 + 2);
      uint64_t v84 = *((void *)v80 + 3);
      char v85 = *((unsigned char *)v80 + 32);
      sub_2604DB768(v83, v84, v85);
      uint64_t v86 = *(void *)(v79 + 16);
      uint64_t v87 = *(void *)(v79 + 24);
      char v88 = *(unsigned char *)(v79 + 32);
      *(void *)(v79 + 16) = v83;
      *(void *)(v79 + 24) = v84;
      *(unsigned char *)(v79 + 32) = v85;
      sub_2604DB774(v86, v87, v88);
      *(void *)(v79 + 40) = *((void *)v80 + 5);
      *(void *)(v79 + 48) = *((void *)v80 + 6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v79 + 56) = *((void *)v80 + 7);
      *(void *)(v79 + 64) = *((void *)v80 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v79 + 72) = *((void *)v80 + 9);
      *(void *)(v79 + 80) = *((void *)v80 + 10);
      *(void *)(v79 + 88) = *((void *)v80 + 11);
      *(void *)(v79 + 96) = *((void *)v80 + 12);
      *(void *)(v79 + 104) = *((void *)v80 + 13);
      *(void *)(v79 + 112) = *((void *)v80 + 14);
      *(void *)(v79 + 120) = *((void *)v80 + 15);
      *(void *)(v79 + 128) = *((void *)v80 + 16);
      *(void *)(v79 + 136) = *((void *)v80 + 17);
      *(void *)(v79 + 144) = *((void *)v80 + 18);
      *(void *)(v79 + 152) = *((void *)v80 + 19);
      *(void *)(v79 + 160) = *((void *)v80 + 20);
      *(void *)(v79 + 168) = *((void *)v80 + 21);
      *(void *)(v79 + 176) = *((void *)v80 + 22);
      *(void *)(v79 + 184) = *((void *)v80 + 23);
      *(void *)(v79 + 192) = *((void *)v80 + 24);
      *(void *)(v79 + 200) = *((void *)v80 + 25);
      *(void *)(v79 + 208) = *((void *)v80 + 26);
      *(void *)(v79 + 216) = *((void *)v80 + 27);
      *(void *)(v79 + 224) = *((void *)v80 + 28);
      *(void *)(v79 + 232) = *((void *)v80 + 29);
    }
    else
    {
      sub_2605305B4(v79);
      long long v100 = v80[1];
      long long v99 = v80[2];
      *(_OWORD *)uint64_t v79 = *v80;
      *(_OWORD *)(v79 + 16) = v100;
      *(_OWORD *)(v79 + 32) = v99;
      long long v101 = v80[6];
      long long v103 = v80[3];
      long long v102 = v80[4];
      *(_OWORD *)(v79 + 80) = v80[5];
      *(_OWORD *)(v79 + 96) = v101;
      *(_OWORD *)(v79 + 48) = v103;
      *(_OWORD *)(v79 + 64) = v102;
      long long v104 = v80[10];
      long long v106 = v80[7];
      long long v105 = v80[8];
      *(_OWORD *)(v79 + 144) = v80[9];
      *(_OWORD *)(v79 + 160) = v104;
      *(_OWORD *)(v79 + 112) = v106;
      *(_OWORD *)(v79 + 128) = v105;
      long long v107 = v80[14];
      long long v109 = v80[11];
      long long v108 = v80[12];
      *(_OWORD *)(v79 + 208) = v80[13];
      *(_OWORD *)(v79 + 224) = v107;
      *(_OWORD *)(v79 + 176) = v109;
      *(_OWORD *)(v79 + 192) = v108;
    }
  }
  else if (v82)
  {
    *(void *)uint64_t v79 = *(void *)v80;
    *(void *)(v79 + 8) = *((void *)v80 + 1);
    uint64_t v89 = *((void *)v80 + 2);
    uint64_t v90 = *((void *)v80 + 3);
    char v91 = *((unsigned char *)v80 + 32);
    swift_bridgeObjectRetain();
    sub_2604DB768(v89, v90, v91);
    *(void *)(v79 + 16) = v89;
    *(void *)(v79 + 24) = v90;
    *(unsigned char *)(v79 + 32) = v91;
    *(void *)(v79 + 40) = *((void *)v80 + 5);
    *(void *)(v79 + 48) = *((void *)v80 + 6);
    *(void *)(v79 + 56) = *((void *)v80 + 7);
    *(void *)(v79 + 64) = *((void *)v80 + 8);
    *(void *)(v79 + 72) = *((void *)v80 + 9);
    long long v92 = v80[6];
    *(_OWORD *)(v79 + 80) = v80[5];
    *(_OWORD *)(v79 + 96) = v92;
    long long v93 = v80[14];
    long long v95 = v80[11];
    long long v94 = v80[12];
    *(_OWORD *)(v79 + 208) = v80[13];
    *(_OWORD *)(v79 + 224) = v93;
    *(_OWORD *)(v79 + 176) = v95;
    *(_OWORD *)(v79 + 192) = v94;
    long long v96 = v80[7];
    long long v97 = v80[8];
    long long v98 = v80[10];
    *(_OWORD *)(v79 + 144) = v80[9];
    *(_OWORD *)(v79 + 160) = v98;
    *(_OWORD *)(v79 + 112) = v96;
    *(_OWORD *)(v79 + 128) = v97;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v110 = *v80;
    long long v111 = v80[2];
    *(_OWORD *)(v79 + 16) = v80[1];
    *(_OWORD *)(v79 + 32) = v111;
    *(_OWORD *)uint64_t v79 = v110;
    long long v112 = v80[3];
    long long v113 = v80[4];
    long long v114 = v80[6];
    *(_OWORD *)(v79 + 80) = v80[5];
    *(_OWORD *)(v79 + 96) = v114;
    *(_OWORD *)(v79 + 48) = v112;
    *(_OWORD *)(v79 + 64) = v113;
    long long v115 = v80[7];
    long long v116 = v80[8];
    long long v117 = v80[10];
    *(_OWORD *)(v79 + 144) = v80[9];
    *(_OWORD *)(v79 + 160) = v117;
    *(_OWORD *)(v79 + 112) = v115;
    *(_OWORD *)(v79 + 128) = v116;
    long long v118 = v80[11];
    long long v119 = v80[12];
    long long v120 = v80[14];
    *(_OWORD *)(v79 + 208) = v80[13];
    *(_OWORD *)(v79 + 224) = v120;
    *(_OWORD *)(v79 + 176) = v118;
    *(_OWORD *)(v79 + 192) = v119;
  }
  uint64_t v121 = v30[11];
  uint64_t v122 = a1 + v121;
  uint64_t v123 = (uint64_t *)((char *)a2 + v121);
  uint64_t v124 = *v123;
  char v125 = *((unsigned char *)v123 + 8);
  j__swift_retain();
  *(void *)uint64_t v122 = v124;
  *(unsigned char *)(v122 + 8) = v125;
  j__swift_release();
  return a1;
}

uint64_t sub_260530554(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2605305B4(uint64_t a1)
{
  return a1;
}

_OWORD *sub_260530608(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[5];
  long long v9 = (void *)((char *)a1 + v8);
  long long v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    *long long v9 = *v10;
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = (char *)v10 + v14;
    uint64_t v17 = sub_2605322D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    *(void *)((char *)v9 + *(int *)(v11 + 24)) = *(void *)((char *)v10 + *(int *)(v11 + 24));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v18 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  uint64_t v19 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v20 = (void *)((char *)a1 + v19);
  int v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = type metadata accessor for IntelligenceImage(0);
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v25 = type metadata accessor for IntelligenceImage.InternalRepresentation(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      *uint64_t v20 = *v21;
      uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
      id v27 = (char *)v20 + v26;
      uint64_t v28 = (char *)v21 + v26;
      uint64_t v29 = sub_2605323B0();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
      {
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
        memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      }
      uint64_t v32 = type metadata accessor for IntelligenceFile.Attributes(0);
      uint64_t v33 = *(int *)(v32 + 20);
      uint64_t v34 = &v27[v33];
      uint64_t v35 = &v28[v33];
      *(void *)uint64_t v34 = *(void *)v35;
      v34[8] = v35[8];
      uint64_t v61 = v32;
      uint64_t v36 = *(int *)(v32 + 24);
      uint64_t v62 = v27;
      __dst = &v27[v36];
      uint64_t v37 = &v28[v36];
      uint64_t v38 = sub_260532270();
      uint64_t v39 = *(void *)(v38 - 8);
      char v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
      uint64_t v59 = v39;
      if (v60(v37, 1, v38))
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(__dst, v37, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(__dst, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(__dst, 0, 1, v38);
      }
      uint64_t v41 = *(int *)(v61 + 28);
      uint64_t v42 = &v62[v41];
      uint64_t v43 = &v28[v41];
      if (v60(&v28[v41], 1, v38))
      {
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
        memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v42, v43, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v42, 0, 1, v38);
      }
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  uint64_t v45 = a3[10];
  uint64_t v46 = a3[11];
  uint64_t v47 = (_OWORD *)((char *)a1 + v45);
  uint64_t v48 = (_OWORD *)((char *)a2 + v45);
  long long v49 = v48[13];
  v47[12] = v48[12];
  v47[13] = v49;
  v47[14] = v48[14];
  long long v50 = v48[9];
  v47[8] = v48[8];
  v47[9] = v50;
  long long v51 = v48[11];
  v47[10] = v48[10];
  v47[11] = v51;
  long long v52 = v48[5];
  v47[4] = v48[4];
  v47[5] = v52;
  long long v53 = v48[7];
  v47[6] = v48[6];
  v47[7] = v53;
  long long v54 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v54;
  long long v55 = v48[3];
  v47[2] = v48[2];
  v47[3] = v55;
  uint64_t v56 = (char *)a1 + v46;
  uint64_t v57 = (char *)a2 + v46;
  *(void *)uint64_t v56 = *(void *)v57;
  v56[8] = v57[8];
  return a1;
}

uint64_t sub_260530BB0(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(void *)(a1 + 56) == 1) {
    goto LABEL_4;
  }
  uint64_t v6 = *(void *)(a2 + 56);
  if (v6 == 1)
  {
    sub_2604C1024(a1);
LABEL_4:
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    goto LABEL_6;
  }
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 36) = *(void *)(a2 + 36);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v10 = a3[5];
  uint64_t v11 = (void **)(a1 + v10);
  uint64_t v12 = (void **)(a2 + v10);
  uint64_t v13 = type metadata accessor for IntelligenceUserActivity();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      *uint64_t v11 = *v12;
      uint64_t v18 = *(int *)(v13 + 20);
      uint64_t v19 = (char *)v11 + v18;
      uint64_t v20 = (char *)v12 + v18;
      uint64_t v21 = sub_2605322D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
      *(void **)((char *)v11 + *(int *)(v13 + 24)) = *(void **)((char *)v12 + *(int *)(v13 + 24));
      (*(void (**)(void **, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v17)
  {
    sub_260530554((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for IntelligenceUserActivity);
LABEL_11:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
    memcpy(v11, v12, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_12;
  }
  uint64_t v39 = *v11;
  *uint64_t v11 = *v12;

  uint64_t v40 = *(int *)(v13 + 20);
  uint64_t v41 = (char *)v11 + v40;
  uint64_t v42 = (char *)v12 + v40;
  uint64_t v43 = sub_2605322D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 40))(v41, v42, v43);
  *(void **)((char *)v11 + *(int *)(v13 + 24)) = *(void **)((char *)v12 + *(int *)(v13 + 24));
  swift_release();
LABEL_12:
  uint64_t v23 = a3[6];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = type metadata accessor for IntelligenceImage(0);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      if (a1 == a2) {
        goto LABEL_37;
      }
      sub_260530554((uint64_t)v30, type metadata accessor for IntelligenceImage.InternalRepresentation);
      uint64_t v44 = type metadata accessor for IntelligenceImage.InternalRepresentation(0);
      if (!swift_getEnumCaseMultiPayload())
      {
        *uint64_t v30 = *v31;
        uint64_t v51 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
        long long v52 = (char *)v30 + v51;
        long long v53 = (char *)v31 + v51;
        uint64_t v54 = sub_2605323B0();
        uint64_t v55 = *(void *)(v54 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54))
        {
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
          memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v52, v53, v54);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
        }
        long long v92 = (int *)type metadata accessor for IntelligenceFile.Attributes(0);
        uint64_t v93 = v92[5];
        long long v94 = &v52[v93];
        long long v95 = &v53[v93];
        *(void *)long long v94 = *(void *)v95;
        v94[8] = v95[8];
        uint64_t v96 = v92[6];
        long long v112 = v52;
        __dsta = &v52[v96];
        long long v110 = v53;
        long long v97 = &v53[v96];
        uint64_t v98 = sub_260532270();
        uint64_t v99 = *(void *)(v98 - 8);
        long long v109 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v99 + 48);
        if (v109(v97, 1, v98))
        {
          uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(__dsta, v97, *(void *)(*(void *)(v100 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v99 + 32))(__dsta, v97, v98);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v99 + 56))(__dsta, 0, 1, v98);
        }
        uint64_t v101 = v99;
        uint64_t v102 = v92[7];
        long long v103 = &v112[v102];
        long long v104 = &v110[v102];
        if (v109(&v110[v102], 1, v98))
        {
          uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
          memcpy(v103, v104, *(void *)(*(void *)(v105 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v103, v104, v98);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v101 + 56))(v103, 0, 1, v98);
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_37;
      }
      size_t v38 = *(void *)(*(void *)(v44 - 8) + 64);
LABEL_19:
      memcpy(v30, v31, v38);
      goto LABEL_37;
    }
    sub_260530554((uint64_t)v30, type metadata accessor for IntelligenceImage);
LABEL_18:
    size_t v38 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8) - 8) + 64);
    goto LABEL_19;
  }
  if (v36) {
    goto LABEL_18;
  }
  uint64_t v37 = type metadata accessor for IntelligenceImage.InternalRepresentation(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v30, v31, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    *uint64_t v30 = *v31;
    uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A872190) + 48);
    uint64_t v46 = (char *)v30 + v45;
    uint64_t v47 = (char *)v31 + v45;
    uint64_t v48 = sub_2605323B0();
    uint64_t v49 = *(void *)(v48 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48))
    {
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E9088);
      memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
    uint64_t v57 = type metadata accessor for IntelligenceFile.Attributes(0);
    uint64_t v58 = *(int *)(v57 + 20);
    uint64_t v59 = &v46[v58];
    char v60 = &v47[v58];
    *(void *)uint64_t v59 = *(void *)v60;
    v59[8] = v60[8];
    uint64_t v108 = v57;
    uint64_t v61 = *(int *)(v57 + 24);
    long long v111 = v46;
    __dst = &v46[v61];
    uint64_t v62 = &v47[v61];
    uint64_t v63 = sub_260532270();
    uint64_t v64 = *(void *)(v63 - 8);
    long long v107 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48);
    uint64_t v106 = v64;
    if (v107(v62, 1, v63))
    {
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(__dst, v62, *(void *)(*(void *)(v65 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(__dst, v62, v63);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(__dst, 0, 1, v63);
    }
    uint64_t v66 = *(int *)(v108 + 28);
    long long v67 = &v111[v66];
    char v68 = &v47[v66];
    if (v107(&v47[v66], 1, v63))
    {
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8721A0);
      memcpy(v67, v68, *(void *)(*(void *)(v69 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v67, v68, v63);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v67, 0, 1, v63);
    }
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_37:
  uint64_t v70 = a3[10];
  uint64_t v71 = a1 + v70;
  uint64_t v72 = a2 + v70;
  if (!*(void *)(a1 + v70 + 48))
  {
LABEL_41:
    long long v80 = *(_OWORD *)(v72 + 208);
    *(_OWORD *)(v71 + 192) = *(_OWORD *)(v72 + 192);
    *(_OWORD *)(v71 + 208) = v80;
    *(_OWORD *)(v71 + 224) = *(_OWORD *)(v72 + 224);
    long long v81 = *(_OWORD *)(v72 + 144);
    *(_OWORD *)(v71 + 128) = *(_OWORD *)(v72 + 128);
    *(_OWORD *)(v71 + 144) = v81;
    long long v82 = *(_OWORD *)(v72 + 176);
    *(_OWORD *)(v71 + 160) = *(_OWORD *)(v72 + 160);
    *(_OWORD *)(v71 + 176) = v82;
    long long v83 = *(_OWORD *)(v72 + 80);
    *(_OWORD *)(v71 + 64) = *(_OWORD *)(v72 + 64);
    *(_OWORD *)(v71 + 80) = v83;
    long long v84 = *(_OWORD *)(v72 + 112);
    *(_OWORD *)(v71 + 96) = *(_OWORD *)(v72 + 96);
    *(_OWORD *)(v71 + 112) = v84;
    long long v85 = *(_OWORD *)(v72 + 16);
    *(_OWORD *)uint64_t v71 = *(_OWORD *)v72;
    *(_OWORD *)(v71 + 16) = v85;
    long long v86 = *(_OWORD *)(v72 + 48);
    *(_OWORD *)(v71 + 32) = *(_OWORD *)(v72 + 32);
    *(_OWORD *)(v71 + 48) = v86;
    goto LABEL_42;
  }
  if (!*(void *)(v72 + 48))
  {
    sub_2605305B4(v71);
    goto LABEL_41;
  }
  uint64_t v73 = *(void *)(v72 + 8);
  *(void *)uint64_t v71 = *(void *)v72;
  *(void *)(v71 + 8) = v73;
  swift_bridgeObjectRelease();
  char v74 = *(unsigned char *)(v72 + 32);
  uint64_t v75 = *(void *)(v71 + 16);
  uint64_t v76 = *(void *)(v71 + 24);
  char v77 = *(unsigned char *)(v71 + 32);
  *(_OWORD *)(v71 + 16) = *(_OWORD *)(v72 + 16);
  *(unsigned char *)(v71 + 32) = v74;
  sub_2604DB774(v75, v76, v77);
  uint64_t v78 = *(void *)(v72 + 48);
  *(void *)(v71 + 40) = *(void *)(v72 + 40);
  *(void *)(v71 + 48) = v78;
  swift_bridgeObjectRelease();
  uint64_t v79 = *(void *)(v72 + 64);
  *(void *)(v71 + 56) = *(void *)(v72 + 56);
  *(void *)(v71 + 64) = v79;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v71 + 72) = *(_OWORD *)(v72 + 72);
  *(_OWORD *)(v71 + 88) = *(_OWORD *)(v72 + 88);
  *(_OWORD *)(v71 + 104) = *(_OWORD *)(v72 + 104);
  *(_OWORD *)(v71 + 120) = *(_OWORD *)(v72 + 120);
  *(_OWORD *)(v71 + 136) = *(_OWORD *)(v72 + 136);
  *(_OWORD *)(v71 + 152) = *(_OWORD *)(v72 + 152);
  *(_OWORD *)(v71 + 168) = *(_OWORD *)(v72 + 168);
  *(_OWORD *)(v71 + 184) = *(_OWORD *)(v72 + 184);
  *(_OWORD *)(v71 + 200) = *(_OWORD *)(v72 + 200);
  *(_OWORD *)(v71 + 216) = *(_OWORD *)(v72 + 216);
  *(void *)(v71 + 232) = *(void *)(v72 + 232);
LABEL_42:
  uint64_t v87 = a3[11];
  uint64_t v88 = a1 + v87;
  uint64_t v89 = (uint64_t *)(a2 + v87);
  uint64_t v90 = *v89;
  LOBYTE(v89) = *((unsigned char *)v89 + 8);
  *(void *)uint64_t v88 = v90;
  *(unsigned char *)(v88 + 8) = (_BYTE)v89;
  j__swift_release();
  return a1;
}

uint64_t sub_260531698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2605316AC);
}

uint64_t sub_2605316AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + a3[9];
    return v15(v17, a2, v16);
  }
}

uint64_t sub_2605317F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260531808);
}

uint64_t sub_260531808(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8BE8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[6] + 8) = a2;
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3E8AD8);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_260531944()
{
  sub_260531A78(319, (unint64_t *)&unk_26B3E8BF0, (void (*)(uint64_t))type metadata accessor for IntelligenceUserActivity);
  if (v0 <= 0x3F)
  {
    sub_260531A78(319, (unint64_t *)&qword_26B3E8AE0, (void (*)(uint64_t))type metadata accessor for IntelligenceImage);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_260531A78(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_260532B40();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_260531AD0()
{
  unint64_t result = qword_26A873DF0;
  if (!qword_26A873DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A873DF0);
  }
  return result;
}

unint64_t sub_260531B28()
{
  unint64_t result = qword_26B3E8740;
  if (!qword_26B3E8740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8740);
  }
  return result;
}

unint64_t sub_260531B80()
{
  unint64_t result = qword_26B3E8738;
  if (!qword_26B3E8738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3E8738);
  }
  return result;
}

uint64_t sub_260531BD4()
{
  unint64_t v0 = sub_260532DC0();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_260531C20(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_260531C30()
{
  return MEMORY[0x270EEDDC8]();
}

uint64_t sub_260531C40()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_260531C50()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_260531C60()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_260531C70()
{
  return MEMORY[0x270EEDEE0]();
}

uint64_t sub_260531C80()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_260531C90()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_260531CA0()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_260531CB0()
{
  return MEMORY[0x270EEE088]();
}

uint64_t sub_260531CC0()
{
  return MEMORY[0x270EEE138]();
}

uint64_t sub_260531CD0()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_260531CE0()
{
  return MEMORY[0x270EEE1D8]();
}

uint64_t sub_260531CF0()
{
  return MEMORY[0x270EEE1F8]();
}

uint64_t sub_260531D00()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_260531D10()
{
  return MEMORY[0x270EEE2A0]();
}

uint64_t sub_260531D20()
{
  return MEMORY[0x270EEE620]();
}

uint64_t sub_260531D30()
{
  return MEMORY[0x270EEE630]();
}

uint64_t sub_260531D40()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_260531D50()
{
  return MEMORY[0x270EEE650]();
}

uint64_t sub_260531D60()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_260531D70()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_260531D80()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_260531D90()
{
  return MEMORY[0x270EEE698]();
}

uint64_t sub_260531DA0()
{
  return MEMORY[0x270EEE6A8]();
}

uint64_t sub_260531DB0()
{
  return MEMORY[0x270EEEA98]();
}

uint64_t sub_260531DC0()
{
  return MEMORY[0x270EEEAA0]();
}

uint64_t sub_260531DD0()
{
  return MEMORY[0x270EEEAE0]();
}

uint64_t sub_260531DE0()
{
  return MEMORY[0x270EEEB08]();
}

uint64_t sub_260531DF0()
{
  return MEMORY[0x270EEEB58]();
}

uint64_t sub_260531E00()
{
  return MEMORY[0x270EEEB60]();
}

uint64_t sub_260531E10()
{
  return MEMORY[0x270EEEB90]();
}

uint64_t sub_260531E20()
{
  return MEMORY[0x270EEEB98]();
}

uint64_t sub_260531E30()
{
  return MEMORY[0x270EEEBA0]();
}

uint64_t sub_260531E40()
{
  return MEMORY[0x270EEEBB0]();
}

uint64_t sub_260531E50()
{
  return MEMORY[0x270EEEC30]();
}

uint64_t sub_260531E60()
{
  return MEMORY[0x270EEEC50]();
}

uint64_t sub_260531E70()
{
  return MEMORY[0x270EEEC68]();
}

uint64_t sub_260531E80()
{
  return MEMORY[0x270EEEC78]();
}

uint64_t sub_260531E90()
{
  return MEMORY[0x270EEECA0]();
}

uint64_t sub_260531EA0()
{
  return MEMORY[0x270EEECB8]();
}

uint64_t sub_260531EB0()
{
  return MEMORY[0x270EEECC8]();
}

uint64_t sub_260531EC0()
{
  return MEMORY[0x270EEECE0]();
}

uint64_t sub_260531ED0()
{
  return MEMORY[0x270EEED00]();
}

uint64_t sub_260531EE0()
{
  return MEMORY[0x270EEED10]();
}

uint64_t sub_260531EF0()
{
  return MEMORY[0x270EEED20]();
}

uint64_t sub_260531F00()
{
  return MEMORY[0x270EEED58]();
}

uint64_t sub_260531F10()
{
  return MEMORY[0x270EEEDC8]();
}

uint64_t sub_260531F20()
{
  return MEMORY[0x270EEEDE0]();
}

uint64_t sub_260531F30()
{
  return MEMORY[0x270EEEDE8]();
}

uint64_t sub_260531F40()
{
  return MEMORY[0x270EEEE10]();
}

uint64_t sub_260531F50()
{
  return MEMORY[0x270EEEE30]();
}

uint64_t sub_260531F60()
{
  return MEMORY[0x270EEEE48]();
}

uint64_t sub_260531F70()
{
  return MEMORY[0x270EEEEF8]();
}

uint64_t sub_260531F80()
{
  return MEMORY[0x270FA1638]();
}

uint64_t sub_260531F90()
{
  return MEMORY[0x270EEEFB0]();
}

uint64_t sub_260531FA0()
{
  return MEMORY[0x270EEEFD8]();
}

uint64_t sub_260531FB0()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_260531FC0()
{
  return MEMORY[0x270EEF068]();
}

uint64_t sub_260531FD0()
{
  return MEMORY[0x270EEF078]();
}

uint64_t sub_260531FE0()
{
  return MEMORY[0x270EEF130]();
}

uint64_t sub_260531FF0()
{
  return MEMORY[0x270EEF148]();
}

uint64_t sub_260532000()
{
  return MEMORY[0x270EEF158]();
}

uint64_t sub_260532010()
{
  return MEMORY[0x270EEF1C0]();
}

uint64_t sub_260532020()
{
  return MEMORY[0x270EEF820]();
}

uint64_t sub_260532030()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_260532040()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_260532050()
{
  return MEMORY[0x270EEF910]();
}

uint64_t sub_260532060()
{
  return MEMORY[0x270EEF918]();
}

uint64_t sub_260532070()
{
  return MEMORY[0x270EEF920]();
}

uint64_t sub_260532080()
{
  return MEMORY[0x270EEFA88]();
}

uint64_t sub_260532090()
{
  return MEMORY[0x270EEFAA0]();
}

uint64_t sub_2605320A0()
{
  return MEMORY[0x270EEFBC8]();
}

uint64_t sub_2605320B0()
{
  return MEMORY[0x270EEFBE8]();
}

uint64_t sub_2605320C0()
{
  return MEMORY[0x270EEFC18]();
}

uint64_t sub_2605320D0()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2605320E0()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_2605320F0()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_260532100()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_260532110()
{
  return MEMORY[0x270EEFD60]();
}

uint64_t sub_260532120()
{
  return MEMORY[0x270FA1640]();
}

uint64_t sub_260532130()
{
  return MEMORY[0x270EEFDA0]();
}

uint64_t sub_260532140()
{
  return MEMORY[0x270EEFDE8]();
}

uint64_t sub_260532150()
{
  return MEMORY[0x270EEFDF8]();
}

uint64_t sub_260532160()
{
  return MEMORY[0x270EEFE10]();
}

uint64_t sub_260532170()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_260532180()
{
  return MEMORY[0x270EEFE30]();
}

uint64_t sub_260532190()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_2605321A0()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_2605321B0()
{
  return MEMORY[0x270EEFEC8]();
}

uint64_t sub_2605321C0()
{
  return MEMORY[0x270EEFF10]();
}

uint64_t sub_2605321D0()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2605321E0()
{
  return MEMORY[0x270EEFFA8]();
}

uint64_t sub_2605321F0()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_260532200()
{
  return MEMORY[0x270EEFFD8]();
}

uint64_t sub_260532210()
{
  return MEMORY[0x270EEFFF0]();
}

uint64_t sub_260532220()
{
  return MEMORY[0x270EF0068]();
}

uint64_t sub_260532230()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_260532240()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_260532250()
{
  return MEMORY[0x270EF0188]();
}

uint64_t sub_260532260()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_260532270()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_260532280()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_260532290()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_2605322A0()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_2605322B0()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_2605322C0()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_2605322D0()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2605322E0()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_2605322F0()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_260532300()
{
  return MEMORY[0x270FA06B0]();
}

uint64_t sub_260532310()
{
  return MEMORY[0x270FA06C0]();
}

uint64_t sub_260532320()
{
  return MEMORY[0x270FA06D0]();
}

uint64_t sub_260532330()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_260532340()
{
  return MEMORY[0x270FA16E8]();
}

uint64_t sub_260532350()
{
  return MEMORY[0x270FA1798]();
}

uint64_t sub_260532360()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_260532370()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_260532380()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_260532390()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_2605323A0()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_2605323B0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2605323C0()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2605323D0()
{
  return MEMORY[0x270FA2CB8]();
}

uint64_t sub_2605323E0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2605323F0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_260532400()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_260532410()
{
  return MEMORY[0x270FA2D10]();
}

uint64_t sub_260532420()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_260532430()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_260532440()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_260532450()
{
  return MEMORY[0x270FA2DA8]();
}

uint64_t sub_260532460()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_260532470()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_260532480()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_260532490()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2605324A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2605324B0()
{
  return MEMORY[0x270FA1A98]();
}

uint64_t sub_2605324C0()
{
  return MEMORY[0x270FA1AA8]();
}

uint64_t sub_2605324D0()
{
  return MEMORY[0x270FA1AC8]();
}

uint64_t sub_2605324E0()
{
  return MEMORY[0x270FA1AE8]();
}

uint64_t sub_2605324F0()
{
  return MEMORY[0x270FA1B38]();
}

uint64_t sub_260532500()
{
  return MEMORY[0x270FA1B50]();
}

uint64_t sub_260532510()
{
  return MEMORY[0x270FA1B98]();
}

uint64_t sub_260532520()
{
  return MEMORY[0x270FA1C80]();
}

uint64_t sub_260532530()
{
  return MEMORY[0x270FA1CB8]();
}

uint64_t sub_260532540()
{
  return MEMORY[0x270FA1D80]();
}

uint64_t sub_260532550()
{
  return MEMORY[0x270FA08C8]();
}

uint64_t sub_260532560()
{
  return MEMORY[0x270FA0978]();
}

uint64_t sub_260532570()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_260532580()
{
  return MEMORY[0x270FA09B0]();
}

uint64_t sub_260532590()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_2605325A0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_2605325B0()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_2605325C0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_2605325D0()
{
  return MEMORY[0x270FA0A90]();
}

uint64_t sub_2605325E0()
{
  return MEMORY[0x270FA0AA0]();
}

uint64_t sub_2605325F0()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_260532600()
{
  return MEMORY[0x270FA0AE0]();
}

uint64_t sub_260532610()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_260532620()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_260532630()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_260532640()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_260532650()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_260532660()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_260532670()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_260532680()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_260532690()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2605326A0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2605326B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2605326C0()
{
  return MEMORY[0x270EF18C8]();
}

uint64_t sub_2605326D0()
{
  return MEMORY[0x270EF1900]();
}

uint64_t sub_2605326E0()
{
  return MEMORY[0x270EF1920]();
}

uint64_t sub_2605326F0()
{
  return MEMORY[0x270EF1930]();
}

uint64_t sub_260532700()
{
  return MEMORY[0x270EF1940]();
}

uint64_t sub_260532710()
{
  return MEMORY[0x270EF1948]();
}

uint64_t sub_260532720()
{
  return MEMORY[0x270EF1960]();
}

uint64_t sub_260532730()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_260532740()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_260532750()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_260532760()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_260532770()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_260532780()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_260532790()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_2605327A0()
{
  return MEMORY[0x270EF1AE0]();
}

uint64_t sub_2605327B0()
{
  return MEMORY[0x270EF1B28]();
}

uint64_t sub_2605327C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2605327D0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2605327E0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2605327F0()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_260532800()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_260532810()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260532820()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_260532830()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_260532840()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260532850()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_260532860()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_260532870()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_260532890()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2605328A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2605328B0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2605328C0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2605328D0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2605328E0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2605328F0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_260532900()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_260532910()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_260532920()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_260532930()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_260532940()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_260532950()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_260532960()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_260532970()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_260532980()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_260532990()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2605329A0()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_2605329B0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2605329C0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2605329D0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2605329E0()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_2605329F0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_260532A00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_260532A10()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_260532A20()
{
  return MEMORY[0x270EF1F20]();
}

uint64_t sub_260532A30()
{
  return MEMORY[0x270EE58F8]();
}

uint64_t sub_260532A40()
{
  return MEMORY[0x270EF1F50]();
}

uint64_t sub_260532A50()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_260532A60()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_260532A70()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_260532A80()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_260532A90()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_260532AA0()
{
  return MEMORY[0x270FA0DF0]();
}

uint64_t sub_260532AB0()
{
  return MEMORY[0x270FA0E30]();
}

uint64_t sub_260532AC0()
{
  return MEMORY[0x270FA0E98]();
}

uint64_t sub_260532AD0()
{
  return MEMORY[0x270FA0EB8]();
}

uint64_t sub_260532AE0()
{
  return MEMORY[0x270FA0ED0]();
}

uint64_t sub_260532AF0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_260532B00()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_260532B10()
{
  return MEMORY[0x270FA0F60]();
}

uint64_t sub_260532B20()
{
  return MEMORY[0x270EF20F0]();
}

uint64_t sub_260532B30()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_260532B40()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_260532B50()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_260532B60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_260532B70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_260532B80()
{
  return MEMORY[0x270EF2580]();
}

uint64_t sub_260532B90()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_260532BA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_260532BC0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_260532BD0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_260532BE0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_260532BF0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_260532C00()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_260532C10()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_260532C20()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_260532C30()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_260532C40()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_260532C50()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_260532C60()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_260532C70()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_260532C80()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_260532C90()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_260532CA0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_260532CB0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260532CC0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_260532CD0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_260532CE0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_260532CF0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_260532D00()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_260532D10()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_260532D20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_260532D30()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_260532D40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_260532D50()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_260532D60()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_260532D70()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_260532D80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_260532D90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_260532DA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_260532DC0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_260532DD0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_260532DE0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_260532DF0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_260532E00()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_260532E10()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_260532E20()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_260532E30()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_260532E40()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_260532E50()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_260532E60()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_260532E70()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_260532E80()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_260532E90()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_260532EA0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_260532EB0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_260532EC0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_260532ED0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_260532EE0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_260532EF0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_260532F00()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_260532F10()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_260532F20()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_260532F30()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_260532F40()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_260532F50()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_260532F60()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_260532F70()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_260532F80()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_260532F90()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_260532FA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260532FB0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_260532FC0()
{
  return MEMORY[0x270F9F850]();
}

uint64_t sub_260532FD0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_260532FE0()
{
  return MEMORY[0x270F9F8E8]();
}

uint64_t sub_260532FF0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_260533010()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_260533020()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_260533030()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_260533040()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260533050()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260533060()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260533070()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260533080()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260533090()
{
  return MEMORY[0x270F9FC50]();
}

uint64_t sub_2605330A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2605330B0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2605330C0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2605330D0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2605330E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2605330F0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_260533100()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_260533110()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_260533120()
{
  return MEMORY[0x270F9FD98]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E60]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x270EE5720]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x270EE5748]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE8]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DB8](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA150]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA460](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x270EDA780]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB220](path, name, *(void *)&options);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB468](path, name, value, size, *(void *)&position, *(void *)&options);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5E0](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB608](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB860](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE50](name, targetq, flags);
}

uint64_t xpc_connection_set_non_launching()
{
  return MEMORY[0x270EDBEF8]();
}