MorphunSwift::TokenType_optional __swiftcall TokenType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7) {
    v2 = rawValue;
  }
  *v1 = v2;
  return (MorphunSwift::TokenType_optional)rawValue;
}

BOOL sub_21EDE65B0(char *a1, char *a2)
{
  return sub_21EDEAC54(*a1, *a2);
}

uint64_t sub_21EDE65BC()
{
  return sub_21EDEAC64(*v0);
}

uint64_t sub_21EDE65C4(uint64_t a1)
{
  return sub_21EDEC4DC(a1, *v1);
}

uint64_t sub_21EDE65CC(uint64_t a1)
{
  return sub_21EDEACD8(a1, *v1);
}

MorphunSwift::TokenType_optional sub_21EDE65D4(Swift::Int *a1)
{
  return TokenType.init(rawValue:)(*a1);
}

MorphunSwift::TokenizationType_optional __swiftcall TokenizationType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (MorphunSwift::TokenizationType_optional)rawValue;
}

uint64_t TokenizationType.rawValue.getter()
{
  return *v0;
}

uint64_t sub_21EDE65F8()
{
  return sub_21EDEACB0();
}

MorphunSwift::TokenizationType_optional sub_21EDE6600(Swift::Int *a1)
{
  return TokenizationType.init(rawValue:)(*a1);
}

uint64_t sub_21EDE6608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TokenizationType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21EDE6630()
{
  uint64_t v0 = mtokc_compare();
  swift_release();
  swift_release();
  return v0;
}

void sub_21EDE675C()
{
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  v5(v4);
  OUTLINED_FUNCTION_13();
  if (v0)
  {
    CFStringRef v6 = (id)CFErrorGetDomain(v0);
    if (v6)
    {
      v7 = (__CFString *)v6;
      sub_21EDEC5E0();
      OUTLINED_FUNCTION_6();
      uint64_t v8 = OUTLINED_FUNCTION_2();
      void *v9 = v1;
      v9[1] = v2;
      OUTLINED_FUNCTION_3(v8, (uint64_t)v9);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5();
}

void sub_21EDE6840(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFErrorRef err, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_4();
  if (!v20())
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v21, (uint64_t)"Call returned nullptr but no error was set.");
  }
  swift_release();
  OUTLINED_FUNCTION_5();
}

void sub_21EDE6948(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFErrorRef err, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_4();
  uint64_t v23 = OUTLINED_FUNCTION_9(v22);
  uint64_t v25 = v24(v23);
  if (err)
  {
    CFStringRef v26 = (id)CFErrorGetDomain(err);
    if (v26)
    {
      v27 = (__CFString *)v26;
      sub_21EDEC5E0();
      OUTLINED_FUNCTION_6();
      uint64_t v28 = OUTLINED_FUNCTION_2();
      void *v29 = v20;
      v29[1] = v21;
      OUTLINED_FUNCTION_3(v28, (uint64_t)v29);
      swift_release();

      goto LABEL_8;
    }
  }
  if (!v25)
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v30, (uint64_t)"Call returned nullptr but no error was set.");
  }
  swift_release();
LABEL_8:
  OUTLINED_FUNCTION_5();
}

void sub_21EDE6A50(void (*a1)(uint64_t *__return_ptr, CFErrorRef *))
{
}

uint64_t sub_21EDE6A9C()
{
  uint64_t Type = mtok_getType();
  swift_release();
  return Type;
}

void sub_21EDE6BAC()
{
  OUTLINED_FUNCTION_4();
  v3();
  OUTLINED_FUNCTION_13();
  if (v0)
  {
    CFStringRef v4 = (id)CFErrorGetDomain(v0);
    if (v4)
    {
      v5 = (__CFString *)v4;
      sub_21EDEC5E0();
      OUTLINED_FUNCTION_6();
      uint64_t v6 = OUTLINED_FUNCTION_2();
      void *v7 = v1;
      v7[1] = v2;
      OUTLINED_FUNCTION_3(v6, (uint64_t)v7);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5();
}

void sub_21EDE6C90()
{
  OUTLINED_FUNCTION_4();
  mlogc_registerLogger();
  OUTLINED_FUNCTION_13();
  if (v0)
  {
    CFStringRef v3 = (id)CFErrorGetDomain(v0);
    if (v3)
    {
      CFStringRef v4 = (__CFString *)v3;
      sub_21EDEC5E0();
      OUTLINED_FUNCTION_6();
      uint64_t v5 = OUTLINED_FUNCTION_2();
      *uint64_t v6 = v1;
      v6[1] = v2;
      OUTLINED_FUNCTION_3(v5, (uint64_t)v6);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5();
}

void sub_21EDE6D84()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(v3);
  mlogc_unregisterLogger();
  OUTLINED_FUNCTION_13();
  if (v0)
  {
    CFStringRef v4 = (id)CFErrorGetDomain(v0);
    if (v4)
    {
      uint64_t v5 = (__CFString *)v4;
      sub_21EDEC5E0();
      OUTLINED_FUNCTION_6();
      uint64_t v6 = OUTLINED_FUNCTION_2();
      void *v7 = v1;
      v7[1] = v2;
      OUTLINED_FUNCTION_3(v6, (uint64_t)v7);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EDE6E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21EDE6EC0(a1, a2, a3, MEMORY[0x263F8C5A8]);
}

uint64_t sub_21EDE6EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, CFErrorRef *))
{
  err[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  err[0] = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (void *)sub_21EDEC5D0();
  uint64_t v7 = a4(v5, v6, err);

  CFErrorRef v8 = err[0];
  if (err[0])
  {
    CFStringRef v9 = (id)CFErrorGetDomain(err[0]);
    if (v9)
    {
      v10 = (__CFString *)v9;
      uint64_t v11 = sub_21EDEC5E0();
      uint64_t v13 = v12;
      sub_21EDE948C();
      uint64_t v14 = OUTLINED_FUNCTION_2();
      uint64_t *v15 = v11;
      v15[1] = v13;
      OUTLINED_FUNCTION_3(v14, (uint64_t)v15);
      swift_bridgeObjectRelease();
      swift_release();

      return v7;
    }
  }
  if (v7)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v16, (uint64_t)"Call returned nullptr but no error was set.");
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v7;
}

uint64_t sub_21EDE702C()
{
  uint64_t TokenChain = mca_createTokenChain();
  if (!TokenChain)
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v1, (uint64_t)"Call returned nullptr but no error was set.");
  }
  swift_release();
  swift_release();
  return TokenChain;
}

void sub_21EDE7174(void (*a1)(uint64_t *__return_ptr, CFErrorRef *))
{
  err[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  err[0] = 0;
  a1(&v10, err);
  CFErrorRef v1 = err[0];
  if (err[0])
  {
    CFStringRef v2 = (id)CFErrorGetDomain(err[0]);
    if (v2)
    {
      uint64_t v3 = (__CFString *)v2;
      uint64_t v4 = sub_21EDEC5E0();
      uint64_t v6 = v5;
      sub_21EDE948C();
      uint64_t v7 = OUTLINED_FUNCTION_2();
      *CFErrorRef v8 = v4;
      v8[1] = v6;
      OUTLINED_FUNCTION_3(v7, (uint64_t)v8);

      return;
    }
  }
  if (!v10)
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v9, (uint64_t)"Call returned nullptr but no error was set.");
  }
}

