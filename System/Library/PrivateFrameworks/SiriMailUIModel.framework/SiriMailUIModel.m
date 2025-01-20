uint64_t sub_25CF54300()
{
  uint64_t v0;

  v0 = sub_25CF61B70();
  __swift_allocate_value_buffer(v0, qword_26A633228);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A633228);
  return sub_25CF61B60();
}

uint64_t static Logger.siriMail.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A633220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25CF61B70();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A633228);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

uint64_t SiriMailAction.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25CF61BD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t SiriMailAction.rawValue.getter()
{
  return 1684956531;
}

unint64_t sub_25CF5453C()
{
  unint64_t result = qword_26A633248;
  if (!qword_26A633248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633248);
  }
  return result;
}

uint64_t sub_25CF54594@<X0>(BOOL *a1@<X8>)
{
  return SiriMailAction.init(rawValue:)(a1);
}

void sub_25CF545A0(void *a1@<X8>)
{
  *a1 = 1684956531;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_25CF545B4()
{
  return sub_25CF61BA0();
}

uint64_t sub_25CF54614()
{
  return sub_25CF61B90();
}

uint64_t getEnumTagSinglePayload for SiriMailAction(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriMailAction(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25CF54758);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF54780()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriMailAction()
{
  return &type metadata for SiriMailAction;
}

unint64_t sub_25CF5479C()
{
  unint64_t result = qword_26A633250;
  if (!qword_26A633250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633250);
  }
  return result;
}

uint64_t sub_25CF547E8(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  uint64_t v4 = 28532;
  switch(a1)
  {
    case 1:
      uint64_t v4 = 25443;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v4 = 6513506;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v4 = 0x7463656A627573;
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v4 = 2036625250;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  uint64_t v6 = 28532;
  switch(a2)
  {
    case 1:
      uint64_t v6 = 25443;
      break;
    case 2:
      unint64_t v5 = 0xE300000000000000;
      uint64_t v6 = 6513506;
      break;
    case 3:
      unint64_t v5 = 0xE700000000000000;
      uint64_t v6 = 0x7463656A627573;
      break;
    case 4:
      unint64_t v5 = 0xE400000000000000;
      uint64_t v6 = 2036625250;
      break;
    default:
      break;
  }
  if (v4 == v6 && v3 == v5) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25CF61CA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25CF54948(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x7466617264;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x7466617264;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x676E69646E6573;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1953391987;
      break;
    case 3:
      uint64_t v5 = 0x656C6C65636E6163;
      unint64_t v3 = 0xE900000000000064;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x64656C696166;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x676E69646E6573;
      break;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1953391987;
      break;
    case 3:
      uint64_t v2 = 0x656C6C65636E6163;
      unint64_t v6 = 0xE900000000000064;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x64656C696166;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25CF61CA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25CF54AE4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C65636E6163;
  }
  else {
    uint64_t v3 = 1684956531;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C65636E6163;
  }
  else {
    uint64_t v5 = 1684956531;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25CF61CA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25CF54B7C()
{
  return 1;
}

uint64_t sub_25CF54B84()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF54BB8(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_42();
  a2(v5, a1);
  return sub_25CF61CE0();
}

uint64_t sub_25CF54C00()
{
  return sub_25CF54E58();
}

uint64_t sub_25CF54C0C()
{
  return sub_25CF61B80();
}

uint64_t sub_25CF54C1C()
{
  sub_25CF61B80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF54C7C()
{
  sub_25CF61B80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF54D54()
{
  sub_25CF61B80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CF54E0C(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_25CF61CB0();
  a3(v6, a2);
  return sub_25CF61CE0();
}

uint64_t sub_25CF54E58()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF54ECC()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF54F04()
{
  uint64_t v0 = sub_25CF61B50();
  __swift_allocate_value_buffer(v0, qword_26A633258);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A633258);
  return sub_25CF61B40();
}

uint64_t static ServiceName.mail.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A633240 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25CF61B50();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A633258);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t _SiriMailMessage.Account.name.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.Account.address.getter()
{
  return OUTLINED_FUNCTION_5();
}

SiriMailUIModel::_SiriMailMessage::Account __swiftcall _SiriMailMessage.Account.init(name:address:)(Swift::String_optional name, Swift::String address)
{
  *uint64_t v2 = name;
  v2[1].value = address;
  result.address = address;
  result.name = name;
  return result;
}

uint64_t _SiriMailMessage.Account.init(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25CF61AD0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_25CF61AE0();
  uint64_t v7 = v6;
  sub_25CF61AF0();
  OUTLINED_FUNCTION_6();
  uint64_t result = v8();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v7;
  return result;
}

uint64_t static _SiriMailMessage.Account.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  if (!v3)
  {
    if (!v6)
    {
LABEL_11:
      if (v4 == v7 && v5 == v8) {
        return 1;
      }
      OUTLINED_FUNCTION_5();
      return sub_25CF61CA0();
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v6) {
    goto LABEL_11;
  }
  sub_25CF61CA0();
  uint64_t result = OUTLINED_FUNCTION_10();
  if (v11) {
    goto LABEL_11;
  }
  return result;
}

uint64_t _SiriMailMessage.Account.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_25CF61CD0();
    swift_bridgeObjectRetain();
    sub_25CF61B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25CF61CD0();
  }
  swift_bridgeObjectRetain();
  sub_25CF61B80();
  return swift_bridgeObjectRelease();
}

BOOL sub_25CF55258(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25CF55268()
{
  return sub_25CF61CC0();
}

uint64_t sub_25CF55290(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25CF61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73736572646461 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25CF61CA0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25CF55370()
{
  return 2;
}

uint64_t sub_25CF55378()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF553C0(char a1)
{
  if (a1) {
    return 0x73736572646461;
  }
  else {
    return 1701667182;
  }
}

BOOL sub_25CF553F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25CF55258(*a1, *a2);
}

uint64_t sub_25CF553FC()
{
  return sub_25CF55378();
}

uint64_t sub_25CF55404()
{
  return sub_25CF55268();
}

uint64_t sub_25CF5540C()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF55450()
{
  return sub_25CF553C0(*v0);
}

uint64_t sub_25CF55458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF55290(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF55480()
{
  return sub_25CF55EF8();
}

uint64_t sub_25CF554A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF55370();
  *a1 = result;
  return result;
}

uint64_t sub_25CF554C8(uint64_t a1)
{
  unint64_t v2 = sub_25CF556EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF55504(uint64_t a1)
{
  unint64_t v2 = sub_25CF556EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void _SiriMailMessage.Account.encode(to:)()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A633270);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25CF556EC();
  sub_25CF61D00();
  sub_25CF61C60();
  if (!v0) {
    OUTLINED_FUNCTION_30();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_17();
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25CF556EC()
{
  unint64_t result = qword_26A633278;
  if (!qword_26A633278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633278);
  }
  return result;
}

uint64_t _SiriMailMessage.Account.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_42();
  sub_25CF61CD0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_25CF61B80();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_25CF61B80();
  swift_bridgeObjectRelease();
  return sub_25CF61CE0();
}

void _SiriMailMessage.Account.init(from:)()
{
  OUTLINED_FUNCTION_19();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A633280);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_32();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25CF556EC();
  sub_25CF61CF0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = sub_25CF61C00();
    uint64_t v7 = v6;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25CF61C20();
    uint64_t v10 = v9;
    uint64_t v13 = v8;
    uint64_t v11 = OUTLINED_FUNCTION_43();
    v12(v11);
    *uint64_t v4 = v5;
    v4[1] = v7;
    v4[2] = v13;
    v4[3] = v10;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17();
}

void sub_25CF55988()
{
}

void sub_25CF559A0()
{
}

uint64_t sub_25CF559C4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_25CF61CB0();
  sub_25CF61CD0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_25CF61B80();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_25CF61B80();
  swift_bridgeObjectRelease();
  return sub_25CF61CE0();
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

uint64_t _SiriMailMessage.MailAttachment.data.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_5();
  sub_25CF55AE8(v0, v1);
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_25CF55AE8(uint64_t a1, unint64_t a2)
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

uint64_t _SiriMailMessage.MailAttachment.mimeType.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.MailAttachment.filename.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.MailAttachment.contentID.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.MailAttachment.init(data:mimeType:filename:contentID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t static _SiriMailMessage.MailAttachment.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v18 = a1[7];
  uint64_t v19 = a1[6];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  if ((MEMORY[0x2611A3370](*a1, a1[1], *a2, a2[1]) & 1) == 0) {
    return 0;
  }
  BOOL v12 = v2 == v6 && v3 == v7;
  if (v12 || (sub_25CF61CA0(), uint64_t result = OUTLINED_FUNCTION_10(), (v14 & 1) != 0))
  {
    BOOL v15 = v4 == v8 && v5 == v9;
    if (v15 || (sub_25CF61CA0(), uint64_t result = OUTLINED_FUNCTION_10(), (v16 & 1) != 0))
    {
      if (v19 == v10 && v18 == v11)
      {
        return 1;
      }
      else
      {
        return sub_25CF61CA0();
      }
    }
  }
  return result;
}

BOOL sub_25CF55D04(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25CF55D14()
{
  return sub_25CF61CC0();
}

uint64_t sub_25CF55D3C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (sub_25CF61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65707954656D696DLL && a2 == 0xE800000000000000;
    if (v6 || (sub_25CF61CA0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000;
      if (v7 || (sub_25CF61CA0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x49746E65746E6F63 && a2 == 0xE900000000000044)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_25CF61CA0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_25CF55EF0()
{
  return 4;
}

uint64_t sub_25CF55EF8()
{
  return 0;
}

uint64_t sub_25CF55F04(char a1)
{
  uint64_t result = 1635017060;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x65707954656D696DLL;
      break;
    case 2:
      uint64_t result = 0x656D616E656C6966;
      break;
    case 3:
      uint64_t result = 0x49746E65746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_25CF55F94(char *a1, char *a2)
{
  return sub_25CF55D04(*a1, *a2);
}

uint64_t sub_25CF55FA0()
{
  return sub_25CF5BE94();
}

uint64_t sub_25CF55FBC()
{
  return sub_25CF55D14();
}

uint64_t sub_25CF55FC8()
{
  return sub_25CF55F04(*v0);
}

uint64_t sub_25CF55FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF55D3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF55FF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF55EF0();
  *a1 = result;
  return result;
}

uint64_t sub_25CF56020(uint64_t a1)
{
  unint64_t v2 = sub_25CF5622C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF5605C(uint64_t a1)
{
  unint64_t v2 = sub_25CF5622C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void _SiriMailMessage.MailAttachment.encode(to:)()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A633288);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25CF5622C();
  sub_25CF61D00();
  sub_25CF56278();
  sub_25CF61C90();
  if (!v0)
  {
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_30();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_17();
}

unint64_t sub_25CF5622C()
{
  unint64_t result = qword_26A633290;
  if (!qword_26A633290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633290);
  }
  return result;
}

unint64_t sub_25CF56278()
{
  unint64_t result = qword_26A633298;
  if (!qword_26A633298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633298);
  }
  return result;
}

void _SiriMailMessage.MailAttachment.init(from:)()
{
  OUTLINED_FUNCTION_19();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_32();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25CF5622C();
  sub_25CF61CF0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    sub_25CF565A8();
    sub_25CF61C30();
    sub_25CF55AE8(v18, v19);
    uint64_t v5 = OUTLINED_FUNCTION_47();
    uint64_t v17 = v6;
    uint64_t v15 = v5;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25CF61C20();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v9 = OUTLINED_FUNCTION_47();
    uint64_t v11 = v10;
    uint64_t v16 = v9;
    uint64_t v12 = OUTLINED_FUNCTION_21();
    v13(v12);
    sub_25CF55AE8(v18, v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25CF565F4(v18, v19);
    *uint64_t v4 = v18;
    v4[1] = v19;
    v4[2] = v15;
    v4[3] = v17;
    v4[4] = v14;
    v4[5] = v8;
    v4[6] = v16;
    v4[7] = v11;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    sub_25CF565F4(v18, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17();
}

unint64_t sub_25CF565A8()
{
  unint64_t result = qword_26A6332A8;
  if (!qword_26A6332A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6332A8);
  }
  return result;
}

uint64_t sub_25CF565F4(uint64_t a1, unint64_t a2)
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

void sub_25CF5664C()
{
}

void sub_25CF56664()
{
}

Swift::Bool __swiftcall _SiriMailMessage.State.isCompleted()()
{
  return *v0 != 0;
}

SiriMailUIModel::_SiriMailMessage::State_optional __swiftcall _SiriMailMessage.State.init(rawValue:)(Swift::String rawValue)
{
  return (SiriMailUIModel::_SiriMailMessage::State_optional)sub_25CF568A0(v1);
}

uint64_t _SiriMailMessage.State.rawValue.getter()
{
  uint64_t result = 0x7466617264;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x676E69646E6573;
      break;
    case 2:
      uint64_t result = 1953391987;
      break;
    case 3:
      uint64_t result = 0x656C6C65636E6163;
      break;
    case 4:
      uint64_t result = 0x64656C696166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF5673C(unsigned __int8 *a1, char *a2)
{
  return sub_25CF54948(*a1, *a2);
}

uint64_t sub_25CF56748()
{
  return sub_25CF54BB8(*v0, (void (*)(unsigned char *, uint64_t))sub_25CF54C7C);
}

uint64_t sub_25CF56778()
{
  return sub_25CF54C7C();
}

uint64_t sub_25CF56780(uint64_t a1)
{
  return sub_25CF54E0C(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_25CF54C7C);
}

SiriMailUIModel::_SiriMailMessage::State_optional sub_25CF567B0(Swift::String *a1)
{
  return _SiriMailMessage.State.init(rawValue:)(*a1);
}

uint64_t sub_25CF567BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _SiriMailMessage.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF567E4()
{
  return sub_25CF61BA0();
}

uint64_t sub_25CF56844()
{
  return sub_25CF61B90();
}

SiriMailUIModel::_SiriMailMessage::Field_optional __swiftcall _SiriMailMessage.Field.init(rawValue:)(Swift::String rawValue)
{
  return (SiriMailUIModel::_SiriMailMessage::Field_optional)sub_25CF568A0(v1);
}

uint64_t sub_25CF568A0@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_25CF61BD0();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 5;
  if (v2 < 5) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t _SiriMailMessage.Field.rawValue.getter()
{
  uint64_t result = 28532;
  switch(*v0)
  {
    case 1:
      uint64_t result = 25443;
      break;
    case 2:
      uint64_t result = 6513506;
      break;
    case 3:
      uint64_t result = 0x7463656A627573;
      break;
    case 4:
      uint64_t result = 2036625250;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF56978(char *a1, char *a2)
{
  return sub_25CF547E8(*a1, *a2);
}

uint64_t sub_25CF56984()
{
  return sub_25CF54BB8(*v0, (void (*)(unsigned char *, uint64_t))sub_25CF54D54);
}

uint64_t sub_25CF569B4()
{
  return sub_25CF54D54();
}

uint64_t sub_25CF569BC(uint64_t a1)
{
  return sub_25CF54E0C(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_25CF54D54);
}

SiriMailUIModel::_SiriMailMessage::Field_optional sub_25CF569EC(Swift::String *a1)
{
  return _SiriMailMessage.Field.init(rawValue:)(*a1);
}

uint64_t sub_25CF569F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _SiriMailMessage.Field.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF56A20()
{
  return sub_25CF61BA0();
}

uint64_t sub_25CF56A80()
{
  return sub_25CF61B90();
}

SiriMailUIModel::_SiriMailMessage::Action_optional __swiftcall _SiriMailMessage.Action.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_25CF61BD0();
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
  *unint64_t v2 = v5;
  return result;
}

uint64_t _SiriMailMessage.Action.rawValue.getter()
{
  if (*v0) {
    return 0x6C65636E6163;
  }
  else {
    return 1684956531;
  }
}

uint64_t sub_25CF56B64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6470556C65646F6DLL && a2 == 0xEB00000000657461;
  if (v2 || (sub_25CF61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_25CF61CA0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_25CF61CA0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
        if (v8 || (sub_25CF61CA0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 28532 && a2 == 0xE200000000000000;
          if (v9 || (sub_25CF61CA0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 25443 && a2 == 0xE200000000000000;
            if (v10 || (sub_25CF61CA0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 6513506 && a2 == 0xE300000000000000;
              if (v11 || (sub_25CF61CA0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x4664657375636F66 && a2 == 0xEC000000646C6569;
                if (v12 || (sub_25CF61CA0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
                  if (v13 || (sub_25CF61CA0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    char v15 = sub_25CF61CA0();
                    swift_bridgeObjectRelease();
                    if (v15) {
                      return 9;
                    }
                    else {
                      return 10;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25CF56F44()
{
  return 10;
}

uint64_t sub_25CF56F4C(char a1)
{
  uint64_t result = 0x6470556C65646F6DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7463656A627573;
      break;
    case 2:
      uint64_t result = 2036625250;
      break;
    case 3:
      uint64_t result = 0x656D686361747461;
      break;
    case 4:
      uint64_t result = 28532;
      break;
    case 5:
      uint64_t result = 25443;
      break;
    case 6:
      uint64_t result = 6513506;
      break;
    case 7:
      uint64_t result = 0x4664657375636F66;
      break;
    case 8:
      uint64_t result = 0x6E6F69746361;
      break;
    case 9:
      uint64_t result = 0x6574617473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF57070()
{
  return sub_25CF61CC0();
}

uint64_t sub_25CF57098()
{
  return 12383;
}

uint64_t sub_25CF570A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25CF61CA0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25CF57114()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF57150(char *a1, char *a2)
{
  return sub_25CF54AE4(*a1, *a2);
}

uint64_t sub_25CF5715C()
{
  return sub_25CF54C00();
}

uint64_t sub_25CF57164()
{
  return sub_25CF54C1C();
}

uint64_t sub_25CF5716C()
{
  return sub_25CF54E58();
}

SiriMailUIModel::_SiriMailMessage::Action_optional sub_25CF57174(Swift::String *a1)
{
  return _SiriMailMessage.Action.init(rawValue:)(*a1);
}

uint64_t sub_25CF57180@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _SiriMailMessage.Action.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25CF571A8()
{
  return sub_25CF61BA0();
}

uint64_t sub_25CF57208()
{
  return sub_25CF61B90();
}

uint64_t sub_25CF57258()
{
  return sub_25CF57114();
}

uint64_t sub_25CF5727C(uint64_t a1)
{
  unint64_t v2 = sub_25CF582E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF572B8(uint64_t a1)
{
  unint64_t v2 = sub_25CF582E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF572F4(uint64_t a1)
{
  unint64_t v2 = sub_25CF58588();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57330(uint64_t a1)
{
  unint64_t v2 = sub_25CF58588();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF5736C(uint64_t a1)
{
  unint64_t v2 = sub_25CF58410();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF573A8(uint64_t a1)
{
  unint64_t v2 = sub_25CF58410();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF573E4(uint64_t a1)
{
  unint64_t v2 = sub_25CF58620();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57420(uint64_t a1)
{
  unint64_t v2 = sub_25CF58620();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF5745C(uint64_t a1)
{
  unint64_t v2 = sub_25CF584F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57498(uint64_t a1)
{
  unint64_t v2 = sub_25CF584F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF574D4()
{
  return sub_25CF56F4C(*v0);
}

uint64_t sub_25CF574DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF56B64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF57504@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF56F44();
  *a1 = result;
  return result;
}

uint64_t sub_25CF5752C(uint64_t a1)
{
  unint64_t v2 = sub_25CF581F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57568(uint64_t a1)
{
  unint64_t v2 = sub_25CF581F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF575A4(uint64_t a1)
{
  unint64_t v2 = sub_25CF58378();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF575E0(uint64_t a1)
{
  unint64_t v2 = sub_25CF58378();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF5761C(uint64_t a1)
{
  unint64_t v2 = sub_25CF586C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57658(uint64_t a1)
{
  unint64_t v2 = sub_25CF586C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF57694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF570A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25CF576C0()
{
  return sub_25CF55EF8();
}

uint64_t sub_25CF576DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF54B7C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25CF57708(uint64_t a1)
{
  unint64_t v2 = sub_25CF58248();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57744(uint64_t a1)
{
  unint64_t v2 = sub_25CF58248();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF57780(uint64_t a1)
{
  unint64_t v2 = sub_25CF5867C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF577BC(uint64_t a1)
{
  unint64_t v2 = sub_25CF5867C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CF577F8()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF57838(uint64_t a1)
{
  unint64_t v2 = sub_25CF5853C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF57874(uint64_t a1)
{
  unint64_t v2 = sub_25CF5853C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void _SiriMailMessage.StateChange.encode(to:)()
{
  OUTLINED_FUNCTION_19();
  unint64_t v2 = v0;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_33(v5, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332D0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6332F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A633300);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_25();
  sub_25CF581DC(v2, v15);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_25CF581F0();
  OUTLINED_FUNCTION_45();
  sub_25CF581DC(v15, v16);
  switch(sub_25CF5823C((uint64_t)v16))
  {
    case 1u:
      sub_25CF5866C((uint64_t)v16);
      LOBYTE(v14[0]) = 1;
      sub_25CF5867C();
      sub_25CF61C50();
      sub_25CF61C80();
      OUTLINED_FUNCTION_6();
      v7();
      goto LABEL_15;
    case 2u:
      sub_25CF5866C((uint64_t)v16);
      LOBYTE(v14[0]) = 2;
      sub_25CF58620();
      OUTLINED_FUNCTION_35();
      sub_25CF61C80();
      goto LABEL_14;
    case 3u:
      OUTLINED_FUNCTION_44();
      sub_25CF58588();
      OUTLINED_FUNCTION_7();
      v14[0] = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633378);
      sub_25CF5DFCC(&qword_26A633380, &qword_26A633378, (void (*)(void))sub_25CF585D4);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_22();
      goto LABEL_14;
    case 4u:
      OUTLINED_FUNCTION_44();
      sub_25CF5853C();
      OUTLINED_FUNCTION_7();
      v14[0] = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633350, &qword_26A633348, (void (*)(void))sub_25CF584A4);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_22();
      goto LABEL_14;
    case 5u:
      OUTLINED_FUNCTION_44();
      sub_25CF584F0();
      OUTLINED_FUNCTION_7();
      v14[0] = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633350, &qword_26A633348, (void (*)(void))sub_25CF584A4);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_22();
      goto LABEL_14;
    case 6u:
      OUTLINED_FUNCTION_44();
      sub_25CF58410();
      OUTLINED_FUNCTION_7();
      v14[0] = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633350, &qword_26A633348, (void (*)(void))sub_25CF584A4);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_22();
      goto LABEL_14;
    case 7u:
      char v8 = *(unsigned char *)sub_25CF5866C((uint64_t)v16);
      sub_25CF58378();
      OUTLINED_FUNCTION_7();
      LOBYTE(v14[0]) = v8;
      sub_25CF583C4();
      sub_25CF61C70();
      goto LABEL_14;
    case 8u:
      char v9 = *(unsigned char *)sub_25CF5866C((uint64_t)v16);
      sub_25CF582E0();
      OUTLINED_FUNCTION_7();
      LOBYTE(v14[0]) = v9;
      sub_25CF5832C();
      sub_25CF61C90();
      goto LABEL_14;
    case 9u:
      char v10 = *(unsigned char *)sub_25CF5866C((uint64_t)v16);
      sub_25CF58248();
      OUTLINED_FUNCTION_7();
      LOBYTE(v14[0]) = v10;
      sub_25CF58294();
      sub_25CF61C90();
      goto LABEL_14;
    default:
      BOOL v6 = (const void *)sub_25CF5866C((uint64_t)v16);
      LOBYTE(v14[0]) = 0;
      sub_25CF586C8();
      OUTLINED_FUNCTION_35();
      memcpy(v14, v6, 0x142uLL);
      sub_25CF58714();
      sub_25CF61C90();
LABEL_14:
      OUTLINED_FUNCTION_6();
      v11();
LABEL_15:
      OUTLINED_FUNCTION_6();
      v12();
      OUTLINED_FUNCTION_17();
      return;
  }
}

void *sub_25CF581DC(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x142uLL);
}

unint64_t sub_25CF581F0()
{
  unint64_t result = qword_26A633308;
  if (!qword_26A633308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633308);
  }
  return result;
}

uint64_t sub_25CF5823C(uint64_t a1)
{
  return *(_WORD *)(a1 + 320) >> 4;
}

unint64_t sub_25CF58248()
{
  unint64_t result = qword_26A633310;
  if (!qword_26A633310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633310);
  }
  return result;
}

unint64_t sub_25CF58294()
{
  unint64_t result = qword_26A633318;
  if (!qword_26A633318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633318);
  }
  return result;
}

unint64_t sub_25CF582E0()
{
  unint64_t result = qword_26A633320;
  if (!qword_26A633320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633320);
  }
  return result;
}

unint64_t sub_25CF5832C()
{
  unint64_t result = qword_26A633328;
  if (!qword_26A633328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633328);
  }
  return result;
}

unint64_t sub_25CF58378()
{
  unint64_t result = qword_26A633330;
  if (!qword_26A633330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633330);
  }
  return result;
}

unint64_t sub_25CF583C4()
{
  unint64_t result = qword_26A633338;
  if (!qword_26A633338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633338);
  }
  return result;
}

unint64_t sub_25CF58410()
{
  unint64_t result = qword_26A633340;
  if (!qword_26A633340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633340);
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

unint64_t sub_25CF584A4()
{
  unint64_t result = qword_26A633358;
  if (!qword_26A633358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633358);
  }
  return result;
}

unint64_t sub_25CF584F0()
{
  unint64_t result = qword_26A633360;
  if (!qword_26A633360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633360);
  }
  return result;
}

unint64_t sub_25CF5853C()
{
  unint64_t result = qword_26A633368;
  if (!qword_26A633368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633368);
  }
  return result;
}

unint64_t sub_25CF58588()
{
  unint64_t result = qword_26A633370;
  if (!qword_26A633370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633370);
  }
  return result;
}

unint64_t sub_25CF585D4()
{
  unint64_t result = qword_26A633388;
  if (!qword_26A633388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633388);
  }
  return result;
}

unint64_t sub_25CF58620()
{
  unint64_t result = qword_26A633390;
  if (!qword_26A633390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633390);
  }
  return result;
}

uint64_t sub_25CF5866C(uint64_t result)
{
  *(_WORD *)(result + 320) &= 0xFF0Fu;
  return result;
}

unint64_t sub_25CF5867C()
{
  unint64_t result = qword_26A633398;
  if (!qword_26A633398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633398);
  }
  return result;
}

unint64_t sub_25CF586C8()
{
  unint64_t result = qword_26A6333A0;
  if (!qword_26A6333A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6333A0);
  }
  return result;
}

unint64_t sub_25CF58714()
{
  unint64_t result = qword_26A6333A8;
  if (!qword_26A6333A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6333A8);
  }
  return result;
}

void _SiriMailMessage.StateChange.init(from:)()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2;
  v70 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333D0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_33(v5, v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6333F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A633400);
  OUTLINED_FUNCTION_0();
  uint64_t v71 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_41();
  v73 = v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25CF581F0();
  sub_25CF61CF0();
  if (v0) {
    goto LABEL_16;
  }
  uint64_t v77 = v6;
  uint64_t v8 = sub_25CF61C40();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9
    || (uint64_t v10 = *(unsigned __int8 *)(v8 + 32),
        sub_25CF5DDA0(1, v9, v8, v8 + 32, 0, (2 * v9) | 1),
        uint64_t v12 = v11,
        unint64_t v14 = v13,
        swift_bridgeObjectRelease(),
        v12 != v14 >> 1))
  {
    uint64_t v15 = sub_25CF61BC0();
    swift_allocError();
    uint64_t v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A633408);
    *uint64_t v17 = &type metadata for _SiriMailMessage.StateChange;
    sub_25CF61BF0();
    sub_25CF61BB0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCB0], v15);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v1, v77);
LABEL_16:
    uint64_t v44 = (uint64_t)v73;
    goto LABEL_17;
  }
  switch(v10)
  {
    case 1:
      LOBYTE(v75[0]) = 1;
      sub_25CF5867C();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys, (uint64_t)v75, v77);
      uint64_t v50 = sub_25CF61C20();
      uint64_t v52 = v51;
      OUTLINED_FUNCTION_6();
      v53();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v1, v77);
      v75[0] = v50;
      v75[1] = v52;
      sub_25CF5E0AC((uint64_t)v75);
      goto LABEL_18;
    case 2:
      LOBYTE(v75[0]) = 2;
      sub_25CF58620();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.BodyCodingKeys, (uint64_t)v75);
      uint64_t v43 = sub_25CF61C20();
      uint64_t v55 = v54;
      uint64_t v72 = v43;
      OUTLINED_FUNCTION_6();
      v56();
      swift_unknownObjectRelease();
      uint64_t v57 = OUTLINED_FUNCTION_49();
      v58(v57);
      v75[0] = v72;
      v75[1] = v55;
      sub_25CF5E098((uint64_t)v75);
      goto LABEL_18;
    case 3:
      LOBYTE(v75[0]) = 3;
      sub_25CF58588();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys, (uint64_t)v75);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633378);
      sub_25CF5DFCC(&qword_26A633438, &qword_26A633378, (void (*)(void))sub_25CF5E038);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_15();
      uint64_t v18 = OUTLINED_FUNCTION_13();
      v19(v18);
      swift_unknownObjectRelease();
      uint64_t v20 = OUTLINED_FUNCTION_14();
      v21(v20);
      uint64_t v22 = OUTLINED_FUNCTION_31();
      sub_25CF5E084(v22);
      goto LABEL_18;
    case 4:
      LOBYTE(v75[0]) = 4;
      sub_25CF5853C();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.ToCodingKeys, (uint64_t)v75);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633428, &qword_26A633348, (void (*)(void))sub_25CF5DF40);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_15();
      uint64_t v23 = OUTLINED_FUNCTION_13();
      v24(v23);
      swift_unknownObjectRelease();
      uint64_t v25 = OUTLINED_FUNCTION_14();
      v26(v25);
      uint64_t v27 = OUTLINED_FUNCTION_31();
      sub_25CF5DFB8(v27);
      goto LABEL_18;
    case 5:
      LOBYTE(v75[0]) = 5;
      sub_25CF584F0();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.CcCodingKeys, (uint64_t)v75);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633428, &qword_26A633348, (void (*)(void))sub_25CF5DF40);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_15();
      uint64_t v28 = OUTLINED_FUNCTION_13();
      v29(v28);
      swift_unknownObjectRelease();
      uint64_t v30 = OUTLINED_FUNCTION_14();
      v31(v30);
      uint64_t v32 = OUTLINED_FUNCTION_31();
      sub_25CF5DFA0(v32);
      goto LABEL_18;
    case 6:
      LOBYTE(v75[0]) = 6;
      sub_25CF58410();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.BccCodingKeys, (uint64_t)v75);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
      sub_25CF5DFCC(&qword_26A633428, &qword_26A633348, (void (*)(void))sub_25CF5DF40);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_15();
      uint64_t v59 = OUTLINED_FUNCTION_13();
      v60(v59);
      swift_unknownObjectRelease();
      uint64_t v61 = OUTLINED_FUNCTION_14();
      v62(v61);
      uint64_t v63 = OUTLINED_FUNCTION_31();
      sub_25CF5DF8C(v63);
      goto LABEL_18;
    case 7:
      LOBYTE(v75[0]) = 7;
      sub_25CF58378();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys, (uint64_t)v75, v77);
      sub_25CF5DEE0();
      sub_25CF61C10();
      OUTLINED_FUNCTION_15();
      uint64_t v33 = OUTLINED_FUNCTION_16();
      v34(v33);
      swift_unknownObjectRelease();
      uint64_t v35 = OUTLINED_FUNCTION_23();
      v36(v35);
      uint64_t v37 = OUTLINED_FUNCTION_39();
      sub_25CF5DF2C(v37);
      goto LABEL_18;
    case 8:
      LOBYTE(v75[0]) = 8;
      sub_25CF582E0();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for _SiriMailMessage.StateChange.ActionCodingKeys, (uint64_t)v75, v77);
      sub_25CF5DE80();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_15();
      uint64_t v38 = OUTLINED_FUNCTION_16();
      v39(v38);
      swift_unknownObjectRelease();
      uint64_t v40 = OUTLINED_FUNCTION_23();
      v41(v40);
      uint64_t v42 = OUTLINED_FUNCTION_39();
      sub_25CF5DECC(v42);
      goto LABEL_18;
    case 9:
      LOBYTE(v75[0]) = 9;
      sub_25CF58248();
      OUTLINED_FUNCTION_11((uint64_t)&type metadata for _SiriMailMessage.StateChange.StateCodingKeys, (uint64_t)v75, v77);
      sub_25CF5DE1C();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_15();
      uint64_t v64 = OUTLINED_FUNCTION_16();
      v65(v64);
      swift_unknownObjectRelease();
      uint64_t v66 = OUTLINED_FUNCTION_23();
      v67(v66);
      uint64_t v68 = OUTLINED_FUNCTION_39();
      sub_25CF5DE68(v68);
LABEL_18:
      v49 = v75;
      break;
    default:
      LOBYTE(v75[0]) = 0;
      sub_25CF586C8();
      OUTLINED_FUNCTION_9((uint64_t)&type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys, (uint64_t)v75);
      sub_25CF5E0C0();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_15();
      uint64_t v45 = OUTLINED_FUNCTION_34();
      v46(v45);
      swift_unknownObjectRelease();
      uint64_t v47 = OUTLINED_FUNCTION_14();
      v48(v47);
      memcpy(v74, v75, 0x142uLL);
      sub_25CF5E10C((uint64_t)v74);
      v49 = v74;
      break;
  }
  sub_25CF581DC(v49, v76);
  sub_25CF581DC(v76, v70);
  uint64_t v44 = (uint64_t)v73;
LABEL_17:
  __swift_destroy_boxed_opaque_existential_1(v44);
  OUTLINED_FUNCTION_17();
}

void sub_25CF59480()
{
}

void sub_25CF59498()
{
}

uint64_t _SiriMailMessage.to.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _SiriMailMessage.to.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*_SiriMailMessage.to.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.subject.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.subject.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.subject.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.body.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.body.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.body.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.cc.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _SiriMailMessage.cc.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*_SiriMailMessage.cc.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.bcc.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _SiriMailMessage.bcc.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*_SiriMailMessage.bcc.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _SiriMailMessage.attachments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*_SiriMailMessage.attachments.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.replyReference.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.replyReference.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.replyReference.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.toLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.ccLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.bccLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.subjectLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.subjectLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 128) = v2;
  *(void *)(v1 + 136) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.subjectLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.cancelLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.cancelLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 144) = v2;
  *(void *)(v1 + 152) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.cancelLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.cancelledLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.cancelledLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 160) = v2;
  *(void *)(v1 + 168) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.cancelledLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.sendLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.sendLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 176) = v2;
  *(void *)(v1 + 184) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.sendLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.sentLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.sentLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 192) = v2;
  *(void *)(v1 + 200) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.sentLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.messageLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.messageLabel.setter()
{
  OUTLINED_FUNCTION_24();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 208) = v2;
  *(void *)(v1 + 216) = v0;
  return result;
}

uint64_t (*_SiriMailMessage.messageLabel.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.deleteLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.replyLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.nextLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.seeAllLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.moreInMailLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t _SiriMailMessage.newMessageLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

void _SiriMailMessage.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 320);
}

unsigned char *_SiriMailMessage.state.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 320) = *result;
  return result;
}

