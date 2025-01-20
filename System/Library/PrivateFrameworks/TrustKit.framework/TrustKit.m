uint64_t sub_26038CE34(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for Fail(uint64_t a1)
{
  return sub_26038CE5C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_26038CE5C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s8TrustKit4FailOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_26038CE34(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Fail(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_26038CE34(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_26038CE5C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Fail(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_26038CE5C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Fail(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Fail(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_26038D000(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_26038D00C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Fail()
{
  return &type metadata for Fail;
}

BOOL sub_26038D034(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void type metadata accessor for SecKey(uint64_t a1)
{
}

void sub_26038D0A0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_26038D0EC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_26039B2B0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_26038D1BC()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_26038D284()
{
  sub_26038D1BC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for NetworkManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_26038D324()
{
  return 1;
}

uint64_t sub_26038D32C()
{
  return sub_26039B690();
}

uint64_t sub_26038D370()
{
  return sub_26039B680();
}

uint64_t sub_26038D398()
{
  return sub_26039B690();
}

uint64_t sub_26038D3DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26038DC78(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_26038D408()
{
  return 0;
}

void sub_26038D414(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_26038D420(uint64_t a1)
{
  unint64_t v2 = sub_26038D998();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26038D45C(uint64_t a1)
{
  unint64_t v2 = sub_26038D998();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26038D498@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C478);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unsigned __int8 v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26038D998();
  sub_26039B6A0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v9 = sub_26039B5B0();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

void sub_26038D610()
{
  qword_26A86CFA0 = 5522759;
  *(void *)algn_26A86CFA8 = 0xE300000000000000;
}

uint64_t sub_26038D62C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit12KeyOperation_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_26038D6CC()
{
  return type metadata accessor for KeyOperation();
}

uint64_t type metadata accessor for KeyOperation()
{
  uint64_t result = qword_26A86C468;
  if (!qword_26A86C468) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26038D720()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for KeyOperation.KeyResult(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for KeyOperation.KeyResult()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for KeyOperation.KeyResult(void *a1, void *a2)
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

void *assignWithTake for KeyOperation.KeyResult(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyOperation.KeyResult(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for KeyOperation.KeyResult(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for KeyOperation.KeyResult()
{
  return &type metadata for KeyOperation.KeyResult;
}

ValueMetadata *type metadata accessor for KeyOperation.KeyContext()
{
  return &type metadata for KeyOperation.KeyContext;
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

unint64_t sub_26038D998()
{
  unint64_t result = qword_26A86C480;
  if (!qword_26A86C480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C480);
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

uint64_t getEnumTagSinglePayload for KeyOperation.KeyResult.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for KeyOperation.KeyResult.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x26038DB30);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26038DB58()
{
  return 0;
}

ValueMetadata *type metadata accessor for KeyOperation.KeyResult.CodingKeys()
{
  return &type metadata for KeyOperation.KeyResult.CodingKeys;
}

unint64_t sub_26038DB74()
{
  unint64_t result = qword_26A86C488;
  if (!qword_26A86C488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C488);
  }
  return result;
}

unint64_t sub_26038DBCC()
{
  unint64_t result = qword_26A86C490;
  if (!qword_26A86C490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C490);
  }
  return result;
}

unint64_t sub_26038DC24()
{
  unint64_t result = qword_26A86C498;
  if (!qword_26A86C498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C498);
  }
  return result;
}

uint64_t sub_26038DC78(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_26039B5E0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_26038DD08()
{
  return 0x654B63696C627570;
}

uint64_t sub_26038DD28(char a1)
{
  return *(void *)&aRecordidbaacer[8 * a1];
}

uint64_t sub_26038DD48(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C4B8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26038E75C();
  sub_26039B6B0();
  v8[15] = 0;
  sub_26039B5C0();
  if (!v1)
  {
    v8[14] = 1;
    sub_26039B5C0();
    v8[13] = 2;
    sub_26039B5C0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

BOOL sub_26038DED0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_26038DEE4()
{
  return sub_26039B690();
}

uint64_t sub_26038DF2C()
{
  return sub_26039B680();
}

uint64_t sub_26038DF58()
{
  return sub_26039B690();
}

uint64_t sub_26038DF9C()
{
  return sub_26038DD28(*v0);
}

uint64_t sub_26038DFA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26038E7B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_26038DFCC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_26038DFD8(uint64_t a1)
{
  unint64_t v2 = sub_26038E75C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26038E014(uint64_t a1)
{
  unint64_t v2 = sub_26038E75C();
  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_26038E050@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_26038E918(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_26038E094(void *a1)
{
  return sub_26038DD48(a1);
}

void sub_26038E0AC()
{
  qword_26A86CFB0 = 1414745936;
  *(void *)algn_26A86CFB8 = 0xE400000000000000;
}

void sub_26038E0C8()
{
  algn_26A86CFC8[5] = 0;
  *(_WORD *)&algn_26A86CFC8[6] = -5120;
}

void sub_26038E0F4()
{
  algn_26A86CFD8[7] = -18;
}

uint64_t sub_26038E124()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit15RecordOperation_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_26038E1C4()
{
  return type metadata accessor for RecordOperation();
}

uint64_t type metadata accessor for RecordOperation()
{
  uint64_t result = qword_26A86C4A8;
  if (!qword_26A86C4A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RecordOperation.ServerRecord(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RecordOperation.ServerRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RecordOperation.ServerRecord(void *a1, void *a2)
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
  return a1;
}

void *assignWithCopy for RecordOperation.ServerRecord(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

void *assignWithTake for RecordOperation.ServerRecord(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordOperation.ServerRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordOperation.ServerRecord(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordOperation.ServerRecord()
{
  return &type metadata for RecordOperation.ServerRecord;
}

uint64_t destroy for RecordOperation.RecordUploadContext(id *a1)
{
  if (*a1)
  {

    swift_bridgeObjectRelease();
  }
  return swift_release();
}

void *_s8TrustKit15RecordOperationC19RecordUploadContextVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    *a1 = v4;
    a1[1] = v5;
    id v6 = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  a1[2] = *(void *)(a2 + 16);
  swift_retain();
  return a1;
}

void **assignWithCopy for RecordOperation.RecordUploadContext(void **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)a2;
  if (!*a1)
  {
    if (v5)
    {
      *a1 = v5;
      a1[1] = *(void **)(a2 + 8);
      id v7 = v5;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v5)
  {
    sub_26038E5E8((uint64_t)a1);
    goto LABEL_7;
  }
  *a1 = v5;
  id v6 = v5;

  a1[1] = *(void **)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  a1[2] = *(void **)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_26038E5E8(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void **assignWithTake for RecordOperation.RecordUploadContext(void **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  if (!*a1) {
    goto LABEL_5;
  }
  if (!*(void *)a2)
  {
    sub_26038E5E8((uint64_t)a1);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  *a1 = *(void **)a2;

  a1[1] = *(void **)(a2 + 8);
  swift_bridgeObjectRelease();
LABEL_6:
  a1[2] = *(void **)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordOperation.RecordUploadContext(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RecordOperation.RecordUploadContext(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RecordOperation.RecordUploadContext()
{
  return &type metadata for RecordOperation.RecordUploadContext;
}

unint64_t sub_26038E75C()
{
  unint64_t result = qword_26A86C4C0;
  if (!qword_26A86C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C4C0);
  }
  return result;
}

uint64_t sub_26038E7B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x644964726F636572 && a2 == 0xE800000000000000;
  if (v3 || (sub_26039B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4374726543616162 && a2 == 0xEC0000006E696168 || (sub_26039B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x685374726F706572 && a2 == 0xEC00000036353261)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_26039B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_26038E918@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C4C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unsigned __int8 v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26038E75C();
  sub_26039B6A0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v27 = 0;
  uint64_t v9 = sub_26039B5B0();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  char v26 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_26039B5B0();
  uint64_t v14 = v13;
  uint64_t v22 = v12;
  char v25 = 2;
  swift_bridgeObjectRetain();
  uint64_t v23 = v14;
  uint64_t v15 = sub_26039B5B0();
  uint64_t v17 = v16;
  uint64_t v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v19 = v23;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v24;
  a2[1] = v11;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v18;
  a2[5] = v17;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecordOperation.ServerRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordOperation.ServerRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26038ED18);
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

uint64_t sub_26038ED40(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_26038ED48(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecordOperation.ServerRecord.CodingKeys()
{
  return &type metadata for RecordOperation.ServerRecord.CodingKeys;
}

unint64_t sub_26038ED64()
{
  unint64_t result = qword_26A86C4D0;
  if (!qword_26A86C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C4D0);
  }
  return result;
}

unint64_t sub_26038EDBC()
{
  unint64_t result = qword_26A86C4D8;
  if (!qword_26A86C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C4D8);
  }
  return result;
}

unint64_t sub_26038EE14()
{
  unint64_t result = qword_26A86C4E0;
  if (!qword_26A86C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C4E0);
  }
  return result;
}

uint64_t sub_26038EE68()
{
  type metadata accessor for AnalyticsManager();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit16AnalyticsManager_logger;
  if (qword_26A86C378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_26039B2B0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86D098);
  unsigned int v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  v4(v1, v3, v2);
  uint64_t v5 = OBJC_IVAR____TtC8TrustKit16AnalyticsManager_eligibilityManager;
  type metadata accessor for EligibilityManager();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OBJC_IVAR____TtC8TrustKit18EligibilityManager_logger;
  if (qword_26A86C360 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86D050);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(v6 + v7, v8, v2);
  *(void *)(v6 + OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist) = 0;
  *(void *)(v0 + v5) = v6;
  qword_26A86CFE0 = v0;
  return result;
}

uint64_t sub_26038EFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a3 + 16);
  uint64_t v7 = (void *)sub_26039B330();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = v11;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v5;
  *(unsigned char *)(v8 + 48) = v6;
  uint64_t v16 = sub_26038F84C;
  uint64_t v17 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v13 = 1107296256;
  uint64_t v14 = sub_26038F564;
  uint64_t v15 = &block_descriptor;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_26038F874(v4, v5, v6);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

  LOBYTE(v5) = sub_26039B3D0();
  uint64_t aBlock = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_26039B4C0();
  sub_26039B380();
  sub_26039B380();
  swift_bridgeObjectRelease();
  sub_26039B380();
  sub_26039B380();
  swift_bridgeObjectRelease();
  sub_26039B380();
  sub_26038F888(0, &qword_26A86C518);
  sub_26039B310();
  sub_26039B380();
  swift_bridgeObjectRelease();
  sub_26039B380();
  sub_260392574((os_log_type_t)v5, aBlock, v13, 0xD000000000000055, 0x800000026039D3C0);
  return swift_bridgeObjectRelease();
}

unint64_t sub_26038F32C(char a1)
{
  if (!a1) {
    return 0xD000000000000024;
  }
  if (a1 == 1) {
    return 0xD00000000000002ALL;
  }
  return 0xD00000000000001ELL;
}

uint64_t sub_26038F388(uint64_t a1)
{
  sub_26038F888(0, (unint64_t *)&qword_26A86C520);
  uint64_t v2 = qword_26A86C3B0;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26A86D0B0;
  uint64_t v4 = *(void *)algn_26A86D0B8;
  uint64_t v5 = sub_260399270();
  sub_26038F8C4(v3, v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_26039B400();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_26038FD0C(v6, 0xD000000000000014, 0x800000026039D480, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = a1;
  swift_bridgeObjectRelease();
  if (qword_26A86C328 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_26A86C4E8;
  uint64_t v10 = unk_26A86C4F0;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_26039B330();
  swift_bridgeObjectRelease();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_26038FD0C(v11, v9, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

id sub_26038F564(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_26038F888(0, &qword_26A86C518);
    uint64_t v4 = (void *)sub_26039B2F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_26038F600()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit16AnalyticsManager_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_26038F6B0()
{
  return type metadata accessor for AnalyticsManager();
}

uint64_t type metadata accessor for AnalyticsManager()
{
  uint64_t result = qword_26A86C508;
  if (!qword_26A86C508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26038F704()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_26038F7A0()
{
  qword_26A86C4E8 = 0x726F727265;
  unk_26A86C4F0 = 0xE500000000000000;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_26038F7F8()
{
  swift_bridgeObjectRelease();
  swift_release();
  int v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 255) {
    sub_26038CE5C(*(void *)(v0 + 32), *(void *)(v0 + 40), v1);
  }
  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_26038F84C()
{
  return sub_26038F388(*(void *)(v0 + 16));
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

uint64_t sub_26038F874(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_26038CE34(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_26038F888(uint64_t a1, unint64_t *a2)
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

uint64_t sub_26038F8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_26039B670();
    sub_26039B370();
    uint64_t v6 = sub_26039B690();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_26039B5E0() & 1) != 0) {
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
          if (v17 || (sub_26039B5E0() & 1) != 0) {
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

uint64_t sub_26038F9FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C528);
  char v38 = a2;
  uint64_t v6 = sub_26039B580();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_26039B670();
    sub_26039B370();
    uint64_t result = sub_26039B690();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_26038FD0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_260390B28(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_26038FE7C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_26038F9FC(v15, a4 & 1);
  unint64_t v20 = sub_260390B28(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_26039B610();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

id sub_26038FE7C()
{
  int v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C528);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26039B570();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *int v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void sub_260390030(uint64_t a1@<X0>, unint64_t a2@<X1>, __SecKey *a3@<X2>, uint64_t a4@<X8>)
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_26039B2B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 != a1 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_13;
    case 2uLL:
      if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
        goto LABEL_13;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_13;
    default:
      if ((a2 & 0xFF000000000000) == 0)
      {
LABEL_13:
        if (qword_26A86C330 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v8, (uint64_t)qword_26A86C530);
        os_log_type_t v21 = sub_26039B3D0();
        sub_260392574(v21, 0xD000000000000023, 0x800000026039D5B0, 0xD000000000000057, 0x800000026039D4E0);
        long long v22 = xmmword_26039C270;
        goto LABEL_23;
      }
LABEL_3:
      if ((sub_260390D90(a3) & 1) == 0)
      {
        if (qword_26A86C330 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v8, (uint64_t)qword_26A86C530);
        os_log_type_t v23 = sub_26039B3D0();
        uint64_t v24 = 0xD000000000000030;
        unint64_t v25 = 0x800000026039D4A0;
        goto LABEL_22;
      }
      CFStringRef v12 = (const __CFString *)*MEMORY[0x263F172E8];
      if (!SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F172E8]))
      {
        if (qword_26A86C330 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v8, (uint64_t)qword_26A86C530);
        os_log_type_t v23 = sub_26039B3D0();
        uint64_t v24 = 0xD00000000000002ALL;
        unint64_t v25 = 0x800000026039D580;
LABEL_22:
        sub_260392574(v23, v24, v25, 0xD000000000000057, 0x800000026039D4E0);
        long long v22 = xmmword_26039C260;
LABEL_23:
        *(_OWORD *)a4 = v22;
        *(_WORD *)(a4 + 16) = 256;
        return;
      }
      error[0] = 0;
      CFDataRef v13 = (const __CFData *)sub_26039B230();
      CFDataRef Signature = SecKeyCreateSignature(a3, v12, v13, error);

      if (Signature)
      {
        CFErrorRef v15 = error[0];
        if (!error[0])
        {
          CFDataRef v27 = Signature;
          uint64_t v28 = sub_26039B260();
          uint64_t v30 = v29;

          *(void *)a4 = v28;
          *(void *)(a4 + 8) = v30;
          *(_WORD *)(a4 + 16) = 0;
          return;
        }
        if (qword_26A86C330 != -1) {
          swift_once();
        }
        uint64_t v16 = __swift_project_value_buffer(v8, (uint64_t)qword_26A86C530);
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v16, v8);
        int v32 = sub_26039B3E0();
        unint64_t v36 = 0;
        unint64_t v37 = 0xE000000000000000;
        sub_26039B4C0();
        swift_bridgeObjectRelease();
        unint64_t v33 = 0xD00000000000001DLL;
        unint64_t v34 = 0x800000026039D560;
        unint64_t v36 = 0xD00000000000001DLL;
        unint64_t v37 = 0x800000026039D560;
        uint64_t v17 = v15;
        v35 = v17;
        type metadata accessor for CFError(0);
        v31[1] = v18;
        sub_26039132C();
        sub_26039B620();

        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();
        sub_260392574((os_log_type_t)v32, v36, v37, 0xD000000000000057, 0x800000026039D4E0);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        unint64_t v36 = 0;
        unint64_t v37 = 0xE000000000000000;
        sub_26039B4C0();
        swift_bridgeObjectRelease();
        unint64_t v36 = v33;
        unint64_t v37 = v34;
        uint64_t v19 = v17;
        v35 = v19;
        sub_26039B620();

        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();

        unint64_t v20 = v37;
        *(void *)a4 = v36;
        *(void *)(a4 + 8) = v20;
      }
      else
      {
        if (qword_26A86C330 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v8, (uint64_t)qword_26A86C530);
        os_log_type_t v26 = sub_26039B3E0();
        sub_260392574(v26, 0xD000000000000014, 0x800000026039D540, 0xD000000000000057, 0x800000026039D4E0);
        *(void *)a4 = 0xD000000000000014;
        *(void *)(a4 + 8) = 0x800000026039D540;
      }
      *(_WORD *)(a4 + 16) = 258;
      if (error[0]) {

      }
      return;
  }
}

uint64_t sub_26039064C()
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_26039B2B0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = SecKeyCopyPublicKey(v0);
  if (!v5)
  {
    if (qword_26A86C358 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_26A86D038);
    os_log_type_t v11 = sub_26039B3E0();
    sub_260392574(v11, 0xD00000000000001ALL, 0x800000026039D660, 0xD000000000000057, 0x800000026039D4E0);
    return 0;
  }
  uint64_t v6 = v5;
  error[0] = 0;
  CFDataRef v7 = SecKeyCopyExternalRepresentation(v5, error);
  if (!v7
    || (CFDataRef v8 = v7,
        long long v22 = xmmword_26039C280,
        sub_26039B250(),
        v8,
        unint64_t v9 = *((void *)&v22 + 1),
        *((void *)&v22 + 1) >> 60 == 15))
  {
    if (qword_26A86C358 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_26A86D038);
    os_log_type_t v10 = sub_26039B3E0();
    sub_260392574(v10, 0xD000000000000035, 0x800000026039D680, 0xD000000000000057, 0x800000026039D4E0);
LABEL_17:
    CFErrorRef v19 = error[0];

    if (v19) {
    return 0;
    }
  }
  uint64_t v12 = v22;
  if (error[0])
  {
    if (qword_26A86C358 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26A86D038);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
    os_log_type_t v14 = sub_26039B3E0();
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    sub_26039B4C0();
    sub_26039B380();
    if (error[0])
    {
      CFErrorRef v15 = error[0];
      v21[0] = v12;
      v21[1] = v15;
      os_log_type_t v16 = v14;
      uint64_t v17 = v15;
      type metadata accessor for CFError(0);
      sub_26039132C();
      sub_26039B620();

      os_log_type_t v14 = v16;
      uint64_t v12 = v21[0];
    }
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v14, v22, *((unint64_t *)&v22 + 1), 0xD000000000000057, 0x800000026039D4E0);
    sub_2603914F8(v12, v9);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    goto LABEL_17;
  }
  uint64_t v18 = sub_26039B240();
  sub_2603914F8(v12, v9);

  return v18;
}

uint64_t sub_260390A60()
{
  uint64_t v0 = sub_26039B2B0();
  __swift_allocate_value_buffer(v0, qword_26A86C530);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A86C530);
  if (qword_26A86C358 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A86D038);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

unint64_t sub_260390B28(uint64_t a1, uint64_t a2)
{
  sub_26039B670();
  sub_26039B370();
  uint64_t v4 = sub_26039B690();
  return sub_260390BE4(a1, a2, v4);
}

unint64_t sub_260390BA0(uint64_t a1)
{
  uint64_t v2 = sub_26039B460();
  return sub_260390CC8(a1, v2);
}

unint64_t sub_260390BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    os_log_type_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26039B5E0() & 1) == 0)
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
      while (!v14 && (sub_26039B5E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_260390CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_260391564(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x26120E4C0](v9, a1);
      sub_2603915C0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_260390D90(__SecKey *a1)
{
  uint64_t v2 = sub_26039B2B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v28 - v8;
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v28 - v10;
  CFDictionaryRef v12 = SecKeyCopyAttributes(a1);
  if (v12)
  {
    CFDictionaryRef v13 = v12;
    *(void *)&long long v29 = 0;
    sub_26039B300();

    uint64_t v14 = v29;
    if ((void)v29)
    {
      uint64_t v15 = sub_26039B340();
      if (*(void *)(v14 + 16) && (unint64_t v17 = sub_260390B28(v15, v16), (v18 & 1) != 0))
      {
        sub_26039149C(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*((void *)&v30 + 1))
        {
          if (swift_dynamicCast())
          {
            long long v29 = v28;
            *(void *)&long long v28 = sub_26039B340();
            *((void *)&v28 + 1) = v19;
            sub_260391448();
            char v20 = sub_26039B450();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_26A86C330 != -1) {
              swift_once();
            }
            uint64_t v21 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86C530);
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v21, v2);
            os_log_type_t v22 = sub_26039B3D0();
            *(void *)&long long v29 = 0;
            *((void *)&v29 + 1) = 0xE000000000000000;
            sub_26039B4C0();
            swift_bridgeObjectRelease();
            *(void *)&long long v29 = 0xD000000000000023;
            *((void *)&v29 + 1) = 0x800000026039D630;
            sub_26039B380();
            swift_bridgeObjectRelease();
            sub_26039B380();
            sub_260392574(v22, v29, *((unint64_t *)&v29 + 1), 0xD000000000000057, 0x800000026039D4E0);
            goto LABEL_18;
          }
          goto LABEL_15;
        }
      }
      else
      {
        long long v29 = 0u;
        long long v30 = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_2603913E8((uint64_t)&v29);
LABEL_15:
      if (qword_26A86C330 != -1) {
        swift_once();
      }
      uint64_t v25 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86C530);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v25, v2);
      os_log_type_t v26 = sub_26039B3E0();
      *(void *)&long long v29 = 0;
      *((void *)&v29 + 1) = 0xE000000000000000;
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      *(void *)&long long v29 = 0xD00000000000001FLL;
      *((void *)&v29 + 1) = 0x800000026039D610;
      sub_26039064C();
      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      sub_260392574(v26, v29, *((unint64_t *)&v29 + 1), 0xD000000000000057, 0x800000026039D4E0);
      char v20 = 0;
      BOOL v11 = v9;
      goto LABEL_18;
    }
  }
  if (qword_26A86C330 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_26A86C530);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v23, v2);
  os_log_type_t v24 = sub_26039B3E0();
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = 0xE000000000000000;
  sub_26039B4C0();
  swift_bridgeObjectRelease();
  *(void *)&long long v29 = 0xD000000000000025;
  *((void *)&v29 + 1) = 0x800000026039D5E0;
  sub_26039064C();
  sub_26039B380();
  swift_bridgeObjectRelease();
  sub_26039B380();
  sub_260392574(v24, v29, *((unint64_t *)&v29 + 1), 0xD000000000000057, 0x800000026039D4E0);
  char v20 = 0;
  BOOL v11 = v6;
LABEL_18:
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  return v20 & 1;
}

unint64_t sub_26039132C()
{
  unint64_t result = qword_26A86C548;
  if (!qword_26A86C548)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C548);
  }
  return result;
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

uint64_t sub_2603913E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_260391448()
{
  unint64_t result = qword_26A86C558;
  if (!qword_26A86C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C558);
  }
  return result;
}

uint64_t sub_26039149C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2603914F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_26039150C(a1, a2);
  }
  return a1;
}

uint64_t sub_26039150C(uint64_t a1, unint64_t a2)
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

uint64_t sub_260391564(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2603915C0(uint64_t a1)
{
  return a1;
}

unint64_t sub_260391614(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_26039B2E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9) {
    return 0xD000000000000010;
  }
  swift_bridgeObjectRetain();
  sub_26039B2C0();
  if (!v2)
  {
    a2 = sub_26039B2D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return a2;
}

void sub_260391768()
{
  qword_26A86CFE8 = 0x74696B7473757274;
  unk_26A86CFF0 = 0xE800000000000000;
}

void sub_26039178C()
{
  qword_26A86CFF8 = 0x696F70646E456171;
  unk_26A86D000 = 0xEB0000000073746ELL;
}

void sub_2603917B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (void *)sub_26039B2F0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_2603924C8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_260391DA0;
  aBlock[3] = &block_descriptor_0;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v10);
}

void sub_260391998(void *a1, uint64_t a2, id a3)
{
  if (a3)
  {
    id v4 = a3;
    os_log_type_t v5 = sub_26039B3E0();
    sub_26039B4C0();
    sub_26039B380();
    swift_getErrorValue();
    sub_26039B620();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v5, 0, 0xE000000000000000, 0xD000000000000057, 0x800000026039D7F0);
    swift_bridgeObjectRelease();
    sub_26039B4C0();
    sub_26039B380();
    swift_getErrorValue();
    sub_26039B620();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
    sub_26039B3B0();

    return;
  }
  if (!a1) {
    goto LABEL_9;
  }
  id v7 = a1;
  if ((sub_260390D90((__SecKey *)v7) & 1) == 0)
  {

LABEL_9:
    os_log_type_t v8 = sub_26039B3E0();
    sub_260392574(v8, 0xD00000000000003ALL, 0x800000026039D7B0, 0xD000000000000057, 0x800000026039D7F0);
LABEL_10:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
    sub_26039B3B0();
    return;
  }
  if (a2 && sub_260391CA4(a2)) {
    goto LABEL_10;
  }
  os_log_type_t v9 = sub_26039B3E0();
  sub_260392574(v9, 0xD000000000000020, 0x800000026039D850, 0xD000000000000057, 0x800000026039D7F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
  sub_26039B3B0();
}

uint64_t sub_260391CA4(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_26039B520();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_26039149C(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_26039B500();
    sub_26039B530();
    sub_26039B540();
    sub_26039B510();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_260391DA0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3) {
    uint64_t v7 = sub_26039B3A0();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_260391E54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C580);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26039C290;
  sub_26039B340();
  uint64_t v1 = MEMORY[0x263F8D310];
  sub_26039B480();
  *(void *)(inited + 96) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 72) = 43200;
  sub_26039B340();
  sub_26039B480();
  uint64_t v2 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = 0;
  sub_26039B340();
  sub_26039B480();
  if (qword_26A86C338 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26A86CFE8;
  uint64_t v4 = unk_26A86CFF0;
  *(void *)(inited + 240) = v1;
  *(void *)(inited + 216) = v3;
  *(void *)(inited + 224) = v4;
  sub_26039B340();
  swift_bridgeObjectRetain();
  sub_26039B480();
  uint64_t v5 = qword_26A86CFE8;
  uint64_t v6 = unk_26A86CFF0;
  *(void *)(inited + 312) = v1;
  *(void *)(inited + 288) = v5;
  *(void *)(inited + 296) = v6;
  sub_26039B340();
  swift_bridgeObjectRetain();
  sub_26039B480();
  *(void *)(inited + 384) = v2;
  *(unsigned char *)(inited + 360) = 0;
  sub_26039B340();
  sub_26039B480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C588);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_26039C2A0;
  *(void *)(v7 + 32) = sub_26039B340();
  *(void *)(v7 + 40) = v8;
  *(void *)(inited + 456) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C590);
  *(void *)(inited + 432) = v7;
  return sub_260395CB0(inited);
}

uint64_t sub_2603920B8()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit18AttestationManager_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_260392160()
{
  return type metadata accessor for AttestationManager();
}

uint64_t type metadata accessor for AttestationManager()
{
  uint64_t result = qword_26A86C568;
  if (!qword_26A86C568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2603921B4()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AttestationManager.Attestation(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AttestationManager.Attestation(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for AttestationManager.Attestation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for AttestationManager.Attestation(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AttestationManager.Attestation(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AttestationManager.Attestation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttestationManager.Attestation()
{
  return &type metadata for AttestationManager.Attestation;
}

uint64_t sub_2603923F8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2603924C8(void *a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C578);
  sub_260391998(a1, a2, a3);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_260392574(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = a5;
  uint64_t v6 = a4;
  v17[0] = a4;
  v17[1] = a5;
  sub_260391448();
  uint64_t v10 = sub_26039B440();
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v12 = v10 + 16 * v11;
    uint64_t v6 = *(void *)(v12 + 16);
    unint64_t v5 = *(void *)(v12 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  CFDictionaryRef v13 = sub_26039B290();
  os_log_type_t v14 = a1;
  if (os_log_type_enabled(v13, a1))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315650;
    swift_bridgeObjectRetain();
    sub_2603928D0(v6, v5, v17);
    sub_26039B420();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2048;
    sub_26039B420();
    *(_WORD *)(v15 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_2603928D0(a2, a3, v17);
    sub_26039B420();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26038B000, v13, v14, "%s.%ld          %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x26120ECA0](v16, -1, -1);
    MEMORY[0x26120ECA0](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2603927D0(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D008);
}

uint64_t sub_2603927E4(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D020);
}

uint64_t sub_2603927F8(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D038);
}

uint64_t sub_26039280C(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D050);
}

uint64_t sub_260392820(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D068);
}

uint64_t sub_260392834(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D080);
}

uint64_t sub_260392848(uint64_t a1)
{
  return sub_26039285C(a1, qword_26A86D098);
}

uint64_t sub_26039285C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_26039B2B0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_26039B2A0();
}

uint64_t sub_2603928D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2603929A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_26039149C((uint64_t)v12, *a3);
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
      sub_26039149C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2603929A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_26039B430();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_260392B60(a5, a6);
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
  uint64_t v8 = sub_26039B4F0();
  if (!v8)
  {
    sub_26039B550();
    __break(1u);
LABEL_17:
    uint64_t result = sub_26039B5A0();
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

uint64_t sub_260392B60(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_260392BF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260392DD8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_260392DD8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_260392BF8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_260392D70(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_26039B4D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_26039B550();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_26039B390();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_26039B5A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_26039B550();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_260392D70(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26A86C598);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_260392DD8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26A86C598);
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
  CFDictionaryRef v13 = a4 + 32;
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
  uint64_t result = sub_26039B5A0();
  __break(1u);
  return result;
}

uint64_t sub_260392F2C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_260392F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 16) + **(int **)(a8 + 16));
  unint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *unint64_t v17 = v8;
  v17[1] = sub_260393080;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_260393080()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_260393174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 24) + **(int **)(a8 + 24));
  unint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *unint64_t v17 = v8;
  v17[1] = sub_2603932DC;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2603932B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_2603932E0()
{
  v1[9] = v0;
  v1[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
  v1[11] = swift_task_alloc();
  uint64_t v2 = sub_26039B140();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2603933D4, 0, 0);
}

uint64_t sub_2603933D4()
{
  sub_260393C60(*(void **)(v0 + 88));
  uint64_t v1 = *(uint64_t **)(v0 + 88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = *v1;
    uint64_t v3 = v1[1];
    char v4 = *((unsigned char *)v1 + 16);
    *(void *)(v0 + 16) = *v1;
    *(void *)(v0 + 24) = v3;
    *(unsigned char *)(v0 + 32) = v4;
    sub_2603984E4();
    swift_willThrowTypedImpl();
    swift_allocError();
    *(void *)uint64_t v5 = v2;
    *(void *)(v5 + 8) = v3;
    *(unsigned char *)(v5 + 16) = v4;
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    (*(void (**)(void, uint64_t *, void))(*(void *)(v0 + 104) + 32))(*(void *)(v0 + 112), v1, *(void *)(v0 + 96));
    id v8 = objc_msgSend(self, sel_defaultSessionConfiguration);
    *(void *)(v0 + 120) = objc_msgSend(self, sel_sessionWithConfiguration_, v8);

    int64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v9;
    *int64_t v9 = v0;
    v9[1] = sub_2603935CC;
    uint64_t v10 = *(void *)(v0 + 112);
    return MEMORY[0x270EF1EB0](v10, 0);
  }
}

uint64_t sub_2603935CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[17] = a1;
  v5[18] = a2;
  v5[19] = a3;
  v5[20] = v3;
  swift_task_dealloc();
  if (v3) {
    unint64_t v6 = sub_260393BC4;
  }
  else {
    unint64_t v6 = sub_2603936E4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2603936E4()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  uint64_t v2 = (void *)v0[19];
  if (!v1)
  {
    uint64_t v16 = v0[17];
    unint64_t v15 = v0[18];
    uint64_t v17 = v0[13];
    uint64_t v33 = v0[14];
    long long v29 = (void *)v0[15];
    uint64_t v31 = v0[12];
    os_log_type_t v18 = sub_26039B3E0();
    sub_26039B4C0();
    sub_26039B380();
    sub_26039B360();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v18, 0, 0xE000000000000000, 0xD000000000000051, 0x800000026039E0E0);
    swift_bridgeObjectRelease();
    sub_26039150C(v16, v15);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v33, v31);
    unint64_t v19 = 0xD000000000000037;
    unint64_t v20 = 0x800000026039DE70;
LABEL_9:
    int v23 = 2;
    int v24 = 1;
    goto LABEL_10;
  }
  uint64_t v3 = (void *)v1;
  id v4 = v2;
  if (objc_msgSend(v3, sel_statusCode) != (id)200)
  {
    os_log_type_t v26 = (void *)v0[19];
    uint64_t v27 = v0[17];
    unint64_t v28 = v0[18];
    uint64_t v21 = v0[13];
    uint64_t v34 = v0[14];
    long long v30 = (void *)v0[15];
    uint64_t v32 = v0[12];
    os_log_type_t v22 = sub_26039B3E0();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    v0[7] = objc_msgSend(v3, sel_statusCode);
    sub_26039B5D0();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v22, 0xD000000000000022, 0x800000026039E140, 0xD000000000000051, 0x800000026039E0E0);
    swift_bridgeObjectRelease();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    v0[8] = objc_msgSend(v3, sel_statusCode);
    sub_26039B5D0();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();

    sub_26039150C(v27, v28);
    unint64_t v19 = 0xD000000000000022;
    unint64_t v20 = 0x800000026039E140;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v34, v32);
    goto LABEL_9;
  }
  uint64_t v5 = v0[20];
  sub_26039B170();
  swift_allocObject();
  sub_26039B160();
  sub_260398DC0();
  sub_26039B150();
  unint64_t v6 = v0[18];
  int64_t v7 = (void *)v0[19];
  uint64_t v8 = v0[17];
  uint64_t v9 = v0[14];
  uint64_t v10 = (void *)v0[15];
  uint64_t v11 = v0[12];
  uint64_t v12 = v0[13];
  if (v5)
  {
    (*(void (**)(void, void))(v12 + 8))(v0[14], v0[12]);

    swift_release();
    sub_26039150C(v8, v6);

    swift_task_dealloc();
    swift_task_dealloc();
    CFDictionaryRef v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  swift_release();

  sub_26039150C(v8, v6);
  unint64_t v19 = v0[5];
  unint64_t v20 = v0[6];
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
  int v24 = 0;
  int v23 = 0;
LABEL_10:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(unint64_t, unint64_t, void))v0[1];
  return v25(v19, v20, v23 | (v24 << 8));
}

uint64_t sub_260393BC4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_260393C60@<X0>(void *a1@<X8>)
{
  os_log_type_t v26 = a1;
  uint64_t v1 = sub_26039B140();
  uint64_t v23 = *(void *)(v1 - 8);
  uint64_t v24 = v1;
  ((void (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v22 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C640);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_26039B220();
  uint64_t v5 = *(void *)(v25 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v20 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - v8;
  if (qword_26A86C340 != -1) {
    swift_once();
  }
  uint64_t v21 = v9;
  if (qword_26A86C3A8 != -1) {
    swift_once();
  }
  if (qword_26A86C6D8)
  {
    id v10 = (id)qword_26A86C6D8;
    uint64_t v11 = (void *)sub_26039B330();
    objc_msgSend(v10, sel_BOOLForKey_, v11);
  }
  os_log_type_t v12 = sub_26039B3D0();
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_26039B4C0();
  swift_bridgeObjectRelease();
  uint64_t v27 = 0xD000000000000023;
  unint64_t v28 = 0x800000026039DF20;
  sub_26039B380();
  sub_26039B380();
  sub_260392574(v12, v27, v28, 0xD000000000000051, 0x800000026039E0E0);
  swift_bridgeObjectRelease();
  sub_26039B210();
  swift_bridgeObjectRelease();
  uint64_t v13 = v25;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v4, 1, v25) == 1)
  {
    sub_260398CDC((uint64_t)v4);
    os_log_type_t v14 = sub_26039B3D0();
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v27 = 0xD000000000000018;
    unint64_t v28 = 0x800000026039DF50;
    sub_26039B360();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v14, v27, v28, 0xD000000000000051, 0x800000026039E0E0);
    swift_bridgeObjectRelease();
    unint64_t v15 = v26;
    *os_log_type_t v26 = 0xD000000000000015;
    v15[1] = 0x800000026039DF70;
    *((unsigned char *)v15 + 16) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
  }
  else
  {
    uint64_t v16 = v21;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v21, v4, v13);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v20, v16, v13);
    uint64_t v17 = v22;
    sub_26039B110();
    if (qword_26A86C300 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_26039B100();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v13);
    (*(void (**)(void *, char *, uint64_t))(v23 + 32))(v26, v17, v24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
  }
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2603941BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  v4[14] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
  v4[15] = swift_task_alloc();
  uint64_t v5 = sub_26039B140();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2603942B4, 0, 0);
}

uint64_t sub_2603942B4()
{
  uint64_t v1 = *(void **)(v0 + 120);
  unint64_t v2 = *(void *)(v0 + 96);
  id v4 = *(void **)(v0 + 80);
  unint64_t v3 = *(void *)(v0 + 88);
  sub_260398B0C(v4);
  swift_retain();
  sub_260394B3C(v4, v3, v2, v1);
  uint64_t v5 = *(uint64_t **)(v0 + 120);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = *(void **)(v0 + 80);
    uint64_t v7 = *v5;
    uint64_t v8 = v5[1];
    char v9 = *((unsigned char *)v5 + 16);
    *(void *)(v0 + 40) = *v5;
    *(void *)(v0 + 48) = v8;
    *(unsigned char *)(v0 + 56) = v9;
    sub_2603984E4();
    swift_willThrowTypedImpl();
    swift_allocError();
    *(void *)uint64_t v10 = v7;
    *(void *)(v10 + 8) = v8;
    *(unsigned char *)(v10 + 16) = v9;
    sub_260398B4C(v6);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    (*(void (**)(void, uint64_t *, void))(*(void *)(v0 + 136) + 32))(*(void *)(v0 + 144), v5, *(void *)(v0 + 128));
    id v13 = objc_msgSend(self, sel_defaultSessionConfiguration);
    *(void *)(v0 + 152) = objc_msgSend(self, sel_sessionWithConfiguration_, v13);

    os_log_type_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v14;
    *os_log_type_t v14 = v0;
    v14[1] = sub_260394508;
    uint64_t v15 = *(void *)(v0 + 144);
    return MEMORY[0x270EF1EB0](v15, 0);
  }
}

uint64_t sub_260394508(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v4;
  *(void *)(v7 + 168) = a3;
  *(void *)(v7 + 176) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v8 = sub_260394A7C;
  }
  else
  {
    sub_26039150C(a1, a2);
    uint64_t v8 = sub_260394638;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_260394638()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    unint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 168);
    id v4 = objc_msgSend(v2, sel_statusCode);
    uint64_t v5 = *(void **)(v0 + 168);
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v6 = *(void **)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 136);
    if (v4 == (id)200)
    {
      uint64_t v10 = *(void **)(v0 + 80);

      sub_260398B4C(v10);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      int v11 = 0;
      unint64_t v12 = 0;
      unint64_t v13 = 0;
      int v14 = 0;
      goto LABEL_7;
    }
    uint64_t v27 = *(void *)(v0 + 128);
    uint64_t v29 = *(void *)(v0 + 144);
    uint64_t v23 = *(void **)(v0 + 80);
    os_log_type_t v20 = sub_26039B3E0();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 64) = [v2 (SEL)0x26555538BLL];
    sub_26039B5D0();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v20, 0xD000000000000026, 0x800000026039DEB0, 0xD000000000000054, 0x800000026039DE10);
    swift_bridgeObjectRelease();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 72) = objc_msgSend(v2, sel_statusCode);
    sub_26039B5D0();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();

    sub_260398B4C(v23);
    swift_release();

    unint64_t v12 = 0xD000000000000026;
    unint64_t v13 = 0x800000026039DEB0;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v29, v27);
  }
  else
  {
    uint64_t v24 = *(void **)(v0 + 152);
    uint64_t v25 = *(void **)(v0 + 168);
    uint64_t v15 = *(void *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 128);
    uint64_t v28 = *(void *)(v0 + 144);
    uint64_t v16 = *(void *)(v0 + 96);
    os_log_type_t v18 = *(void **)(v0 + 80);
    uint64_t v17 = *(void *)(v0 + 88);
    os_log_type_t v19 = sub_26039B3E0();
    sub_26039B4C0();
    sub_26039B380();
    *(void *)(v0 + 16) = v18;
    *(void *)(v0 + 24) = v17;
    *(void *)(v0 + 32) = v16;
    sub_260398B0C(v18);
    swift_retain();
    sub_26039B360();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v19, 0, 0xE000000000000000, 0xD000000000000054, 0x800000026039DE10);
    swift_bridgeObjectRelease();

    sub_260398B4C(v18);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v28, v26);
    unint64_t v12 = 0xD000000000000037;
    unint64_t v13 = 0x800000026039DE70;
  }
  int v14 = 2;
  int v11 = 1;
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(unint64_t, unint64_t, void))(v0 + 8);
  return v21(v12, v13, v14 | (v11 << 8));
}

uint64_t sub_260394A7C()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 136);
  id v4 = *(void **)(v0 + 80);

  sub_260398B4C(v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_260394B3C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  v94 = a4;
  uint64_t v91 = sub_26039B140();
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  v93 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C640);
  MEMORY[0x270FA5388](v8 - 8);
  v96 = (char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_26039B220();
  uint64_t v98 = *(void *)(v97 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v97);
  v92 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v95 = (char *)&v90 - v12;
  uint64_t v13 = sub_26039B190();
  MEMORY[0x270FA5388](v13 - 8);
  v104 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v121 = sub_26039B270();
  MEMORY[0x270FA5388](v121);
  uint64_t v110 = (uint64_t)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v108 = a2;
  unint64_t v106 = a3;
  v102 = a1;
  uint64_t v103 = v16;
  if (!a1)
  {
    swift_retain();
    uint64_t v101 = 0;
    unint64_t v30 = 0xE000000000000000;
    goto LABEL_20;
  }
  if (!(a2 >> 62))
  {
    uint64_t v17 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    sub_260398B0C(a1);
    swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x263F8EE78];
LABEL_19:
    uint64_t v114 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C590);
    sub_260398BE4();
    uint64_t v101 = sub_26039B320();
    unint64_t v30 = v42;
    swift_bridgeObjectRelease();
LABEL_20:
    swift_beginAccess();
    uint64_t v43 = *(void *)(a3 + 32);
    unint64_t v44 = *(void *)(a3 + 40);
    switch(v44 >> 62)
    {
      case 1uLL:
      case 2uLL:
        sub_2603988D8(*(void *)(a3 + 32), *(void *)(a3 + 40));
        sub_2603988D8(v43, v44);
        sub_2603988D8(v43, v44);
        break;
      default:
        break;
    }
    unint64_t v107 = v30;
    sub_26039B280();
    uint64_t v100 = v43;
    unint64_t v99 = v44;
    sub_26039150C(v43, v44);
    sub_260398B8C();
    sub_26039B410();
    if ((v114 & 0x100) != 0)
    {
      v45 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      v45 = (void *)MEMORY[0x263F8EE78];
      long long v109 = xmmword_26039C2A0;
      uint64_t v56 = MEMORY[0x263F8E778];
      uint64_t v57 = MEMORY[0x263F8E7C0];
      do
      {
        char v58 = v114;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C660);
        uint64_t v59 = swift_allocObject();
        *(_OWORD *)(v59 + 16) = v109;
        *(void *)(v59 + 56) = v56;
        *(void *)(v59 + 64) = v57;
        *(unsigned char *)(v59 + 32) = v58;
        uint64_t v60 = sub_26039B350();
        uint64_t v62 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v45 = sub_260398538(0, v45[2] + 1, 1, v45);
        }
        unint64_t v64 = v45[2];
        unint64_t v63 = v45[3];
        if (v64 >= v63 >> 1) {
          v45 = sub_260398538((void *)(v63 > 1), v64 + 1, 1, v45);
        }
        v45[2] = v64 + 1;
        v65 = &v45[2 * v64];
        v65[4] = v60;
        v65[5] = v62;
        sub_26039B410();
      }
      while (BYTE1(v114) != 1);
    }
    (*(void (**)(uint64_t, unint64_t))(v103 + 8))(v110, v121);
    sub_26039150C(v100, v99);
    uint64_t v114 = (uint64_t)v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C590);
    sub_260398BE4();
    uint64_t v46 = sub_26039B320();
    uint64_t v48 = v47;
    swift_bridgeObjectRelease();
    unint64_t v49 = v106;
    swift_beginAccess();
    uint64_t v51 = *(void *)(v49 + 16);
    unint64_t v50 = *(void *)(v49 + 24);
    sub_26039B1D0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_26039B1C0();
    sub_26039B180();
    sub_26039B1A0();
    uint64_t v114 = v51;
    unint64_t v115 = v50;
    uint64_t v116 = v101;
    unint64_t v117 = v107;
    uint64_t v118 = v46;
    uint64_t v119 = v48;
    sub_260398C88();
    uint64_t v52 = v105;
    uint64_t v53 = sub_26039B1B0();
    if (v52)
    {
      swift_release();
      sub_260398B4C(v102);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    uint64_t v17 = v53;
    a3 = v54;
    *(void *)&long long v109 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A86C340 == -1) {
      goto LABEL_34;
    }
    goto LABEL_60;
  }
  swift_retain();
  sub_260398B0C(a1);
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_26039B560();
  if (!v17) {
    goto LABEL_18;
  }
LABEL_4:
  uint64_t v120 = MEMORY[0x263F8EE78];
  sub_260398648(0, v17 & ~(v17 >> 63), 0);
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v120;
    *(void *)&long long v109 = v17;
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v19 = 0;
      unint64_t v107 = 0x800000026039E080;
      do
      {
        os_log_type_t v20 = (__SecCertificate *)MEMORY[0x26120E530](v19, a2);
        CFDataRef v21 = SecCertificateCopyData(v20);
        uint64_t v22 = sub_26039B260();
        unint64_t v24 = v23;

        uint64_t v114 = 0xD00000000000001CLL;
        unint64_t v115 = v107;
        sub_26039B240();
        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();
        sub_26039B380();
        sub_26039150C(v22, v24);
        swift_unknownObjectRelease();
        uint64_t v25 = v114;
        unint64_t v26 = v115;
        uint64_t v120 = v18;
        unint64_t v28 = *(void *)(v18 + 16);
        unint64_t v27 = *(void *)(v18 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_260398648(v27 > 1, v28 + 1, 1);
          uint64_t v18 = v120;
        }
        ++v19;
        *(void *)(v18 + 16) = v28 + 1;
        uint64_t v29 = v18 + 16 * v28;
        *(void *)(v29 + 32) = v25;
        *(void *)(v29 + 40) = v26;
        a2 = v108;
      }
      while ((void)v109 != v19);
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v107 = 0x800000026039E080;
      do
      {
        uint64_t v32 = (__SecCertificate *)*(id *)(a2 + 8 * v31 + 32);
        CFDataRef v33 = SecCertificateCopyData(v32);
        uint64_t v34 = sub_26039B260();
        unint64_t v36 = v35;

        uint64_t v114 = 0xD00000000000001CLL;
        unint64_t v115 = v107;
        sub_26039B240();
        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();
        sub_26039B380();
        sub_26039150C(v34, v36);

        uint64_t v37 = v114;
        unint64_t v38 = v115;
        uint64_t v120 = v18;
        unint64_t v40 = *(void *)(v18 + 16);
        unint64_t v39 = *(void *)(v18 + 24);
        if (v40 >= v39 >> 1)
        {
          sub_260398648(v39 > 1, v40 + 1, 1);
          uint64_t v18 = v120;
        }
        ++v31;
        *(void *)(v18 + 16) = v40 + 1;
        uint64_t v41 = v18 + 16 * v40;
        *(void *)(v41 + 32) = v37;
        *(void *)(v41 + 40) = v38;
        a2 = v108;
      }
      while ((void)v109 != v31);
    }
    swift_bridgeObjectRelease();
    a3 = v106;
    goto LABEL_19;
  }
  __break(1u);
