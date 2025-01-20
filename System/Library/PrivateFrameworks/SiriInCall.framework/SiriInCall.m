void type metadata accessor for SISchemaCallAppType(uint64_t a1)
{
  sub_21FAF06A4(a1, &qword_267EF5EE0);
}

void type metadata accessor for SISchemaCallState(uint64_t a1)
{
}

void type metadata accessor for SISchemaCallType(uint64_t a1)
{
}

void type metadata accessor for SICSchemaSICParticipantCountBucket(uint64_t a1)
{
}

void type metadata accessor for TUConversationAVMode(uint64_t a1)
{
}

void sub_21FAF06A4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t SICCall.isMuted.getter()
{
  return *v0;
}

unint64_t SICCall.mediaType.getter()
{
  return OUTLINED_FUNCTION_0(*(unsigned int *)(v0 + 4));
}

unint64_t SICCall.status.getter()
{
  return OUTLINED_FUNCTION_0(*(unsigned int *)(v0 + 12));
}

unint64_t SICCall.providerType.getter()
{
  return OUTLINED_FUNCTION_0(*(unsigned int *)(v0 + 28));
}

uint64_t SICCall.init(isMuted:mediaType:status:participantCount:providerType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(unsigned char *)a6 = result;
  *(_DWORD *)(a6 + 4) = a2;
  *(unsigned char *)(a6 + 8) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 12) = a3;
  *(unsigned char *)(a6 + 16) = BYTE4(a3) & 1;
  *(_DWORD *)(a6 + 20) = a4;
  *(unsigned char *)(a6 + 24) = BYTE4(a4) & 1;
  *(_DWORD *)(a6 + 28) = a5;
  *(unsigned char *)(a6 + 32) = BYTE4(a5) & 1;
  return result;
}

