void __swiftcall WordPieceTokenizer.init()(TextUnderstandingShared::WordPieceTokenizer_optional *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  TextUnderstandingShared::WordPieceTokenizer_optional *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  sub_25F5974C0();
  sub_25F572840();
  v2 = v1;
  MEMORY[0x270FA5388]();
  sub_25F572860();
  sub_25F572148(0, (unint64_t *)&qword_26A7AA810);
  v3 = sub_25F570EDC();
  if (v3
    && (v4 = sub_25F57208C(0x6365697064726F77, 0xEE006261636F7665, 1701409396, 0xE400000000000000, v3), v5))
  {
    WordPieceTokenizer.init(path:)(v6, *(Swift::String *)&v4);
    v8 = v7;
    v9 = v7;

    if (v8) {
  }
    }
  else
  {
    sub_25F5974B0();
    v10 = sub_25F5974A0();
    v11 = sub_25F597830();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_25F56F000, v10, v11, "Could not find file wordpiecevocab.trie", v12, 2u);
      MEMORY[0x2611F77E0](v12, -1, -1);
    }

    (*(void (**)())(v2 + 8))();
  }
}

id sub_25F570EDC()
{
  v0 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v0);

  return v1;
}

void __swiftcall WordPieceTokenizer.init(path:)(TextUnderstandingShared::WordPieceTokenizer_optional *__return_ptr retstr, Swift::String path)
{
  object = path._object;
  uint64_t countAndFlagsBits = path._countAndFlagsBits;
  sub_25F5974C0();
  sub_25F572840();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  sub_25F572860();
  sub_25F572148(0, (unint64_t *)&unk_26A7AA818);
  swift_bridgeObjectRetain();
  id v6 = sub_25F571178();
  if (v6)
  {
    v7 = v6;
    swift_bridgeObjectRelease();
    objc_msgSend(objc_allocWithZone((Class)WordPieceTokenizerObjc), sel_initWithVocab_, v7);
  }
  else
  {
    sub_25F5974B0();
    swift_bridgeObjectRetain();
    v8 = sub_25F5974A0();
    os_log_type_t v9 = sub_25F597830();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_25F5718D4(countAndFlagsBits, (unint64_t)object, &v12);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v8, v9, "Could not create burst trie dictionary for path %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F77E0](v11, -1, -1);
      MEMORY[0x2611F77E0](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)())(v5 + 8))();
  }
}

id sub_25F571178()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

void __swiftcall WordPieceTokenizer.encode(text:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, Swift::String text)
{
  v3 = v2;
  v16.tokenIds._rawValue = (void *)sub_25F597640();
  v16.attentionMask._rawValue = v5;
  unint64_t v15 = sub_25F572184();
  uint64_t v14 = MEMORY[0x263F8D310];
  id v6 = (NSData *)sub_25F5979F0();
  v8 = v7;
  swift_bridgeObjectRelease();
  os_log_type_t v9 = (void *)sub_25F5975C0();
  v10 = (objc_class *)objc_msgSend(v3, sel_tokenize_withLength_, v9, 512, v14, v15, v15, v15, 32, 0xE100000000000000, 10, 0xE100000000000000);

  objc_msgSend(v3, sel_padId);
  v17.super.isa = v10;
  v17._tokenIds = v6;
  v17._tokenRanges = v8;
  TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(&v16, v17, v12, v11);
  long long v13 = *(_OWORD *)&v16.tokenizerWordRangesUTF8._rawValue;
  *(_OWORD *)&retstr->tokenIds._rawValue = *(_OWORD *)&v16.tokenIds._rawValue;
  *(_OWORD *)&retstr->tokenizerWordRangesUTF8._rawValue = v13;
  retstr->processedInput = v16.processedInput;
}

uint64_t variable initialization expression of TUSLazyPurgeable.item@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25F5721D0(a2, 1, 1, a1);
}

uint64_t variable initialization expression of TUSTrialNamespaceManager._assets@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for TUSTrialAssets();
  return sub_25F5721D0(a1, 1, 1, v2);
}

double variable initialization expression of TUSTrialNamespaceManager.minimumSecondsBetweenForcedRefresh()
{
  return 86400.0;
}

