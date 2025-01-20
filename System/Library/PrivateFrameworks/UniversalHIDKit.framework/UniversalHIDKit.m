uint64_t sub_260899518()
{
  return sub_2608996A0(&qword_26A8C0418, (unint64_t *)&qword_26A8C0420);
}

uint64_t sub_26089955C()
{
  return sub_260899580();
}

uint64_t sub_260899580()
{
  id v1 = objc_msgSend(v0, sel_allPresses);
  sub_2608996E4(0, (unint64_t *)&qword_26A8C0420);
  sub_2608996A0((unint64_t *)&qword_26A8C0450, (unint64_t *)&qword_26A8C0420);
  uint64_t v2 = sub_2608A2770();

  return v2;
}

uint64_t sub_260899628(uint64_t a1)
{
  return sub_2608998B0(a1);
}

uint64_t sub_26089964C(uint64_t a1)
{
  uint64_t result = sub_2608996A0(&qword_26A8C0428, &qword_26A8C0430);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2608996A0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2608996E4(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2608996E4(uint64_t a1, unint64_t *a2)
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

uint64_t dispatch thunk of UIPressesEventProtocol.allPresses.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UIPressesEventProtocol.presses(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_260899748(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_260899794(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2608997B4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

void type metadata accessor for TouchType(uint64_t a1)
{
}

void sub_260899814(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_260899860()
{
  unint64_t result = qword_26A8C0448;
  if (!qword_26A8C0448)
  {
    type metadata accessor for TouchType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0448);
  }
  return result;
}

uint64_t sub_2608998B0(uint64_t a1)
{
  id v2 = objc_msgSend(v1, sel_pressesForGestureRecognizer_, a1);
  sub_2608996E4(0, (unint64_t *)&qword_26A8C0420);
  sub_2608996A0((unint64_t *)&qword_26A8C0450, (unint64_t *)&qword_26A8C0420);
  uint64_t v3 = sub_2608A2770();

  return v3;
}

BOOL sub_26089995C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_260899968(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_260899978()
{
  return sub_260899980();
}

uint64_t sub_260899980()
{
  return sub_2608A2980();
}

uint64_t sub_2608999C8()
{
  return sub_2608999D0();
}

uint64_t sub_2608999D0()
{
  return sub_2608A2970();
}

uint64_t sub_2608999F8()
{
  return sub_260899A00();
}

uint64_t sub_260899A00()
{
  return sub_2608A2980();
}

BOOL sub_260899A44(uint64_t *a1, uint64_t *a2)
{
  return sub_26089995C(*a1, *a2);
}

void sub_260899A50(uint64_t a1@<X8>)
{
  sub_260899A84();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_260899A8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of EventTranslator.eventMask.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EventTranslator.translateEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t UIEventProtocol.asPressesEvent.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int v8 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a2, v8 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

id UIEvent.senderID.getter()
{
  id result = objc_msgSend(v0, sel__hidEvent);
  if (result)
  {
    id v2 = result;
    char v3 = (void *)MEMORY[0x26121DF40]();

    id v4 = objc_msgSend(v3, sel_senderID);
    return v4;
  }
  return result;
}

uint64_t UIEvent.asPressesEvent.getter()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1) {
    id v2 = v0;
  }
  return v1;
}

uint64_t sub_260899CC4()
{
  return sub_2608996A0(&qword_26A8C0458, &qword_26A8C0430);
}

uint64_t sub_260899D08()
{
  return sub_2608996A0(&qword_26A8C0460, (unint64_t *)&qword_26A8C0468);
}

id sub_260899D4C()
{
  return sub_260899D70();
}

id sub_260899D70()
{
  return objc_msgSend(v0, sel_type);
}

id sub_260899D80()
{
  return sub_260899DA4();
}

id sub_260899DA4()
{
  return objc_msgSend(v0, sel_timestamp);
}

uint64_t sub_260899DB4()
{
  return sub_260899DD8();
}

uint64_t sub_260899DD8()
{
  return sub_260899F44(v0);
}

uint64_t sub_260899DE0(uint64_t a1)
{
  return sub_260899E04(a1);
}

uint64_t sub_260899E04(uint64_t a1)
{
  id v2 = objc_msgSend(v1, sel_touchesForGestureRecognizer_, a1);
  if (!v2) {
    return 0;
  }
  char v3 = v2;
  sub_2608996E4(0, (unint64_t *)&qword_26A8C0468);
  sub_2608996A0((unint64_t *)&qword_26A8C0470, (unint64_t *)&qword_26A8C0468);
  uint64_t v4 = sub_2608A2770();

  return v4;
}

id sub_260899EBC()
{
  return UIEvent.senderID.getter();
}

uint64_t dispatch thunk of UIEventProtocol.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of UIEventProtocol.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of UIEventProtocol.allTouches.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of UIEventProtocol.touches(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of UIEventProtocol.senderID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_260899F44(void *a1)
{
  id v1 = objc_msgSend(a1, sel_allTouches);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_2608996E4(0, (unint64_t *)&qword_26A8C0468);
  sub_2608996A0((unint64_t *)&qword_26A8C0470, (unint64_t *)&qword_26A8C0468);
  uint64_t v3 = sub_2608A2770();

  return v3;
}

uint64_t static UIPressesFilter.== infix(_:_:)(void *a1, void *a2)
{
  sub_26089A05C();
  id v4 = a1;
  id v5 = a2;
  LOBYTE(a1) = sub_2608A2800();

  return a1 & 1;
}

unint64_t sub_26089A05C()
{
  unint64_t result = qword_26A8C0478;
  if (!qword_26A8C0478)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8C0478);
  }
  return result;
}

uint64_t sub_26089A09C(void **a1, void **a2)
{
  return static UIPressesFilter.== infix(_:_:)(*a1, *a2);
}

void **initializeBufferWithCopyOfBuffer for UIPressesFilter(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for UIPressesFilter(id *a1)
{
}

void **assignWithCopy for UIPressesFilter(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for UIPressesFilter(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for UIPressesFilter(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 8))
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

uint64_t storeEnumTagSinglePayload for UIPressesFilter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_26089A1D4()
{
  return 0;
}

ValueMetadata *type metadata accessor for UIPressesFilter()
{
  return &type metadata for UIPressesFilter;
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t EventModifiers.rawValue.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*EventModifiers.rawValue.modify())(void)
{
  return nullsub_1;
}

uint64_t static EventModifiers.capsLock.getter()
{
  return 1;
}

uint64_t static EventModifiers.shift.getter()
{
  return 2;
}

uint64_t static EventModifiers.control.getter()
{
  return 4;
}

uint64_t static EventModifiers.option.getter()
{
  return 8;
}

uint64_t static EventModifiers.command.getter()
{
  return 16;
}

uint64_t static EventModifiers.numericPad.getter()
{
  return 32;
}

uint64_t static EventModifiers.help.getter()
{
  return 64;
}

uint64_t static EventModifiers.function.getter()
{
  return 128;
}

uint64_t sub_26089A29C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    LODWORD(v2) = 0;
    uint64_t v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v5 = *v3++;
      int v4 = v5;
      if ((v5 & ~v2) == 0) {
        int v4 = 0;
      }
      uint64_t v2 = v4 | v2;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t static EventModifiers.all.getter()
{
  return 255;
}

unint64_t sub_26089A2FC()
{
  unint64_t result = qword_26A8C0480;
  if (!qword_26A8C0480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0480);
  }
  return result;
}

unint64_t sub_26089A34C()
{
  unint64_t result = qword_26A8C0488;
  if (!qword_26A8C0488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0488);
  }
  return result;
}

unsigned char *sub_26089A398@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_26089A3A8()
{
  unint64_t result = qword_26A8C0490;
  if (!qword_26A8C0490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0490);
  }
  return result;
}

unint64_t sub_26089A3F8()
{
  unint64_t result = qword_26A8C0498;
  if (!qword_26A8C0498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0498);
  }
  return result;
}

uint64_t sub_26089A444@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26089A1D4();
  *a1 = result;
  return result;
}

uint64_t sub_26089A46C@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A49C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26089A49C(unsigned int a1, int a2)
{
  return a2 | a1;
}

uint64_t sub_26089A4A4@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A4D4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26089A4D4(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_26089A4DC@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A50C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26089A50C(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

BOOL sub_26089A514(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_26089A51C(a1, *a2);
}

BOOL sub_26089A51C(unsigned __int8 *a1, unsigned __int8 a2)
{
  int v3 = (*v2 & a2);
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_26089A54C@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A580(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_26089A580(unsigned __int8 a1)
{
  char v2 = *v1;
  if ((*v1 & a1) != 0) {
    *uint64_t v1 = v2 & ~a1;
  }
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_26089A5B0@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A5E4(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_26089A5E4(char a1)
{
  char v2 = *v1;
  *v1 |= a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_26089A60C(unsigned __int8 *a1)
{
  return sub_26089A614(*a1);
}

uint64_t sub_26089A614(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_26089A624(unsigned __int8 *a1)
{
  return sub_26089A62C(*a1);
}

uint64_t sub_26089A62C(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_26089A63C(unsigned __int8 *a1)
{
  return sub_26089A644(*a1);
}

uint64_t sub_26089A644(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_26089A654@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A684(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26089A684(int a1, int a2)
{
  return a2 & ~a1;
}

BOOL sub_26089A68C(char *a1)
{
  return sub_26089A698(*a1, *v1);
}

BOOL sub_26089A698(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_26089A6A8(unsigned __int8 *a1)
{
  return sub_26089A6B4(*a1, *v1);
}

BOOL sub_26089A6B4(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_26089A6C4(unsigned __int8 *a1)
{
  return sub_26089A6D0(*a1, *v1);
}

BOOL sub_26089A6D0(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_26089A6E0()
{
  return sub_26089A6E8(*v0);
}

BOOL sub_26089A6E8(char a1)
{
  return a1 == 0;
}

uint64_t sub_26089A6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_26089A70C(unsigned __int8 *a1)
{
  return sub_26089A714(*a1);
}

uint64_t sub_26089A714(uint64_t result)
{
  *v1 &= ~(_BYTE)result;
  return result;
}

unsigned __int8 *sub_26089A724@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_26089A734(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_26089A740(char *a1, char *a2)
{
  return sub_260899968(*a1, *a2);
}

uint64_t sub_26089A74C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_26089A29C(a1);
  *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for EventModifiers()
{
  return &type metadata for EventModifiers;
}

uint64_t sub_26089A784(char a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_2608A1C94(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v3 = *(void *)(v2 + 24);
  if (*(void *)(v2 + 16) >= v3 >> 1) {
    uint64_t v2 = OUTLINED_FUNCTION_0(v3);
  }
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v5 + 32) = v4 | 0x390000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_3();
    if (v7) {
      uint64_t v2 = OUTLINED_FUNCTION_0(v6);
    }
    OUTLINED_FUNCTION_2();
    *(_DWORD *)(v9 + 32) = v8 | 0xE10000;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_3();
    if (v7) {
      uint64_t v2 = OUTLINED_FUNCTION_0(v10);
    }
    OUTLINED_FUNCTION_2();
    *(_DWORD *)(v12 + 32) = v11 | 0xE00000;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_28;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_3();
  if (v7) {
    uint64_t v2 = OUTLINED_FUNCTION_0(v13);
  }
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v15 + 32) = v14 | 0xE20000;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_28:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_3();
  if (v7) {
    uint64_t v2 = OUTLINED_FUNCTION_0(v16);
  }
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v18 + 32) = v17 | 0xE30000;
  if ((a1 & 0x40) == 0)
  {
LABEL_16:
    if ((a1 & 0x80) == 0) {
      return v2;
    }
    goto LABEL_38;
  }
LABEL_33:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_3();
  if (v7) {
    uint64_t v2 = OUTLINED_FUNCTION_0(v19);
  }
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v21 + 32) = v20 | 0x750000;
  if (a1 < 0)
  {
LABEL_38:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = OUTLINED_FUNCTION_1();
    }
    unint64_t v23 = *(void *)(v2 + 16);
    unint64_t v22 = *(void *)(v2 + 24);
    if (v23 >= v22 >> 1) {
      uint64_t v2 = OUTLINED_FUNCTION_0(v22);
    }
    *(void *)(v2 + 16) = v23 + 1;
    *(_DWORD *)(v2 + 4 * v23 + 32) = 196863;
  }
  return v2;
}

uint64_t OUTLINED_FUNCTION_0@<X0>(unint64_t a1@<X8>)
{
  return sub_2608A1C94(a1 > 1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_2608A1C94(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_2()
{
  *(void *)(v0 + 16) = v1;
}

_UNKNOWN **sub_26089AA00()
{
  return &protocol witness table for UIKey;
}

id sub_26089AA0C()
{
  return sub_26089AA30();
}

id sub_26089AA30()
{
  return objc_msgSend(v0, sel_phase);
}

id sub_26089AA40@<X0>(void *a1@<X8>)
{
  id result = sub_26089AB4C();
  *a1 = result;
  return result;
}

unint64_t sub_26089AA6C(uint64_t a1)
{
  unint64_t result = sub_26089AA94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_26089AA94()
{
  unint64_t result = qword_26A8C0450;
  if (!qword_26A8C0450)
  {
    sub_26089AAE4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0450);
  }
  return result;
}

unint64_t sub_26089AAE4()
{
  unint64_t result = qword_26A8C0420;
  if (!qword_26A8C0420)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8C0420);
  }
  return result;
}

uint64_t dispatch thunk of UIPressProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UIPressProtocol.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

id sub_26089AB4C()
{
  id v1 = objc_msgSend(v0, sel_key);

  return v1;
}

uint64_t EventObserver<A>.init(eventMask:)(uint64_t a1)
{
  uint64_t v53 = sub_2608A26B0();
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v53 - 8);
  MEMORY[0x270FA5388]();
  v51 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2608A3AE0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04A8);
  swift_allocObject();
  unsigned __int16 v4 = sub_26089B1C8();
  uint64_t v5 = sub_26089BF68(&qword_26A8C04B0, &qword_26A8C04A8);
  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04B8);
  swift_allocObject();
  uint64_t v6 = sub_26089B25C();
  uint64_t v7 = sub_26089BF68(&qword_26A8C04C0, &qword_26A8C04B8);
  uint64_t v8 = v7;
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v7;
  uint64_t v9 = MEMORY[0x263F8EE78];
  if ((v4[9] & a1) != 0)
  {
    unint64_t v52 = v7;
    *(void *)&long long v55 = MEMORY[0x263F8EE78];
    swift_retain();
    sub_26089B9D8(0, 1, 1);
    uint64_t v10 = v55;
    unint64_t v12 = *(void *)(v55 + 16);
    unint64_t v11 = *(void *)(v55 + 24);
    if (v12 >= v11 >> 1)
    {
      OUTLINED_FUNCTION_2_0(v11);
      uint64_t v10 = v55;
    }
    *(void *)(v10 + 16) = v12 + 1;
    uint64_t v13 = v10 + 16 * v12;
    *(void *)(v13 + 32) = v4;
    *(void *)(v13 + 40) = v5;
    uint64_t v8 = v52;
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if ((*(void *)(v6 + 40) & a1) != 0)
  {
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v55 = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_26089B9D8(0, *(void *)(v10 + 16) + 1, 1);
      uint64_t v10 = v55;
    }
    unint64_t v16 = *(void *)(v10 + 16);
    unint64_t v15 = *(void *)(v10 + 24);
    if (v16 >= v15 >> 1)
    {
      OUTLINED_FUNCTION_2_0(v15);
      uint64_t v10 = v55;
    }
    *(void *)(v10 + 16) = v16 + 1;
    uint64_t v48 = v10;
    uint64_t v17 = v10 + 16 * v16;
    *(void *)(v17 + 32) = v6;
    *(void *)(v17 + 40) = v8;
  }
  else
  {
    uint64_t v48 = v10;
  }
  swift_release();
  type metadata accessor for NullService();
  unint64_t v18 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04C8);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = xmmword_2608A3AF0;
  uint64_t v20 = sub_2608A25E0();
  unint64_t v21 = sub_26089B9F8();
  swift_retain();
  *(void *)(v19 + 32) = sub_2608A25D0();
  uint64_t v22 = v19 + 32;
  uint64_t v23 = MEMORY[0x263F84100];
  *(void *)(v19 + 56) = v20;
  *(void *)(v19 + 64) = v23;
  sub_2608A2660();
  OUTLINED_FUNCTION_1_0();
  uint64_t v24 = sub_2608A2650();
  uint64_t v25 = MEMORY[0x263F84140];
  *(void *)(v19 + 96) = v20;
  *(void *)(v19 + 104) = v25;
  *(void *)(v19 + 72) = v24;
  sub_2608A2640();
  OUTLINED_FUNCTION_1_0();
  unint64_t v52 = v21;
  uint64_t v26 = sub_2608A2630();
  uint64_t v27 = MEMORY[0x263F84120];
  *(void *)(v19 + 136) = v20;
  *(void *)(v19 + 144) = v27;
  *(void *)(v19 + 112) = v26;
  if (qword_26A8C0410 != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v28 = v53;
  uint64_t v29 = __swift_project_value_buffer(v53, (uint64_t)qword_26A8C0FC0);
  v30 = v51;
  v31 = (void (*)(char *, uint64_t, uint64_t))*((void *)v50 + 2);
  uint64_t v49 = v29;
  v50 = v31;
  v31(v51, v29, v28);
  uint64_t v32 = sub_2608A25C0();
  swift_allocObject();
  OUTLINED_FUNCTION_1_0();
  uint64_t v33 = sub_2608A25B0();
  uint64_t v34 = MEMORY[0x263F840F8];
  *(void *)(v19 + 176) = v32;
  *(void *)(v19 + 184) = v34;
  *(void *)(v19 + 152) = v33;
  v50(v30, v49, v53);
  uint64_t v35 = sub_2608A2590();
  swift_allocObject();
  OUTLINED_FUNCTION_1_0();
  uint64_t v36 = sub_2608A2580();
  uint64_t v37 = MEMORY[0x263F840E0];
  *(void *)(v19 + 216) = v35;
  *(void *)(v19 + 224) = v37;
  *(void *)(v19 + 192) = v36;
  sub_2608A2530();
  OUTLINED_FUNCTION_1_0();
  uint64_t v53 = v18;
  uint64_t v38 = sub_2608A2520();
  unint64_t v18 = 0;
  uint64_t v39 = MEMORY[0x263F840C8];
  *(void *)(v19 + 256) = v28;
  *(void *)(v19 + 264) = v39;
  *(void *)(v19 + 232) = v38;
  uint64_t v57 = v9;
  do
  {
    if (v18 >= *(void *)(v19 + 16))
    {
      __break(1u);
      goto LABEL_30;
    }
    sub_26089BA80(v22, (uint64_t)&v55);
    __swift_project_boxed_opaque_existential_1(&v55, v56);
    if ((sub_2608A2620() & a1) != 0)
    {
      sub_26089BB28(&v55, (uint64_t)v54);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_26089B9B8(0, *(void *)(v9 + 16) + 1, 1);
      }
      uint64_t v9 = v57;
      unint64_t v41 = *(void *)(v57 + 16);
      unint64_t v40 = *(void *)(v57 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_26089B9B8((void *)(v40 > 1), v41 + 1, 1);
        uint64_t v9 = v57;
      }
      *(void *)(v9 + 16) = v41 + 1;
      sub_26089BB28(v54, v9 + 40 * v41 + 32);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v55);
    }
    ++v18;
    v22 += 40;
  }
  while (v18 != 6);
  swift_setDeallocating();
  sub_26089B90C();
  uint64_t v42 = v57;
  uint64_t v43 = *(void *)(v57 + 16);
  if (v43)
  {
    uint64_t v44 = v57 + 32;
    swift_retain();
    do
    {
      sub_26089BA80(v44, (uint64_t)&v55);
      __swift_project_boxed_opaque_existential_1(&v55, v56);
      sub_2608A2610();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v55);
      v44 += 40;
      --v43;
    }
    while (v43);
    swift_release();
  }
  swift_allocObject();
  uint64_t v45 = sub_26089B2AC(v48, v42);
  swift_release();
  return v45;
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

void *sub_26089B1C8()
{
  v0[2] = 0x3FF0000000000000;
  v0[3] = 0;
  v0[4] = 0;
  v0[5] = 0x3FF0000000000000;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = 0;
  sub_2608A2500();
  sub_2608A2510();
  v0[9] = sub_2608A2510();
  return v0;
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

uint64_t sub_26089B25C()
{
  *(void *)(v0 + 16) = MEMORY[0x263F8EE88];
  *(unsigned char *)(v0 + 24) = -1;
  *(void *)(v0 + 32) = 0;
  sub_2608A24F0();
  sub_2608A2510();
  *(void *)(v0 + 40) = sub_2608A2510();
  return v0;
}

uint64_t sub_26089B2AC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 96) = 0x3FF0000000000000;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 120) = 0x3FF0000000000000;
  *(unsigned char *)(v2 + 144) = -1;
  *(void *)(v2 + 160) = 0;
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04F8);
  *(void *)(v2 + 48) = sub_26089BF68(&qword_26A8C0500, &qword_26A8C04F8);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 80) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0508);
  *(void *)(v2 + 88) = sub_26089BF68(&qword_26A8C0510, &qword_26A8C0508);
  *(void *)(v2 + 56) = a2;
  swift_beginAccess();
  long long v5 = *(_OWORD *)(v2 + 112);
  long long v6 = *(_OWORD *)(v2 + 128);
  v12[0] = *(_OWORD *)(v2 + 96);
  v12[1] = v5;
  v12[2] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_26089B464((uint64_t)v12);
  swift_beginAccess();
  sub_26089B56C(*(unsigned __int8 *)(v2 + 144));
  swift_beginAccess();
  uint64_t v7 = *(void **)(v2 + 152);
  id v8 = v7;
  sub_26089B674(v7);

  swift_beginAccess();
  uint64_t v9 = *(void **)(v2 + 160);
  id v10 = v9;
  sub_26089B780(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_26089B464(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0538);
  uint64_t v3 = sub_2608A26F0();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    long long v5 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v6 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      id v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_26089B56C(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0530);
  uint64_t v3 = sub_2608A26F0();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    long long v5 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v6 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      id v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_26089B674(void *a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0528);
  uint64_t v3 = sub_2608A26F0();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    long long v5 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v6 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      id v8 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      id v9 = a1;
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_26089B780(void *a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0518);
  uint64_t v3 = sub_2608A26F0();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    long long v5 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v6 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      id v8 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      id v9 = a1;
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_26089B88C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0520);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast()) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_26089B90C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0540);
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

char *sub_26089B970(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[4 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_0(a3, result);
  }
  return result;
}

char *sub_26089B990(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[24 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_0_0(a3, result);
  }
  return result;
}

void *sub_26089B9B8(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_26089BBF0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_26089B9D8(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_26089BD18(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

unint64_t sub_26089B9F8()
{
  unint64_t result = qword_26A8C04D0;
  if (!qword_26A8C04D0)
  {
    type metadata accessor for NullService();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C04D0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_26089BA80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_26089BB28(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

void *sub_26089BB90(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_26089BE3C(a1, a2, a3, *v3, &qword_26A8C04D8, &qword_26A8C04E0);
  *long long v3 = result;
  return result;
}

void *sub_26089BBC0(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_26089BE3C(a1, a2, a3, *v3, &qword_26A8C04E8, &qword_26A8C04F0);
  *long long v3 = result;
  return result;
}

void *sub_26089BBF0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04C8);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0540);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_26089BD18(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04A0);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[2 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0520);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_26089BE3C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 24);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || &a4[3 * v11 + 4] <= v13 + 4) {
      memmove(v13 + 4, a4 + 4, 24 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_26089BF68(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_26089BFAC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26089BFEC(a1, &qword_26A8C0518, a2);
}

uint64_t sub_26089BFCC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26089BFEC(a1, &qword_26A8C0528, a2);
}

uint64_t sub_26089BFEC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_26089B88C(*a1, a1[1], a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

uint64_t sub_26089C024@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26089BFEC(a1, &qword_26A8C0530, a2);
}

uint64_t sub_26089C044@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26089BFEC(a1, &qword_26A8C0538, a2);
}

void *OUTLINED_FUNCTION_0_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_retain();
}

void *OUTLINED_FUNCTION_2_0@<X0>(unint64_t a1@<X8>)
{
  return sub_26089B9D8((void *)(a1 > 1), v1, 1);
}

uint64_t DigitizerEventTranslator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  DigitizerEventTranslator.init()();
  return v0;
}

void *DigitizerEventTranslator.init()()
{
  v0[2] = 0x3FF0000000000000;
  v0[3] = 0;
  v0[4] = 0;
  v0[5] = 0x3FF0000000000000;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = 0;
  sub_2608A2500();
  sub_2608A2510();
  v0[9] = sub_2608A2510();
  return v0;
}

__n128 sub_26089C134@<Q0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  long long v3 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

__n128 sub_26089C180(uint64_t a1)
{
  swift_beginAccess();
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

uint64_t (*sub_26089C1CC())()
{
  return j_j__swift_endAccess;
}

void sub_26089C210(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_26089C284((uint64_t)v1);
}

void *sub_26089C240()
{
  swift_beginAccess();
  id v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

void sub_26089C284(uint64_t a1)
{
  swift_beginAccess();
  long long v3 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = a1;
}

uint64_t (*sub_26089C2CC())()
{
  return j__swift_endAccess;
}

uint64_t DigitizerEventTranslator.eventMask.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_26089C31C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  uint64_t v5 = *(void *)(*(void *)v1 + 80);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4)) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = sub_26089C240();
  v48[0] = a1;
  if (v6)
  {
    int64_t v7 = v6;
    uint64_t v8 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 64))(v6, v5, v4);
    if (v8)
    {
LABEL_6:
      uint64_t v12 = v8;

      goto LABEL_13;
    }
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v10 = sub_2608A2730();
    if (MEMORY[0x26121DEC0](v10, AssociatedTypeWitness))
    {
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v8 = sub_26089D6A4(v10, AssociatedTypeWitness, *(void *)(AssociatedConformanceWitness + 8));
      goto LABEL_6;
    }

    goto LABEL_12;
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 56))(v5, v4);
  if (v13)
  {
LABEL_10:
    uint64_t v12 = v13;
    goto LABEL_13;
  }
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = sub_2608A2730();
  if (MEMORY[0x26121DEC0](v15, v14))
  {
    uint64_t v16 = swift_getAssociatedConformanceWitness();
    uint64_t v13 = sub_26089D6A4(v15, v14, *(void *)(v16 + 8));
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v13 = swift_bridgeObjectRelease();
  uint64_t v12 = MEMORY[0x263F8EE88];
LABEL_13:
  uint64_t v49 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v47 = v4;
  uint64_t KeyPath = swift_getKeyPath();
  v48[1] = v48;
  v45[2] = v5;
  v45[3] = v4;
  uint64_t v46 = MEMORY[0x270FA5388](KeyPath);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = sub_2608A2790();
  type metadata accessor for TouchType(0);
  uint64_t v20 = v19;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v23 = sub_26089C964((void (*)(char *, char *))sub_26089DA6C, (uint64_t)v45, v18, v20, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v22);
  swift_release();
  uint64_t v24 = sub_26089CE70(v23);
  uint64_t v25 = sub_26089D540((uint64_t)&unk_270CA7C50);
  char v26 = sub_26089CF14(v24, v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v49 = v12;
  uint64_t v28 = MEMORY[0x263F840F0];
  uint64_t v29 = sub_26089C964((void (*)(char *, char *))sub_26089DA98, v2, v18, MEMORY[0x263F840F0], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v27);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 48))(v5, v4);
  sub_2608A2670();
  sub_2608A2540();
  LODWORD(v46) = 0;
  v30 = (void *)sub_2608A25A0();
  v31 = *(void (**)(uint64_t, uint64_t))(v4 + 72);
  id v32 = v30;
  v31(v5, v4);
  uint64_t v49 = (uint64_t)v32;
  uint64_t v33 = MEMORY[0x263F840E8];
  uint64_t v34 = (void *)MEMORY[0x26121DD50](v28, MEMORY[0x263F840E8]);
  IOHIDEventSetSenderID();

  uint64_t v49 = (uint64_t)v32;
  uint64_t v35 = (void *)MEMORY[0x26121DD50](v28, v33);
  IOHIDEventSetIntegerValue();

  uint64_t v36 = *(void *)(v29 + 16);
  if (v36)
  {
    uint64_t v37 = (void **)(v29 + 32);
    uint64_t v38 = MEMORY[0x263F840F0];
    do
    {
      uint64_t v39 = *v37++;
      uint64_t v49 = (uint64_t)v32;
      id v40 = v39;
      unint64_t v41 = (void *)MEMORY[0x26121DD50](v38, v33);
      uint64_t v49 = (uint64_t)v40;
      uint64_t v42 = (void *)MEMORY[0x26121DD50](v38, v33);
      IOHIDEventAppendEvent();

      --v36;
    }
    while (v36);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_26A8C0548);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_2608A3B40;
  *(void *)(v43 + 32) = v32;
  uint64_t v49 = v43;
  sub_2608A2710();
  return v49;
}