uint64_t SICCall.participantCountBucket.getter()
{
  unint64_t v1 = sub_21FAF079C(*(unsigned int *)(v0 + 20) | ((unint64_t)*(unsigned __int8 *)(v0 + 24) << 32));
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t sub_21FAF079C(unint64_t a1)
{
  if ((a1 & 0x100000000) == 0)
  {
    if ((int)a1 > 20)
    {
      uint64_t v2 = 6;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 10)
    {
      uint64_t v2 = 5;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 5)
    {
      uint64_t v2 = 4;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 2)
    {
      uint64_t v2 = 3;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if (a1 == 2)
    {
      uint64_t v2 = 2;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if (a1 == 1)
    {
      uint64_t v2 = 1;
      return v2 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((a1 & 0x80000000) != 0)
    {
      if (qword_267EF5E78 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_21FAF8380();
      __swift_project_value_buffer(v4, (uint64_t)qword_267EF62A0);
      v5 = sub_21FAF8360();
      os_log_type_t v6 = sub_21FAF84E0();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v7 = 67109120;
        sub_21FAF8530();
        _os_log_impl(&dword_21FAEE000, v5, v6, "Unknown participantCount=%d", v7, 8u);
        OUTLINED_FUNCTION_1();
      }
    }
  }
  uint64_t v2 = 0;
  return v2 | ((HIDWORD(a1) & 1) << 32);
}

uint64_t sub_21FAF091C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_21FAF8480();
  sub_21FAF8470();
  sub_21FAF8450();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v5 + 8))(&v26, v4, v5);
  if (v27)
  {
    sub_21FAF14AC(&v26, (uint64_t)v28);
    uint64_t v6 = v29;
    uint64_t v7 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
    if (qword_267EF5E78 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_21FAF8380();
    __swift_project_value_buffer(v9, (uint64_t)qword_267EF62A0);
    v10 = sub_21FAF8360();
    os_log_type_t v11 = sub_21FAF84D0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v12 = 134283521;
      sub_21FAF8470();
      sub_21FAF8450();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      *(void *)&long long v26 = v8;
      sub_21FAF8530();
      _os_log_impl(&dword_21FAEE000, v10, v11, "partcipantCount=%{private}ld", v12, 0xCu);
      OUTLINED_FUNCTION_1();
    }

    uint64_t v13 = v29;
    uint64_t v14 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    char v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    int v16 = sub_21FAF0CB8(v28);
    uint64_t v17 = v29;
    uint64_t v18 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    uint64_t result = sub_21FAF100C(v19);
    if (v8 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v8 <= 0x7FFFFFFF)
    {
      int v21 = result;
      char v22 = v15 & 1;
      uint64_t v23 = v29;
      uint64_t v24 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 32))(v23, v24);
      LODWORD(v23) = sub_21FAF1210(v25);

      *(unsigned char *)a2 = v22;
      *(_DWORD *)(a2 + 4) = v16;
      *(unsigned char *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 12) = v21;
      *(unsigned char *)(a2 + 16) = 0;
      *(_DWORD *)(a2 + 20) = v8;
      *(unsigned char *)(a2 + 24) = 0;
      *(_DWORD *)(a2 + 28) = v23;
      *(unsigned char *)(a2 + 32) = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    sub_21FAF154C((uint64_t)&v26, &qword_267EF5F70);
    uint64_t result = swift_release();
    *(unsigned char *)a2 = 2;
    *(_DWORD *)(a2 + 4) = 0;
    *(unsigned char *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 12) = 0;
    *(unsigned char *)(a2 + 16) = 0;
    *(_DWORD *)(a2 + 20) = 0;
    *(unsigned char *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = 0;
    *(unsigned char *)(a2 + 32) = 0;
  }
  return result;
}

uint64_t sub_21FAF0CB8(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v3 + 48))(&v25, v2, v3);
  if (!v26)
  {
    sub_21FAF154C((uint64_t)&v25, &qword_267EF5F78);
    uint64_t v15 = a1[3];
    uint64_t v16 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v15);
    uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
    LODWORD(v16) = objc_msgSend(v17, sel_supportsAudioAndVideo);
    id v18 = objc_msgSend(v17, sel_supportsAudioOnly);
    id v19 = v18;
    if (!v16)
    {

      return (uint64_t)v19;
    }
    if (v18)
    {
      uint64_t v20 = a1[3];
      uint64_t v21 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v20);
      char v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 40))(v20, v21);

      if (v22) {
        return 2;
      }
      else {
        return 1;
      }
    }

    return 2;
  }
  sub_21FAF14AC(&v25, (uint64_t)v28);
  uint64_t v4 = v29;
  uint64_t v5 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (v6 == 2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return 2;
  }
  if (v6 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return 1;
  }
  else
  {
    if (v6)
    {
      if (qword_267EF5E78 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_21FAF8380();
      __swift_project_value_buffer(v7, (uint64_t)qword_267EF62A0);
      sub_21FAF15A8((uint64_t)v28, (uint64_t)&v25);
      uint64_t v8 = sub_21FAF8360();
      os_log_type_t v9 = sub_21FAF84E0();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)v10 = 136315138;
        uint64_t v11 = v26;
        uint64_t v12 = v27;
        __swift_project_boxed_opaque_existential_1(&v25, v26);
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
        type metadata accessor for TUConversationAVMode(0);
        uint64_t v13 = sub_21FAF8400();
        sub_21FAF7238(v13, v14, &v24);
        sub_21FAF8530();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
        _os_log_impl(&dword_21FAEE000, v8, v9, "Unknown TUConversationAVMode encountered avMode=%s", v10, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return 0;
  }
}

uint64_t sub_21FAF100C(uint64_t a1)
{
  uint64_t v1 = a1;
  switch((int)a1)
  {
    case 0:
      if (qword_267EF5E78 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_21FAF8380();
      __swift_project_value_buffer(v2, (uint64_t)qword_267EF62A0);
      uint64_t v3 = sub_21FAF8360();
      os_log_type_t v4 = sub_21FAF84E0();
      if (!os_log_type_enabled(v3, v4))
      {

        goto LABEL_16;
      }
      uint64_t v1 = 2;
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_21FAEE000, v3, v4, "Encountered callStatus=idle mapping to disconnected", v5, 2u);
      OUTLINED_FUNCTION_1();

      break;
    case 1:
      return v1;
    case 2:
      uint64_t v1 = 5;
      break;
    case 3:
      uint64_t v1 = 4;
      break;
    case 4:
      uint64_t v1 = 3;
      break;
    case 5:
      if (qword_267EF5E78 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_21FAF8380();
      __swift_project_value_buffer(v6, (uint64_t)qword_267EF62A0);
      uint64_t v7 = sub_21FAF8360();
      os_log_type_t v8 = sub_21FAF84D0();
      if (os_log_type_enabled(v7, v8))
      {
        os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v9 = 0;
        _os_log_impl(&dword_21FAEE000, v7, v8, "Encountered callStatus=disconnecting mapping to connected", v9, 2u);
        OUTLINED_FUNCTION_1();
      }

      uint64_t v1 = 1;
      break;
    case 6:
LABEL_16:
      uint64_t v1 = 2;
      break;
    default:
      uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t sub_21FAF1210(void *a1)
{
  if (!objc_msgSend(a1, sel_isSystemProvider)) {
    return 3;
  }
  if (objc_msgSend(a1, sel_isFaceTimeProvider)) {
    return 2;
  }
  return (uint64_t)objc_msgSend(a1, sel_isTelephonyProvider);
}

uint64_t SICSchemaSICParticipantCountBucket.debugDescription.getter()
{
  return 63;
}

uint64_t sub_21FAF1320()
{
  return SICSchemaSICParticipantCountBucket.debugDescription.getter();
}

uint64_t initializeBufferWithCopyOfBuffer for SICCall(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy33_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SICCall(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && a1[33])
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *a1;
      if (v3 >= 2) {
        int v2 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      }
      else {
        int v2 = -2;
      }
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SICCall(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SICCall()
{
  return &type metadata for SICCall;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_21FAF14AC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21FAF154C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21FAF15A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t OUTLINED_FUNCTION_0@<X0>(uint64_t a1@<X8>)
{
  return a1 | ((unint64_t)v1 << 32);
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x223C5A4F0);
}

uint64_t sub_21FAF1638(uint64_t a1)
{
  return sub_21FAF1650(a1, MEMORY[0x263F70AC8]);
}

uint64_t sub_21FAF1644(uint64_t a1)
{
  return sub_21FAF1650(a1, MEMORY[0x263F70A88]);
}

uint64_t sub_21FAF1650(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = sub_21FAF8260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *a2, v4);
  uint64_t v8 = v2 + qword_26AD43870;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  swift_endAccess();
  uint64_t v9 = sub_21FAF8290();
  sub_21FAF1778(v9, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FAF1778(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = (void *)sub_21FAF8280();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(v5, a1, a2, (uint64_t)sub_21FAF25A4, (uint64_t)v6);
  swift_unknownObjectRelease();
  return swift_release();
}

void sub_21FAF1828(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43840);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21FAF83C0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(a2 + qword_26AD43860) = a1;
  if (qword_26AD43800 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21FAF8380();
  __swift_project_value_buffer(v14, (uint64_t)qword_26AD43890);
  uint64_t v15 = sub_21FAF8360();
  os_log_type_t v16 = sub_21FAF84D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = v11;
    uint64_t v18 = v10;
    id v19 = v9;
    uint64_t v20 = a3;
    uint64_t v21 = v17;
    *(_DWORD *)uint64_t v17 = 67109120;
    int v27 = a1 & 1;
    sub_21FAF8530();
    _os_log_impl(&dword_21FAEE000, v15, v16, "Phone call state retrieved: %{BOOL}d", v21, 8u);
    char v22 = v21;
    a3 = v20;
    uint64_t v9 = v19;
    uint64_t v10 = v18;
    uint64_t v11 = v26;
    MEMORY[0x223C5A4F0](v22, -1, -1);
  }

  if (a1)
  {
    sub_21FAF83A0();
    uint64_t v23 = sub_21FAF83B0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v24 = sub_21FAF84A0();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v24);
    long long v25 = (void *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
    v25[7] = v23;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_21FAF1CE8((uint64_t)v9, (uint64_t)&unk_267EF5F88, (uint64_t)v25);
    swift_release();
  }
}

uint64_t sub_21FAF1AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return MEMORY[0x270FA2498](sub_21FAF1B10, 0, 0);
}

uint64_t sub_21FAF1B10()
{
  OUTLINED_FUNCTION_2();
  *(void *)(v0 + 48) = qword_26AD43868;
  sub_21FAF8480();
  *(void *)(v0 + 56) = sub_21FAF8470();
  uint64_t v2 = sub_21FAF8450();
  return MEMORY[0x270FA2498](sub_21FAF1BAC, v2, v1);
}

uint64_t sub_21FAF1BAC()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_release();
  sub_21FAF091C((void *)(v2 + v1), v0 + 64);
  return MEMORY[0x270FA2498](sub_21FAF1C30, 0, 0);
}

uint64_t sub_21FAF1C30()
{
  uint64_t v23 = v0;
  unint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  int v4 = *(_DWORD *)(v0 + 68);
  char v5 = *(unsigned char *)(v0 + 72);
  int v6 = *(_DWORD *)(v0 + 76);
  char v7 = *(unsigned char *)(v0 + 80);
  int v8 = *(_DWORD *)(v0 + 84);
  char v9 = *(unsigned char *)(v0 + 88);
  int v10 = *(_DWORD *)(v0 + 92);
  char v11 = *(unsigned char *)(v0 + 96);
  v14[0] = *(unsigned char *)(v0 + 64);
  int v15 = v4;
  char v16 = v5;
  int v17 = v6;
  char v18 = v7;
  int v19 = v8;
  char v20 = v9;
  int v21 = v10;
  char v22 = v11;
  SiriInCallInstrumentationUtil.logInvocationContext(occurringFor:at:callMetadata:)(v3, v1, v2, v14);
  OUTLINED_FUNCTION_3();
  return v12();
}

uint64_t sub_21FAF1CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21FAF84A0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21FAF27DC(a1);
  }
  else
  {
    sub_21FAF8490();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21FAF8450();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_21FAF1E50(Swift::String endedFor, char a2)
{
  object = endedFor._object;
  uint64_t countAndFlagsBits = endedFor._countAndFlagsBits;
  int v5 = *(unsigned __int8 *)(v2 + qword_26AD43860);
  if (v5 == 2)
  {
    if (qword_26AD43800 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21FAF8380();
    __swift_project_value_buffer(v6, (uint64_t)qword_26AD43890);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_21FAF8360();
    os_log_type_t v8 = sub_21FAF84E0();
    if (os_log_type_enabled(v7, v8))
    {
      char v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = v10;
      *(_DWORD *)char v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_21FAF7238(countAndFlagsBits, (unint64_t)object, &v11);
      sub_21FAF8530();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FAEE000, v7, v8, "Phone call state unknown at time of request completion requestId=%s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C5A4F0](v10, -1, -1);
      MEMORY[0x223C5A4F0](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else if (v5)
  {
    SiriInCallInstrumentationUtil.logInvocationContext(endedFor:isCancelled:)(endedFor, a2 & 1);
  }
}

void ButterflyRequestProcessor.__allocating_init(_:_:_:_:_:_:)()
{
}

void ButterflyRequestProcessor.init(_:_:_:_:_:_:)()
{
}

void ButterflyRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
}

void ButterflyRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
}

void ButterflyRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
}

void ButterflyRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
}

uint64_t sub_21FAF2150()
{
  uint64_t v1 = v0 + qword_26AD43870;
  sub_21FAF8260();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_release();
  uint64_t v3 = v0 + qword_26AD43868;
  return __swift_destroy_boxed_opaque_existential_1(v3);
}

uint64_t ButterflyRequestProcessor.deinit()
{
  uint64_t v0 = sub_21FAF82A0();
  uint64_t v1 = v0 + qword_26AD43870;
  sub_21FAF8260();
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26AD43868);
  return v0;
}

uint64_t ButterflyRequestProcessor.__deallocating_deinit()
{
  ButterflyRequestProcessor.deinit();
  return MEMORY[0x270FA0228]();
}

uint64_t type metadata accessor for ButterflyRequestProcessor()
{
  uint64_t result = qword_26AD437C0;
  if (!qword_26AD437C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21FAF22EC()
{
  uint64_t result = sub_21FAF8260();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ButterflyRequestProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ButterflyRequestProcessor);
}

uint64_t sub_21FAF23BC()
{
  return type metadata accessor for ButterflyRequestProcessor();
}

uint64_t sub_21FAF23C4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_21FAF24A0;
  return v6(a1);
}

uint64_t sub_21FAF24A0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t sub_21FAF2564()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21FAF25A4(char a1)
{
  sub_21FAF1828(a1, v1[2], v1[3], v1[4]);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_21FAF25D8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21FAF2620(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_21FAF26F4;
  return sub_21FAF1AEC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_21FAF26F4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_21FAF27DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FAF283C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21FAF2874(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21FAF26F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267EF5F90 + dword_267EF5F90);
  return v6(a1, v4);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0 + 8;
}

double sub_21FAF2980@<D0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_frontmostAudioOrVideoCall);
  if (v3)
  {
    id v4 = v3;
    *(void *)(a1 + 24) = sub_21FAF2F34(0, &qword_267EF5FC8);
    *(void *)(a1 + 32) = &off_26D154720;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

double sub_21FAF29F8@<D0>(uint64_t a1@<X8>)
{
  return sub_21FAF2980(a1);
}

char *sub_21FAF2A1C()
{
  uint64_t v1 = v0;
  if (objc_msgSend(v0, sel_isConversation))
  {
    id v2 = objc_msgSend(self, sel_sharedInstance);
    id v3 = objc_msgSend(v2, sel_activeConversationForCall_, v0);

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_activeRemoteParticipants);
      sub_21FAF2F34(0, &qword_267EF5FB8);
      sub_21FAF2EE4(&qword_267EF5FC0, &qword_267EF5FB8);
      uint64_t v5 = sub_21FAF84C0();

      uint64_t v1 = (char *)sub_21FAF2C78(v5);
      swift_bridgeObjectRelease();

      double result = v1 + 1;
      if (!__OFADD__(v1, 1)) {
        return result;
      }
      __break(1u);
    }
  }
  if (qword_267EF5E78 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21FAF8380();
  __swift_project_value_buffer(v7, (uint64_t)qword_267EF62A0);
  uint64_t v8 = sub_21FAF8360();
  os_log_type_t v9 = sub_21FAF84E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21FAEE000, v8, v9, "Call not backed by conversation.  Using alternate partcipantCount method.", v10, 2u);
    MEMORY[0x223C5A4F0](v10, -1, -1);
  }

  id v11 = objc_msgSend(v1, sel_remoteParticipantHandles);
  sub_21FAF2F34(0, &qword_267EF5FA8);
  sub_21FAF2EE4(&qword_267EF5FB0, &qword_267EF5FA8);
  uint64_t v12 = sub_21FAF84C0();

  uint64_t v13 = sub_21FAF2C78(v12);
  swift_bridgeObjectRelease();
  double result = (char *)(v13 + 1);
  if (__OFADD__(v13, 1)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21FAF2C78(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return *(void *)(a1 + 16);
  }
  if (a1 < 0) {
    return MEMORY[0x270F9E848](a1);
  }
  return MEMORY[0x270F9E848](a1 & 0xFFFFFFFFFFFFFF8);
}

double sub_21FAF2C98@<D0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(self, sel_sharedInstance);
  id v4 = objc_msgSend(v3, sel_activeConversationForCall_, v1);

  if (v4)
  {
    *(void *)(a1 + 24) = sub_21FAF2F34(0, &qword_267EF5FA0);
    *(void *)(a1 + 32) = &off_26D154758;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

unint64_t sub_21FAF2D40()
{
  return (unint64_t)sub_21FAF2D68() & 1;
}

id sub_21FAF2D68()
{
  return objc_msgSend(v0, sel_isUplinkMuted);
}

id sub_21FAF2D8C()
{
  return sub_21FAF2DB0();
}

id sub_21FAF2DB0()
{
  return objc_msgSend(v0, sel_status);
}

char *sub_21FAF2DC0()
{
  return sub_21FAF2A1C();
}

id sub_21FAF2DE4()
{
  return sub_21FAF2E08();
}

id sub_21FAF2E08()
{
  id v1 = objc_msgSend(v0, sel_provider);
  return v1;
}

unint64_t sub_21FAF2E40()
{
  return (unint64_t)sub_21FAF2E68() & 1;
}

id sub_21FAF2E68()
{
  return objc_msgSend(v0, sel_isVideo);
}

double sub_21FAF2E8C@<D0>(uint64_t a1@<X8>)
{
  return sub_21FAF2C98(a1);
}

id sub_21FAF2EB0()
{
  return sub_21FAF2ED4();
}

id sub_21FAF2ED4()
{
  return objc_msgSend(v0, sel_avMode);
}

uint64_t sub_21FAF2EE4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21FAF2F34(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FAF2F34(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FAF2F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = self;
  uint64_t v5 = (void *)sub_21FAF8110();
  id v6 = objc_msgSend(v4, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, a1, v5);

  if (v6)
  {
    sub_21FAF8120();

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = sub_21FAF8130();
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v8);
}

void static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26AD43800 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_21FAF8380();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AD43890);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_21FAF8360();
  os_log_type_t v11 = sub_21FAF84D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21FAF7238(a2, a3, aBlock);
    sub_21FAF8530();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FAEE000, v10, v11, "Fetching isUserOnACall status for requestId: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C5A4F0](v13, -1, -1);
    MEMORY[0x223C5A4F0](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (objc_msgSend(a1, sel_respondsToSelector_, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, a2, v22, aBlock[0]))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43830);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21FAF8CC0;
    *(void *)(inited + 32) = sub_21FAF83F0();
    *(void *)(inited + 40) = v15;
    swift_unknownObjectRetain();
    sub_21FAF3BFC(inited);
    char v16 = (void *)swift_allocObject();
    v16[2] = v21;
    v16[3] = a3;
    v16[4] = a4;
    v16[5] = a5;
    swift_bridgeObjectRetain();
    swift_retain();
    int v17 = (void *)sub_21FAF84B0();
    char v18 = (void *)sub_21FAF83E0();
    aBlock[4] = (uint64_t)sub_21FAF3E0C;
    aBlock[5] = (uint64_t)v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21FAF377C;
    aBlock[3] = (uint64_t)&block_descriptor;
    int v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, v17, v18, 0, v19);
    _Block_release(v19);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t static ButterflyCallStateManager.isUserOnACall(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_21FAF33A0, 0, 0);
}

uint64_t sub_21FAF33A0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(void *)(v2 + 32) = v1;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *id v3 = v0;
  v3[1] = sub_21FAF34AC;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 56, 0, 0, 0xD000000000000013, 0x800000021FAF9B00, sub_21FAF3E30, v2, v4);
}