uint64_t sub_25F571374()
{
  return sub_25F57273C(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_25F5713A4(uint64_t a1, id *a2)
{
  return sub_25F57277C(a1, a2);
}

uint64_t sub_25F5713BC(uint64_t a1, id *a2)
{
  return sub_25F5726BC(a1, a2) & 1;
}

uint64_t sub_25F5713D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F5727F4();
  *a1 = result;
  return result;
}

uint64_t sub_25F571400()
{
  return sub_25F578BFC();
}

uint64_t sub_25F57140C()
{
  return sub_25F57273C(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_25F57143C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_25F5975F0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F57147C()
{
  return sub_25F571484();
}

uint64_t sub_25F571484()
{
  sub_25F5975F0();
  sub_25F597670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F5714D8()
{
  return sub_25F5714E0();
}

uint64_t sub_25F5714E0()
{
  sub_25F5975F0();
  sub_25F597D90();
  sub_25F597670();
  uint64_t v0 = sub_25F597DB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25F571554()
{
  return sub_25F57143C(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_25F571588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F58667C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25F5715B4(void *a1, void *a2)
{
  return sub_25F581388(*a1, *a2);
}

uint64_t sub_25F5715C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F5717AC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25F5715EC(uint64_t a1)
{
  uint64_t v2 = sub_25F57232C(&qword_26A7AA918, type metadata accessor for NLLanguage);
  uint64_t v3 = sub_25F57232C((unint64_t *)&unk_26A7AA920, type metadata accessor for NLLanguage);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F5716A8(uint64_t a1)
{
  uint64_t v2 = sub_25F57232C(&qword_26A7AA8D0, type metadata accessor for NLTag);
  uint64_t v3 = sub_25F57232C(&qword_26A7AA8D8, type metadata accessor for NLTag);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F571764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25F5975C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25F5717B0(uint64_t a1)
{
  uint64_t v2 = sub_25F57232C(&qword_26A7AA8E0, type metadata accessor for NLTagScheme);
  uint64_t v3 = sub_25F57232C((unint64_t *)&unk_26A7AA8E8, type metadata accessor for NLTagScheme);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25F57186C()
{
  return sub_25F57143C(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_25F57189C()
{
  return sub_25F571484();
}

uint64_t sub_25F5718B8()
{
  return sub_25F5714E0();
}

uint64_t sub_25F5718D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25F5719A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25F5724E4((uint64_t)v12, *a3);
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
      sub_25F5724E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_25F572494((uint64_t)v12);
  return v7;
}

uint64_t sub_25F5719A8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25F571B00((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25F597990();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25F571BD8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25F597AB0();
    if (!v8)
    {
      uint64_t result = sub_25F597B10();
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

void *sub_25F571B00(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25F597B60();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25F571BD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25F571C70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25F571E4C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25F571E4C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25F571C70(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25F5976E0();
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
  unint64_t v3 = sub_25F571DE4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25F597AA0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25F597B60();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25F597B10();
  __break(1u);
  return result;
}

void *sub_25F571DE4(uint64_t a1, uint64_t a2)
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
  sub_25F572540(&qword_26B399D00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25F571E4C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25F572540(&qword_26B399D00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  Swift::Float v12 = v10 + 32;
  long long v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25F571FFC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25F571F24(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25F571F24(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25F597B60();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25F571FFC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25F597B60();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25F57208C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v6 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  int64_t v7 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  if (!v8) {
    return 0;
  }
  uint64_t v9 = sub_25F5975F0();

  return v9;
}

uint64_t sub_25F572148(uint64_t a1, unint64_t *a2)
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

unint64_t sub_25F572184()
{
  unint64_t result = qword_26B399E90;
  if (!qword_26B399E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399E90);
  }
  return result;
}

uint64_t sub_25F5721D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for WordPieceTokenizer()
{
  return &type metadata for WordPieceTokenizer;
}

__n128 initializeWithTake for CaptionPhraseResolver(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25F572218(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F572238(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for NLTag(uint64_t a1)
{
}

void type metadata accessor for NLTagScheme(uint64_t a1)
{
}

uint64_t sub_25F57229C()
{
  return sub_25F57232C(&qword_26A7AA8A0, type metadata accessor for NLTagScheme);
}

uint64_t sub_25F5722E4()
{
  return sub_25F57232C(&qword_26A7AA8A8, type metadata accessor for NLTagScheme);
}

uint64_t sub_25F57232C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F572374()
{
  return sub_25F57232C(&qword_26A7AA8B0, type metadata accessor for NLTagScheme);
}

uint64_t sub_25F5723BC()
{
  return sub_25F57232C(&qword_26A7AA8B8, type metadata accessor for NLTag);
}

uint64_t sub_25F572404()
{
  return sub_25F57232C(&qword_26A7AA8C0, type metadata accessor for NLTag);
}

uint64_t sub_25F57244C()
{
  return sub_25F57232C(&qword_26A7AA8C8, type metadata accessor for NLTag);
}

uint64_t sub_25F572494(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25F5724E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25F572540(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for NLLanguage(uint64_t a1)
{
}

void sub_25F57259C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25F5725E4()
{
  return sub_25F57232C(&qword_26A7AA900, type metadata accessor for NLLanguage);
}

uint64_t sub_25F57262C()
{
  return sub_25F57232C(&qword_26A7AA908, type metadata accessor for NLLanguage);
}

uint64_t sub_25F572674()
{
  return sub_25F57232C(&qword_26A7AA910, type metadata accessor for NLLanguage);
}

uint64_t sub_25F5726BC(uint64_t a1, id *a2)
{
  char v3 = sub_25F5975E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25F57273C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_25F5975F0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F57277C(uint64_t a1, id *a2)
{
  uint64_t result = sub_25F5975D0();
  *a2 = 0;
  return result;
}

uint64_t sub_25F5727F4()
{
  sub_25F5975F0();
  uint64_t v0 = sub_25F5975C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _s23TextUnderstandingShared16TUSLazyPurgeableC20memoryPressureSource33_23E893CDD6FF4AEAB8785C76C20CF5F1LLSo33OS_dispatch_source_memorypressure_pSgvpfi_0()
{
  return 0;
}

uint64_t static HardwareDetection.isMac()()
{
  return 0;
}

uint64_t static HardwareDetection.isH13ANE()()
{
  uint64_t v0 = self;
  if (!objc_msgSend(v0, sel_hasANE)) {
    goto LABEL_13;
  }
  id v1 = objc_msgSend(v0, sel_aneSubType);
  uint64_t v2 = sub_25F5975F0();
  uint64_t v4 = v3;

  BOOL v5 = v2 == 3223912 && v4 == 0xE300000000000000;
  if (v5 || (sub_25F597C50() & 1) != 0 || (v2 == 3289448 ? (BOOL v6 = v4 == 0xE300000000000000) : (BOOL v6 = 0), v6))
  {
    swift_bridgeObjectRelease();
LABEL_13:
    char v8 = 0;
    return v8 & 1;
  }
  char v7 = sub_25F597C50();
  swift_bridgeObjectRelease();
  char v8 = v7 ^ 1;
  return v8 & 1;
}

uint64_t static HardwareDetection.isSmolBERToCapable()()
{
  return 0;
}

ValueMetadata *type metadata accessor for HardwareDetection()
{
  return &type metadata for HardwareDetection;
}

uint64_t sub_25F57299C()
{
  uint64_t v26 = sub_25F5974C0();
  uint64_t v0 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = static LanguageDetection.userLanguages()();
  uint64_t v4 = sub_25F5786EC(v3);
  swift_bridgeObjectRelease();
  uint64_t v28 = MEMORY[0x263F8EE88];
  uint64_t v5 = v4[2];
  if (!v5)
  {
    swift_release();
    char v7 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  v25 = (void (**)(char *, uint64_t))(v0 + 8);
  swift_bridgeObjectRetain();
  v24 = v4;
  BOOL v6 = v4 + 5;
  char v7 = (char *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v9 = *(v6 - 1);
    uint64_t v8 = *v6;
    swift_bridgeObjectRetain();
    if (sub_25F597690() <= 1)
    {
      sub_25F5974B0();
      uint64_t v10 = sub_25F5974A0();
      os_log_type_t v11 = sub_25F597830();
      if (os_log_type_enabled(v10, v11))
      {
        Swift::Float v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::Float v12 = 0;
        _os_log_impl(&dword_25F56F000, v10, v11, "Locale used for language tag determination is not the right length", v12, 2u);
        MEMORY[0x2611F77E0](v12, -1, -1);
      }

      (*v25)(v2, v26);
      goto LABEL_9;
    }
    uint64_t v13 = static LanguageDetection.languageForLocaleIdentifier(_:)();
    uint64_t v15 = v14;
    uint64_t v16 = v28;
    swift_bridgeObjectRetain();
    char v17 = sub_25F573498(v13, v15, v16);
    swift_bridgeObjectRelease();
    if (v17)
    {
      swift_bridgeObjectRetain();
      sub_25F577AF0(&v27, v13, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25F577AF0(&v27, v13, v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v7 = sub_25F576724(0, *((void *)v7 + 2) + 1, 1, (uint64_t)v7);
    }
    unint64_t v19 = *((void *)v7 + 2);
    unint64_t v18 = *((void *)v7 + 3);
    if (v19 >= v18 >> 1) {
      char v7 = sub_25F576724((char *)(v18 > 1), v19 + 1, 1, (uint64_t)v7);
    }
    *((void *)v7 + 2) = v19 + 1;
    v20 = &v7[32 * v19];
    *((void *)v20 + 4) = v13;
    *((void *)v20 + 5) = v15;
    *((void *)v20 + 6) = v9;
    *((void *)v20 + 7) = v8;
LABEL_15:
    v6 += 2;
    --v5;
  }
  while (v5);
  swift_release_n();
LABEL_18:
  uint64_t v21 = sub_25F5735D0((uint64_t)v7);
  sub_25F572540(&qword_26B399C88);
  swift_allocObject();
  uint64_t v22 = sub_25F5766D4(50);
  uint64_t result = swift_bridgeObjectRelease();
  static LocaleDetection.shared = 0;
  unk_26B399F70 = v22;
  qword_26B399F78 = v21;
  return result;
}

void LocaleDetection.init(languageLimit:preferredLocales:)()
{
  sub_25F57957C();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  sub_25F5974C0();
  MEMORY[0x270FA5388]();
  uint64_t v22 = MEMORY[0x263F8EE88];
  uint64_t v4 = *(void *)(v1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = (uint64_t *)(v1 + 40);
  uint64_t v21 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v7 = *(v5 - 1);
    uint64_t v6 = *v5;
    if (!v3 || *(void *)(v22 + 16) < v3)
    {
      swift_bridgeObjectRetain();
      if (sub_25F597690() <= 1)
      {
        sub_25F5974B0();
        uint64_t v8 = sub_25F5974A0();
        os_log_type_t v9 = sub_25F597830();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v10 = (uint8_t *)sub_25F579648();
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl(&dword_25F56F000, v8, v9, "Locale used for language tag determination is not the right length", v10, 2u);
          sub_25F5791D8();
        }

        sub_25F579404();
        v11();
        goto LABEL_11;
      }
      uint64_t v12 = static LanguageDetection.languageForLocaleIdentifier(_:)();
      uint64_t v14 = v13;
      swift_bridgeObjectRetain();
      char v15 = sub_25F573498(v12, v14, v22);
      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_bridgeObjectRetain();
        sub_25F5795DC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_25F5795DC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v16 = (char *)v21;
      }
      else {
        uint64_t v16 = sub_25F576724(0, *(void *)(v21 + 16) + 1, 1, v21);
      }
      unint64_t v18 = *((void *)v16 + 2);
      unint64_t v17 = *((void *)v16 + 3);
      if (v18 >= v17 >> 1) {
        uint64_t v16 = sub_25F576724((char *)(v17 > 1), v18 + 1, 1, (uint64_t)v16);
      }
      *((void *)v16 + 2) = v18 + 1;
      uint64_t v21 = (uint64_t)v16;
      unint64_t v19 = &v16[32 * v18];
      *((void *)v19 + 4) = v12;
      *((void *)v19 + 5) = v14;
      *((void *)v19 + 6) = v7;
      *((void *)v19 + 7) = v6;
    }
LABEL_17:
    v5 += 2;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease_n();
  uint64_t v20 = v21;
LABEL_21:
  sub_25F5735D0(v20);
  sub_25F572540(&qword_26B399C88);
  swift_allocObject();
  sub_25F5766D4(50);
  swift_bridgeObjectRelease();
  sub_25F5794FC();
}

uint64_t *LocaleDetection.shared.unsafeMutableAddressor()
{
  if (qword_26B399B50 != -1) {
    swift_once();
  }
  return &static LocaleDetection.shared;
}

uint64_t static LocaleDetection.shared.getter()
{
  if (qword_26B399B50 != -1) {
    swift_once();
  }
  uint64_t v0 = static LocaleDetection.shared;
  swift_retain();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t LocaleDetection.preferredLocales.getter()
{
  return swift_bridgeObjectRetain();
}

void static LocaleDetection.isLanguageMismatched(forIdentifier:otherIdentifier:)()
{
  sub_25F57957C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_25F5974C0();
  sub_25F5791BC();
  MEMORY[0x270FA5388]();
  sub_25F5794EC();
  if (sub_25F597690() >= 2 && (sub_25F579420(), sub_25F597690() >= 2))
  {
    uint64_t v13 = static LanguageDetection.languageForLocaleIdentifier(_:)();
    uint64_t v15 = v14;
    sub_25F579420();
    if (v13 == static LanguageDetection.languageForLocaleIdentifier(_:)() && v15 == v16)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      sub_25F597C50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_25F5974B0();
    uint64_t v8 = sub_25F5974A0();
    os_log_type_t v9 = sub_25F597830();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)sub_25F579648();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25F56F000, v8, v9, "Provided locale identifiers for comparison are not the expected length", v10, 2u);
      sub_25F5791D8();
    }

    sub_25F579330();
    v11();
    if (v7 != v3 || v5 != v1) {
      sub_25F597C50();
    }
  }
  sub_25F5794FC();
}

uint64_t static LocaleDetection.languageTag(forLocaleIdentifier:)(uint64_t a1, char a2)
{
  LOBYTE(v2) = a2;
  sub_25F5974C0();
  sub_25F5791BC();
  MEMORY[0x270FA5388]();
  sub_25F5794EC();
  sub_25F572184();
  if (sub_25F597A20())
  {
    uint64_t result = sub_25F5979B0();
    if (!*(void *)(result + 16))
    {
      __break(1u);
      return result;
    }
    uint64_t v2 = *(void *)(result + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (sub_25F597690() >= 2)
  {
    uint64_t v9 = static LanguageDetection.languageForLocaleIdentifier(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25F5974B0();
    uint64_t v4 = sub_25F5974A0();
    os_log_type_t v5 = sub_25F597830();
    if (sub_25F5793CC(v5))
    {
      uint64_t v6 = (uint8_t *)sub_25F579648();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25F56F000, v4, (os_log_type_t)v2, "Adjusted locale identifier used language tag determination is not the right length", v6, 2u);
      sub_25F5791D8();
    }

    uint64_t v7 = sub_25F579420();
    v8(v7);
    return 0;
  }
  return v9;
}

uint64_t sub_25F573498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25F597D90();
    sub_25F597670();
    uint64_t v6 = sub_25F597DB0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      os_log_type_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25F597C50() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25F597C50() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_25F5735D0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_25F572540(&qword_26B399CE8);
    uint64_t v1 = sub_25F597B50();
  }
  else
  {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_25F5774E0(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

Swift::Bool __swiftcall LocaleDetection.isLanguageMismatched(forMessage:localeIdentifier:)(Swift::String forMessage, Swift::String localeIdentifier)
{
  sub_25F57957C();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_25F5974C0();
  sub_25F5791BC();
  uint64_t v48 = v12;
  uint64_t v49 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v46 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = sub_25F573AD8(v11, v9, 0, v3);
  if (v21)
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    static LocaleDetection.languageTag(forLocaleIdentifier:)(v7, v5);
    unint64_t v25 = v24;
    sub_25F5796C8();
    if (v27)
    {
      uint64_t v28 = v26;
      sub_25F5974B0();
      swift_bridgeObjectRetain_n();
      sub_25F5795FC();
      v29 = sub_25F5974A0();
      os_log_type_t v30 = sub_25F597820();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        uint64_t v47 = sub_25F579370();
        uint64_t v51 = v47;
        *(_DWORD *)uint64_t v31 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_25F5718D4(v22, v23, &v51);
        sub_25F597980();
        sub_25F579444();
        *(_WORD *)(v31 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_25F5718D4(v28, v25, &v51);
        sub_25F597980();
        sub_25F579318();
        _os_log_impl(&dword_25F56F000, v29, v30, "Detected language for isLanguageMismatchedForMessage:withLocaleIdentifier: is %s, and language tag for comparison is %s.", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      else
      {

        sub_25F579300();
        sub_25F57942C();
      }
      sub_25F579404();
      v43();
      if (v22 != v28 || v23 != v25) {
        sub_25F597C50();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25F5974B0();
      swift_bridgeObjectRetain_n();
      v35 = (void *)sub_25F5974A0();
      os_log_type_t v36 = sub_25F597820();
      BOOL v37 = sub_25F5793CC(v36);
      uint64_t v38 = v48;
      if (v37)
      {
        v39 = (_DWORD *)sub_25F579258();
        uint64_t v51 = sub_25F579220();
        _DWORD *v39 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v40 = sub_25F5718D4(v7, v5, &v51);
        sub_25F5796B4(v40);
        sub_25F597980();
        swift_bridgeObjectRelease_n();
        sub_25F579628(&dword_25F56F000, v41, v42, "Unable to get language tag for localeIdentifier %s");
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v19, v38);
    }
  }
  else
  {
    sub_25F5974B0();
    v32 = sub_25F5974A0();
    os_log_type_t v33 = sub_25F597820();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)sub_25F579648();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_25F56F000, v32, v33, "Could not detect language for isLanguageMismatchedForMessage:withLocaleIdentifier: with sufficiently high confidence.", v34, 2u);
      sub_25F5791D8();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v48);
  }
  sub_25F5794FC();
  return result;
}

uint64_t sub_25F573AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v91 = a2;
  uint64_t v92 = a4;
  uint64_t v90 = a1;
  uint64_t v96 = sub_25F5974C0();
  uint64_t v5 = *(void *)(v96 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v87 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v93 = (char *)&v86 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v86 - v11;
  MEMORY[0x270FA5388](v10);
  if (a3) {
    uint64_t v14 = a3;
  }
  else {
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(v14 + 16);
  v94 = v12;
  if (v15)
  {
    v97 = (char *)&v86 - v13;
    uint64_t v89 = v5;
    v95 = (void (**)(char *, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25F572184();
    uint64_t v88 = v14;
    uint64_t v16 = (uint64_t *)(v14 + 40);
    uint64_t v17 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v19 = *(v16 - 1);
      uint64_t v18 = *v16;
      v100 = (char *)v19;
      uint64_t v101 = v18;
      uint64_t v98 = 64;
      unint64_t v99 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      if (sub_25F597A20())
      {
        v100 = (char *)v19;
        uint64_t v101 = v18;
        uint64_t v98 = 64;
        unint64_t v99 = 0xE100000000000000;
        uint64_t result = sub_25F5979B0();
        if (!*(void *)(result + 16))
        {
          __break(1u);
          goto LABEL_59;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      if (sub_25F597690() > 1)
      {
        uint64_t v25 = static LanguageDetection.languageForLocaleIdentifier(_:)();
        unint64_t v26 = v27;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v21 = v97;
        sub_25F5974B0();
        uint64_t v22 = sub_25F5974A0();
        os_log_type_t v23 = sub_25F597830();
        if (os_log_type_enabled(v22, v23))
        {
          unint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v24 = 0;
          _os_log_impl(&dword_25F56F000, v22, v23, "Adjusted locale identifier used language tag determination is not the right length", v24, 2u);
          unint64_t v21 = v97;
          MEMORY[0x2611F77E0](v24, -1, -1);
        }

        (*v95)(v21, v96);
        uint64_t v25 = 0;
        unint64_t v26 = 0xE000000000000000;
      }
      if ((v26 & 0x2000000000000000) != 0) {
        uint64_t v28 = HIBYTE(v26) & 0xF;
      }
      else {
        uint64_t v28 = v25 & 0xFFFFFFFFFFFFLL;
      }
      swift_bridgeObjectRelease();
      if (v28)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25F576814(0, *(void *)(v17 + 16) + 1, 1, v17);
          uint64_t v17 = v32;
        }
        unint64_t v30 = *(void *)(v17 + 16);
        unint64_t v29 = *(void *)(v17 + 24);
        if (v30 >= v29 >> 1)
        {
          sub_25F576814(v29 > 1, v30 + 1, 1, v17);
          uint64_t v17 = v33;
        }
        *(void *)(v17 + 16) = v30 + 1;
        uint64_t v31 = v17 + 16 * v30;
        *(void *)(v31 + 32) = v25;
        *(void *)(v31 + 40) = v26;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v16 += 2;
      if (!--v15)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v5 = v89;
        uint64_t v12 = v94;
        goto LABEL_28;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_28:
  sub_25F5974B0();
  swift_bridgeObjectRetain_n();
  v34 = sub_25F5974A0();
  os_log_type_t v35 = sub_25F597820();
  if (os_log_type_enabled(v34, v35))
  {
    os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v100 = (char *)v37;
    *(_DWORD *)os_log_type_t v36 = 136315138;
    uint64_t v38 = swift_bridgeObjectRetain();
    uint64_t v39 = v5;
    uint64_t v40 = MEMORY[0x2611F6880](v38, MEMORY[0x263F8D310]);
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = v40;
    uint64_t v5 = v39;
    uint64_t v98 = sub_25F5718D4(v43, v42, (uint64_t *)&v100);
    sub_25F597980();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F56F000, v34, v35, "Setting language tags as constraints: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F77E0](v37, -1, -1);
    MEMORY[0x2611F77E0](v36, -1, -1);

    v44 = *(void (**)(char *, uint64_t))(v39 + 8);
    v44(v94, v96);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v44 = *(void (**)(char *, uint64_t))(v5 + 8);
    v44(v12, v96);
  }
  id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14018]), sel_init);
  int64_t v46 = *(void *)(v17 + 16);
  if (v46)
  {
    v100 = (char *)MEMORY[0x263F8EE78];
    sub_25F58F360(0, v46, 0);
    uint64_t v47 = (uint64_t)v100;
    uint64_t v48 = v17 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_25F5975C0();
      swift_bridgeObjectRelease();
      v100 = (char *)v47;
      unint64_t v51 = *(void *)(v47 + 16);
      unint64_t v50 = *(void *)(v47 + 24);
      if (v51 >= v50 >> 1)
      {
        sub_25F58F360((void *)(v50 > 1), v51 + 1, 1);
        uint64_t v47 = (uint64_t)v100;
      }
      v48 += 16;
      *(void *)(v47 + 16) = v51 + 1;
      *(void *)(v47 + 8 * v51 + 32) = v49;
      --v46;
    }
    while (v46);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  v52 = (void *)sub_25F597740();
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_setLanguageConstraints_, v52);

  v53 = (void *)sub_25F5975C0();
  objc_msgSend(v45, sel_processString_, v53);

  uint64_t result = v92;
  v54 = v93;
  if ((v92 & 0x8000000000000000) == 0)
  {
    uint64_t v55 = sub_25F597920();
    id v56 = objc_msgSend(v45, sel_dominantLanguage);
    if (v56)
    {
      v57 = v56;
      uint64_t v58 = sub_25F5975F0();
      uint64_t v60 = v59;
      if (v58 == sub_25F5975F0() && v60 == v61)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v63 = sub_25F597C50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v63 & 1) == 0)
        {
          id v64 = v57;
          double v65 = COERCE_DOUBLE(sub_25F576084((uint64_t)v64, v55));
          char v67 = v66;

          swift_bridgeObjectRelease();
          if ((v67 & 1) == 0 && v65 > 0.95)
          {
            sub_25F5974B0();
            id v68 = v64;
            v69 = sub_25F5974A0();
            os_log_type_t v70 = sub_25F597820();
            if (os_log_type_enabled(v69, v70))
            {
              uint64_t v71 = swift_slowAlloc();
              v97 = (char *)swift_slowAlloc();
              v100 = v97;
              *(_DWORD *)uint64_t v71 = 136315394;
              v95 = (void (**)(char *, uint64_t))(v71 + 4);
              uint64_t v72 = sub_25F5975F0();
              uint64_t v89 = v5;
              uint64_t v98 = sub_25F5718D4(v72, v73, (uint64_t *)&v100);
              sub_25F597980();

              swift_bridgeObjectRelease();
              *(_WORD *)(v71 + 12) = 2048;
              uint64_t v98 = *(void *)&v65;
              sub_25F597980();
              _os_log_impl(&dword_25F56F000, v69, v70, "The probability for this message being for language %s is %f", (uint8_t *)v71, 0x16u);
              v74 = v97;
              swift_arrayDestroy();
              MEMORY[0x2611F77E0](v74, -1, -1);
              MEMORY[0x2611F77E0](v71, -1, -1);

              v75 = v93;
            }
            else
            {

              v75 = v54;
            }
            v44(v75, v96);
            uint64_t v76 = sub_25F5975F0();

            return v76;
          }
          v77 = v87;
          sub_25F5974B0();
          id v78 = v64;
          v79 = sub_25F5974A0();
          os_log_type_t v80 = sub_25F597810();
          if (os_log_type_enabled(v79, v80))
          {
            v81 = (uint8_t *)swift_slowAlloc();
            uint64_t v82 = swift_slowAlloc();
            v100 = (char *)v82;
            uint64_t v89 = v5;
            *(_DWORD *)v81 = 136315138;
            uint64_t v83 = sub_25F5975F0();
            uint64_t v98 = sub_25F5718D4(v83, v84, (uint64_t *)&v100);
            sub_25F597980();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25F56F000, v79, v80, "Unable to find probability or probability is too low for language %s", v81, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611F77E0](v82, -1, -1);
            MEMORY[0x2611F77E0](v81, -1, -1);

            v85 = v87;
          }
          else
          {

            v85 = v77;
          }
          v44(v85, v96);
          return 0;
        }
      }
    }
    swift_bridgeObjectRelease();

    return 0;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t LocaleDetection.locale(forMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v166 = a7;
  uint64_t v167 = a8;
  uint64_t v171 = a1;
  uint64_t v172 = a6;
  uint64_t v168 = a3;
  unint64_t v170 = a2;
  uint64_t v174 = sub_25F5974C0();
  sub_25F5791BC();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  v163 = (char *)&v157 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F579270();
  MEMORY[0x270FA5388](v15);
  sub_25F579298();
  uint64_t v160 = v16;
  sub_25F579270();
  MEMORY[0x270FA5388](v17);
  sub_25F579298();
  v162 = v18;
  sub_25F579270();
  MEMORY[0x270FA5388](v19);
  sub_25F579298();
  uint64_t v164 = v20;
  sub_25F579270();
  MEMORY[0x270FA5388](v21);
  sub_25F579298();
  uint64_t v159 = v22;
  sub_25F579270();
  MEMORY[0x270FA5388](v23);
  sub_25F579298();
  uint64_t v161 = v24;
  sub_25F579270();
  MEMORY[0x270FA5388](v25);
  sub_25F579298();
  v158 = v26;
  sub_25F579270();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  MEMORY[0x270FA5388](v28);
  sub_25F579298();
  v173 = v29;
  sub_25F579270();
  MEMORY[0x270FA5388](v30);
  v165 = (char *)&v157 - v31;
  uint64_t v32 = sub_25F572540(qword_26B399A40);
  MEMORY[0x270FA5388](v32 - 8);
  sub_25F5794EC();
  uint64_t v35 = v34 - v33;
  uint64_t v36 = sub_25F597350();
  sub_25F5791BC();
  uint64_t v38 = v37;
  MEMORY[0x270FA5388](v39);
  sub_25F579388();
  MEMORY[0x270FA5388](v40);
  v169 = (char *)&v157 - v41;
  uint64_t countAndFlagsBits = a4;
  uint64_t v42 = a4 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain();
  if (a5) {
    unint64_t v43 = a5;
  }
  else {
    unint64_t v43 = 0xE000000000000000;
  }
  if (!a5) {
    uint64_t v42 = 0;
  }
  swift_bridgeObjectRelease();
  if ((v43 & 0x2000000000000000) != 0) {
    uint64_t v44 = HIBYTE(v43) & 0xF;
  }
  else {
    uint64_t v44 = v42;
  }
  if (v44 && a5)
  {
    sub_25F577D24(v172, v35);
    uint64_t v45 = v12;
    if (sub_25F577D8C(v35, 1, v36) == 1)
    {
      uint64_t v46 = a5;
      swift_bridgeObjectRetain();
      sub_25F577DB4(v35);
      swift_bridgeObjectRetain();
      uint64_t v47 = v175;
      uint64_t v48 = countAndFlagsBits;
      uint64_t v172 = countAndFlagsBits;
      unint64_t v49 = a5;
    }
    else
    {
      uint64_t v53 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v169, v35, v36);
      uint64_t v46 = a5;
      swift_bridgeObjectRetain();
      sub_25F597340();
      sub_25F597330();
      double v55 = v54;
      uint64_t v58 = *(void (**)(void))(v53 + 8);
      uint64_t v56 = v53 + 8;
      v57 = v58;
      sub_25F579494();
      v58();
      if (v55 <= 3600.0)
      {
        sub_25F5974B0();
        swift_bridgeObjectRetain_n();
        uint64_t v92 = sub_25F5974A0();
        os_log_type_t v93 = sub_25F597820();
        if (os_log_type_enabled(v92, v93))
        {
          uint64_t v94 = sub_25F579220();
          v177[0] = sub_25F579370();
          *(_DWORD *)uint64_t v94 = 136315650;
          swift_bridgeObjectRetain();
          uint64_t v175 = v56;
          uint64_t v48 = countAndFlagsBits;
          uint64_t v178 = sub_25F5718D4(countAndFlagsBits, a5, v177);
          uint64_t v157 = v45;
          sub_25F597980();
          sub_25F579444();
          *(_WORD *)(v94 + 12) = 2048;
          uint64_t v178 = 0x40AC200000000000;
          sub_25F597980();
          *(_WORD *)(v94 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v178 = sub_25F5718D4(v48, a5, v177);
          sub_25F597980();
          sub_25F579444();
          _os_log_impl(&dword_25F56F000, v92, v93, "Default locale %s was changed less than %f seconds ago, detection result %s.", (uint8_t *)v94, 0x20u);
          swift_arrayDestroy();
          sub_25F5791D8();
          sub_25F5791D8();

          sub_25F579404();
          v95();
          sub_25F579364();
          v57();
        }
        else
        {
          swift_bridgeObjectRelease_n();

          sub_25F579330();
          v96();
          sub_25F579494();
          v57();
          return countAndFlagsBits;
        }
        return v48;
      }
      sub_25F579494();
      v57();
      swift_bridgeObjectRetain();
      uint64_t v47 = v175;
      uint64_t v48 = countAndFlagsBits;
      uint64_t v172 = countAndFlagsBits;
      unint64_t v49 = a5;
    }
  }
  else
  {
    BOOL v50 = v44 == 0;
    uint64_t v47 = v175;
    uint64_t v51 = countAndFlagsBits;
    if (v50) {
      uint64_t v51 = 0;
    }
    uint64_t v172 = v51;
    uint64_t v48 = sub_25F575870(*(void *)(v175 + 16));
    uint64_t v46 = v52;
    swift_bridgeObjectRelease();
    unint64_t v49 = 0;
    uint64_t v45 = v12;
  }
  uint64_t v59 = *(void *)(*(void *)(v47 + 16) + 16);
  if ((a9 & 1) == 0 && v59 == 1)
  {
    if (v49) {
      unint64_t v60 = v49;
    }
    else {
      unint64_t v60 = 0xE300000000000000;
    }
    if (v46) {
      unint64_t v61 = v46;
    }
    else {
      unint64_t v61 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v62 = v173;
    sub_25F5974B0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v63 = sub_25F5974A0();
    os_log_type_t v64 = sub_25F597820();
    if (os_log_type_enabled(v63, v64))
    {
      if (v46) {
        uint64_t v65 = v48;
      }
      else {
        uint64_t v65 = 7104878;
      }
      uint64_t v175 = v65;
      if (v49) {
        uint64_t v66 = v172;
      }
      else {
        uint64_t v66 = 7104878;
      }
      uint64_t v67 = swift_slowAlloc();
      uint64_t v68 = sub_25F579370();
      uint64_t countAndFlagsBits = v48;
      v177[0] = v68;
      *(_DWORD *)uint64_t v67 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v178 = sub_25F5718D4(v66, v60, v177);
      sub_25F579614();
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v67 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v178 = sub_25F5718D4(v175, v61, v177);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v63, v64, "Monolingual, default locale %s, detection result %s.", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy();
      uint64_t v48 = countAndFlagsBits;
      sub_25F5791D8();
      sub_25F5791D8();

      (*(void (**)(void (*)(void), uint64_t))(v45 + 8))(v173, v174);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(void (*)(void), uint64_t))(v45 + 8))(v62, v174);
    }
    return v48;
  }
  uint64_t countAndFlagsBits = v48;
  sub_25F5974B0();
  v69 = sub_25F5974A0();
  os_log_type_t v70 = sub_25F597820();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = (uint8_t *)sub_25F579258();
    *(_DWORD *)uint64_t v71 = 134217984;
    v177[0] = v59;
    sub_25F597980();
    _os_log_impl(&dword_25F56F000, v69, v70, "Falling back to language detection due to %ld keyboard locales", v71, 0xCu);
    sub_25F5791D8();
  }
  char v72 = a9 ^ 1;

  v75 = *(void (**)(void))(v45 + 8);
  uint64_t v74 = v45 + 8;
  unint64_t v73 = v75;
  sub_25F579330();
  v75();
  uint64_t v76 = (void *)v170;
  v173 = v75;
  if (v170)
  {
    uint64_t v77 = HIBYTE(v170) & 0xF;
    if ((v170 & 0x2000000000000000) == 0) {
      uint64_t v77 = v171 & 0xFFFFFFFFFFFFLL;
    }
    if (v77)
    {
      uint64_t v157 = v74;
      uint64_t v78 = *(void *)(v175 + 16);
      swift_bridgeObjectRetain();
      v79._uint64_t countAndFlagsBits = v171;
      v79._object = v76;
      Swift::String_optional v80 = LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(v79, v72 & 1);
      if (v80.value._object)
      {
        sub_25F5796C8();
        if (v81)
        {
          swift_bridgeObjectRelease();
          if ((a9 & 1) == 0
            || (swift_bridgeObjectRetain(),
                sub_25F5760CC(v80.value._countAndFlagsBits, (uint64_t)v80.value._object, v78),
                uint64_t v83 = v82,
                swift_bridgeObjectRelease(),
                swift_bridgeObjectRelease(),
                v83))
          {
            uint64_t countAndFlagsBits = v80.value._countAndFlagsBits;
            if (v49) {
              unint64_t v84 = v49;
            }
            else {
              unint64_t v84 = 0xE000000000000000;
            }
            sub_25F5974B0();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v85 = sub_25F5974A0();
            os_log_type_t v86 = sub_25F597820();
            if (sub_25F5793E8(v86))
            {
              if (v49) {
                uint64_t v87 = v172;
              }
              else {
                uint64_t v87 = 0;
              }
              uint64_t v88 = sub_25F579220();
              v177[0] = sub_25F579370();
              *(_DWORD *)uint64_t v88 = 134218498;
              uint64_t v89 = sub_25F597690();
              swift_bridgeObjectRelease();
              uint64_t v178 = v89;
              sub_25F597980();
              swift_bridgeObjectRelease();
              *(_WORD *)(v88 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v178 = sub_25F5718D4(v87, v84, v177);
              sub_25F597980();
              sub_25F579444();
              *(_WORD *)(v88 + 22) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v178 = sub_25F5718D4(countAndFlagsBits, (unint64_t)v80.value._object, v177);
              sub_25F597980();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_25F56F000, v85, v80.value._countAndFlagsBits, "Message length: %ld, default locale: %s, detected locale: %s.", (uint8_t *)v88, 0x20u);
              swift_arrayDestroy();
              sub_25F5791D8();
              sub_25F5791D8();

              sub_25F579364();
              v90();
            }
            else
            {

              swift_bridgeObjectRelease_n();
              sub_25F57942C();
              swift_bridgeObjectRelease_n();
              sub_25F5795C8();
              v73();
            }
            uint64_t v143 = v167;
            if (!v167) {
              return countAndFlagsBits;
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v48 = countAndFlagsBits;
            sub_25F5761AC(countAndFlagsBits, (uint64_t)v80.value._object, v166, v143);
            return v48;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v151 = v158;
          sub_25F5974B0();
          swift_bridgeObjectRetain();
          v152 = (void *)sub_25F5974A0();
          os_log_type_t v153 = sub_25F597810();
          if (sub_25F5792A4(v153))
          {
            sub_25F579258();
            v177[0] = sub_25F579204();
            _DWORD *v151 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v154 = sub_25F5718D4(v80.value._countAndFlagsBits, (unint64_t)v80.value._object, v177);
            sub_25F5795B4(v154);
            sub_25F597980();
            swift_bridgeObjectRelease_n();
            sub_25F579238(&dword_25F56F000, v155, v156, "ML language detection detected %s but returning nil for language since it's not one of the user's preferred locales");
            sub_25F57945C();
            sub_25F5791D8();
            sub_25F5791D8();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_25F5795C8();
          v73();
          return 0;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v74 = v157;
      swift_bridgeObjectRelease();
    }
  }
  if (v168) {
    uint64_t v97 = v168;
  }
  else {
    uint64_t v97 = MEMORY[0x263F8EE78];
  }
  v177[0] = v97;
  swift_bridgeObjectRetain();
  sub_25F572540(&qword_26B399CA0);
  sub_25F577C88();
  v98._uint64_t countAndFlagsBits = sub_25F5975A0();
  uint64_t v99 = *(void *)(v175 + 16);
  Swift::String_optional v100 = LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(v98, v72 & 1);
  uint64_t v48 = v100.value._countAndFlagsBits;
  swift_bridgeObjectRelease();
  if (v100.value._object)
  {
    unint64_t v101 = ((unint64_t)v100.value._object >> 56) & 0xF;
    if (((uint64_t)v100.value._object & 0x2000000000000000) == 0) {
      unint64_t v101 = v100.value._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    }
    if (v101)
    {
      swift_bridgeObjectRelease();
      if (a9)
      {
        swift_bridgeObjectRetain();
        sub_25F5760CC(v100.value._countAndFlagsBits, (uint64_t)v100.value._object, v99);
        uint64_t v103 = v102;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v103)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_25F5974B0();
          swift_bridgeObjectRetain();
          v144 = (void *)sub_25F5974A0();
          os_log_type_t v145 = sub_25F597810();
          if (sub_25F5792A4(v145))
          {
            sub_25F579258();
            v177[0] = sub_25F579204();
            sub_25F57954C(4.8149e-34);
            swift_bridgeObjectRetain();
            uint64_t v146 = sub_25F5718D4(v100.value._countAndFlagsBits, (unint64_t)v100.value._object, v177);
            sub_25F5793B4(v146);
            sub_25F597980();
            swift_bridgeObjectRelease_n();
            sub_25F579238(&dword_25F56F000, v147, v148, "ML language detection detected %s but returning nil for language since it's not one of the user's preferred locales");
            sub_25F57945C();
            sub_25F5791D8();
            sub_25F5791D8();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_25F579330();
          v150();
          return 0;
        }
      }
      if (v49) {
        unint64_t v104 = v49;
      }
      else {
        unint64_t v104 = 0xE000000000000000;
      }
      uint64_t v105 = v164;
      sub_25F5974B0();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v106 = sub_25F5974A0();
      os_log_type_t v107 = sub_25F597820();
      if (os_log_type_enabled(v106, v107))
      {
        uint64_t v108 = v172;
        if (!v49) {
          uint64_t v108 = 0;
        }
        uint64_t countAndFlagsBits = v108;
        uint64_t v109 = sub_25F579220();
        v177[0] = sub_25F579370();
        *(_DWORD *)uint64_t v109 = 134218498;
        uint64_t v157 = v74;
        uint64_t v110 = *(void *)(v97 + 16);
        swift_bridgeObjectRelease();
        uint64_t v178 = v110;
        sub_25F579614();
        sub_25F597980();
        swift_bridgeObjectRelease();
        *(_WORD *)(v109 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v111 = sub_25F5718D4(countAndFlagsBits, v104, v177);
        sub_25F579594(v111);
        sub_25F579444();
        *(_WORD *)(v109 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v112 = sub_25F5718D4(v100.value._countAndFlagsBits, (unint64_t)v100.value._object, v177);
        sub_25F579594(v112);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25F56F000, v106, v107, "Number of messages used for detection: %ld, default locale: %s, detected locale: %s.", (uint8_t *)v109, 0x20u);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();

        sub_25F579404();
        v113();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        sub_25F57942C();
        swift_bridgeObjectRelease_n();
        ((void (*)(uint64_t, uint64_t))v173)(v105, v174);
      }
      uint64_t v122 = v167;
      if (v167)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25F5761AC(v100.value._countAndFlagsBits, (uint64_t)v100.value._object, v166, v122);
      }
      return v48;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v48 = countAndFlagsBits;
  if (v49)
  {
    uint64_t v114 = HIBYTE(v49) & 0xF;
    uint64_t v115 = v172;
    if ((v49 & 0x2000000000000000) == 0) {
      uint64_t v114 = v172 & 0xFFFFFFFFFFFFLL;
    }
    if (v114)
    {
      swift_bridgeObjectRelease();
      v116 = v162;
      sub_25F5974B0();
      swift_bridgeObjectRetain_n();
      v117 = (void *)sub_25F5974A0();
      os_log_type_t v118 = sub_25F597820();
      if (sub_25F5792A4(v118))
      {
        sub_25F579258();
        v177[0] = sub_25F579204();
        _DWORD *v116 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v119 = sub_25F5718D4(v115, v49, v177);
        sub_25F5793B4(v119);
        sub_25F597980();
        swift_bridgeObjectRelease_n();
        sub_25F579238(&dword_25F56F000, v120, v121, "Failed to detect a locale so falling back to the default locale: %s");
        sub_25F57945C();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_25F579330();
      v142();
      return v115;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v123 = v167;
  if (v167
    && (swift_bridgeObjectRetain(), uint64_t v124 = sub_25F576348(v166, v123), v126 = v125, swift_bridgeObjectRelease(), v126))
  {
    swift_bridgeObjectRelease();
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    v127 = (void *)sub_25F5974A0();
    os_log_type_t v128 = sub_25F597820();
    if (sub_25F5793CC(v128))
    {
      v129 = (_DWORD *)sub_25F579258();
      v177[0] = sub_25F579220();
      _DWORD *v129 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v130 = sub_25F5718D4(v124, v126, v177);
      sub_25F5795B4(v130);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      sub_25F579628(&dword_25F56F000, v131, v132, "There was no default locale specified. Falling back to last confident locale for sender: %s");
      sub_25F579478();
      sub_25F5791D8();
      sub_25F5791D8();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25F579330();
    v149();
    return v124;
  }
  else
  {
    v133 = v163;
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    v134 = (void *)sub_25F5974A0();
    os_log_type_t v135 = sub_25F597820();
    if (sub_25F5793E8(v135))
    {
      sub_25F579258();
      uint64_t v136 = sub_25F579204();
      v177[1] = v46;
      uint64_t v178 = v136;
      sub_25F57954C(4.8149e-34);
      v177[0] = v48;
      swift_bridgeObjectRetain();
      sub_25F572540(&qword_26B399C90);
      uint64_t v137 = sub_25F597650();
      v177[0] = sub_25F5718D4(v137, v138, &v178);
      sub_25F597980();
      sub_25F57942C();
      uint64_t v48 = countAndFlagsBits;
      swift_bridgeObjectRelease();
      sub_25F579660(&dword_25F56F000, v139, v140, "Falling back to last used locale %s for message");
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      v141 = v163;
    }
    else
    {

      sub_25F57942C();
      v141 = v133;
    }
    ((void (*)(char *, uint64_t))v173)(v141, v174);
  }
  return v48;
}

uint64_t sub_25F575870(uint64_t a1)
{
  uint64_t result = sub_25F5790C0(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_25F579140(result, v3, 0, a1);
  }
}

Swift::String_optional __swiftcall LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(Swift::String fromString, Swift::Bool limitToPreferredLocales)
{
  sub_25F57957C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_25F5974C0();
  sub_25F5791BC();
  uint64_t v75 = v13;
  uint64_t v76 = v12;
  MEMORY[0x270FA5388](v12);
  sub_25F579388();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (_DWORD *)((char *)&v72 - v16);
  MEMORY[0x270FA5388](v15);
  sub_25F579298();
  uint64_t v72 = v18;
  sub_25F579270();
  MEMORY[0x270FA5388](v19);
  sub_25F579298();
  unint64_t v73 = v20;
  sub_25F579270();
  MEMORY[0x270FA5388](v21);
  sub_25F579298();
  uint64_t v74 = v22;
  sub_25F579270();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (uint8_t *)&v72 - v24;
  unint64_t v26 = 0;
  if (v7)
  {
    uint64_t v27 = swift_bridgeObjectRetain();
    unint64_t v26 = sub_25F5787D0(v27);
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = sub_25F573AD8(v11, v9, (uint64_t)v26, v5);
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  if (v30)
  {
    if (*(void *)(v3 + 16))
    {
      if (v7)
      {
        sub_25F5974B0();
        sub_25F5795FC();
        uint64_t v31 = sub_25F5974A0();
        os_log_type_t v32 = sub_25F597820();
        if (os_log_type_enabled(v31, v32))
        {
          sub_25F579258();
          uint64_t v78 = sub_25F579204();
          sub_25F579694(4.8149e-34);
          uint64_t v33 = sub_25F5792E4();
          sub_25F57933C(v33);
          sub_25F579318();
          _os_log_impl(&dword_25F56F000, v31, v32, "Attempting to match detected language %s to available preferred locales", v25, 0xCu);
          swift_arrayDestroy();
          sub_25F5791D8();
          sub_25F5791D8();
        }
        else
        {

          sub_25F579300();
        }
        uint64_t v42 = *(void (**)(void))(v75 + 8);
        sub_25F579364();
        v42();
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_25F5760CC(v28, v30, v3);
        unint64_t v45 = v44;
        swift_bridgeObjectRelease();
        if (v45)
        {
          uint64_t v46 = v74;
          sub_25F5974B0();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          uint64_t v47 = sub_25F5974A0();
          os_log_type_t v48 = sub_25F597820();
          if (os_log_type_enabled(v47, v48))
          {
            uint64_t v49 = swift_slowAlloc();
            uint64_t v50 = sub_25F579370();
            unint64_t v73 = v42;
            uint64_t v78 = v50;
            *(_DWORD *)uint64_t v49 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v77 = sub_25F5792E4();
            sub_25F597980();
            sub_25F579318();
            *(_WORD *)(v49 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v77 = sub_25F5718D4(v43, v45, &v78);
            sub_25F597980();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25F56F000, v47, v48, "Found a directly matching locale based on locale identifier for language %s: %s", (uint8_t *)v49, 0x16u);
            swift_arrayDestroy();
            sub_25F5791D8();
            sub_25F5791D8();

            sub_25F579364();
            v51();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            sub_25F579300();
            ((void (*)(uint64_t, uint64_t))v42)(v46, v76);
          }
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v53 = swift_bridgeObjectRetain();
          uint64_t v54 = sub_25F576530(v53);
          unint64_t v56 = v55;
          swift_bridgeObjectRelease();
          if (v56)
          {
            swift_bridgeObjectRelease();
            sub_25F5974B0();
            swift_bridgeObjectRetain_n();
            v57 = (void *)sub_25F5974A0();
            os_log_type_t v58 = sub_25F597820();
            if (sub_25F5793E8(v58))
            {
              sub_25F579258();
              uint64_t v78 = sub_25F579204();
              sub_25F57954C(4.8149e-34);
              swift_bridgeObjectRetain();
              uint64_t v59 = sub_25F5718D4(v54, v56, &v78);
              sub_25F5796B4(v59);
              sub_25F597980();
              swift_bridgeObjectRelease_n();
              sub_25F579660(&dword_25F56F000, v60, v61, "Found a matching locale: %s");
              swift_arrayDestroy();
              sub_25F5791D8();
              sub_25F5791D8();

              sub_25F579364();
              v42();
            }
            else
            {

              swift_bridgeObjectRelease_n();
              uint64_t v67 = sub_25F579680();
              ((void (*)(uint64_t))v42)(v67);
            }
          }
          else
          {
            sub_25F5974B0();
            swift_bridgeObjectRetain();
            v62 = (void *)sub_25F5974A0();
            os_log_type_t v63 = sub_25F597820();
            if (sub_25F5792A4(v63))
            {
              sub_25F579258();
              uint64_t v78 = sub_25F579204();
              sub_25F579694(4.8149e-34);
              uint64_t v64 = sub_25F5792E4();
              sub_25F57933C(v64);
              sub_25F579318();
              sub_25F579238(&dword_25F56F000, v65, v66, "Unable to reliably determine language %s for message");
              sub_25F579478();
              sub_25F5791D8();
              sub_25F5791D8();

              sub_25F579364();
              v42();
            }
            else
            {

              sub_25F579300();
              uint64_t v68 = sub_25F579680();
              ((void (*)(uint64_t))v42)(v68);
            }
          }
        }
        goto LABEL_27;
      }
      sub_25F5974B0();
      sub_25F5795FC();
      uint64_t v34 = sub_25F5974A0();
      os_log_type_t v38 = sub_25F597820();
      if (sub_25F5792A4(v38))
      {
        sub_25F579258();
        uint64_t v78 = sub_25F579204();
        *uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_25F5792E4();
        sub_25F5794C4(v39);
        sub_25F597980();
        sub_25F579318();
        sub_25F579238(&dword_25F56F000, v40, v41, "We are not limiting to just preferred locales, relying on ML language detection %s");
        sub_25F579478();
        sub_25F5791D8();
        sub_25F5791D8();

        goto LABEL_18;
      }
    }
    else
    {
      sub_25F5974B0();
      sub_25F5795FC();
      uint64_t v34 = sub_25F5974A0();
      os_log_type_t v35 = sub_25F597820();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)sub_25F579258();
        uint64_t v78 = sub_25F579220();
        *(_DWORD *)uint64_t v36 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_25F5792E4();
        sub_25F5794C4(v37);
        sub_25F597980();
        sub_25F579318();
        _os_log_impl(&dword_25F56F000, v34, v35, "We have no preferred locales, defaulting purely back to ML language detection %s", v36, 0xCu);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();

LABEL_18:
        sub_25F579404();
        v52();
        goto LABEL_27;
      }
    }

    sub_25F579300();
    goto LABEL_18;
  }
LABEL_27:
  sub_25F5794FC();
  result.value._object = v70;
  result.value._uint64_t countAndFlagsBits = v69;
  return result;
}

uint64_t sub_25F576084(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_25F592BB8(a1), (v4 & 1) != 0)) {
    return *(void *)(*(void *)(a2 + 56) + 8 * v3);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F5760CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_25F5928E8(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_25F576124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25F5928E8(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25F576168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25F5928E8(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void sub_25F5761AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    sub_25F572540(&qword_26A7AAA08);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a1;
    *(void *)(v9 + 24) = a2;
    uint64_t v10 = *(void **)(v4 + 16);
    uint64_t v11 = (objc_class *)sub_25F572540(&qword_26A7AAA00);
    uint64_t v12 = (char *)objc_allocWithZone(v11);
    uint64_t v13 = &v12[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v12) + 0x60)];
    *(void *)uint64_t v13 = a3;
    *((void *)v13 + 1) = a4;
    v19.receiver = v12;
    v19.super_class = v11;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v14 = objc_msgSendSuper2(&v19, sel_init);
    objc_msgSend(v10, sel_setObject_forKey_, v9, v14, v19.receiver, v19.super_class);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    uint64_t v15 = *(void **)(v4 + 16);
    uint64_t v16 = (objc_class *)sub_25F572540(&qword_26A7AAA00);
    uint64_t v17 = (char *)objc_allocWithZone(v16);
    uint64_t v18 = &v17[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v17) + 0x60)];
    *(void *)uint64_t v18 = a3;
    *((void *)v18 + 1) = a4;
    v20.receiver = v17;
    v20.super_class = v16;
    swift_bridgeObjectRetain();
    id v14 = objc_msgSendSuper2(&v20, sel_init);
    objc_msgSend(v15, sel_removeObjectForKey_, v14);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25F576348(uint64_t a1, uint64_t a2)
{
  char v5 = *(void **)(v2 + 16);
  uint64_t v6 = (objc_class *)sub_25F572540(&qword_26A7AAA00);
  char v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v7) + 0x60)];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  v13.receiver = v7;
  v13.super_class = v6;
  swift_bridgeObjectRetain();
  id v9 = objc_msgSendSuper2(&v13, sel_init);
  uint64_t v10 = objc_msgSend(v5, sel_objectForKey_, v9, v13.receiver, v13.super_class);

  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10[2];
  swift_bridgeObjectRetain();
  swift_release();
  return v11;
}

uint64_t LocaleDetection.locale(forIncomingMessages:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    sub_25F572540(&qword_26B399CA0);
    sub_25F577C88();
    sub_25F5975A0();
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_25F579420();
  uint64_t v17 = LocaleDetection.locale(forMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(v14, v15, a2, a3, a4, a5, a6, v16, a8 & 1);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_25F576530(uint64_t a1)
{
  sub_25F579088(a1, v14);
  uint64_t v1 = v14[0];
  uint64_t v2 = v14[1];
  int64_t v3 = v14[3];
  unint64_t v4 = v14[4];
  int64_t v5 = (unint64_t)(v14[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v7 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  unint64_t v8 = v7 | (v3 << 6);
  while (1)
  {
    uint64_t v13 = *(void *)(*(void *)(v1 + 48) + 16 * v8);
    swift_bridgeObjectRetain();
    if (sub_25F597710())
    {
      swift_bridgeObjectRelease();
      swift_release();
      return v13;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v9 >= v5) {
      goto LABEL_23;
    }
    unint64_t v10 = *(void *)(v2 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v5) {
        goto LABEL_23;
      }
      unint64_t v10 = *(void *)(v2 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v5) {
          goto LABEL_23;
        }
        unint64_t v10 = *(void *)(v2 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v5) {
            goto LABEL_23;
          }
          unint64_t v10 = *(void *)(v2 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v3 + 5;
            if (v3 + 5 >= v5) {
              goto LABEL_23;
            }
            unint64_t v10 = *(void *)(v2 + 8 * v11);
            if (!v10)
            {
              int64_t v12 = v3 + 6;
              while (v12 < v5)
              {
                unint64_t v10 = *(void *)(v2 + 8 * v12++);
                if (v10)
                {
                  int64_t v11 = v12 - 1;
                  goto LABEL_18;
                }
              }
LABEL_23:
              swift_bridgeObjectRelease();
              swift_release();
              return 0;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v4 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    int64_t v3 = v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_25F5766D4(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8E0]), sel_init);
  *(void *)(v1 + 16) = v3;
  objc_msgSend(v3, sel_setCountLimit_, a1);
  return v1;
}

char *sub_25F576724(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25F572540(&qword_26B399CF8);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25F576F58((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25F576A7C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_25F576814(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_25F5793A4();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_25F57956C();
    }
  }
  sub_25F57955C();
  if (v5)
  {
    sub_25F572540(&qword_26B399CF0);
    uint64_t v11 = sub_25F579534();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25F576EFC((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_25F579514();
    sub_25F576B94(v13, v14, v15, v16);
  }
}

void sub_25F5768DC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_25F5793A4();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_25F57956C();
    }
  }
  sub_25F57955C();
  if (v5)
  {
    sub_25F572540((uint64_t *)&unk_26B399DC8);
    uint64_t v11 = sub_25F579534();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25F576FF0((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_25F579514();
    sub_25F576C8C(v13, v14, v15, v16);
  }
}

void sub_25F5769A4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_25F5793A4();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_25F57956C();
    }
  }
  sub_25F57955C();
  if (v5)
  {
    sub_25F572540(&qword_26A7AA9F0);
    uint64_t v11 = swift_allocObject();
    size_t v12 = j__malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25F57704C((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = sub_25F579514();
    sub_25F576D80(v13, v14, v15, v16);
  }
}

uint64_t sub_25F576A7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_25F572540(&qword_26B399C98);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25F597B60();
  __break(1u);
  return result;
}

uint64_t sub_25F576B94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25F597B60();
  __break(1u);
  return result;
}

char *sub_25F576C8C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_25F597B60();
  __break(1u);
  return result;
}

uint64_t sub_25F576D80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_25F572540(&qword_26A7AA9F8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25F597B60();
  __break(1u);
  return result;
}

char *sub_25F576EA0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    uint64_t result = (char *)sub_25F5792C0();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)sub_25F57927C(a3, result);
  }
  return result;
}

char *sub_25F576EFC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    uint64_t result = (char *)sub_25F5792C0();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_25F57927C(a3, result);
  }
  return result;
}

char *sub_25F576F58(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25F597B60();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_25F576FF0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    uint64_t result = (char *)sub_25F5792C0();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_25F57927C(a3, result);
  }
  return result;
}

char *sub_25F57704C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25F597B60();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

void *sub_25F5770E8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    sub_25F5794B4();
LABEL_11:
    uint64_t result = (void *)sub_25F597B60();
    __break(1u);
    return result;
  }
  if (&__dst[4 * a2] > __src && &__src[4 * a2] > __dst)
  {
    sub_25F5791F0();
    sub_25F5794A4();
    goto LABEL_11;
  }
  return memcpy(__dst, __src, 4 * a2);
}

uint64_t sub_25F57719C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    sub_25F5794B4();
LABEL_11:
    uint64_t result = sub_25F597B60();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_25F5791F0();
    sub_25F5794A4();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25F577254(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_25F5791F0();
    sub_25F5794B4();
LABEL_11:
    uint64_t result = sub_25F597B60();
    __break(1u);
    return result;
  }
  if (a3 + 8 * a2 > a1 && a1 + 8 * a2 > a3)
  {
    sub_25F5791F0();
    sub_25F5794A4();
    goto LABEL_11;
  }
  type metadata accessor for NLLanguage(0);
  return swift_arrayInitWithCopy();
}

void *sub_25F577328(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25F597B60();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

void *sub_25F577404(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[16 * a2] > __src ? (BOOL v3 = &__src[16 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25F597B60();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 16 * a2);
  }
  return result;
}

void sub_25F5774E0(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v5 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    uint64_t v7 = *(v5 - 3);
    uint64_t v6 = *(v5 - 2);
    uint64_t v9 = *(v5 - 1);
    uint64_t v8 = *v5;
    char v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_25F5928E8(v7, v6);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_25F597D30();
      __break(1u);
      goto LABEL_20;
    }
    char v16 = v11;
    if (v10[3] < v15) {
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
      sub_25F572540(&qword_26A7AAA10);
      sub_25F597B00();
      if (v16) {
        goto LABEL_14;
      }
    }
LABEL_10:
    objc_super v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    objc_super v20 = (uint64_t *)(v19[6] + 16 * v12);
    uint64_t *v20 = v7;
    v20[1] = v6;
    uint64_t v21 = (void *)(v19[7] + 16 * v12);
    *uint64_t v21 = v9;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_18;
    }
    v5 += 4;
    v19[2] = v24;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_25F5777C4(v15, a2 & 1);
  unint64_t v17 = sub_25F5928E8(v7, v6);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v25 = (void *)swift_allocError();
  swift_willThrow();
  id v26 = v25;
  sub_25F572540(&qword_26A7AAA18);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_25F597A90();
  sub_25F5976D0();
  sub_25F597AD0();
  sub_25F5976D0();
  sub_25F597B20();
  __break(1u);
}

uint64_t sub_25F5777C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25F572540(&qword_26B399CE8);
  char v40 = a2;
  uint64_t v6 = sub_25F597B40();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
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
    objc_super v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    BOOL v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25F597D90();
    sub_25F597670();
    uint64_t result = sub_25F597DB0();
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
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v7 + 48) + 16 * v29);
    void *v34 = v22;
    v34[1] = v21;
    os_log_type_t v35 = (void *)(*(void *)(v7 + 56) + 16 * v29);
    void *v35 = v24;
    v35[1] = v25;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v38)
    {
      swift_release();
      uint64_t v3 = v37;
      unint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    unint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v39 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v38) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v39 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v38)
  {
    unint64_t v18 = *(void *)(v39 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v38) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v39 + 8 * v13);
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
  uint64_t v3 = v37;
LABEL_34:
  if (v40)
  {
    uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
    if (v36 >= 64) {
      sub_25F577AD4(0, (unint64_t)(v36 + 63) >> 6, v17);
    }
    else {
      *unint64_t v17 = -1 << v36;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25F577AD4(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_25F577AF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25F597D90();
  swift_bridgeObjectRetain();
  sub_25F597670();
  uint64_t v8 = sub_25F597DB0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  sub_25F5796DC();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    int64_t v13 = (void *)(v12 + 16 * v10);
    BOOL v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (sub_25F597C50() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      sub_25F5796DC();
      if ((v19 & 1) == 0) {
        break;
      }
      objc_super v20 = (void *)(v12 + 16 * v10);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_25F597C50() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25F5780F0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_25F577C88()
{
  unint64_t result = qword_26B399CA8;
  if (!qword_26B399CA8)
  {
    sub_25F577CDC(&qword_26B399CA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399CA8);
  }
  return result;
}

uint64_t sub_25F577CDC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25F577D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F572540(qword_26B399A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F577D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25F577DB4(uint64_t a1)
{
  uint64_t v2 = sub_25F572540(qword_26B399A40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F577E14()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_25F572540(&qword_26B399CD0);
  uint64_t v3 = sub_25F597A60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25F597D90();
      sub_25F597670();
      uint64_t result = sub_25F597DB0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *unint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25F577AD4(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *char v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25F5780F0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25F577E14();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25F57828C();
      goto LABEL_22;
    }
    sub_25F578440();
  }
  uint64_t v11 = *v4;
  sub_25F597D90();
  sub_25F597670();
  uint64_t result = sub_25F597DB0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25F597C50(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25F597D20();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25F597C50();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_25F57828C()
{
  uint64_t v1 = v0;
  sub_25F572540(&qword_26B399CD0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F597A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25F578440()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_25F572540(&qword_26B399CD0);
  uint64_t v3 = sub_25F597A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25F597D90();
    swift_bridgeObjectRetain();
    sub_25F597670();
    uint64_t result = sub_25F597DB0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *unint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_25F5786EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_25F572540(&qword_26B399CF0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_25F578C80((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F579080();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_25F5787D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_25F572540(&qword_26B399CF0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_25F578E80((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25F579080();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t destroy for LocaleDetection()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s23TextUnderstandingShared15LocaleDetectionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LocaleDetection(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LocaleDetection(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LocaleDetection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocaleDetection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocaleDetection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocaleDetection()
{
  return &type metadata for LocaleDetection;
}

const void *sub_25F578A88(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (const void *)MEMORY[0x263F8EE78];
  }
  sub_25F579410();
  if (v3 ^ v4 | v2)
  {
    uint64_t v5 = (const void *)MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25F572540(&qword_26B399DC0);
    uint64_t v5 = (const void *)sub_25F579534();
    size_t v6 = j__malloc_size(v5);
    sub_25F579524(v6 - 32);
  }
  uint64_t v7 = (char *)sub_25F5794DC();
  sub_25F5770E8(v7, v8, v9);
  return v5;
}

const void *sub_25F578B04(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (const void *)MEMORY[0x263F8EE78];
  }
  sub_25F579410();
  if (v3 ^ v4 | v2)
  {
    uint64_t v5 = (const void *)MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25F572540(&qword_26B399DE0);
    uint64_t v5 = (const void *)sub_25F579534();
    size_t v6 = j__malloc_size(v5);
    sub_25F579524(v6 - 32);
  }
  uint64_t v7 = (char *)sub_25F5794DC();
  sub_25F577404(v7, v8, v9);
  return v5;
}

const void *sub_25F578B80(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (const void *)MEMORY[0x263F8EE78];
  }
  sub_25F579410();
  if (v3 ^ v4 | v2)
  {
    uint64_t v5 = (const void *)MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25F572540((uint64_t *)&unk_26B399DC8);
    uint64_t v5 = (const void *)sub_25F579534();
    size_t v6 = j__malloc_size(v5);
    sub_25F579524(v6 - 32);
  }
  uint64_t v7 = (char *)sub_25F5794DC();
  sub_25F577328(v7, v8, v9);
  return v5;
}

uint64_t sub_25F578BFC()
{
  uint64_t v0 = sub_25F5975F0();
  uint64_t v2 = v1;
  if (v0 == sub_25F5975F0() && v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    sub_25F579420();
    char v5 = sub_25F597C50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25F578C80(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    __n128 result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25F578E80(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    __n128 result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25F579080()
{
  return swift_release();
}

uint64_t sub_25F579088@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_25F5790C0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_25F579140(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    uint64_t v4 = *(void *)(*(void *)(a4 + 56) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_25F5791D8()
{
  JUMPOUT(0x2611F77E0);
}

uint64_t sub_25F579204()
{
  return swift_slowAlloc();
}

uint64_t sub_25F579220()
{
  return swift_slowAlloc();
}

void sub_25F579238(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_25F579258()
{
  return swift_slowAlloc();
}

void *sub_25F57927C@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

BOOL sub_25F5792A4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_25F5792C0()
{
  return sub_25F597B60();
}

uint64_t sub_25F5792E4()
{
  return sub_25F5718D4(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t sub_25F579300()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F579318()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F57933C(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25F597980();
}

uint64_t sub_25F579370()
{
  return swift_slowAlloc();
}

uint64_t sub_25F5793B4(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

BOOL sub_25F5793CC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_25F5793E8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_25F579420()
{
  return v0;
}

uint64_t sub_25F57942C()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F579444()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F57945C()
{
  return swift_arrayDestroy();
}

uint64_t sub_25F579478()
{
  return swift_arrayDestroy();
}

uint64_t sub_25F5794C4(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_25F5794DC()
{
  return v0;
}

uint64_t sub_25F579514()
{
  return 0;
}

void sub_25F579524(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t sub_25F579534()
{
  return swift_allocObject();
}

void sub_25F57954C(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_25F579594(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_25F597980();
}

uint64_t sub_25F5795B4(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_25F5795DC()
{
  return sub_25F577AF0((uint64_t *)(v2 - 104), v1, v0);
}

uint64_t sub_25F5795FC()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_25F579614()
{
  return v0 - 112;
}

void sub_25F579628(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_25F579648()
{
  return swift_slowAlloc();
}

void sub_25F579660(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_25F579680()
{
  return v0;
}

uint64_t sub_25F579694(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F5796B4(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_25F5796F0(uint64_t a1)
{
  return sub_25F579710(a1, qword_26B399D50);
}

uint64_t sub_25F579700(uint64_t a1)
{
  return sub_25F579710(a1, qword_26B399D78);
}

uint64_t sub_25F579710(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25F5978B0();
  sub_25F57B1F4(v3, a2);
  sub_25F57AED8(v3, (uint64_t)a2);
  return sub_25F5978A0();
}

uint64_t sub_25F579768()
{
  uint64_t v1 = v0;
  sub_25F57B2D8();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = sub_25F597970();
  sub_25F5791BC();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)v31 - v8;
  uint64_t v10 = sub_25F5974C0();
  sub_25F5791BC();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  sub_25F5794EC();
  uint64_t v16 = v15 - v14;
  sub_25F5974B0();
  int64_t v17 = sub_25F5974A0();
  os_log_type_t v18 = sub_25F597810();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v34 = v6;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v35 = v4;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v32 = v10;
    uint64_t v22 = v21;
    uint64_t v33 = v9;
    *(_DWORD *)uint64_t v20 = 136315138;
    v31[1] = v20 + 4;
    uint64_t v36 = v3;
    v37[0] = v21;
    swift_getMetatypeMetadata();
    uint64_t v23 = sub_25F597650();
    uint64_t v36 = sub_25F5718D4(v23, v24, v37);
    unint64_t v9 = v33;
    sub_25F597980();
    uint64_t v6 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F56F000, v17, v18, "Purging TUSLazyPurgeable of type %s due to memory pressure", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611F77E0](v22, -1, -1);
    unint64_t v25 = v20;
    uint64_t v4 = v35;
    MEMORY[0x2611F77E0](v25, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v32);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
  }
  sub_25F5721D0((uint64_t)v9, 1, 1, v3);
  sub_25F57B2B4();
  uint64_t v27 = v1 + *(void *)(v26 + 96);
  sub_25F57B2F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v27, v9, v4);
  swift_endAccess();
  sub_25F57B2B4();
  uint64_t v29 = *(void *)(v28 + 120);
  if (*(void *)(v1 + v29))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F5978E0();
    swift_unknownObjectRelease();
  }
  *(void *)(v1 + v29) = 0;
  return swift_unknownObjectRelease();
}

void sub_25F579A5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_25F5974D0();
  sub_25F5791BC();
  uint64_t v53 = v4;
  uint64_t v54 = v3;
  MEMORY[0x270FA5388](v3);
  sub_25F57B288();
  uint64_t v51 = v5;
  uint64_t v52 = sub_25F597500();
  sub_25F5791BC();
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v7);
  sub_25F57B288();
  uint64_t v49 = v8;
  uint64_t v9 = sub_25F5978B0();
  sub_25F5791BC();
  uint64_t v48 = v10;
  MEMORY[0x270FA5388](v11);
  sub_25F57B288();
  uint64_t v47 = v12;
  uint64_t v13 = *(void *)(v2 + 80);
  uint64_t v14 = sub_25F597970();
  sub_25F5791BC();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v45 - v22;
  MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v45 - v24;
  uint64_t v26 = (char *)v1 + *(void *)(v2 + 96);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v25, v26, v14);
  LODWORD(v2) = sub_25F577D8C((uint64_t)v25, 1, v13);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v14);
  if (v2 == 1)
  {
    sub_25F57B2B4();
    (*(void (**)(void))((char *)v1 + *(void *)(v27 + 104)))();
    sub_25F5721D0((uint64_t)v23, 0, 1, v13);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v23, v14);
    sub_25F57B2F0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v26, v20, v14);
    swift_endAccess();
  }
  sub_25F57B2B4();
  if (!*(void *)((char *)v1 + *(void *)(v28 + 120)))
  {
    uint64_t v46 = *(void *)(v28 + 120);
    uint64_t v45 = sub_25F572148(0, &qword_26B399DB0);
    sub_25F572540(&qword_26B399DD8);
    uint64_t v29 = v48;
    uint64_t v30 = *(void *)(v48 + 72);
    unint64_t v31 = (*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_25F598F30;
    unint64_t v33 = v32 + v31;
    sub_25F597880();
    sub_25F597890();
    if (qword_26B399D68 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25F57AED8(v9, (uint64_t)qword_26B399D50);
    uint64_t v35 = *(void (**)(unint64_t, uint64_t, uint64_t))(v29 + 16);
    v35(v33 + 2 * v30, v34, v9);
    unint64_t v36 = v33 + 3 * v30;
    if (qword_26B399D90 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25F57AED8(v9, (uint64_t)qword_26B399D78);
    v35(v36, v37, v9);
    aBlock[0] = v32;
    sub_25F57AFA0((unint64_t *)&unk_26B399DA0, MEMORY[0x263F8F178]);
    sub_25F572540(&qword_26B399D38);
    sub_25F57AFE8((unint64_t *)&unk_26B399D40, &qword_26B399D38);
    uint64_t v38 = v47;
    sub_25F597A40();
    sub_25F57B2B4();
    uint64_t v39 = sub_25F5978C0();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v38, v9);
    swift_getObjectType();
    uint64_t v40 = swift_allocObject();
    swift_weakInit();
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = v13;
    *(void *)(v41 + 24) = v40;
    aBlock[4] = sub_25F57AF80;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25F57A1E8;
    aBlock[3] = &unk_270BA6308;
    uint64_t v42 = _Block_copy(aBlock);
    swift_retain();
    sub_25F5974E0();
    sub_25F57A22C();
    sub_25F5978D0();
    _Block_release(v42);
    sub_25F579404();
    v43();
    sub_25F579404();
    v44();
    swift_release();
    swift_release();
    sub_25F5978F0();
    *(void *)((char *)v1 + v46) = v39;
    swift_unknownObjectRelease();
  }
}

uint64_t sub_25F57A07C()
{
  uint64_t v0 = sub_25F572540(&qword_26B399CB0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_25F5977B0();
    sub_25F5721D0((uint64_t)v2, 1, 1, v5);
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = 0;
    v6[3] = 0;
    v6[4] = v4;
    sub_25F587798((uint64_t)v2, (uint64_t)&unk_26A7AAAA0, (uint64_t)v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_25F57A170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25F57A190, a4, 0);
}

uint64_t sub_25F57A190()
{
  sub_25F57B2C0();
  sub_25F579768();
  sub_25F57B2CC();
  return v0();
}

uint64_t sub_25F57A1E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25F57A22C()
{
  return sub_25F597A40();
}

uint64_t TUSLazyPurgeable.__allocating_init(initialize:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TUSLazyPurgeable.init(initialize:)(a1, a2);
  return v4;
}

void *TUSLazyPurgeable.init(initialize:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v4 = *v2;
  sub_25F597850();
  sub_25F5791BC();
  uint64_t v39 = v6;
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  sub_25F57B288();
  uint64_t v38 = v7;
  uint64_t v37 = sub_25F597930();
  sub_25F57B2E4();
  MEMORY[0x270FA5388](v8);
  sub_25F57B288();
  uint64_t v36 = v9;
  uint64_t v10 = sub_25F597500();
  MEMORY[0x270FA5388](v10 - 8);
  sub_25F5794EC();
  uint64_t v11 = sub_25F597380();
  sub_25F5791BC();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  sub_25F5794EC();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = *(void *)(v4 + 80);
  uint64_t v19 = sub_25F597970();
  sub_25F5791BC();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v34 - v23;
  swift_defaultActor_initialize();
  sub_25F57B2B4();
  uint64_t v26 = (uint64_t)v3 + *(void *)(v25 + 96);
  sub_25F5721D0(v26, 1, 1, v18);
  sub_25F57B2B4();
  *(void *)((char *)v3 + *(void *)(v27 + 120)) = 0;
  sub_25F5721D0((uint64_t)v24, 1, 1, v18);
  sub_25F57B2F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 40))(v26, v24, v19);
  swift_endAccess();
  sub_25F57B2B4();
  uint64_t v29 = (void *)((char *)v3 + *(void *)(v28 + 104));
  uint64_t v30 = v35;
  void *v29 = v34;
  v29[1] = v30;
  sub_25F572148(0, (unint64_t *)&qword_26B399EC0);
  unint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  swift_retain();
  sub_25F597A90();
  swift_bridgeObjectRelease();
  unint64_t v41 = 0xD000000000000023;
  unint64_t v42 = 0x800000025F59A1B0;
  sub_25F597370();
  sub_25F597360();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5974F0();
  unint64_t v41 = MEMORY[0x263F8EE78];
  sub_25F57AFA0((unint64_t *)&qword_26B399EB8, MEMORY[0x263F8F198]);
  sub_25F572540(&qword_26B399EA0);
  sub_25F57AFE8((unint64_t *)&qword_26B399EA8, &qword_26B399EA0);
  sub_25F597A40();
  (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v38, *MEMORY[0x263F8F138], v40);
  uint64_t v31 = sub_25F597940();
  swift_release();
  sub_25F57B2B4();
  *(void *)((char *)v3 + *(void *)(v32 + 112)) = v31;
  return v3;
}

uint64_t TUSLazyPurgeable.deinit()
{
  if (*(void *)(v0 + *(void *)(*(void *)v0 + 120)))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F5978E0();
    swift_unknownObjectRelease();
  }
  sub_25F597970();
  sub_25F57B2E4();
  sub_25F579404();
  v1();
  swift_release();
  sub_25F57B2B4();

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TUSLazyPurgeable.__deallocating_deinit()
{
  TUSLazyPurgeable.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t TUSLazyPurgeable.run<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = *v3;
  return MEMORY[0x270FA2498](sub_25F57A8F8, v3, 0);
}

uint64_t sub_25F57A8F8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  sub_25F579A5C();
  sub_25F57B2D8();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  sub_25F57B2F0();
  uint64_t result = sub_25F577D8C(v4, 1, *(void *)(v2 + 80));
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 48))(v4);
    swift_endAccess();
    sub_25F57B2CC();
    return v6();
  }
  return result;
}

uint64_t TUSLazyPurgeable.run<A>(_:)()
{
  sub_25F57B2C0();
  v1[7] = v2;
  v1[8] = v0;
  v1[5] = v3;
  v1[6] = v4;
  sub_25F57B2D8();
  v1[9] = *(void *)(v5 + 80);
  uint64_t v6 = sub_25F597970();
  v1[10] = v6;
  v1[11] = *(void *)(v6 - 8);
  v1[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F57AAA8, v0, 0);
}

uint64_t sub_25F57AAA8()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v4 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[8];
  sub_25F579A5C();
  sub_25F57B2D8();
  uint64_t v7 = v5 + *(void *)(v6 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  uint64_t result = sub_25F577D8C(v1, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))(v0[6] + *(int *)v0[6]);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[13] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_25F57AC08;
    uint64_t v10 = v0[12];
    uint64_t v11 = v0[5];
    return v12(v11, v10);
  }
  return result;
}

uint64_t sub_25F57AC08()
{
  sub_25F57B2C0();
  sub_25F57B29C();
  uint64_t v2 = v1;
  *(void *)(v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    return MEMORY[0x270FA2498](sub_25F57AD48, v3, 0);
  }
  else
  {
    sub_25F57B2E4();
    sub_25F579404();
    v4();
    swift_task_dealloc();
    sub_25F57B2CC();
    return v5();
  }
}

uint64_t sub_25F57AD48()
{
  sub_25F57B2C0();
  sub_25F57B2E4();
  sub_25F579404();
  v0();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v1();
}

uint64_t TUSLazyPurgeable.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25F57ADDC()
{
  return TUSLazyPurgeable.unownedExecutor.getter();
}

uint64_t sub_25F57ADFC()
{
  uint64_t result = sub_25F597970();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for TUSLazyPurgeable()
{
  return sub_25F57B258();
}

uint64_t sub_25F57AED8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25F57AF10()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F57AF48()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F57AF80()
{
  return sub_25F57A07C();
}

uint64_t sub_25F57AF88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25F57AF98()
{
  return swift_release();
}

uint64_t sub_25F57AFA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F57AFE8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25F577CDC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F57B038()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F57B078(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25F57B12C;
  return sub_25F57A170(a1, v4, v5, v6);
}

uint64_t sub_25F57B12C()
{
  sub_25F57B2C0();
  sub_25F57B29C();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v0();
}

uint64_t *sub_25F57B1F4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25F57B258()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25F57B2CC()
{
  return v0 + 8;
}

uint64_t sub_25F57B2F0()
{
  return swift_beginAccess();
}

uint64_t initializeBufferWithCopyOfBuffer for TrialDecoder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrialDecoder(id *a1)
{
  swift_bridgeObjectRelease();
  return swift_unknownObjectWeakDestroy();
}

void *initializeWithCopy for TrialDecoder(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  a1[2] = *(void *)(a2 + 16);
  id v6 = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  a1[4] = *(void *)(a2 + 32);
  return a1;
}

uint64_t assignWithCopy for TrialDecoder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t initializeWithTake for TrialDecoder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectWeakTakeInit();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for TrialDecoder(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecoder(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
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

uint64_t storeEnumTagSinglePayload for TrialDecoder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TrialDecoder()
{
  return &type metadata for TrialDecoder;
}

uint64_t sub_25F57B5B8()
{
  sub_25F597AE0();
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v2 = sub_25F597530();
  uint64_t v3 = *(void **)v0;
  uint64_t v4 = *(void *)(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 16);
  MEMORY[0x2611F78E0](v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  swift_unknownObjectWeakInit();
  v9[0] = v1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v9[4] = v5;
  v9[6] = v6;
  swift_unknownObjectWeakAssign();
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  sub_25F57B6C0();
  return sub_25F5800A0((uint64_t)v9);
}

uint64_t sub_25F57B6C0()
{
  sub_25F5800D0();
  uint64_t v2 = swift_allocObject();
  sub_25F580174(v0, v2 + 16);
  return sub_25F5977D0();
}

uint64_t sub_25F57B758()
{
  uint64_t v1 = sub_25F597780();
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  MEMORY[0x2611F78E0](v0 + 5);
  uint64_t v5 = v0[6];
  id v6 = v2;
  swift_bridgeObjectRetain();
  sub_25F57B854(v1, MEMORY[0x263F8EE78], (uint64_t)v6, v3, v4, v5, v8);
  type metadata accessor for TrialDecoderImpl.KeyedContainer();
  swift_getWitnessTable();
  return sub_25F597B80();
}

uint64_t sub_25F57B854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[6] = a6;
  swift_unknownObjectWeakInit();
  return swift_unknownObjectRelease();
}

uint64_t sub_25F57B8A4@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = (uint64_t)&type metadata for TrialDecoderImpl.UnkeyedContainer;
  a1[4] = sub_25F57B9EC();
  uint64_t result = swift_allocObject();
  *a1 = result;
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *(void *)(result + 24) = 0;
  *(_WORD *)(result + 32) = 257;
  *(void *)(result + 40) = 0;
  return result;
}

unint64_t sub_25F57B910@<X0>(void *a1@<X8>)
{
  a1[3] = &type metadata for TrialDecoderImpl.SingleValueContainer;
  unint64_t result = sub_25F57B9A0();
  a1[4] = result;
  *a1 = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_25F57B958()
{
  return sub_25F57B758();
}

uint64_t sub_25F57B970@<X0>(uint64_t *a1@<X8>)
{
  return sub_25F57B8A4(a1);
}

unint64_t sub_25F57B988@<X0>(void *a1@<X8>)
{
  return sub_25F57B910(a1);
}

unint64_t sub_25F57B9A0()
{
  unint64_t result = qword_26A7AAAB0;
  if (!qword_26A7AAAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AAAB0);
  }
  return result;
}

unint64_t sub_25F57B9EC()
{
  unint64_t result = qword_26A7AAAB8;
  if (!qword_26A7AAAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AAAB8);
  }
  return result;
}

uint64_t sub_25F57BA38()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

BOOL sub_25F57BA70()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_25F597DC0();
  uint64_t v2 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25F5975C0();
  id v4 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v2, v3);

  if (v4) {
  return v4 != 0;
  }
}

uint64_t sub_25F57BB08()
{
  return 0;
}

uint64_t sub_25F57BB10()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_25F597DC0();
  uint64_t v2 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25F5975C0();
  id v4 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v2, v3);

  if (v4)
  {
    unsigned __int8 v5 = objc_msgSend(v4, sel_BOOLeanValue);
  }
  else
  {
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F597C40();
    unsigned __int8 v5 = 0;
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v6 = 0;
    *(void *)(v6 + 8) = 0xE000000000000000;
    *(unsigned char *)(v6 + 16) = 0;
    swift_willThrow();
  }
  return v5 & 1;
}

uint64_t sub_25F57BC68()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_25F597DC0();
  uint64_t v2 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25F5975C0();
  id v4 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v2, v3);

  if (v4 && (id v5 = objc_msgSend(v4, sel_stringValue), v4, v5))
  {
    uint64_t v6 = sub_25F5975F0();

    return v6;
  }
  else
  {
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F597C40();
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0xE000000000000000;
    *(unsigned char *)(v8 + 16) = 0;
    return swift_willThrow();
  }
}

void sub_25F57BDE8()
{
}

void sub_25F57BE00()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_25F597DC0();
  uint64_t v2 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25F5975C0();
  id v4 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v2, v3);

  if (v4)
  {
    objc_msgSend(v4, sel_doubleValue);
  }
  else
  {
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F597C40();
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0xE000000000000000;
    *(unsigned char *)(v5 + 16) = 0;
    swift_willThrow();
  }
}

void sub_25F57BF64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F5974C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F57BE00();
  if (!v2)
  {
    uint64_t v32 = a1;
    uint64_t v33 = v4;
    uint64_t v30 = v7;
    uint64_t v31 = v8;
    uint64_t v12 = v34;
    if (fabs(v11) <= 3.40282347e38)
    {
      uint64_t v16 = v10;
      sub_25F5974B0();
      uint64_t v17 = v6;
      uint64_t v18 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v6, v32, v33);
      uint64_t v19 = sub_25F5974A0();
      os_log_type_t v20 = sub_25F597810();
      int v21 = v20;
      if (os_log_type_enabled(v19, v20))
      {
        LODWORD(v32) = v21;
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v36 = v29;
        uint64_t v28 = v22;
        *(_DWORD *)uint64_t v22 = 136315138;
        v27[1] = v22 + 4;
        uint64_t v23 = sub_25F597B90();
        uint64_t v35 = sub_25F5718D4(v23, v24, &v36);
        sub_25F597980();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v18);
        uint64_t v25 = v28;
        _os_log_impl(&dword_25F56F000, v19, (os_log_type_t)v32, "Decoded factor %s into Float so be aware of possible precision loss", v28, 0xCu);
        uint64_t v26 = v29;
        swift_arrayDestroy();
        MEMORY[0x2611F77E0](v26, -1, -1);
        MEMORY[0x2611F77E0](v25, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v18);
      }

      (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
    }
    else
    {
      uint64_t v36 = 0;
      unint64_t v37 = 0xE000000000000000;
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F5977C0();
      sub_25F5976D0();
      uint64_t v13 = v36;
      unint64_t v14 = v37;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v15 = v13;
      *(void *)(v15 + 8) = v14;
      *(unsigned char *)(v15 + 16) = 0;
      swift_willThrow();
    }
  }
}

uint64_t sub_25F57C350()
{
  uint64_t v1 = sub_25F57C4A8();
  uint64_t v2 = v1;
  if (!v0 && (unint64_t)(v1 + 0x7FFFFFFFFFFFFFFFLL) > 0xFFFFFFFFFFFFFFFDLL)
  {
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F597C40();
    sub_25F5976D0();
    sub_25F597B90();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0xE000000000000000;
    *(unsigned char *)(v3 + 16) = 0;
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_25F57C4A8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_25F597DC0();
  uint64_t v2 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25F5975C0();
  id v4 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v2, v3);

  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_longValue);

    return (uint64_t)v5;
  }
  else
  {
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F597C40();
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0xE000000000000000;
    *(unsigned char *)(v7 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_25F57C604()
{
  uint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    uint64_t v0 = v2;
    if ((unint64_t)(v2 + 127) >= 0xFE)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      uint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_25F57C758()
{
  uint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    uint64_t v0 = v2;
    if ((unint64_t)(v2 + 0x7FFF) >= 0xFFFE)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      uint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_25F57C8B4()
{
  uint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    uint64_t v0 = v2;
    if ((unint64_t)(v2 + 0x7FFFFFFF) >= 0xFFFFFFFE)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      uint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_25F57CA10()
{
  return sub_25F57C4A8();
}

uint64_t sub_25F57CA28()
{
  uint64_t result = sub_25F57C4A8();
  if (!v0)
  {
    if (result > 0)
    {
      __break(1u);
    }
    else
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v2 = 0;
      *(void *)(v2 + 8) = 0xE000000000000000;
      *(unsigned char *)(v2 + 16) = 0;
      return swift_willThrow();
    }
  }
  return result;
}

unint64_t sub_25F57CB78()
{
  unint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    unint64_t v0 = v2;
    if (v2 >= 0xFF)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      unint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

unint64_t sub_25F57CCC8()
{
  unint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    unint64_t v0 = v2;
    if (v2 >= 0xFFFF)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      unint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

unint64_t sub_25F57CE1C()
{
  unint64_t v2 = sub_25F57C4A8();
  if (!v1)
  {
    unint64_t v0 = v2;
    if (v2 >= 0xFFFFFFFF)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      unint64_t v0 = 0;
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0xE000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_25F57CF70()
{
  uint64_t result = sub_25F57C4A8();
  if (!v0)
  {
    if (result < 0)
    {
      sub_25F597A90();
      sub_25F5976D0();
      sub_25F597C40();
      sub_25F5976D0();
      sub_25F597B90();
      sub_25F5976D0();
      swift_bridgeObjectRelease();
      sub_25F5976D0();
      sub_25F580650();
      swift_allocError();
      *(void *)uint64_t v2 = 0;
      *(void *)(v2 + 8) = 0xE000000000000000;
      *(unsigned char *)(v2 + 16) = 0;
      return swift_willThrow();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_25F57D0BC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v80 = a2;
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_25F572540(&qword_26B399CB0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v84 = &v71[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_25F572540(&qword_26B399A38);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v77 = &v71[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v79 = sub_25F5972C0();
  uint64_t v78 = *(void *)(v79 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v79);
  uint64_t v75 = &v71[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v76 = &v71[-v11];
  uint64_t v88 = sub_25F5974C0();
  uint64_t v12 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  unint64_t v14 = &v71[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 24);
  uint64_t v85 = a1;
  uint64_t v81 = v16;
  uint64_t v82 = v15;
  uint64_t v17 = sub_25F597DC0();
  unint64_t v19 = v18;
  os_log_type_t v20 = *(void **)(v2 + 16);
  int v21 = (void *)sub_25F5975C0();
  uint64_t v83 = v3;
  uint64_t v22 = (void *)sub_25F5975C0();
  id v23 = objc_msgSend(v20, sel_levelForFactor_withNamespaceName_, v21, v22);

  if (!v23)
  {
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    sub_25F597A90();
    swift_bridgeObjectRelease();
    uint64_t v92 = 0xD00000000000002ALL;
    unint64_t v93 = 0x800000025F59AFB0;
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    uint64_t v34 = v92;
    unint64_t v35 = v93;
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v36 = v34;
    *(void *)(v36 + 8) = v35;
    *(unsigned char *)(v36 + 16) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v87 = v17;
  unsigned int v24 = objc_msgSend(v23, sel_levelOneOfCase);
  sub_25F5974B0();
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_25F5974A0();
  os_log_type_t v26 = sub_25F597810();
  BOOL v27 = os_log_type_enabled(v25, v26);
  unint64_t v86 = v19;
  if (v27)
  {
    BOOL v72 = v24 == 100;
    uint64_t v28 = swift_slowAlloc();
    unsigned int v74 = v24;
    uint64_t v29 = v28;
    uint64_t v30 = swift_slowAlloc();
    id v73 = v23;
    uint64_t v31 = v30;
    uint64_t v92 = v30;
    *(_DWORD *)uint64_t v29 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v90 = sub_25F5718D4(v87, v19, &v92);
    sub_25F597980();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v29 + 12) = 1024;
    LODWORD(v90) = v72;
    sub_25F597980();
    _os_log_impl(&dword_25F56F000, v25, v26, "Factor %s is interpreted as file(%{BOOL}d)", (uint8_t *)v29, 0x12u);
    swift_arrayDestroy();
    uint64_t v32 = v31;
    id v23 = v73;
    MEMORY[0x2611F77E0](v32, -1, -1);
    uint64_t v33 = v29;
    unsigned int v24 = v74;
    MEMORY[0x2611F77E0](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v88);
  unint64_t v37 = &selRef_directoryValue;
  if (v24 == 100) {
    unint64_t v37 = &selRef_fileValue;
  }
  id v38 = [v23 *v37];
  if (!v38)
  {
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    sub_25F597A90();
    swift_bridgeObjectRelease();
    uint64_t v92 = 0xD00000000000001CLL;
    unint64_t v93 = 0x800000025F59AFE0;
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    uint64_t v53 = v92;
    unint64_t v54 = v93;
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v55 = v53;
    *(void *)(v55 + 8) = v54;
    *(unsigned char *)(v55 + 16) = 0;
    swift_willThrow();

    return;
  }
  id v39 = v38;
  if ((objc_msgSend(v39, sel_hasAsset) & 1) == 0 && !objc_msgSend(v39, sel_isOnDemand))
  {
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (!objc_msgSend(v39, sel_hasPath))
  {
    uint64_t v56 = sub_25F5977B0();
    v57 = v84;
    sub_25F5721D0((uint64_t)v84, 1, 1, v56);
    uint64_t v58 = v85;
    uint64_t v59 = *(void *)(v85 - 8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v59 + 16))(&v92, v83, v85);
    uint64_t v60 = (void *)swift_allocObject();
    v60[2] = 0;
    v60[3] = 0;
    uint64_t v61 = v81;
    v60[4] = v82;
    v60[5] = v61;
    (*(void (**)(void *, uint64_t *, uint64_t))(v59 + 32))(v60 + 6, &v92, v58);
    unint64_t v62 = v86;
    v60[13] = v87;
    v60[14] = v62;
    swift_bridgeObjectRetain();
    sub_25F587798((uint64_t)v57, (uint64_t)&unk_26A7AAAD0, (uint64_t)v60);
    swift_release();
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
LABEL_24:
    sub_25F5976D0();
LABEL_27:
    uint64_t v68 = v92;
    unint64_t v69 = v93;
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v70 = v68;
    *(void *)(v70 + 8) = v69;
    *(unsigned char *)(v70 + 16) = 0;
    swift_willThrow();

    return;
  }
  BOOL v89 = v24 != 100;
  id v40 = objc_msgSend(self, sel_defaultManager);
  id v41 = objc_msgSend(v39, sel_path);
  if (!v41)
  {
    __break(1u);
    return;
  }
  unsigned int v42 = v24;
  uint64_t v43 = v41;
  unsigned int v74 = v42;
  BOOL v44 = v42 != 100;
  unsigned int v45 = objc_msgSend(v40, sel_fileExistsAtPath_isDirectory_, v41, &v89);

  if (!v45 || ((v44 ^ v89) & 1) != 0 || (id v46 = objc_msgSend(v39, sel_path)) == 0)
  {
    uint64_t v92 = 0;
    unint64_t v93 = 0xE000000000000000;
    sub_25F597A90();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    id v63 = objc_msgSend(v39, sel_path);
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = sub_25F5975F0();
      uint64_t v67 = v66;
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v67 = 0;
    }
    uint64_t v90 = v65;
    uint64_t v91 = v67;
    sub_25F572540(&qword_26B399C90);
    sub_25F597630();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v47 = v46;
  swift_bridgeObjectRelease();
  uint64_t v88 = sub_25F5975F0();

  uint64_t v48 = v78;
  uint64_t v49 = (unsigned int *)MEMORY[0x263F06E30];
  if (v74 == 100) {
    uint64_t v49 = (unsigned int *)MEMORY[0x263F06E38];
  }
  uint64_t v50 = v76;
  uint64_t v51 = v79;
  (*(void (**)(unsigned char *, void, uint64_t))(v78 + 104))(v76, *v49, v79);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v48 + 16))(v75, v50, v51);
  uint64_t v52 = sub_25F5972F0();
  sub_25F5721D0((uint64_t)v77, 1, 1, v52);
  sub_25F5972E0();

  (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v50, v51);
}

uint64_t sub_25F57DBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = sub_25F5974C0();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F57DCA8, 0, 0);
}

uint64_t sub_25F57DCA8()
{
  id v23 = v0;
  uint64_t v1 = MEMORY[0x2611F78E0](v0[3] + 40);
  v0[9] = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0[3] + 48);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 8) + **(int **)(v2 + 8));
    id v4 = (void *)swift_task_alloc();
    v0[10] = v4;
    *id v4 = v0;
    v4[1] = sub_25F57DF8C;
    uint64_t v6 = v0[4];
    uint64_t v5 = v0[5];
    return v19(v6, v5, ObjectType, v2);
  }
  else
  {
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_25F5974A0();
    os_log_type_t v9 = sub_25F597830();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[7];
    uint64_t v11 = v0[8];
    unint64_t v14 = v0[5];
    uint64_t v13 = v0[6];
    if (v10)
    {
      uint64_t v18 = v0[4];
      uint64_t v21 = v0[6];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = v11;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = sub_25F5718D4(v18, v14, &v22);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v8, v9, "Factor downloader is nil unable to request download for factor %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F77E0](v16, -1, -1);
      MEMORY[0x2611F77E0](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v20, v21);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_25F57DF8C()
{
  sub_25F57B29C();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25F57E064, 0, 0);
}

uint64_t sub_25F57E064()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25F57E0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a4;
  uint64_t v5 = v4;
  uint64_t v8 = sub_25F5972F0();
  MEMORY[0x270FA5388](v8);
  BOOL v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a3 - 8);
  uint64_t v12 = v5;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v24, v5, a3);
  if (v8 != a1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v24, a3);
LABEL_4:
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_25F597A90();
    sub_25F5976D0();
    uint64_t v26 = v21;
    swift_getMetatypeMetadata();
    sub_25F597650();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    sub_25F597C40();
    sub_25F5976D0();
    uint64_t v15 = *(void *)(v12 + 8);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25F572540(&qword_26A7AAAC0);
    MEMORY[0x2611F6880](v15, v16);
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = v22;
    unint64_t v18 = v23;
    sub_25F580650();
    swift_allocError();
    *(void *)uint64_t v19 = v17;
    *(void *)(v19 + 8) = v18;
    *(unsigned char *)(v19 + 16) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v13 = v20[1];
  uint64_t v14 = *(void *)(v25 + 16);
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v24, a3);
  if (v14) {
    goto LABEL_4;
  }
  sub_25F57D0BC(a3, (uint64_t)v10);
  if (!v13) {
    swift_dynamicCast();
  }
}

uint64_t sub_25F57E36C()
{
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD000000000000019;
  *(void *)(v0 + 8) = 0x800000025F59AF70;
  *(unsigned char *)(v0 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_25F57E3D4()
{
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD000000000000016;
  *(void *)(v0 + 8) = 0x800000025F59AF20;
  *(unsigned char *)(v0 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_25F57E43C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25F580650();
  sub_25F580B68();
  *(void *)uint64_t v6 = a3;
  *(void *)(v6 + 8) = a4;
  *(unsigned char *)(v6 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_25F57E494()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F57E49C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F57E4A8()
{
  return sub_25F57BB08() & 1;
}

uint64_t sub_25F57E4C4()
{
  return sub_25F57BB10() & 1;
}

uint64_t sub_25F57E4E0()
{
  return sub_25F57BC68();
}

void sub_25F57E4F8()
{
}

void sub_25F57E510(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25F57E528()
{
  return sub_25F57C350();
}

uint64_t sub_25F57E540()
{
  return sub_25F57C604();
}

uint64_t sub_25F57E558()
{
  return sub_25F57C758();
}

uint64_t sub_25F57E570()
{
  return sub_25F57C8B4();
}

uint64_t sub_25F57E588()
{
  return sub_25F57CA10();
}

uint64_t sub_25F57E5A0()
{
  return sub_25F597D00();
}

uint64_t sub_25F57E5B8()
{
  return sub_25F57CA28();
}

unint64_t sub_25F57E5D0()
{
  return sub_25F57CB78();
}

unint64_t sub_25F57E5E8()
{
  return sub_25F57CCC8();
}

unint64_t sub_25F57E600()
{
  return sub_25F57CE1C();
}

uint64_t sub_25F57E618()
{
  return sub_25F57CF70();
}

uint64_t sub_25F57E630()
{
  return sub_25F597D10();
}

void sub_25F57E648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_25F57E670()
{
  return sub_25F597C90();
}

uint64_t sub_25F57E688()
{
  return sub_25F597C80();
}

uint64_t sub_25F57E6A0()
{
  uint64_t result = sub_25F597CA0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57E6C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E8E8(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_25F57E6F0()
{
  uint64_t result = sub_25F597CB0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57E714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E838(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_25F57E740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E890(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_25F57E76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E8E8(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_25F57E798()
{
  uint64_t result = sub_25F597CE0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57E7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E960(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_25F57E7E8()
{
  uint64_t result = sub_25F597CC0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57E80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E838(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_25F57E838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  __int16 v4 = a4();
  return sub_25F580C2C(v4 & 0x1FF);
}

uint64_t sub_25F57E864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E890(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_25F57E890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  return sub_25F580C2C(v4 & 0x1FFFF);
}

uint64_t sub_25F57E8BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E8E8(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_25F57E8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return sub_25F580BC0(v4);
}

uint64_t sub_25F57E910()
{
  uint64_t result = sub_25F597CF0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57E934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F57E960(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_25F57E960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_25F57E98C()
{
  return sub_25F597CD0();
}

uint64_t sub_25F57E9B8()
{
  return sub_25F57E36C();
}

uint64_t sub_25F57E9E0(uint64_t a1, uint64_t a2)
{
  return sub_25F57E43C(a1, a2, 0xD000000000000020, 0x800000025F59AF40);
}

uint64_t sub_25F57EA10()
{
  return sub_25F57E3D4();
}

uint64_t sub_25F57EA28(uint64_t a1, uint64_t a2)
{
  return sub_25F57E43C(a1, a2, 0xD00000000000001FLL, 0x800000025F59AF00);
}

uint64_t sub_25F57EA58()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  swift_willThrow();
  return 0;
}

uint64_t sub_25F57EB44()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F57EC2C()
{
  sub_25F580ACC();
  sub_25F580AA8();
  sub_25F580BD8();
  sub_25F572540(&qword_26A7AAAC0);
  sub_25F580BA8();
  sub_25F580B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  uint64_t v0 = sub_25F580B68();
  return sub_25F580B20(v0, v1);
}

uint64_t sub_25F57ECA8()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  swift_willThrow();
  return 0;
}

uint64_t sub_25F57ED94()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F57EE7C()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F57EF64()
{
  sub_25F597A90();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F57F04C()
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_getMetatypeMetadata();
  sub_25F597650();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5976D0();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](v1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F57F188()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_25F57F194()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_25F57F19C()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_25F57F1A4()
{
  return sub_25F57EA58() & 1;
}

uint64_t sub_25F57F1C0()
{
  return sub_25F57ECA8() & 1;
}

uint64_t sub_25F57F1DC()
{
  return sub_25F57ED94();
}

uint64_t sub_25F57F1F4()
{
  return sub_25F57EE7C();
}

uint64_t sub_25F57F20C()
{
  return sub_25F57EF64();
}

uint64_t sub_25F57F224()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F258()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F28C()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F2C0()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F2F4()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F328()
{
  return sub_25F597C20();
}

uint64_t sub_25F57F340()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F374()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F3A8()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F3DC()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F410()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F444()
{
  return sub_25F597C30();
}

uint64_t sub_25F57F45C()
{
  return sub_25F57F04C();
}

uint64_t sub_25F57F474()
{
  return sub_25F597BB0();
}

uint64_t sub_25F57F48C()
{
  return sub_25F597BA0();
}

uint64_t sub_25F57F4A4()
{
  uint64_t result = sub_25F597BC0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57F4C8(uint64_t a1, uint64_t a2)
{
  return sub_25F57F6EC(a1, a2, MEMORY[0x263F8E110]);
}

uint64_t sub_25F57F4F4()
{
  uint64_t result = sub_25F597BD0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57F518(uint64_t a1, uint64_t a2)
{
  return sub_25F57F63C(a1, a2, MEMORY[0x263F8E118]);
}

uint64_t sub_25F57F544(uint64_t a1, uint64_t a2)
{
  return sub_25F57F694(a1, a2, MEMORY[0x263F8E120]);
}

uint64_t sub_25F57F570(uint64_t a1, uint64_t a2)
{
  return sub_25F57F6EC(a1, a2, MEMORY[0x263F8E128]);
}

uint64_t sub_25F57F59C()
{
  uint64_t result = sub_25F597C00();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57F5C0(uint64_t a1, uint64_t a2)
{
  return sub_25F57F764(a1, a2, MEMORY[0x263F8E138]);
}

uint64_t sub_25F57F5EC()
{
  uint64_t result = sub_25F597BE0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57F610(uint64_t a1, uint64_t a2)
{
  return sub_25F57F63C(a1, a2, MEMORY[0x263F8E130]);
}

uint64_t sub_25F57F63C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  __int16 v3 = a3();
  return sub_25F580C2C(v3 & 0x1FF);
}

uint64_t sub_25F57F668(uint64_t a1, uint64_t a2)
{
  return sub_25F57F694(a1, a2, MEMORY[0x263F8E140]);
}

uint64_t sub_25F57F694(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  return sub_25F580C2C(v3 & 0x1FFFF);
}

uint64_t sub_25F57F6C0(uint64_t a1, uint64_t a2)
{
  return sub_25F57F6EC(a1, a2, MEMORY[0x263F8E148]);
}

uint64_t sub_25F57F6EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return sub_25F580BC0(v3);
}

uint64_t sub_25F57F714()
{
  uint64_t result = sub_25F597C10();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_25F57F738(uint64_t a1, uint64_t a2)
{
  return sub_25F57F764(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t sub_25F57F764(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_25F57F790()
{
  return sub_25F597BF0();
}

uint64_t sub_25F57F7BC()
{
  return sub_25F57EB44();
}

uint64_t sub_25F57F7D4()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F808()
{
  return sub_25F57EC2C();
}

uint64_t sub_25F57F83C(uint64_t a1)
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](a1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 2;
  swift_willThrow();
  return 0;
}

uint64_t sub_25F57F924(uint64_t a1)
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](a1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_25F57FA08(uint64_t a1)
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](a1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_25F57FAEC(uint64_t a1)
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](a1, v2);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_25F57FBD0()
{
  sub_25F580AF4();
  sub_25F580AA8();
  swift_bridgeObjectRetain();
  sub_25F572540(&qword_26A7AAAC0);
  sub_25F580BF0();
  sub_25F580C08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  uint64_t v0 = sub_25F580B68();
  return sub_25F580B44(v0, v1);
}

uint64_t sub_25F57FC50(uint64_t a1, uint64_t a2)
{
  sub_25F597A90();
  sub_25F5976D0();
  swift_getMetatypeMetadata();
  sub_25F597650();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5976D0();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25F572540(&qword_26A7AAAC0);
  MEMORY[0x2611F6880](a2, v3);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F580650();
  swift_allocError();
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0xE000000000000000;
  *(unsigned char *)(v4 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_25F57FD88()
{
  return sub_25F57BB08();
}

uint64_t sub_25F57FD90()
{
  return sub_25F57F83C(*v0) & 1;
}

uint64_t sub_25F57FDB0()
{
  return sub_25F57F924(*v0);
}

uint64_t sub_25F57FDCC()
{
  return sub_25F57FA08(*v0);
}

uint64_t sub_25F57FDE8()
{
  return sub_25F57FAEC(*v0);
}

uint64_t sub_25F57FE04()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FE3C()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FE74()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FEAC()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FEE4()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FF1C()
{
  return sub_25F597C60();
}

uint64_t sub_25F57FF34()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FF6C()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FFA4()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F57FFDC()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F580014()
{
  return sub_25F57FBD0();
}

uint64_t sub_25F58004C()
{
  return sub_25F597C70();
}

uint64_t sub_25F580064(uint64_t a1)
{
  return sub_25F57FC50(a1, *v1);
}

uint64_t type metadata accessor for TrialDecoderImpl.KeyedContainer()
{
  return sub_25F57B258();
}

uint64_t sub_25F5800A0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25F5800D0()
{
  unint64_t result = qword_26B399BD8;
  if (!qword_26B399BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399BD8);
  }
  return result;
}

uint64_t sub_25F58011C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25F580174(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25F5801AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t destroy for TrialDecoderImpl.UnkeyedContainer()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for TrialDecoderImpl.UnkeyedContainer(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecoderImpl.UnkeyedContainer(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for TrialDecoderImpl.UnkeyedContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialDecoderImpl.UnkeyedContainer()
{
  return &type metadata for TrialDecoderImpl.UnkeyedContainer;
}

ValueMetadata *type metadata accessor for TrialDecoderImpl.SingleValueContainer()
{
  return &type metadata for TrialDecoderImpl.SingleValueContainer;
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_unknownObjectWeakDestroy();
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwcp_0()
{
  sub_25F580C20();
  uint64_t v2 = v1[1];
  void *v0 = *v1;
  v0[1] = v2;
  uint64_t v4 = (void *)v1[2];
  uint64_t v3 = v1[3];
  v0[2] = v4;
  v0[3] = v3;
  v0[4] = v1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  return sub_25F580B80();
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwca_0()
{
  sub_25F580C20();
  *uint64_t v1 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v1[1] = v0[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = (void *)v1[2];
  v1[2] = v3;
  id v5 = v3;

  v1[3] = v0[3];
  v1[4] = v0[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  return sub_25F580B80();
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwtk_0()
{
  sub_25F580C20();
  *(_OWORD *)uint64_t v1 = *(_OWORD *)v0;
  *(void *)(v1 + 16) = *(void *)(v0 + 16);
  *(_OWORD *)(v1 + 24) = *(_OWORD *)(v0 + 24);
  swift_unknownObjectWeakTakeInit();
  return sub_25F580B80();
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwta_0()
{
  sub_25F580C20();
  *uint64_t v1 = *v2;
  swift_bridgeObjectRelease();
  v1[1] = v0[1];
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)v1[2];
  v1[2] = v0[2];

  uint64_t v4 = v0[4];
  v1[3] = v0[3];
  v1[4] = v4;
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  return sub_25F580B80();
}

uint64_t _s23TextUnderstandingShared16TrialDecoderImplVwet_0(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
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

uint64_t sub_25F5805EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialDecoderImpl()
{
  return &type metadata for TrialDecoderImpl;
}

uint64_t sub_25F580648(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

unint64_t sub_25F580650()
{
  unint64_t result = qword_26B399BE0;
  if (!qword_26B399BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399BE0);
  }
  return result;
}

uint64_t sub_25F58069C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_25F580704(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 6);
  uint64_t v8 = v1[13];
  uint64_t v7 = v1[14];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25F5807E0;
  return sub_25F57DBE4(a1, v4, v5, v6, v8, v7);
}

uint64_t sub_25F5807E0()
{
  sub_25F57B29C();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25F5808B4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for TrialDecodingError(uint64_t a1)
{
  return sub_25F5808DC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25F5808DC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s23TextUnderstandingShared18TrialDecodingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25F5808B4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TrialDecodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25F5808B4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25F5808DC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for TrialDecodingError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TrialDecodingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25F5808DC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecodingError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialDecodingError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25F580A78(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25F580A84(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialDecodingError()
{
  return &type metadata for TrialDecodingError;
}

uint64_t sub_25F580AA8()
{
  return sub_25F5976D0();
}

uint64_t sub_25F580ACC()
{
  return sub_25F597A90();
}

uint64_t sub_25F580AF4()
{
  return sub_25F597A90();
}

uint64_t sub_25F580B20(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_25F580B44(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_25F580B68()
{
  return swift_allocError();
}

uint64_t sub_25F580B80()
{
  *(void *)(v1 + 48) = *(void *)(v0 + 48);
  return v1;
}

uint64_t sub_25F580B90()
{
  return sub_25F5976D0();
}

void sub_25F580BA8()
{
  JUMPOUT(0x2611F6880);
}

uint64_t sub_25F580BC0(unint64_t a1)
{
  return a1 | ((HIDWORD(a1) & 1) << 32);
}

uint64_t sub_25F580BD8()
{
  return swift_bridgeObjectRetain();
}

void sub_25F580BF0()
{
  JUMPOUT(0x2611F6880);
}

uint64_t sub_25F580C08()
{
  return sub_25F5976D0();
}

uint64_t sub_25F580C2C@<X0>(unsigned int a1@<W8>)
{
  return a1;
}

uint64_t static NSProcessInfo.processNameForPID(_:)(int a1)
{
  uint64_t v2 = sub_25F597620();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = (void *)swift_slowAlloc();
  if (proc_name(a1, v3, 0x400u) < 0)
  {
    MEMORY[0x2611F77E0](v3, -1, -1);
    return 0;
  }
  else
  {
    sub_25F597610();
    uint64_t v4 = sub_25F597600();
    MEMORY[0x2611F77E0](v3, -1, -1);
  }
  return v4;
}

id static OVSResolver.containsOVS(in:localeIdentifier:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  if (!a1)
  {
    uint64_t v4 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v4 = (void *)sub_25F597740();
  if (v3) {
LABEL_3:
  }
    uint64_t v3 = (void *)sub_25F5975C0();
LABEL_4:
  id v5 = objc_msgSend(self, sel_containsOVSInTokens_forLocaleIdentifier_, v4, v3);

  return v5;
}

ValueMetadata *type metadata accessor for OVSResolver()
{
  return &type metadata for OVSResolver;
}

BOOL static LearnFromThisAppCheckerApplication.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t LearnFromThisAppCheckerApplication.hash(into:)()
{
  return sub_25F597DA0();
}

uint64_t LearnFromThisAppCheckerApplication.hashValue.getter()
{
  return sub_25F597DB0();
}

BOOL sub_25F580E3C(char *a1, char *a2)
{
  return static LearnFromThisAppCheckerApplication.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_25F580E48()
{
  return LearnFromThisAppCheckerApplication.hashValue.getter();
}

uint64_t sub_25F580E50()
{
  return LearnFromThisAppCheckerApplication.hash(into:)();
}

uint64_t sub_25F580E58()
{
  return sub_25F597DB0();
}

uint64_t static LearnFromThisAppChecker.isLearningAllowed(application:)(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = "com.apple.mobilecal";
      goto LABEL_15;
    case 2:
      uint64_t v2 = "com.apple.freeform";
      goto LABEL_28;
    case 3:
      if (((unint64_t)"com.apple.MobileSMS" & 0x2000000000000000) == 0
        || (((unint64_t)"com.apple.MobileSMS" >> 56) & 0xF) != 0)
      {
        goto LABEL_34;
      }
      return 0;
    case 4:
      goto LABEL_35;
    case 5:
      uint64_t v1 = "com.apple.MobileSMS";
      goto LABEL_15;
    case 6:
      if (((unint64_t)"com.apple.mobileslideshow" & 0x2000000000000000) == 0
        || (((unint64_t)"com.apple.mobileslideshow" >> 56) & 0xF) != 0)
      {
        goto LABEL_34;
      }
      return 0;
    case 7:
      if (((unint64_t)"com.apple.podcasts" & 0x2000000000000000) == 0
        || (((unint64_t)"com.apple.podcasts" >> 56) & 0xF) != 0)
      {
        goto LABEL_34;
      }
      return 0;
    case 8:
      uint64_t v2 = "com.apple.podcasts";
LABEL_28:
      uint64_t v4 = v2 - 32;
      if (((unint64_t)v4 & 0x2000000000000000) == 0 || (((unint64_t)v4 >> 56) & 0xF) != 0) {
        goto LABEL_34;
      }
      return 0;
    case 9:
      uint64_t v1 = "com.apple.reminders";
LABEL_15:
      uint64_t v3 = v1 - 32;
      if (((unint64_t)v3 & 0x2000000000000000) == 0 || (((unint64_t)v3 >> 56) & 0xF) != 0) {
        goto LABEL_35;
      }
      return 0;
    case 10:
      if (((unint64_t)"com.apple.weather" & 0x2000000000000000) != 0
        && (((unint64_t)"com.apple.weather" >> 56) & 0xF) == 0)
      {
        return 0;
      }
      goto LABEL_34;
    case 11:
      if (((unint64_t)"com.apple.MobileAddressBook" & 0x2000000000000000) == 0
        || (((unint64_t)"com.apple.MobileAddressBook" >> 56) & 0xF) != 0)
      {
        goto LABEL_34;
      }
      return 0;
    case 12:
      if (((unint64_t)" String for key " & 0x2000000000000000) == 0
        || (((unint64_t)" String for key " >> 56) & 0xF) != 0)
      {
        goto LABEL_34;
      }
      return 0;
    default:
      if (((unint64_t)"com.apple.mobilecal" & 0x2000000000000000) != 0
        && (((unint64_t)"com.apple.mobilecal" >> 56) & 0xF) == 0)
      {
        return 0;
      }
LABEL_34:
      sub_25F58137C();
LABEL_35:
      unsigned __int8 v6 = (void *)sub_25F5975C0();
      uint64_t v5 = sub_25F581110(v6);

      return v5;
  }
}

uint64_t static LearnFromThisAppChecker.isLearningAllowed(bundleIdentifier:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)sub_25F5975C0();
  uint64_t v4 = sub_25F581110(v3);

  return v4;
}

uint64_t sub_25F581110(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (id)(id)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  int v3 = [v2 containsObject:v1];

  return v3 ^ 1u;
}

unint64_t sub_25F581178()
{
  unint64_t result = qword_26A7AAAD8;
  if (!qword_26A7AAAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AAAD8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LearnFromThisAppCheckerApplication(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LearnFromThisAppCheckerApplication(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF4)
  {
    if (a2 + 12 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 12) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v5 = v6 - 13;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for LearnFromThisAppCheckerApplication(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x25F581324);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t sub_25F58134C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25F581354(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LearnFromThisAppCheckerApplication()
{
  return &type metadata for LearnFromThisAppCheckerApplication;
}

ValueMetadata *type metadata accessor for LearnFromThisAppChecker()
{
  return &type metadata for LearnFromThisAppChecker;
}

uint64_t sub_25F58138C()
{
  uint64_t v0 = sub_25F5975F0();
  uint64_t v2 = v1;
  if (v0 == sub_25F5975F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25F586680();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25F5813FC()
{
  uint64_t result = sub_25F5975C0();
  qword_26A7AAAE0 = result;
  return result;
}

uint64_t sub_25F581434()
{
  uint64_t result = sub_25F5975C0();
  qword_26A7AAAE8 = result;
  return result;
}

uint64_t sub_25F581468()
{
  uint64_t result = sub_25F5975C0();
  qword_26A7AAAF0 = result;
  return result;
}

uint64_t sub_25F58149C()
{
  uint64_t result = sub_25F5975C0();
  qword_26A7AAAF8 = result;
  return result;
}

uint64_t sub_25F5814D4()
{
  uint64_t result = sub_25F5975C0();
  qword_26A7AAB00 = result;
  return result;
}

void *sub_25F581510()
{
  uint64_t result = (void *)sub_25F5975C0();
  off_26A7AAB08 = result;
  return result;
}

id sub_25F581548()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id result = sub_25F5861EC(0xD000000000000084, 0x800000025F59B4A0, 1);
  qword_26A7AAB10 = (uint64_t)result;
  return result;
}

void String.digitsOnly.getter()
{
  sub_25F5868FC();
  sub_25F580C20();
  uint64_t v3 = sub_25F597270();
  sub_25F5791BC();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_25F5867C8();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - v8;
  uint64_t v12 = v1;
  uint64_t v13 = v0;
  sub_25F597220();
  sub_25F597260();
  BOOL v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v9, v3);
  sub_25F572184();
  uint64_t v11 = sub_25F5979A0();
  v10(v2, v3);
  uint64_t v12 = v11;
  sub_25F572540(&qword_26B399CA0);
  sub_25F5865B8((unint64_t *)&qword_26B399CA8, &qword_26B399CA0);
  sub_25F5975A0();
  swift_bridgeObjectRelease();
  sub_25F586850();
}

BOOL String.containsAPhoneNumber.getter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08770]);
  id v1 = sub_25F5862C8(2048);
  uint64_t v3 = v1;
  if (!v1) {
    return 0;
  }
  uint64_t v4 = (void *)sub_25F5975C0();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25F597700();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_matchesInString_options_range_, v4, 0, 0, v5);

  sub_25F572148(0, &qword_26A7AAB18);
  unint64_t v7 = sub_25F597750();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25F597B30();

    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
  }
  return v8 != 0;
}

uint64_t String.looksLikeAnEmailAddress.getter()
{
  sub_25F580C20();
  if (qword_26A7AA808 != -1) {
    swift_once();
  }
  if (!qword_26A7AAB10) {
    return 0;
  }
  id v0 = (id)qword_26A7AAB10;
  id v1 = (void *)sub_25F5975C0();
  id v2 = objc_msgSend(v0, sel_firstMatchInString_options_range_, v1, 0, 0, sub_25F5869F8());

  if (!v2) {
    return 0;
  }

  return 1;
}

uint64_t String.looksLikeAPhoneShortCode.getter()
{
  sub_25F580C20();
  int v0 = ((sub_25F586928() & 1) != 0 || (sub_25F586928() & 1) != 0) && sub_25F5869F8() >= 5 && sub_25F5869F8() < 10;
  if (sub_25F5869F8() <= 7) {
    v0 |= sub_25F586928();
  }
  String.digitsOnly.getter();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  if ((sub_25F586928() & 1) != 0 && sub_25F597690() == 7) {
    LOBYTE(v0) = 1;
  }
  if ((v4 & 0x2000000000000000) != 0)
  {
    if ((v4 & 0xF00000000000000) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return v0 & 1;
  }
  if ((v2 & 0xFFFFFFFFFFFFLL) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v5 = sub_25F597690();
  swift_bridgeObjectRelease();
  LOBYTE(v0) = (v5 < 7) | v0;
  return v0 & 1;
}

Swift::String_optional __swiftcall String.primaryLanguageTag()()
{
  sub_25F580C20();
  int v0 = self;
  uint64_t v1 = (void *)sub_25F5975C0();
  id v2 = objc_msgSend(v0, sel_dominantLanguageForString_, v1);

  if (v2)
  {
    uint64_t v3 = sub_25F5975F0();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = v3;
  unint64_t v7 = v5;
  result.value._object = v7;
  result.value._uint64_t countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall String.lemmatized()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v4 = sub_25F5866C4();
  *(_OWORD *)(v4 + 16) = xmmword_25F5995B0;
  uint64_t v5 = (void *)*MEMORY[0x263F13FA0];
  *(void *)(v4 + 32) = *MEMORY[0x263F13FA0];
  id v6 = v5;
  id v7 = sub_25F581C9C();
  sub_25F586420(v3, v2, v7);
  sub_25F586960();
  sub_25F597950();
  swift_bridgeObjectRetain();
  sub_25F572540(&qword_26B399CA0);
  sub_25F5865B8((unint64_t *)&qword_26B399CA8, &qword_26B399CA0);
  uint64_t v8 = sub_25F5975A0();
  BOOL v10 = v9;
  swift_bridgeObjectRelease_n();

  uint64_t v11 = v8;
  uint64_t v12 = v10;
  result._object = v12;
  result._uint64_t countAndFlagsBits = v11;
  return result;
}

id sub_25F581C9C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  type metadata accessor for NLTagScheme(0);
  uint64_t v1 = (void *)sub_25F597740();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithTagSchemes_, v1);

  return v2;
}

uint64_t sub_25F581D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  if (a1)
  {
    uint64_t v7 = sub_25F5975F0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = sub_25F597730();
    uint64_t v7 = MEMORY[0x2611F6780](v10);
    uint64_t v9 = v11;
    swift_bridgeObjectRelease();
  }
  sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
  uint64_t v12 = *(void *)(*a6 + 16);
  sub_25F5863D8(v12, (uint64_t (*)(BOOL))sub_25F576814);
  uint64_t v13 = *a6;
  *(void *)(v13 + 16) = v12 + 1;
  uint64_t v14 = v13 + 16 * v12;
  *(void *)(v14 + 32) = v7;
  *(void *)(v14 + 40) = v9;
  return 1;
}

Swift::String __swiftcall String.trimMessageGreeting()()
{
  sub_25F57957C();
  unint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_25F597270();
  sub_25F5791BC();
  uint64_t v47 = v5;
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25F572540(qword_26B399DE8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v11 = sub_25F5866C4();
  *(_OWORD *)(v11 + 16) = xmmword_25F5995B0;
  uint64_t v12 = (void *)*MEMORY[0x263F13FB8];
  *(void *)(v11 + 32) = *MEMORY[0x263F13FB8];
  id v13 = v12;
  id v14 = sub_25F581C9C();
  sub_25F586420(v3, v1, v14);
  if (qword_26B399CB8 != -1) {
    uint64_t v15 = swift_once();
  }
  uint64_t v16 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v17 = sub_25F5866C4();
    *(_OWORD *)(v17 + 16) = xmmword_25F5995C0;
    *(void *)(v17 + 32) = v16;
    uint64_t v56 = v17;
    sub_25F597770();
    sub_25F572148(0, &qword_26A7AAB38);
    id v18 = v16;
    uint64_t v19 = (void *)sub_25F597740();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setGazetteers_forTagScheme_, v19, v13);
  }
  uint64_t v56 = 0;
  unint64_t v57 = 0xE000000000000000;
  uint64_t v54 = 0;
  unint64_t v55 = 0xE000000000000000;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v20 = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t v20 = v3;
  }
  if (((v1 >> 60) & ((v3 & 0x800000000000000) == 0)) != 0) {
    unsigned __int16 v21 = 11;
  }
  else {
    unsigned __int16 v21 = 7;
  }
  char v53 = 0;
  uint64_t v22 = v21 | (unint64_t)(v20 << 16);
  MEMORY[0x270FA5388](v15);
  sub_25F5868A4();
  *(void *)(v23 - 48) = &v56;
  *(void *)(v23 - 40) = v3;
  *(void *)(v23 - 32) = v1;
  *(void *)(v23 - 24) = &v53;
  *(void *)(v23 - 16) = &v54;
  sub_25F586940();
  if (v53 == 1)
  {
    uint64_t v51 = v3;
    unint64_t v52 = v1;
    uint64_t v49 = v54;
    unint64_t v50 = v55;
    uint64_t v24 = sub_25F5973E0();
    sub_25F5721D0((uint64_t)v10, 1, 1, v24);
    sub_25F572184();
    swift_bridgeObjectRetain();
    sub_25F5869CC();
    sub_25F597A00();
    uint64_t v26 = v25;
    char v28 = v27;
    sub_25F586494((uint64_t)v10);
    swift_bridgeObjectRelease();
    if (v28)
    {
      uint64_t v30 = HIBYTE(v57) & 0xF;
      if ((v57 & 0x2000000000000000) == 0) {
        uint64_t v30 = v56;
      }
      uint64_t v31 = 7;
      if (((v57 >> 60) & ((v56 & 0x800000000000000) == 0)) != 0) {
        uint64_t v31 = 11;
      }
      unint64_t v32 = v31 | (v30 << 16);
      swift_bridgeObjectRetain();
      unint64_t v29 = v32;
    }
    else
    {
      if ((v26 ^ (unint64_t)(v20 << 16)) >= 0x4000) {
        uint64_t v22 = sub_25F5976A0();
      }
      swift_bridgeObjectRetain();
      unint64_t v29 = v22;
    }
    unint64_t v33 = sub_25F582460(v29, v3, v1);
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v40 = MEMORY[0x2611F6780](v33, v35, v37, v39);
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v51 = v40;
    unint64_t v52 = v42;
    sub_25F597240();
    sub_25F5979D0();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F5794FC();
  result._object = v44;
  result._uint64_t countAndFlagsBits = v43;
  return result;
}

uint64_t sub_25F582230(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t *a8)
{
  if (!a1) {
    return 1;
  }
  uint64_t v10 = qword_26A7AA7E0;
  id v33 = a1;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25F5975F0();
  uint64_t v13 = v12;
  if (v11 == sub_25F5975F0() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  char v16 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_12:
    uint64_t v18 = sub_25F597730();
    uint64_t v19 = MEMORY[0x2611F6780](v18);
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    *a4 = v19;
    a4[1] = v21;
    swift_bridgeObjectRelease();
    *a7 = 1;
  }
  uint64_t v22 = sub_25F5975F0();
  uint64_t v24 = v23;
  if (v22 == sub_25F5975F0() && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = sub_25F597C50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0) {
      goto LABEL_22;
    }
  }
  if (*a7)
  {
    uint64_t v28 = sub_25F597730();
    uint64_t v29 = MEMORY[0x2611F6780](v28);
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();

    *a8 = v29;
    a8[1] = v31;
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_22:

  return 1;
}

unint64_t sub_25F582460(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_25F597730();
  }
  __break(1u);
  return result;
}

void String.trimLeadingCharacters(_:)()
{
  sub_25F5868FC();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_25F572540(qword_26B399DE8);
  MEMORY[0x270FA5388](v5 - 8);
  sub_25F5868CC();
  sub_25F572184();
  sub_25F5979D0();
  uint64_t v6 = sub_25F5973E0();
  sub_25F5721D0(v0, 1, 1, v6);
  sub_25F5869CC();
  unint64_t v7 = sub_25F597A00();
  char v9 = v8;
  sub_25F586494(v0);
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  uint64_t v10 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v10 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v10 >= v7 >> 14)
  {
    uint64_t v11 = sub_25F597730();
    MEMORY[0x2611F6780](v11);
    swift_bridgeObjectRelease();
LABEL_7:
    sub_25F579420();
    sub_25F586850();
    return;
  }
  __break(1u);
}

void String.containsAJoiningPreposition.getter()
{
  sub_25F5868FC();
  sub_25F58682C();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v0 = sub_25F5866C4();
  *(_OWORD *)(v0 + 16) = xmmword_25F5995B0;
  unint64_t v1 = (void *)*MEMORY[0x263F13FB8];
  *(void *)(v0 + 32) = *MEMORY[0x263F13FB8];
  id v2 = v1;
  id v3 = sub_25F586838();
  sub_25F58678C(v3);
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v5 = (__n128 *)sub_25F5866C4();
    sub_25F5869AC(v5, (__n128)xmmword_25F5995C0);
    uint64_t v6 = (void *)sub_25F572148(0, &qword_26A7AAB38);
    id v7 = v4;
    sub_25F586770();
    uint64_t v8 = sub_25F586910();
    sub_25F586728(v8, sel_setGazetteers_forTagScheme_);
  }
  sub_25F5866A8();
  MEMORY[0x270FA5388](v9);
  sub_25F586864();

  sub_25F586850();
}

uint64_t sub_25F5827C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (!a1) {
    return 1;
  }
  uint64_t v7 = qword_26A7AA7F0;
  id v8 = a1;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25F5975F0();
  uint64_t v11 = v10;
  if (v9 == sub_25F5975F0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_25F597C50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {

      return 1;
    }
  }
  sub_25F572540(&qword_26A7AAB50);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_25F5995B0;
  uint64_t v17 = sub_25F597730();
  uint64_t v18 = MEMORY[0x2611F6780](v17);
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  sub_25F5976D0();
  sub_25F5975F0();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  *(void *)(v16 + 56) = MEMORY[0x263F8D310];
  *(void *)(v16 + 32) = v18;
  *(void *)(v16 + 40) = v20;
  sub_25F597D80();
  swift_bridgeObjectRelease();

  uint64_t result = 0;
  *a6 = 1;
  return result;
}

Swift::Bool __swiftcall String.looksLikeAnAcronym()()
{
  sub_25F57957C();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_25F597270();
  sub_25F5791BC();
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v7);
  sub_25F5867C8();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - v9;
  sub_25F597230();
  sub_25F597240();
  uint64_t v22 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v2) & 0xF;
  }
  else {
    uint64_t v11 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t v18 = v5;
    uint64_t v20 = (v2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v21 = v2 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i < v11; i += v14)
    {
      if ((v2 & 0x1000000000000000) != 0)
      {
        sub_25F597A80();
      }
      else
      {
        if ((v2 & 0x2000000000000000) != 0)
        {
          uint64_t v23 = v4;
          uint64_t v24 = v21;
        }
        else if ((v4 & 0x1000000000000000) == 0)
        {
          sub_25F597AB0();
        }
        sub_25F597AC0();
      }
      uint64_t v14 = v13;
      if (sub_25F597250()) {
        break;
      }
      if (sub_25F597250()) {
        break;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v5 = v18;
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  v15(v0, v5);
  v15((uint64_t)v10, v5);
  sub_25F5794FC();
  return result;
}

void String.verbLikeTokens()()
{
  sub_25F5868FC();
  sub_25F58682C();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v0 = sub_25F5866C4();
  *(_OWORD *)(v0 + 16) = xmmword_25F5995B0;
  unint64_t v1 = (void *)*MEMORY[0x263F13FB8];
  *(void *)(v0 + 32) = *MEMORY[0x263F13FB8];
  id v2 = v1;
  id v3 = sub_25F586838();
  sub_25F58678C(v3);
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v5 = (__n128 *)sub_25F5866C4();
    sub_25F58698C(v5, (__n128)xmmword_25F5995C0);
    uint64_t v6 = (void *)sub_25F572148(0, &qword_26A7AAB38);
    id v7 = v4;
    sub_25F586770();
    uint64_t v8 = sub_25F586910();
    sub_25F586728(v8, sel_setGazetteers_forTagScheme_);
  }
  sub_25F5866A8();
  MEMORY[0x270FA5388](v9);
  sub_25F5867AC();
  sub_25F586960();
  sub_25F597950();

  sub_25F586850();
}

uint64_t sub_25F582CF8(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a1)
  {
    uint64_t v6 = sub_25F5975F0();
    uint64_t v8 = v7;
    if (v6 == sub_25F5975F0() && v8 == v9)
    {
      id v13 = a1;
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v11 = sub_25F597C50();
      id v12 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v14 = sub_25F597730();
    uint64_t v15 = MEMORY[0x2611F6780](v14);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
    uint64_t v18 = *(void *)(*a4 + 16);
    sub_25F5863D8(v18, (uint64_t (*)(BOOL))sub_25F576814);
    uint64_t v19 = *a4;
    *(void *)(v19 + 16) = v18 + 1;
    uint64_t v20 = v19 + 16 * v18;
    *(void *)(v20 + 32) = v15;
    *(void *)(v20 + 40) = v17;
LABEL_10:
  }
  return 1;
}

void String.businessRelevantEntities()()
{
  sub_25F5868FC();
  sub_25F58682C();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v0 = sub_25F5866C4();
  *(_OWORD *)(v0 + 16) = xmmword_25F5995B0;
  unint64_t v1 = (void *)*MEMORY[0x263F13FA8];
  *(void *)(v0 + 32) = *MEMORY[0x263F13FA8];
  id v2 = v1;
  id v3 = sub_25F586838();
  sub_25F58678C(v3);
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v5 = (__n128 *)sub_25F5866C4();
    sub_25F58698C(v5, (__n128)xmmword_25F5995C0);
    uint64_t v6 = (void *)sub_25F572148(0, &qword_26A7AAB38);
    id v7 = v4;
    sub_25F586770();
    uint64_t v8 = sub_25F586910();
    sub_25F586728(v8, sel_setGazetteers_forTagScheme_);
  }
  sub_25F5866A8();
  MEMORY[0x270FA5388](v9);
  sub_25F5867AC();
  sub_25F586864();

  sub_25F586850();
}

uint64_t sub_25F582FD8(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a1)
  {
    uint64_t v5 = qword_26A7AA7F8;
    id v6 = a1;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25F5975F0();
    uint64_t v9 = v8;
    if (v7 == sub_25F5975F0() && v9 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v12 = sub_25F597C50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v13 = sub_25F597730();
    uint64_t v14 = MEMORY[0x2611F6780](v13);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
    uint64_t v17 = *(void *)(*a4 + 16);
    sub_25F5863D8(v17, (uint64_t (*)(BOOL))sub_25F576814);
    uint64_t v18 = *a4;
    *(void *)(v18 + 16) = v17 + 1;
    uint64_t v19 = v18 + 16 * v17;
    *(void *)(v19 + 32) = v14;
    *(void *)(v19 + 40) = v16;
LABEL_12:
  }
  return 1;
}

void String.nounLikeTokens(includePronouns:)()
{
  sub_25F5868FC();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v0 = sub_25F5866C4();
  *(_OWORD *)(v0 + 16) = xmmword_25F5995B0;
  unint64_t v1 = (void *)*MEMORY[0x263F13FB8];
  *(void *)(v0 + 32) = *MEMORY[0x263F13FB8];
  id v2 = v1;
  id v3 = sub_25F581C9C();
  uint64_t v4 = sub_25F579420();
  sub_25F586420(v4, v5, v3);
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  id v6 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v7 = sub_25F5866C4();
    *(_OWORD *)(v7 + 16) = xmmword_25F5995C0;
    *(void *)(v7 + 32) = v6;
    sub_25F597770();
    sub_25F572148(0, &qword_26A7AAB38);
    id v8 = v6;
    uint64_t v9 = (void *)sub_25F597740();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setGazetteers_forTagScheme_, v9, v2);
  }
  sub_25F5866A8();
  MEMORY[0x270FA5388](v10);
  sub_25F597950();

  sub_25F586850();
}

uint64_t sub_25F583364(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  if (a1)
  {
    if (a4)
    {
      uint64_t v7 = sub_25F5975F0();
      uint64_t v9 = v8;
      if (v7 == sub_25F5975F0() && v9 == v10)
      {
        id v51 = a1;
        goto LABEL_46;
      }
      char v12 = sub_25F597C50();
      id v13 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_47;
      }
      if (qword_26A7AA7D8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_25F5975F0();
      uint64_t v16 = v15;
      if (v14 == sub_25F5975F0() && v16 == v17)
      {
LABEL_46:
        swift_bridgeObjectRelease_n();
        goto LABEL_47;
      }
      char v19 = sub_25F597C50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_47;
      }
    }
    else
    {
      id v20 = a1;
    }
    uint64_t v21 = sub_25F5975F0();
    uint64_t v23 = v22;
    if (v21 != sub_25F5975F0() || v23 != v24)
    {
      char v26 = sub_25F597C50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_47;
      }
      uint64_t v27 = sub_25F5975F0();
      uint64_t v29 = v28;
      if (v27 != sub_25F5975F0() || v29 != v30)
      {
        char v32 = sub_25F597C50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v32) {
          goto LABEL_47;
        }
        uint64_t v33 = sub_25F5975F0();
        uint64_t v35 = v34;
        if (v33 != sub_25F5975F0() || v35 != v36)
        {
          char v38 = sub_25F597C50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v38) {
            goto LABEL_47;
          }
          uint64_t v39 = sub_25F5975F0();
          uint64_t v41 = v40;
          if (v39 != sub_25F5975F0() || v41 != v42)
          {
            char v44 = sub_25F597C50();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v44 & 1) == 0)
            {
              if (qword_26A7AA800 != -1) {
                swift_once();
              }
              uint64_t v45 = sub_25F5975F0();
              uint64_t v47 = v46;
              if (v45 != sub_25F5975F0() || v47 != v48)
              {
                char v50 = sub_25F597C50();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v50 & 1) == 0) {
                  goto LABEL_48;
                }
                goto LABEL_47;
              }
              goto LABEL_46;
            }
LABEL_47:
            uint64_t v52 = sub_25F597730();
            uint64_t v53 = MEMORY[0x2611F6780](v52);
            uint64_t v55 = v54;
            swift_bridgeObjectRelease();
            sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
            uint64_t v56 = *(void *)(*a5 + 16);
            sub_25F5863D8(v56, (uint64_t (*)(BOOL))sub_25F576814);
            uint64_t v57 = *a5;
            *(void *)(v57 + 16) = v56 + 1;
            uint64_t v58 = v57 + 16 * v56;
            *(void *)(v58 + 32) = v53;
            *(void *)(v58 + 40) = v55;
LABEL_48:

            return 1;
          }
        }
      }
    }
    goto LABEL_46;
  }
  return 1;
}

uint64_t String.properNouns()()
{
  sub_25F58682C();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v0 = sub_25F5866C4();
  *(_OWORD *)(v0 + 16) = xmmword_25F5995B0;
  unint64_t v1 = (void *)*MEMORY[0x263F13FB8];
  *(void *)(v0 + 32) = *MEMORY[0x263F13FB8];
  id v2 = v1;
  id v3 = sub_25F586838();
  uint64_t v4 = sub_25F579420();
  sub_25F586420(v4, v5, v3);
  sub_25F5866A8();
  uint64_t v7 = MEMORY[0x263F8EE78];
  sub_25F597950();

  return v7;
}

uint64_t sub_25F583874(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a1)
  {
    uint64_t v6 = sub_25F5975F0();
    uint64_t v8 = v7;
    if (v6 == sub_25F5975F0() && v8 == v9)
    {
      id v25 = a1;
    }
    else
    {
      char v11 = sub_25F597C50();
      id v12 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_20;
      }
      uint64_t v13 = sub_25F5975F0();
      uint64_t v15 = v14;
      if (v13 != sub_25F5975F0() || v15 != v16)
      {
        char v18 = sub_25F597C50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          uint64_t v19 = sub_25F5975F0();
          uint64_t v21 = v20;
          if (v19 != sub_25F5975F0() || v21 != v22)
          {
            char v24 = sub_25F597C50();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v24 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_20;
          }
          goto LABEL_19;
        }
LABEL_20:
        uint64_t v26 = sub_25F597730();
        uint64_t v27 = MEMORY[0x2611F6780](v26);
        uint64_t v29 = v28;
        swift_bridgeObjectRelease();
        sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
        uint64_t v30 = *(void *)(*a4 + 16);
        sub_25F5863D8(v30, (uint64_t (*)(BOOL))sub_25F576814);
        uint64_t v31 = *a4;
        *(void *)(v31 + 16) = v30 + 1;
        uint64_t v32 = v31 + 16 * v30;
        *(void *)(v32 + 32) = v27;
        *(void *)(v32 + 40) = v29;
LABEL_21:

        return 1;
      }
    }
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  return 1;
}

Swift::String __swiftcall String.firstCaptionNounPhrase()()
{
  sub_25F5868FC();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v4 = sub_25F5866C4();
  *(_OWORD *)(v4 + 16) = xmmword_25F5995B0;
  uint64_t v5 = (void *)*MEMORY[0x263F13FA8];
  *(void *)(v4 + 32) = *MEMORY[0x263F13FA8];
  id v6 = v5;
  id v7 = sub_25F586838();
  sub_25F586420(v3, v1, v7);
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    sub_25F572540(&qword_26A7AAB30);
    uint64_t v9 = (__n128 *)sub_25F5866C4();
    sub_25F5869AC(v9, (__n128)xmmword_25F5995C0);
    uint64_t v10 = (void *)sub_25F572148(0, &qword_26A7AAB38);
    id v11 = v8;
    sub_25F586770();
    uint64_t v12 = sub_25F586910();
    sub_25F586728(v12, sel_setGazetteers_forTagScheme_);
  }
  v22[0] = 0;
  v22[1] = 0xE000000000000000;
  uint64_t v13 = sub_25F591D68(0, 0);
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v13 = sub_25F591D88(0, 0);
    uint64_t v15 = v13;
    if (!v13)
    {
      uint64_t v13 = swift_bridgeObjectRelease();
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  MEMORY[0x270FA5388](v13);
  sub_25F5868A4();
  *(void *)(v16 - 48) = v3;
  *(void *)(v16 - 40) = v1;
  *(void *)(v16 - 32) = v22;
  *(void *)(v16 - 24) = v14;
  *(void *)(v16 - 16) = v15;
  sub_25F597950();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (*(void *)(v18 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  sub_25F586850();
  result._object = v20;
  result._uint64_t countAndFlagsBits = v19;
  return result;
}

uint64_t sub_25F583D2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v10 = sub_25F572540(qword_26B399DE8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1) {
    id v13 = a1;
  }
  else {
    id v13 = (id)*MEMORY[0x263F13F60];
  }
  id v14 = a1;
  uint64_t v15 = sub_25F597730();
  uint64_t v16 = MEMORY[0x2611F6780](v15);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (qword_26A7AA800 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25F5975F0();
  uint64_t v21 = v20;
  if (v19 == sub_25F5975F0() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v24 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v25 = sub_25F5975F0();
  uint64_t v27 = v26;
  if (v25 == sub_25F5975F0() && v27 == v28)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    if (a7)
    {
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_25F576168(28261, 0xE200000000000000, a7);
      if (v32)
      {
        uint64_t v33 = (void *)v32;
        uint64_t v39 = v16;
        uint64_t v40 = v18;
        sub_25F572184();
        uint64_t v39 = sub_25F5979C0();
        uint64_t v40 = v34;
        sub_25F597390();
        uint64_t v35 = sub_25F5973E0();
        sub_25F5721D0((uint64_t)v12, 0, 1, v35);
        uint64_t v36 = sub_25F597A10();
        uint64_t v38 = v37;
        sub_25F586494((uint64_t)v12);
        swift_bridgeObjectRelease();
        LOBYTE(v36) = sub_25F5870A0(v36, v38, v33);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v36) {
          goto LABEL_24;
        }
LABEL_19:
        *a6 = v16;
        a6[1] = v18;
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRelease();
    }
    goto LABEL_18;
  }
  char v30 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_21;
  }

LABEL_24:
  swift_bridgeObjectRelease();
  return 1;
}

void String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)()
{
  sub_25F57957C();
  uint64_t v172 = v0;
  uint64_t v171 = v1;
  LOBYTE(v3) = v2;
  sub_25F580C20();
  LOBYTE(v5) = (v4 & 1) != 0 || String.looksLikeAnAcronym()();
  sub_25F572184();
  sub_25F5979C0();
  sub_25F572148(0, &qword_26A7AAB20);
  sub_25F572540(&qword_26A7AAB28);
  uint64_t v6 = sub_25F5866C4();
  *(_OWORD *)(v6 + 16) = xmmword_25F5995B0;
  id v7 = (void *)*MEMORY[0x263F13FA8];
  *(void *)(v6 + 32) = *MEMORY[0x263F13FA8];
  uint64_t v8 = v7;
  id v166 = sub_25F581C9C();
  sub_25F586420(v171, v172, v166);
  if (qword_26B399CB8 != -1) {
    goto LABEL_210;
  }
  while (1)
  {
    uint64_t v10 = (void *)static NLGazetteer.supportGazetteer;
    if (static NLGazetteer.supportGazetteer)
    {
      sub_25F572540(&qword_26A7AAB30);
      uint64_t v11 = sub_25F5866C4();
      *(_OWORD *)(v11 + 16) = xmmword_25F5995C0;
      *(void *)(v11 + 32) = v10;
      sub_25F597770();
      sub_25F572148(0, &qword_26A7AAB38);
      id v12 = v10;
      id v13 = (void *)sub_25F597740();
      swift_bridgeObjectRelease();
      objc_msgSend(v166, sel_setGazetteers_forTagScheme_, v13, v8);
    }
    uint64_t v188 = MEMORY[0x263F8EE78];
    uint64_t v189 = MEMORY[0x263F8EE78];
    MEMORY[0x270FA5388](v9);
    sub_25F586940();
    swift_bridgeObjectRelease();
    if (!*(void *)(v188 + 16))
    {
      swift_bridgeObjectRelease();

      goto LABEL_193;
    }
    char v183 = (char)v3;
    sub_25F572540(&qword_26A7AAB40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25F5995D0;
    uint64_t v15 = (void *)*MEMORY[0x263F13F48];
    uint64_t v16 = (void *)*MEMORY[0x263F13F68];
    *(void *)(inited + 32) = *MEMORY[0x263F13F48];
    *(void *)(inited + 40) = v16;
    uint64_t v17 = qword_26A7AA7E8;
    id v177 = v15;
    id v179 = v16;
    if (v17 != -1) {
      swift_once();
    }
    uint64_t v18 = (void *)qword_26A7AAAF0;
    uint64_t v19 = (void *)*MEMORY[0x263F13F50];
    *(void *)(inited + 48) = qword_26A7AAAF0;
    *(void *)(inited + 56) = v19;
    uint64_t v20 = (void *)*MEMORY[0x263F13F38];
    uint64_t v21 = (void *)*MEMORY[0x263F13FE0];
    *(void *)(inited + 64) = *MEMORY[0x263F13F38];
    *(void *)(inited + 72) = v21;
    uint64_t v22 = (void *)*MEMORY[0x263F13F28];
    *(void *)(inited + 80) = *MEMORY[0x263F13F28];
    uint64_t v23 = qword_26A7AA7F0;
    id v24 = v18;
    id v25 = v19;
    id v26 = v20;
    id v27 = v21;
    id v28 = v22;
    if (v23 != -1) {
      swift_once();
    }
    uint64_t v29 = (void *)qword_26A7AAAF8;
    *(void *)(inited + 88) = qword_26A7AAAF8;
    char v30 = (void **)MEMORY[0x263F13F70];
    if (v5)
    {
      id v31 = v29;
      swift_bridgeObjectRelease();
      uint64_t inited = sub_25F586888();
      *(_OWORD *)(inited + 16) = xmmword_25F5995F0;
      uint64_t v32 = (void *)*MEMORY[0x263F13F58];
      uint64_t v33 = *v30;
      *(void *)(inited + 32) = *MEMORY[0x263F13F58];
      *(void *)(inited + 40) = v33;
      uint64_t v34 = (void *)*MEMORY[0x263F13F78];
      *(void *)(inited + 48) = *MEMORY[0x263F13F78];
      *(void *)(inited + 56) = v179;
      uint64_t v35 = qword_26A7AAAF0;
      *(void *)(inited + 64) = qword_26A7AAAF0;
      *(void *)(inited + 72) = v25;
      uint64_t v36 = v35;
      v169 = (void *)v35;
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_25F599610;
      *(void *)(v37 + 32) = v32;
      *(void *)(v37 + 40) = v33;
      *(void *)(v37 + 48) = v34;
      *(void *)(v37 + 56) = v36;
      uint64_t v182 = v37;
      *(void *)(v37 + 64) = v25;
      uint64_t v38 = sub_25F586888();
      *(_OWORD *)(v38 + 16) = xmmword_25F5995F0;
      *(void *)(v38 + 32) = v32;
      *(void *)(v38 + 40) = v33;
      *(void *)(v38 + 48) = v34;
      *(void *)(v38 + 56) = v179;
      uint64_t v8 = (uint64_t)v177;
      *(void *)(v38 + 64) = v177;
      *(void *)(v38 + 72) = v25;
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_25F599610;
      *(void *)(v39 + 32) = v32;
      *(void *)(v39 + 40) = v33;
      *(void *)(v39 + 48) = v34;
      *(void *)(v39 + 56) = v177;
      uint64_t v181 = v39;
      *(void *)(v39 + 64) = v25;
      id v40 = v32;
      id v41 = v33;
      id v42 = v34;
      id v43 = v25;
      id v44 = v40;
      uint64_t v45 = (uint64_t)v41;
      id v46 = v42;
      id v47 = v43;
      id v173 = v44;
      id v48 = v179;
      id v3 = (id)v45;
      uint64_t v49 = v46;
      char v50 = v47;
      id v51 = v169;
      v187 = v169;
      v185 = v179;
      uint64_t v175 = v177;
    }
    else
    {
      v185 = v27;
      v187 = v26;
      uint64_t v52 = v177;
      if (v183)
      {
        id v53 = v29;
        swift_bridgeObjectRelease();
        uint64_t inited = swift_allocObject();
        *(_OWORD *)(inited + 16) = xmmword_25F5995E0;
        *(void *)(inited + 32) = v177;
        *(void *)(inited + 40) = v179;
        uint64_t v54 = (void *)qword_26A7AAAF0;
        *(void *)(inited + 48) = qword_26A7AAAF0;
        *(void *)(inited + 56) = v25;
        *(void *)(inited + 64) = v26;
        *(void *)(inited + 72) = v185;
        uint64_t v55 = (void *)qword_26A7AAAF8;
        *(void *)(inited + 80) = v28;
        *(void *)(inited + 88) = v55;
        uint64_t v56 = (void *)*MEMORY[0x263F13F30];
        *(void *)(inited + 96) = *MEMORY[0x263F13F30];
        uint64_t v184 = qword_26A7AA800;
        id v57 = v177;
        id v58 = v179;
        id v59 = v54;
        id v60 = v25;
        id v61 = v26;
        id v62 = v185;
        id v63 = v28;
        id v64 = v55;
        id v65 = v56;
        if (v184 != -1) {
          swift_once();
        }
        uint64_t v66 = off_26A7AAB08;
        char v30 = (void **)MEMORY[0x263F13F70];
        uint64_t v29 = (void *)*MEMORY[0x263F13F70];
        *(void *)(inited + 104) = off_26A7AAB08;
        *(void *)(inited + 112) = v29;
        id v67 = v66;
        BOOL v68 = 1;
        uint64_t v52 = v177;
      }
      else
      {
        BOOL v68 = qword_26A7AA800 == -1;
      }
      id v69 = v29;
      uint64_t v70 = sub_25F586888();
      *(_OWORD *)(v70 + 16) = xmmword_25F5995F0;
      *(void *)(v70 + 32) = v28;
      *(void *)(v70 + 40) = v52;
      uint64_t v71 = (void *)qword_26A7AAAF0;
      *(void *)(v70 + 48) = qword_26A7AAAF0;
      *(void *)(v70 + 56) = v25;
      id v3 = v28;
      id v48 = v52;
      id v72 = v71;
      id v73 = v25;
      if (!v68) {
        swift_once();
      }
      uint64_t v45 = (uint64_t)off_26A7AAB08;
      id v47 = *v30;
      *(void *)(v70 + 64) = off_26A7AAB08;
      *(void *)(v70 + 72) = v47;
      uint64_t v182 = v70;
      uint64_t v74 = swift_allocObject();
      *(_OWORD *)(v74 + 16) = xmmword_25F5995D0;
      char v50 = v179;
      *(void *)(v74 + 32) = v48;
      *(void *)(v74 + 40) = v179;
      *(void *)(v74 + 48) = v187;
      *(void *)(v74 + 56) = v185;
      uint64_t v175 = (void *)qword_26A7AAAF8;
      *(void *)(v74 + 64) = qword_26A7AAAF8;
      *(void *)(v74 + 72) = v45;
      *(void *)(v74 + 80) = v47;
      *(void *)(v74 + 88) = v3;
      uint64_t v75 = swift_allocObject();
      *(_OWORD *)(v75 + 16) = xmmword_25F599600;
      id v46 = (id)v45;
      uint64_t v8 = v45;
      *(void *)(v75 + 32) = v3;
      *(void *)(v75 + 40) = v48;
      uint64_t v181 = v75;
      *(void *)(v75 + 48) = v45;
      id v173 = v47;
      id v51 = v3;
      uint64_t v49 = v48;
    }
    id v76 = (id)v45;
    id v77 = v46;
    id v78 = v47;
    id v79 = v48;
    id v80 = v51;
    id v81 = (id)v8;
    id v82 = v173;
    id v83 = v3;
    id v84 = v49;
    id v85 = v50;
    id v86 = v187;
    id v87 = v185;
    id v88 = v175;
    uint64_t v89 = v188;
    uint64_t v170 = *(void *)(v188 + 16);
    if (!v170) {
      break;
    }
    uint64_t v167 = *(void *)(v189 + 16) - 1;
    uint64_t v168 = v188 + 32;
    uint64_t v186 = v189 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_25F5866DC();
    while (v90 < *(void *)(v89 + 16))
    {
      uint64_t v176 = v5;
      uint64_t v91 = *(void *)(v168 + 8 * v90);
      unint64_t v92 = v91;
      uint64_t v180 = v91;
      unint64_t v174 = v90;
      if (v91 < 1) {
        goto LABEL_97;
      }
      if ((unint64_t)v91 >= *(void *)(v189 + 16)) {
        goto LABEL_207;
      }
      uint64_t v5 = *(void *)(inited + 16);
      unint64_t v92 = *(void *)(v168 + 8 * v90);
      if (!v5) {
        goto LABEL_97;
      }
      uint64_t v93 = *(void *)(v168 + 8 * v90);
      while (1)
      {
        sub_25F586744();
        uint64_t v94 = sub_25F5975F0();
        uint64_t v96 = v95;
        BOOL v98 = v94 == sub_25F5975F0() && v96 == v97;
        if (v98)
        {
          swift_bridgeObjectRetain_n();
          id v110 = (id)v45;
          id v47 = (id)inited;
LABEL_54:
          swift_bridgeObjectRelease_n();
          goto LABEL_55;
        }
        char v99 = sub_25F597C50();
        swift_bridgeObjectRetain_n();
        id v100 = (id)v45;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v47 = (id)inited;
        if (v99) {
          goto LABEL_55;
        }
        if (v5 == 1) {
          break;
        }
        uint64_t v101 = sub_25F5975F0();
        if (v101 == sub_25F586710() && inited == v102)
        {
LABEL_53:
          sub_25F5866DC();
          goto LABEL_54;
        }
        char v104 = sub_25F586804();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v47 = (id)inited;
        sub_25F5866DC();
        if (v104) {
          goto LABEL_55;
        }
        if (v5 == 2) {
          break;
        }
        uint64_t v8 = 6;
        while (1)
        {
          sub_25F586980();
          if (v105) {
            goto LABEL_194;
          }
          uint64_t v106 = sub_25F5975F0();
          if (v106 == sub_25F586710() && inited == v107) {
            goto LABEL_53;
          }
          char v109 = sub_25F586804();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v109) {
            break;
          }
          sub_25F586974();
          if (v98) {
            goto LABEL_60;
          }
        }
        id v47 = (id)inited;
        sub_25F5866DC();
LABEL_55:
        sub_25F586758();

        if (v93 < 2)
        {
          uint64_t v93 = 0;
          goto LABEL_61;
        }
        if ((unint64_t)--v93 >= *(void *)(v189 + 16))
        {
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
          goto LABEL_196;
        }
      }
LABEL_60:
      swift_bridgeObjectRelease_n();

      sub_25F5866DC();
LABEL_61:
      uint64_t v91 = v180;
      if (v93 >= v180)
      {
        unint64_t v92 = v93;
        goto LABEL_97;
      }
      uint64_t v5 = *(void *)(v182 + 16);
      unint64_t v111 = v93;
LABEL_63:
      if (v93 < 0) {
        goto LABEL_198;
      }
      if (v111 >= *(void *)(v189 + 16))
      {
LABEL_199:
        __break(1u);
        break;
      }
      if (!v5) {
        goto LABEL_88;
      }
      uint64_t v45 = *(void *)(v186 + 24 * v111);
      LOBYTE(v3) = v182;
      uint64_t v112 = *(void **)(v182 + 32);
      uint64_t v113 = sub_25F5975F0();
      if (v113 != sub_25F586710() || v47 != v114)
      {
        uint64_t v8 = sub_25F5866E8();
        id v116 = (id)v45;
        id v117 = v112;
        sub_25F5869E0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_94;
        }
        if (v5 != 1)
        {
          uint64_t v8 = v182;
          uint64_t v118 = sub_25F5975F0();
          if (v118 == sub_25F586710() && v47 == v119)
          {
LABEL_91:

            swift_bridgeObjectRelease();
            sub_25F586758();
            goto LABEL_96;
          }
          sub_25F586680();
          sub_25F5867EC();
          swift_bridgeObjectRelease();
          if (v118)
          {
LABEL_92:

            goto LABEL_95;
          }
          if (v5 != 2)
          {
            uint64_t v8 = 6;
            while (1)
            {
              sub_25F586980();
              if (v105) {
                break;
              }
              uint64_t v121 = sub_25F5975F0();
              if (v121 == sub_25F586710() && v47 == v122) {
                goto LABEL_91;
              }
              sub_25F586680();
              sub_25F5867EC();
              swift_bridgeObjectRelease();
              if (v121) {
                goto LABEL_92;
              }
              sub_25F586974();
              if (v98) {
                goto LABEL_87;
              }
            }
LABEL_196:
            __break(1u);
            goto LABEL_197;
          }
        }
LABEL_87:

        swift_bridgeObjectRelease();
        sub_25F5868E4();
        unint64_t v111 = *(void *)(v124 - 256);
LABEL_88:
        if ((uint64_t)++v111 >= v91)
        {
          unint64_t v92 = v91;
          goto LABEL_97;
        }
        goto LABEL_63;
      }
      id v125 = (id)v45;
      id v126 = v112;
      sub_25F5869E0();

      sub_25F586758();
LABEL_94:

LABEL_95:
      swift_bridgeObjectRelease();
LABEL_96:
      sub_25F5868E4();
      unint64_t v92 = *(void *)(v127 - 256);
LABEL_97:
      if (v91 >= v167)
      {
LABEL_134:
        unint64_t v128 = v91;
        goto LABEL_176;
      }
      if (v91 < 0) {
        goto LABEL_208;
      }
      if ((unint64_t)v91 >= *(void *)(v189 + 16)) {
        goto LABEL_209;
      }
      uint64_t v5 = *(void *)(v8 + 16);
      if (!v5) {
        goto LABEL_134;
      }
      unint64_t v178 = v92;
      unint64_t v128 = v91;
      while (2)
      {
        sub_25F586744();
        v129 = *(void **)(v8 + 32);
        uint64_t v130 = sub_25F5975F0();
        if (v130 == sub_25F586710() && v47 == v131)
        {
          id v138 = (id)v45;
          id v139 = v129;
          swift_bridgeObjectRetain();

          sub_25F586758();
LABEL_115:

          goto LABEL_116;
        }
        LOBYTE(v3) = sub_25F5866E8();
        id v133 = (id)v45;
        id v134 = v129;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v3) {
          goto LABEL_115;
        }
        if (v5 == 1)
        {
LABEL_135:

          sub_25F5866DC();
          goto LABEL_136;
        }
        sub_25F5866DC();
        uint64_t v135 = sub_25F5975F0();
        if (v135 == sub_25F586710() && v47 == v136)
        {

LABEL_120:
          swift_bridgeObjectRelease();
          sub_25F586758();
          goto LABEL_117;
        }
        sub_25F586680();
        sub_25F5867EC();
        swift_bridgeObjectRelease();
        if (v135)
        {

          goto LABEL_116;
        }
        if (v5 != 2)
        {
          uint64_t v8 = 6;
          while (1)
          {
            sub_25F586980();
            if (v105) {
              goto LABEL_195;
            }
            uint64_t v140 = sub_25F5975F0();
            if (v140 == sub_25F586710() && v47 == v141)
            {

              sub_25F5866DC();
              goto LABEL_120;
            }
            sub_25F586680();
            sub_25F5867EC();
            swift_bridgeObjectRelease();
            if (v140) {
              break;
            }
            sub_25F586974();
            if (v98) {
              goto LABEL_135;
            }
          }

          sub_25F5866DC();
LABEL_116:
          swift_bridgeObjectRelease();
LABEL_117:
          if ((uint64_t)++v128 >= *(void *)(v189 + 16) - 1) {
            goto LABEL_137;
          }
          continue;
        }
        break;
      }

LABEL_136:
      swift_bridgeObjectRelease();
LABEL_137:
      int64_t v143 = v180;
      if (v180 < (uint64_t)v128)
      {
        uint64_t v5 = *(void *)(v181 + 16);
        unint64_t v92 = v178;
        while (1)
        {
          if ((v128 & 0x8000000000000000) != 0) {
            goto LABEL_205;
          }
          if (v128 >= *(void *)(v189 + 16)) {
            goto LABEL_206;
          }
          if (v5)
          {
            sub_25F586744();
            LOBYTE(v3) = v181;
            v144 = *(void **)(v181 + 32);
            uint64_t v145 = sub_25F5975F0();
            if (v145 == sub_25F586710() && v47 == v146)
            {
              id v156 = (id)v45;
              id v157 = v144;
              sub_25F5869E0();

              sub_25F586758();
LABEL_172:

LABEL_173:
              sub_25F5868B4();
LABEL_174:
              sub_25F5866DC();
              break;
            }
            uint64_t v8 = sub_25F5866E8();
            id v148 = (id)v45;
            id v149 = v144;
            sub_25F5869E0();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v8) {
              goto LABEL_172;
            }
            if (v5 == 1)
            {
LABEL_148:

              sub_25F5868B4();
              sub_25F5866DC();
            }
            else
            {
              uint64_t v8 = v181;
              uint64_t v150 = sub_25F5975F0();
              if (v150 == sub_25F586710() && v47 == v151)
              {
LABEL_169:

                swift_bridgeObjectRelease();
                sub_25F586758();
                goto LABEL_174;
              }
              sub_25F586680();
              sub_25F5867EC();
              swift_bridgeObjectRelease();
              sub_25F5866DC();
              if (v150)
              {

                sub_25F5868B4();
                break;
              }
              if (v5 != 2)
              {
                uint64_t v8 = 6;
                while (1)
                {
                  sub_25F586980();
                  if (v105) {
                    break;
                  }
                  uint64_t v153 = sub_25F5975F0();
                  if (v153 == sub_25F586710() && v47 == v154) {
                    goto LABEL_169;
                  }
                  sub_25F586680();
                  sub_25F5867EC();
                  swift_bridgeObjectRelease();
                  if (v153)
                  {

                    goto LABEL_173;
                  }
                  sub_25F586974();
                  if (v98) {
                    goto LABEL_148;
                  }
                }
LABEL_197:
                __break(1u);
LABEL_198:
                __break(1u);
                goto LABEL_199;
              }

              sub_25F5868B4();
            }
            int64_t v143 = v180;
            unint64_t v92 = v178;
          }
          if (v143 >= (uint64_t)--v128)
          {
            unint64_t v128 = v143;
            goto LABEL_176;
          }
        }
      }
      unint64_t v92 = v178;
LABEL_176:
      uint64_t v5 = v176;
      if ((v92 & 0x8000000000000000) != 0) {
        goto LABEL_201;
      }
      unint64_t v158 = *(void *)(v189 + 16);
      if (v92 >= v158) {
        goto LABEL_202;
      }
      if (v128 >= v158) {
        goto LABEL_203;
      }
      if (*(void *)(v186 + 24 * v128 + 16) >> 14 < *(void *)(v186 + 24 * v92 + 8) >> 14) {
        goto LABEL_204;
      }
      uint64_t v159 = sub_25F597730();
      id v47 = (id)MEMORY[0x2611F6780](v159);
      uint64_t v161 = v160;
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25F576814(0, *(void *)(v176 + 16) + 1, 1, v176);
        uint64_t v5 = v164;
      }
      uint64_t v89 = v188;
      uint64_t v45 = *(void *)(v5 + 16);
      unint64_t v162 = *(void *)(v5 + 24);
      if (v45 >= v162 >> 1)
      {
        sub_25F576814(v162 > 1, v45 + 1, 1, v5);
        uint64_t v5 = v165;
      }
      unint64_t v90 = v174 + 1;
      *(void *)(v5 + 16) = v45 + 1;
      uint64_t v163 = v5 + 16 * v45;
      *(void *)(v163 + 32) = v47;
      *(void *)(v163 + 40) = v161;
      if (v174 + 1 == v170)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_192;
      }
    }
    __break(1u);
LABEL_201:
    __break(1u);
LABEL_202:
    __break(1u);
LABEL_203:
    __break(1u);
LABEL_204:
    __break(1u);
LABEL_205:
    __break(1u);
LABEL_206:
    __break(1u);
LABEL_207:
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    uint64_t v9 = swift_once();
  }
  swift_bridgeObjectRelease();
  sub_25F5866DC();
LABEL_192:
  swift_bridgeObjectRelease();
  sub_25F5868B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_193:
  swift_bridgeObjectRelease();
  sub_25F5794FC();
}

Swift::String_optional __swiftcall String.shortenedCaptionPhrase()()
{
  sub_25F57957C();
  sub_25F58682C();
  uint64_t v3 = sub_25F597270();
  sub_25F5791BC();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_25F5868CC();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = MEMORY[0x263F8EE78];
  uint64_t v8 = (uint64_t *)(v7 + 16);
  v27[1] = 15;
  swift_retain();
  sub_25F572540(&qword_26B399CE0);
  sub_25F572184();
  sub_25F5865B8((unint64_t *)&qword_26B399CD8, &qword_26B399CE0);
  sub_25F5979E0();
  swift_release();
  swift_beginAccess();
  uint64_t v9 = *v8;
  swift_bridgeObjectRetain();
  swift_release();
  unint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  if (v10 < 6)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_25F572148(0, &qword_26A7AAB20);
    sub_25F572540(&qword_26A7AAB28);
    uint64_t v11 = sub_25F5866C4();
    *(_OWORD *)(v11 + 16) = xmmword_25F5995B0;
    id v12 = (void *)*MEMORY[0x263F13FA8];
    *(void *)(v11 + 32) = *MEMORY[0x263F13FA8];
    v12;
    id v13 = sub_25F581C9C();
    uint64_t v14 = sub_25F579420();
    sub_25F586420(v14, v15, v13);
    sub_25F5866A8();
    uint64_t v26 = -1;
    v27[0] = -1;
    uint64_t v24 = -1;
    uint64_t v25 = -1;
    MEMORY[0x270FA5388](v16);
    sub_25F5868A4();
    *(void *)(v17 - 48) = v27;
    *(void *)(v17 - 40) = v1;
    *(void *)(v17 - 32) = v0;
    *(void *)(v17 - 24) = &v24;
    *(void *)(v17 - 16) = &v25;
    *(void *)(v17 - 8) = &v26;
    sub_25F597950();
    uint64_t v18 = v24;
    if (v26 != -1 && v24 < v26)
    {
      sub_25F5976C0();
      swift_bridgeObjectRetain();
      sub_25F597730();
      swift_bridgeObjectRelease();
      sub_25F597240();
      sub_25F586630();
      sub_25F5979D0();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v3);
      swift_bridgeObjectRelease();
      sub_25F597720();
    }
    else
    {
      swift_bridgeObjectRetain();
      if (v18 < 0)
      {
        sub_25F579420();
        uint64_t v18 = sub_25F597690();
      }
      uint64_t v20 = sub_25F585BC4(v18);
      MEMORY[0x2611F6780](v20);
      swift_bridgeObjectRelease();
    }
  }
  sub_25F579420();
  sub_25F5794FC();
  result.value._object = v22;
  result.value._uint64_t countAndFlagsBits = v21;
  return result;
}

uint64_t String.tokens()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  uint64_t v1 = (uint64_t *)(v0 + 16);
  swift_retain();
  sub_25F572540(&qword_26B399CE0);
  sub_25F572184();
  sub_25F5865B8((unint64_t *)&qword_26B399CD8, &qword_26B399CE0);
  sub_25F5979E0();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_25F5856A8(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8, uint64_t *a9)
{
  if (!a1) {
    return 1;
  }
  uint64_t v12 = sub_25F5975F0();
  uint64_t v14 = v13;
  if (v12 == sub_25F5975F0() && v14 == v15)
  {
    id v63 = a1;
LABEL_48:
    swift_bridgeObjectRelease_n();
    goto LABEL_49;
  }
  char v17 = sub_25F597C50();
  id v18 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_49;
  }
  uint64_t v19 = sub_25F5975F0();
  uint64_t v21 = v20;
  if (v19 == sub_25F5975F0() && v21 == v22) {
    goto LABEL_48;
  }
  char v24 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_49;
  }
  uint64_t v25 = qword_26A7AA7D8;
  id v68 = v18;
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_25F5975F0();
  uint64_t v28 = v27;
  if (v26 == sub_25F5975F0() && v28 == v29) {
    goto LABEL_54;
  }
  char v31 = sub_25F597C50();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_49;
  }
  uint64_t v32 = qword_26A7AA7F8;
  id v68 = v68;
  if (v32 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_25F5975F0();
  uint64_t v35 = v34;
  if (v33 == sub_25F5975F0() && v35 == v36)
  {
LABEL_54:

    goto LABEL_48;
  }
  char v38 = sub_25F597C50();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38) {
    goto LABEL_49;
  }
  uint64_t v39 = sub_25F5975F0();
  uint64_t v41 = v40;
  if (v39 == sub_25F5975F0() && v41 == v42) {
    goto LABEL_48;
  }
  char v44 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v44)
  {
LABEL_49:
    *a4 = sub_25F5976F0();
    if (*a7 == -1)
    {
      uint64_t v64 = sub_25F5976F0();

      *a7 = v64;
    }
    else
    {
    }
    *a8 = -1;
    return 1;
  }
  uint64_t v45 = sub_25F5975F0();
  uint64_t v47 = v46;
  if (v45 == sub_25F5975F0() && v47 == v48) {
    goto LABEL_48;
  }
  char v50 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_49;
  }
  uint64_t v51 = sub_25F5975F0();
  uint64_t v53 = v52;
  if (v51 == sub_25F5975F0() && v53 == v54)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v56 = sub_25F597C50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v56 & 1) == 0)
    {
      uint64_t v57 = sub_25F5975F0();
      uint64_t v59 = v58;
      if (v57 == sub_25F5975F0() && v59 == v60)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v62 = sub_25F597C50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v62 & 1) == 0)
        {
LABEL_61:

          return 1;
        }
      }
      if (*a8 == -1)
      {
        uint64_t v67 = sub_25F5976F0();

        *a8 = v67;
        return 1;
      }
      goto LABEL_61;
    }
  }
  if (*a4 == -1 || *a4 >= sub_25F5976F0()) {
    goto LABEL_61;
  }
  uint64_t v66 = sub_25F5976F0();

  *a9 = v66;
  return 1;
}

uint64_t sub_25F585BC4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25F5976B0();
    uint64_t v1 = sub_25F597730();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t sub_25F585C84(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10)
{
  if (a1) {
    id v16 = a1;
  }
  else {
    id v16 = (id)*MEMORY[0x263F13F60];
  }
  id v17 = a1;
  id v18 = v16;
  sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F5769A4);
  uint64_t v19 = *(void *)(*a5 + 16);
  sub_25F5863D8(v19, (uint64_t (*)(BOOL))sub_25F5769A4);
  uint64_t v20 = *a5;
  *(void *)(v20 + 16) = v19 + 1;
  uint64_t v21 = (void *)(v20 + 24 * v19);
  v21[4] = v18;
  v21[5] = a2;
  v21[6] = a3;
  *a5 = v20;
  uint64_t v22 = sub_25F597730();
  MEMORY[0x2611F6780](v22);
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_25F5975F0();
  uint64_t v25 = v24;
  if (v23 == sub_25F5975F0() && v25 == v26) {
    goto LABEL_16;
  }
  char v28 = sub_25F597C50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_17;
  }
  if (qword_26A7AA800 != -1) {
    goto LABEL_30;
  }
  while (1)
  {
    uint64_t v29 = sub_25F5975F0();
    uint64_t v31 = v30;
    if (v29 == sub_25F5975F0() && v31 == v32)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v34 = sub_25F597C50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0) {
        goto LABEL_24;
      }
    }
LABEL_17:
    uint64_t v35 = sub_25F597690();
    if (v35 != sub_25F597690())
    {
LABEL_24:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    sub_25F572184();
    uint64_t v36 = sub_25F5979C0();
    uint64_t v38 = v37;
    swift_bridgeObjectRelease();
    if (v36 == a8 && v38 == a9)
    {
      swift_bridgeObjectRelease();
LABEL_26:
      uint64_t v40 = *a4;
      a8 = (uint64_t)sub_25F5768DC;
      sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F5768DC);
      uint64_t v41 = *(void *)(*a10 + 16);
      sub_25F5863D8(v41, (uint64_t (*)(BOOL))sub_25F5768DC);
      uint64_t v42 = *a10;
      *(void *)(v42 + 16) = v41 + 1;
      *(void *)(v42 + 8 * v41 + 32) = v40;
      *a10 = v42;
      goto LABEL_27;
    }
    a8 = sub_25F597C50();
    swift_bridgeObjectRelease();
    if (a8) {
      goto LABEL_26;
    }
LABEL_27:

    if (!__OFADD__(*a4, 1)) {
      break;
    }
    __break(1u);
LABEL_30:
    swift_once();
  }
  ++*a4;
  return 1;
}

uint64_t sub_25F585FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    sub_25F58682C();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_25F58637C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F576814);
    uint64_t v11 = *(void *)(*(void *)(a8 + 16) + 16);
    sub_25F5863D8(v11, (uint64_t (*)(BOOL))sub_25F576814);
    uint64_t v12 = *(void *)(a8 + 16);
    *(void *)(v12 + 16) = v11 + 1;
    uint64_t v13 = v12 + 16 * v11;
    *(void *)(v13 + 32) = v9;
    *(void *)(v13 + 40) = v8;
    return swift_endAccess();
  }
  return result;
}

uint64_t String.rangeToInt(from:)()
{
  sub_25F572540((uint64_t *)&unk_26B399DC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25F599620;
  sub_25F572184();
  *(void *)(v0 + 32) = sub_25F597680();
  *(void *)(v0 + 40) = sub_25F597680();
  return v0;
}

Swift::String __swiftcall String.slice(from:to:)(Swift::Int from, Swift::Int to)
{
  uint64_t v2 = 0;
  unint64_t v3 = 0xE000000000000000;
  if ((from & 0x8000000000000000) == 0 && from < to)
  {
    if (sub_25F597690() >= to)
    {
      unint64_t v4 = sub_25F5976C0();
      unint64_t v5 = sub_25F5976C0();
      if (v5 >> 14 < v4 >> 14)
      {
        __break(1u);
        goto LABEL_9;
      }
      uint64_t v7 = sub_25F597730();
      uint64_t v2 = MEMORY[0x2611F6780](v7);
      unint64_t v3 = v8;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  unint64_t v5 = v2;
  uint64_t v6 = (void *)v3;
LABEL_9:
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

id sub_25F5861EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v5 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_25F5972B0();

    swift_willThrow();
  }
  return v6;
}

id sub_25F5862C8(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  v6[0] = 0;
  id v2 = objc_msgSend(v1, sel_initWithTypes_error_, a1, v6);
  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_25F5972B0();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_25F58637C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_25F5863D8(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

void sub_25F586420(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25F5975C0();
  objc_msgSend(a3, sel_setString_, v4);
}

uint64_t sub_25F586478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F581D14(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t **)(v3 + 32));
}

uint64_t sub_25F586484(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F582230(a1, a2, a3, *(uint64_t **)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(unsigned char **)(v3 + 40), *(uint64_t **)(v3 + 48));
}

uint64_t sub_25F586494(uint64_t a1)
{
  uint64_t v2 = sub_25F572540(qword_26B399DE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F5864F4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F5827C8(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char **)(v3 + 32));
}

uint64_t sub_25F586500(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F582CF8(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_25F58650C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F582FD8(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_25F586518(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F583364(a1, a2, a3, *(unsigned char *)(v3 + 16), *(uint64_t **)(v3 + 24));
}

uint64_t sub_25F586528(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F583874(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_25F586534(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F583D2C(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t **)(v3 + 32), *(void *)(v3 + 40));
}

uint64_t sub_25F586544(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F585C84(a1, a2, a3, *(void **)(v3 + 16), *(uint64_t **)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(uint64_t **)(v3 + 64)) & 1;
}

uint64_t sub_25F58657C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F5865B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25F577CDC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F5865FC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25F5856A8(a1, a2, a3, *(uint64_t **)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(uint64_t **)(v3 + 40), *(uint64_t **)(v3 + 48), *(uint64_t **)(v3 + 56)) & 1;
}

unint64_t sub_25F586630()
{
  unint64_t result = qword_26A7AAB48;
  if (!qword_26A7AAB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AAB48);
  }
  return result;
}

uint64_t sub_25F586680()
{
  return sub_25F597C50();
}

uint64_t sub_25F5866C4()
{
  return swift_allocObject();
}

uint64_t sub_25F5866E8()
{
  return sub_25F597C50();
}

uint64_t sub_25F586710()
{
  return sub_25F5975F0();
}

id sub_25F586728(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v4, v3);
}

uint64_t sub_25F586758()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F586770()
{
  return sub_25F597740();
}

void sub_25F58678C(void *a1)
{
  sub_25F586420(v2, v1, a1);
}

uint64_t sub_25F5867E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25F585FA0(a1, a2, a3, a4, a5, a6, a7, v7);
}

uint64_t sub_25F5867EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F586804()
{
  return sub_25F597C50();
}

id sub_25F586838()
{
  return sub_25F581C9C();
}

uint64_t sub_25F586864()
{
  return sub_25F597950();
}

uint64_t sub_25F586888()
{
  return swift_allocObject();
}

uint64_t sub_25F5868B4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F586910()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F586928()
{
  return sub_25F597710();
}

uint64_t sub_25F586940()
{
  return sub_25F597950();
}

uint64_t sub_25F586960()
{
  return 15;
}

uint64_t sub_25F58698C(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  *(void *)(v3 - 72) = a1;
  return sub_25F597770();
}

uint64_t sub_25F5869AC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  *(void *)(v3 - 80) = a1;
  return sub_25F597770();
}

uint64_t sub_25F5869E0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F5869F8()
{
  return sub_25F597690();
}

uint64_t static LanguageDetection.languageForLocaleIdentifier(_:)()
{
  unint64_t v0 = sub_25F572184();
  sub_25F5979F0();
  uint64_t v1 = (void *)sub_25F5979B0();
  swift_bridgeObjectRelease();
  if (!v1[2])
  {
    __break(1u);
    goto LABEL_84;
  }
  unint64_t v2 = (void *)sub_25F5979B0();
  if (!v2[2])
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  unint64_t v0 = v2[4];
  uint64_t v3 = v2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v1[2];
  if (!v4)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  if (v4 == 1)
  {
    swift_bridgeObjectRelease();
    BOOL v5 = v0 == 26746 && v3 == 0xE200000000000000;
    if (!v5 && (sub_25F597C50() & 1) == 0) {
      return v0;
    }
    sub_25F5876E8();
    goto LABEL_25;
  }
  uint64_t v6 = (uint64_t)&v1[2 * v4 + 4];
  uint64_t v8 = *(void *)(v6 - 16);
  uint64_t v7 = *(void *)(v6 - 8);
  BOOL v9 = v0 == 26746 && v3 == 0xE200000000000000;
  if (!v9 && (sub_25F5876A4() & 1) == 0)
  {
    BOOL v14 = v0 == 31349 && v3 == 0xE200000000000000;
    if (!v14 && (sub_25F5876A4() & 1) == 0)
    {
      BOOL v20 = v0 == 29299 && v3 == 0xE200000000000000;
      if (v20 || (sub_25F5876A4() & 1) != 0)
      {
        sub_25F587778();
        swift_bridgeObjectRelease();
        char v21 = sub_25F5876C4();
        swift_bridgeObjectRelease();
        if (v21)
        {
          swift_bridgeObjectRelease();
          return 0x6E74614C2D7273;
        }
        return v0;
      }
      BOOL v25 = v0 == 26984 && v3 == 0xE200000000000000;
      if (v25 || (sub_25F5876A4() & 1) != 0)
      {
        sub_25F587778();
        swift_bridgeObjectRelease();
        char v26 = sub_25F5876C4();
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0) {
          return v0;
        }
        sub_25F587750();
      }
      goto LABEL_25;
    }
    uint64_t v16 = v1[6];
    uint64_t v15 = v1[7];
    BOOL v17 = v16 == 1819441475 && v15 == 0xE400000000000000;
    if (v17 || (sub_25F5876FC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 31349;
    }
    BOOL v22 = v16 == 1650553409 && v15 == 0xE400000000000000;
    if (v22 || (sub_25F5876FC() & 1) != 0)
    {
      sub_25F587714();
LABEL_23:
      swift_bridgeObjectRelease();
LABEL_25:
      swift_bridgeObjectRelease();
      return v0;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v16 == 1853120844 && v15 == 0xE400000000000000)
    {
      sub_25F58772C();
      goto LABEL_23;
    }
    char v28 = sub_25F5876C4();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_74;
    }
    sub_25F572540(&qword_26B399CF0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25F599620;
    *(void *)(inited + 32) = 23125;
    *(void *)(inited + 40) = 0xE200000000000000;
    *(void *)(inited + 48) = 23105;
    *(void *)(inited + 56) = 0xE200000000000000;
    char v30 = sub_25F5870A0(v8, v7, (void *)inited);
    swift_setDeallocating();
    sub_25F587650();
    if (v30)
    {
LABEL_74:
      sub_25F58772C();
      goto LABEL_25;
    }
    if (v8 != 17985 || v7 != 0xE200000000000000)
    {
      char v32 = sub_25F597C50();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0) {
        return v0;
      }
      unint64_t v0 = 0x626172412D7A75;
      goto LABEL_25;
    }
LABEL_86:
    sub_25F587714();
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (v1[2] >= 2uLL)
  {
    uint64_t v12 = v1[6];
    uint64_t v11 = v1[7];
    BOOL v13 = v12 == 1936613704 && v11 == 0xE400000000000000;
    if (v13 || (unint64_t v0 = 0xE400000000000000, (sub_25F5876FC() & 1) != 0))
    {
      sub_25F5876E8();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != 1953390920 || v11 != 0xE400000000000000)
      {
        sub_25F587764();
        char v19 = sub_25F5876FC();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          sub_25F572540(&qword_26B399CF0);
          uint64_t v23 = swift_initStackObject();
          *(_OWORD *)(v23 + 16) = xmmword_25F599600;
          *(void *)(v23 + 32) = 19272;
          *(void *)(v23 + 40) = 0xE200000000000000;
          *(void *)(v23 + 48) = 20301;
          *(void *)(v23 + 56) = 0xE200000000000000;
          *(void *)(v23 + 64) = 22356;
          *(void *)(v23 + 72) = 0xE200000000000000;
          char v24 = sub_25F5870A0(v8, v7, (void *)v23);
          swift_setDeallocating();
          sub_25F587650();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0) {
            return 0x736E61482D687ALL;
          }
          return v0;
        }
        goto LABEL_25;
      }
      sub_25F587764();
    }
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t static LanguageDetection.userLanguages()()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v1 = (void *)sub_25F5975C0();
  id v2 = objc_msgSend(v0, sel_stringArrayForKey_, v1);

  if (v2)
  {
    uint64_t v3 = sub_25F597750();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = sub_25F58730C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F5870A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25F597C50();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  BOOL v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_25F597C50() & 1) != 0) {
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

uint64_t static LanguageDetection.languageStringForLanguageID(_:)(int a1)
{
  if ((a1 - 2) > 0x38) {
    return 0;
  }
  else {
    return *(void *)&aAr[8 * a1 - 16];
  }
}

uint64_t static LanguageDetection.languageIdForLanguageString(_:)()
{
  uint64_t v0 = 58;
  while (1)
  {
    static LanguageDetection.languageStringForLanguageID(_:)(v0);
    if (v1)
    {
      char v2 = sub_25F597710();
      swift_bridgeObjectRelease();
      if (v2) {
        break;
      }
    }
    uint64_t v0 = (v0 - 1);
    if (v0 <= 1) {
      return 1;
    }
  }
  return v0;
}

uint64_t static LanguageDetection.defaultLanguage()()
{
  uint64_t v0 = sub_25F5973E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F5973D0();
  sub_25F5973A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v4 = static LanguageDetection.languageForLocaleIdentifier(_:)();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F58730C(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  if (a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_25F572184();
    uint64_t v4 = (uint64_t *)(v2 + 40);
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      if (sub_25F597A20() & 1) != 0 || (sub_25F597A20())
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_25F58F340(0, *(void *)(v5 + 16) + 1, 1);
        }
        unint64_t v9 = *(void *)(v5 + 16);
        unint64_t v8 = *(void *)(v5 + 24);
        if (v9 >= v8 >> 1) {
          sub_25F58F340((char *)(v8 > 1), v9 + 1, 1);
        }
        *(void *)(v5 + 16) = v9 + 1;
        uint64_t v10 = v5 + 16 * v9;
        *(void *)(v10 + 32) = v7;
        *(void *)(v10 + 40) = v6;
      }
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  int64_t v11 = *(void *)(v5 + 16);
  if (v11)
  {
    sub_25F58F340(0, v11, 0);
    uint64_t v12 = v1;
    uint64_t v13 = v5 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_25F5973C0();
      uint64_t v16 = v15;
      swift_bridgeObjectRelease();
      unint64_t v18 = *(void *)(v1 + 16);
      unint64_t v17 = *(void *)(v1 + 24);
      if (v18 >= v17 >> 1) {
        sub_25F58F340((char *)(v17 > 1), v18 + 1, 1);
      }
      v13 += 16;
      *(void *)(v1 + 16) = v18 + 1;
      unint64_t v19 = v1 + 16 * v18;
      *(void *)(v19 + 32) = v14;
      *(void *)(v19 + 40) = v16;
      --v11;
    }
    while (v11);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
  if (!*(void *)(v12 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_25F5973B0();
    int64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
      sub_25F58F340(0, v21, 0);
      uint64_t v12 = v1;
      uint64_t v22 = v20 + 40;
      do
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_25F5973C0();
        uint64_t v25 = v24;
        swift_bridgeObjectRelease();
        unint64_t v27 = *(void *)(v1 + 16);
        unint64_t v26 = *(void *)(v1 + 24);
        if (v27 >= v26 >> 1) {
          sub_25F58F340((char *)(v26 > 1), v27 + 1, 1);
        }
        v22 += 16;
        *(void *)(v1 + 16) = v27 + 1;
        unint64_t v28 = v1 + 16 * v27;
        *(void *)(v28 + 32) = v23;
        *(void *)(v28 + 40) = v25;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = MEMORY[0x263F8EE78];
    }
  }
  return sub_25F591CB4(v12);
}

uint64_t sub_25F587650()
{
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

ValueMetadata *type metadata accessor for LanguageDetection()
{
  return &type metadata for LanguageDetection;
}

uint64_t sub_25F5876A4()
{
  return sub_25F597C50();
}

uint64_t sub_25F5876C4()
{
  return sub_25F597C50();
}

uint64_t sub_25F5876FC()
{
  return sub_25F597C50();
}

uint64_t sub_25F587714()
{
  return v0;
}

uint64_t sub_25F58772C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F587778()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25F587798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F5977B0();
  if (sub_25F577D8C(a1, 1, v6) == 1)
  {
    sub_25F58E3C0(a1, &qword_26B399CB0);
  }
  else
  {
    sub_25F5977A0();
    sub_25F579404();
    v7();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F597790();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25F587904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25F5977B0();
  if (sub_25F577D8C(a1, 1, v8) == 1)
  {
    sub_25F58E3C0(a1, &qword_26B399CB0);
  }
  else
  {
    sub_25F5977A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F597790();
    swift_unknownObjectRelease();
  }
  unint64_t v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a2;
  v9[4] = a3;
  return swift_task_create();
}

uint64_t sub_25F587A74()
{
  uint64_t v0 = sub_25F597850();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F597930();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_25F597500();
  MEMORY[0x270FA5388](v5 - 8);
  sub_25F58E2DC();
  sub_25F5974F0();
  v7[1] = MEMORY[0x263F8EE78];
  sub_25F58E31C();
  sub_25F572540(&qword_26B399EA0);
  sub_25F58E36C();
  sub_25F597A40();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F138], v0);
  uint64_t result = sub_25F597940();
  qword_26B399C70 = result;
  return result;
}

uint64_t sub_25F587C74()
{
  return 1;
}

uint64_t sub_25F587C7C()
{
  return sub_25F597DA0();
}

uint64_t sub_25F587CA4()
{
  return sub_25F597DB0();
}

uint64_t sub_25F587CF4()
{
  return sub_25F597DB0();
}

uint64_t TUSTrialAssets.factors.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

void *TUSTrialAssets.rolloutIdentifiers.getter(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + *(int *)(a1 + 28));
  id v3 = v2;
  return v2;
}

void *TUSTrialAssets.experimentIdentifiers.getter(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + *(int *)(a1 + 32));
  id v3 = v2;
  return v2;
}

void sub_25F587DC0()
{
  sub_25F57957C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_25F58E4F8();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  sub_25F58E730();
  v16();
  sub_25F572540(qword_26B399BE8);
  if (swift_dynamicCast())
  {
    sub_25F58E40C(v26, (uint64_t)v28);
    v25[1] = v7;
    uint64_t v17 = v9;
    uint64_t v18 = v5;
    uint64_t v19 = v3;
    uint64_t v20 = v29;
    uint64_t v21 = v30;
    sub_25F58E424((uint64_t)v28, v29);
    uint64_t v22 = v20;
    uint64_t v3 = v19;
    uint64_t v5 = v18;
    uint64_t v9 = v17;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v21);
    sub_25F579364();
    v23();
    sub_25F58E474((uint64_t)v28, (uint64_t)v26);
    swift_dynamicCast();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v17, v15, v1);
    sub_25F572494((uint64_t)v28);
  }
  else
  {
    uint64_t v27 = 0;
    memset(v26, 0, sizeof(v26));
    sub_25F58E3C0((uint64_t)v26, &qword_26A7AABF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v7, v1);
  }
  uint64_t v24 = type metadata accessor for TUSTrialAssets();
  *(void *)(v9 + *(int *)(v24 + 28)) = v5;
  *(void *)(v9 + *(int *)(v24 + 32)) = v3;
  sub_25F5794FC();
}

void TUSTrialAssets.description.getter()
{
  sub_25F57957C();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v3);
  sub_25F58E668();
  uint64_t v8 = *(void **)(v0 + *(int *)(v7 + 28));
  if (v8)
  {
    id v9 = v8;
    sub_25F597A90();
    sub_25F5976D0();
    id v10 = objc_msgSend(v9, sel_rolloutId);
    sub_25F5975F0();

    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F58E584();
    LODWORD(v16) = objc_msgSend(v9, sel_deploymentId);
    sub_25F597B90();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    id v11 = objc_msgSend(v9, sel_factorPackId, v16);
    sub_25F5975F0();

    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
  }
  uint64_t v12 = *(void **)(v2 + *(int *)(v4 + 32));
  if (v12)
  {
    id v13 = v12;
    sub_25F597A90();
    sub_25F5976D0();
    id v14 = objc_msgSend(v13, sel_experimentId);
    sub_25F5975F0();

    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
    id v15 = objc_msgSend(v13, sel_treatmentId);
    sub_25F5975F0();

    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F58E584();
    objc_msgSend(v13, sel_deploymentId);
    sub_25F597B90();
    sub_25F5976D0();
    swift_bridgeObjectRelease();
    sub_25F5976D0();
  }
  sub_25F597A90();
  sub_25F5976D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v2, v5);
  sub_25F597630();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5976D0();
  sub_25F572540(&qword_26B399C90);
  sub_25F597630();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5976D0();
  sub_25F597630();
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5794FC();
}

uint64_t TUSTrialNamespaceManager.assets.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v179 = a1;
  uint64_t v3 = *v1;
  uint64_t v167 = v3;
  Class isa = v3[10].isa;
  uint64_t v165 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v164 = v5;
  sub_25F58E7C8();
  MEMORY[0x270FA5388](v6);
  id v166 = (char *)&v149 - v7;
  uint64_t v173 = sub_25F5974C0();
  sub_25F58E4F8();
  uint64_t v172 = v8;
  MEMORY[0x270FA5388](v9);
  sub_25F58E550();
  sub_25F58E530();
  MEMORY[0x270FA5388](v10);
  sub_25F579298();
  sub_25F58E530();
  MEMORY[0x270FA5388](v11);
  sub_25F579298();
  sub_25F58E530();
  MEMORY[0x270FA5388](v12);
  sub_25F579298();
  sub_25F58E530();
  MEMORY[0x270FA5388](v13);
  uint64_t v160 = (char *)&v149 - v14;
  sub_25F58E4F8();
  uint64_t v171 = v15;
  MEMORY[0x270FA5388](v16);
  sub_25F58E550();
  sub_25F58E530();
  MEMORY[0x270FA5388](v17);
  sub_25F579298();
  sub_25F58E530();
  MEMORY[0x270FA5388](v18);
  sub_25F579298();
  sub_25F58E530();
  MEMORY[0x270FA5388](v19);
  uint64_t v170 = (char *)&v149 - v20;
  uint64_t v178 = sub_25F597350();
  sub_25F58E4F8();
  uint64_t v175 = v21;
  MEMORY[0x270FA5388](v22);
  sub_25F58E550();
  sub_25F58E530();
  MEMORY[0x270FA5388](v23);
  id v177 = (char *)&v149 - v24;
  uint64_t v176 = (uint64_t)isa;
  uint64_t v25 = type metadata accessor for TUSTrialAssets();
  uint64_t v26 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388](v29);
  sub_25F58E550();
  sub_25F58E530();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v149 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v149 - v34;
  uint64_t v36 = (char *)v2 + (unint64_t)v3[13].isa;
  sub_25F58E764();
  uint64_t v37 = *(void (**)(void))(v28 + 16);
  sub_25F58E820();
  v37();
  LODWORD(v3) = sub_25F577D8C((uint64_t)v35, 1, v25);
  sub_25F579364();
  v38();
  if (v3 != 1)
  {
    sub_25F58E820();
    return ((uint64_t (*)(void))v37)();
  }
  uint64_t v157 = v28;
  uint64_t v159 = v25;
  uint64_t v153 = v33;
  id v154 = v37;
  uint64_t v155 = v28 + 16;
  id v156 = v36;
  uint64_t v158 = v26;
  sub_25F58E8A4();
  sub_25F597340();
  uint64_t v39 = (char *)v2 + (unint64_t)(*v2)[15].isa;
  sub_25F58E764();
  uint64_t v40 = v175;
  uint64_t v41 = v178;
  sub_25F58E730();
  v42();
  sub_25F597330();
  double v44 = v43;
  uint64_t v45 = (void (*)(void))*((void *)v40 + 1);
  sub_25F58E814();
  v45();
  if (*(double *)((char *)v2 + (unint64_t)(*v2)[16].isa) > v44)
  {
    sub_25F58E814();
    v45();
    uint64_t v46 = v179;
    uint64_t v47 = v159;
    return sub_25F5721D0(v46, 1, 1, v47);
  }
  uint64_t v49 = v2;
  sub_25F57B2F0();
  (*((void (**)(char *, uint64_t, uint64_t))v40 + 3))(v39, v25, v41);
  swift_endAccess();
  char v50 = *(NSObject **)((char *)v2 + (unint64_t)(*v2)[18].isa);
  objc_msgSend(v50, sel_refresh);
  uint64_t v51 = (char *)v2 + (unint64_t)(*v2)[17].isa;
  uint64_t v53 = *(void (**)(void))v51;
  unint64_t v52 = *((void *)v51 + 1);
  uint64_t v181 = 0;
  swift_unknownObjectWeakInit();
  v180[0] = v50;
  v180[1] = v53;
  v180[2] = v52;
  uint64_t v181 = &off_270BA68B0;
  swift_unknownObjectWeakAssign();
  sub_25F5897DC((uint64_t)v180, (uint64_t)&v182);
  id v174 = v50;
  swift_bridgeObjectRetain();
  uint64_t v54 = v170;
  sub_25F57B5B8();
  uint64_t v152 = (uint64_t)v40 + 8;
  id v151 = v45;
  uint64_t v175 = v53;
  sub_25F589838((uint64_t)&v182);
  if ((*(uint64_t (**)(char *))((char *)v49 + (unint64_t)(*v49)[22].isa))(v54))
  {
    sub_25F58E730();
    v55();
    char v56 = (void *)sub_25F5975C0();
    id v57 = v174;
    id v58 = objc_msgSend(v174, sel_rolloutIdentifiersWithNamespaceName_, v56);

    uint64_t v59 = (void *)sub_25F5975C0();
    id v60 = objc_msgSend(v57, sel_experimentIdentifiersWithNamespaceName_, v59);

    uint64_t v61 = (uint64_t)v153;
    sub_25F587DC0();
    sub_25F58E77C(v61);
    uint64_t v62 = v157;
    uint64_t v63 = v162;
    uint64_t v64 = v158;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 32))(v162, v61, v158);
    id v65 = v156;
    sub_25F57B2F0();
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 40))(v65, v63, v64);
    swift_endAccess();
    sub_25F5974B0();
    swift_retain_n();
    uint64_t v66 = sub_25F5974A0();
    os_log_type_t v67 = sub_25F597810();
    if (os_log_type_enabled(v66, v67))
    {
      id v68 = (uint8_t *)sub_25F579258();
      uint64_t v69 = sub_25F579220();
      sub_25F58E7D4(v69, (uint64_t)&v186);
      *(_DWORD *)id v68 = 136315138;
      id v174 = v68 + 4;
      ((void (*)(uint64_t, char *, uint64_t))v154)(v61, v156, v158);
      uint64_t v70 = sub_25F597650();
      uint64_t v72 = sub_25F5718D4(v70, v71, &v182);
      sub_25F58E5F0(v72);
      sub_25F597980();
      swift_bridgeObjectRelease();
      sub_25F58E5B4();
      _os_log_impl(&dword_25F56F000, v66, v67, "We successfully decoded struct %s", v68, 0xCu);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();
    }
    else
    {

      sub_25F58E5B4();
    }
    sub_25F58E814();
    v73();
    sub_25F58E6B0();
    sub_25F579404();
    v74();
    sub_25F58E510();
    v75();
    sub_25F58E730();
    return v92();
  }
  else
  {
    sub_25F5974B0();
    id v76 = *(void (**)(uint64_t, char *))(v171 + 16);
    uint64_t v77 = v176;
    v76(v161, v54);
    id v78 = sub_25F5974A0();
    os_log_type_t v79 = sub_25F597830();
    int v80 = v79;
    uint64_t v167 = v78;
    BOOL v81 = os_log_type_enabled(v78, v79);
    uint64_t v82 = v172;
    uint64_t v83 = v163;
    if (v81)
    {
      uint64_t v84 = sub_25F579258();
      uint64_t v85 = sub_25F579220();
      sub_25F58E7D4(v85, (uint64_t)v183);
      *(_DWORD *)uint64_t v84 = 136315138;
      uint64_t v53 = (void (*)(void))(v84 + 12);
      uint64_t v149 = v84 + 4;
      int v150 = v80;
      ((void (*)(uint64_t, uint64_t, uint64_t))v76)(v83, v161, v77);
      uint64_t v86 = sub_25F597650();
      uint64_t v88 = sub_25F5718D4(v86, v87, &v182);
      sub_25F58E5F0(v88);
      sub_25F597980();
      swift_bridgeObjectRelease();
      sub_25F58E698();
      sub_25F579364();
      ((void (*)(void))(v84 + 12))();
      uint64_t v89 = v167;
      _os_log_impl(&dword_25F56F000, v167, (os_log_type_t)v150, "Validation for factors %s returned false, attempting to fall back to default factors loader", (uint8_t *)v84, 0xCu);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      uint64_t v90 = v172;
      sub_25F579364();
      v91();
    }
    else
    {
      sub_25F58E698();
      sub_25F579364();
      v53();

      sub_25F579364();
      v93();
      uint64_t v90 = v82;
    }
    sub_25F58CD7C();
    uint64_t v94 = (void *)swift_allocError();
    swift_willThrow();
    ((void (*)(char *, uint64_t))v53)(v170, v77);
    uint64_t v95 = (uint64_t)v175;
    sub_25F5974B0();
    swift_retain();
    id v96 = v94;
    swift_retain();
    id v97 = v94;
    BOOL v98 = sub_25F5974A0();
    os_log_type_t v99 = sub_25F597830();
    id v100 = dispatch_sync;
    if (os_log_type_enabled(v98, v99))
    {
      uint64_t v101 = sub_25F58E648();
      uint64_t v167 = swift_slowAlloc();
      uint64_t v102 = sub_25F579220();
      sub_25F58E7D4(v102, (uint64_t)&v185);
      *(_DWORD *)uint64_t v101 = 136315394;
      swift_bridgeObjectRetain();
      v180[0] = sub_25F5718D4(v95, v52, &v182);
      uint64_t v103 = v90;
      unint64_t v104 = v52;
      sub_25F597980();
      swift_bridgeObjectRelease();
      sub_25F58E5B4();
      *(_WORD *)(v101 + 12) = 2112;
      id v105 = v94;
      uint64_t v106 = _swift_stdlib_bridgeErrorToNSError();
      v180[0] = v106;
      sub_25F597980();
      v167->Class isa = (Class)v106;
      uint64_t v107 = v176;

      _os_log_impl(&dword_25F56F000, v98, v99, "Unable to instantiate assets for %s due to: %@", (uint8_t *)v101, 0x16u);
      sub_25F572540(&qword_26B399CC8);
      swift_arrayDestroy();
      sub_25F5791D8();
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      uint64_t v108 = *(char **)(v103 + 8);
      id v100 = (void (__cdecl *)(dispatch_queue_t, dispatch_block_t))(v103 + 8);
      uint64_t v170 = v108;
      ((void (*)(uint64_t, uint64_t))v108)(v169, v173);
    }
    else
    {

      sub_25F58E5B4();
      uint64_t v170 = *(char **)(v90 + 8);
      sub_25F579364();
      v109();
      uint64_t v107 = v176;
      unint64_t v104 = v52;
    }
    uint64_t v110 = v168;
    uint64_t v111 = v157;
    uint64_t v112 = v165;
    uint64_t v113 = v164;
    id v114 = v174;
    sub_25F58E8A4();
    v115(v114, v175, v104);
    if (sub_25F577D8C((uint64_t)v100, 1, v107) == 1)
    {
      (*(void (**)(void (__cdecl *)(dispatch_queue_t, dispatch_block_t), uint64_t))(v113 + 8))(v100, v112);
      sub_25F58E8A4();
      sub_25F5974B0();
      swift_retain_n();
      id v116 = sub_25F5974A0();
      os_log_type_t v117 = sub_25F597810();
      if (os_log_type_enabled(v116, v117))
      {
        uint64_t v118 = (uint8_t *)sub_25F579258();
        uint64_t v182 = sub_25F579220();
        *(_DWORD *)uint64_t v118 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v119 = sub_25F58E884();
        sub_25F58E5F0(v119);
        sub_25F597980();
        swift_bridgeObjectRelease();
        sub_25F58E5B4();
        _os_log_impl(&dword_25F56F000, v116, v117, "Unable to instantiate default assets for %s", v118, 0xCu);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      else
      {

        sub_25F58E5B4();
      }
      sub_25F58E6C8();
      sub_25F579364();
      v144();
      sub_25F58E510();
      v145();
      uint64_t v46 = v179;
      uint64_t v47 = v159;
      return sub_25F5721D0(v46, 1, 1, v47);
    }
    (*(void (**)(uint64_t, void (__cdecl *)(dispatch_queue_t, dispatch_block_t), uint64_t))(v171 + 32))(v110, v100, v107);
    uint64_t v120 = v163;
    sub_25F58E730();
    v121();
    id v122 = (void *)sub_25F5975C0();
    id v123 = objc_msgSend(v114, sel_rolloutIdentifiersWithNamespaceName_, v122);

    uint64_t v124 = (void *)sub_25F5975C0();
    id v125 = objc_msgSend(v114, sel_experimentIdentifiersWithNamespaceName_, v124);

    sub_25F58E8A4();
    sub_25F587DC0();
    sub_25F58E77C(v120);
    uint64_t v126 = v162;
    uint64_t v127 = v158;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 32))(v162, v120, v158);
    unint64_t v128 = v156;
    sub_25F57B2F0();
    (*(void (**)(char *, uint64_t, uint64_t))(v111 + 40))(v128, v126, v127);
    swift_endAccess();
    sub_25F5974B0();
    swift_retain_n();
    v129 = sub_25F5974A0();
    os_log_type_t v130 = sub_25F597810();
    int v131 = v130;
    if (os_log_type_enabled(v129, v130))
    {
      uint64_t v132 = sub_25F58E648();
      LODWORD(v174) = v131;
      uint64_t v133 = v132;
      uint64_t v134 = sub_25F579370();
      sub_25F58E7D4(v134, (uint64_t)&v184);
      *(_DWORD *)uint64_t v133 = 136315394;
      swift_bridgeObjectRetain();
      v180[0] = sub_25F58E884();
      sub_25F597980();
      swift_bridgeObjectRelease();
      sub_25F58E5B4();
      *(_WORD *)(v133 + 12) = 2080;
      uint64_t v135 = v128;
      uint64_t v136 = v158;
      uint64_t v137 = v154;
      ((void (*)(uint64_t, char *, uint64_t))v154)(v120, v135, v158);
      uint64_t v138 = sub_25F597650();
      uint64_t v139 = v171;
      v180[0] = sub_25F5718D4(v138, v140, &v182);
      sub_25F597980();
      id v141 = v156;
      swift_bridgeObjectRelease();
      sub_25F58E5B4();
      _os_log_impl(&dword_25F56F000, v129, (os_log_type_t)v174, "Instantiated default assets for %s using: %s", (uint8_t *)v133, 0x16u);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      sub_25F58E6C8();
      sub_25F579364();
      v142();
      (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v168, v176);
      sub_25F58E510();
      v143();
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v137)(v179, v141, v136);
    }
    else
    {

      swift_release_n();
      sub_25F58E6C8();
      sub_25F579364();
      v146();
      sub_25F579404();
      v147();
      sub_25F58E510();
      v148();
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v154)(v179, v128, v158);
    }
  }
}

uint64_t type metadata accessor for TUSTrialAssets()
{
  return sub_25F57B258();
}

uint64_t sub_25F5897DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25F589838(uint64_t a1)
{
  return a1;
}

uint64_t TUSTrialNamespaceManager.__allocating_init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)()
{
  sub_25F58E718();
  sub_25F58E604();
  sub_25F58E864();
  sub_25F58E6D8();
  TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
    v21,
    v22,
    v23);
  return v0;
}

void TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_25F57957C();
  uint64_t v104 = v25;
  uint64_t v97 = v27;
  uint64_t v98 = v26;
  int v103 = v28;
  unsigned int v94 = v29;
  int v95 = v30;
  uint64_t v32 = v31;
  uint64_t v101 = v33;
  uint64_t v102 = a22;
  uint64_t v96 = a21;
  sub_25F58E56C();
  uint64_t v100 = v34;
  uint64_t v35 = sub_25F572540(&qword_26B399CB0);
  uint64_t v36 = sub_25F58E79C(v35);
  MEMORY[0x270FA5388](v36);
  sub_25F57B288();
  uint64_t v93 = v37;
  uint64_t v38 = sub_25F597350();
  sub_25F58E4F8();
  uint64_t v40 = v39;
  MEMORY[0x270FA5388](v41);
  sub_25F58E668();
  uint64_t v99 = *(void *)(v24 + 80);
  uint64_t v42 = type metadata accessor for TUSTrialAssets();
  uint64_t v43 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v45 = v44;
  sub_25F58E7C8();
  MEMORY[0x270FA5388](v46);
  uint64_t v48 = (char *)&v92 - v47;
  swift_defaultActor_initialize();
  sub_25F57B2D8();
  uint64_t v50 = v22 + *(void *)(v49 + 104);
  uint64_t v51 = sub_25F58E5E0();
  sub_25F5721D0(v51, v52, v53, v42);
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v54 + 128)) = 0x40F5180000000000;
  sub_25F5721D0((uint64_t)v48, 1, 1, v42);
  sub_25F57B2F0();
  uint64_t v55 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 40);
  uint64_t v92 = v43;
  v55(v50, v48, v43);
  swift_endAccess();
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v56 + 112)) = MEMORY[0x263F8EE80];
  sub_25F597320();
  sub_25F57B2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v22 + *(void *)(v57 + 120), v23, v38);
  if (qword_26B399C80 != -1) {
    swift_once();
  }
  id v58 = (void *)qword_26B399C70;
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v59 + 168)) = v58;
  sub_25F57B2D8();
  uint64_t v61 = (void *)(v22 + *(void *)(v60 + 136));
  uint64_t v62 = v101;
  *uint64_t v61 = v101;
  v61[1] = v32;
  uint64_t v63 = self;
  id v64 = v58;
  swift_bridgeObjectRetain();
  id v65 = objc_msgSend(v63, sel_clientWithIdentifier_, v94);
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v66 + 144)) = v67;
  sub_25F57B2D8();
  *(unsigned char *)(v22 + *(void *)(v68 + 152)) = v95 & 1;
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v69 + 160)) = v98;
  sub_25F57B2D8();
  unint64_t v71 = (void *)(v22 + *(void *)(v70 + 176));
  uint64_t v72 = v104;
  *unint64_t v71 = v73;
  v71[1] = v72;
  sub_25F57B2D8();
  uint64_t v75 = (void *)(v22 + *(void *)(v74 + 184));
  uint64_t v76 = v102;
  void *v75 = v96;
  v75[1] = v76;
  id v78 = v77;
  swift_retain();
  swift_retain();
  objc_msgSend(v65, sel_refresh);
  id v79 = v65;
  int v80 = (void *)sub_25F5975C0();
  uint64_t v81 = swift_allocObject();
  swift_weakInit();
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = v99;
  *(void *)(v82 + 24) = *(void *)(v100 + 88);
  *(void *)(v82 + 32) = v81;
  *(void *)(v82 + 40) = v62;
  *(void *)(v82 + 48) = v32;
  char v83 = v103;
  *(unsigned char *)(v82 + 56) = v103 & 1;
  v105[4] = sub_25F58CE04;
  v105[5] = v82;
  v105[0] = MEMORY[0x263EF8330];
  v105[1] = 1107296256;
  v105[2] = sub_25F589FB8;
  v105[3] = &unk_270BA67E8;
  uint64_t v84 = _Block_copy(v105);
  swift_release();
  id v85 = objc_msgSend(v79, sel_addUpdateHandlerForNamespaceName_usingBlock_, v80, v84);
  _Block_release(v84);

  swift_unknownObjectRelease();
  if (v83)
  {
    sub_25F5977B0();
    uint64_t v86 = v93;
    uint64_t v87 = sub_25F58E5E0();
    sub_25F5721D0(v87, v88, v89, v90);
    uint64_t v91 = (void *)swift_allocObject();
    sub_25F58E7F4(v91);
    sub_25F587904(v86, (uint64_t)&unk_26A7AAB68, (uint64_t)v84, v92);
    swift_release();
  }
  swift_release();
  swift_release();

  sub_25F5794FC();
}