LABEL_60:
  swift_once();
LABEL_34:
  if (qword_26A86C3A8 != -1) {
    swift_once();
  }
  unint64_t v121 = a3;
  uint64_t v110 = v17;
  if (qword_26A86C6D8)
  {
    id v66 = (id)qword_26A86C6D8;
    v67 = (void *)sub_26039B330();
    objc_msgSend(v66, sel_BOOLForKey_, v67);
  }
  os_log_type_t v68 = sub_26039B3D0();
  uint64_t v114 = 0;
  unint64_t v115 = 0xE000000000000000;
  sub_26039B4C0();
  swift_bridgeObjectRelease();
  uint64_t v114 = 0xD000000000000023;
  unint64_t v115 = 0x800000026039DF20;
  sub_26039B380();
  sub_26039B380();
  sub_260392574(v68, v114, v115, 0xD000000000000054, 0x800000026039DE10);
  swift_bridgeObjectRelease();
  uint64_t v69 = (uint64_t)v96;
  sub_26039B210();
  swift_bridgeObjectRelease();
  uint64_t v70 = v98;
  uint64_t v71 = v97;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48))(v69, 1, v97) == 1)
  {
    sub_260398CDC(v69);
    LODWORD(v107) = sub_26039B3D0();
    uint64_t v114 = 0;
    unint64_t v115 = 0xE000000000000000;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v111 = 0xD000000000000018;
    unint64_t v112 = 0x800000026039DF50;
    v72 = v102;
    uint64_t v114 = (uint64_t)v102;
    unint64_t v115 = v108;
    uint64_t v116 = v106;
    swift_retain();
    sub_260398B0C(v72);
    sub_26039B360();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574((os_log_type_t)v107, v111, v112, 0xD000000000000054, 0x800000026039DE10);
    swift_bridgeObjectRelease();
    sub_26039150C(v110, v121);
    swift_release();
    sub_260398B4C(v72);
    swift_release();
    v73 = v94;
    void *v94 = 0xD000000000000015;
    v73[1] = 0x800000026039DF70;
    *((unsigned char *)v73 + 16) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
    return swift_storeEnumTagMultiPayload();
  }
  v74 = v95;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v95, v69, v71);
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v92, v74, v71);
  v75 = v93;
  sub_26039B110();
  if (qword_26A86C308 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_26039B100();
  unint64_t v76 = v121;
  unint64_t v77 = v121 >> 62;
  uint64_t v78 = v110;
  sub_2603988D8(v110, v121);
  sub_26039B120();
  if (qword_26A86C310 != -1) {
    swift_once();
  }
  sub_26039B130();
  uint64_t v114 = 0;
  unint64_t v115 = 0xE000000000000000;
  uint64_t v79 = 0;
  switch((int)v77)
  {
    case 1:
      LODWORD(v79) = HIDWORD(v78) - v78;
      if (__OFSUB__(HIDWORD(v78), v78))
      {
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        sub_26039B550();
        __break(1u);
        JUMPOUT(0x260395C90);
      }
      uint64_t v79 = (int)v79;
LABEL_49:
      if (v79 < 0) {
        goto LABEL_63;
      }
LABEL_50:
      uint64_t v111 = v79;
      sub_26039B5D0();
      sub_26039B380();
      swift_bridgeObjectRelease();
      if (qword_26A86C318 != -1) {
        swift_once();
      }
      sub_26039B130();
      swift_bridgeObjectRelease();
      v83 = v102;
      if (v102)
      {
        v84 = v102;
        swift_bridgeObjectRetain();
        sub_260390030(v78, v76, v84, (uint64_t)&v114);
        uint64_t v86 = v114;
        uint64_t v85 = v115;
        unsigned __int8 v87 = v116;
        if ((v116 & 0x100) != 0)
        {
          uint64_t v111 = v114;
          unint64_t v112 = v115;
          char v113 = v116;
          sub_260398490();
          swift_willThrowTypedImpl();
          swift_allocError();
          *(void *)uint64_t v88 = v86;
          *(void *)(v88 + 8) = v85;
          *(unsigned char *)(v88 + 16) = v87;
          swift_bridgeObjectRelease();

          swift_release();
          sub_260398B4C(v83);
          swift_release();
          sub_26039150C(v110, v121);
          (*(void (**)(char *, uint64_t))(v90 + 8))(v93, v91);
          return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v95, v97);
        }
        sub_26039B240();
        v89 = v93;
        sub_26039B130();
        v75 = v89;
        swift_bridgeObjectRelease();
        swift_release();
        sub_260398D3C(v86, v85, v87, 0);
        swift_bridgeObjectRelease();

        sub_260398B4C(v83);
        swift_release();
        sub_26039150C(v110, v121);
        uint64_t v71 = v97;
      }
      else
      {
        sub_26039150C(v78, v76);
        swift_release();
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v98 + 8))(v95, v71);
      (*(void (**)(void *, char *, uint64_t))(v90 + 32))(v94, v75, v91);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C638);
      return swift_storeEnumTagMultiPayload();
    case 2:
      uint64_t v81 = *(void *)(v78 + 16);
      uint64_t v80 = *(void *)(v78 + 24);
      BOOL v82 = __OFSUB__(v80, v81);
      uint64_t v79 = v80 - v81;
      if (!v82) {
        goto LABEL_49;
      }
      goto LABEL_62;
    case 3:
      goto LABEL_50;
    default:
      uint64_t v79 = BYTE6(v76);
      goto LABEL_50;
  }
}