uint64_t sub_21FAF34AC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21FAF35C4, 0, 0);
}

uint64_t sub_21FAF35C4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_21FAF35DC(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF5FD8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(a2, a3, a4, (uint64_t)sub_21FAF3EE0, v12);
  return swift_release();
}

uint64_t sub_21FAF3738()
{
  return sub_21FAF8460();
}

uint64_t sub_21FAF377C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_21FAF3F54();
    uint64_t v2 = sub_21FAF8440();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FAF37F4(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(BOOL))
{
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_21FAF85D0();
  if (!result)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    long long v26 = 0u;
    long long v27 = 0u;
    goto LABEL_13;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x223C5A0F0](0, a1);
  }
  else
  {
    if (!*(void *)(v8 + 16))
    {
      __break(1u);
      return result;
    }
    id v11 = *(id *)(a1 + 32);
  }
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_21FAF4150(v12);
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_21FAF83F0();
  sub_21FAF3B2C(v15, v16, v14, &v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v27 + 1))
  {
LABEL_13:
    sub_21FAF3F94((uint64_t)&v26);
    BOOL v29 = 0;
    goto LABEL_14;
  }
  sub_21FAF41C8(&v26, v28);
  sub_21FAF41D8((uint64_t)v28, (uint64_t)&v26);
  id v17 = objc_allocWithZone(MEMORY[0x263F28450]);
  id v18 = sub_21FAF3B90(&v26);
  id v19 = objc_msgSend(v18, sel_callState);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  BOOL v29 = v19 != 0;
