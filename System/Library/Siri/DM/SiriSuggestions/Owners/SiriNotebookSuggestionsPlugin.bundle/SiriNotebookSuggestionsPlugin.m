void type metadata accessor for CLAuthorizationStatus()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_189F8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_189F8);
    }
  }
}

uint64_t sub_2AAC()
{
  sub_10930();
  swift_allocObject();
  uint64_t result = sub_10940();
  qword_191B0 = result;
  return result;
}

void sub_2B00()
{
  unk_191C7 = -18;
}

uint64_t sub_2B30()
{
  sub_3350(&qword_18A08);
  sub_107E0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_112C0;
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_38E8();
  sub_107D0();
  sub_38D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_38D0();
  sub_107D0();
  sub_107D0();
  sub_38D0();
  sub_107D0();
  sub_38B0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_38B0();
  sub_38E8();
  sub_38B0();
  sub_107D0();
  sub_107D0();
  sub_38E8();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_38E8();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  sub_38D0();
  sub_107D0();
  sub_38B0();
  sub_107D0();
  sub_107D0();
  sub_107D0();
  uint64_t result = sub_107D0();
  qword_191C8 = v0;
  return result;
}

uint64_t sub_3030()
{
  uint64_t v0 = sub_107E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3350(&qword_18A00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112D0;
  *(void *)(inited + 32) = 0x45442D6564;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = 0x55412D6E65;
  *(void *)(inited + 56) = 0xE500000000000000;
  *(void *)(inited + 64) = 0x41432D6E65;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x42472D6E65;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = 0x4E492D6E65;
  *(void *)(inited + 104) = 0xE500000000000000;
  *(void *)(inited + 112) = 0x53552D6E65;
  *(void *)(inited + 120) = 0xE500000000000000;
  *(void *)(inited + 128) = 0x53452D7365;
  *(void *)(inited + 136) = 0xE500000000000000;
  *(void *)(inited + 144) = 0x584D2D7365;
  *(void *)(inited + 152) = 0xE500000000000000;
  *(void *)(inited + 160) = 0x53552D7365;
  *(void *)(inited + 168) = 0xE500000000000000;
  *(void *)(inited + 176) = 0x52462D7266;
  *(void *)(inited + 184) = 0xE500000000000000;
  *(void *)(inited + 192) = 0x504A2D616ALL;
  *(void *)(inited + 200) = 0xE500000000000000;
  *(void *)(inited + 208) = 0x4E432D687ALL;
  *(void *)(inited + 216) = 0xE500000000000000;
  *(void *)(inited + 224) = 0x4B482D687ALL;
  *(void *)(inited + 232) = 0xE500000000000000;
  v10 = &_swiftEmptyArrayStorage;
  sub_368C(0, 13, 0);
  uint64_t v5 = 0;
  uint64_t v6 = (uint64_t)v10;
  do
  {
    swift_bridgeObjectRetain_n();
    sub_107D0();
    swift_bridgeObjectRelease();
    v10 = (void *)v6;
    unint64_t v8 = *(void *)(v6 + 16);
    unint64_t v7 = *(void *)(v6 + 24);
    if (v8 >= v7 >> 1)
    {
      sub_368C(v7 > 1, v8 + 1, 1);
      uint64_t v6 = (uint64_t)v10;
    }
    *(void *)(v6 + 16) = v8 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v6+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v8, v3, v0);
    v5 += 16;
  }
  while (v5 != 208);
  swift_setDeallocating();
  uint64_t result = sub_352C();
  qword_191D0 = v6;
  return result;
}