uint64_t (*_SiriMailMessage.state.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.focusedField.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 321);
}

unsigned char *_SiriMailMessage.focusedField.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 321) = *result;
  return result;
}

uint64_t (*_SiriMailMessage.focusedField.modify())()
{
  return nullsub_1;
}

void __swiftcall _SiriMailMessage.init(toLabel:ccLabel:bccLabel:subjectLabel:cancelLabel:cancelledLabel:sendLabel:sentLabel:messageLabel:deleteLabel:replyLabel:nextLabel:seeAllLabel:moreInMailLabel:newMessageLabel:to:cc:bcc:subject:body:focusedField:attachments:state:replyReference:)(SiriMailUIModel::_SiriMailMessage *__return_ptr retstr, Swift::String toLabel, Swift::String ccLabel, Swift::String bccLabel, Swift::String subjectLabel, Swift::String cancelLabel, Swift::String cancelledLabel, Swift::String sendLabel, Swift::String sentLabel, Swift::String messageLabel, Swift::String deleteLabel, Swift::String replyLabel, Swift::String nextLabel, Swift::String seeAllLabel, Swift::String moreInMailLabel, Swift::String newMessageLabel, Swift::OpaquePointer to, Swift::OpaquePointer cc, Swift::OpaquePointer bcc, Swift::String_optional subject,Swift::String_optional body,SiriMailUIModel::_SiriMailMessage::Field_optional focusedField,Swift::OpaquePointer attachments,SiriMailUIModel::_SiriMailMessage::State state,Swift::String_optional replyReference)
{
  SiriMailUIModel::_SiriMailMessage::Field v25 = *(unsigned char *)focusedField.value;
  SiriMailUIModel::_SiriMailMessage::State v26 = *(unsigned char *)state;
  retstr->to = to;
  retstr->subject = subject;
  retstr->body = body;
  retstr->cc = cc;
  retstr->bcc = bcc;
  retstr->attachments = attachments;
  retstr->replyReference = replyReference;
  retstr->toLabel = toLabel;
  retstr->ccLabel = ccLabel;
  retstr->bccLabel = bccLabel;
  retstr->subjectLabel = subjectLabel;
  retstr->cancelLabel = cancelLabel;
  retstr->cancelledLabel = cancelledLabel;
  retstr->sendLabel = sendLabel;
  retstr->sentLabel = sentLabel;
  retstr->messageLabel = messageLabel;
  retstr->deleteLabel = deleteLabel;
  retstr->replyLabel = replyLabel;
  retstr->nextLabel = nextLabel;
  retstr->seeAllLabel = seeAllLabel;
  retstr->moreInMailLabel = moreInMailLabel;
  retstr->newMessageLabel = newMessageLabel;
  retstr->state = v26;
  retstr->focusedField.value = v25;
}

