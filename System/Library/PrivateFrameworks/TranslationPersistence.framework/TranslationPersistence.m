uint64_t AnnotatedResult.displayString.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(void *)(a1 - 8);
  v6 = MEMORY[0x270FA5388]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 8))(v6);
  v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, a1);
  if (!v12) {
    v10 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 8) + 8))(a1);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
  return v10;
}

uint64_t dispatch thunk of FormattedString.formattedString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SanitizedResult.sanitizedFormattedString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnnotatedResult.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AnnotatedResult.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t FavoritesItem.translation.getter(unint64_t a1)
{
  if (a1 >> 62 == 1) {
    uint64_t v1 = a1 & 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 >> 62) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = a1;
  }
  id v3 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
  return v2;
}

void FavoritesItem.hash(into:)(uint64_t a1, unint64_t a2)
{
  if (!(a2 >> 62))
  {
    id v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
    sub_2603134C8();
    id v3 = objc_msgSend((id)a2, sel_identifier);
    goto LABEL_5;
  }
  if (a2 >> 62 == 1)
  {
    id v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
    sub_2603134C8();
    id v3 = objc_msgSend(v5, sel_identifier);
LABEL_5:
    id v4 = v3;
    sub_2603134A8();

    sub_2603134C8();
    swift_bridgeObjectRelease();

    return;
  }

  sub_2603134C8();
}

uint64_t FavoritesItem.hashValue.getter(unint64_t a1)
{
  sub_260313898();
  if (a1 >> 62)
  {
    if (a1 >> 62 == 1)
    {
      id v2 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
      sub_2603134C8();
      id v3 = objc_msgSend(v2, sel_identifier);
      sub_2603134A8();

      sub_2603134C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2603134C8();
    }
  }
  else
  {
    id v4 = (id)a1;
    sub_2603134C8();
    id v5 = objc_msgSend(v4, sel_identifier);
    sub_2603134A8();

    sub_2603134C8();
    swift_bridgeObjectRelease();
  }
  return sub_2603138B8();
}

uint64_t sub_2602F4848()
{
  return FavoritesItem.hashValue.getter(*v0);
}

void sub_2602F4850(uint64_t a1)
{
  FavoritesItem.hash(into:)(a1, *v1);
}

uint64_t sub_2602F4858()
{
  unint64_t v1 = *v0;
  sub_260313898();
  FavoritesItem.hash(into:)((uint64_t)v3, v1);
  return sub_2603138B8();
}