LABEL_14:
  if (qword_26AD43800 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_21FAF8380();
  __swift_project_value_buffer(v20, (uint64_t)qword_26AD43890);
  BOOL v21 = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_21FAF8360();
  os_log_type_t v23 = sub_21FAF84D0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(void *)&v28[0] = v25;
    *(_DWORD *)uint64_t v24 = 67109378;
    LODWORD(v26) = v21;
    sub_21FAF8530();
    *(_WORD *)(v24 + 8) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v26 = sub_21FAF7238(a2, a3, (uint64_t *)v28);
    sub_21FAF8530();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FAEE000, v22, v23, "Retrieved isUserOnACall status: %{BOOL}d for requestId: %s", (uint8_t *)v24, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x223C5A4F0](v25, -1, -1);
    MEMORY[0x223C5A4F0](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return a4(v29);
}

double sub_21FAF3B2C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_21FAF3FF4(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_21FAF41D8(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

id sub_21FAF3B90(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v3 = objc_msgSend(v1, sel_initWithSerializedBackingStore_, sub_21FAF8600());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_21FAF3BFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43828);
  uint64_t result = sub_21FAF8560();
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
    unint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_21FAF8620();
    swift_bridgeObjectRetain();
    sub_21FAF8410();
    uint64_t result = sub_21FAF8640();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_21FAF8610(), (result & 1) != 0))
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
        id v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_21FAF8610();
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

uint64_t sub_21FAF3DCC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21FAF3E0C(unint64_t a1)
{
  return sub_21FAF37F4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(BOOL))(v1 + 32));
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

uint64_t sub_21FAF3E30(uint64_t a1)
{
  return sub_21FAF35DC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

ValueMetadata *type metadata accessor for ButterflyCallStateManager()
{
  return &type metadata for ButterflyCallStateManager;
}

uint64_t sub_21FAF3E4C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF5FD8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_21FAF3EE0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EF5FD8);
  return sub_21FAF3738();
}

unint64_t sub_21FAF3F54()
{
  unint64_t result = qword_26AD43810;
  if (!qword_26AD43810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD43810);
  }
  return result;
}

uint64_t sub_21FAF3F94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43838);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21FAF3FF4(uint64_t a1, uint64_t a2)
{
  sub_21FAF8620();
  sub_21FAF8410();
  uint64_t v4 = sub_21FAF8640();
  return sub_21FAF406C(a1, a2, v4);
}

unint64_t sub_21FAF406C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21FAF8610() & 1) == 0)
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
      while (!v14 && (sub_21FAF8610() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21FAF4150(void *a1)
{
  id v2 = objc_msgSend(a1, sel_serializedContextByKey);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21FAF83D0();

  return v3;
}

_OWORD *sub_21FAF41C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21FAF41D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ButterflyBridge.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  return ButterflyBridge.init(_:_:_:_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t ButterflyBridge.init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v9 = sub_21FAF8380();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_0();
  uint64_t v27 = sub_21FAF8350();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_1();
  uint64_t v18 = v17 - v16;
  sub_21FAF44F0();
  sub_21FAF8300();
  uint64_t v28 = a3;
  uint64_t v19 = a3;
  uint64_t v20 = a6;
  sub_21FAF15A8(v19, (uint64_t)v30);
  sub_21FAF15A8(a6, (uint64_t)v29);
  uint64_t v21 = qword_26AD43800;
  swift_unknownObjectRetain();
  id v22 = a5;
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v9, (uint64_t)qword_26AD43890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v6, v23, v9);
  uint64_t v24 = sub_21FAF82C0();
  swift_retain();
  sub_21FAF453C();
  sub_21FAF82E0();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v20);
  __swift_destroy_boxed_opaque_existential_1(v28);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v27);
  return v24;
}

unint64_t sub_21FAF44F0()
{
  unint64_t result = qword_26AD437B8;
  if (!qword_26AD437B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD437B8);
  }
  return result;
}

uint64_t sub_21FAF453C()
{
  sub_21FAF8200();
  sub_21FAF82B0();
  sub_21FAF81F0();
  sub_21FAF82B0();
  sub_21FAF8180();
  sub_21FAF82B0();
  sub_21FAF8190();
  sub_21FAF82B0();
  sub_21FAF8170();
  sub_21FAF82B0();
  sub_21FAF8240();
  sub_21FAF82B0();
  sub_21FAF8220();
  sub_21FAF82B0();
  sub_21FAF81E0();
  sub_21FAF82B0();
  sub_21FAF81D0();
  sub_21FAF82B0();
  sub_21FAF81C0();
  sub_21FAF82B0();
  sub_21FAF8150();
  sub_21FAF82B0();
  sub_21FAF8160();
  sub_21FAF82B0();
  sub_21FAF81B0();
  sub_21FAF82B0();
  sub_21FAF8210();
  sub_21FAF82B0();
  sub_21FAF8230();
  sub_21FAF82B0();
  sub_21FAF81A0();
  return sub_21FAF82B0();
}

uint64_t (*sub_21FAF47DC())(void *a1)
{
  return sub_21FAF5504;
}

uint64_t (*sub_21FAF4820())(void *a1)
{
  return sub_21FAF55B8;
}

uint64_t sub_21FAF4860(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v6 = sub_21FAF8260();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  uint64_t v12 = v11 - v10;
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v11 - v10, *a3, v6);
  sub_21FAF4EA4(v12, a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
}

uint64_t (*sub_21FAF4930())(void *a1)
{
  return sub_21FAF5594;
}

uint64_t (*sub_21FAF4974())(void *a1)
{
  return sub_21FAF5528;
}

uint64_t (*sub_21FAF49B8())(void *a1)
{
  return sub_21FAF5570;
}