uint64_t sub_26089C8B8@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
  uint64_t v4 = swift_checkMetadataState();
  uint64_t result = v3(v4, AssociatedConformanceWitness);
  *a1 = result;
  return result;
}

uint64_t sub_26089C964(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v31 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  id v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = sub_2608A27B0();
  if (!v20) {
    return sub_2608A2730();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_2608A2920();
  uint64_t v38 = sub_2608A2930();
  sub_2608A28D0();
  uint64_t v42 = a6;
  uint64_t result = sub_2608A27A0();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    id v40 = (void (**)(char *))(v39 + 2);
    unint64_t v41 = v14;
    ++v39;
    while (1)
    {
      uint64_t v23 = (void (*)(char *, void))sub_2608A27D0();
      uint64_t v24 = v12;
      uint64_t v25 = v12;
      uint64_t v26 = AssociatedTypeWitness;
      (*v40)(v24);
      v23(v48, 0);
      uint64_t v27 = v47;
      v44(v25, v46);
      if (v27) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v25, v26);
      sub_2608A2910();
      sub_2608A27C0();
      --v21;
      uint64_t v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_2608A2840();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v49;
      }
    }
    (*v39)(v25, v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

uint64_t sub_26089CDD8(uint64_t a1)
{
  sub_26089DD10();
  uint64_t v2 = sub_2608A2780();
  uint64_t v8 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 34;
    do
    {
      sub_26089DD5C(&v7, *(unsigned int *)(v4 - 2));
      v4 += 4;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    uint64_t v5 = v2;
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_26089CE70(uint64_t a1)
{
  type metadata accessor for TouchType(0);
  sub_26089EE00();
  uint64_t v2 = sub_2608A2780();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = *(void *)(a1 + 8 * i + 32);
      sub_26089DEB8(&v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_26089CF14(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 56;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(result + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }
    if (v13 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 1;
    if (v13 + 1 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 2;
    if (v13 + 2 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 3;
    if (v13 + 3 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v15 = v13 + 4;
    if (v15 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v4 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_35;
        }
        if (v4 >= v9) {
          return 1;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        ++v15;
        if (v14) {
          goto LABEL_24;
        }
      }
    }
    int64_t v4 = v15;
LABEL_24:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    uint64_t v16 = *(void *)(*(void *)(v3 + 48) + 8 * v12);
    sub_2608A2960();
    sub_2608A2970();
    uint64_t result = sub_2608A2980();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    uint64_t v19 = *(void *)(a2 + 48);
  }
  while (*(void *)(v19 + 8 * v18) == v16);
  uint64_t v20 = ~v17;
  while (1)
  {
    unint64_t v18 = (v18 + 1) & v20;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    if (*(void *)(v19 + 8 * v18) == v16) {
      goto LABEL_7;
    }
  }
}

uint64_t sub_26089D10C@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = *(double (**)(void, uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  uint64_t v3 = swift_checkMetadataState();
  CGFloat v4 = v2(0, v3, AssociatedConformanceWitness);
  CGFloat v6 = v5;
  sub_26089C134((uint64_t)&v10);
  CGAffineTransform v9 = v10;
  v11.x = v4;
  v11.y = v6;
  CGPointApplyAffineTransform(v11, &v9);
  sub_26089D31C();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v3, AssociatedConformanceWitness);
  sub_2608A2670();
  sub_2608A2550();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v3, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v3, AssociatedConformanceWitness);
  uint64_t result = sub_2608A25A0();
  *a1 = result;
  return result;
}

uint64_t sub_26089D31C()
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  uint64_t v2 = swift_checkMetadataState();
  unint64_t v3 = v1(v2, AssociatedConformanceWitness);
  return (v3 < 8) & (0xE7u >> v3);
}

uint64_t DigitizerEventTranslator.deinit()
{
  return v0;
}

uint64_t DigitizerEventTranslator.__deallocating_deinit()
{
  DigitizerEventTranslator.deinit();

  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t (*sub_26089D43C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_26089C1CC();
  return sub_26089D494;
}

uint64_t (*sub_26089D4A0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_26089C2CC();
  return sub_26089D494;
}

void sub_26089D4F8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_26089D540(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05E0);
  uint64_t result = sub_2608A2870();
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 56;
  while (v5 < *(void *)(a1 + 16))
  {
    uint64_t v7 = *(void *)(a1 + 32 + 8 * v5);
    sub_2608A2960();
    sub_2608A2970();
    uint64_t result = sub_2608A2980();
    uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
    uint64_t v12 = 1 << v9;
    uint64_t v13 = *(void *)(v3 + 48);
    if (((1 << v9) & v11) != 0)
    {
      if (*(void *)(v13 + 8 * v9) == v7) {
        goto LABEL_13;
      }
      uint64_t v14 = ~v8;
      while (1)
      {
        unint64_t v9 = (v9 + 1) & v14;
        unint64_t v10 = v9 >> 6;
        uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
        uint64_t v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0) {
          break;
        }
        if (*(void *)(v13 + 8 * v9) == v7) {
          goto LABEL_13;
        }
      }
    }
    *(void *)(v6 + 8 * v10) = v12 | v11;
    *(void *)(v13 + 8 * v9) = v7;
    uint64_t v15 = *(void *)(v3 + 16);
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_18;
    }
    *(void *)(v3 + 16) = v17;
LABEL_13:
    if (++v5 == v4) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_26089D6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  unint64_t v9 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v50 = (char *)&v38 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v38 - v13;
  if (MEMORY[0x26121DEB0](v12))
  {
    sub_2608A2880();
    uint64_t v15 = sub_2608A2870();
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F8EE88];
  }
  uint64_t v43 = MEMORY[0x26121DEC0](v5, a2);
  if (v43)
  {
    uint64_t v39 = v7;
    uint64_t v40 = v6;
    uint64_t v16 = 0;
    uint64_t v48 = (uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
    uint64_t v49 = v15 + 56;
    uint64_t v45 = v6 + 32;
    uint64_t v47 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v41 = v5;
    uint64_t v42 = v14;
    while (1)
    {
      char v17 = sub_2608A2740();
      sub_2608A2720();
      if (v17)
      {
        unint64_t v18 = *(uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
        uint64_t result = v18(v14, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v16), a2);
      }
      else
      {
        uint64_t result = sub_2608A2890();
        if (v39 != 8) {
          goto LABEL_24;
        }
        uint64_t v51 = result;
        unint64_t v18 = *v48;
        (*v48)(v14, &v51, a2);
        uint64_t result = swift_unknownObjectRelease();
      }
      BOOL v20 = __OFADD__(v16, 1);
      uint64_t v21 = v16 + 1;
      if (v20) {
        break;
      }
      uint64_t v46 = v21;
      uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v44(v50, v14, a2);
      uint64_t v22 = sub_2608A26C0();
      uint64_t v23 = v15;
      uint64_t v24 = -1 << *(unsigned char *)(v15 + 32);
      unint64_t v25 = v22 & ~v24;
      unint64_t v26 = v25 >> 6;
      uint64_t v27 = *(void *)(v49 + 8 * (v25 >> 6));
      uint64_t v28 = 1 << v25;
      uint64_t v29 = *(void *)(v6 + 72);
      if (((1 << v25) & v27) != 0)
      {
        uint64_t v30 = ~v24;
        while (1)
        {
          v18(v9, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
          uint64_t v31 = a3;
          char v32 = sub_2608A26D0();
          uint64_t v33 = *v47;
          (*v47)(v9, a2);
          if (v32) {
            break;
          }
          unint64_t v25 = (v25 + 1) & v30;
          unint64_t v26 = v25 >> 6;
          uint64_t v27 = *(void *)(v49 + 8 * (v25 >> 6));
          uint64_t v28 = 1 << v25;
          a3 = v31;
          if ((v27 & (1 << v25)) == 0)
          {
            uint64_t v6 = v40;
            uint64_t v5 = v41;
            goto LABEL_14;
          }
        }
        v33(v50, a2);
        a3 = v31;
        uint64_t v6 = v40;
        uint64_t v5 = v41;
        uint64_t v15 = v23;
      }
      else
      {
LABEL_14:
        uint64_t v34 = v50;
        *(void *)(v49 + 8 * v26) = v28 | v27;
        unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
        uint64_t v15 = v23;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v44)(v35, v34, a2);
        uint64_t v36 = *(void *)(v23 + 16);
        BOOL v20 = __OFADD__(v36, 1);
        uint64_t v37 = v36 + 1;
        if (v20) {
          goto LABEL_23;
        }
        *(void *)(v23 + 16) = v37;
      }
      uint64_t v14 = v42;
      uint64_t v16 = v46;
      if (v46 == v43) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t sub_26089DA6C()
{
  return swift_getAtKeyPath();
}

uint64_t sub_26089DA98@<X0>(uint64_t *a1@<X8>)
{
  return sub_26089D10C(a1);
}

double sub_26089DAB8@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_26089C134(a1).n128_u64[0];
  return result;
}

double sub_26089DADC(uint64_t a1)
{
  *(void *)&double result = sub_26089C180(a1).n128_u64[0];
  return result;
}

void *sub_26089DB08@<X0>(void *a1@<X8>)
{
  double result = sub_26089C240();
  *a1 = result;
  return result;
}

uint64_t sub_26089DB44()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DigitizerEventTranslator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DigitizerEventTranslator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DigitizerEventTranslator);
}

uint64_t dispatch thunk of DigitizerEventTranslator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.setter(_OWORD *a1)
{
  uint64_t v2 = *(uint64_t (**)(_OWORD *))(*(void *)v1 + 136);
  long long v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  return v2(v5);
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.translateEvent(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

unint64_t sub_26089DD10()
{
  unint64_t result = qword_26A8C05D0;
  if (!qword_26A8C05D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C05D0);
  }
  return result;
}

uint64_t sub_26089DD5C(_WORD *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_2608A2960();
  swift_bridgeObjectRetain();
  sub_2608A2690();
  uint64_t v6 = sub_2608A2980();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    unsigned int v12 = WORD1(a2);
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_26089E560(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  if ((sub_2608A2680() & 1) == 0)
  {
    uint64_t v9 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v9;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while ((sub_2608A2680() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  uint64_t v11 = (_WORD *)(*(void *)(*v2 + 48) + 4 * v8);
  LOWORD(a2) = *v11;
  LOWORD(v12) = v11[1];
LABEL_8:
  *a1 = a2;
  a1[1] = v12;
  return result;
}

uint64_t sub_26089DEB8(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_2608A2960();
  sub_2608A2970();
  uint64_t v6 = sub_2608A2980();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_26089E6BC(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_26089DFD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05D8);
  uint64_t v3 = sub_2608A2860();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
      char v17 = (__int16 *)(*(void *)(v2 + 48) + 4 * i);
      __int16 v18 = *v17;
      __int16 v19 = v17[1];
      sub_2608A2960();
      sub_2608A2690();
      uint64_t result = sub_2608A2980();
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
      uint64_t v28 = (_WORD *)(*(void *)(v4 + 48) + 4 * v23);
      *uint64_t v28 = v18;
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
                sub_26089E80C(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
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

uint64_t sub_26089E2B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05E0);
  uint64_t result = sub_2608A2860();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      sub_2608A2960();
      sub_2608A2970();
      uint64_t result = sub_2608A2980();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          BOOL v24 = v20 == v23;
          if (v20 == v23) {
            unint64_t v20 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
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
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                sub_26089E80C(0, (unint64_t)(v26 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v26;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v10) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v5];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_26089E560(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_26089DFD8();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_26089E828();
      goto LABEL_14;
    }
    sub_26089EB58();
  }
  uint64_t v8 = *v3;
  sub_2608A2960();
  sub_2608A2690();
  uint64_t result = sub_2608A2980();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t result = sub_2608A2680();
    if (result)
    {
LABEL_13:
      uint64_t result = sub_2608A2950();
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v10;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t result = sub_2608A2680();
        if (result) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v11 + 48) + 4 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    *(void *)(v11 + 16) = v14;
  }
  return result;
}

uint64_t sub_26089E6BC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_26089E2B8();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_26089E9C0();
      goto LABEL_14;
    }
    sub_26089EE50();
  }
  uint64_t v8 = *v3;
  sub_2608A2960();
  sub_2608A2970();
  uint64_t result = sub_2608A2980();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for TouchType(0);
      uint64_t result = sub_2608A2950();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_26089E80C(uint64_t result, uint64_t a2, void *a3)
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

void *sub_26089E828()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2608A2850();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * i) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_26089E9C0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2608A2850();
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_26089EB58()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05D8);
  uint64_t v3 = sub_2608A2860();
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
    unint64_t v17 = (__int16 *)(*(void *)(v2 + 48) + 4 * i);
    __int16 v18 = *v17;
    __int16 v19 = v17[1];
    sub_2608A2960();
    sub_2608A2690();
    uint64_t result = sub_2608A2980();
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
    uint64_t v28 = (_WORD *)(*(void *)(v4 + 48) + 4 * v23);
    *uint64_t v28 = v18;
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

unint64_t sub_26089EE00()
{
  unint64_t result = qword_26A8C05E8;
  if (!qword_26A8C05E8)
  {
    type metadata accessor for TouchType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C05E8);
  }
  return result;
}

uint64_t sub_26089EE50()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C05E0);
  uint64_t result = sub_2608A2860();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    sub_2608A2960();
    sub_2608A2970();
    uint64_t result = sub_2608A2980();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

__n128 OUTLINED_FUNCTION_0_1(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_beginAccess();
}

uint64_t static UITouchesFilter.== infix(_:_:)(void *a1, void *a2)
{
  sub_26089A05C();
  id v4 = a1;
  id v5 = a2;
  LOBYTE(a1) = sub_2608A2800();

  return a1 & 1;
}

uint64_t sub_26089F19C(void **a1, void **a2)
{
  return static UITouchesFilter.== infix(_:_:)(*a1, *a2);
}

ValueMetadata *type metadata accessor for UITouchesFilter()
{
  return &type metadata for UITouchesFilter;
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t KeyboardEventTranslator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  KeyboardEventTranslator.init()();
  return v0;
}

uint64_t sub_26089F22C(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_2608A28E0();
    unint64_t v9 = (unsigned char *)(a3 + 36);
    while (1)
    {
      char v10 = *v9;
      int v11 = *((_DWORD *)v9 - 1);
      char v12 = v10;
      a1(&v13, &v11);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      v9 += 6;
      sub_2608A28B0();
      sub_2608A28F0();
      sub_2608A2900();
      sub_2608A28C0();
      if (!--v6) {
        return v14;
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t KeyboardEventTranslator.init()()
{
  *(void *)(v0 + 16) = MEMORY[0x263F8EE88];
  *(unsigned char *)(v0 + 24) = -1;
  *(void *)(v0 + 32) = 0;
  sub_2608A24F0();
  sub_2608A2510();
  *(void *)(v0 + 40) = sub_2608A2510();
  return v0;
}

uint64_t sub_26089F378()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_26089F380(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_26089F390()
{
  swift_beginAccess();
  uint64_t v1 = sub_26089A784(~*(unsigned char *)(v0 + 24));
  uint64_t v2 = sub_26089CDD8(v1);
  return sub_26089F380(v2);
}

uint64_t sub_26089F3D4()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_26089F408(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1;
  return sub_26089F390();
}

uint64_t (*sub_26089F44C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_2_1();
  return sub_26089F494;
}

uint64_t sub_26089F494(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_26089F390();
  }
  return result;
}

void sub_26089F4C8(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_26089F53C((uint64_t)v1);
}

void *sub_26089F4F8()
{
  swift_beginAccess();
  id v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void sub_26089F53C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*sub_26089F584())()
{
  return j__swift_endAccess;
}

uint64_t KeyboardEventTranslator.eventMask.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_26089F5D0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v2 + 88);
  uint64_t v5 = *(void *)(*(void *)v2 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_2608A2810();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)v27 - v11;
  OUTLINED_FUNCTION_0_2();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v27 - v16;
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4) != 4) {
    return MEMORY[0x263F8EE78];
  }
  v27[0] = v14;
  UIEventProtocol.asPressesEvent.getter(v5, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    return MEMORY[0x263F8EE78];
  }
  (*(void (**)(char *, char *, uint64_t))(v27[0] + 32))(v17, v12, AssociatedTypeWitness);
  unint64_t v19 = sub_26089F4F8();
  if (v19)
  {
    unint64_t v20 = v19;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v22 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v20, AssociatedTypeWitness, AssociatedConformanceWitness);
  }
  else
  {
    uint64_t v23 = swift_getAssociatedConformanceWitness();
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 32))(AssociatedTypeWitness, v23);
  }
  v27[3] = v22;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_2608A2790();
  __swift_instantiateConcreteTypeFromMangledName(qword_26A8C05F0);
  swift_getWitnessTable();
  uint64_t v24 = sub_2608A26F0();
  uint64_t v25 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v25);
  v27[-4] = v5;
  v27[-3] = v4;
  v27[-2] = a1;
  v27[-1] = v17;
  uint64_t v18 = sub_26089F22C((void (*)(uint64_t *__return_ptr, int *))sub_2608A0020, (uint64_t)&v27[-6], v24);
  (*(void (**)(char *, uint64_t))(v27[0] + 8))(v17, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_26089F9B0@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v25 = a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v27 = sub_2608A2810();
  uint64_t v4 = *(void *)(v27 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v27);
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  uint64_t v11 = swift_checkMetadataState();
  v10(v11, AssociatedConformanceWitness);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v27);
  }
  else
  {
    uint64_t v13 = v26;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v9, v7, AssociatedTypeWitness);
    uint64_t v14 = v9;
    uint64_t v15 = 0x100000000;
    switch((*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v11, AssociatedConformanceWitness))
    {
      case 0:
        break;
      case 3:
      case 4:
        uint64_t v15 = 0;
        break;
      default:
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v14, AssociatedTypeWitness);
        goto LABEL_10;
    }
    uint64_t v16 = swift_getAssociatedConformanceWitness();
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
    uint64_t v18 = v17(AssociatedTypeWitness, v16);
    int v19 = v17(AssociatedTypeWitness, v16);
    if (v18 == 3) {
      uint64_t v20 = 255;
    }
    else {
      uint64_t v20 = 7;
    }
    uint64_t v21 = sub_26089F378();
    char v22 = sub_26089FDC0(v20 | (v19 << 16), v21);
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v14, AssociatedTypeWitness);
    if ((v22 & 1) == 0)
    {
      uint64_t v23 = v15 | (v19 << 16) | v20;
      goto LABEL_11;
    }
  }