void __swiftcall _SiriMailMessage.init(to:cc:bcc:subject:body:focusedField:attachments:state:replyReference:newMessageLabel:)(SiriMailUIModel::_SiriMailMessage *__return_ptr retstr, Swift::OpaquePointer to, Swift::OpaquePointer cc, Swift::OpaquePointer bcc, Swift::String_optional subject, Swift::String_optional body, SiriMailUIModel::_SiriMailMessage::Field_optional focusedField, Swift::OpaquePointer attachments, SiriMailUIModel::_SiriMailMessage::State state, Swift::String_optional replyReference, Swift::String newMessageLabel)
{
  SiriMailUIModel::_SiriMailMessage::Field v11 = *(unsigned char *)focusedField.value;
  SiriMailUIModel::_SiriMailMessage::State v12 = *(unsigned char *)state;
  retstr->to = to;
  retstr->subject = subject;
  retstr->body = body;
  retstr->cc = cc;
  retstr->bcc = bcc;
  retstr->attachments = attachments;
  retstr->replyReference = replyReference;
  retstr->toLabel._countAndFlagsBits = 0;
  retstr->toLabel._object = (void *)0xE000000000000000;
  retstr->ccLabel._countAndFlagsBits = 0;
  retstr->ccLabel._object = (void *)0xE000000000000000;
  retstr->bccLabel._countAndFlagsBits = 0;
  retstr->bccLabel._object = (void *)0xE000000000000000;
  retstr->subjectLabel._countAndFlagsBits = 0;
  retstr->subjectLabel._object = (void *)0xE000000000000000;
  retstr->cancelLabel._countAndFlagsBits = 0;
  retstr->cancelLabel._object = (void *)0xE000000000000000;
  retstr->cancelledLabel._countAndFlagsBits = 0;
  retstr->cancelledLabel._object = (void *)0xE000000000000000;
  retstr->sendLabel._countAndFlagsBits = 0;
  retstr->sendLabel._object = (void *)0xE000000000000000;
  retstr->sentLabel._countAndFlagsBits = 0;
  retstr->sentLabel._object = (void *)0xE000000000000000;
  retstr->messageLabel._countAndFlagsBits = 0;
  retstr->messageLabel._object = (void *)0xE000000000000000;
  retstr->deleteLabel._countAndFlagsBits = 0;
  retstr->deleteLabel._object = (void *)0xE000000000000000;
  retstr->replyLabel._countAndFlagsBits = 0;
  retstr->replyLabel._object = (void *)0xE000000000000000;
  retstr->nextLabel._countAndFlagsBits = 0;
  retstr->nextLabel._object = (void *)0xE000000000000000;
  retstr->seeAllLabel._countAndFlagsBits = 0;
  retstr->seeAllLabel._object = (void *)0xE000000000000000;
  retstr->moreInMailLabel._countAndFlagsBits = 0;
  retstr->moreInMailLabel._object = (void *)0xE000000000000000;
  retstr->newMessageLabel = newMessageLabel;
  retstr->state = v12;
  retstr->focusedField.value = v11;
}