uint64_t (*sub_21FAF49FC())(void *a1)
{
  return sub_21FAF554C;
}

uint64_t (*sub_21FAF4A40())()
{
  return sub_21FAF54FC;
}

uint64_t sub_21FAF4A80()
{
  v2._uint64_t countAndFlagsBits = sub_21FAF8290();
  sub_21FAF1E50(v2, 1);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21FAF4AC8())()
{
  return sub_21FAF54E0;
}

uint64_t sub_21FAF4B0C()
{
  v2._uint64_t countAndFlagsBits = sub_21FAF8290();
  sub_21FAF1E50(v2, 0);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21FAF4B50())(uint64_t)
{
  return sub_21FAF54DC;
}

uint64_t (*sub_21FAF4B94())(uint64_t)
{
  return sub_21FAF54D8;
}

uint64_t (*sub_21FAF4BD8())()
{
  return sub_21FAF54D0;
}

uint64_t sub_21FAF4C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_21FAF8130();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v5, a3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_21FAF8340();
  uint64_t v14 = v13;
  sub_21FAF8330();
  uint64_t v15 = sub_21FAF8320();
  id v16 = objc_msgSend(self, sel_sharedInstance);
  if (qword_26AD43698 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26AD436D0;
  type metadata accessor for ButterflyRequestProcessor();
  uint64_t v18 = swift_allocObject();
  swift_retain();
  return sub_21FAF51C0(a1, a2, v5, a4, a5, 0, 0xE000000000000000, v12, v14, (uint64_t)v21, v15, (uint64_t)v16, v17, v18);
}

void ButterflyBridge.__allocating_init(_:_:_:_:_:_:)()
{
}

void ButterflyBridge.init(_:_:_:_:_:_:)()
{
}

void ButterflyBridge.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
}

void ButterflyBridge.init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
}

uint64_t ButterflyBridge.__deallocating_deinit()
{
  uint64_t v0 = _s10SiriInCall15ButterflyBridgeCfd_0();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_21FAF4EA4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21FAF8260();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  uint64_t v12 = v11 - v10;
  if (qword_26AD43800 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_21FAF8380();
  __swift_project_value_buffer(v13, (uint64_t)qword_26AD43890);
  id v14 = a2;
  uint64_t v15 = sub_21FAF8360();
  os_log_type_t v16 = sub_21FAF84D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v28 = v12;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v29[0] = v27;
    *(_DWORD *)uint64_t v17 = 138412546;
    id v19 = v14;
    sub_21FAF8530();
    *uint64_t v18 = v14;

    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v20 = sub_21FAF8250();
    sub_21FAF7238(v20, v21, v29);
    sub_21FAF8530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FAEE000, v15, v16, "ButterflyRequestProcessor handling message: %@, requestId: %s", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD43818);
    swift_arrayDestroy();
    MEMORY[0x223C5A4F0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C5A4F0](v27, -1, -1);
    uint64_t v22 = v17;
    uint64_t v12 = v28;
    MEMORY[0x223C5A4F0](v22, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, a1, v6);
  uint64_t v23 = a3 + qword_26AD43870;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v23, v12, v6);
  swift_endAccess();
  uint64_t v24 = sub_21FAF8250();
  sub_21FAF1778(v24, v25);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FAF51C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  v25[7] = a5;
  v25[8] = a8;
  v25[5] = a6;
  v25[6] = a4;
  v25[2] = a1;
  v25[3] = a2;
  v25[4] = a9;
  v25[1] = a11;
  uint64_t v15 = sub_21FAF8130();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = sub_21FAF5490();
  v27[4] = &off_26D154710;
  v27[3] = v19;
  v27[0] = a12;
  uint64_t v20 = a14 + qword_26AD43870;
  uint64_t v21 = *MEMORY[0x263F70AB0];
  uint64_t v22 = sub_21FAF8260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  *(unsigned char *)(a14 + qword_26AD43860) = 2;
  sub_21FAF15A8((uint64_t)v27, a14 + qword_26AD43868);
  *(void *)(a14 + qword_26AD43878) = a13;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a3, v15);
  sub_21FAF15A8(a10, (uint64_t)v26);
  uint64_t v23 = sub_21FAF8270();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1(a10);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  return v23;
}

uint64_t type metadata accessor for ButterflyBridge()
{
  uint64_t result = qword_26AD436A0;
  if (!qword_26AD436A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21FAF5430()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ButterflyBridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ButterflyBridge);
}

uint64_t sub_21FAF5488()
{
  return type metadata accessor for ButterflyBridge();
}

unint64_t sub_21FAF5490()
{
  unint64_t result = qword_26AD43808;
  if (!qword_26AD43808)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD43808);
  }
  return result;
}

uint64_t sub_21FAF54D0()
{
  return sub_21FAF4B0C();
}

uint64_t sub_21FAF54E0()
{
  return sub_21FAF4B0C();
}

uint64_t sub_21FAF54FC()
{
  return sub_21FAF4A80();
}

uint64_t sub_21FAF5504(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70A98]);
}

uint64_t sub_21FAF5528(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70AB0]);
}

uint64_t sub_21FAF554C(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70A90]);
}

uint64_t sub_21FAF5570(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70AC0]);
}

uint64_t sub_21FAF5594(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70AA0]);
}

uint64_t sub_21FAF55B8(void *a1)
{
  return sub_21FAF4860(a1, v1, MEMORY[0x263F70A78]);
}

ValueMetadata *type metadata accessor for ButterflyBridgeLog()
{
  return &type metadata for ButterflyBridgeLog;
}

void sub_21FAF5630()
{
  qword_267EF5FE0 = 0x636974796C616E41;
  *(void *)algn_267EF5FE8 = 0xE900000000000073;
}

void sub_21FAF5658()
{
  qword_26AD436B0 = 0x6C66726574747542;
  *(void *)algn_26AD436B8 = 0xEF65676469724279;
}

uint64_t sub_21FAF5688()
{
  sub_21FAF57C4();
  if (qword_26AD43688 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_21FAF8520();
  qword_26AD43858 = result;
  return result;
}

uint64_t *sub_21FAF5728()
{
  if (qword_26AD437B0 != -1) {
    swift_once();
  }
  return &qword_26AD43858;
}

id sub_21FAF5774()
{
  sub_21FAF5728();
  uint64_t v0 = (void *)qword_26AD43858;
  return v0;
}

uint64_t sub_21FAF57A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  return MEMORY[0x270F70F90](a1, a2, a3, a4, a5, a6 & 0x1FF);
}

unint64_t sub_21FAF57C4()
{
  unint64_t result = qword_26AD43820;
  if (!qword_26AD43820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD43820);
  }
  return result;
}