LABEL_10:
  uint64_t v23 = 0x200000000;
LABEL_11:
  uint64_t v24 = v28;
  *uint64_t v28 = v23;
  *((unsigned char *)v24 + 4) = BYTE4(v23);
  return result;
}

uint64_t sub_26089FDA4@<X0>(_DWORD *a1@<X8>)
{
  return sub_26089F9B0(v1, a1);
}

uint64_t sub_26089FDC0(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    goto LABEL_9;
  }
  sub_2608A2960();
  sub_2608A2690();
  uint64_t v3 = sub_2608A2980();
  uint64_t v4 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v5 = v3 & ~v4;
  uint64_t v6 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
    goto LABEL_9;
  }
  if (sub_2608A2680())
  {
    char v7 = 1;
    return v7 & 1;
  }
  uint64_t v8 = ~v4;
  unint64_t v9 = (v5 + 1) & v8;
  if (((*(void *)(v6 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_9:
    char v7 = 0;
    return v7 & 1;
  }
  do
  {
    char v7 = sub_2608A2680();
    if (v7) {
      break;
    }
    unint64_t v9 = (v9 + 1) & v8;
  }
  while (((*(void *)(v6 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  return v7 & 1;
}

void sub_26089FEC4(uint64_t a1@<X3>, uint64_t a2@<X4>, void *a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  sub_2608A2670();
  sub_2608A2560();
  uint64_t v4 = (void *)sub_2608A2570();
  swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  id v7 = v4;
  uint64_t v8 = swift_checkMetadataState();
  v6(v8, v5);
  unint64_t v9 = (void *)MEMORY[0x26121DD50](MEMORY[0x263F840D8], MEMORY[0x263F840D0]);
  IOHIDEventSetSenderID();

  *a3 = v7;
}

void sub_2608A0020(void *a1@<X8>)
{
  sub_26089FEC4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t KeyboardEventTranslator.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t KeyboardEventTranslator.__deallocating_deinit()
{
  KeyboardEventTranslator.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t (*sub_2608A00B0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_26089F44C((uint64_t)v2);
  return sub_26089D494;
}

uint64_t (*sub_2608A0110(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_26089F584();
  return sub_26089D494;
}

uint64_t sub_2608A0168@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26089F3D4();
  *a1 = result;
  return result;
}

uint64_t sub_2608A0194(char *a1)
{
  return sub_26089F408(*a1);
}

void *sub_2608A01C4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_26089F4F8();
  *a1 = result;
  return result;
}

uint64_t sub_2608A01FC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for KeyboardEventTranslator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for KeyboardEventTranslator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for KeyboardEventTranslator);
}

uint64_t dispatch thunk of KeyboardEventTranslator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.translateEvent(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_2608A03C0()
{
  return MEMORY[0x270FA0128](*v0, 0);
}

uint64_t sub_2608A03F0()
{
  return 0;
}

double sub_2608A03F8@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_2608A0404()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for NullService()
{
  return self;
}

double sub_2608A043C@<D0>(_OWORD *a1@<X8>)
{
  return sub_2608A03F8(a1);
}

uint64_t sub_2608A0454()
{
  uint64_t v0 = sub_2608A26B0();
  __swift_allocate_value_buffer(v0, qword_26A8C0FC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A8C0FC0);
  return sub_2608A26A0();
}

uint64_t EventObserver.__allocating_init<A, B>(translators:filters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  EventObserver.init<A, B>(translators:filters:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t EventObserver.init<A, B>(translators:filters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 96) = 0x3FF0000000000000;
  *(void *)(v6 + 104) = 0;
  *(void *)(v6 + 112) = 0;
  *(void *)(v6 + 128) = 0;
  *(void *)(v6 + 136) = 0;
  *(void *)(v6 + 120) = 0x3FF0000000000000;
  *(unsigned char *)(v6 + 144) = -1;
  *(void *)(v6 + 160) = 0;
  *(void *)(v6 + 152) = 0;
  *(void *)(v6 + 40) = a3;
  *(void *)(v6 + 48) = a5;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 16));
  OUTLINED_FUNCTION_4();
  uint64_t v11 = v10;
  (*(void (**)(void))(v10 + 16))();
  *(void *)(v6 + 80) = a4;
  *(void *)(v6 + 88) = a6;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 56));
  OUTLINED_FUNCTION_4();
  uint64_t v13 = v12;
  (*(void (**)(void))(v12 + 16))();
  OUTLINED_FUNCTION_2_2();
  sub_2608A0768();
  OUTLINED_FUNCTION_2_2();
  sub_2608A080C();
  OUTLINED_FUNCTION_2_2();
  id v14 = *(id *)(v6 + 152);
  sub_2608A08BC();

  OUTLINED_FUNCTION_2_2();
  id v15 = *(id *)(v6 + 160);
  sub_2608A0964();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, a3);
  return v6;
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

void sub_2608A0768()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0538);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_12();
  if (v0)
  {
    do
    {
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3_0();
      uint64_t v2 = OUTLINED_FUNCTION_8();
      v1(v2);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_10();
    }
    while (!v3);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
}

void sub_2608A080C()
{
  OUTLINED_FUNCTION_7();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0530);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_12();
  if (v2)
  {
    do
    {
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3_0();
      v3(v5, v1, v0);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_10();
    }
    while (!v6);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
}

void sub_2608A08BC()
{
  OUTLINED_FUNCTION_7();
  char v3 = v2;
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0528);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_12();
  if (v0)
  {
    do
    {
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3_0();
      id v4 = v3;
      uint64_t v5 = OUTLINED_FUNCTION_8();
      v1(v5);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_10();
    }
    while (!v6);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
}

void sub_2608A0964()
{
  OUTLINED_FUNCTION_7();
  char v3 = v2;
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0518);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_12();
  if (v0)
  {
    do
    {
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3_0();
      id v4 = v3;
      uint64_t v5 = OUTLINED_FUNCTION_8();
      v1(v5);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_10();
    }
    while (!v6);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
}

__n128 EventObserver.coordinateTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_2_2();
  long long v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 128);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

__n128 sub_2608A0A50@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  long long v4 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)a2 = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(v3 + 128);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void EventObserver.coordinateTransform.setter(_OWORD *a1)
{
  OUTLINED_FUNCTION_9();
  long long v3 = a1[1];
  v1[6] = *a1;
  v1[7] = v3;
  v1[8] = a1[2];
  sub_2608A0AF8();
}