uint64_t sub_2602F489C(unint64_t *a1, unint64_t *a2)
{
  return _s22TranslationPersistence13FavoritesItemO2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t _s22TranslationPersistence13FavoritesItemO2eeoiySbAC_ACtFZ_0(unint64_t a1, unint64_t a2)
{
  if (!(a1 >> 62))
  {
    if (!(a2 >> 62))
    {
      id v4 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
      id v5 = (id)a2;
      id v15 = objc_msgSend((id)a1, sel_identifier);
      uint64_t v16 = sub_2603134A8();
      uint64_t v18 = v17;

      id v19 = objc_msgSend(v5, sel_identifier);
      uint64_t v20 = sub_2603134A8();
      uint64_t v22 = v21;

      if (v16 == v20 && v18 == v22) {
        goto LABEL_6;
      }
LABEL_12:
      char v14 = sub_260313828();
      goto LABEL_13;
    }
LABEL_15:
    char v14 = 0;
    return v14 & 1;
  }
  if (a1 >> 62 != 1)
  {
    char v14 = a2 == 0x8000000000000000;
    return v14 & 1;
  }
  if (a2 >> 62 != 1) {
    goto LABEL_15;
  }
  id v4 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
  id v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
  id v6 = objc_msgSend(v4, sel_identifier);
  uint64_t v7 = sub_2603134A8();
  uint64_t v9 = v8;

  id v10 = objc_msgSend(v5, sel_identifier);
  uint64_t v11 = sub_2603134A8();
  uint64_t v13 = v12;

  if (v7 != v11 || v9 != v13) {
    goto LABEL_12;
  }
LABEL_6:
  char v14 = 1;
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14 & 1;
}

unint64_t sub_2602F4A58()
{
  unint64_t result = qword_26A868488;
  if (!qword_26A868488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868488);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for FavoritesItem(void *a1, void *a2)
{
  id v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for FavoritesItem(void *a1)
{
}

uint64_t *assignWithCopy for FavoritesItem(uint64_t *a1, uint64_t *a2)
{
  id v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  uint64_t v4 = *a1;
  *a1 = *a2;
  id v5 = (void *)(v4 & 0x3FFFFFFFFFFFFFFFLL);
  id v6 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t *assignWithTake for FavoritesItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for FavoritesItem(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FavoritesItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2602F4C1C(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_2602F4C38(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2602F4C48(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for FavoritesItem()
{
  return &type metadata for FavoritesItem;
}

const char *TranslationPersistenceFeatures.domain.getter()
{
  return "Translate";
}

const char *TranslationPersistenceFeatures.feature.getter()
{
  return "favorites_sync";
}

uint64_t TranslationPersistenceFeatures.isEnabled.getter()
{
  unint64_t v3 = &type metadata for TranslationPersistenceFeatures;
  unint64_t v4 = sub_2602F4D00();
  char v0 = sub_260313428();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_2602F4D00()
{
  unint64_t result = qword_26A868490;
  if (!qword_26A868490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868490);
  }
  return result;
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

uint64_t static TranslationPersistenceFeatures.== infix(_:_:)()
{
  return 1;
}

uint64_t TranslationPersistenceFeatures.hash(into:)()
{
  return sub_2603138A8();
}

uint64_t TranslationPersistenceFeatures.hashValue.getter()
{
  return sub_2603138B8();
}

uint64_t sub_2602F4E18()
{
  return 1;
}

uint64_t sub_2602F4E20()
{
  return sub_2603138B8();
}

uint64_t sub_2602F4E64()
{
  return sub_2603138A8();
}

uint64_t sub_2602F4E8C()
{
  return sub_2603138B8();
}

unint64_t sub_2602F4ED0()
{
  unint64_t result = qword_26A868498;
  if (!qword_26A868498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868498);
  }
  return result;
}

const char *sub_2602F4F24()
{
  return "Translate";
}

const char *sub_2602F4F38()
{
  return "favorites_sync";
}

uint64_t getEnumTagSinglePayload for TranslationPersistenceFeatures(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TranslationPersistenceFeatures(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2602F5040);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2602F5068()
{
  return 0;
}

ValueMetadata *type metadata accessor for TranslationPersistenceFeatures()
{
  return &type metadata for TranslationPersistenceFeatures;
}

uint64_t sub_2602F5084()
{
  uint64_t v0 = sub_260313458();
  __swift_allocate_value_buffer(v0, qword_26A86B5E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A86B5E0);
  return sub_260313448();
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

uint64_t sub_2602F51A4(uint64_t a1, void *a2)
{
  sub_2602F5268(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_2602F5330(v5, v3);
  return swift_endAccess();
}

uint64_t sub_2602F5214@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  return sub_2602F5268(v3, a1);
}

uint64_t sub_2602F5268(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2602F52CC(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_2602F5330(a1, v3);
  return swift_endAccess();
}

uint64_t sub_2602F5330(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*sub_2602F5348())()
{
  return j__swift_endAccess;
}

uint64_t sub_2602F53A8()
{
  __swift_project_boxed_opaque_existential_1Tm(v0, v0[3]);
  return sub_260313488();
}

id AnySpeechResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AnySpeechResult.init(from:)(a1);
}

id AnySpeechResult.init(from:)(void *a1)
{
  unsigned int v4 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  id v5 = v1;
  id v6 = v4;
  sub_2603138C8();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for AnySpeechResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm(v12, v12[3]);
    uint64_t v10 = type metadata accessor for StoredSpeechResult();
    uint64_t v11 = sub_2602F6894(&qword_26A8684A8, 255, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
    sub_2602F6894(&qword_26A8684B0, 255, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
    sub_260313838();
    sub_2602F5330(&v9, (uint64_t)v5 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for AnySpeechResult();
    id v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t type metadata accessor for AnySpeechResult()
{
  return self;
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

uint64_t sub_2602F56A0(void *a1)
{
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2603138E8();
  uint64_t v2 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  sub_2602F5268(v2, (uint64_t)v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  sub_2602F57C8();
  sub_260313848();
  sub_2602F581C((uint64_t)v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_2602F57C8()
{
  unint64_t result = qword_26A8684B8;
  if (!qword_26A8684B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8684B8);
  }
  return result;
}

uint64_t sub_2602F581C(uint64_t a1)
{
  return a1;
}

id AnySpeechResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AnySpeechResult.init()()
{
}

id AnySpeechResult.__deallocating_deinit()
{
  return sub_2602F624C(type metadata accessor for AnySpeechResult);
}

id sub_2602F5914@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for AnySpeechResult());
  id result = AnySpeechResult.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2602F5968(void *a1)
{
  return sub_2602F56A0(a1);
}

uint64_t sub_2602F598C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  return sub_2602F5268(v3, a2);
}

uint64_t method lookup function for AnySpeechResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnySpeechResult);
}

uint64_t dispatch thunk of AnySpeechResult.value.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of AnySpeechResult.value.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AnySpeechResult.value.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AnySpeechResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of AnySpeechResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t sub_2602F5B0C()
{
  uint64_t result = sub_260313498();
  qword_26A86B5F8 = result;
  return result;
}

uint64_t sub_2602F5B78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2602F6780(a1, (uint64_t)v9);
  if (v9[3])
  {
    type metadata accessor for AnySpeechResult();
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      sub_260313248();
      swift_allocObject();
      sub_260313238();
      v9[0] = v8;
      sub_2602F6894(&qword_26A8684D8, v4, (void (*)(uint64_t))type metadata accessor for AnySpeechResult);
      uint64_t v5 = sub_260313228();
      uint64_t v7 = v6;
      *(void *)(a2 + 24) = MEMORY[0x263F06F78];

      uint64_t result = swift_release();
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v7;
      return result;
    }
  }
  else
  {
    uint64_t result = sub_2602F6698((uint64_t)v9);
  }
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_2602F5CC8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2602F6780(a1, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast())
    {
      sub_260313218();
      swift_allocObject();
      sub_260313208();
      *(void *)(a2 + 24) = type metadata accessor for AnySpeechResult();
      sub_2602F6894(&qword_26A8684C8, v3, (void (*)(uint64_t))type metadata accessor for AnySpeechResult);
      sub_2603131F8();
      swift_release();
      sub_2602F683C(v9, v10);
      return result;
    }
  }
  else
  {
    sub_2602F6698((uint64_t)v11);
  }
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_260313458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A86B5E0);
  uint64_t v5 = sub_260313438();
  os_log_type_t v6 = sub_260313588();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2602F2000, v5, v6, "No reversed data", v7, 2u);
    MEMORY[0x26120CEF0](v7, -1, -1);
  }

  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

id sub_2602F6074(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *__return_ptr, _OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_260313658();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    id v7 = a1;
  }
  a4(v16, v15);

  sub_2602F6698((uint64_t)v15);
  uint64_t v8 = v17;
  if (v17)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1Tm(v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v9, v9);
    uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = (void *)sub_260313818();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id sub_2602F6234()
{
  return sub_2602F624C(type metadata accessor for SourceInputValueTransformer);
}

id sub_2602F624C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SourceInputValueTransformer()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for AnySpeechResult.AnySpeechResultBox(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnySpeechResult.AnySpeechResultBox(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for AnySpeechResult.AnySpeechResultBox(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnySpeechResult.AnySpeechResultBox(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
        double result = (uint64_t *)swift_release();
        *long long v3 = v12;
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
          *double result = *a2;
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnySpeechResult.AnySpeechResultBox(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnySpeechResult.AnySpeechResultBox(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AnySpeechResult.AnySpeechResultBox(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AnySpeechResult.AnySpeechResultBox()
{
  return &type metadata for AnySpeechResult.AnySpeechResultBox;
}

uint64_t sub_2602F6698(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2602F6780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1Tm(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x26120CEF0);
  }
  return result;
}

uint64_t sub_2602F683C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2602F6894(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_2602F68DC()
{
  unint64_t result = qword_26A8684E0;
  if (!qword_26A8684E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8684E0);
  }
  return result;
}

TranslationPersistence::SpeechResultOrigin_optional __swiftcall SpeechResultOrigin.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_260313728();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t SpeechResultOrigin.rawValue.getter()
{
  if (*v0) {
    return 0x6563696F76;
  }
  else {
    return 1954047348;
  }
}

uint64_t sub_2602F69B0(char *a1, char *a2)
{
  return sub_2602FB38C(*a1, *a2);
}

unint64_t sub_2602F69C0()
{
  unint64_t result = qword_26A8684E8;
  if (!qword_26A8684E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8684E8);
  }
  return result;
}

uint64_t sub_2602F6A14()
{
  return sub_2602FB9E4();
}

uint64_t sub_2602F6A1C()
{
  return sub_2602FBFE0();
}

uint64_t sub_2602F6A24()
{
  return sub_2602FC638();
}

TranslationPersistence::SpeechResultOrigin_optional sub_2602F6A2C(Swift::String *a1)
{
  return SpeechResultOrigin.init(rawValue:)(*a1);
}

uint64_t sub_2602F6A38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SpeechResultOrigin.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2602F6A60()
{
  return sub_260313508();
}

uint64_t sub_2602F6AC0()
{
  return sub_2603134F8();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.hasSpaceAfter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.text.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SpeechTokenBin.bestAlternative.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SpeechTokenBin.tokenAlternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SpeechSausage.tokenBins.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeechResultOrigin(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SpeechResultOrigin(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2602F6CF0);
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

uint64_t sub_2602F6D18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2602F6D20(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeechResultOrigin()
{
  return &type metadata for SpeechResultOrigin;
}

uint64_t dispatch thunk of SpeechResult.isFinal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SpeechResult.sentenceConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SpeechResult.isEmpty()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SpeechResult.alternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SpeechResult.origin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

unint64_t sub_2602F6DA0()
{
  unint64_t result = qword_26A8684F0;
  if (!qword_26A8684F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8684F0);
  }
  return result;
}

uint64_t sub_2602F6DF4(char a1)
{
  return *(void *)&aIslowconhasspa[8 * a1];
}

BOOL sub_2602F6E14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2602F6E28()
{
  return sub_2603138B8();
}

uint64_t sub_2602F6E70()
{
  return sub_2603138A8();
}

uint64_t sub_2602F6E9C()
{
  return sub_2603138B8();
}

uint64_t sub_2602F6EE0()
{
  return sub_2602F6DF4(*v0);
}

uint64_t sub_2602F6EE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2602F9C0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2602F6F10()
{
  return 0;
}

void sub_2602F6F1C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2602F6F28(uint64_t a1)
{
  unint64_t v2 = sub_2602FAD28();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602F6F64(uint64_t a1)
{
  unint64_t v2 = sub_2602FAD28();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602F6FA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[0] = a3;
  v12[1] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868638);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FAD28();
  sub_2603138F8();
  char v15 = 0;
  sub_2603137D8();
  if (!v4)
  {
    char v14 = 1;
    sub_2603137D8();
    char v13 = 2;
    sub_2603137C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_2602F7144()
{
  return *v0;
}

uint64_t sub_2602F714C()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_2602F7154()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602F7184@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2602F9D74(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(unsigned char *)(a2 + 1) = BYTE1(result) & 1;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2602F71C0(void *a1)
{
  if (v1[1]) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  return sub_2602F6FA0(a1, v2 | *v1, *((void *)v1 + 1), *((void *)v1 + 2));
}

uint64_t sub_2602F71F4(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x65746C4174736562;
  }
}

uint64_t sub_2602F723C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8685F8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FA804();
  sub_2603138F8();
  char v14 = 0;
  sub_2603137E8();
  if (!v3)
  {
    v12[1] = a3;
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8685E0);
    sub_2602FA8AC(&qword_26A868600, &qword_26A8685E0, (void (*)(void))sub_2602FA918);
    sub_2603137F8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_2602F7400(char *a1, char *a2)
{
  return sub_2602FB024(*a1, *a2);
}

uint64_t sub_2602F740C()
{
  return sub_2602FBA5C();
}

uint64_t sub_2602F7414()
{
  return sub_2602FBE10();
}

uint64_t sub_2602F741C()
{
  return sub_2602FC81C();
}

uint64_t sub_2602F7424@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
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

uint64_t sub_2602F7484@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2602F71F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2602F74B0()
{
  return sub_2602F71F4(*v0);
}

uint64_t sub_2602F74B8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
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

void sub_2602F751C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2602F7528(uint64_t a1)
{
  unint64_t v2 = sub_2602FA804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602F7564(uint64_t a1)
{
  unint64_t v2 = sub_2602FA804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602F75A0()
{
  return *(void *)v0;
}

uint64_t sub_2602F75A8()
{
  return sub_2602FC8AC(*(void *)(v0 + 8));
}

uint64_t sub_2602F75B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2602F9F54(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_2602F75DC(void *a1)
{
  return sub_2602F723C(a1, *v1, v1[1]);
}

uint64_t sub_2602F75F8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8685A0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FA36C();
  sub_2603138F8();
  v10[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A868588);
  sub_2602FA8AC(&qword_26A8685A8, &qword_26A868588, (void (*)(void))sub_2602FA45C);
  sub_2603137F8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_2602F7790@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2602F77E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2602FA154();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2602F7810@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2602F7868(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2602F7874(uint64_t a1)
{
  unint64_t v2 = sub_2602FA36C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602F78B0(uint64_t a1)
{
  unint64_t v2 = sub_2602FA36C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602F78EC()
{
  return sub_2602FC9B8(*v0);
}

void *sub_2602F78F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2602FA170(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2602F7920(void *a1)
{
  return sub_2602F75F8(a1, *v1);
}

uint64_t StoredSpeechResult.isFinal.getter()
{
  return *v0;
}

uint64_t StoredSpeechResult.isFinal.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*StoredSpeechResult.isFinal.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.sentenceConfidence.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t StoredSpeechResult.sentenceConfidence.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*StoredSpeechResult.sentenceConfidence.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 24);
  uint64_t v4 = sub_260313418();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for StoredSpeechResult()
{
  uint64_t result = qword_26A868550;
  if (!qword_26A868550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StoredSpeechResult.locale.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 24);
  uint64_t v4 = sub_260313418();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*StoredSpeechResult.locale.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.isLowConfidence.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 28));
}

uint64_t StoredSpeechResult.isLowConfidence.setter(char a1)
{
  uint64_t result = type metadata accessor for StoredSpeechResult();
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*StoredSpeechResult.isLowConfidence.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.sanitizedFormattedString.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredSpeechResult.sanitizedFormattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StoredSpeechResult() + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoredSpeechResult.sanitizedFormattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.formattedString.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredSpeechResult.formattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StoredSpeechResult() + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoredSpeechResult.formattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.origin.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for StoredSpeechResult();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t StoredSpeechResult.origin.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for StoredSpeechResult();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

uint64_t (*StoredSpeechResult.origin.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.alternatives.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 44));
  if (v3)
  {
    *(void *)(a1 + 24) = &type metadata for StoredSpeechSausage;
    *(void *)(a1 + 32) = sub_2602F7E78();
    *(void *)a1 = v3;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return swift_bridgeObjectRetain();
}

unint64_t sub_2602F7E78()
{
  unint64_t result = qword_26A8684F8;
  if (!qword_26A8684F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8684F8);
  }
  return result;
}

uint64_t StoredSpeechResult.init(text:sanitizedText:locale:origin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X8>)
{
  char v13 = *a6;
  char v14 = (int *)type metadata accessor for StoredSpeechResult();
  char v15 = (void *)(a7 + v14[8]);
  *(void *)(a7 + v14[11]) = 0;
  *(unsigned char *)a7 = 1;
  *(void *)(a7 + 8) = 1000;
  uint64_t v16 = a7 + v14[6];
  uint64_t v17 = sub_260313418();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v16, a5, v17);
  *(unsigned char *)(a7 + v14[7]) = 0;
  id v19 = (void *)(a7 + v14[9]);
  *id v19 = a1;
  v19[1] = a2;
  *char v15 = a3;
  v15[1] = a4;
  *(unsigned char *)(a7 + v14[10]) = v13;
  return result;
}

Swift::Bool __swiftcall StoredSpeechResult.isEmpty()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for StoredSpeechResult();
  uint64_t v4 = MEMORY[0x270FA5388](v2, v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)(v1 + *(int *)(v4 + 32));
  uint64_t v9 = *v7;
  unint64_t v8 = v7[1];
  sub_2602F8E10(v1, (uint64_t)v6);
  if (v8)
  {
    unint64_t v10 = v8;
  }
  else
  {
    uint64_t v11 = &v6[*(int *)(v2 + 36)];
    uint64_t v9 = *(void *)v11;
    unint64_t v10 = *((void *)v11 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2602F8E74((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  return v12 == 0;
}

unint64_t sub_2602F809C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t result = 0x6E6F43776F4C7369;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0x657474616D726F66;
      break;
    case 6:
      unint64_t result = 0x74616E7265746C61;
      break;
    case 7:
      unint64_t result = 0x6E696769726FLL;
      break;
    default:
      unint64_t result = 0x6C616E69467369;
      break;
  }
  return result;
}

unint64_t sub_2602F81BC(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t result = 0x6E6F43776F4C7369;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0x657474616D726F66;
      break;
    case 6:
      unint64_t result = 0x74616E7265746C61;
      break;
    case 7:
      unint64_t result = 0x6E696769726FLL;
      break;
    default:
      unint64_t result = 0x6C616E69467369;
      break;
  }
  return result;
}

uint64_t sub_2602F82DC(unsigned __int8 *a1, char *a2)
{
  return sub_2602FB0D8(*a1, *a2);
}

uint64_t sub_2602F82E8()
{
  return sub_2602FC6AC();
}

uint64_t sub_2602F82F4()
{
  return sub_2602FBE8C();
}

uint64_t sub_2602F82FC()
{
  return sub_2602FC6AC();
}

uint64_t sub_2602F8304@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2602FA320();
  *a1 = result;
  return result;
}

unint64_t sub_2602F8334@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2602F809C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2602F8360()
{
  return sub_2602F81BC(*v0);
}

uint64_t sub_2602F8368@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2602FA320();
  *a1 = result;
  return result;
}

void sub_2602F8390(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_2602F839C(uint64_t a1)
{
  unint64_t v2 = sub_2602F8ED0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602F83D8(uint64_t a1)
{
  unint64_t v2 = sub_2602F8ED0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StoredSpeechResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v4 = sub_260313418();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868500);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StoredSpeechResult();
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = &v16[*(int *)(v14 + 32)];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  v39 = (uint64_t *)v17;
  uint64_t v18 = (int *)v14;
  uint64_t v40 = *(int *)(v14 + 44);
  id v19 = v16;
  *(void *)&v16[v40] = 0;
  uint64_t v20 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602F8ED0();
  v36 = v11;
  sub_2603138D8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v42) = 0;
    uint64_t v21 = (uint64_t)v19;
    *id v19 = sub_260313778() & 1;
    LOBYTE(v42) = 1;
    *((void *)v19 + 1) = sub_260313788();
    LOBYTE(v42) = 2;
    sub_2602F90CC(&qword_26A868510, MEMORY[0x263F07690]);
    uint64_t v22 = v38;
    sub_260313798();
    (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v21 + v18[6], v7, v22);
    LOBYTE(v42) = 3;
    v23 = v36;
    *(unsigned char *)(v21 + v18[7]) = sub_260313778() & 1;
    LOBYTE(v42) = 4;
    uint64_t v24 = sub_260313738();
    v26 = v39;
    uint64_t v25 = v40;
    uint64_t *v39 = v24;
    v26[1] = v27;
    LOBYTE(v42) = 5;
    uint64_t v28 = sub_260313768();
    v29 = (uint64_t *)(v21 + v18[9]);
    uint64_t *v29 = v28;
    v29[1] = v30;
    char v41 = 6;
    sub_2602F8F24();
    sub_260313758();
    *(void *)(v21 + v25) = v42;
    char v41 = 7;
    sub_2602F8F78();
    sub_260313758();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v23, v35);
    *(unsigned char *)(v21 + v18[10]) = v42 & 1;
    sub_2602F8E10(v21, v33);
    __swift_destroy_boxed_opaque_existential_1(v20);
    return sub_2602F8E74(v21);
  }
}

uint64_t StoredSpeechResult.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868528);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602F8ED0();
  sub_2603138F8();
  LOBYTE(v13) = 0;
  sub_2603137D8();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_2603137E8();
    uint64_t v10 = type metadata accessor for StoredSpeechResult();
    LOBYTE(v13) = 2;
    sub_260313418();
    sub_2602F90CC(&qword_26A868530, MEMORY[0x263F07690]);
    sub_2603137F8();
    LOBYTE(v13) = 3;
    sub_2603137D8();
    LOBYTE(v13) = 4;
    sub_2603137A8();
    LOBYTE(v13) = 5;
    sub_2603137C8();
    uint64_t v13 = *(void *)(v3 + *(int *)(v10 + 44));
    HIBYTE(v12) = 6;
    sub_2602F8FCC();
    sub_2603137B8();
    LOBYTE(v13) = *(unsigned char *)(v3 + *(int *)(v10 + 40));
    HIBYTE(v12) = 7;
    sub_2602F9020();
    sub_2603137F8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_2602F8C68()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_2602F8C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + *(int *)(a1 + 44));
  if (v4)
  {
    *(void *)(a2 + 24) = &type metadata for StoredSpeechSausage;
    *(void *)(a2 + 32) = sub_2602F7E78();
    *(void *)a2 = v4;
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_2602F8CE4@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 40));
  return result;
}

uint64_t sub_2602F8CF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StoredSpeechResult.init(from:)(a1, a2);
}

uint64_t sub_2602F8D0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_260313418();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_2602F8D7C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_2602F8D88(void *a1)
{
  return StoredSpeechResult.encode(to:)(a1);
}

uint64_t sub_2602F8DA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2602F8DD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2602F8E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoredSpeechResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2602F8E74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoredSpeechResult();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2602F8ED0()
{
  unint64_t result = qword_26A868508;
  if (!qword_26A868508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868508);
  }
  return result;
}

unint64_t sub_2602F8F24()
{
  unint64_t result = qword_26A868518;
  if (!qword_26A868518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868518);
  }
  return result;
}

unint64_t sub_2602F8F78()
{
  unint64_t result = qword_26A868520;
  if (!qword_26A868520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868520);
  }
  return result;
}

unint64_t sub_2602F8FCC()
{
  unint64_t result = qword_26A868538;
  if (!qword_26A868538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868538);
  }
  return result;
}

unint64_t sub_2602F9020()
{
  unint64_t result = qword_26A868540;
  if (!qword_26A868540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868540);
  }
  return result;
}

uint64_t sub_2602F9074(uint64_t a1)
{
  uint64_t result = sub_2602F90CC(&qword_26A868548, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2602F90CC(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for StoredSpeechResult(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_260313418();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v12 = (void *)((char *)v4 + v11);
    uint64_t v13 = (void *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = a3[9];
    uint64_t v16 = a3[10];
    uint64_t v17 = (void *)((char *)v4 + v15);
    uint64_t v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    *(void *)((char *)v4 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for StoredSpeechResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2602F96CC);
}

uint64_t sub_2602F96CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_260313418();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StoredSpeechResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2602F97A8);
}

uint64_t sub_2602F97A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_260313418();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2602F986C()
{
  uint64_t result = sub_260313418();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredSpeechResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for StoredSpeechResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2602F9A8CLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

unsigned char *sub_2602F9AB4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechResult.CodingKeys()
{
  return &type metadata for StoredSpeechResult.CodingKeys;
}

ValueMetadata *type metadata accessor for StoredSpeechSausage()
{
  return &type metadata for StoredSpeechSausage;
}

unint64_t sub_2602F9AE0()
{
  unint64_t result = qword_26A868560;
  if (!qword_26A868560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868560);
  }
  return result;
}

unint64_t sub_2602F9B38()
{
  unint64_t result = qword_26A868568;
  if (!qword_26A868568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868568);
  }
  return result;
}

unint64_t sub_2602F9B90()
{
  unint64_t result = qword_26A868570;
  if (!qword_26A868570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868570);
  }
  return result;
}

unint64_t sub_2602F9BE4(uint64_t a1)
{
  unint64_t result = sub_2602F8FCC();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2602F9C0C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F43776F4C7369 && a2 == 0xEF65636E65646966;
  if (v3 || (sub_260313828() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563617053736168 && a2 == 0xED00007265746641 || (sub_260313828() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_260313828();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2602F9D74(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868628);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FAD28();
  sub_2603138D8();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v15 = 0;
  char v8 = sub_260313778();
  char v14 = 1;
  char v9 = sub_260313778();
  char v13 = 2;
  sub_260313768();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  if (v9) {
    int v11 = 256;
  }
  else {
    int v11 = 0;
  }
  return v11 & 0xFFFFFFFE | v8 & 1;
}

uint64_t sub_2602F9F54(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8685D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = a1[3];
  __swift_project_boxed_opaque_existential_1Tm(a1, v8);
  sub_2602FA804();
  sub_2603138D8();
  if (!v1)
  {
    v10[31] = 0;
    uint64_t v8 = sub_260313788();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8685E0);
    v10[15] = 1;
    sub_2602FA8AC(&qword_26A8685E8, &qword_26A8685E0, (void (*)(void))sub_2602FA858);
    sub_260313798();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v8;
}

uint64_t sub_2602FA154()
{
  return 0x6E69426E656B6F74;
}

void *sub_2602FA170(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868578);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FA36C();
  sub_2603138D8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868588);
    sub_2602FA8AC(&qword_26A868590, &qword_26A868588, (void (*)(void))sub_2602FA408);
    sub_260313798();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    uint64_t v8 = (void *)v10[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_2602FA320()
{
  unint64_t v0 = sub_260313728();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

unint64_t sub_2602FA36C()
{
  unint64_t result = qword_26A868580;
  if (!qword_26A868580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868580);
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

unint64_t sub_2602FA408()
{
  unint64_t result = qword_26A868598;
  if (!qword_26A868598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868598);
  }
  return result;
}

unint64_t sub_2602FA45C()
{
  unint64_t result = qword_26A8685B0;
  if (!qword_26A8685B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685B0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StoredSpeechSausage.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2602FA54CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechSausage.CodingKeys()
{
  return &type metadata for StoredSpeechSausage.CodingKeys;
}

void *initializeBufferWithCopyOfBuffer for StoredSpeechTokenBin(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StoredSpeechTokenBin()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for StoredSpeechTokenBin(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for StoredSpeechTokenBin(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenBin(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenBin(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StoredSpeechTokenBin()
{
  return &type metadata for StoredSpeechTokenBin;
}

unint64_t sub_2602FA6D8()
{
  unint64_t result = qword_26A8685B8;
  if (!qword_26A8685B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685B8);
  }
  return result;
}

unint64_t sub_2602FA730()
{
  unint64_t result = qword_26A8685C0;
  if (!qword_26A8685C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685C0);
  }
  return result;
}

unint64_t sub_2602FA788()
{
  unint64_t result = qword_26A8685C8;
  if (!qword_26A8685C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685C8);
  }
  return result;
}

unint64_t sub_2602FA7DC(uint64_t a1)
{
  unint64_t result = sub_2602FA45C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2602FA804()
{
  unint64_t result = qword_26A8685D8;
  if (!qword_26A8685D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685D8);
  }
  return result;
}

unint64_t sub_2602FA858()
{
  unint64_t result = qword_26A8685F0;
  if (!qword_26A8685F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8685F0);
  }
  return result;
}

uint64_t sub_2602FA8AC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2602FA918()
{
  unint64_t result = qword_26A868608;
  if (!qword_26A868608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868608);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StoredSpeechTokenBin.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2602FAA38);
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

ValueMetadata *type metadata accessor for StoredSpeechTokenBin.CodingKeys()
{
  return &type metadata for StoredSpeechTokenBin.CodingKeys;
}

uint64_t destroy for StoredSpeechTokenAlternatives()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22TranslationPersistence29StoredSpeechTokenAlternativesVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredSpeechTokenAlternatives(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StoredSpeechTokenAlternatives(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenAlternatives(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenAlternatives(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechTokenAlternatives()
{
  return &type metadata for StoredSpeechTokenAlternatives;
}

unint64_t sub_2602FABFC()
{
  unint64_t result = qword_26A868610;
  if (!qword_26A868610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868610);
  }
  return result;
}

unint64_t sub_2602FAC54()
{
  unint64_t result = qword_26A868618;
  if (!qword_26A868618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868618);
  }
  return result;
}

unint64_t sub_2602FACAC()
{
  unint64_t result = qword_26A868620;
  if (!qword_26A868620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868620);
  }
  return result;
}

unint64_t sub_2602FAD00(uint64_t a1)
{
  unint64_t result = sub_2602FA918();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2602FAD28()
{
  unint64_t result = qword_26A868630;
  if (!qword_26A868630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868630);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenAlternatives.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoredSpeechTokenAlternatives.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2602FAED8);
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

ValueMetadata *type metadata accessor for StoredSpeechTokenAlternatives.CodingKeys()
{
  return &type metadata for StoredSpeechTokenAlternatives.CodingKeys;
}

unint64_t sub_2602FAF14()
{
  unint64_t result = qword_26A868640;
  if (!qword_26A868640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868640);
  }
  return result;
}

unint64_t sub_2602FAF6C()
{
  unint64_t result = qword_26A868648;
  if (!qword_26A868648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868648);
  }
  return result;
}

unint64_t sub_2602FAFC4()
{
  unint64_t result = qword_26A868650;
  if (!qword_26A868650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868650);
  }
  return result;
}

uint64_t sub_2602FB024(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 0x65746C4174736562;
  }
  if (v2) {
    unint64_t v4 = 0xEF65766974616E72;
  }
  else {
    unint64_t v4 = 0x8000000260315740;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000011;
  }
  else {
    unint64_t v5 = 0x65746C4174736562;
  }
  if (a2) {
    unint64_t v6 = 0x8000000260315740;
  }
  else {
    unint64_t v6 = 0xEF65766974616E72;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260313828();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2602FB0D8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x8000000260315770;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t v3 = 0xEF65636E65646966;
      unint64_t v5 = 0x6E6F43776F4C7369;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v3 = 0x80000002603157A0;
      break;
    case 5:
      unint64_t v3 = 0xEF676E6972745364;
      unint64_t v5 = 0x657474616D726F66;
      break;
    case 6:
      unint64_t v3 = 0xEC00000073657669;
      unint64_t v5 = 0x74616E7265746C61;
      break;
    case 7:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6E696769726FLL;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6C616E69467369;
      break;
  }
  unint64_t v6 = 0x8000000260315770;
  switch(a2)
  {
    case 1:
      goto LABEL_21;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x656C61636F6CLL) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xEF65636E65646966;
      if (v5 != 0x6E6F43776F4C7369) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0x80000002603157A0;
      if (v5 != 0xD000000000000018) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xEF676E6972745364;
      if (v5 != 0x657474616D726F66) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xEC00000073657669;
      unint64_t v2 = 0x74616E7265746C61;
LABEL_21:
      if (v5 == v2) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6E696769726FLL) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6C616E69467369) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_260313828();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2602FB38C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6563696F76;
  }
  else {
    uint64_t v3 = 1954047348;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6563696F76;
  }
  else {
    uint64_t v5 = 1954047348;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_260313828();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2602FB424(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x8000000260315850;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74616E7265746C61;
      unint64_t v3 = 0xEC00000073657669;
      break;
    case 2:
      unint64_t v5 = 0x6E696C66664F7369;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 3:
      break;
    default:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x656C61636F6CLL;
      break;
  }
  unint64_t v6 = 0x8000000260315850;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x74616E7265746C61;
      unint64_t v6 = 0xEC00000073657669;
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE900000000000065;
      if (v5 == 0x6E696C66664F7369) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    default:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x656C61636F6CLL) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_260313828();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2602FB5C0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x8000000260315810;
  uint64_t v4 = a1;
  uint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6974696E69666564;
      unint64_t v3 = 0xEA00000000006E6FLL;
      break;
    case 2:
      uint64_t v6 = 0x656372756F73;
      goto LABEL_6;
    case 3:
      uint64_t v6 = 0x746567726174;
LABEL_6:
      uint64_t v5 = v6 & 0xFFFFFFFFFFFFLL | 0x614D000000000000;
      unint64_t v3 = 0xEB00000000686374;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x736C6562616CLL;
      break;
    case 5:
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x444965736E6573;
      break;
  }
  unint64_t v7 = 0x8000000260315810;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEA00000000006E6FLL;
      if (v5 == 0x6974696E69666564) {
        goto LABEL_17;
      }
      goto LABEL_20;
    case 2:
      unint64_t v7 = 0xEB00000000686374;
      if (v5 != 0x614D656372756F73) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 3:
      unint64_t v2 = 0x614D746567726174;
      unint64_t v7 = 0xEB00000000686374;
      goto LABEL_16;
    case 4:
      unint64_t v7 = 0xE600000000000000;
      if (v5 != 0x736C6562616CLL) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 5:
LABEL_16:
      if (v5 == v2) {
        goto LABEL_17;
      }
      goto LABEL_20;
    default:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x444965736E6573) {
        goto LABEL_20;
      }
LABEL_17:
      if (v3 == v7) {
        char v8 = 1;
      }
      else {
LABEL_20:
      }
        char v8 = sub_260313828();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t sub_2602FB7D8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000018;
  unint64_t v3 = 0x80000002603157A0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000018;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEF676E6972745364;
      unint64_t v5 = 0x657474616D726F66;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xEA00000000006174;
      unint64_t v5 = 0x654D7365736E6573;
      break;
    case 4:
      unint64_t v3 = 0xEC0000006E6F6974;
      unint64_t v5 = 0x617A696E616D6F72;
      break;
    default:
      unint64_t v3 = 0xEF65636E65646966;
      unint64_t v5 = 0x6E6F43776F4C7369;
      break;
  }
  unint64_t v6 = 0x80000002603157A0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF676E6972745364;
      if (v5 == 0x657474616D726F66) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xEA00000000006174;
      unint64_t v2 = 0x654D7365736E6573;
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xEC0000006E6F6974;
      if (v5 != 0x617A696E616D6F72) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xEF65636E65646966;
      if (v5 != 0x6E6F43776F4C7369) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_260313828();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2602FB9E4()
{
  return sub_2603138B8();
}

uint64_t sub_2602FBA5C()
{
  return sub_2603138B8();
}

uint64_t sub_2602FBAF0()
{
  return sub_2603138B8();
}

uint64_t sub_2602FBC08()
{
  return sub_2603138B8();
}

uint64_t sub_2602FBD28()
{
  return sub_2603138B8();
}

uint64_t sub_2602FBE10()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FBE8C()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FBFE0()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FC040()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FC114()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FC218()
{
  sub_2603134C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2602FC324()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC440()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC554()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC638()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC6AC()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC81C()
{
  return sub_2603138B8();
}

uint64_t sub_2602FC8AC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_2603010AC(0, v1, 0);
    uint64_t v2 = v16;
    uint64_t v4 = (char *)(a1 + 32);
    do
    {
      char v5 = *v4;
      char v6 = v4[1];
      uint64_t v8 = *((void *)v4 + 1);
      uint64_t v7 = *((void *)v4 + 2);
      uint64_t v16 = v2;
      unint64_t v9 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_2603010AC(v10 > 1, v9 + 1, 1);
        uint64_t v2 = v16;
      }
      v4 += 24;
      char v14 = &type metadata for StoredSpeechTokenAlternatives;
      unint64_t v15 = sub_260302038();
      LOBYTE(v12) = v5;
      BYTE1(v12) = v6;
      *((void *)&v12 + 1) = v8;
      uint64_t v13 = v7;
      *(void *)(v2 + 16) = v9 + 1;
      sub_2602F5330(&v12, v2 + 40 * v9 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2602FC9B8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_2603010DC(0, v1, 0);
    uint64_t v2 = v13;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      uint64_t v13 = v2;
      unint64_t v7 = *(void *)(v2 + 16);
      unint64_t v8 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v8 >> 1)
      {
        sub_2603010DC(v8 > 1, v7 + 1, 1);
        uint64_t v2 = v13;
      }
      int v11 = &type metadata for StoredSpeechTokenBin;
      unint64_t v12 = sub_26030110C();
      *(void *)&long long v10 = v6;
      *((void *)&v10 + 1) = v5;
      *(void *)(v2 + 16) = v7 + 1;
      sub_2602F5330(&v10, v2 + 40 * v7 + 32);
      v4 += 2;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2602FCAB4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_260301160(0, v1, 0);
    uint64_t v2 = v23;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 2);
      uint64_t v6 = *v4;
      uint64_t v17 = *(v4 - 1);
      uint64_t v18 = *(v4 - 3);
      uint64_t v7 = v4[2];
      uint64_t v8 = v4[4];
      uint64_t v15 = v4[3];
      uint64_t v16 = v4[1];
      uint64_t v9 = v4[5];
      char v14 = *((unsigned char *)v4 + 48);
      unint64_t v10 = *(void *)(v2 + 16);
      unint64_t v11 = *(void *)(v2 + 24);
      int64_t v19 = v10 + 1;
      uint64_t v23 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v10 >= v11 >> 1)
      {
        sub_260301160(v11 > 1, v19, 1);
        uint64_t v2 = v23;
      }
      v4 += 10;
      uint64_t v21 = &type metadata for StoredTranslationSense;
      unint64_t v22 = sub_260301CF0();
      uint64_t v12 = swift_allocObject();
      *(void *)&long long v20 = v12;
      *(void *)(v12 + 16) = v18;
      *(void *)(v12 + 24) = v5;
      *(void *)(v12 + 32) = v17;
      *(void *)(v12 + 40) = v6;
      *(void *)(v12 + 48) = v16;
      *(void *)(v12 + 56) = v7;
      *(void *)(v12 + 64) = v15;
      *(void *)(v12 + 72) = v8;
      *(void *)(v12 + 80) = v9;
      *(unsigned char *)(v12 + 88) = v14;
      *(void *)(v2 + 16) = v19;
      sub_2602F5330(&v20, v2 + 40 * v10 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2602FCC38(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_260301190(0, v1, 0);
    uint64_t v2 = v20;
    uint64_t v4 = (void *)(a1 + 88);
    do
    {
      char v16 = *((unsigned char *)v4 - 56);
      uint64_t v5 = *(v4 - 5);
      uint64_t v6 = *(v4 - 3);
      uint64_t v14 = *(v4 - 4);
      uint64_t v15 = *(v4 - 6);
      uint64_t v7 = *(v4 - 1);
      uint64_t v13 = *(v4 - 2);
      uint64_t v8 = *v4;
      unint64_t v9 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v2 + 24);
      uint64_t v20 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_260301190(v10 > 1, v9 + 1, 1);
        uint64_t v2 = v20;
      }
      uint64_t v18 = &type metadata for StoredTranslationAlternative;
      unint64_t v19 = sub_260301C4C();
      uint64_t v11 = swift_allocObject();
      *(void *)&long long v17 = v11;
      *(unsigned char *)(v11 + 16) = v16;
      *(void *)(v11 + 24) = v15;
      *(void *)(v11 + 32) = v5;
      *(void *)(v11 + 40) = v14;
      *(void *)(v11 + 48) = v6;
      *(void *)(v11 + 56) = v13;
      *(void *)(v11 + 64) = v7;
      *(void *)(v11 + 72) = v8;
      *(void *)(v2 + 16) = v9 + 1;
      sub_2602F5330(&v17, v2 + 40 * v9 + 32);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2602FCDA0(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6974696E69666564;
      break;
    case 2:
      uint64_t v3 = 0x656372756F73;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 0x746567726174;
LABEL_6:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x614D000000000000;
      break;
    case 4:
      uint64_t result = 0x736C6562616CLL;
      break;
    case 5:
      return result;
    default:
      uint64_t result = 0x444965736E6573;
      break;
  }
  return result;
}

uint64_t sub_2602FCE70(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6974696E69666564;
      break;
    case 2:
      uint64_t v3 = 0x656372756F73;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 0x746567726174;
LABEL_6:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x614D000000000000;
      break;
    case 4:
      uint64_t result = 0x736C6562616CLL;
      break;
    case 5:
      return result;
    default:
      uint64_t result = 0x444965736E6573;
      break;
  }
  return result;
}

uint64_t sub_2602FCF40(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_260301B84();
  sub_2603138F8();
  char v16 = 0;
  sub_2603137C8();
  if (!v2)
  {
    char v15 = 1;
    sub_2603137C8();
    char v14 = 2;
    sub_2603137C8();
    char v13 = 3;
    sub_2603137C8();
    uint64_t v12 = *(void *)(v3 + 64);
    v11[15] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687D0);
    sub_260301BD8(&qword_26A8687E8, &qword_26A8687D0);
    sub_2603137F8();
    v11[14] = 5;
    sub_2603137D8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_2602FD190(unsigned __int8 *a1, char *a2)
{
  return sub_2602FB5C0(*a1, *a2);
}

uint64_t sub_2602FD19C()
{
  return sub_2602FBAF0();
}

uint64_t sub_2602FD1A4()
{
  return sub_2602FC114();
}

uint64_t sub_2602FD1AC()
{
  return sub_2602FC440();
}

uint64_t sub_2602FD1B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260301AEC();
  *a1 = result;
  return result;
}

uint64_t sub_2602FD1E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2602FCDA0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2602FD210()
{
  return sub_2602FCE70(*v0);
}

uint64_t sub_2602FD218@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260301AEC();
  *a1 = result;
  return result;
}

void sub_2602FD240(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2602FD24C(uint64_t a1)
{
  unint64_t v2 = sub_260301B84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602FD288(uint64_t a1)
{
  unint64_t v2 = sub_260301B84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602FD2C4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602FD2F4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602FD324()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602FD354()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602FD384()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2602FD38C()
{
  return *(unsigned __int8 *)(v0 + 72);
}

__n128 sub_2602FD394@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2603015FC(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_2602FD3E0(void *a1)
{
  return sub_2602FCF40(a1);
}

uint64_t StoredTranslationAlternative.isLowConfidence.getter()
{
  return *v0;
}

uint64_t StoredTranslationAlternative.isLowConfidence.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*StoredTranslationAlternative.isLowConfidence.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.formattedString.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.formattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.formattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.sanitizedFormattedString.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.sanitizedFormattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.sanitizedFormattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.romanization.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.romanization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.romanization.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.sensesMeta.getter()
{
  return sub_2602FCAB4(*(void *)(v0 + 56));
}

void __swiftcall StoredTranslationAlternative.init(text:romanization:lowConfidence:)(TranslationPersistence::StoredTranslationAlternative *__return_ptr retstr, Swift::String text, Swift::String_optional romanization, Swift::Bool lowConfidence)
{
  retstr->isLowConfidence = lowConfidence;
  retstr->formattedString = text;
  retstr->sanitizedFormattedString.value._countAndFlagsBits = 0;
  retstr->sanitizedFormattedString.value._object = 0;
  retstr->romanization = romanization;
  retstr->_sensesMeta._rawValue = (void *)MEMORY[0x263F8EE78];
}

uint64_t StoredTranslationAlternative.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868658);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FD9B8();
  sub_2603138D8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v35 = 0;
    char v10 = sub_260313778();
    char v34 = 1;
    uint64_t v11 = sub_260313768();
    uint64_t v14 = v13;
    uint64_t v28 = v11;
    char v33 = 4;
    swift_bridgeObjectRetain();
    uint64_t v29 = v14;
    uint64_t v15 = sub_260313738();
    uint64_t v17 = v16;
    uint64_t v26 = v15;
    uint64_t v27 = a2;
    char v32 = 2;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_260313738();
    uint64_t v20 = v19;
    uint64_t v25 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868668);
    char v31 = 3;
    sub_2602FFB50(&qword_26A868670, &qword_26A868668, (void (*)(void))sub_2602FDA0C);
    swift_bridgeObjectRetain();
    sub_260313798();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v22 = v29;
    uint64_t v21 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = v27;
    uint64_t v24 = v28;
    *uint64_t v27 = v10 & 1;
    v23[1] = v24;
    v23[2] = v22;
    v23[3] = v25;
    v23[4] = v20;
    v23[5] = v26;
    v23[6] = v17;
    v23[7] = v21;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_2602FD9B8()
{
  unint64_t result = qword_26A868660;
  if (!qword_26A868660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868660);
  }
  return result;
}

unint64_t sub_2602FDA0C()
{
  unint64_t result = qword_26A868678;
  if (!qword_26A868678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868678);
  }
  return result;
}

uint64_t StoredTranslationAlternative.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868680);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1[1];
  uint64_t v24 = v1[2];
  uint64_t v25 = v9;
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  uint64_t v22 = v1[5];
  uint64_t v23 = v10;
  uint64_t v12 = v1[6];
  uint64_t v20 = v11;
  uint64_t v21 = v12;
  uint64_t v19 = v1[7];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FD9B8();
  uint64_t v13 = v4;
  sub_2603138F8();
  LOBYTE(v26) = 0;
  sub_2603137D8();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  uint64_t v16 = v21;
  uint64_t v15 = v22;
  uint64_t v17 = v23;
  LOBYTE(v26) = 1;
  sub_2603137C8();
  uint64_t v26 = v15;
  uint64_t v27 = v16;
  char v28 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A868688);
  sub_260301BD8(&qword_26A868690, &qword_26A868688);
  sub_2603137F8();
  uint64_t v26 = v17;
  uint64_t v27 = v20;
  char v28 = 2;
  sub_2603137F8();
  uint64_t v26 = v19;
  char v28 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A868668);
  sub_2602FFB50(&qword_26A868698, &qword_26A868668, (void (*)(void))sub_2602FDD54);
  sub_2603137F8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v13);
}