void sub_21EDE7280()
{
}

void sub_21EDE7388(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t, CFErrorRef *))
{
  err[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  err[0] = 0;
  a3(*(void *)(a1 + 16), a2, err);
  CFErrorRef v3 = err[0];
  if (err[0])
  {
    CFStringRef v4 = (id)CFErrorGetDomain(err[0]);
    if (v4)
    {
      uint64_t v5 = (__CFString *)v4;
      uint64_t v6 = sub_21EDEC5E0();
      uint64_t v8 = v7;
      sub_21EDE948C();
      uint64_t v9 = OUTLINED_FUNCTION_2();
      uint64_t *v10 = v6;
      v10[1] = v8;
      OUTLINED_FUNCTION_3(v9, (uint64_t)v10);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
}

void sub_21EDE7484(void (*a1)(char *__return_ptr, CFErrorRef *))
{
  err[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  err[0] = 0;
  a1(&v10, err);
  CFErrorRef v1 = err[0];
  if (err[0])
  {
    CFStringRef v2 = (id)CFErrorGetDomain(err[0]);
    if (v2)
    {
      CFErrorRef v3 = (__CFString *)v2;
      uint64_t v4 = sub_21EDEC5E0();
      uint64_t v6 = v5;
      sub_21EDE948C();
      uint64_t v7 = OUTLINED_FUNCTION_2();
      *uint64_t v8 = v4;
      v8[1] = v6;
      OUTLINED_FUNCTION_3(v7, (uint64_t)v8);

      return;
    }
  }
  if (v10)
  {
    sub_21EDE948C();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v9, (uint64_t)"Call returned nullptr but no error was set.");
  }
}

uint64_t Token.value.getter()
{
  return sub_21EDE75C0(MEMORY[0x263F8C5D0]);
}

uint64_t Token.cleanValue.getter()
{
  return sub_21EDE75C0(MEMORY[0x263F8C5B8]);
}

#error "21EDE75EC: call analysis failed (funcsize=28)"

MorphunSwift::TokenType_optional Token.type.getter@<W0>(unsigned char *a1@<X8>)
{
  swift_retain();
  Swift::Int v2 = sub_21EDE6A9C();
  result.value = TokenType.init(rawValue:)(v2).value;
  if (v4 == 7)
  {
    __break(1u);
    result.value = OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    *a1 = v4;
  }
  return result;
}

#error "21EDE76F8: call analysis failed (funcsize=37)"

uint64_t Token.debugDescription.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  swift_retain_n();
  sub_21EDE6840(v2, v1, MEMORY[0x263F8C5D0], v3, v4, v5, v6, v7, v12, v14, 0, 0xE000000000000000, v16, v17, v18, v19, v20, v21, vars0,
    vars8);
  uint64_t v9 = v8;
  sub_21EDEC5E0();
  swift_release();

  sub_21EDEC5F0();
  swift_bridgeObjectRelease();
  sub_21EDEC5F0();
  swift_retain_n();
  Swift::Int v10 = sub_21EDE6A9C();
  TokenType.init(rawValue:)(v10);
  if (v13 == 7)
  {
    __break(1u);
    uint64_t result = OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    swift_release();
    sub_21EDEC720();
    return v15;
  }
  return result;
}

uint64_t Token.range.getter()
{
  mtok_getStartChar();
  mtok_getEndChar();
  sub_21EDE7ABC();
  uint64_t v0 = sub_21EDEC660();
  char v2 = v1;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v2 & 1) == 0) {
    return v0;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall Token.isSignificant()()
{
  return sub_21EDE793C();
}

Swift::Bool __swiftcall Token.isWhitespace()()
{
  return sub_21EDE793C();
}

uint64_t sub_21EDE793C()
{
  uint64_t v1 = *v0;
  swift_retain();
  OUTLINED_FUNCTION_12();
  sub_21EDE6BAC();
  if (!v1) {
    return v2 & 1;
  }
  uint64_t result = OUTLINED_FUNCTION_0();
  __break(1u);
  return result;
}

void sub_21EDE79A0(_DWORD *a1@<X8>)
{
  sub_21EDE79F4();
  *a1 = v2;
}

uint64_t sub_21EDE79CC(unsigned int *a1)
{
  return sub_21EDE7A6C(*a1);
}

void sub_21EDE79F4()
{
  if (*(unsigned char *)(v0 + 44) == 1)
  {
    swift_retain();
    sub_21EDE675C();
    *(_DWORD *)(v0 + 40) = v1;
    *(unsigned char *)(v0 + 44) = 0;
  }
}

uint64_t sub_21EDE7A6C(uint64_t result)
{
  *(_DWORD *)(v1 + 40) = result;
  *(unsigned char *)(v1 + 44) = 0;
  return result;
}

uint64_t sub_21EDE7A78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21EDE7ABC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21EDE7AA4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21EDE7BC0(a1, a2, a3, a4, sub_21EDE7B70);
}

#error "21EDE7B08: call analysis failed (funcsize=44)"

uint64_t sub_21EDE7B70(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_21EDE7B7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21EDE7C08();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21EDE7BA8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21EDE7BC0(a1, a2, a3, a4, sub_21EDE7CBC);
}

uint64_t sub_21EDE7BC0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

#error "21EDE7C54: call analysis failed (funcsize=44)"

uint64_t sub_21EDE7CBC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return OUTLINED_FUNCTION_7();
}