uint64_t sub_32D4@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_3308(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_3308(uint64_t result)
{
  return result;
}

uint64_t sub_3324@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_3350(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3394(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_33AC(a1, a2, a3, (void (*)(void))type metadata accessor for NotebookSuggestion);
}

uint64_t sub_33AC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_3878();
    uint64_t v9 = sub_388C();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  if (a3 < a1
    || (uint64_t result = ((uint64_t (*)(void))a4)(0), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_38BC();
    return _swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_38BC();
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  return result;
}

char *sub_34B0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_3878();
    __src = (char *)sub_388C();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_352C()
{
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_3570(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_3588(a1, a2, a3, type metadata accessor for NotebookSuggestion);
}

uint64_t sub_3588(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0
    || ((uint64_t v6 = *(void *)(*(void *)(a4(0) - 8) + 72) * a2, v7 = a3 + v6, v8 = a1 + v6, v7 > a1)
      ? (BOOL v9 = v8 > a3)
      : (BOOL v9 = 0),
        v9))
  {
    sub_3878();
    uint64_t result = sub_10D90();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

size_t sub_368C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_36AC(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

size_t sub_36AC(size_t result, int64_t a2, char a3, uint64_t a4)
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
    v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3350(&qword_18A08);
  uint64_t v10 = *(void *)(sub_107E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_107E0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_33AC(v18, v8, v17, (void (*)(void))&type metadata accessor for Locale);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_3588(v18, v8, v17, (uint64_t (*)(void))&type metadata accessor for Locale);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_388C()
{
  return sub_10D90();
}

uint64_t sub_38B0()
{
  return 28261;
}

uint64_t sub_38BC()
{
  return v0;
}

uint64_t sub_38D0()
{
  return sub_107D0();
}

uint64_t sub_38E8()
{
  return sub_107D0();
}

void *initializeBufferWithCopyOfBuffer for TrueResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TrueResolver()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for TrueResolver(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TrueResolver(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for TrueResolver(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrueResolver(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for TrueResolver(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrueResolver()
{
  return &type metadata for TrueResolver;
}

uint64_t sub_3A48()
{
  return _swift_task_switch(sub_3A64, 0, 0);
}

uint64_t sub_3A64()
{
  sub_3350(&qword_18C10);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_11360;
  *(void *)(v1 + 56) = &type metadata for Bool;
  *(unsigned char *)(v1 + 32) = 1;
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_3AF4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_3B24()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3BC8;
  return _swift_task_switch(sub_3A64, 0, 0);
}

uint64_t sub_3BC8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unint64_t sub_3CCC()
{
  unint64_t result = qword_18BF0;
  if (!qword_18BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18BF0);
  }
  return result;
}

unint64_t sub_3D1C()
{
  unint64_t result = qword_18C00;
  if (!qword_18C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_18C00);
  }
  return result;
}

_WORD *initializeBufferWithCopyOfBuffer for AddTriggerIntentParameters(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AddTriggerIntentParameters(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 65281 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65281 < 0xFF0000) {
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
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((unsigned char *)a1 + 2)) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 16)) - 65282;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AddTriggerIntentParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x3EE4);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddTriggerIntentParameters()
{
  return &type metadata for AddTriggerIntentParameters;
}

uint64_t initializeBufferWithCopyOfBuffer for AddTriggerExecutionParameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AddTriggerExecutionParameters(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AddTriggerExecutionParameters(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[33])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
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

uint64_t storeEnumTagSinglePayload for AddTriggerExecutionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddTriggerExecutionParameters()
{
  return &type metadata for AddTriggerExecutionParameters;
}

uint64_t initializeBufferWithCopyOfBuffer for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for UpdateReminderExecutionParameters(uint64_t a1)
{
  uint64_t v2 = sub_10740();
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_427C);
}

uint64_t sub_427C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  return sub_42C4(a1, a2, v4);
}

uint64_t sub_42C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for UpdateReminderExecutionParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4300);
}

uint64_t sub_4300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10740();
  return sub_434C(a1, a2, a2, v4);
}

uint64_t sub_434C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for UpdateReminderExecutionParameters()
{
  uint64_t result = qword_18C70;
  if (!qword_18C70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_43BC()
{
  uint64_t result = sub_10740();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_4448(uint64_t a1)
{
  sub_4BAC();
  sub_4BBC(v2, v3, a1, v4);
  if (v12)
  {
    sub_3350(&qword_18CB8);
    if (swift_dynamicCast())
    {
      unsigned int v5 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    sub_4ABC((uint64_t)v11, &qword_18CB0);
  }
  unsigned int v5 = 0;
LABEL_6:
  sub_4BAC();
  sub_4BBC(0xD000000000000016, v6, a1, v7);
  swift_bridgeObjectRelease();
  if (!v12)
  {
    sub_4ABC((uint64_t)v11, &qword_18CB0);
    goto LABEL_12;
  }
  sub_3350(&qword_18CB8);
  if (!swift_dynamicCast())
  {
LABEL_12:
    int v8 = 0;
    return v8 | v5;
  }
  if (v10) {
    int v8 = 256;
  }
  else {
    int v8 = 0;
  }
  return v8 | v5;
}

uint64_t sub_4564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_4BBC(1701667182, 0xE400000000000000, a1, &v17);
  if (!v18) {
    goto LABEL_15;
  }
  sub_3350(&qword_18CB8);
  if ((sub_4B7C() & 1) == 0) {
    goto LABEL_14;
  }
  if (v15 == 0xD000000000000027 && v16 == 0x8000000000011960)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  char v4 = sub_10DC0();
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    char v14 = 0;
    uint64_t v8 = 2;
    goto LABEL_17;
  }
LABEL_7:
  sub_4BAC();
  sub_4BBC(v5, v6, a1, v7);
  if (!v18)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t result = sub_4ABC((uint64_t)&v17, &qword_18CB0);
    goto LABEL_16;
  }
  if ((sub_4B7C() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v15;
  sub_4BBC(0x656475746974616CLL, 0xE800000000000000, a1, &v17);
  if (v18)
  {
    int v9 = sub_4B7C();
    if (v9) {
      uint64_t v10 = v15;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v9 ^ 1u;
  }
  else
  {
    sub_4ABC((uint64_t)&v17, &qword_18CB0);
    uint64_t v10 = 0;
    uint64_t v11 = 1;
  }
  sub_4BBC(0x64757469676E6F6CLL, 0xE900000000000065, a1, &v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t result = sub_4B7C();
    uint64_t v13 = v15;
    if (!result) {
      uint64_t v13 = 0;
    }
    char v14 = result ^ 1;
  }
  else
  {
    uint64_t result = sub_4ABC((uint64_t)&v17, &qword_18CB0);
    uint64_t v13 = 0;
    char v14 = 1;
  }
LABEL_17:
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = v14;
  return result;
}

uint64_t sub_478C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3350(&qword_18CA8);
  __chkstk_darwin(v4 - 8);
  sub_4B9C();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_10740();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_4B9C();
  uint64_t v12 = v11 - v10;
  uint64_t updated = type metadata accessor for UpdateReminderExecutionParameters();
  __chkstk_darwin(updated);
  sub_4B9C();
  uint64_t v16 = v15 - v14;
  sub_4BBC(1701667182, 0xE400000000000000, a1, &v26);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    long long v17 = &qword_18CB0;
    uint64_t v18 = &v26;
LABEL_14:
    sub_4ABC((uint64_t)v18, v17);
    goto LABEL_15;
  }
  sub_3350(&qword_18CB8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  if (v24 == 0xD000000000000021 && v25 == 0x80000000000114A0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v19 = sub_10DC0();
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_15:
    uint64_t v22 = 1;
    return sub_434C(a2, v22, 1, updated);
  }
LABEL_8:
  sub_4BBC(0x706D6F4365746164, 0xED0000746E656E6FLL, a1, &v26);
  swift_bridgeObjectRelease();
  if (!v27)
  {
    sub_4ABC((uint64_t)&v26, &qword_18CB0);
    sub_434C(v7, 1, 1, v8);
    goto LABEL_13;
  }
  int v20 = swift_dynamicCast();
  sub_434C(v7, v20 ^ 1u, 1, v8);
  if (sub_42C4(v7, 1, v8) == 1)
  {
LABEL_13:
    long long v17 = &qword_18CA8;
    uint64_t v18 = (long long *)v7;
    goto LABEL_14;
  }
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v21(v12, v7, v8);
  v21(v16, v12, v8);
  sub_4B18(v16, a2);
  uint64_t v22 = 0;
  return sub_434C(a2, v22, 1, updated);
}

uint64_t sub_4ABC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3350(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_4B18(uint64_t a1, uint64_t a2)
{
  uint64_t updated = type metadata accessor for UpdateReminderExecutionParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 32))(a2, a1, updated);
  return a2;
}

uint64_t sub_4B7C()
{
  return swift_dynamicCast();
}

double sub_4BBC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_785C(a1, a2), (v7 & 1) != 0))
  {
    sub_7D60(*(void *)(a3 + 56) + 48 * v6, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    a4[1] = 0u;
    a4[2] = 0u;
    *a4 = 0u;
  }
  return result;
}

uint64_t sub_4C14(uint64_t a1)
{
  if (*(void *)(a1 + 16) && (sub_78D4(), (v1 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_4C58()
{
  return 1;
}

uint64_t sub_4C60()
{
  sub_10900();
  sub_7DC4(&qword_18DA0, (void (*)(uint64_t))&type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState.ResponseMode);
  sub_10CA0();
  sub_10CA0();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_10DC0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_4D44()
{
  return sub_10C90();
}

Swift::Int sub_4D60()
{
  return sub_10DE0();
}

uint64_t sub_4DB4()
{
  sub_8594();
  v0[12] = v1;
  v0[13] = v2;
  uint64_t v3 = type metadata accessor for NotebookSuggestion(0);
  v0[14] = v3;
  sub_8414(v3);
  v0[15] = v4;
  v0[16] = sub_8720();
  uint64_t v5 = sub_10770();
  v0[17] = v5;
  sub_8414(v5);
  v0[18] = v6;
  v0[19] = sub_8720();
  sub_8610();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_4E70()
{
  if (qword_189B0 != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[12];
  uint64_t v2 = qword_191B0;
  v0[5] = sub_10930();
  v0[6] = sub_7DC4(&qword_18D68, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v2;
  uint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  void *v3 = v0;
  v3[1] = sub_4FE0;
  return v5(v0 + 2);
}

uint64_t sub_4FE0()
{
  sub_8594();
  sub_83FC();
  sub_86FC();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 168) = v4;
  swift_task_dealloc();
  sub_7C64(v3);
  sub_8610();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_50B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 7);
  uint64_t v5 = v0 + 18;
  uint64_t v4 = v0[18];
  uint64_t v3 = v5[1];
  uint64_t v6 = v1[17];
  sub_108C0();
  uint64_t v7 = sub_10760(1);
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v6);
  sub_A2B8();
  uint64_t v11 = v10;
  sub_96F0();
  sub_7A50(v12);
  uint64_t v13 = *(void *)(v11 + 16);
  if (v13)
  {
    uint64_t v14 = v1[15];
    uint64_t v23 = v7;
    uint64_t v24 = v9;
    uint64_t v15 = v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    uint64_t v22 = *(void *)(v14 + 72);
    do
    {
      uint64_t v16 = v1[16];
      sub_7CB4(v15, v16, (void (*)(void))type metadata accessor for NotebookSuggestion);
      swift_bridgeObjectRetain();
      sub_108A0();
      long long v17 = (void *)swift_task_alloc();
      v17[2] = v16;
      v17[3] = v23;
      v17[4] = v24;
      sub_10B60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_task_dealloc();
      sub_7D08(v16, (void (*)(void))type metadata accessor for NotebookSuggestion);
      v15 += v22;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    uint64_t v7 = v23;
    uint64_t v9 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = swift_task_alloc();
  *(void *)(v18 + 16) = v7;
  *(void *)(v18 + 24) = v9;
  sub_10B60();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v1[10] = &type metadata for NotebookSourceGenerator;
  v1[11] = sub_7B7C();
  uint64_t v19 = swift_allocObject();
  v1[7] = v19;
  *(void *)(v19 + 40) = &type metadata for NotebookSuggestionValidators;
  *(void *)(v19 + 48) = &off_14EB0;
  sub_10B50();
  swift_release();
  sub_7C64(v2);
  if (qword_189E8 != -1) {
    swift_once();
  }
  int v20 = (void *)swift_task_alloc();
  v1[22] = v20;
  *int v20 = v1;
  v20[1] = sub_53F8;
  return sub_FF84();
}

uint64_t sub_53F8()
{
  sub_8594();
  sub_83FC();
  uint64_t v1 = *v0;
  sub_85D4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_8610();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_54C0()
{
  sub_3350(&qword_18D78);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_11360;
  sub_10B70();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_5578(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&long long v42 = a4;
  uint64_t v38 = a3;
  uint64_t v36 = *(void *)(type metadata accessor for NotebookSuggestion.Parameter(0) - 8);
  __chkstk_darwin();
  uint64_t v43 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for NotebookSuggestion(0);
  __chkstk_darwin();
  v40 = (uint64_t *)((char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_3350(&qword_18D88);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10920();
  uint64_t v35 = *(void *)(v39 - 8);
  __chkstk_darwin();
  v34 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a1 + 40);
  long long v37 = *(_OWORD *)(a1 + 24);
  sub_8294((void *)a1, v37);
  long long v58 = v37;
  uint64_t v59 = v12;
  sub_7C00(v57);
  sub_10AC0();
  uint64_t v13 = v59;
  long long v37 = v58;
  sub_8294(v57, v58);
  if (qword_189C0 != -1) {
    swift_once();
  }
  long long v55 = v37;
  uint64_t v56 = v13;
  sub_7C00(v54);
  sub_10AD0();
  uint64_t v14 = v56;
  long long v37 = v55;
  sub_8294(v54, v55);
  long long v52 = v37;
  uint64_t v53 = v14;
  sub_7C00(v51);
  sub_10B20();
  uint64_t v15 = v53;
  long long v37 = v52;
  sub_8294(v51, v52);
  sub_DA6C((uint64_t)v46);
  long long v49 = v37;
  uint64_t v50 = v15;
  sub_7C00(v48);
  sub_10AB0();
  sub_7C64((uint64_t)v46);
  uint64_t v16 = v50;
  long long v37 = v49;
  sub_8294(v48, v49);
  *(_OWORD *)v47 = v37;
  *(void *)&v47[16] = v16;
  sub_7C00(v46);
  sub_10AA0();
  uint64_t v17 = *(void *)v47;
  long long v42 = *(_OWORD *)&v47[8];
  sub_8294(v46, *(uint64_t *)v47);
  v44[3] = v17;
  long long v45 = v42;
  sub_7C00(v44);
  sub_108E0();
  sub_7C64((uint64_t)v44);
  sub_7C64((uint64_t)v46);
  sub_7C64((uint64_t)v48);
  sub_7C64((uint64_t)v51);
  sub_7C64((uint64_t)v54);
  sub_7C64((uint64_t)v57);
  sub_83A8((uint64_t)a2 + v7[5], (uint64_t)v10, &qword_18D88);
  uint64_t v18 = v39;
  if (sub_42C4((uint64_t)v10, 1, v39) == 1)
  {
    sub_82D8((uint64_t)v10, &qword_18D88);
  }
  else
  {
    int v20 = v34;
    uint64_t v19 = v35;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v34, v10, v18);
    uint64_t v21 = *(void *)(a1 + 40);
    long long v42 = *(_OWORD *)(a1 + 24);
    sub_8294((void *)a1, v42);
    long long v58 = v42;
    uint64_t v59 = v21;
    sub_7C00(v57);
    sub_10AE0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
    sub_7C64((uint64_t)v57);
  }
  BOOL v22 = *a2 == 0x6E696D6552646461 && a2[1] == 0xEF656D6954726564;
  uint64_t v23 = v40;
  if (v22)
  {
    sub_7CB4((uint64_t)a2, (uint64_t)v40, (void (*)(void))type metadata accessor for NotebookSuggestion);
LABEL_16:
    sub_7D08((uint64_t)v23, (void (*)(void))type metadata accessor for NotebookSuggestion);
    goto LABEL_17;
  }
  char v24 = sub_10DC0();
  sub_7CB4((uint64_t)a2, (uint64_t)v23, (void (*)(void))type metadata accessor for NotebookSuggestion);
  if ((v24 & 1) != 0 || *v23 == 0xD000000000000013 && v23[1] == 0x8000000000011A30) {
    goto LABEL_16;
  }
  char v25 = sub_10DC0();
  sub_7D08((uint64_t)v23, (void (*)(void))type metadata accessor for NotebookSuggestion);
  if (v25)
  {
LABEL_17:
    uint64_t v26 = *(void *)(a1 + 40);
    long long v42 = *(_OWORD *)(a1 + 24);
    sub_8294((void *)a1, v42);
    long long v58 = v42;
    uint64_t v59 = v26;
    sub_7C00(v57);
    sub_10B10();
    sub_7C64((uint64_t)v57);
  }
  if (*(void *)((char *)a2 + v7[10]))
  {
    uint64_t v27 = *(void *)(a1 + 40);
    long long v42 = *(_OWORD *)(a1 + 24);
    sub_8294((void *)a1, v42);
    long long v58 = v42;
    uint64_t v59 = v27;
    sub_7C00(v57);
    sub_10B00();
    sub_7C64((uint64_t)v57);
  }
  uint64_t result = *(void *)((char *)a2 + v7[6]);
  uint64_t v29 = *(void *)(result + 16);
  if (v29)
  {
    uint64_t v30 = v43;
    uint64_t v31 = result + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
    uint64_t v39 = *(void *)(v36 + 72);
    v40 = (void *)(v43 + 16);
    uint64_t v38 = result;
    swift_bridgeObjectRetain();
    uint64_t v41 = a1;
    do
    {
      sub_7CB4(v31, v30, (void (*)(void))type metadata accessor for NotebookSuggestion.Parameter);
      sub_7D60(a1, (uint64_t)v57);
      uint64_t v32 = v59;
      long long v42 = v58;
      sub_8294(v57, v58);
      sub_83A8((uint64_t)v40, (uint64_t)v51, &qword_18D90);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_7D08(v43, (void (*)(void))type metadata accessor for NotebookSuggestion.Parameter);
      long long v55 = v42;
      uint64_t v56 = v32;
      sub_7C00(v54);
      uint64_t v30 = v43;
      sub_10B30();
      swift_bridgeObjectRelease();
      a1 = v41;
      swift_release();
      sub_82D8((uint64_t)v51, &qword_18D90);
      sub_7C64((uint64_t)v54);
      sub_7C64((uint64_t)v57);
      v31 += v39;
      --v29;
    }
    while (v29);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_5DC4(void *a1)
{
  uint64_t v1 = a1[5];
  long long v14 = *(_OWORD *)(a1 + 3);
  sub_8294(a1, a1[3]);
  if (qword_189C8 != -1) {
    swift_once();
  }
  long long v30 = v14;
  uint64_t v31 = v1;
  sub_7C00(v29);
  sub_10AD0();
  uint64_t v2 = v31;
  long long v15 = v30;
  sub_8294(v29, v30);
  sub_3350(&qword_18D80);
  uint64_t v3 = sub_10910();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_114F0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *(void (**)(unint64_t, void, uint64_t))(v4 + 104);
  v9(v8, enum case for DeviceType.iPad(_:), v3);
  v9(v8 + v5, enum case for DeviceType.iPhone(_:), v3);
  v9(v8 + 2 * v5, enum case for DeviceType.carPlay(_:), v3);
  long long v27 = v15;
  uint64_t v28 = v2;
  sub_7C00(v26);
  sub_10AC0();
  swift_bridgeObjectRelease();
  uint64_t v10 = v28;
  long long v16 = v27;
  sub_8294(v26, v27);
  long long v24 = v16;
  uint64_t v25 = v10;
  sub_7C00(v23);
  sub_10AA0();
  uint64_t v11 = v25;
  long long v17 = v24;
  sub_8294(v23, v24);
  *(_OWORD *)BOOL v22 = v17;
  *(void *)&v22[16] = v11;
  sub_7C00(v21);
  sub_10AF0();
  uint64_t v12 = *(void *)v22;
  long long v18 = *(_OWORD *)&v22[8];
  sub_8294(v21, *(uint64_t *)v22);
  if (qword_189F0 != -1) {
    swift_once();
  }
  sub_4C14(qword_19208);
  v19[3] = v12;
  long long v20 = v18;
  sub_7C00(v19);
  sub_108E0();
  swift_bridgeObjectRelease();
  sub_7C64((uint64_t)v19);
  sub_7C64((uint64_t)v21);
  sub_7C64((uint64_t)v23);
  sub_7C64((uint64_t)v26);
  return sub_7C64((uint64_t)v29);
}

uint64_t sub_613C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for NotebookOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_6170()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t sub_6178()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_83F8;
  return sub_4DB4();
}

uint64_t sub_6214()
{
  sub_8594();
  v1[45] = v2;
  v1[46] = v0;
  v1[43] = v3;
  v1[44] = v4;
  uint64_t v5 = sub_10BF0();
  v1[47] = v5;
  sub_8414(v5);
  v1[48] = v6;
  v1[49] = sub_8720();
  uint64_t v7 = type metadata accessor for NotebookSuggestion(0);
  v1[50] = v7;
  sub_8414(v7);
  v1[51] = v8;
  v1[52] = sub_8720();
  sub_8610();
  return _swift_task_switch(v9, v10, v11);
}

void sub_62D4()
{
  if (qword_189E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10C30();
  sub_825C(v1, (uint64_t)qword_191E8);
  uint64_t v2 = sub_10C10();
  os_log_type_t v3 = sub_10CF0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Running NotebookSourceGenerator.", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void **)(v0 + 344);

  sub_8294(v5, v5[3]);
  uint64_t v6 = sub_10960();
  uint64_t v8 = v7;
  if (qword_189B8 != -1) {
    swift_once();
  }
  if (v8)
  {
    if (v6 == qword_191B8 && v8 == unk_191C0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = sub_10DC0();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        goto LABEL_27;
      }
    }
    sub_96F0();
    *(void *)(v0 + 424) = v11;
    uint64_t v12 = *(void *)(v11 + 16);
    *(void *)(v0 + 432) = v12;
    if (v12)
    {
      uint64_t v13 = *(void *)(v0 + 408);
      uint64_t v14 = *(void *)(v0 + 416);
      int v15 = *(_DWORD *)(v13 + 80);
      *(_DWORD *)(v0 + 512) = v15;
      uint64_t v16 = *(void *)(v13 + 72);
      *(_DWORD *)(v0 + 516) = enum case for Objective.discoverability(_:);
      *(void *)(v0 + 448) = 0;
      *(void *)(v0 + 456) = _swiftEmptyArrayStorage;
      *(void *)(v0 + 440) = v16;
      sub_7CB4(v11 + ((v15 + 32) & ~(unint64_t)v15), v14, (void (*)(void))type metadata accessor for NotebookSuggestion);
      uint64_t v17 = sub_8488();
      uint64_t v18 = sub_8444(v17);
      sub_842C(v18);
      uint64_t v19 = (void *)swift_task_alloc();
      *(void *)(v0 + 480) = v19;
      *uint64_t v19 = v0;
      v19[1] = sub_67C0;
      sub_85F4();
      sub_84C8();
      __asm { BRAA            X3, X16 }
    }
    swift_bridgeObjectRelease();
    sub_8294(*(void **)(v0 + 344), *(void *)(*(void *)(v0 + 344) + 24));
    uint64_t v22 = sub_10950();
    sub_4BBC(0xD000000000000010, 0x8000000000011AB0, v22, (_OWORD *)(v0 + 16));
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v0 + 40);
    sub_82D8(v0 + 16, &qword_18CB0);
    if (v23)
    {
      uint64_t v25 = *(void *)(v0 + 384);
      uint64_t v24 = *(void *)(v0 + 392);
      uint64_t v26 = *(void *)(v0 + 376);
      sub_8294(*(void **)(v0 + 360), *(void *)(*(void *)(v0 + 360) + 24));
      sub_10C60();
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v24, enum case for Objective.discoverability(_:), v26);
      sub_10B40();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
      if (*(void *)(v0 + 128))
      {
        sub_832C((long long *)(v0 + 104), v0 + 64);
        sub_8344(v0 + 64, v0 + 144);
        long long v27 = (char *)_swiftEmptyArrayStorage;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          long long v27 = sub_74E4(0, _swiftEmptyArrayStorage[2] + 1, 1, (uint64_t)_swiftEmptyArrayStorage);
        }
        unint64_t v29 = *((void *)v27 + 2);
        unint64_t v28 = *((void *)v27 + 3);
        if (v29 >= v28 >> 1) {
          long long v27 = sub_74E4((char *)(v28 > 1), v29 + 1, 1, (uint64_t)v27);
        }
        *((void *)v27 + 2) = v29 + 1;
        sub_832C((long long *)(v0 + 144), (uint64_t)&v27[40 * v29 + 32]);
        sub_7C64(v0 + 64);
      }
      else
      {
        sub_82D8(v0 + 104, &qword_18DC8);
      }
    }
  }
LABEL_27:
  swift_task_dealloc();
  swift_task_dealloc();
  sub_84C8();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_67C0()
{
  sub_8594();
  sub_83FC();
  sub_86FC();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_85D4();
  *uint64_t v4 = v3;
  *(unsigned char *)(v6 + 520) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_8610();
  return _swift_task_switch(v7, v8, v9);
}

void sub_68C0()
{
  if (*(unsigned char *)(v1 + 520))
  {
    *(void *)(v1 + 488) = sub_85A0(*(void **)(v1 + 344));
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v1 + 496) = v2;
    *uint64_t v2 = v1;
    v2[1] = sub_6C28;
    sub_84C8();
    __asm { BRAA            X2, X16 }
  }
  sub_7D08(*(void *)(v1 + 416), (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_8738();
  if (!v6)
  {
    *(void *)(v1 + 448) = v5;
    unint64_t v15 = sub_84E4(v5);
    sub_7CB4(v15, v0, (void (*)(void))type metadata accessor for NotebookSuggestion);
    uint64_t v16 = sub_8488();
    uint64_t v17 = sub_8444(v16);
    sub_842C(v17);
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v1 + 480) = v18;
    *uint64_t v18 = v1;
    v18[1] = sub_67C0;
    sub_85F4();
    sub_84C8();
    __asm { BRAA            X3, X16 }
  }
  uint64_t v7 = *(char **)(v1 + 456);
  swift_bridgeObjectRelease();
  sub_85A0(*(void **)(v1 + 344));
  sub_8638((uint64_t)"isMarkAsComplete");
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v1 + 40);
  sub_82D8(v1 + 16, &qword_18CB0);
  if (v8)
  {
    sub_86CC();
    sub_10C60();
    uint64_t v9 = sub_861C();
    v10(v9);
    sub_8530();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_86B4();
    v12(v11);
    if (*(void *)(v1 + 128))
    {
      sub_8560();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_850C();
      }
      unint64_t v14 = *((void *)v7 + 2);
      unint64_t v13 = *((void *)v7 + 3);
      if (v14 >= v13 >> 1) {
        uint64_t v7 = sub_8660(v13);
      }
      *((void *)v7 + 2) = v14 + 1;
      sub_8684((uint64_t)&v7[40 * v14]);
    }
    else
    {
      sub_82D8(v1 + 16, &qword_18DC8);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_84C8();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_6C28()
{
  sub_8594();
  sub_83FC();
  sub_86FC();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_85D4();
  *uint64_t v4 = v3;
  *(void *)(v6 + 504) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_8610();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_6D0C()
{
  unsigned int v27 = *(_DWORD *)(v0 + 516);
  uint64_t v2 = *(void *)(v0 + 384);
  unint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  sub_8294(*(void **)(v0 + 360), *(void *)(*(void *)(v0 + 360) + 24));
  (*(void (**)(unint64_t, void, uint64_t))(v2 + 104))(v1, v27, v3);
  sub_10B40();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_83A8(v0 + 184, v0 + 264, &qword_18DC8);
  if (*(void *)(v0 + 288))
  {
    uint64_t v4 = v0 + 224;
    sub_8560();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *(char **)(v0 + 456);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v6 = sub_850C();
    }
    unint64_t v8 = *((void *)v6 + 2);
    unint64_t v7 = *((void *)v6 + 3);
    unint64_t v1 = v8 + 1;
    if (v8 >= v7 >> 1) {
      uint64_t v6 = sub_74E4((char *)(v7 > 1), v8 + 1, 1, (uint64_t)v6);
    }
    uint64_t v9 = *(void *)(v0 + 416);
    *((void *)v6 + 2) = v1;
    sub_8684((uint64_t)&v6[40 * v8]);
    sub_82D8(v0 + 184, &qword_18DC8);
    sub_7D08(v9, (void (*)(void))type metadata accessor for NotebookSuggestion);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 416);
    sub_82D8(v0 + 184, &qword_18DC8);
    sub_7D08(v4, (void (*)(void))type metadata accessor for NotebookSuggestion);
    sub_82D8(v0 + 264, &qword_18DC8);
    uint64_t v6 = *(char **)(v0 + 456);
  }
  sub_8738();
  if (v11)
  {
    swift_bridgeObjectRelease();
    sub_85A0(*(void **)(v0 + 344));
    sub_8638((uint64_t)"isMarkAsComplete");
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v0 + 40);
    sub_82D8(v0 + 16, &qword_18CB0);
    if (v12)
    {
      sub_86CC();
      sub_10C60();
      uint64_t v13 = sub_861C();
      v14(v13);
      sub_8530();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_86B4();
      v16(v15);
      if (*(void *)(v0 + 128))
      {
        sub_8560();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_850C();
        }
        unint64_t v18 = *((void *)v6 + 2);
        unint64_t v17 = *((void *)v6 + 3);
        if (v18 >= v17 >> 1) {
          uint64_t v6 = sub_8660(v17);
        }
        *((void *)v6 + 2) = v18 + 1;
        sub_8684((uint64_t)&v6[40 * v18]);
      }
      else
      {
        sub_82D8(v0 + 16, &qword_18DC8);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(char *))(v0 + 8);
    return v26(v6);
  }
  else
  {
    *(void *)(v0 + 448) = v10;
    *(void *)(v0 + 456) = v6;
    unint64_t v19 = sub_84E4(v10);
    sub_7CB4(v19, v4, (void (*)(void))type metadata accessor for NotebookSuggestion);
    uint64_t v20 = sub_8488();
    uint64_t v21 = sub_8444(v20);
    sub_842C(v21);
    unint64_t v28 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))((char *)v22 + *v22);
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_67C0;
    uint64_t v24 = *(void *)(v0 + 368);
    return v28(v1, v4, v24);
  }
}

uint64_t sub_7140()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_71EC;
  return sub_6214();
}

uint64_t sub_71EC()
{
  sub_8594();
  uint64_t v2 = v1;
  sub_83FC();
  uint64_t v3 = *v0;
  sub_85D4();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_72B8(char a1, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3350(&qword_18D98);
  uint64_t v10 = *(void *)(type metadata accessor for NotebookSuggestion(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_10D70();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for NotebookSuggestion(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_3394(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_75DC(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_74E4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3350(&qword_18DD0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_34B0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_773C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_75DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for NotebookSuggestion(0) - 8);
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
  uint64_t result = sub_10D90();
  __break(1u);
  return result;
}

uint64_t sub_773C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_3350(&qword_18DD8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_10D90();
  __break(1u);
  return result;
}

unint64_t sub_785C(uint64_t a1, uint64_t a2)
{
  sub_10DD0();
  sub_10C90();
  Swift::Int v4 = sub_10DE0();
  return sub_7940(a1, a2, v4);
}

uint64_t sub_78D4()
{
  sub_10DD0();
  sub_10C90();
  Swift::Int v0 = sub_10DE0();
  return sub_7A24(v0);
}

unint64_t sub_7940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10DC0() & 1) == 0)
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
      while (!v14 && (sub_10DC0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_7A24(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_7A50(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_72B8(result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = type metadata accessor for NotebookSuggestion(0);
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t result = v10 - 8;
  uint64_t v11 = v12;
  if (v9 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t result = sub_3570(v6 + v13, v2, v3 + v13 + *(void *)(v11 + 72) * v8);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFADD__(v14, v2);
  uint64_t v16 = v14 + v2;
  if (!v15)
  {
    *(void *)(v3 + 16) = v16;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_7B68(uint64_t a1)
{
  return sub_5578(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_7B74(void *a1)
{
  return sub_5DC4(a1);
}

unint64_t sub_7B7C()
{
  unint64_t result = qword_18D70;
  if (!qword_18D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18D70);
  }
  return result;
}

uint64_t sub_7BC8()
{
  sub_7C64(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t *sub_7C00(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_7C64(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7CB4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_85E4();
  uint64_t v4 = sub_870C();
  v5(v4);
  return a2;
}

uint64_t sub_7D08(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_85E4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_7D60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7DC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for NotebookSourceGenerator(uint64_t a1)
{
  return sub_7C64(a1);
}

uint64_t initializeWithCopy for NotebookSourceGenerator(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for NotebookSourceGenerator(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_7EA4(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for NotebookSourceGenerator(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotebookSourceGenerator(uint64_t a1, uint64_t a2)
{
  sub_7C64(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotebookSourceGenerator(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for NotebookSourceGenerator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NotebookSourceGenerator()
{
  return &type metadata for NotebookSourceGenerator;
}

unint64_t sub_81C0()
{
  unint64_t result = qword_18DA8;
  if (!qword_18DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18DA8);
  }
  return result;
}

unint64_t sub_8210()
{
  unint64_t result = qword_18DB8;
  if (!qword_18DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_18DB8);
  }
  return result;
}

uint64_t sub_825C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_8294(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_82D8(uint64_t a1, uint64_t *a2)
{
  sub_3350(a2);
  sub_85E4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_832C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_8344(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_83A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_3350(a3);
  sub_85E4();
  uint64_t v4 = sub_870C();
  v5(v4);
  return a2;
}

uint64_t sub_8414(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_842C(uint64_t result)
{
  *(void *)(v1 + 472) = result;
  return result;
}

uint64_t sub_8444(uint64_t a1)
{
  *(void *)(v2 + 464) = a1;
  sub_8294(v1, v1[3]);
  return sub_10950();
}

uint64_t sub_8488()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_8294(v0, v1);
  return dispatch thunk of Interaction.intent.getter(v1, v2);
}

unint64_t sub_84E4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + 424)
       + ((*(unsigned __int8 *)(v1 + 512) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 512))
       + *(void *)(v1 + 440) * a1;
}

char *sub_850C()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_74E4(0, v2, 1, v0);
}

uint64_t sub_8530()
{
  return sub_10B40();
}

uint64_t sub_8560()
{
  sub_832C(v1, v0);
  return sub_8344(v0, v2);
}

uint64_t sub_85A0(void *a1)
{
  sub_8294(a1, v1);
  return sub_10950();
}

uint64_t sub_85F4()
{
  return v0;
}

uint64_t sub_861C()
{
  return v0;
}

double sub_8638@<D0>(uint64_t a1@<X8>)
{
  return sub_4BBC(0xD000000000000010, (a1 - 32) | 0x8000000000000000, v1, v2);
}

char *sub_8660@<X0>(unint64_t a1@<X8>)
{
  return sub_74E4((char *)(a1 > 1), v2, 1, v1);
}

uint64_t sub_8684@<X0>(uint64_t a1@<X8>)
{
  sub_832C(v2, a1 + 32);
  return sub_7C64(v1);
}

uint64_t sub_86B4()
{
  return v0;
}

void *sub_86CC()
{
  return sub_8294(*(void **)(v0 + 360), *(void *)(*(void *)(v0 + 360) + 24));
}

uint64_t sub_870C()
{
  return v0;
}

uint64_t sub_8720()
{
  return swift_task_alloc();
}

uint64_t sub_874C()
{
  uint64_t v1 = sub_107C0();
  v0[8] = v1;
  sub_8414(v1);
  v0[9] = v2;
  v0[10] = swift_task_alloc();
  uint64_t v3 = sub_10840();
  v0[11] = v3;
  sub_8414(v3);
  v0[12] = v4;
  v0[13] = swift_task_alloc();
  uint64_t v5 = sub_10850();
  v0[14] = v5;
  sub_8414(v5);
  v0[15] = v6;
  v0[16] = swift_task_alloc();
  sub_3350(&qword_18E80);
  v0[17] = swift_task_alloc();
  v0[18] = swift_task_alloc();
  sub_8610();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_8890()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v23 = v0[14];
  uint64_t v24 = v0[17];
  uint64_t v6 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v8 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v9 = v0[8];
  sub_10820();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for Calendar.Component.year(_:), v6);
  sub_107B0();
  sub_10810();
  uint64_t v10 = v7;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v10, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v23);
  id v12 = [objc_allocWithZone((Class)BMPublisherOptions) init];
  v0[19] = v12;
  sub_8D20(v1, v24);
  if (sub_42C4(v24, 1, v9) == 1)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v14 = v0[17];
    uint64_t v15 = v0[8];
    Class isa = sub_10780().super.isa;
    v11(v14, v15);
  }
  [v12 setStartDate:isa];

  id v16 = [(id)BiomeLibrary() App];
  swift_unknownObjectRelease();
  id v17 = [v16 Intent];
  swift_unknownObjectRelease();
  id v18 = [v17 publisherWithOptions:v12];

  v0[6] = sub_8D88;
  v0[7] = 0;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_8E58;
  v0[5] = &unk_14DC8;
  unint64_t v19 = _Block_copy(v0 + 2);
  id v20 = [v18 filterWithIsIncluded:v19];
  v0[20] = v20;
  _Block_release(v19);

  uint64_t v21 = (void *)swift_task_alloc();
  v0[21] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_8B90;
  return sub_8EC8((uint64_t)v20);
}

uint64_t sub_8B90()
{
  sub_83FC();
  *(unsigned char *)(v1 + 176) = v0;
  swift_task_dealloc();
  sub_8610();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_8C68()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 144);

  sub_90E8(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 176);
  return v3(v4);
}

uint64_t sub_8D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3350(&qword_18E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8D88(void *a1)
{
  id v1 = [a1 eventBody];
  if (v1)
  {
    uint64_t v2 = v1;
    if ([v1 donatedBySiri] && (uint64_t v3 = sub_966C(v2), v4))
    {
      if (v3 == 0xD000000000000010 && v4 == 0x8000000000011B20) {
        char v5 = 1;
      }
      else {
        char v5 = sub_10DC0();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_8E58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_8EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_8EC0()
{
  return swift_release();
}

uint64_t sub_8EC8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_8EE8, 0, 0);
}

uint64_t sub_8EE8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  void *v3 = v0;
  v3[1] = sub_8FE0;
  sub_8610();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_8FE0()
{
  sub_83FC();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_8610();
  return _swift_task_switch(v0, v1, v2);
}

uint64_t sub_90D0()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_90E8(uint64_t a1)
{
  uint64_t v2 = sub_3350(&qword_18E80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_9148(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_3350((uint64_t *)&unk_18DF0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  id v17 = sub_94DC;
  uint64_t v18 = v9;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_9558;
  id v16 = &unk_14E40;
  uint64_t v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v17 = sub_9608;
  uint64_t v18 = v7;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_9610;
  id v16 = &unk_14E68;
  uint64_t v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v12 = [a2 sinkWithCompletion:v10 shouldContinue:v11];
  _Block_release(v11);
  _Block_release(v10);
  swift_release();
}

void sub_93BC(uint64_t a1)
{
  sub_9148(a1, *(void **)(v1 + 16));
}

uint64_t sub_93C4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_93D4()
{
  return sub_10CE0();
}

uint64_t sub_9434()
{
  uint64_t v1 = sub_3350((uint64_t *)&unk_18DF0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_94DC()
{
  uint64_t v0 = sub_3350((uint64_t *)&unk_18DF0);
  sub_8414(v0);
  return sub_93D4();
}

void sub_9558(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_95C0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 1;
  return 0;
}

uint64_t sub_9608(uint64_t a1)
{
  return sub_95C0(a1, v1);
}

uint64_t sub_9610(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_966C(void *a1)
{
  id v1 = [a1 intentClass];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_10C80();

  return v3;
}

ValueMetadata *type metadata accessor for NotebookSuggestionValidators()
{
  return &type metadata for NotebookSuggestionValidators;
}

void sub_96F0()
{
  sub_D98C();
  uint64_t v1 = sub_3350((uint64_t *)&unk_18E00);
  uint64_t v2 = sub_D970(v1);
  __chkstk_darwin(v2);
  sub_4B9C();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_3350(&qword_18D88);
  uint64_t v7 = sub_D970(v6);
  __chkstk_darwin(v7);
  uint64_t v8 = sub_D8E4();
  uint64_t v9 = type metadata accessor for NotebookSuggestion(v8);
  uint64_t v10 = (int *)(v9 - 8);
  uint64_t v109 = *(void *)(v9 - 8);
  uint64_t v110 = v109;
  __chkstk_darwin(v9);
  sub_DA18();
  v132 = v11;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v114 = (uint64_t)&v100 - v14;
  __chkstk_darwin(v13);
  id v16 = (char *)&v100 - v15;
  unint64_t v107 = 0x8000000000011B60;
  *uint64_t v0 = 0xD000000000000023;
  v0[1] = 0x8000000000011B60;
  v112 = v0;
  int v130 = enum case for IntentType.inIntent(_:);
  sub_10920();
  sub_85E4();
  uint64_t v129 = *(void *)(v17 + 104);
  uint64_t v131 = v17 + 104;
  uint64_t v19 = v18;
  uint64_t v113 = v18;
  sub_D864();
  v20();
  sub_D9D8();
  sub_434C(v21, v22, v23, v19);
  uint64_t v106 = sub_3350(&qword_18E10);
  uint64_t v24 = type metadata accessor for NotebookSuggestion.Parameter(0);
  sub_8414(v24);
  sub_DA58();
  uint64_t v105 = v25;
  uint64_t v27 = v26;
  uint64_t v103 = v26;
  uint64_t v104 = v28 | 7;
  uint64_t v29 = swift_allocObject();
  long long v134 = xmmword_11360;
  uint64_t v101 = v29;
  *(_OWORD *)(v29 + 16) = xmmword_11360;
  long long v30 = (char *)(v29 + v27);
  uint64_t v102 = v5;
  sub_10A80();
  sub_DCF4(0xD000000000000016, 0x8000000000011940, v5, v30);
  uint64_t v116 = sub_108B0();
  sub_85E4();
  uint64_t v115 = *(void *)(v31 + 104);
  uint64_t v117 = v31 + 104;
  sub_D864();
  v32();
  uint64_t v128 = sub_3350(&qword_18E28);
  uint64_t v33 = sub_10A10();
  sub_8414(v33);
  sub_DA58();
  uint64_t v126 = v34;
  uint64_t v127 = v35;
  uint64_t v125 = v36 | 7;
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = v134;
  sub_10A30();
  uint64_t v124 = sub_3350(&qword_18D80);
  sub_10910();
  sub_D7C0();
  uint64_t v39 = v38;
  uint64_t v41 = *(void *)(v40 + 72);
  uint64_t v42 = *(unsigned __int8 *)(v38 + 80);
  uint64_t v121 = (v42 + 32) & ~v42;
  uint64_t v122 = v42 | 7;
  uint64_t v123 = v121 + 3 * v41;
  uint64_t v43 = swift_allocObject();
  long long v133 = xmmword_114F0;
  *(_OWORD *)(v43 + 16) = xmmword_114F0;
  int v120 = enum case for DeviceType.iPhone(_:);
  v44 = *(void (**)(void))(v39 + 104);
  sub_D7DC();
  v44();
  uint64_t v111 = v41;
  int v119 = enum case for DeviceType.iPad(_:);
  sub_D7DC();
  v44();
  int v118 = enum case for DeviceType.mac(_:);
  sub_D7DC();
  v44();
  sub_DA4C();
  v108 = v16;
  sub_DA04(v45);
  v47 = *(void **)(v46 - 256);
  sub_D548((uint64_t)v47, v48, &qword_18D88);
  *(void *)&v16[v10[8]] = v101;
  long long v49 = &v16[v10[9]];
  *(void *)long long v49 = &unk_18E20;
  *((void *)v49 + 1) = 0;
  sub_D924(v10[11]);
  *uint64_t v50 = sub_AAEC;
  v50[1] = 0;
  *(void *)&v16[v10[14]] = v37;
  v51 = &v16[v10[15]];
  *(void *)v51 = &unk_18E30;
  *((void *)v51 + 1) = 0;
  *(void *)&v16[v10[16]] = v43;
  unint64_t v52 = v107;
  void *v47 = 0xD000000000000023;
  v47[1] = v52;
  uint64_t v53 = v113;
  sub_D864();
  v54();
  sub_D9D8();
  sub_434C(v55, v56, v57, v53);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = v134;
  uint64_t v59 = (char *)(v58 + v103);
  uint64_t v60 = v102;
  sub_10A80();
  sub_DCF4(0xD000000000000017, 0x8000000000011920, v60, v59);
  uint64_t v61 = v114;
  sub_D864();
  v62();
  uint64_t v63 = swift_allocObject();
  sub_D94C(v63);
  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = v133;
  sub_D7DC();
  v44();
  sub_D7DC();
  v44();
  sub_D7DC();
  v44();
  sub_DA04(0x6E696D6552646461);
  v66 = *(void **)(v65 - 256);
  sub_D548((uint64_t)v66, v67, &qword_18D88);
  *(void *)(v61 + v10[8]) = v58;
  v68 = (void *)(v61 + v10[9]);
  void *v68 = &unk_18E48;
  v68[1] = 0;
  sub_D924(v10[11]);
  void *v69 = sub_AAEC;
  v69[1] = 0;
  sub_D9F0();
  void *v70 = &unk_18E50;
  v70[1] = 0;
  *(void *)(v61 + v10[16]) = v64;
  sub_DA4C();
  void *v66 = v71;
  v66[1] = v72;
  uint64_t v73 = v113;
  sub_D864();
  v74();
  sub_D9D8();
  sub_434C(v75, v76, v77, v73);
  sub_D864();
  v78();
  sub_3350(&qword_18E68);
  uint64_t v79 = sub_109A0();
  sub_D7C0();
  uint64_t v81 = v80;
  unint64_t v82 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
  uint64_t v83 = swift_allocObject();
  *(_OWORD *)(v83 + 16) = v134;
  sub_108F0();
  sub_85E4();
  sub_DA2C();
  v84();
  (*(void (**)(unint64_t, void, uint64_t))(v81 + 104))(v83 + v82, enum case for DeliveryVehicle.siriHints(_:), v79);
  uint64_t v85 = swift_allocObject();
  sub_D94C(v85);
  uint64_t v86 = swift_allocObject();
  *(_OWORD *)(v86 + 16) = v133;
  sub_D7DC();
  v44();
  sub_D7DC();
  v44();
  sub_D7DC();
  v44();
  sub_DA4C();
  uint64_t v87 = (uint64_t)v132;
  void *v132 = v88;
  *(void *)(v87 + 8) = v89;
  sub_D548((uint64_t)v66, v87 + v10[7], &qword_18D88);
  *(void *)(v87 + v10[8]) = &_swiftEmptyArrayStorage;
  v90 = (void *)(v87 + v10[9]);
  void *v90 = &unk_18E60;
  v90[1] = 0;
  *(void *)(v87 + v10[11]) = &_swiftEmptyArrayStorage;
  *(void *)(v87 + v10[12]) = v83;
  v91 = (void *)(v87 + v10[13]);
  void *v91 = sub_AAEC;
  v91[1] = 0;
  sub_D9F0();
  void *v92 = &unk_18E70;
  v92[1] = 0;
  *(void *)(v87 + v10[16]) = v86;
  sub_3350(&qword_18D98);
  uint64_t v93 = *(void *)(v109 + 72);
  unint64_t v94 = (*(unsigned __int8 *)(v110 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
  uint64_t v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = v133;
  uint64_t v96 = v95 + v94;
  uint64_t v97 = v114;
  sub_D358(v114, v96);
  sub_D358(v87, v96 + v93);
  uint64_t v98 = v96 + 2 * v93;
  uint64_t v99 = (uint64_t)v108;
  sub_D358((uint64_t)v108, v98);
  sub_D3BC(v87, (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_D3BC(v97, (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_D3BC(v99, (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_D90C();
}

uint64_t sub_A11C(uint64_t a1)
{
  return sub_A144(a1, (uint64_t)&enum case for SiriNotebookApp.notes(_:), &qword_191D8);
}

uint64_t sub_A130(uint64_t a1)
{
  return sub_A144(a1, (uint64_t)&enum case for SiriNotebookApp.reminders(_:), &qword_191E0);
}

uint64_t sub_A144(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10890();
  sub_D7C0();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_D8E4();
  sub_10BE0();
  v12[3] = sub_10990();
  v12[4] = sub_D75C(&qword_18F18, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  sub_7C00(v12);
  sub_DA2C();
  v9();
  sub_D864();
  v10();
  sub_10880();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
  uint64_t result = sub_10BB0();
  *a3 = result;
  return result;
}

void sub_A2B8()
{
  sub_D98C();
  uint64_t v0 = sub_3350((uint64_t *)&unk_18E00);
  uint64_t v1 = sub_D970(v0);
  __chkstk_darwin(v1);
  sub_4B9C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = (int *)type metadata accessor for NotebookSuggestion(0);
  sub_D7C0();
  uint64_t v90 = v6;
  __chkstk_darwin(v7);
  sub_DA18();
  v91 = v8;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v66 - v11;
  uint64_t v13 = (uint64_t *)((char *)&v66 + *(int *)(v10 + 20) - v11);
  sub_DA4C();
  void *v13 = v14;
  v13[1] = v15;
  uint64_t v16 = sub_10920();
  sub_85E4();
  sub_DA2C();
  v17();
  sub_D9D8();
  uint64_t v88 = v16;
  sub_434C(v18, v19, v20, v16);
  sub_3350(&qword_18E10);
  uint64_t v21 = type metadata accessor for NotebookSuggestion.Parameter(0);
  sub_8414(v21);
  uint64_t v23 = *(void *)(v22 + 72);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v26 = swift_allocObject();
  long long v89 = xmmword_11640;
  *(_OWORD *)(v26 + 16) = xmmword_11640;
  uint64_t v87 = v26;
  uint64_t v27 = (char *)(v26 + v25);
  sub_D6CC(0, &qword_18EF0);
  sub_10A70();
  sub_DCF4(0x656D614E7473696CLL, 0xE800000000000000, v4, v27);
  sub_10A70();
  sub_DCF4(0x7265646E696D6572, 0xED0000656C746954, v4, &v27[v23]);
  uint64_t v28 = &v12[v5[8]];
  uint64_t v29 = enum case for SuggestionDialogUtil.DialogId.createReminder(_:);
  sub_108B0();
  sub_85E4();
  uint64_t v85 = *(void (**)(char *, uint64_t))(v30 + 104);
  uint64_t v86 = v31;
  uint64_t v84 = v30 + 104;
  v85(v28, v29);
  uint64_t v83 = sub_3350(&qword_18EE0);
  uint64_t v32 = swift_allocObject();
  long long v82 = xmmword_11650;
  *(_OWORD *)(v32 + 16) = xmmword_11650;
  if (qword_189D8 != -1) {
    swift_once();
  }
  *(void *)(v32 + 32) = qword_191E0;
  sub_10BE0();
  swift_retain();
  *(void *)(v32 + 40) = sub_10BC0();
  *(void *)(v32 + 48) = sub_10BD0();
  *(void *)(v32 + 56) = sub_10BA0();
  uint64_t v92 = v32;
  sub_10CD0();
  uint64_t v67 = v92;
  uint64_t v33 = sub_3350(&qword_18E28);
  uint64_t v34 = sub_10A10();
  sub_8414(v34);
  uint64_t v36 = *(void *)(v35 + 72);
  uint64_t v38 = *(unsigned __int8 *)(v37 + 80);
  uint64_t v39 = (v38 + 32) & ~v38;
  uint64_t v81 = v33;
  uint64_t v78 = v38 | 7;
  uint64_t v79 = v39 + v36;
  uint64_t v40 = swift_allocObject();
  long long v77 = xmmword_11360;
  *(_OWORD *)(v40 + 16) = xmmword_11360;
  uint64_t v80 = v39;
  sub_10A30();
  uint64_t v41 = sub_3350(&qword_18D80);
  sub_10910();
  sub_D7C0();
  uint64_t v43 = v42;
  uint64_t v45 = *(void *)(v44 + 72);
  uint64_t v46 = *(unsigned __int8 *)(v42 + 80);
  uint64_t v47 = (v46 + 32) & ~v46;
  uint64_t v76 = v41;
  uint64_t v74 = v47 + 3 * v45;
  uint64_t v73 = v46 | 7;
  uint64_t v48 = swift_allocObject();
  long long v71 = xmmword_114F0;
  *(_OWORD *)(v48 + 16) = xmmword_114F0;
  uint64_t v75 = v47;
  long long v49 = *(void (**)(void))(v43 + 104);
  int v72 = enum case for DeviceType.iPhone(_:);
  sub_D7E8();
  v49();
  int v70 = enum case for DeviceType.iPad(_:);
  sub_D7E8();
  v49();
  uint64_t v68 = 2 * v45;
  int v69 = enum case for DeviceType.mac(_:);
  sub_D7E8();
  v49();
  strcpy(v12, "createReminder");
  v12[15] = -18;
  *(void *)&v12[v5[6]] = v87;
  uint64_t v50 = &v12[v5[7]];
  *(void *)uint64_t v50 = &unk_18EF8;
  *((void *)v50 + 1) = 0;
  *(void *)&v12[v5[9]] = v67;
  *(void *)&v12[v5[10]] = 0;
  v51 = &v12[v5[11]];
  *(void *)v51 = sub_AAEC;
  *((void *)v51 + 1) = 0;
  *(void *)&v12[v5[12]] = v40;
  unint64_t v52 = &v12[v5[13]];
  *(void *)unint64_t v52 = &unk_18F00;
  *((void *)v52 + 1) = 0;
  *(void *)&v12[v5[14]] = v48;
  sub_434C((uint64_t)v91 + v5[5], 1, 1, v88);
  sub_DA2C();
  v53();
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = v82;
  if (qword_189D0 != -1) {
    swift_once();
  }
  *(void *)(v54 + 32) = qword_191D8;
  swift_retain();
  *(void *)(v54 + 40) = sub_10BC0();
  *(void *)(v54 + 48) = sub_10BD0();
  *(void *)(v54 + 56) = sub_10BA0();
  uint64_t v92 = v54;
  sub_10CD0();
  uint64_t v55 = v92;
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = v77;
  sub_10A20();
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = v71;
  sub_D7E8();
  v49();
  sub_D7E8();
  v49();
  sub_D7E8();
  v49();
  uint64_t v58 = (uint64_t)v91;
  void *v91 = 0x6F4E657461657263;
  *(void *)(v58 + 8) = 0xEA00000000006574;
  *(void *)(v58 + v5[6]) = &_swiftEmptyArrayStorage;
  uint64_t v59 = (void *)(v58 + v5[7]);
  *uint64_t v59 = &unk_18F08;
  v59[1] = 0;
  *(void *)(v58 + v5[9]) = v55;
  *(void *)(v58 + v5[10]) = 0;
  uint64_t v60 = (void *)(v58 + v5[11]);
  *uint64_t v60 = sub_AAEC;
  v60[1] = 0;
  *(void *)(v58 + v5[12]) = v56;
  uint64_t v61 = (void *)(v58 + v5[13]);
  *uint64_t v61 = &unk_18F10;
  v61[1] = 0;
  *(void *)(v58 + v5[14]) = v57;
  sub_3350(&qword_18D98);
  uint64_t v62 = *(void *)(v90 + 72);
  unint64_t v63 = (*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80);
  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = v89;
  uint64_t v65 = v64 + v63;
  sub_D358((uint64_t)v12, v65);
  sub_D708(v58, v65 + v62, (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_D3BC((uint64_t)v12, (void (*)(void))type metadata accessor for NotebookSuggestion);
  sub_D90C();
}

uint64_t sub_AAD0()
{
  return _swift_task_switch(sub_D7B8, 0, 0);
}

uint64_t sub_AAF0()
{
  return sub_D7A4(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_AB28()
{
  return _swift_task_switch(sub_AB44, 0, 0);
}

uint64_t sub_AB44()
{
  sub_8594();
  sub_10C60();
  sub_D834();
  return v0();
}

uint64_t sub_ABBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_109D0();
  uint64_t v3 = sub_109C0();
  a1[3] = v2;
  uint64_t result = sub_D75C(&qword_18E90, (void (*)(uint64_t))&type metadata accessor for UtteranceAction);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_AC38(uint64_t a1, uint64_t a2)
{
  v2[23] = a1;
  v2[24] = a2;
  uint64_t v3 = sub_10900();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  return _swift_task_switch(sub_AD08, 0, 0);
}

uint64_t sub_AD08()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  sub_D8A4();
  uint64_t v3 = *(void (**)(void))(v1 + 104);
  sub_D7DC();
  v3();
  char v4 = sub_4C60();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  sub_D828();
  v5();
  uint64_t v6 = v0 + 144;
  sub_D828();
  v5();
  sub_8344(v2, v0 + 144);
  if (v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 224);
    uint64_t v9 = *(void *)(v0 + 200);
    sub_8294((void *)(v0 + 144), *(void *)(v0 + 168));
    sub_109E0();
    sub_D7DC();
    v3();
    char v7 = sub_4C60();
    sub_D828();
    v5();
    uint64_t v10 = v8;
    uint64_t v6 = v0 + 144;
    ((void (*)(uint64_t, uint64_t))v5)(v10, v9);
  }
  *(unsigned char *)(v0 + 240) = v7 & 1;
  sub_7C64(v6);
  if ((v7 & 1) == 0)
  {
    char v15 = *(unsigned char *)(v0 + 240);
    sub_3350(&qword_18E98);
    uint64_t inited = (__n128 *)swift_initStackObject();
    uint64_t v17 = sub_D840(inited, (__n128)xmmword_11640);
    v17[3].n128_u8[0] = 0;
    *(unsigned char *)(sub_D7F8((uint64_t)v17, (uint64_t)&type metadata for Bool) + 96) = v15;
    sub_10C60();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_D97C();
    sub_D9BC();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_AF78;
  sub_D9BC();
  return sub_B130(v12);
}

uint64_t sub_AF78()
{
  sub_8594();
  sub_83FC();
  *(unsigned char *)(v1 + 241) = v0;
  swift_task_dealloc();
  sub_8610();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_B04C()
{
  char v1 = *(unsigned char *)(v0 + 241);
  char v2 = *(unsigned char *)(v0 + 240);
  sub_3350(&qword_18E98);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v4 = sub_D840(inited, (__n128)xmmword_11640);
  v4[3].n128_u8[0] = (v1 & 1) == 0;
  *(unsigned char *)(sub_D7F8((uint64_t)v4, (uint64_t)&type metadata for Bool) + 96) = v2;
  sub_10C60();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = sub_D97C();
  return v6(v5);
}

uint64_t sub_B130(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return sub_D884((uint64_t)sub_B148);
}

uint64_t sub_B148()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_4564(v1, v0 + 16);
  sub_D548(v0 + 16, v0 + 56, &qword_18EA0);
  if (*(unsigned char *)(v0 + 56) == 2) {
    goto LABEL_4;
  }
  long long v2 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 112) = v2;
  *(unsigned char *)(v0 + 128) = *(unsigned char *)(v0 + 88);
  sub_D548(v0 + 104, v0 + 184, &qword_18EB8);
  sub_D548(v0 + 184, v0 + 136, &qword_18EB8);
  if ((*(unsigned char *)(v0 + 144) & 1) != 0
    || (double v3 = *(double *)(v0 + 136),
        sub_D548(v0 + 120, v0 + 152, &qword_18EB8),
        sub_D548(v0 + 152, v0 + 168, &qword_18EB8),
        (*(unsigned char *)(v0 + 176) & 1) != 0))
  {
LABEL_4:
    sub_D834();
    return v4(1);
  }
  else
  {
    double v6 = *(double *)(v0 + 168);
    id v7 = [objc_allocWithZone((Class)CNContactStore) init];
    *(void *)(v0 + 208) = v7;
    id v8 = [self defaultManager];
    *(void *)(v0 + 216) = v8;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_B338;
    return sub_C70C((uint64_t)v7, (uint64_t)v8, v3, v6);
  }
}

uint64_t sub_B338()
{
  sub_8594();
  sub_83FC();
  long long v2 = *(void **)(v1 + 216);
  double v3 = *(void **)(v1 + 208);
  uint64_t v4 = *v0;
  sub_85D4();
  *uint64_t v5 = v4;
  *(unsigned char *)(v7 + 49) = v6;
  swift_task_dealloc();

  sub_8610();
  return _swift_task_switch(v8, v9, v10);
}

unint64_t sub_B438()
{
  sub_8594();
  if (*(unsigned char *)(v0 + 49) == 1 && (unint64_t result = sub_D464(v1, (uint64_t)&off_14AE8), result == 2))
  {
    __break(1u);
  }
  else
  {
    sub_D834();
    return v3();
  }
  return result;
}

uint64_t sub_B4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[13] = a2;
  v3[14] = a3;
  v3[12] = a1;
  return _swift_task_switch(sub_B4E0, 0, 0);
}

uint64_t sub_B4E0()
{
  sub_8594();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_4564(v1, v0 + 56);
  sub_D548(v0 + 56, v0 + 16, &qword_18EA0);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 16);
  if (v2 == 2) {
    goto LABEL_11;
  }
  uint64_t v3 = swift_bridgeObjectRetain();
  __int16 v4 = sub_4448(v3);
  if (v2 & 1) == 0 || (v4 & 0x100) != 0 || (v4) {
    goto LABEL_11;
  }
  if (qword_189E8 != -1) {
    swift_once();
  }
  if (sub_FC1C() - 3 > 1)
  {
LABEL_11:
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7(0);
  }
  else
  {
    sub_8294(*(void **)(v0 + 112), *(void *)(*(void *)(v0 + 112) + 24));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_B640;
    return sub_874C();
  }
}

uint64_t sub_B640()
{
  sub_8594();
  uint64_t v2 = v1;
  sub_83FC();
  uint64_t v3 = *v0;
  sub_85D4();
  *__int16 v4 = v3;
  swift_task_dealloc();
  sub_D834();
  return v5(v2);
}

uint64_t sub_B708(uint64_t a1)
{
  v1[29] = a1;
  uint64_t v2 = sub_10900();
  v1[30] = v2;
  v1[31] = *(void *)(v2 - 8);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  return _swift_task_switch(sub_B7D8, 0, 0);
}

void sub_B7D8()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[29];
  sub_D8A4();
  uint64_t v3 = *(void (**)(void))(v1 + 104);
  sub_D7DC();
  v3();
  char v4 = sub_4C60();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  sub_D828();
  v5();
  sub_D828();
  v5();
  uint64_t v6 = v2;
  uint64_t v7 = (uint64_t)(v0 + 24);
  sub_8344(v6, (uint64_t)(v0 + 24));
  if (v4)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = v0[33];
    uint64_t v10 = v0[30];
    sub_8294(v0 + 24, v0[27]);
    sub_109E0();
    sub_D7DC();
    v3();
    char v8 = sub_4C60();
    sub_D828();
    v5();
    uint64_t v11 = v10;
    uint64_t v7 = (uint64_t)(v0 + 24);
    ((void (*)(uint64_t, uint64_t))v5)(v9, v11);
  }
  sub_7C64(v7);
  sub_3350(&qword_18E98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_114F0;
  *(void *)(inited + 32) = 0x7265746641796164;
  *(void *)(inited + 40) = 0xEF646E656B656557;
  sub_BA78();
  uint64_t v14 = v13;
  uint64_t v15 = sub_3350(&qword_18EA8);
  *(void *)(inited + 48) = v14;
  *(void *)(inited + 72) = v15;
  strcpy((char *)(inited + 80), "isDisplayHint");
  *(_WORD *)(inited + 94) = -4864;
  *(unsigned char *)(inited + 96) = v8 & 1;
  *(void *)(inited + 120) = &type metadata for Bool;
  strcpy((char *)(inited + 128), "hintVariation");
  *(_WORD *)(inited + 142) = -4864;
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = sub_D4BC(2uLL) + 1;
  sub_10C60();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_D834();
  sub_D9BC();
  __asm { BRAA            X2, X16 }
}

void sub_BA78()
{
  sub_D98C();
  sub_10870();
  sub_D7C0();
  v33[1] = v1;
  v33[2] = v0;
  __chkstk_darwin(v0);
  sub_4B9C();
  uint64_t v2 = sub_3350(&qword_18E80);
  uint64_t v3 = sub_D970(v2);
  __chkstk_darwin(v3);
  sub_4B9C();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_107C0();
  sub_D7C0();
  uint64_t v9 = v8;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  sub_10850();
  sub_D7C0();
  __chkstk_darwin(v14);
  sub_4B9C();
  sub_10820();
  sub_107B0();
  if (sub_107F0())
  {
    sub_C4AC();
    if (sub_42C4(v6, 1, v7) == 1)
    {
      uint64_t v15 = sub_D890();
      v16(v15);
      sub_D828();
      v17();
      sub_D410(v6, &qword_18E80);
    }
    else
    {
      sub_D9E4();
      v22();
      sub_3350(&qword_18E98);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_11640;
      *(void *)(inited + 32) = 1935893875;
      *(void *)(inited + 40) = 0xE400000000000000;
      sub_107A0();
      *(void *)(inited + 48) = v24;
      *(void *)(inited + 72) = &type metadata for Double;
      *(void *)(inited + 80) = 0x656E6F5A656D6974;
      *(void *)(inited + 88) = 0xE800000000000000;
      sub_10830();
      uint64_t v25 = sub_10860();
      v33[0] = v26;
      sub_D900();
      v27();
      *(void *)(inited + 120) = &type metadata for String;
      uint64_t v28 = v33[0];
      *(void *)(inited + 96) = v25;
      *(void *)(inited + 104) = v28;
      sub_10C60();
      uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
      v29(v13, v7);
      uint64_t v30 = sub_D890();
      ((void (*)(uint64_t))v29)(v30);
      uint64_t v31 = sub_D870();
      v32(v31);
    }
  }
  else
  {
    uint64_t v18 = sub_D890();
    v19(v18);
    uint64_t v20 = sub_D870();
    v21(v20);
  }
  sub_D90C();
}

uint64_t sub_BD94(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return _swift_task_switch(sub_BDB4, 0, 0);
}

uint64_t sub_BDB4()
{
  sub_8594();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_4564(v1, v0 + 56);
  sub_D548(v0 + 56, v0 + 16, &qword_18EA0);
  if (*(unsigned char *)(v0 + 16) != 2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    sub_4448(v2);
  }
  sub_D834();
  return v3();
}

uint64_t sub_BE64()
{
  uint64_t v1 = sub_107C0();
  v0[12] = v1;
  v0[13] = *(void *)(v1 - 8);
  v0[14] = swift_task_alloc();
  uint64_t v2 = sub_10850();
  v0[15] = v2;
  v0[16] = *(void *)(v2 - 8);
  v0[17] = swift_task_alloc();
  return _swift_task_switch(sub_BF7C, 0, 0);
}

uint64_t sub_BF7C()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[13];
  sub_3350(&qword_18E98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11360;
  *(void *)(inited + 32) = 0x6E656B6565577369;
  *(void *)(inited + 40) = 0xE900000000000064;
  sub_10820();
  sub_107B0();
  char v8 = sub_107F0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = v8 & 1;
  uint64_t v9 = sub_10C60();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_D834();
  return v10(v9);
}

uint64_t sub_C0D4(uint64_t a1, uint64_t a2)
{
  v2[2] = a2;
  sub_3350(&qword_18E80);
  v2[3] = swift_task_alloc();
  uint64_t v3 = sub_107C0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_10850();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  sub_3350(&qword_18E88);
  v2[11] = swift_task_alloc();
  v2[12] = type metadata accessor for UpdateReminderExecutionParameters();
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_C290, 0, 0);
}

uint64_t sub_C290()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_478C(v3, v1);
  if (sub_42C4(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[11];
    uint64_t v5 = (uint64_t *)&unk_18E88;
LABEL_5:
    sub_D410(v4, v5);
    char v13 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = v0[3];
  uint64_t v6 = v0[4];
  sub_D708(v0[11], v0[13], (void (*)(void))type metadata accessor for UpdateReminderExecutionParameters);
  sub_10820();
  sub_10800();
  int v8 = sub_42C4(v7, 1, v6);
  uint64_t v9 = v0[13];
  if (v8 == 1)
  {
    uint64_t v10 = v0[3];
    uint64_t v11 = sub_D9A4();
    v12(v11);
    sub_D3BC(v9, (void (*)(void))type metadata accessor for UpdateReminderExecutionParameters);
    uint64_t v5 = &qword_18E80;
    uint64_t v4 = v10;
    goto LABEL_5;
  }
  uint64_t v14 = v0[5];
  sub_D9E4();
  v15();
  sub_107B0();
  char v13 = sub_10790();
  uint64_t v21 = v9;
  uint64_t v16 = *(void (**)(void))(v14 + 8);
  sub_D828();
  v16();
  sub_D828();
  v16();
  uint64_t v17 = sub_D9A4();
  v18(v17);
  sub_D3BC(v21, (void (*)(void))type metadata accessor for UpdateReminderExecutionParameters);
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_D834();
  return v19(v13 & 1);
}

void sub_C4AC()
{
  sub_D98C();
  uint64_t v1 = v0;
  v30[0] = v2;
  uint64_t v3 = sub_10840();
  sub_D7C0();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  int v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3350(&qword_18E80);
  uint64_t v10 = sub_D970(v9);
  __chkstk_darwin(v10);
  sub_4B9C();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_107C0();
  sub_D7C0();
  __chkstk_darwin(v15);
  sub_4B9C();
  uint64_t v18 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v16 = v5 + 104;
  uint64_t v17 = v18;
  unsigned int v34 = enum case for Calendar.Component.day(_:);
  uint64_t v32 = (void (**)(void))(v19 + 32);
  uint64_t v33 = v16 - 96;
  v30[1] = v19 + 8;
  uint64_t v31 = v8;
  uint64_t v20 = 1;
  while (1)
  {
    v17(v8, v34, v3);
    sub_10810();
    sub_D900();
    v21();
    if (sub_42C4(v13, 1, v14) != 1) {
      break;
    }
    sub_D410(v13, &qword_18E80);
LABEL_6:
    if (++v20 == 7)
    {
      uint64_t v28 = 1;
      uint64_t v29 = v30[0];
      goto LABEL_9;
    }
  }
  uint64_t v22 = v17;
  uint64_t v23 = v3;
  uint64_t v24 = v16;
  uint64_t v25 = v1;
  uint64_t v26 = *v32;
  sub_D9E4();
  v26();
  if (sub_107F0())
  {
    sub_D900();
    v27();
    uint64_t v1 = v25;
    uint64_t v16 = v24;
    uint64_t v3 = v23;
    uint64_t v17 = v22;
    int v8 = v31;
    goto LABEL_6;
  }
  uint64_t v29 = v30[0];
  sub_D9E4();
  v26();
  uint64_t v28 = 0;
LABEL_9:
  sub_434C(v29, v28, 1, v14);
  sub_D90C();
}

uint64_t sub_C70C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  *(double *)(v4 + 16) = a3;
  *(double *)(v4 + 24) = a4;
  return sub_D884((uint64_t)sub_C728);
}

uint64_t sub_C728()
{
  if (sub_C9E8(*(void **)(v0 + 32)))
  {
    uint64_t v1 = *(void *)(v0 + 40);
    id v2 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:*(double *)(v0 + 16) longitude:*(double *)(v0 + 24)];
    *(void *)(v0 + 48) = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v3;
    v3[2] = v1;
    v3[3] = 0x407F400000000000;
    v3[4] = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_C8A8;
    sub_8610();
    return withCheckedContinuation<A>(isolation:function:_:)();
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5(0);
  }
}

uint64_t sub_C8A8()
{
  sub_8594();
  sub_83FC();
  uint64_t v1 = *v0;
  sub_85D4();
  *id v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_8610();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_C98C()
{
  sub_8594();

  sub_D834();
  return v1();
}

void *sub_C9E8(void *a1)
{
  id v1 = sub_CFC0(a1);
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 postalAddresses];
    sub_3350(&qword_18ED8);
    unint64_t v4 = sub_10CC0();

    if (v4 >> 62) {
      goto LABEL_24;
    }
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (; v5; uint64_t v5 = sub_10D80())
    {
      uint64_t v19 = v2;
      uint64_t v6 = 4;
      while (1)
      {
        id v7 = (v4 & 0xC000000000000001) != 0 ? (id)sub_10D60() : *(id *)(v4 + 8 * v6);
        int v8 = v7;
        id v2 = (void *)(v6 - 3);
        if (__OFADD__(v6 - 4, 1)) {
          break;
        }
        id v9 = [v7 label];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = sub_10C80();
          uint64_t v13 = v12;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v13 = 0;
        }
        uint64_t v14 = sub_10C80();
        if (v13)
        {
          if (v11 == v14 && v13 == v15)
          {

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v2 = &dword_0 + 1;
            goto LABEL_27;
          }
          char v17 = sub_10DC0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v17)
          {

            id v2 = &dword_0 + 1;
            goto LABEL_27;
          }
        }
        else
        {

          swift_bridgeObjectRelease();
        }
        ++v6;
        if (v2 == (void *)v5)
        {

          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
    }

LABEL_26:
    id v2 = 0;
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v2;
}

void sub_CC1C(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v8 = sub_3350((uint64_t *)&unk_18DF0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_D630;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_CF1C;
  aBlock[3] = &unk_14EF0;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  [a2 fetchLocationsOfInterestWithinDistance:a3 ofLocation:v13 withHandler:a4];
  _Block_release(v13);
}

uint64_t sub_CDDC(unint64_t a1, uint64_t a2)
{
  if (a1 && !a2)
  {
    if (a1 >> 62) {
      goto LABEL_18;
    }
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (; v3; uint64_t v3 = sub_10D80())
    {
      uint64_t v4 = 4;
      while (1)
      {
        id v5 = (a1 & 0xC000000000000001) != 0 ? (id)sub_10D60() : *(id *)(a1 + 8 * v4);
        uint64_t v6 = v5;
        uint64_t v7 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v8 = [v5 type];

        ++v4;
        if (v8) {
          BOOL v9 = v7 == v3;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9) {
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
    }
LABEL_19:
    swift_bridgeObjectRelease();
    sub_3350((uint64_t *)&unk_18DF0);
  }
  else
  {
    sub_3350((uint64_t *)&unk_18DF0);
  }
  return sub_10CE0();
}

uint64_t sub_CF1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_D6CC(0, &qword_18ED0);
    uint64_t v4 = sub_10CC0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_CFC0(void *a1)
{
  sub_3350(&qword_18EE0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_11660;
  *(void *)(v2 + 32) = CNContactPostalAddressesKey;
  sub_10CD0();
  uint64_t v3 = CNContactPostalAddressesKey;
  sub_3350(&qword_18EE8);
  Class isa = sub_10CB0().super.isa;
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = objc_msgSend(a1, "_ios_meContactWithKeysToFetch:error:", isa, &v9);

  id v6 = v9;
  if (!v5)
  {
    uint64_t v7 = v6;
    sub_10750();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_D0E4()
{
  sub_8594();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_D7B4;
  uint64_t v2 = sub_D93C();
  return sub_AC38(v2, v3);
}

uint64_t sub_D174()
{
  sub_8594();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_D204;
  uint64_t v2 = sub_D93C();
  return sub_B708(v2);
}

uint64_t sub_D204()
{
  sub_8594();
  sub_83FC();
  uint64_t v1 = *v0;
  sub_85D4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_D97C();
  return v4(v3);
}

uint64_t sub_D2C8()
{
  sub_8594();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_D7B4;
  sub_D93C();
  return sub_BE64();
}

uint64_t sub_D358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotebookSuggestion(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_D3BC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_85E4();
  sub_D900();
  v3();
  return a1;
}

uint64_t sub_D410(uint64_t a1, uint64_t *a2)
{
  sub_3350(a2);
  sub_85E4();
  sub_D900();
  v3();
  return a1;
}

unint64_t sub_D464(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 2;
  }
  unint64_t result = sub_D4BC(*(void *)(a2 + 16));
  if (result < v2) {
    return *(unsigned __int8 *)(a2 + result + 32);
  }
  __break(1u);
  return result;
}

unint64_t sub_D4BC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    unint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_D548(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_3350(a3);
  sub_85E4();
  uint64_t v4 = sub_DA38();
  v5(v4);
  return a2;
}

void sub_D598(uint64_t a1)
{
  sub_CC1C(a1, *(void **)(v1 + 16), *(void *)(v1 + 32), *(double *)(v1 + 24));
}

uint64_t sub_D5A8()
{
  sub_3350((uint64_t *)&unk_18DF0);
  sub_85E4();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  sub_D900();
  v5();
  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_D630(unint64_t a1, uint64_t a2)
{
  sub_3350((uint64_t *)&unk_18DF0);
  return sub_CDDC(a1, a2);
}

uint64_t sub_D6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_D6C4()
{
  return swift_release();
}

uint64_t sub_D6CC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_D708(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_85E4();
  uint64_t v4 = sub_DA38();
  v5(v4);
  return a2;
}

uint64_t sub_D75C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_D7A4(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_D7F8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 72) = a2;
  strcpy((char *)(result + 80), "isDisplayHint");
  *(_WORD *)(result + 94) = -4864;
  *(void *)(result + 120) = a2;
  return result;
}

__n128 *sub_D840(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x6948656D6F487369;
  result[2].n128_u64[1] = 0xEA0000000000746ELL;
  return result;
}

uint64_t sub_D870()
{
  return v0;
}

uint64_t sub_D884(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_D890()
{
  return v0;
}

uint64_t sub_D8A4()
{
  sub_8294(v0, v0[3]);
  return sub_109E0();
}

uint64_t sub_D8E4()
{
  return 0;
}

void sub_D924(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) = v1;
  *(void *)(v2 + *(int *)(v3 + 48)) = 0;
}

uint64_t sub_D93C()
{
  return v0;
}

uint64_t sub_D94C(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 - 112);
  return sub_10A30();
}

uint64_t sub_D970(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_D97C()
{
  return v0;
}

uint64_t sub_D9A4()
{
  return v0;
}

void sub_D9F0()
{
  *(void *)(v0 + *(int *)(v1 + 56)) = v2;
}

void sub_DA04(uint64_t a1@<X8>)
{
  *uint64_t v2 = a1;
  v2[1] = v1;
}

uint64_t sub_DA38()
{
  return v0;
}

uint64_t sub_DA6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  v19[1] = a1;
  sub_3350(&qword_18F20);
  __chkstk_darwin();
  sub_FA98();
  uint64_t v4 = sub_10770();
  sub_D7C0();
  uint64_t v6 = v5;
  __chkstk_darwin();
  id v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NotebookSuggestion(0);
  sub_108A0();
  sub_108C0();
  *uint64_t v2 = 0xD000000000000013;
  v2[1] = 0x8000000000011C30;
  uint64_t v10 = enum case for Image.appIcon(_:);
  uint64_t v11 = sub_10B80();
  sub_85E4();
  (*(void (**)(void *, uint64_t, uint64_t))(v12 + 104))(v2, v10, v11);
  sub_434C((uint64_t)v2, 0, 1, v11);
  uint64_t v13 = sub_10A50();
  swift_allocObject();
  uint64_t v14 = sub_10A40();
  uint64_t v21[3] = v13;
  v21[4] = &protocol witness table for StaticIconUrlProvider;
  v21[0] = v14;
  uint64_t v15 = (uint64_t *)(v3 + *(int *)(v9 + 44));
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  v20[3] = &type metadata for NotebookSuggestion.InvocationProvider;
  v20[4] = sub_DCA8();
  v20[0] = v17;
  v20[1] = v16;
  swift_retain();
  sub_10980();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  sub_7C64((uint64_t)v20);
  return sub_7C64((uint64_t)v21);
}

uint64_t type metadata accessor for NotebookSuggestion(uint64_t a1)
{
  return sub_DEE4(a1, (uint64_t *)&unk_19040);
}

unint64_t sub_DCA8()
{
  unint64_t result = qword_18F28;
  if (!qword_18F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18F28);
  }
  return result;
}

uint64_t sub_DCF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8 = sub_3350((uint64_t *)&unk_18E00);
  sub_D7C0();
  uint64_t v10 = v9;
  __chkstk_darwin();
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3350(&qword_18F30);
  __chkstk_darwin();
  sub_FA98();
  swift_bridgeObjectRetain_n();
  sub_10A90();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v8);
  sub_10A00();
  swift_allocObject();
  uint64_t v13 = sub_109F0();
  *((void *)a4 + 5) = &type metadata for TrueResolver;
  unint64_t v14 = sub_DE78();
  *((void *)a4 + 2) = a1;
  *((void *)a4 + 3) = a2;
  *(void *)a4 = a1;
  *((void *)a4 + 1) = a2;
  *((void *)a4 + 6) = v14;
  *((void *)a4 + 7) = v13;
  uint64_t v15 = type metadata accessor for NotebookSuggestion.Parameter(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 32))(&a4[*(int *)(v15 + 28)], a3, v8);
}

unint64_t sub_DE78()
{
  unint64_t result = qword_18F38;
  if (!qword_18F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18F38);
  }
  return result;
}

uint64_t type metadata accessor for NotebookSuggestion.Parameter(uint64_t a1)
{
  return sub_DEE4(a1, (uint64_t *)&unk_18FA0);
}

uint64_t sub_DEE4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DF18(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_DF40(uint64_t a1)
{
  return sub_DF18(a1, *v1);
}

uint64_t sub_DF48@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = a1;
    id v7 = [v5 targetTaskList];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 title];

      id v10 = [v9 description];
      uint64_t v11 = sub_10C80();
      uint64_t v13 = v12;

      a2[3] = (uint64_t)&type metadata for String;
      *a2 = v11;
      a2[1] = v13;
    }
    else
    {
    }
  }
  sub_109B0();
  sub_85E4();
  uint64_t v14 = sub_FAC8();
  return v15(v14);
}

void sub_E074(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 targetTaskList];
  if (!v7)
  {

    goto LABEL_12;
  }
  uint64_t v8 = v7;
  id v9 = [v7 tasks];

  sub_E268();
  unint64_t v10 = sub_10CC0();

  if (!(v10 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
LABEL_11:

    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_10D80();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v11 = (id)sub_10D60();
    goto LABEL_8;
  }
  if (*(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8)))
  {
    id v11 = *(id *)(v10 + 32);
LABEL_8:
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    id v13 = [v12 title];

    id v14 = [v13 description];
    uint64_t v15 = sub_10C80();
    uint64_t v17 = v16;

    a2[3] = (uint64_t)&type metadata for String;
    *a2 = v15;
    a2[1] = v17;
LABEL_12:
    sub_109B0();
    sub_85E4();
    uint64_t v19 = sub_FAC8();
    v20(v19);
    return;
  }
  __break(1u);
}

unint64_t sub_E268()
{
  unint64_t result = qword_18F40;
  if (!qword_18F40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18F40);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for NotebookSuggestion.InvocationProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NotebookSuggestion.InvocationProvider()
{
  return swift_release();
}

void *assignWithCopy for NotebookSuggestion.InvocationProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for NotebookSuggestion.InvocationProvider(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotebookSuggestion.InvocationProvider(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for NotebookSuggestion.InvocationProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotebookSuggestion.InvocationProvider()
{
  return &type metadata for NotebookSuggestion.InvocationProvider;
}

uint64_t sub_E3DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2 + 2;
    uint64_t v9 = a2[5];
    swift_bridgeObjectRetain();
    if (v9)
    {
      uint64_t v10 = a2[6];
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 48) = v10;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 16, (uint64_t)(a2 + 2), v9);
    }
    else
    {
      long long v12 = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 16) = *v8;
      *(_OWORD *)(a1 + 32) = v12;
      *(void *)(a1 + 48) = a2[6];
    }
    *(void *)(a1 + 56) = a2[7];
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    swift_retain();
    uint64_t v16 = sub_3350((uint64_t *)&unk_18E00);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_E52C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_7C64(a1 + 16);
  }
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_3350((uint64_t *)&unk_18E00);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_E5C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 2;
  uint64_t v8 = a2[5];
  swift_bridgeObjectRetain();
  if (v8)
  {
    uint64_t v9 = a2[6];
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v9;
    (**(void (***)(uint64_t, void *, uint64_t))(v8 - 8))(a1 + 16, v7, v8);
  }
  else
  {
    long long v10 = *((_OWORD *)v7 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v7;
    *(_OWORD *)(a1 + 32) = v10;
    *(void *)(a1 + 48) = v7[4];
  }
  *(void *)(a1 + 56) = a2[7];
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  swift_retain();
  uint64_t v14 = sub_3350((uint64_t *)&unk_18E00);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_E6C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v7 = *(_OWORD *)(a2 + 16);
    long long v8 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    sub_7C64(a1 + 16);
    goto LABEL_7;
  }
  sub_7EA4((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_3350((uint64_t *)&unk_18E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_E804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_3350((uint64_t *)&unk_18E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_E894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_7C64(a1 + 16);
  }
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_release();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_3350((uint64_t *)&unk_18E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_E954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_E968);
}

uint64_t sub_E968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_FAB0();
  }
  uint64_t v7 = sub_3350((uint64_t *)&unk_18E00);
  uint64_t v8 = a1 + *(int *)(a3 + 28);
  return sub_42C4(v8, a2, v7);
}

uint64_t sub_E9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_E9F8);
}

void sub_E9F8()
{
  sub_FADC();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_3350((uint64_t *)&unk_18E00);
    uint64_t v6 = v1 + *(int *)(v4 + 28);
    sub_434C(v6, v0, v0, v5);
  }
}

void sub_EA70()
{
  sub_EB20();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_EB20()
{
  if (!qword_18FB0)
  {
    sub_10B90();
    sub_109B0();
    unint64_t v0 = sub_108D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18FB0);
    }
  }
}

uint64_t *sub_EB88(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_10920();
    swift_bridgeObjectRetain();
    if (sub_42C4((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_3350(&qword_18D88);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      sub_434C((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v15 = (uint64_t *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[8];
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_108B0();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v22(v19, v20, v21);
    uint64_t v23 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v23) = *(uint64_t *)((char *)a2 + v23);
    uint64_t v24 = a3[11];
    uint64_t v25 = a3[12];
    uint64_t v26 = (uint64_t *)((char *)v4 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    *(uint64_t *)((char *)v4 + v25) = *(uint64_t *)((char *)a2 + v25);
    uint64_t v29 = a3[13];
    uint64_t v30 = a3[14];
    uint64_t v31 = (uint64_t *)((char *)v4 + v29);
    uint64_t v32 = (uint64_t *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    *(uint64_t *)((char *)v4 + v30) = *(uint64_t *)((char *)a2 + v30);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_EDC8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10920();
  if (!sub_42C4(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_108B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_EF0C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10920();
  swift_bridgeObjectRetain();
  if (sub_42C4((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_3350(&qword_18D88);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    sub_434C((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_108B0();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v20(v17, v18, v19);
  uint64_t v21 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  uint64_t v22 = a3[11];
  uint64_t v23 = a3[12];
  uint64_t v24 = (void *)((char *)a1 + v22);
  uint64_t v25 = (void *)((char *)a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  uint64_t v27 = a3[13];
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)((char *)a1 + v27);
  uint64_t v30 = (void *)((char *)a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_F0FC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10920();
  int v10 = sub_42C4((uint64_t)v7, 1, v9);
  int v11 = sub_42C4((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_3350(&qword_18D88);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  sub_434C((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_108B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[13];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_F3C4(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10920();
  if (sub_42C4((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_3350(&qword_18D88);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    sub_434C((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_108B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v17 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  uint64_t v18 = a3[14];
  *(_OWORD *)((char *)a1 + a3[13]) = *(_OWORD *)((char *)a2 + a3[13]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  return a1;
}

void *sub_F544(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10920();
  int v11 = sub_42C4((uint64_t)v8, 1, v10);
  int v12 = sub_42C4((uint64_t)v9, 1, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_3350(&qword_18D88);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  sub_434C((uint64_t)v8, 0, 1, v10);
LABEL_7:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  swift_release();
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_108B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  swift_release();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(_OWORD *)((char *)a1 + a3[13]) = *(_OWORD *)((char *)a2 + a3[13]);
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_F7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F7C4);
}

uint64_t sub_F7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_FAB0();
  }
  sub_3350(&qword_18D88);
  sub_FA80();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(a3 + 20);
  }
  else
  {
    uint64_t v9 = sub_108B0();
    uint64_t v10 = *(int *)(a3 + 32);
  }
  return sub_42C4(a1 + v10, a2, v9);
}

uint64_t sub_F864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F878);
}

void sub_F878()
{
  sub_FADC();
  if (v4)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    sub_3350(&qword_18D88);
    sub_FA80();
    if (*(_DWORD *)(v8 + 84) == v6)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(int *)(v5 + 20);
    }
    else
    {
      uint64_t v9 = sub_108B0();
      uint64_t v10 = *(int *)(v5 + 32);
    }
    sub_434C(v1 + v10, v0, v0, v9);
  }
}

void sub_F918()
{
  sub_FA24();
  if (v0 <= 0x3F)
  {
    sub_108B0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_FA24()
{
  if (!qword_19050)
  {
    sub_10920();
    unint64_t v0 = sub_10D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_19050);
    }
  }
}

uint64_t sub_FAB0()
{
  unint64_t v1 = *(void *)(v0 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_FAC8()
{
  return v0;
}

uint64_t sub_FAF0()
{
  uint64_t v0 = sub_10C30();
  sub_FB74(v0, qword_191E8);
  sub_825C(v0, (uint64_t)qword_191E8);
  return sub_10C20();
}

uint64_t *sub_FB74(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_FBD8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LocationManager()) init];
  qword_19200 = (uint64_t)result;
  return result;
}

uint64_t sub_FC08(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationManager) = a1;
  return _objc_release_x1();
}

uint64_t sub_FC1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager__authorizationStatus;
  if (!*(_DWORD *)(v0 + OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager__authorizationStatus))
  {
    if (qword_189E0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_10C30();
    sub_825C(v3, (uint64_t)qword_191E8);
    char v4 = sub_10C10();
    os_log_type_t v5 = sub_10D00();
    if (os_log_type_enabled(v4, v5))
    {
      int v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "[LocationManager] Failed to determine location services authorization for reminders.", v6, 2u);
      swift_slowDealloc();
    }
  }
  return *(unsigned int *)(v1 + v2);
}

id sub_FD14()
{
  uint64_t v11 = sub_10D20();
  uint64_t v1 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10D10();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10C50();
  __chkstk_darwin(v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationManager] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager__authorizationStatus] = 0;
  uint64_t v10 = OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationQueue;
  sub_10224();
  int v6 = v0;
  sub_10C40();
  uint64_t v13 = _swiftEmptyArrayStorage;
  sub_10264();
  sub_3350(&qword_19168);
  sub_102B4();
  sub_10D50();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v11);
  *(void *)&v0[v10] = sub_10D30();

  uint64_t v7 = (objc_class *)type metadata accessor for LocationManager();
  v12.receiver = v6;
  v12.super_class = v7;
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t sub_FF84()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_FFA4, 0, 0);
}

uint64_t sub_FFA4()
{
  uint64_t v1 = *(char **)(v0 + 16);
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationQueue];
  id v3 = objc_allocWithZone((Class)CLLocationManager);
  id v4 = v2;
  v1;
  id v5 = sub_10198(0xD000000000000013, 0x8000000000011C30, (uint64_t)v1, v2);
  sub_FC08((uint64_t)v5);
  int v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

id sub_10060(void *a1)
{
  id result = [a1 authorizationStatus];
  *(_DWORD *)(v1 + OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager__authorizationStatus) = result;
  return result;
}

id sub_100F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LocationManager()
{
  return self;
}

id sub_10198(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = v4;
  if (a2)
  {
    NSString v8 = sub_10C70();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  id v9 = [v5 initWithEffectiveBundleIdentifier:v8 delegate:a3 onQueue:a4];

  swift_unknownObjectRelease();
  return v9;
}

unint64_t sub_10224()
{
  unint64_t result = qword_19158;
  if (!qword_19158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_19158);
  }
  return result;
}

unint64_t sub_10264()
{
  unint64_t result = qword_19160;
  if (!qword_19160)
  {
    sub_10D10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19160);
  }
  return result;
}

unint64_t sub_102B4()
{
  unint64_t result = qword_19170;
  if (!qword_19170)
  {
    sub_10308(&qword_19168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19170);
  }
  return result;
}

uint64_t sub_10308(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

Swift::Int sub_10350()
{
  return sub_10DE0();
}

unint64_t sub_103A8()
{
  return 0xD000000000000012;
}

BOOL sub_103C4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_14B10;
  v6._object = a2;
  Swift::Int v4 = sub_10DA0(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

BOOL sub_10410@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_103C4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10448@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_103A8();
  *a1 = 0xD000000000000012;
  a1[1] = v3;
  return result;
}

void sub_10478(void *a1@<X8>)
{
  *a1 = &off_14AC0;
}

uint64_t sub_10494()
{
  sub_3350(&qword_19180);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11360;
  *(void *)(inited + 32) = &_swiftEmptyArrayStorage;
  sub_3350(&qword_19188);
  sub_1051C();
  uint64_t result = sub_10C60();
  qword_19208 = result;
  return result;
}

unint64_t sub_1051C()
{
  unint64_t result = qword_19190;
  if (!qword_19190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19190);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnnounceNotificationNotebookHints(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AnnounceNotificationNotebookHints(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10658);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10680()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnnounceNotificationNotebookHints()
{
  return &type metadata for AnnounceNotificationNotebookHints;
}

unint64_t sub_1069C()
{
  unint64_t result = qword_19198;
  if (!qword_19198)
  {
    sub_10308(&qword_191A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19198);
  }
  return result;
}

unint64_t sub_106F4()
{
  unint64_t result = qword_191A8;
  if (!qword_191A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_191A8);
  }
  return result;
}

uint64_t sub_10740()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10750()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10760(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10770()
{
  return type metadata accessor for URL();
}

NSDate sub_10780()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10790()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_107A0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_107B0()
{
  return static Date.now.getter();
}

uint64_t sub_107C0()
{
  return type metadata accessor for Date();
}

uint64_t sub_107D0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_107E0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_107F0()
{
  return Calendar.isDateInWeekend(_:)();
}

uint64_t sub_10800()
{
  return Calendar.date(from:)();
}

uint64_t sub_10810()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_10820()
{
  return static Calendar.current.getter();
}

uint64_t sub_10830()
{
  return Calendar.timeZone.getter();
}

uint64_t sub_10840()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10850()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10860()
{
  return TimeZone.identifier.getter();
}

uint64_t sub_10870()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10880()
{
  return SiriNotebookApp.bundleId.getter();
}

uint64_t sub_10890()
{
  return type metadata accessor for SiriNotebookApp();
}

uint64_t sub_108A0()
{
  return SuggestionDialogUtil.DialogId.catId.getter();
}

uint64_t sub_108B0()
{
  return type metadata accessor for SuggestionDialogUtil.DialogId();
}

uint64_t sub_108C0()
{
  return static SuggestionDialogUtil.templateDirectory.getter();
}

uint64_t sub_108D0()
{
  return type metadata accessor for Transformer();
}

uint64_t sub_108E0()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_108F0()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t sub_10900()
{
  return type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState.ResponseMode();
}

uint64_t sub_10910()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_10920()
{
  return type metadata accessor for IntentType();
}

uint64_t sub_10930()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_10940()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_10950()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t sub_10960()
{
  return dispatch thunk of Interaction.verb.getter();
}

uint64_t sub_10980()
{
  return static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)();
}

uint64_t sub_10990()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_109A0()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_109B0()
{
  return type metadata accessor for IntentParameter();
}

uint64_t sub_109C0()
{
  return UtteranceAction.__allocating_init()();
}

uint64_t sub_109D0()
{
  return type metadata accessor for UtteranceAction();
}

uint64_t sub_109E0()
{
  return dispatch thunk of EnvironmentSnapshot.responseMode.getter();
}

uint64_t sub_109F0()
{
  return ResolvableParameter.init(typeIdentifier:required:loggingKeyTransformer:intentTransformer:)();
}

uint64_t sub_10A00()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_10A10()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t sub_10A20()
{
  return static VersionedInvocations.HintsDawnA.getter();
}

uint64_t sub_10A30()
{
  return static VersionedInvocations.HintsDawnE.getter();
}

uint64_t sub_10A40()
{
  return StaticIconUrlProvider.init(icon:)();
}

uint64_t sub_10A50()
{
  return type metadata accessor for StaticIconUrlProvider();
}

uint64_t sub_10A70()
{
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)();
}

uint64_t sub_10A80()
{
  return static SuggestionTransformers.ignoreIntentValue()();
}

uint64_t sub_10A90()
{
  return static SuggestionTransformers.passthroughParameterForLogging()();
}

uint64_t sub_10AA0()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_10AB0()
{
  return dispatch thunk of SuggestionDetailsBuilder.viewProvider(_:)();
}

uint64_t sub_10AC0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_10AD0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_10AE0()
{
  return dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
}

uint64_t sub_10AF0()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_10B00()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
}

uint64_t sub_10B10()
{
  return dispatch thunk of SuggestionDetailsBuilder.onlyEnableThroughConfig()();
}

uint64_t sub_10B20()
{
  return dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
}

uint64_t sub_10B30()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_10B40()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_10B50()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t sub_10B60()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_10B70()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_10B80()
{
  return type metadata accessor for Image();
}

uint64_t sub_10B90()
{
  return type metadata accessor for Intent();
}

uint64_t sub_10BA0()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_10BB0()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_10BC0()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_10BD0()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_10BE0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_10BF0()
{
  return type metadata accessor for Objective();
}

uint64_t sub_10C00()
{
  return Wrappable.getRoot()();
}

uint64_t sub_10C10()
{
  return Logger.logObject.getter();
}

uint64_t sub_10C20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10C30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10C40()
{
  return static DispatchQoS.default.getter();
}

uint64_t sub_10C50()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10C60()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_10C70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10C80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10C90()
{
  return String.hash(into:)();
}

uint64_t sub_10CA0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_10CB0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10CC0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10CD0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10CE0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10CF0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10D00()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10D10()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10D20()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10D30()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10D40()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10D50()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10D60()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10D70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10D80()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10D90()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10DA0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10DC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10DD0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10DE0()
{
  return Hasher._finalize()();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
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

void objc_release(id a1)
{
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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