unint64_t sub_2602FDD54()
{
  unint64_t result = qword_26A8686A0;
  if (!qword_26A8686A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686A0);
  }
  return result;
}

unint64_t sub_2602FDDA8(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657474616D726F66;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x654D7365736E6573;
      break;
    case 4:
      unint64_t result = 0x617A696E616D6F72;
      break;
    default:
      unint64_t result = 0x6E6F43776F4C7369;
      break;
  }
  return result;
}

unint64_t sub_2602FDE80(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657474616D726F66;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x654D7365736E6573;
      break;
    case 4:
      unint64_t result = 0x617A696E616D6F72;
      break;
    default:
      unint64_t result = 0x6E6F43776F4C7369;
      break;
  }
  return result;
}

uint64_t sub_2602FDF58(unsigned __int8 *a1, char *a2)
{
  return sub_2602FB7D8(*a1, *a2);
}

uint64_t sub_2602FDF64()
{
  return sub_2602FBC08();
}

uint64_t sub_2602FDF6C()
{
  return sub_2602FC218();
}

uint64_t sub_2602FDF74()
{
  return sub_2602FC324();
}

uint64_t sub_2602FDF7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260301B38();
  *a1 = result;
  return result;
}

unint64_t sub_2602FDFAC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2602FDDA8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2602FDFD8()
{
  return sub_2602FDE80(*v0);
}

uint64_t sub_2602FDFE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260301B38();
  *a1 = result;
  return result;
}

void sub_2602FE008(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2602FE014(uint64_t a1)
{
  unint64_t v2 = sub_2602FD9B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602FE050(uint64_t a1)
{
  unint64_t v2 = sub_2602FD9B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602FE08C()
{
  return sub_2602FCAB4(*(void *)(v0 + 56));
}

uint64_t sub_2602FE094()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2602FE0C4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return StoredTranslationAlternative.init(from:)(a1, a2);
}

uint64_t sub_2602FE0DC(void *a1)
{
  return StoredTranslationAlternative.encode(to:)(a1);
}

uint64_t sub_2602FE0F4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredDisambiguableResult.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t StoredDisambiguableResult.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FE4E8();
  sub_2603138D8();
  if (!v2)
  {
    sub_2602FE53C();
    sub_260313798();
    uint64_t v11 = v28;
    unint64_t v10 = v29;
    sub_2602FE590(0, &qword_26A8686C0);
    sub_2602FE590(0, &qword_26A8686C8);
    uint64_t v12 = sub_2603135C8();
    if (v12)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      sub_2602F683C(v11, v10);
      *a2 = v12;
    }
    else
    {
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_260313458();
      __swift_project_value_buffer(v14, (uint64_t)qword_26A86B5E0);
      uint64_t v15 = sub_260313438();
      os_log_type_t v16 = sub_260313598();
      int v17 = v16;
      uint64_t v30 = v15;
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v18 = swift_slowAlloc();
        int v27 = v17;
        uint64_t v19 = (_DWORD *)v18;
        uint64_t v25 = (void *)swift_slowAlloc();
        uint64_t v26 = (uint8_t *)v19;
        *uint64_t v19 = 138412290;
        uint64_t v24 = v19 + 1;
        sub_2602FE5CC();
        uint64_t v20 = (void *)swift_allocError();
        uint64_t v21 = sub_260313288();

        uint64_t v28 = v21;
        sub_260313628();
        uint64_t v23 = v25;
        uint64_t v22 = v26;
        *uint64_t v25 = v21;
        _os_log_impl(&dword_2602F2000, v30, (os_log_type_t)v27, "Failed to decode container into _LTDisambiguableResult: %@", v22, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
        swift_arrayDestroy();
        MEMORY[0x26120CEF0](v23, -1, -1);
        MEMORY[0x26120CEF0](v22, -1, -1);
      }

      sub_2602FE5CC();
      swift_allocError();
      swift_willThrow();
      sub_2602F683C(v11, v10);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2602FE4E8()
{
  unint64_t result = qword_26A8686B0;
  if (!qword_26A8686B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686B0);
  }
  return result;
}

unint64_t sub_2602FE53C()
{
  unint64_t result = qword_26A8686B8;
  if (!qword_26A8686B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686B8);
  }
  return result;
}

uint64_t sub_2602FE590(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2602FE5CC()
{
  unint64_t result = qword_26A8686D0;
  if (!qword_26A8686D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686D0);
  }
  return result;
}

uint64_t StoredDisambiguableResult.encode(to:)(void *a1)
{
  v18[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FE4E8();
  sub_2603138F8();
  uint64_t v9 = self;
  v18[0] = 0;
  id v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v18);
  id v11 = v18[0];
  if (v10)
  {
    uint64_t v12 = (void *)sub_2603132F8();
    uint64_t v14 = v13;

    v18[0] = v12;
    v18[1] = v14;
    sub_2602FF8F4();
    sub_2603137F8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return sub_2602F683C((uint64_t)v12, (unint64_t)v14);
  }
  else
  {
    os_log_type_t v16 = v11;
    sub_260313298();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_2602FE82C()
{
  return sub_260301514();
}

uint64_t sub_2602FE858()
{
  return sub_2603015B0();
}

uint64_t sub_2602FE880@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2602FE8D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_260301C38();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2602FE900@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_260313728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2602FE958(uint64_t a1)
{
  unint64_t v2 = sub_2602FE4E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602FE994(uint64_t a1)
{
  unint64_t v2 = sub_2602FE4E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602FE9D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return StoredDisambiguableResult.init(from:)(a1, a2);
}

uint64_t sub_2602FE9E8(void *a1)
{
  return StoredDisambiguableResult.encode(to:)(a1);
}

uint64_t StoredTranslationResult.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_260313418();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t StoredTranslationResult.locale.setter(uint64_t a1)
{
  uint64_t v3 = sub_260313418();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*StoredTranslationResult.locale.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationResult.alternatives.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StoredTranslationResult() + 20));

  return sub_2602FCC38(v1);
}

uint64_t StoredTranslationResult.isOffline.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StoredTranslationResult() + 24));
}

uint64_t StoredTranslationResult.isOffline.setter(char a1)
{
  uint64_t result = type metadata accessor for StoredTranslationResult();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*StoredTranslationResult.isOffline.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationResult.isFinal.getter()
{
  return 1;
}

void *StoredTranslationResult.disambiguableResult.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for StoredTranslationResult() + 28));
  id v2 = v1;
  return v1;
}

uint64_t StoredTranslationResult.init(text:locale:isOffline:romanization:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13 = (int *)type metadata accessor for StoredTranslationResult();
  *(void *)(a7 + v13[7]) = 0;
  uint64_t v14 = sub_260313418();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(a7, a3, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686E8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_260314C10;
  *(unsigned char *)(v16 + 32) = 0;
  *(void *)(v16 + 40) = a1;
  *(void *)(v16 + 48) = a2;
  *(void *)(v16 + 56) = 0;
  *(void *)(v16 + 64) = 0;
  *(void *)(v16 + 72) = a5;
  *(void *)(v16 + 80) = a6;
  *(void *)(v16 + 88) = MEMORY[0x263F8EE78];
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  *(void *)(a7 + v13[5]) = v16;
  *(unsigned char *)(a7 + v13[6]) = a4;
  return result;
}

void StoredTranslationResult.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = sub_260313418();
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686F0);
  uint64_t v25 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28, v8);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for StoredTranslationResult();
  uint64_t v29 = *(int *)(MEMORY[0x270FA5388](v11, v12) + 28);
  uint64_t v30 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v30[v29] = 0;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FF994();
  int v27 = v10;
  sub_2603138D8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v15 = v25;
    uint64_t v14 = v26;
    uint64_t v23 = a1;
    LOBYTE(v32) = 0;
    sub_2602FFDEC(&qword_26A868510, MEMORY[0x263F07690]);
    sub_260313798();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    int v17 = v30;
    v16(v30, v7, v4);
    LOBYTE(v32) = 2;
    v17[*(int *)(v11 + 24)] = sub_260313748() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868700);
    uint64_t v18 = (uint64_t)v17;
    char v31 = 1;
    sub_2602FFB50(&qword_26A868708, &qword_26A868700, (void (*)(void))sub_2602FF9E8);
    sub_260313758();
    uint64_t v19 = v32;
    if (!v32) {
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
    *(void *)&v17[*(int *)(v11 + 20)] = v19;
    char v31 = 3;
    sub_2602FFA3C();
    sub_260313758();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v27, v28);
    uint64_t v20 = v32;
    uint64_t v21 = v29;

    *(void *)(v18 + v21) = v20;
    sub_2602FFA90(v18, v24);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_2602FFAF4(v18);
  }
}

uint64_t StoredTranslationResult.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868720);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2602FF994();
  sub_2603138F8();
  LOBYTE(v20) = 0;
  sub_260313418();
  sub_2602FFDEC(&qword_26A868530, MEMORY[0x263F07690]);
  sub_2603137F8();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for StoredTranslationResult();
    LOBYTE(v20) = 2;
    sub_2603137D8();
    uint64_t v11 = *(void *)(v3 + *(int *)(v10 + 20));
    uint64_t v20 = v11;
    char v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868700);
    sub_2602FFB50(&qword_26A868728, &qword_26A868700, (void (*)(void))sub_2602FFBBC);
    sub_2603137F8();
    uint64_t v12 = *(void *)(v3 + *(int *)(v10 + 28));
    uint64_t v20 = v12;
    char v19 = 3;
    sub_2602FFC10();
    sub_2603137B8();
    if (!v12 && !*(void *)(v11 + 16))
    {
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_260313458();
      __swift_project_value_buffer(v13, (uint64_t)qword_26A86B5E0);
      uint64_t v14 = sub_260313438();
      os_log_type_t v15 = sub_2603135A8();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_2602F2000, v14, v15, "No translated result of any kind to encode", v16, 2u);
        MEMORY[0x26120CEF0](v16, -1, -1);
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_260313728();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  result.value = StoredTranslationResult.CodingKeys.init(rawValue:)(stringValue).value;
  *uint64_t v2 = v4;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 4;
  return (TranslationPersistence::StoredTranslationResult::CodingKeys_optional)intValue;
}

uint64_t StoredTranslationResult.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t StoredTranslationResult.CodingKeys.rawValue.getter()
{
  unint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74616E7265746C61;
      break;
    case 2:
      unint64_t result = 0x6E696C66664F7369;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x656C61636F6CLL;
      break;
  }
  return result;
}

unint64_t StoredTranslationResult.CodingKeys.stringValue.getter()
{
  unint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74616E7265746C61;
      break;
    case 2:
      unint64_t result = 0x6E696C66664F7369;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x656C61636F6CLL;
      break;
  }
  return result;
}

uint64_t sub_2602FF6F0(unsigned __int8 *a1, char *a2)
{
  return sub_2602FB424(*a1, *a2);
}

uint64_t sub_2602FF6FC()
{
  return sub_2602FBD28();
}

uint64_t sub_2602FF704()
{
  return sub_2602FC040();
}

uint64_t sub_2602FF70C()
{
  return sub_2602FC554();
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional sub_2602FF714(Swift::String *a1)
{
  return StoredTranslationResult.CodingKeys.init(rawValue:)(*a1);
}

unint64_t sub_2602FF720@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = StoredTranslationResult.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional sub_2602FF74C@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = StoredTranslationResult.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_2602FF784(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2602FF790(uint64_t a1)
{
  unint64_t v2 = sub_2602FF994();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2602FF7CC(uint64_t a1)
{
  unint64_t v2 = sub_2602FF994();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2602FF808@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_260313418();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_2602FF870(uint64_t a1)
{
  return sub_2602FCC38(*(void *)(v1 + *(int *)(a1 + 20)));
}

uint64_t sub_2602FF87C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 24));
}

void *sub_2602FF888(uint64_t a1)
{
  unint64_t v2 = *(void **)(v1 + *(int *)(a1 + 28));
  id v3 = v2;
  return v2;
}

void sub_2602FF8B4(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_2602FF8CC(void *a1)
{
  return StoredTranslationResult.encode(to:)(a1);
}

unint64_t sub_2602FF8F4()
{
  unint64_t result = qword_26A8686E0;
  if (!qword_26A8686E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686E0);
  }
  return result;
}

uint64_t type metadata accessor for StoredTranslationResult()
{
  uint64_t result = qword_26A868760;
  if (!qword_26A868760) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2602FF994()
{
  unint64_t result = qword_26A8686F8;
  if (!qword_26A8686F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8686F8);
  }
  return result;
}

unint64_t sub_2602FF9E8()
{
  unint64_t result = qword_26A868710;
  if (!qword_26A868710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868710);
  }
  return result;
}

unint64_t sub_2602FFA3C()
{
  unint64_t result = qword_26A868718;
  if (!qword_26A868718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868718);
  }
  return result;
}

uint64_t sub_2602FFA90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoredTranslationResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2602FFAF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoredTranslationResult();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2602FFB50(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2602FFBBC()
{
  unint64_t result = qword_26A868730;
  if (!qword_26A868730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868730);
  }
  return result;
}

unint64_t sub_2602FFC10()
{
  unint64_t result = qword_26A868738;
  if (!qword_26A868738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868738);
  }
  return result;
}

unint64_t sub_2602FFC64(uint64_t a1)
{
  unint64_t result = sub_2602FFBBC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2602FFC90()
{
  unint64_t result = qword_26A868740;
  if (!qword_26A868740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868740);
  }
  return result;
}

unint64_t sub_2602FFCE8()
{
  unint64_t result = qword_26A868748;
  if (!qword_26A868748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868748);
  }
  return result;
}

unint64_t sub_2602FFD40()
{
  unint64_t result = qword_26A868750;
  if (!qword_26A868750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868750);
  }
  return result;
}

uint64_t sub_2602FFD94(uint64_t a1)
{
  uint64_t result = sub_2602FFDEC(&qword_26A868758, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2602FFDEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for StoredTranslationAlternative()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationAlternative(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationAlternative(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationAlternative()
{
  return &type metadata for StoredTranslationAlternative;
}

ValueMetadata *type metadata accessor for StoredDisambiguableResult()
{
  return &type metadata for StoredDisambiguableResult;
}

void *initializeBufferWithCopyOfBuffer for StoredTranslationResult(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_260313418();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v10;
    swift_bridgeObjectRetain();
    id v11 = v10;
  }
  return a1;
}

void destroy for StoredTranslationResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t initializeWithCopy for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v9;
  swift_bridgeObjectRetain();
  id v10 = v9;
  return a1;
}

uint64_t assignWithCopy for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  return a1;
}

uint64_t initializeWithTake for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_260313418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2603004D0);
}

uint64_t sub_2603004D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_260313418();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StoredTranslationResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2603005A4);
}

uint64_t sub_2603005A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_260313418();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_260300660()
{
  uint64_t result = sub_260313418();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredTranslationResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoredTranslationResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260300868);
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

ValueMetadata *type metadata accessor for StoredTranslationResult.CodingKeys()
{
  return &type metadata for StoredTranslationResult.CodingKeys;
}

ValueMetadata *type metadata accessor for PersistenceError()
{
  return &type metadata for PersistenceError;
}

unsigned char *_s22TranslationPersistence16PersistenceErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x260300954);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredDisambiguableResult.CodingKeys()
{
  return &type metadata for StoredDisambiguableResult.CodingKeys;
}

uint64_t destroy for StoredTranslationSense()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredTranslationSense(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredTranslationSense(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for StoredTranslationSense(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationSense(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationSense(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationSense()
{
  return &type metadata for StoredTranslationSense;
}

uint64_t getEnumTagSinglePayload for StoredTranslationAlternative.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoredTranslationAlternative.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260300DE4);
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

ValueMetadata *type metadata accessor for StoredTranslationAlternative.CodingKeys()
{
  return &type metadata for StoredTranslationAlternative.CodingKeys;
}

unint64_t sub_260300E20()
{
  unint64_t result = qword_26A868770;
  if (!qword_26A868770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868770);
  }
  return result;
}

unint64_t sub_260300E74(uint64_t a1)
{
  unint64_t result = sub_2602FDD54();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_260300EA0()
{
  unint64_t result = qword_26A868778;
  if (!qword_26A868778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868778);
  }
  return result;
}

unint64_t sub_260300EF8()
{
  unint64_t result = qword_26A868780;
  if (!qword_26A868780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868780);
  }
  return result;
}

unint64_t sub_260300F50()
{
  unint64_t result = qword_26A868788;
  if (!qword_26A868788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868788);
  }
  return result;
}

unint64_t sub_260300FA8()
{
  unint64_t result = qword_26A868790;
  if (!qword_26A868790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868790);
  }
  return result;
}

unint64_t sub_260301000()
{
  unint64_t result = qword_26A868798;
  if (!qword_26A868798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868798);
  }
  return result;
}

unint64_t sub_260301058()
{
  unint64_t result = qword_26A8687A0;
  if (!qword_26A8687A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8687A0);
  }
  return result;
}

uint64_t sub_2603010AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2603011E4(a1, a2, a3, (void *)*v3, &qword_26A868848, &qword_26A868850);
  *int v3 = result;
  return result;
}

uint64_t sub_2603010DC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2603011E4(a1, a2, a3, (void *)*v3, &qword_26A8687B0, &qword_26A8687B8);
  *int v3 = result;
  return result;
}

unint64_t sub_26030110C()
{
  unint64_t result = qword_26A8687A8;
  if (!qword_26A8687A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8687A8);
  }
  return result;
}

uint64_t sub_260301160(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2603011E4(a1, a2, a3, (void *)*v3, &qword_26A868818, &qword_26A868820);
  *int v3 = result;
  return result;
}

uint64_t sub_260301190(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2603011E4(a1, a2, a3, (void *)*v3, &qword_26A868800, &qword_26A868808);
  *int v3 = result;
  return result;
}

uint64_t sub_2603011C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_26030138C(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2603011E4(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_260313718();
  __break(1u);
  return result;
}

uint64_t sub_26030138C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687F0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_260313718();
  __break(1u);
  return result;
}

uint64_t sub_2603014F8()
{
  return sub_260301514();
}

uint64_t sub_260301514()
{
  return sub_2603138B8();
}

uint64_t sub_260301564()
{
  return sub_2603134C8();
}

uint64_t sub_260301578()
{
  return sub_2603134C8();
}

uint64_t sub_260301594()
{
  return sub_2603015B0();
}

uint64_t sub_2603015B0()
{
  return sub_2603138B8();
}

uint64_t sub_2603015FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_260301B84();
  sub_2603138D8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v42 = 0;
  uint64_t v11 = sub_260313768();
  uint64_t v13 = v12;
  char v41 = 1;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_260313768();
  uint64_t v35 = v15;
  uint64_t v30 = v14;
  uint64_t v31 = v11;
  char v40 = 2;
  swift_bridgeObjectRetain();
  uint64_t v34 = 0;
  uint64_t v29 = sub_260313768();
  char v39 = 3;
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_260313768();
  uint64_t v33 = v17;
  uint64_t v28 = v18;
  uint64_t v20 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687D0);
  char v38 = 4;
  sub_260301BD8(&qword_26A8687D8, &qword_26A8687D0);
  swift_bridgeObjectRetain();
  sub_260313758();
  uint64_t v32 = v20;
  if (v36) {
    uint64_t v21 = v36;
  }
  else {
    uint64_t v21 = MEMORY[0x263F8EE78];
  }
  char v37 = 5;
  swift_bridgeObjectRetain();
  char v22 = sub_260313748();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v23 = v32;
  swift_bridgeObjectRelease();
  uint64_t v24 = v21;
  uint64_t v25 = v33;
  swift_bridgeObjectRelease();
  uint64_t v26 = v35;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v31;
  *(void *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = v30;
  *(void *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v29;
  *(void *)(a2 + 40) = v25;
  *(void *)(a2 + 48) = v28;
  *(void *)(a2 + 56) = v23;
  *(void *)(a2 + 64) = v24;
  *(unsigned char *)(a2 + 72) = v22 & 1;
  return result;
}

uint64_t sub_260301AEC()
{
  unint64_t v0 = sub_260313728();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_260301B38()
{
  unint64_t v0 = sub_260313728();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_260301B84()
{
  unint64_t result = qword_26A8687C8;
  if (!qword_26A8687C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8687C8);
  }
  return result;
}

uint64_t sub_260301BD8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_260301C38()
{
  return 0x746C75736572;
}

unint64_t sub_260301C4C()
{
  unint64_t result = qword_26A8687F8;
  if (!qword_26A8687F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8687F8);
  }
  return result;
}

uint64_t sub_260301CA0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

unint64_t sub_260301CF0()
{
  unint64_t result = qword_26A868810;
  if (!qword_26A868810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868810);
  }
  return result;
}

uint64_t sub_260301D44()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 89, 7);
}

uint64_t getEnumTagSinglePayload for StoredTranslationSense.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoredTranslationSense.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x260301EF8);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationSense.CodingKeys()
{
  return &type metadata for StoredTranslationSense.CodingKeys;
}

unint64_t sub_260301F34()
{
  unint64_t result = qword_26A868828;
  if (!qword_26A868828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868828);
  }
  return result;
}

unint64_t sub_260301F8C()
{
  unint64_t result = qword_26A868830;
  if (!qword_26A868830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868830);
  }
  return result;
}

unint64_t sub_260301FE4()
{
  unint64_t result = qword_26A868838;
  if (!qword_26A868838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868838);
  }
  return result;
}

unint64_t sub_260302038()
{
  unint64_t result = qword_26A868840;
  if (!qword_26A868840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868840);
  }
  return result;
}

id AnyTranslationResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AnyTranslationResult.init(from:)(a1);
}