uint64_t sub_25F589E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 48) = a5;
  *(void *)(v5 + 16) = a4;
  type metadata accessor for TUSTrialAssets();
  uint64_t v7 = sub_25F597970();
  *(void *)(v5 + 24) = v7;
  *(void *)(v5 + 32) = *(void *)(v7 - 8);
  *(void *)(v5 + 40) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F589EEC, a4, 0);
}

uint64_t sub_25F589EEC()
{
  sub_25F58E73C();
  int v1 = *(unsigned __int8 *)(v0 + 48);
  sub_25F58AB50();
  if (v1 == 1)
  {
    TUSTrialNamespaceManager.assets.getter(*(void *)(v0 + 40));
    uint64_t v2 = sub_25F58E6F0();
    v3(v2);
    return MEMORY[0x270FA2498](sub_25F58E4D8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    sub_25F57B2CC();
    return v4();
  }
}

uint64_t sub_25F589FB8(uint64_t a1)
{
  int v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25F58A018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_25F58E4E0, a4, 0);
}

uint64_t TUSTrialNamespaceManager.__allocating_init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)()
{
  sub_25F58E718();
  sub_25F58E604();
  sub_25F58E864();
  sub_25F58E6D8();
  TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
    v21,
    v22,
    v23);
  return v0;
}

void TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_25F57957C();
  uint64_t v100 = v24;
  uint64_t v92 = v26;
  uint64_t v93 = v25;
  int v99 = v27;
  int v90 = v28;
  uint64_t v30 = v29;
  uint64_t v97 = v31;
  uint64_t v98 = a22;
  uint64_t v91 = a21;
  sub_25F58E56C();
  int v95 = v32;
  uint64_t v96 = v33;
  uint64_t v34 = sub_25F572540(&qword_26B399CB0);
  uint64_t v35 = sub_25F58E79C(v34);
  MEMORY[0x270FA5388](v35);
  sub_25F57B288();
  uint64_t v89 = v36;
  uint64_t v37 = sub_25F597350();
  sub_25F58E4F8();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40);
  sub_25F5794EC();
  uint64_t v43 = v42 - v41;
  uint64_t v94 = *(void *)(v23 + 80);
  uint64_t v44 = type metadata accessor for TUSTrialAssets();
  uint64_t v45 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v47 = v46;
  sub_25F58E7C8();
  MEMORY[0x270FA5388](v48);
  uint64_t v50 = (char *)&v88 - v49;
  swift_defaultActor_initialize();
  sub_25F57B2D8();
  uint64_t v52 = v22 + *(void *)(v51 + 104);
  sub_25F5721D0(v52, 1, 1, v44);
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v53 + 128)) = 0x40F5180000000000;
  uint64_t v54 = sub_25F58E5E0();
  sub_25F5721D0(v54, v55, v56, v44);
  sub_25F57B2F0();
  uint64_t v57 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 40);
  uint64_t v88 = v45;
  v57(v52, v50, v45);
  swift_endAccess();
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v58 + 112)) = MEMORY[0x263F8EE80];
  sub_25F597320();
  sub_25F57B2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v22 + *(void *)(v59 + 120), v43, v37);
  if (qword_26B399C80 != -1) {
    swift_once();
  }
  sub_25F57B2D8();
  *(void *)(v22 + *(void *)(v60 + 168)) = v61;
  sub_25F57B2D8();
  uint64_t v63 = (void *)(v22 + *(void *)(v62 + 136));
  uint64_t v64 = v97;
  *uint64_t v63 = v97;
  v63[1] = v30;
  sub_25F57B2D8();
  uint64_t v66 = v93;
  *(void *)(v22 + *(void *)(v65 + 144)) = v93;
  sub_25F57B2D8();
  *(unsigned char *)(v22 + *(void *)(v67 + 152)) = v90 & 1;
  sub_25F57B2D8();
  uint64_t v69 = v95;
  *(void *)(v22 + *(void *)(v68 + 160)) = v95;
  sub_25F57B2D8();
  unint64_t v71 = (void *)(v22 + *(void *)(v70 + 176));
  uint64_t v72 = v100;
  *unint64_t v71 = v92;
  v71[1] = v72;
  sub_25F57B2D8();
  uint64_t v74 = (void *)(v22 + *(void *)(v73 + 184));
  uint64_t v75 = v98;
  void *v74 = v91;
  v74[1] = v75;
  id v77 = v76;
  swift_bridgeObjectRetain();
  id v78 = v66;
  id v79 = v69;
  swift_retain();
  swift_retain();
  objc_msgSend(v78, sel_refresh);
  int v80 = (void *)sub_25F5975C0();
  uint64_t v81 = swift_allocObject();
  swift_weakInit();
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = v94;
  *(void *)(v82 + 24) = *(void *)(v96 + 88);
  *(void *)(v82 + 32) = v81;
  *(void *)(v82 + 40) = v64;
  *(void *)(v82 + 48) = v30;
  char v83 = v99;
  *(unsigned char *)(v82 + 56) = v99 & 1;
  v101[4] = sub_25F58CF3C;
  v101[5] = v82;
  v101[0] = MEMORY[0x263EF8330];
  v101[1] = 1107296256;
  v101[2] = sub_25F589FB8;
  v101[3] = &unk_270BA6860;
  uint64_t v84 = _Block_copy(v101);
  swift_release();
  objc_msgSend(v78, sel_addUpdateHandlerForNamespaceName_usingBlock_, v80, v84);
  _Block_release(v84);

  swift_unknownObjectRelease();
  if (v83)
  {
    uint64_t v85 = sub_25F5977B0();
    uint64_t v86 = v89;
    sub_25F5721D0(v89, 1, 1, v85);
    uint64_t v87 = (void *)swift_allocObject();
    sub_25F58E7F4(v87);
    sub_25F587904(v86, (uint64_t)&unk_26A7AAB78, (uint64_t)v80, v88);
    swift_release();
  }
  swift_release();
  swift_release();

  sub_25F5794FC();
}