uint64_t static _SiriMailMessage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v119 = *(void *)(a1 + 48);
  uint64_t v120 = *(void *)(a1 + 40);
  uint64_t v118 = *(void *)(a1 + 56);
  uint64_t v110 = *(void *)(a1 + 64);
  uint64_t v116 = *(void *)(a1 + 72);
  uint64_t v113 = *(void *)(a1 + 88);
  uint64_t v114 = *(void *)(a1 + 80);
  uint64_t v107 = *(void *)(a1 + 104);
  uint64_t v108 = *(void *)(a1 + 96);
  uint64_t v103 = *(void *)(a1 + 120);
  uint64_t v104 = *(void *)(a1 + 112);
  uint64_t v100 = *(void *)(a1 + 128);
  uint64_t v99 = *(void *)(a1 + 136);
  uint64_t v95 = *(void *)(a1 + 152);
  uint64_t v96 = *(void *)(a1 + 144);
  uint64_t v91 = *(void *)(a1 + 168);
  uint64_t v92 = *(void *)(a1 + 160);
  uint64_t v87 = *(void *)(a1 + 184);
  uint64_t v88 = *(void *)(a1 + 176);
  uint64_t v83 = *(void *)(a1 + 200);
  uint64_t v84 = *(void *)(a1 + 192);
  uint64_t v79 = *(void *)(a1 + 216);
  uint64_t v80 = *(void *)(a1 + 208);
  uint64_t v75 = *(void *)(a1 + 232);
  uint64_t v76 = *(void *)(a1 + 224);
  uint64_t v71 = *(void *)(a1 + 248);
  uint64_t v72 = *(void *)(a1 + 240);
  uint64_t v67 = *(void *)(a1 + 264);
  uint64_t v68 = *(void *)(a1 + 256);
  uint64_t v63 = *(void *)(a1 + 280);
  uint64_t v64 = *(void *)(a1 + 272);
  uint64_t v59 = *(void *)(a1 + 296);
  uint64_t v60 = *(void *)(a1 + 288);
  uint64_t v55 = *(void *)(a1 + 312);
  uint64_t v56 = *(void *)(a1 + 304);
  unsigned __int8 v52 = *(unsigned char *)(a1 + 320);
  int v50 = *(unsigned __int8 *)(a1 + 321);
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v117 = *(void *)(a2 + 56);
  uint64_t v109 = *(void *)(a2 + 64);
  uint64_t v115 = *(void *)(a2 + 72);
  uint64_t v111 = *(void *)(a2 + 88);
  uint64_t v112 = *(void *)(a2 + 80);
  uint64_t v105 = *(void *)(a2 + 104);
  uint64_t v106 = *(void *)(a2 + 96);
  uint64_t v101 = *(void *)(a2 + 120);
  uint64_t v102 = *(void *)(a2 + 112);
  uint64_t v97 = *(void *)(a2 + 136);
  uint64_t v98 = *(void *)(a2 + 128);
  uint64_t v93 = *(void *)(a2 + 152);
  uint64_t v94 = *(void *)(a2 + 144);
  uint64_t v89 = *(void *)(a2 + 168);
  uint64_t v90 = *(void *)(a2 + 160);
  uint64_t v85 = *(void *)(a2 + 184);
  uint64_t v86 = *(void *)(a2 + 176);
  uint64_t v81 = *(void *)(a2 + 200);
  uint64_t v82 = *(void *)(a2 + 192);
  uint64_t v77 = *(void *)(a2 + 216);
  uint64_t v78 = *(void *)(a2 + 208);
  uint64_t v73 = *(void *)(a2 + 232);
  uint64_t v74 = *(void *)(a2 + 224);
  uint64_t v69 = *(void *)(a2 + 248);
  uint64_t v70 = *(void *)(a2 + 240);
  uint64_t v65 = *(void *)(a2 + 264);
  uint64_t v66 = *(void *)(a2 + 256);
  uint64_t v61 = *(void *)(a2 + 280);
  uint64_t v62 = *(void *)(a2 + 272);
  uint64_t v57 = *(void *)(a2 + 296);
  uint64_t v58 = *(void *)(a2 + 288);
  uint64_t v53 = *(void *)(a2 + 312);
  uint64_t v54 = *(void *)(a2 + 304);
  char v51 = *(unsigned char *)(a2 + 320);
  int v49 = *(unsigned __int8 *)(a2 + 321);
  if ((sub_25CF5A404(*(void *)a1, *(void *)a2) & 1) == 0) {
    return 0;
  }
  if (!v2)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_11;
  }
  if (!v8) {
    return 0;
  }
  BOOL v12 = v3 == v6 && v2 == v8;
  if (v12 || (sub_25CF61CA0(), uint64_t result = OUTLINED_FUNCTION_10(), (v14 & 1) != 0))
  {
LABEL_11:
    if (v5)
    {
      if (!v9) {
        return 0;
      }
      if (v4 != v7 || v5 != v9)
      {
        sub_25CF61CA0();
        uint64_t result = OUTLINED_FUNCTION_10();
        if ((v16 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v9)
    {
      return 0;
    }
    if ((sub_25CF5A404(v120, v10) & 1) == 0
      || (sub_25CF5A404(v119, v11) & 1) == 0
      || (sub_25CF5A4E0(v118, v117) & 1) == 0)
    {
      return 0;
    }
    if (v116)
    {
      if (!v115) {
        return 0;
      }
      if (v110 != v109 || v116 != v115)
      {
        sub_25CF61CA0();
        uint64_t result = OUTLINED_FUNCTION_10();
        if ((v18 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v115)
    {
      return 0;
    }
    if (v114 != v112 || v113 != v111)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v20 & 1) == 0) {
        return result;
      }
    }
    if (v108 != v106 || v107 != v105)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v22 & 1) == 0) {
        return result;
      }
    }
    if (v104 != v102 || v103 != v101)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v24 & 1) == 0) {
        return result;
      }
    }
    if (v100 != v98 || v99 != v97)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v26 & 1) == 0) {
        return result;
      }
    }
    if (v96 != v94 || v95 != v93)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v28 & 1) == 0) {
        return result;
      }
    }
    if (v92 != v90 || v91 != v89)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v30 & 1) == 0) {
        return result;
      }
    }
    if (v88 != v86 || v87 != v85)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v32 & 1) == 0) {
        return result;
      }
    }
    if (v84 != v82 || v83 != v81)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v34 & 1) == 0) {
        return result;
      }
    }
    if (v80 != v78 || v79 != v77)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v36 & 1) == 0) {
        return result;
      }
    }
    if (v76 != v74 || v75 != v73)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v38 & 1) == 0) {
        return result;
      }
    }
    if (v72 != v70 || v71 != v69)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v40 & 1) == 0) {
        return result;
      }
    }
    if (v68 != v66 || v67 != v65)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v42 & 1) == 0) {
        return result;
      }
    }
    if (v64 != v62 || v63 != v61)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v44 & 1) == 0) {
        return result;
      }
    }
    if (v60 != v58 || v59 != v57)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v46 & 1) == 0) {
        return result;
      }
    }
    if (v56 != v54 || v55 != v53)
    {
      sub_25CF61CA0();
      uint64_t result = OUTLINED_FUNCTION_10();
      if ((v48 & 1) == 0) {
        return result;
      }
    }
    if (sub_25CF54948(v52, v51))
    {
      if (v50 == 5)
      {
        if (v49 == 5) {
          return 1;
        }
      }
      else if (v49 != 5 && (sub_25CF547E8(v50, v49) & 1) != 0)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_25CF5A404(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 56);
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 2);
      uint64_t v6 = *(v4 - 1);
      uint64_t v7 = *v4;
      uint64_t v8 = *(v3 - 2);
      uint64_t v9 = *(v3 - 1);
      uint64_t v10 = *v3;
      if (v5)
      {
        if (!v8) {
          return 0;
        }
        BOOL v11 = *(v4 - 3) == *(v3 - 3) && v5 == v8;
        if (!v11 && (sub_25CF61CA0() & 1) == 0) {
          return 0;
        }
      }
      else if (v8)
      {
        return 0;
      }
      BOOL v12 = v6 == v9 && v7 == v10;
      if (!v12 && (sub_25CF61CA0() & 1) == 0) {
        return 0;
      }
      v3 += 4;
      v4 += 4;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_25CF5A4E0(uint64_t a1, uint64_t a2)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 48);
    uint64_t v4 = (void *)(a2 + 48);
    while (1)
    {
      uint64_t v6 = *(v3 - 2);
      unint64_t v5 = *(v3 - 1);
      uint64_t v7 = *v3;
      uint64_t v8 = v3[1];
      uint64_t v111 = v3[2];
      uint64_t v9 = v3[4];
      uint64_t v10 = v3[5];
      uint64_t v12 = *(v4 - 2);
      unint64_t v11 = *(v4 - 1);
      uint64_t v13 = *v4;
      uint64_t v118 = v4[1];
      uint64_t v14 = v4[2];
      uint64_t v116 = v3[3];
      uint64_t v117 = v4[3];
      v3 += 8;
      uint64_t v15 = 0;
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v15) = HIDWORD(v6) - v6;
          if (__OFSUB__(HIDWORD(v6), v6))
          {
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
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
          }
          uint64_t v15 = (int)v15;
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v6 + 16);
          uint64_t v16 = *(void *)(v6 + 24);
          BOOL v18 = __OFSUB__(v16, v17);
          uint64_t v15 = v16 - v17;
          if (!v18) {
            break;
          }
          goto LABEL_141;
        case 3uLL:
          break;
        default:
          uint64_t v15 = BYTE6(v5);
          break;
      }
      unint64_t v114 = v5;
      uint64_t v115 = v10;
      unint64_t v19 = v11 >> 62;
      uint64_t v113 = v6;
      uint64_t v107 = v2;
      uint64_t v109 = v9;
      uint64_t v112 = v4[5];
      uint64_t v108 = v4[4];
      uint64_t v106 = v4;
      uint64_t v110 = *(v4 - 2);
      switch(v11 >> 62)
      {
        case 1uLL:
          LODWORD(v20) = HIDWORD(v12) - v12;
          if (__OFSUB__(HIDWORD(v12), v12)) {
            goto LABEL_142;
          }
          uint64_t v20 = (int)v20;
LABEL_15:
          if (v15 != v20) {
            return 0;
          }
          if (v15 < 1)
          {
LABEL_27:
            uint64_t v28 = *(v4 - 2);
            uint64_t v29 = v4[2];
            uint64_t v30 = v7;
            sub_25CF55AE8(v6, v5);
            swift_bridgeObjectRetain();
            uint64_t v31 = v116;
            swift_bridgeObjectRetain();
            uint64_t v32 = v115;
            swift_bridgeObjectRetain();
            uint64_t v33 = v28;
            unint64_t v34 = v11;
            sub_25CF55AE8(v33, v11);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v35 = v30;
            uint64_t v14 = v29;
            uint64_t v36 = v111;
          }
          else
          {
            uint64_t v23 = v12 >> 32;
            uint64_t v105 = v7;
            switch(v5 >> 62)
            {
              case 1uLL:
                uint64_t v93 = *v4;
                uint64_t v95 = v12 >> 32;
                uint64_t v101 = v4[2];
                uint64_t v37 = (int)v6;
                if ((int)v6 > v6 >> 32) {
                  goto LABEL_144;
                }
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v6, v114);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_25CF55AE8(v12, v11);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_25CF55AE8(v6, v114);
                uint64_t v38 = sub_25CF61B00();
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = sub_25CF61B20();
                  if (__OFSUB__(v37, v40)) {
                    goto LABEL_146;
                  }
                  uint64_t v92 = (void *)(v39 + v37 - v40);
                }
                else
                {
                  uint64_t v92 = 0;
                }
                sub_25CF61B10();
                if (v19)
                {
                  if (v19 == 1)
                  {
                    if (v95 < (int)v12) {
                      goto LABEL_152;
                    }
                    swift_retain();
                    uint64_t v55 = (char *)sub_25CF61B00();
                    uint64_t v49 = v115;
                    if (v55)
                    {
                      uint64_t v56 = sub_25CF61B20();
                      if (__OFSUB__((int)v12, v56)) {
                        goto LABEL_162;
                      }
                      v55 += (int)v12 - v56;
                    }
                    uint64_t v57 = sub_25CF61B10();
                    int64_t v58 = v95 - (int)v12;
                    if (v57 < v58) {
                      int64_t v58 = v57;
                    }
                    if (!v92) {
                      goto LABEL_166;
                    }
                    uint64_t v53 = v116;
                    if (!v55) {
                      goto LABEL_167;
                    }
                    int v54 = memcmp(v92, v55, v58);
                    sub_25CF565F4(v12, v11);
                    sub_25CF565F4(v12, v11);
                    sub_25CF565F4(v113, v114);
LABEL_92:
                    sub_25CF565F4(v12, v11);
                  }
                  else
                  {
                    uint64_t v75 = *(void *)(v12 + 16);
                    uint64_t v76 = *(void *)(v12 + 24);
                    swift_retain();
                    swift_retain();
                    uint64_t v77 = (char *)sub_25CF61B00();
                    if (v77)
                    {
                      uint64_t v78 = sub_25CF61B20();
                      if (__OFSUB__(v75, v78)) {
                        goto LABEL_161;
                      }
                      v77 += v75 - v78;
                    }
                    BOOL v18 = __OFSUB__(v76, v75);
                    int64_t v79 = v76 - v75;
                    if (v18) {
                      goto LABEL_154;
                    }
                    uint64_t v80 = sub_25CF61B10();
                    if (v80 >= v79) {
                      size_t v81 = v79;
                    }
                    else {
                      size_t v81 = v80;
                    }
                    uint64_t v14 = v101;
                    if (!v92) {
                      goto LABEL_172;
                    }
                    uint64_t v49 = v115;
                    if (!v77) {
                      goto LABEL_173;
                    }
                    int v54 = memcmp(v92, v77, v81);
                    swift_release();
                    swift_release();
                    sub_25CF565F4(v12, v11);
                    sub_25CF565F4(v113, v114);
                    sub_25CF565F4(v12, v11);
                    uint64_t v53 = v116;
                  }
                }
                else
                {
                  __s1[0] = v12;
                  LOWORD(__s1[1]) = v11;
                  BYTE2(__s1[1]) = BYTE2(v11);
                  BYTE3(__s1[1]) = BYTE3(v11);
                  BYTE4(__s1[1]) = BYTE4(v11);
                  BYTE5(__s1[1]) = BYTE5(v11);
                  uint64_t v53 = v116;
                  if (!v92) {
                    goto LABEL_171;
                  }
                  int v54 = memcmp(v92, __s1, BYTE6(v11));
                  sub_25CF565F4(v12, v11);
                  sub_25CF565F4(v113, v114);
                  sub_25CF565F4(v12, v11);
                  uint64_t v49 = v115;
                }
                unint64_t v34 = v11;
                sub_25CF565F4(v12, v11);
                uint64_t v35 = v105;
                uint64_t v36 = v111;
                uint64_t v31 = v53;
                uint64_t v32 = v49;
                uint64_t v13 = v93;
                if (v54) {
                  goto LABEL_138;
                }
                break;
              case 2uLL:
                uint64_t v93 = *v4;
                uint64_t v96 = v12 >> 32;
                uint64_t v102 = v4[2];
                uint64_t v90 = *(char **)(v6 + 16);
                unint64_t v41 = v5;
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v6, v41);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_25CF55AE8(v12, v11);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_retain();
                swift_retain();
                uint64_t v42 = sub_25CF61B00();
                if (v42)
                {
                  uint64_t v43 = v42;
                  uint64_t v44 = sub_25CF61B20();
                  if (__OFSUB__(v90, v44)) {
                    goto LABEL_145;
                  }
                  uint64_t v91 = &v90[v43 - v44];
                }
                else
                {
                  uint64_t v91 = 0;
                }
                sub_25CF61B10();
                if (v19)
                {
                  if (v19 == 1)
                  {
                    if (v96 < (int)v12) {
                      goto LABEL_149;
                    }
                    swift_retain();
                    char v48 = (char *)sub_25CF61B00();
                    uint64_t v49 = v115;
                    if (v48)
                    {
                      uint64_t v50 = sub_25CF61B20();
                      if (__OFSUB__((int)v12, v50)) {
                        goto LABEL_160;
                      }
                      v48 += (int)v12 - v50;
                    }
                    uint64_t v51 = sub_25CF61B10();
                    int64_t v52 = v96 - (int)v12;
                    if (v51 < v52) {
                      int64_t v52 = v51;
                    }
                    if (!v91) {
                      goto LABEL_164;
                    }
                    uint64_t v53 = v116;
                    if (!v48) {
                      goto LABEL_165;
                    }
                    int v54 = memcmp(v91, v48, v52);
                    sub_25CF565F4(v12, v11);
                    sub_25CF565F4(v12, v11);
                    swift_release();
                    swift_release();
                  }
                  else
                  {
                    uint64_t v68 = *(void *)(v12 + 16);
                    uint64_t v69 = *(void *)(v12 + 24);
                    swift_retain();
                    swift_retain();
                    uint64_t v70 = (char *)sub_25CF61B00();
                    if (v70)
                    {
                      uint64_t v71 = sub_25CF61B20();
                      if (__OFSUB__(v68, v71)) {
                        goto LABEL_159;
                      }
                      v70 += v68 - v71;
                    }
                    BOOL v18 = __OFSUB__(v69, v68);
                    int64_t v72 = v69 - v68;
                    if (v18) {
                      goto LABEL_153;
                    }
                    uint64_t v73 = sub_25CF61B10();
                    if (v73 >= v72) {
                      size_t v74 = v72;
                    }
                    else {
                      size_t v74 = v73;
                    }
                    uint64_t v14 = v102;
                    if (!v91) {
                      goto LABEL_169;
                    }
                    uint64_t v49 = v115;
                    if (!v70) {
                      goto LABEL_170;
                    }
                    int v54 = memcmp(v91, v70, v74);
                    swift_release();
                    swift_release();
                    sub_25CF565F4(v12, v11);
                    swift_release();
                    swift_release();
                    uint64_t v53 = v116;
                  }
                }
                else
                {
                  __s1[0] = v12;
                  LOWORD(__s1[1]) = v11;
                  BYTE2(__s1[1]) = BYTE2(v11);
                  BYTE3(__s1[1]) = BYTE3(v11);
                  BYTE4(__s1[1]) = BYTE4(v11);
                  BYTE5(__s1[1]) = BYTE5(v11);
                  uint64_t v53 = v116;
                  if (!v91) {
                    goto LABEL_168;
                  }
                  int v54 = memcmp(v91, __s1, BYTE6(v11));
                  sub_25CF565F4(v12, v11);
                  swift_release();
                  swift_release();
                  uint64_t v49 = v115;
                }
                goto LABEL_92;
              case 3uLL:
                memset(__s1, 0, 14);
                if (v19)
                {
                  if (v19 == 1)
                  {
                    uint64_t v94 = v12 >> 32;
                    if (v23 < (int)v12) {
                      goto LABEL_148;
                    }
                    uint64_t v24 = (int)v12;
                    sub_25CF55AE8(v12, v11);
                    sub_25CF55AE8(v12, v11);
                    sub_25CF55AE8(v6, v114);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_25CF55AE8(v12, v11);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    SiriMailUIModel::_SiriMailMessage::Field v25 = (char *)sub_25CF61B00();
                    if (v25)
                    {
                      uint64_t v45 = sub_25CF61B20();
                      if (__OFSUB__((int)v12, v45)) {
                        goto LABEL_158;
                      }
                      v25 += (int)v12 - v45;
                    }
                    uint64_t v27 = sub_25CF61B10();
                    if (!v25) {
                      goto LABEL_163;
                    }
LABEL_42:
                    if (v27 >= v94 - v24) {
                      size_t v46 = v94 - v24;
                    }
                    else {
                      size_t v46 = v27;
                    }
                    int v47 = memcmp(__s1, v25, v46);
                  }
                  else
                  {
                    uint64_t v104 = v14;
                    unint64_t v65 = v5;
                    uint64_t v98 = *(void *)(v12 + 24);
                    uint64_t v100 = *(void *)(v12 + 16);
                    sub_25CF55AE8(v12, v11);
                    sub_25CF55AE8(v12, v11);
                    sub_25CF55AE8(v6, v65);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_25CF55AE8(v12, v11);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_retain();
                    swift_retain();
                    uint64_t v60 = (char *)sub_25CF61B00();
                    if (v60)
                    {
                      uint64_t v66 = sub_25CF61B20();
                      uint64_t v67 = v100;
                      if (__OFSUB__(v100, v66)) {
                        goto LABEL_156;
                      }
                      v60 += v100 - v66;
                      uint64_t v14 = v104;
                    }
                    else
                    {
                      uint64_t v14 = v104;
                      uint64_t v67 = v100;
                    }
                    int64_t v82 = v98 - v67;
                    if (__OFSUB__(v98, v67)) {
                      goto LABEL_151;
                    }
                    uint64_t v83 = sub_25CF61B10();
                    if (!v60) {
                      goto LABEL_175;
                    }
LABEL_114:
                    if (v83 >= v82) {
                      size_t v84 = v82;
                    }
                    else {
                      size_t v84 = v83;
                    }
                    int v47 = memcmp(__s1, v60, v84);
                    swift_release();
                    swift_release();
                  }
                  sub_25CF565F4(v12, v11);
                  unint64_t v34 = v11;
                  sub_25CF565F4(v12, v11);
                  uint64_t v32 = v115;
                  uint64_t v31 = v116;
                  uint64_t v35 = v105;
                  uint64_t v36 = v111;
                  if (v47) {
                    goto LABEL_138;
                  }
                }
                else
                {
                  uint64_t __s2 = v12;
LABEL_75:
                  __int16 v120 = v11;
                  char v121 = BYTE2(v11);
                  char v122 = BYTE3(v11);
                  char v123 = BYTE4(v11);
                  char v124 = BYTE5(v11);
                  sub_25CF55AE8(v6, v5);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  uint64_t v63 = v12;
                  uint64_t v31 = v116;
                  unint64_t v34 = v11;
                  sub_25CF55AE8(v63, v11);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  uint64_t v32 = v115;
                  int v64 = memcmp(__s1, &__s2, BYTE6(v11));
                  uint64_t v35 = v105;
                  uint64_t v36 = v111;
                  if (v64) {
                    goto LABEL_138;
                  }
                }
                break;
              default:
                __s1[0] = v6;
                LOWORD(__s1[1]) = v5;
                BYTE2(__s1[1]) = BYTE2(v5);
                BYTE3(__s1[1]) = BYTE3(v5);
                BYTE4(__s1[1]) = BYTE4(v5);
                BYTE5(__s1[1]) = BYTE5(v5);
                if (!v19)
                {
                  uint64_t __s2 = v12;
                  goto LABEL_75;
                }
                if (v19 == 1)
                {
                  uint64_t v94 = v12 >> 32;
                  if (v23 < (int)v12) {
                    goto LABEL_147;
                  }
                  uint64_t v24 = (int)v12;
                  sub_25CF55AE8(v12, v11);
                  sub_25CF55AE8(v12, v11);
                  sub_25CF55AE8(v6, v114);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_25CF55AE8(v12, v11);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  SiriMailUIModel::_SiriMailMessage::Field v25 = (char *)sub_25CF61B00();
                  if (v25)
                  {
                    uint64_t v26 = sub_25CF61B20();
                    if (__OFSUB__((int)v12, v26)) {
                      goto LABEL_157;
                    }
                    v25 += (int)v12 - v26;
                  }
                  uint64_t v27 = sub_25CF61B10();
                  if (!v25)
                  {
                    __break(1u);
LABEL_163:
                    __break(1u);
LABEL_164:
                    __break(1u);
LABEL_165:
                    __break(1u);
LABEL_166:
                    __break(1u);
LABEL_167:
                    __break(1u);
LABEL_168:
                    __break(1u);
LABEL_169:
                    __break(1u);
LABEL_170:
                    __break(1u);
LABEL_171:
                    __break(1u);
LABEL_172:
                    __break(1u);
LABEL_173:
                    __break(1u);
LABEL_174:
                    __break(1u);
LABEL_175:
                    __break(1u);
                    JUMPOUT(0x25CF5B484);
                  }
                  goto LABEL_42;
                }
                uint64_t v103 = v14;
                unint64_t v59 = v5;
                uint64_t v97 = *(void *)(v12 + 24);
                uint64_t v99 = *(void *)(v12 + 16);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v12, v11);
                sub_25CF55AE8(v6, v59);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_25CF55AE8(v12, v11);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_retain();
                swift_retain();
                uint64_t v60 = (char *)sub_25CF61B00();
                if (v60)
                {
                  uint64_t v61 = sub_25CF61B20();
                  uint64_t v62 = v99;
                  if (__OFSUB__(v99, v61)) {
                    goto LABEL_155;
                  }
                  v60 += v99 - v61;
                  uint64_t v14 = v103;
                }
                else
                {
                  uint64_t v14 = v103;
                  uint64_t v62 = v99;
                }
                int64_t v82 = v97 - v62;
                if (__OFSUB__(v97, v62)) {
                  goto LABEL_150;
                }
                uint64_t v83 = sub_25CF61B10();
                if (!v60) {
                  goto LABEL_174;
                }
                goto LABEL_114;
            }
          }
          BOOL v85 = v35 == v13 && v8 == v118;
          if (!v85 && (sub_25CF61CA0() & 1) == 0
            || (v36 == v14 ? (BOOL v86 = v31 == v117) : (BOOL v86 = 0), !v86 && (sub_25CF61CA0() & 1) == 0))
          {
LABEL_138:
            sub_25CF565F4(v110, v34);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_25CF565F4(v113, v114);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return 0;
          }
          if (v109 == v108 && v32 == v112)
          {
            sub_25CF565F4(v110, v34);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_25CF565F4(v113, v114);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v88 = sub_25CF61CA0();
            sub_25CF565F4(v110, v34);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_25CF565F4(v113, v114);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v88 & 1) == 0) {
              return 0;
            }
          }
          uint64_t v4 = v106 + 8;
          uint64_t v2 = v107 - 1;
          if (v107 == 1) {
            return 1;
          }
          break;
        case 2uLL:
          uint64_t v22 = *(void *)(v12 + 16);
          uint64_t v21 = *(void *)(v12 + 24);
          BOOL v18 = __OFSUB__(v21, v22);
          uint64_t v20 = v21 - v22;
          if (!v18) {
            goto LABEL_15;
          }
          goto LABEL_143;
        case 3uLL:
          if (!v15) {
            goto LABEL_27;
          }
          return 0;
        default:
          uint64_t v20 = BYTE6(v11);
          goto LABEL_15;
      }
    }
  }
  return 1;
}