id AnyTranslationResult.init(from:)(void *a1)
{
  unsigned int v4 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  id v5 = v1;
  id v6 = v4;
  sub_2603138C8();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for AnyTranslationResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm(v12, v12[3]);
    uint64_t v10 = type metadata accessor for StoredTranslationResult();
    uint64_t v11 = sub_260302EF4(&qword_26A868858, 255, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
    sub_260302EF4(&qword_26A868860, 255, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
    sub_260313838();
    sub_2602F5330(&v9, (uint64_t)v5 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for AnyTranslationResult();
    id v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t type metadata accessor for AnyTranslationResult()
{
  return self;
}

uint64_t sub_2603022C8(void *a1)
{
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2603138E8();
  sub_2602F5268(v1 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value, (uint64_t)v3);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  sub_260302388();
  sub_260313848();
  sub_2602F581C((uint64_t)v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

unint64_t sub_260302388()
{
  unint64_t result = qword_26A868870;
  if (!qword_26A868870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868870);
  }
  return result;
}

id AnyTranslationResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AnyTranslationResult.init()()
{
}

id AnyTranslationResult.__deallocating_deinit()
{
  return sub_260302E84(type metadata accessor for AnyTranslationResult);
}

id sub_2603024AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for AnyTranslationResult());
  id result = AnyTranslationResult.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_260302500(void *a1)
{
  return sub_2603022C8(a1);
}

uint64_t method lookup function for AnyTranslationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnyTranslationResult);
}

uint64_t dispatch thunk of AnyTranslationResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of AnyTranslationResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t sub_2603025AC()
{
  uint64_t result = sub_260313498();
  qword_26A86B600 = result;
  return result;
}

double sub_260302618@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2602F6780(a1, (uint64_t)v9);
  if (v9[3])
  {
    type metadata accessor for AnyTranslationResult();
    if (swift_dynamicCast())
    {
      sub_260313248();
      swift_allocObject();
      sub_260313238();
      v9[0] = v8;
      sub_260302EF4(&qword_26A868880, v3, (void (*)(uint64_t))type metadata accessor for AnyTranslationResult);
      uint64_t v4 = sub_260313228();
      uint64_t v6 = v5;
      *(void *)(a2 + 24) = MEMORY[0x263F06F78];

      swift_release();
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = v6;
      return result;
    }
  }
  else
  {
    sub_2602F6698((uint64_t)v9);
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_2603029B0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2602F6780(a1, (uint64_t)v7);
  if (v7[3])
  {
    if (swift_dynamicCast())
    {
      sub_260313218();
      swift_allocObject();
      sub_260313208();
      *(void *)(a2 + 24) = type metadata accessor for AnyTranslationResult();
      sub_260302EF4(&qword_26A868878, v3, (void (*)(uint64_t))type metadata accessor for AnyTranslationResult);
      sub_2603131F8();
      swift_release();
      sub_2602F683C(v5, v6);
      return result;
    }
  }
  else
  {
    sub_2602F6698((uint64_t)v7);
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

id sub_260302CAC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *__return_ptr, _OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_260313658();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    id v7 = a1;
  }
  a4(v16, v15);

  sub_2602F6698((uint64_t)v15);
  uint64_t v8 = v17;
  if (v17)
  {
    long long v9 = __swift_project_boxed_opaque_existential_1Tm(v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v9, v9);
    uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = (void *)sub_260313818();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id sub_260302E6C()
{
  return sub_260302E84(type metadata accessor for TargetResultValueTransformer);
}

id sub_260302E84(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for TargetResultValueTransformer()
{
  return self;
}

ValueMetadata *type metadata accessor for AnyTranslationResult.AnyTranslationResultBox()
{
  return &type metadata for AnyTranslationResult.AnyTranslationResultBox;
}

uint64_t sub_260302EF4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_260302F3C()
{
  return sub_260302F54((SEL *)&selRef_sourceIdentifier);
}

uint64_t sub_260302F48()
{
  return sub_260302F54((SEL *)&selRef_targetIdentifier);
}

uint64_t sub_260302F54(SEL *a1)
{
  id v2 = [v1 *a1];
  sub_2603134A8();

  return sub_260313378();
}

uint64_t sub_260302FC0()
{
  id v1 = v0;
  uint64_t v2 = sub_260313338();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v1, sel_favoriteDate);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_260313318();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v6, v2);
    uint64_t v13 = 1;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v10, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) != 1) {
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, 1, 1, v2);
  }
  uint64_t v13 = 0;
LABEL_6:
  sub_260307704((uint64_t)v10, &qword_26A868888);
  return v13;
}

uint64_t sub_260303188()
{
  sub_260303CF4(v11);
  uint64_t v0 = v12;
  uint64_t v1 = v13;
  __swift_project_boxed_opaque_existential_1Tm(v11, v12);
  uint64_t v2 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if (v2)
  {
    sub_2603036EC(v11);
    uint64_t v4 = v12;
    uint64_t v3 = v13;
    __swift_project_boxed_opaque_existential_1Tm(v11, v12);
    (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 16) + 16) + 8))(v4);
    if (!v5)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      id v9 = objc_msgSend(v2, sel_sourceText);
      uint64_t v8 = sub_2603134A8();

      return v8;
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  sub_2603036EC(v11);
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  __swift_project_boxed_opaque_existential_1Tm(v11, v12);
  uint64_t v8 = AnnotatedResult.displayString.getter(v6, *(void *)(v7 + 16));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v8;
}

uint64_t sub_2603032D8()
{
  id v1 = objc_msgSend(v0, sel_targetResult);

  if (v1)
  {
    sub_260303CF4(v14);
    uint64_t v2 = v15;
    uint64_t v3 = v16;
    __swift_project_boxed_opaque_existential_1Tm(v14, v15);
    unint64_t v4 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) + 16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    if (v4 >= 2)
    {
      sub_260303CF4(v14);
      uint64_t v5 = v15;
      uint64_t v6 = v16;
      __swift_project_boxed_opaque_existential_1Tm(v14, v15);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
      if (!*(void *)(result + 16))
      {
        __break(1u);
        return result;
      }
      sub_2602F5268(result + 32, (uint64_t)v11);
      swift_bridgeObjectRelease();
      uint64_t v8 = v12;
      uint64_t v9 = v13;
      __swift_project_boxed_opaque_existential_1Tm(v11, v12);
      uint64_t v10 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9) + 16);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      if (v10) {
        return PersistedTranslation.selectedAlternativeIndex.getter();
      }
    }
  }
  return 0;
}

unint64_t sub_26030343C()
{
  id v1 = v0;
  id v2 = sub_2603045C8();
  unsigned int v3 = objc_msgSend(v2, sel_isPassthrough);

  if (v3) {
    return sub_260303188();
  }
  sub_260303CF4(v26);
  uint64_t v5 = v27;
  uint64_t v6 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  if (v7)
  {
    sub_2603036EC(v26);
    uint64_t v9 = v27;
    uint64_t v8 = v28;
    __swift_project_boxed_opaque_existential_1Tm(v26, v27);
    (*(void (**)(uint64_t))(*(void *)(*(void *)(v8 + 16) + 16) + 8))(v9);
    if (!v10)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      id v22 = objc_msgSend(v7, sel_targetText);
      uint64_t v4 = sub_2603134A8();

      return v4;
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  id v11 = objc_msgSend(v1, sel_targetResult);

  if (!v11) {
    return 0;
  }
  uint64_t v12 = sub_2603032D8();
  sub_260303CF4(v26);
  uint64_t v13 = v27;
  uint64_t v14 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  uint64_t v15 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14) + 16);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  if (v12 >= v15) {
    return 0;
  }
  sub_260303CF4(v26);
  uint64_t v16 = v27;
  uint64_t v17 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  unint64_t result = sub_2603032D8();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)(v18 + 16))
  {
    sub_2602F5268(v18 + 40 * result + 32, (uint64_t)v23);
    swift_bridgeObjectRelease();
    uint64_t v20 = v24;
    uint64_t v21 = v25;
    __swift_project_boxed_opaque_existential_1Tm(v23, v24);
    uint64_t v4 = TranslationAlternative.displayString.getter(v20, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2603036D4(uint64_t a1)
{
  return sub_260303C08(a1, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_260306B34);
}

void sub_2603036EC(uint64_t *a1@<X8>)
{
  id v2 = v1;
  uint64_t v4 = sub_260313458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(v2, sel_sourceInput);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
    swift_beginAccess();
    sub_2602F5268(v11, (uint64_t)a1);
  }
  else
  {
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_26A86B5E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
    id v13 = v2;
    uint64_t v14 = sub_260313438();
    os_log_type_t v15 = sub_2603135A8();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v30[0] = v29;
      *(_DWORD *)uint64_t v17 = 136446210;
      unsigned int v18 = objc_msgSend(v13, sel_isFault);
      BOOL v19 = v18 == 0;
      if (v18) {
        uint64_t v20 = 7562585;
      }
      else {
        uint64_t v20 = 28494;
      }
      HIDWORD(v28) = v16;
      if (v19) {
        unint64_t v21 = 0xE200000000000000;
      }
      else {
        unint64_t v21 = 0xE300000000000000;
      }
      v30[3] = sub_2603058A4(v20, v21, v30);
      sub_260313628();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2602F2000, v14, BYTE4(v28), "Attempted to get speech result but it doesn't exist, returning a blank StoredSpeechResult. Is the Translation a fault? %{public}s", v17, 0xCu);
      uint64_t v22 = v29;
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v22, -1, -1);
      MEMORY[0x26120CEF0](v17, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v23 = (int *)type metadata accessor for StoredSpeechResult();
    a1[3] = (uint64_t)v23;
    a1[4] = sub_260306F24(&qword_26A8684A8, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    sub_260313378();
    uint64_t v25 = v23[8];
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v23[11]) = 0;
    uint64_t v26 = (uint64_t *)((char *)boxed_opaque_existential_1 + v25);
    *(unsigned char *)boxed_opaque_existential_1 = 1;
    boxed_opaque_existential_1[1] = 1000;
    *((unsigned char *)boxed_opaque_existential_1 + v23[7]) = 0;
    uint64_t v27 = (uint64_t *)((char *)boxed_opaque_existential_1 + v23[9]);
    *uint64_t v27 = 0;
    v27[1] = 0xE000000000000000;
    void *v26 = 0;
    v26[1] = 0;
    *((unsigned char *)boxed_opaque_existential_1 + v23[10]) = 0;
  }
}

void (*sub_260303A78(uint64_t **a1))(uint64_t *a1, char a2)
{
  unsigned int v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  sub_2603036EC(v3);
  return sub_260303AD8;
}

void sub_260303AD8(uint64_t *a1, char a2)
{
}

uint64_t sub_260303AF0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(unsigned char *, uint64_t, uint64_t, uint64_t))
{
  sub_2602F5268(a1, (uint64_t)v16);
  uint64_t v7 = *a2;
  uint64_t v8 = v17;
  uint64_t v9 = v18;
  uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x270FA5388](v10, v10);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *))(v13 + 16))(v12);
  a5(v12, v7, v8, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

uint64_t sub_260303BF0(uint64_t a1)
{
  return sub_260303C08(a1, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_260306D2C);
}

uint64_t sub_260303C08(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  MEMORY[0x270FA5388](v7, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  a2(v9, v2, v5, v6);
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

void sub_260303CF4(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_260313418();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_260313458();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(v2, sel_targetResult);
  if (v14)
  {
    id v38 = v14;
    sub_2602F5268((uint64_t)v14 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value, (uint64_t)a1);
    os_log_type_t v15 = v38;
  }
  else
  {
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v9, (uint64_t)qword_26A86B5E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v16, v9);
    id v17 = v2;
    uint64_t v18 = sub_260313438();
    os_log_type_t v19 = sub_2603135A8();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      char v37 = a1;
      uint64_t v21 = swift_slowAlloc();
      int v35 = v20;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v40 = v36;
      id v38 = (id)v4;
      *(_DWORD *)uint64_t v22 = 136446210;
      unsigned int v23 = objc_msgSend(v17, sel_isFault);
      BOOL v24 = v23 == 0;
      if (v23) {
        uint64_t v25 = 7562585;
      }
      else {
        uint64_t v25 = 28494;
      }
      if (v24) {
        unint64_t v26 = 0xE200000000000000;
      }
      else {
        unint64_t v26 = 0xE300000000000000;
      }
      os_log_t v34 = v18;
      uint64_t v39 = sub_2603058A4(v25, v26, &v40);
      uint64_t v4 = (uint64_t)v38;
      sub_260313628();

      a1 = v37;
      swift_bridgeObjectRelease();
      os_log_t v27 = v34;
      uint64_t v28 = v22;
      _os_log_impl(&dword_2602F2000, v34, (os_log_type_t)v35, "Attempted to get translation result but it doesn't exist, returning a blank StoredTranslationResult. Is the Translation a fault? %{public}s", v22, 0xCu);
      uint64_t v29 = v36;
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v29, -1, -1);
      MEMORY[0x26120CEF0](v28, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    sub_260313378();
    uint64_t v30 = (int *)type metadata accessor for StoredTranslationResult();
    a1[3] = (uint64_t)v30;
    a1[4] = sub_260306F24(&qword_26A868858, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v30[7]) = 0;
    (*(void (**)(void))(v5 + 16))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686E8);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_260314C10;
    *(unsigned char *)(v32 + 32) = 0;
    *(void *)(v32 + 40) = 0;
    *(void *)(v32 + 48) = 0xE000000000000000;
    *(_OWORD *)(v32 + 56) = 0u;
    *(_OWORD *)(v32 + 72) = 0u;
    *(void *)(v32 + 88) = MEMORY[0x263F8EE78];
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v30[5]) = v32;
    *((unsigned char *)boxed_opaque_existential_1 + v30[6]) = 1;
  }
}

void (*sub_260304188(uint64_t **a1))(uint64_t *a1, char a2)
{
  unsigned int v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  sub_260303CF4(v3);
  return sub_2603041E8;
}

void sub_2603041E8(uint64_t *a1, char a2)
{
}

void sub_260304200(uint64_t *a1, char a2, void (*a3)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = (void *)*a1;
  if (a2)
  {
    uint64_t v5 = v4[10];
    sub_2602F5268(*a1, (uint64_t)(v4 + 5));
    uint64_t v6 = v4[8];
    uint64_t v7 = v4[9];
    uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v4 + 5), v6);
    MEMORY[0x270FA5388](v8, v8);
    uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v10);
    a3(v10, v5, v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v4 + 5));
  }
  else
  {
    uint64_t v12 = v4[10];
    uint64_t v13 = v4[3];
    uint64_t v14 = v4[4];
    uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(*a1, v13);
    MEMORY[0x270FA5388](v15, v15);
    id v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v17);
    a3(v17, v12, v13, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  free(v4);
}

uint64_t sub_2603043F0()
{
  sub_260303CF4(v4);
  uint64_t v0 = v5;
  uint64_t v1 = v6;
  __swift_project_boxed_opaque_existential_1Tm(v4, v5);
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2;
}

uint64_t sub_260304464()
{
  id v1 = objc_msgSend(v0, sel_targetResult);

  if (!v1) {
    return 0;
  }
  sub_260303CF4(v15);
  uint64_t v2 = v16;
  uint64_t v3 = v17;
  __swift_project_boxed_opaque_existential_1Tm(v15, v16);
  unint64_t v4 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) + 16);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (v4 < 2) {
    return 0;
  }
  sub_260303CF4(v15);
  uint64_t v5 = v16;
  uint64_t v6 = v17;
  __swift_project_boxed_opaque_existential_1Tm(v15, v16);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  if (*(void *)(result + 16))
  {
    sub_2602F5268(result + 32, (uint64_t)v12);
    swift_bridgeObjectRelease();
    uint64_t v8 = v13;
    uint64_t v9 = v14;
    __swift_project_boxed_opaque_existential_1Tm(v12, v13);
    uint64_t v10 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9) + 16);
    swift_bridgeObjectRelease();
    BOOL v11 = v10 != 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    return v11;
  }
  __break(1u);
  return result;
}

id sub_2603045C8()
{
  uint64_t v1 = sub_260313418();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v1, v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v7);
  uint64_t v9 = (char *)&v18 - v8;
  id v10 = objc_msgSend(v0, sel_sourceIdentifier);
  sub_2603134A8();

  sub_260313378();
  id v11 = objc_msgSend(v0, sel_targetIdentifier);
  sub_2603134A8();

  sub_260313378();
  id v12 = objc_allocWithZone(MEMORY[0x263F1C0F8]);
  uint64_t v13 = (void *)sub_2603133C8();
  uint64_t v14 = (void *)sub_2603133C8();
  id v15 = objc_msgSend(v12, sel_initWithSourceLocale_targetLocale_, v13, v14);

  uint64_t v16 = *(void (**)(char *, uint64_t))(v2 + 8);
  v16(v6, v1);
  v16(v9, v1);
  return v15;
}

void sub_26030478C()
{
  uint64_t v1 = sub_2603133F8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v1, v3);
  *(void *)&long long v114 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v106 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688B8);
  uint64_t v11 = MEMORY[0x270FA5388](v9 - 8, v10);
  v115 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  id v15 = (char *)&v106 - v14;
  uint64_t v122 = sub_260313418();
  uint64_t v16 = *(void *)(v122 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v122, v17);
  v108 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18, v20);
  v107 = (char *)&v106 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21, v23);
  v110 = (char *)&v106 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24, v26);
  v109 = (char *)&v106 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27, v29);
  v113 = (char *)&v106 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30, v32);
  v121 = (char *)&v106 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33, v35);
  id v38 = (char *)&v106 - v37;
  MEMORY[0x270FA5388](v36, v39);
  char v41 = (char *)&v106 - v40;
  sub_2603133D8();
  id v120 = v0;
  id v42 = objc_msgSend(v0, sel_sourceIdentifier);
  sub_2603134A8();

  sub_260313378();
  sub_260313408();
  sub_2603133E8();
  v43 = *(void (**)(uint64_t, unint64_t))(v2 + 8);
  uint64_t v116 = v2 + 8;
  unint64_t v117 = v1;
  v112 = v43;
  v43((uint64_t)v8, v1);
  uint64_t v44 = sub_2603133A8();
  uint64_t v45 = *(void *)(v44 - 8);
  v111 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
  if (v111(v15, 1, v44) == 1)
  {
    sub_260307704((uint64_t)v15, &qword_26A8688B8);
  }
  else
  {
    sub_260313398();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v44);
  }
  v46 = *(void (**)(char *, uint64_t))(v16 + 8);
  v47 = v38;
  uint64_t v48 = v122;
  v46(v47, v122);
  uint64_t v49 = v48;
  uint64_t v50 = sub_2603133B8();
  unint64_t v52 = v51;
  swift_bridgeObjectRelease();
  v119 = v46;
  v46(v41, v49);
  if (v52) {
    uint64_t v53 = v50;
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v118 = v53;
  if (v52) {
    unint64_t v54 = v52;
  }
  else {
    unint64_t v54 = 0xE000000000000000;
  }
  sub_2603133D8();
  id v55 = v120;
  id v56 = objc_msgSend(v120, sel_targetIdentifier);
  sub_2603134A8();

  v57 = v113;
  sub_260313378();
  uint64_t v58 = v114;
  sub_260313408();
  uint64_t v59 = (uint64_t)v115;
  sub_2603133E8();
  v112(v58, v117);
  if (v111((char *)v59, 1, v44) == 1)
  {
    sub_260307704(v59, &qword_26A8688B8);
  }
  else
  {
    sub_260313398();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v59, v44);
  }
  v60 = v57;
  uint64_t v61 = v122;
  v62 = v119;
  v119(v60, v122);
  v63 = v121;
  uint64_t v64 = sub_2603133B8();
  unint64_t v66 = v65;
  swift_bridgeObjectRelease();
  v62(v63, v61);
  if (v66) {
    uint64_t v67 = v64;
  }
  else {
    uint64_t v67 = 0;
  }
  if (v66) {
    unint64_t v68 = v66;
  }
  else {
    unint64_t v68 = 0xE000000000000000;
  }
  id v69 = sub_2603045C8();
  unsigned int v70 = objc_msgSend(v69, sel_isPassthrough);

  if (v70)
  {
    swift_bridgeObjectRelease();
    v71 = (void *)sub_260313498();
    swift_bridgeObjectRelease();
    objc_msgSend(v55, sel_setDisplayLocalePairText_, v71);

    return;
  }
  v115 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A8687F0);
  uint64_t v72 = swift_allocObject();
  long long v114 = xmmword_260315590;
  *(_OWORD *)(v72 + 16) = xmmword_260315590;
  *(void *)(v72 + 32) = v118;
  *(void *)(v72 + 40) = v54;
  uint64_t v116 = v67;
  *(void *)(v72 + 48) = v67;
  *(void *)(v72 + 56) = v68;
  v129 = (void *)v72;
  v121 = (char *)v54;
  swift_bridgeObjectRetain();
  unint64_t v117 = v68;
  swift_bridgeObjectRetain();
  v73 = v109;
  sub_2603133D8();
  uint64_t v127 = sub_260313388();
  uint64_t v128 = v74;
  uint64_t v125 = 45;
  unint64_t v126 = 0xE100000000000000;
  uint64_t v123 = 95;
  unint64_t v124 = 0xE100000000000000;
  sub_2603076B0();
  v75 = v55;
  uint64_t v76 = sub_260313648();
  uint64_t v78 = v77;
  swift_bridgeObjectRelease();
  v62(v73, v61);
  id v79 = objc_msgSend(v75, sel_sourceIdentifier);
  sub_2603134A8();

  v80 = v110;
  sub_260313378();
  uint64_t v127 = sub_260313388();
  uint64_t v128 = v81;
  uint64_t v125 = 45;
  unint64_t v126 = 0xE100000000000000;
  uint64_t v123 = 95;
  unint64_t v124 = 0xE100000000000000;
  uint64_t v82 = sub_260313648();
  uint64_t v84 = v83;
  uint64_t v85 = v122;
  swift_bridgeObjectRelease();
  v62(v80, v85);
  if (v76 == v82 && v78 == v84)
  {
    swift_bridgeObjectRelease_n();
LABEL_25:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  char v86 = sub_260313828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v86) {
    goto LABEL_25;
  }
  v87 = v107;
  sub_2603133D8();
  uint64_t v127 = sub_260313388();
  uint64_t v128 = v88;
  uint64_t v125 = 45;
  unint64_t v126 = 0xE100000000000000;
  uint64_t v123 = 95;
  unint64_t v124 = 0xE100000000000000;
  v113 = (char *)sub_260313648();
  uint64_t v90 = v89;
  swift_bridgeObjectRelease();
  v91 = v119;
  v119(v87, v85);
  id v92 = objc_msgSend(v120, sel_targetIdentifier);
  sub_2603134A8();

  v93 = v108;
  sub_260313378();
  uint64_t v127 = sub_260313388();
  uint64_t v128 = v94;
  uint64_t v125 = 45;
  unint64_t v126 = 0xE100000000000000;
  uint64_t v123 = 95;
  unint64_t v124 = 0xE100000000000000;
  uint64_t v95 = sub_260313648();
  uint64_t v97 = v96;
  swift_bridgeObjectRelease();
  v91(v93, v85);
  if (v113 == (char *)v95 && v90 == v97)
  {
    swift_bridgeObjectRelease_n();
    v98 = v121;
    uint64_t v99 = v116;
LABEL_30:
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = v114;
    unint64_t v102 = v117;
    *(void *)(v101 + 32) = v99;
    *(void *)(v101 + 40) = v102;
    *(void *)(v101 + 48) = v118;
    *(void *)(v101 + 56) = v98;
    swift_bridgeObjectRelease();
    v129 = (void *)v101;
    goto LABEL_32;
  }
  char v100 = sub_260313828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v98 = v121;
  uint64_t v99 = v116;
  if (v100) {
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2603052AC(&v129);
LABEL_32:
  v103 = v129;
  if (v129[2])
  {
    uint64_t v104 = v129[5];
    uint64_t v127 = v129[4];
    uint64_t v128 = v104;
    swift_bridgeObjectRetain_n();
    sub_2603134D8();
    swift_bridgeObjectRelease();
    if (v103[2] >= 2uLL)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2603134D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v105 = (void *)sub_260313498();
      swift_bridgeObjectRelease();
      objc_msgSend(v120, sel_setDisplayLocalePairText_, v105);
      swift_bridgeObjectRelease();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2603052AC(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260306B20(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_260305EFC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2603053E0()
{
  sub_260303CF4(v4);
  uint64_t v0 = v5;
  uint64_t v1 = v6;
  __swift_project_boxed_opaque_existential_1Tm(v4, v5);
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2;
}

BOOL sub_260305454()
{
  sub_2603036EC(v5);
  uint64_t v0 = v6;
  uint64_t v1 = v7;
  __swift_project_boxed_opaque_existential_1Tm(v5, v6);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 16) + 16) + 8))(v0);
  uint64_t v3 = v2;
  if (v2) {
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3 == 0;
}

uint64_t sub_2603054D8(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868898);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260306F6C(a1, (uint64_t)v7);
  uint64_t v8 = *a2 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  sub_260306FD4((uint64_t)v7, v8);
  return swift_endAccess();
}

uint64_t sub_260305598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  return sub_260306F6C(v3, a1);
}

uint64_t sub_2603055EC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  sub_260306FD4(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_260305648())()
{
  return j__swift_endAccess;
}