void sub_25F58A594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_25F57957C();
  char v22 = v21;
  unint64_t v24 = v23;
  uint64_t v59 = v25;
  int v27 = v26;
  uint64_t v28 = sub_25F572540(&qword_26B399CB0);
  uint64_t v29 = sub_25F58E79C(v28);
  MEMORY[0x270FA5388](v29);
  sub_25F5794EC();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = sub_25F5974C0();
  sub_25F58E4F8();
  uint64_t v35 = v34;
  MEMORY[0x270FA5388](v36);
  sub_25F5794EC();
  uint64_t v39 = v38 - v37;
  sub_25F58E764();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v41 = Strong;
    uint64_t v58 = v35;
    uint64_t v42 = a21;
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    uint64_t v57 = v27;
    swift_unknownObjectRetain_n();
    uint64_t v43 = sub_25F5974A0();
    os_log_type_t v44 = sub_25F597810();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = sub_25F58E648();
      v60[0] = sub_25F579370();
      *(_DWORD *)uint64_t v45 = 136315394;
      char v56 = v22;
      swift_bridgeObjectRetain();
      sub_25F5718D4(v59, v24, v60);
      sub_25F597980();
      sub_25F58E84C();
      *(_WORD *)(v45 + 12) = 2080;
      id v46 = objc_msgSend(v57, sel_description);
      uint64_t v55 = v33;
      uint64_t v47 = v41;
      uint64_t v48 = v32;
      uint64_t v49 = sub_25F5975F0();
      unint64_t v51 = v50;

      uint64_t v52 = v49;
      uint64_t v32 = v48;
      uint64_t v41 = v47;
      sub_25F5718D4(v52, v51, v60);
      sub_25F597980();
      char v22 = v56;
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v43, v44, "TrialNamespaceManager for Trial namespace %s received new configuration for %s", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      sub_25F5791D8();
      uint64_t v42 = a21;
      sub_25F5791D8();

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v39, v55);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v39, v33);
    }
    uint64_t v53 = sub_25F5977B0();
    sub_25F5721D0(v32, 1, 1, v53);
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = 0;
    *(void *)(v54 + 24) = 0;
    *(void *)(v54 + 32) = v41;
    *(unsigned char *)(v54 + 40) = v22 & 1;
    sub_25F587798(v32, v42, v54);
    swift_release();
  }
  sub_25F5794FC();
}