uint64_t sub_25CF5B4B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v2 || (sub_25CF61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_25CF61CA0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_25CF61CA0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 25443 && a2 == 0xE200000000000000;
        if (v8 || (sub_25CF61CA0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 6513506 && a2 == 0xE300000000000000;
          if (v9 || (sub_25CF61CA0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
            if (v10 || (sub_25CF61CA0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x666552796C706572 && a2 == 0xEE0065636E657265;
              if (v11 || (sub_25CF61CA0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x6C6562614C6F74 && a2 == 0xE700000000000000;
                if (v12 || (sub_25CF61CA0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x6C6562614C6363 && a2 == 0xE700000000000000;
                  if (v13 || (sub_25CF61CA0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x6C6562614C636362 && a2 == 0xE800000000000000;
                    if (v14 || (sub_25CF61CA0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x4C7463656A627573 && a2 == 0xEC0000006C656261;
                      if (v15 || (sub_25CF61CA0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x614C6C65636E6163 && a2 == 0xEB000000006C6562;
                        if (v16 || (sub_25CF61CA0() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x656C6C65636E6163 && a2 == 0xEE006C6562614C64;
                          if (v17 || (sub_25CF61CA0() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x6562614C646E6573 && a2 == 0xE90000000000006CLL;
                            if (v18 || (sub_25CF61CA0() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x6562614C746E6573 && a2 == 0xE90000000000006CLL;
                              if (v19 || (sub_25CF61CA0() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x4C6567617373656DLL && a2 == 0xEC0000006C656261;
                                if (v20 || (sub_25CF61CA0() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 15;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x614C6574656C6564 && a2 == 0xEB000000006C6562;
                                  if (v21 || (sub_25CF61CA0() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 16;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 0x62614C796C706572 && a2 == 0xEA00000000006C65;
                                    if (v22 || (sub_25CF61CA0() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 17;
                                    }
                                    else
                                    {
                                      BOOL v23 = a1 == 0x6562614C7478656ELL && a2 == 0xE90000000000006CLL;
                                      if (v23 || (sub_25CF61CA0() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 18;
                                      }
                                      else
                                      {
                                        BOOL v24 = a1 == 0x614C6C6C41656573 && a2 == 0xEB000000006C6562;
                                        if (v24 || (sub_25CF61CA0() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 19;
                                        }
                                        else
                                        {
                                          BOOL v25 = a1 == 0x614D6E4965726F6DLL && a2 == 0xEF6C6562614C6C69;
                                          if (v25 || (sub_25CF61CA0() & 1) != 0)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 20;
                                          }
                                          else
                                          {
                                            BOOL v26 = a1 == 0x617373654D77656ELL && a2 == 0xEF6C6562614C6567;
                                            if (v26 || (sub_25CF61CA0() & 1) != 0)
                                            {
                                              swift_bridgeObjectRelease();
                                              return 21;
                                            }
                                            else
                                            {
                                              BOOL v27 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
                                              if (v27 || (sub_25CF61CA0() & 1) != 0)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 22;
                                              }
                                              else if (a1 == 0x4664657375636F66 && a2 == 0xEC000000646C6569)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 23;
                                              }
                                              else
                                              {
                                                char v29 = sub_25CF61CA0();
                                                swift_bridgeObjectRelease();
                                                if (v29) {
                                                  return 23;
                                                }
                                                else {
                                                  return 24;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25CF5BE8C()
{
  return 24;
}

uint64_t sub_25CF5BE94()
{
  return sub_25CF61CE0();
}

uint64_t sub_25CF5BED4(char a1)
{
  uint64_t result = 28532;
  switch(a1)
  {
    case 1:
      return 0x7463656A627573;
    case 2:
      return 2036625250;
    case 3:
      return 25443;
    case 4:
      return 6513506;
    case 5:
      return 0x656D686361747461;
    case 6:
      return 0x666552796C706572;
    case 7:
      return 0x6C6562614C6F74;
    case 8:
      return 0x6C6562614C6363;
    case 9:
      return 0x6C6562614C636362;
    case 10:
      return 0x4C7463656A627573;
    case 11:
      uint64_t v3 = 0x6C65636E6163;
      goto LABEL_23;
    case 12:
      return 0x656C6C65636E6163;
    case 13:
      unsigned int v4 = 1684956531;
      goto LABEL_21;
    case 14:
      unsigned int v4 = 1953391987;
      goto LABEL_21;
    case 15:
      return 0x4C6567617373656DLL;
    case 16:
      uint64_t v3 = 0x6574656C6564;
      goto LABEL_23;
    case 17:
      return 0x62614C796C706572;
    case 18:
      unsigned int v4 = 1954047342;
LABEL_21:
      uint64_t result = v4 | 0x6562614C00000000;
      break;
    case 19:
      uint64_t v3 = 0x6C6C41656573;
LABEL_23:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x614C000000000000;
      break;
    case 20:
      uint64_t result = 0x614D6E4965726F6DLL;
      break;
    case 21:
      uint64_t result = 0x617373654D77656ELL;
      break;
    case 22:
      uint64_t result = 0x6574617473;
      break;
    case 23:
      uint64_t result = 0x4664657375636F66;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CF5C19C()
{
  return sub_25CF5BED4(*v0);
}

uint64_t sub_25CF5C1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25CF5B4B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25CF5C1CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CF5BE8C();
  *a1 = result;
  return result;
}

uint64_t sub_25CF5C1F4(uint64_t a1)
{
  unint64_t v2 = sub_25CF5E11C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CF5C230(uint64_t a1)
{
  unint64_t v2 = sub_25CF5E11C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void _SiriMailMessage.encode(to:)()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A633450);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25CF5E11C();
  OUTLINED_FUNCTION_45();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
  sub_25CF5DFCC(&qword_26A633350, &qword_26A633348, (void (*)(void))sub_25CF584A4);
  sub_25CF61C90();
  if (!v0)
  {
    OUTLINED_FUNCTION_12(1);
    sub_25CF61C60();
    OUTLINED_FUNCTION_12(2);
    sub_25CF61C60();
    OUTLINED_FUNCTION_28(3);
    OUTLINED_FUNCTION_28(4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A633378);
    sub_25CF5DFCC(&qword_26A633380, &qword_26A633378, (void (*)(void))sub_25CF585D4);
    sub_25CF61C90();
    OUTLINED_FUNCTION_12(6);
    sub_25CF61C60();
    OUTLINED_FUNCTION_12(7);
    sub_25CF61C80();
    OUTLINED_FUNCTION_12(8);
    sub_25CF61C80();
    OUTLINED_FUNCTION_12(9);
    sub_25CF61C80();
    OUTLINED_FUNCTION_12(10);
    sub_25CF61C80();
    OUTLINED_FUNCTION_12(11);
    sub_25CF61C80();
    OUTLINED_FUNCTION_12(12);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(13);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(14);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(15);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(16);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(17);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(18);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(19);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(20);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_12(21);
    OUTLINED_FUNCTION_4();
    sub_25CF58294();
    OUTLINED_FUNCTION_40();
    sub_25CF61C90();
    sub_25CF583C4();
    OUTLINED_FUNCTION_40();
    sub_25CF61C70();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_17();
}

void _SiriMailMessage.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  OUTLINED_FUNCTION_19();
  BOOL v15 = v14;
  BOOL v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A633460);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_25CF5E11C();
  sub_25CF61CF0();
  if (v13)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v86 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A633348);
    sub_25CF5DFCC(&qword_26A633428, &qword_26A633348, (void (*)(void))sub_25CF5DF40);
    sub_25CF61C30();
    uint64_t v85 = (uint64_t)v15;
    swift_bridgeObjectRetain();
    uint64_t v66 = v91[0];
    uint64_t v18 = OUTLINED_FUNCTION_36();
    uint64_t v20 = v19;
    uint64_t v84 = v18;
    LOBYTE(v91[0]) = 2;
    swift_bridgeObjectRetain();
    uint64_t v88 = v20;
    uint64_t v83 = OUTLINED_FUNCTION_36();
    uint64_t v89 = v21;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27();
    uint64_t v65 = v91[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A633378);
    sub_25CF5DFCC(&qword_26A633438, &qword_26A633378, (void (*)(void))sub_25CF5E038);
    swift_bridgeObjectRetain();
    sub_25CF61C30();
    uint64_t v64 = v91[0];
    swift_bridgeObjectRetain();
    uint64_t v63 = v91[0];
    uint64_t v82 = OUTLINED_FUNCTION_36();
    uint64_t v23 = v22;
    swift_bridgeObjectRetain();
    uint64_t v87 = v23;
    uint64_t v81 = OUTLINED_FUNCTION_37();
    uint64_t v25 = v24;
    swift_bridgeObjectRetain();
    uint64_t v80 = OUTLINED_FUNCTION_37();
    uint64_t v62 = v25;
    uint64_t v61 = v26;
    swift_bridgeObjectRetain();
    uint64_t v27 = OUTLINED_FUNCTION_37();
    uint64_t v76 = v28;
    uint64_t v29 = v27;
    swift_bridgeObjectRetain();
    uint64_t v30 = OUTLINED_FUNCTION_8();
    uint64_t v75 = v31;
    uint64_t v32 = v30;
    swift_bridgeObjectRetain();
    uint64_t v33 = OUTLINED_FUNCTION_8();
    uint64_t v74 = v34;
    uint64_t v35 = v33;
    swift_bridgeObjectRetain();
    uint64_t v36 = OUTLINED_FUNCTION_8();
    uint64_t v73 = v37;
    uint64_t v38 = v36;
    swift_bridgeObjectRetain();
    uint64_t v39 = OUTLINED_FUNCTION_8();
    uint64_t v72 = v40;
    uint64_t v41 = v39;
    swift_bridgeObjectRetain();
    uint64_t v42 = OUTLINED_FUNCTION_8();
    uint64_t v71 = v43;
    uint64_t v44 = v42;
    swift_bridgeObjectRetain();
    uint64_t v79 = OUTLINED_FUNCTION_8();
    uint64_t v70 = v45;
    swift_bridgeObjectRetain();
    uint64_t v78 = OUTLINED_FUNCTION_8();
    uint64_t v69 = v46;
    swift_bridgeObjectRetain();
    uint64_t v77 = OUTLINED_FUNCTION_8();
    uint64_t v68 = v47;
    swift_bridgeObjectRetain();
    uint64_t v57 = OUTLINED_FUNCTION_8();
    uint64_t v67 = v48;
    swift_bridgeObjectRetain();
    uint64_t v56 = OUTLINED_FUNCTION_8();
    uint64_t v60 = v49;
    swift_bridgeObjectRetain();
    uint64_t v55 = OUTLINED_FUNCTION_8();
    uint64_t v59 = v50;
    LOBYTE(v91[0]) = 21;
    swift_bridgeObjectRetain();
    uint64_t v54 = OUTLINED_FUNCTION_8();
    uint64_t v58 = v51;
    LOBYTE(v90[0]) = 22;
    sub_25CF5DE1C();
    swift_bridgeObjectRetain();
    sub_25CF61C30();
    sub_25CF5DEE0();
    sub_25CF61C10();
    uint64_t v52 = OUTLINED_FUNCTION_1();
    v53(v52);
    v90[0] = v66;
    v90[1] = v84;
    v90[2] = v88;
    v90[3] = v83;
    v90[4] = v89;
    v90[5] = v65;
    v90[6] = v64;
    v90[7] = v63;
    v90[8] = v82;
    v90[9] = v87;
    v90[10] = v81;
    v90[11] = v62;
    v90[12] = v80;
    v90[13] = v61;
    v90[14] = v29;
    v90[15] = v76;
    v90[16] = v32;
    v90[17] = v75;
    v90[18] = v35;
    v90[19] = v74;
    v90[20] = v38;
    v90[21] = v73;
    v90[22] = v41;
    v90[23] = v72;
    v90[24] = v44;
    v90[25] = v71;
    v90[26] = v79;
    v90[27] = v70;
    v90[28] = v78;
    v90[29] = v69;
    v90[30] = v77;
    v90[31] = v68;
    v90[32] = v57;
    v90[33] = v67;
    v90[34] = v56;
    v90[35] = v60;
    v90[36] = v55;
    v90[37] = v59;
    v90[38] = v54;
    v90[39] = v58;
    LOBYTE(v90[40]) = 21;
    BYTE1(v90[40]) = a13;
    sub_25CF5E168((uint64_t)v90);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v86, v90, 0x142uLL);
    __swift_destroy_boxed_opaque_existential_1(v85);
    v91[0] = v66;
    v91[1] = v84;
    v91[2] = v88;
    v91[3] = v83;
    v91[4] = v89;
    v91[5] = v65;
    v91[6] = v64;
    v91[7] = v63;
    v91[8] = v82;
    v91[9] = v87;
    v91[10] = v81;
    v91[11] = v62;
    v91[12] = v80;
    v91[13] = v61;
    v91[14] = v29;
    v91[15] = v76;
    v91[16] = v32;
    v91[17] = v75;
    v91[18] = v35;
    v91[19] = v74;
    v91[20] = v38;
    v91[21] = v73;
    v91[22] = v41;
    v91[23] = v72;
    v91[24] = v44;
    v91[25] = v71;
    v91[26] = v79;
    v91[27] = v70;
    v91[28] = v78;
    v91[29] = v69;
    v91[30] = v77;
    v91[31] = v68;
    v91[32] = v57;
    v91[33] = v67;
    v91[34] = v56;
    v91[35] = v60;
    v91[36] = v55;
    v91[37] = v59;
    v91[38] = v54;
    v91[39] = v58;
    char v92 = 21;
    char v93 = a13;
    sub_25CF5E2D0((uint64_t)v91);
  }
  OUTLINED_FUNCTION_17();
}

void sub_25CF5DD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _SiriMailMessage.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_25CF5DD84()
{
}

uint64_t sub_25CF5DDA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_25CF5DE1C()
{
  unint64_t result = qword_26A633410;
  if (!qword_26A633410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633410);
  }
  return result;
}

uint64_t sub_25CF5DE68(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x90;
  return result;
}

unint64_t sub_25CF5DE80()
{
  unint64_t result = qword_26A633418;
  if (!qword_26A633418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633418);
  }
  return result;
}

uint64_t sub_25CF5DECC(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x80;
  return result;
}

unint64_t sub_25CF5DEE0()
{
  unint64_t result = qword_26A633420;
  if (!qword_26A633420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633420);
  }
  return result;
}

uint64_t sub_25CF5DF2C(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x70;
  return result;
}

unint64_t sub_25CF5DF40()
{
  unint64_t result = qword_26A633430;
  if (!qword_26A633430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633430);
  }
  return result;
}

uint64_t sub_25CF5DF8C(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x60;
  return result;
}

uint64_t sub_25CF5DFA0(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x50;
  return result;
}

uint64_t sub_25CF5DFB8(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x40;
  return result;
}

uint64_t sub_25CF5DFCC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25CF5E038()
{
  unint64_t result = qword_26A633440;
  if (!qword_26A633440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633440);
  }
  return result;
}

uint64_t sub_25CF5E084(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x30;
  return result;
}

uint64_t sub_25CF5E098(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x20;
  return result;
}

uint64_t sub_25CF5E0AC(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x10;
  return result;
}

unint64_t sub_25CF5E0C0()
{
  unint64_t result = qword_26A633448;
  if (!qword_26A633448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633448);
  }
  return result;
}

uint64_t sub_25CF5E10C(uint64_t result)
{
  *(_WORD *)(result + 320) &= 0xFF07u;
  return result;
}

unint64_t sub_25CF5E11C()
{
  unint64_t result = qword_26A633458;
  if (!qword_26A633458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633458);
  }
  return result;
}

uint64_t sub_25CF5E168(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CF5E2D0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25CF5E43C()
{
  unint64_t result = qword_26A633468;
  if (!qword_26A633468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633468);
  }
  return result;
}

unint64_t sub_25CF5E48C()
{
  unint64_t result = qword_26A633470;
  if (!qword_26A633470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633470);
  }
  return result;
}

unint64_t sub_25CF5E4DC()
{
  unint64_t result = qword_26A633478;
  if (!qword_26A633478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633478);
  }
  return result;
}

unint64_t sub_25CF5E52C()
{
  unint64_t result = qword_26A633480;
  if (!qword_26A633480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633480);
  }
  return result;
}

uint64_t destroy for _SiriMailMessage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _SiriMailMessage(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v13;
  uint64_t v14 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v14;
  uint64_t v15 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v15;
  uint64_t v16 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v16;
  uint64_t v17 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v17;
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  uint64_t v19 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v19;
  uint64_t v20 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v20;
  uint64_t v21 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v21;
  uint64_t v22 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v22;
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(unsigned char *)(a1 + 321) = *(unsigned char *)(a2 + 321);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for _SiriMailMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(unsigned char *)(a1 + 321) = *(unsigned char *)(a2 + 321);
  return a1;
}

void *__swift_memcpy322_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x142uLL);
}

uint64_t assignWithTake for _SiriMailMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v21;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 320) = *(_WORD *)(a2 + 320);
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 322))
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_WORD *)(result + 320) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 322) = 1;
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
    *(unsigned char *)(result + 322) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for _SiriMailMessage()
{
}

uint64_t destroy for _SiriMailMessage.Account()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for _SiriMailMessage.Account(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for _SiriMailMessage.Account(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for _SiriMailMessage.Account(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.Account(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.Account(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for _SiriMailMessage.Account()
{
}

uint64_t initializeBufferWithCopyOfBuffer for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _SiriMailMessage.MailAttachment(uint64_t a1)
{
  sub_25CF565F4(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_25CF55AE8(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[6];
  uint64_t v9 = a2[7];
  a1[6] = v8;
  a1[7] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_25CF55AE8(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_25CF565F4(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
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

uint64_t *assignWithTake for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_25CF565F4(v4, v5);
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.MailAttachment(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.MailAttachment(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for _SiriMailMessage.MailAttachment()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

void type metadata accessor for _SiriMailMessage.State()
{
}

uint64_t _s15SiriMailUIModel16_SiriMailMessageV5StateOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s15SiriMailUIModel16_SiriMailMessageV5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF5F384);
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

void type metadata accessor for _SiriMailMessage.Field()
{
}

uint64_t sub_25CF5F3C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25CF5F3C8(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void type metadata accessor for _SiriMailMessage.Action()
{
}

uint64_t sub_25CF5F3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,unsigned __int8 a41)
{
  switch(a41 >> 4)
  {
    case 0:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
LABEL_3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for _SiriMailMessage.StateChange(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 272);
  long long v6 = *(_OWORD *)(a1 + 288);
  long long v3 = *(_OWORD *)(a1 + 240);
  long long v4 = *(_OWORD *)(a1 + 256);
  long long v2 = *(_OWORD *)(a1 + 208);
  return sub_25CF5F664(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
           *(void *)(a1 + 152),
           *(void *)(a1 + 160),
           *(void *)(a1 + 168),
           *(void *)(a1 + 176),
           *(void *)(a1 + 184),
           *(void *)(a1 + 192),
           *(void *)(a1 + 200),
           v2,
           *((uint64_t *)&v2 + 1),
           *(void *)(a1 + 224),
           *(void *)(a1 + 232),
           v3,
           *((uint64_t *)&v3 + 1),
           v4,
           *((uint64_t *)&v4 + 1),
           v5,
           *((uint64_t *)&v5 + 1),
           v6,
           *((uint64_t *)&v6 + 1),
           *(void *)(a1 + 304),
           *(void *)(a1 + 312),
           *(_WORD *)(a1 + 320));
}

uint64_t sub_25CF5F664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,unsigned __int8 a41)
{
  switch(a41 >> 4)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_3;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
LABEL_3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = *(void *)(a2 + 72);
  uint64_t v44 = *(void *)(a2 + 64);
  uint64_t v41 = *(void *)(a2 + 88);
  uint64_t v42 = *(void *)(a2 + 80);
  uint64_t v40 = *(void *)(a2 + 96);
  uint64_t v13 = *(void *)(a2 + 104);
  uint64_t v14 = *(void *)(a2 + 112);
  uint64_t v15 = *(void *)(a2 + 120);
  uint64_t v16 = *(void *)(a2 + 128);
  uint64_t v17 = *(void *)(a2 + 136);
  uint64_t v18 = *(void *)(a2 + 144);
  uint64_t v19 = *(void *)(a2 + 152);
  uint64_t v20 = *(void *)(a2 + 160);
  uint64_t v21 = *(void *)(a2 + 168);
  uint64_t v22 = *(void *)(a2 + 176);
  uint64_t v3 = *(void *)(a2 + 200);
  uint64_t v23 = *(void *)(a2 + 184);
  uint64_t v24 = *(void *)(a2 + 192);
  uint64_t v25 = *(void *)(a2 + 208);
  uint64_t v26 = *(void *)(a2 + 216);
  uint64_t v27 = *(void *)(a2 + 224);
  uint64_t v28 = *(void *)(a2 + 232);
  uint64_t v29 = *(void *)(a2 + 240);
  uint64_t v30 = *(void *)(a2 + 248);
  uint64_t v31 = *(void *)(a2 + 256);
  uint64_t v32 = *(void *)(a2 + 264);
  uint64_t v33 = *(void *)(a2 + 272);
  uint64_t v34 = *(void *)(a2 + 280);
  uint64_t v35 = *(void *)(a2 + 288);
  uint64_t v36 = *(void *)(a2 + 296);
  uint64_t v37 = *(void *)(a2 + 304);
  uint64_t v38 = *(void *)(a2 + 312);
  __int16 v39 = *(_WORD *)(a2 + 320);
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 48);
  sub_25CF5F3E0(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v44, v43, v42, v41, v40, v13, v14, v15, v16, v17, v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v3,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v44;
  *(void *)(a1 + 72) = v43;
  *(void *)(a1 + 80) = v42;
  *(void *)(a1 + 88) = v41;
  *(void *)(a1 + 96) = v40;
  *(void *)(a1 + 104) = v13;
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v15;
  *(void *)(a1 + 128) = v16;
  *(void *)(a1 + 136) = v17;
  *(void *)(a1 + 144) = v18;
  *(void *)(a1 + 152) = v19;
  *(void *)(a1 + 160) = v20;
  *(void *)(a1 + 168) = v21;
  *(void *)(a1 + 176) = v22;
  *(void *)(a1 + 184) = v23;
  *(void *)(a1 + 192) = v24;
  *(void *)(a1 + 200) = v3;
  *(void *)(a1 + 208) = v25;
  *(void *)(a1 + 216) = v26;
  *(void *)(a1 + 224) = v27;
  *(void *)(a1 + 232) = v28;
  *(void *)(a1 + 240) = v29;
  *(void *)(a1 + 248) = v30;
  *(void *)(a1 + 256) = v31;
  *(void *)(a1 + 264) = v32;
  *(void *)(a1 + 272) = v33;
  *(void *)(a1 + 280) = v34;
  *(void *)(a1 + 288) = v35;
  *(void *)(a1 + 296) = v36;
  *(void *)(a1 + 304) = v37;
  *(void *)(a1 + 312) = v38;
  *(_WORD *)(a1 + 320) = v39;
  return a1;
}

uint64_t assignWithCopy for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = *(void *)a2;
  uint64_t v70 = *(void *)(a2 + 8);
  uint64_t v67 = *(void *)(a2 + 24);
  uint64_t v68 = *(void *)(a2 + 16);
  uint64_t v65 = *(void *)(a2 + 40);
  uint64_t v66 = *(void *)(a2 + 32);
  uint64_t v63 = *(void *)(a2 + 56);
  uint64_t v64 = *(void *)(a2 + 48);
  uint64_t v61 = *(void *)(a2 + 72);
  uint64_t v62 = *(void *)(a2 + 64);
  uint64_t v59 = *(void *)(a2 + 88);
  uint64_t v60 = *(void *)(a2 + 80);
  uint64_t v58 = *(void *)(a2 + 96);
  uint64_t v39 = *(void *)(a2 + 104);
  uint64_t v40 = *(void *)(a2 + 112);
  uint64_t v3 = *(void *)(a2 + 136);
  uint64_t v41 = *(void *)(a2 + 120);
  uint64_t v42 = *(void *)(a2 + 128);
  uint64_t v4 = *(void *)(a2 + 144);
  uint64_t v5 = *(void *)(a2 + 152);
  uint64_t v6 = *(void *)(a2 + 160);
  uint64_t v7 = *(void *)(a2 + 168);
  uint64_t v8 = *(void *)(a2 + 176);
  uint64_t v9 = *(void *)(a2 + 184);
  uint64_t v10 = *(void *)(a2 + 192);
  uint64_t v11 = *(void *)(a2 + 200);
  uint64_t v43 = *(void *)(a2 + 208);
  uint64_t v44 = *(void *)(a2 + 216);
  uint64_t v45 = *(void *)(a2 + 224);
  uint64_t v46 = *(void *)(a2 + 232);
  uint64_t v47 = *(void *)(a2 + 240);
  uint64_t v48 = *(void *)(a2 + 248);
  uint64_t v49 = *(void *)(a2 + 256);
  uint64_t v50 = *(void *)(a2 + 264);
  uint64_t v51 = *(void *)(a2 + 272);
  uint64_t v52 = *(void *)(a2 + 280);
  uint64_t v53 = *(void *)(a2 + 288);
  uint64_t v54 = *(void *)(a2 + 296);
  uint64_t v55 = *(void *)(a2 + 304);
  uint64_t v56 = *(void *)(a2 + 312);
  __int16 v57 = *(_WORD *)(a2 + 320);
  sub_25CF5F3E0(*(void *)a2, v70, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58, v39, v40, v41, v42, v3, v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)a1 = v69;
  *(void *)(a1 + 8) = v70;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v68;
  *(void *)(a1 + 24) = v67;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v66;
  *(void *)(a1 + 40) = v65;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v64;
  *(void *)(a1 + 56) = v63;
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v62;
  *(void *)(a1 + 72) = v61;
  *(void *)(a1 + 80) = v60;
  *(void *)(a1 + 88) = v59;
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v58;
  *(void *)(a1 + 104) = v39;
  *(void *)(a1 + 112) = v40;
  *(void *)(a1 + 120) = v41;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 128) = v42;
  *(void *)(a1 + 136) = v3;
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = v5;
  long long v26 = *(_OWORD *)(a1 + 160);
  long long v27 = *(_OWORD *)(a1 + 176);
  *(void *)(a1 + 160) = v6;
  *(void *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = v8;
  *(void *)(a1 + 184) = v9;
  long long v28 = *(_OWORD *)(a1 + 192);
  long long v29 = *(_OWORD *)(a1 + 208);
  *(void *)(a1 + 192) = v10;
  *(void *)(a1 + 200) = v11;
  *(void *)(a1 + 208) = v43;
  *(void *)(a1 + 216) = v44;
  long long v30 = *(_OWORD *)(a1 + 224);
  long long v31 = *(_OWORD *)(a1 + 240);
  *(void *)(a1 + 224) = v45;
  *(void *)(a1 + 232) = v46;
  *(void *)(a1 + 240) = v47;
  *(void *)(a1 + 248) = v48;
  long long v32 = *(_OWORD *)(a1 + 256);
  long long v33 = *(_OWORD *)(a1 + 272);
  *(void *)(a1 + 256) = v49;
  *(void *)(a1 + 264) = v50;
  *(void *)(a1 + 272) = v51;
  *(void *)(a1 + 280) = v52;
  long long v34 = *(_OWORD *)(a1 + 288);
  *(void *)(a1 + 288) = v53;
  *(void *)(a1 + 296) = v54;
  uint64_t v35 = *(void *)(a1 + 304);
  uint64_t v36 = *(void *)(a1 + 312);
  *(void *)(a1 + 304) = v55;
  *(void *)(a1 + 312) = v56;
  __int16 v37 = *(_WORD *)(a1 + 320);
  *(_WORD *)(a1 + 320) = v57;
  sub_25CF5F664(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    v36,
    v37);
  return a1;
}

uint64_t assignWithTake for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
{
  __int16 v4 = *(_WORD *)(a2 + 320);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 112);
  long long v17 = *(_OWORD *)(a1 + 128);
  long long v18 = *(_OWORD *)(a1 + 144);
  long long v19 = *(_OWORD *)(a1 + 160);
  long long v20 = *(_OWORD *)(a1 + 176);
  long long v21 = *(_OWORD *)(a1 + 192);
  long long v22 = *(_OWORD *)(a1 + 208);
  long long v23 = *(_OWORD *)(a1 + 224);
  long long v24 = *(_OWORD *)(a1 + 240);
  long long v25 = *(_OWORD *)(a1 + 256);
  long long v26 = *(_OWORD *)(a1 + 272);
  long long v27 = *(_OWORD *)(a1 + 288);
  uint64_t v28 = *(void *)(a1 + 304);
  uint64_t v29 = *(void *)(a1 + 312);
  __int16 v30 = *(_WORD *)(a1 + 320);
  long long v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v31;
  long long v32 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v32;
  long long v33 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v33;
  long long v34 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v34;
  long long v35 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v35;
  long long v36 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v36;
  long long v37 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v37;
  long long v38 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v38;
  long long v39 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v39;
  long long v40 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v40;
  *(_WORD *)(a1 + 320) = v4;
  sub_25CF5F664(v5, v6, v7, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    v29,
    v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.StateChange(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x17 && *(unsigned char *)(a1 + 322))
    {
      unsigned int v2 = *(_DWORD *)a1 + 22;
    }
    else
    {
      unsigned int v2 = ((2 * *(unsigned __int16 *)(a1 + 320)) & 0x10 | (*(_WORD *)(a1 + 320) >> 4)) ^ 0x1F;
      if (v2 >= 0x16) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

void storeEnumTagSinglePayload for _SiriMailMessage.StateChange(char *a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x16)
  {
    *((void *)a1 + 39) = 0;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *((_WORD *)a1 + 160) = 0;
    *(void *)a1 = a2 - 23;
    if (a3 >= 0x17) {
      a1[322] = 1;
    }
  }
  else
  {
    if (a3 >= 0x17) {
      a1[322] = 0;
    }
    if (a2)
    {
      unsigned int v4 = 8 * ((((-a2 >> 4) & 1) - 2 * a2) & 0x1F);
      bzero(a1, 0x140uLL);
      *((_WORD *)a1 + 160) = v4;
    }
  }
}

uint64_t sub_25CF60004(uint64_t result, char a2)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | (16 * (a2 & 0xF));
  return result;
}

void type metadata accessor for _SiriMailMessage.StateChange()
{
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE9)
  {
    if (a2 + 23 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 23) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 24;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x18;
  int v5 = v6 - 24;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for _SiriMailMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 23 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 23) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE8)
  {
    unsigned int v6 = ((a2 - 233) >> 8) + 1;
    *uint64_t result = a2 + 23;
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
        JUMPOUT(0x25CF6017CLL);
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
          *uint64_t result = a2 + 23;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.CodingKeys()
{
  return &type metadata for _SiriMailMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.StateChange.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for _SiriMailMessage.StateChange.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x25CF60308);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.CodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.CodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ModelUpdateCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.SubjectCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.BodyCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.AttachmentsCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ToCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ToCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.CcCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.CcCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.BccCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.BccCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.FocusedFieldCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ActionCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys;
}

unsigned char *_s15SiriMailUIModel16_SiriMailMessageV11StateChangeO21ModelUpdateCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25CF60474);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.StateCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.StateCodingKeys;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.MailAttachment.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for _SiriMailMessage.MailAttachment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF60600);
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

unsigned char *sub_25CF60628(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.MailAttachment.CodingKeys()
{
  return &type metadata for _SiriMailMessage.MailAttachment.CodingKeys;
}

uint64_t _s15SiriMailUIModel16_SiriMailMessageV6ActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15SiriMailUIModel16_SiriMailMessageV6ActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CF60794);
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

ValueMetadata *type metadata accessor for _SiriMailMessage.Account.CodingKeys()
{
  return &type metadata for _SiriMailMessage.Account.CodingKeys;
}

unint64_t sub_25CF607D0()
{
  unint64_t result = qword_26A633488;
  if (!qword_26A633488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633488);
  }
  return result;
}

unint64_t sub_25CF60820()
{
  unint64_t result = qword_26A633490;
  if (!qword_26A633490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633490);
  }
  return result;
}

unint64_t sub_25CF60870()
{
  unint64_t result = qword_26A633498;
  if (!qword_26A633498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633498);
  }
  return result;
}

unint64_t sub_25CF608C0()
{
  unint64_t result = qword_26A6334A0;
  if (!qword_26A6334A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334A0);
  }
  return result;
}

unint64_t sub_25CF60910()
{
  unint64_t result = qword_26A6334A8;
  if (!qword_26A6334A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334A8);
  }
  return result;
}

unint64_t sub_25CF60960()
{
  unint64_t result = qword_26A6334B0;
  if (!qword_26A6334B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334B0);
  }
  return result;
}

unint64_t sub_25CF609B0()
{
  unint64_t result = qword_26A6334B8;
  if (!qword_26A6334B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334B8);
  }
  return result;
}

unint64_t sub_25CF60A00()
{
  unint64_t result = qword_26A6334C0;
  if (!qword_26A6334C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334C0);
  }
  return result;
}

unint64_t sub_25CF60A50()
{
  unint64_t result = qword_26A6334C8;
  if (!qword_26A6334C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334C8);
  }
  return result;
}

unint64_t sub_25CF60AA0()
{
  unint64_t result = qword_26A6334D0;
  if (!qword_26A6334D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334D0);
  }
  return result;
}

unint64_t sub_25CF60AF0()
{
  unint64_t result = qword_26A6334D8;
  if (!qword_26A6334D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334D8);
  }
  return result;
}

unint64_t sub_25CF60B40()
{
  unint64_t result = qword_26A6334E0;
  if (!qword_26A6334E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334E0);
  }
  return result;
}

unint64_t sub_25CF60B90()
{
  unint64_t result = qword_26A6334E8;
  if (!qword_26A6334E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334E8);
  }
  return result;
}

unint64_t sub_25CF60BE0()
{
  unint64_t result = qword_26A6334F0;
  if (!qword_26A6334F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334F0);
  }
  return result;
}

unint64_t sub_25CF60C30()
{
  unint64_t result = qword_26A6334F8;
  if (!qword_26A6334F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6334F8);
  }
  return result;
}

unint64_t sub_25CF60C80()
{
  unint64_t result = qword_26A633500;
  if (!qword_26A633500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633500);
  }
  return result;
}

unint64_t sub_25CF60CD0()
{
  unint64_t result = qword_26A633508;
  if (!qword_26A633508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633508);
  }
  return result;
}

unint64_t sub_25CF60D20()
{
  unint64_t result = qword_26A633510;
  if (!qword_26A633510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633510);
  }
  return result;
}

unint64_t sub_25CF60D70()
{
  unint64_t result = qword_26A633518;
  if (!qword_26A633518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633518);
  }
  return result;
}

unint64_t sub_25CF60DC0()
{
  unint64_t result = qword_26A633520;
  if (!qword_26A633520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633520);
  }
  return result;
}

unint64_t sub_25CF60E10()
{
  unint64_t result = qword_26A633528;
  if (!qword_26A633528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633528);
  }
  return result;
}

unint64_t sub_25CF60E60()
{
  unint64_t result = qword_26A633530;
  if (!qword_26A633530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633530);
  }
  return result;
}

unint64_t sub_25CF60EB0()
{
  unint64_t result = qword_26A633538;
  if (!qword_26A633538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633538);
  }
  return result;
}