void sub_2608A0AF8()
{
  if ((sub_2608A27F0() & 1) == 0) {
    sub_2608A0768();
  }
}

void (*EventObserver.coordinateTransform.modify(void *a1))(_OWORD **a1, char a2)
{
  long long v3 = malloc(0xB0uLL);
  *a1 = v3;
  v3[21] = v1;
  OUTLINED_FUNCTION_2_2();
  long long v4 = v1[7];
  *((_OWORD *)v3 + 6) = v1[6];
  *((_OWORD *)v3 + 7) = v4;
  *((_OWORD *)v3 + 8) = v1[8];
  return sub_2608A0BD0;
}

void sub_2608A0BD0(_OWORD **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2) {
    long long v3 = *a1;
  }
  else {
    long long v3 = *a1 + 3;
  }
  long long v4 = v2[7];
  *long long v3 = v2[6];
  v3[1] = v4;
  v3[2] = v2[8];
  EventObserver.coordinateTransform.setter(v3);

  free(v2);
}

uint64_t EventObserver.eventModifiersMask.getter()
{
  OUTLINED_FUNCTION_2_2();
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t sub_2608A0C54@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 144);
  return result;
}

void EventObserver.eventModifiersMask.setter(char a1)
{
  OUTLINED_FUNCTION_9();
  unsigned __int8 v3 = *(unsigned char *)(v1 + 144);
  *(unsigned char *)(v1 + 144) = a1;
  sub_2608A0CD8(v3);
}