uint64_t sub_25F58A8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 48) = a5;
  *(void *)(v5 + 16) = a4;
  type metadata accessor for TUSTrialAssets();
  uint64_t v7 = sub_25F597970();
  *(void *)(v5 + 24) = v7;
  *(void *)(v5 + 32) = *(void *)(v7 - 8);
  *(void *)(v5 + 40) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F58A9B4, a4, 0);
}

uint64_t sub_25F58A9B4()
{
  sub_25F58E73C();
  int v1 = *(unsigned __int8 *)(v0 + 48);
  sub_25F58AB50();
  if (v1 == 1)
  {
    TUSTrialNamespaceManager.assets.getter(*(void *)(v0 + 40));
    uint64_t v2 = sub_25F58E6F0();
    v3(v2);
    return MEMORY[0x270FA2498](sub_25F58AA80, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    sub_25F57B2CC();
    return v4();
  }
}

uint64_t sub_25F58AA80()
{
  sub_25F57B2C0();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v0();
}

uint64_t sub_25F58AAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_25F58AAF8, a4, 0);
}

uint64_t sub_25F58AAF8()
{
  sub_25F57B2C0();
  TUSTrialNamespaceManager.assets.getter(*(void *)(v0 + 16));
  sub_25F57B2CC();
  return v1();
}

uint64_t sub_25F58AB50()
{
  uint64_t v1 = sub_25F597350();
  sub_25F58E4F8();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_25F5794EC();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for TUSTrialAssets();
  uint64_t v9 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v11 = v10;
  sub_25F58E7C8();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v15 = sub_25F58E5E0();
  sub_25F5721D0(v15, v16, v17, v8);
  sub_25F57B2D8();
  uint64_t v19 = v0 + *(void *)(v18 + 104);
  sub_25F57B2F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v19, v14, v9);
  swift_endAccess();
  sub_25F597320();
  sub_25F57B2D8();
  uint64_t v21 = v0 + *(void *)(v20 + 120);
  sub_25F57B2F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v21, v7, v1);
  swift_endAccess();
  sub_25F57B2D8();
  unint64_t v23 = (void *)(v0 + *(void *)(v22 + 112));
  swift_beginAccess();
  *unint64_t v23 = MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