id PersistedTranslation.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PersistedTranslation.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PersistedTranslation();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PersistedTranslation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistedTranslation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2603058A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_260305978(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_260307760((uint64_t)v12, *a3);
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
      sub_260307760((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_260305978(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_260313638();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_260305B34(a5, a6);
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
  uint64_t v8 = sub_260313688();
  if (!v8)
  {
    sub_2603136E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_260313718();
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

uint64_t sub_260305B34(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_260305BCC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260305DAC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_260305DAC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_260305BCC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_260305D44(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_260313668();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2603136E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2603134E8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_260313718();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2603136E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_260305D44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  uint64_t v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_260305DAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688D0);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_260313718();
  __break(1u);
  return result;
}

uint64_t sub_260305EFC(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_260313808();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_2603065E8(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  uint64_t v105 = result;
  unint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      size_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_2603066B8((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_260306B0C((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          char v100 = &v97[16 * v96 + 32];
          *(void *)char v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_260313548();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  size_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (*v17 == v15 && v17[1] == v16)
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_260313828();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*v23 == *(v21 - 1) && v23[1] == *v21)
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_260313828()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v11 = sub_260306954(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      size_t v11 = sub_260306954((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    id v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(void *)v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            id v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        unint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        char v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_2603066B8((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)char v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        size_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        id v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        id v38 = v33;
        do
        {
          BOOL v39 = *(v38 - 2) == v35 && *(v38 - 1) == v36;
          if (v39 || (sub_260313828() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)id v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_2603136E8();
  __break(1u);
  return result;
}

uint64_t sub_2603065E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    uint64_t v12 = v6;
    uint64_t v13 = (void *)v8;
    while (1)
    {
      uint64_t result = *(v13 - 2);
      BOOL v14 = result == v10 && *(v13 - 1) == v11;
      if (v14 || (uint64_t result = sub_260313828(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v10 = *v13;
      uint64_t v11 = v13[1];
      *(_OWORD *)uint64_t v13 = *((_OWORD *)v13 - 1);
      *(v13 - 1) = v11;
      *(v13 - 2) = v10;
      v13 -= 2;
      if (v4 == ++v12) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2603066B8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
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
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = v21 == *((void *)v17 - 2) && v22 == *((void *)v17 - 1);
          if (v23 || (sub_260313828() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    BOOL v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v4 == *(void *)v6 && *((void *)v4 + 1) == *((void *)v6 + 1);
        if (v15 || (sub_260313828() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_260306A50((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_260313718();
  __break(1u);
  return result;
}

char *sub_260306954(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

char *sub_260306A50(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_260313718();
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

char *sub_260306B0C(uint64_t a1)
{
  return sub_260306954(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_260306B20(void *a1)
{
  return sub_260307F58(0, a1[2], 0, a1);
}

uint64_t sub_260306B34(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_260313418();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = a3;
  v21[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  (*(void (**)(uint64_t))(*(void *)(a4 + 16) + 24))(a3);
  sub_260313388();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  BOOL v14 = (void *)sub_260313498();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setSourceIdentifier_, v14);

  sub_2602F5268((uint64_t)v21, (uint64_t)v20);
  BOOL v15 = (objc_class *)type metadata accessor for AnySpeechResult();
  id v16 = objc_allocWithZone(v15);
  sub_2602F5268((uint64_t)v20, (uint64_t)v16 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);
  v19.receiver = v16;
  v19.super_class = v15;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  objc_msgSend(a2, sel_setSourceInput_, v17);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_260306D2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_260313418();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = a3;
  v21[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  sub_260313388();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  BOOL v14 = (void *)sub_260313498();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTargetIdentifier_, v14);

  sub_2602F5268((uint64_t)v21, (uint64_t)v20);
  BOOL v15 = (objc_class *)type metadata accessor for AnyTranslationResult();
  id v16 = objc_allocWithZone(v15);
  sub_2602F5268((uint64_t)v20, (uint64_t)v16 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);
  v19.receiver = v16;
  v19.super_class = v15;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  objc_msgSend(a2, sel_setTargetResult_, v17);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_260306F24(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260306F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260306FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PersistedTranslation()
{
  uint64_t result = qword_26A8688A0;
  if (!qword_26A8688A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_260307088(uint64_t *a1@<X8>)
{
}

uint64_t sub_2603070AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_260303AF0(a1, a2, a3, a4, (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))sub_260306B34);
}

void sub_2603070D8(uint64_t *a1@<X8>)
{
}

uint64_t sub_2603070FC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_260303AF0(a1, a2, a3, a4, (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))sub_260306D2C);
}

char *keypath_get_selector_ttsPlaybackRateDouble()
{
  return sel_ttsPlaybackRateDouble;
}

id sub_260307134@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_ttsPlaybackRateDouble);
  *a2 = v4;
  return result;
}

id sub_260307168(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTtsPlaybackRateDouble_, *a1);
}

uint64_t sub_26030717C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  return sub_260306F6C(v3, a2);
}

uint64_t sub_2603071D8()
{
  return type metadata accessor for PersistedTranslation();
}

void sub_2603071E0()
{
  sub_260307658();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PersistedTranslation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PersistedTranslation);
}

uint64_t dispatch thunk of PersistedTranslation.sourceLocale.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PersistedTranslation.targetLocale.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PersistedTranslation.isFavorite.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PersistedTranslation.displaySourceText.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PersistedTranslation.displayText.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PersistedTranslation.alternatives.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PersistedTranslation.hasAlternatives.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PersistedTranslation.disambiguableResult.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PersistedTranslation.showDisambiguation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

void sub_260307658()
{
  if (!qword_26A8688B0)
  {
    sub_260313368();
    unint64_t v0 = sub_260313618();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A8688B0);
    }
  }
}

unint64_t sub_2603076B0()
{
  unint64_t result = qword_26A8688C0;
  if (!qword_26A8688C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8688C0);
  }
  return result;
}

uint64_t sub_260307704(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_260307760(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t PersistedTranslation.selectedAlternativeIndex.getter()
{
  uint64_t v1 = (void *)sub_260313498();
  objc_msgSend(v0, sel_willAccessValueForKey_, v1);

  uint64_t v2 = (void *)sub_260313498();
  id v3 = objc_msgSend(v0, sel_primitiveValueForKey_, v2);

  if (v3)
  {
    sub_260313658();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_260307900((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_2602F6698((uint64_t)v9);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = v7;
LABEL_9:
  uint64_t v5 = (void *)sub_260313498();
  objc_msgSend(v0, sel_didAccessValueForKey_, v5);

  return v4;
}

uint64_t sub_260307900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static PersistedTranslation.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_260313498();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_2603079D8@<X0>(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_260313318();

    uint64_t v6 = sub_260313338();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    uint64_t v8 = v6;
    uint64_t v9 = a3;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = sub_260313338();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v8 = v11;
    uint64_t v9 = a3;
    uint64_t v10 = 1;
  }

  return v7(v9, v10, 1, v8);
}

void sub_260307A9C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2603085D8(a1, (uint64_t)v11);
  uint64_t v12 = *a2;
  uint64_t v13 = sub_260313338();
  uint64_t v14 = *(void *)(v13 - 8);
  BOOL v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1)
  {
    BOOL v15 = (void *)sub_260313308();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
  }
  objc_msgSend(v12, *a5, v15);
}

void PersistedTranslation.selectedAlternativeIndex.setter(uint64_t a1)
{
  id v3 = (void *)sub_260313498();
  objc_msgSend(v1, sel_willChangeValueForKey_, v3);

  id v4 = (void *)sub_260313558();
  uint64_t v5 = (void *)sub_260313498();
  objc_msgSend(v1, sel_setPrimitiveValue_forKey_, v4, v5);

  uint64_t v6 = (void *)sub_260313498();
  objc_msgSend(v1, sel_didChangeValueForKey_, v6);

  id v7 = objc_msgSend(v1, sel_interactedIndices);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)sub_260313528();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_260308068(0, v9[2] + 1, 1, v9);
    }
    unint64_t v11 = v9[2];
    unint64_t v10 = v9[3];
    if (v11 >= v10 >> 1) {
      uint64_t v9 = sub_260308068((void *)(v10 > 1), v11 + 1, 1, v9);
    }
    v9[2] = v11 + 1;
    v9[v11 + 4] = a1;
    id v12 = (id)sub_260313518();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setInteractedIndices_, v12);
  }
  else
  {
    objc_msgSend(v1, sel_setInteractedIndices_, 0);
  }
}

void (*PersistedTranslation.selectedAlternativeIndex.modify(uint64_t *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = PersistedTranslation.selectedAlternativeIndex.getter();
  return sub_260307E08;
}

void sub_260307E08(uint64_t *a1)
{
}

void sub_260307E2C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_interactedIndices);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_260313528();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_260307E94(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1) {
    uint64_t v3 = sub_260313518();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setInteractedIndices_);
}

void sub_260307F04(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  uint64_t v5 = sub_2603134A8();
  uint64_t v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

void *sub_260307F58(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8687F0);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2603084E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_260308068(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688D8);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_260308640(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *keypath_get_selector_creationDate()
{
  return sel_creationDate;
}

uint64_t sub_260308184@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2603079D8(a1, (SEL *)&selRef_creationDate, a2);
}

void sub_2603081A4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_favoriteDate()
{
  return sel_favoriteDate;
}

uint64_t sub_2603081D0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2603079D8(a1, (SEL *)&selRef_favoriteDate, a2);
}

void sub_2603081F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_26030821C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_26030823C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_sessionID()
{
  return sel_sessionID;
}

void sub_260308254(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_260308274(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_requestID()
{
  return sel_requestID;
}

void sub_26030828C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_2603082AC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_sourceInput()
{
  return sel_sourceInput;
}

id sub_2603082C4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_sourceInput);
  *a2 = result;
  return result;
}

id sub_260308300(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSourceInput_, *a1);
}

char *keypath_get_selector_sourceIdentifier()
{
  return sel_sourceIdentifier;
}

void sub_260308320(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_260308340(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_targetIdentifier()
{
  return sel_targetIdentifier;
}

void sub_260308358(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_260308378(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_targetResult()
{
  return sel_targetResult;
}

id sub_260308390@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_targetResult);
  *a2 = result;
  return result;
}

id sub_2603083CC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTargetResult_, *a1);
}

uint64_t sub_2603083E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PersistedTranslation.selectedAlternativeIndex.getter();
  *a1 = result;
  return result;
}

void sub_26030840C(uint64_t *a1)
{
}

char *keypath_get_selector_interactedIndices()
{
  return sel_interactedIndices;
}

char *keypath_get_selector_displayLocalePairText()
{
  return sel_displayLocalePairText;
}

void sub_260308454(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_260308474(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void keypath_set_4Tm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  unint64_t v6 = *a2;
  id v7 = (id)sub_260313498();
  objc_msgSend(v6, *a5, v7);
}

uint64_t sub_2603084E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_260313718();
  __break(1u);
  return result;
}

uint64_t sub_2603085D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_260308640(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    id v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_260313718();
  __break(1u);
  return result;
}

id static PersistedTranslation.favoritedFetchRequest()()
{
  return sub_260308984();
}

id static PersistedTranslation.favoritedSortedByLocalePairAndCreationDateFetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_260313498();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_2602FE590(0, &qword_26A8688E0);
  uint64_t v3 = (void *)sub_260313568();
  objc_msgSend(v2, sel_setPredicate_, v3);

  id v4 = objc_allocWithZone(MEMORY[0x263F08B30]);
  unint64_t v5 = (void *)sub_260313498();
  id v6 = objc_msgSend(v4, sel_initWithKey_ascending_, v5, 1);

  id v7 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v8 = (void *)sub_260313498();
  id v9 = objc_msgSend(v7, sel_initWithKey_ascending_, v8, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2603155F0;
  *(void *)(v10 + 32) = v6;
  *(void *)(v10 + 40) = v9;
  sub_260313538();
  sub_2602FE590(0, &qword_26A8688F0);
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = (void *)sub_260313518();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSortDescriptors_, v13);

  return v2;
}

id static PersistedTranslation.nilSourceOrTargetFetchRequest()()
{
  return sub_260308984();
}

id sub_260308984()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_260313498();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_2602FE590(0, &qword_26A8688E0);
  uint64_t v3 = (void *)sub_260313568();
  objc_msgSend(v2, sel_setPredicate_, v3);

  return v2;
}

id static PersistedTranslation.favoritedSortedByCreationDateFetchRequest(localePair:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v5 = (void *)sub_260313498();
  id v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  sub_2602FE590(0, &qword_26A8688E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688F8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_260314C10;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_260308C6C();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_260313568();
  objc_msgSend(v6, sel_setPredicate_, v8);

  id v9 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v10 = (void *)sub_260313498();
  id v11 = objc_msgSend(v9, sel_initWithKey_ascending_, v10, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_260315600;
  *(void *)(v12 + 32) = v11;
  sub_260313538();
  sub_2602FE590(0, &qword_26A8688F0);
  id v13 = v11;
  uint64_t v14 = (void *)sub_260313518();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setSortDescriptors_, v14);

  return v6;
}

unint64_t sub_260308C6C()
{
  unint64_t result = qword_26A868900;
  if (!qword_26A868900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A868900);
  }
  return result;
}

id static PersistedTranslation.sortedByCreationDateFetchRequest(sessionIDs:)(uint64_t a1)
{
  id v1 = _s22TranslationPersistence09PersistedA0C12fetchRequest10sessionIDsSo07NSFetchE0CyACGSaySSG_tFZ_0(a1);
  id v2 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v3 = (void *)sub_260313498();
  id v4 = objc_msgSend(v2, sel_initWithKey_ascending_, v3, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_260315600;
  *(void *)(v5 + 32) = v4;
  sub_260313538();
  sub_2602FE590(0, &qword_26A8688F0);
  id v6 = v4;
  uint64_t v7 = (void *)sub_260313518();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSortDescriptors_, v7);

  return v1;
}

id _s22TranslationPersistence09PersistedA0C12fetchRequest10sessionIDsSo07NSFetchE0CyACGSaySSG_tFZ_0(uint64_t a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)sub_260313498();
  id v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    sub_2603136B8();
    sub_2602FE590(0, &qword_26A8688E0);
    id v6 = (uint64_t *)(a1 + 40);
    uint64_t v7 = MEMORY[0x263F8D310];
    do
    {
      uint64_t v9 = *(v6 - 1);
      uint64_t v8 = *v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688F8);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_260314C10;
      *(void *)(v10 + 56) = v7;
      *(void *)(v10 + 64) = sub_260308C6C();
      *(void *)(v10 + 32) = v9;
      *(void *)(v10 + 40) = v8;
      swift_bridgeObjectRetain_n();
      sub_260313568();
      swift_bridgeObjectRelease();
      sub_260313698();
      sub_2603136C8();
      sub_2603136D8();
      sub_2603136A8();
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  sub_2602FE590(0, &qword_26A8688E0);
  id v11 = (void *)sub_260313518();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(self, sel_orPredicateWithSubpredicates_, v11);

  objc_msgSend(v4, sel_setPredicate_, v12);
  return v4;
}

id _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v5 = (void *)sub_260313498();
  id v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  sub_2602FE590(0, &qword_26A8688E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688F8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_260314C10;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_260308C6C();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_260313568();
  objc_msgSend(v6, sel_setPredicate_, v8);

  return v6;
}

uint64_t TranslationAlternative.displayString.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 24) + 8))(v6);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, a1);
  if (!v12) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 8))(a1);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
  return v10;
}

uint64_t TranslationResult.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a2 + 24))();
  if (!*(void *)(v2 + 16))
  {
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_2602F5268(v2 + 32, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  uint64_t v3 = *((void *)&v8 + 1);
  if (!*((void *)&v8 + 1))
  {
LABEL_5:
    sub_260309344((uint64_t)&v7);
    char v5 = 0;
    return v5 & 1;
  }
  uint64_t v4 = v9;
  __swift_project_boxed_opaque_existential_1Tm(&v7, *((uint64_t *)&v8 + 1));
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
  return v5 & 1;
}

uint64_t sub_260309344(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of TranslationSense.senseID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationSense.definition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationSense.sourceMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationSense.targetMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TranslationSense.labels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TranslationSense.isPhrasebookMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TranslationAlternative.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationAlternative.sensesMeta.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TranslationAlternative.romanization.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TranslationResult.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationResult.alternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationResult.isOffline.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationResult.isFinal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TranslationResult.disambiguableResult.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

BOOL TranslationStore.hasFavorites.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() > 0;
}

uint64_t dispatch thunk of TranslationStore.hasFavorites.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TranslationStore.totalCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationStore.favoriteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationStore.getAllFavorites()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationStore.toggleFavorite(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of TranslationStore.toggleFavoriteBackground(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TranslationStore.updateDisambiguation(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of TranslationStore.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 72))();
}

uint64_t dispatch thunk of TranslationStore.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of TranslationStore.save()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of TranslationStore.translations(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 112))();
}

uint64_t dispatch thunk of TranslationStore.clear(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t sub_26030961C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_2603011C0(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = (void *)(a1 + 32);
    do
    {
      uint64_t v5 = sub_26030E2A8(v4);
      uint64_t v7 = v6;
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_2603011C0(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v12 + 16) = v9 + 1;
      uint64_t v10 = v12 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_2603096F8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A868950);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = &v45[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v4 = sub_2603132E8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  unint64_t v9 = &v45[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = &v45[-v11 - 8];
  type metadata accessor for TranslationStoreCoreData();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  BOOL v15 = (void *)sub_260313498();
  uint64_t v16 = (void *)sub_260313498();
  id v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_11;
  }
  sub_2603132C8();

  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v18(v3, v9, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_11:
    sub_260307704((uint64_t)v3, (uint64_t *)&unk_26A868950);
    goto LABEL_12;
  }
  v18(v12, v3, v4);
  id v19 = objc_allocWithZone(MEMORY[0x263EFF298]);
  uint64_t v20 = (void *)sub_2603132B8();
  id v21 = objc_msgSend(v19, sel_initWithContentsOfURL_, v20);

  if (v21)
  {
    uint64_t v46 = &type metadata for TranslationPersistenceFeatures;
    unint64_t v47 = sub_2602F4D00();
    char v22 = sub_260313428();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    if (v22)
    {
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_260313458();
      __swift_project_value_buffer(v23, (uint64_t)qword_26A86B5E0);
      uint64_t v24 = sub_260313438();
      os_log_type_t v25 = sub_260313578();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl(&dword_2602F2000, v24, v25, "Persistant container type: CloudKit", v26, 2u);
        MEMORY[0x26120CEF0](v26, -1, -1);
      }

      id v27 = objc_allocWithZone(MEMORY[0x263EFF2C0]);
      id v28 = v21;
      uint64_t v29 = (void *)sub_260313498();
      id v30 = objc_msgSend(v27, sel_initWithName_managedObjectModel_, v29, v28);

      sub_260309D40();
    }
    else
    {
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_260313458();
      __swift_project_value_buffer(v38, (uint64_t)qword_26A86B5E0);
      BOOL v39 = sub_260313438();
      os_log_type_t v40 = sub_260313578();
      if (os_log_type_enabled(v39, v40))
      {
        unint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v41 = 0;
        _os_log_impl(&dword_2602F2000, v39, v40, "Persistant container type: Local", v41, 2u);
        MEMORY[0x26120CEF0](v41, -1, -1);
      }

      id v42 = objc_allocWithZone(MEMORY[0x263EFF2E8]);
      v43 = (void *)sub_260313498();
      id v30 = objc_msgSend(v42, sel_initWithName_managedObjectModel_, v43, v21);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    return v30;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_260313458();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A86B5E0);
  uint64_t v32 = sub_260313438();
  os_log_type_t v33 = sub_260313598();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_2602F2000, v32, v33, "Failed to load core data model from bundle", v34, 2u);
    MEMORY[0x26120CEF0](v34, -1, -1);
  }

  id v35 = objc_allocWithZone(MEMORY[0x263EFF2E8]);
  uint64_t v36 = (void *)sub_260313498();
  id v30 = objc_msgSend(v35, sel_initWithName_, v36);

  return v30;
}

void sub_260309D40()
{
  uint64_t v1 = v0;
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_260313458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A86B5E0);
  uint64_t v3 = sub_260313438();
  os_log_type_t v4 = sub_260313578();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2602F2000, v3, v4, "Enable E2E encryption for persistent stores", v5, 2u);
    MEMORY[0x26120CEF0](v5, -1, -1);
  }

  id v6 = objc_msgSend(v0, sel_persistentStoreDescriptions);
  sub_2602FE590(0, &qword_26A868940);
  unint64_t v7 = sub_260313528();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2603136F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v8)
  {
    oslog = sub_260313438();
    os_log_type_t v18 = sub_260313598();
    if (os_log_type_enabled(oslog, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_2602F2000, oslog, v18, "Failed to enable E2E encryption due to no persistent store descriptions", v19, 2u);
      MEMORY[0x26120CEF0](v19, -1, -1);
    }
    goto LABEL_21;
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD628]), sel_init);
  objc_msgSend(v9, sel_setUseZoneWidePCS_, 1);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF1F0]), sel_init);
  objc_msgSend(v10, sel_setUseDeviceToDeviceEncryption_, 1);
  uint64_t v20 = v9;
  objc_msgSend(v10, sel_setCkContainerOptions_, v9);
  oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF1E8]), sel_initWithOptions_, v10);
  id v11 = objc_msgSend(v1, sel_persistentStoreDescriptions);
  unint64_t v12 = sub_260313528();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2603136F8();
    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
    {
LABEL_10:
      if (v13 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v14 = 0;
      do
      {
        if ((v12 & 0xC000000000000001) != 0) {
          id v15 = (id)MEMORY[0x26120C770](v14, v12);
        }
        else {
          id v15 = *(id *)(v12 + 8 * v14 + 32);
        }
        uint64_t v16 = v15;
        ++v14;
        sub_2603134A8();
        id v17 = (void *)sub_260313498();
        swift_bridgeObjectRelease();
        objc_msgSend(v16, sel_setOption_forMirroringKey_, oslog, v17);
      }
      while (v13 != v14);
    }
  }
  swift_bridgeObjectRelease_n();
  sub_26030D7D4(1);

LABEL_21:
}

id TranslationStoreCoreData.persistentContainer.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t TranslationStoreCoreData.__allocating_init(inMemoryOnly:)(char a1)
{
  uint64_t v2 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(a1);
  return v2;
}

uint64_t TranslationStoreCoreData.init(inMemoryOnly:)(char a1)
{
  *(void *)(v1 + 16) = sub_2603096F8();
  *(void *)(v1 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1C1B8]), sel_init);
  uint64_t v3 = self;
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SourceInputValueTransformer()), sel_init);
  if (qword_26A868478 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_setValueTransformer_forName_, v4, qword_26A86B5F8);

  id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TargetResultValueTransformer()), sel_init);
  if (qword_26A868480 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_setValueTransformer_forName_, v5, qword_26A86B600);

  sub_26030A280(a1 & 1);
  return v1;
}

void sub_26030A280(char a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF328]), sel_init);
    objc_msgSend(v3, sel_setType_, *MEMORY[0x263EFF000]);
    id v4 = *(void **)(v1 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_260315600;
    *(void *)(v5 + 32) = v3;
    v26[0] = v5;
    sub_260313538();
    sub_2602FE590(0, &qword_26A868940);
    id v6 = v3;
    unint64_t v7 = (void *)sub_260313518();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setPersistentStoreDescriptions_, v7, v26[0]);
  }
  uint64_t v8 = *(void **)(v1 + 16);
  id v9 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  sub_2602FE590(0, &qword_26A868940);
  unint64_t v10 = sub_260313528();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2603136F8();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_5;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x26120C770](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    id v11 = *(id *)(v10 + 32);
  }
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_2602FE590(0, &qword_26A868948);
  uint64_t v13 = (void *)sub_2603135F8();
  objc_msgSend(v12, sel_setOption_forKey_, v13, *MEMORY[0x263EFF0B0]);

LABEL_11:
  id v15 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  unint64_t v10 = sub_260313528();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_2603136F8();
    swift_bridgeObjectRelease();
    if (v19)
    {
LABEL_13:
      if ((v10 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_32;
        }
        id v16 = *(id *)(v10 + 32);
        goto LABEL_16;
      }
LABEL_30:
      id v16 = (id)MEMORY[0x26120C770](0, v10);
LABEL_16:
      id v17 = v16;
      swift_bridgeObjectRelease();
      sub_2602FE590(0, &qword_26A868948);
      os_log_type_t v18 = (void *)sub_2603135F8();
      objc_msgSend(v17, sel_setOption_forKey_, v18, *MEMORY[0x263EFF070]);

      goto LABEL_19;
    }
  }
  else if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  id v20 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  unint64_t v10 = sub_260313528();

  if (!(v10 >> 62))
  {
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_21;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_2603136F8();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_26;
  }
LABEL_21:
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_32:
    id v21 = (id)MEMORY[0x26120C770](0, v10);
    goto LABEL_24;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v21 = *(id *)(v10 + 32);
LABEL_24:
    char v22 = v21;
    swift_bridgeObjectRelease();
    sub_2602FE590(0, &qword_26A868948);
    uint64_t v23 = (void *)sub_2603135F8();
    objc_msgSend(v22, sel_setOption_forKey_, v23, *MEMORY[0x263EFF008]);