uint64_t sub_21FAF5804()
{
  uint64_t v0 = sub_21FAF8380();
  __swift_allocate_value_buffer(v0, qword_267EF62A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EF62A0);
  if (qword_267EF5E70 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_21FAF8370();
}

uint64_t sub_21FAF58C0()
{
  uint64_t v0 = sub_21FAF8380();
  __swift_allocate_value_buffer(v0, qword_26AD43890);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD43890);
  if (qword_26AD437B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AD43858;
  return sub_21FAF8390();
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

uint64_t dispatch thunk of FeatureFlagging.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void SiriInCallInstrumentationUtil.logInvocationContext(occurringFor:at:callMetadata:)(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = v4;
  uint64_t v66 = a1;
  uint64_t v9 = sub_21FAF8380();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v15 = *a4;
  unsigned int v16 = *((_DWORD *)a4 + 1);
  int v17 = a4[8];
  unsigned int v58 = *((_DWORD *)a4 + 3);
  unsigned int v59 = v16;
  int v61 = a4[16];
  int v62 = v17;
  uint64_t v65 = *((unsigned int *)a4 + 5);
  int v18 = a4[24];
  unsigned int v60 = *((_DWORD *)a4 + 7);
  int v63 = a4[32];
  int v64 = v18;
  if (qword_267EF5E78 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v9, (uint64_t)qword_267EF62A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v19, v9);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_21FAF8360();
  int v21 = sub_21FAF84D0();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    int v53 = v21;
    uint64_t v56 = a3;
    uint64_t v57 = v5;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v68 = v52;
    *(_DWORD *)uint64_t v22 = 136316418;
    int v23 = v15;
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_21FAF7238(v66, a2, &v68);
    sub_21FAF8530();
    unint64_t v55 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v24 = 1702195828;
    if ((v15 & 1) == 0) {
      uint64_t v24 = 0x65736C6166;
    }
    unint64_t v25 = 0xE400000000000000;
    if ((v15 & 1) == 0) {
      unint64_t v25 = 0xE500000000000000;
    }
    int v54 = v15;
    if (v15 == 2) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = v24;
    }
    unint64_t v27 = 0xE000000000000000;
    if (v23 == 2) {
      unint64_t v28 = 0xE000000000000000;
    }
    else {
      unint64_t v28 = v25;
    }
    uint64_t v67 = sub_21FAF7238(v26, v28, &v68);
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2080;
    if (v61)
    {
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = sub_21FAF8500();
      unint64_t v27 = v32;
    }
    uint64_t v67 = sub_21FAF7238(v29, v27, &v68);
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 32) = 2080;
    a2 = v55;
    if (v62)
    {
      uint64_t v33 = 0;
      unint64_t v34 = 0xE000000000000000;
    }
    else
    {
      uint64_t v33 = sub_21FAF84F0();
      unint64_t v34 = v35;
    }
    uint64_t v67 = sub_21FAF7238(v33, v34, &v68);
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 42) = 2080;
    LOBYTE(v67) = v64;
    if ((sub_21FAF079C(v65 | ((unint64_t)v64 << 32)) & 0x100000000) != 0)
    {
      uint64_t v36 = 0;
      unint64_t v38 = 0xE000000000000000;
    }
    else
    {
      uint64_t v36 = SICSchemaSICParticipantCountBucket.debugDescription.getter();
      unint64_t v38 = v37;
    }
    uint64_t v67 = sub_21FAF7238(v36, v38, &v68);
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 52) = 2080;
    if (v63)
    {
      uint64_t v39 = 0;
      unint64_t v40 = 0xE000000000000000;
    }
    else
    {
      uint64_t v39 = sub_21FAF8510();
      unint64_t v40 = v41;
    }
    a3 = v56;
    int v15 = v54;
    uint64_t v42 = sub_21FAF7238(v39, v40, &v68);
    OUTLINED_FUNCTION_2_1(v42);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FAEE000, v20, (os_log_type_t)v53, "Emitting invocation context started instrumentation. requestId=%s isMuted=%s callStatus=%s mediaType=%s participants=%s providerType=%s", (uint8_t *)v22, 0x3Eu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    uint64_t v43 = OUTLINED_FUNCTION_3_0();
    v44(v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v30 = OUTLINED_FUNCTION_3_0();
    v31(v30);
  }
  id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC80]), sel_init);
  if (v45)
  {
    v46 = v45;
    id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC90]), sel_init);
    if (v47)
    {
      v48 = v47;
      if ((v61 & 1) == 0) {
        objc_msgSend(v47, sel_setCallState_, v58);
      }
      if ((v62 & 1) == 0) {
        objc_msgSend(v48, sel_setCallType_, v59);
      }
      if ((v63 & 1) == 0) {
        objc_msgSend(v48, sel_setCallAppType_, v60);
      }
      LOBYTE(v68) = v64;
      uint64_t v49 = sub_21FAF079C(v65 | ((unint64_t)v64 << 32));
      if ((v49 & 0x100000000) == 0) {
        objc_msgSend(v48, sel_setParticipantCountBucket_, v49);
      }
      if (v15 != 2) {
        objc_msgSend(v48, sel_setIsMuted_, v15 & 1);
      }
      objc_msgSend(v46, sel_setStartedOrChanged_, v48);
      uint64_t v50 = v66;
      sub_21FAF68C4(v66, a2, a3);
      sub_21FAF6344((uint64_t)v46, v50, a2, a3);
    }
    else
    {
      v48 = v46;
    }
  }
}

Swift::Void __swiftcall SiriInCallInstrumentationUtil.logInvocationContext(endedFor:isCancelled:)(Swift::String endedFor, Swift::Bool isCancelled)
{
  BOOL v24 = isCancelled;
  object = endedFor._object;
  uint64_t countAndFlagsBits = endedFor._countAndFlagsBits;
  uint64_t v4 = sub_21FAF83C0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267EF5E78 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_21FAF8380();
  __swift_project_value_buffer(v10, (uint64_t)qword_267EF62A0);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_21FAF8360();
  os_log_type_t v12 = sub_21FAF84D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    int v23 = v9;
    uint64_t v26 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21FAF7238(countAndFlagsBits, (unint64_t)object, &v26);
    OUTLINED_FUNCTION_2_1(v15);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 1024;
    int v25 = v24;
    sub_21FAF8530();
    _os_log_impl(&dword_21FAEE000, v11, v12, "Emitting invocation context ended instrumentation. requestId=%s isCancelled=%{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    uint64_t v9 = v23;
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC80]), sel_init);
  if (v16)
  {
    int v17 = v16;
    if (v24)
    {
      id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC78]), sel_init);
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = &selRef_setCancelled_;
LABEL_12:
        objc_msgSend(v19, sel_setExists_, 1);
        objc_msgSend(v17, *v20, v19);

        sub_21FAF83A0();
        uint64_t v22 = sub_21FAF83B0();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
        sub_21FAF6344((uint64_t)v17, countAndFlagsBits, (unint64_t)object, v22);
      }
    }
    else
    {
      id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC88]), sel_init);
      if (v21)
      {
        uint64_t v19 = v21;
        uint64_t v20 = &selRef_setEnded_;
        goto LABEL_12;
      }
    }
  }
}

uint64_t sub_21FAF61FC()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedStream);
  id v2 = objc_msgSend(v0, sel_sharedAnalytics);
  id v3 = objc_msgSend(v2, sel_defaultMessageStream);

  type metadata accessor for SiriInCallInstrumentationUtil();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v3;
  qword_26AD436D0 = result;
  return result;
}

