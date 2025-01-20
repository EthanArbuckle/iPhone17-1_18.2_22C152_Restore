uint64_t type metadata accessor for StartChildTextRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A6399D8);
}

uint64_t sub_25D077564(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartChildTextRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartChildTextRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3629B0);
}

void sub_25D0775E0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t started = (int *)type metadata accessor for StartChildTextRequestMessage.Builder(0);
  uint64_t v7 = a2 + started[6];
  v8 = (int *)type metadata accessor for StartRequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + v8[6]);
  v9 = (uint64_t *)(a2 + started[7]);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  v12 = (void *)(a1 + v8[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  *(unsigned char *)(a1 + v8[8]) = *(unsigned char *)(a2 + started[8]);
  v13 = *(void **)(a2 + started[9]);
  uint64_t v14 = v8[9];
  v15 = *(void **)(a1 + v14);
  id v16 = v13;

  *(void *)(a1 + v14) = v13;
}

void *StartChildTextRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartChildTextRequestMessage.init(from:)(a1);
}

void *StartChildTextRequestMessage.init(from:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v23 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  int v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6399B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_16();
  uint64_t v13 = a1[4];
  uint64_t v24 = (uint64_t)a1;
  uint64_t v14 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D078944();
  v15 = v4;
  sub_25D0BDA20();
  if (v2)
  {

    OUTLINED_FUNCTION_12_13();
    __swift_destroy_boxed_opaque_existential_1(v3);
    if ((v13 & 1) == 0)
    {
      if (v10)
      {
        swift_bridgeObjectRelease();
        if (!v11)
        {
LABEL_7:
          if (!v14)
          {
LABEL_9:
            type metadata accessor for StartChildTextRequestMessage(0);
            swift_deallocPartialClassInstance();
            return v14;
          }
LABEL_8:
          sub_25D014910(*(void *)&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType], *(void *)&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType + 8]);
          goto LABEL_9;
        }
      }
      else if (!v11)
      {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v22 + 8))(&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_orchestrationTaskId], v23);
      if (!v14) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v16 = sub_25D0BD780();
    v17 = (uint64_t *)&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_rootRequestId];
    uint64_t *v17 = v16;
    v17[1] = v18;
    LOBYTE(v25[0]) = 1;
    sub_25CFA2094(&qword_26A637400);
    sub_25D0BD7E0();
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_orchestrationTaskId], v10, v23);
    sub_25D078990();
    OUTLINED_FUNCTION_5_33();
    *(_OWORD *)&v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType] = v25[0];
    char v26 = 3;
    sub_25CF9989C();
    OUTLINED_FUNCTION_5_33();
    v19 = &v15[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_routingDecision];
    *(_OWORD *)v19 = v25[0];
    *((_OWORD *)v19 + 1) = v25[1];
    *((_OWORD *)v19 + 2) = v25[2];
    *((_OWORD *)v19 + 3) = v25[3];

    sub_25CF68E70(v24, (uint64_t)v25);
    uint64_t v14 = StartTextRequestMessage.init(from:)((uint64_t)v25);
    OUTLINED_FUNCTION_1_36();
    v21();
    __swift_destroy_boxed_opaque_existential_1(v24);
  }
  return v14;
}

uint64_t sub_25D077B4C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6399C8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_16();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D078944();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25D0BCFE0();
    sub_25CFA2094(&qword_26B3647C0);
    sub_25D0BD8E0();
    sub_25D0789DC();
    OUTLINED_FUNCTION_5_8();
    sub_25CF99934();
    OUTLINED_FUNCTION_5_8();
    sub_25D07EEEC(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void StartChildTextRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartChildTextRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartChildTextRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.sessionId.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 24);
  return sub_25CF67F88(v2, v0);
}

uint64_t StartChildTextRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartChildTextRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartChildTextRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.inputOrigin.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_18();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartChildTextRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartChildTextRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartChildTextRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartChildTextRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_2_31() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartChildTextRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.rootRequestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartChildTextRequestMessage.Builder.rootRequestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.rootRequestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.orchestrationTaskId.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 44);
  return sub_25CF67F88(v2, v0);
}

uint64_t StartChildTextRequestMessage.Builder.orchestrationTaskId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 44);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartChildTextRequestMessage.Builder.orchestrationTaskId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.textRequestType.getter()
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 48));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  *uint64_t v0 = *v2;
  v0[1] = v4;
  return sub_25D07892C(v3, v4);
}

uint64_t StartChildTextRequestMessage.Builder.textRequestType.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 48));
  uint64_t result = sub_25D078A28(*v4, v4[1]);
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.textRequestType.modify())(void)
{
  return nullsub_1;
}

uint64_t StartChildTextRequestMessage.Builder.routingDecision.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_18();
  uint64_t v3 = OUTLINED_FUNCTION_1_8(v1 + *(int *)(v2 + 52));
  *uint64_t v0 = v3;
  v0[1] = v4;
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v7;
  v0[5] = v8;
  v0[6] = v9;
  v0[7] = v10;
  return sub_25CF99710(v3, v4, v5, v6, v7, v8);
}

__n128 StartChildTextRequestMessage.Builder.routingDecision.setter(__n128 *a1)
{
  __n128 v7 = a1[1];
  __n128 v8 = *a1;
  __n128 v6 = a1[2];
  unint64_t v2 = a1[3].n128_u64[0];
  unint64_t v3 = a1[3].n128_u64[1];
  uint64_t v4 = (__n128 *)(v1 + *(int *)(type metadata accessor for StartChildTextRequestMessage.Builder(0) + 52));
  sub_25CF999CC(v4->n128_u64[0], v4->n128_i64[1], v4[1].n128_i64[0], v4[1].n128_i64[1], v4[2].n128_i64[0], v4[2].n128_u64[1]);
  *uint64_t v4 = v8;
  v4[1] = v7;
  __n128 result = v6;
  v4[2] = v6;
  v4[3].n128_u64[0] = v2;
  v4[3].n128_u64[1] = v3;
  return result;
}

uint64_t (*StartChildTextRequestMessage.Builder.routingDecision.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D078428()
{
  unint64_t v0 = sub_25D0BD6F0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25D078478(char a1)
{
  uint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unsigned int v3 = 1954047348;
      goto LABEL_4;
    case 3:
      uint64_t result = 0x44676E6974756F72;
      break;
    default:
      unsigned int v3 = 1953460082;
LABEL_4:
      uint64_t result = v3 | 0x7571655200000000;
      break;
  }
  return result;
}

uint64_t sub_25D07852C(char a1)
{
  uint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unsigned int v3 = 1954047348;
      goto LABEL_4;
    case 3:
      uint64_t result = 0x44676E6974756F72;
      break;
    default:
      unsigned int v3 = 1953460082;
LABEL_4:
      uint64_t result = v3 | 0x7571655200000000;
      break;
  }
  return result;
}

uint64_t sub_25D0785E0(unsigned __int8 *a1, char *a2)
{
  return sub_25CF7EF14(*a1, *a2);
}

uint64_t sub_25D0785EC()
{
  return sub_25D08117C(*v0);
}

uint64_t sub_25D0785F4()
{
  return sub_25D081CAC();
}

uint64_t sub_25D0785FC()
{
  return sub_25D082AA8();
}

uint64_t sub_25D078604@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D078428();
  *a1 = result;
  return result;
}

uint64_t sub_25D078634@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25D078478(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25D078660()
{
  return sub_25D07852C(*v0);
}

uint64_t sub_25D078668@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D078474();
  *a1 = result;
  return result;
}

uint64_t sub_25D078690(uint64_t a1)
{
  unint64_t v2 = sub_25D078944();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0786CC(uint64_t a1)
{
  unint64_t v2 = sub_25D078944();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartChildTextRequestMessage.__allocating_init(build:)()
{
}

void StartChildTextRequestMessage.init(build:)()
{
}

uint64_t sub_25D078768()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_orchestrationTaskId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  sub_25D014910(*(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType), *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType + 8));
  uint64_t v3 = OUTLINED_FUNCTION_1_8(v0 + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_routingDecision);
  return sub_25CF99774(v3, v4, v5, v6, v7, v8);
}

id StartChildTextRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartChildTextRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0788E4()
{
  return StartChildTextRequestMessage.rootRequestId.getter();
}

uint64_t sub_25D078908@<X0>(uint64_t *a1@<X8>)
{
  return StartChildTextRequestMessage.routingDecision.getter(a1);
}

uint64_t sub_25D07892C(uint64_t a1, uint64_t a2)
{
  if (a2 != 2) {
    return sub_25D014938(a1, a2);
  }
  return a1;
}

void sub_25D07893C(uint64_t a1)
{
  sub_25D0775E0(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D078944()
{
  unint64_t result = qword_26A6399B8;
  if (!qword_26A6399B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399B8);
  }
  return result;
}

unint64_t sub_25D078990()
{
  unint64_t result = qword_26A6399C0;
  if (!qword_26A6399C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399C0);
  }
  return result;
}

unint64_t sub_25D0789DC()
{
  unint64_t result = qword_26A6399D0;
  if (!qword_26A6399D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399D0);
  }
  return result;
}

uint64_t sub_25D078A28(uint64_t a1, uint64_t a2)
{
  if (a2 != 2) {
    return sub_25D014910(a1, a2);
  }
  return a1;
}

uint64_t sub_25D078A38()
{
  return type metadata accessor for StartChildTextRequestMessage(0);
}

uint64_t sub_25D078A40()
{
  uint64_t result = sub_25D0BCFE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for StartChildTextRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartChildTextRequestMessage);
}

uint64_t dispatch thunk of StartChildTextRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

void *initializeBufferWithCopyOfBuffer for StartChildTextRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    v21 = *(void **)((char *)a2 + v19);
    *(void *)((char *)v4 + v19) = v21;
    uint64_t v22 = (void *)((char *)v4 + v20);
    uint64_t v23 = (void *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[11];
    char v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    swift_bridgeObjectRetain();
    id v28 = v21;
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v11))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v26, v27, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v11);
    }
    uint64_t v30 = a3[12];
    v31 = (char *)v4 + v30;
    v32 = (char *)a2 + v30;
    uint64_t v33 = *((void *)v32 + 1);
    if (v33 == 1 || v33 == 2)
    {
      *(_OWORD *)v31 = *(_OWORD *)v32;
    }
    else
    {
      *(void *)v31 = *(void *)v32;
      *((void *)v31 + 1) = v33;
      swift_bridgeObjectRetain();
    }
    uint64_t v34 = a3[13];
    v35 = (char *)v4 + v34;
    v36 = (char *)a2 + v34;
    uint64_t v37 = *((void *)v36 + 5);
    if ((v37 & 0x7FFFFFFFFFFFFFFELL) == 0x1FFFFFFFELL)
    {
      long long v38 = *((_OWORD *)v36 + 1);
      *(_OWORD *)v35 = *(_OWORD *)v36;
      *((_OWORD *)v35 + 1) = v38;
      long long v39 = *((_OWORD *)v36 + 3);
      *((_OWORD *)v35 + 2) = *((_OWORD *)v36 + 2);
      *((_OWORD *)v35 + 3) = v39;
    }
    else
    {
      uint64_t v40 = *(void *)v36;
      uint64_t v41 = *((void *)v36 + 1);
      uint64_t v42 = *((void *)v36 + 2);
      uint64_t v43 = *((void *)v36 + 3);
      uint64_t v44 = *((void *)v36 + 4);
      uint64_t v45 = *((void *)v36 + 6);
      uint64_t v46 = *((void *)v36 + 7);
      sub_25CF98250(*(void *)v36, v41, v42, v43, v44, *((void *)v36 + 5));
      *(void *)v35 = v40;
      *((void *)v35 + 1) = v41;
      *((void *)v35 + 2) = v42;
      *((void *)v35 + 3) = v43;
      *((void *)v35 + 4) = v44;
      *((void *)v35 + 5) = v37;
      *((void *)v35 + 6) = v45;
      *((void *)v35 + 7) = v46;
    }
  }
  return v4;
}

uint64_t destroy for StartChildTextRequestMessage.Builder(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[11];
  if (!__swift_getEnumTagSinglePayload(v6, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v6, v5);
  }
  uint64_t result = *(void *)(a1 + a2[12] + 8);
  if ((unint64_t)(result - 1) >= 2) {
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v8 = (uint64_t *)(a1 + a2[13]);
  unint64_t v9 = v8[5];
  if ((v9 & 0x7FFFFFFFFFFFFFFELL) != 0x1FFFFFFFELL)
  {
    uint64_t v10 = *v8;
    uint64_t v11 = v8[1];
    uint64_t v12 = v8[2];
    uint64_t v13 = v8[3];
    uint64_t v14 = v8[4];
    return sub_25CF99774(v10, v11, v12, v13, v14, v9);
  }
  return result;
}

uint64_t initializeWithCopy for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  uint64_t v20 = (void *)(a1 + v18);
  v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  swift_bridgeObjectRetain();
  id v26 = v19;
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v10))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v24, v25, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v10);
  }
  uint64_t v28 = a3[12];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = *(void *)(v30 + 8);
  if (v31 == 1 || v31 == 2)
  {
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  }
  else
  {
    *(void *)uint64_t v29 = *(void *)v30;
    *(void *)(v29 + 8) = v31;
    swift_bridgeObjectRetain();
  }
  uint64_t v32 = a3[13];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t *)(a2 + v32);
  uint64_t v35 = v34[5];
  if ((v35 & 0x7FFFFFFFFFFFFFFELL) == 0x1FFFFFFFELL)
  {
    long long v36 = *((_OWORD *)v34 + 1);
    *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
    *(_OWORD *)(v33 + 16) = v36;
    long long v37 = *((_OWORD *)v34 + 3);
    *(_OWORD *)(v33 + 32) = *((_OWORD *)v34 + 2);
    *(_OWORD *)(v33 + 48) = v37;
  }
  else
  {
    uint64_t v38 = *v34;
    uint64_t v39 = v34[1];
    uint64_t v40 = v34[2];
    uint64_t v41 = v34[3];
    uint64_t v42 = v34[4];
    uint64_t v43 = v34[6];
    uint64_t v44 = v34[7];
    sub_25CF98250(*v34, v39, v40, v41, v42, v34[5]);
    *(void *)uint64_t v33 = v38;
    *(void *)(v33 + 8) = v39;
    *(void *)(v33 + 16) = v40;
    *(void *)(v33 + 24) = v41;
    *(void *)(v33 + 32) = v42;
    *(void *)(v33 + 40) = v35;
    *(void *)(v33 + 48) = v43;
    *(void *)(v33 + 56) = v44;
  }
  return a1;
}

uint64_t assignWithCopy for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v24);
  id v26 = (const void *)(a2 + v24);
  int v27 = __swift_getEnumTagSinglePayload(a1 + v24, 1, v9);
  int v28 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v9);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v25, v26, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(v9 - 8);
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v25, v9);
LABEL_12:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v29 + 24))(v25, v26, v9);
LABEL_13:
  uint64_t v31 = a3[12];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)(a1 + v31 + 8);
  uint64_t v35 = *(void *)(a2 + v31 + 8);
  if (v34 == 2)
  {
    if (v35 != 1 && v35 != 2) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }
  if (v35 == 2)
  {
    sub_25D079734(v32);
LABEL_26:
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
    goto LABEL_27;
  }
  if (v34 == 1)
  {
    if (v35 != 1)
    {
LABEL_21:
      *(void *)uint64_t v32 = *(void *)v33;
      *(void *)(v32 + 8) = *(void *)(v33 + 8);
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v35 == 1)
  {
    sub_25D0796E0(v32);
    goto LABEL_26;
  }
  *(void *)uint64_t v32 = *(void *)v33;
  *(void *)(v32 + 8) = *(void *)(v33 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_27:
  uint64_t v36 = a3[13];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (long long *)(a2 + v36);
  uint64_t v39 = *(void *)(a1 + v36 + 40) & 0x7FFFFFFFFFFFFFFELL;
  unint64_t v40 = *(void *)(a2 + v36 + 40);
  uint64_t v41 = v40 & 0x7FFFFFFFFFFFFFFELL;
  if (v39 == 0x1FFFFFFFELL)
  {
    if (v41 == 0x1FFFFFFFELL)
    {
      long long v42 = *v38;
      long long v43 = v38[1];
      long long v44 = v38[3];
      *(_OWORD *)(v37 + 32) = v38[2];
      *(_OWORD *)(v37 + 48) = v44;
      *(_OWORD *)uint64_t v37 = v42;
      *(_OWORD *)(v37 + 16) = v43;
    }
    else
    {
      uint64_t v48 = *(void *)v38;
      uint64_t v49 = *((void *)v38 + 1);
      uint64_t v50 = *((void *)v38 + 2);
      uint64_t v51 = *((void *)v38 + 3);
      uint64_t v52 = *((void *)v38 + 4);
      uint64_t v53 = *((void *)v38 + 6);
      uint64_t v54 = *((void *)v38 + 7);
      sub_25CF98250(v48, v49, v50, v51, v52, v40);
      *(void *)uint64_t v37 = v48;
      *(void *)(v37 + 8) = v49;
      *(void *)(v37 + 16) = v50;
      *(void *)(v37 + 24) = v51;
      *(void *)(v37 + 32) = v52;
      *(void *)(v37 + 40) = v40;
      *(void *)(v37 + 48) = v53;
      *(void *)(v37 + 56) = v54;
    }
  }
  else if (v41 == 0x1FFFFFFFELL)
  {
    sub_25CF9A25C(v37);
    long long v45 = v38[3];
    long long v47 = *v38;
    long long v46 = v38[1];
    *(_OWORD *)(v37 + 32) = v38[2];
    *(_OWORD *)(v37 + 48) = v45;
    *(_OWORD *)uint64_t v37 = v47;
    *(_OWORD *)(v37 + 16) = v46;
  }
  else
  {
    uint64_t v55 = *(void *)v38;
    uint64_t v56 = *((void *)v38 + 1);
    uint64_t v57 = *((void *)v38 + 2);
    uint64_t v58 = *((void *)v38 + 3);
    uint64_t v59 = *((void *)v38 + 4);
    uint64_t v60 = *((void *)v38 + 6);
    uint64_t v61 = *((void *)v38 + 7);
    sub_25CF98250(v55, v56, v57, v58, v59, v40);
    uint64_t v62 = *(void *)v37;
    uint64_t v63 = *(void *)(v37 + 8);
    uint64_t v64 = *(void *)(v37 + 16);
    uint64_t v65 = *(void *)(v37 + 24);
    uint64_t v66 = *(void *)(v37 + 32);
    unint64_t v67 = *(void *)(v37 + 40);
    *(void *)uint64_t v37 = v55;
    *(void *)(v37 + 8) = v56;
    *(void *)(v37 + 16) = v57;
    *(void *)(v37 + 24) = v58;
    *(void *)(v37 + 32) = v59;
    *(void *)(v37 + 40) = v40;
    *(void *)(v37 + 48) = v60;
    *(void *)(v37 + 56) = v61;
    sub_25CF99774(v62, v63, v64, v65, v66, v67);
  }
  return a1;
}

uint64_t sub_25D0796E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_25D079734(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  if (__swift_getEnumTagSinglePayload(a2 + v13, 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v14, v15, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v9);
  }
  uint64_t v17 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  uint64_t v18 = (_OWORD *)(a1 + v17);
  uint64_t v19 = (_OWORD *)(a2 + v17);
  long long v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  long long v21 = v19[3];
  v18[2] = v19[2];
  v18[3] = v21;
  return a1;
}

uint64_t assignWithTake for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  long long v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[11];
  int v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  int v30 = __swift_getEnumTagSinglePayload(a1 + v27, 1, v10);
  int v31 = __swift_getEnumTagSinglePayload((uint64_t)v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v28, v29, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v32 = *(void *)(v10 - 8);
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v32 + 8))(v28, v10);
LABEL_12:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v32 + 40))(v28, v29, v10);
LABEL_13:
  uint64_t v34 = a3[12];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = (_OWORD *)(a2 + v34);
  uint64_t v37 = *(void *)(a1 + v34 + 8);
  uint64_t v38 = *(void *)(a2 + v34 + 8);
  if (v37 == 2)
  {
LABEL_19:
    *(_OWORD *)uint64_t v35 = *v36;
    goto LABEL_20;
  }
  if (v38 == 2)
  {
    sub_25D079734(v35);
    goto LABEL_19;
  }
  if (v37 == 1) {
    goto LABEL_19;
  }
  if (v38 == 1)
  {
    sub_25D0796E0(v35);
    goto LABEL_19;
  }
  *(void *)uint64_t v35 = *(void *)v36;
  *(void *)(v35 + 8) = v38;
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t v39 = a3[13];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  unint64_t v42 = *(void *)(a1 + v39 + 40);
  if ((v42 & 0x7FFFFFFFFFFFFFFELL) != 0x1FFFFFFFELL)
  {
    uint64_t v43 = *(void *)(v41 + 40);
    if ((v43 & 0x7FFFFFFFFFFFFFFELL) != 0x1FFFFFFFELL)
    {
      uint64_t v46 = *(void *)(v41 + 32);
      uint64_t v47 = *(void *)v40;
      uint64_t v48 = *(void *)(v40 + 8);
      uint64_t v49 = *(void *)(v40 + 16);
      uint64_t v50 = *(void *)(v40 + 24);
      uint64_t v51 = *(void *)(v40 + 32);
      long long v52 = *(_OWORD *)(v41 + 16);
      *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
      *(_OWORD *)(v40 + 16) = v52;
      *(void *)(v40 + 32) = v46;
      *(void *)(v40 + 40) = v43;
      *(_OWORD *)(v40 + 48) = *(_OWORD *)(v41 + 48);
      sub_25CF99774(v47, v48, v49, v50, v51, v42);
      return a1;
    }
    sub_25CF9A25C(v40);
  }
  long long v44 = *(_OWORD *)(v41 + 16);
  *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  *(_OWORD *)(v40 + 16) = v44;
  long long v45 = *(_OWORD *)(v41 + 48);
  *(_OWORD *)(v40 + 32) = *(_OWORD *)(v41 + 32);
  *(_OWORD *)(v40 + 48) = v45;
  return a1;
}

uint64_t getEnumTagSinglePayload for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D079D44);
}

uint64_t sub_25D079D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartChildTextRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D079DF0);
}

uint64_t sub_25D079DF0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D079E74()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartChildTextRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D07A00CLL);
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

ValueMetadata *type metadata accessor for StartChildTextRequestMessage.CodingKeys()
{
  return &type metadata for StartChildTextRequestMessage.CodingKeys;
}

unint64_t sub_25D07A048()
{
  unint64_t result = qword_26A6399E8;
  if (!qword_26A6399E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399E8);
  }
  return result;
}

unint64_t sub_25D07A098()
{
  unint64_t result = qword_26A6399F0;
  if (!qword_26A6399F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399F0);
  }
  return result;
}

unint64_t sub_25D07A0E8()
{
  unint64_t result = qword_26A6399F8;
  if (!qword_26A6399F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6399F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return type metadata accessor for StartChildTextRequestMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_5_33()
{
  return sub_25D0BD7E0();
}

uint64_t OUTLINED_FUNCTION_8_18()
{
  return type metadata accessor for StartChildTextRequestMessage.Builder(0);
}

uint64_t sub_25D07A1B0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025D0C54C0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D07A238()
{
  return 0xD000000000000011;
}

uint64_t sub_25D07A258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D07A1B0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D07A284(uint64_t a1)
{
  unint64_t v2 = sub_25D07B2E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D07A2C0(uint64_t a1)
{
  unint64_t v2 = sub_25D07B2E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StartCorrectedSpeechRequestMessage.previousUtterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *StartCorrectedSpeechRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartCorrectedSpeechRequestMessage.init(build:)(a1);
}

void *StartCorrectedSpeechRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v46 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v6);
  long long v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0);
  uint64_t v9 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  uint64_t v11 = (unsigned __int8 *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v11 = 14;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  uint64_t v12 = (uint64_t)&v11[v9[8]];
  uint64_t v13 = v4;
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v4);
  uint64_t v14 = &v11[v9[9]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = v9[10];
  v11[v15] = 19;
  uint64_t v16 = &v11[v9[11]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  *(void *)&v11[v9[12]] = 0;
  uint64_t v17 = v1;
  v46(v11);
  int v18 = *v11;
  if (v18 == 14 || (uint64_t v19 = *((void *)v11 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v46 = (void (*)(unsigned __int8 *))*((void *)v11 + 1);
  sub_25CF67F88(v12, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v13) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25D0BD240();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B366B88);
    long long v21 = sub_25D0BD230();
    os_log_type_t v22 = sub_25D0BD4B0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v48 = v24;
      *(_DWORD *)uint64_t v23 = 136446210;
      uint64_t v25 = sub_25CF695B0();
      uint64_t v47 = sub_25D04E590(v25, v26, &v48);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v21, v22, "Could not build %{public}s: Builder has missing required fields", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v24, -1, -1);
      MEMORY[0x2611A4870](v23, -1, -1);
    }

    sub_25D07A878((uint64_t)v11);
    type metadata accessor for StartCorrectedSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v42 = v19;
  uint64_t v29 = v43;
  uint64_t v30 = v13;
  int v31 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v44, v2, v30);
  uint64_t v32 = *((void *)v14 + 1);
  if (!v32)
  {

    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v30);
    goto LABEL_6;
  }
  uint64_t v41 = v30;
  int v33 = v11[v15];
  if (v33 == 19)
  {

    (*(void (**)(char *, uint64_t))(v29 + 8))(v44, v41);
    goto LABEL_6;
  }
  uint64_t v34 = *(void *)v14;
  uint64_t v35 = *((void *)v16 + 1);
  uint64_t v36 = &v17[OBJC_IVAR____TtC16SiriMessageTypes34StartCorrectedSpeechRequestMessage_previousUtterance];
  *(void *)uint64_t v36 = *(void *)v16;
  *((void *)v36 + 1) = v35;
  swift_bridgeObjectRetain();
  uint64_t v37 = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v38);
  *((unsigned char *)&v41 - 64) = v18;
  *(&v41 - 7) = (uint64_t)v46;
  *(&v41 - 6) = v37;
  uint64_t v39 = v44;
  *(&v41 - 5) = (uint64_t)v44;
  *(&v41 - 4) = v34;
  *(&v41 - 3) = v32;
  *((unsigned char *)&v41 - 16) = v33;
  *(&v41 - 1) = (uint64_t)v11;
  uint64_t v27 = (void *)StartTextRequestMessage.init(build:)(sub_25D07B2AC);
  id v40 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v41);
  if (v27) {

  }
  sub_25D07A878((uint64_t)v11);
  return v27;
}

uint64_t type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639A18);
}

uint64_t sub_25D07A878(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartCorrectedSpeechRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365250);
}

void sub_25D07A8F4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  *(unsigned char *)a1 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  uint64_t started = (int *)type metadata accessor for StartRequestMessageBase.Builder(0);
  uint64_t v17 = a1 + started[6];
  sub_25CF69FC0(v17);
  uint64_t v18 = sub_25D0BCFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v17, a5, v18);
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v18);
  uint64_t v19 = (void *)(a1 + started[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void *v19 = a6;
  v19[1] = a7;
  *(unsigned char *)(a1 + started[8]) = a8;
  uint64_t v20 = *(void **)(a9 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 40));
  uint64_t v21 = started[9];
  os_log_type_t v22 = *(void **)(a1 + v21);
  id v23 = v20;

  *(void *)(a1 + v21) = v20;
}

void *StartCorrectedSpeechRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartCorrectedSpeechRequestMessage.init(from:)(a1);
}

void *StartCorrectedSpeechRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A00);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07B2E8();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v13)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StartCorrectedSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD720();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes34StartCorrectedSpeechRequestMessage_previousUtterance];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v12);
    uint64_t v6 = StartTextRequestMessage.init(from:)((uint64_t)v12);
    uint64_t v10 = OUTLINED_FUNCTION_2();
    v11(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D07AC58(void *a1)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A10);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07B2E8();
  sub_25D0BDA30();
  if (!*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes34StartCorrectedSpeechRequestMessage_previousUtterance + 8)
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_26B364660), sub_25CF6C184(), sub_25D0BD8E0(), !v2))
  {
    sub_25D07EEEC(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
}

void StartCorrectedSpeechRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartCorrectedSpeechRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.previousUtterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartCorrectedSpeechRequestMessage.Builder.previousUtterance.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.previousUtterance.modify())(void)
{
  return nullsub_1;
}

void *StartCorrectedSpeechRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0) + 40));
  id v2 = v1;
  return v1;
}

void StartCorrectedSpeechRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_4_34() + 40);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartCorrectedSpeechRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

void StartCorrectedSpeechRequestMessage.__allocating_init(build:)()
{
}

void StartCorrectedSpeechRequestMessage.init(build:)()
{
}

uint64_t sub_25D07B254()
{
  return OUTLINED_FUNCTION_1();
}

id StartCorrectedSpeechRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartCorrectedSpeechRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25D07B2AC(uint64_t a1)
{
  sub_25D07A8F4(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64), *(void *)(v1 + 72));
}

unint64_t sub_25D07B2E8()
{
  unint64_t result = qword_26A639A08;
  if (!qword_26A639A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A08);
  }
  return result;
}

uint64_t sub_25D07B334()
{
  return type metadata accessor for StartCorrectedSpeechRequestMessage(0);
}

uint64_t sub_25D07B33C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartCorrectedSpeechRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartCorrectedSpeechRequestMessage);
}

uint64_t dispatch thunk of StartCorrectedSpeechRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void *initializeBufferWithCopyOfBuffer for StartCorrectedSpeechRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = (void *)((char *)v4 + v19);
    os_log_type_t v22 = (void *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = *(void **)((char *)a2 + v20);
    *(void *)((char *)v4 + v20) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v25 = v24;
  }
  return v4;
}

void destroy for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 40));
}

uint64_t initializeWithCopy for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v17);
  uint64_t v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  os_log_type_t v22 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v22;
  return a1;
}

uint64_t assignWithCopy for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[10];
  uint64_t v21 = *(void **)(a1 + v20);
  os_log_type_t v22 = *(void **)(a2 + v20);
  *(void *)(a1 + v20) = v22;
  id v23 = v22;

  return a1;
}

uint64_t initializeWithTake for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

uint64_t assignWithTake for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v21 = (void *)(a1 + v20);
  os_log_type_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  unint64_t v26 = *(void **)(a1 + v25);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);

  return a1;
}

uint64_t getEnumTagSinglePayload for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D07BC5C);
}

uint64_t sub_25D07BC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartCorrectedSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D07BD08);
}

uint64_t sub_25D07BD08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D07BD8C()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartCorrectedSpeechRequestMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D07BEE0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartCorrectedSpeechRequestMessage.CodingKeys()
{
  return &type metadata for StartCorrectedSpeechRequestMessage.CodingKeys;
}

unint64_t sub_25D07BF1C()
{
  unint64_t result = qword_26A639A28;
  if (!qword_26A639A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A28);
  }
  return result;
}

unint64_t sub_25D07BF6C()
{
  unint64_t result = qword_26A639A30;
  if (!qword_26A639A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A30);
  }
  return result;
}

unint64_t sub_25D07BFBC()
{
  unint64_t result = qword_26A639A38;
  if (!qword_26A639A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A38);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_34()
{
  return type metadata accessor for StartCorrectedSpeechRequestMessage.Builder(0);
}

uint64_t StartDirectActionRequestMessage.__allocating_init(build:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartTextRequestMessage.init(build:)(a1);
}

void *StartDirectActionRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartDirectActionRequestMessage.init(from:)(a1);
}

void *StartDirectActionRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartTextRequestMessage.init(from:)((uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

id StartDirectActionRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartDirectActionRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartDirectActionRequestMessage()
{
  uint64_t result = qword_26B365088;
  if (!qword_26B365088) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D07C18C()
{
  return type metadata accessor for StartDirectActionRequestMessage();
}

void StartIFRequestMessage.inputOrigin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_inputOrigin);
}

id StartIFRequestMessage.requestContextData.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_requestContextData);
}

uint64_t StartIFRequestMessage.rootRequestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartIFRequestMessage.orchestrationTaskId.getter()
{
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return v1(v0);
}

void *StartIFRequestMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return StartIFRequestMessage.init(build:)(a1);
}

void *StartIFRequestMessage.init(build:)(void (*a1)(uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for StartIFRequestMessage.Builder(0);
  int v12 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_5_5();
  *(unsigned char *)uint64_t v1 = 14;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  __swift_storeEnumTagSinglePayload(v1 + v12[8], 1, 1, v7);
  uint64_t v13 = (void *)(v1 + v12[9]);
  void *v13 = 0;
  v13[1] = 0;
  uint64_t v14 = v12[10];
  *(unsigned char *)(v1 + v14) = 19;
  uint64_t v15 = v12[11];
  *(void *)(v1 + v15) = 0;
  uint64_t v16 = (uint64_t *)(v1 + v12[12]);
  *uint64_t v16 = 0;
  v16[1] = 0;
  uint64_t v17 = v1 + v12[13];
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v7);
  uint64_t v18 = v2;
  a1(v1);
  uint64_t v19 = v16[1];
  if (v19 && (int v20 = *(unsigned __int8 *)(v1 + v14), v20 != 19) && (v21 = *(void **)(v1 + v15)) != 0)
  {
    uint64_t v22 = *v16;
    v18[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_inputOrigin] = v20;
    *(void *)&v18[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_requestContextData] = v21;
    uint64_t v23 = &v18[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_rootRequestId];
    *uint64_t v23 = v22;
    v23[1] = v19;
    sub_25CF67F88(v17, (uint64_t)v6);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
    {
      id v24 = v21;
      swift_bridgeObjectRetain();
      uint64_t v25 = v42;
      sub_25D0BCFD0();
      sub_25CF69FC0((uint64_t)v6);
      (*(void (**)(unsigned char *, char *, uint64_t))(v41 + 32))(&v18[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_orchestrationTaskId], v25, v7);
    }
    else
    {
      uint64_t v35 = v42;
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
      v36(v42, v6, v7);
      id v37 = v21;
      swift_bridgeObjectRetain();
      v36(&v18[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_orchestrationTaskId], v35, v7);
    }

    MEMORY[0x270FA5388](v38);
    *(&v40 - 2) = v1;
    int v33 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D07DA24);
    id v39 = v33;

    if (v33) {
    sub_25D07C760(v1);
    }
  }
  else
  {

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25D0BD240();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B366B88);
    uint64_t v27 = sub_25D0BD230();
    os_log_type_t v28 = sub_25D0BD4B0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v45 = v30;
      *(_DWORD *)uint64_t v29 = 136446210;
      uint64_t v31 = sub_25CF695B0();
      uint64_t v44 = sub_25D04E590(v31, v32, &v45);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v27, v28, "Could not build %{public}s: Builder has missing required fields", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v30, -1, -1);
      MEMORY[0x2611A4870](v29, -1, -1);
    }

    sub_25D07C760(v1);
    type metadata accessor for StartIFRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v33;
}

uint64_t type metadata accessor for StartIFRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639A60);
}

uint64_t sub_25D07C760(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartIFRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartIFRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364128);
}

uint64_t sub_25D07C7DC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t started = type metadata accessor for StartIFRequestMessage.Builder(0);
  uint64_t v7 = a2 + *(int *)(started + 24);
  uint64_t v8 = type metadata accessor for RequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + *(int *)(v8 + 24));
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(started + 28));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  int v12 = (void *)(a1 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  return result;
}

void *StartIFRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartIFRequestMessage.init(from:)(a1);
}

void *StartIFRequestMessage.init(from:)(void *a1)
{
  id v3 = v1;
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_1();
  char v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A40);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_5();
  uint64_t v26 = (uint64_t)a1;
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07DA2C();
  uint64_t v11 = v3;
  sub_25D0BDA20();
  p_cache = &OBJC_METACLASS____TtC16SiriMessageTypes37CorrectedSpeechResultCandidateMessage.cache;
  if (v27)
  {

    OUTLINED_FUNCTION_11_16();
  }
  else
  {
    uint64_t v28 = v2;
    sub_25D07DA78();
    OUTLINED_FUNCTION_2_32();
    v11[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_inputOrigin] = v29[0];
    char v30 = 1;
    sub_25CF6ECE8();
    OUTLINED_FUNCTION_2_32();
    uint64_t v2 = v26;
    uint64_t v14 = v29[0];
    unint64_t v15 = v29[1];
    sub_25D00AAF8();
    type metadata accessor for RequestContextData(0);
    uint64_t v16 = (void *)sub_25D0BD4C0();
    uint64_t v24 = v29[0];
    if (v16)
    {
      *(void *)&v11[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_requestContextData] = v16;
      id v18 = v16;
      uint64_t v19 = sub_25D0BD780();
      uint64_t v21 = (uint64_t *)&v11[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_rootRequestId];
      uint64_t *v21 = v19;
      v21[1] = v22;
      LOBYTE(v29[0]) = 3;
      sub_25CFA2094(&qword_26A637400);
      sub_25D0BD7E0();
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(&v11[OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_orchestrationTaskId], v28, v5);

      sub_25CF68E70(v26, (uint64_t)v29);
      uint64_t v10 = RequestMessageBase.init(from:)(v29);
      OUTLINED_FUNCTION_1_37();
      v23();
      sub_25CF6ED70(v24, v15);

      __swift_destroy_boxed_opaque_existential_1(v26);
      return v10;
    }

    sub_25CF6D168();
    swift_allocError();
    *(void *)uint64_t v20 = 0xD000000000000028;
    *(void *)(v20 + 8) = 0x800000025D0C5520;
    *(unsigned char *)(v20 + 16) = 0;
    swift_willThrow();
    sub_25CF6ED70(v14, v15);
    OUTLINED_FUNCTION_1_37();
    v17();
    uint64_t v10 = 0;
    LODWORD(v5) = 0;
    char v8 = 0;
    p_cache = (void **)(&OBJC_METACLASS____TtC16SiriMessageTypes37CorrectedSpeechResultCandidateMessage + 16);
  }
  __swift_destroy_boxed_opaque_existential_1(v2);
  if ((v8 & 1) == 0)
  {
    if (v10) {

    }
    if (v5) {
      swift_bridgeObjectRelease();
    }
    type metadata accessor for StartIFRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  return v10;
}

uint64_t sub_25D07CDC8(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A58);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07DA2C();
  sub_25D0BDA30();
  LOBYTE(v18[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_inputOrigin);
  sub_25D07DAC4();
  OUTLINED_FUNCTION_6_27();
  if (v2) {
    goto LABEL_2;
  }
  char v8 = self;
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_requestContextData);
  v18[0] = 0;
  id v10 = objc_msgSend(v8, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, v18);
  id v11 = v18[0];
  if (!v10)
  {
    uint64_t v17 = v11;
    sub_25D0BCF40();

    swift_willThrow();
LABEL_2:
    uint64_t v5 = OUTLINED_FUNCTION_3_29();
    return v6(v5);
  }
  int v12 = (void *)sub_25D0BCF60();
  uint64_t v14 = v13;

  v18[0] = v12;
  v18[1] = v14;
  sub_25CF6EDC8();
  OUTLINED_FUNCTION_6_27();
  LOBYTE(v18[0]) = 2;
  sub_25D0BD880();
  LOBYTE(v18[0]) = 3;
  sub_25D0BCFE0();
  sub_25CFA2094(&qword_26B3647C0);
  sub_25D0BD8E0();
  sub_25D0292F0(a1);
  uint64_t v15 = OUTLINED_FUNCTION_3_29();
  v16(v15);
  return sub_25CF6ED70((uint64_t)v12, (unint64_t)v14);
}

void StartIFRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartIFRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartIFRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartIFRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartIFRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartIFRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartIFRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartIFRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartIFRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartIFRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartIFRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartIFRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartIFRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartIFRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartIFRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_4_35() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartIFRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.rootRequestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartIFRequestMessage.Builder.rootRequestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartIFRequestMessage.Builder.rootRequestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartIFRequestMessage.Builder.orchestrationTaskId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 44);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartIFRequestMessage.Builder.orchestrationTaskId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartIFRequestMessage.Builder(0) + 44);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartIFRequestMessage.Builder.orchestrationTaskId.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D07D584()
{
  unint64_t v0 = sub_25D0BD6F0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_25D07D5D4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x75716552746F6F72;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      unint64_t result = 0x69724F7475706E69;
      break;
  }
  return result;
}

unint64_t sub_25D07D680(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x75716552746F6F72;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      unint64_t result = 0x69724F7475706E69;
      break;
  }
  return result;
}

uint64_t sub_25D07D72C(unsigned __int8 *a1, char *a2)
{
  return sub_25CF7F93C(*a1, *a2);
}

uint64_t sub_25D07D738()
{
  return sub_25D081194(*v0);
}

uint64_t sub_25D07D740()
{
  return sub_25D082360();
}

uint64_t sub_25D07D748()
{
  return sub_25D082640();
}

uint64_t sub_25D07D750@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D07D584();
  *a1 = result;
  return result;
}

unint64_t sub_25D07D780@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25D07D5D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25D07D7AC()
{
  return sub_25D07D680(*v0);
}

uint64_t sub_25D07D7B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D07D5D0();
  *a1 = result;
  return result;
}

uint64_t sub_25D07D7DC(uint64_t a1)
{
  unint64_t v2 = sub_25D07DA2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D07D818(uint64_t a1)
{
  unint64_t v2 = sub_25D07DA2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartIFRequestMessage.__allocating_init(build:)()
{
}

void StartIFRequestMessage.init(build:)()
{
}

uint64_t sub_25D07D8B4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_orchestrationTaskId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  return v4(v1, v2);
}

id StartIFRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartIFRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D07DA00()
{
  return StartIFRequestMessage.rootRequestId.getter();
}

uint64_t sub_25D07DA24(uint64_t a1)
{
  return sub_25D07C7DC(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D07DA2C()
{
  unint64_t result = qword_26A639A48;
  if (!qword_26A639A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A48);
  }
  return result;
}

unint64_t sub_25D07DA78()
{
  unint64_t result = qword_26A639A50;
  if (!qword_26A639A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A50);
  }
  return result;
}

unint64_t sub_25D07DAC4()
{
  unint64_t result = qword_26B3654F0;
  if (!qword_26B3654F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3654F0);
  }
  return result;
}

uint64_t sub_25D07DB10()
{
  return type metadata accessor for StartIFRequestMessage(0);
}

uint64_t sub_25D07DB18()
{
  uint64_t result = sub_25D0BCFE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for StartIFRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartIFRequestMessage);
}

uint64_t dispatch thunk of StartIFRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void *initializeBufferWithCopyOfBuffer for StartIFRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = *(void **)((char *)a2 + v19);
    *(void *)((char *)v4 + v19) = v21;
    uint64_t v22 = (void *)((char *)v4 + v20);
    uint64_t v23 = (void *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[11];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    swift_bridgeObjectRetain();
    id v28 = v21;
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v11))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v26, v27, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for StartIFRequestMessage.Builder(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[11];
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v5);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v8(v6, v5);
  }
  return result;
}

uint64_t initializeWithCopy for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  swift_bridgeObjectRetain();
  id v26 = v19;
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v10))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v24, v25, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v24);
  id v26 = (const void *)(a2 + v24);
  LODWORD(v18) = __swift_getEnumTagSinglePayload(a1 + v24, 1, v9);
  int v27 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v9);
  if (!v18)
  {
    uint64_t v28 = *(void *)(v9 - 8);
    if (!v27)
    {
      (*(void (**)(void *, const void *, uint64_t))(v28 + 24))(v25, v26, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v9);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v25, v26, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v14, v15, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  int v30 = __swift_getEnumTagSinglePayload(a1 + v27, 1, v10);
  int v31 = __swift_getEnumTagSinglePayload((uint64_t)v29, 1, v10);
  if (!v30)
  {
    uint64_t v32 = *(void *)(v10 - 8);
    if (!v31)
    {
      (*(void (**)(void *, const void *, uint64_t))(v32 + 40))(v28, v29, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v28, v10);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v28, v29, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D07E8FC);
}

uint64_t sub_25D07E8FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartIFRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D07E9A8);
}

uint64_t sub_25D07E9A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D07EA2C()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartIFRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D07EBB0);
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

ValueMetadata *type metadata accessor for StartIFRequestMessage.CodingKeys()
{
  return &type metadata for StartIFRequestMessage.CodingKeys;
}

unint64_t sub_25D07EBEC()
{
  unint64_t result = qword_26A639A70;
  if (!qword_26A639A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A70);
  }
  return result;
}

unint64_t sub_25D07EC3C()
{
  unint64_t result = qword_26A639A78;
  if (!qword_26A639A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A78);
  }
  return result;
}

unint64_t sub_25D07EC8C()
{
  unint64_t result = qword_26A639A80;
  if (!qword_26A639A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A80);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_32()
{
  return sub_25D0BD7E0();
}

uint64_t OUTLINED_FUNCTION_3_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_35()
{
  return type metadata accessor for StartIFRequestMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_6_27()
{
  return sub_25D0BD8E0();
}

void *StartLocalRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartRequestMessageBase.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

void *StartLocalRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRequestMessageBase.init(build:)(a1);
}

void *StartLocalRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartLocalRequestMessage.init(from:)(a1);
}

id StartLocalRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartLocalRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartLocalRequestMessage()
{
  uint64_t result = qword_26B364DE0;
  if (!qword_26B364DE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D07EEE4()
{
  return type metadata accessor for StartLocalRequestMessage();
}

uint64_t sub_25D07EEEC(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B365680);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07F138();
  sub_25D0BDA30();
  LOBYTE(v18[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_inputOrigin);
  sub_25D07DAC4();
  OUTLINED_FUNCTION_21_3();
  if (!v2)
  {
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_optionalRequestContextData);
    if (!v5)
    {
LABEL_6:
      sub_25D0292F0(a1);
      goto LABEL_7;
    }
    unsigned int v6 = self;
    v18[0] = 0;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v7, 1, v18);
    id v9 = v18[0];
    if (v8)
    {
      uint64_t v17 = v7;
      uint64_t v10 = (void *)sub_25D0BCF60();
      int v12 = v11;

      v18[0] = v10;
      v18[1] = v12;
      sub_25CF6EDC8();
      OUTLINED_FUNCTION_21_3();

      sub_25CF6ED70((uint64_t)v10, (unint64_t)v12);
      goto LABEL_6;
    }
    uint64_t v13 = v9;
    sub_25D0BCF40();

    swift_willThrow();
  }
LABEL_7:
  uint64_t v14 = OUTLINED_FUNCTION_6_13();
  return v15(v14);
}

unint64_t sub_25D07F138()
{
  unint64_t result = qword_26B364840;
  if (!qword_26B364840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364840);
  }
  return result;
}

void StartRequestMessageBase.__allocating_init(build:)()
{
}

void *StartRequestMessageBase.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v45 = v9 - v8;
  uint64_t started = type metadata accessor for StartRequestMessageBase.Builder(0);
  uint64_t v11 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *uint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v5);
  uint64_t v16 = &v14[v11[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = v11[10];
  v14[v17] = 19;
  uint64_t v18 = v11[11];
  *(void *)&v14[v18] = 0;
  uint64_t v19 = v1;
  a1(v14);
  int v20 = *v14;
  if (v20 == 14 || (uint64_t v21 = *((void *)v14 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v43 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v48 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v47 = sub_25D04E590(v27, v28, &v48);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D07FFF4((uint64_t)v14);
    type metadata accessor for StartRequestMessageBase(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v42 = v21;
  uint64_t v31 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v45, v2, v5);
  uint64_t v32 = *((void *)v16 + 1);
  if (!v32 || (int v33 = v14[v17], v33 == 19))
  {

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v5);
    goto LABEL_6;
  }
  uint64_t v34 = *(void *)v16;
  v19[OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_inputOrigin] = v33;
  uint64_t v35 = *(void **)&v14[v18];
  *(void *)&v19[OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_optionalRequestContextData] = v35;
  id v36 = v35;
  uint64_t v37 = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v38);
  *((unsigned char *)&v41 - 48) = v20;
  *(&v41 - 5) = v43;
  *(&v41 - 4) = v37;
  uint64_t v39 = v45;
  *(&v41 - 3) = v45;
  *(&v41 - 2) = v34;
  *(&v41 - 1) = v32;
  uint64_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v40 = v29;
  sub_25D07FFF4((uint64_t)v14);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v39, v5);
  if (v29) {

  }
  return v29;
}

void *StartRequestMessageBase.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A88);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D07F138();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v11);
    type metadata accessor for StartRequestMessageBase(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D07DA78();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_inputOrigin] = v12;
    char v14 = 1;
    sub_25CF6ECE8();
    sub_25D0BD750();
    if (v13 >> 60 == 15)
    {
      uint64_t v8 = 0;
    }
    else
    {
      sub_25D00AAF8();
      type metadata accessor for RequestContextData(0);
      uint64_t v8 = sub_25D0BD4C0();
      sub_25CF81BBC(v12, v13);
    }
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_optionalRequestContextData] = v8;

    sub_25CF68E70(v11, (uint64_t)&v12);
    uint64_t v6 = RequestMessageBase.init(from:)(&v12);
    uint64_t v9 = OUTLINED_FUNCTION_1_21();
    v10(v9);
    __swift_destroy_boxed_opaque_existential_1(v11);
  }
  return v6;
}

uint64_t sub_25D07F94C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69724F7475706E69 && a2 == 0xEB000000006E6967;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D0C5670)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D07FA44(char a1)
{
  if (a1) {
    return 0xD00000000000001ALL;
  }
  else {
    return 0x69724F7475706E69;
  }
}

uint64_t sub_25D07FA88()
{
  return sub_25D07FA44(*v0);
}

uint64_t sub_25D07FA90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D07F94C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D07FAB8(uint64_t a1)
{
  unint64_t v2 = sub_25D07F138();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D07FAF4(uint64_t a1)
{
  unint64_t v2 = sub_25D07F138();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartRequestMessageBase.inputOrigin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_inputOrigin);
}

void *StartRequestMessageBase.optionalRequestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes23StartRequestMessageBase_optionalRequestContextData);
  id v2 = v1;
  return v1;
}

void *StartRequestMessageBase.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRequestMessageBase.init(build:)(a1);
}

void *StartRequestMessageBase.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartRequestMessageBase.init(from:)(a1);
}

void StartRequestMessageBase.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartRequestMessageBase.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartRequestMessageBase.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRequestMessageBase.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRequestMessageBase.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartRequestMessageBase.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRequestMessageBase.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRequestMessageBase.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartRequestMessageBase.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRequestMessageBase.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartRequestMessageBase.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRequestMessageBase.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartRequestMessageBase.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRequestMessageBase.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartRequestMessageBase.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartRequestMessageBase.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRequestMessageBase.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartRequestMessageBase.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartRequestMessageBase.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartRequestMessageBase.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartRequestMessageBase.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartRequestMessageBase.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartRequestMessageBase.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartRequestMessageBase.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_5_34() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartRequestMessageBase.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

void StartRequestMessageBase.init(build:)()
{
}

uint64_t type metadata accessor for StartRequestMessageBase.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3629E8);
}

uint64_t sub_25D07FFF4(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartRequestMessageBase.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartRequestMessageBase(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3648E8);
}

void sub_25D080070()
{
}

id StartRequestMessageBase.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartRequestMessageBase(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0800C8()
{
  return type metadata accessor for StartRequestMessageBase(0);
}

uint64_t sub_25D0800D0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartRequestMessageBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartRequestMessageBase);
}

uint64_t dispatch thunk of StartRequestMessageBase.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

void *initializeBufferWithCopyOfBuffer for StartRequestMessageBase.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    int v20 = *(void **)((char *)a2 + v19);
    *(void *)((char *)v4 + v19) = v20;
    swift_bridgeObjectRetain();
    id v21 = v20;
  }
  return v4;
}

void destroy for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  char v6 = *(void **)(a1 + *(int *)(a2 + 36));
}

uint64_t initializeWithCopy for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v18;
  swift_bridgeObjectRetain();
  id v19 = v18;
  return a1;
}

uint64_t assignWithCopy for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a1 + v17);
  id v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  return a1;
}

uint64_t initializeWithTake for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  id v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  return a1;
}

uint64_t getEnumTagSinglePayload for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D080968);
}

uint64_t sub_25D080968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartRequestMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D080A14);
}

uint64_t sub_25D080A14(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D080A98()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartRequestMessageBase.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D080C18);
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

ValueMetadata *type metadata accessor for StartRequestMessageBase.CodingKeys()
{
  return &type metadata for StartRequestMessageBase.CodingKeys;
}

unint64_t sub_25D080C54()
{
  unint64_t result = qword_26A639A90;
  if (!qword_26A639A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639A90);
  }
  return result;
}

unint64_t sub_25D080CA4()
{
  unint64_t result = qword_26B364850;
  if (!qword_26B364850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364850);
  }
  return result;
}

unint64_t sub_25D080CF4()
{
  unint64_t result = qword_26B364848;
  if (!qword_26B364848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364848);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_34()
{
  return type metadata accessor for StartRequestMessageBase.Builder(0);
}

uint64_t sub_25D080D58(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081564);
}

uint64_t sub_25D080D70()
{
  return sub_25D082944();
}

uint64_t sub_25D080D7C()
{
  return sub_25D082FE4();
}

uint64_t sub_25D080DB0()
{
  return sub_25D083188();
}

uint64_t sub_25D080DBC()
{
  return sub_25D083030();
}

uint64_t sub_25D080DC8(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081ECC);
}

uint64_t sub_25D080DE0(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081E80);
}

uint64_t sub_25D080DF8(char a1)
{
  return sub_25D0826A0(0, a1);
}

uint64_t sub_25D080E04()
{
  return sub_25D082734();
}

uint64_t sub_25D080E10()
{
  return sub_25D082AC4();
}

uint64_t sub_25D080E1C()
{
  return sub_25D081208();
}

uint64_t sub_25D080E40(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D082290);
}

uint64_t sub_25D080E58()
{
  return sub_25D082538();
}

uint64_t sub_25D080E64()
{
  return sub_25D082E70();
}

uint64_t sub_25D080E70(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081628);
}

uint64_t sub_25D080E88()
{
  return sub_25D082C68();
}

uint64_t sub_25D080EA8(uint64_t a1)
{
  return sub_25D0810AC(a1, (void (*)(uint64_t))sub_25CFAB194);
}

uint64_t sub_25D080EC0(char a1)
{
  return sub_25D082BB4(0, a1);
}

uint64_t sub_25D080ECC()
{
  return sub_25D082FE4();
}

uint64_t sub_25D080F00()
{
  return sub_25D082FE4();
}

uint64_t sub_25D080F34()
{
  return sub_25D0829FC();
}

uint64_t sub_25D080F40()
{
  return sub_25D0827B4();
}

uint64_t sub_25D080F4C()
{
  return OUTLINED_FUNCTION_3_30();
}

uint64_t sub_25D080F64()
{
  return OUTLINED_FUNCTION_3_30();
}

uint64_t sub_25D080F7C(uint64_t a1)
{
  return sub_25D0810AC(a1, (void (*)(uint64_t))sub_25CFE2BAC);
}

uint64_t sub_25D080F94()
{
  return OUTLINED_FUNCTION_3_30();
}

uint64_t sub_25D080FAC()
{
  return sub_25D082828();
}

uint64_t sub_25D080FB8(uint64_t a1)
{
  return sub_25D0810AC(a1, (void (*)(uint64_t))sub_25CFEE748);
}

uint64_t sub_25D080FD0()
{
  return sub_25D0828BC();
}

uint64_t sub_25D080FDC(char a1)
{
  return sub_25D0825A8(0, a1);
}

uint64_t sub_25D080FE8(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D0816F0);
}

uint64_t sub_25D081000(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081DB4);
}

uint64_t sub_25D081018()
{
  return OUTLINED_FUNCTION_3_30();
}

uint64_t sub_25D081030()
{
  return sub_25D082DD0();
}

uint64_t sub_25D08103C()
{
  return sub_25D0830A8();
}

uint64_t sub_25D081048()
{
  return sub_25D082FE4();
}

uint64_t sub_25D08107C()
{
  return sub_25D081208();
}

uint64_t sub_25D081094(uint64_t a1)
{
  return sub_25D0810AC(a1, (void (*)(uint64_t))sub_25D04C678);
}

uint64_t sub_25D0810AC(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D0810FC(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D08142C);
}

uint64_t sub_25D081118(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D0819C0);
}

uint64_t sub_25D081134()
{
  return sub_25D082D64();
}

uint64_t sub_25D081140()
{
  return sub_25D0831FC();
}

uint64_t sub_25D08114C()
{
  return sub_25D081208();
}

uint64_t sub_25D081170()
{
  return sub_25D082B38();
}

uint64_t sub_25D08117C(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D081CAC);
}

uint64_t sub_25D081194(uint64_t a1)
{
  return sub_25D0811AC(a1, (void (*)(unsigned char *, uint64_t))sub_25D082360);
}

uint64_t sub_25D0811AC(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_58();
  a2(v5, a1);
  return sub_25D0BD9F0();
}

uint64_t sub_25D0811F4()
{
  return sub_25D081208();
}

uint64_t sub_25D081208()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D081250()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D08129C(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_23_9();
  }
  else {
    OUTLINED_FUNCTION_20_14();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D08130C(uint64_t a1, uint64_t a2)
{
  return sub_25D08224C(a1, a2, (void (*)(uint64_t))sub_25D04C678);
}

uint64_t sub_25D081324()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D0813A0(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_21_10();
  }
  else {
    OUTLINED_FUNCTION_16_11();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081414(uint64_t a1, uint64_t a2)
{
  return sub_25D081970(a1, a2, (void (*)(void))ConversationSessionKey.rawValue.getter);
}

uint64_t sub_25D08142C()
{
  OUTLINED_FUNCTION_18_13();
  switch(v0)
  {
    case 3:
    case 5:
      OUTLINED_FUNCTION_13_14();
      break;
    default:
      break;
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D08154C(uint64_t a1, uint64_t a2)
{
  return sub_25D08224C(a1, a2, (void (*)(uint64_t))sub_25CFE2BAC);
}

uint64_t sub_25D081564()
{
  OUTLINED_FUNCTION_18_13();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
      OUTLINED_FUNCTION_13_14();
      break;
    default:
      break;
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081628()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081674()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t sub_25D08168C()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D0816D8(uint64_t a1, uint64_t a2)
{
  return sub_25D081970(a1, a2, (void (*)(void))RequestType.rawValue.getter);
}

uint64_t sub_25D0816F0(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 5:
    case 8:
      OUTLINED_FUNCTION_13_14();
      break;
    default:
      break;
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081888(uint64_t a1, uint64_t a2)
{
  return sub_25D081970(a1, a2, (void (*)(void))InputOrigin.rawValue.getter);
}

uint64_t sub_25D0818A0()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D0818EC()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081958(uint64_t a1, uint64_t a2)
{
  return sub_25D081970(a1, a2, (void (*)(void))MessageSource.rawValue.getter);
}

uint64_t sub_25D081970(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  OUTLINED_FUNCTION_30_5();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D0819C0()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081A9C()
{
  return sub_25D0BD370();
}

uint64_t sub_25D081AB8()
{
  return sub_25D0BD370();
}

uint64_t sub_25D081AD0()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t sub_25D081AE8(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_17_14();
  }
  else {
    OUTLINED_FUNCTION_13_14();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081B58(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_24_9();
  }
  else {
    OUTLINED_FUNCTION_2_33();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081BD0()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081C40()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081CAC()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081D94()
{
  return sub_25D0BD370();
}

uint64_t sub_25D081DB4()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081E00()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081E70()
{
  return sub_25D0BD370();
}

uint64_t sub_25D081E80()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081ECC()
{
  OUTLINED_FUNCTION_19_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081F18(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_22_9();
  }
  else {
    OUTLINED_FUNCTION_15_15();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D081F8C()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082010(uint64_t a1, uint64_t a2)
{
  return sub_25D08224C(a1, a2, (void (*)(uint64_t))sub_25CFEE748);
}

uint64_t sub_25D082028()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D0820A0()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082110()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D08218C(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_13_14();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D08221C()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t sub_25D082234(uint64_t a1, uint64_t a2)
{
  return sub_25D08224C(a1, a2, (void (*)(uint64_t))sub_25CFAB194);
}

uint64_t sub_25D08224C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  OUTLINED_FUNCTION_30_5();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082290()
{
  OUTLINED_FUNCTION_18_13();
  switch(v0)
  {
    case 3:
      OUTLINED_FUNCTION_13_14();
      break;
    default:
      break;
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082360()
{
  OUTLINED_FUNCTION_18_13();
  switch(v0)
  {
    case 2:
      OUTLINED_FUNCTION_2_33();
      break;
    case 3:
      OUTLINED_FUNCTION_13_14();
      break;
    default:
      break;
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082418(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_29_5();
  }
  else {
    OUTLINED_FUNCTION_13_14();
  }
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082498()
{
  sub_25D0BD370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D082504()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t sub_25D082520()
{
  return OUTLINED_FUNCTION_5_35();
}

uint64_t sub_25D082538()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D0825A8(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_29_5();
  }
  sub_25D0BD370();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D082640()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082658()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082670()
{
  return sub_25D083140();
}

uint64_t sub_25D082688()
{
  return OUTLINED_FUNCTION_5_35();
}

uint64_t sub_25D0826A0(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_29_5();
  }
  else {
    OUTLINED_FUNCTION_13_14();
  }
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D082734()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D0827B4()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082828()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D0828A4()
{
  return sub_25D083140();
}

uint64_t sub_25D0828BC()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082944()
{
  OUTLINED_FUNCTION_4_36();
  if (v0) {
    OUTLINED_FUNCTION_22_9();
  }
  else {
    OUTLINED_FUNCTION_15_15();
  }
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D0829BC()
{
  return sub_25D082F8C();
}

uint64_t sub_25D0829D4()
{
  return sub_25D082F8C();
}

uint64_t sub_25D0829EC()
{
  return sub_25D082EE0();
}

uint64_t sub_25D0829FC()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082A70()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082A88()
{
  return sub_25D082EE0();
}

uint64_t sub_25D082AA8()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082AC4()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082B38()
{
  OUTLINED_FUNCTION_4_36();
  if (v0) {
    OUTLINED_FUNCTION_24_9();
  }
  else {
    OUTLINED_FUNCTION_2_33();
  }
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D082BB4(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_17_14();
  }
  sub_25D0BD370();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D082C3C()
{
  return OUTLINED_FUNCTION_5_35();
}

uint64_t sub_25D082C54()
{
  return sub_25D082EE0();
}

uint64_t sub_25D082C68()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082CDC()
{
  return sub_25D082EE0();
}

uint64_t sub_25D082CF4()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082D30()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082D48()
{
  return sub_25D082FE4();
}

uint64_t sub_25D082D64()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082DD0()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082E28()
{
  return sub_25D082FE4();
}

uint64_t sub_25D082E40()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082E58()
{
  return sub_25D082FE4();
}

uint64_t sub_25D082E70()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082EC8()
{
  return OUTLINED_FUNCTION_5_35();
}

uint64_t sub_25D082EE0()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D082F2C()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082F44()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082F5C()
{
  return sub_25D083140();
}

uint64_t sub_25D082F74()
{
  return sub_25D082F8C();
}

uint64_t sub_25D082F8C()
{
  OUTLINED_FUNCTION_25_9();
  v0(v3, v1);
  return sub_25D0BD9F0();
}

uint64_t sub_25D082FCC()
{
  return sub_25D082FE4();
}

uint64_t sub_25D082FE4()
{
  uint64_t v1 = OUTLINED_FUNCTION_25_9();
  v0(v1);
  OUTLINED_FUNCTION_14_15();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D083030()
{
  OUTLINED_FUNCTION_4_36();
  if (v0) {
    OUTLINED_FUNCTION_21_10();
  }
  else {
    OUTLINED_FUNCTION_16_11();
  }
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D0830A8()
{
  return sub_25D0BD9F0();
}

uint64_t sub_25D083128()
{
  return sub_25D083140();
}

uint64_t sub_25D083140()
{
  OUTLINED_FUNCTION_25_9();
  v0(v1);
  OUTLINED_FUNCTION_14_15();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D083188()
{
  OUTLINED_FUNCTION_4_36();
  if (v0) {
    OUTLINED_FUNCTION_23_9();
  }
  else {
    OUTLINED_FUNCTION_20_14();
  }
  OUTLINED_FUNCTION_1_38();
  swift_bridgeObjectRelease();
  return sub_25D0BD9F0();
}

uint64_t sub_25D0831FC()
{
  return sub_25D0BD9F0();
}

uint64_t StartRootCandidateRequestMessage.isSiriPrompt.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes32StartRootCandidateRequestMessage_isSiriPrompt);
}

void *StartRootCandidateRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRootCandidateRequestMessage.init(build:)(a1);
}

void *StartRootCandidateRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_2();
  uint64_t started = type metadata accessor for StartRootCandidateRequestMessage.Builder(0);
  uint64_t v10 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  int v12 = (unsigned __int8 *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 *v12 = 14;
  *((void *)v12 + 1) = 0;
  *((void *)v12 + 2) = 0;
  uint64_t v13 = (uint64_t)&v12[v10[8]];
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v6);
  uint64_t v14 = &v12[v10[9]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = v10[10];
  v12[v15] = 2;
  id v16 = v1;
  a1(v12);
  int v17 = *v12;
  if (v17 == 14 || (uint64_t v18 = *((void *)v12 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v36 = *((void *)v12 + 1);
  sub_25CF67F88(v13, v3);
  if (__swift_getEnumTagSinglePayload(v3, 1, v6) == 1)
  {

    sub_25CF69FC0(v3);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25D0BD240();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B366B88);
    uint64_t v20 = sub_25D0BD230();
    os_log_type_t v21 = sub_25D0BD4B0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v40 = v23;
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v24 = sub_25CF695B0();
      uint64_t v39 = sub_25D04E590(v24, v25, &v40);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v20, v21, "Could not build %{public}s: Builder has missing required fields", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v23, -1, -1);
      MEMORY[0x2611A4870](v22, -1, -1);
    }

    sub_25D083744((uint64_t)v12);
    type metadata accessor for StartRootCandidateRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v28 = v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v2, v3, v6);
  uint64_t v29 = *((void *)v14 + 1);
  if (!v29 || (int v30 = v12[v15], v30 == 2))
  {

    OUTLINED_FUNCTION_2_0();
    v31();
    goto LABEL_6;
  }
  uint64_t v32 = *(void *)v14;
  *((unsigned char *)v16 + OBJC_IVAR____TtC16SiriMessageTypes32StartRootCandidateRequestMessage_isSiriPrompt) = v30 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v33);
  *((unsigned char *)&v35 - 48) = v17;
  *(&v35 - 5) = v36;
  *(&v35 - 4) = v18;
  *(&v35 - 3) = v2;
  *(&v35 - 2) = v32;
  *(&v35 - 1) = v29;
  uint64_t v26 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v34 = v26;
  sub_25D083744((uint64_t)v12);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v2, v6);
  if (v26) {

  }
  return v26;
}

uint64_t type metadata accessor for StartRootCandidateRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639AB0);
}

uint64_t sub_25D083744(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartRootCandidateRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartRootCandidateRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3642E8);
}

void *StartRootCandidateRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartRootCandidateRequestMessage.init(from:)(a1);
}

void *StartRootCandidateRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639A98);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0841CC();
  id v4 = v1;
  sub_25D0BDA20();
  if (v8[6])
  {

    uint64_t v5 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StartRootCandidateRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *((unsigned char *)v4 + OBJC_IVAR____TtC16SiriMessageTypes32StartRootCandidateRequestMessage_isSiriPrompt) = sub_25D0BD790() & 1;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v8);
    uint64_t v5 = RequestMessageBase.init(from:)(v8);
    OUTLINED_FUNCTION_2_0();
    v7();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v5;
}

uint64_t sub_25D083A00(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639AA8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0841CC();
  sub_25D0BDA30();
  sub_25D0BD890();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

BOOL sub_25D083B1C()
{
  uint64_t v0 = sub_25D0BD6F0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_25D083B64()
{
  return sub_25D083B1C();
}

uint64_t sub_25D083B80()
{
  return sub_25D081208();
}

uint64_t sub_25D083BB4()
{
  return sub_25D082EE0();
}

BOOL sub_25D083BE8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25D083B1C();
  *a1 = result;
  return result;
}

BOOL sub_25D083C1C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25D083B64();
  *a1 = result;
  return result;
}

uint64_t sub_25D083C48(uint64_t a1)
{
  unint64_t v2 = sub_25D0841CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D083C84(uint64_t a1)
{
  unint64_t v2 = sub_25D0841CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D083D28()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for StartRootCandidateRequestMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void StartRootCandidateRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartRootCandidateRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartRootCandidateRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootCandidateRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootCandidateRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartRootCandidateRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootCandidateRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootCandidateRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartRootCandidateRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootCandidateRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartRootCandidateRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootCandidateRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartRootCandidateRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootCandidateRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartRootCandidateRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartRootCandidateRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootCandidateRequestMessage.Builder.isSiriPrompt.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for StartRootCandidateRequestMessage.Builder(0) + 32));
}

uint64_t StartRootCandidateRequestMessage.Builder.isSiriPrompt.setter(char a1)
{
  uint64_t result = type metadata accessor for StartRootCandidateRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*StartRootCandidateRequestMessage.Builder.isSiriPrompt.modify())(void)
{
  return nullsub_1;
}

void StartRootCandidateRequestMessage.__allocating_init(build:)()
{
}

void StartRootCandidateRequestMessage.init(build:)()
{
}

id StartRootCandidateRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartRootCandidateRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0841CC()
{
  unint64_t result = qword_26A639AA0;
  if (!qword_26A639AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639AA0);
  }
  return result;
}

uint64_t sub_25D084218()
{
  return type metadata accessor for StartRootCandidateRequestMessage(0);
}

uint64_t sub_25D084220()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartRootCandidateRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartRootCandidateRequestMessage);
}

uint64_t dispatch thunk of StartRootCandidateRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for StartRootCandidateRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0842A4);
}

uint64_t sub_25D0842A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartRootCandidateRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D084350);
}

uint64_t sub_25D084350(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0843D4()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartRootCandidateRequestMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D08451CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartRootCandidateRequestMessage.CodingKeys()
{
  return &type metadata for StartRootCandidateRequestMessage.CodingKeys;
}

unint64_t sub_25D084558()
{
  unint64_t result = qword_26A639AC0;
  if (!qword_26A639AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639AC0);
  }
  return result;
}

unint64_t sub_25D0845A8()
{
  unint64_t result = qword_26A639AC8;
  if (!qword_26A639AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639AC8);
  }
  return result;
}

unint64_t sub_25D0845F8()
{
  unint64_t result = qword_26A639AD0;
  if (!qword_26A639AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639AD0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_38()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_3_30()
{
  return sub_25D081208();
}

uint64_t OUTLINED_FUNCTION_4_36()
{
  return sub_25D0BD9D0();
}

uint64_t OUTLINED_FUNCTION_5_35()
{
  return sub_25D082EE0();
}

uint64_t OUTLINED_FUNCTION_6_28()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_7_25()
{
  return sub_25D082EE0();
}

uint64_t OUTLINED_FUNCTION_8_19()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_9_14()
{
  return sub_25D081208();
}

uint64_t OUTLINED_FUNCTION_10_18()
{
  return sub_25D082EE0();
}

uint64_t OUTLINED_FUNCTION_11_17()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return sub_25D081208();
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return sub_25D0BD370();
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  return sub_25D0BD9D0();
}

uint64_t OUTLINED_FUNCTION_30_5()
{
  return sub_25D0BD370();
}

void StartRootLocalRequestMessage.inputOrigin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_inputOrigin);
}

void *StartRootLocalRequestMessage.optionalRequestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_optionalRequestContextData);
  id v2 = v1;
  return v1;
}

void *StartRootLocalRequestMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return StartRootLocalRequestMessage.init(build:)(a1);
}

void *StartRootLocalRequestMessage.init(build:)(void (*a1)(uint64_t))
{
  swift_getObjectType();
  uint64_t started = type metadata accessor for StartRootLocalRequestMessage.Builder(0);
  unsigned int v4 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  *(unsigned char *)uint64_t v7 = 14;
  *(void *)(v7 + 8) = 0;
  *(void *)(v7 + 16) = 0;
  uint64_t v8 = v6 - v5 + v4[8];
  uint64_t v9 = sub_25D0BCFE0();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  uint64_t v10 = (void *)(v7 + v4[9]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = v4[10];
  *(unsigned char *)(v7 + v11) = 19;
  uint64_t v12 = v4[11];
  *(void *)(v7 + v12) = 0;
  uint64_t v13 = v1;
  a1(v7);
  int v14 = *(unsigned __int8 *)(v7 + v11);
  if (v14 == 19)
  {

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25D0BD240();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B366B88);
    id v16 = sub_25D0BD230();
    os_log_type_t v17 = sub_25D0BD4B0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v28 = v19;
      *(_DWORD *)uint64_t v18 = 136446210;
      uint64_t v20 = sub_25CF695B0();
      uint64_t v27 = sub_25D04E590(v20, v21, &v28);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v16, v17, "Could not build %{public}s: Builder has missing required fields", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v19, -1, -1);
      MEMORY[0x2611A4870](v18, -1, -1);
    }

    sub_25D084D0C(v7);
    type metadata accessor for StartRootLocalRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v13[OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_inputOrigin] = v14;
    uint64_t v23 = *(void **)(v7 + v12);
    *(void *)&v13[OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_optionalRequestContextData] = v23;
    id v24 = v23;

    MEMORY[0x270FA5388](v25);
    *(&v27 - 2) = v7;
    uint64_t v22 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D085884);
    sub_25D084D0C(v7);
  }
  return v22;
}

uint64_t type metadata accessor for StartRootLocalRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639B00);
}

uint64_t sub_25D084D0C(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartRootLocalRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartRootLocalRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639AF0);
}

uint64_t sub_25D084D88(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t started = type metadata accessor for StartRootLocalRequestMessage.Builder(0);
  uint64_t v7 = a2 + *(int *)(started + 24);
  uint64_t v8 = type metadata accessor for RequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + *(int *)(v8 + 24));
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(started + 28));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = (void *)(a1 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  return result;
}

void *StartRootLocalRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartRootLocalRequestMessage.init(from:)(a1);
}

void *StartRootLocalRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639AD8);
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08588C();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v11);
    type metadata accessor for StartRootLocalRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D07DA78();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_inputOrigin] = v12;
    char v14 = 1;
    sub_25CF6ECE8();
    sub_25D0BD750();
    if (v13 >> 60 == 15)
    {
      uint64_t v8 = 0;
    }
    else
    {
      sub_25D00AAF8();
      type metadata accessor for RequestContextData(0);
      uint64_t v8 = sub_25D0BD4C0();
      sub_25CF81BBC(v12, v13);
    }
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_optionalRequestContextData] = v8;

    sub_25CF68E70(v11, (uint64_t)&v12);
    uint64_t v6 = RequestMessageBase.init(from:)(&v12);
    uint64_t v9 = OUTLINED_FUNCTION_1_21();
    v10(v9);
    __swift_destroy_boxed_opaque_existential_1(v11);
  }
  return v6;
}

uint64_t sub_25D085164(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639AE8);
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08588C();
  sub_25D0BDA30();
  LOBYTE(v18[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_inputOrigin);
  sub_25D07DAC4();
  OUTLINED_FUNCTION_21_3();
  if (!v2)
  {
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes28StartRootLocalRequestMessage_optionalRequestContextData);
    if (!v5)
    {
LABEL_6:
      sub_25D0292F0(a1);
      goto LABEL_7;
    }
    uint64_t v6 = self;
    v18[0] = 0;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v7, 1, v18);
    id v9 = v18[0];
    if (v8)
    {
      os_log_type_t v17 = v7;
      uint64_t v10 = (void *)sub_25D0BCF60();
      uint64_t v12 = v11;

      v18[0] = v10;
      v18[1] = v12;
      sub_25CF6EDC8();
      OUTLINED_FUNCTION_21_3();

      sub_25CF6ED70((uint64_t)v10, (unint64_t)v12);
      goto LABEL_6;
    }
    unint64_t v13 = v9;
    sub_25D0BCF40();

    swift_willThrow();
  }
LABEL_7:
  uint64_t v14 = OUTLINED_FUNCTION_6_13();
  return v15(v14);
}

void StartRootLocalRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartRootLocalRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartRootLocalRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootLocalRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootLocalRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartRootLocalRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootLocalRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootLocalRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartRootLocalRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootLocalRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartRootLocalRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootLocalRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartRootLocalRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootLocalRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartRootLocalRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartRootLocalRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootLocalRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartRootLocalRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartRootLocalRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartRootLocalRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartRootLocalRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartRootLocalRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartRootLocalRequestMessage.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartRootLocalRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_4_37() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartRootLocalRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D085754(uint64_t a1)
{
  unint64_t v2 = sub_25D08588C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D085790(uint64_t a1)
{
  unint64_t v2 = sub_25D08588C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartRootLocalRequestMessage.__allocating_init(build:)()
{
}

void StartRootLocalRequestMessage.init(build:)()
{
}

void sub_25D08582C()
{
}

id StartRootLocalRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartRootLocalRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D085884(uint64_t a1)
{
  return sub_25D084D88(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D08588C()
{
  unint64_t result = qword_26A639AE0;
  if (!qword_26A639AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639AE0);
  }
  return result;
}

uint64_t sub_25D0858D8()
{
  return type metadata accessor for StartRootLocalRequestMessage(0);
}

uint64_t sub_25D0858E0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartRootLocalRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartRootLocalRequestMessage);
}

uint64_t dispatch thunk of StartRootLocalRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t getEnumTagSinglePayload for StartRootLocalRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D08596C);
}

uint64_t sub_25D08596C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartRootLocalRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D085A18);
}

uint64_t sub_25D085A18(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D085A9C()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartRootLocalRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D085C1CLL);
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

ValueMetadata *type metadata accessor for StartRootLocalRequestMessage.CodingKeys()
{
  return &type metadata for StartRootLocalRequestMessage.CodingKeys;
}

unint64_t sub_25D085C58()
{
  unint64_t result = qword_26A639B10;
  if (!qword_26A639B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B10);
  }
  return result;
}

unint64_t sub_25D085CA8()
{
  unint64_t result = qword_26A639B18;
  if (!qword_26A639B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B18);
  }
  return result;
}

unint64_t sub_25D085CF8()
{
  unint64_t result = qword_26A639B20;
  if (!qword_26A639B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_37()
{
  return type metadata accessor for StartRootLocalRequestMessage.Builder(0);
}

void StartRootSpeechRequestMessage.inputOrigin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_inputOrigin);
}

void *StartRootSpeechRequestMessage.optionalRequestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_optionalRequestContextData);
  id v2 = v1;
  return v1;
}

uint64_t StartRootSpeechRequestMessage.location.getter()
{
  return swift_retain();
}

uint64_t StartRootSpeechRequestMessage.asrOnServer.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_asrOnServer);
}

void *StartRootSpeechRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRootSpeechRequestMessage.init(build:)(a1);
}

void *StartRootSpeechRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  long long v52 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v48 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v49 = v8 - v7;
  uint64_t started = type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  uint64_t v10 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  unint64_t v13 = (unsigned __int8 *)(v12 - v11);
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v14 = v12 - v11 + v10[8];
  uint64_t v50 = v4;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v4);
  uint64_t v15 = (uint64_t *)&v13[v10[9]];
  uint64_t *v15 = 0;
  v15[1] = 0;
  uint64_t v16 = v10[10];
  v13[v16] = 19;
  uint64_t v17 = v10[11];
  *(void *)&v13[v17] = 0;
  uint64_t v18 = v10[12];
  v13[v18] = 2;
  uint64_t v19 = v10[13];
  *(void *)&v13[v19] = 0;
  uint64_t v20 = v1;
  v52(v13);
  int v21 = *v13;
  if (v21 == 14 || !*((void *)v13 + 2))
  {

    goto LABEL_6;
  }
  long long v52 = (void (*)(unsigned __int8 *))*((void *)v13 + 2);
  uint64_t v47 = *((void *)v13 + 1);
  sub_25CF67F88(v14, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v50) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v54 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v53 = sub_25D04E590(v27, v28, &v54);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D086344((uint64_t)v13);
    type metadata accessor for StartRootSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v48 + 32))(v49, v2);
  uint64_t v31 = v15[1];
  if (!v31)
  {

    OUTLINED_FUNCTION_0_2();
    v33();
    goto LABEL_6;
  }
  int v32 = v13[v16];
  if (v32 == 19)
  {

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
    goto LABEL_6;
  }
  int v34 = v13[v18];
  uint64_t v35 = v49;
  if (v34 == 2)
  {

    uint64_t v36 = OUTLINED_FUNCTION_6_29();
    v37(v36);
    goto LABEL_6;
  }
  uint64_t ObjectType = *v15;
  v20[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_inputOrigin] = v32;
  uint64_t v38 = *(void **)&v13[v19];
  *(void *)&v20[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_optionalRequestContextData] = v38;
  uint64_t v39 = v31;
  *(void *)&v20[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_location] = *(void *)&v13[v17];
  v20[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_asrOnServer] = v34 & 1;
  swift_retain();
  uint64_t v40 = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v41 = v38;

  MEMORY[0x270FA5388](v42);
  *((unsigned char *)&v47 - 48) = v21;
  *(&v47 - 5) = v47;
  *(&v47 - 4) = (uint64_t)v40;
  uint64_t v43 = ObjectType;
  *(&v47 - 3) = v35;
  *(&v47 - 2) = v43;
  *(&v47 - 1) = v39;
  uint64_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v44 = v29;
  sub_25D086344((uint64_t)v13);
  uint64_t v45 = OUTLINED_FUNCTION_6_29();
  v46(v45);
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for StartRootSpeechRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639B48);
}

uint64_t sub_25D086344(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartRootSpeechRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3642A8);
}

void *StartRootSpeechRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartRootSpeechRequestMessage.init(from:)(a1);
}

void *StartRootSpeechRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639B28);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D087418();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v10);
    type metadata accessor for StartRootSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D07DA78();
    OUTLINED_FUNCTION_3_31();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_inputOrigin] = v11;
    char v13 = 1;
    sub_25CF6ECE8();
    OUTLINED_FUNCTION_3_31();
    sub_25D0BD750();
    if (v12 >> 60 == 15)
    {
      uint64_t v8 = 0;
    }
    else
    {
      sub_25D00AAF8();
      type metadata accessor for RequestContextData(0);
      uint64_t v8 = sub_25D0BD4C0();
      sub_25CF81BBC(v11, v12);
    }
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_optionalRequestContextData] = v8;
    type metadata accessor for Location();
    char v13 = 2;
    sub_25D087464(&qword_26A639B38);
    sub_25D0BD750();
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_location] = v11;
    LOBYTE(v11) = 3;
    v5[OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_asrOnServer] = sub_25D0BD790() & 1;

    sub_25CF68E70(v10, (uint64_t)&v11);
    uint64_t v6 = RequestMessageBase.init(from:)(&v11);
    OUTLINED_FUNCTION_0_2();
    v9();
    __swift_destroy_boxed_opaque_existential_1(v10);
  }
  return v6;
}

uint64_t sub_25D0867E0(void *a1)
{
  uint64_t v3 = v1;
  v23[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639B40);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D087418();
  sub_25D0BDA30();
  LOBYTE(v23[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_inputOrigin);
  sub_25D07DAC4();
  OUTLINED_FUNCTION_21_3();
  if (!v2)
  {
    char v13 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_optionalRequestContextData);
    if (v13)
    {
      uint64_t v14 = self;
      v23[0] = 0;
      id v15 = v13;
      id v16 = objc_msgSend(v14, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v15, 1, v23);
      id v17 = v23[0];
      if (!v16)
      {
        int v21 = v17;
        sub_25D0BCF40();

        swift_willThrow();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
      }
      uint64_t v22 = v15;
      uint64_t v18 = (void *)sub_25D0BCF60();
      uint64_t v20 = v19;

      v23[0] = v18;
      v23[1] = v20;
      sub_25CF6EDC8();
      OUTLINED_FUNCTION_21_3();

      sub_25CF6ED70((uint64_t)v18, (unint64_t)v20);
    }
    if (*(void *)(v3 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_location))
    {
      v23[0] = *(id *)(v3 + OBJC_IVAR____TtC16SiriMessageTypes29StartRootSpeechRequestMessage_location);
      type metadata accessor for Location();
      sub_25D087464(&qword_26B3645F0);
      swift_retain();
      sub_25D0BD8E0();
      swift_release();
    }
    LOBYTE(v23[0]) = 3;
    sub_25D0BD890();
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
}

void StartRootSpeechRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartRootSpeechRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootSpeechRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartRootSpeechRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartRootSpeechRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootSpeechRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartRootSpeechRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.location.getter()
{
  type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  return swift_retain();
}

uint64_t StartRootSpeechRequestMessage.Builder.location.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_2_34() + 36);
  uint64_t result = swift_release();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.location.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootSpeechRequestMessage.Builder.asrOnServer.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 40));
}

uint64_t StartRootSpeechRequestMessage.Builder.asrOnServer.setter(char a1)
{
  uint64_t result = type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.asrOnServer.modify())(void)
{
  return nullsub_1;
}

void *StartRootSpeechRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartRootSpeechRequestMessage.Builder(0) + 44));
  id v2 = v1;
  return v1;
}

void StartRootSpeechRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_2_34() + 44);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartRootSpeechRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D086FE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69724F7475706E69 && a2 == 0xEB000000006E6967;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D0C5670 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
    if (v6 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x7265536E4F727361 && a2 == 0xEB00000000726576)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_25D0BD940();
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

unint64_t sub_25D0871A4(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 3:
      unint64_t result = 0x7265536E4F727361;
      break;
    default:
      unint64_t result = 0x69724F7475706E69;
      break;
  }
  return result;
}

unint64_t sub_25D08724C()
{
  return sub_25D0871A4(*v0);
}

uint64_t sub_25D087254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D086FE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D08727C(uint64_t a1)
{
  unint64_t v2 = sub_25D087418();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0872B8(uint64_t a1)
{
  unint64_t v2 = sub_25D087418();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartRootSpeechRequestMessage.__allocating_init(build:)()
{
}

void StartRootSpeechRequestMessage.init(build:)()
{
}

uint64_t sub_25D087354()
{
  return swift_release();
}

id StartRootSpeechRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartRootSpeechRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D087418()
{
  unint64_t result = qword_26A639B30;
  if (!qword_26A639B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B30);
  }
  return result;
}

uint64_t sub_25D087464(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Location();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D0874A8()
{
  return type metadata accessor for StartRootSpeechRequestMessage(0);
}

uint64_t sub_25D0874B0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartRootSpeechRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartRootSpeechRequestMessage);
}

uint64_t dispatch thunk of StartRootSpeechRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void *initializeBufferWithCopyOfBuffer for StartRootSpeechRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    id v16 = (void *)((char *)v4 + v14);
    id v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *id v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *((unsigned char *)v4 + v19) = *((unsigned char *)a2 + v19);
    uint64_t v20 = a3[11];
    int v21 = *(void **)((char *)a2 + v20);
    *(void *)((char *)v4 + v20) = v21;
    swift_bridgeObjectRetain();
    swift_retain();
    id v22 = v21;
  }
  return v4;
}

void destroy for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_release();
  BOOL v6 = *(void **)(a1 + *(int *)(a2 + 44));
}

uint64_t initializeWithCopy for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[11];
  uint64_t v19 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v19;
  swift_bridgeObjectRetain();
  swift_retain();
  id v20 = v19;
  return a1;
}

uint64_t assignWithCopy for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v17 = a3[11];
  uint64_t v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  return a1;
}

uint64_t initializeWithTake for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  swift_release();
  uint64_t v21 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  id v22 = *(void **)(a1 + v21);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);

  return a1;
}

uint64_t getEnumTagSinglePayload for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D087DF0);
}

uint64_t sub_25D087DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartRootSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D087E9C);
}

uint64_t sub_25D087E9C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D087F20()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartRootSpeechRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0880ACLL);
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

ValueMetadata *type metadata accessor for StartRootSpeechRequestMessage.CodingKeys()
{
  return &type metadata for StartRootSpeechRequestMessage.CodingKeys;
}

unint64_t sub_25D0880E8()
{
  unint64_t result = qword_26A639B58;
  if (!qword_26A639B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B58);
  }
  return result;
}

unint64_t sub_25D088138()
{
  unint64_t result = qword_26A639B60;
  if (!qword_26A639B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B60);
  }
  return result;
}

unint64_t sub_25D088188()
{
  unint64_t result = qword_26A639B68;
  if (!qword_26A639B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B68);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_34()
{
  return type metadata accessor for StartRootSpeechRequestMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return v0;
}

void StartRootTextRequestMessage.inputOrigin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_inputOrigin);
}

void *StartRootTextRequestMessage.optionalRequestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_optionalRequestContextData);
  id v2 = v1;
  return v1;
}

uint64_t StartRootTextRequestMessage.textRequestType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType + 8);
  *a1 = v2;
  a1[1] = v3;
  return sub_25D014938(v2, v3);
}

void *StartRootTextRequestMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return StartRootTextRequestMessage.init(build:)(a1);
}

void *StartRootTextRequestMessage.init(build:)(void (*a1)(uint64_t))
{
  swift_getObjectType();
  uint64_t started = type metadata accessor for StartRootTextRequestMessage.Builder(0);
  uint64_t v5 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_5_5();
  *(unsigned char *)uint64_t v1 = 14;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  uint64_t v6 = v1 + v5[8];
  uint64_t v7 = sub_25D0BCFE0();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  uint64_t v8 = (void *)(v1 + v5[9]);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = v5[10];
  *(unsigned char *)(v1 + v9) = 19;
  uint64_t v10 = v5[11];
  *(void *)(v1 + v10) = 0;
  uint64_t v11 = (uint64_t *)(v1 + v5[12]);
  *(_OWORD *)uint64_t v11 = xmmword_25D0E3900;
  int v12 = v2;
  a1(v1);
  int v13 = *(unsigned __int8 *)(v1 + v9);
  if (v13 == 19)
  {

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25D0BD240();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B366B88);
    uint64_t v15 = sub_25D0BD230();
    os_log_type_t v16 = sub_25D0BD4B0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v31 = v18;
      *(_DWORD *)uint64_t v17 = 136446210;
      uint64_t v19 = sub_25CF695B0();
      sub_25D04E590(v19, v20, &v31);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v15, v16, "Could not build %{public}s: Builder has missing required fields", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v18, -1, -1);
      MEMORY[0x2611A4870](v17, -1, -1);
    }

    sub_25D088640(v1);
    type metadata accessor for StartRootTextRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v12[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_inputOrigin] = v13;
    id v22 = *(void **)(v1 + v10);
    *(void *)&v12[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_optionalRequestContextData] = v22;
    uint64_t v23 = *v11;
    uint64_t v24 = v11[1];
    if (v24 == 2) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = *v11;
    }
    if (v24 == 2) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v11[1];
    }
    uint64_t v27 = (uint64_t *)&v12[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType];
    uint64_t *v27 = v25;
    v27[1] = v26;
    id v28 = v22;
    sub_25D07892C(v23, v24);

    MEMORY[0x270FA5388](v29);
    uint64_t v21 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D0895B8);
    sub_25D088640(v1);
  }
  return v21;
}

uint64_t type metadata accessor for StartRootTextRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639B88);
}

uint64_t sub_25D088640(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartRootTextRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartRootTextRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364258);
}

uint64_t sub_25D0886BC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t started = type metadata accessor for StartRootTextRequestMessage.Builder(0);
  uint64_t v7 = a2 + *(int *)(started + 24);
  uint64_t v8 = type metadata accessor for RequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + *(int *)(v8 + 24));
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(started + 28));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  int v12 = (void *)(a1 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  return result;
}

void *StartRootTextRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartRootTextRequestMessage.init(from:)(a1);
}

void *StartRootTextRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639B70);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_5();
  uint64_t v11 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0895C0();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v11);
    type metadata accessor for StartRootTextRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D07DA78();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_inputOrigin] = v12[0];
    char v13 = 1;
    sub_25CF6ECE8();
    OUTLINED_FUNCTION_5_36();
    sub_25D0BD750();
    if ((unint64_t)v12[1] >> 60 == 15)
    {
      uint64_t v8 = 0;
    }
    else
    {
      sub_25D00AAF8();
      type metadata accessor for RequestContextData(0);
      uint64_t v8 = sub_25D0BD4C0();
      sub_25CF81BBC(v12[0], v12[1]);
    }
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_optionalRequestContextData] = v8;
    char v13 = 2;
    sub_25D078990();
    OUTLINED_FUNCTION_5_36();
    sub_25D0BD7E0();
    *(_OWORD *)&v5[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType] = *(_OWORD *)v12;

    sub_25CF68E70(v11, (uint64_t)v12);
    uint64_t v6 = RequestMessageBase.init(from:)(v12);
    uint64_t v9 = OUTLINED_FUNCTION_2_35();
    v10(v9);
    __swift_destroy_boxed_opaque_existential_1(v11);
  }
  return v6;
}

uint64_t sub_25D088B08(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639B80);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0895C0();
  sub_25D0BDA30();
  LOBYTE(v19) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_inputOrigin);
  sub_25D07DAC4();
  OUTLINED_FUNCTION_7_22();
  if (!v2)
  {
    uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_optionalRequestContextData);
    if (v9)
    {
      uint64_t v10 = self;
      *(void *)&long long v19 = 0;
      id v11 = v9;
      id v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, &v19);
      id v13 = (id)v19;
      if (!v12)
      {
        uint64_t v17 = v13;
        sub_25D0BCF40();

        swift_willThrow();
        goto LABEL_2;
      }
      uint64_t v18 = v11;
      uint64_t v14 = sub_25D0BCF60();
      unint64_t v16 = v15;

      *(void *)&long long v19 = v14;
      *((void *)&v19 + 1) = v16;
      sub_25CF6EDC8();
      OUTLINED_FUNCTION_7_22();

      sub_25CF6ED70(v14, v16);
    }
    long long v19 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType);
    sub_25D0789DC();
    OUTLINED_FUNCTION_7_22();
    sub_25D0292F0(a1);
  }
LABEL_2:
  uint64_t v6 = OUTLINED_FUNCTION_6_13();
  return v7(v6);
}

void StartRootTextRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartRootTextRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartRootTextRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootTextRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootTextRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartRootTextRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootTextRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartRootTextRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartRootTextRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootTextRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartRootTextRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartRootTextRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootTextRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartRootTextRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartRootTextRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartRootTextRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartRootTextRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartRootTextRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartRootTextRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_3_32() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartRootTextRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

uint64_t StartRootTextRequestMessage.Builder.textRequestType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 40));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_25D07892C(v4, v5);
}

uint64_t StartRootTextRequestMessage.Builder.textRequestType.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for StartRootTextRequestMessage.Builder(0) + 40));
  uint64_t result = sub_25D078A28(*v4, v4[1]);
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*StartRootTextRequestMessage.Builder.textRequestType.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D089208(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69724F7475706E69 && a2 == 0xEB000000006E6967;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D0C5670 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7571655274786574 && a2 == 0xEF65707954747365)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25D089374(char a1)
{
  if (!a1) {
    return 0x69724F7475706E69;
  }
  if (a1 == 1) {
    return 0xD00000000000001ALL;
  }
  return 0x7571655274786574;
}

uint64_t sub_25D0893E4()
{
  return sub_25D089374(*v0);
}

uint64_t sub_25D0893EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D089208(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D089414(uint64_t a1)
{
  unint64_t v2 = sub_25D0895C0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D089450(uint64_t a1)
{
  unint64_t v2 = sub_25D0895C0();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StartRootTextRequestMessage.__allocating_init(build:)()
{
}

void StartRootTextRequestMessage.init(build:)()
{
}

uint64_t sub_25D0894EC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType + 8);
  return sub_25D014910(v1, v2);
}

id StartRootTextRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartRootTextRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0895B8(uint64_t a1)
{
  return sub_25D0886BC(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D0895C0()
{
  unint64_t result = qword_26A639B78;
  if (!qword_26A639B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B78);
  }
  return result;
}

uint64_t sub_25D08960C()
{
  return type metadata accessor for StartRootTextRequestMessage(0);
}

uint64_t sub_25D089614()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartRootTextRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartRootTextRequestMessage);
}

uint64_t dispatch thunk of StartRootTextRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

void *initializeBufferWithCopyOfBuffer for StartRootTextRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    unint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *unint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = *(void **)((char *)a2 + v19);
    *(void *)((char *)v4 + v19) = v21;
    id v22 = (char *)v4 + v20;
    uint64_t v23 = (_OWORD *)((char *)a2 + v20);
    uint64_t v24 = *(void *)((char *)a2 + v20 + 8);
    swift_bridgeObjectRetain();
    id v25 = v21;
    if (v24 == 1 || v24 == 2)
    {
      *(_OWORD *)id v22 = *v23;
    }
    else
    {
      *(void *)id v22 = *(void *)v23;
      *((void *)v22 + 1) = v24;
      swift_bridgeObjectRetain();
    }
  }
  return v4;
}

uint64_t destroy for StartRootTextRequestMessage.Builder(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();

  uint64_t result = *(void *)(a1 + a2[10] + 8);
  if ((unint64_t)(result - 1) >= 2)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for StartRootTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  uint64_t v20 = a1 + v18;
  uint64_t v21 = (_OWORD *)(a2 + v18);
  uint64_t v22 = *(void *)(a2 + v18 + 8);
  swift_bridgeObjectRetain();
  id v23 = v19;
  if (v22 == 1 || v22 == 2)
  {
    *(_OWORD *)uint64_t v20 = *v21;
  }
  else
  {
    *(void *)uint64_t v20 = *(void *)v21;
    *(void *)(v20 + 8) = v22;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for StartRootTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  id v23 = (void *)(a2 + v21);
  uint64_t v24 = *(void *)(a1 + v21 + 8);
  uint64_t v25 = v23[1];
  if (v24 == 2)
  {
    if (v25 != 1 && v25 != 2) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (v25 == 2)
  {
    sub_25D079734((uint64_t)v22);
    goto LABEL_19;
  }
  if (v24 != 1)
  {
    if (v25 != 1)
    {
      *uint64_t v22 = *v23;
      v22[1] = v23[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25D0796E0((uint64_t)v22);
    goto LABEL_19;
  }
  if (v25 == 1)
  {
LABEL_19:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    return a1;
  }
LABEL_15:
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithTake for StartRootTextRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  uint64_t v22 = a3[10];
  id v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = *(void *)(a1 + v22 + 8);
  uint64_t v26 = v24[1];
  if (v25 != 2)
  {
    if (v26 == 2)
    {
      sub_25D079734((uint64_t)v23);
    }
    else if (v25 != 1)
    {
      if (v26 != 1)
      {
        *id v23 = *v24;
        v23[1] = v26;
        swift_bridgeObjectRelease();
        return a1;
      }
      sub_25D0796E0((uint64_t)v23);
    }
  }
  *(_OWORD *)id v23 = *(_OWORD *)v24;
  return a1;
}

uint64_t getEnumTagSinglePayload for StartRootTextRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D089F58);
}

uint64_t sub_25D089F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartRootTextRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D08A004);
}

uint64_t sub_25D08A004(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D08A088()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartRootTextRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D08A214);
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

ValueMetadata *type metadata accessor for StartRootTextRequestMessage.CodingKeys()
{
  return &type metadata for StartRootTextRequestMessage.CodingKeys;
}

unint64_t sub_25D08A250()
{
  unint64_t result = qword_26A639B98;
  if (!qword_26A639B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639B98);
  }
  return result;
}

unint64_t sub_25D08A2A0()
{
  unint64_t result = qword_26A639BA0;
  if (!qword_26A639BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BA0);
  }
  return result;
}

unint64_t sub_25D08A2F0()
{
  unint64_t result = qword_26A639BA8;
  if (!qword_26A639BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_32()
{
  return type metadata accessor for StartRootTextRequestMessage.Builder(0);
}

uint64_t sub_25D08A380(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025D0C5940)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D08A408()
{
  return 0xD000000000000010;
}

uint64_t sub_25D08A428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D08A380(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D08A454(uint64_t a1)
{
  unint64_t v2 = sub_25D08B670();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D08A490(uint64_t a1)
{
  unint64_t v2 = sub_25D08B670();
  return MEMORY[0x270FA00B8](a1, v2);
}

id StartSpeechDictationRequestMessage.dictationOptions.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions);
}

void *StartSpeechDictationRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechDictationRequestMessage.init(build:)(a1);
}

void *StartSpeechDictationRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  id ObjectType = (id)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v45 = v12 - v11;
  uint64_t started = type metadata accessor for StartSpeechDictationRequestMessage.Builder(0);
  uint64_t v14 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_5_5();
  unsigned __int8 *v1 = 14;
  *((void *)v1 + 1) = 0;
  *((void *)v1 + 2) = 0;
  uint64_t v15 = (uint64_t)&v1[v14[8]];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v8);
  uint64_t v16 = &v1[v14[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = v14[10];
  v1[v17] = 19;
  uint64_t v18 = v14[11];
  *(void *)&v1[v18] = 0;
  uint64_t v19 = v2;
  a1(v1);
  int v20 = *v1;
  if (v20 == 14 || (uint64_t v21 = *((void *)v1 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v43 = *((void *)v1 + 1);
  sub_25CF67F88(v15, v7);
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {

    sub_25CF69FC0(v7);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    id v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v48 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v47 = sub_25D04E590(v27, v28, &v48);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D08AA10((uint64_t)v1);
    type metadata accessor for StartSpeechDictationRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v42 = v21;
  uint64_t v31 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v45, v7, v8);
  uint64_t v32 = *((void *)v16 + 1);
  if (!v32 || (int v33 = v1[v17], v33 == 19) || (v34 = *(void **)&v1[v18]) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v8);
    goto LABEL_6;
  }
  uint64_t v41 = *(void *)v16;
  *(void *)&v19[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions] = v34;
  uint64_t v35 = v31;
  id ObjectType = v34;
  uint64_t v36 = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v37);
  *((unsigned char *)&v41 - 64) = v20;
  *(&v41 - 7) = v43;
  *(&v41 - 6) = v36;
  uint64_t v38 = v45;
  uint64_t v39 = v41;
  *(&v41 - 5) = v45;
  *(&v41 - 4) = v39;
  *(&v41 - 3) = v32;
  *((unsigned char *)&v41 - 16) = v33;
  uint64_t v29 = StartRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D08B658);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v40 = v29;

  sub_25D08AA10((uint64_t)v1);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v38, v8);
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for StartSpeechDictationRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639BD0);
}

uint64_t sub_25D08AA10(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartSpeechDictationRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartSpeechDictationRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365260);
}

uint64_t sub_25D08AA8C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)a1 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  uint64_t started = (int *)type metadata accessor for StartRequestMessageBase.Builder(0);
  uint64_t v16 = a1 + started[6];
  sub_25CF69FC0(v16);
  uint64_t v17 = sub_25D0BCFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v16, a5, v17);
  __swift_storeEnumTagSinglePayload(v16, 0, 1, v17);
  uint64_t v18 = (void *)(a1 + started[7]);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v18 = a6;
  v18[1] = a7;
  *(unsigned char *)(a1 + started[8]) = a8;
  return result;
}

void *StartSpeechDictationRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechDictationRequestMessage.init(from:)(a1);
}

void *StartSpeechDictationRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639BB0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_5();
  uint64_t v5 = a1[3];
  uint64_t v18 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v5);
  sub_25D08B670();
  uint64_t v6 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t)v18;
  }
  else
  {
    sub_25CF6ECE8();
    sub_25D0BD7E0();
    sub_25CF6ED34(0, (unint64_t *)&qword_26A636C18);
    sub_25CF6ED34(0, &qword_26A639BC0);
    uint64_t v10 = (void *)sub_25D0BD4C0();
    uint64_t v8 = (uint64_t)v18;
    if (v10)
    {
      *(void *)&v6[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions] = v10;
      id v16 = v10;

      sub_25CF68E70(v8, (uint64_t)&v17);
      uint64_t v7 = StartRequestMessageBase.init(from:)(&v17);
      uint64_t v14 = OUTLINED_FUNCTION_1_21();
      v15(v14);
      OUTLINED_FUNCTION_2_1();

      __swift_destroy_boxed_opaque_existential_1(v8);
      return v7;
    }

    sub_25CF6D168();
    swift_allocError();
    *(void *)uint64_t v13 = 0xD000000000000026;
    *(void *)(v13 + 8) = 0x800000025D0C5870;
    *(unsigned char *)(v13 + 16) = 0;
    swift_willThrow();
    OUTLINED_FUNCTION_2_1();
    uint64_t v11 = OUTLINED_FUNCTION_1_21();
    v12(v11);
    uint64_t v7 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1(v8);
  type metadata accessor for StartSpeechDictationRequestMessage(0);
  swift_deallocPartialClassInstance();
  return v7;
}

uint64_t sub_25D08AECC(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639BC8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08B670();
  sub_25D0BDA30();
  uint64_t v5 = self;
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions);
  v18[0] = 0;
  id v7 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v6, 1, v18);
  id v8 = v18[0];
  if (v7)
  {
    uint64_t v9 = (void *)sub_25D0BCF60();
    uint64_t v11 = v10;

    v18[0] = v9;
    v18[1] = v11;
    sub_25CF6EDC8();
    sub_25D0BD8E0();
    if (!v2) {
      sub_25D07EEEC(a1);
    }
    uint64_t v12 = OUTLINED_FUNCTION_6_13();
    v13(v12);
    return OUTLINED_FUNCTION_2_1();
  }
  else
  {
    uint64_t v15 = v8;
    sub_25D0BCF40();

    swift_willThrow();
    uint64_t v16 = OUTLINED_FUNCTION_6_13();
    return v17(v16);
  }
}

uint64_t sub_25D08B0C0()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for StartSpeechDictationRequestMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  return v7;
}

id sub_25D08B188(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return v5;
}

void StartSpeechDictationRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartSpeechDictationRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechDictationRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartSpeechDictationRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechDictationRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartSpeechDictationRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartSpeechDictationRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartSpeechDictationRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartSpeechDictationRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartSpeechDictationRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

void *StartSpeechDictationRequestMessage.Builder.dictationOptions.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartSpeechDictationRequestMessage.Builder(0) + 36));
  id v2 = v1;
  return v1;
}

void StartSpeechDictationRequestMessage.Builder.dictationOptions.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_6_30() + 36);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartSpeechDictationRequestMessage.Builder.dictationOptions.modify())(void)
{
  return nullsub_1;
}

void StartSpeechDictationRequestMessage.__allocating_init(build:)()
{
}

void StartSpeechDictationRequestMessage.init(build:)()
{
}

void sub_25D08B600()
{
}

id StartSpeechDictationRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartSpeechDictationRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D08B658(uint64_t a1)
{
  return sub_25D08AA8C(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64));
}

unint64_t sub_25D08B670()
{
  unint64_t result = qword_26A639BB8;
  if (!qword_26A639BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BB8);
  }
  return result;
}

uint64_t sub_25D08B6BC()
{
  return type metadata accessor for StartSpeechDictationRequestMessage(0);
}

uint64_t sub_25D08B6C4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartSpeechDictationRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartSpeechDictationRequestMessage);
}

uint64_t dispatch thunk of StartSpeechDictationRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for StartSpeechDictationRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D08B74C);
}

uint64_t sub_25D08B74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartSpeechDictationRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D08B7F8);
}

uint64_t sub_25D08B7F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D08B87C()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartSpeechDictationRequestMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D08B9CCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartSpeechDictationRequestMessage.CodingKeys()
{
  return &type metadata for StartSpeechDictationRequestMessage.CodingKeys;
}

unint64_t sub_25D08BA08()
{
  unint64_t result = qword_26A639BE0;
  if (!qword_26A639BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BE0);
  }
  return result;
}

unint64_t sub_25D08BA58()
{
  unint64_t result = qword_26A639BE8;
  if (!qword_26A639BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BE8);
  }
  return result;
}

unint64_t sub_25D08BAA8()
{
  unint64_t result = qword_26A639BF0;
  if (!qword_26A639BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639BF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_30()
{
  return type metadata accessor for StartSpeechDictationRequestMessage.Builder(0);
}

uint64_t sub_25D08BB0C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025D0C59E0 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x644972657375 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25D08BC58(char a1)
{
  if (!a1) {
    return 0x65676175676E616CLL;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  return 0x644972657375;
}

uint64_t sub_25D08BCB8()
{
  return sub_25D08BC58(*v0);
}

uint64_t sub_25D08BCC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D08BB0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D08BCE8(uint64_t a1)
{
  unint64_t v2 = sub_25D08CECC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D08BD24(uint64_t a1)
{
  unint64_t v2 = sub_25D08CECC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StartSpeechDictationSessionMessage.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_languageCode);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechDictationSessionMessage.recognitionOnDevice.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_recognitionOnDevice);
}

uint64_t StartSpeechDictationSessionMessage.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_userId + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_userId);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *StartSpeechDictationSessionMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechDictationSessionMessage.init(build:)(a1);
}

void *StartSpeechDictationSessionMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v4;
  uint64_t v56 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_0();
  uint64_t v54 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_0();
  uint64_t v57 = v13;
  uint64_t started = type metadata accessor for StartSpeechDictationSessionMessage.Builder(0);
  uint64_t v15 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = (unsigned __int8 *)(v17 - v16);
  *uint64_t v18 = 14;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  uint64_t v19 = v17 - v16 + v15[8];
  uint64_t v59 = v10;
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v10);
  int v20 = (uint64_t *)&v18[v15[9]];
  *int v20 = 0;
  v20[1] = 0;
  uint64_t v21 = v15[10];
  v18[v21] = 1;
  uint64_t v22 = &v18[v15[11]];
  *(void *)uint64_t v22 = 0xD000000000000024;
  *((void *)v22 + 1) = 0x800000025D0C14A0;
  id v23 = v1;
  a1(v18);
  int v24 = *v18;
  if (v24 == 14 || (uint64_t v25 = *((void *)v18 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v53 = *((void *)v18 + 1);
  sub_25CF67F88(v19, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v59) == 1)
  {

    sub_25CF69FC0(v9);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25D0BD240();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B366B88);
    uint64_t v27 = sub_25D0BD230();
    os_log_type_t v28 = sub_25D0BD4B0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v61[0] = v30;
      *(_DWORD *)uint64_t v29 = 136446210;
      uint64_t v31 = sub_25CF695B0();
      v61[2] = sub_25D04E590(v31, v32, v61);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v27, v28, "Could not build %{public}s: Builder has missing required fields", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v30, -1, -1);
      MEMORY[0x2611A4870](v29, -1, -1);
    }

    sub_25D08C494((uint64_t)v18);
LABEL_11:
    type metadata accessor for StartSpeechDictationSessionMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v52 = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v57, v9, v59);
  uint64_t v35 = v20[1];
  if (!v35)
  {

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    goto LABEL_6;
  }
  v61[0] = *v20;
  v61[1] = v35;
  uint64_t v36 = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v37 = sub_25D0BD560();
  unint64_t v39 = v38;
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
  swift_bridgeObjectRelease();
  uint64_t v40 = HIBYTE(v39) & 0xF;
  if ((v39 & 0x2000000000000000) == 0) {
    uint64_t v40 = v37 & 0xFFFFFFFFFFFFLL;
  }
  if (!v40)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_25D0BD240();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B366B88);
    uint64_t v48 = sub_25D0BD230();
    os_log_type_t v49 = sub_25D0BD4B0();
    uint64_t v50 = v57;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_25CF65000, v48, v49, "languageCode is empty, cannot create StartDitationSessionMessage", v51, 2u);
      MEMORY[0x2611A4870](v51, -1, -1);
    }

    sub_25D08C494((uint64_t)v18);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v50, v59);
    goto LABEL_11;
  }
  uint64_t v41 = (uint64_t *)&v23[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_languageCode];
  *uint64_t v41 = v37;
  v41[1] = v39;
  v23[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_recognitionOnDevice] = v18[v21];
  uint64_t v42 = *((void *)v22 + 1);
  uint64_t v43 = &v23[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_userId];
  *(void *)uint64_t v43 = *(void *)v22;
  *((void *)v43 + 1) = v42;
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v44);
  *((unsigned char *)&v52 - 32) = v24;
  *(&v52 - 3) = v53;
  *(&v52 - 2) = v36;
  uint64_t v45 = v57;
  *(&v52 - 1) = v57;
  int v33 = SessionMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF6A020);
  swift_bridgeObjectRelease();
  id v46 = v33;
  sub_25D08C494((uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v45, v59);
  if (v33) {

  }
  return v33;
}

uint64_t type metadata accessor for StartSpeechDictationSessionMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639C10);
}

uint64_t sub_25D08C494(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartSpeechDictationSessionMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartSpeechDictationSessionMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365270);
}

void *StartSpeechDictationSessionMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechDictationSessionMessage.init(from:)(a1);
}

void *StartSpeechDictationSessionMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639BF8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08CECC();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    __swift_destroy_boxed_opaque_existential_1(v15);
    type metadata accessor for StartSpeechDictationSessionMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v6 = sub_25D0BD780();
    uint64_t v9 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_languageCode];
    uint64_t *v9 = v6;
    v9[1] = v10;
    LOBYTE(v16[0]) = 1;
    v5[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_recognitionOnDevice] = sub_25D0BD790() & 1;
    char v17 = 2;
    sub_25CF89594();
    sub_25D0BD7E0();
    uint64_t v11 = v16[1];
    uint64_t v12 = &v5[OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationSessionMessage_userId];
    *(void *)uint64_t v12 = v16[0];
    *((void *)v12 + 1) = v11;

    sub_25CF68E70(v15, (uint64_t)v16);
    uint64_t v7 = SessionMessageBase.init(from:)(v16);
    uint64_t v13 = OUTLINED_FUNCTION_2_36();
    v14(v13);
    __swift_destroy_boxed_opaque_existential_1(v15);
  }
  return v7;
}

uint64_t sub_25D08C818(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C08);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08CECC();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25D0BD890();
    sub_25CF89668();
    sub_25D0BD8E0();
    sub_25D04DC04(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void StartSpeechDictationSessionMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartSpeechDictationSessionMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartSpeechDictationSessionMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.languageCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.languageCode.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.recognitionOnDevice.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 32));
}

uint64_t StartSpeechDictationSessionMessage.Builder.recognitionOnDevice.setter(char a1)
{
  uint64_t result = type metadata accessor for StartSpeechDictationSessionMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.recognitionOnDevice.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechDictationSessionMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 36));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t StartSpeechDictationSessionMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for StartSpeechDictationSessionMessage.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*StartSpeechDictationSessionMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

void StartSpeechDictationSessionMessage.__allocating_init(build:)()
{
}

void StartSpeechDictationSessionMessage.init(build:)()
{
}

uint64_t sub_25D08CDF8()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id StartSpeechDictationSessionMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartSpeechDictationSessionMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D08CECC()
{
  unint64_t result = qword_26A639C00;
  if (!qword_26A639C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C00);
  }
  return result;
}

uint64_t sub_25D08CF18()
{
  return type metadata accessor for StartSpeechDictationSessionMessage(0);
}

uint64_t sub_25D08CF20()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartSpeechDictationSessionMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartSpeechDictationSessionMessage);
}

uint64_t dispatch thunk of StartSpeechDictationSessionMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for StartSpeechDictationSessionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D08CFB0);
}

uint64_t sub_25D08CFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StartSpeechDictationSessionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D08D05C);
}

void sub_25D08D05C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  }
}

void sub_25D08D0F0()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartSpeechDictationSessionMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D08D270);
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

ValueMetadata *type metadata accessor for StartSpeechDictationSessionMessage.CodingKeys()
{
  return &type metadata for StartSpeechDictationSessionMessage.CodingKeys;
}

unint64_t sub_25D08D2AC()
{
  unint64_t result = qword_26A639C20;
  if (!qword_26A639C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C20);
  }
  return result;
}

unint64_t sub_25D08D2FC()
{
  unint64_t result = qword_26A639C28;
  if (!qword_26A639C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C28);
  }
  return result;
}

unint64_t sub_25D08D34C()
{
  unint64_t result = qword_26A639C30;
  if (!qword_26A639C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C30);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_36()
{
  return v0;
}

void *StartSpeechRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v43 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for StartSpeechRequestMessage.Builder(0);
  uint64_t v9 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  uint64_t v11 = (unsigned __int8 *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v11 = 14;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  uint64_t v12 = (uint64_t)&v11[v9[8]];
  uint64_t v41 = v4;
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v4);
  uint64_t v13 = &v11[v9[9]];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = v9[10];
  v11[v14] = 19;
  uint64_t v15 = v9[11];
  *(void *)&v11[v15] = 0;
  uint64_t v16 = v9[12];
  v11[v16] = 2;
  *(void *)&v11[v9[13]] = 0;
  char v17 = v1;
  v43(v11);
  int v18 = *v11;
  if (v18 == 14 || !*((void *)v11 + 2))
  {

    goto LABEL_6;
  }
  uint64_t v43 = (void (*)(unsigned __int8 *))*((void *)v11 + 2);
  uint64_t v38 = *((void *)v11 + 1);
  sub_25CF67F88(v12, v2);
  uint64_t v19 = v41;
  if (__swift_getEnumTagSinglePayload(v2, 1, v41) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25D0BD240();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B366B88);
    uint64_t v21 = sub_25D0BD230();
    os_log_type_t v22 = sub_25D0BD4B0();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v45 = v24;
      *(_DWORD *)id v23 = 136446210;
      uint64_t v25 = sub_25CF695B0();
      uint64_t v44 = sub_25D04E590(v25, v26, &v45);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v21, v22, "Could not build %{public}s: Builder has missing required fields", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v24, -1, -1);
      MEMORY[0x2611A4870](v23, -1, -1);
    }

    sub_25D08D8F4((uint64_t)v11);
    type metadata accessor for StartSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v29 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v40, v2, v19);
  uint64_t v30 = *((void *)v13 + 1);
  if (!v30)
  {

    (*(void (**)(char *, uint64_t))(v29 + 8))(v40, v19);
    goto LABEL_6;
  }
  int v31 = v11[v14];
  if (v31 == 19)
  {

    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v19);
    goto LABEL_6;
  }
  int v32 = v11[v16];
  int v33 = v40;
  if (v32 == 2)
  {

    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v19);
    goto LABEL_6;
  }
  uint64_t v34 = *(void *)v13;
  *(void *)&v17[OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_location] = *(void *)&v11[v15];
  v17[OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_asrOnServer] = v32 & 1;
  swift_retain();
  uint64_t v35 = v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v36);
  *((unsigned char *)&v38 - 64) = v18;
  *(&v38 - 7) = v38;
  *(&v38 - 6) = (uint64_t)v35;
  *(&v38 - 5) = (uint64_t)v33;
  *(&v38 - 4) = v34;
  *(&v38 - 3) = v30;
  *((unsigned char *)&v38 - 16) = v31;
  *(&v38 - 1) = (uint64_t)v11;
  uint64_t v27 = StartRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D08E728);
  id v37 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v19);
  if (v27) {

  }
  sub_25D08D8F4((uint64_t)v11);
  return v27;
}

uint64_t type metadata accessor for StartSpeechRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B362990);
}

uint64_t sub_25D08D8F4(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartSpeechRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartSpeechRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3629F8);
}

void *StartSpeechRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C38);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08E764();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v10);
    type metadata accessor for StartSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for Location();
    char v12 = 0;
    sub_25D087464(&qword_26A639B38);
    sub_25D0BD750();
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_location] = v11[0];
    LOBYTE(v11[0]) = 1;
    v5[OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_asrOnServer] = sub_25D0BD790() & 1;

    sub_25CF68E70(v10, (uint64_t)v11);
    uint64_t v6 = StartRequestMessageBase.init(from:)(v11);
    uint64_t v8 = OUTLINED_FUNCTION_2();
    v9(v8);
    __swift_destroy_boxed_opaque_existential_1(v10);
  }
  return v6;
}

uint64_t sub_25D08DC14(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B364718);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D08E764();
  sub_25D0BDA30();
  if (*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_location))
  {
    type metadata accessor for Location();
    sub_25D087464(&qword_26B3645F0);
    swift_retain();
    sub_25D0BD8E0();
    if (v2)
    {
      uint64_t v5 = OUTLINED_FUNCTION_15_2();
      v6(v5);
      return swift_release();
    }
    swift_release();
  }
  sub_25D0BD890();
  if (!v2) {
    sub_25D07EEEC(a1);
  }
  uint64_t v8 = OUTLINED_FUNCTION_15_2();
  return v9(v8);
}

void StartSpeechRequestMessage.__allocating_init(build:)()
{
}

uint64_t sub_25D08DDFC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265536E4F727361 && a2 == 0xEB00000000726576)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D08DEF4(char a1)
{
  if (a1) {
    return 0x7265536E4F727361;
  }
  else {
    return 0x6E6F697461636F6CLL;
  }
}

uint64_t sub_25D08DF34()
{
  return sub_25D08DEF4(*v0);
}

uint64_t sub_25D08DF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D08DDFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D08DF64(uint64_t a1)
{
  unint64_t v2 = sub_25D08E764();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D08DFA0(uint64_t a1)
{
  unint64_t v2 = sub_25D08E764();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StartSpeechRequestMessage.location.getter()
{
  return swift_retain();
}

uint64_t StartSpeechRequestMessage.asrOnServer.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes25StartSpeechRequestMessage_asrOnServer);
}

void *StartSpeechRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechRequestMessage.init(build:)(a1);
}

void sub_25D08E040(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  *(unsigned char *)a1 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  uint64_t started = (int *)type metadata accessor for StartRequestMessageBase.Builder(0);
  uint64_t v17 = a1 + started[6];
  sub_25CF69FC0(v17);
  uint64_t v18 = sub_25D0BCFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v17, a5, v18);
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v18);
  uint64_t v19 = (void *)(a1 + started[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void *v19 = a6;
  v19[1] = a7;
  *(unsigned char *)(a1 + started[8]) = a8;
  uint64_t v20 = *(void **)(a9 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 44));
  uint64_t v21 = started[9];
  os_log_type_t v22 = *(void **)(a1 + v21);
  id v23 = v20;

  *(void *)(a1 + v21) = v20;
}

void *StartSpeechRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechRequestMessage.init(from:)(a1);
}

void StartSpeechRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartSpeechRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartSpeechRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartSpeechRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartSpeechRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartSpeechRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartSpeechRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.location.getter()
{
  type metadata accessor for StartSpeechRequestMessage.Builder(0);
  return swift_retain();
}

uint64_t StartSpeechRequestMessage.Builder.location.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_3_33() + 36);
  uint64_t result = swift_release();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.location.modify())(void)
{
  return nullsub_1;
}

uint64_t StartSpeechRequestMessage.Builder.asrOnServer.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 40));
}

uint64_t StartSpeechRequestMessage.Builder.asrOnServer.setter(char a1)
{
  uint64_t result = type metadata accessor for StartSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*StartSpeechRequestMessage.Builder.asrOnServer.modify())(void)
{
  return nullsub_1;
}

void *StartSpeechRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartSpeechRequestMessage.Builder(0) + 44));
  id v2 = v1;
  return v1;
}

void StartSpeechRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_3_33() + 44);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartSpeechRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

void StartSpeechRequestMessage.init(build:)()
{
}

uint64_t sub_25D08E6D0()
{
  return swift_release();
}

id StartSpeechRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartSpeechRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25D08E728(uint64_t a1)
{
  sub_25D08E040(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64), *(void *)(v1 + 72));
}

unint64_t sub_25D08E764()
{
  unint64_t result = qword_26B3641F8;
  if (!qword_26B3641F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3641F8);
  }
  return result;
}

uint64_t sub_25D08E7B0()
{
  return type metadata accessor for StartSpeechRequestMessage(0);
}

uint64_t sub_25D08E7B8()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartSpeechRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartSpeechRequestMessage);
}

uint64_t dispatch thunk of StartSpeechRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t getEnumTagSinglePayload for StartSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D08E844);
}

uint64_t sub_25D08E844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D08E8F0);
}

uint64_t sub_25D08E8F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D08E974()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartSpeechRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D08EB00);
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

ValueMetadata *type metadata accessor for StartSpeechRequestMessage.CodingKeys()
{
  return &type metadata for StartSpeechRequestMessage.CodingKeys;
}

unint64_t sub_25D08EB3C()
{
  unint64_t result = qword_26A639C40;
  if (!qword_26A639C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C40);
  }
  return result;
}

unint64_t sub_25D08EB8C()
{
  unint64_t result = qword_26B364208;
  if (!qword_26B364208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364208);
  }
  return result;
}

unint64_t sub_25D08EBDC()
{
  unint64_t result = qword_26B364200;
  if (!qword_26B364200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364200);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_33()
{
  return type metadata accessor for StartSpeechRequestMessage.Builder(0);
}

uint64_t sub_25D08EC40(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5341656C62616E65 && a2 == 0xE900000000000052;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65746E6F4374696ALL && a2 == 0xEA00000000007478;
    if (v6 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x800000025D0C5B10)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_25D0BD940();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_25D08ED90(char a1)
{
  if (!a1) {
    return 0x5341656C62616E65;
  }
  if (a1 == 1) {
    return 0x65746E6F4374696ALL;
  }
  return 0xD000000000000011;
}

uint64_t sub_25D08EDF4()
{
  return sub_25D08ED90(*v0);
}

uint64_t sub_25D08EDFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D08EC40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D08EE24(uint64_t a1)
{
  unint64_t v2 = sub_25D090314();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D08EE60(uint64_t a1)
{
  unint64_t v2 = sub_25D090314();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StartTestSpeechRequestMessage.enableASR.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_enableASR);
}

uint64_t StartTestSpeechRequestMessage.jitContext.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StartTestSpeechRequestMessage.overrideModelPath.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *StartTestSpeechRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartTestSpeechRequestMessage.init(build:)(a1);
}

void *StartTestSpeechRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  os_log_type_t v49 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v46 = v8 - v7;
  uint64_t started = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  uint64_t v10 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = (unsigned __int8 *)(v12 - v11);
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v14 = v12 - v11 + v10[8];
  uint64_t v47 = v4;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v4);
  uint64_t v15 = &v13[v10[9]];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  uint64_t v16 = v10[10];
  v13[v16] = 19;
  *(void *)&v13[v10[11]] = 0;
  uint64_t v17 = v10[12];
  v13[v17] = 2;
  uint64_t v44 = v10[13];
  *(void *)&v13[v44] = 0;
  uint64_t v18 = &v13[v10[14]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  *(void *)&v13[v10[15]] = 0;
  uint64_t v19 = v1;
  v49(v13);
  int v20 = *v13;
  if (v20 == 14 || (uint64_t v21 = *((void *)v13 + 2)) == 0)
  {

    goto LABEL_6;
  }
  os_log_type_t v49 = (void (*)(unsigned __int8 *))*((void *)v13 + 1);
  sub_25CF67F88(v14, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v47) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    id v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v51 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v50 = sub_25D04E590(v27, v28, &v51);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D08F49C((uint64_t)v13);
    type metadata accessor for StartTestSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v43 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v46, v2, v47);
  uint64_t v31 = *((void *)v15 + 1);
  if (!v31 || (v32 = v13[v16], v32 == 19) || (int v33 = v13[v17], v34 = v46, v33 == 2))
  {

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
    goto LABEL_6;
  }
  uint64_t v35 = *(void *)v15;
  v19[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_enableASR] = v33 & 1;
  *(void *)&v19[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_jitContext] = *(void *)&v13[v44];
  uint64_t v36 = *((void *)v18 + 1);
  id v37 = &v19[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_overrideModelPath];
  *(void *)id v37 = *(void *)v18;
  *((void *)v37 + 1) = v36;
  swift_bridgeObjectRetain();
  uint64_t v38 = v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v39);
  *((unsigned char *)&v42 - 64) = v20;
  *(&v42 - 7) = (uint64_t)v49;
  *(&v42 - 6) = v38;
  *(&v42 - 5) = v34;
  *(&v42 - 4) = v35;
  *(&v42 - 3) = v31;
  *((unsigned char *)&v42 - 16) = v32;
  *(&v42 - 1) = (uint64_t)v13;
  uint64_t v40 = v34;
  uint64_t v29 = StartSpeechRequestMessage.init(build:)((void (*)(unsigned __int8 *))sub_25D0902D8);
  id v41 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v40, v47);
  if (v29) {

  }
  sub_25D08F49C((uint64_t)v13);
  return v29;
}

uint64_t type metadata accessor for StartTestSpeechRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639C60);
}

uint64_t sub_25D08F49C(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartTestSpeechRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364FB8);
}

void sub_25D08F518(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  *(unsigned char *)a1 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  uint64_t started = (int *)type metadata accessor for StartSpeechRequestMessage.Builder(0);
  uint64_t v17 = a1 + started[6];
  sub_25CF69FC0(v17);
  uint64_t v18 = sub_25D0BCFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v17, a5, v18);
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v18);
  uint64_t v19 = (void *)(a1 + started[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void *v19 = a6;
  v19[1] = a7;
  *(unsigned char *)(a1 + started[8]) = a8;
  uint64_t v20 = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  uint64_t v21 = *(void *)(a9 + *(int *)(v20 + 36));
  uint64_t v22 = started[9];
  swift_retain();
  swift_release();
  *(void *)(a1 + v22) = v21;
  *(unsigned char *)(a1 + started[10]) = 0;
  id v23 = *(void **)(a9 + *(int *)(v20 + 52));
  uint64_t v24 = started[11];
  uint64_t v25 = *(void **)(a1 + v24);
  id v26 = v23;

  *(void *)(a1 + v24) = v23;
}

void *StartTestSpeechRequestMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartTestSpeechRequestMessage.init(from:)(a1);
}

void *StartTestSpeechRequestMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C48);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D090314();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v13);
    type metadata accessor for StartTestSpeechRequestMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B365650);
    char v15 = 1;
    sub_25CFF9E54(&qword_26A638130);
    sub_25D0BD750();
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_jitContext] = v14[0];
    OUTLINED_FUNCTION_6_31();
    v5[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_enableASR] = sub_25D0BD790() & 1;
    LOBYTE(v14[0]) = 2;
    OUTLINED_FUNCTION_6_31();
    uint64_t v8 = sub_25D0BD720();
    uint64_t v9 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_overrideModelPath];
    uint64_t *v9 = v8;
    v9[1] = v10;

    sub_25CF68E70(v13, (uint64_t)v14);
    uint64_t v6 = StartSpeechRequestMessage.init(from:)(v14);
    uint64_t v11 = OUTLINED_FUNCTION_2_36();
    v12(v11);
    __swift_destroy_boxed_opaque_existential_1(v13);
  }
  return v6;
}

uint64_t sub_25D08F98C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C58);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D090314();
  sub_25D0BDA30();
  if (!*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_jitContext)
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_26B365650),
        sub_25CFF9E54((unint64_t *)&unk_26B365658),
        sub_25D0BD8E0(),
        !v2))
  {
    sub_25D0BD890();
    if (!v2)
    {
      if (*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StartTestSpeechRequestMessage_overrideModelPath + 8)) {
        sub_25D0BD880();
      }
      sub_25D08DC14(a1);
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
}

void StartTestSpeechRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartTestSpeechRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartTestSpeechRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartTestSpeechRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartTestSpeechRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartTestSpeechRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.inputOrigin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t StartTestSpeechRequestMessage.Builder.inputOrigin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.inputOrigin.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.location.getter()
{
  type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  return swift_retain();
}

uint64_t StartTestSpeechRequestMessage.Builder.location.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_39() + 36);
  uint64_t result = swift_release();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.location.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.enableASR.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 40));
}

uint64_t StartTestSpeechRequestMessage.Builder.enableASR.setter(char a1)
{
  uint64_t result = type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.enableASR.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.jitContext.getter()
{
  type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t StartTestSpeechRequestMessage.Builder.jitContext.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_39() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.jitContext.modify())(void)
{
  return nullsub_1;
}

uint64_t StartTestSpeechRequestMessage.Builder.overrideModelPath.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StartTestSpeechRequestMessage.Builder.overrideModelPath.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 48));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.overrideModelPath.modify())(void)
{
  return nullsub_1;
}

void *StartTestSpeechRequestMessage.Builder.requestContextData.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StartTestSpeechRequestMessage.Builder(0) + 52));
  id v2 = v1;
  return v1;
}

void StartTestSpeechRequestMessage.Builder.requestContextData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_39() + 52);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*StartTestSpeechRequestMessage.Builder.requestContextData.modify())(void)
{
  return nullsub_1;
}

void StartTestSpeechRequestMessage.__allocating_init(build:)()
{
}

void StartTestSpeechRequestMessage.init(build:)()
{
}

uint64_t sub_25D09020C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id StartTestSpeechRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartTestSpeechRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25D0902D8(uint64_t a1)
{
  sub_25D08F518(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64), *(void *)(v1 + 72));
}

unint64_t sub_25D090314()
{
  unint64_t result = qword_26A639C50;
  if (!qword_26A639C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C50);
  }
  return result;
}

uint64_t sub_25D090360()
{
  return type metadata accessor for StartTestSpeechRequestMessage(0);
}

uint64_t sub_25D090368()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartTestSpeechRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartTestSpeechRequestMessage);
}

uint64_t dispatch thunk of StartTestSpeechRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

void *initializeBufferWithCopyOfBuffer for StartTestSpeechRequestMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *((unsigned char *)v4 + v19) = *((unsigned char *)a2 + v19);
    uint64_t v20 = a3[12];
    *(void *)((char *)v4 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    uint64_t v21 = (void *)((char *)v4 + v20);
    uint64_t v22 = (void *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = a3[13];
    uint64_t v25 = *(void **)((char *)a2 + v24);
    *(void *)((char *)v4 + v24) = v25;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v26 = v25;
  }
  return v4;
}

void destroy for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 52));
}

uint64_t initializeWithCopy for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = a3[13];
  uint64_t v23 = *(void **)(a2 + v22);
  *(void *)(a1 + v22) = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = v23;
  return a1;
}

uint64_t assignWithCopy for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[12];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[13];
  uint64_t v21 = *(void **)(a1 + v20);
  uint64_t v22 = *(void **)(a2 + v20);
  *(void *)(a1 + v20) = v22;
  id v23 = v22;

  return a1;
}

uint64_t initializeWithTake for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  swift_release();
  uint64_t v21 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[12];
  id v23 = (void *)(a1 + v22);
  id v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *id v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[13];
  unint64_t v28 = *(void **)(a1 + v27);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);

  return a1;
}

uint64_t getEnumTagSinglePayload for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D090DA8);
}

uint64_t sub_25D090DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StartTestSpeechRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D090E54);
}

uint64_t sub_25D090E54(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D090ED8()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartTestSpeechRequestMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D091068);
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

ValueMetadata *type metadata accessor for StartTestSpeechRequestMessage.CodingKeys()
{
  return &type metadata for StartTestSpeechRequestMessage.CodingKeys;
}

unint64_t sub_25D0910A4()
{
  unint64_t result = qword_26A639C70;
  if (!qword_26A639C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C70);
  }
  return result;
}

unint64_t sub_25D0910F4()
{
  unint64_t result = qword_26A639C78;
  if (!qword_26A639C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C78);
  }
  return result;
}

unint64_t sub_25D091144()
{
  unint64_t result = qword_26A639C80;
  if (!qword_26A639C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C80);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_39()
{
  return type metadata accessor for StartTestSpeechRequestMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_6_31()
{
  return v0 - 120;
}

void *StartTextRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartRequestMessageBase.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

void *StartTextRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRequestMessageBase.init(build:)(a1);
}

void *StartTextRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartTextRequestMessage.init(from:)(a1);
}

id StartTextRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartTextRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartTextRequestMessage()
{
  uint64_t result = qword_26B364C08;
  if (!qword_26B364C08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D091328()
{
  return type metadata accessor for StartTextRequestMessage();
}

void *StartUnderstandingDictationRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartSpeechDictationRequestMessage.init(build:)(a1);
}

void *StartUnderstandingDictationRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartUnderstandingDictationRequestMessage.init(from:)(a1);
}

void *StartUnderstandingDictationRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartSpeechDictationRequestMessage.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

id StartUnderstandingDictationRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartUnderstandingDictationRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartUnderstandingDictationRequestMessage()
{
  uint64_t result = qword_26B3652D0;
  if (!qword_26B3652D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D09149C()
{
  return type metadata accessor for StartUnderstandingDictationRequestMessage();
}

uint64_t sub_25D0914A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000025D0C4A40)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D09152C()
{
  return 0xD000000000000015;
}

uint64_t sub_25D09154C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0914A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D091578(uint64_t a1)
{
  unint64_t v2 = sub_25D092448();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0915B4(uint64_t a1)
{
  unint64_t v2 = sub_25D092448();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StartUnderstandingDictationSessionMessage.understandingOnDevice.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC16SiriMessageTypes41StartUnderstandingDictationSessionMessage_understandingOnDevice);
}

void *StartUnderstandingDictationSessionMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartUnderstandingDictationSessionMessage.init(build:)(a1);
}

void *StartUnderstandingDictationSessionMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v40 = v9 - v8;
  uint64_t started = type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0);
  uint64_t v11 = (int *)(started - 8);
  MEMORY[0x270FA5388](started);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *uint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v5);
  uint64_t v16 = &v14[v11[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = &v14[v11[10]];
  *(void *)uint64_t v17 = 0xD000000000000024;
  *((void *)v17 + 1) = 0x800000025D0C14A0;
  uint64_t v18 = v11[11];
  v14[v18] = 1;
  id v19 = v1;
  a1(v14);
  int v20 = *v14;
  if (v20 == 14 || (uint64_t v21 = *((void *)v14 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v22 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25D0BD240();
    __swift_project_value_buffer(v23, (uint64_t)qword_26B366B88);
    id v24 = sub_25D0BD230();
    os_log_type_t v25 = sub_25D0BD4B0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v44 = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      uint64_t v28 = sub_25CF695B0();
      uint64_t v43 = sub_25D04E590(v28, v29, &v44);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v24, v25, "Could not build %{public}s: Builder has missing required fields", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v27, -1, -1);
      MEMORY[0x2611A4870](v26, -1, -1);
    }

    sub_25D091AF4((uint64_t)v14);
    type metadata accessor for StartUnderstandingDictationSessionMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v39 = v22;
  uint64_t v32 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v40, v2, v5);
  uint64_t v33 = *((void *)v16 + 1);
  if (!v33)
  {

    OUTLINED_FUNCTION_2_0();
    v38();
    goto LABEL_6;
  }
  uint64_t v34 = *(void *)v16;
  *((unsigned char *)v19 + OBJC_IVAR____TtC16SiriMessageTypes41StartUnderstandingDictationSessionMessage_understandingOnDevice) = v14[v18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v35);
  *((unsigned char *)&v39 - 48) = v20;
  *(&v39 - 5) = v39;
  *(&v39 - 4) = v21;
  *(&v39 - 3) = v32;
  *(&v39 - 2) = v34;
  *(&v39 - 1) = v33;
  uint64_t v30 = StartSpeechDictationSessionMessage.init(build:)((void (*)(unsigned __int8 *))sub_25D092434);
  swift_bridgeObjectRelease();
  id v36 = v30;
  sub_25D091AF4((uint64_t)v14);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  v37();
  if (v30) {

  }
  return v30;
}

uint64_t type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639CA0);
}

uint64_t sub_25D091AF4(uint64_t a1)
{
  uint64_t started = type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t type metadata accessor for StartUnderstandingDictationSessionMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3652E0);
}

uint64_t sub_25D091B70(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)a1 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  uint64_t started = type metadata accessor for StartSpeechDictationSessionMessage.Builder(0);
  uint64_t v14 = a1 + *(int *)(started + 24);
  sub_25CF69FC0(v14);
  uint64_t v15 = sub_25D0BCFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v14, a5, v15);
  __swift_storeEnumTagSinglePayload(v14, 0, 1, v15);
  uint64_t v16 = (void *)(a1 + *(int *)(started + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v16 = a6;
  v16[1] = a7;
  return result;
}

void *StartUnderstandingDictationSessionMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartUnderstandingDictationSessionMessage.init(from:)(a1);
}

void *StartUnderstandingDictationSessionMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C88);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D092448();
  id v4 = v1;
  sub_25D0BDA20();
  if (v8[6])
  {

    uint64_t v5 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StartUnderstandingDictationSessionMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *((unsigned char *)v4 + OBJC_IVAR____TtC16SiriMessageTypes41StartUnderstandingDictationSessionMessage_understandingOnDevice) = sub_25D0BD790() & 1;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v8);
    uint64_t v5 = StartSpeechDictationSessionMessage.init(from:)(v8);
    OUTLINED_FUNCTION_2_0();
    v7();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v5;
}

uint64_t sub_25D091EA8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639C98);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D092448();
  sub_25D0BDA30();
  sub_25D0BD890();
  if (!v1) {
    sub_25D08C818(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void StartUnderstandingDictationSessionMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StartUnderstandingDictationSessionMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.languageCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.languageCode.modify())(void)
{
  return nullsub_1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.understandingOnDevice.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0)
                                     + 36));
}

uint64_t StartUnderstandingDictationSessionMessage.Builder.understandingOnDevice.setter(char a1)
{
  uint64_t result = type metadata accessor for StartUnderstandingDictationSessionMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*StartUnderstandingDictationSessionMessage.Builder.understandingOnDevice.modify())(void)
{
  return nullsub_1;
}

void StartUnderstandingDictationSessionMessage.__allocating_init(build:)()
{
}

void StartUnderstandingDictationSessionMessage.init(build:)()
{
}

id StartUnderstandingDictationSessionMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartUnderstandingDictationSessionMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D092434(uint64_t a1)
{
  return sub_25D091B70(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

unint64_t sub_25D092448()
{
  unint64_t result = qword_26A639C90;
  if (!qword_26A639C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639C90);
  }
  return result;
}

uint64_t sub_25D092494()
{
  return type metadata accessor for StartUnderstandingDictationSessionMessage(0);
}

uint64_t sub_25D09249C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartUnderstandingDictationSessionMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartUnderstandingDictationSessionMessage);
}

uint64_t dispatch thunk of StartUnderstandingDictationSessionMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t getEnumTagSinglePayload for StartUnderstandingDictationSessionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D092520);
}

uint64_t sub_25D092520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StartUnderstandingDictationSessionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0925CC);
}

void sub_25D0925CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
}

void sub_25D092660()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StartUnderstandingDictationSessionMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0927B0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartUnderstandingDictationSessionMessage.CodingKeys()
{
  return &type metadata for StartUnderstandingDictationSessionMessage.CodingKeys;
}

unint64_t sub_25D0927EC()
{
  unint64_t result = qword_26A639CB0;
  if (!qword_26A639CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CB0);
  }
  return result;
}

unint64_t sub_25D09283C()
{
  unint64_t result = qword_26A639CB8;
  if (!qword_26A639CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CB8);
  }
  return result;
}

unint64_t sub_25D09288C()
{
  unint64_t result = qword_26A639CC0;
  if (!qword_26A639CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CC0);
  }
  return result;
}

void *StartUnderstandingOnServerRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StartRequestMessageBase.init(build:)(a1);
}

void *StartUnderstandingOnServerRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartUnderstandingOnServerRequestMessage.init(from:)(a1);
}

void *StartUnderstandingOnServerRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartRequestMessageBase.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

id StartUnderstandingOnServerRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartUnderstandingOnServerRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartUnderstandingOnServerRequestMessage()
{
  uint64_t result = qword_26B3652C0;
  if (!qword_26B3652C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D092A44()
{
  return type metadata accessor for StartUnderstandingOnServerRequestMessage();
}

uint64_t StartUnderstandingOnServerTextRequestMessage.__allocating_init(build:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return StartUnderstandingOnServerRequestMessage.init(build:)(a1, a2);
}

void *StartUnderstandingOnServerTextRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StartUnderstandingOnServerTextRequestMessage.init(from:)(a1);
}

void *StartUnderstandingOnServerTextRequestMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  objc_super v2 = StartUnderstandingOnServerRequestMessage.init(from:)((uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

id StartUnderstandingOnServerTextRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartUnderstandingOnServerTextRequestMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StartUnderstandingOnServerTextRequestMessage()
{
  uint64_t result = qword_26B365300;
  if (!qword_26B365300) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D092BB8()
{
  return type metadata accessor for StartUnderstandingOnServerTextRequestMessage();
}

uint64_t sub_25D092BC0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025D0C5D50)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D092C48()
{
  return 0xD000000000000013;
}

uint64_t sub_25D092C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D092BC0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D092C94(uint64_t a1)
{
  unint64_t v2 = sub_25D09387C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D092CD0(uint64_t a1)
{
  unint64_t v2 = sub_25D09387C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StopAttendingRequestedMessage.attendingStopReason.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes29StopAttendingRequestedMessage_attendingStopReason);
}

void *StopAttendingRequestedMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StopAttendingRequestedMessage.init(build:)(a1);
}

void *StopAttendingRequestedMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  v35[1] = swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  uint64_t v10 = type metadata accessor for StopAttendingRequestedMessage.Builder(0);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (unsigned __int8 *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v14 = (uint64_t)&v13[*(int *)(v11 + 32)];
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v6);
  uint64_t v15 = *(int *)(v11 + 36);
  v13[v15] = 6;
  id v16 = v1;
  a1(v13);
  int v17 = *v13;
  if (v17 == 14 || (uint64_t v18 = *((void *)v13 + 2)) == 0)
  {

    goto LABEL_6;
  }
  v35[0] = *((void *)v13 + 1);
  sub_25CF67F88(v14, v3);
  if (__swift_getEnumTagSinglePayload(v3, 1, v6) == 1)
  {

    sub_25CF69FC0(v3);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25D0BD240();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B366B88);
    int v20 = sub_25D0BD230();
    os_log_type_t v21 = sub_25D0BD4B0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v36 = v23;
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v24 = sub_25CF695B0();
      v35[2] = sub_25D04E590(v24, v25, &v36);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v20, v21, "Could not build %{public}s: Builder has missing required fields", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v23, -1, -1);
      MEMORY[0x2611A4870](v22, -1, -1);
    }

    sub_25D0931B0((uint64_t)v13);
    type metadata accessor for StopAttendingRequestedMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v2, v3, v6);
  int v28 = v13[v15];
  if (v28 == 6)
  {

    uint64_t v29 = OUTLINED_FUNCTION_25_2();
    v30(v29);
    goto LABEL_6;
  }
  *((unsigned char *)v16 + OBJC_IVAR____TtC16SiriMessageTypes29StopAttendingRequestedMessage_attendingStopReason) = v28;
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v31);
  LOBYTE(v35[-4]) = v17;
  v35[-3] = v35[0];
  v35[-2] = v18;
  v35[-1] = v2;
  uint64_t v26 = SessionMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF6A020);
  swift_bridgeObjectRelease();
  id v32 = v26;
  sub_25D0931B0((uint64_t)v13);
  uint64_t v33 = OUTLINED_FUNCTION_25_2();
  v34(v33);
  if (v26) {

  }
  return v26;
}

uint64_t type metadata accessor for StopAttendingRequestedMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B362A18);
}

uint64_t sub_25D0931B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StopAttendingRequestedMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StopAttendingRequestedMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365068);
}

uint64_t sub_25D09322C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3656B8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09387C();
  sub_25D0BDA30();
  sub_25D0938C8();
  sub_25D0BD8E0();
  if (!v1) {
    sub_25D04DC04(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void *sub_25D093360(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25D0933A4(a1);
}

void *sub_25D0933A4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639CD0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09387C();
  id v4 = v1;
  sub_25D0BDA20();
  if (v9[6])
  {

    uint64_t v5 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StopAttendingRequestedMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D093D3C();
    sub_25D0BD7E0();
    *((unsigned char *)v4 + OBJC_IVAR____TtC16SiriMessageTypes29StopAttendingRequestedMessage_attendingStopReason) = v9[0];

    sub_25CF68E70((uint64_t)a1, (uint64_t)v9);
    uint64_t v5 = SessionMessageBase.init(from:)(v9);
    uint64_t v7 = OUTLINED_FUNCTION_2();
    v8(v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v5;
}

void StopAttendingRequestedMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StopAttendingRequestedMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StopAttendingRequestedMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StopAttendingRequestedMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StopAttendingRequestedMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StopAttendingRequestedMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StopAttendingRequestedMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StopAttendingRequestedMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StopAttendingRequestedMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StopAttendingRequestedMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StopAttendingRequestedMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StopAttendingRequestedMessage.Builder.attendingStopReason.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StopAttendingRequestedMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t StopAttendingRequestedMessage.Builder.attendingStopReason.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StopAttendingRequestedMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*StopAttendingRequestedMessage.Builder.attendingStopReason.modify())(void)
{
  return nullsub_1;
}

void StopAttendingRequestedMessage.__allocating_init(build:)()
{
}

void StopAttendingRequestedMessage.init(build:)()
{
}

id StopAttendingRequestedMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StopAttendingRequestedMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D09387C()
{
  unint64_t result = qword_26B364FC8;
  if (!qword_26B364FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364FC8);
  }
  return result;
}

unint64_t sub_25D0938C8()
{
  unint64_t result = qword_26B365598;
  if (!qword_26B365598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B365598);
  }
  return result;
}

uint64_t sub_25D093914()
{
  return type metadata accessor for StopAttendingRequestedMessage(0);
}

uint64_t sub_25D09391C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StopAttendingRequestedMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StopAttendingRequestedMessage);
}

uint64_t dispatch thunk of StopAttendingRequestedMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t getEnumTagSinglePayload for StopAttendingRequestedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0939A0);
}

uint64_t sub_25D0939A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StopAttendingRequestedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D093A4C);
}

uint64_t sub_25D093A4C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D093AD0()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StopAttendingRequestedMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D093C14);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StopAttendingRequestedMessage.CodingKeys()
{
  return &type metadata for StopAttendingRequestedMessage.CodingKeys;
}

unint64_t sub_25D093C50()
{
  unint64_t result = qword_26A639CC8;
  if (!qword_26A639CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CC8);
  }
  return result;
}

unint64_t sub_25D093CA0()
{
  unint64_t result = qword_26B364FD8[0];
  if (!qword_26B364FD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B364FD8);
  }
  return result;
}

unint64_t sub_25D093CF0()
{
  unint64_t result = qword_26B364FD0;
  if (!qword_26B364FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364FD0);
  }
  return result;
}

unint64_t sub_25D093D3C()
{
  unint64_t result = qword_26A639CD8;
  if (!qword_26A639CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CD8);
  }
  return result;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void StoppedListeningForSpeechContinuationForPlannerMessage.mitigationDecision.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1
                 + OBJC_IVAR____TtC16SiriMessageTypes54StoppedListeningForSpeechContinuationForPlannerMessage_mitigationDecision);
}

uint64_t sub_25D093DC8(uint64_t a1)
{
  unint64_t v2 = sub_25D094E70();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D093E04(uint64_t a1)
{
  unint64_t v2 = sub_25D094E70();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *StoppedListeningForSpeechContinuationForPlannerMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForSpeechContinuationForPlannerMessage.init(build:)(a1);
}

void *StoppedListeningForSpeechContinuationForPlannerMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v47 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v45 = v8 - v7;
  uint64_t v9 = type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0);
  uint64_t v10 = (int *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = (unsigned __int8 *)(v12 - v11);
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v14 = v12 - v11 + v10[8];
  uint64_t v15 = v4;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v4);
  id v16 = (uint64_t *)&v13[v10[9]];
  *id v16 = 0;
  v16[1] = 0;
  int v17 = &v13[v10[10]];
  *(void *)int v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v10[11];
  v13[v18] = 3;
  uint64_t v19 = v1;
  v47(v13);
  int v20 = *v13;
  if (v20 == 14 || (uint64_t v21 = *((void *)v13 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v47 = (void (*)(unsigned __int8 *))*((void *)v13 + 1);
  sub_25CF67F88(v14, v2);
  uint64_t v22 = v15;
  if (__swift_getEnumTagSinglePayload(v2, 1, v15) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25D0BD240();
    __swift_project_value_buffer(v23, (uint64_t)qword_26B366B88);
    uint64_t v24 = sub_25D0BD230();
    os_log_type_t v25 = sub_25D0BD4B0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v49 = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      uint64_t v28 = sub_25CF695B0();
      uint64_t v48 = sub_25D04E590(v28, v29, &v49);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v24, v25, "Could not build %{public}s: Builder has missing required fields", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v27, -1, -1);
      MEMORY[0x2611A4870](v26, -1, -1);
    }

    sub_25D094380((uint64_t)v13);
    type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v43 = v21;
  uint64_t v32 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v45, v2, v22);
  uint64_t v33 = v16[1];
  if (!v33 || (uint64_t v34 = *((void *)v17 + 1)) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v22);
    goto LABEL_6;
  }
  uint64_t ObjectType = *v16;
  uint64_t v35 = &v19[OBJC_IVAR____TtC16SiriMessageTypes54StoppedListeningForSpeechContinuationForPlannerMessage_lastTRPId];
  *(void *)uint64_t v35 = *(void *)v17;
  *((void *)v35 + 1) = v34;
  int v36 = v13[v18];
  if (v36 == 3) {
    LOBYTE(v36) = 1;
  }
  v19[OBJC_IVAR____TtC16SiriMessageTypes54StoppedListeningForSpeechContinuationForPlannerMessage_mitigationDecision] = v36;
  uint64_t v37 = v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v38);
  *((unsigned char *)&v42 - 48) = v20;
  *(&v42 - 5) = (uint64_t)v47;
  *(&v42 - 4) = v37;
  uint64_t v40 = v45;
  uint64_t v39 = ObjectType;
  *(&v42 - 3) = v45;
  *(&v42 - 2) = v39;
  *(&v42 - 1) = v33;
  uint64_t v30 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v41 = v30;
  sub_25D094380((uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v40, v22);
  if (v30) {

  }
  return v30;
}

uint64_t type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639CF8);
}

uint64_t sub_25D094380(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3643B8);
}

void *StoppedListeningForSpeechContinuationForPlannerMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForSpeechContinuationForPlannerMessage.init(from:)(a1);
}

void *StoppedListeningForSpeechContinuationForPlannerMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D094E70();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    __swift_destroy_boxed_opaque_existential_1(v13);
    type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v14[0]) = 0;
    uint64_t v6 = sub_25D0BD780();
    uint64_t v9 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes54StoppedListeningForSpeechContinuationForPlannerMessage_lastTRPId];
    uint64_t *v9 = v6;
    v9[1] = v10;
    char v15 = 1;
    sub_25D03EFCC();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes54StoppedListeningForSpeechContinuationForPlannerMessage_mitigationDecision] = v14[0];

    sub_25CF68E70(v13, (uint64_t)v14);
    uint64_t v7 = RequestMessageBase.init(from:)(v14);
    uint64_t v11 = OUTLINED_FUNCTION_2_15();
    v12(v11);
    __swift_destroy_boxed_opaque_existential_1(v13);
  }
  return v7;
}

uint64_t sub_25D0946C4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639CF0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D094E70();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25D03F018();
    sub_25D0BD8E0();
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D0948A4()
{
  uint64_t v4 = 0;
  unint64_t v5 = 0xE000000000000000;
  sub_25D0BD5D0();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(0);
  id v1 = objc_msgSendSuper2(&v3, sel_description);
  sub_25D0BD2F0();

  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  sub_25D0BD630();
  sub_25D0BD390();
  return v4;
}

void StoppedListeningForSpeechContinuationForPlannerMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StoppedListeningForSpeechContinuationForPlannerMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1
     + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1
     + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0)
                         + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.lastTRPId.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0)
                         + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.lastTRPId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.mitigationDecision.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t StoppedListeningForSpeechContinuationForPlannerMessage.Builder.mitigationDecision.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationForPlannerMessage.Builder.mitigationDecision.modify())(void)
{
  return nullsub_1;
}

void StoppedListeningForSpeechContinuationForPlannerMessage.__allocating_init(build:)()
{
}

void StoppedListeningForSpeechContinuationForPlannerMessage.init(build:)()
{
}

uint64_t sub_25D094E18()
{
  return OUTLINED_FUNCTION_1();
}

id StoppedListeningForSpeechContinuationForPlannerMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D094E70()
{
  unint64_t result = qword_26A639CE8;
  if (!qword_26A639CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639CE8);
  }
  return result;
}

uint64_t sub_25D094EBC()
{
  return type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage(0);
}

uint64_t sub_25D094EC4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StoppedListeningForSpeechContinuationForPlannerMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoppedListeningForSpeechContinuationForPlannerMessage);
}

uint64_t dispatch thunk of StoppedListeningForSpeechContinuationForPlannerMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t getEnumTagSinglePayload for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D094F50);
}

uint64_t sub_25D094F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StoppedListeningForSpeechContinuationForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D094FFC);
}

uint64_t sub_25D094FFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D095080()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StoppedListeningForSpeechContinuationForPlannerMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0951F8);
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

ValueMetadata *type metadata accessor for StoppedListeningForSpeechContinuationForPlannerMessage.CodingKeys()
{
  return &type metadata for StoppedListeningForSpeechContinuationForPlannerMessage.CodingKeys;
}

unint64_t sub_25D095234()
{
  unint64_t result = qword_26A639D08;
  if (!qword_26A639D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D08);
  }
  return result;
}

unint64_t sub_25D095284()
{
  unint64_t result = qword_26A639D10;
  if (!qword_26A639D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D10);
  }
  return result;
}

unint64_t sub_25D0952D4()
{
  unint64_t result = qword_26A639D18;
  if (!qword_26A639D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D18);
  }
  return result;
}

void *StoppedListeningForSpeechContinuationMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v47 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v45 = v8 - v7;
  uint64_t v9 = type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0);
  uint64_t v10 = (int *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = (unsigned __int8 *)(v12 - v11);
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v14 = v12 - v11 + v10[8];
  uint64_t v15 = v4;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v4);
  id v16 = (uint64_t *)&v13[v10[9]];
  *id v16 = 0;
  v16[1] = 0;
  int v17 = &v13[v10[10]];
  *(void *)int v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v10[11];
  v13[v18] = 3;
  uint64_t v19 = v1;
  v47(v13);
  int v20 = *v13;
  if (v20 == 14 || (uint64_t v21 = *((void *)v13 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v47 = (void (*)(unsigned __int8 *))*((void *)v13 + 1);
  sub_25CF67F88(v14, v2);
  uint64_t v22 = v15;
  if (__swift_getEnumTagSinglePayload(v2, 1, v15) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25D0BD240();
    __swift_project_value_buffer(v23, (uint64_t)qword_26B366B88);
    uint64_t v24 = sub_25D0BD230();
    os_log_type_t v25 = sub_25D0BD4B0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v49 = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      uint64_t v28 = sub_25CF695B0();
      uint64_t v48 = sub_25D04E590(v28, v29, &v49);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v24, v25, "Could not build %{public}s: Builder has missing required fields", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v27, -1, -1);
      MEMORY[0x2611A4870](v26, -1, -1);
    }

    sub_25D09581C((uint64_t)v13);
    type metadata accessor for StoppedListeningForSpeechContinuationMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v43 = v21;
  uint64_t v32 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v45, v2, v22);
  uint64_t v33 = v16[1];
  if (!v33 || (uint64_t v34 = *((void *)v17 + 1)) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v22);
    goto LABEL_6;
  }
  uint64_t ObjectType = *v16;
  uint64_t v35 = &v19[OBJC_IVAR____TtC16SiriMessageTypes44StoppedListeningForSpeechContinuationMessage_lastTRPId];
  *(void *)uint64_t v35 = *(void *)v17;
  *((void *)v35 + 1) = v34;
  int v36 = v13[v18];
  if (v36 == 3) {
    LOBYTE(v36) = 1;
  }
  v19[OBJC_IVAR____TtC16SiriMessageTypes44StoppedListeningForSpeechContinuationMessage_mitigationDecision] = v36;
  uint64_t v37 = v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v38);
  *((unsigned char *)&v42 - 48) = v20;
  *(&v42 - 5) = (uint64_t)v47;
  *(&v42 - 4) = v37;
  uint64_t v40 = v45;
  uint64_t v39 = ObjectType;
  *(&v42 - 3) = v45;
  *(&v42 - 2) = v39;
  *(&v42 - 1) = v33;
  uint64_t v30 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v41 = v30;
  sub_25D09581C((uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v40, v22);
  if (v30) {

  }
  return v30;
}

uint64_t type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3643A8);
}

uint64_t sub_25D09581C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StoppedListeningForSpeechContinuationMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365310);
}

void *StoppedListeningForSpeechContinuationMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639D20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D096408();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    __swift_destroy_boxed_opaque_existential_1(v13);
    type metadata accessor for StoppedListeningForSpeechContinuationMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v14[0]) = 0;
    uint64_t v6 = sub_25D0BD780();
    uint64_t v9 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes44StoppedListeningForSpeechContinuationMessage_lastTRPId];
    uint64_t *v9 = v6;
    v9[1] = v10;
    char v15 = 1;
    sub_25D03EFCC();
    sub_25D0BD7E0();
    v5[OBJC_IVAR____TtC16SiriMessageTypes44StoppedListeningForSpeechContinuationMessage_mitigationDecision] = v14[0];

    sub_25CF68E70(v13, (uint64_t)v14);
    uint64_t v7 = RequestMessageBase.init(from:)(v14);
    uint64_t v11 = OUTLINED_FUNCTION_2_15();
    v12(v11);
    __swift_destroy_boxed_opaque_existential_1(v13);
  }
  return v7;
}

uint64_t sub_25D095B1C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B364730);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D096408();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25D03F018();
    sub_25D0BD8E0();
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void StoppedListeningForSpeechContinuationMessage.__allocating_init(build:)()
{
}

uint64_t StoppedListeningForSpeechContinuationMessage.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void StoppedListeningForSpeechContinuationMessage.mitigationDecision.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1
                 + OBJC_IVAR____TtC16SiriMessageTypes44StoppedListeningForSpeechContinuationMessage_mitigationDecision);
}

uint64_t sub_25D095D04(uint64_t a1)
{
  unint64_t v2 = sub_25D096408();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D095D40(uint64_t a1)
{
  unint64_t v2 = sub_25D096408();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *StoppedListeningForSpeechContinuationMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForSpeechContinuationMessage.init(build:)(a1);
}

void *StoppedListeningForSpeechContinuationMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForSpeechContinuationMessage.init(from:)(a1);
}

uint64_t sub_25D095E6C()
{
  uint64_t v4 = 0;
  unint64_t v5 = 0xE000000000000000;
  sub_25D0BD5D0();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for StoppedListeningForSpeechContinuationMessage(0);
  id v1 = objc_msgSendSuper2(&v3, sel_description);
  sub_25D0BD2F0();

  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  sub_25D0BD630();
  sub_25D0BD390();
  return v4;
}

void StoppedListeningForSpeechContinuationMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StoppedListeningForSpeechContinuationMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.lastTRPId.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.lastTRPId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.mitigationDecision.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.mitigationDecision.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StoppedListeningForSpeechContinuationMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*StoppedListeningForSpeechContinuationMessage.Builder.mitigationDecision.modify())(void)
{
  return nullsub_1;
}

void StoppedListeningForSpeechContinuationMessage.init(build:)()
{
}

uint64_t sub_25D0963B0()
{
  return OUTLINED_FUNCTION_1();
}

id StoppedListeningForSpeechContinuationMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoppedListeningForSpeechContinuationMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D096408()
{
  unint64_t result = qword_26B364390;
  if (!qword_26B364390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364390);
  }
  return result;
}

uint64_t sub_25D096454()
{
  return type metadata accessor for StoppedListeningForSpeechContinuationMessage(0);
}

uint64_t sub_25D09645C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StoppedListeningForSpeechContinuationMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoppedListeningForSpeechContinuationMessage);
}

uint64_t dispatch thunk of StoppedListeningForSpeechContinuationMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t getEnumTagSinglePayload for StoppedListeningForSpeechContinuationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0964E8);
}

uint64_t sub_25D0964E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StoppedListeningForSpeechContinuationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D096594);
}

uint64_t sub_25D096594(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D096618()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StoppedListeningForSpeechContinuationMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D096790);
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

ValueMetadata *type metadata accessor for StoppedListeningForSpeechContinuationMessage.CodingKeys()
{
  return &type metadata for StoppedListeningForSpeechContinuationMessage.CodingKeys;
}

unint64_t sub_25D0967CC()
{
  unint64_t result = qword_26A639D28;
  if (!qword_26A639D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D28);
  }
  return result;
}

unint64_t sub_25D09681C()
{
  unint64_t result = qword_26B3643A0;
  if (!qword_26B3643A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3643A0);
  }
  return result;
}

unint64_t sub_25D09686C()
{
  unint64_t result = qword_26B364398;
  if (!qword_26B364398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364398);
  }
  return result;
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *StoppedListeningForTextContinuationForPlannerMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForTextContinuationForPlannerMessage.init(build:)(a1);
}

void *StoppedListeningForTextContinuationForPlannerMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v41 = v9 - v8;
  uint64_t v10 = type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0);
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *uint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v5);
  id v16 = &v14[v11[9]];
  *(void *)id v16 = 0;
  *((void *)v16 + 1) = 0;
  int v17 = &v14[v11[10]];
  *(void *)int v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v1;
  a1(v14);
  int v19 = *v14;
  if (v19 == 14 || (uint64_t v20 = *((void *)v14 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v21 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v44 = v26;
      *(_DWORD *)os_log_type_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v43 = sub_25D04E590(v27, v28, &v44);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D096DD8((uint64_t)v14);
    type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v39 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v41, v2, v5);
  uint64_t v31 = *((void *)v16 + 1);
  if (!v31 || (uint64_t v32 = *((void *)v17 + 1)) == 0)
  {

    OUTLINED_FUNCTION_2_0();
    v38();
    goto LABEL_6;
  }
  uint64_t v33 = *(void *)v16;
  uint64_t v34 = &v18[OBJC_IVAR____TtC16SiriMessageTypes52StoppedListeningForTextContinuationForPlannerMessage_lastTRPId];
  *(void *)uint64_t v34 = *(void *)v17;
  *((void *)v34 + 1) = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v35);
  *((unsigned char *)&v39 - 48) = v19;
  *(&v39 - 5) = v39;
  *(&v39 - 4) = v20;
  *(&v39 - 3) = v41;
  *(&v39 - 2) = v33;
  *(&v39 - 1) = v31;
  unint64_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v36 = v29;
  sub_25D096DD8((uint64_t)v14);
  OUTLINED_FUNCTION_2_0();
  v37();
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639D48);
}

uint64_t sub_25D096DD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364380);
}

void *StoppedListeningForTextContinuationForPlannerMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForTextContinuationForPlannerMessage.init(from:)(a1);
}

void *StoppedListeningForTextContinuationForPlannerMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639D30);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D097760();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v11[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes52StoppedListeningForTextContinuationForPlannerMessage_lastTRPId];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v11);
    uint64_t v6 = RequestMessageBase.init(from:)(v11);
    OUTLINED_FUNCTION_2_0();
    v10();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D097094(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639D40);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D097760();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D097224()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void StoppedListeningForTextContinuationForPlannerMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StoppedListeningForTextContinuationForPlannerMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationForPlannerMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationForPlannerMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StoppedListeningForTextContinuationForPlannerMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0)
                         + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationForPlannerMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationForPlannerMessage.Builder.lastTRPId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.Builder(0)
                         + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationForPlannerMessage.Builder.lastTRPId.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D097630(uint64_t a1)
{
  unint64_t v2 = sub_25D097760();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09766C(uint64_t a1)
{
  unint64_t v2 = sub_25D097760();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StoppedListeningForTextContinuationForPlannerMessage.__allocating_init(build:)()
{
}

void StoppedListeningForTextContinuationForPlannerMessage.init(build:)()
{
}

uint64_t sub_25D097708()
{
  return OUTLINED_FUNCTION_1();
}

id StoppedListeningForTextContinuationForPlannerMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D097760()
{
  unint64_t result = qword_26A639D38;
  if (!qword_26A639D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D38);
  }
  return result;
}

uint64_t sub_25D0977AC()
{
  return type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage(0);
}

uint64_t sub_25D0977B4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StoppedListeningForTextContinuationForPlannerMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoppedListeningForTextContinuationForPlannerMessage);
}

uint64_t dispatch thunk of StoppedListeningForTextContinuationForPlannerMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for StoppedListeningForTextContinuationForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D097838);
}

uint64_t sub_25D097838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StoppedListeningForTextContinuationForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0978E4);
}

uint64_t sub_25D0978E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D097968()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StoppedListeningForTextContinuationForPlannerMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D097AA8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoppedListeningForTextContinuationForPlannerMessage.CodingKeys()
{
  return &type metadata for StoppedListeningForTextContinuationForPlannerMessage.CodingKeys;
}

unint64_t sub_25D097AE4()
{
  unint64_t result = qword_26A639D58;
  if (!qword_26A639D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D58);
  }
  return result;
}

unint64_t sub_25D097B34()
{
  unint64_t result = qword_26A639D60;
  if (!qword_26A639D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D60);
  }
  return result;
}

unint64_t sub_25D097B84()
{
  unint64_t result = qword_26A639D68;
  if (!qword_26A639D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D68);
  }
  return result;
}

uint64_t StoppedListeningForTextContinuationMessage.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *StoppedListeningForTextContinuationMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForTextContinuationMessage.init(build:)(a1);
}

void *StoppedListeningForTextContinuationMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v41 = v9 - v8;
  uint64_t v10 = type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0);
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *uint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v5);
  id v16 = &v14[v11[9]];
  *(void *)id v16 = 0;
  *((void *)v16 + 1) = 0;
  int v17 = &v14[v11[10]];
  *(void *)int v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v1;
  a1(v14);
  int v19 = *v14;
  if (v19 == 14 || (uint64_t v20 = *((void *)v14 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v21 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v44 = v26;
      *(_DWORD *)os_log_type_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v43 = sub_25D04E590(v27, v28, &v44);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D0980F0((uint64_t)v14);
    type metadata accessor for StoppedListeningForTextContinuationMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v39 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v41, v2, v5);
  uint64_t v31 = *((void *)v16 + 1);
  if (!v31 || (uint64_t v32 = *((void *)v17 + 1)) == 0)
  {

    OUTLINED_FUNCTION_2_0();
    v38();
    goto LABEL_6;
  }
  uint64_t v33 = *(void *)v16;
  uint64_t v34 = &v18[OBJC_IVAR____TtC16SiriMessageTypes42StoppedListeningForTextContinuationMessage_lastTRPId];
  *(void *)uint64_t v34 = *(void *)v17;
  *((void *)v34 + 1) = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v35);
  *((unsigned char *)&v39 - 48) = v19;
  *(&v39 - 5) = v39;
  *(&v39 - 4) = v20;
  *(&v39 - 3) = v41;
  *(&v39 - 2) = v33;
  *(&v39 - 1) = v31;
  unint64_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v36 = v29;
  sub_25D0980F0((uint64_t)v14);
  OUTLINED_FUNCTION_2_0();
  v37();
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639D88);
}

uint64_t sub_25D0980F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StoppedListeningForTextContinuationMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364370);
}

void *StoppedListeningForTextContinuationMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StoppedListeningForTextContinuationMessage.init(from:)(a1);
}

void *StoppedListeningForTextContinuationMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639D70);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D098A78();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v11[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for StoppedListeningForTextContinuationMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes42StoppedListeningForTextContinuationMessage_lastTRPId];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v11);
    uint64_t v6 = RequestMessageBase.init(from:)(v11);
    OUTLINED_FUNCTION_2_0();
    v10();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D0983AC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639D80);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D098A78();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D09853C()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for StoppedListeningForTextContinuationMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void StoppedListeningForTextContinuationMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StoppedListeningForTextContinuationMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*StoppedListeningForTextContinuationMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.lastTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t StoppedListeningForTextContinuationMessage.Builder.lastTRPId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StoppedListeningForTextContinuationMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoppedListeningForTextContinuationMessage.Builder.lastTRPId.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D098948(uint64_t a1)
{
  unint64_t v2 = sub_25D098A78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D098984(uint64_t a1)
{
  unint64_t v2 = sub_25D098A78();
  return MEMORY[0x270FA00B8](a1, v2);
}

void StoppedListeningForTextContinuationMessage.__allocating_init(build:)()
{
}

void StoppedListeningForTextContinuationMessage.init(build:)()
{
}

uint64_t sub_25D098A20()
{
  return OUTLINED_FUNCTION_1();
}

id StoppedListeningForTextContinuationMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoppedListeningForTextContinuationMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D098A78()
{
  unint64_t result = qword_26A639D78;
  if (!qword_26A639D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D78);
  }
  return result;
}

uint64_t sub_25D098AC4()
{
  return type metadata accessor for StoppedListeningForTextContinuationMessage(0);
}

uint64_t sub_25D098ACC()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StoppedListeningForTextContinuationMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoppedListeningForTextContinuationMessage);
}

uint64_t dispatch thunk of StoppedListeningForTextContinuationMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for StoppedListeningForTextContinuationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D098B50);
}

uint64_t sub_25D098B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for StoppedListeningForTextContinuationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D098BFC);
}

uint64_t sub_25D098BFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D098C80()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StoppedListeningForTextContinuationMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D098DC0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoppedListeningForTextContinuationMessage.CodingKeys()
{
  return &type metadata for StoppedListeningForTextContinuationMessage.CodingKeys;
}

unint64_t sub_25D098DFC()
{
  unint64_t result = qword_26A639D98;
  if (!qword_26A639D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639D98);
  }
  return result;
}

unint64_t sub_25D098E4C()
{
  unint64_t result = qword_26A639DA0;
  if (!qword_26A639DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639DA0);
  }
  return result;
}

unint64_t sub_25D098E9C()
{
  unint64_t result = qword_26A639DA8;
  if (!qword_26A639DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639DA8);
  }
  return result;
}

void *TextBasedResultCandidateMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v64 = a1;
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v3;
  uint64_t v60 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_0();
  uint64_t v58 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v62 = v12;
  uint64_t v13 = type metadata accessor for TextBasedResultCandidateMessage.Builder(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  int v17 = (unsigned __int8 *)(v16 - v15);
  unsigned __int8 *v17 = 14;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  uint64_t v18 = v16 - v15 + v14[8];
  uint64_t v63 = v9;
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v9);
  int v19 = &v17[v14[9]];
  *(void *)int v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v17[v14[10]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v21 = &v17[v14[11]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = &v17[v14[12]];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = v1;
  v64(v17);
  int v24 = *v17;
  if (v24 == 14 || (uint64_t v25 = *((void *)v17 + 2)) == 0)
  {

    sub_25D0994D0((uint64_t)v17);
    goto LABEL_6;
  }
  uint64_t v64 = (void (*)(unsigned __int8 *))*((void *)v17 + 1);
  sub_25CF67F88(v18, v8);
  if (__swift_getEnumTagSinglePayload(v8, 1, v63) == 1)
  {

    sub_25D0994D0((uint64_t)v17);
    sub_25CF69FC0(v8);
LABEL_6:
    type metadata accessor for TextBasedResultCandidateMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v57 = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v62, v8, v63);
  uint64_t v28 = *((void *)v19 + 1);
  if (!v28
    || (uint64_t v29 = *((void *)v20 + 1)) == 0
    || (uint64_t v30 = *((void *)v22 + 1)) == 0
    || (uint64_t v56 = *((void *)v21 + 1)) == 0)
  {

    sub_25D0994D0((uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v63);
    goto LABEL_6;
  }
  uint64_t v31 = *(void *)v19;
  uint64_t v54 = *(void *)v20;
  uint64_t v55 = v31;
  uint64_t v32 = *(void *)v22;
  uint64_t v53 = *(void *)v21;
  uint64_t v65 = v32;
  uint64_t v66 = v30;
  uint64_t v33 = v57;
  uint64_t v34 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v35 = v29;
  uint64_t v36 = sub_25D0BD560();
  unint64_t v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
  swift_bridgeObjectRelease();
  uint64_t v39 = HIBYTE(v38) & 0xF;
  if ((v38 & 0x2000000000000000) == 0) {
    uint64_t v39 = v36 & 0xFFFFFFFFFFFFLL;
  }
  if (!v39)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_25D0BD240();
    __swift_project_value_buffer(v48, (uint64_t)qword_26B366B88);
    uint64_t v49 = sub_25D0BD230();
    os_log_type_t v50 = sub_25D0BD4B0();
    uint64_t v51 = v62;
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_25CF65000, v49, v50, "utterance is empty, can't create message", v52, 2u);
      MEMORY[0x2611A4870](v52, -1, -1);
    }

    sub_25D0994D0((uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v51, v63);
    goto LABEL_6;
  }
  uint64_t v40 = (uint64_t *)&v23[OBJC_IVAR____TtC16SiriMessageTypes31TextBasedResultCandidateMessage_utterance];
  *uint64_t v40 = v36;
  v40[1] = v38;

  MEMORY[0x270FA5388](v41);
  *((unsigned char *)&v53 - 80) = v24;
  *(&v53 - 9) = (uint64_t)v64;
  *(&v53 - 8) = v33;
  uint64_t v42 = v62;
  uint64_t v43 = v55;
  uint64_t v44 = v56;
  *(&v53 - 7) = v62;
  *(&v53 - 6) = v43;
  uint64_t v45 = v54;
  *(&v53 - 5) = v34;
  *(&v53 - 4) = v45;
  uint64_t v46 = v53;
  *(&v53 - 3) = v35;
  *(&v53 - 2) = v46;
  *(&v53 - 1) = v44;
  uint64_t v26 = UserIdAwareResultCandidateMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF6EC5C, (uint64_t)(&v53 - 12));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v47 = v26;
  sub_25D0994D0((uint64_t)v17);
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v42, v63);
  if (v26) {

  }
  return v26;
}

uint64_t type metadata accessor for TextBasedResultCandidateMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B362A28);
}

uint64_t sub_25D0994D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TextBasedResultCandidateMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TextBasedResultCandidateMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365148);
}

void *TextBasedResultCandidateMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639DB0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D099F8C();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v12[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for TextBasedResultCandidateMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes31TextBasedResultCandidateMessage_utterance];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v12);
    uint64_t v6 = UserIdAwareResultCandidateMessageBase.init(from:)(v12);
    uint64_t v10 = OUTLINED_FUNCTION_2();
    v11(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D099720(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3656C0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D099F8C();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0AE75C(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void TextBasedResultCandidateMessage.__allocating_init(build:)()
{
}

uint64_t sub_25D099878(uint64_t a1)
{
  unint64_t v2 = sub_25D099F8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0998B4(uint64_t a1)
{
  unint64_t v2 = sub_25D099F8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TextBasedResultCandidateMessage.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *TextBasedResultCandidateMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedResultCandidateMessage.init(build:)(a1);
}

void *TextBasedResultCandidateMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedResultCandidateMessage.init(from:)(a1);
}

void TextBasedResultCandidateMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TextBasedResultCandidateMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedResultCandidateMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TextBasedResultCandidateMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TextBasedResultCandidateMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TextBasedResultCandidateMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TextBasedResultCandidateMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedResultCandidateMessage.Builder.requestId.setter()
{
  OUTLINED_FUNCTION_7_26();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.resultCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedResultCandidateMessage.Builder.resultCandidateId.setter()
{
  OUTLINED_FUNCTION_7_26();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.resultCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TextBasedResultCandidateMessage.Builder(0) + 36));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t TextBasedResultCandidateMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for TextBasedResultCandidateMessage.Builder(0);
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedResultCandidateMessage.Builder.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedResultCandidateMessage.Builder.utterance.setter()
{
  OUTLINED_FUNCTION_7_26();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedResultCandidateMessage.Builder.utterance.modify())(void)
{
  return nullsub_1;
}

void TextBasedResultCandidateMessage.init(build:)()
{
}

uint64_t sub_25D099E10()
{
  return OUTLINED_FUNCTION_1();
}

id TextBasedResultCandidateMessage.__deallocating_deinit()
{
  return sub_25D099F4C(type metadata accessor for TextBasedResultCandidateMessage);
}

void *LLMBasedResultCandidateMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedResultCandidateMessage.init(build:)(a1);
}

void *LLMBasedResultCandidateMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return LLMBasedResultCandidateMessage.init(from:)(a1);
}

void *LLMBasedResultCandidateMessage.init(from:)(uint64_t a1)
{
  sub_25CF68E70(a1, (uint64_t)v4);
  uint64_t v2 = TextBasedResultCandidateMessage.init(from:)(v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

id LLMBasedResultCandidateMessage.__deallocating_deinit()
{
  return sub_25D099F4C(type metadata accessor for LLMBasedResultCandidateMessage);
}

id sub_25D099F4C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_25D099F8C()
{
  unint64_t result = qword_26B365098;
  if (!qword_26B365098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B365098);
  }
  return result;
}

uint64_t type metadata accessor for LLMBasedResultCandidateMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639DB8);
}

uint64_t sub_25D099FF8()
{
  return type metadata accessor for TextBasedResultCandidateMessage(0);
}

uint64_t sub_25D09A000()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TextBasedResultCandidateMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TextBasedResultCandidateMessage);
}

uint64_t dispatch thunk of TextBasedResultCandidateMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t getEnumTagSinglePayload for TextBasedResultCandidateMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D09A084);
}

uint64_t sub_25D09A084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TextBasedResultCandidateMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D09A130);
}

uint64_t sub_25D09A130(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D09A1B4()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25D09A25C()
{
  return type metadata accessor for LLMBasedResultCandidateMessage(0);
}

unsigned char *storeEnumTagSinglePayload for TextBasedResultCandidateMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D09A300);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TextBasedResultCandidateMessage.CodingKeys()
{
  return &type metadata for TextBasedResultCandidateMessage.CodingKeys;
}

unint64_t sub_25D09A33C()
{
  unint64_t result = qword_26A639DC8;
  if (!qword_26A639DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639DC8);
  }
  return result;
}

unint64_t sub_25D09A38C()
{
  unint64_t result = qword_26B3650A8[0];
  if (!qword_26B3650A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B3650A8);
  }
  return result;
}

unint64_t sub_25D09A3DC()
{
  unint64_t result = qword_26B3650A0;
  if (!qword_26B3650A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3650A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_26()
{
  return type metadata accessor for TextBasedResultCandidateMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_8_20()
{
  return type metadata accessor for TextBasedResultCandidateMessage.Builder(0);
}

uint64_t TextBasedTRPCandidateForPlannerMessage.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void *TextBasedTRPCandidateForPlannerMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedTRPCandidateForPlannerMessage.init(build:)(a1);
}

void *TextBasedTRPCandidateForPlannerMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v64 = a1;
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v3;
  uint64_t v60 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_0();
  uint64_t v58 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v62 = v12;
  uint64_t v13 = type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  int v17 = (unsigned __int8 *)(v16 - v15);
  unsigned __int8 *v17 = 14;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  uint64_t v18 = v16 - v15 + v14[8];
  uint64_t v63 = v9;
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v9);
  int v19 = &v17[v14[9]];
  *(void *)int v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v17[v14[10]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v21 = &v17[v14[11]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = &v17[v14[12]];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = v1;
  v64(v17);
  int v24 = *v17;
  if (v24 == 14 || (uint64_t v25 = *((void *)v17 + 2)) == 0)
  {

    sub_25D09AAB4((uint64_t)v17);
    goto LABEL_6;
  }
  uint64_t v64 = (void (*)(unsigned __int8 *))*((void *)v17 + 1);
  sub_25CF67F88(v18, v8);
  if (__swift_getEnumTagSinglePayload(v8, 1, v63) == 1)
  {

    sub_25D09AAB4((uint64_t)v17);
    sub_25CF69FC0(v8);
LABEL_6:
    type metadata accessor for TextBasedTRPCandidateForPlannerMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v57 = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v62, v8, v63);
  uint64_t v28 = *((void *)v19 + 1);
  if (!v28
    || (uint64_t v29 = *((void *)v20 + 1)) == 0
    || (uint64_t v30 = *((void *)v22 + 1)) == 0
    || (uint64_t v56 = *((void *)v21 + 1)) == 0)
  {

    sub_25D09AAB4((uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v63);
    goto LABEL_6;
  }
  uint64_t v31 = *(void *)v19;
  uint64_t v54 = *(void *)v20;
  uint64_t v55 = v31;
  uint64_t v32 = *(void *)v22;
  uint64_t v53 = *(void *)v21;
  uint64_t v65 = v32;
  uint64_t v66 = v30;
  uint64_t v33 = v57;
  uint64_t v34 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v35 = v29;
  uint64_t v36 = sub_25D0BD560();
  unint64_t v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
  swift_bridgeObjectRelease();
  uint64_t v39 = HIBYTE(v38) & 0xF;
  if ((v38 & 0x2000000000000000) == 0) {
    uint64_t v39 = v36 & 0xFFFFFFFFFFFFLL;
  }
  if (!v39)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_25D0BD240();
    __swift_project_value_buffer(v48, (uint64_t)qword_26B366B88);
    uint64_t v49 = sub_25D0BD230();
    os_log_type_t v50 = sub_25D0BD4B0();
    uint64_t v51 = v62;
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_25CF65000, v49, v50, "utterance is empty, can't create message", v52, 2u);
      MEMORY[0x2611A4870](v52, -1, -1);
    }

    sub_25D09AAB4((uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v51, v63);
    goto LABEL_6;
  }
  uint64_t v40 = (uint64_t *)&v23[OBJC_IVAR____TtC16SiriMessageTypes38TextBasedTRPCandidateForPlannerMessage_utterance];
  *uint64_t v40 = v36;
  v40[1] = v38;

  MEMORY[0x270FA5388](v41);
  *((unsigned char *)&v53 - 80) = v24;
  *(&v53 - 9) = (uint64_t)v64;
  *(&v53 - 8) = v33;
  uint64_t v42 = v62;
  uint64_t v43 = v55;
  uint64_t v44 = v56;
  *(&v53 - 7) = v62;
  *(&v53 - 6) = v43;
  uint64_t v45 = v54;
  *(&v53 - 5) = v34;
  *(&v53 - 4) = v45;
  uint64_t v46 = v53;
  *(&v53 - 3) = v35;
  *(&v53 - 2) = v46;
  *(&v53 - 1) = v44;
  uint64_t v26 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF8E348);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v47 = v26;
  sub_25D09AAB4((uint64_t)v17);
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v42, v63);
  if (v26) {

  }
  return v26;
}

uint64_t type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639DE8);
}

uint64_t sub_25D09AAB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TextBasedTRPCandidateForPlannerMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364350);
}

void *TextBasedTRPCandidateForPlannerMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedTRPCandidateForPlannerMessage.init(from:)(a1);
}

void *TextBasedTRPCandidateForPlannerMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639DD0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09B3DC();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v12[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for TextBasedTRPCandidateForPlannerMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes38TextBasedTRPCandidateForPlannerMessage_utterance];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v12);
    uint64_t v6 = TRPCandidateRequestMessageBase.init(from:)(v12);
    uint64_t v10 = OUTLINED_FUNCTION_2();
    v11(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D09AD48(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639DE0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09B3DC();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0A3B5C(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void TextBasedTRPCandidateForPlannerMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TextBasedTRPCandidateForPlannerMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.requestId.setter()
{
  OUTLINED_FUNCTION_5_37();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.trpCandidateId.setter()
{
  OUTLINED_FUNCTION_5_37();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0) + 36));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0);
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateForPlannerMessage.Builder.utterance.setter()
{
  OUTLINED_FUNCTION_5_37();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateForPlannerMessage.Builder.utterance.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D09B2AC(uint64_t a1)
{
  unint64_t v2 = sub_25D09B3DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09B2E8(uint64_t a1)
{
  unint64_t v2 = sub_25D09B3DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextBasedTRPCandidateForPlannerMessage.__allocating_init(build:)()
{
}

void TextBasedTRPCandidateForPlannerMessage.init(build:)()
{
}

uint64_t sub_25D09B384()
{
  return OUTLINED_FUNCTION_1();
}

id TextBasedTRPCandidateForPlannerMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextBasedTRPCandidateForPlannerMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D09B3DC()
{
  unint64_t result = qword_26A639DD8;
  if (!qword_26A639DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639DD8);
  }
  return result;
}

uint64_t sub_25D09B428()
{
  return type metadata accessor for TextBasedTRPCandidateForPlannerMessage(0);
}

uint64_t sub_25D09B430()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TextBasedTRPCandidateForPlannerMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TextBasedTRPCandidateForPlannerMessage);
}

uint64_t dispatch thunk of TextBasedTRPCandidateForPlannerMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for TextBasedTRPCandidateForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D09B4B4);
}

uint64_t sub_25D09B4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TextBasedTRPCandidateForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D09B560);
}

uint64_t sub_25D09B560(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D09B5E4()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TextBasedTRPCandidateForPlannerMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D09B728);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TextBasedTRPCandidateForPlannerMessage.CodingKeys()
{
  return &type metadata for TextBasedTRPCandidateForPlannerMessage.CodingKeys;
}

unint64_t sub_25D09B764()
{
  unint64_t result = qword_26A639DF8;
  if (!qword_26A639DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639DF8);
  }
  return result;
}

unint64_t sub_25D09B7B4()
{
  unint64_t result = qword_26A639E00;
  if (!qword_26A639E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E00);
  }
  return result;
}

unint64_t sub_25D09B804()
{
  unint64_t result = qword_26A639E08;
  if (!qword_26A639E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E08);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_37()
{
  return type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_10_19()
{
  return type metadata accessor for TextBasedTRPCandidateForPlannerMessage.Builder(0);
}

void *sub_25D09B884(void *a1, uint64_t a2)
{
  id v71 = a1;
  uint64_t v72 = a2;
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v67 = v4;
  uint64_t v68 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_0();
  uint64_t v66 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v69 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  uint64_t v16 = (int *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_4_38(v17, v59);
  uint64_t v18 = (uint64_t)&v2[v16[8]];
  OUTLINED_FUNCTION_16_12(v18);
  int v19 = (uint64_t *)&v2[v16[9]];
  uint64_t *v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (uint64_t *)&v2[v16[10]];
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v21 = &v2[v16[11]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v64 = v21;
  uint64_t v22 = (uint64_t *)&v2[v16[12]];
  *uint64_t v22 = 0;
  v22[1] = 0;
  uint64_t v23 = &v2[v16[13]];
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = 0;
  uint64_t v65 = v16[14];
  v2[v65] = 1;
  uint64_t v24 = v16[15];
  v2[v24] = 1;
  uint64_t v25 = (char *)v71;
  sub_25D038754((uint64_t)v2, v72);
  if (*v2 == 14 || (uint64_t v26 = (void *)*((void *)v2 + 2)) == 0)
  {

    sub_25D09C484((uint64_t)v2);
    goto LABEL_6;
  }
  int v63 = *v2;
  id v71 = v26;
  uint64_t v72 = v14;
  uint64_t v62 = *((void *)v2 + 1);
  sub_25CF67F88(v18, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v70) == 1)
  {

    sub_25D09C484((uint64_t)v2);
    sub_25CF69FC0(v9);
LABEL_6:
    type metadata accessor for TextBasedTRPCandidateMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v72, v9, v70);
  uint64_t v29 = v19[1];
  if (!v29 || (uint64_t v30 = v20[1]) == 0 || (v31 = *((void *)v23 + 1)) == 0 || (v32 = v22[1]) == 0)
  {

    sub_25D09C484((uint64_t)v2);
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v72, v70);
    goto LABEL_6;
  }
  uint64_t v59 = *v19;
  uint64_t v61 = *v20;
  uint64_t v33 = *(void *)v23;
  uint64_t v60 = *v22;
  uint64_t v73 = v33;
  uint64_t v74 = v31;
  uint64_t v34 = v30;
  uint64_t v35 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v36 = sub_25D0BD560();
  uint64_t v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_15();
  if (!v39)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_25D0BD240();
    __swift_project_value_buffer(v45, (uint64_t)qword_26B366B88);
    uint64_t v46 = sub_25D0BD230();
    os_log_type_t v47 = sub_25D0BD4B0();
    uint64_t v48 = v69;
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_25CF65000, v46, v47, "utterance is empty, can't create message", v49, 2u);
      MEMORY[0x2611A4870](v49, -1, -1);
    }

    sub_25D09C484((uint64_t)v2);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v72, v70);
    goto LABEL_6;
  }
  uint64_t v40 = v59;
  uint64_t v67 = v34;
  uint64_t v68 = v35;
  uint64_t v41 = v29;
  uint64_t v42 = (uint64_t *)&v25[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_utterance];
  *uint64_t v42 = v36;
  v42[1] = v38;
  if (*((void *)v64 + 1))
  {
    uint64_t v43 = *(void *)v64;
    unint64_t v44 = *((void *)v64 + 1);
  }
  else
  {
    uint64_t v43 = 0;
    unint64_t v44 = 0xE000000000000000;
  }
  uint64_t v50 = v69;
  uint64_t v51 = v72;
  uint64_t v52 = &v25[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_tcuId];
  *(void *)uint64_t v52 = v43;
  *((void *)v52 + 1) = v44;
  v25[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correctionOutcome] = v2[v65];
  v25[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correction] = v2[v24];
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v53);
  *((unsigned char *)&v59 - 80) = v63;
  uint64_t v54 = (uint64_t)v71;
  *(&v59 - 9) = v62;
  *(&v59 - 8) = v54;
  *(&v59 - 7) = v51;
  *(&v59 - 6) = v40;
  uint64_t v55 = v61;
  *(&v59 - 5) = v41;
  *(&v59 - 4) = v55;
  uint64_t v56 = v68;
  uint64_t v57 = v60;
  *(&v59 - 3) = v67;
  *(&v59 - 2) = v57;
  *(&v59 - 1) = v56;
  uint64_t v27 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D09CB04);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v58 = v27;
  sub_25D09C484((uint64_t)v2);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v70);
  if (v27) {

  }
  return v27;
}

void *TextBasedTRPCandidateMessage.init(build:)(void (*a1)(unsigned __int8 *), uint64_t a2)
{
  uint64_t v70 = a2;
  id v71 = a1;
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v65 = v5;
  uint64_t v66 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  uint64_t v64 = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v67 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_0();
  uint64_t v68 = v13;
  uint64_t v14 = type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  uint64_t v15 = (int *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_4_38(v16, v56);
  uint64_t v17 = (uint64_t)&v3[v15[8]];
  OUTLINED_FUNCTION_16_12(v17);
  uint64_t v18 = &v3[v15[9]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  int v19 = (uint64_t *)&v3[v15[10]];
  uint64_t *v19 = 0;
  v19[1] = 0;
  uint64_t v20 = &v3[v15[11]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v61 = v20;
  uint64_t v21 = (uint64_t *)&v3[v15[12]];
  uint64_t *v21 = 0;
  v21[1] = 0;
  uint64_t v22 = &v3[v15[13]];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v62 = v15[14];
  v3[v62] = 1;
  uint64_t v63 = v15[15];
  v3[v63] = 1;
  uint64_t v23 = v2;
  v71(v3);
  if (*v3 == 14 || (uint64_t v24 = *((void *)v3 + 2)) == 0)
  {

    sub_25D09C484((uint64_t)v3);
    goto LABEL_6;
  }
  LODWORD(v71) = *v3;
  uint64_t v70 = *((void *)v3 + 1);
  sub_25CF67F88(v17, v10);
  if (__swift_getEnumTagSinglePayload(v10, 1, v69) == 1)
  {

    sub_25D09C484((uint64_t)v3);
    sub_25CF69FC0(v10);
LABEL_6:
    type metadata accessor for TextBasedTRPCandidateMessage(0);
    OUTLINED_FUNCTION_1_16();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v60 = v24;
  uint64_t v27 = v67;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v68, v10, v69);
  uint64_t v28 = *((void *)v18 + 1);
  if (!v28 || (uint64_t v29 = v19[1]) == 0 || (v30 = *((void *)v22 + 1)) == 0 || (v31 = v21[1]) == 0)
  {

    sub_25D09C484((uint64_t)v3);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v69);
    goto LABEL_6;
  }
  uint64_t v32 = *(void *)v18;
  uint64_t v58 = *v19;
  uint64_t v59 = v32;
  uint64_t v33 = *(void *)v22;
  uint64_t v57 = *v21;
  uint64_t v72 = v33;
  uint64_t v73 = v30;
  uint64_t v34 = v29;
  uint64_t v35 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v36 = sub_25D0BD560();
  uint64_t v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_15();
  if (!v39)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25D0BD240();
    __swift_project_value_buffer(v43, (uint64_t)qword_26B366B88);
    unint64_t v44 = sub_25D0BD230();
    os_log_type_t v45 = sub_25D0BD4B0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_25CF65000, v44, v45, "utterance is empty, can't create message", v46, 2u);
      MEMORY[0x2611A4870](v46, -1, -1);
    }

    sub_25D09C484((uint64_t)v3);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v68, v69);
    goto LABEL_6;
  }
  uint64_t v40 = (uint64_t *)&v23[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_utterance];
  *uint64_t v40 = v36;
  v40[1] = v38;
  if (*((void *)v61 + 1))
  {
    uint64_t v41 = *(void *)v61;
    unint64_t v42 = *((void *)v61 + 1);
  }
  else
  {
    uint64_t v41 = 0;
    unint64_t v42 = 0xE000000000000000;
  }
  uint64_t v47 = v68;
  uint64_t v48 = &v23[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_tcuId];
  *(void *)uint64_t v48 = v41;
  *((void *)v48 + 1) = v42;
  v23[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correctionOutcome] = v3[v62];
  v23[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correction] = v3[v63];
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v49);
  *((unsigned char *)&v56 - 80) = (_BYTE)v71;
  uint64_t v50 = v60;
  *(&v56 - 9) = v70;
  *(&v56 - 8) = v50;
  uint64_t v51 = v59;
  *(&v56 - 7) = v47;
  *(&v56 - 6) = v51;
  uint64_t v52 = v58;
  *(&v56 - 5) = v28;
  *(&v56 - 4) = v52;
  uint64_t v53 = v57;
  *(&v56 - 3) = v34;
  *(&v56 - 2) = v53;
  *(&v56 - 1) = v35;
  uint64_t v25 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D09CB04);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v54 = v47;
  id v55 = v25;
  sub_25D09C484((uint64_t)v3);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v54, v69);
  if (v25) {

  }
  return v25;
}

uint64_t type metadata accessor for TextBasedTRPCandidateMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639E28);
}

uint64_t sub_25D09C484(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TextBasedTRPCandidateMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364268);
}

void *TextBasedTRPCandidateMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E10);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  uint64_t v16 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09D53C();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1(v16);
    type metadata accessor for TextBasedTRPCandidateMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v7 = OUTLINED_FUNCTION_14_16();
    uint64_t v8 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_utterance];
    uint64_t *v8 = v7;
    v8[1] = v9;
    LOBYTE(v17[0]) = 1;
    uint64_t v10 = OUTLINED_FUNCTION_14_16();
    uint64_t v12 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_tcuId];
    uint64_t *v12 = v10;
    v12[1] = v13;
    sub_25CFFA4A8();
    OUTLINED_FUNCTION_10_20();
    v5[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correctionOutcome] = v17[0];
    char v18 = 3;
    sub_25CFF9978();
    OUTLINED_FUNCTION_10_20();
    v5[OBJC_IVAR____TtC16SiriMessageTypes28TextBasedTRPCandidateMessage_correction] = v17[0];

    sub_25CF68E70(v16, (uint64_t)v17);
    uint64_t v6 = TRPCandidateRequestMessageBase.init(from:)(v17);
    uint64_t v14 = OUTLINED_FUNCTION_1_40();
    v15(v14);
    __swift_destroy_boxed_opaque_existential_1(v16);
  }
  return v6;
}

uint64_t sub_25D09C824(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E20);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D09D53C();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25D0BD880();
    sub_25CFFA45C();
    sub_25D0BD870();
    sub_25CFF98E0();
    sub_25D0BD870();
    sub_25D0A3B5C(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void TextBasedTRPCandidateMessage.__allocating_init(build:)()
{
}

uint64_t TextBasedTRPCandidateMessage.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.tcuId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

void TextBasedTRPCandidateMessage.correctionOutcome.getter(unsigned char *a1@<X8>)
{
}

void TextBasedTRPCandidateMessage.correction.getter(unsigned char *a1@<X8>)
{
}

void *TextBasedTRPCandidateMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *), uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return TextBasedTRPCandidateMessage.init(build:)(a1, a2);
}

void *TextBasedTRPCandidateMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TextBasedTRPCandidateMessage.init(from:)(a1);
}

void TextBasedTRPCandidateMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
}

unsigned char *TextBasedTRPCandidateMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.sessionId.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_15_16() + 24);
  return sub_25CF67F88(v2, v0);
}

uint64_t TextBasedTRPCandidateMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TextBasedTRPCandidateMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.Builder.requestId.setter()
{
  OUTLINED_FUNCTION_5_38();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.Builder.trpCandidateId.setter()
{
  OUTLINED_FUNCTION_5_38();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.tcuId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.Builder.tcuId.setter()
{
  OUTLINED_FUNCTION_5_38();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.tcuId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.userId.getter()
{
  uint64_t v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_15_16() + 40));
  uint64_t v3 = v2[1];
  *uint64_t v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TextBasedTRPCandidateMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.utterance.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TextBasedTRPCandidateMessage.Builder.utterance.setter()
{
  OUTLINED_FUNCTION_5_38();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.utterance.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.correctionOutcome.getter()
{
  uint64_t result = OUTLINED_FUNCTION_15_16();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t TextBasedTRPCandidateMessage.Builder.correctionOutcome.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 48)) = v2;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.correctionOutcome.modify())(void)
{
  return nullsub_1;
}

uint64_t TextBasedTRPCandidateMessage.Builder.correction.getter()
{
  uint64_t result = OUTLINED_FUNCTION_15_16();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 52));
  return result;
}

uint64_t TextBasedTRPCandidateMessage.Builder.correction.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 52)) = v2;
  return result;
}

uint64_t (*TextBasedTRPCandidateMessage.Builder.correction.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25D09D150(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x636E617265747475 && a2 == 0xE900000000000065;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449756374 && a2 == 0xE500000000000000;
    if (v6 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x800000025D0C32B0 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6974636572726F63 && a2 == 0xEA00000000006E6FLL)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_25D0BD940();
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

unint64_t sub_25D09D2F4(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6449756374;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6974636572726F63;
      break;
    default:
      unint64_t result = 0x636E617265747475;
      break;
  }
  return result;
}

unint64_t sub_25D09D390()
{
  return sub_25D09D2F4(*v0);
}

uint64_t sub_25D09D398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D09D150(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D09D3C0(uint64_t a1)
{
  unint64_t v2 = sub_25D09D53C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09D3FC(uint64_t a1)
{
  unint64_t v2 = sub_25D09D53C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextBasedTRPCandidateMessage.init(build:)()
{
}

uint64_t sub_25D09D468()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id TextBasedTRPCandidateMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextBasedTRPCandidateMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D09D53C()
{
  unint64_t result = qword_26A639E18;
  if (!qword_26A639E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E18);
  }
  return result;
}

uint64_t sub_25D09D588()
{
  return type metadata accessor for TextBasedTRPCandidateMessage(0);
}

uint64_t sub_25D09D590()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TextBasedTRPCandidateMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TextBasedTRPCandidateMessage);
}

uint64_t dispatch thunk of TextBasedTRPCandidateMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

void *initializeBufferWithCopyOfBuffer for TextBasedTRPCandidateMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    int v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (void *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[9];
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)((char *)v4 + v22);
    uint64_t v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (void *)((char *)v4 + v23);
    uint64_t v28 = (void *)((char *)a2 + v23);
    uint64_t v29 = v28[1];
    void *v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = a3[11];
    uint64_t v31 = a3[12];
    uint64_t v32 = (void *)((char *)v4 + v30);
    uint64_t v33 = (void *)((char *)a2 + v30);
    uint64_t v34 = v33[1];
    void *v32 = *v33;
    v32[1] = v34;
    *((unsigned char *)v4 + v31) = *((unsigned char *)a2 + v31);
    *((unsigned char *)v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t initializeWithCopy for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  uint64_t v26 = (void *)(a2 + v21);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[11];
  uint64_t v29 = a3[12];
  uint64_t v30 = (void *)(a1 + v28);
  uint64_t v31 = (void *)(a2 + v28);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[11];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  void *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  return a1;
}

uint64_t initializeWithTake for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[11];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (uint64_t *)(a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  void *v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v40) = *(unsigned char *)(a2 + v40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D09DF78);
}

uint64_t sub_25D09DF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TextBasedTRPCandidateMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D09E024);
}

uint64_t sub_25D09E024(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D09E0A8()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TextBasedTRPCandidateMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D09E22CLL);
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

ValueMetadata *type metadata accessor for TextBasedTRPCandidateMessage.CodingKeys()
{
  return &type metadata for TextBasedTRPCandidateMessage.CodingKeys;
}

unint64_t sub_25D09E268()
{
  unint64_t result = qword_26A639E38;
  if (!qword_26A639E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E38);
  }
  return result;
}

unint64_t sub_25D09E2B8()
{
  unint64_t result = qword_26A639E40;
  if (!qword_26A639E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E40);
  }
  return result;
}

unint64_t sub_25D09E308()
{
  unint64_t result = qword_26A639E48;
  if (!qword_26A639E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_40()
{
  return v0;
}

void OUTLINED_FUNCTION_4_38(uint64_t a1@<X8>, uint64_t a2)
{
  objc_super v2 = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  *objc_super v2 = 14;
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
}

uint64_t OUTLINED_FUNCTION_5_38()
{
  return type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_6_32()
{
  return type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_10_20()
{
  return sub_25D0BD750();
}

uint64_t OUTLINED_FUNCTION_14_16()
{
  return sub_25D0BD780();
}

uint64_t OUTLINED_FUNCTION_15_16()
{
  return type metadata accessor for TextBasedTRPCandidateMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_16_12(uint64_t a1)
{
  *(void *)(v2 - 120) = v1;
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

double TextRequestType.TapToEditRequest.init(build:)@<D0>(void (*a1)(long long *)@<X0>, _OWORD *a2@<X8>)
{
  long long v4 = 0uLL;
  a1(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t TextRequestType.TapToEditRequest.Builder.previousUtterance.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TextRequestType.TapToEditRequest.Builder.previousUtterance.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TextRequestType.TapToEditRequest.Builder.previousUtterance.modify())(void)
{
  return nullsub_1;
}

uint64_t static TextRequestType.TapToEditRequest.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_25D0BD940() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_25D09E580(uint64_t a1)
{
  unint64_t v2 = sub_25D09E6E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09E5BC(uint64_t a1)
{
  unint64_t v2 = sub_25D09E6E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextRequestType.TapToEditRequest.encode(to:)()
{
  OUTLINED_FUNCTION_4_7();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E50);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D09E6E8();
  sub_25D0BDA30();
  sub_25D0BD850();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  OUTLINED_FUNCTION_8_3();
}

unint64_t sub_25D09E6E8()
{
  unint64_t result = qword_26A639E58;
  if (!qword_26A639E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E58);
  }
  return result;
}

void TextRequestType.TapToEditRequest.init(from:)()
{
  OUTLINED_FUNCTION_4_7();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E60);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D09E6E8();
  sub_25D0BDA20();
  if (!v0)
  {
    uint64_t v6 = sub_25D0BD720();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_18_0();
    v10(v9);
    *uint64_t v4 = v6;
    v4[1] = v8;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_8_3();
}

void sub_25D09E83C()
{
}

void sub_25D09E854()
{
}

BOOL static TextRequestType.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (v3 != 1)
  {
    if (v5 == 1) {
      goto LABEL_5;
    }
    if (v3)
    {
      if (!v5)
      {
        sub_25D014938(*a1, v3);
        uint64_t v7 = v4;
        uint64_t v8 = 0;
        goto LABEL_6;
      }
      uint64_t v10 = *a1;
      if (v2 != v4 || v3 != v5)
      {
        char v12 = sub_25D0BD940();
        sub_25D014938(v2, v3);
        sub_25D014938(v4, v5);
        sub_25D014910(v2, v3);
        sub_25D014910(v4, v5);
        return (v12 & 1) != 0;
      }
      sub_25D014938(v10, v3);
      sub_25D014938(v2, v3);
      sub_25D014910(v2, v3);
      uint64_t v13 = v2;
      uint64_t v14 = v3;
    }
    else
    {
      if (v5)
      {
        swift_bridgeObjectRetain();
        uint64_t v3 = 0;
        goto LABEL_7;
      }
      sub_25D014910(*a1, 0);
      uint64_t v13 = v4;
      uint64_t v14 = 0;
    }
    sub_25D014910(v13, v14);
    return 1;
  }
  if (v5 != 1)
  {
LABEL_5:
    sub_25D014938(*a1, v3);
    uint64_t v7 = v4;
    uint64_t v8 = v5;
LABEL_6:
    sub_25D014938(v7, v8);
LABEL_7:
    sub_25D014910(v2, v3);
    sub_25D014910(v4, v5);
    return 0;
  }
  uint64_t v6 = 1;
  sub_25D014910(*a1, 1);
  sub_25D014910(v4, 1);
  return v6;
}

uint64_t sub_25D09E9F0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69536F5465707974 && a2 == 0xEA00000000006972;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6964456F54706174 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D09EAE8(char a1)
{
  if (a1) {
    return 0x6964456F54706174;
  }
  else {
    return 0x69536F5465707974;
  }
}

uint64_t sub_25D09EB28()
{
  return sub_25D09EAE8(*v0);
}

uint64_t sub_25D09EB30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D09E9F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D09EB58(uint64_t a1)
{
  unint64_t v2 = sub_25D09EEE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09EB94(uint64_t a1)
{
  unint64_t v2 = sub_25D09EEE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D09EBD0(uint64_t a1)
{
  unint64_t v2 = sub_25D09EF2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09EC0C(uint64_t a1)
{
  unint64_t v2 = sub_25D09EF2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D09EC48(uint64_t a1)
{
  unint64_t v2 = sub_25D09EFC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D09EC84(uint64_t a1)
{
  unint64_t v2 = sub_25D09EFC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextRequestType.encode(to:)()
{
  OUTLINED_FUNCTION_4_7();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E68);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E70);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639E78);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = *(void *)(v0 + 8);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D09EEE0();
  sub_25D0BDA30();
  if (v6 == 1)
  {
    sub_25D09EFC4();
    OUTLINED_FUNCTION_13_15();
  }
  else
  {
    sub_25D09EF2C();
    OUTLINED_FUNCTION_13_15();
    sub_25D09EF78();
    sub_25D0BD8E0();
  }
  OUTLINED_FUNCTION_2_3();
  v7();
  uint64_t v8 = OUTLINED_FUNCTION_12_16();
  v9(v8);
  OUTLINED_FUNCTION_8_3();
}

unint64_t sub_25D09EEE0()
{
  unint64_t result = qword_26A639E80;
  if (!qword_26A639E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E80);
  }
  return result;
}

unint64_t sub_25D09EF2C()
{
  unint64_t result = qword_26A639E88;
  if (!qword_26A639E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E88);
  }
  return result;
}

unint64_t sub_25D09EF78()
{
  unint64_t result = qword_26A639E90;
  if (!qword_26A639E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E90);
  }
  return result;
}

unint64_t sub_25D09EFC4()
{
  unint64_t result = qword_26A639E98;
  if (!qword_26A639E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639E98);
  }
  return result;
}

void TextRequestType.init(from:)()
{
  OUTLINED_FUNCTION_4_7();
  uint64_t v3 = v2;
  uint64_t v29 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639EA0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639EA8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_2();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639EB0);
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25D09EEE0();
  sub_25D0BDA20();
  if (v0) {
    goto LABEL_7;
  }
  uint64_t v32 = v3;
  uint64_t v10 = sub_25D0BD820();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11
    || (char v28 = *(unsigned char *)(v10 + 32),
        sub_25CF72054(1, v11, v10, v10 + 32, 0, (2 * v11) | 1),
        uint64_t v13 = v12,
        unint64_t v15 = v14,
        swift_bridgeObjectRelease(),
        v13 != v15 >> 1))
  {
    uint64_t v16 = v1;
    uint64_t v17 = sub_25D0BD610();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A636CD8);
    void *v19 = &type metadata for TextRequestType;
    sub_25D0BD710();
    sub_25D0BD600();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v16, v7);
    uint64_t v3 = v32;
LABEL_7:
    uint64_t v20 = (uint64_t)v3;
    goto LABEL_8;
  }
  if (v28)
  {
    LOBYTE(v31) = 1;
    sub_25D09EF2C();
    OUTLINED_FUNCTION_30_1();
    sub_25D09F468();
    sub_25D0BD7E0();
    OUTLINED_FUNCTION_2_3();
    v24();
    swift_unknownObjectRelease();
    uint64_t v25 = OUTLINED_FUNCTION_44_0();
    v26(v25);
    long long v27 = v31;
  }
  else
  {
    sub_25D09EFC4();
    OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_2_3();
    v21();
    swift_unknownObjectRelease();
    uint64_t v22 = OUTLINED_FUNCTION_1_41();
    v23(v22);
    long long v27 = xmmword_25D0DB0C0;
  }
  *uint64_t v29 = v27;
  uint64_t v20 = (uint64_t)v3;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v20);
  OUTLINED_FUNCTION_8_3();
}

void sub_25D09F434()
{
}

void sub_25D09F44C()
{
}

unint64_t sub_25D09F468()
{
  unint64_t result = qword_26A639EB8;
  if (!qword_26A639EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EB8);
  }
  return result;
}

unint64_t destroy for TextRequestType(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s16SiriMessageTypes15TextRequestTypeOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for TextRequestType(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for TextRequestType(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for TextRequestType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TextRequestType(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25D09F700(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_25D09F724(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

void type metadata accessor for TextRequestType()
{
}

void type metadata accessor for TextRequestType.TapToEditRequest()
{
}

void type metadata accessor for TextRequestType.TapToEditRequest.Builder()
{
}

unsigned char *storeEnumTagSinglePayload for TextRequestType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D09F848);
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

ValueMetadata *type metadata accessor for TextRequestType.CodingKeys()
{
  return &type metadata for TextRequestType.CodingKeys;
}

ValueMetadata *type metadata accessor for TextRequestType.TypeToSiriCodingKeys()
{
  return &type metadata for TextRequestType.TypeToSiriCodingKeys;
}

ValueMetadata *type metadata accessor for TextRequestType.TapToEditCodingKeys()
{
  return &type metadata for TextRequestType.TapToEditCodingKeys;
}

unsigned char *_s16SiriMessageTypes15TextRequestTypeO19TapToEditCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D09F940);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TextRequestType.TapToEditRequest.CodingKeys()
{
  return &type metadata for TextRequestType.TapToEditRequest.CodingKeys;
}

unint64_t sub_25D09F97C()
{
  unint64_t result = qword_26A639EC0;
  if (!qword_26A639EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EC0);
  }
  return result;
}

unint64_t sub_25D09F9CC()
{
  unint64_t result = qword_26A639EC8;
  if (!qword_26A639EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EC8);
  }
  return result;
}

unint64_t sub_25D09FA1C()
{
  unint64_t result = qword_26A639ED0;
  if (!qword_26A639ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639ED0);
  }
  return result;
}

unint64_t sub_25D09FA6C()
{
  unint64_t result = qword_26A639ED8;
  if (!qword_26A639ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639ED8);
  }
  return result;
}

unint64_t sub_25D09FABC()
{
  unint64_t result = qword_26A639EE0;
  if (!qword_26A639EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EE0);
  }
  return result;
}

unint64_t sub_25D09FB0C()
{
  unint64_t result = qword_26A639EE8;
  if (!qword_26A639EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EE8);
  }
  return result;
}

unint64_t sub_25D09FB5C()
{
  unint64_t result = qword_26A639EF0;
  if (!qword_26A639EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EF0);
  }
  return result;
}

unint64_t sub_25D09FBAC()
{
  unint64_t result = qword_26A639EF8;
  if (!qword_26A639EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639EF8);
  }
  return result;
}

unint64_t sub_25D09FBFC()
{
  unint64_t result = qword_26A639F00;
  if (!qword_26A639F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F00);
  }
  return result;
}

unint64_t sub_25D09FC4C()
{
  unint64_t result = qword_26A639F08;
  if (!qword_26A639F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F08);
  }
  return result;
}

unint64_t sub_25D09FC9C()
{
  unint64_t result = qword_26A639F10;
  if (!qword_26A639F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_41()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_15()
{
  return sub_25D0BD840();
}

uint64_t TRPCandidateForPlannerMessage.tcuToContextList.getter()
{
  return swift_bridgeObjectRetain();
}

void *TRPCandidateForPlannerMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateForPlannerMessage.init(build:)(a1);
}

void *TRPCandidateForPlannerMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_25D0BCFE0();
  uint64_t v48 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v49 = v9 - v8;
  uint64_t v10 = type metadata accessor for TRPCandidateForPlannerMessage.Builder(0);
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  unint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *unint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  uint64_t v50 = v7;
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v7);
  uint64_t v16 = &v14[v11[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = (uint64_t *)&v14[v11[10]];
  uint64_t *v17 = 0;
  v17[1] = 0;
  uint64_t v18 = &v14[v11[11]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  uint64_t v19 = v11[12];
  *(void *)&v14[v19] = 0;
  uint64_t v20 = v1;
  a1(v14);
  int v21 = *v14;
  if (v21 == 14 || !*((void *)v14 + 2))
  {

    goto LABEL_6;
  }
  uint64_t v47 = *((void *)v14 + 2);
  uint64_t v46 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v6);
  if (__swift_getEnumTagSinglePayload(v6, 1, v50) == 1)
  {

    sub_25CF69FC0(v6);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v53 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v52 = sub_25D04E590(v27, v28, &v53);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D0A031C((uint64_t)v14);
    type metadata accessor for TRPCandidateForPlannerMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v48 + 32))(v49, v6);
  uint64_t v31 = *((void *)v16 + 1);
  if (!v31 || (v32 = v17[1]) == 0 || (uint64_t v33 = *((void *)v18 + 1), v34 = v49, !v33) || (v35 = *(void *)&v14[v19]) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
    goto LABEL_6;
  }
  uint64_t v45 = *(void *)v16;
  uint64_t ObjectType = *v17;
  uint64_t v36 = *(void *)v18;
  *(void *)&v20[OBJC_IVAR____TtC16SiriMessageTypes29TRPCandidateForPlannerMessage_tcuToContextList] = v35;
  uint64_t v37 = v47;
  uint64_t v38 = v33;
  uint64_t v39 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v40);
  *((unsigned char *)&v44 - 80) = v21;
  *(&v44 - 9) = v46;
  *(&v44 - 8) = v37;
  uint64_t v41 = v45;
  *(&v44 - 7) = v34;
  *(&v44 - 6) = v41;
  *(&v44 - 5) = v39;
  *(&v44 - 4) = v36;
  uint64_t v42 = ObjectType;
  *(&v44 - 3) = v38;
  *(&v44 - 2) = v42;
  *(&v44 - 1) = v32;
  uint64_t v29 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF8E348);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v43 = v29;
  sub_25D0A031C((uint64_t)v14);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v34, v50);
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for TRPCandidateForPlannerMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639F18);
}

uint64_t sub_25D0A031C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPCandidateForPlannerMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPCandidateForPlannerMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3642B8);
}

void *TRPCandidateForPlannerMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateForPlannerMessage.init(from:)(a1);
}

void *TRPCandidateForPlannerMessage.init(from:)(uint64_t a1)
{
  uint64_t v3 = qword_26B3645D0;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25D0BD240();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B366B88);
  uint64_t v6 = sub_25D0BD230();
  os_log_type_t v7 = sub_25D0BD4B0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25CF65000, v6, v7, "Error: Attempted to serialize an instance of TRPCandidateRequestMessage, which is not currently codable. Conversation Session State will be empty.", v8, 2u);
    MEMORY[0x2611A4870](v8, -1, -1);
  }

  *(void *)&v4[OBJC_IVAR____TtC16SiriMessageTypes29TRPCandidateForPlannerMessage_tcuToContextList] = MEMORY[0x263F8EE78];
  sub_25CF68E70(a1, (uint64_t)v11);
  uint64_t v9 = TRPCandidateRequestMessageBase.init(from:)(v11);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t sub_25D0A0588()
{
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_25D0BD5D0();
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for TRPCandidateForPlannerMessage(0);
  id v1 = objc_msgSendSuper2(&v8, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v9 = v2;
  unint64_t v10 = v4;
  sub_25D0BD390();
  uint64_t v5 = *(void *)&v0[OBJC_IVAR____TtC16SiriMessageTypes29TRPCandidateForPlannerMessage_tcuToContextList];
  swift_bridgeObjectRetain();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3646A8);
  MEMORY[0x2611A3C30](v5, v6);
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v9;
}

void TRPCandidateForPlannerMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPCandidateForPlannerMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPCandidateForPlannerMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t TRPCandidateForPlannerMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.trpCandidateId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.trpCandidateId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateForPlannerMessage.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateForPlannerMessage.Builder.tcuToContextList.getter()
{
  type metadata accessor for TRPCandidateForPlannerMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t TRPCandidateForPlannerMessage.Builder.tcuToContextList.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_42() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*TRPCandidateForPlannerMessage.Builder.tcuToContextList.modify())(void)
{
  return nullsub_1;
}

void TRPCandidateForPlannerMessage.__allocating_init(build:)()
{
}

void TRPCandidateForPlannerMessage.init(build:)()
{
}

uint64_t sub_25D0A0B90()
{
  return swift_bridgeObjectRelease();
}

id TRPCandidateForPlannerMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPCandidateForPlannerMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0A0BE8()
{
  return type metadata accessor for TRPCandidateForPlannerMessage(0);
}

uint64_t method lookup function for TRPCandidateForPlannerMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPCandidateForPlannerMessage);
}

uint64_t dispatch thunk of TRPCandidateForPlannerMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for TRPCandidateForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A0C30);
}

uint64_t sub_25D0A0C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPCandidateForPlannerMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A0CDC);
}

uint64_t sub_25D0A0CDC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A0D60()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t OUTLINED_FUNCTION_1_42()
{
  return type metadata accessor for TRPCandidateForPlannerMessage.Builder(0);
}

uint64_t TRPCandidateReadyForExecutionMessage.trpId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t sub_25D0A0E54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6449707274 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D0A0ED4()
{
  return 0x6449707274;
}

uint64_t sub_25D0A0EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A0E54(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D0A0F18(uint64_t a1)
{
  unint64_t v2 = sub_25D0A1C9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A0F54(uint64_t a1)
{
  unint64_t v2 = sub_25D0A1C9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *TRPCandidateReadyForExecutionMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateReadyForExecutionMessage.init(build:)(a1);
}

void *TRPCandidateReadyForExecutionMessage.init(build:)(void (*a1)(uint64_t))
{
  swift_getObjectType();
  uint64_t v3 = type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0);
  char v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  *(unsigned char *)uint64_t v7 = 14;
  *(void *)(v7 + 8) = 0;
  *(void *)(v7 + 16) = 0;
  uint64_t v8 = v6 - v5 + v4[8];
  uint64_t v9 = sub_25D0BCFE0();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  uint64_t v10 = (void *)(v7 + v4[9]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v7 + v4[10]);
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = v1;
  a1(v7);
  uint64_t v13 = v11[1];
  if (v13)
  {
    unint64_t v14 = &v12[OBJC_IVAR____TtC16SiriMessageTypes36TRPCandidateReadyForExecutionMessage_trpId];
    *(void *)unint64_t v14 = *v11;
    *((void *)v14 + 1) = v13;
    swift_bridgeObjectRetain();

    MEMORY[0x270FA5388](v15);
    *(&v25 - 2) = v7;
    uint64_t v16 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D0A1C94);
    sub_25D0A1308(v7);
  }
  else
  {

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25D0BD240();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B366B88);
    uint64_t v18 = sub_25D0BD230();
    os_log_type_t v19 = sub_25D0BD4B0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v26 = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      uint64_t v22 = sub_25CF695B0();
      uint64_t v25 = sub_25D04E590(v22, v23, &v26);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v18, v19, "Could not build %{public}s: Builder has missing required fields", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v21, -1, -1);
      MEMORY[0x2611A4870](v20, -1, -1);
    }

    sub_25D0A1308(v7);
    type metadata accessor for TRPCandidateReadyForExecutionMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v16;
}

uint64_t type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639F50);
}

uint64_t sub_25D0A1308(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPCandidateReadyForExecutionMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639F40);
}

uint64_t sub_25D0A1384(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t v6 = type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0);
  uint64_t v7 = a2 + *(int *)(v6 + 24);
  uint64_t v8 = type metadata accessor for RequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + *(int *)(v8 + 24));
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(v6 + 28));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = (void *)(a1 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  return result;
}

void *TRPCandidateReadyForExecutionMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateReadyForExecutionMessage.init(from:)(a1);
}

void *TRPCandidateReadyForExecutionMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639F28);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A1C9C();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v12[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for TRPCandidateReadyForExecutionMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes36TRPCandidateReadyForExecutionMessage_trpId];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v12);
    uint64_t v6 = RequestMessageBase.init(from:)(v12);
    uint64_t v10 = OUTLINED_FUNCTION_2();
    v11(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D0A1670(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639F38);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A1C9C();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D0A1800()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for TRPCandidateReadyForExecutionMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  uint64_t v4 = v3;

  uint64_t v7 = v2;
  uint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void TRPCandidateReadyForExecutionMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPCandidateReadyForExecutionMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPCandidateReadyForExecutionMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPCandidateReadyForExecutionMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPCandidateReadyForExecutionMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateReadyForExecutionMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.trpId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateReadyForExecutionMessage.Builder.trpId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateReadyForExecutionMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateReadyForExecutionMessage.Builder.trpId.modify())(void)
{
  return nullsub_1;
}

void TRPCandidateReadyForExecutionMessage.__allocating_init(build:)()
{
}

void TRPCandidateReadyForExecutionMessage.init(build:)()
{
}

uint64_t sub_25D0A1C3C()
{
  return OUTLINED_FUNCTION_1();
}

id TRPCandidateReadyForExecutionMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPCandidateReadyForExecutionMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0A1C94(uint64_t a1)
{
  return sub_25D0A1384(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D0A1C9C()
{
  unint64_t result = qword_26A639F30;
  if (!qword_26A639F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F30);
  }
  return result;
}

uint64_t sub_25D0A1CE8()
{
  return type metadata accessor for TRPCandidateReadyForExecutionMessage(0);
}

uint64_t sub_25D0A1CF0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TRPCandidateReadyForExecutionMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPCandidateReadyForExecutionMessage);
}

uint64_t dispatch thunk of TRPCandidateReadyForExecutionMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for TRPCandidateReadyForExecutionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A1D74);
}

uint64_t sub_25D0A1D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPCandidateReadyForExecutionMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A1E20);
}

uint64_t sub_25D0A1E20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A1EA4()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TRPCandidateReadyForExecutionMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0A1FE4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TRPCandidateReadyForExecutionMessage.CodingKeys()
{
  return &type metadata for TRPCandidateReadyForExecutionMessage.CodingKeys;
}

unint64_t sub_25D0A2020()
{
  unint64_t result = qword_26A639F60;
  if (!qword_26A639F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F60);
  }
  return result;
}

unint64_t sub_25D0A2070()
{
  unint64_t result = qword_26A639F68;
  if (!qword_26A639F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F68);
  }
  return result;
}

unint64_t sub_25D0A20C0()
{
  unint64_t result = qword_26A639F70;
  if (!qword_26A639F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F70);
  }
  return result;
}

uint64_t TRPCandidateRequestMessage.tcuToContextList.getter()
{
  return swift_bridgeObjectRetain();
}

void *TRPCandidateRequestMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateRequestMessage.init(build:)(a1);
}

void *TRPCandidateRequestMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_25D0BCFE0();
  uint64_t v48 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v49 = v9 - v8;
  uint64_t v10 = type metadata accessor for TRPCandidateRequestMessage.Builder(0);
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  unint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *unint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  uint64_t v50 = v7;
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v7);
  uint64_t v16 = &v14[v11[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = (uint64_t *)&v14[v11[10]];
  uint64_t *v17 = 0;
  v17[1] = 0;
  uint64_t v18 = &v14[v11[11]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  uint64_t v19 = v11[12];
  *(void *)&v14[v19] = 0;
  uint64_t v20 = v1;
  a1(v14);
  int v21 = *v14;
  if (v21 == 14 || !*((void *)v14 + 2))
  {

    goto LABEL_6;
  }
  uint64_t v47 = *((void *)v14 + 2);
  uint64_t v46 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v6);
  if (__swift_getEnumTagSinglePayload(v6, 1, v50) == 1)
  {

    sub_25CF69FC0(v6);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    unint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v53 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v52 = sub_25D04E590(v27, v28, &v53);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D0A26F0((uint64_t)v14);
    type metadata accessor for TRPCandidateRequestMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v48 + 32))(v49, v6);
  uint64_t v31 = *((void *)v16 + 1);
  if (!v31 || (v32 = v17[1]) == 0 || (uint64_t v33 = *((void *)v18 + 1), v34 = v49, !v33) || (v35 = *(void *)&v14[v19]) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
    goto LABEL_6;
  }
  uint64_t v45 = *(void *)v16;
  uint64_t ObjectType = *v17;
  uint64_t v36 = *(void *)v18;
  *(void *)&v20[OBJC_IVAR____TtC16SiriMessageTypes26TRPCandidateRequestMessage_tcuToContextList] = v35;
  uint64_t v37 = v47;
  uint64_t v38 = v33;
  uint64_t v39 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v40);
  *((unsigned char *)&v44 - 80) = v21;
  *(&v44 - 9) = v46;
  *(&v44 - 8) = v37;
  uint64_t v41 = v45;
  *(&v44 - 7) = v34;
  *(&v44 - 6) = v41;
  *(&v44 - 5) = v39;
  *(&v44 - 4) = v36;
  uint64_t v42 = ObjectType;
  *(&v44 - 3) = v38;
  *(&v44 - 2) = v42;
  *(&v44 - 1) = v32;
  uint64_t v29 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF8E348);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v43 = v29;
  sub_25D0A26F0((uint64_t)v14);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v34, v50);
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for TRPCandidateRequestMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3629A0);
}

uint64_t sub_25D0A26F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPCandidateRequestMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPCandidateRequestMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364E80);
}

void *TRPCandidateRequestMessage.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateRequestMessage.init(from:)(a1);
}

void *TRPCandidateRequestMessage.init(from:)(uint64_t a1)
{
  uint64_t v3 = qword_26B3645D0;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25D0BD240();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B366B88);
  uint64_t v6 = sub_25D0BD230();
  os_log_type_t v7 = sub_25D0BD4B0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25CF65000, v6, v7, "Error: Attempted to serialize an instance of TRPCandidateRequestMessage, which is not currently codable. Conversation Session State will be empty.", v8, 2u);
    MEMORY[0x2611A4870](v8, -1, -1);
  }

  *(void *)&v4[OBJC_IVAR____TtC16SiriMessageTypes26TRPCandidateRequestMessage_tcuToContextList] = MEMORY[0x263F8EE78];
  sub_25CF68E70(a1, (uint64_t)v11);
  uint64_t v9 = TRPCandidateRequestMessageBase.init(from:)(v11);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t sub_25D0A295C()
{
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_25D0BD5D0();
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for TRPCandidateRequestMessage(0);
  id v1 = objc_msgSendSuper2(&v8, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v9 = v2;
  unint64_t v10 = v4;
  sub_25D0BD390();
  uint64_t v5 = *(void *)&v0[OBJC_IVAR____TtC16SiriMessageTypes26TRPCandidateRequestMessage_tcuToContextList];
  swift_bridgeObjectRetain();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3646A8);
  MEMORY[0x2611A3C30](v5, v6);
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v9;
}

void TRPCandidateRequestMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPCandidateRequestMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateRequestMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPCandidateRequestMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPCandidateRequestMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateRequestMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t TRPCandidateRequestMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.trpCandidateId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TRPCandidateRequestMessage.Builder.trpCandidateId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateRequestMessage.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessage.Builder.tcuToContextList.getter()
{
  type metadata accessor for TRPCandidateRequestMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t TRPCandidateRequestMessage.Builder.tcuToContextList.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_43() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*TRPCandidateRequestMessage.Builder.tcuToContextList.modify())(void)
{
  return nullsub_1;
}

void TRPCandidateRequestMessage.__allocating_init(build:)()
{
}

void TRPCandidateRequestMessage.init(build:)()
{
}

uint64_t sub_25D0A2F64()
{
  return swift_bridgeObjectRelease();
}

id TRPCandidateRequestMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPCandidateRequestMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0A2FBC()
{
  return type metadata accessor for TRPCandidateRequestMessage(0);
}

uint64_t method lookup function for TRPCandidateRequestMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPCandidateRequestMessage);
}

uint64_t dispatch thunk of TRPCandidateRequestMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for TRPCandidateRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A3004);
}

uint64_t sub_25D0A3004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPCandidateRequestMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A30B0);
}

uint64_t sub_25D0A30B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A3134()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t OUTLINED_FUNCTION_1_43()
{
  return type metadata accessor for TRPCandidateRequestMessage.Builder(0);
}

void *TRPCandidateRequestMessageBase.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  sub_25D0BCEC0();
  OUTLINED_FUNCTION_0();
  uint64_t v65 = v4;
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_0();
  uint64_t v64 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v67 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_0();
  uint64_t v68 = v13;
  uint64_t v14 = type metadata accessor for TRPCandidateRequestMessageBase.Builder(0);
  uint64_t v15 = (int *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = (unsigned __int8 *)(v17 - v16);
  *uint64_t v18 = 14;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  uint64_t v19 = v17 - v16 + v15[8];
  uint64_t v69 = v10;
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v10);
  uint64_t v20 = &v18[v15[9]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  int v21 = &v18[v15[10]];
  *(void *)int v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = &v18[v15[11]];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  unint64_t v23 = v1;
  a1(v18);
  int v24 = *v18;
  if (v24 == 14 || (uint64_t v25 = *((void *)v18 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v26 = *((void *)v18 + 1);
  sub_25CF67F88(v19, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v69) == 1)
  {

    sub_25CF69FC0(v9);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25D0BD240();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B366B88);
    unint64_t v28 = sub_25D0BD230();
    os_log_type_t v29 = sub_25D0BD4B0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v71[0] = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v32 = sub_25CF695B0();
      v71[2] = sub_25D04E590(v32, v33, v71);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v28, v29, "Could not build %{public}s: Builder has missing required fields", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v31, -1, -1);
      MEMORY[0x2611A4870](v30, -1, -1);
    }

    sub_25D0A3D0C((uint64_t)v18);
LABEL_11:
    type metadata accessor for TRPCandidateRequestMessageBase(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v62 = v26;
  uint64_t v63 = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v68, v9, v69);
  uint64_t v36 = *((void *)v20 + 1);
  if (!v36 || (uint64_t v37 = *((void *)v21 + 1), v38 = v63, !v37) || (v39 = *((void *)v22 + 1)) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v69);
    goto LABEL_6;
  }
  uint64_t v40 = *(void *)v20;
  uint64_t v60 = *(void *)v21;
  uint64_t v61 = v40;
  uint64_t v41 = *(void *)v22;
  v71[0] = *(void *)v22;
  v71[1] = v39;
  uint64_t v42 = v37;
  uint64_t v43 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t ObjectType = v43;
  swift_bridgeObjectRetain();
  sub_25D0BCEB0();
  sub_25CF844B0();
  uint64_t v44 = sub_25D0BD560();
  unint64_t v46 = v45;
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  swift_bridgeObjectRelease();
  uint64_t v47 = HIBYTE(v46) & 0xF;
  if ((v46 & 0x2000000000000000) == 0) {
    uint64_t v47 = v44 & 0xFFFFFFFFFFFFLL;
  }
  if (!v47)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_25D0BD240();
    __swift_project_value_buffer(v55, (uint64_t)qword_26B366B88);
    uint64_t v56 = sub_25D0BD230();
    os_log_type_t v57 = sub_25D0BD4B0();
    uint64_t v58 = v68;
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_25CF65000, v56, v57, "trpCandidateId is empty, can't create message", v59, 2u);
      MEMORY[0x2611A4870](v59, -1, -1);
    }

    sub_25D0A3D0C((uint64_t)v18);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v58, v69);
    goto LABEL_11;
  }
  uint64_t v48 = (uint64_t *)&v23[OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_trpCandidateId];
  uint64_t v49 = ObjectType;
  *uint64_t v48 = v41;
  v48[1] = v49;
  uint64_t v50 = &v23[OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_userId];
  *(void *)uint64_t v50 = v60;
  *((void *)v50 + 1) = v42;

  MEMORY[0x270FA5388](v51);
  *((unsigned char *)&v60 - 48) = v24;
  *(&v60 - 5) = v62;
  *(&v60 - 4) = v38;
  uint64_t v52 = v68;
  uint64_t v53 = v61;
  *(&v60 - 3) = v68;
  *(&v60 - 2) = v53;
  *(&v60 - 1) = v36;
  uint64_t v34 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v54 = v34;
  sub_25D0A3D0C((uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v52, v69);
  if (v34) {

  }
  return v34;
}

uint64_t type metadata accessor for TRPCandidateRequestMessageBase.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364228);
}

void *TRPCandidateRequestMessageBase.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639F78);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A46CC();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    __swift_destroy_boxed_opaque_existential_1(v15);
    type metadata accessor for TRPCandidateRequestMessageBase(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v16[0]) = 0;
    uint64_t v6 = sub_25D0BD780();
    uint64_t v9 = (uint64_t *)&v5[OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_trpCandidateId];
    uint64_t *v9 = v6;
    v9[1] = v10;
    char v17 = 1;
    sub_25CF89594();
    sub_25D0BD7E0();
    uint64_t v11 = v16[1];
    uint64_t v12 = &v5[OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_userId];
    *(void *)uint64_t v12 = v16[0];
    *((void *)v12 + 1) = v11;

    sub_25CF68E70(v15, (uint64_t)v16);
    uint64_t v7 = RequestMessageBase.init(from:)(v16);
    uint64_t v13 = OUTLINED_FUNCTION_2_15();
    v14(v13);
    __swift_destroy_boxed_opaque_existential_1(v15);
  }
  return v7;
}

uint64_t sub_25D0A3B5C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B364720);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A46CC();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1)
  {
    sub_25CF89668();
    sub_25D0BD8E0();
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void TRPCandidateRequestMessageBase.__allocating_init(build:)()
{
}

uint64_t sub_25D0A3D0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPCandidateRequestMessageBase.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPCandidateRequestMessageBase(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364E90);
}

uint64_t sub_25D0A3D88(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69646E6143707274 && a2 == 0xEE00644965746164;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x644972657375 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D0A3E80(char a1)
{
  if (a1) {
    return 0x644972657375;
  }
  else {
    return 0x69646E6143707274;
  }
}

uint64_t sub_25D0A3EC0()
{
  return sub_25D0A3E80(*v0);
}

uint64_t sub_25D0A3EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A3D88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0A3EF0(uint64_t a1)
{
  unint64_t v2 = sub_25D0A46CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A3F2C(uint64_t a1)
{
  unint64_t v2 = sub_25D0A46CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TRPCandidateRequestMessageBase.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateRequestMessageBase.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_userId + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes30TRPCandidateRequestMessageBase_userId);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *TRPCandidateRequestMessageBase.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateRequestMessageBase.init(build:)(a1);
}

void *TRPCandidateRequestMessageBase.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPCandidateRequestMessageBase.init(from:)(a1);
}

uint64_t sub_25D0A409C()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for TRPCandidateRequestMessageBase(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void TRPCandidateRequestMessageBase.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPCandidateRequestMessageBase.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessageBase.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateRequestMessageBase.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessageBase.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPCandidateRequestMessageBase.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessageBase.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateRequestMessageBase.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessageBase.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t TRPCandidateRequestMessageBase.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.userId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPCandidateRequestMessageBase.Builder.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPCandidateRequestMessageBase.Builder.trpCandidateId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPCandidateRequestMessageBase.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPCandidateRequestMessageBase.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

void TRPCandidateRequestMessageBase.init(build:)()
{
}

uint64_t sub_25D0A45F8()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id TRPCandidateRequestMessageBase.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPCandidateRequestMessageBase(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0A46CC()
{
  unint64_t result = qword_26B364210;
  if (!qword_26B364210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364210);
  }
  return result;
}

uint64_t sub_25D0A4718()
{
  return type metadata accessor for TRPCandidateRequestMessageBase(0);
}

uint64_t sub_25D0A4720()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TRPCandidateRequestMessageBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPCandidateRequestMessageBase);
}

uint64_t dispatch thunk of TRPCandidateRequestMessageBase.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t getEnumTagSinglePayload for TRPCandidateRequestMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A47A4);
}

uint64_t sub_25D0A47A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPCandidateRequestMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A4850);
}

uint64_t sub_25D0A4850(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A48D4()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TRPCandidateRequestMessageBase.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0A4A44);
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

ValueMetadata *type metadata accessor for TRPCandidateRequestMessageBase.CodingKeys()
{
  return &type metadata for TRPCandidateRequestMessageBase.CodingKeys;
}

unint64_t sub_25D0A4A80()
{
  unint64_t result = qword_26A639F80;
  if (!qword_26A639F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F80);
  }
  return result;
}

unint64_t sub_25D0A4AD0()
{
  unint64_t result = qword_26B364220;
  if (!qword_26B364220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364220);
  }
  return result;
}

unint64_t sub_25D0A4B20()
{
  unint64_t result = qword_26B364218;
  if (!qword_26B364218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364218);
  }
  return result;
}

uint64_t TRPDetectedMessage.lastTRPCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t sub_25D0A4B98(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000025D0C63F0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D0A4C20()
{
  return 0xD000000000000012;
}

uint64_t sub_25D0A4C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A4B98(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D0A4C6C(uint64_t a1)
{
  unint64_t v2 = sub_25D0A5AE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A4CA8(uint64_t a1)
{
  unint64_t v2 = sub_25D0A5AE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *TRPDetectedMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TRPDetectedMessage.init(build:)(a1);
}

void *TRPDetectedMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v41 = v9 - v8;
  uint64_t v10 = type metadata accessor for TRPDetectedMessage.Builder(0);
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (unsigned __int8 *)(v13 - v12);
  *uint64_t v14 = 14;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;
  uint64_t v15 = v13 - v12 + v11[8];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v5);
  uint64_t v16 = &v14[v11[9]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  char v17 = &v14[v11[10]];
  *(void *)char v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v1;
  a1(v14);
  int v19 = *v14;
  if (v19 == 14 || (uint64_t v20 = *((void *)v14 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v21 = *((void *)v14 + 1);
  sub_25CF67F88(v15, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    unint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v44 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v43 = sub_25D04E590(v27, v28, &v44);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D0A51D8((uint64_t)v14);
    type metadata accessor for TRPDetectedMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v39 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v41, v2, v5);
  uint64_t v31 = *((void *)v16 + 1);
  if (!v31 || (uint64_t v32 = *((void *)v17 + 1)) == 0)
  {

    OUTLINED_FUNCTION_2_0();
    v38();
    goto LABEL_6;
  }
  uint64_t v33 = *(void *)v16;
  uint64_t v34 = &v18[OBJC_IVAR____TtC16SiriMessageTypes18TRPDetectedMessage_lastTRPCandidateId];
  *(void *)uint64_t v34 = *(void *)v17;
  *((void *)v34 + 1) = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v35);
  *((unsigned char *)&v39 - 48) = v19;
  *(&v39 - 5) = v39;
  *(&v39 - 4) = v20;
  *(&v39 - 3) = v41;
  *(&v39 - 2) = v33;
  *(&v39 - 1) = v31;
  os_log_type_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v36 = v29;
  sub_25D0A51D8((uint64_t)v14);
  OUTLINED_FUNCTION_2_0();
  v37();
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for TRPDetectedMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639FB0);
}

uint64_t sub_25D0A51D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPDetectedMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPDetectedMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A639FA0);
}

void *TRPDetectedMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPDetectedMessage.init(from:)(a1);
}

void *TRPDetectedMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639F88);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A5AE0();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v11[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for TRPDetectedMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes18TRPDetectedMessage_lastTRPCandidateId];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v11);
    uint64_t v6 = RequestMessageBase.init(from:)(v11);
    OUTLINED_FUNCTION_2_0();
    v10();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D0A5494(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A639F98);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A5AE0();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D0A5624()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for TRPDetectedMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void TRPDetectedMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPDetectedMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPDetectedMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPDetectedMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPDetectedMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPDetectedMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPDetectedMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPDetectedMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPDetectedMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPDetectedMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPDetectedMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPDetectedMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPDetectedMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPDetectedMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPDetectedMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPDetectedMessage.Builder.lastTRPCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPDetectedMessage.Builder.lastTRPCandidateId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TRPDetectedMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TRPDetectedMessage.Builder.lastTRPCandidateId.modify())(void)
{
  return nullsub_1;
}

void TRPDetectedMessage.__allocating_init(build:)()
{
}

void TRPDetectedMessage.init(build:)()
{
}

uint64_t sub_25D0A5A88()
{
  return OUTLINED_FUNCTION_1();
}

id TRPDetectedMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPDetectedMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0A5AE0()
{
  unint64_t result = qword_26A639F90;
  if (!qword_26A639F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639F90);
  }
  return result;
}

uint64_t sub_25D0A5B2C()
{
  return type metadata accessor for TRPDetectedMessage(0);
}

uint64_t sub_25D0A5B34()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TRPDetectedMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPDetectedMessage);
}

uint64_t dispatch thunk of TRPDetectedMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for TRPDetectedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A5BB8);
}

uint64_t sub_25D0A5BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPDetectedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A5C64);
}

uint64_t sub_25D0A5C64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A5CE8()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TRPDetectedMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0A5E28);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TRPDetectedMessage.CodingKeys()
{
  return &type metadata for TRPDetectedMessage.CodingKeys;
}

unint64_t sub_25D0A5E64()
{
  unint64_t result = qword_26A639FC0;
  if (!qword_26A639FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639FC0);
  }
  return result;
}

unint64_t sub_25D0A5EB4()
{
  unint64_t result = qword_26A639FC8;
  if (!qword_26A639FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639FC8);
  }
  return result;
}

unint64_t sub_25D0A5F04()
{
  unint64_t result = qword_26A639FD0;
  if (!qword_26A639FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639FD0);
  }
  return result;
}

uint64_t TRPFinalizedMessage.lastTRPCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.finalTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.finalTCUId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t sub_25D0A5FD4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000025D0C63F0 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x5052546C616E6966 && a2 == 0xEA00000000006449;
    if (v5 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x5543546C616E6966 && a2 == 0xEA00000000006449)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_25D0BD940();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_25D0A6128(char a1)
{
  if (!a1) {
    return 0xD000000000000012;
  }
  if (a1 == 1) {
    return 0x5052546C616E6966;
  }
  return 0x5543546C616E6966;
}

uint64_t sub_25D0A618C()
{
  return sub_25D0A6128(*v0);
}

uint64_t sub_25D0A6194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A5FD4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0A61BC(uint64_t a1)
{
  unint64_t v2 = sub_25D0A73B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A61F8(uint64_t a1)
{
  unint64_t v2 = sub_25D0A73B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *TRPFinalizedMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TRPFinalizedMessage.init(build:)(a1);
}

void *TRPFinalizedMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v50 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v47 = v8 - v7;
  uint64_t v9 = type metadata accessor for TRPFinalizedMessage.Builder(0);
  uint64_t v10 = (int *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = (unsigned __int8 *)(v12 - v11);
  uint64_t v14 = &v1[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_lastTRPCandidateId];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0xE000000000000000;
  uint64_t v49 = v14;
  unsigned __int8 *v13 = 14;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  uint64_t v15 = (uint64_t)&v13[v10[8]];
  uint64_t v16 = v4;
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v4);
  char v17 = &v13[v10[9]];
  *(void *)char v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = &v13[v10[10]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  int v19 = &v13[v10[11]];
  *(void *)int v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v13[v10[12]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v21 = v1;
  v50(v13);
  int v22 = *v13;
  if (v22 == 14 || (uint64_t v23 = *((void *)v13 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v50 = (void (*)(unsigned __int8 *))*((void *)v13 + 1);
  sub_25CF67F88(v15, v2);
  uint64_t v24 = v16;
  if (__swift_getEnumTagSinglePayload(v2, 1, v16) == 1)
  {

    sub_25CF69FC0(v2);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_25D0BD240();
    __swift_project_value_buffer(v25, (uint64_t)qword_26B366B88);
    uint64_t v26 = sub_25D0BD230();
    os_log_type_t v27 = sub_25D0BD4B0();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v52 = v29;
      *(_DWORD *)unint64_t v28 = 136446210;
      uint64_t v30 = sub_25CF695B0();
      uint64_t v51 = sub_25D04E590(v30, v31, &v52);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v26, v27, "Could not build %{public}s: Builder has missing required fields", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v29, -1, -1);
      MEMORY[0x2611A4870](v28, -1, -1);
    }

    sub_25D0A67A8((uint64_t)v13);
    swift_bridgeObjectRelease();
    type metadata accessor for TRPFinalizedMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v45 = v23;
  uint64_t v34 = v46;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v47, v2, v24);
  uint64_t v35 = *((void *)v17 + 1);
  if (!v35 || (uint64_t v36 = *((void *)v19 + 1)) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v24);
    goto LABEL_6;
  }
  uint64_t v49 = *(char **)v17;
  uint64_t v37 = &v21[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_finalTRPId];
  *(void *)uint64_t v37 = *(void *)v19;
  *((void *)v37 + 1) = v36;
  uint64_t v38 = *((void *)v20 + 1);
  uint64_t v39 = &v21[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_finalTCUId];
  *(void *)uint64_t v39 = *(void *)v20;
  *((void *)v39 + 1) = v38;
  swift_bridgeObjectRetain();
  uint64_t v40 = v45;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v41);
  *((unsigned char *)&v45 - 48) = v22;
  *(&v45 - 5) = (uint64_t)v50;
  *(&v45 - 4) = v40;
  uint64_t v42 = v47;
  uint64_t v43 = v49;
  *(&v45 - 3) = v47;
  *(&v45 - 2) = (uint64_t)v43;
  *(&v45 - 1) = v35;
  uint64_t v32 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v44 = v32;
  sub_25D0A67A8((uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v42, v24);
  if (v32) {

  }
  return v32;
}

uint64_t type metadata accessor for TRPFinalizedMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3640C8);
}

uint64_t sub_25D0A67A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TRPFinalizedMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TRPFinalizedMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3648F8);
}

void *TRPFinalizedMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TRPFinalizedMessage.init(from:)(a1);
}

void *TRPFinalizedMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639FD8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = &v1[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_lastTRPCandidateId];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  uint64_t v6 = a1[3];
  uint64_t v20 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v6);
  sub_25D0A73B8();
  uint64_t v7 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v9 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    swift_bridgeObjectRelease();
    type metadata accessor for TRPFinalizedMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v8 = sub_25D0BD780();
    uint64_t v11 = (uint64_t *)&v7[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_finalTRPId];
    *uint64_t v11 = v8;
    v11[1] = v12;
    LOBYTE(v19[0]) = 2;
    uint64_t v13 = sub_25D0BD720();
    uint64_t v14 = (uint64_t *)&v7[OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_finalTCUId];
    *uint64_t v14 = v13;
    v14[1] = v15;

    uint64_t v16 = (uint64_t)v20;
    sub_25CF68E70((uint64_t)v20, (uint64_t)v19);
    uint64_t v9 = RequestMessageBase.init(from:)(v19);
    uint64_t v17 = OUTLINED_FUNCTION_2_15();
    v18(v17);
    __swift_destroy_boxed_opaque_existential_1(v16);
  }
  return v9;
}

uint64_t sub_25D0A6AFC(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3646F0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0A73B8();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v2)
  {
    if (*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes19TRPFinalizedMessage_finalTCUId + 8)) {
      sub_25D0BD880();
    }
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
}

uint64_t sub_25D0A6CD4()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for TRPFinalizedMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void TRPFinalizedMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TRPFinalizedMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPFinalizedMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t TRPFinalizedMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TRPFinalizedMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TRPFinalizedMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.Builder.requestId.setter()
{
  OUTLINED_FUNCTION_4_39();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.lastTRPCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.Builder.lastTRPCandidateId.setter()
{
  OUTLINED_FUNCTION_4_39();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.lastTRPCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.finalTRPId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.Builder.finalTRPId.setter()
{
  OUTLINED_FUNCTION_4_39();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.finalTRPId.modify())(void)
{
  return nullsub_1;
}

uint64_t TRPFinalizedMessage.Builder.finalTCUId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TRPFinalizedMessage.Builder.finalTCUId.setter()
{
  OUTLINED_FUNCTION_4_39();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TRPFinalizedMessage.Builder.finalTCUId.modify())(void)
{
  return nullsub_1;
}

void TRPFinalizedMessage.__allocating_init(build:)()
{
}

void TRPFinalizedMessage.init(build:)()
{
}

uint64_t sub_25D0A72BC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id TRPFinalizedMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TRPFinalizedMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0A73B8()
{
  unint64_t result = qword_26B3640B0;
  if (!qword_26B3640B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3640B0);
  }
  return result;
}

uint64_t sub_25D0A7404()
{
  return type metadata accessor for TRPFinalizedMessage(0);
}

uint64_t sub_25D0A740C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TRPFinalizedMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TRPFinalizedMessage);
}

uint64_t dispatch thunk of TRPFinalizedMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t getEnumTagSinglePayload for TRPFinalizedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0A749C);
}

uint64_t sub_25D0A749C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TRPFinalizedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0A7548);
}

uint64_t sub_25D0A7548(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0A75CC()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TRPFinalizedMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0A7740);
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

ValueMetadata *type metadata accessor for TRPFinalizedMessage.CodingKeys()
{
  return &type metadata for TRPFinalizedMessage.CodingKeys;
}

unint64_t sub_25D0A777C()
{
  unint64_t result = qword_26A639FE0;
  if (!qword_26A639FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639FE0);
  }
  return result;
}

unint64_t sub_25D0A77CC()
{
  unint64_t result = qword_26B3640C0;
  if (!qword_26B3640C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3640C0);
  }
  return result;
}

unint64_t sub_25D0A781C()
{
  unint64_t result = qword_26B3640B8;
  if (!qword_26B3640B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3640B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_39()
{
  return type metadata accessor for TRPFinalizedMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_7_27()
{
  return type metadata accessor for TRPFinalizedMessage.Builder(0);
}

uint64_t TCUMappedNLResponse.tcuId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

id TCUMappedNLResponse.nlResponse.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t TCUMappedNLResponse.init(tcuId:nlResponse:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t sub_25D0A78DC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449756374 && a2 == 0xE500000000000000;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F707365526C6ELL && a2 == 0xEA00000000006573)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D0A79C4(char a1)
{
  if (a1) {
    return 0x6E6F707365526C6ELL;
  }
  else {
    return 0x6449756374;
  }
}

uint64_t sub_25D0A79FC()
{
  return sub_25D0A79C4(*v0);
}

uint64_t sub_25D0A7A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A78DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0A7A2C(uint64_t a1)
{
  unint64_t v2 = sub_25D0A7C0C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A7A68(uint64_t a1)
{
  unint64_t v2 = sub_25D0A7C0C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TCUMappedNLResponse.encode(to:)()
{
  OUTLINED_FUNCTION_4_7();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B364760);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_16();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D0A7C0C();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v0)
  {
    type metadata accessor for NLParseResponse(0);
    sub_25D046AC0(&qword_26B364540);
    sub_25D0BD8E0();
  }
  OUTLINED_FUNCTION_2_3();
  v4();
  OUTLINED_FUNCTION_8_3();
}

unint64_t sub_25D0A7C0C()
{
  unint64_t result = qword_26B364580;
  if (!qword_26B364580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364580);
  }
  return result;
}

void TCUMappedNLResponse.init(from:)()
{
  OUTLINED_FUNCTION_4_7();
  unint64_t v2 = v1;
  unsigned int v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639FE8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D0A7C0C();
  sub_25D0BDA20();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_25D0BD780();
    uint64_t v8 = v7;
    type metadata accessor for NLParseResponse(0);
    sub_25D046AC0(&qword_26A637DC0);
    swift_bridgeObjectRetain();
    sub_25D0BD7E0();
    uint64_t v9 = OUTLINED_FUNCTION_5_39();
    v10(v9);
    *unsigned int v4 = v6;
    v4[1] = v8;
    v4[2] = (uint64_t)v12;
    id v11 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);

    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_3();
}

void sub_25D0A7E30()
{
}

void sub_25D0A7E48()
{
}

SiriMessageTypes::TTResponseMessage::MitigationDecision_optional __swiftcall TTResponseMessage.MitigationDecision.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (SiriMessageTypes::TTResponseMessage::MitigationDecision_optional)rawValue;
}

uint64_t TTResponseMessage.MitigationDecision.rawValue.getter()
{
  return *v0;
}

uint64_t sub_25D0A7E7C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025D0C02D0 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6574617453756374 && a2 == 0xEC00000074636944;
    if (v5 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000012 && a2 == 0x800000025D0C1870 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x800000025D0C03E0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v6 = sub_25D0BD940();
      swift_bridgeObjectRelease();
      if (v6) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_25D0A8024(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574617453756374;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25D0A80CC()
{
  return sub_25D0BD3F0();
}

uint64_t sub_25D0A812C()
{
  return sub_25D0BD3D0();
}

SiriMessageTypes::TTResponseMessage::MitigationDecision_optional sub_25D0A817C(Swift::Int *a1)
{
  return TTResponseMessage.MitigationDecision.init(rawValue:)(*a1);
}

uint64_t sub_25D0A8184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TTResponseMessage.MitigationDecision.rawValue.getter();
  *a1 = result;
  return result;
}

unint64_t sub_25D0A81AC()
{
  return sub_25D0A8024(*v0);
}

uint64_t sub_25D0A81B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0A7E7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0A81DC(uint64_t a1)
{
  unint64_t v2 = sub_25D0A9F84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0A8218(uint64_t a1)
{
  unint64_t v2 = sub_25D0A9F84();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TTResponseMessage.tcuMappedNLResponse.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 8);
  unsigned int v4 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 16);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_25D0A8274(v2, v3, v4);
}

void sub_25D0A8274(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v3 = a3;
  }
}

uint64_t TTResponseMessage.tcuStateDict.getter()
{
  return swift_bridgeObjectRetain();
}

void TTResponseMessage.mitigationDecision.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_mitigationDecision);
}

__n128 TTResponseMessage.selectedUserAttributes.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int32 v2 = *(_DWORD *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes + 16);
  unsigned __int16 v3 = *(_WORD *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes + 20);
  __n128 result = *(__n128 *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes);
  *a1 = result;
  a1[1].n128_u16[2] = v3;
  a1[1].n128_u32[0] = v2;
  return result;
}

void *TTResponseMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return TTResponseMessage.init(build:)(a1);
}

void *TTResponseMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  v80 = a1;
  uint64_t ObjectType = (uint64_t *)swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v75 = v3;
  uint64_t v4 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v73 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v74 = v7;
  uint64_t v8 = type metadata accessor for TTResponseMessage.Builder(0);
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = (unsigned __int8 *)(v11 - v10);
  unsigned __int8 *v12 = 14;
  *((void *)v12 + 1) = 0;
  *((void *)v12 + 2) = 0;
  uint64_t v13 = v11 - v10 + v9[8];
  uint64_t v76 = v4;
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v4);
  uint64_t v14 = &v12[v9[9]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v12[v9[10]];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  uint64_t v16 = (uint64_t *)&v12[v9[11]];
  *uint64_t v16 = 0;
  v16[1] = 0;
  v16[2] = 0;
  uint64_t v17 = v9[12];
  *(void *)&v12[v17] = 0;
  uint64_t v72 = v9[13];
  v12[v72] = 4;
  uint64_t v18 = (unint64_t *)&v12[v9[14]];
  *uint64_t v18 = 0;
  v18[1] = 0;
  int v19 = &v12[v9[15]];
  *(void *)int v19 = 0;
  *((void *)v19 + 1) = 0;
  *((_WORD *)v19 + 10) = 2;
  *((_DWORD *)v19 + 4) = 0;
  uint64_t v20 = v1;
  v80(v12);
  uint64_t v21 = *v16;
  uint64_t v22 = v16[1];
  uint64_t v23 = (void (*)(unsigned __int8 *))v16[2];
  uint64_t v79 = *v16;
  v80 = v23;
  int v24 = *v12;
  v78 = v20;
  if (v24 == 14 || (uint64_t v25 = *((void *)v12 + 2)) == 0)
  {
    OUTLINED_FUNCTION_15_17(v21);

    goto LABEL_6;
  }
  int v70 = v24;
  uint64_t v71 = v25;
  uint64_t v69 = *((void *)v12 + 1);
  sub_25CF67F88(v13, v75);
  if (__swift_getEnumTagSinglePayload(v75, 1, v76) == 1)
  {
    sub_25D0A8274(v79, v22, v80);

    sub_25CF69FC0(v75);
LABEL_6:
    uint64_t v26 = v22;
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25D0BD240();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B366B88);
    unint64_t v28 = sub_25D0BD230();
    os_log_type_t v29 = sub_25D0BD4B0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v82 = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v32 = sub_25CF695B0();
      uint64_t v81 = sub_25D04E590(v32, v33, &v82);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v28, v29, "Could not build %{public}s: Builder has missing required fields", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v31, -1, -1);
      MEMORY[0x2611A4870](v30, -1, -1);
    }

    sub_25D0A8AF4(v79, v26, v80);
    sub_25D0A8B38((uint64_t)v12);
    type metadata accessor for TTResponseMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v74, v75, v76);
  uint64_t v36 = *((void *)v14 + 1);
  if (!v36)
  {
    sub_25D0A8274(v79, v22, v80);

    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v76);
    goto LABEL_6;
  }
  uint64_t v37 = (uint64_t *)*((void *)v15 + 1);
  if (!v37 || (uint64_t v38 = *(void *)&v12[v17]) == 0)
  {
    OUTLINED_FUNCTION_15_17(v79);

    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v76);
    goto LABEL_6;
  }
  if (v12[v72] == 4)
  {
    OUTLINED_FUNCTION_15_17(v79);

    OUTLINED_FUNCTION_2_3();
    v39();
    goto LABEL_6;
  }
  int v67 = v12[v72];
  uint64_t ObjectType = v37;
  uint64_t v75 = v36;
  uint64_t v72 = *(void *)v14;
  uint64_t v68 = *(void *)v15;
  unint64_t v40 = v18[1];
  if (v40)
  {
    uint64_t v41 = v22;
    unint64_t v65 = *v18;
    uint64_t v42 = v79;
    sub_25D0A8274(v79, v22, v80);
    swift_bridgeObjectRetain();
    uint64_t v43 = v75;
    swift_bridgeObjectRetain();
    id v44 = ObjectType;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v66 = v40;
  }
  else
  {
    uint64_t v41 = v22;
    OUTLINED_FUNCTION_15_17(v79);
    uint64_t v45 = qword_26B3645D0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v45 != -1) {
      swift_once();
    }
    uint64_t v64 = 0;
    uint64_t v46 = sub_25D0BD240();
    __swift_project_value_buffer(v46, (uint64_t)qword_26B366B88);
    uint64_t v47 = sub_25D0BD230();
    os_log_type_t v48 = sub_25D0BD4B0();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_25CF65000, v47, v48, "Warning: TTResponseMessage being built without UserID. Falling back on default UserID. This may result in issues in multi-user setups.", v49, 2u);
      MEMORY[0x2611A4870](v49, -1, -1);
    }

    unint64_t v65 = 0xD000000000000024;
    unint64_t v66 = 0x800000025D0C14A0;
    uint64_t v42 = v79;
    uint64_t v43 = v75;
    id v44 = ObjectType;
  }
  uint64_t v50 = (uint64_t *)&v20[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse];
  uint64_t v51 = v42;
  *uint64_t v50 = v42;
  v50[1] = v41;
  uint64_t v52 = v80;
  v50[2] = (uint64_t)v80;
  *(void *)&v20[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuStateDict] = v38;
  v20[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_mitigationDecision] = v67;
  LOWORD(v50) = *((_WORD *)v19 + 10);
  int v53 = *((_DWORD *)v19 + 4);
  id v54 = &v20[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes];
  *(_OWORD *)id v54 = *(_OWORD *)v19;
  *((_DWORD *)v54 + 4) = v53;
  *((_WORD *)v54 + 10) = (_WORD)v50;
  sub_25D0A8274(v42, v41, v52);
  swift_bridgeObjectRetain();

  uint64_t ObjectType = &v64;
  MEMORY[0x270FA5388](v55);
  *((unsigned char *)&v64 - 80) = v70;
  uint64_t v56 = v71;
  *(&v64 - 9) = v69;
  *(&v64 - 8) = v56;
  uint64_t v57 = v72;
  *(&v64 - 7) = v74;
  *(&v64 - 6) = v57;
  uint64_t v58 = v68;
  *(&v64 - 5) = v43;
  *(&v64 - 4) = v58;
  unint64_t v59 = v65;
  unint64_t v60 = v66;
  *(&v64 - 3) = (uint64_t)v44;
  *(&v64 - 2) = v59;
  *(&v64 - 1) = v60;
  uint64_t v34 = TRPCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF8E348);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v61 = v34;
  sub_25D0A8AF4(v51, v41, v80);
  sub_25D0A8B38((uint64_t)v12);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_3();
  v63(v62);
  if (v34) {

  }
  return v34;
}

uint64_t type metadata accessor for TTResponseMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364078);
}

void sub_25D0A8AF4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25D0A8B38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTResponseMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TTResponseMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364810);
}

void TTResponseMessage.__allocating_init(from:)()
{
  id v1 = objc_allocWithZone(v0);
  TTResponseMessage.init(from:)();
}

void TTResponseMessage.init(from:)()
{
  OUTLINED_FUNCTION_4_7();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A639FF0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v42 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25D0A9F84();
  uint64_t v5 = v0;
  sub_25D0BDA20();
  if (v1)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    type metadata accessor for TTResponseMessage(0);
    swift_deallocPartialClassInstance();
LABEL_4:
    OUTLINED_FUNCTION_8_3();
    return;
  }
  unint64_t v40 = v5;
  sub_25D0A9FD0();
  sub_25D0BD750();
  uint64_t v6 = v46;
  uint64_t v7 = &v5[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse];
  *(_OWORD *)uint64_t v7 = v45;
  *((void *)v7 + 2) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B364650);
  sub_25D0AA210(&qword_26A63A000);
  sub_25D0BD7E0();
  type metadata accessor for SMTTCUState(0);
  uint64_t v8 = (void *)sub_25D0BD290();
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(v45 + 64);
  uint64_t v39 = v45 + 64;
  uint64_t v43 = v45;
  uint64_t v11 = 1 << *(unsigned char *)(v45 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v41 = (unint64_t)(v11 + 63) >> 6;
  if ((v12 & v10) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  int64_t v44 = v9;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v43 + 48) + 16 * i);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v43 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v45 = v8;
    unint64_t v24 = sub_25CFD867C();
    if (__OFADD__(v8[2], (v25 & 1) == 0))
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v26 = v24;
    char v27 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A008);
    if (sub_25D0BD640())
    {
      unint64_t v28 = sub_25CFD867C();
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_38;
      }
      unint64_t v26 = v28;
    }
    uint64_t v8 = (void *)v45;
    if (v27)
    {
      *(void *)(*(void *)(v45 + 56) + 8 * v26) = v23;
    }
    else
    {
      *(void *)(v45 + 8 * (v26 >> 6) + 64) |= 1 << v26;
      uint64_t v30 = (void *)(v8[6] + 16 * v26);
      *uint64_t v30 = v21;
      v30[1] = v22;
      *(void *)(v8[7] + 8 * v26) = v23;
      uint64_t v31 = v8[2];
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      if (v32) {
        goto LABEL_35;
      }
      v8[2] = v33;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v9 = v44;
    if (v13) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_36;
    }
    if (v16 >= v41) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v39 + 8 * v16);
    int64_t v18 = v9 + 1;
    if (!v17)
    {
      int64_t v18 = v9 + 2;
      if (v9 + 2 >= v41) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v39 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v9 + 3;
        if (v9 + 3 >= v41) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v39 + 8 * v18);
        if (!v17) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v13 = (v17 - 1) & v17;
    int64_t v44 = v18;
  }
  uint64_t v19 = v9 + 4;
  if (v9 + 4 >= v41)
  {
LABEL_33:
    swift_release();
    *(void *)&v40[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuStateDict] = v8;
    sub_25CF998E8();
    OUTLINED_FUNCTION_8_21();
    sub_25D0BD7E0();
    v40[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_mitigationDecision] = v45;
    sub_25D0011DC();
    OUTLINED_FUNCTION_8_21();
    sub_25D0BD750();
    __int16 v34 = WORD2(v46);
    int v35 = v46;
    uint64_t v36 = &v40[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes];
    *(_OWORD *)uint64_t v36 = v45;
    *((_DWORD *)v36 + 4) = v35;
    *((_WORD *)v36 + 10) = v34;

    sub_25CF68E70(v42, (uint64_t)&v45);
    TRPCandidateRequestMessageBase.init(from:)(&v45);
    uint64_t v37 = OUTLINED_FUNCTION_1_44();
    v38(v37);
    __swift_destroy_boxed_opaque_existential_1(v42);
    goto LABEL_4;
  }
  unint64_t v17 = *(void *)(v39 + 8 * v19);
  if (v17)
  {
    int64_t v18 = v9 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v18 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v18 >= v41) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v39 + 8 * v18);
    ++v19;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  sub_25D0BD970();
  __break(1u);
}

void sub_25D0A926C()
{
  OUTLINED_FUNCTION_4_7();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3646E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_16();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25D0A9F84();
  sub_25D0BDA30();
  sub_25D0AA01C();
  sub_25D0BD870();
  if (!v1)
  {
    sub_25D0AA068(*(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuStateDict));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B364650);
    sub_25D0AA210(&qword_26B364658);
    sub_25D0BD8E0();
    swift_release();
    sub_25CF99980();
    OUTLINED_FUNCTION_13_16();
    if (((*(unsigned int *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes + 16) | ((unint64_t)*(unsigned __int16 *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_selectedUserAttributes + 20) << 32)) & 0xFF00000000) != 0x200000000)
    {
      sub_25D001228();
      OUTLINED_FUNCTION_13_16();
    }
    sub_25D0A3B5C(v3);
  }
  uint64_t v5 = OUTLINED_FUNCTION_6();
  v6(v5);
  OUTLINED_FUNCTION_8_3();
}

uint64_t sub_25D0A9550()
{
  uint64_t v1 = v0;
  *(void *)&long long v4 = 0;
  *((void *)&v4 + 1) = 0xE000000000000000;
  sub_25D0BD5D0();
  long long v6 = v4;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TTResponseMessage(0);
  id v2 = objc_msgSendSuper2(&v5, sel_description);
  sub_25D0BD2F0();

  sub_25D0BD390();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_18();
  sub_25D0A8274(*(void *)&v1[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse], *(void *)&v1[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 8], *(void **)&v1[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 16]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3645A0);
  sub_25D0BD330();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  type metadata accessor for SMTTCUState(0);
  swift_bridgeObjectRetain();
  sub_25D0BD280();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_18();
  sub_25D0BD330();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B366568);
  sub_25D0BD330();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  return v6;
}

void TTResponseMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TTResponseMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TTResponseMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TTResponseMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TTResponseMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.sessionId.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 24);
  return sub_25CF67F88(v2, v0);
}

uint64_t TTResponseMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TTResponseMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TTResponseMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TTResponseMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  objc_super v5 = (void *)(v2 + *(int *)(type metadata accessor for TTResponseMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *objc_super v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TTResponseMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.trpCandidateId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t TTResponseMessage.Builder.trpCandidateId.setter(uint64_t a1, uint64_t a2)
{
  objc_super v5 = (void *)(v2 + *(int *)(type metadata accessor for TTResponseMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *objc_super v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TTResponseMessage.Builder.trpCandidateId.modify())(void)
{
  return nullsub_1;
}

void TTResponseMessage.Builder.tcuMappedNLResponse.getter()
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 36));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  objc_super v5 = (void *)v2[2];
  *uint64_t v0 = *v2;
  v0[1] = v4;
  v0[2] = (uint64_t)v5;
  sub_25D0A8274(v3, v4, v5);
}

__n128 TTResponseMessage.Builder.tcuMappedNLResponse.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TTResponseMessage.Builder(0) + 36);
  sub_25D0A8AF4(*(void *)v3, *(void *)(v3 + 8), *(void **)(v3 + 16));
  __n128 result = v5;
  *(__n128 *)uint64_t v3 = v5;
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t (*TTResponseMessage.Builder.tcuMappedNLResponse.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.tcuStateDict.getter()
{
  type metadata accessor for TTResponseMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t TTResponseMessage.Builder.tcuStateDict.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_2_37() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*TTResponseMessage.Builder.tcuStateDict.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.mitigationDecision.getter()
{
  uint64_t result = OUTLINED_FUNCTION_10_21();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t TTResponseMessage.Builder.mitigationDecision.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for TTResponseMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*TTResponseMessage.Builder.mitigationDecision.modify())(void)
{
  return nullsub_1;
}

uint64_t TTResponseMessage.Builder.userId.getter()
{
  char v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 48));
  uint64_t v3 = v2[1];
  *uint64_t v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TTResponseMessage.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for TTResponseMessage.Builder(0) + 48));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*TTResponseMessage.Builder.userId.modify())(void)
{
  return nullsub_1;
}

__n128 TTResponseMessage.Builder.selectedUserAttributes.getter()
{
  uint64_t v2 = (__n128 *)(v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 52));
  unsigned __int32 v3 = v2[1].n128_u32[0];
  unsigned __int16 v4 = v2[1].n128_u16[2];
  __n128 result = *v2;
  *uint64_t v0 = *v2;
  v0[1].n128_u16[2] = v4;
  v0[1].n128_u32[0] = v3;
  return result;
}

uint64_t TTResponseMessage.Builder.selectedUserAttributes.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  int v4 = *((_DWORD *)a1 + 4);
  __int16 v5 = *((_WORD *)a1 + 10);
  uint64_t result = type metadata accessor for TTResponseMessage.Builder(0);
  uint64_t v7 = v1 + *(int *)(result + 52);
  *(void *)uint64_t v7 = v2;
  *(void *)(v7 + 8) = v3;
  *(_WORD *)(v7 + 20) = v5;
  *(_DWORD *)(v7 + 16) = v4;
  return result;
}

uint64_t (*TTResponseMessage.Builder.selectedUserAttributes.modify())(void)
{
  return nullsub_1;
}

void TTResponseMessage.__allocating_init(build:)()
{
}

void TTResponseMessage.init(build:)()
{
}

uint64_t sub_25D0A9EB0()
{
  sub_25D0A8AF4(*(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse), *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 8), *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse + 16));
  return swift_bridgeObjectRelease();
}

id TTResponseMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTResponseMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0A9F84()
{
  unint64_t result = qword_26B364050;
  if (!qword_26B364050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364050);
  }
  return result;
}

unint64_t sub_25D0A9FD0()
{
  unint64_t result = qword_26A639FF8;
  if (!qword_26A639FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A639FF8);
  }
  return result;
}

unint64_t sub_25D0AA01C()
{
  unint64_t result = qword_26B364598;
  if (!qword_26B364598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364598);
  }
  return result;
}

uint64_t sub_25D0AA068(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3646D8);
  uint64_t result = sub_25D0BD6A0();
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
    int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    uint64_t v18 = *v16;
    uint64_t result = v16[1];
    *(void *)(v10 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v19 = (void *)(v3[6] + 16 * i);
    void *v19 = v18;
    v19[1] = result;
    *(void *)(v3[7] + 8 * i) = v17;
    uint64_t v20 = v3[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v22;
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
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
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25D0AA210(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B364650);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25D0AA27C()
{
  unint64_t result = qword_26A63A010;
  if (!qword_26A63A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A010);
  }
  return result;
}

void destroy for TCUMappedNLResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 16);
}

void *_s16SiriMessageTypes19TCUMappedNLResponseVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  int64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for TCUMappedNLResponse(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for TCUMappedNLResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

ValueMetadata *type metadata accessor for TCUMappedNLResponse()
{
  return &type metadata for TCUMappedNLResponse;
}

uint64_t sub_25D0AA400()
{
  return type metadata accessor for TTResponseMessage(0);
}

uint64_t sub_25D0AA408()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for TTResponseMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTResponseMessage);
}

uint64_t dispatch thunk of TTResponseMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

ValueMetadata *type metadata accessor for TTResponseMessage.MitigationDecision()
{
  return &type metadata for TTResponseMessage.MitigationDecision;
}

void *initializeBufferWithCopyOfBuffer for TTResponseMessage.Builder(void *a1, void *a2, int *a3)
{
  int64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *int64_t v4 = *a2;
    int64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    int64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    int64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *int64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (void *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[9];
    uint64_t v23 = (void *)((char *)v4 + v22);
    unint64_t v24 = (void *)((char *)a2 + v22);
    uint64_t v25 = *(void *)((char *)a2 + v22 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v25)
    {
      *uint64_t v23 = *v24;
      v23[1] = v25;
      unint64_t v26 = (void *)v24[2];
      v23[2] = v26;
      swift_bridgeObjectRetain();
      id v27 = v26;
    }
    else
    {
      *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
      v23[2] = v24[2];
    }
    uint64_t v28 = a3[11];
    *(void *)((char *)v4 + a3[10]) = *(void *)((char *)a2 + a3[10]);
    *((unsigned char *)v4 + v28) = *((unsigned char *)a2 + v28);
    uint64_t v29 = a3[12];
    uint64_t v30 = a3[13];
    uint64_t v31 = (void *)((char *)v4 + v29);
    BOOL v32 = (void *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    __int16 v34 = (char *)v4 + v30;
    int v35 = (char *)a2 + v30;
    *(void *)(v34 + 14) = *(void *)(v35 + 14);
    *(_OWORD *)__int16 v34 = *(_OWORD *)v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TTResponseMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  if (*(void *)(v6 + 8))
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  int64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = *(void *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23)
  {
    void *v21 = *v22;
    v21[1] = v23;
    unint64_t v24 = (void *)v22[2];
    v21[2] = v24;
    swift_bridgeObjectRetain();
    id v25 = v24;
  }
  else
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    v21[2] = v22[2];
  }
  uint64_t v26 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v26) = *(unsigned char *)(a2 + v26);
  uint64_t v27 = a3[12];
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a1 + v28;
  uint64_t v33 = a2 + v28;
  *(void *)(v32 + 14) = *(void *)(v33 + 14);
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = *(void *)(a1 + v20 + 8);
  uint64_t v24 = *(void *)(a2 + v20 + 8);
  if (v23)
  {
    if (v24)
    {
      void *v21 = *v22;
      v21[1] = v22[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      id v25 = (void *)v22[2];
      uint64_t v26 = (void *)v21[2];
      v21[2] = v25;
      id v27 = v25;
    }
    else
    {
      sub_25D0AAC68((uint64_t)v21);
      uint64_t v30 = v22[2];
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      v21[2] = v30;
    }
  }
  else if (v24)
  {
    void *v21 = *v22;
    v21[1] = v22[1];
    uint64_t v28 = (void *)v22[2];
    v21[2] = v28;
    swift_bridgeObjectRetain();
    id v29 = v28;
  }
  else
  {
    long long v31 = *(_OWORD *)v22;
    v21[2] = v22[2];
    *(_OWORD *)uint64_t v21 = v31;
  }
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v32 = a3[12];
  uint64_t v33 = (void *)(a1 + v32);
  __int16 v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[13];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = (long long *)(a2 + v35);
  long long v38 = *v37;
  *(void *)(v36 + 14) = *(void *)((char *)v37 + 14);
  *(_OWORD *)uint64_t v36 = v38;
  return a1;
}

uint64_t sub_25D0AAC68(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v16 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v17 = a3[13];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)(v18 + 14) = *(void *)(v19 + 14);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  return a1;
}

uint64_t assignWithTake for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  if (!*(void *)(a1 + v25 + 8))
  {
LABEL_11:
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    *(void *)(v26 + 16) = *(void *)(v27 + 16);
    goto LABEL_12;
  }
  uint64_t v28 = *(void *)(v27 + 8);
  if (!v28)
  {
    sub_25D0AAC68(v26);
    goto LABEL_11;
  }
  *(void *)uint64_t v26 = *(void *)v27;
  *(void *)(v26 + 8) = v28;
  swift_bridgeObjectRelease();
  id v29 = *(void **)(v26 + 16);
  *(void *)(v26 + 16) = *(void *)(v27 + 16);

LABEL_12:
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  long long v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[13];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
  *(void *)(v36 + 14) = *(void *)(v37 + 14);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0AB064);
}

uint64_t sub_25D0AB064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TTResponseMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0AB110);
}

uint64_t sub_25D0AB110(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0AB194()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *_s16SiriMessageTypes17TTResponseMessageC18MitigationDecisionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0AB32CLL);
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

ValueMetadata *type metadata accessor for TTResponseMessage.CodingKeys()
{
  return &type metadata for TTResponseMessage.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TCUMappedNLResponse.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0AB430);
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

ValueMetadata *type metadata accessor for TCUMappedNLResponse.CodingKeys()
{
  return &type metadata for TCUMappedNLResponse.CodingKeys;
}

unint64_t sub_25D0AB46C()
{
  unint64_t result = qword_26A63A018;
  if (!qword_26A63A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A018);
  }
  return result;
}

unint64_t sub_25D0AB4BC()
{
  unint64_t result = qword_26A63A020;
  if (!qword_26A63A020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A020);
  }
  return result;
}

unint64_t sub_25D0AB50C()
{
  unint64_t result = qword_26B364060;
  if (!qword_26B364060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364060);
  }
  return result;
}

unint64_t sub_25D0AB55C()
{
  unint64_t result = qword_26B364058;
  if (!qword_26B364058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364058);
  }
  return result;
}

unint64_t sub_25D0AB5AC()
{
  unint64_t result = qword_26B364590;
  if (!qword_26B364590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364590);
  }
  return result;
}

unint64_t sub_25D0AB5FC()
{
  unint64_t result = qword_26B364588;
  if (!qword_26B364588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364588);
  }
  return result;
}

unint64_t sub_25D0AB648()
{
  unint64_t result = qword_26B364070;
  if (!qword_26B364070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B364070);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_37()
{
  return type metadata accessor for TTResponseMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_5_39()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_21()
{
  return type metadata accessor for TTResponseMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return sub_25D0BD390();
}

uint64_t OUTLINED_FUNCTION_13_16()
{
  return sub_25D0BD8E0();
}

void OUTLINED_FUNCTION_15_17(uint64_t a1)
{
  unsigned int v4 = *(void **)(v2 - 112);
  sub_25D0A8274(a1, v1, v4);
}

uint64_t TypingStartedMessage.typingSessionId.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF67F88(v1 + OBJC_IVAR____TtC16SiriMessageTypes20TypingStartedMessage_typingSessionId, a1);
}

void *TypingStartedMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TypingStartedMessage.init(from:)(a1);
}

void *TypingStartedMessage.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A028);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0ABA3C();
  id v8 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v9 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for TypingStartedMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D0BCFE0();
    sub_25CFA2094(&qword_26A637400);
    sub_25D0BD750();
    sub_25D0ABAA8(v14, (uint64_t)v8 + OBJC_IVAR____TtC16SiriMessageTypes20TypingStartedMessage_typingSessionId);

    sub_25CF68E70((uint64_t)a1, (uint64_t)v13);
    uint64_t v9 = SessionMessageBase.init(from:)(v13);
    uint64_t v11 = OUTLINED_FUNCTION_4();
    v12(v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v9;
}

unint64_t sub_25D0ABA3C()
{
  unint64_t result = qword_26A63A030;
  if (!qword_26A63A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A030);
  }
  return result;
}

uint64_t type metadata accessor for TypingStartedMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A040);
}

uint64_t sub_25D0ABAA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D0ABB10(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A038);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0ABA3C();
  sub_25D0BDA30();
  sub_25D0BCFE0();
  sub_25CFA2094(&qword_26B3647C0);
  sub_25D0BD870();
  if (!v1) {
    sub_25D04DC04(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D0ABC6C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6553676E69707974 && a2 == 0xEF64496E6F697373)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D0ABD0C()
{
  return 0x6553676E69707974;
}

uint64_t sub_25D0ABD34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0ABC6C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D0ABD60(uint64_t a1)
{
  unint64_t v2 = sub_25D0ABA3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0ABD9C(uint64_t a1)
{
  unint64_t v2 = sub_25D0ABA3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *TypingStartedMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return TypingStartedMessage.init(build:)(a1);
}

void *TypingStartedMessage.init(build:)(void (*a1)(uint64_t))
{
  uint64_t v3 = type metadata accessor for TypingStartedMessage.Builder(0);
  char v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_25D0BCFE0();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  *(unsigned char *)(v7 + v4[7]) = 14;
  uint64_t v9 = (void *)(v7 + v4[8]);
  void *v9 = 0;
  v9[1] = 0;
  __swift_storeEnumTagSinglePayload(v7 + v4[9], 1, 1, v8);
  id v10 = v1;
  a1(v7);
  sub_25CF67F88(v7, (uint64_t)v10 + OBJC_IVAR____TtC16SiriMessageTypes20TypingStartedMessage_typingSessionId);

  uint64_t v11 = SessionMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D0AC008);
  sub_25D0AC010(v7);
  return v11;
}

uint64_t type metadata accessor for TypingStartedMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A050);
}

uint64_t sub_25D0ABF6C(uint64_t a1, uint64_t a2)
{
  char v4 = (int *)type metadata accessor for TypingStartedMessage.Builder(0);
  *(unsigned char *)a1 = *(unsigned char *)(a2 + v4[5]);
  uint64_t v5 = (uint64_t *)(a2 + v4[6]);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v6;
  uint64_t v8 = a2 + v4[7];
  uint64_t v9 = a1 + *(int *)(type metadata accessor for SessionMessageBase.Builder(0) + 24);
  return sub_25CF68ED4(v8, v9);
}

uint64_t sub_25D0AC008(uint64_t a1)
{
  return sub_25D0ABF6C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25D0AC010(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TypingStartedMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TypingStartedMessage.Builder.typingSessionId.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25CF67F88(v1, a1);
}

uint64_t TypingStartedMessage.Builder.typingSessionId.setter(uint64_t a1)
{
  return sub_25CF67FF0(a1, v1);
}

uint64_t (*TypingStartedMessage.Builder.typingSessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t TypingStartedMessage.Builder.source.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for TypingStartedMessage.Builder(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t TypingStartedMessage.Builder.source.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for TypingStartedMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t (*TypingStartedMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t TypingStartedMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TypingStartedMessage.Builder(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TypingStartedMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TypingStartedMessage.Builder(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TypingStartedMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t TypingStartedMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TypingStartedMessage.Builder(0) + 28);
  return sub_25CF67F88(v3, a1);
}

uint64_t TypingStartedMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TypingStartedMessage.Builder(0) + 28);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*TypingStartedMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

void TypingStartedMessage.__allocating_init(build:)()
{
}

void TypingStartedMessage.init(build:)()
{
}

uint64_t sub_25D0AC34C()
{
  return sub_25CF69FC0(v0 + OBJC_IVAR____TtC16SiriMessageTypes20TypingStartedMessage_typingSessionId);
}

id TypingStartedMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TypingStartedMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0AC3A4()
{
  return type metadata accessor for TypingStartedMessage(0);
}

void sub_25D0AC3AC()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TypingStartedMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TypingStartedMessage);
}

uint64_t dispatch thunk of TypingStartedMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t getEnumTagSinglePayload for TypingStartedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0AC47C);
}

uint64_t sub_25D0AC47C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TypingStartedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0AC530);
}

void sub_25D0AC530(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
}

void sub_25D0AC5C0()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TypingStartedMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0AC6FCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TypingStartedMessage.CodingKeys()
{
  return &type metadata for TypingStartedMessage.CodingKeys;
}

unint64_t sub_25D0AC738()
{
  unint64_t result = qword_26A63A060;
  if (!qword_26A63A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A060);
  }
  return result;
}

unint64_t sub_25D0AC788()
{
  unint64_t result = qword_26A63A068;
  if (!qword_26A63A068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A068);
  }
  return result;
}

unint64_t sub_25D0AC7D8()
{
  unint64_t result = qword_26A63A070;
  if (!qword_26A63A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A070);
  }
  return result;
}

void sub_25D0AC824()
{
  qword_26A63A078 = 0x6873696C676E65;
  unk_26A63A080 = 0xE700000000000000;
}

uint64_t static Languages.english.getter()
{
  return sub_25D0AC8B8(&qword_26A636AF8, &qword_26A63A078);
}

void sub_25D0AC870()
{
  qword_26A63A088 = 0x726568746FLL;
  unk_26A63A090 = 0xE500000000000000;
}

uint64_t static Languages.others.getter()
{
  return sub_25D0AC8B8(&qword_26A636B00, &qword_26A63A088);
}

uint64_t sub_25D0AC8B8(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t UnsupportedLanguageDetectedMessage.languageDetected.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t sub_25D0AC938(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025D0C66B0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_25D0BD940();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25D0AC9C0()
{
  return 0xD000000000000010;
}

uint64_t sub_25D0AC9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0AC938(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D0ACA0C(uint64_t a1)
{
  unint64_t v2 = sub_25D0AD7B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0ACA48(uint64_t a1)
{
  unint64_t v2 = sub_25D0AD7B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *UnsupportedLanguageDetectedMessage.__allocating_init(build:)(void (*a1)(uint64_t))
{
  id v3 = objc_allocWithZone(v1);
  return UnsupportedLanguageDetectedMessage.init(build:)(a1);
}

void *UnsupportedLanguageDetectedMessage.init(build:)(void (*a1)(uint64_t))
{
  swift_getObjectType();
  uint64_t v3 = type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0);
  unsigned int v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  *(unsigned char *)uint64_t v7 = 14;
  *(void *)(v7 + 8) = 0;
  *(void *)(v7 + 16) = 0;
  uint64_t v8 = v6 - v5 + v4[8];
  uint64_t v9 = sub_25D0BCFE0();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  int v10 = (void *)(v7 + v4[9]);
  *int v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v7 + v4[10]);
  *uint64_t v11 = 0;
  v11[1] = 0;
  int v12 = v1;
  a1(v7);
  uint64_t v13 = v11[1];
  if (v13)
  {
    uint64_t v14 = &v12[OBJC_IVAR____TtC16SiriMessageTypes34UnsupportedLanguageDetectedMessage_languageDetected];
    *(void *)uint64_t v14 = *v11;
    *((void *)v14 + 1) = v13;
    swift_bridgeObjectRetain();

    MEMORY[0x270FA5388](v15);
    *(&v25 - 2) = v7;
    uint64_t v16 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D0AD7B0);
    sub_25D0ACDFC(v7);
  }
  else
  {

    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25D0BD240();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B366B88);
    uint64_t v18 = sub_25D0BD230();
    os_log_type_t v19 = sub_25D0BD4B0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v26 = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      uint64_t v22 = sub_25CF695B0();
      uint64_t v25 = sub_25D04E590(v22, v23, &v26);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v18, v19, "Could not build %{public}s: Builder has missing required fields", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v21, -1, -1);
      MEMORY[0x2611A4870](v20, -1, -1);
    }

    sub_25D0ACDFC(v7);
    type metadata accessor for UnsupportedLanguageDetectedMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v16;
}

uint64_t type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A0B0);
}

uint64_t sub_25D0ACDFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UnsupportedLanguageDetectedMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B366228);
}

uint64_t sub_25D0ACE78(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  uint64_t v6 = type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0);
  uint64_t v7 = a2 + *(int *)(v6 + 24);
  uint64_t v8 = type metadata accessor for RequestMessageBase.Builder(0);
  sub_25CF68ED4(v7, a1 + *(int *)(v8 + 24));
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(v6 + 28));
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  int v12 = (void *)(a1 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = v11;
  v12[1] = v10;
  return result;
}

void *UnsupportedLanguageDetectedMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UnsupportedLanguageDetectedMessage.init(from:)(a1);
}

void *UnsupportedLanguageDetectedMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A098);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0AD7B8();
  uint64_t v4 = v1;
  sub_25D0BDA20();
  if (v12[6])
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for UnsupportedLanguageDetectedMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v5 = sub_25D0BD780();
    uint64_t v8 = (uint64_t *)&v4[OBJC_IVAR____TtC16SiriMessageTypes34UnsupportedLanguageDetectedMessage_languageDetected];
    uint64_t *v8 = v5;
    v8[1] = v9;

    sub_25CF68E70((uint64_t)a1, (uint64_t)v12);
    uint64_t v6 = RequestMessageBase.init(from:)(v12);
    uint64_t v10 = OUTLINED_FUNCTION_2();
    v11(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_25D0AD164(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A0A8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0AD7B8();
  sub_25D0BDA30();
  sub_25D0BD880();
  if (!v1) {
    sub_25D0292F0(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25D0AD2F4()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for UnsupportedLanguageDetectedMessage(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

void UnsupportedLanguageDetectedMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *UnsupportedLanguageDetectedMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*UnsupportedLanguageDetectedMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UnsupportedLanguageDetectedMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*UnsupportedLanguageDetectedMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UnsupportedLanguageDetectedMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.languageDetected.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t UnsupportedLanguageDetectedMessage.Builder.languageDetected.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for UnsupportedLanguageDetectedMessage.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UnsupportedLanguageDetectedMessage.Builder.languageDetected.modify())(void)
{
  return nullsub_1;
}

void UnsupportedLanguageDetectedMessage.__allocating_init(build:)()
{
}

void UnsupportedLanguageDetectedMessage.init(build:)()
{
}

uint64_t sub_25D0AD758()
{
  return OUTLINED_FUNCTION_1();
}

id UnsupportedLanguageDetectedMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnsupportedLanguageDetectedMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0AD7B0(uint64_t a1)
{
  return sub_25D0ACE78(a1, *(void *)(v1 + 16));
}

unint64_t sub_25D0AD7B8()
{
  unint64_t result = qword_26A63A0A0;
  if (!qword_26A63A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Languages()
{
  return &type metadata for Languages;
}

uint64_t sub_25D0AD814()
{
  return type metadata accessor for UnsupportedLanguageDetectedMessage(0);
}

uint64_t sub_25D0AD81C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for UnsupportedLanguageDetectedMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UnsupportedLanguageDetectedMessage);
}

uint64_t dispatch thunk of UnsupportedLanguageDetectedMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t getEnumTagSinglePayload for UnsupportedLanguageDetectedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0AD8A0);
}

uint64_t sub_25D0AD8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for UnsupportedLanguageDetectedMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0AD94C);
}

uint64_t sub_25D0AD94C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0AD9D0()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for UnsupportedLanguageDetectedMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0ADB10);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsupportedLanguageDetectedMessage.CodingKeys()
{
  return &type metadata for UnsupportedLanguageDetectedMessage.CodingKeys;
}

unint64_t sub_25D0ADB4C()
{
  unint64_t result = qword_26A63A0C0;
  if (!qword_26A63A0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0C0);
  }
  return result;
}

unint64_t sub_25D0ADB9C()
{
  unint64_t result = qword_26A63A0C8;
  if (!qword_26A63A0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0C8);
  }
  return result;
}

unint64_t sub_25D0ADBEC()
{
  unint64_t result = qword_26A63A0D0;
  if (!qword_26A63A0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0D0);
  }
  return result;
}

void *sub_25D0ADC38(void *a1, unsigned __int8 *a2)
{
  return sub_25D0ADC90(a1, a2, type metadata accessor for GestureBasedResultCandidateMessage.Builder, (void (*)(unsigned __int8 *))sub_25D0AE924);
}

void *sub_25D0ADC64(void *a1, unsigned __int8 *a2)
{
  return sub_25D0ADC90(a1, a2, type metadata accessor for IFGestureBasedCandidateMessage.Builder, (void (*)(unsigned __int8 *))sub_25D0AE924);
}

void *sub_25D0ADC90(void *a1, unsigned __int8 *a2, uint64_t (*a3)(void), void (*a4)(unsigned __int8 *))
{
  id v54 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v58 = v8;
  uint64_t v9 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v59 = v12;
  uint64_t v13 = type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v17 = (unsigned __int8 *)(v16 - v15);
  unsigned __int8 *v17 = 14;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  uint64_t v18 = v16 - v15 + v14[8];
  uint64_t v57 = v9;
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v9);
  os_log_type_t v19 = &v17[v14[9]];
  *(void *)os_log_type_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v17[v14[10]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v21 = &v17[v14[11]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  unsigned __int8 *v17 = *a2;
  uint64_t v22 = *((void *)a2 + 2);
  *((void *)v17 + 1) = *((void *)a2 + 1);
  *((void *)v17 + 2) = v22;
  unint64_t v23 = (int *)a3(0);
  uint64_t v24 = (uint64_t)&a2[v23[6]];
  swift_bridgeObjectRetain();
  unint64_t v60 = a1;
  uint64_t v55 = v18;
  sub_25CF68ED4(v24, v18);
  uint64_t v25 = &a2[v23[7]];
  uint64_t v26 = *(void *)v25;
  uint64_t v27 = *((void *)v25 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)os_log_type_t v19 = v26;
  *((void *)v19 + 1) = v27;
  uint64_t v28 = &a2[v23[8]];
  uint64_t v29 = *(void *)v28;
  uint64_t v30 = *((void *)v28 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)uint64_t v20 = v29;
  *((void *)v20 + 1) = v30;
  long long v31 = &a2[v23[9]];
  uint64_t v33 = *(void *)v31;
  uint64_t v32 = *((void *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)uint64_t v21 = v33;
  *((void *)v21 + 1) = v32;
  int v34 = *v17;
  if (v34 == 14 || (v51 = v29, v52 = v26, v53 = v27, uint64_t v35 = v57, (v36 = *((void *)v17 + 2)) == 0))
  {

    sub_25D0AE4C4((uint64_t)v17);
    goto LABEL_6;
  }
  uint64_t v50 = *((void *)v17 + 1);
  sub_25CF67F88(v55, v58);
  if (__swift_getEnumTagSinglePayload(v58, 1, v57) == 1)
  {

    sub_25D0AE4C4((uint64_t)v17);
    sub_25CF69FC0(v58);
LABEL_6:
    type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v55 = v36;
  uint64_t v39 = v56;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v59, v58, v57);
  uint64_t v40 = v53;
  if (!v53 || !v30 || !v32)
  {

    sub_25D0AE4C4((uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v59, v57);
    goto LABEL_6;
  }
  id v41 = v60;
  uint64_t v42 = &v60[OBJC_IVAR____TtC16SiriMessageTypes37UserIdAwareResultCandidateMessageBase_userId];
  *(void *)uint64_t v42 = v33;
  *((void *)v42 + 1) = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v43 = v55;
  swift_bridgeObjectRetain();

  uint64_t v44 = v59;
  MEMORY[0x270FA5388](v45);
  *((unsigned char *)&v49 - 64) = v34;
  *(&v49 - 7) = v50;
  *(&v49 - 6) = v43;
  uint64_t v46 = v52;
  *(&v49 - 5) = v44;
  *(&v49 - 4) = v46;
  uint64_t v47 = v51;
  *(&v49 - 3) = v40;
  *(&v49 - 2) = v47;
  *(&v49 - 1) = v30;
  uint64_t v37 = ResultCandidateRequestMessageBase.init(build:)(v54);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v48 = v37;
  sub_25D0AE4C4((uint64_t)v17);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v44, v35);
  if (v37) {

  }
  return v37;
}

void *UserIdAwareResultCandidateMessageBase.init(build:)(void (*a1)(unsigned __int8 *), uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v36 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_2();
  unsigned int v4 = (void (*)(unsigned __int8 *))sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = (int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) - 8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3();
  uint64_t v12 = (unsigned __int8 *)(v11 - v10);
  unsigned __int8 *v12 = 14;
  *((void *)v12 + 1) = 0;
  *((void *)v12 + 2) = 0;
  uint64_t v13 = v11 - v10 + v9[8];
  __swift_storeEnumTagSinglePayload(v13, 1, 1, (uint64_t)v4);
  uint64_t v14 = &v12[v9[9]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v12[v9[10]];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  uint64_t v16 = &v12[v9[11]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = v2;
  v36(v12);
  int v18 = *v12;
  if (v18 == 14 || (v35 = v8, v36 = v4, (uint64_t v19 = *((void *)v12 + 2)) == 0))
  {

    sub_25D0AE4C4((uint64_t)v12);
    goto LABEL_6;
  }
  uint64_t v33 = *((void *)v12 + 1);
  sub_25CF67F88(v13, v3);
  if (__swift_getEnumTagSinglePayload(v3, 1, (uint64_t)v36) == 1)
  {

    sub_25D0AE4C4((uint64_t)v12);
    sub_25CF69FC0(v3);
LABEL_6:
    type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v32 = v19;
  (*(void (**)(uint64_t, uint64_t, void (*)(unsigned __int8 *)))(v34 + 32))(v35, v3, v36);
  uint64_t v22 = *((void *)v14 + 1);
  if (!v22 || (uint64_t v23 = *((void *)v15 + 1)) == 0 || (v24 = *((void *)v16 + 1)) == 0)
  {

    sub_25D0AE4C4((uint64_t)v12);
    (*(void (**)(uint64_t, void (*)(unsigned __int8 *)))(v34 + 8))(v35, v36);
    goto LABEL_6;
  }
  uint64_t v25 = *(void *)v14;
  uint64_t v26 = *(void *)v15;
  uint64_t v27 = &v17[OBJC_IVAR____TtC16SiriMessageTypes37UserIdAwareResultCandidateMessageBase_userId];
  *(void *)uint64_t v27 = *(void *)v16;
  *((void *)v27 + 1) = v24;
  uint64_t v28 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388]();
  *((unsigned char *)&v31 - 64) = v18;
  *(&v31 - 7) = v33;
  *(&v31 - 6) = v28;
  uint64_t v29 = v35;
  *(&v31 - 5) = v35;
  *(&v31 - 4) = v25;
  *(&v31 - 3) = v22;
  *(&v31 - 2) = v26;
  *(&v31 - 1) = v23;
  uint64_t v20 = ResultCandidateRequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25D0AE924);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v30 = v20;
  sub_25D0AE4C4((uint64_t)v12);
  (*(void (**)(uint64_t, void (*)(unsigned __int8 *)))(v34 + 8))(v29, v36);
  if (v20) {

  }
  return v20;
}

uint64_t type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, qword_26B365180);
}

uint64_t sub_25D0AE4C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UserIdAwareResultCandidateMessageBase(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B365220);
}

void *UserIdAwareResultCandidateMessageBase.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A0D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3();
  uint64_t v4 = a1[3];
  uint64_t v14 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_25D0AE928();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v6 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25CF89594();
    sub_25D0BD7E0();
    uint64_t v8 = v13[1];
    uint64_t v9 = &v5[OBJC_IVAR____TtC16SiriMessageTypes37UserIdAwareResultCandidateMessageBase_userId];
    *(void *)uint64_t v9 = v13[0];
    *((void *)v9 + 1) = v8;

    uint64_t v10 = (uint64_t)v14;
    sub_25CF68E70((uint64_t)v14, (uint64_t)v13);
    uint64_t v6 = ResultCandidateRequestMessageBase.init(from:)(v13);
    uint64_t v11 = OUTLINED_FUNCTION_1_4();
    v12(v11);
    __swift_destroy_boxed_opaque_existential_1(v10);
  }
  return v6;
}

uint64_t sub_25D0AE75C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3656C8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0AE928();
  sub_25D0BDA30();
  sub_25CF89668();
  sub_25D0BD8E0();
  if (!v1) {
    sub_25D033D48(a1);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void UserIdAwareResultCandidateMessageBase.__allocating_init(build:)()
{
}

uint64_t UserIdAwareResultCandidateMessageBase.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes37UserIdAwareResultCandidateMessageBase_userId + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes37UserIdAwareResultCandidateMessageBase_userId);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *UserIdAwareResultCandidateMessageBase.__allocating_init(build:)(void (*a1)(unsigned __int8 *), uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return UserIdAwareResultCandidateMessageBase.init(build:)(a1, a2);
}

unint64_t sub_25D0AE928()
{
  unint64_t result = qword_26B365168;
  if (!qword_26B365168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B365168);
  }
  return result;
}

void *UserIdAwareResultCandidateMessageBase.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UserIdAwareResultCandidateMessageBase.init(from:)(a1);
}

uint64_t sub_25D0AEA20()
{
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_25D0BD5D0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
  id v1 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v2 = sub_25D0BD2F0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v2;
  unint64_t v8 = v4;
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v7;
}

BOOL sub_25D0AEB70()
{
  uint64_t v0 = sub_25D0BD6F0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_25D0AEBB8()
{
  return sub_25D0AEB70();
}

uint64_t sub_25D0AEBD4()
{
  return 0x644972657375;
}

BOOL sub_25D0AEBF4@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25D0AEB70();
  *a1 = result;
  return result;
}

uint64_t sub_25D0AEC28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25D0AEBD4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_25D0AEC54@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25D0AEBB8();
  *a1 = result;
  return result;
}

uint64_t sub_25D0AEC80(uint64_t a1)
{
  unint64_t v2 = sub_25D0AE928();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0AECBC(uint64_t a1)
{
  unint64_t v2 = sub_25D0AE928();
  return MEMORY[0x270FA00B8](a1, v2);
}

void UserIdAwareResultCandidateMessageBase.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *UserIdAwareResultCandidateMessageBase.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.resultCandidateId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.resultCandidateId.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.resultCandidateId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.userId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 36));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t UserIdAwareResultCandidateMessageBase.Builder.userId.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for UserIdAwareResultCandidateMessageBase.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t (*UserIdAwareResultCandidateMessageBase.Builder.userId.modify())(void)
{
  return nullsub_1;
}

void UserIdAwareResultCandidateMessageBase.init(build:)()
{
}

uint64_t sub_25D0AF12C()
{
  return OUTLINED_FUNCTION_1();
}

id UserIdAwareResultCandidateMessageBase.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0AF184()
{
  return type metadata accessor for UserIdAwareResultCandidateMessageBase(0);
}

uint64_t sub_25D0AF18C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for UserIdAwareResultCandidateMessageBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UserIdAwareResultCandidateMessageBase);
}

uint64_t dispatch thunk of UserIdAwareResultCandidateMessageBase.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t getEnumTagSinglePayload for UserIdAwareResultCandidateMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0AF210);
}

uint64_t sub_25D0AF210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for UserIdAwareResultCandidateMessageBase.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0AF2BC);
}

uint64_t sub_25D0AF2BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0AF340()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for UserIdAwareResultCandidateMessageBase.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0AF480);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserIdAwareResultCandidateMessageBase.CodingKeys()
{
  return &type metadata for UserIdAwareResultCandidateMessageBase.CodingKeys;
}

unint64_t sub_25D0AF4BC()
{
  unint64_t result = qword_26A63A0E0;
  if (!qword_26A63A0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0E0);
  }
  return result;
}

unint64_t sub_25D0AF50C()
{
  unint64_t result = qword_26B365178;
  if (!qword_26B365178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B365178);
  }
  return result;
}

unint64_t sub_25D0AF55C()
{
  unint64_t result = qword_26B365170;
  if (!qword_26B365170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B365170);
  }
  return result;
}

uint64_t UserIdentificationMessage.userClassification.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userClassification);
}

uint64_t UserIdentificationMessage.userIdScores.getter()
{
  return OUTLINED_FUNCTION_4_10();
}

void *UserIdentificationMessage.voiceIdScoreCard.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_voiceIdScoreCard);
  id v2 = v1;
  return v1;
}

uint64_t UserIdentificationMessage.userMeetsRecencyThreshold.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userMeetsRecencyThreshold);
}

uint64_t UserIdentificationMessage.selectedUserIds.getter()
{
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_25D0AF610(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000025D0C6840 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6353644972657375 && a2 == 0xEC0000007365726FLL;
    if (v5 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000025D0C02B0 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000019 && a2 == 0x800000025D0C6870 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0x64657463656C6573 && a2 == 0xEF73644972657355)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      char v7 = sub_25D0BD940();
      swift_bridgeObjectRelease();
      if (v7) {
        return 4;
      }
      else {
        return 5;
      }
    }
  }
}

unint64_t sub_25D0AF830(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6353644972657375;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0x64657463656C6573;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25D0AF900()
{
  return sub_25D0AF830(*v0);
}

uint64_t sub_25D0AF908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0AF610(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0AF930(uint64_t a1)
{
  unint64_t v2 = sub_25D0B1524();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0AF96C(uint64_t a1)
{
  unint64_t v2 = sub_25D0B1524();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *UserIdentificationMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return UserIdentificationMessage.init(build:)(a1);
}

void *UserIdentificationMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  id v61 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v58 = v10 - v9;
  uint64_t v11 = type metadata accessor for UserIdentificationMessage.Builder(0);
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = (unsigned __int8 *)(v14 - v13);
  unsigned __int8 *v15 = 14;
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  uint64_t v16 = v14 - v13 + v12[8];
  uint64_t v59 = v6;
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v6);
  uint64_t v17 = (uint64_t *)&v15[v12[9]];
  uint64_t *v17 = 0;
  v17[1] = 0;
  v15[v12[10]] = 2;
  int v18 = &v15[v12[11]];
  *(void *)int v18 = 0;
  v18[8] = 1;
  uint64_t v19 = v12[12];
  *(void *)&v15[v19] = 0;
  uint64_t v56 = (id *)&v15[v12[13]];
  *uint64_t v56 = 0;
  uint64_t v20 = v12[14];
  v15[v20] = 2;
  uint64_t v21 = v12[15];
  *(void *)&v15[v21] = 0;
  uint64_t v22 = v1;
  v61(v15);
  if (*v15 == 14 || (uint64_t v23 = *((void *)v15 + 2)) == 0)
  {

    goto LABEL_6;
  }
  LODWORD(v61) = *v15;
  uint64_t v55 = *((void *)v15 + 1);
  sub_25CF67F88(v16, v5);
  if (__swift_getEnumTagSinglePayload(v5, 1, v59) == 1)
  {

    sub_25CF69FC0(v5);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25D0BD240();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B366B88);
    uint64_t v25 = sub_25D0BD230();
    os_log_type_t v26 = sub_25D0BD4B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v63 = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = sub_25CF695B0();
      uint64_t v62 = sub_25D04E590(v29, v30, &v63);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v25, v26, "Could not build %{public}s: Builder has missing required fields", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v28, -1, -1);
      MEMORY[0x2611A4870](v27, -1, -1);
    }

    sub_25D0B0034((uint64_t)v15);
    type metadata accessor for UserIdentificationMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v54 = v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v58, v5, v59);
  uint64_t v33 = v17[1];
  if (!v33 || (v18[8] & 1) != 0 || (uint64_t v34 = *(void *)&v15[v19]) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
    goto LABEL_6;
  }
  uint64_t v35 = *v17;
  *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userClassification] = *(void *)v18;
  *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userIdScores] = v34;
  uint64_t v36 = v56;
  id v37 = *v56;
  *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_voiceIdScoreCard] = *v56;
  v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userMeetsRecencyThreshold] = v15[v20] & 1;
  uint64_t v38 = *(void *)&v15[v21];
  uint64_t ObjectType = v35;
  if (!v38)
  {
    uint64_t v40 = v54;
    if (v37)
    {
      id v41 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25D0B14F8(v36);
      if (v43)
      {
        uint64_t v44 = v42;
        uint64_t v45 = v43;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A638DF0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25D0CFA60;
        *(void *)(inited + 32) = v44;
        *(void *)(inited + 40) = v45;
        *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_selectedUserIds] = sub_25D0B1328(inited);
        goto LABEL_25;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_selectedUserIds] = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  *(void *)&v22[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_selectedUserIds] = v38;
  id v39 = v37;
  swift_bridgeObjectRetain();
  uint64_t v40 = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_25:
  uint64_t v48 = v58;
  uint64_t v47 = v59;
  uint64_t v49 = v57;
  uint64_t v50 = v55;

  MEMORY[0x270FA5388](v51);
  *((unsigned char *)&v54 - 48) = (_BYTE)v61;
  *(&v54 - 5) = v50;
  *(&v54 - 4) = v40;
  uint64_t v52 = ObjectType;
  *(&v54 - 3) = v48;
  *(&v54 - 2) = v52;
  *(&v54 - 1) = v33;
  uint64_t v31 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  id v53 = v31;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v47);
  if (v31) {

  }
  sub_25D0B0034((uint64_t)v15);
  return v31;
}

uint64_t type metadata accessor for UserIdentificationMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A100);
}

uint64_t sub_25D0B0034(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserIdentificationMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UserIdentificationMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B3661B8);
}

void *UserIdentificationMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UserIdentificationMessage.init(from:)(a1);
}

void *UserIdentificationMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A0E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v20 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0B1524();
  uint64_t v5 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    int v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  LOBYTE(v21) = 0;
  OUTLINED_FUNCTION_11_19();
  uint64_t v6 = sub_25D0BD740();
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userClassification] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B364650);
  sub_25D0AA210(&qword_26A63A000);
  OUTLINED_FUNCTION_10_22();
  sub_25D0BD7E0();
  *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userIdScores] = v21;
  char v23 = 2;
  sub_25CF6ECE8();
  sub_25D0BD750();
  if (v22 >> 60 == 15)
  {
    uint64_t v12 = 0;
LABEL_14:
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_voiceIdScoreCard] = v12;
    LOBYTE(v21) = 3;
    OUTLINED_FUNCTION_11_19();
    v5[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userMeetsRecencyThreshold] = sub_25D0BD790() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A639570);
    char v23 = 4;
    sub_25D0B1570(&qword_26A639578);
    OUTLINED_FUNCTION_10_22();
    sub_25D0BD7E0();
    *(void *)&v5[OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_selectedUserIds] = v21;

    sub_25CF68E70(v20, (uint64_t)&v21);
    uint64_t v10 = RequestMessageBase.init(from:)(&v21);
    uint64_t v17 = OUTLINED_FUNCTION_2_36();
    v18(v17);
    __swift_destroy_boxed_opaque_existential_1(v20);
    return v10;
  }
  sub_25CF6ED34(0, (unint64_t *)&qword_26A636C18);
  sub_25CF6ED34(0, &qword_26A636FE0);
  uint64_t v19 = v21;
  uint64_t v12 = sub_25D0BD4C0();
  if (v12)
  {
    sub_25CF81BBC(v21, v22);
    goto LABEL_14;
  }
  unint64_t v15 = v22;

  sub_25CF6D168();
  swift_allocError();
  *(void *)uint64_t v16 = 0xD000000000000033;
  *(void *)(v16 + 8) = 0x800000025D0C2740;
  *(unsigned char *)(v16 + 16) = 0;
  swift_willThrow();
  sub_25CF81BBC(v19, v15);
  uint64_t v13 = OUTLINED_FUNCTION_8_22();
  v14(v13);
  uint64_t v10 = 0;
  int v9 = 1;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v20);
  if (v9) {
    swift_bridgeObjectRelease();
  }
  type metadata accessor for UserIdentificationMessage(0);
  swift_deallocPartialClassInstance();
  return v10;
}

uint64_t sub_25D0B05D0(void *a1)
{
  uint64_t v3 = v1;
  v19[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A0F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0B1524();
  sub_25D0BDA30();
  LOBYTE(v19[0]) = 0;
  OUTLINED_FUNCTION_7_28();
  sub_25D0BD8C0();
  if (!v2)
  {
    v19[0] = *(id *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_userIdScores);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B364650);
    sub_25D0AA210(&qword_26B364658);
    OUTLINED_FUNCTION_4_40();
    int v9 = *(void **)(v1 + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_voiceIdScoreCard);
    if (!v9) {
      goto LABEL_8;
    }
    uint64_t v10 = self;
    v19[0] = 0;
    id v11 = v9;
    id v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, v19);
    id v13 = v19[0];
    if (v12)
    {
      int v18 = v11;
      uint64_t v14 = (void *)sub_25D0BCF60();
      uint64_t v16 = v15;

      v19[0] = v14;
      v19[1] = v16;
      sub_25CF6EDC8();
      OUTLINED_FUNCTION_7_28();
      sub_25D0BD8E0();

      sub_25CF6ED70((uint64_t)v14, (unint64_t)v16);
LABEL_8:
      LOBYTE(v19[0]) = 3;
      OUTLINED_FUNCTION_7_28();
      sub_25D0BD890();
      v19[0] = *(id *)(v3 + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_selectedUserIds);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A639570);
      sub_25D0B1570(&qword_26A639598);
      OUTLINED_FUNCTION_4_40();
      sub_25D0292F0(a1);
      goto LABEL_3;
    }
    uint64_t v17 = v13;
    sub_25D0BCF40();

    swift_willThrow();
  }
LABEL_3:
  uint64_t v6 = OUTLINED_FUNCTION_7_2();
  return v7(v6);
}

uint64_t sub_25D0B0974()
{
  uint64_t v4 = 0;
  unint64_t v5 = 0xE000000000000000;
  sub_25D0BD5D0();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for UserIdentificationMessage(0);
  id v1 = objc_msgSendSuper2(&v3, sel_description);
  sub_25D0BD2F0();

  sub_25D0BD390();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_33();
  sub_25D0BD930();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  swift_bridgeObjectRetain();
  sub_25D0BD280();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_33();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_33();
  swift_bridgeObjectRetain();
  sub_25D0BD490();
  sub_25D0BD390();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D0BD390();
  return v4;
}

void UserIdentificationMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *UserIdentificationMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserIdentificationMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t UserIdentificationMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*UserIdentificationMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserIdentificationMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.isMitigated.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 32));
}

uint64_t UserIdentificationMessage.Builder.isMitigated.setter(char a1)
{
  uint64_t result = type metadata accessor for UserIdentificationMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.isMitigated.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.userClassification.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 36));
}

uint64_t UserIdentificationMessage.Builder.userClassification.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for UserIdentificationMessage.Builder(0);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.userClassification.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.userIdScores.getter()
{
  type metadata accessor for UserIdentificationMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t UserIdentificationMessage.Builder.userIdScores.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_45() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.userIdScores.modify())(void)
{
  return nullsub_1;
}

void *UserIdentificationMessage.Builder.voiceIdScoreCard.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 44));
  id v2 = v1;
  return v1;
}

void UserIdentificationMessage.Builder.voiceIdScoreCard.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_45() + 44);

  *(void *)(v1 + v2) = v0;
}

uint64_t (*UserIdentificationMessage.Builder.voiceIdScoreCard.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.userMeetsRecencyThreshold.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserIdentificationMessage.Builder(0) + 48));
}

uint64_t UserIdentificationMessage.Builder.userMeetsRecencyThreshold.setter(char a1)
{
  uint64_t result = type metadata accessor for UserIdentificationMessage.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.userMeetsRecencyThreshold.modify())(void)
{
  return nullsub_1;
}

uint64_t UserIdentificationMessage.Builder.selectedUserIds.getter()
{
  type metadata accessor for UserIdentificationMessage.Builder(0);
  return swift_bridgeObjectRetain();
}

uint64_t UserIdentificationMessage.Builder.selectedUserIds.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_45() + 52);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*UserIdentificationMessage.Builder.selectedUserIds.modify())(void)
{
  return nullsub_1;
}

void UserIdentificationMessage.__allocating_init(build:)()
{
}

void UserIdentificationMessage.init(build:)()
{
}

uint64_t sub_25D0B1244()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id UserIdentificationMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserIdentificationMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25D0B1328(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6395F0);
  uint64_t result = sub_25D0BD5C0();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_25D0BD9D0();
    swift_bridgeObjectRetain();
    sub_25D0BD370();
    uint64_t result = sub_25D0BD9F0();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      unint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_25D0BD940(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        int v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_25D0BD940();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25D0B14F8(id *a1)
{
  id v1 = *a1;
  return sub_25D0B2408(v1);
}

unint64_t sub_25D0B1524()
{
  unint64_t result = qword_26A63A0F0;
  if (!qword_26A63A0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A0F0);
  }
  return result;
}

uint64_t sub_25D0B1570(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A639570);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D0B15D4()
{
  return type metadata accessor for UserIdentificationMessage(0);
}

uint64_t sub_25D0B15DC()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for UserIdentificationMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UserIdentificationMessage);
}

uint64_t dispatch thunk of UserIdentificationMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

void *initializeBufferWithCopyOfBuffer for UserIdentificationMessage.Builder(void *a1, void *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    BOOL v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *BOOL v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = (char *)v4 + v19;
    BOOL v22 = (char *)a2 + v19;
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    *(void *)((char *)v4 + v20) = *(void *)((char *)a2 + v20);
    uint64_t v23 = a3[11];
    uint64_t v24 = a3[12];
    uint64_t v25 = *(void **)((char *)a2 + v23);
    *(void *)((char *)v4 + v23) = v25;
    *((unsigned char *)v4 + v24) = *((unsigned char *)a2 + v24);
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v26 = v25;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v21 = a3[11];
  uint64_t v22 = a3[12];
  uint64_t v23 = *(void **)(a2 + v21);
  *(void *)(a1 + v21) = v23;
  *(unsigned char *)(a1 + v22) = *(unsigned char *)(a2 + v22);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = v23;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  char v20 = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = v20;
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[11];
  uint64_t v22 = *(void **)(a1 + v21);
  uint64_t v23 = *(void **)(a2 + v21);
  *(void *)(a1 + v21) = v23;
  id v24 = v23;

  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v16 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[11];
  id v24 = *(void **)(a1 + v23);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);

  uint64_t v25 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0B2020);
}

uint64_t sub_25D0B2020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for UserIdentificationMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0B20CC);
}

uint64_t sub_25D0B20CC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0B2150()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for UserIdentificationMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25D0B22E0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserIdentificationMessage.CodingKeys()
{
  return &type metadata for UserIdentificationMessage.CodingKeys;
}

unint64_t sub_25D0B231C()
{
  unint64_t result = qword_26A63A110;
  if (!qword_26A63A110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A110);
  }
  return result;
}

unint64_t sub_25D0B236C()
{
  unint64_t result = qword_26A63A118;
  if (!qword_26A63A118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A118);
  }
  return result;
}

unint64_t sub_25D0B23BC()
{
  unint64_t result = qword_26A63A120;
  if (!qword_26A63A120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A120);
  }
  return result;
}

uint64_t sub_25D0B2408(void *a1)
{
  id v2 = objc_msgSend(a1, sel_userClassified);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D0BD2F0();

  return v3;
}

uint64_t OUTLINED_FUNCTION_1_45()
{
  return type metadata accessor for UserIdentificationMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_4_40()
{
  return sub_25D0BD8E0();
}

uint64_t OUTLINED_FUNCTION_6_33()
{
  return sub_25D0BD390();
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_19()
{
  return v0 - 120;
}

uint64_t sub_25D0B253C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6554786966657270 && a2 == 0xEA00000000007478;
  if (v3 || (sub_25D0BD940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x5478696674736F70 && a2 == 0xEB00000000747865;
    if (v6 || (sub_25D0BD940() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x64657463656C6573 && a2 == 0xEC00000074786554;
      if (v7 || (sub_25D0BD940() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x800000025D0C6910 || (sub_25D0BD940() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x800000025D0C6930 || (sub_25D0BD940() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x800000025D0C6950 || (sub_25D0BD940() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x800000025D0C6970 || (sub_25D0BD940() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0x6E6576456F646E75 && a2 == 0xE900000000000074)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else
      {
        char v9 = sub_25D0BD940();
        swift_bridgeObjectRelease();
        if (v9) {
          return 7;
        }
        else {
          return 8;
        }
      }
    }
  }
}

uint64_t sub_25D0B286C()
{
  return 8;
}

unint64_t sub_25D0B2874(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5478696674736F70;
      break;
    case 2:
      unint64_t result = 0x64657463656C6573;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0x6E6576456F646E75;
      break;
    default:
      unint64_t result = 0x6554786966657270;
      break;
  }
  return result;
}

unint64_t sub_25D0B2990()
{
  return sub_25D0B2874(*v0);
}

uint64_t sub_25D0B2998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D0B253C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D0B29C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D0B286C();
  *a1 = result;
  return result;
}

uint64_t sub_25D0B29E8(uint64_t a1)
{
  unint64_t v2 = sub_25D0B3FCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0B2A24(uint64_t a1)
{
  unint64_t v2 = sub_25D0B3FCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t VoiceCommandContextMessage.prefixText.getter()
{
  return sub_25D02555C();
}

uint64_t VoiceCommandContextMessage.postfixText.getter()
{
  return sub_25D02555C();
}

uint64_t VoiceCommandContextMessage.selectedText.getter()
{
  return sub_25D02555C();
}

uint64_t VoiceCommandContextMessage.disambiguationActive.getter()
{
  return OUTLINED_FUNCTION_10_13(OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_disambiguationActive);
}

uint64_t VoiceCommandContextMessage.cursorInVisibleText.getter()
{
  return OUTLINED_FUNCTION_10_13(OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_cursorInVisibleText);
}

uint64_t VoiceCommandContextMessage.favorCommandSuppression.getter()
{
  return OUTLINED_FUNCTION_10_13(OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_favorCommandSuppression);
}

uint64_t VoiceCommandContextMessage.abortCommandSuppression.getter()
{
  return OUTLINED_FUNCTION_10_13(OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_abortCommandSuppression);
}

uint64_t VoiceCommandContextMessage.undoEvent.getter()
{
  return OUTLINED_FUNCTION_10_13(OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_undoEvent);
}

void *VoiceCommandContextMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return VoiceCommandContextMessage.init(build:)(a1);
}

void *VoiceCommandContextMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  uint64_t v55 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_0_12();
  uint64_t v52 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v51 = v10 - v9;
  uint64_t v11 = type metadata accessor for VoiceCommandContextMessage.Builder(0);
  int v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = (unsigned __int8 *)(v14 - v13);
  unsigned __int8 *v15 = 14;
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  uint64_t v16 = v14 - v13 + v12[8];
  uint64_t v53 = v2;
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v2);
  uint64_t v17 = &v15[v12[9]];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = &v15[v12[10]];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  uint64_t v19 = &v15[v12[11]];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v15[v12[12]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v47 = v12[13];
  v15[v47] = 2;
  uint64_t v48 = v12[14];
  v15[v48] = 2;
  uint64_t v49 = v12[15];
  v15[v49] = 2;
  uint64_t v50 = v12[16];
  v15[v50] = 2;
  uint64_t v21 = v12[17];
  v15[v21] = 2;
  uint64_t v22 = v1;
  v55(v15);
  int v23 = *v15;
  if (v23 == 14 || !*((void *)v15 + 2))
  {

    goto LABEL_6;
  }
  uint64_t v55 = (void (*)(unsigned __int8 *))*((void *)v15 + 2);
  uint64_t v46 = *((void *)v15 + 1);
  sub_25CF67F88(v16, v6);
  if (__swift_getEnumTagSinglePayload(v6, 1, v53) == 1)
  {

    sub_25CF69FC0(v6);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25D0BD240();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B366B88);
    uint64_t v25 = sub_25D0BD230();
    os_log_type_t v26 = sub_25D0BD4B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v57 = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = sub_25CF695B0();
      uint64_t v56 = sub_25D04E590(v29, v30, &v57);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v25, v26, "Could not build %{public}s: Builder has missing required fields", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v28, -1, -1);
      MEMORY[0x2611A4870](v27, -1, -1);
    }

    sub_25D0B30A4((uint64_t)v15);
    type metadata accessor for VoiceCommandContextMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v51, v6, v53);
  uint64_t v33 = *((void *)v17 + 1);
  if (!v33)
  {

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
    goto LABEL_6;
  }
  uint64_t v34 = *(void *)v17;
  uint64_t v35 = *(void *)v18;
  uint64_t v36 = *((void *)v18 + 1);
  id v37 = &v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_prefixText];
  *(void *)id v37 = v35;
  *((void *)v37 + 1) = v36;
  uint64_t v38 = *((void *)v19 + 1);
  id v39 = &v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_postfixText];
  *(void *)id v39 = *(void *)v19;
  *((void *)v39 + 1) = v38;
  uint64_t v40 = *((void *)v20 + 1);
  id v41 = &v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_selectedText];
  *(void *)id v41 = *(void *)v20;
  *((void *)v41 + 1) = v40;
  v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_disambiguationActive] = v15[v47];
  v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_cursorInVisibleText] = v15[v48];
  v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_favorCommandSuppression] = v15[v49];
  v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_abortCommandSuppression] = v15[v50];
  v22[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_undoEvent] = v15[v21];
  swift_bridgeObjectRetain();
  uint64_t v42 = v55;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v43);
  *((unsigned char *)&v46 - 48) = v23;
  *(&v46 - 5) = v46;
  *(&v46 - 4) = (uint64_t)v42;
  uint64_t v44 = v51;
  *(&v46 - 3) = v51;
  *(&v46 - 2) = v34;
  *(&v46 - 1) = v33;
  uint64_t v31 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  id v45 = v31;
  sub_25D0B30A4((uint64_t)v15);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v44, v53);
  if (v31) {

  }
  return v31;
}

uint64_t type metadata accessor for VoiceCommandContextMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A140);
}

uint64_t sub_25D0B30A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VoiceCommandContextMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for VoiceCommandContextMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26B364238);
}

void *VoiceCommandContextMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VoiceCommandContextMessage.init(from:)(a1);
}

void *VoiceCommandContextMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A128);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v5 = a1[3];
  uint64_t v21 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v5);
  sub_25D0B3FCC();
  uint64_t v6 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v8 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    type metadata accessor for VoiceCommandContextMessage(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v7 = OUTLINED_FUNCTION_13_17();
    uint64_t v10 = (uint64_t *)&v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_prefixText];
    *uint64_t v10 = v7;
    v10[1] = v11;
    uint64_t v12 = OUTLINED_FUNCTION_13_17();
    uint64_t v13 = (uint64_t)v21;
    uint64_t v14 = (uint64_t *)&v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_postfixText];
    *uint64_t v14 = v12;
    v14[1] = v15;
    LOBYTE(v20[0]) = 2;
    uint64_t v16 = sub_25D0BD720();
    uint64_t v17 = (uint64_t *)&v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_selectedText];
    uint64_t *v17 = v16;
    v17[1] = v18;
    v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_disambiguationActive] = OUTLINED_FUNCTION_1_46(3);
    v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_cursorInVisibleText] = OUTLINED_FUNCTION_1_46(4);
    v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_favorCommandSuppression] = OUTLINED_FUNCTION_1_46(5);
    v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_abortCommandSuppression] = OUTLINED_FUNCTION_1_46(6);
    v6[OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_undoEvent] = OUTLINED_FUNCTION_1_46(7);

    sub_25CF68E70(v13, (uint64_t)v20);
    uint64_t v8 = RequestMessageBase.init(from:)(v20);
    OUTLINED_FUNCTION_6_34();
    v19();
    __swift_destroy_boxed_opaque_existential_1(v13);
  }
  return v8;
}

uint64_t sub_25D0B3534(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A138);
  OUTLINED_FUNCTION_0_12();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0B3FCC();
  sub_25D0BDA30();
  if (!*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_prefixText + 8)
    || (OUTLINED_FUNCTION_11_20(), !v2))
  {
    if (!*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_postfixText + 8)
      || (OUTLINED_FUNCTION_11_20(), !v2))
    {
      if (!*(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes26VoiceCommandContextMessage_selectedText + 8)
        || (OUTLINED_FUNCTION_11_20(), !v2))
      {
        OUTLINED_FUNCTION_12_17();
        if (v11 || (OUTLINED_FUNCTION_4_41(), !v2))
        {
          OUTLINED_FUNCTION_12_17();
          if (v11 || (OUTLINED_FUNCTION_4_41(), !v2))
          {
            OUTLINED_FUNCTION_12_17();
            if (v11 || (OUTLINED_FUNCTION_4_41(), !v2))
            {
              OUTLINED_FUNCTION_12_17();
              if (v11 || (OUTLINED_FUNCTION_4_41(), !v2))
              {
                OUTLINED_FUNCTION_12_17();
                if (v11 || (OUTLINED_FUNCTION_4_41(), !v2)) {
                  sub_25D0292F0(a1);
                }
              }
            }
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v3);
}

void VoiceCommandContextMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *VoiceCommandContextMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t VoiceCommandContextMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t VoiceCommandContextMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*VoiceCommandContextMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.requestId.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t VoiceCommandContextMessage.Builder.requestId.setter()
{
  OUTLINED_FUNCTION_7_29();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.prefixText.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t VoiceCommandContextMessage.Builder.prefixText.setter()
{
  OUTLINED_FUNCTION_7_29();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.prefixText.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.postfixText.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t VoiceCommandContextMessage.Builder.postfixText.setter()
{
  OUTLINED_FUNCTION_7_29();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.postfixText.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.selectedText.getter()
{
  return OUTLINED_FUNCTION_4_4();
}

uint64_t VoiceCommandContextMessage.Builder.selectedText.setter()
{
  OUTLINED_FUNCTION_7_29();
  uint64_t result = OUTLINED_FUNCTION_10_1();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.selectedText.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.disambiguationActive.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 44));
}

uint64_t VoiceCommandContextMessage.Builder.disambiguationActive.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_34();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.disambiguationActive.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.cursorInVisibleText.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 48));
}

uint64_t VoiceCommandContextMessage.Builder.cursorInVisibleText.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_34();
  *(unsigned char *)(v1 + *(int *)(result + 48)) = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.cursorInVisibleText.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.favorCommandSuppression.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 52));
}

uint64_t VoiceCommandContextMessage.Builder.favorCommandSuppression.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_34();
  *(unsigned char *)(v1 + *(int *)(result + 52)) = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.favorCommandSuppression.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.abortCommandSuppression.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 56));
}

uint64_t VoiceCommandContextMessage.Builder.abortCommandSuppression.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_34();
  *(unsigned char *)(v1 + *(int *)(result + 56)) = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.abortCommandSuppression.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceCommandContextMessage.Builder.undoEvent.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for VoiceCommandContextMessage.Builder(0) + 60));
}

uint64_t VoiceCommandContextMessage.Builder.undoEvent.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_34();
  *(unsigned char *)(v1 + *(int *)(result + 60)) = v0;
  return result;
}

uint64_t (*VoiceCommandContextMessage.Builder.undoEvent.modify())(void)
{
  return nullsub_1;
}

void VoiceCommandContextMessage.__allocating_init(build:)()
{
}

void VoiceCommandContextMessage.init(build:)()
{
}

uint64_t sub_25D0B3ED0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id VoiceCommandContextMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceCommandContextMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0B3FCC()
{
  unint64_t result = qword_26A63A130;
  if (!qword_26A63A130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A130);
  }
  return result;
}

uint64_t sub_25D0B4018()
{
  return type metadata accessor for VoiceCommandContextMessage(0);
}

uint64_t sub_25D0B4020()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for VoiceCommandContextMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VoiceCommandContextMessage);
}

uint64_t dispatch thunk of VoiceCommandContextMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

void *initializeBufferWithCopyOfBuffer for VoiceCommandContextMessage.Builder(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (void *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[9];
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)((char *)v4 + v22);
    uint64_t v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (void *)((char *)v4 + v23);
    uint64_t v28 = (void *)((char *)a2 + v23);
    uint64_t v29 = v28[1];
    void *v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = a3[12];
    *((unsigned char *)v4 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *((unsigned char *)v4 + v30) = *((unsigned char *)a2 + v30);
    uint64_t v31 = a3[14];
    *((unsigned char *)v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *((unsigned char *)v4 + v31) = *((unsigned char *)a2 + v31);
    *((unsigned char *)v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t initializeWithCopy for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  uint64_t v26 = (void *)(a2 + v21);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t initializeWithTake for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v36 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v36) = *(unsigned char *)(a2 + v36);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0B4A24);
}

uint64_t sub_25D0B4A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for VoiceCommandContextMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0B4AD0);
}

uint64_t sub_25D0B4AD0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0B4B54()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for VoiceCommandContextMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D0B4CD8);
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

ValueMetadata *type metadata accessor for VoiceCommandContextMessage.CodingKeys()
{
  return &type metadata for VoiceCommandContextMessage.CodingKeys;
}

unint64_t sub_25D0B4D14()
{
  unint64_t result = qword_26A63A150;
  if (!qword_26A63A150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A150);
  }
  return result;
}

unint64_t sub_25D0B4D64()
{
  unint64_t result = qword_26A63A158;
  if (!qword_26A63A158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A158);
  }
  return result;
}

unint64_t sub_25D0B4DB4()
{
  unint64_t result = qword_26A63A160;
  if (!qword_26A63A160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A160);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_46@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
  return sub_25D0BD730();
}

uint64_t OUTLINED_FUNCTION_3_34()
{
  return type metadata accessor for VoiceCommandContextMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_4_41()
{
  return sub_25D0BD890();
}

uint64_t OUTLINED_FUNCTION_7_29()
{
  return type metadata accessor for VoiceCommandContextMessage.Builder(0);
}

uint64_t OUTLINED_FUNCTION_11_20()
{
  return sub_25D0BD880();
}

uint64_t OUTLINED_FUNCTION_13_17()
{
  return sub_25D0BD720();
}

id VoiceIdScoreCardMessage.voiceIdScoreCard.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC16SiriMessageTypes23VoiceIdScoreCardMessage_voiceIdScoreCard);
}

void *VoiceIdScoreCardMessage.__allocating_init(build:)(void (*a1)(unsigned __int8 *))
{
  id v3 = objc_allocWithZone(v1);
  return VoiceIdScoreCardMessage.init(build:)(a1);
}

void *VoiceIdScoreCardMessage.init(build:)(void (*a1)(unsigned __int8 *))
{
  id ObjectType = (id)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_25D0BCFE0();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for VoiceIdScoreCardMessage.Builder(0);
  uint64_t v15 = (int *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_5_5();
  unsigned __int8 *v1 = 14;
  *((void *)v1 + 1) = 0;
  *((void *)v1 + 2) = 0;
  uint64_t v16 = (uint64_t)&v1[v15[8]];
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v8);
  uint64_t v17 = &v1[v15[9]];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = v15[10];
  *(void *)&v1[v18] = 0;
  uint64_t v19 = v2;
  a1(v1);
  int v20 = *v1;
  if (v20 == 14 || (uint64_t v21 = *((void *)v1 + 2)) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v41 = *((void *)v1 + 1);
  sub_25CF67F88(v16, v7);
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {

    sub_25CF69FC0(v7);
LABEL_6:
    if (qword_26B3645D0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25D0BD240();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B366B88);
    uint64_t v23 = sub_25D0BD230();
    os_log_type_t v24 = sub_25D0BD4B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v45 = v26;
      *(_DWORD *)uint64_t v25 = 136446210;
      uint64_t v27 = sub_25CF695B0();
      uint64_t v44 = sub_25D04E590(v27, v28, &v45);
      sub_25D0BD540();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25CF65000, v23, v24, "Could not build %{public}s: Builder has missing required fields", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A4870](v26, -1, -1);
      MEMORY[0x2611A4870](v25, -1, -1);
    }

    sub_25D0B53C4((uint64_t)v1);
    type metadata accessor for VoiceIdScoreCardMessage(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v13, v7, v8);
  uint64_t v31 = *((void *)v17 + 1);
  if (!v31 || (uint64_t v32 = *(void **)&v1[v18]) == 0)
  {

    uint64_t v38 = OUTLINED_FUNCTION_2_38();
    v39(v38);
    goto LABEL_6;
  }
  uint64_t v33 = *(void *)v17;
  *(void *)&v19[OBJC_IVAR____TtC16SiriMessageTypes23VoiceIdScoreCardMessage_voiceIdScoreCard] = v32;
  id ObjectType = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  MEMORY[0x270FA5388](v34);
  *((unsigned char *)&v40 - 48) = v20;
  *(&v40 - 5) = v41;
  *(&v40 - 4) = v21;
  *(&v40 - 3) = v13;
  *(&v40 - 2) = v33;
  *(&v40 - 1) = v31;
  uint64_t v29 = RequestMessageBase.init(build:)((void (*)(unsigned __int8 *))sub_25CF77B1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v35 = v29;

  sub_25D0B53C4((uint64_t)v1);
  uint64_t v36 = OUTLINED_FUNCTION_2_38();
  v37(v36);
  if (v29) {

  }
  return v29;
}

uint64_t type metadata accessor for VoiceIdScoreCardMessage.Builder(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A190);
}

uint64_t sub_25D0B53C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VoiceIdScoreCardMessage.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for VoiceIdScoreCardMessage(uint64_t a1)
{
  return sub_25CF67E18(a1, (uint64_t *)&unk_26A63A180);
}

void *VoiceIdScoreCardMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VoiceIdScoreCardMessage.init(from:)(a1);
}

void *VoiceIdScoreCardMessage.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A168);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_5();
  uint64_t v5 = a1[3];
  uint64_t v18 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v5);
  sub_25D0B5DA4();
  uint64_t v6 = v1;
  sub_25D0BDA20();
  if (v2)
  {

    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t)v18;
  }
  else
  {
    sub_25CF6ECE8();
    sub_25D0BD7E0();
    sub_25CF6ED34(0, (unint64_t *)&qword_26A636C18);
    sub_25CF6ED34(0, &qword_26A636FE0);
    uint64_t v10 = (void *)sub_25D0BD4C0();
    uint64_t v8 = (uint64_t)v18;
    if (v10)
    {
      *(void *)&v6[OBJC_IVAR____TtC16SiriMessageTypes23VoiceIdScoreCardMessage_voiceIdScoreCard] = v10;
      id v16 = v10;

      sub_25CF68E70(v8, (uint64_t)&v17);
      uint64_t v7 = RequestMessageBase.init(from:)(&v17);
      uint64_t v14 = OUTLINED_FUNCTION_1_21();
      v15(v14);
      OUTLINED_FUNCTION_2_1();

      __swift_destroy_boxed_opaque_existential_1(v8);
      return v7;
    }

    sub_25CF6D168();
    swift_allocError();
    *(void *)uint64_t v13 = 0xD000000000000020;
    *(void *)(v13 + 8) = 0x800000025D0C2DE0;
    *(unsigned char *)(v13 + 16) = 0;
    swift_willThrow();
    OUTLINED_FUNCTION_2_1();
    uint64_t v11 = OUTLINED_FUNCTION_1_21();
    v12(v11);
    uint64_t v7 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1(v8);
  type metadata accessor for VoiceIdScoreCardMessage(0);
  swift_deallocPartialClassInstance();
  return v7;
}

uint64_t sub_25D0B577C(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A63A178);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D0B5DA4();
  sub_25D0BDA30();
  uint64_t v5 = self;
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC16SiriMessageTypes23VoiceIdScoreCardMessage_voiceIdScoreCard);
  v18[0] = 0;
  id v7 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v6, 1, v18);
  id v8 = v18[0];
  if (v7)
  {
    uint64_t v9 = (void *)sub_25D0BCF60();
    uint64_t v11 = v10;

    v18[0] = v9;
    v18[1] = v11;
    sub_25CF6EDC8();
    sub_25D0BD8E0();
    if (!v2) {
      sub_25D0292F0(a1);
    }
    uint64_t v12 = OUTLINED_FUNCTION_6_13();
    v13(v12);
    return OUTLINED_FUNCTION_2_1();
  }
  else
  {
    uint64_t v15 = v8;
    sub_25D0BCF40();

    swift_willThrow();
    uint64_t v16 = OUTLINED_FUNCTION_6_13();
    return v17(v16);
  }
}

uint64_t sub_25D0B5958(uint64_t a1)
{
  unint64_t v2 = sub_25D0B5DA4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D0B5994(uint64_t a1)
{
  unint64_t v2 = sub_25D0B5DA4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void VoiceIdScoreCardMessage.Builder.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *VoiceIdScoreCardMessage.Builder.source.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*VoiceIdScoreCardMessage.Builder.source.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceIdScoreCardMessage.Builder.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VoiceIdScoreCardMessage.Builder.assistantId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*VoiceIdScoreCardMessage.Builder.assistantId.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceIdScoreCardMessage.Builder.sessionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 24);
  return sub_25CF67F88(v3, a1);
}

uint64_t VoiceIdScoreCardMessage.Builder.sessionId.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 24);
  return sub_25CF67FF0(a1, v3);
}

uint64_t (*VoiceIdScoreCardMessage.Builder.sessionId.modify())(void)
{
  return nullsub_1;
}

uint64_t VoiceIdScoreCardMessage.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VoiceIdScoreCardMessage.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*VoiceIdScoreCardMessage.Builder.requestId.modify())(void)
{
  return nullsub_1;
}

void *VoiceIdScoreCardMessage.Builder.voiceIdScoreCard.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 32));
  id v2 = v1;
  return v1;
}

void VoiceIdScoreCardMessage.Builder.voiceIdScoreCard.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for VoiceIdScoreCardMessage.Builder(0) + 32);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*VoiceIdScoreCardMessage.Builder.voiceIdScoreCard.modify())(void)
{
  return nullsub_1;
}

void VoiceIdScoreCardMessage.__allocating_init(build:)()
{
}

void VoiceIdScoreCardMessage.init(build:)()
{
}

void sub_25D0B5D4C()
{
}

id VoiceIdScoreCardMessage.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceIdScoreCardMessage(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25D0B5DA4()
{
  unint64_t result = qword_26A63A170;
  if (!qword_26A63A170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A170);
  }
  return result;
}

uint64_t sub_25D0B5DF0()
{
  return type metadata accessor for VoiceIdScoreCardMessage(0);
}

uint64_t sub_25D0B5DF8()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for VoiceIdScoreCardMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VoiceIdScoreCardMessage);
}

uint64_t dispatch thunk of VoiceIdScoreCardMessage.__allocating_init(build:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t *initializeBufferWithCopyOfBuffer for VoiceIdScoreCardMessage.Builder(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25D0BCFE0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (uint64_t *)((char *)v4 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + v15) = (uint64_t)v19;
    swift_bridgeObjectRetain();
    id v20 = v19;
  }
  return v4;
}

void destroy for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25D0BCFE0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 32));
}

uint64_t initializeWithCopy for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = *(void **)(a2 + v13);
  *(void *)(a1 + v13) = v17;
  swift_bridgeObjectRetain();
  id v18 = v17;
  return a1;
}

uint64_t assignWithCopy for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  id v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  return a1;
}

uint64_t initializeWithTake for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25D0BCFE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25D0BCFE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D0B6654);
}

uint64_t sub_25D0B6654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for VoiceIdScoreCardMessage.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D0B6700);
}

uint64_t sub_25D0B6700(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3647D0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D0B6784()
{
  sub_25CF68A58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for VoiceIdScoreCardMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D0B68CCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceIdScoreCardMessage.CodingKeys()
{
  return &type metadata for VoiceIdScoreCardMessage.CodingKeys;
}

unint64_t sub_25D0B6908()
{
  unint64_t result = qword_26A63A1A0;
  if (!qword_26A63A1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A1A0);
  }
  return result;
}

unint64_t sub_25D0B6958()
{
  unint64_t result = qword_26A63A1A8;
  if (!qword_26A63A1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A1A8);
  }
  return result;
}

unint64_t sub_25D0B69A8()
{
  unint64_t result = qword_26A63A1B0;
  if (!qword_26A63A1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A63A1B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_38()
{
  return v0;
}

BOOL SMTTCUStateGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SMTTCUStateGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

__CFString *SMTTCUStateGetName(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_265503E28[a1];
  }
}

uint64_t SMTTCUStateGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SMTTCUStateGetFromName_onceToken != -1) {
      dispatch_once(&SMTTCUStateGetFromName_onceToken, &__block_literal_global_416);
    }
    objc_super v2 = [(id)SMTTCUStateGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SMTTCUStateGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SMTTCUStateGetFromName_map;
  SMTTCUStateGetFromName_map = (uint64_t)&unk_270A35740;
}

BOOL SMTVoiceTriggerPhraseTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SMTVoiceTriggerPhraseTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SMTVoiceTriggerPhraseTypeGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_265503FA8[a1];
  }
}

uint64_t SMTVoiceTriggerPhraseTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SMTVoiceTriggerPhraseTypeGetFromName_onceToken != -1) {
      dispatch_once(&SMTVoiceTriggerPhraseTypeGetFromName_onceToken, &__block_literal_global_713);
    }
    objc_super v2 = [(id)SMTVoiceTriggerPhraseTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SMTVoiceTriggerPhraseTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SMTVoiceTriggerPhraseTypeGetFromName_map;
  SMTVoiceTriggerPhraseTypeGetFromName_map = (uint64_t)&unk_270A35768;
}

uint64_t sub_25D0BCE80()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25D0BCE90()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25D0BCEA0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25D0BCEB0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_25D0BCEC0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25D0BCED0()
{
  return MEMORY[0x270EEE2C0]();
}

uint64_t sub_25D0BCEE0()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_25D0BCEF0()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_25D0BCF00()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25D0BCF10()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25D0BCF20()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25D0BCF30()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25D0BCF40()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25D0BCF50()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25D0BCF60()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25D0BCF70()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25D0BCF90()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25D0BCFA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25D0BCFB0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t _s16SiriMessageTypes17OrchestrationTaskV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25D0BCFD0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25D0BCFE0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25D0BCFF0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25D0BD000()
{
  return MEMORY[0x270F6A280]();
}

uint64_t sub_25D0BD010()
{
  return MEMORY[0x270F6A2C0]();
}

uint64_t sub_25D0BD020()
{
  return MEMORY[0x270F6A2C8]();
}

uint64_t sub_25D0BD030()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_25D0BD040()
{
  return MEMORY[0x270F6A4B8]();
}

uint64_t sub_25D0BD050()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_25D0BD060()
{
  return MEMORY[0x270F6AA38]();
}

uint64_t sub_25D0BD070()
{
  return MEMORY[0x270F6AA40]();
}

uint64_t sub_25D0BD080()
{
  return MEMORY[0x270F6AA48]();
}

uint64_t sub_25D0BD090()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t sub_25D0BD0A0()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_25D0BD0B0()
{
  return MEMORY[0x270F6ACC8]();
}

uint64_t sub_25D0BD0C0()
{
  return MEMORY[0x270F6AFE8]();
}

uint64_t sub_25D0BD0D0()
{
  return MEMORY[0x270F6B040]();
}

uint64_t sub_25D0BD0E0()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_25D0BD0F0()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_25D0BD100()
{
  return MEMORY[0x270F72C80]();
}

uint64_t sub_25D0BD110()
{
  return MEMORY[0x270F72C88]();
}

uint64_t sub_25D0BD120()
{
  return MEMORY[0x270F72C90]();
}

uint64_t sub_25D0BD140()
{
  return MEMORY[0x270F66010]();
}

uint64_t sub_25D0BD150()
{
  return MEMORY[0x270F66018]();
}

uint64_t sub_25D0BD160()
{
  return MEMORY[0x270F66020]();
}

uint64_t sub_25D0BD170()
{
  return MEMORY[0x270F66028]();
}

uint64_t sub_25D0BD180()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_25D0BD190()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_25D0BD1A0()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_25D0BD1B0()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_25D0BD1C0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_25D0BD1D0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_25D0BD1E0()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_25D0BD1F0()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_25D0BD200()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_25D0BD210()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_25D0BD220()
{
  return MEMORY[0x270F660C0]();
}

uint64_t sub_25D0BD230()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25D0BD240()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25D0BD250()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25D0BD260()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25D0BD270()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25D0BD280()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25D0BD290()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25D0BD2A0()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_25D0BD2B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25D0BD2C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25D0BD2D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25D0BD2E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25D0BD2F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25D0BD300()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25D0BD310()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25D0BD320()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25D0BD330()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25D0BD340()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25D0BD350()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_25D0BD360()
{
  return MEMORY[0x270F9D6D0]();
}

uint64_t sub_25D0BD370()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25D0BD380()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25D0BD390()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25D0BD3A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25D0BD3B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25D0BD3C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25D0BD3D0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25D0BD3E0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25D0BD3F0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25D0BD400()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25D0BD410()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25D0BD420()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25D0BD430()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25D0BD440()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25D0BD450()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25D0BD460()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25D0BD470()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25D0BD480()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25D0BD490()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25D0BD4A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25D0BD4B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25D0BD4C0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25D0BD4D0()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_25D0BD4E0()
{
  return MEMORY[0x270EF1F98]();
}

uint64_t sub_25D0BD4F0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_25D0BD500()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_25D0BD510()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25D0BD520()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25D0BD530()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25D0BD540()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25D0BD550()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25D0BD560()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25D0BD570()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_25D0BD580()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25D0BD590()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25D0BD5A0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25D0BD5B0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25D0BD5C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25D0BD5D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25D0BD5E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25D0BD5F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25D0BD600()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25D0BD610()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25D0BD620()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25D0BD630()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25D0BD640()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25D0BD650()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25D0BD660()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25D0BD670()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25D0BD680()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25D0BD690()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25D0BD6A0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25D0BD6B0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25D0BD6C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25D0BD6D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25D0BD6E0()
{
  return MEMORY[0x270F9F210]();
}

uint64_t sub_25D0BD6F0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25D0BD700()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25D0BD710()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25D0BD720()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25D0BD730()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25D0BD740()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25D0BD750()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25D0BD760()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_25D0BD770()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_25D0BD780()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25D0BD790()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25D0BD7A0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25D0BD7B0()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25D0BD7C0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25D0BD7D0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_25D0BD7E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25D0BD7F0()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_25D0BD810()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25D0BD820()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25D0BD830()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_25D0BD840()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25D0BD850()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25D0BD860()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25D0BD870()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25D0BD880()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25D0BD890()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25D0BD8A0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25D0BD8B0()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25D0BD8C0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25D0BD8D0()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_25D0BD8E0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25D0BD8F0()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_25D0BD900()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25D0BD910()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25D0BD920()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25D0BD930()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25D0BD940()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25D0BD950()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25D0BD960()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25D0BD970()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25D0BD980()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25D0BD990()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25D0BD9A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25D0BD9B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25D0BD9C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25D0BD9D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25D0BD9E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25D0BD9F0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25D0BDA00()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_25D0BDA10()
{
  return MEMORY[0x270EF2778]();
}

uint64_t sub_25D0BDA20()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25D0BDA30()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AFExternalNotificationRequestHandlerStateGetName()
{
  return MEMORY[0x270F0ED40]();
}

uint64_t AFRequestCancellationReasonGetName()
{
  return MEMORY[0x270F0EF10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}