LABEL_27:
    v26[4] = sub_2603130A4;
    v26[5] = v2;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 1107296256;
    v26[2] = sub_26030B840;
    uint64_t v26[3] = &block_descriptor_85;
    os_log_type_t v25 = _Block_copy(v26);
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_loadPersistentStoresWithCompletionHandler_, v25);
    _Block_release(v25);
    return;
  }
  __break(1u);
}

void sub_26030A744(void *a1, uint64_t a2, void *a3)
{
  aBlock[7] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = sub_2603132E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  unint64_t v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A868950);
  uint64_t v13 = MEMORY[0x270FA5388](v11 - 8, v12);
  uint64_t v91 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v92 = (uint64_t)&v86 - v16;
  unint64_t v93 = a3;
  unint64_t v17 = 0x26A868000uLL;
  if (!a2)
  {
    if (qword_26A868470 == -1) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
  os_log_type_t v18 = (void *)sub_260313288();
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_260313458();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A86B5E0);
  id v20 = v18;
  id v21 = sub_260313438();
  os_log_type_t v22 = sub_260313598();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v89 = v7;
  uint64_t v90 = v6;
  uint64_t v88 = v10;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v87 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412290;
    aBlock[0] = v20;
    id v25 = v20;
    a3 = v93;
    sub_260313628();
    uint64_t v26 = v87;
    void *v87 = v20;

    unint64_t v17 = 0x26A868000;
    _os_log_impl(&dword_2602F2000, v21, v22, "Failed to load Persistent Store on first try: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
    swift_arrayDestroy();
    MEMORY[0x26120CEF0](v26, -1, -1);
    MEMORY[0x26120CEF0](v24, -1, -1);
  }
  else
  {
  }
  a3 = (void *)a3[2];
  id v35 = objc_msgSend(a3, sel_persistentStoreDescriptions);
  a1 = (void *)sub_2602FE590(0, &qword_26A868940);
  unint64_t v36 = sub_260313528();

  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_2603136F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v37 < 1)
  {

    a3 = v93;
    goto LABEL_29;
  }
  id v38 = objc_msgSend(a3, sel_persistentStoreDescriptions);
  uint64_t v39 = sub_260313528();

  if ((v39 & 0xC000000000000001) != 0)
  {
    id v42 = (id)MEMORY[0x26120C770](0, v39);
    uint64_t v41 = v89;
    uint64_t v40 = v90;
    goto LABEL_16;
  }
  uint64_t v41 = v89;
  uint64_t v40 = v90;
  if (!*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_51:
    swift_once();
LABEL_7:
    uint64_t v27 = sub_260313458();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A86B5E0);
    id v28 = a1;
    uint64_t v29 = sub_260313438();
    os_log_type_t v30 = sub_260313578();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138477827;
      aBlock[0] = v28;
      id v33 = v28;
      unint64_t v17 = 0x26A868000;
      sub_260313628();
      *uint64_t v32 = v28;

      _os_log_impl(&dword_2602F2000, v29, v30, "Successfully loaded Persistent Store on first try: %{private}@", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      uint64_t v34 = v32;
      a3 = v93;
      MEMORY[0x26120CEF0](v34, -1, -1);
      MEMORY[0x26120CEF0](v31, -1, -1);
    }
    else
    {
    }
    goto LABEL_29;
  }
  id v42 = *(id *)(v39 + 32);
LABEL_16:
  swift_bridgeObjectRelease();
  id v43 = objc_msgSend(v42, sel_URL);

  if (v43)
  {
    uint64_t v44 = (uint64_t)v91;
    sub_2603132C8();

    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = 1;
    uint64_t v44 = (uint64_t)v91;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v44, v45, 1, v40);
  uint64_t v46 = v92;
  sub_2603130AC(v44, v92);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v46, 1, v40))
  {

    sub_260307704(v46, (uint64_t *)&unk_26A868950);
    a3 = v93;
  }
  else
  {
    unint64_t v47 = v88;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v88, v46, v40);
    sub_260307704(v46, (uint64_t *)&unk_26A868950);
    sub_2603132D8();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v40);
    id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
    uint64_t v49 = (void *)sub_260313498();
    swift_bridgeObjectRelease();
    aBlock[0] = 0;
    LODWORD(v47) = objc_msgSend(v48, sel_removeItemAtPath_error_, v49, aBlock);

    id v50 = aBlock[0];
    if (v47)
    {
      aBlock[4] = sub_26030B500;
      aBlock[5] = 0;
      aBlock[0] = (id)MEMORY[0x263EF8330];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_26030B840;
      aBlock[3] = &block_descriptor_88;
      uint64_t v51 = _Block_copy(aBlock);
      id v52 = v50;
      objc_msgSend(a3, sel_loadPersistentStoresWithCompletionHandler_, v51);

      _Block_release(v51);
      a3 = v93;
    }
    else
    {
      id v53 = aBlock[0];
      uint64_t v54 = (void *)sub_260313298();

      swift_willThrow();
      id v55 = v54;
      id v56 = v54;
      v57 = sub_260313438();
      os_log_type_t v58 = sub_260313598();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        uint64_t v60 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v59 = 138412290;
        uint64_t v61 = v20;
        v62 = (void *)sub_260313288();
        aBlock[0] = v62;
        sub_260313628();
        void *v60 = v62;

        _os_log_impl(&dword_2602F2000, v57, v58, "File manager failed to delete sqlite file: %@", v59, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
        swift_arrayDestroy();
        MEMORY[0x26120CEF0](v60, -1, -1);
        MEMORY[0x26120CEF0](v59, -1, -1);
      }
      else
      {
      }
      a3 = v93;
      unint64_t v17 = 0x26A868000uLL;
    }
  }
LABEL_29:
  uint64_t v63 = (void *)a3[2];
  id v64 = objc_msgSend(v63, sel_viewContext);
  objc_msgSend(v64, sel_setAutomaticallyMergesChangesFromParent_, 1);

  id v65 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v66 = (void *)sub_260313498();
  id v67 = objc_msgSend(v65, sel_initWithEntityName_, v66);

  sub_2602FE590(0, &qword_26A8688E0);
  unint64_t v68 = (void *)sub_260313568();
  objc_msgSend(v67, sel_setPredicate_, v68);

  if (*(void *)(v17 + 1136) != -1) {
    swift_once();
  }
  uint64_t v69 = sub_260313458();
  __swift_project_value_buffer(v69, (uint64_t)qword_26A86B5E0);
  uint64_t v70 = sub_260313438();
  os_log_type_t v71 = sub_260313578();
  if (os_log_type_enabled(v70, v71))
  {
    BOOL v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v72 = 0;
    _os_log_impl(&dword_2602F2000, v70, v71, "Attempt to delete invalid data", v72, 2u);
    MEMORY[0x26120CEF0](v72, -1, -1);
  }

  id v73 = objc_msgSend(v63, sel_viewContext);
  type metadata accessor for PersistedTranslation();
  unint64_t v74 = sub_2603135E8();

  unint64_t v75 = v74 >> 62;
  if (!(v74 >> 62))
  {
    uint64_t v76 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v76 >= 1) {
      goto LABEL_35;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  uint64_t v76 = sub_2603136F8();
  swift_bridgeObjectRelease();
  if (v76 < 1) {
    goto LABEL_53;
  }
LABEL_35:
  swift_bridgeObjectRetain();
  uint64_t v77 = sub_260313438();
  os_log_type_t v78 = sub_2603135A8();
  if (os_log_type_enabled(v77, v78))
  {
    id v79 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v79 = 134217984;
    aBlock[0] = (id)v76;
    sub_260313628();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2602F2000, v77, v78, "Found %ld translations with invalid source or target", v79, 0xCu);
    MEMORY[0x26120CEF0](v79, -1, -1);

    uint64_t v80 = v74 & 0xFFFFFFFFFFFFFF8;
    if (v75) {
      goto LABEL_37;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v80 = v74 & 0xFFFFFFFFFFFFFF8;
    if (v75)
    {
LABEL_37:
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_2603136F8();
      swift_bridgeObjectRelease();
      if (!v81) {
        goto LABEL_47;
      }
LABEL_41:
      if (v81 < 1) {
        __break(1u);
      }
      uint64_t v82 = 0;
      do
      {
        if ((v74 & 0xC000000000000001) != 0) {
          id v83 = (id)MEMORY[0x26120C770](v82, v74);
        }
        else {
          id v83 = *(id *)(v74 + 8 * v82 + 32);
        }
        uint64_t v84 = v83;
        ++v82;
        id v85 = objc_msgSend(v63, sel_viewContext);
        objc_msgSend(v85, sel_deleteObject_, v84);
      }
      while (v81 != v82);
      goto LABEL_47;
    }
  }
  uint64_t v81 = *(void *)(v80 + 16);
  if (v81) {
    goto LABEL_41;
  }
LABEL_47:
  swift_bridgeObjectRelease();
  sub_26030B904();
LABEL_54:
}

void sub_26030B500(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)sub_260313288();
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_260313458();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A86B5E0);
    id v15 = v2;
    id v4 = sub_260313438();
    os_log_type_t v5 = sub_260313598();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 138412290;
      id v8 = v15;
      sub_260313628();
      *uint64_t v7 = v15;

      _os_log_impl(&dword_2602F2000, v4, v5, "Failed to load Persistent Store on second try: %@", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v7, -1, -1);
      MEMORY[0x26120CEF0](v6, -1, -1);

LABEL_10:
      return;
    }
  }
  else
  {
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_260313458();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A86B5E0);
    id v15 = a1;
    id v4 = sub_260313438();
    os_log_type_t v11 = sub_260313578();
    if (os_log_type_enabled(v4, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138477827;
      id v14 = v15;
      sub_260313628();
      *uint64_t v13 = v15;

      _os_log_impl(&dword_2602F2000, v4, v11, "Successfully loaded Persistent Store on second try: %{private}@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v13, -1, -1);
      MEMORY[0x26120CEF0](v12, -1, -1);
      goto LABEL_10;
    }
  }
}

void sub_26030B840(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

id sub_26030B8CC()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);

  return v1;
}

void sub_26030B904()
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  id v12 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  if (objc_msgSend(v12, sel_hasChanges))
  {
    v13[0] = 0;
    if (objc_msgSend(v12, sel_save_, v13))
    {
      id v1 = v13[0];
    }
    else
    {
      id v2 = v13[0];
      uint64_t v3 = (void *)sub_260313298();

      swift_willThrow();
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_260313458();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A86B5E0);
      id v5 = v3;
      id v6 = v3;
      id v7 = sub_260313438();
      os_log_type_t v8 = sub_260313598();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 138412290;
        os_log_type_t v11 = (void *)sub_260313288();
        v13[0] = v11;
        sub_260313628();
        *uint64_t v10 = v11;

        _os_log_impl(&dword_2602F2000, v7, v8, "Failed to save view context: %@", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
        swift_arrayDestroy();
        MEMORY[0x26120CEF0](v10, -1, -1);
        MEMORY[0x26120CEF0](v9, -1, -1);
      }
      else
      {
      }
    }
  }
  else
  {
  }
}

uint64_t TranslationStoreCoreData.deinit()
{
  return v0;
}

uint64_t TranslationStoreCoreData.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_26030BC20()
{
  return TranslationStoreCoreData.totalCount.getter();
}

uint64_t TranslationStoreCoreData.totalCount.getter()
{
  id v1 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v2 = (void *)sub_260313498();
  id v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  id v4 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  uint64_t v5 = sub_2603135D8();

  return v5;
}

uint64_t sub_26030BEAC()
{
  return TranslationStoreCoreData.favoriteCount.getter();
}

uint64_t TranslationStoreCoreData.favoriteCount.getter()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v3 = (void *)sub_260313498();
  id v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  sub_2602FE590(0, &qword_26A8688E0);
  uint64_t v5 = (void *)sub_260313568();
  objc_msgSend(v4, sel_setPredicate_, v5);

  id v6 = objc_msgSend(*(id *)(v1 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  uint64_t v7 = sub_2603135D8();

  return v7;
}

uint64_t sub_26030C198()
{
  return TranslationStoreCoreData.getAllFavorites()();
}

uint64_t TranslationStoreCoreData.getAllFavorites()()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v3 = (void *)sub_260313498();
  id v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  sub_2602FE590(0, &qword_26A8688E0);
  uint64_t v5 = (void *)sub_260313568();
  objc_msgSend(v4, sel_setPredicate_, v5);

  id v6 = objc_msgSend(*(id *)(v1 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  uint64_t v7 = sub_2603135E8();

  return v7;
}

void sub_26030C468(void *a1)
{
  uint64_t v3 = *v1;
  id v4 = *(void **)(v3 + 16);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v3;
  v8[4] = sub_2603131F4;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_26030E88C;
  v8[3] = &block_descriptor_82;
  id v6 = _Block_copy(v8);
  id v7 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_performBackgroundTask_, v6);
  _Block_release(v6);
}

void TranslationStoreCoreData.toggleFavoriteBackground(_:)(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  void v7[4] = sub_260311D6C;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_26030E88C;
  v7[3] = &block_descriptor;
  uint64_t v5 = _Block_copy(v7);
  id v6 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void sub_26030C644(void *a1)
{
  uint64_t v3 = *(void **)(*(void *)v1 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  void v7[4] = sub_260313178;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_26030E88C;
  v7[3] = &block_descriptor_75;
  uint64_t v5 = _Block_copy(v7);
  id v6 = a1;
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void TranslationStoreCoreData.updateDisambiguation(for:)(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  void v7[4] = sub_260311DC4;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_26030E88C;
  v7[3] = &block_descriptor_6;
  uint64_t v5 = _Block_copy(v7);
  id v6 = a1;
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void *sub_26030C800(void *a1, void *a2, int a3)
{
  uint64_t v6 = *v3;
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = __swift_project_boxed_opaque_existential_1Tm(a1, v7);
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  id v12 = __swift_project_boxed_opaque_existential_1Tm(a2, v10);

  return sub_260311704((uint64_t)v9, (uint64_t)v12, a3, v6, v7, v10, v8, v11);
}

void *TranslationStoreCoreData.insert(speech:translationResult:isFavorite:)(void *a1, void *a2, int a3)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = __swift_project_boxed_opaque_existential_1Tm(a1, v6);
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = __swift_project_boxed_opaque_existential_1Tm(a2, v9);

  return sub_260311704((uint64_t)v8, (uint64_t)v11, a3, v3, v6, v9, v7, v10);
}

uint64_t sub_26030C91C(void *a1, uint64_t a2, uint64_t a3)
{
  return TranslationStoreCoreData.deleteBackground(_:completion:)(a1, a2, a3);
}

uint64_t TranslationStoreCoreData.deleteBackground(_:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v7 = objc_msgSend(a1, sel_identifier);
  uint64_t v8 = sub_2603134A8();
  uint64_t v10 = v9;

  uint64_t v11 = *(void **)(v4 + 16);
  id v12 = (void *)swift_allocObject();
  void v12[2] = v8;
  uint64_t v12[3] = v10;
  void v12[4] = v4;
  v12[5] = a2;
  v12[6] = a3;
  v15[4] = sub_260311DD0;
  v15[5] = v12;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  _OWORD v15[2] = sub_26030E88C;
  uint64_t v15[3] = &block_descriptor_12;
  uint64_t v13 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBackgroundTask_, v13);
  _Block_release(v13);
  return swift_bridgeObjectRelease();
}

void sub_26030CA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = *(void **)(v9 + 16);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a1;
  void v11[3] = a2;
  void v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  v13[4] = sub_260311DD0;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  id v13[2] = sub_26030E88C;
  v13[3] = &block_descriptor_68;
  id v12 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBackgroundTask_, v12);
  _Block_release(v12);
}

void TranslationStoreCoreData.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void **)(v4 + 16);
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = a1;
  v10[3] = a2;
  v10[4] = v4;
  v10[5] = a3;
  v10[6] = a4;
  void v12[4] = sub_260311DD0;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  void v12[2] = sub_26030E88C;
  uint64_t v12[3] = &block_descriptor_19;
  uint64_t v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBackgroundTask_, v11);
  _Block_release(v11);
}

void sub_26030CC94()
{
}

Swift::Void __swiftcall TranslationStoreCoreData.save()()
{
  v14[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  v14[0] = 0;
  unsigned int v2 = objc_msgSend(v1, sel_save_, v14);

  id v3 = v14[0];
  if (v2)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = v14[0];
    uint64_t v6 = (void *)sub_260313298();

    swift_willThrow();
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_260313458();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A86B5E0);
    id v8 = v6;
    uint64_t v9 = sub_260313438();
    os_log_type_t v10 = sub_260313598();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      id v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      uint64_t v13 = (void *)sub_260313288();
      v14[0] = v13;
      sub_260313628();
      *id v12 = v13;

      _os_log_impl(&dword_2602F2000, v9, v10, "Failed to save: %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v12, -1, -1);
      MEMORY[0x26120CEF0](v11, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_26030CF28(uint64_t a1, uint64_t a2)
{
  return TranslationStoreCoreData.translations(with:)(a1, a2);
}

uint64_t TranslationStoreCoreData.translations(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v7 = (void *)sub_260313498();
  id v8 = objc_msgSend(v6, sel_initWithEntityName_, v7);

  sub_2602FE590(0, &qword_26A8688E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688F8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_260314C10;
  *(void *)(v9 + 56) = MEMORY[0x263F8D310];
  *(void *)(v9 + 64) = sub_260308C6C();
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  os_log_type_t v10 = (void *)sub_260313568();
  objc_msgSend(v8, sel_setPredicate_, v10);

  id v11 = objc_allocWithZone(MEMORY[0x263F08B30]);
  id v12 = (void *)sub_260313498();
  id v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_260315600;
  *(void *)(v14 + 32) = v13;
  sub_260313538();
  sub_2602FE590(0, &qword_26A8688F0);
  id v15 = v13;
  uint64_t v16 = (void *)sub_260313518();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setSortDescriptors_, v16);

  id v17 = objc_msgSend(*(id *)(v3 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  uint64_t v18 = sub_2603135E8();

  return v18;
}

void sub_26030D1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  id v6 = *(void **)(v5 + 16);
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = 0;
  v7[3] = 0;
  void v7[4] = v5;
  v7[5] = a1;
  void v7[6] = a2;
  void v9[4] = sub_260311DF0;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_26030E88C;
  v9[3] = &block_descriptor_61;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBackgroundTask_, v8);
  _Block_release(v8);
}

void TranslationStoreCoreData.clearHistory(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  id v6 = (void *)swift_allocObject();
  v6[2] = 0;
  _OWORD v6[3] = 0;
  v6[4] = v2;
  v6[5] = a1;
  v6[6] = a2;
  v8[4] = sub_260311DF0;
  v8[5] = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_26030E88C;
  v8[3] = &block_descriptor_25;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_performBackgroundTask_, v7);
  _Block_release(v7);
}

void sub_26030D3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  os_log_type_t v10 = *(void **)(v9 + 16);
  id v11 = (void *)swift_allocObject();
  v11[2] = a1;
  void v11[3] = a2;
  void v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  v13[4] = sub_260311DF0;
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  id v13[2] = sub_26030E88C;
  v13[3] = &block_descriptor_54;
  id v12 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBackgroundTask_, v12);
  _Block_release(v12);
}

void TranslationStoreCoreData.clearHistory(sessionID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void **)(v4 + 16);
  os_log_type_t v10 = (void *)swift_allocObject();
  void v10[2] = a1;
  v10[3] = a2;
  v10[4] = v4;
  v10[5] = a3;
  v10[6] = a4;
  void v12[4] = sub_260311DF0;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  void v12[2] = sub_26030E88C;
  uint64_t v12[3] = &block_descriptor_32;
  id v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBackgroundTask_, v11);
  _Block_release(v11);
}

void sub_26030D5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  id v6 = *(void **)(v5 + 16);
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = v5;
  v7[3] = a1;
  void v7[4] = a2;
  void v9[4] = sub_26031317C;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_26030E88C;
  v9[3] = &block_descriptor_47;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBackgroundTask_, v8);
  _Block_release(v8);
}

void TranslationStoreCoreData.clear(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  id v6 = (void *)swift_allocObject();
  v6[2] = v2;
  _OWORD v6[3] = a1;
  v6[4] = a2;
  v8[4] = sub_260311E10;
  v8[5] = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_26030E88C;
  v8[3] = &block_descriptor_38;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_performBackgroundTask_, v7);
  _Block_release(v7);
}

uint64_t sub_26030D7D4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_260313278();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_260313458();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A86B5E0);
  os_log_type_t v10 = sub_260313438();
  os_log_type_t v11 = sub_260313578();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v12 = 67109120;
    LODWORD(v21) = a1 & 1;
    sub_260313628();
    _os_log_impl(&dword_2602F2000, v10, v11, "Exclude persistent stores from iCloud Backup: %{BOOL}d", v12, 8u);
    MEMORY[0x26120CEF0](v12, -1, -1);
  }

  sub_260313268();
  sub_260313258();
  id v13 = objc_msgSend(v2, sel_persistentStoreDescriptions);
  sub_2602FE590(0, &qword_26A868940);
  unint64_t v14 = sub_260313528();

  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_7;
    }
LABEL_14:
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2603136F8();
  uint64_t v15 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_7:
  if (v15 >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v18 = (id)MEMORY[0x26120C770](v17, v14);
      }
      else {
        id v18 = *(id *)(v14 + 8 * v17 + 32);
      }
      uint64_t v19 = v18;
      ++v17;
      id v21 = v18;
      sub_26030DA98(&v21, (uint64_t)v8);
    }
    while (v15 != v17);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void sub_26030DA98(id *a1, uint64_t a2)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_260313278();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A868950);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v36 = (uint64_t)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v19 = (char *)&v36 - v18;
  MEMORY[0x270FA5388](v17, v20);
  os_log_type_t v22 = (char *)&v36 - v21;
  id v39 = *a1;
  id v23 = objc_msgSend(v39, sel_URL);
  uint64_t v38 = v3;
  if (v23)
  {
    uint64_t v24 = v23;
    sub_2603132C8();

    uint64_t v25 = sub_2603132E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v19, 0, 1, v25);
  }
  else
  {
    uint64_t v25 = sub_2603132E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v19, 1, 1, v25);
  }
  sub_2603130AC((uint64_t)v19, (uint64_t)v22);
  sub_2603132E8();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v22, 1, v25))
  {
    sub_260313114((uint64_t)v22, (uint64_t)v15, (uint64_t *)&unk_26A868950);
    if (v27(v15, 1, v25) == 1)
    {
      id v28 = 0;
    }
    else
    {
      id v28 = (void *)sub_2603132B8();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v25);
    }
    objc_msgSend(v39, sel_setURL_, v28);

    sub_260307704((uint64_t)v22, (uint64_t *)&unk_26A868950);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v37, v38);
    uint64_t v29 = v40;
    sub_2603132A8();
    if (v29)
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v38);
      uint64_t v30 = v36;
      sub_260313114((uint64_t)v22, v36, (uint64_t *)&unk_26A868950);
      unsigned int v31 = v27((char *)v30, 1, v25);
      uint64_t v32 = 0;
      if (v31 != 1)
      {
        uint64_t v32 = (void *)sub_2603132B8();
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v25);
      }
      objc_msgSend(v39, sel_setURL_, v32);

      sub_260307704((uint64_t)v22, (uint64_t *)&unk_26A868950);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v38);
      unsigned int v33 = v27(v22, 1, v25);
      id v34 = v39;
      if (v33 == 1)
      {
        id v35 = 0;
      }
      else
      {
        id v35 = (void *)sub_2603132B8();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v25);
      }
      objc_msgSend(v34, sel_setURL_, v35);
    }
  }
}