uint64_t static SiriInCallInstrumentationUtil.sharedInstance.getter()
{
  if (qword_26AD43698 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t SiriInCallInstrumentationUtil.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t SiriInCallInstrumentationUtil.init(_:_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

void sub_21FAF6344(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v36 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD43678);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = sub_21FAF8130();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v34 - v18;
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v34 - v20;
  sub_21FAF8100();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_21FAF7A44((uint64_t)v11);
    if (qword_267EF5E78 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_21FAF8380();
    __swift_project_value_buffer(v22, (uint64_t)qword_267EF62A0);
    swift_bridgeObjectRetain_n();
    int v23 = sub_21FAF8360();
    os_log_type_t v24 = sub_21FAF84E0();
    if (os_log_type_enabled(v23, v24))
    {
      int v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v39 = v26;
      *(_DWORD *)int v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_21FAF7238(a2, a3, &v39);
      sub_21FAF8530();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FAEE000, v23, v24, "RequestId=%s isn't in the right format of a uuid string", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C5A4F0](v26, -1, -1);
      MEMORY[0x223C5A4F0](v25, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v35 = a4;
    unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v27(v21, v11, v12);
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC68]), sel_init);
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EC70]), sel_init);
      if (v30)
      {
        id v34 = v30;
        sub_21FAF2F70(29, (uint64_t)v9);
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v12) == 1)
        {
          (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);

          sub_21FAF7A44((uint64_t)v9);
        }
        else
        {
          v27(v19, v9, v12);
          sub_21FAF7AA4();
          (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v19, v12);
          id v31 = sub_21FAF6828((uint64_t)v16);
          id v32 = v34;
          objc_msgSend(v34, sel_setSicId_, v31);

          objc_msgSend(v29, sel_setEventMetadata_, v32);
          objc_msgSend(v29, sel_setSiriInCallInvocationContext_, v36);
          objc_msgSend(*(id *)(v37 + 16), sel_emitMessage_timestamp_, v29, v35);

          uint64_t v33 = *(void (**)(char *, uint64_t))(v13 + 8);
          v33(v19, v12);
          v33(v21, v12);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);
    }
  }
}

id sub_21FAF6828(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = (void *)sub_21FAF8110();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_21FAF8130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_21FAF68C4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD43678);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v66 - v10;
  uint64_t v12 = sub_21FAF8130();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v66 - v18;
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)v66 - v20;
  sub_21FAF8100();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_21FAF7A44((uint64_t)v11);
    if (qword_267EF5E78 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_21FAF8380();
    __swift_project_value_buffer(v22, (uint64_t)qword_267EF62A0);
    swift_bridgeObjectRetain_n();
    int v23 = sub_21FAF8360();
    os_log_type_t v24 = sub_21FAF84E0();
    if (os_log_type_enabled(v23, v24))
    {
      int v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v78 = v26;
      *(_DWORD *)int v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_21FAF7238(a1, a2, &v78);
      sub_21FAF8530();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FAEE000, v23, v24, "RequestId=%s isn't in the right format of a uuid string", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C5A4F0](v26, -1, -1);
      MEMORY[0x223C5A4F0](v25, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  uint64_t v74 = a3;
  v75 = v19;
  unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v27(v21, v11, v12);
  sub_21FAF2F70(29, (uint64_t)v9);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v12) != 1)
  {
    uint64_t v33 = v75;
    v27(v75, v9, v12);
    sub_21FAF7AA4();
    uint64_t v34 = v13;
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v35(v16, v33, v12);
    id v36 = sub_21FAF6828((uint64_t)v16);
    v35(v16, v21, v12);
    id v37 = sub_21FAF6828((uint64_t)v16);
    id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
    if (v38)
    {
      uint64_t v39 = v38;
      id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
      if (v40)
      {
        unint64_t v41 = v40;
        id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
        if (v42)
        {
          uint64_t v43 = v42;
          id v72 = v36;
          objc_msgSend(v41, sel_setUuid_, v36);
          objc_msgSend(v41, sel_setComponent_, 29);
          objc_msgSend(v39, sel_setSource_, v41);
          objc_msgSend(v43, sel_setUuid_, v37);
          objc_msgSend(v43, sel_setComponent_, 1);
          id v71 = v43;
          objc_msgSend(v39, sel_setTarget_, v43);
          if (qword_267EF5E78 != -1) {
            swift_once();
          }
          uint64_t v44 = sub_21FAF8380();
          __swift_project_value_buffer(v44, (uint64_t)qword_267EF62A0);
          id v36 = v39;
          id v45 = sub_21FAF8360();
          os_log_type_t v46 = sub_21FAF84E0();
          int v70 = v46;
          BOOL v47 = os_log_type_enabled(v45, v46);
          uint64_t v48 = v74;
          if (v47)
          {
            uint64_t v49 = swift_slowAlloc();
            uint64_t v73 = v34;
            uint64_t v50 = (uint8_t *)v49;
            uint64_t v69 = swift_slowAlloc();
            uint64_t v78 = v69;
            uint64_t v67 = v50;
            os_log_t v68 = v45;
            *(_DWORD *)uint64_t v50 = 136315138;
            v66[1] = v50 + 4;
            id v51 = v36;
            id v52 = objc_msgSend(v51, sel_description);
            id v53 = v37;
            uint64_t v54 = sub_21FAF83F0();
            unint64_t v56 = v55;

            uint64_t v57 = v54;
            id v37 = v53;
            uint64_t v77 = sub_21FAF7238(v57, v56, &v78);
            sub_21FAF8530();

            uint64_t v48 = v74;
            swift_bridgeObjectRelease();
            unsigned int v59 = v67;
            os_log_t v58 = v68;
            _os_log_impl(&dword_21FAEE000, v68, (os_log_type_t)v70, "Emitting deprecated request link: %s", v67, 0xCu);
            uint64_t v60 = v69;
            swift_arrayDestroy();
            MEMORY[0x223C5A4F0](v60, -1, -1);
            MEMORY[0x223C5A4F0](v59, -1, -1);

            uint64_t v34 = v73;
          }
          else
          {
          }
          objc_msgSend(*(id *)(v76 + 16), sel_emitMessage_timestamp_, v36, v48);

LABEL_31:
          uint64_t v65 = *(void (**)(char *, uint64_t))(v34 + 8);
          v65(v75, v12);
          v65(v21, v12);
          return;
        }
      }
      else
      {
        unint64_t v41 = v39;
      }
    }
    if (qword_267EF5E78 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_21FAF8380();
    __swift_project_value_buffer(v61, (uint64_t)qword_267EF62A0);
    int v62 = sub_21FAF8360();
    os_log_type_t v63 = sub_21FAF84E0();
    if (os_log_type_enabled(v62, v63))
    {
      int v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v64 = 0;
      _os_log_impl(&dword_21FAEE000, v62, v63, "Failed to create RequestLink event for SiriInCall", v64, 2u);
      MEMORY[0x223C5A4F0](v64, -1, -1);
    }

    goto LABEL_31;
  }
  uint64_t v73 = v13;
  sub_21FAF7A44((uint64_t)v9);
  if (qword_267EF5E78 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_21FAF8380();
  __swift_project_value_buffer(v28, (uint64_t)qword_267EF62A0);
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_21FAF8360();
  os_log_type_t v30 = sub_21FAF84E0();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v78 = v32;
    *(_DWORD *)id v31 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_21FAF7238(a1, a2, &v78);
    sub_21FAF8530();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FAEE000, v29, v30, "Unable to derive SIC component ID from RequestId=%s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C5A4F0](v32, -1, -1);
    MEMORY[0x223C5A4F0](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v73 + 8))(v21, v12);
}

uint64_t SiriInCallInstrumentationUtil.deinit()
{
  swift_unknownObjectRelease();

  return v0;
}