uint64_t TokenChain.size.getter()
{
  return *(unsigned int *)(v0 + 80);
}

uint64_t sub_21EDE7CD0(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 44) = 1;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(void *)(v1 + 16) = a1;
  *(_DWORD *)(v1 + 80) = mtokc_getSize();
  return v1;
}

BOOL static TokenChain.== infix(_:_:)()
{
  return sub_21EDE6630() == 0;
}

uint64_t sub_21EDE7E58@<X0>(uint64_t *a1@<X8>)
{
  if (*(void *)(v1 + 24))
  {
    OUTLINED_FUNCTION_10();
    uint64_t Next = mtok_getNext();
  }
  else
  {
    OUTLINED_FUNCTION_10();
    uint64_t Next = mtokc_getHead();
  }
  uint64_t v4 = Next;
  swift_endAccess();
  *(void *)(v1 + 24) = v4;
  uint64_t result = swift_beginAccess();
  if (*(void *)(v1 + 32) || !v4)
  {
    *a1 = 0;
    a1[1] = 0;
  }
  else
  {
    *a1 = v4;
    a1[1] = v1;
    return swift_retain();
  }
  return result;
}

uint64_t TokenChain.deinit()
{
  mtokc_destroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TokenChain.__deallocating_deinit()
{
  TokenChain.deinit();
  return MEMORY[0x270FA0228](v0, 84, 7);
}

uint64_t sub_21EDE7F60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21EDE7F8C();
  *a1 = result;
  return result;
}

uint64_t sub_21EDE7F8C()
{
  return v0;
}

uint64_t sub_21EDE7F98()
{
  return 2;
}

uint64_t sub_21EDE7FA0()
{
  return sub_21EDE7FC4();
}

uint64_t sub_21EDE7FC4()
{
  uint64_t v0 = sub_21EDE9230();
  swift_release();
  return v0;
}

uint64_t sub_21EDE7FF8()
{
  return sub_21EDE801C();
}

uint64_t sub_21EDE8020()
{
  return sub_21EDEC610();
}

uint64_t sub_21EDE8088@<X0>(uint64_t *a1@<X8>)
{
  return sub_21EDE7E58(a1);
}

uint64_t sub_21EDE80AC()
{
  return sub_21EDE7ABC();
}

uint64_t sub_21EDE80D0()
{
  return sub_21EDE7C08();
}

BOOL sub_21EDE80F4()
{
  return static TokenChain.== infix(_:_:)();
}

uint64_t Tokenizer.__allocating_init(locale:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  Tokenizer.init(locale:)(a1);
  return v2;
}

uint64_t Tokenizer.init(locale:)(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  sub_21EDE7174((void (*)(uint64_t *__return_ptr, CFErrorRef *))sub_21EDE8294);
  if (v2)
  {
    sub_21EDEC560();
    OUTLINED_FUNCTION_11();
    (*(void (**)(uint64_t))(v5 + 8))(a1);
    type metadata accessor for Tokenizer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v6 = v4;
    sub_21EDEC560();
    OUTLINED_FUNCTION_11();
    (*(void (**)(uint64_t))(v7 + 8))(a1);
    *(void *)(v1 + 16) = v6;
  }
  return v1;
}

void sub_21EDE8248(uint64_t *a1@<X8>)
{
  uint64_t v2 = (void *)sub_21EDEC540();
  uint64_t Tokenizer = mtok_createTokenizer();

  *a1 = Tokenizer;
}

void sub_21EDE8294(uint64_t *a1@<X8>)
{
}

uint64_t type metadata accessor for Tokenizer()
{
  return self;
}

uint64_t sub_21EDE82C0(uint64_t a1, uint64_t a2)
{
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21EDE6EC0(v2, a1, a2, MEMORY[0x263F8C5B0]);
  if (!v3)
  {
    uint64_t v7 = v6;
    type metadata accessor for TokenChain();
    a1 = swift_allocObject();
    sub_21EDE7CD0(v7);
  }
  return a1;
}

uint64_t type metadata accessor for TokenChain()
{
  return self;
}

uint64_t sub_21EDE8378(uint64_t a1, uint64_t a2)
{
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21EDE6EC0(v2, a1, a2, MEMORY[0x263F8C5B0]);
  type metadata accessor for TokenChain();
  uint64_t v6 = swift_allocObject();
  sub_21EDE7CD0(v5);
  return v6;
}

void sub_21EDE841C()
{
}

void sub_21EDE8474(_DWORD *a1@<X8>)
{
  sub_21EDE84C8();
  *a1 = v2;
}

void sub_21EDE84A0(unsigned int *a1)
{
}

void sub_21EDE84C8()
{
}

void sub_21EDE84E0(uint64_t a1)
{
}