void sub_26030DF08(void *a1, void *a2)
{
  objc_msgSend(v2, sel_deleteObject_, a1);
  if (sub_260304464())
  {
    id v5 = objc_msgSend(a1, sel_requestID);
    uint64_t v6 = sub_2603134A8();
    unint64_t v8 = v7;

    swift_bridgeObjectRelease();
    uint64_t v9 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0) {
      uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
    }
    if (v9)
    {
      id v10 = objc_msgSend(a1, sel_interactedIndices);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_260313528();

        id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1C1A0]), sel_init);
        id v14 = objc_msgSend(a1, sel_sessionID);
        objc_msgSend(v13, sel_setConversationID_, v14);

        id v15 = objc_msgSend(a1, sel_requestID);
        objc_msgSend(v13, sel_setRequestID_, v15);

        sub_260303CF4(v38);
        uint64_t v16 = v39;
        uint64_t v17 = v40;
        __swift_project_boxed_opaque_existential_1Tm(v38, v39);
        uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
        sub_26030961C(v18);
        swift_bridgeObjectRelease();
        uint64_t v19 = (void *)sub_260313518();
        swift_bridgeObjectRelease();
        objc_msgSend(v13, sel_setSenses_, v19);

        int64_t v20 = *(void *)(v12 + 16);
        if (v20)
        {
          id v35 = v13;
          uint64_t v36 = a2;
          uint64_t v37 = MEMORY[0x263F8EE78];
          id v21 = a1;
          sub_2603011C0(0, v20, 0);
          uint64_t v22 = 0;
          while (1)
          {
            unint64_t v23 = *(void *)(v12 + 8 * v22 + 32);
            sub_260303CF4(v38);
            uint64_t v24 = v39;
            uint64_t v25 = v40;
            __swift_project_boxed_opaque_existential_1Tm(v38, v39);
            uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
            if ((v23 & 0x8000000000000000) != 0) {
              break;
            }
            if (v23 >= *(void *)(v26 + 16)) {
              goto LABEL_18;
            }
            uint64_t v27 = v12;
            sub_2602F5268(v26 + 40 * v23 + 32, (uint64_t)v38);
            swift_bridgeObjectRelease();
            uint64_t v28 = sub_26030E2A8(v38);
            uint64_t v30 = v29;
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
            unint64_t v32 = *(void *)(v37 + 16);
            unint64_t v31 = *(void *)(v37 + 24);
            if (v32 >= v31 >> 1) {
              sub_2603011C0(v31 > 1, v32 + 1, 1);
            }
            ++v22;
            *(void *)(v37 + 16) = v32 + 1;
            uint64_t v33 = v37 + 16 * v32;
            *(void *)(v33 + 32) = v28;
            *(void *)(v33 + 40) = v30;
            uint64_t v12 = v27;
            if (v20 == v22)
            {
              swift_bridgeObjectRelease();

              id v13 = v35;
              a2 = v36;
              goto LABEL_15;
            }
          }
          __break(1u);
LABEL_18:
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRelease();
LABEL_15:
          id v34 = (void *)sub_260313518();
          swift_bridgeObjectRelease();
          objc_msgSend(v13, sel_setUserInteractedSenses_, v34);

          objc_msgSend(a2, sel_log_, v13);
        }
      }
    }
  }
}

uint64_t sub_26030E2A8(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  if (*(void *)(v3 + 16))
  {
    sub_2602F5268(v3 + 32, (uint64_t)v18);
  }
  else
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  swift_bridgeObjectRelease();
  sub_260313114((uint64_t)v18, (uint64_t)&v13, &qword_26A868918);
  if (v14)
  {
    sub_2602F5330(&v13, (uint64_t)v15);
    uint64_t v4 = v16;
    uint64_t v5 = v17;
    __swift_project_boxed_opaque_existential_1Tm(v15, v16);
    char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 56))(v4, v5);
    if (v6) {
      uint64_t v7 = 0x747365626ELL;
    }
    else {
      uint64_t v7 = 0x6769626D61736964;
    }
    if (v6) {
      unint64_t v8 = 0xE500000000000000;
    }
    else {
      unint64_t v8 = 0xE800000000000000;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    uint64_t v7 = 7104878;
    sub_260307704((uint64_t)&v13, &qword_26A868918);
    unint64_t v8 = 0xE300000000000000;
  }
  sub_260313114((uint64_t)v18, (uint64_t)v15, &qword_26A868918);
  uint64_t v9 = v16;
  if (v16)
  {
    uint64_t v10 = v17;
    __swift_project_boxed_opaque_existential_1Tm(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    sub_260307704((uint64_t)v15, &qword_26A868918);
  }
  v15[0] = v7;
  v15[1] = v8;
  sub_2603134D8();
  sub_2603134D8();
  swift_bridgeObjectRelease();
  uint64_t v11 = v15[0];
  sub_260307704((uint64_t)v18, &qword_26A868918);
  return v11;
}

id TranslationStoreCoreData.moc.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);

  return v1;
}

void *TranslationStoreCoreData.insert(speech:translationResult:context:isFavorite:)(void *a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = __swift_project_boxed_opaque_existential_1Tm(a1, v7);
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  uint64_t v12 = __swift_project_boxed_opaque_existential_1Tm(a2, v10);

  return sub_260311E1C((uint64_t)v9, (uint64_t)v12, a3, a4, v7, v10, v8, v11);
}

uint64_t sub_26030E574(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  v26[2] = *(id *)MEMORY[0x263EF8340];
  id v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(a2, a3);
  type metadata accessor for PersistedTranslation();
  unint64_t v9 = sub_2603135E8();
  unint64_t v18 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_2603136F8();
    swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_8;
    }
LABEL_16:

    uint64_t v17 = swift_bridgeObjectRelease();
    return a5(v17);
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v18 & 0xC000000000000001) != 0)
  {
    id v19 = (id)MEMORY[0x26120C770](0, v18);
  }
  else
  {
    if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v19 = *(id *)(v18 + 32);
  }
  int64_t v20 = v19;
  swift_bridgeObjectRelease();
  sub_26030DF08(v20, *(void **)(a4 + 24));
  v26[0] = 0;
  if (objc_msgSend(a1, sel_save_, v26))
  {
    id v21 = v26[0];
  }
  else
  {
    id v22 = v26[0];
    unint64_t v23 = (void *)sub_260313298();

    swift_willThrow();
    if (qword_26A868470 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_260313458();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A86B5E0);
    id v11 = v23;
    uint64_t v12 = sub_260313438();
    os_log_type_t v13 = sub_260313598();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      id v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      uint64_t v16 = (void *)sub_260313288();
      v26[0] = v16;
      sub_260313628();
      *id v15 = v16;

      _os_log_impl(&dword_2602F2000, v12, v13, "Failed to delete translation: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v15, -1, -1);
      MEMORY[0x26120CEF0](v14, -1, -1);
    }
    else
    {
    }
  }
  return a5(v17);
}

void sub_26030E88C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_26030E8F4(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, id a5)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v9 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v10 = (void *)sub_260313498();
  id v11 = objc_msgSend(v9, sel_initWithEntityName_, v10);

  sub_2602FE590(0, &qword_26A8688E0);
  uint64_t v12 = (void *)sub_260313568();
  objc_msgSend(v11, sel_setPredicate_, v12);

  if (a3)
  {
    swift_bridgeObjectRetain();
    id v13 = objc_msgSend(v11, sel_predicate);
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v102 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688F8);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_260314C10;
      *(void *)(v15 + 56) = MEMORY[0x263F8D310];
      *(void *)(v15 + 64) = sub_260308C6C();
      *(void *)(v15 + 32) = a2;
      *(void *)(v15 + 40) = a3;
      swift_bridgeObjectRetain();
      char v100 = v11;
      uint64_t v16 = (void *)sub_260313568();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8688E8);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_2603155F0;
      *(void *)(v17 + 32) = v14;
      *(void *)(v17 + 40) = v16;
      v113[0] = (id)v17;
      sub_260313538();
      id v18 = v14;
      id v19 = v16;
      id v11 = v100;
      id v20 = v19;
      id v21 = (void *)sub_260313518();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v21);

      objc_msgSend(v100, sel_setPredicate_, v22);
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_260313458();
      __swift_project_value_buffer(v23, (uint64_t)qword_26A86B5E0);
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_260313438();
      os_log_type_t v25 = sub_260313578();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v106 = v18;
        id v27 = a5;
        uint64_t v28 = (void *)swift_slowAlloc();
        v113[0] = v28;
        *(_DWORD *)uint64_t v26 = 136315138;
        swift_bridgeObjectRetain();
        v110[0] = sub_2603058A4(a2, a3, (uint64_t *)v113);
        id v11 = v100;
        sub_260313628();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2602F2000, v24, v25, "Attempt to delete session (id: %s) history", v26, 0xCu);
        swift_arrayDestroy();
        uint64_t v29 = v28;
        a5 = v27;
        MEMORY[0x26120CEF0](v29, -1, -1);
        MEMORY[0x26120CEF0](v26, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      a1 = v102;
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_260313458();
  __swift_project_value_buffer(v30, (uint64_t)qword_26A86B5E0);
  unint64_t v31 = sub_260313438();
  os_log_type_t v32 = sub_260313578();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_2602F2000, v31, v32, "Attempt to delete history", v33, 2u);
    MEMORY[0x26120CEF0](v33, -1, -1);
  }

LABEL_15:
  type metadata accessor for PersistedTranslation();
  unint64_t v34 = sub_2603135E8();
  id v35 = 0;
  unint64_t v36 = v34;
  unint64_t v93 = v34 >> 62;
  if (!(v34 >> 62))
  {
    uint64_t v37 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v37) {
      goto LABEL_17;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    v113[0] = 0;
    if (!objc_msgSend(a1, sel_save_, v113))
    {
      id v86 = v113[0];
      swift_bridgeObjectRelease();
      id v35 = (uint64_t (**)(void, void))sub_260313298();

      swift_willThrow();
      if (qword_26A868470 == -1) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
    uint64_t v79 = qword_26A868470;
    id v80 = v113[0];
    if (v79 == -1)
    {
LABEL_43:
      uint64_t v81 = sub_260313458();
      __swift_project_value_buffer(v81, (uint64_t)qword_26A86B5E0);
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_260313438();
      os_log_type_t v83 = sub_260313578();
      if (!os_log_type_enabled(v82, v83))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_51;
      }
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v84 = 134217984;
      if (v93)
      {
        swift_bridgeObjectRetain();
        id v85 = (void *)sub_2603136F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v85 = *(void **)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v113[0] = v85;
      sub_260313628();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2602F2000, v82, v83, "Deleted %ld old translations", v84, 0xCu);
      MEMORY[0x26120CEF0](v84, -1, -1);
      goto LABEL_50;
    }
LABEL_62:
    swift_once();
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_2603136F8();
  if (!v37) {
    goto LABEL_41;
  }
LABEL_17:
  if (v37 < 1)
  {
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v38 = 0;
  id v97 = *(id *)(a4 + 24);
  uint64_t v105 = v37;
  unint64_t v107 = v36 & 0xC000000000000001;
  unint64_t v104 = v36 + 32;
  id v99 = a5;
  id v101 = v11;
  uint64_t v103 = a1;
  unint64_t v94 = v36;
  while (1)
  {
    while (1)
    {
      id v39 = v107 ? (id)MEMORY[0x26120C770](v38, v36) : *(id *)(v104 + 8 * v38);
      uint64_t v40 = v39;
      uint64_t v109 = v38 + 1;
      objc_msgSend(a1, sel_deleteObject_, v39, v93);
      id v41 = objc_msgSend(v40, sel_targetResult);

      if (v41)
      {
        sub_260303CF4((uint64_t *)v113);
        uint64_t v42 = v114;
        id v43 = v115;
        __swift_project_boxed_opaque_existential_1Tm(v113, v114);
        unint64_t v44 = *(void *)(v43[3](v42, v43) + 16);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
        if (v44 >= 2)
        {
          sub_260303CF4((uint64_t *)v113);
          uint64_t v45 = v114;
          uint64_t v46 = v115;
          __swift_project_boxed_opaque_existential_1Tm(v113, v114);
          uint64_t v47 = v46[3](v45, v46);
          if (!*(void *)(v47 + 16)) {
            goto LABEL_57;
          }
          sub_2602F5268(v47 + 32, (uint64_t)v110);
          swift_bridgeObjectRelease();
          uint64_t v48 = v111;
          uint64_t v49 = v112;
          __swift_project_boxed_opaque_existential_1Tm(v110, v111);
          uint64_t v50 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49) + 16);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
          if (v50)
          {
            id v51 = objc_msgSend(v40, sel_requestID);
            uint64_t v52 = sub_2603134A8();
            unint64_t v54 = v53;

            swift_bridgeObjectRelease();
            uint64_t v55 = HIBYTE(v54) & 0xF;
            if ((v54 & 0x2000000000000000) == 0) {
              uint64_t v55 = v52 & 0xFFFFFFFFFFFFLL;
            }
            if (v55)
            {
              id v56 = objc_msgSend(v40, sel_interactedIndices);
              if (v56) {
                break;
              }
            }
          }
        }
      }

      uint64_t v38 = v109;
      if (v109 == v105) {
        goto LABEL_41;
      }
    }
    v57 = v56;
    uint64_t v58 = sub_260313528();

    id v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1C1A0]), sel_init);
    id v60 = objc_msgSend(v40, sel_sessionID);
    objc_msgSend(v59, sel_setConversationID_, v60);

    id v61 = objc_msgSend(v40, sel_requestID);
    objc_msgSend(v59, sel_setRequestID_, v61);

    sub_260303CF4((uint64_t *)v113);
    uint64_t v62 = v114;
    uint64_t v63 = v115;
    __swift_project_boxed_opaque_existential_1Tm(v113, v114);
    uint64_t v64 = v63[3](v62, v63);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    sub_26030961C(v64);
    swift_bridgeObjectRelease();
    id v65 = (void *)sub_260313518();
    swift_bridgeObjectRelease();
    id v98 = v59;
    objc_msgSend(v59, sel_setSenses_, v65);

    int64_t v66 = *(void *)(v58 + 16);
    if (v66) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_40:
    os_log_type_t v78 = (void *)sub_260313518();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_setUserInteractedSenses_, v78);

    objc_msgSend(v97, sel_log_, v98);
    uint64_t v38 = v109;
    a1 = v103;
    if (v109 == v105) {
      goto LABEL_41;
    }
  }
  unint64_t v96 = v35;
  v110[0] = MEMORY[0x263F8EE78];
  uint64_t v95 = v40;
  a5 = v40;
  sub_2603011C0(0, v66, 0);
  id v11 = 0;
  uint64_t v67 = v110[0];
  while (1)
  {
    uint64_t v68 = v58;
    unint64_t v69 = *(void *)(v58 + 8 * (void)v11 + 32);
    sub_260303CF4((uint64_t *)v113);
    uint64_t v70 = v114;
    id v35 = v115;
    __swift_project_boxed_opaque_existential_1Tm(v113, v114);
    uint64_t v71 = v35[3](v70, v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    if ((v69 & 0x8000000000000000) != 0) {
      break;
    }
    if (v69 >= *(void *)(v71 + 16)) {
      goto LABEL_56;
    }
    sub_2602F5268(v71 + 40 * v69 + 32, (uint64_t)v113);
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_26030E2A8(v113);
    uint64_t v74 = v73;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    v110[0] = v67;
    unint64_t v76 = *(void *)(v67 + 16);
    unint64_t v75 = *(void *)(v67 + 24);
    if (v76 >= v75 >> 1)
    {
      sub_2603011C0(v75 > 1, v76 + 1, 1);
      uint64_t v67 = v110[0];
    }
    id v11 = (char *)v11 + 1;
    *(void *)(v67 + 16) = v76 + 1;
    uint64_t v77 = v67 + 16 * v76;
    *(void *)(v77 + 32) = v72;
    *(void *)(v77 + 40) = v74;
    uint64_t v58 = v68;
    if ((id)v66 == v11)
    {
      swift_bridgeObjectRelease();

      a5 = v99;
      id v11 = v101;
      unint64_t v36 = v94;
      uint64_t v40 = v95;
      id v35 = v96;
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  swift_once();
LABEL_47:
  uint64_t v87 = sub_260313458();
  __swift_project_value_buffer(v87, (uint64_t)qword_26A86B5E0);
  uint64_t v88 = v35;
  uint64_t v82 = sub_260313438();
  os_log_type_t v89 = sub_260313598();
  if (!os_log_type_enabled(v82, v89))
  {

LABEL_50:
    goto LABEL_51;
  }
  uint64_t v90 = (uint8_t *)swift_slowAlloc();
  uint64_t v91 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v90 = 138412290;
  uint64_t v92 = (void *)sub_260313288();
  v113[0] = v92;
  sub_260313628();
  *uint64_t v91 = v92;

  _os_log_impl(&dword_2602F2000, v82, v89, "Failed to clear history: %@", v90, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
  swift_arrayDestroy();
  MEMORY[0x26120CEF0](v91, -1, -1);
  MEMORY[0x26120CEF0](v90, -1, -1);

LABEL_51:
  ((void (*)(void))a5)();
}

void sub_26030F674(uint64_t (**a1)(void, void), void *a2, id a3, unint64_t a4)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v8 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v9 = (void *)sub_260313498();
  uint64_t v10 = objc_msgSend(v8, sel_initWithEntityName_, v9);

  if (qword_26A868470 != -1) {
    goto LABEL_45;
  }
  while (1)
  {
    uint64_t v11 = sub_260313458();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A86B5E0);
    uint64_t v12 = sub_260313438();
    os_log_type_t v13 = sub_260313578();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_2602F2000, v12, v13, "Attempting to delete all data", v14, 2u);
      MEMORY[0x26120CEF0](v14, -1, -1);
    }

    type metadata accessor for PersistedTranslation();
    unint64_t v15 = sub_2603135E8();
    os_log_type_t v83 = v10;
    unint64_t v84 = v15;
    unint64_t v77 = v15 >> 62;
    if (v15 >> 62) {
      break;
    }
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v16) {
      goto LABEL_30;
    }
LABEL_6:
    if (v16 < 1) {
      __break(1u);
    }
    uint64_t v17 = 0;
    id v80 = a3;
    id v81 = (id)a2[3];
    uint64_t v85 = v16;
    os_log_type_t v78 = a1;
    unint64_t v79 = a4;
    while (1)
    {
      while (1)
      {
        id v18 = (v84 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x26120C770](v17, v84)
            : *(id *)(v84 + 32 + 8 * v17);
        id v19 = v18;
        uint64_t v87 = v17 + 1;
        objc_msgSend(a1, sel_deleteObject_, v18);
        id v20 = objc_msgSend(v19, sel_targetResult);

        if (v20)
        {
          sub_260303CF4((uint64_t *)v91);
          id v86 = v19;
          uint64_t v21 = v92;
          id v22 = v93;
          __swift_project_boxed_opaque_existential_1Tm(v91, v92);
          uint64_t v23 = v21;
          id v19 = v86;
          unint64_t v24 = *(void *)(v22[3](v23, v22) + 16);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
          if (v24 >= 2)
          {
            sub_260303CF4((uint64_t *)v91);
            uint64_t v25 = v92;
            uint64_t v26 = v93;
            __swift_project_boxed_opaque_existential_1Tm(v91, v92);
            uint64_t v27 = v26[3](v25, v26);
            if (!*(void *)(v27 + 16)) {
              goto LABEL_44;
            }
            sub_2602F5268(v27 + 32, (uint64_t)v88);
            swift_bridgeObjectRelease();
            uint64_t v28 = v89;
            uint64_t v29 = v90;
            __swift_project_boxed_opaque_existential_1Tm(v88, v89);
            uint64_t v30 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v29 + 40))(v28, v29) + 16);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
            id v19 = v86;
            if (v30)
            {
              id v31 = objc_msgSend(v86, sel_requestID);
              uint64_t v32 = sub_2603134A8();
              unint64_t v34 = v33;

              swift_bridgeObjectRelease();
              uint64_t v35 = HIBYTE(v34) & 0xF;
              uint64_t v36 = v32 & 0xFFFFFFFFFFFFLL;
              id v19 = v86;
              if ((v34 & 0x2000000000000000) == 0) {
                uint64_t v35 = v36;
              }
              if (v35)
              {
                id v37 = objc_msgSend(v86, sel_interactedIndices);
                if (v37) {
                  break;
                }
              }
            }
          }
        }

        uint64_t v17 = v87;
        if (v87 == v85) {
          goto LABEL_30;
        }
      }
      uint64_t v38 = v37;
      uint64_t v39 = sub_260313528();

      id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1C1A0]), sel_init);
      id v41 = objc_msgSend(v86, sel_sessionID);
      objc_msgSend(v40, sel_setConversationID_, v41);

      id v42 = objc_msgSend(v86, sel_requestID);
      objc_msgSend(v40, sel_setRequestID_, v42);

      sub_260303CF4((uint64_t *)v91);
      a2 = v86;
      uint64_t v43 = v92;
      unint64_t v44 = v93;
      __swift_project_boxed_opaque_existential_1Tm(v91, v92);
      uint64_t v45 = v44[3](v43, v44);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      sub_26030961C(v45);
      swift_bridgeObjectRelease();
      uint64_t v46 = (void *)sub_260313518();
      swift_bridgeObjectRelease();
      id v82 = v40;
      uint64_t v47 = v40;
      uint64_t v48 = v39;
      objc_msgSend(v47, sel_setSenses_, v46);

      int64_t v49 = *(void *)(v39 + 16);
      if (v49) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_29:
      id v59 = (void *)sub_260313518();
      swift_bridgeObjectRelease();
      objc_msgSend(v82, sel_setUserInteractedSenses_, v59);

      objc_msgSend(v81, sel_log_, v82);
      uint64_t v17 = v87;
      uint64_t v10 = v83;
      if (v87 == v85) {
        goto LABEL_30;
      }
    }
    v88[0] = MEMORY[0x263F8EE78];
    a3 = v86;
    sub_2603011C0(0, v49, 0);
    uint64_t v50 = 0;
    uint64_t v10 = (void *)v88[0];
    while (1)
    {
      a4 = *(void *)(v48 + 8 * v50 + 32);
      sub_260303CF4((uint64_t *)v91);
      uint64_t v51 = v92;
      a1 = v93;
      __swift_project_boxed_opaque_existential_1Tm(v91, v92);
      uint64_t v52 = a1[3](v51, a1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      if ((a4 & 0x8000000000000000) != 0) {
        break;
      }
      if (a4 >= *(void *)(v52 + 16)) {
        goto LABEL_43;
      }
      a2 = (void *)v48;
      sub_2602F5268(v52 + 40 * a4 + 32, (uint64_t)v91);
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_26030E2A8(v91);
      uint64_t v55 = v54;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      v88[0] = v10;
      unint64_t v57 = v10[2];
      unint64_t v56 = v10[3];
      if (v57 >= v56 >> 1)
      {
        sub_2603011C0(v56 > 1, v57 + 1, 1);
        uint64_t v10 = (void *)v88[0];
      }
      ++v50;
      void v10[2] = v57 + 1;
      uint64_t v58 = &v10[2 * v57];
      v58[4] = v53;
      v58[5] = v55;
      uint64_t v48 = (uint64_t)a2;
      if (v49 == v50)
      {
        swift_bridgeObjectRelease();

        a4 = v79;
        a3 = v80;
        a1 = v78;
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_2603136F8();
  if (v16) {
    goto LABEL_6;
  }
LABEL_30:
  swift_bridgeObjectRelease();
  v91[0] = 0;
  unsigned int v60 = objc_msgSend(a1, sel_save_, v91);
  id v61 = v91[0];
  if (v60)
  {
    swift_bridgeObjectRetain();
    id v62 = v61;
    uint64_t v63 = sub_260313438();
    os_log_type_t v64 = sub_260313578();
    if (os_log_type_enabled(v63, v64))
    {
      id v65 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v65 = 134217984;
      if (v77)
      {
        swift_bridgeObjectRetain();
        int64_t v66 = (void *)sub_2603136F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        int64_t v66 = *(void **)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v91[0] = v66;
      sub_260313628();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2602F2000, v63, v64, "Deleted %ld old translations", v65, 0xCu);
      MEMORY[0x26120CEF0](v65, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    id v67 = v91[0];
    swift_bridgeObjectRelease();
    uint64_t v68 = (void *)sub_260313298();

    swift_willThrow();
    id v69 = a3;
    uint64_t v70 = v68;
    id v71 = v68;
    uint64_t v72 = sub_260313438();
    os_log_type_t v73 = sub_260313598();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = (uint8_t *)swift_slowAlloc();
      unint64_t v75 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v74 = 138412290;
      unint64_t v76 = (void *)sub_260313288();
      v91[0] = v76;
      sub_260313628();
      void *v75 = v76;

      _os_log_impl(&dword_2602F2000, v72, v73, "Failed to clear history: %@", v74, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
      swift_arrayDestroy();
      MEMORY[0x26120CEF0](v75, -1, -1);
      MEMORY[0x26120CEF0](v74, -1, -1);
    }
    else
    {
    }
    a3 = v69;
    uint64_t v10 = v83;
  }
  ((void (*)(void))a3)();
}

unint64_t sub_26031003C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A868938);
  uint64_t v2 = (void *)sub_260313708();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_2603115A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

void sub_260310158(void *a1, id a2)
{
  v37[2] = *(id *)MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a2, sel_identifier);
  uint64_t v5 = sub_2603134A8();
  uint64_t v7 = v6;

  id v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(v5, v7);
  swift_bridgeObjectRelease();
  type metadata accessor for PersistedTranslation();
  unint64_t v9 = sub_2603135E8();
  unint64_t v16 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2603136F8();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_8;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    if (qword_26A868470 == -1) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_20;
  }
LABEL_8:
  if ((v16 & 0xC000000000000001) != 0)
  {
    id v17 = (id)MEMORY[0x26120C770](0, v16);
    goto LABEL_11;
  }
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v17 = *(id *)(v16 + 32);
LABEL_11:
    id v18 = v17;
    swift_bridgeObjectRelease();
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v18);
    v37[0] = 0;
    if (!objc_msgSend(a1, sel_save_, v37))
    {
      id v28 = v37[0];
      uint64_t v29 = (void *)sub_260313298();

      swift_willThrow();
      if (qword_26A868470 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_260313458();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A86B5E0);
      id v11 = v29;
      id v8 = sub_260313438();
      os_log_type_t v12 = sub_260313598();
      if (os_log_type_enabled(v8, v12))
      {
        BOOL v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = (void *)swift_slowAlloc();
        *(_DWORD *)BOOL v13 = 138412290;
        unint64_t v15 = (void *)sub_260313288();
        v37[0] = v15;
        sub_260313628();
        *uint64_t v14 = v15;

        _os_log_impl(&dword_2602F2000, v8, v12, "Failed to favorite translation: %@", v13, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
        swift_arrayDestroy();
        MEMORY[0x26120CEF0](v14, -1, -1);
        MEMORY[0x26120CEF0](v13, -1, -1);

        return;
      }

      goto LABEL_24;
    }
    uint64_t v19 = qword_26A868470;
    id v20 = v37[0];
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_260313458();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A86B5E0);
    id v22 = v18;
    uint64_t v23 = sub_260313438();
    os_log_type_t v24 = sub_260313578();
    if (!os_log_type_enabled(v23, v24))
    {

      return;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138739971;
    v37[0] = v22;
    id v27 = v22;
    sub_260313628();
    void *v26 = v22;

    _os_log_impl(&dword_2602F2000, v23, v24, "Favorited translation: %{sensitive}@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
    swift_arrayDestroy();
    MEMORY[0x26120CEF0](v26, -1, -1);
    MEMORY[0x26120CEF0](v25, -1, -1);

LABEL_23:
LABEL_24:

    return;
  }
  __break(1u);
LABEL_30:
  swift_once();
LABEL_21:
  uint64_t v31 = sub_260313458();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A86B5E0);
  id v36 = a2;
  uint64_t v23 = sub_260313438();
  os_log_type_t v32 = sub_260313598();
  if (os_log_type_enabled(v23, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    unint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v33 = 138739971;
    v37[0] = v36;
    id v35 = v36;
    sub_260313628();
    *unint64_t v34 = v36;

    _os_log_impl(&dword_2602F2000, v23, v32, "Failed to find translation in store: %{sensitive}@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
    swift_arrayDestroy();
    MEMORY[0x26120CEF0](v34, -1, -1);
    MEMORY[0x26120CEF0](v33, -1, -1);
    goto LABEL_23;
  }
}

void sub_260310788(void *a1, id a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a2, sel_identifier);
  uint64_t v5 = sub_2603134A8();
  uint64_t v7 = v6;

  id v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(v5, v7);
  swift_bridgeObjectRelease();
  type metadata accessor for PersistedTranslation();
  unint64_t v9 = sub_2603135E8();
  unint64_t v16 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_2603136F8();
    swift_bridgeObjectRelease();
    if (v32)
    {
LABEL_8:
      if ((v16 & 0xC000000000000001) != 0)
      {
        id v17 = (id)MEMORY[0x26120C770](0, v16);
      }
      else
      {
        if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_25;
        }
        id v17 = *(id *)(v16 + 32);
      }
      uint64_t v2 = v17;
      swift_bridgeObjectRelease();
      sub_260303CF4((uint64_t *)v34);
      uint64_t v18 = v35;
      uint64_t v19 = v36;
      uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
      MEMORY[0x270FA5388](v20, v20);
      id v22 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v23 + 16))(v22);
      sub_260306D2C((uint64_t)v22, v2, v18, v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      v34[0] = 0;
      if (!objc_msgSend(a1, sel_save_, v34))
      {
        id v30 = v34[0];
        uint64_t v31 = (void *)sub_260313298();

        swift_willThrow();
        if (qword_26A868470 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_260313458();
        __swift_project_value_buffer(v10, (uint64_t)qword_26A86B5E0);
        id v11 = v31;
        id v8 = sub_260313438();
        os_log_type_t v12 = sub_260313598();
        if (os_log_type_enabled(v8, v12))
        {
          BOOL v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v14 = (void *)swift_slowAlloc();
          *(_DWORD *)BOOL v13 = 138412290;
          unint64_t v15 = (void *)sub_260313288();
          v34[0] = v15;
          sub_260313628();
          *uint64_t v14 = v15;

          _os_log_impl(&dword_2602F2000, v8, v12, "Failed to update disambiguation selection for translation: %@", v13, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8684D0);
          swift_arrayDestroy();
          MEMORY[0x26120CEF0](v14, -1, -1);
          MEMORY[0x26120CEF0](v13, -1, -1);

          return;
        }

        goto LABEL_17;
      }
      uint64_t v24 = qword_26A868470;
      id v25 = v34[0];
      if (v24 == -1)
      {
LABEL_13:
        uint64_t v26 = sub_260313458();
        __swift_project_value_buffer(v26, (uint64_t)qword_26A86B5E0);
        id v27 = sub_260313438();
        os_log_type_t v28 = sub_260313578();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v29 = 0;
          _os_log_impl(&dword_2602F2000, v27, v28, "Updated disambiguation selection for translation", v29, 2u);
          MEMORY[0x26120CEF0](v29, -1, -1);
        }

LABEL_17:
        return;
      }
LABEL_25:
      swift_once();
      goto LABEL_13;
    }
  }
  else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_8;
  }

  swift_bridgeObjectRelease();
}