void sub_2608A0CD8(unsigned __int8 a1)
{
  swift_beginAccess();
  if (*(unsigned __int8 *)(v1 + 144) != a1) {
    sub_2608A080C();
  }
}

void (*EventObserver.eventModifiersMask.modify(void *a1))(uint64_t a1)
{
  unsigned __int8 v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  OUTLINED_FUNCTION_2_2();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v1 + 144);
  return sub_2608A0D90;
}

void sub_2608A0D90(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  EventObserver.eventModifiersMask.setter(*(unsigned char *)(*(void *)a1 + 32));

  free(v1);
}

void *EventObserver.pressesFilter.getter()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = *(void **)(v0 + 152);
  id v2 = v1;
  return v1;
}

id sub_2608A0E0C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  long long v4 = *(void **)(v3 + 152);
  *a2 = v4;

  return v4;
}

void sub_2608A0E64(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  EventObserver.pressesFilter.setter(v1);
}

void EventObserver.pressesFilter.setter(void *a1)
{
  OUTLINED_FUNCTION_9();
  uint64_t v3 = *(void **)(v1 + 152);
  *(void *)(v1 + 152) = a1;
  id v4 = a1;
  sub_2608A0EEC(v3);
}

void sub_2608A0EEC(void *a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  id v4 = *(void **)(v2 + 152);
  if (v4)
  {
    if (a1)
    {
      sub_2608996E4(0, (unint64_t *)&qword_26A8C0478);
      id v5 = a1;
      id v6 = v4;
      char v7 = sub_2608A2800();

      if (v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    if (!a1) {
      return;
    }
    id v6 = 0;
  }
  sub_2608A08BC();
LABEL_9:
}

void (*EventObserver.pressesFilter.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_2_2();
  id v4 = *(void **)(v1 + 152);
  v3[3] = v4;
  id v5 = v4;
  return sub_2608A1028;
}

void sub_2608A1028(uint64_t a1, char a2)
{
}

void *EventObserver.touchesFilter.getter()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = *(void **)(v0 + 160);
  id v2 = v1;
  return v1;
}

id sub_2608A107C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  id v4 = *(void **)(v3 + 160);
  *a2 = v4;

  return v4;
}