void (*sub_21EDE84F8(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = v1;
  swift_retain();
  sub_21EDE675C();
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = v3;
  return sub_21EDE8588;
}

void sub_21EDE8588(uint64_t a1, uint64_t a2)
{
}

void sub_21EDE85A0(_DWORD *a1@<X8>)
{
  sub_21EDE85F4();
  *a1 = v2;
}

void sub_21EDE85CC(unsigned int *a1)
{
}

void sub_21EDE85F4()
{
}

void sub_21EDE860C()
{
}

void sub_21EDE8664(uint64_t a1)
{
}

void sub_21EDE867C(uint64_t a1, void (*a2)(void, uint64_t, CFErrorRef *))
{
  uint64_t v4 = swift_retain();
  sub_21EDE7388(v4, a1, a2);
}

void (*sub_21EDE86DC(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = v1;
  swift_retain();
  sub_21EDE675C();
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = v3;
  return sub_21EDE876C;
}

void sub_21EDE876C(uint64_t a1, uint64_t a2)
{
}

void sub_21EDE8784(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t, CFErrorRef *))
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(unsigned int *)(a1 + 16);
  uint64_t v6 = swift_retain();
  sub_21EDE7388(v6, v5, a3);
  if (v4)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
}

uint64_t Tokenizer.deinit()
{
  mtok_destroy();
  return v0;
}

uint64_t Tokenizer.__deallocating_deinit()
{
  mtok_destroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

unint64_t sub_21EDE884C()
{
  unint64_t result = qword_267EA7560;
  if (!qword_267EA7560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA7560);
  }
  return result;
}

unint64_t sub_21EDE889C()
{
  unint64_t result = qword_267EA7568;
  if (!qword_267EA7568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA7568);
  }
  return result;
}

unint64_t sub_21EDE88EC()
{
  unint64_t result = qword_267EA7570;
  if (!qword_267EA7570)
  {
    type metadata accessor for TokenChain();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA7570);
  }
  return result;
}

uint64_t sub_21EDE893C()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for MorphunError()
{
  return sub_21EDE8954();
}

uint64_t sub_21EDE8954()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s12MorphunSwift12MorphunErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_21EDE893C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MorphunError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_21EDE893C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_21EDE8954();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MorphunError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_21EDE8954();
  return a1;
}

uint64_t getEnumTagSinglePayload for MorphunError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for MorphunError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21EDE8AE0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_21EDE8AEC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for MorphunError()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TokenType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TokenType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21EDE8C68);
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

void type metadata accessor for TokenType()
{
}

uint64_t getEnumTagSinglePayload for TokenizationType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TokenizationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21EDE8DF0);
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