uint64_t SiriInCallInstrumentationUtil.__deallocating_deinit()
{
  SiriInCallInstrumentationUtil.deinit();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_21FAF7238(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21FAF730C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21FAF41D8((uint64_t)v12, *a3);
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
      sub_21FAF41D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21FAF730C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_21FAF7464((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21FAF8540();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_21FAF753C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_21FAF85B0();
    if (!v8)
    {
      uint64_t result = sub_21FAF85C0();
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

void *sub_21FAF7464(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_21FAF85E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_21FAF753C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21FAF75D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_21FAF77B0(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_21FAF77B0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21FAF75D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_21FAF8430();
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
  unint64_t v3 = sub_21FAF7748(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_21FAF8580();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_21FAF85E0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_21FAF85C0();
  __break(1u);
  return result;
}

void *sub_21FAF7748(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EF5FF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21FAF77B0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EF5FF0);
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
    sub_21FAF7960(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21FAF7888(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21FAF7888(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_21FAF85E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_21FAF7960(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21FAF85E0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for SiriInCallInstrumentationUtil()
{
  return self;
}

uint64_t method lookup function for SiriInCallInstrumentationUtil(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriInCallInstrumentationUtil);
}

uint64_t dispatch thunk of SiriInCallInstrumentationUtil.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_21FAF7A44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD43678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21FAF7AA4()
{
  unint64_t result = qword_267EF6000;
  if (!qword_267EF6000)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EF6000);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_21FAF8530();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_21FAF8530();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

const char *SiriInCallFeatureFlag.domain.getter()
{
  return "SiriInCall";
}

const char *SiriInCallFeatureFlag.feature.getter()
{
  if (*v0) {
    return "blinded_sphinx";
  }
  else {
    return "blushing_phantom";
  }
}

uint64_t SiriInCallFeatureFlag.isEnabled.getter()
{
  char v1 = *v0;
  char v5 = &type metadata for SiriInCallFeatureFlag;
  unint64_t v6 = sub_21FAF7BD8();
  v4[0] = v1;
  char v2 = sub_21FAF8140();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_21FAF7BD8()
{
  unint64_t result = qword_26AD436C0;
  if (!qword_26AD436C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD436C0);
  }
  return result;
}

uint64_t SiriInCallFeatureFlag.description.getter()
{
  unsigned __int8 v1 = *v0;
  v6[1] = 0xE000000000000000;
  sub_21FAF8570();
  uint64_t v2 = sub_21FAF8590();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v2;
  uint64_t v8 = v4;
  sub_21FAF8420();
  sub_21FAF8590();
  sub_21FAF8420();
  swift_bridgeObjectRelease();
  sub_21FAF8420();
  v6[3] = &type metadata for SiriInCallFeatureFlag;
  v6[4] = sub_21FAF7BD8();
  v6[0] = v1;
  sub_21FAF8140();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_21FAF8420();
  swift_bridgeObjectRelease();
  return v7;
}

BOOL static SiriInCallFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SiriInCallFeatureFlag.hash(into:)()
{
  return sub_21FAF8630();
}

uint64_t SiriInCallFeatureFlag.hashValue.getter()
{
  return sub_21FAF8640();
}

uint64_t sub_21FAF7E10()
{
  return sub_21FAF8640();
}

unint64_t sub_21FAF7E58()
{
  unint64_t result = qword_267EF6010;
  if (!qword_267EF6010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF6010);
  }
  return result;
}

const char *sub_21FAF7EA4()
{
  return "SiriInCall";
}

const char *sub_21FAF7EB8()
{
  return SiriInCallFeatureFlag.feature.getter();
}

unint64_t sub_21FAF7ED8(uint64_t a1)
{
  unint64_t result = sub_21FAF7F00();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21FAF7F00()
{
  unint64_t result = qword_267EF6018;
  if (!qword_267EF6018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF6018);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriInCallFeatureFlag(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriInCallFeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FAF80B0);
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

uint64_t sub_21FAF80D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21FAF80E4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriInCallFeatureFlag()
{
  return &type metadata for SiriInCallFeatureFlag;
}

uint64_t sub_21FAF8100()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_21FAF8110()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_21FAF8120()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_21FAF8130()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21FAF8140()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_21FAF8150()
{
  return MEMORY[0x270F68A40]();
}

uint64_t sub_21FAF8160()
{
  return MEMORY[0x270F68B78]();
}

uint64_t sub_21FAF8170()
{
  return MEMORY[0x270F68BC8]();
}

uint64_t sub_21FAF8180()
{
  return MEMORY[0x270F68F20]();
}

uint64_t sub_21FAF8190()
{
  return MEMORY[0x270F69080]();
}

uint64_t sub_21FAF81A0()
{
  return MEMORY[0x270F690E0]();
}

uint64_t sub_21FAF81B0()
{
  return MEMORY[0x270F691D8]();
}

uint64_t sub_21FAF81C0()
{
  return MEMORY[0x270F691E0]();
}

uint64_t sub_21FAF81D0()
{
  return MEMORY[0x270F692E8]();
}

uint64_t sub_21FAF81E0()
{
  return MEMORY[0x270F69308]();
}

uint64_t sub_21FAF81F0()
{
  return MEMORY[0x270F69450]();
}

uint64_t sub_21FAF8200()
{
  return MEMORY[0x270F69538]();
}

uint64_t sub_21FAF8210()
{
  return MEMORY[0x270F69548]();
}

uint64_t sub_21FAF8220()
{
  return MEMORY[0x270F696E8]();
}

uint64_t sub_21FAF8230()
{
  return MEMORY[0x270F696F0]();
}

uint64_t sub_21FAF8240()
{
  return MEMORY[0x270F69728]();
}

uint64_t sub_21FAF8250()
{
  return MEMORY[0x270F69820]();
}

uint64_t sub_21FAF8260()
{
  return MEMORY[0x270F69920]();
}

uint64_t sub_21FAF8270()
{
  return MEMORY[0x270F70F28]();
}

uint64_t sub_21FAF8280()
{
  return MEMORY[0x270F70F40]();
}

uint64_t sub_21FAF8290()
{
  return MEMORY[0x270F70F50]();
}

uint64_t sub_21FAF82A0()
{
  return MEMORY[0x270F70F60]();
}

uint64_t sub_21FAF82B0()
{
  return MEMORY[0x270F70F70]();
}

uint64_t sub_21FAF82C0()
{
  return MEMORY[0x270F70F78]();
}

uint64_t _s10SiriInCall15ButterflyBridgeCfd_0()
{
  return MEMORY[0x270F70F80]();
}

uint64_t sub_21FAF82E0()
{
  return MEMORY[0x270F70F88]();
}

uint64_t sub_21FAF8300()
{
  return MEMORY[0x270F70F98]();
}

uint64_t sub_21FAF8310()
{
  return MEMORY[0x270F70FA0]();
}

uint64_t sub_21FAF8320()
{
  return MEMORY[0x270F70FF0]();
}

uint64_t sub_21FAF8330()
{
  return MEMORY[0x270F70FF8]();
}

uint64_t sub_21FAF8340()
{
  return MEMORY[0x270F71010]();
}

uint64_t sub_21FAF8350()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_21FAF8360()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21FAF8370()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21FAF8380()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21FAF8390()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_21FAF83A0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21FAF83B0()
{
  return MEMORY[0x270FA0AE8]();
}

uint64_t sub_21FAF83C0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21FAF83D0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21FAF83E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FAF83F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21FAF8400()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21FAF8410()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21FAF8420()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21FAF8430()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21FAF8440()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21FAF8450()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21FAF8460()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21FAF8470()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21FAF8480()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21FAF8490()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21FAF84A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21FAF84B0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_21FAF84C0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_21FAF84D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21FAF84E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21FAF84F0()
{
  return MEMORY[0x270F66230]();
}

uint64_t sub_21FAF8500()
{
  return MEMORY[0x270F66238]();
}

uint64_t sub_21FAF8510()
{
  return MEMORY[0x270F66240]();
}

uint64_t sub_21FAF8520()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_21FAF8530()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21FAF8540()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21FAF8560()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21FAF8570()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21FAF8580()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21FAF8590()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_21FAF85A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21FAF85B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21FAF85C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21FAF85D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21FAF85E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21FAF8600()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21FAF8610()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21FAF8620()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21FAF8630()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21FAF8640()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}