uint64_t static TranslationStoreCoreData.mockTranslationLTR2LTR.getter()
{
  uint64_t v0 = sub_260313418();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  id v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for StoredTranslationResult();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StoredSpeechResult();
  id v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  uint64_t v15 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_260313378();
  unint64_t v16 = &v14[v11[10]];
  *(void *)&v14[v11[13]] = 0;
  *uint64_t v14 = 1;
  *((void *)v14 + 1) = 1000;
  v14[v11[9]] = 0;
  id v17 = &v14[v11[11]];
  *(void *)id v17 = 0x6F6C6C6548;
  *((void *)v17 + 1) = 0xE500000000000000;
  *(void *)unint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  v14[v11[12]] = 0;
  sub_260313378();
  *(void *)&v9[v6[9]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v9, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686E8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_260314C10;
  *(unsigned char *)(v18 + 32) = 0;
  *(void *)(v18 + 40) = 1634496328;
  *(void *)(v18 + 48) = 0xE400000000000000;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *(void *)(v18 + 88) = MEMORY[0x263F8EE78];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(void *)&v9[v6[7]] = v18;
  v9[v6[8]] = 1;
  id v19 = objc_msgSend(*(id *)(v15 + 16), sel_viewContext);
  uint64_t v20 = sub_260312648((uint64_t)v14, (uint64_t)v9, (uint64_t)v19, 0);

  sub_260312E30((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for StoredTranslationResult);
  uint64_t result = sub_260312E30((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StoredSpeechResult);
  if (v20)
  {
    swift_release();
    return (uint64_t)v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static TranslationStoreCoreData.mockTranslationLTR2RTL.getter()
{
  uint64_t v0 = sub_260313418();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  id v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for StoredTranslationResult();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StoredSpeechResult();
  id v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  uint64_t v15 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_260313378();
  unint64_t v16 = &v14[v11[10]];
  *(void *)&v14[v11[13]] = 0;
  *uint64_t v14 = 1;
  *((void *)v14 + 1) = 1000;
  v14[v11[9]] = 0;
  id v17 = &v14[v11[11]];
  *(void *)id v17 = 0x6F6C6C6548;
  *((void *)v17 + 1) = 0xE500000000000000;
  *(void *)unint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  v14[v11[12]] = 0;
  sub_260313378();
  *(void *)&v9[v6[9]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v9, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686E8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_260314C10;
  *(unsigned char *)(v18 + 32) = 0;
  *(void *)(v18 + 40) = 0xA8D8ADD8B1D885D9;
  *(void *)(v18 + 48) = 0xAA0000000000A7D8;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *(void *)(v18 + 88) = MEMORY[0x263F8EE78];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(void *)&v9[v6[7]] = v18;
  v9[v6[8]] = 1;
  id v19 = objc_msgSend(*(id *)(v15 + 16), sel_viewContext);
  uint64_t v20 = sub_260312648((uint64_t)v14, (uint64_t)v9, (uint64_t)v19, 0);

  sub_260312E30((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for StoredTranslationResult);
  uint64_t result = sub_260312E30((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StoredSpeechResult);
  if (v20)
  {
    swift_release();
    return (uint64_t)v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static TranslationStoreCoreData.mockTranslationRTL2LTR.getter()
{
  uint64_t v0 = sub_260313418();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  id v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for StoredTranslationResult();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StoredSpeechResult();
  id v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  uint64_t v15 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_260313378();
  uint64_t v16 = v11[10];
  *(void *)&v14[v11[13]] = 0;
  *uint64_t v14 = 1;
  *((void *)v14 + 1) = 1000;
  v14[v11[9]] = 0;
  id v17 = &v14[v16];
  uint64_t v18 = &v14[v11[11]];
  *(void *)uint64_t v18 = 0xA8D8ADD8B1D885D9;
  *((void *)v18 + 1) = 0xAA0000000000A7D8;
  *(void *)id v17 = 0;
  *((void *)v17 + 1) = 0;
  v14[v11[12]] = 0;
  sub_260313378();
  *(void *)&v9[v6[9]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v9, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8686E8);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_260314C10;
  *(unsigned char *)(v19 + 32) = 0;
  *(void *)(v19 + 40) = 0x6F6C6C6548;
  *(void *)(v19 + 48) = 0xE500000000000000;
  *(_OWORD *)(v19 + 56) = 0u;
  *(_OWORD *)(v19 + 72) = 0u;
  *(void *)(v19 + 88) = MEMORY[0x263F8EE78];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(void *)&v9[v6[7]] = v19;
  v9[v6[8]] = 1;
  id v20 = objc_msgSend(*(id *)(v15 + 16), sel_viewContext);
  uint64_t v21 = sub_260312648((uint64_t)v14, (uint64_t)v9, (uint64_t)v20, 0);

  sub_260312E30((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for StoredTranslationResult);
  uint64_t result = sub_260312E30((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StoredSpeechResult);
  if (v21)
  {
    swift_release();
    return (uint64_t)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2603115A8(uint64_t a1, uint64_t a2)
{
  sub_260313898();
  sub_2603134C8();
  uint64_t v4 = sub_2603138B8();

  return sub_260311620(a1, a2, v4);
}

unint64_t sub_260311620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_260313828() & 1) == 0)
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
      while (!v14 && (sub_260313828() & 1) == 0);
    }
  }
  return v6;
}

void *sub_260311704(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15 = objc_msgSend(*(id *)(a4 + 16), sel_viewContext);
  uint64_t v16 = sub_260311E1C(a1, a2, (uint64_t)v15, a3, a5, a6, a7, a8);

  return v16;
}

uint64_t sub_2603117A0(uint64_t a1, void *a2)
{
  uint64_t v12[3] = type metadata accessor for StoredSpeechResult();
  void v12[4] = sub_260306F24(&qword_26A8684A8, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  sub_26031303C(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for StoredSpeechResult);
  sub_260313388();
  uint64_t v5 = (void *)sub_260313498();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setSourceIdentifier_, v5);

  sub_2602F5268((uint64_t)v12, (uint64_t)v11);
  unint64_t v6 = (objc_class *)type metadata accessor for AnySpeechResult();
  id v7 = objc_allocWithZone(v6);
  sub_2602F5268((uint64_t)v11, (uint64_t)v7 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  objc_msgSend(a2, sel_setSourceInput_, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_2603118F8(uint64_t a1, void *a2)
{
  uint64_t v12[3] = type metadata accessor for StoredTranslationResult();
  void v12[4] = sub_260306F24(&qword_26A868858, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  sub_26031303C(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for StoredTranslationResult);
  sub_260313388();
  uint64_t v5 = (void *)sub_260313498();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTargetIdentifier_, v5);

  sub_2602F5268((uint64_t)v12, (uint64_t)v11);
  unint64_t v6 = (objc_class *)type metadata accessor for AnyTranslationResult();
  id v7 = objc_allocWithZone(v6);
  sub_2602F5268((uint64_t)v11, (uint64_t)v7 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  objc_msgSend(a2, sel_setTargetResult_, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

void _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(void *a1)
{
  uint64_t v2 = sub_260313338();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  MEMORY[0x270FA5388](v7 - 8, v8);
  objc_super v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a1, sel_favoriteDate);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_260313318();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v6, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v10, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) != 1)
    {
      sub_260307704((uint64_t)v10, &qword_26A868888);
      objc_msgSend(a1, sel_setFavoriteDate_, 0);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, 1, 1, v2);
  }
  sub_260307704((uint64_t)v10, &qword_26A868888);
  sub_260313328();
  uint64_t v13 = (void *)sub_260313308();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(a1, sel_setFavoriteDate_, v13);

  BOOL v14 = (void *)sub_260313498();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A868920);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260314C10;
  *(void *)(inited + 32) = 0x6D614E746E657665;
  *(void *)(inited + 40) = 0xE900000000000065;
  sub_2602FE590(0, &qword_26A868928);
  *(void *)(inited + 48) = sub_260313608();
  sub_26031003C(inited);
  sub_2602FE590(0, &qword_26A868930);
  uint64_t v16 = (void *)sub_260313478();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

void sub_260311D6C(void *a1)
{
  sub_260310158(a1, *(id *)(v1 + 16));
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

uint64_t sub_260311D8C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_260311DC4(void *a1)
{
  sub_260310788(a1, *(id *)(v1 + 16));
}

uint64_t sub_260311DD0(uint64_t a1)
{
  return sub_260312F78(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_26030E574);
}

uint64_t sub_260311DF0(uint64_t a1)
{
  return sub_260312F78(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_26030E8F4);
}

void sub_260311E10(uint64_t (**a1)(void, void))
{
  sub_26030F674(a1, *(void **)(v1 + 16), *(id *)(v1 + 24), *(void *)(v1 + 32));
}

void *sub_260311E1C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v65 = a4;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  MEMORY[0x270FA5388](v15 - 8, v16);
  os_log_type_t v64 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_260313338();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63, v18);
  id v59 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_260313368();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20, v22);
  uint64_t v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71[3] = a5;
  v71[4] = a7;
  uint64_t v60 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v71);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
  v70[3] = a6;
  v70[4] = a8;
  uint64_t v62 = a8;
  uint64_t v26 = __swift_allocate_boxed_opaque_existential_1(v70);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v26, a2, a6);
  id v27 = self;
  os_log_type_t v28 = (void *)sub_260313498();
  id v29 = objc_msgSend(v27, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v28, a3);

  type metadata accessor for PersistedTranslation();
  uint64_t v30 = swift_dynamicCastClass();
  if (v30)
  {
    uint64_t v31 = (void *)v30;
    id v58 = v29;
    sub_260313358();
    sub_260313348();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    uint64_t v32 = (void *)sub_260313498();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_setIdentifier_, v32);

    unint64_t v33 = v59;
    sub_260313328();
    unint64_t v34 = (void *)sub_260313308();
    uint64_t v35 = v61;
    uint64_t v36 = v63;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v63);
    objc_msgSend(v31, sel_setCreationDate_, v34);

    sub_2602F5268((uint64_t)v71, (uint64_t)v68);
    uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v68, v69);
    MEMORY[0x270FA5388](v37, v37);
    uint64_t v39 = (char *)&v58 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v40 + 16))(v39);
    sub_260306B34((uint64_t)v39, v31, a5, v60);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    sub_2602F5268((uint64_t)v70, (uint64_t)v68);
    uint64_t v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v68, v69);
    MEMORY[0x270FA5388](v41, v41);
    uint64_t v43 = (char *)&v58 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v44 + 16))(v43);
    sub_260306D2C((uint64_t)v43, v31, a6, v62);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    sub_26030478C();
    uint64_t v45 = (void *)sub_260313518();
    objc_msgSend(v31, sel_setInteractedIndices_, v45);

    id v46 = objc_msgSend(v31, sel_favoriteDate);
    if (v46)
    {
      uint64_t v47 = v46;
      sub_260313318();

      uint64_t v48 = (uint64_t)v64;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v64, v33, v36);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v48, 0, 1, v36);
      LODWORD(v47) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v48, 1, v36) != 1;
      sub_260307704(v48, &qword_26A868888);
      if (v47 == (v65 & 1))
      {
LABEL_5:

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v56 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v64, 1, 1, v36);
      sub_260307704(v56, &qword_26A868888);
      if ((v65 & 1) == 0) {
        goto LABEL_5;
      }
    }
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v31);
    goto LABEL_5;
  }
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_260313458();
  __swift_project_value_buffer(v49, (uint64_t)qword_26A86B5E0);
  sub_2602F5268((uint64_t)v70, (uint64_t)v68);
  uint64_t v50 = sub_260313438();
  os_log_type_t v51 = sub_260313598();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v67 = v53;
    *(_DWORD *)uint64_t v52 = 136642819;
    sub_2602F5268((uint64_t)v68, (uint64_t)v66);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868910);
    uint64_t v54 = sub_2603134B8();
    v66[0] = sub_2603058A4(v54, v55, &v67);
    sub_260313628();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    _os_log_impl(&dword_2602F2000, v50, v51, "Failed to insert translation %{sensitive}s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26120CEF0](v53, -1, -1);
    MEMORY[0x26120CEF0](v52, -1, -1);
  }
  else
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  }

  uint64_t v31 = 0;
LABEL_14:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
  return v31;
}

uint64_t type metadata accessor for TranslationStoreCoreData()
{
  return self;
}

void *sub_260312648(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v53 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A868888);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v52 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_260313338();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  BOOL v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_260313368();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59[3] = type metadata accessor for StoredSpeechResult();
  v59[4] = sub_260306F24(&qword_26A8684A8, (void (*)(uint64_t))type metadata accessor for StoredSpeechResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v59);
  sub_260312FD4(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for StoredSpeechResult);
  v58[3] = type metadata accessor for StoredTranslationResult();
  v58[4] = sub_260306F24(&qword_26A868858, (void (*)(uint64_t))type metadata accessor for StoredTranslationResult);
  uint64_t v21 = __swift_allocate_boxed_opaque_existential_1(v58);
  sub_260312FD4(a2, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for StoredTranslationResult);
  uint64_t v22 = self;
  uint64_t v23 = (void *)sub_260313498();
  id v24 = objc_msgSend(v22, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v23, a3);

  type metadata accessor for PersistedTranslation();
  uint64_t v25 = swift_dynamicCastClass();
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    id v27 = v24;
    sub_260313358();
    sub_260313348();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    os_log_type_t v28 = (void *)sub_260313498();
    swift_bridgeObjectRelease();
    objc_msgSend(v26, sel_setIdentifier_, v28);

    sub_260313328();
    id v29 = (void *)sub_260313308();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    objc_msgSend(v26, sel_setCreationDate_, v29);

    sub_2602F5268((uint64_t)v59, (uint64_t)v56);
    uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v57);
    MEMORY[0x270FA5388](v30, v30);
    uint64_t v32 = (char *)&v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v33 + 16))(v32);
    sub_2603117A0((uint64_t)v32, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    sub_2602F5268((uint64_t)v58, (uint64_t)v56);
    uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v57);
    MEMORY[0x270FA5388](v34, v34);
    uint64_t v36 = (char *)&v52 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v37 + 16))(v36);
    sub_2603118F8((uint64_t)v36, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    sub_26030478C();
    uint64_t v38 = (void *)sub_260313518();
    objc_msgSend(v26, sel_setInteractedIndices_, v38);

    id v39 = objc_msgSend(v26, sel_favoriteDate);
    if (v39)
    {
      uint64_t v40 = v39;
      sub_260313318();

      uint64_t v41 = (uint64_t)v52;
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v52, v14, v10);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v41, 0, 1, v10);
      BOOL v42 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v41, 1, v10) != 1;
      sub_260307704(v41, &qword_26A868888);
      if (v42 == (v53 & 1))
      {
LABEL_5:

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v50 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v52, 1, 1, v10);
      sub_260307704(v50, &qword_26A868888);
      if ((v53 & 1) == 0) {
        goto LABEL_5;
      }
    }
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v26);
    goto LABEL_5;
  }
  if (qword_26A868470 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_260313458();
  __swift_project_value_buffer(v43, (uint64_t)qword_26A86B5E0);
  sub_2602F5268((uint64_t)v58, (uint64_t)v56);
  uint64_t v44 = sub_260313438();
  os_log_type_t v45 = sub_260313598();
  if (os_log_type_enabled(v44, v45))
  {
    id v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v55 = v47;
    *(_DWORD *)id v46 = 136642819;
    sub_2602F5268((uint64_t)v56, (uint64_t)v54);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A868910);
    uint64_t v48 = sub_2603134B8();
    v54[0] = sub_2603058A4(v48, v49, &v55);
    sub_260313628();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    _os_log_impl(&dword_2602F2000, v44, v45, "Failed to insert translation %{sensitive}s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26120CEF0](v47, -1, -1);
    MEMORY[0x26120CEF0](v46, -1, -1);
  }
  else
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  }

  uint64_t v26 = 0;
LABEL_14:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  return v26;
}

uint64_t sub_260312E30(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t method lookup function for TranslationStoreCoreData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TranslationStoreCoreData);
}

uint64_t dispatch thunk of TranslationStoreCoreData.__allocating_init(inMemoryOnly:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of TranslationStoreCoreData.viewContext.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t objectdestroy_34Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t objectdestroy_8Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_260312F78(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260312FD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_26031303C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_2603130A4(void *a1, uint64_t a2)
{
  sub_26030A744(a1, a2, v2);
}

uint64_t sub_2603130AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A868950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_260313114(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2603131F8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_260313208()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_260313218()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_260313228()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_260313238()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_260313248()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_260313258()
{
  return MEMORY[0x270EEEF88]();
}

uint64_t sub_260313268()
{
  return MEMORY[0x270EEEFE8]();
}

uint64_t sub_260313278()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_260313288()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_260313298()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2603132A8()
{
  return MEMORY[0x270EEFCE8]();
}

uint64_t sub_2603132B8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2603132C8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2603132D8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2603132E8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2603132F8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_260313308()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_260313318()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_260313328()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_260313338()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_260313348()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_260313358()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_260313368()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_260313378()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_260313388()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_260313398()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_2603133A8()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_2603133B8()
{
  return MEMORY[0x270EF0E40]();
}

uint64_t sub_2603133C8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2603133D8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2603133E8()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_2603133F8()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_260313408()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_260313418()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_260313428()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_260313438()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_260313448()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_260313458()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_260313468()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_260313478()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_260313488()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_260313498()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2603134A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2603134B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2603134C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2603134D8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2603134E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2603134F8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_260313508()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_260313518()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_260313528()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_260313538()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_260313548()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_260313558()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_260313568()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_260313578()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_260313588()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_260313598()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2603135A8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2603135B8()
{
  return MEMORY[0x270EE41D8]();
}

uint64_t sub_2603135C8()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_2603135D8()
{
  return MEMORY[0x270EE4230]();
}

uint64_t sub_2603135E8()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_2603135F8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_260313608()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_260313618()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_260313628()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_260313638()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_260313648()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_260313658()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_260313668()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_260313678()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_260313688()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_260313698()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2603136A8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2603136B8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2603136C8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2603136D8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2603136E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2603136F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_260313708()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_260313718()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_260313728()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_260313738()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_260313748()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_260313758()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_260313768()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_260313778()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_260313788()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_260313798()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2603137A8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2603137B8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2603137C8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2603137D8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2603137E8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2603137F8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_260313808()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_260313818()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_260313828()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260313838()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_260313848()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_260313858()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260313868()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260313878()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260313888()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260313898()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2603138A8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2603138B8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2603138C8()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_2603138D8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2603138E8()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_2603138F8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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