unint64_t sub_25CF60F00()
{
  unint64_t result = qword_26A633540;
  if (!qword_26A633540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633540);
  }
  return result;
}

unint64_t sub_25CF60F50()
{
  unint64_t result = qword_26A633548;
  if (!qword_26A633548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633548);
  }
  return result;
}

unint64_t sub_25CF60FA0()
{
  unint64_t result = qword_26A633550;
  if (!qword_26A633550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633550);
  }
  return result;
}

unint64_t sub_25CF60FF0()
{
  unint64_t result = qword_26A633558;
  if (!qword_26A633558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633558);
  }
  return result;
}

unint64_t sub_25CF61040()
{
  unint64_t result = qword_26A633560;
  if (!qword_26A633560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633560);
  }
  return result;
}

unint64_t sub_25CF61090()
{
  unint64_t result = qword_26A633568;
  if (!qword_26A633568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633568);
  }
  return result;
}

unint64_t sub_25CF610E0()
{
  unint64_t result = qword_26A633570;
  if (!qword_26A633570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633570);
  }
  return result;
}

unint64_t sub_25CF61130()
{
  unint64_t result = qword_26A633578;
  if (!qword_26A633578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633578);
  }
  return result;
}

unint64_t sub_25CF61180()
{
  unint64_t result = qword_26A633580;
  if (!qword_26A633580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633580);
  }
  return result;
}