uint64_t sub_21EDE8E18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21EDE8E20(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void type metadata accessor for TokenizationType()
{
}

void *initializeBufferWithCopyOfBuffer for Token(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for Token()
{
  return swift_release();
}

void *assignWithCopy for Token(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for Token(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Token(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Token(uint64_t result, int a2, int a3)
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

void type metadata accessor for Token()
{
}

uint64_t method lookup function for TokenChain(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenChain);
}

uint64_t dispatch thunk of TokenChain.wordCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TokenChain.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TokenChain.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TokenChain.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t method lookup function for Tokenizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Tokenizer);
}

uint64_t dispatch thunk of Tokenizer.__allocating_init(locale:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of Tokenizer.tokenizeWithError(string:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of Tokenizer.tokenize(string:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of Tokenizer.setStyle(type:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for CFLocale(uint64_t a1)
{
}

void sub_21EDE91E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_21EDE9230()
{
  swift_retain();
  uint64_t result = sub_21EDE7E58(&v19);
  uint64_t v1 = v20;
  unint64_t v2 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = 0;
  if (v20)
  {
    uint64_t v4 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      uint64_t v5 = v19;
      if (!v3)
      {
        unint64_t v6 = v2[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v7;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_267EA7588);
        uint64_t v9 = (void *)swift_allocObject();
        uint64_t v10 = (uint64_t)(_swift_stdlib_malloc_size(v9) - 32) / 16;
        v9[2] = v8;
        v9[3] = 2 * v10;
        unint64_t v11 = (unint64_t)(v9 + 4);
        unint64_t v12 = v2[3];
        unint64_t v13 = v12 >> 1;
        if (v2[2])
        {
          if (v9 != v2 || v11 >= (unint64_t)&v2[2 * v13 + 4]) {
            memmove(v9 + 4, v2 + 4, 16 * v13);
          }
          v2[2] = 0;
        }
        uint64_t v4 = (uint64_t *)(v11 + 16 * v13);
        uint64_t v3 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - (v12 >> 1);
        uint64_t result = swift_release();
        unint64_t v2 = v9;
      }
      BOOL v15 = __OFSUB__(v3--, 1);
      if (v15) {
        break;
      }
      *uint64_t v4 = v5;
      v4[1] = v1;
      v4 += 2;
      uint64_t result = sub_21EDE7E58(&v19);
      uint64_t v1 = v20;
      if (!v20) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  uint64_t result = swift_release();
  unint64_t v16 = v2[3];
  if (v16 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v17 = v16 >> 1;
  BOOL v15 = __OFSUB__(v17, v3);
  unint64_t v18 = v17 - v3;
  if (!v15)
  {
    v2[2] = v18;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_21EDE9398(void *result, void *a2, uint64_t a3)
{
  uint64_t v4 = result;
  uint64_t v5 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    return (void *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    int64_t v7 = a2;
    sub_21EDE7E58(&v9);
    uint64_t v8 = v10;
    if (v10)
    {
      uint64_t v5 = 0;
      while (1)
      {
        void *v7 = v9;
        v7[1] = v8;
        if (a3 - 1 == v5) {
          break;
        }
        sub_21EDE7E58(&v9);
        uint64_t v8 = v10;
        v7 += 2;
        ++v5;
        if (!v10) {
          goto LABEL_11;
        }
      }
      uint64_t v5 = a3;
    }
    else
    {
      uint64_t v5 = 0;
    }
    goto LABEL_11;
  }
  __break(1u);
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

unint64_t sub_21EDE948C()
{
  unint64_t result = qword_267EA7590;
  if (!qword_267EA7590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA7590);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_unexpectedError();
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = 0xD00000000000002BLL;
  *(void *)(a1 + 8) = (a2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 0;
  return swift_willThrow();
}

unint64_t OUTLINED_FUNCTION_6()
{
  return sub_21EDE948C();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

void sub_21EDE9634()
{
  uint64_t v16 = sub_21EDEC560();
  uint64_t v0 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  SupportedLocalesList = (void *)mloc_getSupportedLocalesList();
  if (!SupportedLocalesList) {
    goto LABEL_16;
  }
  uint64_t v4 = SupportedLocalesList;
  uint64_t v5 = (char *)objc_msgSend(SupportedLocalesList, sel_count);
  unint64_t v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (((unint64_t)v6 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  int64_t v7 = 0;
  v15[1] = v0 + 32;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = v4;
  while (1)
  {
    id v10 = objc_msgSend(v4, sel_objectAtIndex_, v7);
    sub_21EDEC6E0();
    swift_unknownObjectRelease();
    type metadata accessor for CFLocale(0);
    swift_dynamicCast();
    unint64_t v11 = v17;
    sub_21EDEC550();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_21EDE9878(0, *(void *)(v8 + 16) + 1, 1, v8);
    }
    unint64_t v13 = *(void *)(v8 + 16);
    unint64_t v12 = *(void *)(v8 + 24);
    if (v13 >= v12 >> 1) {
      uint64_t v8 = sub_21EDE9878(v12 > 1, v13 + 1, 1, v8);
    }
    *(void *)(v8 + 16) = v13 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v0 + 32))(v8+ ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80))+ *(void *)(v0 + 72) * v13, v2, v16);

    if (v6 == v7) {
      break;
    }
    BOOL v14 = __OFADD__(v7++, 1);
    uint64_t v4 = v9;
    if (v14)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
}

uint64_t LocaleUtils.deinit()
{
  return v0;
}

uint64_t LocaleUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_21EDE9878(char a1, int64_t a2, char a3, uint64_t a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA7598);
  uint64_t v10 = *(void *)(sub_21EDEC560() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_21EDEC730();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_21EDEC560() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_21EDEC0C8(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21EDE9AF4(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t type metadata accessor for LocaleUtils()
{
  return self;
}

uint64_t method lookup function for LocaleUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocaleUtils);
}

uint64_t dispatch thunk of static LocaleUtils.getSupportedLocalesList()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_21EDE9AF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_21EDEC560() - 8);
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
  uint64_t result = sub_21EDEC750();
  __break(1u);
  return result;
}

MorphunSwift::ConfigurationFeature_optional __swiftcall ConfigurationFeature.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 13;
  if ((unint64_t)rawValue < 0xD) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (MorphunSwift::ConfigurationFeature_optional)rawValue;
}

uint64_t ConfigurationFeature.rawValue.getter()
{
  return *v0;
}

MorphunSwift::ConfigurationFeature_optional sub_21EDE9C70(Swift::Int *a1)
{
  return ConfigurationFeature.init(rawValue:)(*a1);
}

uint64_t sub_21EDE9C78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ConfigurationFeature.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21EDE9CA0(uint64_t a1, uint64_t a2)
{
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_21EDE6E60(v2, a1, a2);
  if (!v3)
  {
    uint64_t v7 = result;
    type metadata accessor for TokenChain();
    swift_allocObject();
    return sub_21EDE7CD0(v7);
  }
  return result;
}

uint64_t sub_21EDE9D20()
{
  swift_retain();
  swift_retain();
  uint64_t result = sub_21EDE702C();
  if (!v0)
  {
    uint64_t v2 = result;
    type metadata accessor for TokenChain();
    swift_allocObject();
    return sub_21EDE7CD0(v2);
  }
  return result;
}

uint64_t ConfigurableAnalyzer.deinit()
{
  swift_release();
  return v0;
}

uint64_t ConfigurableAnalyzer.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t DefaultAnalyzerFactory.__allocating_init(configOptions:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DefaultAnalyzerFactory.init(configOptions:)(a1);
  return v2;
}

uint64_t DefaultAnalyzerFactory.init(configOptions:)(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = v1;
    CFErrorRef err = (CFErrorRef)MEMORY[0x263F8EE78];
    sub_21EDEA3A8(0, v4, 0);
    uint64_t v6 = 0;
    CFErrorRef v7 = err;
    unint64_t v8 = *((void *)err + 2);
    do
    {
      unsigned int v9 = *(unsigned __int8 *)(a1 + v6 + 32);
      BOOL v10 = v9 > 0x40;
      if (v9 >= 0x40) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 1 << v9;
      }
      if (v10) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
      unint64_t v13 = *((void *)err + 3);
      if (v8 >= v13 >> 1) {
        sub_21EDEA3A8((char *)(v13 > 1), v8 + 1, 1);
      }
      ++v6;
      *((void *)err + 2) = v8 + 1;
      *((void *)err + v8++ + 4) = v12;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    uint64_t v2 = v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    CFErrorRef v7 = (CFErrorRef)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = *((void *)v7 + 2);
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = (uint64_t *)((char *)v7 + 32);
    do
    {
      uint64_t v17 = *v16++;
      v15 |= v17;
      --v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = mdaf_create();
  if (v18)
  {
    *(void *)(v2 + 16) = v18;
  }
  else
  {
    sub_21EDE948C();
    swift_allocError();
    *(void *)uint64_t v19 = 0xD00000000000002BLL;
    *(void *)(v19 + 8) = 0x800000021EDED560;
    *(unsigned char *)(v19 + 16) = 0;
    swift_willThrow();
    type metadata accessor for DefaultAnalyzerFactory();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

uint64_t DefaultAnalyzerFactory.__allocating_init()()
{
  if (qword_267EA7540 != -1) {
    swift_once();
  }
  type metadata accessor for DefaultAnalyzerFactory();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = swift_bridgeObjectRetain();
  DefaultAnalyzerFactory.init(configOptions:)(v1);
  return v0;
}

uint64_t sub_21EDEA134()
{
  sub_21EDE6A50((void (*)(uint64_t *__return_ptr, CFErrorRef *))sub_21EDEA3EC);
  if (!v1)
  {
    uint64_t v3 = v2;
    type metadata accessor for ConfigurableAnalyzer();
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = v3;
    *(void *)(v1 + 24) = v0;
    swift_retain();
  }
  return v1;
}

void sub_21EDEA1AC(uint64_t *a1@<X8>)
{
  uint64_t v2 = (void *)sub_21EDEC540();
  uint64_t Analyzer = mdaf_getAnalyzer();

  *a1 = Analyzer;
}

void sub_21EDEA204()
{
  qword_267EA75A0 = (uint64_t)&unk_26D076228;
}

uint64_t static DefaultAnalyzerFactory.defaultFeatureConfig.getter()
{
  if (qword_267EA7540 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t DefaultAnalyzerFactory.deinit()
{
  mdaf_destroy();
  return v0;
}

uint64_t DefaultAnalyzerFactory.__deallocating_deinit()
{
  mdaf_destroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void *sub_21EDEA2CC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_21EDEC750();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

char *sub_21EDEA3A8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_21EDEA6F4(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for DefaultAnalyzerFactory()
{
  return self;
}

void sub_21EDEA3EC(uint64_t *a1@<X8>)
{
}

uint64_t type metadata accessor for ConfigurableAnalyzer()
{
  return self;
}

unint64_t sub_21EDEA41C()
{
  unint64_t result = qword_267EA75A8;
  if (!qword_267EA75A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA75A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConfigurationFeature(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConfigurationFeature(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21EDEA5BCLL);
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

ValueMetadata *type metadata accessor for ConfigurationFeature()
{
  return &type metadata for ConfigurationFeature;
}

uint64_t method lookup function for ConfigurableAnalyzer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfigurableAnalyzer);
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeString(string:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeTokenChain(tokenChain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t method lookup function for DefaultAnalyzerFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultAnalyzerFactory);
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.__allocating_init(configOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.getAnalyzer(locale:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

char *sub_21EDEA6F4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3D7E8);
    BOOL v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    BOOL v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_21EDEC1BC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21EDEA2CC(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void registerDataPathForLocale(locale:path:)()
{
  sub_21EDE7484((void (*)(char *__return_ptr, CFErrorRef *))sub_21EDEA838);
}

void sub_21EDEA838(unsigned char *a1@<X8>)
{
}

void registerDataPathForLocaleWithError(locale:path:)()
{
  sub_21EDE7484((void (*)(char *__return_ptr, CFErrorRef *))sub_21EDEAC34);
}

void sub_21EDEA898(unsigned char *a1@<X8>)
{
  int v2 = (void *)sub_21EDEC540();
  int v3 = (void *)sub_21EDEC5D0();
  mdr_registerDataPathForLocale();

  *a1 = 0;
}

uint64_t getDataPathForLocale(locale:)()
{
  sub_21EDE6A50((void (*)(uint64_t *__return_ptr, CFErrorRef *))sub_21EDEA9D8);
  uint64_t v1 = v0;
  uint64_t v2 = sub_21EDEC5E0();

  return v2;
}

void sub_21EDEA98C(uint64_t *a1@<X8>)
{
  uint64_t v2 = (void *)sub_21EDEC540();
  uint64_t DataPathForLocaleCopy = mdr_getDataPathForLocaleCopy();

  *a1 = DataPathForLocaleCopy;
}

void sub_21EDEA9D8(uint64_t *a1@<X8>)
{
}

uint64_t sub_21EDEA9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_21EDEC560();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388]();
  BOOL v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_bridgeObjectRetain();
  sub_21EDEC530();
  unint64_t v13 = v10;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  sub_21EDE7484((void (*)(char *__return_ptr, CFErrorRef *))sub_21EDEAC34);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v6);
}

uint64_t sub_21EDEAAE8()
{
  uint64_t v0 = sub_21EDEC560();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388]();
  unsigned int v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_21EDEC530();
  uint64_t v5 = getDataPathForLocale(locale:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return v5;
}

uint64_t Assets.deinit()
{
  return v0;
}

uint64_t Assets.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Assets()
{
  return self;
}

uint64_t method lookup function for Assets(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Assets);
}

uint64_t dispatch thunk of static Assets.setPathForMorphun(language:path:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static Assets.getPathFromMorphun(language:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

BOOL sub_21EDEAC54(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21EDEAC68()
{
  return sub_21EDEC7C0();
}

uint64_t sub_21EDEACB0()
{
  return sub_21EDEC7B0();
}

uint64_t sub_21EDEACDC()
{
  return sub_21EDEC7C0();
}

MorphunSwift::LogLevel_optional __swiftcall LogLevel.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (MorphunSwift::LogLevel_optional)rawValue;
}

void *static LogLevel.allCases.getter()
{
  return &unk_26D0762D0;
}

uint64_t LogLevel.rawValue.getter()
{
  return *v0;
}

uint64_t sub_21EDEAD48()
{
  return sub_21EDEAC68();
}

uint64_t sub_21EDEAD64()
{
  return sub_21EDEACDC();
}

MorphunSwift::LogLevel_optional sub_21EDEAD80(Swift::Int *a1)
{
  return LogLevel.init(rawValue:)(*a1);
}

uint64_t sub_21EDEAD88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LogLevel.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_21EDEADB0(void *a1@<X8>)
{
  *a1 = &unk_26D0762D0;
}

uint64_t sub_21EDEADC0()
{
  sub_21EDEC6D0();
  sub_21EDEC6C0();
  return v0;
}

uint64_t sub_21EDEAE1C()
{
  sub_21EDEADC0();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21EDEAE50()
{
  uint64_t v0 = sub_21EDEC590();
  __swift_allocate_value_buffer(v0, qword_267EA8000);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EA8000);
  return sub_21EDEC580();
}

void sub_21EDEAECC(uint64_t a1, Swift::Int rawValue, const UChar *a3, const UChar *a4)
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    LogLevel.init(rawValue:)(rawValue);
    if (v25 == 6)
    {
      uint64_t v7 = qword_267EA7548;
      swift_unknownObjectRetain();
      if (v7 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_21EDEC590();
      __swift_project_value_buffer(v8, (uint64_t)qword_267EA8000);
      uint64_t v9 = sub_21EDEC570();
      os_log_type_t v10 = sub_21EDEC670();
      if (!os_log_type_enabled(v9, v10)) {
        goto LABEL_25;
      }
      size_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)size_t v11 = 0;
      uint64_t v12 = "Error in morphun logging: Invalid log level passed by morphun";
LABEL_24:
      _os_log_impl(&dword_21EDE5000, v9, v10, v12, v11, 2u);
      MEMORY[0x223C3B3F0](v11, -1, -1);
LABEL_25:

      swift_unknownObjectRelease();
      return;
    }
    if (a3)
    {
      swift_unknownObjectRetain();
      u_strlen(a3);
      uint64_t v16 = sub_21EDEC5C0();
      a3 = v17;
      if (a4)
      {
LABEL_16:
        u_strlen(a4);
        uint64_t v18 = sub_21EDEC5C0();
        uint64_t v20 = v19;
        Objectuint64_t Type = swift_getObjectType();
        char v24 = v25;
        (*(void (**)(char *, uint64_t, const UChar *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(&v24, v16, a3, v18, v20, ObjectType, v6);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      swift_unknownObjectRetain();
      uint64_t v16 = 0;
      if (a4) {
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_267EA7548 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_21EDEC590();
    __swift_project_value_buffer(v22, (uint64_t)qword_267EA8000);
    uint64_t v9 = sub_21EDEC570();
    os_log_type_t v10 = sub_21EDEC670();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_25;
    }
    size_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)size_t v11 = 0;
    uint64_t v12 = "Error in morphun logging: Morphun log message is found to be null";
    goto LABEL_24;
  }
  if (qword_267EA7548 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_21EDEC590();
  __swift_project_value_buffer(v13, (uint64_t)qword_267EA8000);
  oslog = sub_21EDEC570();
  os_log_type_t v14 = sub_21EDEC670();
  if (os_log_type_enabled(oslog, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21EDE5000, oslog, v14, "Error in morphun logging: loggerDelegateCPtr is null", v15, 2u);
    MEMORY[0x223C3B3F0](v15, -1, -1);
  }
}

uint64_t sub_21EDEB250()
{
  uint64_t v0 = sub_21EDEC690();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EDEC680();
  MEMORY[0x270FA5388]();
  sub_21EDEC5B0();
  MEMORY[0x270FA5388]();
  sub_21EDEC3D8();
  sub_21EDEC5A0();
  v5[1] = MEMORY[0x263F8EE78];
  sub_21EDEC418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA7668);
  sub_21EDEC468((unint64_t *)&unk_267EA7670, &qword_267EA7668);
  sub_21EDEC6F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_21EDEC6B0();
  qword_267EA8018 = result;
  return result;
}

void sub_21EDEB474()
{
  qword_267EA8020 = MEMORY[0x263F8EE78];
}

uint64_t sub_21EDEB488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (qword_267EA7558 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_unknownObjectRetain();
  unint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_21EDEB5F0(v6, a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  uint64_t v9 = 0;
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EA7650);
    uint64_t v9 = swift_allocObject();
    swift_unknownObjectRetain();
    os_log_type_t v10 = (void *)swift_slowAlloc();
    *(void *)(v9 + 16) = v10;
    void *v10 = a1;
    v10[1] = a2;
    swift_beginAccess();
    uint64_t v11 = swift_retain();
    MEMORY[0x223C3ADC0](v11);
    sub_21EDEC09C(*(void *)((qword_267EA8020 & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_21EDEC650();
    sub_21EDEC630();
    uint64_t result = swift_endAccess();
  }
  *a3 = v9;
  return result;
}

uint64_t sub_21EDEB5F0(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_21EDEC740())
  {
    uint64_t v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x223C3AEA0](v5 - 4, a1);
      }
      else
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5);
        swift_retain();
      }
      uint64_t v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if (**(void **)(v6 + 16) == a2)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v6;
      }
      swift_release();
      ++v5;
      if (v7 == v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21EDEB704@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (qword_267EA7558 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_unknownObjectRetain();
  unint64_t v4 = swift_bridgeObjectRetain();
  unint64_t v5 = sub_21EDEB810(v4, a1);
  char v7 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v9 = 0;
  if ((v7 & 1) == 0)
  {
    swift_beginAccess();
    sub_21EDEB908(v5);
    uint64_t v9 = v10;
    uint64_t result = swift_endAccess();
  }
  *a2 = v9;
  return result;
}

uint64_t sub_21EDEB810(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21EDEC740();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      uint64_t v6 = (a1 & 0xC000000000000001) != 0 ? MEMORY[0x223C3AEA0](v5, a1) : swift_retain();
      uint64_t v7 = **(void **)(v6 + 16);
      swift_release();
      if (v7 == a2) {
        break;
      }
      uint64_t v8 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      ++v5;
      if (v8 == v4)
      {
        uint64_t v5 = 0;
        break;
      }
    }
  }
  swift_unknownObjectRelease();
  return v5;
}

void sub_21EDEB908(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_21EDEC2C0(v3);
    unint64_t v3 = v5;
    unint64_t *v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)(v6 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    sub_21EDEC22C((char *)(v6 + 8 * a1 + 40), v7 - 1 - a1, (char *)(v6 + 8 * a1 + 32));
    *(void *)(v6 + 16) = v8;
    sub_21EDEC630();
  }
}

void static LoggerConfig.setLogLevel(logLevel:)()
{
}

MorphunSwift::LogLevel_optional static LoggerConfig.getLogLevel()()
{
  Swift::Int LogLevel = mlogc_getLogLevel();
  return LogLevel.init(rawValue:)(LogLevel);
}

void static LoggerConfig.logToConsole(value:)()
{
}

uint64_t static LoggerConfig.registerLogger(loggerDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_21EDEBC4C(a1, a2, (uint64_t)sub_21EDEBBEC, (uint64_t (*)(void))sub_21EDE6C90) & 1;
}

uint64_t sub_21EDEBBEC@<X0>(uint64_t *a1@<X8>)
{
  return sub_21EDEB488(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t static LoggerConfig.unregisterLogger(loggerDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_21EDEBC4C(a1, a2, (uint64_t)sub_21EDEBD54, (uint64_t (*)(void))sub_21EDE6D84) & 1;
}

uint64_t sub_21EDEBC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (qword_267EA7550 != -1) {
    swift_once();
  }
  MEMORY[0x270FA5388]();
  id v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EA75B0);
  sub_21EDEC6A0();

  char v7 = v9;
  if (v9) {
    char v7 = a4();
  }
  return v7 & 1;
}

uint64_t sub_21EDEBD54@<X0>(void *a1@<X8>)
{
  return sub_21EDEB704(*(void *)(v1 + 16), a1);
}

uint64_t LoggerConfig.deinit()
{
  return v0;
}

uint64_t LoggerConfig.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_21EDEBD8C()
{
  unint64_t result = qword_267EA75B8;
  if (!qword_267EA75B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA75B8);
  }
  return result;
}

uint64_t sub_21EDEBDD8()
{
  return sub_21EDEC468(&qword_267EA75C0, qword_267EA75C8);
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

uint64_t getEnumTagSinglePayload for LogLevel(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for LogLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x21EDEBFB0);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LogLevel()
{
  return &type metadata for LogLevel;
}

uint64_t dispatch thunk of LoggerDelegate.log(logLevel:category:message:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_21EDEC000()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MemoryManagedPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for LoggerConfig()
{
  return self;
}

uint64_t method lookup function for LoggerConfig(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LoggerConfig);
}

uint64_t sub_21EDEC09C(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

uint64_t sub_21EDEC0C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v7 = OUTLINED_FUNCTION_1_0();
    __break(1u);
    return MEMORY[0x270FA01D0](v7);
  }
  if (a3 < a1 || (uint64_t result = sub_21EDEC560(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    sub_21EDEC560();
    uint64_t v8 = OUTLINED_FUNCTION_2_0();
    return MEMORY[0x270FA01D8](v8);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = OUTLINED_FUNCTION_2_0();
    return MEMORY[0x270FA01D0](v7);
  }
  return result;
}

char *sub_21EDEC1BC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    __src = (char *)OUTLINED_FUNCTION_1_0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_21EDEC22C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21EDEC750();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_21EDEC2C0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21EDEC740();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x223C3AEB0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_21EDEC3D8()
{
  unint64_t result = qword_267EA7658;
  if (!qword_267EA7658)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EA7658);
  }
  return result;
}

unint64_t sub_21EDEC418()
{
  unint64_t result = qword_267EA7660;
  if (!qword_267EA7660)
  {
    sub_21EDEC680();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EA7660);
  }
  return result;
}

uint64_t sub_21EDEC468(unint64_t *a1, uint64_t *a2)
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_21EDEC750();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t sub_21EDEC530()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_21EDEC540()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_21EDEC550()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_21EDEC560()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21EDEC570()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21EDEC580()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21EDEC590()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21EDEC5A0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21EDEC5B0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21EDEC5C0()
{
  return MEMORY[0x270EF18B8]();
}

uint64_t sub_21EDEC5D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21EDEC5E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21EDEC5F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21EDEC600()
{
  return MEMORY[0x270F9D958]();
}

uint64_t sub_21EDEC610()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_21EDEC620()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21EDEC630()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21EDEC650()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21EDEC660()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_21EDEC670()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21EDEC680()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21EDEC690()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21EDEC6A0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_21EDEC6B0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21EDEC6C0()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_21EDEC6D0()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_21EDEC6E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21EDEC6F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21EDEC700()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21EDEC710()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21EDEC720()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21EDEC730()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21EDEC740()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21EDEC750()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21EDEC760()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21EDEC770()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21EDEC780()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21EDEC790()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21EDEC7A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21EDEC7B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21EDEC7C0()
{
  return MEMORY[0x270F9FC90]();
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

uint64_t mca_createTokenChain()
{
  return MEMORY[0x270F99FF8]();
}

uint64_t mdaf_create()
{
  return MEMORY[0x270F9A000]();
}

uint64_t mdaf_destroy()
{
  return MEMORY[0x270F9A008]();
}

uint64_t mdaf_getAnalyzer()
{
  return MEMORY[0x270F9A010]();
}

uint64_t mdr_getDataPathForLocaleCopy()
{
  return MEMORY[0x270F9A018]();
}

uint64_t mdr_registerDataPathForLocale()
{
  return MEMORY[0x270F9A020]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t mloc_getSupportedLocalesList()
{
  return MEMORY[0x270F9A028]();
}

uint64_t mlogc_getLogLevel()
{
  return MEMORY[0x270F9A030]();
}

uint64_t mlogc_logToConsole()
{
  return MEMORY[0x270F9A038]();
}

uint64_t mlogc_registerLogger()
{
  return MEMORY[0x270F9A040]();
}

uint64_t mlogc_setLogLevel()
{
  return MEMORY[0x270F9A048]();
}

uint64_t mlogc_unregisterLogger()
{
  return MEMORY[0x270F9A050]();
}

uint64_t mtok_createTokenizer()
{
  return MEMORY[0x270F9A058]();
}

uint64_t mtok_destroy()
{
  return MEMORY[0x270F9A060]();
}

uint64_t mtok_getEndChar()
{
  return MEMORY[0x270F9A068]();
}

uint64_t mtok_getNext()
{
  return MEMORY[0x270F9A070]();
}

uint64_t mtok_getStartChar()
{
  return MEMORY[0x270F9A078]();
}

uint64_t mtok_getType()
{
  return MEMORY[0x270F9A080]();
}

uint64_t mtok_setStyle()
{
  return MEMORY[0x270F9A088]();
}

uint64_t mtokc_compare()
{
  return MEMORY[0x270F9A090]();
}

uint64_t mtokc_destroy()
{
  return MEMORY[0x270F9A098]();
}

uint64_t mtokc_getHead()
{
  return MEMORY[0x270F9A0A0]();
}

uint64_t mtokc_getSize()
{
  return MEMORY[0x270F9A0A8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x270F995C0](s);
}