void sub_2608A10D4(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  EventObserver.touchesFilter.setter(v1);
}

void EventObserver.touchesFilter.setter(void *a1)
{
  OUTLINED_FUNCTION_9();
  uint64_t v3 = *(void **)(v1 + 160);
  *(void *)(v1 + 160) = a1;
  id v4 = a1;
  sub_2608A115C(v3);
}

void sub_2608A115C(void *a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  id v4 = *(void **)(v2 + 160);
  if (v4)
  {
    if (a1)
    {
      sub_2608996E4(0, (unint64_t *)&qword_26A8C0478);
      id v5 = a1;
      id v6 = v4;
      char v7 = sub_2608A2800();

      if (v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    if (!a1) {
      return;
    }
    id v6 = 0;
  }
  sub_2608A0964();
LABEL_9:
}

void (*EventObserver.touchesFilter.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_2_2();
  id v4 = *(void **)(v1 + 160);
  v3[3] = v4;
  id v5 = v4;
  return sub_2608A1298;
}

void sub_2608A1298(uint64_t a1, char a2)
{
}

void sub_2608A12B0(uint64_t a1, char a2, void (*a3)(id))
{
  id v4 = *(void **)a1;
  id v6 = (id *)(*(void *)a1 + 24);
  id v5 = *v6;
  if (a2)
  {
    id v7 = v5;
    a3(v5);
  }
  else
  {
    a3(*(id *)(*(void *)a1 + 24));
  }

  free(v4);
}

uint64_t EventObserver.processEvent(_:)()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(qword_26A8C0678);
  sub_2608A2700();
  uint64_t v1 = sub_2608A1904(v3);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2608A13EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v47 = a4;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a3, ObjectType, v6);
  uint64_t v9 = v8;
  if (v8 >> 62) {
    goto LABEL_38;
  }
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v10)
  {
    while (1)
    {
      unint64_t v11 = 0;
      uint64_t v45 = (void *)(v47 + 56);
      unint64_t v46 = v9 & 0xC000000000000001;
      uint64_t v42 = v9 + 32;
      uint64_t v49 = a1;
      uint64_t v44 = v9;
      uint64_t v43 = v10;
LABEL_4:
      unint64_t v12 = v46;
      sub_2608A1EF0(v11, v46 == 0, v9);
      id v13 = v12 ? (id)MEMORY[0x26121E000](v11, v9) : *(id *)(v42 + 8 * v11);
      id v58 = v13;
      BOOL v14 = __OFADD__(v11, 1);
      unint64_t v15 = v11 + 1;
      if (!v14) {
        break;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      uint64_t v10 = sub_2608A2940();
      if (!v10) {
        return swift_bridgeObjectRelease();
      }
    }
    unint64_t v48 = v15;
    id v16 = objc_msgSend(v58, sel_senderID);
    uint64_t v17 = __swift_project_boxed_opaque_existential_1(v45, *(void *)(v47 + 80));
    MEMORY[0x270FA5388](v17);
    (*(void (**)(char *))(v19 + 16))((char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1(v55);
    sub_2608A26E0();
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v55, AssociatedTypeWitness);
      sub_2608A2820();
      if (!v54) {
        break;
      }
      sub_26089BB28(&v53, (uint64_t)v52);
      __swift_project_boxed_opaque_existential_1(v52, v52[3]);
      uint64_t v20 = sub_2608996E4(0, &qword_26A8C0700);
      v50[4] = MEMORY[0x263F84168];
      v50[3] = v20;
      v50[0] = v58;
      id v21 = v58;
      sub_2608A2600();
      uint64_t v23 = v22;
      sub_2608A1F64((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
      int64_t v24 = *(void *)(v23 + 16);
      if (v24)
      {
        v51[0] = MEMORY[0x263F8EE78];
        sub_26089BBC0(0, v24, 0);
        uint64_t v25 = v51[0];
        uint64_t v26 = (unint64_t *)(v23 + 40);
        do
        {
          uint64_t v28 = *(v26 - 1);
          unint64_t v27 = *v26;
          sub_2608A1E98(v28, *v26);
          v51[0] = v25;
          unint64_t v30 = *(void *)(v25 + 16);
          unint64_t v29 = *(void *)(v25 + 24);
          if (v30 >= v29 >> 1)
          {
            sub_26089BBC0((void *)(v29 > 1), v30 + 1, 1);
            uint64_t v25 = v51[0];
          }
          v26 += 2;
          *(void *)(v25 + 16) = v30 + 1;
          uint64_t v31 = (void *)(v25 + 24 * v30);
          v31[4] = v28;
          v31[5] = v27;
          v31[6] = v16;
          --v24;
        }
        while (v24);
        swift_bridgeObjectRelease();
        a1 = v49;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v25 = MEMORY[0x263F8EE78];
      }
      uint64_t v32 = *(void *)(v25 + 16);
      uint64_t v33 = *a1;
      uint64_t v9 = *(void *)(*a1 + 16);
      uint64_t v34 = v9 + v32;
      if (__OFADD__(v9, v32))
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v34 > *(void *)(v33 + 24) >> 1)
      {
        if (v9 <= v34) {
          int64_t v36 = v9 + v32;
        }
        else {
          int64_t v36 = v9;
        }
        uint64_t v33 = sub_2608A1D88(isUniquelyReferenced_nonNull_native, v36, 1, v33);
      }
      if (*(void *)(v25 + 16))
      {
        uint64_t v37 = *(void *)(v33 + 16);
        if ((*(void *)(v33 + 24) >> 1) - v37 < v32) {
          goto LABEL_35;
        }
        uint64_t v9 = v33 + 24 * v37 + 32;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04F0);
        swift_arrayInitWithCopy();
        if (v32)
        {
          uint64_t v38 = *(void *)(v33 + 16);
          BOOL v14 = __OFADD__(v38, v32);
          uint64_t v39 = v38 + v32;
          if (v14) {
            goto LABEL_36;
          }
          *(void *)(v33 + 16) = v39;
        }
      }
      else if (v32)
      {
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
      *a1 = v33;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
    unint64_t v11 = v48;
    uint64_t v9 = v44;
    if (v48 != v43) {
      goto LABEL_4;
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2608A18E8(uint64_t *a1, uint64_t a2)
{
  return sub_2608A13EC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2608A1904(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_26089BB90(0, v1, 0);
    uint64_t v2 = v11;
    id v4 = (unint64_t *)(a1 + 40);
    do
    {
      sub_2608A1E98(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04F0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04E0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_26089BB90(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v11;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_26089BB90((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v11;
      }
      v4 += 3;
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 24 * v6;
      *(void *)(v7 + 32) = v9;
      *(_OWORD *)(v7 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2608A1A60@<X0>(uint64_t *a1@<X2>, void *a2@<X8>)
{
  swift_unknownObjectRetain();
  swift_getExtendedExistentialTypeMetadata();
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t EventObserver.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return v0;
}

uint64_t EventObserver.__deallocating_deinit()
{
  EventObserver.deinit();

  return MEMORY[0x270FA0228](v0, 168, 7);
}

void sub_2608A1B6C(_OWORD *a1)
{
}

void *sub_2608A1B94(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_2608A1BA4(char *a1)
{
}

uint64_t sub_2608A1BE8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for EventObserver()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for EventObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EventObserver);
}

uint64_t dispatch thunk of EventObserver.__allocating_init<A, B>(translators:filters:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_2608A1C94(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8C0710);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_26089B970((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v10 + 32), (const void *)(a4 + 32), 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2608A1D88(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04E8);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_26089B990((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C04F0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2608A1E98(uint64_t a1, unint64_t a2)
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

unint64_t sub_2608A1EF0(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
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

uint64_t sub_2608A1F64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C0708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2608A1FC4@<X0>(void *a1@<X8>)
{
  return sub_2608A1A60(&qword_26A8C0518, a1);
}

uint64_t sub_2608A1FE8@<X0>(void *a1@<X8>)
{
  return sub_2608A1A60(&qword_26A8C0528, a1);
}

uint64_t sub_2608A200C@<X0>(void *a1@<X8>)
{
  return sub_2608A1A60(&qword_26A8C0530, a1);
}

uint64_t sub_2608A2030@<X0>(void *a1@<X8>)
{
  return sub_2608A1A60(&qword_26A8C0538, a1);
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

void *OUTLINED_FUNCTION_0_3()
{
  return __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2608A26F0();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_getObjectType();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

id sub_2608A2244(uint64_t a1)
{
  return sub_2608A2268(a1);
}

id sub_2608A2268(uint64_t a1)
{
  return objc_msgSend(v1, sel_locationInView_, a1);
}

id sub_2608A227C()
{
  return sub_2608A22A0();
}

id sub_2608A22A0()
{
  return objc_msgSend(v0, sel__pathIndex);
}

id sub_2608A22C4()
{
  return sub_2608A2418();
}

unint64_t sub_2608A22E8(uint64_t a1)
{
  unint64_t result = sub_2608A2310();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2608A2310()
{
  unint64_t result = qword_26A8C0470;
  if (!qword_26A8C0470)
  {
    sub_2608A2360();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C0470);
  }
  return result;
}

unint64_t sub_2608A2360()
{
  unint64_t result = qword_26A8C0468;
  if (!qword_26A8C0468)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8C0468);
  }
  return result;
}

uint64_t dispatch thunk of UITouchProtocol.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of UITouchProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of UITouchProtocol.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UITouchProtocol.location(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of UITouchProtocol._pathIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of UITouchProtocol._pathIdentity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

id sub_2608A2418()
{
  return objc_msgSend(v0, sel__pathIdentity);
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.setter(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

id sub_2608A24A8()
{
  return sub_2608A24E0();
}

uint64_t dispatch thunk of UIKeyProtocol.keyCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id sub_2608A24E0()
{
  return objc_msgSend(v0, sel_keyCode);
}

uint64_t sub_2608A24F0()
{
  return MEMORY[0x270F831E8]();
}

uint64_t sub_2608A2500()
{
  return MEMORY[0x270F831F0]();
}

uint64_t sub_2608A2510()
{
  return MEMORY[0x270F831F8]();
}

uint64_t sub_2608A2520()
{
  return MEMORY[0x270F83200]();
}

uint64_t sub_2608A2530()
{
  return MEMORY[0x270F83208]();
}

uint64_t sub_2608A2540()
{
  return MEMORY[0x270F83210]();
}

uint64_t sub_2608A2550()
{
  return MEMORY[0x270F83218]();
}

uint64_t sub_2608A2560()
{
  return MEMORY[0x270F83220]();
}

uint64_t sub_2608A2570()
{
  return MEMORY[0x270F83228]();
}

uint64_t sub_2608A2580()
{
  return MEMORY[0x270F83230]();
}

uint64_t sub_2608A2590()
{
  return MEMORY[0x270F83238]();
}

uint64_t sub_2608A25A0()
{
  return MEMORY[0x270F83240]();
}

uint64_t sub_2608A25B0()
{
  return MEMORY[0x270F83258]();
}

uint64_t sub_2608A25C0()
{
  return MEMORY[0x270F83260]();
}

uint64_t sub_2608A25D0()
{
  return MEMORY[0x270F83268]();
}

uint64_t sub_2608A25E0()
{
  return MEMORY[0x270F83270]();
}

uint64_t sub_2608A25F0()
{
  return MEMORY[0x270F83278]();
}

uint64_t sub_2608A2600()
{
  return MEMORY[0x270F83280]();
}

uint64_t sub_2608A2610()
{
  return MEMORY[0x270F83288]();
}

uint64_t sub_2608A2620()
{
  return MEMORY[0x270F83290]();
}

uint64_t sub_2608A2630()
{
  return MEMORY[0x270F832E0]();
}

uint64_t sub_2608A2640()
{
  return MEMORY[0x270F832E8]();
}

uint64_t sub_2608A2650()
{
  return MEMORY[0x270F833C0]();
}

uint64_t sub_2608A2660()
{
  return MEMORY[0x270F833C8]();
}

uint64_t sub_2608A2670()
{
  return MEMORY[0x270F833D0]();
}

uint64_t sub_2608A2680()
{
  return MEMORY[0x270F833D8]();
}

uint64_t sub_2608A2690()
{
  return MEMORY[0x270F833E0]();
}

uint64_t sub_2608A26A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2608A26B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2608A26C0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2608A26D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2608A26E0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2608A26F0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2608A2700()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_2608A2710()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2608A2720()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_2608A2730()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2608A2740()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2608A2750()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2608A2760()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_2608A2770()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2608A2780()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2608A2790()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2608A27A0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2608A27B0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2608A27C0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2608A27D0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2608A27E0()
{
  return MEMORY[0x270F83418]();
}

uint64_t sub_2608A27F0()
{
  return MEMORY[0x270EE58F8]();
}

uint64_t sub_2608A2800()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2608A2810()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2608A2820()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2608A2840()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_2608A2850()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2608A2860()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2608A2870()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2608A2880()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_2608A2890()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2608A28A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2608A28B0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2608A28C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2608A28D0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2608A28E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2608A28F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2608A2900()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2608A2910()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2608A2920()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2608A2930()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2608A2940()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2608A2950()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2608A2960()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2608A2970()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2608A2980()
{
  return MEMORY[0x270F9FC90]();
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x270EF41E8]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x270EF43D0]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}