unint64_t sub_25CF611D0()
{
  unint64_t result = qword_26A633588;
  if (!qword_26A633588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633588);
  }
  return result;
}

unint64_t sub_25CF61220()
{
  unint64_t result = qword_26A633590;
  if (!qword_26A633590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633590);
  }
  return result;
}

unint64_t sub_25CF61270()
{
  unint64_t result = qword_26A633598;
  if (!qword_26A633598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A633598);
  }
  return result;
}

unint64_t sub_25CF612C0()
{
  unint64_t result = qword_26A6335A0;
  if (!qword_26A6335A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335A0);
  }
  return result;
}

unint64_t sub_25CF61310()
{
  unint64_t result = qword_26A6335A8;
  if (!qword_26A6335A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335A8);
  }
  return result;
}

unint64_t sub_25CF61360()
{
  unint64_t result = qword_26A6335B0;
  if (!qword_26A6335B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335B0);
  }
  return result;
}

unint64_t sub_25CF613B0()
{
  unint64_t result = qword_26A6335B8;
  if (!qword_26A6335B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335B8);
  }
  return result;
}

unint64_t sub_25CF61400()
{
  unint64_t result = qword_26A6335C0;
  if (!qword_26A6335C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335C0);
  }
  return result;
}

unint64_t sub_25CF61450()
{
  unint64_t result = qword_26A6335C8;
  if (!qword_26A6335C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335C8);
  }
  return result;
}