unint64_t sub_260395CB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C668);
  uint64_t v2 = sub_26039B590();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_260398D48(v6, (uint64_t)v15);
    unint64_t result = sub_260390BA0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_260398DB0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_260395DE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C528);
  uint64_t v2 = (void *)sub_26039B590();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_260390B28(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
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

uint64_t TKRecordService.fetchEncryptionKey()()
{
  *(void *)(v1 + 232) = v0;
  return MEMORY[0x270FA2498](sub_260395F1C, 0, 0);
}

uint64_t sub_260395F1C()
{
  uint64_t v12 = v0;
  if (sub_260398E14())
  {
    uint64_t v9 = (uint64_t (__cdecl *)())((char *)&dword_26A86C5E8 + dword_26A86C5E8);
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_26039616C;
    return v9();
  }
  else
  {
    os_log_type_t v3 = sub_26039B3E0();
    sub_260392574(v3, 0xD000000000000025, 0x800000026039DB30, 0xD000000000000058, 0x800000026039DB60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26039C2A0;
    if (qword_26A86C388 != -1) {
      swift_once();
    }
    uint64_t v5 = unk_26A86C5C0;
    *(void *)(inited + 32) = qword_26A86C5B8;
    *(void *)(inited + 40) = v5;
    sub_260398450();
    swift_bridgeObjectRetain();
    *(void *)(inited + 48) = sub_26039B400();
    unint64_t v6 = sub_260395DE0(inited);
    v10[0] = 0xD000000000000025;
    v10[1] = 0x800000026039DB30;
    char v11 = 0;
    sub_26038EFD8(v6, 1, (uint64_t)v10);
    swift_bridgeObjectRelease();
    sub_260398490();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD000000000000025;
    *(void *)(v7 + 8) = 0x800000026039DB30;
    *(unsigned char *)(v7 + 16) = 0;
    swift_willThrow();
    id v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_26039616C(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v5 = *v4;
  *(void *)(v5 + 248) = a1;
  *(void *)(v5 + 256) = a2;
  *(_WORD *)(v5 + 90) = a3;
  *(void *)(v5 + 264) = v3;
  swift_task_dealloc();
  if (v3) {
    unint64_t v6 = sub_2603967FC;
  }
  else {
    unint64_t v6 = sub_260396288;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_260396288()
{
  uint64_t v35 = v0;
  __int16 v1 = *(_WORD *)(v0 + 90);
  if ((v1 & 0x100) != 0)
  {
    uint64_t v13 = *(void *)(v0 + 248);
    uint64_t v12 = *(void *)(v0 + 256);
    *(void *)(v0 + 72) = v13;
    *(void *)(v0 + 80) = v12;
    *(unsigned char *)(v0 + 88) = v1;
    sub_2603984E4();
    swift_willThrowTypedImpl();
    char v11 = (void *)swift_allocError();
    *(void *)uint64_t v14 = v13;
    *(void *)(v14 + 8) = v12;
    *(unsigned char *)(v14 + 16) = v1;
    *(void *)(v0 + 216) = v11;
    id v15 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
    if (swift_dynamicCast())
    {
      uint64_t v16 = *(void *)(v0 + 96);
      uint64_t v17 = *(void *)(v0 + 104);
      unsigned __int8 v18 = *(unsigned char *)(v0 + 112);
      unint64_t v19 = sub_260395DE0(MEMORY[0x263F8EE78]);
      unint64_t v32 = v16;
      unint64_t v33 = v17;
      char v34 = v18;
      sub_26038CE34(v16, v17, v18);
      sub_26038EFD8(v19, 1, (uint64_t)&v32);
      swift_bridgeObjectRelease();
      sub_26038CE5C(v16, v17, v18);
      LOBYTE(v19) = sub_26039B3E0();
      unint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      unint64_t v32 = 0xD000000000000028;
      unint64_t v33 = 0x800000026039DBE0;
      *(void *)(v0 + 120) = v16;
      *(void *)(v0 + 128) = v17;
      *(unsigned char *)(v0 + 136) = v18;
      sub_260398490();
      sub_26039B620();
      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      uint64_t v20 = v32;
      os_log_type_t v21 = v19;
      unint64_t v22 = v33;
LABEL_14:
      sub_260392574(v21, v20, v22, 0xD000000000000058, 0x800000026039DB60);
      swift_bridgeObjectRelease();
      swift_allocError();
      *(void *)uint64_t v29 = v16;
      *(void *)(v29 + 8) = v17;
      *(unsigned char *)(v29 + 16) = v18;
LABEL_16:
      swift_willThrow();

      uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
      return v31();
    }
LABEL_15:
    sub_260398490();
    swift_allocError();
    *(void *)uint64_t v30 = 0xD00000000000001ALL;
    *(void *)(v30 + 8) = 0x800000026039DBC0;
    *(unsigned char *)(v30 + 16) = 2;
    goto LABEL_16;
  }
  uint64_t v2 = *(void **)(v0 + 264);
  unint64_t v3 = sub_260391614(*(void *)(v0 + 248), *(void *)(v0 + 256));
  uint64_t v5 = v4;
  __int16 v7 = v6;
  __int16 v8 = *(_WORD *)(v0 + 90);
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v10 = *(void *)(v0 + 256);
  if (v2)
  {
    char v11 = v2;
    sub_2603988C8(v9, v10, v8, 0);
    goto LABEL_12;
  }
  sub_2603988C8(v9, v10, v8, 0);
  if ((v7 & 0x100) != 0)
  {
    *(void *)(v0 + 168) = v3;
    *(void *)(v0 + 176) = v5;
    *(unsigned char *)(v0 + 184) = v7;
    sub_2603984E4();
    swift_willThrowTypedImpl();
    char v11 = (void *)swift_allocError();
    *(void *)uint64_t v26 = v3;
    *(void *)(v26 + 8) = v5;
    *(unsigned char *)(v26 + 16) = v7;
LABEL_12:
    *(void *)(v0 + 224) = v11;
    id v27 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
    if (swift_dynamicCast())
    {
      uint64_t v16 = *(void *)(v0 + 192);
      uint64_t v17 = *(void *)(v0 + 200);
      unsigned __int8 v18 = *(unsigned char *)(v0 + 208);
      unint64_t v28 = sub_260395DE0(MEMORY[0x263F8EE78]);
      unint64_t v32 = v16;
      unint64_t v33 = v17;
      char v34 = v18;
      sub_26038CE34(v16, v17, v18);
      sub_26038EFD8(v28, 1, (uint64_t)&v32);
      swift_bridgeObjectRelease();
      sub_26038CE5C(v16, v17, v18);
      LOBYTE(v28) = sub_26039B3E0();
      unint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      unint64_t v32 = 0xD00000000000002DLL;
      unint64_t v33 = 0x800000026039DC10;
      *(void *)(v0 + 144) = v16;
      *(void *)(v0 + 152) = v17;
      *(unsigned char *)(v0 + 160) = v18;
      sub_260398490();
      sub_26039B620();
      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      uint64_t v20 = v32;
      os_log_type_t v21 = v28;
      unint64_t v22 = v33;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  unint64_t v23 = sub_260395DE0(MEMORY[0x263F8EE78]);
  unint64_t v32 = 0;
  unint64_t v33 = 0;
  char v34 = -1;
  sub_26038EFD8(v23, 1, (uint64_t)&v32);
  swift_bridgeObjectRelease();
  unint64_t v24 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 8);
  return v24(v3, v5);
}

uint64_t sub_2603967FC()
{
  uint64_t v13 = v0;
  __int16 v1 = *(void **)(v0 + 264);
  *(void *)(v0 + 216) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 104);
    unsigned __int8 v5 = *(unsigned char *)(v0 + 112);
    unint64_t v6 = sub_260395DE0(MEMORY[0x263F8EE78]);
    uint64_t v10 = v4;
    unint64_t v11 = v3;
    unsigned __int8 v12 = v5;
    sub_26038CE34(v4, v3, v5);
    sub_26038EFD8(v6, 1, (uint64_t)&v10);
    swift_bridgeObjectRelease();
    sub_26038CE5C(v4, v3, v5);
    LOBYTE(v6) = sub_26039B3E0();
    uint64_t v10 = 0;
    unint64_t v11 = 0xE000000000000000;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v10 = 0xD000000000000028;
    unint64_t v11 = 0x800000026039DBE0;
    *(void *)(v0 + 120) = v4;
    *(void *)(v0 + 128) = v3;
    *(unsigned char *)(v0 + 136) = v5;
    sub_260398490();
    sub_26039B620();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574((os_log_type_t)v6, v10, v11, 0xD000000000000058, 0x800000026039DB60);
    swift_bridgeObjectRelease();
    swift_allocError();
    *(void *)uint64_t v7 = v4;
  }
  else
  {
    sub_260398490();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD00000000000001ALL;
    uint64_t v3 = 0x800000026039DBC0;
    unsigned __int8 v5 = 2;
  }
  *(void *)(v7 + 8) = v3;
  *(unsigned char *)(v7 + 16) = v5;
  swift_willThrow();

  __int16 v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t TKRecordService.upload(_:)(uint64_t a1, uint64_t a2)
{
  v3[45] = a2;
  v3[46] = v2;
  v3[44] = a1;
  return MEMORY[0x270FA2498](sub_260396A84, 0, 0);
}

uint64_t sub_260396A84()
{
  unint64_t v28 = v0;
  if (sub_260398E14())
  {
    uint64_t v1 = v0[45];
    os_log_type_t v2 = sub_26039B3D0();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v26 = 0xD000000000000021;
    unint64_t v27 = 0x800000026039DCA0;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    unint64_t v23 = 0x444964726F636572;
    unint64_t v24 = 0xE90000000000003DLL;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 32);
    unint64_t v4 = *(void *)(v1 + 40);
    sub_2603988D8(v3, v4);
    sub_26039B240();
    sub_26039150C(v3, v4);
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    swift_bridgeObjectRelease();
    v0[47] = OBJC_IVAR____TtC8TrustKit15TKRecordService_logger;
    sub_26039B380();
    sub_260392574(v2, v26, v27, 0xD000000000000058, 0x800000026039DB60);
    swift_bridgeObjectRelease();
    type metadata accessor for AttestationManager();
    uint64_t v5 = swift_allocObject();
    v0[48] = v5;
    *(void *)(v5 + 16) = sub_260391E54();
    uint64_t v6 = v5 + OBJC_IVAR____TtC8TrustKit18AttestationManager_logger;
    if (qword_26A86C368 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_26039B2B0();
    uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26A86D068);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, v8, v7);
    if (DeviceIdentityIsSupported())
    {
      uint64_t v9 = (void *)swift_task_alloc();
      v0[49] = v9;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C608);
      *uint64_t v9 = v0;
      v9[1] = sub_260397100;
      return MEMORY[0x270FA2360](v0 + 21, 0, 0, 0x29286863746566, 0xE700000000000000, sub_260398930, v5, v10);
    }
    uint64_t v16 = (void *)v0[44];
    swift_release();
    *uint64_t v16 = 0xD000000000000025;
    unint64_t v19 = 0x800000026039DCD0;
    char v20 = 2;
  }
  else
  {
    uint64_t v11 = v0[45];
    os_log_type_t v12 = sub_26039B3E0();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v26 = 0xD00000000000002CLL;
    unint64_t v27 = 0x800000026039DC40;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    unint64_t v23 = 0x444964726F636572;
    unint64_t v24 = 0xE90000000000003DLL;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    swift_beginAccess();
    uint64_t v13 = *(void *)(v11 + 32);
    unint64_t v14 = *(void *)(v11 + 40);
    sub_2603988D8(v13, v14);
    sub_26039B240();
    sub_26039150C(v13, v14);
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v12, 0xD00000000000002CLL, 0x800000026039DC40, 0xD000000000000058, 0x800000026039DB60);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26039C2A0;
    if (qword_26A86C388 != -1) {
      swift_once();
    }
    uint64_t v16 = (void *)v0[44];
    uint64_t v17 = unk_26A86C5C0;
    *(void *)(inited + 32) = qword_26A86C5B8;
    *(void *)(inited + 40) = v17;
    sub_260398450();
    swift_bridgeObjectRetain();
    *(void *)(inited + 48) = sub_26039B400();
    unint64_t v18 = sub_260395DE0(inited);
    unint64_t v19 = 0x800000026039DC70;
    unint64_t v23 = 0xD000000000000029;
    unint64_t v24 = 0x800000026039DC70;
    char v25 = 0;
    sub_26038EFD8(v18, 2, (uint64_t)&v23);
    swift_bridgeObjectRelease();
    char v20 = 0;
    *uint64_t v16 = 0xD000000000000029;
  }
  v16[1] = v19;
  *(unsigned char *)(v0[44] + 16) = v20;
  os_log_type_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_260397100()
{
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_26039758C;
  }
  else {
    os_log_type_t v2 = sub_260397214;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260397214()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0;
  os_log_type_t v2 = *(void **)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v3 = v0 + 168;
  *(void *)(v3 + 240) = v2;
  *(void *)(v3 + 248) = v4;
  unsigned __int8 v5 = *(unsigned char *)(v3 + 16);
  *(unsigned char *)(v3 + 20) = v5;
  if (*(unsigned char *)(v3 + 17))
  {
    *(void *)(v1 + 264) = v2;
    *(void *)(v1 + 272) = v4;
    *(unsigned char *)(v1 + 280) = v5;
    sub_260398490();
    swift_willThrowTypedImpl();
    uint64_t v6 = (void *)swift_allocError();
    *(void *)uint64_t v7 = v2;
    *(void *)(v7 + 8) = v4;
    *(unsigned char *)(v7 + 16) = v5;
    swift_release();
    *(void *)(v1 + 336) = v6;
    id v8 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
    if (swift_dynamicCast())
    {
      uint64_t v9 = *(uint64_t **)(v1 + 352);
      uint64_t v11 = *(void *)(v1 + 192);
      uint64_t v10 = *(void *)(v1 + 200);
      unsigned __int8 v12 = *(unsigned char *)(v1 + 208);
      unint64_t v13 = sub_260395DE0(MEMORY[0x263F8EE78]);
      uint64_t v20 = v11;
      unint64_t v21 = v10;
      unsigned __int8 v22 = v12;
      sub_26038CE34(v11, v10, v12);
      sub_26038EFD8(v13, 2, (uint64_t)&v20);
      swift_bridgeObjectRelease();
      sub_26038CE5C(v11, v10, v12);
      LOBYTE(v13) = sub_26039B3E0();
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      uint64_t v20 = 0xD000000000000025;
      unint64_t v21 = 0x800000026039DD00;
      *(void *)(v1 + 240) = v11;
      *(void *)(v1 + 248) = v10;
      *(unsigned char *)(v1 + 256) = v12;
      sub_26039B620();
      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      sub_260392574((os_log_type_t)v13, v20, v21, 0xD000000000000058, 0x800000026039DB60);

      swift_bridgeObjectRelease();
      *uint64_t v9 = v11;
    }
    else
    {
      uint64_t v9 = *(uint64_t **)(v1 + 352);

      *uint64_t v9 = 0xD00000000000001ALL;
      uint64_t v10 = 0x800000026039DBC0;
      unsigned __int8 v12 = 2;
    }
    v9[1] = v10;
    *(unsigned char *)(*(void *)(v1 + 352) + 16) = v12;
    unint64_t v18 = *(uint64_t (**)(void))(v1 + 8);
    return v18();
  }
  else
  {
    swift_release();
    swift_retain_n();
    id v14 = v2;
    swift_bridgeObjectRetain();
    sub_260398938(v2, v4, v5, 0);
    unint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A86C610 + dword_26A86C610);
    id v15 = (void *)swift_task_alloc();
    *(void *)(v1 + 424) = v15;
    *id v15 = v1;
    v15[1] = sub_2603977C0;
    uint64_t v16 = *(void *)(v1 + 360);
    return v19((uint64_t)v2, v4, v16);
  }
}

uint64_t sub_26039758C()
{
  uint64_t v13 = v0;
  swift_release();
  uint64_t v1 = *(void **)(v0 + 400);
  *(void *)(v0 + 336) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(uint64_t **)(v0 + 352);
    uint64_t v5 = *(void *)(v0 + 192);
    uint64_t v4 = *(void *)(v0 + 200);
    unsigned __int8 v6 = *(unsigned char *)(v0 + 208);
    unint64_t v7 = sub_260395DE0(MEMORY[0x263F8EE78]);
    uint64_t v10 = v5;
    unint64_t v11 = v4;
    unsigned __int8 v12 = v6;
    sub_26038CE34(v5, v4, v6);
    sub_26038EFD8(v7, 2, (uint64_t)&v10);
    swift_bridgeObjectRelease();
    sub_26038CE5C(v5, v4, v6);
    LOBYTE(v7) = sub_26039B3E0();
    uint64_t v10 = 0;
    unint64_t v11 = 0xE000000000000000;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v10 = 0xD000000000000025;
    unint64_t v11 = 0x800000026039DD00;
    *(void *)(v0 + 240) = v5;
    *(void *)(v0 + 248) = v4;
    *(unsigned char *)(v0 + 256) = v6;
    sub_260398490();
    sub_26039B620();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574((os_log_type_t)v7, v10, v11, 0xD000000000000058, 0x800000026039DB60);

    swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
  }
  else
  {
    uint64_t v3 = *(uint64_t **)(v0 + 352);

    *uint64_t v3 = 0xD00000000000001ALL;
    uint64_t v4 = 0x800000026039DBC0;
    unsigned __int8 v6 = 2;
  }
  v3[1] = v4;
  *(unsigned char *)(*(void *)(v0 + 352) + 16) = v6;
  id v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2603977C0(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v5 = *v4;
  *(void *)(v5 + 432) = a1;
  *(void *)(v5 + 440) = a2;
  *(_WORD *)(v5 + 186) = a3;
  *(void *)(v5 + 448) = v3;
  swift_task_dealloc();
  if (v3) {
    unsigned __int8 v6 = sub_260397C24;
  }
  else {
    unsigned __int8 v6 = sub_2603978DC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2603978DC()
{
  uint64_t v25 = v0;
  __int16 v1 = *(_WORD *)(v0 + 186);
  sub_260398994(*(void **)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 188), 0);
  swift_release();
  if ((v1 & 0x100) != 0)
  {
    char v6 = *(unsigned char *)(v0 + 186);
    uint64_t v8 = *(void *)(v0 + 432);
    uint64_t v7 = *(void *)(v0 + 440);
    *(void *)(v0 + 216) = v8;
    *(void *)(v0 + 224) = v7;
    *(unsigned char *)(v0 + 232) = v6;
    sub_2603984E4();
    swift_willThrowTypedImpl();
    uint64_t v9 = (void *)swift_allocError();
    *(void *)uint64_t v10 = v8;
    *(void *)(v10 + 8) = v7;
    *(unsigned char *)(v10 + 16) = v6;
    sub_260398994(*(void **)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 188), 0);
    swift_release();
    *(void *)(v0 + 344) = v9;
    id v11 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
    char v12 = swift_dynamicCast();
    uint64_t v13 = *(void **)(v0 + 408);
    if (v12)
    {
      unint64_t v21 = *(uint64_t **)(v0 + 352);
      uint64_t v14 = *(void *)(v0 + 312);
      uint64_t v15 = *(void *)(v0 + 320);
      unsigned __int8 v5 = *(unsigned char *)(v0 + 328);
      unint64_t v16 = sub_260395DE0(MEMORY[0x263F8EE78]);
      uint64_t v22 = v14;
      unint64_t v23 = v15;
      char v24 = v5;
      sub_26038CE34(v14, v15, v5);
      sub_26038EFD8(v16, 2, (uint64_t)&v22);
      swift_bridgeObjectRelease();
      sub_26038CE5C(v14, v15, v5);
      os_log_type_t v20 = sub_26039B3E0();
      uint64_t v22 = 0;
      unint64_t v23 = 0xE000000000000000;
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      uint64_t v22 = 0xD000000000000025;
      unint64_t v23 = 0x800000026039DD00;
      *(void *)(v0 + 288) = v14;
      *(void *)(v0 + 296) = v15;
      *(unsigned char *)(v0 + 304) = v5;
      sub_260398490();
      sub_26039B620();
      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      sub_260392574(v20, v22, v23, 0xD000000000000058, 0x800000026039DB60);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *unint64_t v21 = v14;
      v21[1] = v15;
    }
    else
    {
      uint64_t v17 = *(void **)(v0 + 352);

      swift_bridgeObjectRelease();
      *uint64_t v17 = 0xD00000000000001ALL;
      v17[1] = 0x800000026039DBC0;
      unsigned __int8 v5 = 2;
    }
  }
  else
  {
    id v2 = *(void **)(v0 + 408);
    uint64_t v3 = *(void **)(v0 + 352);
    sub_260398994(v2, *(void *)(v0 + 416), *(unsigned char *)(v0 + 188), 0);
    swift_release();
    unint64_t v4 = sub_260395DE0(MEMORY[0x263F8EE78]);
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    unsigned __int8 v5 = -1;
    char v24 = -1;
    sub_26038EFD8(v4, 2, (uint64_t)&v22);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  *(unsigned char *)(*(void *)(v0 + 352) + 16) = v5;
  unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_260397C24()
{
  uint64_t v14 = v0;
  sub_260398994(*(void **)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 188), 0);
  swift_release();
  __int16 v1 = *(void **)(v0 + 448);
  sub_260398994(*(void **)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 188), 0);
  swift_release();
  *(void *)(v0 + 344) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5F0);
  if (swift_dynamicCast())
  {
    uint64_t v10 = *(void **)(v0 + 408);
    uint64_t v3 = *(uint64_t **)(v0 + 352);
    uint64_t v5 = *(void *)(v0 + 312);
    uint64_t v4 = *(void *)(v0 + 320);
    unsigned __int8 v6 = *(unsigned char *)(v0 + 328);
    unint64_t v7 = sub_260395DE0(MEMORY[0x263F8EE78]);
    uint64_t v11 = v5;
    unint64_t v12 = v4;
    unsigned __int8 v13 = v6;
    sub_26038CE34(v5, v4, v6);
    sub_26038EFD8(v7, 2, (uint64_t)&v11);
    swift_bridgeObjectRelease();
    sub_26038CE5C(v5, v4, v6);
    LOBYTE(v7) = sub_26039B3E0();
    uint64_t v11 = 0;
    unint64_t v12 = 0xE000000000000000;
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    uint64_t v11 = 0xD000000000000025;
    unint64_t v12 = 0x800000026039DD00;
    *(void *)(v0 + 288) = v5;
    *(void *)(v0 + 296) = v4;
    *(unsigned char *)(v0 + 304) = v6;
    sub_260398490();
    sub_26039B620();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574((os_log_type_t)v7, v11, v12, 0xD000000000000058, 0x800000026039DB60);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
  }
  else
  {
    uint64_t v3 = *(uint64_t **)(v0 + 352);

    swift_bridgeObjectRelease();
    *uint64_t v3 = 0xD00000000000001ALL;
    uint64_t v4 = 0x800000026039DBC0;
    unsigned __int8 v6 = 2;
  }
  v3[1] = v4;
  *(unsigned char *)(*(void *)(v0 + 352) + 16) = v6;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

void *sub_260397EB8()
{
  type metadata accessor for TKRecordService();
  uint64_t v0 = swift_allocObject();
  unint64_t result = sub_2603980A8();
  qword_26A86C5B0 = v0;
  return result;
}

uint64_t static TKRecordService.shared.getter()
{
  if (qword_26A86C380 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t TKRecordService.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit15TKRecordService_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TKRecordService.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit15TKRecordService_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void *sub_2603980A8()
{
  type metadata accessor for EligibilityManager();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8TrustKit18EligibilityManager_logger;
  if (qword_26A86C360 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_26039B2B0();
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A86D050);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  v5(v2, v4, v3);
  *(void *)(v1 + OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist) = 0;
  v0[2] = v1;
  type metadata accessor for AttestationManager();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_260391E54();
  uint64_t v7 = v6 + OBJC_IVAR____TtC8TrustKit18AttestationManager_logger;
  if (qword_26A86C368 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26A86D068);
  v5(v7, v8, v3);
  if (!DeviceIdentityIsSupported())
  {
    swift_release();
    uint64_t v6 = 0;
  }
  v0[3] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C628);
  uint64_t v9 = (void *)swift_allocObject();
  type metadata accessor for RecordOperation();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v10 + OBJC_IVAR____TtC8TrustKit15RecordOperation_logger;
  if (qword_26A86C370 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_26A86D080);
  v5(v11, v12, v3);
  v9[2] = v10;
  v5((uint64_t)v9 + *(void *)(*v9 + 104), v12, v3);
  v0[4] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C630);
  unsigned __int8 v13 = (void *)swift_allocObject();
  type metadata accessor for KeyOperation();
  uint64_t v14 = swift_allocObject();
  v5(v14 + OBJC_IVAR____TtC8TrustKit12KeyOperation_logger, v12, v3);
  v13[2] = v14;
  v5((uint64_t)v13 + *(void *)(*v13 + 104), v12, v3);
  v0[5] = v13;
  if (qword_26A86C320 != -1) {
    swift_once();
  }
  v0[6] = qword_26A86CFE0;
  uint64_t v15 = OBJC_IVAR____TtC8TrustKit15TKRecordService_logger;
  uint64_t v16 = qword_26A86C350;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v3, (uint64_t)qword_26A86D020);
  v5((uint64_t)v0 + v15, v17, v3);
  return v0;
}

void sub_260398428()
{
  qword_26A86C5B8 = 0x626967696C656E69;
  unk_26A86C5C0 = 0xEA0000000000656CLL;
}

unint64_t sub_260398450()
{
  unint64_t result = qword_26A86C520;
  if (!qword_26A86C520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A86C520);
  }
  return result;
}