uint64_t TUSTrialNamespaceManager.deinit()
{
  type metadata accessor for TUSTrialAssets();
  sub_25F597970();
  sub_25F58E5CC();
  sub_25F579404();
  v1();
  swift_bridgeObjectRelease();
  sub_25F57B2D8();
  sub_25F597350();
  sub_25F58E5CC();
  sub_25F579404();
  v2();
  swift_bridgeObjectRelease();
  sub_25F57B2D8();

  sub_25F57B2D8();
  sub_25F57B2D8();

  sub_25F57B2D8();
  swift_release();
  sub_25F57B2D8();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TUSTrialNamespaceManager.__deallocating_deinit()
{
  TUSTrialNamespaceManager.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t TUSTrialNamespaceManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25F58AEE0()
{
  return TUSTrialNamespaceManager.unownedExecutor.getter();
}

uint64_t sub_25F58AEFC()
{
  sub_25F57B2C0();
  v1[17] = v2;
  v1[18] = v0;
  v1[16] = v3;
  v1[19] = *v0;
  uint64_t v4 = sub_25F5974C0();
  v1[20] = v4;
  v1[21] = *(void *)(v4 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v5 = sub_25F572540(&qword_26B399CB0);
  sub_25F58E79C(v5);
  v1[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F58B038, v0, 0);
}

uint64_t sub_25F58B038()
{
  id v78 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v4 = (uint64_t *)(v0[18] + *(void *)(*(void *)v0[18] + 112));
  sub_25F58E764();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25F576124(v1, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (v6)
  {
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v7 = sub_25F5974A0();
    os_log_type_t v8 = sub_25F597820();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v11 = v0[21];
    uint64_t v10 = v0[22];
    uint64_t v12 = v0[20];
    unint64_t v14 = v0[17];
    uint64_t v13 = v0[18];
    if (v9)
    {
      uint64_t v67 = *v2;
      uint64_t v15 = sub_25F58E648();
      uint64_t v77 = sub_25F579370();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)type = v10;
      uint64_t v16 = (uint64_t *)(v13 + *(void *)(*(void *)v13 + 136));
      uint64_t v70 = v12;
      uint64_t v17 = *v16;
      unint64_t v18 = v16[1];
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_25F5718D4(v17, v18, &v77);
      sub_25F58E748(v19, v0 + 11);
      sub_25F597980();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_25F5718D4(v67, v14, &v77);
      sub_25F58E748(v20, v0 + 8);
      sub_25F597980();
      sub_25F58E84C();
      _os_log_impl(&dword_25F56F000, v7, v8, "Skipping download %s for factor %s since task has already kicked off for this", (uint8_t *)v15, 0x16u);
      sub_25F58E7A8();
      sub_25F5791D8();
      sub_25F5791D8();

LABEL_4:
      (*(void (**)(os_log_type_t *, uint64_t))(v11 + 8))(*(os_log_type_t **)type, v70);
      goto LABEL_12;
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  else
  {
    uint64_t v21 = v0[18];
    uint64_t v22 = *(void **)(v21 + *(void *)(*(void *)v21 + 144));
    unint64_t v23 = (void *)sub_25F5975C0();
    unint64_t v24 = (uint64_t *)(v21 + *(void *)(*(void *)v21 + 136));
    uint64_t v26 = *v24;
    unint64_t v25 = v24[1];
    int v27 = (void *)sub_25F5975C0();
    id v28 = objc_msgSend(v22, sel_levelForFactor_withNamespaceName_, v23, v27);

    if (v28)
    {
      unsigned int v29 = objc_msgSend(v28, sel_levelOneOfCase);
      uint64_t v30 = &selRef_fileValue;
      if (v29 != 100) {
        uint64_t v30 = &selRef_directoryValue;
      }
      id v31 = [v28 *v30];
      if (v31)
      {
        uint64_t v32 = v31;
        if ([v32 isOnDemand])
        {
          uint64_t v33 = v0[26];
          uint64_t v34 = v0[18];
          os_log_t logb = v32;
          uint64_t v36 = v0[16];
          uint64_t v35 = v0[17];
          uint64_t v37 = sub_25F5977B0();
          sub_25F5721D0(v33, 1, 1, v37);
          type metadata accessor for TUSTrialNamespaceManager();
          uint64_t WitnessTable = swift_getWitnessTable();
          uint64_t v39 = (void *)swift_allocObject();
          v39[2] = v34;
          v39[3] = WitnessTable;
          v39[4] = v34;
          v39[5] = v36;
          v39[6] = v35;
          swift_bridgeObjectRetain_n();
          swift_retain_n();
          uint64_t v40 = sub_25F587798(v33, (uint64_t)&unk_26A7AABA0, (uint64_t)v39);
          sub_25F57B2F0();
          sub_25F58DCE8(v40, v36, v35);
          swift_endAccess();

          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
        sub_25F5974B0();
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        uint64_t v58 = sub_25F5974A0();
        os_log_type_t v69 = sub_25F597830();
        BOOL v59 = os_log_type_enabled(v58, v69);
        uint64_t v11 = v0[21];
        uint64_t v70 = v0[20];
        *(void *)type = v0[25];
        unint64_t v60 = v0[17];
        if (!v59)
        {

          swift_bridgeObjectRelease_n();
          sub_25F58E834();

          goto LABEL_4;
        }
        uint64_t v66 = *v2;
        uint64_t v61 = sub_25F58E648();
        uint64_t v77 = sub_25F579370();
        *(_DWORD *)uint64_t v61 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_25F5718D4(v26, v25, &v77);
        sub_25F58E748(v62, v0 + 13);
        sub_25F597980();
        sub_25F58E834();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2080;
        swift_bridgeObjectRetain();
        v0[14] = sub_25F5718D4(v66, v60, &v77);
        sub_25F597980();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25F56F000, v58, v69, "Namespace %s factor %s is not on demand so we can't explicitly download it", (uint8_t *)v61, 0x16u);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      else
      {
        sub_25F5974B0();
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        loga = sub_25F5974A0();
        os_log_type_t typea = sub_25F597830();
        BOOL v52 = os_log_type_enabled(loga, typea);
        uint64_t v53 = v0[24];
        uint64_t v54 = v0[21];
        unint64_t v55 = v0[17];
        if (!v52)
        {
          uint64_t v64 = v0[20];

          swift_bridgeObjectRelease_n();
          sub_25F58E834();

          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v64);
          goto LABEL_12;
        }
        uint64_t v65 = *v2;
        uint64_t v56 = swift_slowAlloc();
        uint64_t v77 = sub_25F579370();
        *(_DWORD *)uint64_t v56 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v57 = sub_25F5718D4(v26, v25, &v77);
        sub_25F58E748(v57, v0 + 15);
        sub_25F597980();
        sub_25F58E834();
        swift_bridgeObjectRelease();
        *(_WORD *)(v56 + 12) = 2080;
        swift_bridgeObjectRetain();
        v0[12] = sub_25F5718D4(v65, v55, &v77);
        sub_25F597980();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25F56F000, loga, typea, "Namespace %s factor %s could not get file / directory from level", (uint8_t *)v56, 0x16u);
        swift_arrayDestroy();
        sub_25F5791D8();
        sub_25F5791D8();
      }
      sub_25F579404();
      v63();
      goto LABEL_12;
    }
    os_log_t log = (os_log_t)v26;
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v43 = sub_25F5974A0();
    os_log_type_t v44 = sub_25F597830();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = v0[23];
    uint64_t v48 = v0[20];
    uint64_t v47 = v0[21];
    unint64_t v49 = v0[17];
    if (v45)
    {
      *(void *)typeb = v0[20];
      uint64_t v68 = *v2;
      uint64_t v50 = sub_25F58E648();
      uint64_t v77 = sub_25F579370();
      *(_DWORD *)uint64_t v50 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_25F5718D4((uint64_t)log, v25, &v77);
      sub_25F58E748(v51, v0 + 9);
      sub_25F597980();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[10] = sub_25F5718D4(v68, v49, &v77);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v43, v44, "Namespace %s factor %s does not have level", (uint8_t *)v50, 0x16u);
      sub_25F58E7A8();
      sub_25F5791D8();
      sub_25F5791D8();

      (*(void (**)(uint64_t, os_log_type_t *))(v47 + 8))(v46, *(os_log_type_t **)typeb);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
    }
  }
LABEL_12:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v41();
}

uint64_t sub_25F58BA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[28] = a5;
  v6[29] = a6;
  v6[27] = a4;
  uint64_t v8 = sub_25F5974C0();
  v6[30] = v8;
  v6[31] = *(void *)(v8 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F58BAF4, a4, 0);
}

uint64_t sub_25F58BAF4()
{
  int v27 = v0;
  uint64_t v1 = v0[27];
  if (*(unsigned char *)(v1 + *(void *)(*(void *)v1 + 152)))
  {
    sub_25F5974B0();
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_25F5974A0();
    os_log_type_t v3 = sub_25F597810();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = v0[33];
    uint64_t v6 = v0[30];
    uint64_t v7 = v0[31];
    unint64_t v8 = v0[29];
    if (v4)
    {
      uint64_t v9 = v0[28];
      uint64_t v24 = v0[33];
      uint64_t v10 = (uint8_t *)sub_25F579258();
      uint64_t v26 = sub_25F579220();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      v0[23] = sub_25F5718D4(v9, v8, &v26);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v2, v3, "Skipping factor %s download since manager is in spectator mode", v10, 0xCu);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_25F57B2CC();
    return v22();
  }
  else
  {
    uint64_t v11 = v0[28];
    uint64_t v12 = v0[29];
    id v25 = *(id *)(v1 + *(void *)(*(void *)v1 + 144));
    sub_25F572540(&qword_26B399CF0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_25F5995B0;
    *(void *)(v13 + 32) = v11;
    *(void *)(v13 + 40) = v12;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25F597740();
    v0[35] = v14;
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)(v1 + *(void *)(*(void *)v1 + 136));
    v0[36] = *v15;
    v0[37] = v15[1];
    uint64_t v16 = sub_25F5975C0();
    v0[38] = v16;
    uint64_t v17 = *(void *)(v1 + *(void *)(*(void *)v1 + 168));
    uint64_t v18 = *(void *)(v1 + *(void *)(*(void *)v1 + 160));
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v1;
    v19[3] = v11;
    v19[4] = v12;
    v0[14] = sub_25F58DFF8;
    v0[15] = v19;
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 1107296256;
    v0[12] = sub_25F58C924;
    v0[13] = &unk_270BA6AD8;
    uint64_t v20 = _Block_copy(v0 + 10);
    v0[39] = v20;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    v0[2] = v0;
    v0[7] = (char *)v0 + 332;
    v0[3] = sub_25F58BF78;
    uint64_t v21 = swift_continuation_init();
    v0[16] = MEMORY[0x263EF8330];
    v0[17] = 0x40000000;
    v0[18] = sub_25F58C978;
    v0[19] = &unk_26553CE90;
    v0[20] = v21;
    objc_msgSend(v25, sel_downloadLevelsForFactors_withNamespace_queue_options_progress_completion_, v14, v16, v17, v18, v20);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
}

uint64_t sub_25F58BF78()
{
  sub_25F57B2C0();
  sub_25F57B29C();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 320) = v1;
  uint64_t v3 = *(void *)(v0 + 216);
  if (v1) {
    BOOL v4 = sub_25F58C318;
  }
  else {
    BOOL v4 = sub_25F58C070;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25F58C070()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void **)(v0 + 280);
  int v3 = *(unsigned __int8 *)(v0 + 332);
  _Block_release(*(const void **)(v0 + 312));

  sub_25F5974B0();
  swift_bridgeObjectRetain_n();
  swift_retain();
  BOOL v4 = sub_25F5974A0();
  os_log_type_t v5 = sub_25F597810();
  if (os_log_type_enabled(v4, v5))
  {
    int v17 = v3;
    uint64_t v7 = *(void *)(v0 + 288);
    unint64_t v6 = *(void *)(v0 + 296);
    unint64_t v8 = *(void *)(v0 + 232);
    uint64_t v16 = *(void *)(v0 + 224);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = sub_25F579370();
    *(_DWORD *)uint64_t v9 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_25F5718D4(v7, v6, &v18);
    sub_25F597980();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 208) = sub_25F5718D4(v16, v8, &v18);
    sub_25F597980();
    sub_25F58E84C();
    *(_WORD *)(v9 + 22) = 1024;
    *(_DWORD *)(v0 + 328) = v17;
    sub_25F597980();
    _os_log_impl(&dword_25F56F000, v4, v5, "Namespace %s factor %s download success %{BOOL}d", (uint8_t *)v9, 0x1Cu);
    swift_arrayDestroy();
    sub_25F5791D8();
    sub_25F5791D8();

    sub_25F579404();
    v10();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 272);
    uint64_t v12 = *(void *)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 248);
    swift_release();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  sub_25F58AB50();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v14();
}

uint64_t sub_25F58C318()
{
  uint64_t v26 = v0;
  uint64_t v1 = (const void *)v0[39];
  uint64_t v2 = (void *)v0[40];
  int v3 = (void *)v0[38];
  BOOL v4 = (void *)v0[35];
  swift_willThrow();
  _Block_release(v1);

  sub_25F5974B0();
  swift_bridgeObjectRetain();
  swift_retain();
  id v5 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  id v6 = v2;
  uint64_t v7 = sub_25F5974A0();
  os_log_type_t v8 = sub_25F597830();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v0[40];
    uint64_t v10 = v0[36];
    unint64_t v11 = v0[37];
    unint64_t v12 = v0[29];
    uint64_t v24 = v0[28];
    uint64_t v13 = sub_25F579220();
    uint64_t v14 = (void *)swift_slowAlloc();
    v25[0] = sub_25F579370();
    *(_DWORD *)uint64_t v13 = 136315650;
    swift_bridgeObjectRetain();
    v0[22] = sub_25F5718D4(v10, v11, v25);
    sub_25F597980();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[21] = sub_25F5718D4(v24, v12, v25);
    sub_25F597980();
    sub_25F58E84C();
    *(_WORD *)(v13 + 22) = 2112;
    id v15 = v9;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v16;
    sub_25F597980();
    *uint64_t v14 = v16;

    _os_log_impl(&dword_25F56F000, v7, v8, "Namespace %s factor %s download error: %@", (uint8_t *)v13, 0x20u);
    sub_25F572540(&qword_26B399CC8);
    swift_arrayDestroy();
    sub_25F5791D8();
    swift_arrayDestroy();
    sub_25F5791D8();
    sub_25F5791D8();

    sub_25F579404();
    v17();
  }
  else
  {
    uint64_t v18 = (void *)v0[40];
    uint64_t v20 = v0[31];
    uint64_t v19 = v0[32];
    uint64_t v21 = v0[30];

    swift_release_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_25F57B2CC();
  return v22();
}

uint64_t sub_25F58C65C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_25F5974C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F5974B0();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v12 = sub_25F5974A0();
  os_log_type_t v13 = sub_25F597810();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v21 = a1;
    id v15 = (uint64_t *)(a2 + *(void *)(*(void *)a2 + 136));
    uint64_t v20 = a3;
    uint64_t v23 = v8;
    uint64_t v17 = *v15;
    unint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25F5718D4(v17, v16, &v25);
    sub_25F597980();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25F5718D4(v20, a4, &v25);
    sub_25F597980();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2048;
    uint64_t v24 = v21;
    sub_25F597980();
    _os_log_impl(&dword_25F56F000, v12, v13, "Download %s for factor %s download %ld%%", (uint8_t *)v14, 0x20u);
    uint64_t v18 = v22;
    swift_arrayDestroy();
    MEMORY[0x2611F77E0](v18, -1, -1);
    MEMORY[0x2611F77E0](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_25F58C924(uint64_t a1, uint64_t a2)
{
  int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_25F58C978(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_25F58C9D8(v3, (uint64_t)v4);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return sub_25F58CA3C(v6, a2);
  }
}

uint64_t sub_25F58C9D8(uint64_t a1, uint64_t a2)
{
  sub_25F572540(&qword_26A7AAA18);
  uint64_t v4 = swift_allocError();
  *id v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25F58CA3C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_25F58CA5C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25F58E4DC;
  return sub_25F58AEFC();
}

uint64_t sub_25F58CB00(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25F58E4F4;
  return v6(a1);
}

uint64_t sub_25F58CBDC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25F58CCB8;
  return v6(a1);
}

uint64_t sub_25F58CCB8()
{
  sub_25F57B2C0();
  sub_25F57B29C();
  uint64_t v1 = *v0;
  sub_25F58E754();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25F57B2CC();
  return v3();
}

unint64_t sub_25F58CD7C()
{
  unint64_t result = qword_26A7AAB58;
  if (!qword_26A7AAB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A7AAB58);
  }
  return result;
}

uint64_t sub_25F58CDC8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F58CE04(uint64_t a1)
{
  return sub_25F58CF5C(a1, &unk_270BA6B60, &unk_26A7AABE8);
}

uint64_t sub_25F58CE24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25F58CE34()
{
  return swift_release();
}