unint64_t sub_25CF614A0()
{
  unint64_t result = qword_26A6335D0;
  if (!qword_26A6335D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335D0);
  }
  return result;
}

unint64_t sub_25CF614EC()
{
  unint64_t result = qword_26A6335D8;
  if (!qword_26A6335D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335D8);
  }
  return result;
}

unint64_t sub_25CF61538()
{
  unint64_t result = qword_26A6335E0;
  if (!qword_26A6335E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335E0);
  }
  return result;
}

unint64_t sub_25CF61584()
{
  unint64_t result = qword_26A6335E8;
  if (!qword_26A6335E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6335E8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  *(void *)(v0 + 344) = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_25CF61C80();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_25CF61C50();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_25CF61C20();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 - 72);
  return MEMORY[0x270F9F250](a1, a2, v4, a1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9F250](a1, a2, a3, a1);
}

void OUTLINED_FUNCTION_12(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_25CF61C30();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_25CF61C90();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_25CF61C30();
}

uint64_t OUTLINED_FUNCTION_28@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 89) = a1;
  return sub_25CF61C90();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_25CF61C80();
}

uint64_t OUTLINED_FUNCTION_31()
{
  *(void *)(v0 + 600) = *(void *)(v0 + 272);
  return v0 + 600;
}

void OUTLINED_FUNCTION_33(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_25CF61C50();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_25CF61C00();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_25CF61C20();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_25CF61C30();
}

uint64_t OUTLINED_FUNCTION_39()
{
  *(unsigned char *)(v0 + 600) = *(unsigned char *)(v0 + 272);
  return v0 + 600;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_25CF61CB0();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_25CF5866C(v0 + 896);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_25CF61D00();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_25CF565F4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_25CF61C20();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0 + 240;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_25CF61B80();
}

uint64_t sub_25CF61AD0()
{
  return MEMORY[0x270EE1A70]();
}

uint64_t sub_25CF61AE0()
{
  return MEMORY[0x270EE1A88]();
}

uint64_t sub_25CF61AF0()
{
  return MEMORY[0x270EE1AA8]();
}

uint64_t sub_25CF61B00()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25CF61B10()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25CF61B20()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25CF61B30()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_25CF61B40()
{
  return MEMORY[0x270F26E78]();
}

uint64_t sub_25CF61B50()
{
  return MEMORY[0x270F26E80]();
}

uint64_t sub_25CF61B60()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25CF61B70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25CF61B80()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25CF61B90()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25CF61BA0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25CF61BB0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25CF61BC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25CF61BD0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25CF61BF0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25CF61C00()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25CF61C10()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25CF61C20()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25CF61C30()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25CF61C40()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25CF61C50()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25CF61C60()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25CF61C70()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25CF61C80()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25CF61C90()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25CF61CA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25CF61CB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25CF61CC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25CF61CD0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25CF61CE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25CF61CF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25CF61D00()
{
  return MEMORY[0x270F9FD98]();
}

void bzero(void *a1, size_t a2)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}