unint64_t sub_260398490()
{
  unint64_t result = qword_26A86C5E0;
  if (!qword_26A86C5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C5E0);
  }
  return result;
}

unint64_t sub_2603984E4()
{
  unint64_t result = qword_26A86C5F8;
  if (!qword_26A86C5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C5F8);
  }
  return result;
}

void *sub_260398538(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C588);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unsigned __int8 v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unsigned __int8 v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2603987D4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_260398648(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_260398668(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_260398668(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C588);
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
  unsigned __int8 v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_26039B5A0();
  __break(1u);
  return result;
}

uint64_t sub_2603987D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_26039B5A0();
  __break(1u);
  return result;
}

uint64_t sub_2603988C8(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  if (a4) {
    return sub_26038CE5C(a1, a2, a3);
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2603988D8(uint64_t a1, unint64_t a2)
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

void sub_260398930(uint64_t a1)
{
  sub_2603917B8(a1, v1);
}

uint64_t sub_260398938(void *a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  if (a4)
  {
    return sub_26038CE34((uint64_t)a1, a2, a3);
  }
  else
  {
    id v5 = a1;
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_260398994(void *a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  if (a4)
  {
    return sub_26038CE5C((uint64_t)a1, a2, a3);
  }
  else
  {

    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2603989F0()
{
  return type metadata accessor for TKRecordService();
}

uint64_t type metadata accessor for TKRecordService()
{
  uint64_t result = qword_26A86C618;
  if (!qword_26A86C618) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260398A44()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TKRecordService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TKRecordService);
}

void *sub_260398B0C(void *result)
{
  if (result)
  {
    id v1 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_260398B4C(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_260398B8C()
{
  unint64_t result = qword_26A86C648;
  if (!qword_26A86C648)
  {
    sub_26039B270();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C648);
  }
  return result;
}

unint64_t sub_260398BE4()
{
  unint64_t result = qword_26A86C650;
  if (!qword_26A86C650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A86C590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C650);
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

unint64_t sub_260398C88()
{
  unint64_t result = qword_26A86C658;
  if (!qword_26A86C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C658);
  }
  return result;
}

uint64_t sub_260398CDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C640);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_260398D3C(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  if (a4) {
    return sub_26038CE5C(a1, a2, a3);
  }
  else {
    return sub_26039150C(a1, a2);
  }
}

uint64_t sub_260398D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_260398DB0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_260398DC0()
{
  unint64_t result = qword_26A86C678;
  if (!qword_26A86C678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A86C678);
  }
  return result;
}

uint64_t sub_260398E14()
{
  if (qword_26A86C3B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A86D0B0;
  uint64_t v1 = *(void *)algn_26A86D0B8;
  uint64_t v2 = sub_260399270();
  LOBYTE(v0) = sub_26038F8C4(v0, v1, v2);
  swift_bridgeObjectRelease();
  if (v0)
  {
    if (sub_260398FD8()) {
      return 1;
    }
    os_log_type_t v5 = sub_26039B3F0();
    sub_260392574(v5, 0xD000000000000018, 0x800000026039E300, 0xD000000000000057, 0x800000026039E2A0);
  }
  else
  {
    os_log_type_t v4 = sub_26039B3F0();
    sub_26039B4C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_26039B380();
    swift_bridgeObjectRelease();
    sub_26039B380();
    sub_260392574(v4, 0xD00000000000002ALL, 0x800000026039E270, 0xD000000000000057, 0x800000026039E2A0);
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_260398FD8()
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  SecTaskRef v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    uint64_t v1 = v0;
    error[0] = 0;
    uint64_t v2 = (__CFString *)sub_26039B330();
    CFTypeRef v3 = SecTaskCopyValueForEntitlement(v1, v2, error);

    if (v3 && swift_dynamicCast())
    {
      CFErrorRef v4 = error[0];
      if (!error[0])
      {
        uint64_t v9 = v11;

        return v9;
      }
      os_log_type_t v5 = sub_26039B3E0();
      sub_26039B4C0();
      swift_bridgeObjectRelease();
      uint64_t v12 = v4;
      type metadata accessor for CFError(0);
      sub_26039132C();
      sub_26039B620();

      sub_26039B380();
      swift_bridgeObjectRelease();
      sub_26039B380();
      sub_260392574(v5, 0xD000000000000025, 0x800000026039E380, 0xD000000000000057, 0x800000026039E2A0);

      swift_bridgeObjectRelease();
    }
    else
    {
      os_log_type_t v6 = sub_26039B3E0();
      sub_260392574(v6, 0xD00000000000001CLL, 0x800000026039E360, 0xD000000000000057, 0x800000026039E2A0);
      CFErrorRef v7 = error[0];

      if (v7) {
    }
      }
  }
  else
  {
    os_log_type_t v8 = sub_26039B3E0();
    sub_260392574(v8, 0xD000000000000019, 0x800000026039E320, 0xD000000000000057, 0x800000026039E2A0);
  }
  return 0;
}

uint64_t sub_260399270()
{
  uint64_t v1 = OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist;
  if (*(void *)(v0 + OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist);
  }
  else
  {
    uint64_t v2 = sub_2603992D4();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2603992D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C588);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26039C3E0;
  if (qword_26A86C390 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_26A86C688;
  *(void *)(inited + 32) = qword_26A86C680;
  *(void *)(inited + 40) = v1;
  uint64_t v2 = qword_26A86C398;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_26A86C698;
  *(void *)(inited + 48) = qword_26A86C690;
  *(void *)(inited + 56) = v3;
  uint64_t v4 = qword_26A86C3A0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)algn_26A86C6A8;
  *(void *)(inited + 64) = qword_26A86C6A0;
  *(void *)(inited + 72) = v5;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_26039A180(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v12 = v6;
  if (qword_26A86C3A8 != -1) {
    swift_once();
  }
  if (qword_26A86C6D8)
  {
    id v7 = (id)qword_26A86C6D8;
    os_log_type_t v8 = (void *)sub_26039B330();
    unsigned int v9 = objc_msgSend(v7, sel_BOOLForKey_, v8);

    if (v9)
    {
      sub_2603996F0(&v11, 0xD000000000000014, 0x800000026039E250);
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  return v6;
}

uint64_t sub_2603994E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit18EligibilityManager_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_260399598()
{
  return type metadata accessor for EligibilityManager();
}

uint64_t type metadata accessor for EligibilityManager()
{
  uint64_t result = qword_26A86C6C0;
  if (!qword_26A86C6C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2603995EC()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_260399684()
{
  qword_26A86C680 = 0x4D53656C69626F4DLL;
  *(void *)algn_26A86C688 = 0xE900000000000053;
}

void sub_2603996AC()
{
  qword_26A86C690 = 0x736567617373654DLL;
  *(void *)algn_26A86C698 = 0xE800000000000000;
}

void sub_2603996D0()
{
  qword_26A86C6A0 = 0x6C74636B74;
  *(void *)algn_26A86C6A8 = 0xE500000000000000;
}

uint64_t sub_2603996F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_26039B670();
  swift_bridgeObjectRetain();
  sub_26039B370();
  uint64_t v8 = sub_26039B690();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_26039B5E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_26039B5E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_260399B80(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2603998A0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C6D0);
  uint64_t v3 = sub_26039B4A0();
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_26039B670();
      sub_26039B370();
      uint64_t result = sub_26039B690();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_260399B80(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2603998A0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_260399D1C();
      goto LABEL_22;
    }
    sub_260399ED0();
  }
  uint64_t v11 = *v4;
  sub_26039B670();
  sub_26039B370();
  uint64_t result = sub_26039B690();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_26039B5E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_26039B600();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_26039B5E0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_260399D1C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C6D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26039B490();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_260399ED0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C6D0);
  uint64_t v3 = sub_26039B4A0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v4;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_26039B670();
    swift_bridgeObjectRetain();
    sub_26039B370();
    uint64_t result = sub_26039B690();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_26039A180(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C6D0);
    uint64_t v3 = sub_26039B4B0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_26039B670();
      swift_bridgeObjectRetain();
      sub_26039B370();
      uint64_t result = sub_26039B690();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_26039B5E0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          BOOL v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_26039B5E0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_26039A324()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_26039B330();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_26A86C6D8 = (uint64_t)v2;
}

void sub_26039A394()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_processName);

  uint64_t v2 = sub_26039B340();
  uint64_t v4 = v3;

  qword_26A86D0B0 = v2;
  *(void *)algn_26A86D0B8 = v4;
}

uint64_t TKRecord.description.getter()
{
  uint64_t v1 = v0;
  sub_26039B4C0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_26039B380();
  swift_bridgeObjectRelease();
  sub_26039B380();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v1 + 40);
  sub_2603988D8(v3, v2);
  sub_26039B240();
  sub_26039150C(v3, v2);
  sub_26039B380();
  swift_bridgeObjectRelease();
  return 0x444964726F636572;
}

uint64_t TKRecord.__allocating_init(with:recordHash:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  TKRecord.init(with:recordHash:)(a1, a2, a3, a4);
  return v8;
}

void *TKRecord.init(with:recordHash:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  unint64_t v39 = a4;
  type metadata accessor for EligibilityManager();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v8 + OBJC_IVAR____TtC8TrustKit18EligibilityManager_logger;
  if (qword_26A86C360 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_26039B2B0();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26A86D050);
  uint64_t v34 = *(void *)(v10 - 8);
  unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  v12(v9, v11, v10);
  *(void *)(v8 + OBJC_IVAR____TtC8TrustKit18EligibilityManager____lazy_storage___allowlist) = 0;
  v5[6] = v8;
  if (qword_26A86C320 != -1) {
    swift_once();
  }
  v5[7] = qword_26A86CFE0;
  uint64_t v13 = (char *)v5 + OBJC_IVAR____TtC8TrustKit8TKRecord_logger;
  uint64_t v14 = qword_26A86C348;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v10, (uint64_t)qword_26A86D008);
  v12((uint64_t)v13, v15, v10);
  swift_retain();
  char v16 = sub_260398E14();
  swift_release();
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v21 = sub_26039B3E0();
    unint64_t v22 = 0xD000000000000029;
    unint64_t v23 = 0x800000026039E3D0;
    sub_260392574(v21, 0xD000000000000029, 0x800000026039E3D0, 0xD000000000000051, 0x800000026039E400);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26039C2A0;
    if (qword_26A86C3B8 != -1) {
      swift_once();
    }
    uint64_t v25 = &qword_26A86C6E0;
    goto LABEL_20;
  }
  uint64_t v17 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v17 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v26 = sub_26039B3E0();
    unint64_t v22 = 0xD000000000000013;
    unint64_t v23 = 0x800000026039E4C0;
    sub_260392574(v26, 0xD000000000000013, 0x800000026039E4C0, 0xD000000000000051, 0x800000026039E400);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26039C2A0;
    if (qword_26A86C3C0 != -1) {
      swift_once();
    }
    uint64_t v25 = &qword_26A86C6F0;
LABEL_20:
    uint64_t v27 = v25[1];
    *(void *)(inited + 32) = *v25;
    *(void *)(inited + 40) = v27;
    sub_260398450();
    swift_bridgeObjectRetain();
    *(void *)(inited + 48) = sub_26039B400();
    uint64_t v28 = inited;
    goto LABEL_25;
  }
  switch(v39 >> 62)
  {
    case 1uLL:
      if ((int)a3 != a3 >> 32) {
        goto LABEL_13;
      }
      goto LABEL_24;
    case 2uLL:
      if (*(void *)(a3 + 16) == *(void *)(a3 + 24)) {
        goto LABEL_24;
      }
      goto LABEL_13;
    case 3uLL:
      goto LABEL_24;
    default:
      if ((v39 & 0xFF000000000000) != 0)
      {
LABEL_13:
        v5[2] = a1;
        v5[3] = a2;
        unint64_t v18 = v39;
        v5[4] = a3;
        v5[5] = v18;
        swift_bridgeObjectRetain();
        sub_2603988D8(a3, v18);
        unint64_t v19 = sub_260395DE0(MEMORY[0x263F8EE78]);
        unint64_t v36 = 0;
        unint64_t v37 = 0;
        char v38 = -1;
        sub_26038EFD8(v19, 0, (uint64_t)&v36);
        swift_bridgeObjectRelease();
        os_log_type_t v20 = sub_26039B3D0();
        unint64_t v36 = 0;
        unint64_t v37 = 0xE000000000000000;
        sub_26039B4C0();
        swift_bridgeObjectRelease();
        unint64_t v36 = 0xD00000000000001BLL;
        unint64_t v37 = 0x800000026039E460;
        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();
        sub_26039B240();
        sub_26039B380();
        swift_bridgeObjectRelease();
        sub_26039B380();
        sub_260392574(v20, v36, v37, 0xD000000000000051, 0x800000026039E400);
        sub_26039150C(a3, v18);
        swift_bridgeObjectRelease();
        return v5;
      }
LABEL_24:
      swift_bridgeObjectRelease();
      os_log_type_t v29 = sub_26039B3E0();
      unint64_t v22 = 0xD000000000000015;
      unint64_t v23 = 0x800000026039E480;
      sub_260392574(v29, 0xD000000000000015, 0x800000026039E480, 0xD000000000000051, 0x800000026039E400);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A86C5D8);
      uint64_t v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_26039C2A0;
      *(void *)(v30 + 32) = 0xD000000000000011;
      *(void *)(v30 + 40) = 0x800000026039E4A0;
      sub_260398450();
      *(void *)(v30 + 48) = sub_26039B400();
      uint64_t v28 = v30;
      break;
  }
LABEL_25:
  unint64_t v31 = sub_260395DE0(v28);
  unint64_t v36 = v22;
  unint64_t v37 = v23;
  char v38 = 0;
  sub_26038EFD8(v31, 0, (uint64_t)&v36);
  swift_bridgeObjectRelease();
  sub_260398490();
  swift_allocError();
  *(void *)uint64_t v32 = v22;
  *(void *)(v32 + 8) = v23;
  *(unsigned char *)(v32 + 16) = 0;
  swift_willThrow();
  sub_26039150C(a3, v39);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v10);
  swift_deallocPartialClassInstance();
  return v5;
}