uint64_t sub_25F58CE3C()
{
  return sub_25F58E564(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_25F58CE68()
{
  sub_25F58E73C();
  sub_25F58E708();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25F58E540(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25F58E4DC;
  uint64_t v3 = sub_25F58E680();
  return sub_25F58A018(v3, v4, v5, v6);
}

uint64_t sub_25F58CEFC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_25F58CF3C(uint64_t a1)
{
  return sub_25F58CF5C(a1, &unk_270BA6B10, &unk_26A7AABC8);
}

#error "25F58CF88: call analysis failed (funcsize=15)"

uint64_t sub_25F58CF98()
{
  return sub_25F58E564(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_25F58CFC4()
{
  sub_25F58E73C();
  sub_25F58E708();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25F58E540(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25F58D054;
  uint64_t v3 = sub_25F58E680();
  return sub_25F58AAD8(v3, v4, v5, v6);
}

uint64_t sub_25F58D054()
{
  sub_25F57B2C0();
  sub_25F57B29C();
  uint64_t v1 = *v0;
  sub_25F58E754();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25F57B2CC();
  return v3();
}

uint64_t sub_25F58D114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25F58D11C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25F58D1B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v11 = (void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v12 = *v11;
    void *v10 = *v11;
    os_log_type_t v13 = *(void **)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = v13;
    id v14 = v12;
    id v15 = v13;
  }
  return v4;
}

void sub_25F58D2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = (id *)((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8);

  uint64_t v5 = *(void **)(((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_25F58D34C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = *v8;
  void *v7 = *v8;
  uint64_t v10 = *(void **)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = v10;
  id v11 = v9;
  id v12 = v10;
  return a1;
}

uint64_t sub_25F58D3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = (void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = *v8;
  uint64_t v10 = *(void **)v7;
  *(void *)unint64_t v7 = *v8;
  v7 += 15;
  id v11 = v9;

  id v12 = *(void **)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  os_log_type_t v13 = *(void **)(v7 & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v7 & 0xFFFFFFFFFFFFFFF8) = v12;
  id v14 = v12;

  return a1;
}

uint64_t sub_25F58D484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_25F58D510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = *(void **)v7;
  *(void *)unint64_t v7 = *v8;
  v7 += 15;

  uint64_t v10 = *(void **)(v7 & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v7 & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_25F58D5AC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25F58D6F8);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return sub_25F577D8C((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  if ((v17 + 1) >= 2) {
    return v17;
  }
  else {
    return 0;
  }
}

void sub_25F58D70C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
  }
  if (a2 > v8)
  {
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x25F58D8F8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFE)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *unint64_t v17 = 0;
            *(_DWORD *)unint64_t v17 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *unint64_t v17 = a2;
          }
        }
        else
        {
          sub_25F5721D0((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_25F58D920()
{
  type metadata accessor for TUSTrialAssets();
  uint64_t result = sub_25F597970();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25F597350();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for TUSTrialNamespaceManager()
{
  return sub_25F57B258();
}

uint64_t getEnumTagSinglePayload for TUSTrialNameSpaceError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TUSTrialNameSpaceError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25F58DB5CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TUSTrialNameSpaceError()
{
  return &type metadata for TUSTrialNameSpaceError;
}

unint64_t sub_25F58DB98()
{
  unint64_t result = qword_26A7AAB88;
  if (!qword_26A7AAB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A7AAB88);
  }
  return result;
}

uint64_t sub_25F58DBE4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25F58DC2C()
{
  sub_25F58E878();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)sub_25F58E540(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_25F58E4DC;
  return sub_25F58BA10(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_25F58DCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_25F58DD78(a1, a2, a3);
  uint64_t *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F58DD78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_25F5928E8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_25F572540(&qword_26A7AABA8);
  if ((sub_25F597AF0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25F5928E8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_25F597D30();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  int v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_25F58DEA0(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25F58DEA0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
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

uint64_t sub_25F58DEE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F58DF20()
{
  sub_25F58E73C();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_25F58E540(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25F58E4DC;
  BOOL v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A7AABB0 + dword_26A7AABB0);
  return v7(v2, v3);
}

uint64_t sub_25F58DFCC()
{
  return sub_25F58E564(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_25F58DFF8(uint64_t a1)
{
  return sub_25F58C65C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25F58E004()
{
  return sub_25F58E660(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_25F58E030()
{
  sub_25F58E878();
  sub_25F58E7E0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25F58E540(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25F58E4DC;
  uint64_t v3 = sub_25F58E62C();
  return sub_25F58A8CC(v3, v4, v5, v6, v7);
}

uint64_t sub_25F58E0C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25F58E100()
{
  sub_25F58E878();
  sub_25F58E708();
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_25F58E540(v2);
  void *v3 = v4;
  v3[1] = sub_25F58D054;
  uint64_t v5 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A7AABD0 + dword_26A7AABD0);
  return v5(v0, v1);
}

uint64_t sub_25F58E1B4()
{
  return sub_25F58E660(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_25F58E1E0(void (*a1)(void), void (*a2)(void), uint64_t a3)
{
  a1(*(void *)(v3 + 16));
  a2(*(void *)(v3 + 32));
  return MEMORY[0x270FA0238](v3, a3, 7);
}

uint64_t sub_25F58E244()
{
  sub_25F58E878();
  sub_25F58E7E0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25F58E540(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25F58E4DC;
  uint64_t v3 = sub_25F58E62C();
  return sub_25F589E04(v3, v4, v5, v6, v7);
}

unint64_t sub_25F58E2DC()
{
  unint64_t result = qword_26B399EC0;
  if (!qword_26B399EC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B399EC0);
  }
  return result;
}

unint64_t sub_25F58E31C()
{
  unint64_t result = qword_26B399EB8;
  if (!qword_26B399EB8)
  {
    sub_25F597930();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399EB8);
  }
  return result;
}

unint64_t sub_25F58E36C()
{
  unint64_t result = qword_26B399EA8;
  if (!qword_26B399EA8)
  {
    sub_25F577CDC(&qword_26B399EA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399EA8);
  }
  return result;
}

uint64_t sub_25F58E3C0(uint64_t a1, uint64_t *a2)
{
  sub_25F572540(a2);
  sub_25F58E5CC();
  sub_25F579404();
  v3();
  return a1;
}

uint64_t sub_25F58E40C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25F58E424(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_25F58E474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_25F58E530()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_25F58E540(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_25F58E564(void (*a1)(void), void (*a2)(void))
{
  return sub_25F58E1E0(a1, a2, 40);
}

uint64_t sub_25F58E584()
{
  return sub_25F5976D0();
}

uint64_t sub_25F58E5B4()
{
  return swift_release_n();
}

uint64_t sub_25F58E5E0()
{
  return v0;
}

uint64_t sub_25F58E5F0(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return v1 - 232;
}

uint64_t sub_25F58E604()
{
  return swift_allocObject();
}

uint64_t sub_25F58E62C()
{
  return v0;
}

uint64_t sub_25F58E648()
{
  return swift_slowAlloc();
}

uint64_t sub_25F58E660(void (*a1)(void), void (*a2)(void))
{
  return sub_25F58E1E0(a1, a2, 41);
}

uint64_t sub_25F58E680()
{
  return v0;
}

uint64_t sub_25F58E6B0()
{
  return *(void *)(v0 - 320);
}

uint64_t sub_25F58E6F0()
{
  return v0;
}

void *sub_25F58E748@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return a2;
}

uint64_t sub_25F58E764()
{
  return swift_beginAccess();
}

uint64_t sub_25F58E77C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 - 432);
  return sub_25F5721D0(a1, 0, 1, v3);
}

uint64_t sub_25F58E79C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25F58E7A8()
{
  return swift_arrayDestroy();
}

uint64_t sub_25F58E7D4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  *(void *)(v2 - 192) = result;
  return result;
}

uint64_t sub_25F58E7F4(void *a1)
{
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = v1;
  return swift_retain();
}

uint64_t sub_25F58E834()
{
  return swift_release_n();
}

uint64_t sub_25F58E84C()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_25F58E864()
{
  return v0;
}

uint64_t sub_25F58E884()
{
  uint64_t v3 = *(void *)(v1 - 280);
  return sub_25F5718D4(v3, v0, (uint64_t *)(v1 - 192));
}

void __swiftcall TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, TokenizerOutputObjc tokenizerOutputObjc, Swift::Float padId, Swift::String processedInput)
{
  tokenRanges = tokenizerOutputObjc._tokenRanges;
  tokenIds = tokenizerOutputObjc._tokenIds;
  Class isa = tokenizerOutputObjc.super.isa;
  uint64_t v9 = sub_25F5974C0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v67 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [(objc_class *)isa tokenIds];
  uint64_t v13 = sub_25F597300();
  unint64_t v15 = v14;

  uint64_t v16 = isa;
  unint64_t v17 = v16;
  uint64_t v68 = (uint64_t)tokenIds;
  os_log_type_t v69 = tokenRanges;
  uint64_t v66 = v10;
  switch(v15 >> 62)
  {
    case 1uLL:
      if (v13 >> 32 < (int)v13)
      {
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
        JUMPOUT(0x25F58F0D4);
      }
      uint64_t v21 = v16;
      sub_25F58F7A8(v13, v15);
      uint64_t v25 = (float *)sub_25F58F698((int)v13, v13 >> 32, v15 & 0x3FFFFFFFFFFFFFFFLL, v21, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F164);
      sub_25F58FE40();
      break;
    case 2uLL:
      uint64_t v22 = *(void *)(v13 + 16);
      uint64_t v23 = *(void *)(v13 + 24);
      uint64_t v24 = v16;
      swift_retain();
      swift_retain();
      uint64_t v25 = (float *)sub_25F58F698(v22, v23, v15 & 0x3FFFFFFFFFFFFFFFLL, v24, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F164);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      uint64_t v18 = v16;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      goto LABEL_7;
    default:
      uint64_t v18 = v16;
      uint64_t v19 = v13;
      uint64_t v20 = v15 & 0xFFFFFFFFFFFFFFLL;
LABEL_7:
      uint64_t v25 = (float *)sub_25F58F674(v19, v20, v18);
      break;
  }
  sub_25F58FE40();

  int64_t v26 = *((void *)v25 + 2);
  uint64_t v27 = (float *)MEMORY[0x263F8EE78];
  if (v26)
  {
    uint64_t v70 = (float *)MEMORY[0x263F8EE78];
    sub_25F58F320(0, v26, 0);
    uint64_t v27 = v70;
    uint64_t v28 = v25 + 8;
    unint64_t v29 = *((void *)v70 + 2);
    do
    {
      if (*v28 == padId) {
        float v30 = 0.0;
      }
      else {
        float v30 = 1.0;
      }
      uint64_t v70 = v27;
      unint64_t v31 = *((void *)v27 + 3);
      if (v29 >= v31 >> 1)
      {
        sub_25F58F320((char *)(v31 > 1), v29 + 1, 1);
        uint64_t v27 = v70;
      }
      *((void *)v27 + 2) = v29 + 1;
      v27[v29 + 8] = v30;
      ++v28;
      ++v29;
      --v26;
    }
    while (v26);
  }
  id v32 = [(objc_class *)v17 tokenRanges];
  uint64_t v33 = sub_25F597300();
  unint64_t v35 = v34;

  uint64_t v36 = v17;
  uint64_t v37 = v36;
  uint64_t v65 = v9;
  switch(v35 >> 62)
  {
    case 1uLL:
      if (v33 >> 32 < (int)v33) {
        goto LABEL_32;
      }
      uint64_t v63 = v35 & 0x3FFFFFFFFFFFFFFFLL;
      unint64_t v64 = (int)v33;
      uint64_t v41 = v36;
      sub_25F58F7A8(v33, v35);
      os_log_type_t v44 = (void *)sub_25F58F698(v64, v33 >> 32, v63, v41, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F1F8);
      sub_25F58FE28();
      break;
    case 2uLL:
      uint64_t v42 = *(void *)(v33 + 16);
      uint64_t v63 = *(void *)(v33 + 24);
      unint64_t v64 = v42;
      uint64_t v43 = v36;
      swift_retain();
      swift_retain();
      os_log_type_t v44 = (void *)sub_25F58F698(v64, v63, v35 & 0x3FFFFFFFFFFFFFFFLL, v43, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F1F8);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      uint64_t v38 = v36;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      goto LABEL_22;
    default:
      uint64_t v38 = v36;
      uint64_t v39 = v33;
      uint64_t v40 = v35 & 0xFFFFFFFFFFFFFFLL;
LABEL_22:
      os_log_type_t v44 = (void *)sub_25F58F650(v39, v40, v38);
      break;
  }
  sub_25F58FE28();

  id v45 = [(objc_class *)v37 wordIndexes];
  uint64_t v46 = sub_25F597300();
  unint64_t v48 = v47;

  unint64_t v49 = v37;
  uint64_t v50 = v49;
  switch(v48 >> 62)
  {
    case 1uLL:
      unint64_t v64 = v46 >> 32;
      if (v46 >> 32 < (int)v46) {
        goto LABEL_33;
      }
      unint64_t v62 = v48 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v63 = (int)v46;
      unint64_t v55 = v49;
      sub_25F58F7A8(v46, v48);
      uint64_t v56 = v63;
      uint64_t v63 = (uint64_t)v55;
      uint64_t v61 = (void *)sub_25F58F698(v56, v64, v62, v55, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F28C);
      unint64_t v64 = v48;
      sub_25F58F750(v46, v48);

      break;
    case 2uLL:
      int64_t v57 = v48 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v63 = *(void *)(v46 + 16);
      unint64_t v64 = v48;
      unint64_t v62 = *(void *)(v46 + 24);
      uint64_t v58 = v49;
      swift_retain();
      swift_retain();
      uint64_t v59 = v63;
      uint64_t v63 = v57;
      uint64_t v61 = (void *)sub_25F58F698(v59, v62, v57, v58, (uint64_t (*)(uint64_t, uint64_t, void *))sub_25F58F28C);

      swift_release();
      swift_release();
      break;
    case 3uLL:
      unint64_t v64 = v48;
      BOOL v52 = v49;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      goto LABEL_29;
    default:
      unint64_t v64 = v48;
      uint64_t v51 = v48 & 0xFFFFFFFFFFFFFFLL;
      BOOL v52 = v49;
      uint64_t v53 = v46;
      uint64_t v54 = v51;
LABEL_29:
      uint64_t v61 = (void *)sub_25F58F62C(v53, v54, v52);

      break;
  }
  sub_25F58F750(v46, v64);

  retstr->tokenIds._rawValue = v25;
  retstr->attentionMask._rawValue = v27;
  retstr->tokenizerWordRangesUTF8._rawValue = v44;
  retstr->wordIds._rawValue = v61;
  unint64_t v60 = v69;
  retstr->processedInput._uint64_t countAndFlagsBits = v68;
  retstr->processedInput._object = v60;
}

uint64_t TokenizerOutput.tokenIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.attentionMask.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.tokenizerWordRangesUTF8.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.wordIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.processedInput.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall TokenizerOutput.init(tokenIds:attentionMask:tokenizerWordRangesUTF8:wordIds:processedInput:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, Swift::OpaquePointer tokenIds, Swift::OpaquePointer attentionMask, Swift::OpaquePointer tokenizerWordRangesUTF8, Swift::OpaquePointer wordIds, Swift::String processedInput)
{
  retstr->tokenIds = tokenIds;
  retstr->attentionMask = attentionMask;
  retstr->tokenizerWordRangesUTF8 = tokenizerWordRangesUTF8;
  retstr->wordIds = wordIds;
  retstr->processedInput = processedInput;
}

const void *sub_25F58F164(uint64_t a1, int a2, id a3)
{
  id v4 = objc_msgSend(a3, sel_tokenIds);
  uint64_t v5 = sub_25F597300();
  unint64_t v7 = v6;

  uint64_t v8 = sub_25F597310();
  uint64_t v9 = sub_25F578A88(a1, v8 / 4);
  sub_25F58F750(v5, v7);
  return v9;
}

const void *sub_25F58F1F8(uint64_t a1, int a2, id a3)
{
  id v4 = objc_msgSend(a3, sel_tokenRanges);
  uint64_t v5 = sub_25F597300();
  unint64_t v7 = v6;

  uint64_t v8 = sub_25F597310();
  uint64_t v9 = sub_25F578B04(a1, v8 / 16);
  sub_25F58F750(v5, v7);
  return v9;
}

const void *sub_25F58F28C(uint64_t a1, int a2, id a3)
{
  id v4 = objc_msgSend(a3, sel_wordIndexes);
  uint64_t v5 = sub_25F597300();
  unint64_t v7 = v6;

  uint64_t v8 = sub_25F597310();
  uint64_t v9 = sub_25F578B80(a1, v8 / 8);
  sub_25F58F750(v5, v7);
  return v9;
}

char *sub_25F58F320(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F58F380(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_25F58F340(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F58F464(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

void *sub_25F58F360(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F58F548(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_25F58F380(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25F572540(&qword_26B399DC0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25F576EA0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25F5770E8(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_25F58F464(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25F572540(&qword_26B399CF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25F576EFC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25F57719C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void *sub_25F58F548(void *result, int64_t a2, char a3, uint64_t a4)
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
    sub_25F572540(&qword_26A7AABF8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    id v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    sub_25F576FEC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25F577254(v13, v8, v12);
  }
  swift_release();
  return v10;
}

const void *sub_25F58F62C(uint64_t a1, uint64_t a2, id a3)
{
  return sub_25F58FA8C(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), a3);
}

const void *sub_25F58F650(uint64_t a1, uint64_t a2, id a3)
{
  return sub_25F58FBC0(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), a3);
}

const void *sub_25F58F674(uint64_t a1, uint64_t a2, id a3)
{
  return sub_25F58FCF4(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), a3);
}

uint64_t sub_25F58F698(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  uint64_t result = sub_25F597280();
  uint64_t v10 = result;
  if (result)
  {
    uint64_t result = sub_25F5972A0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v10 += a1 - result;
  }
  BOOL v11 = __OFSUB__(a2, a1);
  uint64_t v12 = a2 - a1;
  if (v11)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v13 = sub_25F597290();
  if (v13 >= v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v13;
  }
  uint64_t v15 = v10 + v14;
  if (v10) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = a5(v10, v16, a4);

  return v17;
}

uint64_t sub_25F58F750(uint64_t a1, unint64_t a2)
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

uint64_t sub_25F58F7A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t destroy for TokenizerOutput()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TokenizerOutput(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TokenizerOutput(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TokenizerOutput(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TokenizerOutput(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenizerOutput(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
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

uint64_t storeEnumTagSinglePayload for TokenizerOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenizerOutput()
{
  return &type metadata for TokenizerOutput;
}

const void *sub_25F58FA8C(uint64_t a1, uint64_t a2, int a3, id a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  __int16 v13 = a2;
  char v14 = BYTE2(a2);
  char v15 = BYTE3(a2);
  char v16 = BYTE4(a2);
  char v17 = BYTE5(a2);
  id v5 = objc_msgSend(a4, sel_wordIndexes);
  uint64_t v6 = sub_25F597300();
  unint64_t v8 = v7;

  uint64_t v9 = sub_25F597310();
  uint64_t v10 = sub_25F578B80((uint64_t)&v12, v9 / 8);
  sub_25F58F750(v6, v8);

  return v10;
}

const void *sub_25F58FBC0(uint64_t a1, uint64_t a2, int a3, id a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  __int16 v13 = a2;
  char v14 = BYTE2(a2);
  char v15 = BYTE3(a2);
  char v16 = BYTE4(a2);
  char v17 = BYTE5(a2);
  id v5 = objc_msgSend(a4, sel_tokenRanges);
  uint64_t v6 = sub_25F597300();
  unint64_t v8 = v7;

  uint64_t v9 = sub_25F597310();
  uint64_t v10 = sub_25F578B04((uint64_t)&v12, v9 / 16);
  sub_25F58F750(v6, v8);

  return v10;
}

const void *sub_25F58FCF4(uint64_t a1, uint64_t a2, int a3, id a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  __int16 v13 = a2;
  char v14 = BYTE2(a2);
  char v15 = BYTE3(a2);
  char v16 = BYTE4(a2);
  char v17 = BYTE5(a2);
  id v5 = objc_msgSend(a4, sel_tokenIds);
  uint64_t v6 = sub_25F597300();
  unint64_t v8 = v7;

  uint64_t v9 = sub_25F597310();
  uint64_t v10 = sub_25F578A88((uint64_t)&v12, v9 / 4);
  sub_25F58F750(v6, v8);

  return v10;
}

uint64_t sub_25F58FE28()
{
  return sub_25F58F750(v1, v0);
}

uint64_t sub_25F58FE40()
{
  return sub_25F58F750(v1, v0);
}

uint64_t Signposter.name.getter()
{
  return *(void *)v0;
}

uint64_t Signposter.state.getter()
{
  return swift_retain();
}

uint64_t Signposter.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Signposter() + 24);
  uint64_t v4 = sub_25F597440();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for Signposter()
{
  uint64_t result = qword_26B399EF8;
  if (!qword_26B399EF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Signposter.init(name:state:signposter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  uint64_t v7 = a6 + *(int *)(type metadata accessor for Signposter() + 24);
  uint64_t v8 = sub_25F597440();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  return v9(v7, a5, v8);
}

uint64_t static Signposter.begin(logger:name:)@<X0>(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v47 = a3;
  id v45 = a2;
  int v46 = a4;
  uint64_t v43 = sub_25F597410();
  sub_25F5791BC();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v41 - v13;
  uint64_t v15 = sub_25F5974C0();
  sub_25F5791BC();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_25F5794EC();
  uint64_t v21 = v20 - v19;
  uint64_t v44 = sub_25F597440();
  sub_25F5791BC();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  sub_25F5794EC();
  uint64_t v27 = v26 - v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, a1, v15);
  uint64_t v28 = v14;
  uint64_t v29 = v47;
  sub_25F597420();
  sub_25F597430();
  sub_25F5973F0();
  float v30 = sub_25F597430();
  os_signpost_type_t v31 = sub_25F597910();
  uint64_t result = sub_25F597960();
  if ((result & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v42 = v23;
  if ((v46 & 1) == 0)
  {
    uint64_t v33 = v45;
    if (v45)
    {
      unint64_t v34 = v28;
LABEL_9:
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v35 = 0;
      os_signpost_id_t v36 = sub_25F597400();
      _os_signpost_emit_with_name_impl(&dword_25F56F000, v30, v31, v36, v33, "", v35, 2u);
      uint64_t v37 = v35;
      uint64_t v28 = v34;
      MEMORY[0x2611F77E0](v37, -1, -1);
      uint64_t v29 = v47;
      uint64_t v23 = v42;
LABEL_10:

      uint64_t v38 = v43;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v28, v43);
      sub_25F597480();
      swift_allocObject();
      uint64_t v39 = sub_25F597470();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v38);
      *(void *)a5 = v45;
      *(void *)(a5 + 8) = v29;
      *(unsigned char *)(a5 + 16) = v46;
      *(void *)(a5 + 24) = v39;
      uint64_t v40 = type metadata accessor for Signposter();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(a5 + *(int *)(v40 + 24), v27, v44);
    }
    __break(1u);
    goto LABEL_12;
  }
  if ((unint64_t)v45 >> 32)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v45 >> 11 != 27)
  {
    if (v45 >> 16 <= 0x10)
    {
      unint64_t v34 = v28;
      uint64_t v33 = &v48;
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

Swift::Void __swiftcall Signposter.end()()
{
  sub_25F597450();
  sub_25F5791BC();
  uint64_t v28 = v2;
  uint64_t v29 = v1;
  MEMORY[0x270FA5388](v1);
  sub_25F5794EC();
  uint64_t v30 = v4 - v3;
  uint64_t v5 = sub_25F597410();
  sub_25F5791BC();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_25F5794EC();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_25F597440();
  sub_25F5791BC();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  sub_25F5794EC();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = type metadata accessor for Signposter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v18, v0 + *(int *)(v19 + 24), v12);
  os_signpost_type_t v31 = *(const char **)v0;
  char v20 = *(unsigned char *)(v0 + 16);
  uint64_t v21 = sub_25F597430();
  sub_25F597460();
  os_signpost_type_t v27 = sub_25F597900();
  if ((sub_25F597960() & 1) == 0)
  {
LABEL_13:

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
    return;
  }
  uint64_t v26 = v7;
  if ((v20 & 1) == 0)
  {
    uint64_t v22 = v30;
    if (v31)
    {
LABEL_9:
      swift_retain();
      sub_25F597490();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v28 + 88))(v22, v29) == *MEMORY[0x263F90238])
      {
        uint64_t v23 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v22, v29);
        uint64_t v23 = "";
      }
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      os_signpost_id_t v25 = sub_25F597400();
      _os_signpost_emit_with_name_impl(&dword_25F56F000, v21, v27, v25, v31, v23, v24, 2u);
      MEMORY[0x2611F77E0](v24, -1, -1);
      uint64_t v7 = v26;
      goto LABEL_13;
    }
    __break(1u);
  }
  uint64_t v22 = v30;
  if ((unint64_t)v31 >> 32)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v31 >> 11 != 27)
  {
    if (v31 >> 16 <= 0x10)
    {
      os_signpost_type_t v31 = &v32;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
}

uint64_t withSignpost<A>(logger:name:closure:)(uint64_t a1, const char *a2, uint64_t a3, unsigned __int8 a4, void (*a5)(uint64_t))
{
  uint64_t v10 = type metadata accessor for Signposter();
  MEMORY[0x270FA5388](v10 - 8);
  sub_25F5794EC();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = static Signposter.begin(logger:name:)(a1, a2, a3, a4, v12 - v11);
  a5(v14);
  Signposter.end()();
  return sub_25F5909E8(v13);
}

uint64_t withSignpostAsync<A>(logger:name:closure:)()
{
  sub_25F57B2C0();
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = v2;
  *(unsigned char *)(v0 + 88) = v3;
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v5;
  *(void *)(v0 + 16) = v6;
  *(void *)(v0 + 24) = v7;
  type metadata accessor for Signposter();
  *(void *)(v0 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25F590714, 0, 0);
}

uint64_t sub_25F590714()
{
  sub_25F57B2C0();
  uint64_t v1 = *(int **)(v0 + 48);
  static Signposter.begin(logger:name:)(*(void *)(v0 + 24), *(const char **)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 88), *(void *)(v0 + 64));
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25F5907F8;
  uint64_t v3 = *(void *)(v0 + 16);
  return v5(v3);
}

uint64_t sub_25F5907F8()
{
  sub_25F57B2C0();
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25F590978;
  }
  else {
    uint64_t v2 = sub_25F590908;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25F590908()
{
  sub_25F57B2C0();
  uint64_t v1 = *(void *)(v0 + 64);
  Signposter.end()();
  sub_25F5909E8(v1);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25F590978()
{
  sub_25F57B2C0();
  uint64_t v1 = *(void *)(v0 + 64);
  Signposter.end()();
  sub_25F5909E8(v1);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25F5909E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Signposter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for Signposter(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = a1 + v5;
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = sub_25F597440();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
    swift_retain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for Signposter(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25F597440();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25F597440();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t assignWithCopy for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25F597440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25F597440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25F597440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F590E44);
}

uint64_t sub_25F590E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25F597440();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return sub_25F577D8C(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Signposter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F590EE0);
}

uint64_t sub_25F590EE0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25F597440();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_25F5721D0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25F590F60()
{
  uint64_t result = sub_25F597440();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *NLGazetteer.supportGazetteer.unsafeMutableAddressor()
{
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  return &static NLGazetteer.supportGazetteer;
}

id sub_25F591050()
{
  id result = sub_25F591070();
  static NLGazetteer.supportGazetteer = (uint64_t)result;
  return result;
}

id sub_25F591070()
{
  uint64_t v0 = sub_25F5972C0();
  uint64_t v38 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25F572540(&qword_26B399A38);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F5972F0();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_25F5974C0();
  uint64_t v9 = *(void *)(v39 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v39);
  uint64_t v37 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  sub_25F591800();
  id v17 = sub_25F570EDC();
  if (!v17)
  {
    sub_25F5974B0();
    uint64_t v21 = sub_25F5974A0();
    os_log_type_t v22 = sub_25F597830();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v41 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v40 = sub_25F5718D4(0xD000000000000021, 0x800000025F599E10, &v41);
      sub_25F597980();
      _os_log_impl(&dword_25F56F000, v21, v22, "Unable to initialize bundle %s for supportGazetteer", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611F77E0](v24, -1, -1);
      MEMORY[0x2611F77E0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v39);
    return 0;
  }
  uint64_t v36 = v9;
  id v18 = v17;
  sub_25F59198C(0xD000000000000018, 0x800000025F59B7A0, 0x636C65646F6D6C6DLL, 0xE800000000000000, v18);
  if (!v19)
  {
    os_signpost_id_t v25 = v18;
    uint64_t v26 = v14;
    sub_25F5974B0();
    os_signpost_type_t v27 = sub_25F5974A0();
    os_log_type_t v28 = sub_25F597830();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = v39;
    if (v29)
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v41 = v32;
      *(_DWORD *)uint64_t v31 = 136315394;
      uint64_t v40 = sub_25F5718D4(0xD000000000000018, 0x800000025F59B7A0, &v41);
      sub_25F597980();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v40 = sub_25F5718D4(0x636C65646F6D6C6DLL, 0xE800000000000000, &v41);
      sub_25F597980();
      _os_log_impl(&dword_25F56F000, v27, v28, "Unable to get URL path for resource %s of type %s for supportGazetteer", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611F77E0](v32, -1, -1);
      MEMORY[0x2611F77E0](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v30);
    return 0;
  }
  sub_25F5721D0((uint64_t)v5, 1, 1, v6);
  (*(void (**)(char *, void, uint64_t))(v38 + 104))(v2, *MEMORY[0x263F06E50], v0);
  swift_bridgeObjectRetain();
  sub_25F5972E0();
  id v20 = objc_allocWithZone(MEMORY[0x263F14000]);
  id v33 = sub_25F591840((uint64_t)v8);
  swift_bridgeObjectRelease();

  return v33;
}

uint64_t static NLGazetteer.supportGazetteer.getter()
{
  if (qword_26B399CB8 != -1) {
    swift_once();
  }
  uint64_t v0 = static NLGazetteer.supportGazetteer;
  id v1 = (id)static NLGazetteer.supportGazetteer;
  return v0;
}

unint64_t sub_25F591800()
{
  unint64_t result = qword_26A7AA810;
  if (!qword_26A7AA810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7AA810);
  }
  return result;
}

id sub_25F591840(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_25F5972D0();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_25F5972F0();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_25F5972B0();

    swift_willThrow();
    uint64_t v11 = sub_25F5972F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_25F59198C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)sub_25F5975C0();
  uint64_t v7 = (void *)sub_25F5975C0();
  id v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  if (!v8) {
    return 0;
  }
  uint64_t v9 = sub_25F5975F0();

  return v9;
}

uint64_t CaptionPhraseResolver.init()()
{
  uint64_t v0 = sub_25F591DA8(0, 0, 0xD000000000000015, 0x800000025F59B7E0, "Could not find caption phrase deny list at bundle path %s");
  if (v0
    && !sub_25F591DA8(0, 0, 0xD000000000000017, 0x800000025F59B7C0, "Could not find caption token deny list at bundle path %s"))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v0;
}

Swift::Bool __swiftcall CaptionPhraseResolver.hasUninterestingCaption(with:languageCode:)(Swift::String_optional with, Swift::String_optional languageCode)
{
  uint64_t v3 = v2;
  object = languageCode.value._object;
  uint64_t countAndFlagsBits = languageCode.value._countAndFlagsBits;
  id v6 = with.value._object;
  uint64_t v7 = with.value._countAndFlagsBits;
  uint64_t v8 = sub_25F572540(qword_26B399DE8);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v3 || !v6) {
    goto LABEL_15;
  }
  if (object) {
    uint64_t v11 = countAndFlagsBits;
  }
  else {
    uint64_t v11 = 0;
  }
  if (object) {
    uint64_t v12 = (uint64_t)object;
  }
  else {
    uint64_t v12 = 0xE000000000000000;
  }
  if (!*(void *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    char v23 = 0;
    return v23 & 1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_25F5928E8(v11, v12);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v15 = *(void **)(*(void *)(v3 + 56) + 8 * v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = v7;
  uint64_t v26 = v6;
  sub_25F572184();
  uint64_t v16 = sub_25F5979C0();
  id v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v25 = v16;
  uint64_t v26 = v18;
  swift_bridgeObjectRetain();
  sub_25F597390();
  uint64_t v19 = sub_25F5973E0();
  sub_25F5721D0((uint64_t)v10, 0, 1, v19);
  uint64_t v20 = sub_25F597A10();
  uint64_t v22 = v21;
  sub_25F586494((uint64_t)v10);
  swift_bridgeObjectRelease();
  char v23 = sub_25F5870A0(v20, v22, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v23 & 1;
}

uint64_t sub_25F591CB4(uint64_t a1)
{
  uint64_t v2 = sub_25F597800();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25F577AF0(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_25F591D68(uint64_t a1, uint64_t a2)
{
  return sub_25F592EA8(a1, a2, 21, 0x800000025F59B7E0, "Could not find caption phrase deny list at bundle path %s");
}

uint64_t sub_25F591D88(uint64_t a1, uint64_t a2)
{
  return sub_25F592EA8(a1, a2, 23, 0x800000025F59B7C0, "Could not find caption token deny list at bundle path %s");
}

uint64_t sub_25F591DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = sub_25F5974C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v46 - v14;
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v46 - v16;
  sub_25F572148(0, (unint64_t *)&qword_26A7AA810);
  id v18 = sub_25F570EDC();
  if (!v18)
  {
    sub_25F5974B0();
    uint64_t v26 = sub_25F5974A0();
    os_log_type_t v27 = sub_25F597830();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v28 = 0;
      _os_log_impl(&dword_25F56F000, v26, v27, "Could not find TextUnderstandingShared bundle", v28, 2u);
      sub_25F5791D8();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return 0;
  }
  uint64_t v19 = v18;
  uint64_t v20 = sub_25F57208C(a3, a4, 0x7473696C70, 0xE500000000000000, v18);
  if (!v21)
  {
    sub_25F5974B0();
    id v35 = v19;
    uint64_t v36 = sub_25F5974A0();
    os_log_type_t v37 = sub_25F597830();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v50 = v47;
      uint64_t v49 = v9;
      *(_DWORD *)uint64_t v38 = 136315138;
      id v39 = objc_msgSend(v35, sel_bundlePath, v38 + 4, v47);
      uint64_t v48 = v8;
      id v40 = v39;
      uint64_t v41 = sub_25F5975F0();
      unint64_t v43 = v42;

      uint64_t v44 = sub_25F5718D4(v41, v43, &v50);
      sub_25F5796B4(v44);
      sub_25F597980();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F56F000, v36, v37, a5, v38, 0xCu);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      (*(void (**)(char *, uint64_t))(v49 + 8))(v15, v48);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    }
    return 0;
  }
  uint64_t v22 = v20;
  unint64_t v23 = v21;
  sub_25F572148(0, &qword_26A7AAC08);
  swift_bridgeObjectRetain();
  id v24 = sub_25F592874();
  if (!v24 || (v50 = 0, sub_25F572540(&qword_26B399CA0), sub_25F597520(), (uint64_t v25 = v50) == 0))
  {
    sub_25F5974B0();
    swift_bridgeObjectRetain();
    BOOL v29 = sub_25F5974A0();
    os_log_type_t v30 = sub_25F597830();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v49 = v9;
      uint64_t v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v48 = v8;
      uint64_t v50 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v47 = (uint64_t)(v32 + 4);
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25F5718D4(v22, v23, &v50);
      sub_25F5796B4(v34);
      sub_25F597980();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F56F000, v29, v30, "Failed to load contents at %s", v32, 0xCu);
      swift_arrayDestroy();
      sub_25F5791D8();
      sub_25F5791D8();

      (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v48);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
    }
    return 0;
  }

  swift_bridgeObjectRelease();
  return v25;
}

Swift::Bool __swiftcall CaptionPhraseResolver.hasDisallowedCaption(with:languageCode:)(Swift::String_optional with, Swift::String_optional languageCode)
{
  uint64_t v3 = v2;
  object = languageCode.value._object;
  uint64_t countAndFlagsBits = languageCode.value._countAndFlagsBits;
  uint64_t v6 = with.value._object;
  uint64_t v7 = with.value._countAndFlagsBits;
  uint64_t v8 = sub_25F572540(qword_26B399DE8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v3 || !v6) {
    goto LABEL_15;
  }
  if (object) {
    uint64_t v11 = countAndFlagsBits;
  }
  else {
    uint64_t v11 = 0;
  }
  if (object) {
    uint64_t v12 = (uint64_t)object;
  }
  else {
    uint64_t v12 = 0xE000000000000000;
  }
  if (!*(void *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    char v28 = 0;
    return v28 & 1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_25F5928E8(v11, v12);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v15 = *(void *)(*(void *)(v3 + 56) + 8 * v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  sub_25F572184();
  uint64_t v16 = sub_25F5979C0();
  id v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v30 = v16;
  uint64_t v31 = v18;
  swift_bridgeObjectRetain();
  sub_25F597390();
  uint64_t v19 = sub_25F5973E0();
  sub_25F5721D0((uint64_t)v10, 0, 1, v19);
  uint64_t v20 = sub_25F597A10();
  uint64_t v22 = v21;
  sub_25F586494((uint64_t)v10);
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_25F591CB4(v15);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = MEMORY[0x263F8EE78];
  uint64_t v25 = (uint64_t *)(v24 + 16);
  uint64_t v30 = v20;
  uint64_t v31 = v22;
  uint64_t v32 = 15;
  swift_retain();
  sub_25F572540(&qword_26B399CE0);
  sub_25F592998();
  sub_25F5979E0();
  swift_release();
  swift_beginAccess();
  uint64_t v26 = *v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v27 = sub_25F591CB4(v26);
  LOBYTE(v20) = sub_25F592594(v23, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v28 = v20 ^ 1;
  return v28 & 1;
}

uint64_t sub_25F592594(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v32 = v4;
  uint64_t v33 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v31 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    int64_t v12 = v11;
    if (!v8) {
      break;
    }
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v14 = v13 | (v11 << 6);
LABEL_29:
    if (*(void *)(v5 + 16))
    {
      id v18 = (uint64_t *)(*(void *)(v32 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_25F597D90();
      swift_bridgeObjectRetain();
      sub_25F597670();
      uint64_t v21 = sub_25F597DB0();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = *(void *)(v5 + 48);
        uint64_t v25 = (void *)(v24 + 16 * v23);
        BOOL v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_25F597C50() & 1) != 0)
        {
LABEL_46:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
LABEL_47:
          sub_25F579080();
          return v30;
        }
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          char v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_25F597C50() & 1) != 0) {
            goto LABEL_46;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v15 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_51;
  }
  if (v15 >= v31) {
    goto LABEL_49;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v15);
  ++v11;
  if (v16) {
    goto LABEL_28;
  }
  int64_t v11 = v12 + 2;
  if (v12 + 2 >= v31) {
    goto LABEL_49;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v11);
  if (v16) {
    goto LABEL_28;
  }
  int64_t v11 = v12 + 3;
  if (v12 + 3 >= v31) {
    goto LABEL_49;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v11);
  if (v16)
  {
LABEL_28:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    goto LABEL_29;
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_49:
    swift_bridgeObjectRelease();
    uint64_t v30 = 1;
    goto LABEL_47;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v12 + 4;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_49;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_28;
    }
  }
LABEL_51:
  __break(1u);
  return result;
}

id sub_25F592874()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithContentsOfFile_, v1);

  return v2;
}

unint64_t sub_25F5928E8(uint64_t a1, uint64_t a2)
{
  sub_25F597D90();
  sub_25F597670();
  uint64_t v4 = sub_25F597DB0();
  return sub_25F592C4C(a1, a2, v4);
}

uint64_t sub_25F592960()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_25F592998()
{
  unint64_t result = qword_26B399CD8;
  if (!qword_26B399CD8)
  {
    sub_25F577CDC(&qword_26B399CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399CD8);
  }
  return result;
}

uint64_t destroy for CaptionPhraseResolver()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s23TextUnderstandingShared21CaptionPhraseResolverVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CaptionPhraseResolver(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for CaptionPhraseResolver(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptionPhraseResolver(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
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

uint64_t storeEnumTagSinglePayload for CaptionPhraseResolver(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptionPhraseResolver()
{
  return &type metadata for CaptionPhraseResolver;
}

unint64_t sub_25F592BB8(uint64_t a1)
{
  sub_25F5975F0();
  sub_25F597D90();
  sub_25F597670();
  uint64_t v2 = sub_25F597DB0();
  swift_bridgeObjectRelease();
  return sub_25F592D30(a1, v2);
}

unint64_t sub_25F592C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25F597C50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25F597C50() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25F592D30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_25F5975F0();
    uint64_t v8 = v7;
    if (v6 == sub_25F5975F0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_25F597C50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_25F5975F0();
          uint64_t v15 = v14;
          if (v13 == sub_25F5975F0() && v15 == v16) {
            break;
          }
          char v18 = sub_25F597C50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_25F592EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  return sub_25F591DA8(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4, a5);
}

uint64_t ThreadsafeDictionary.isEmpty.getter()
{
  sub_25F597860();
  return v1;
}

uint64_t sub_25F592F10@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[10];
  uint64_t v5 = v3[11];
  uint64_t v6 = v3[12];
  uint64_t v7 = swift_bridgeObjectRetain();
  LOBYTE(v6) = MEMORY[0x2611F6670](v7, v4, v5, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v6 & 1;
  return result;
}

uint64_t sub_25F592FD4@<X0>(unsigned char *a1@<X8>)
{
  return sub_25F592F10(v1, a1);
}

uint64_t ThreadsafeDictionary.count.getter()
{
  sub_25F597860();
  return v1;
}

uint64_t sub_25F593050@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25F597540();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 < 0)
  {
    uint64_t result = sub_25F597B10();
    __break(1u);
  }
  else
  {
    *a1 = v2;
  }
  return result;
}

uint64_t sub_25F59315C@<X0>(uint64_t *a1@<X8>)
{
  return sub_25F593050(a1);
}

uint64_t ThreadsafeDictionary.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ThreadsafeDictionary.init()();
  return v0;
}

void ThreadsafeDictionary.init()()
{
  sub_25F57957C();
  sub_25F597850();
  sub_25F58E4F8();
  uint64_t v15 = v2;
  uint64_t v16 = v1;
  MEMORY[0x270FA5388](v1);
  sub_25F5794EC();
  uint64_t v14 = v4 - v3;
  uint64_t v5 = sub_25F597840();
  MEMORY[0x270FA5388](v5);
  sub_25F5794EC();
  uint64_t v6 = sub_25F597500();
  MEMORY[0x270FA5388](v6 - 8);
  sub_25F5794EC();
  uint64_t v7 = sub_25F597380();
  sub_25F58E4F8();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_25F5794EC();
  uint64_t v13 = v12 - v11;
  sub_25F593480();
  sub_25F597A90();
  swift_bridgeObjectRelease();
  sub_25F597370();
  sub_25F597360();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  sub_25F5976D0();
  swift_bridgeObjectRelease();
  sub_25F5974E0();
  sub_25F5934C0();
  sub_25F572540(&qword_26B399E70);
  sub_25F593510();
  sub_25F597A40();
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v14, *MEMORY[0x263F8F130], v16);
  *(void *)(v0 + 16) = sub_25F597870();
  *(void *)(v0 + 24) = sub_25F597510();
  sub_25F5794FC();
}

unint64_t sub_25F593480()
{
  unint64_t result = qword_26B399E88;
  if (!qword_26B399E88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B399E88);
  }
  return result;
}

unint64_t sub_25F5934C0()
{
  unint64_t result = qword_26B399E80;
  if (!qword_26B399E80)
  {
    sub_25F597840();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399E80);
  }
  return result;
}

unint64_t sub_25F593510()
{
  unint64_t result = qword_26B399E78;
  if (!qword_26B399E78)
  {
    sub_25F577CDC(&qword_26B399E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B399E78);
  }
  return result;
}

uint64_t ThreadsafeDictionary.subscript.getter()
{
  return sub_25F597860();
}

uint64_t sub_25F5935E4(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)*a1;
  swift_beginAccess();
  uint64_t v5 = a1[3];
  uint64_t v6 = v4[10];
  uint64_t v7 = v4[11];
  uint64_t v8 = v4[12];
  swift_bridgeObjectRetain();
  MEMORY[0x2611F6690](a2, v5, v6, v7, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F5936B4()
{
  return sub_25F5935E4(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

void ThreadsafeDictionary.subscript.setter()
{
  sub_25F57957C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v34 = v4;
  uint64_t v35 = v2;
  uint64_t v5 = v4;
  uint64_t v31 = *v0;
  uint64_t v32 = *(void *)(v31 + 88);
  uint64_t v30 = sub_25F597970();
  sub_25F58E4F8();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = *(void *)(v31 + 80);
  sub_25F58E4F8();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v30 - v17;
  dispatch_queue_t v33 = (dispatch_queue_t)v1[2];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v30 - v17, v3, v11);
  uint64_t v19 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v5, v30);
  unint64_t v20 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v21 = (v15 + *(unsigned __int8 *)(v7 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = (char *)swift_allocObject();
  uint64_t v24 = v31;
  uint64_t v23 = v32;
  *((void *)v22 + 2) = v11;
  *((void *)v22 + 3) = v23;
  *((void *)v22 + 4) = *(void *)(v24 + 96);
  *((void *)v22 + 5) = v1;
  uint64_t v25 = &v22[v20];
  uint64_t v26 = v11;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v25, v18, v11);
  uint64_t v27 = v7;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v22[v21], v10, v19);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_25F593D00;
  *(void *)(v28 + 24) = v22;
  v36[4] = sub_25F593DB4;
  v36[5] = v28;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 1107296256;
  v36[2] = sub_25F593DDC;
  v36[3] = &unk_270BA6D00;
  BOOL v29 = _Block_copy(v36);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v33, v29);
  _Block_release(v29);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v35, v26);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v34, v19);
  LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v29) {
    __break(1u);
  }
  else {
    sub_25F5794FC();
  }
}

uint64_t sub_25F5939FC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a3;
  uint64_t v4 = *a1;
  uint64_t v5 = sub_25F597970();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = *(void *)(v4 + 80);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - v11, a2, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v14, v5);
  swift_beginAccess();
  sub_25F597560();
  sub_25F597580();
  return swift_endAccess();
}

uint64_t sub_25F593BE4()
{
  sub_25F57957C();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  sub_25F58E4F8();
  uint64_t v4 = v3;
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_25F597970();
  sub_25F594118(v8);
  unint64_t v10 = (v5 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v2);
  if (!sub_25F577D8C(v0 + v10, 1, v1)) {
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v10, v1);
  }
  sub_25F5794FC();
  return MEMORY[0x270FA0238](v11, v12, v13);
}

uint64_t sub_25F593D00()
{
  sub_25F58E4F8();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(sub_25F597970() - 8);
  uint64_t v6 = *(uint64_t **)(v0 + 40);
  uint64_t v7 = v0 + ((v2 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25F5939FC(v6, v0 + v2, v7);
}

uint64_t sub_25F593DA4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F593DB4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25F593DDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_25F593E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_25F593E14()
{
  return swift_release();
}

void (*ThreadsafeDictionary.subscript.modify(void *a1))()
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = sub_25F597970();
  v3[1] = v5;
  sub_25F594118(v5);
  v3[2] = v6;
  size_t v8 = *(void *)(v7 + 64);
  v3[3] = malloc(v8);
  v3[4] = malloc(v8);
  v3[5] = *(void *)(v4 + 80);
  sub_25F58E4F8();
  uint64_t v10 = v9;
  v3[6] = v9;
  size_t v12 = *(void *)(v11 + 64);
  v3[7] = malloc(v12);
  v3[8] = malloc(v12);
  (*(void (**)(void))(v10 + 16))();
  ThreadsafeDictionary.subscript.getter();
  return sub_25F593F5C;
}

void sub_25F593F5C()
{
  sub_25F57957C();
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(*(void *)v0 + 56);
  uint64_t v3 = *(void **)(*(void *)v0 + 64);
  if (v4)
  {
    uint64_t v5 = v1[5];
    uint64_t v6 = v1[6];
    size_t v8 = (void *)v1[3];
    uint64_t v7 = (void *)v1[4];
    uint64_t v9 = v1[1];
    uint64_t v10 = v1[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v2, v3, v5);
    ThreadsafeDictionary.subscript.setter();
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    size_t v8 = (void *)v1[3];
    uint64_t v7 = (void *)v1[4];
    ThreadsafeDictionary.subscript.setter();
  }
  free(v3);
  free(v2);
  free(v7);
  free(v8);
  sub_25F5794FC();
  free(v11);
}

uint64_t ThreadsafeDictionary.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ThreadsafeDictionary.__deallocating_deinit()
{
  ThreadsafeDictionary.deinit();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25F5940AC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ThreadsafeDictionary()
{
  return sub_25F57B258();
}

uint64_t sub_25F594118(uint64_t a1)
{
  return a1 - 8;
}

uint64_t TUSCache.__allocating_init(capacity:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TUSCache.init(capacity:)(a1);
  return v2;
}

uint64_t TUSCache.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = a2;
  sub_25F595280();
  v41[1] = v5;
  uint64_t v43 = *(void *)(v6 + 80);
  sub_25F595268();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v41 - v10;
  uint64_t v13 = *(void *)(v12 + 88);
  sub_25F597970();
  sub_25F58E4F8();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)v41 - v17;
  sub_25F58E4F8();
  uint64_t v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v41 - v25;
  uint64_t v45 = a1;
  uint64_t v42 = v27;
  sub_25F58E730();
  v28();
  if (sub_25F577D8C((uint64_t)v18, 1, v13) == 1)
  {
    BOOL v29 = *(void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v30 = v42;
    v29(v18, v42);
    uint64_t v31 = *(void **)(v3 + 16);
    uint64_t v32 = v43;
    type metadata accessor for WrappedKey();
    sub_25F595298();
    sub_25F58E730();
    v33();
    id v34 = sub_25F594658((uint64_t)v11);
    objc_msgSend(v31, sel_removeObjectForKey_, v34);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v32);
    return ((uint64_t (*)(uint64_t, uint64_t))v29)(v45, v30);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v18, v13);
    type metadata accessor for WrappedValue();
    sub_25F58E730();
    v36();
    uint64_t v37 = sub_25F594AC4((uint64_t)v24);
    v41[0] = *(id *)(v3 + 16);
    uint64_t v38 = v43;
    type metadata accessor for WrappedKey();
    sub_25F595298();
    sub_25F58E730();
    v39();
    id v40 = sub_25F594658((uint64_t)v11);
    objc_msgSend(v41[0], sel_setObject_forKey_, v37, v40);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v38);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v45, v42);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v26, v13);
  }
}

uint64_t TUSCache.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25F595280();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 80);
  sub_25F595268();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v14 = *(void **)(v2 + 16);
  type metadata accessor for WrappedKey();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v8);
  id v15 = sub_25F594658((uint64_t)v13);
  uint64_t v16 = (char *)objc_msgSend(v14, sel_objectForKey_, v15);

  if (v16)
  {
    uint64_t v17 = *(void *)(v6 + 88);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 16))(a2, &v16[*(void *)(*(void *)v16 + 88)], v17);
    swift_release();
    uint64_t v18 = a2;
    uint64_t v19 = 0;
    uint64_t v20 = v17;
  }
  else
  {
    uint64_t v20 = *(void *)(v6 + 88);
    uint64_t v18 = a2;
    uint64_t v19 = 1;
  }
  return sub_25F5721D0(v18, v19, 1, v20);
}

id sub_25F594658(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25F59468C(a1);
}

id sub_25F59468C(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1, v4);
  v8.receiver = v1;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t sub_25F59478C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_25F5947C0();

  return v2;
}

uint64_t sub_25F5947C0()
{
  return sub_25F597590();
}

uint64_t sub_25F594838(uint64_t a1)
{
  swift_getObjectType();
  sub_25F595200(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_25F5951A0((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = sub_25F5975B0();

  return v2 & 1;
}

uint64_t sub_25F594958(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_25F597A30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = sub_25F594838((uint64_t)v8);

  sub_25F5951A0((uint64_t)v8);
  return v6 & 1;
}

void sub_25F5949D0()
{
}

void sub_25F594A00()
{
}

id sub_25F594A24()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25F594A5C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t sub_25F594AC4(uint64_t a1)
{
  return sub_25F594B00(a1);
}

uint64_t sub_25F594B00(uint64_t a1)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 32))(v1 + *(void *)(*(void *)v1 + 88), a1);
  return v1;
}

uint64_t sub_25F594B74()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t sub_25F594BE4()
{
  uint64_t v0 = sub_25F594B74();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t TUSCache.init(capacity:)(uint64_t a1)
{
  sub_25F572540(&qword_26B399CC0);
  type metadata accessor for WrappedKey();
  type metadata accessor for WrappedValue();
  id v3 = sub_25F594D28();
  *(void *)(v1 + 16) = v3;
  objc_msgSend(v3, sel_setCountLimit_, a1);
  return v1;
}

uint64_t type metadata accessor for WrappedKey()
{
  return sub_25F57B258();
}

uint64_t type metadata accessor for WrappedValue()
{
  return sub_25F57B258();
}

id sub_25F594D28()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

void (*TUSCache.subscript.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  id v5 = malloc(0x48uLL);
  *a1 = v5;
  *id v5 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_25F597970();
  v5[1] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[2] = v8;
  size_t v9 = *(void *)(v8 + 64);
  v5[3] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v5[4] = v10;
  v5[5] = *(void *)(v6 + 80);
  sub_25F58E4F8();
  uint64_t v12 = v11;
  v5[6] = v11;
  size_t v14 = *(void *)(v13 + 64);
  v5[7] = malloc(v14);
  v5[8] = malloc(v14);
  (*(void (**)(void))(v12 + 16))();
  TUSCache.subscript.getter(a2, (uint64_t)v10);
  return sub_25F594EC4;
}

void sub_25F594EC4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(*(void *)a1 + 56);
  id v4 = *(void **)(*(void *)a1 + 64);
  if (a2)
  {
    uint64_t v5 = v2[5];
    uint64_t v6 = v2[6];
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    uint64_t v9 = v2[1];
    uint64_t v10 = v2[2];
    sub_25F58E730();
    v11();
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    TUSCache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    TUSCache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);
  free(v2);
}

uint64_t TUSCache.deinit()
{
  return v0;
}

uint64_t TUSCache.__deallocating_deinit()
{
  TUSCache.deinit();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25F595018()
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

uint64_t sub_25F5950AC()
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

uint64_t sub_25F595140()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TUSCache()
{
  return sub_25F57B258();
}

uint64_t sub_25F5951A0(uint64_t a1)
{
  uint64_t v2 = sub_25F572540((uint64_t *)&unk_26B399D08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F595200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F572540((uint64_t *)&unk_26B399D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F595298()
{
  return v0;
}

uint64_t sub_25F595320()
{
  return sub_25F595728((uint64_t)&unk_270BA6008);
}

id sub_25F59532C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (!v2 && (sub_25F597C50() & 1) == 0) {
    return 0;
  }
  sub_25F5956E8();
  swift_bridgeObjectRetain();
  return sub_25F5953B0();
}

id sub_25F5953B0()
{
  uint64_t v0 = (void *)sub_25F5975C0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_featureValueWithString_, v0);

  return v1;
}

uint64_t sub_25F59542C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for TextUnderstandingSupportInput()
{
  return self;
}

uint64_t sub_25F5954F4()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_featureNames);
  uint64_t v2 = sub_25F5977F0();

  return v2;
}

id sub_25F59554C()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_25F5975C0();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  return v3;
}

id sub_25F5955B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_25F5975F0();
  uint64_t v7 = v6;
  swift_retain();
  uint64_t v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25F595630()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for TextUnderstandingSupportOutput()
{
  return self;
}

uint64_t sub_25F59568C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for TextUnderstandingSupport()
{
  return self;
}

unint64_t sub_25F5956E8()
{
  unint64_t result = qword_26A7AAC10;
  if (!qword_26A7AAC10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7AAC10);
  }
  return result;
}

uint64_t sub_25F595728(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  sub_25F572540(&qword_26B399CD0);
  uint64_t result = sub_25F597A70();
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
    sub_25F597D90();
    swift_bridgeObjectRetain();
    sub_25F597670();
    uint64_t result = sub_25F597DB0();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      id v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_25F597C50(), (result & 1) != 0))
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
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_25F597C50();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    void *v20 = v8;
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

void sub_25F596758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_25F5967B8(uint64_t a1, UTF32Char theChar, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(v9 + 32);
  uint64_t v11 = *(void *)(v9 + 40);
  if (theChar - 0x10000 < 0x100000)
  {
LABEL_2:
    uint64_t v12 = 4;
    goto LABEL_9;
  }
  if ((theChar - 2048) >> 11 >= 0x1F)
  {
    if (theChar - 128 >= 0x780)
    {
      if (theChar >= 0x80)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          v32[0] = 67109120;
          v32[1] = theChar;
          _os_log_fault_impl(&dword_25F56F000, &_os_log_internal, OS_LOG_TYPE_FAULT, "WordPieceTokenizer: Invalid UTF32 character %u", (uint8_t *)v32, 8u);
        }
        goto LABEL_2;
      }
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v12 = 3;
  }
LABEL_9:
  if (*(void *)(a1 + 80) != *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v13 = v11 + v10;
    int IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 88), theChar);
    if (theChar == 176 || IsLongCharacterMember)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v12;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a5;
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        int v16 = *(_DWORD *)(v15 + 24);
        unint64_t v17 = *(void *)(a1 + 80);
        unint64_t v18 = v16;
        if (v17 > v16)
        {
          uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          uint64_t v20 = (void *)(*(void *)(a1 + 96) + 16 * v16);
          void *v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          v20[1] = v19;
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          int v16 = *(_DWORD *)(v15 + 24);
          unint64_t v17 = *(void *)(a1 + 80);
          unint64_t v18 = v16;
        }
        if (v17 <= v18)
        {
          int v23 = 0;
        }
        else
        {
          uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          BOOL v22 = (void *)(*(void *)(a1 + 104) + 16 * v18);
          *BOOL v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          v22[1] = v21;
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          int v16 = *(_DWORD *)(v15 + 24);
          int v23 = 1;
        }
        *(_DWORD *)(v15 + 24) = v16 + v23;
      }
      if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 112), theChar))
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
        int v25 = *(_DWORD *)(v24 + 24);
        unint64_t v26 = *(void *)(a1 + 80);
        unint64_t v27 = v25;
        if (v26 > v25)
        {
          uint64_t v28 = (void *)(*(void *)(a1 + 96) + 16 * v25);
          *uint64_t v28 = v13;
          v28[1] = v12;
          uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
          int v25 = *(_DWORD *)(v24 + 24);
          unint64_t v26 = *(void *)(a1 + 80);
          unint64_t v27 = v25;
        }
        if (v26 <= v27)
        {
          int v30 = 0;
        }
        else
        {
          BOOL v29 = (void *)(*(void *)(a1 + 104) + 16 * v27);
          void *v29 = a4;
          v29[1] = a5;
          uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
          int v25 = *(_DWORD *)(v24 + 24);
          int v30 = 1;
        }
        *(_DWORD *)(v24 + 24) = v25 + v30;
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12 + v13;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a4 + a5;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v31 + 32) = v13;
    *(void *)(v31 + 40) = v12;
  }
}

void sub_25F596EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25F596F00(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  if (CFEqual(v5, *(CFStringRef *)(a1 + 40)))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = LXEntryGetTokenID();
    *a3 = 1;
  }
  CFRelease(v5);
}

uint64_t sub_25F597220()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_25F597230()
{
  return MEMORY[0x270EEE108]();
}

uint64_t sub_25F597240()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25F597250()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_25F597260()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_25F597270()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25F597280()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25F597290()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25F5972A0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25F5972B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25F5972C0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25F5972D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25F5972E0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25F5972F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25F597300()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25F597310()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_25F597320()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25F597330()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25F597340()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25F597350()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25F597360()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25F597370()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25F597380()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25F597390()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25F5973A0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25F5973B0()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_25F5973C0()
{
  return MEMORY[0x270EF0F20]();
}

uint64_t sub_25F5973D0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25F5973E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25F5973F0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25F597400()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25F597410()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25F597420()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25F597430()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25F597440()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25F597450()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_25F597460()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_25F597470()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_25F597480()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_25F597490()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_25F5974A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25F5974B0()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_25F5974C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25F5974D0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25F5974E0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25F5974F0()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_25F597500()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25F597510()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25F597520()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_25F597530()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25F597540()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_25F597550()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_25F597560()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25F597570()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25F597580()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25F597590()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_25F5975A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25F5975B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25F5975C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25F5975D0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25F5975E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25F5975F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25F597600()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t sub_25F597610()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25F597620()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25F597630()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25F597640()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25F597650()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_25F597660()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25F597670()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25F597680()
{
  return MEMORY[0x270F9D720]();
}

uint64_t sub_25F597690()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25F5976A0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25F5976B0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25F5976C0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25F5976D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25F5976E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25F5976F0()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_25F597700()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_25F597710()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25F597720()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25F597730()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25F597740()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25F597750()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25F597760()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25F597770()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25F597780()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25F597790()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25F5977A0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25F5977B0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25F5977C0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25F5977D0()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_25F5977E0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25F5977F0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25F597800()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25F597810()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25F597820()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25F597830()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25F597840()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25F597850()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25F597860()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25F597870()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25F597880()
{
  return MEMORY[0x270FA0E58]();
}

uint64_t sub_25F597890()
{
  return MEMORY[0x270FA0E60]();
}

uint64_t sub_25F5978A0()
{
  return MEMORY[0x270FA0E68]();
}

uint64_t sub_25F5978B0()
{
  return MEMORY[0x270FA0E70]();
}

uint64_t sub_25F5978C0()
{
  return MEMORY[0x270FA0E80]();
}

uint64_t sub_25F5978D0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25F5978E0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25F5978F0()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_25F597900()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25F597910()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25F597920()
{
  return MEMORY[0x270FA10E8]();
}

uint64_t sub_25F597930()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_25F597940()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_25F597950()
{
  return MEMORY[0x270FA1108]();
}

uint64_t sub_25F597960()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_25F597970()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25F597980()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25F597990()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25F5979A0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25F5979B0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25F5979C0()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_25F5979D0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25F5979E0()
{
  return MEMORY[0x270EF2490]();
}

uint64_t sub_25F5979F0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25F597A00()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25F597A10()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_25F597A20()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25F597A30()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25F597A40()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25F597A50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25F597A60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25F597A70()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25F597A80()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_25F597A90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25F597AA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25F597AB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25F597AC0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_25F597AD0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25F597AE0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_25F597AF0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25F597B00()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25F597B10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25F597B20()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25F597B30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25F597B40()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25F597B50()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25F597B60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25F597B80()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_25F597B90()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25F597BA0()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_25F597BB0()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_25F597BC0()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_25F597BD0()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_25F597BE0()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_25F597BF0()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_25F597C00()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_25F597C10()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_25F597C20()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_25F597C30()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_25F597C40()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25F597C50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25F597C60()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_25F597C70()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_25F597C80()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_25F597C90()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_25F597CA0()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_25F597CB0()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_25F597CC0()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_25F597CD0()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_25F597CE0()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_25F597CF0()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_25F597D00()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_25F597D10()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_25F597D20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25F597D30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25F597D40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25F597D50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25F597D60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25F597D70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25F597D80()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25F597D90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25F597DA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25F597DB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25F597DC0()
{
  return MEMORY[0x270FA0090]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x270EE4768](theSet, *(void *)&theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x270F46EF8]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x270F46F08]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x270F46F48]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x270F57F80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
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