uint64_t TKRecord.recordID.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TKRecord.recordHash.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2603988D8(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t TKRecord.deinit()
{
  swift_bridgeObjectRelease();
  sub_26039150C(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit8TKRecord_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TKRecord.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_26039150C(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TrustKit8TKRecord_logger;
  uint64_t v2 = sub_26039B2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_26039AE9C()
{
  return TKRecord.description.getter();
}

void sub_26039AEC0()
{
  qword_26A86C6E0 = 0x626967696C656E69;
  *(void *)algn_26A86C6E8 = 0xEA0000000000656CLL;
}

void sub_26039AEE8()
{
  qword_26A86C6F0 = 0x644964726F636572;
  *(void *)algn_26A86C6F8 = 0xEF64696C61766E49;
}

uint64_t sub_26039AF18()
{
  return type metadata accessor for TKRecord();
}

uint64_t type metadata accessor for TKRecord()
{
  uint64_t result = qword_26A86C708;
  if (!qword_26A86C708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26039AF6C()
{
  uint64_t result = sub_26039B2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TKRecord(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TKRecord);
}

uint64_t dispatch thunk of TKRecord.__allocating_init(with:recordHash:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t TKError.errorDescription.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_26038CE34(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  return v1;
}

uint64_t sub_26039B0A4()
{
  uint64_t v1 = *(void *)v0;
  sub_26038CE34(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  return v1;
}

ValueMetadata *type metadata accessor for TKError()
{
  return &type metadata for TKError;
}

uint64_t sub_26039B100()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_26039B110()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_26039B120()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_26039B130()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_26039B140()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_26039B150()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_26039B160()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_26039B170()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_26039B180()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_26039B190()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_26039B1A0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_26039B1B0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_26039B1C0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_26039B1D0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_26039B1E0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_26039B1F0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_26039B200()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_26039B210()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_26039B220()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_26039B230()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_26039B240()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_26039B250()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_26039B260()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_26039B270()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_26039B280()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_26039B290()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_26039B2A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_26039B2B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_26039B2C0()
{
  return MEMORY[0x270EEAE88]();
}

uint64_t sub_26039B2D0()
{
  return MEMORY[0x270EEAE90]();
}

uint64_t sub_26039B2E0()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t sub_26039B2F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_26039B300()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_26039B310()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_26039B320()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_26039B330()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26039B340()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26039B350()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_26039B360()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_26039B370()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26039B380()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26039B390()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_26039B3A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_26039B3B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_26039B3D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_26039B3E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_26039B3F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_26039B400()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_26039B410()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_26039B420()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_26039B430()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_26039B440()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_26039B450()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_26039B460()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_26039B470()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_26039B480()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_26039B490()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26039B4A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26039B4B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_26039B4C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_26039B4D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_26039B4E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_26039B4F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26039B500()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_26039B510()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_26039B520()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_26039B530()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_26039B540()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_26039B550()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_26039B560()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_26039B570()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26039B580()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26039B590()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26039B5A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_26039B5B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_26039B5C0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_26039B5D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_26039B5E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26039B600()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26039B610()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26039B620()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_26039B630()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_26039B640()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_26039B650()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_26039B660()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_26039B670()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26039B680()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_26039B690()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_26039B6A0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_26039B6B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x270F25E60]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x270EFD998](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x270EFDAA8](key, operation, algorithm);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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